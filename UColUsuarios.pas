{///////////////////////////////////////////////////////////////////////////////
2009/02/23 dalyla cuentas por colonia en reporte
2009/02/10 dalyla imprimir colo X user,
                  ke solo se vean las que no tiene usuario en la segunda columna
--------------------------------------------------------------------------------
2008/02/05 dalyla en disponibles sean las que no tienen usuario asignado <_<
--------------------------------------------------------------------------------
//Hecho por: Javier Hernandez
//Ultima Modificacion por : Javier Hernandez
//Ultima Modificacion : 2007/01/09
}///////////////////////////////////////////////////////////////////////////////
unit UColUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, RzPanel, StdCtrls, RzLabel, RzCmboBx,
  MemDS, DBAccess, MyAccess, RzButton, Mask, RzEdit;

type
  TfrmColUsuarios = class(TForm)
    sqlDisponibles: TMyQuery;
    DsDisponibles: TDataSource;
    sqlUbicadas: TMyQuery;
    dsubicadas: TDataSource;
    sqlgeneral: TMyQuery;
    cboArea: TRzComboBox;
    RzLabel13: TRzLabel;
    CboUsuario: TRzComboBox;
    RzLabel5: TRzLabel;
    DBGUbicadas: TcxGrid;
    DBGVista1: TcxGridDBTableView;
    cxColonia: TcxGridDBColumn;
    DBGLevel1: TcxGridLevel;
    DBGNoUbicadas: TcxGrid;
    DBGNoUbiadasVista1: TcxGridDBTableView;
    cxColsNoUbicadas: TcxGridDBColumn;
    NoUbicadasLevel1: TcxGridLevel;
    btnsalir: TRzBitBtn;
    cbocolonia: TRzComboBox;
    RzLabel1: TRzLabel;
    btnagregar: TRzBitBtn;
    edcodigo: TRzEdit;
    RzPanel1: TRzPanel;
    btnimprimir: TRzBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cboAreaSelect(Sender: TObject);
    procedure CboUsuarioChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGNoUbiadasVista1DblClick(Sender: TObject);
    procedure DBGVista1DblClick(Sender: TObject);
    procedure cboAreaClick(Sender: TObject);
    procedure sqlDisponiblesAfterOpen(DataSet: TDataSet);
    procedure btnsalirClick(Sender: TObject);
    procedure cbocoloniaChange(Sender: TObject);
    procedure cbocoloniaNotInList(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure cbocoloniaSelect(Sender: TObject);
    procedure cbocoloniaKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CargaColonias;
  end;

var
  frmColUsuarios: TfrmColUsuarios;

implementation

uses Urecursos, Udm, Uprincipal, Udmrep;

{$R *.dfm}

procedure tfrmColUsuarios.CargaColonias;
//var sqltemp : tmyquery;
begin                 {
sqltemp := tmyquery.Create(self);
sqltemp.Connection := dmaccesos.conexion;
//elimina la tabla temporal si existe
querys('DROP TABLE IF EXISTS ColoniasTemp'+frmprincipal.idmaq,1,sqlgeneral);
//crea la tabla temporal
querys('create table ColoniasTemp'+frmprincipal.idmaq+' select idcol,nombre from colonias',1,sqlgeneral);
//me traigo las colonias que tiene asignadas el usuario
querys('select idcol from ColUsuarios where idusuario='+inttostr(cbousuario.Tag),0,sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof do
 begin
  querys('delete from ColoniasTemp'+frmprincipal.idmaq+' where idcol='+sqlgeneral.fieldbyname('idcol').AsString,1,sqltemp);
  sqlgeneral.Next;
 end;  }
//colonias ubicadas
querys('select colonias.idcol,nombre from ColUsuarios inner join colonias on colonias.idcol=ColUsuarios.idcol '+
       'where idusuario = '+inttostr(CboUsuario.tag)+' order by nombre',0,sqlUbicadas);
//todas las colonias
//querys('select idcol,nombre from ColoniasTemp'+frmprincipal.idmaq+' order by nombre',0,sqlDisponibles);
querys('select c.nombre, c.idcol from colonias c  where c.idcol not in( Select  cu.idcol from ColUsuarios cu '+
       'left join usuarios u on u.idusuario=cu.idusuario where u.estatus = 1 ) ',0,sqlDisponibles);
end;

procedure TfrmColUsuarios.FormShow(Sender: TObject);
begin
//carga combo de areas que recive
CargaCombo('select nombre from areas where estatus = 1 order by nombre','Areas',cboArea);
cboarea.Text := frmprincipal.AreaUsuario;
cboarea.OnSelect(self);
end;

procedure TfrmColUsuarios.cboAreaSelect(Sender: TObject);
begin
CboUsuario.Clear;
querys('select idarea from areas where nombre ='+quotedstr(cboarea.Text),0,sqlgeneral);
cboArea.Tag := sqlgeneral.fieldbyname('idarea').AsInteger;
//carga los usuarios del area seleccionada                                                                                                                                                                                                                             puestos.nombre = '+quotedstr('VENDEDOR')+' AND
CargaCombo('SELECT u.idusuario, '+UsuarioNombre('u')+' AS Nombre FROM usuarios u INNER JOIN puestos p ON (u.idpuesto = '+
           'p.idpuesto) inner join areas a on a.idarea=u.idarea WHERE u.estatus = 1 and a.idarea='+
           sqlgeneral.fieldbyname('idarea').AsString+' order by u.nombre','usuarios en esta area',cbousuario);
if cbousuario.Items.Count = 0 then
 cbousuario.Text := '';
end;

procedure TfrmColUsuarios.CboUsuarioChange(Sender: TObject);
begin
querys('SELECT usuarios.idusuario,codigo FROM usuarios WHERE (usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,''''),'' '','+
       'ifnull(usuarios.amaterno,'' '')) ='+quotedstr(cboUsuario.Text)+')',0,SqlGeneral);
CboUsuario.Tag := sqlgeneral.fieldbyname('idusuario').AsInteger;
edcodigo.Text := sqlgeneral.fieldbyname('codigo').Asstring;
CargaColonias;
end;

procedure TfrmColUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//elimina la tabla temporal si existe
querys('DROP TABLE IF EXISTS ColoniasTemp'+frmprincipal.idmaq,1,sqlgeneral);
action := cafree;
end;

procedure TfrmColUsuarios.DBGNoUbiadasVista1DblClick(Sender: TObject);
begin
//inserta en ColUsuario
querys('insert into ColUsuarios (idcol,idusuario) values ('+sqldisponibles.fieldbyname('idcol').AsString+','+inttostr(cbousuario.Tag)+')',1,sqlgeneral);
CargaColonias;
cbocolonia.Text := '';
end;

procedure TfrmColUsuarios.DBGVista1DblClick(Sender: TObject);
begin
//elimina de ColUsuarios
querys('delete from ColUsuarios where idusuario='+inttostr(cbousuario.Tag)+' and idcol='+sqlubicadas.fieldbyname('idcol').AsString,1,sqlgeneral);
CargaColonias;
end;

procedure TfrmColUsuarios.cboAreaClick(Sender: TObject);
begin
sqlubicadas.Close;
sqlDisponibles.Close;
end;

procedure TfrmColUsuarios.sqlDisponiblesAfterOpen(DataSet: TDataSet);
begin

cbocolonia.Clear;
sqldisponibles.First;
while not sqldisponibles.Eof do
 begin
  cbocolonia.Items.Add(sqldisponibles.fieldbyname('nombre').AsString);
  sqldisponibles.Next;
 end;
 sqldisponibles.First;
 cbocolonia.ClearSearchString;
cbocolonia.SetFocus;
end;

procedure TfrmColUsuarios.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmColUsuarios.cbocoloniaChange(Sender: TObject);
begin
if cbocolonia.Text <> '' then
 begin
  sqldisponibles.Locate('nombre',cbocolonia.Text,[]);
  btnagregar.Enabled := true;
 end
else
 btnagregar.Enabled := false;
end;

procedure TfrmColUsuarios.cbocoloniaNotInList(Sender: TObject);
begin
btnagregar.Enabled := false;
end;

procedure TfrmColUsuarios.btnagregarClick(Sender: TObject);
begin
DBGNoUbiadasVista1.OnDblClick(self);
end;

procedure TfrmColUsuarios.cbocoloniaSelect(Sender: TObject);
begin
sqldisponibles.Locate('nombre',cbocolonia.Text,[]);
btnagregar.Enabled := true;
end;

procedure TfrmColUsuarios.cbocoloniaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (cbocolonia.Text <> '') then
 begin
  key := #0;
  btnagregar.Click;
 end;
end;

procedure TfrmColUsuarios.btnimprimirClick(Sender: TObject);
begin
{querys('select distinct col.idcol, col.nombre as colonia, cs.idsector, '+UsuarioNombre('u')+' as usuario '+
       'from ColUsuarios cu  inner join colonias col on col.idcol=cu.idcol '+
       'left join usuarios u on u.idusuario=cu.idusuario left join col_sector cs on cs.idcol=col.idcol '+
       'where cu.idusuario = '+inttostr(cbousuario.tag)+' order by col.nombre', 0, dmreportes.sqlgeneral);}

querys('select distinct col.idcol, col.nombre as colonia, cs.idsector, ifnull(c.cuentas,0) as cuentas, '+
       UsuarioNombre('u')+' as usuario from ColUsuarios cu  inner join colonias col on col.idcol=cu.idcol '+
       'left join usuarios u on u.idusuario=cu.idusuario left join col_sector cs on cs.idcol=col.idcol '+
       'left join ( select count(idcliente) as cuentas, idcol from clientes where estatus = 1 group by idcol '+
       ') as c on c.idcol=col.idcol where cu.idusuario = '+inttostr(cbousuario.tag)+' group by col.idcol '+
       'order by col.nombre', 0, dmreportes.sqlgeneral);

OperacionReporte('ColoniasUsuario', 'Colonias del usuario '+cbousuario.Text, 'IMP', 1);
end;

End.
