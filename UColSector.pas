unit UColSector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, RzLabel, RzCmboBx, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzButton, ComCtrls, RzEdit, RzBckgnd, RzPanel,
  RzRadGrp;

type
  TfrmColSector = class(TForm)
    Panel56: TPanel;
    Label94: TLabel;
    sqlNoUbicadas: TMyQuery;
    DSNoUbicadas: TDataSource;
    sqlUbicadas: TMyQuery;
    dsubicadas: TDataSource;
    sqlgeneral: TMyQuery;
    lblubicadas: TRzLabel;
    lblNoUbicadas: TRzLabel;
    cbosectores: TRzComboBox;
    DBGVista1: TcxGridDBTableView;
    DBGLevel1: TcxGridLevel;
    DBGUbicadas: TcxGrid;
    cxColonia: TcxGridDBColumn;
    DBGNoUbicadas: TcxGrid;
    DBGNoUbiadasVista1: TcxGridDBTableView;
    cxColsNoUbicadas: TcxGridDBColumn;
    NoUbicadasLevel1: TcxGridLevel;
    btnsalir: TRzBitBtn;
    RzSeparator1: TRzSeparator;
    RzLabel1: TRzLabel;
    RzRichEdit1: TRzRichEdit;
    btnimprimir: TRzBitBtn;
    rgclientes: TRzRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure cbosectoresClick(Sender: TObject);
    procedure sqlNoUbicadasAfterOpen(DataSet: TDataSet);
    procedure sqlUbicadasAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGVista1DblClick(Sender: TObject);
    procedure DBGNoUbiadasVista1DblClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmColSector: TfrmColSector;

implementation

uses Udm, Urecursos, Uprincipal, Udmrep;

{$R *.dfm}

procedure TfrmColSector.FormShow(Sender: TObject);
begin
cbosectores.Clear;
//trae los sectores y los carga en la lista
querys('select nombre from sectores order by nombre',0,dmaccesos.sqlgeneral);
while not dmaccesos.sqlgeneral.Eof do
begin
cbosectores.Items.Add(dmaccesos.sqlgeneral.fieldbyname('nombre').AsString);
dmaccesos.sqlgeneral.Next;
end;
cbosectores.ItemIndex:=0;
cbosectores.OnClick(self);
lblubicadas.Caption:='';
lblnoubicadas.Caption:='';
sqlNoUbicadas.Open;
sqlubicadas.AfterOpen(dsubicadas.DataSet);
end;

procedure TfrmColSector.cbosectoresClick(Sender: TObject);
begin
//trae el numero de sector
querys('select idsector from sectores where nombre='+quotedstr(cbosectores.text),0,sqlgeneral);
//trae todas las colonias del sector seleccionado
querys('select colonias.nombre,colonias.idcol from colonias left join col_sector on colonias.idcol=col_sector.idcol where col_sector.idsector='+sqlgeneral.fieldbyname('idsector').asstring+' and colonias.ubicada=1 order by colonias.nombre',0,sqlubicadas);
end;

procedure TfrmColSector.sqlNoUbicadasAfterOpen(DataSet: TDataSet);
begin
lblNoUbicadas.Caption:='Colonias no Ubicadas: '+inttostr(dataset.RecordCount);
end;

procedure TfrmColSector.sqlUbicadasAfterOpen(DataSet: TDataSet);
begin
lblUbicadas.Caption:='Colonias en este sector: '+inttostr(dataset.RecordCount);
end;

procedure TfrmColSector.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmColSector.DBGVista1DblClick(Sender: TObject);
var
idcol:string;
begin
//ELIMINA el registro de relacion con la tabla col_sector

if application.MessageBox(pchar('Estas seguro de Eliminar el Sector de la colonia '+sqlUbicadas.fieldbyname('nombre').AsString), 'Aviso', MB_YESNO) = idyes then
  begin

  idcol := sqlUbicadas.fieldbyname('idcol').AsString;
  querys('delete from col_sector where idcol='+sqlUbicadas.fieldbyname('idcol').AsString,1,sqlgeneral);
  //actualiza el campo ubicada a 0 de la colonia sea la actual
  querys('update colonias set ubicada=0 where idcol='+sqlUbicadas.fieldbyname('idcol').AsString,1,sqlgeneral);
  //Actualiza al secor de los clientes de esa colonia a 0
  //querys('select idcliente From clientes as c where c.idcol ='+sqlNoUbicadas.fieldbyname('idcol').AsString, 0, sqlgeneral);

    bpcambios('clientes', idcol, 'idcol');
    querys('Update clientes set sector=0 where idcol='+idcol, 1, dmreportes.sqlgeneral5);
    apcambios('idcol', idcol, 'clientes', 'frmColSector');

  frmprincipal.ucprincipal.Log('Elimino en colsector la idcol :'+sqlUbicadas.fieldbyname('idcol').AsString,3);
  //refresca las rejillas
  cbosectores.OnClick(self);
  sqlNoubicadas.Refresh;
  end;
end;

procedure TfrmColSector.DBGNoUbiadasVista1DblClick(Sender: TObject);
var
sector:string;
begin
if (cbosectores.ItemIndex > -1)and(sqlNoUbicadas.RecordCount>0) then
  begin
  //trae el numero del sector en base al seleccionado en el combobox
  querys('select idsector from sectores where nombre='+quotedstr(cbosectores.Text),0,sqlgeneral);
  sector:=sqlgeneral.fieldbyname('idsector').AsString;
  if application.MessageBox(pchar('Estas seguro de Asignar el Sector '+sector+' a la colonia '+sqlNoUbicadas.fieldbyname('nombre').AsString), 'Aviso', MB_YESNO) = idyes then
    begin
    //crea la relacion del sector con la colonia en la tabla col_sector
    querys('insert into col_sector (idsector,idcol,usuario,fecha,hora) values ('+sector+','+sqlNoUbicadas.fieldbyname('idcol').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlgeneral);
    //actualiza el campo ubicada=1 de colonias de la colonia que se acaba de ubicar
    querys('update colonias set ubicada=1 where idcol='+sqlNoUbicadas.fieldbyname('idcol').AsString,1,sqlgeneral);

    //querys('select idcliente From clientes as c where c.idcol ='+sqlNoUbicadas.fieldbyname('idcol').AsString, 0, sqlgeneral);
    //Actualiza el sector a los clientes con esa colonia
      bpcambios('clientes', sqlNoUbicadas.fieldbyname('idcol').AsString, 'idcol');
      querys('Update clientes set sector='+quotedstr(sector)+' where idcol='+quotedstr(sqlNoUbicadas.fieldbyname('idcol').AsString), 1, dmreportes.sqlgeneral5);
      apcambios('idcol', sqlNoUbicadas.fieldbyname('idcol').AsString, 'clientes', 'frmColSector');

    //refresca las rejillas
    frmprincipal.ucprincipal.Log('Dio de Alta en colsector el idcol : '+sqlNoUbicadas.fieldbyname('idcol').AsString,1);
    cbosectores.OnClick(self);
    sqlNoubicadas.Refresh;
    // no actualiza a clientes el sector
    end;
  end;
end;

procedure TfrmColSector.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmColSector.btnimprimirClick(Sender: TObject);
begin
{querys('SELECT sectores.nombre as sector,colonias.nombre AS colonia,clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial = '''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),'+
       ' clientes.rsocial) as Cliente FROM clientes INNER JOIN colonias ON (clientes.idcol = colonias.idcol) INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) where clientes.estatus='+inttostr(rgclientes.ItemIndex)+' ORDER BY sectores.nombre,'+
       'colonia,clientes.idcliente',0,dmreportes.sqlgeneral);}
querys('SELECT cs.idsector, cs.idcol, c.nombre AS colonia, c.cp FROM colonias c '+
       'LEFT JOIN col_sector cs ON c.idcol = cs.idcol '+
       'INNER JOIN sectores s ON cs.idsector = s.idsector '+
       'where cs.idsector='+cbosectores.text+' order by colonia asc',0,dmreportes.sqlgeneral);
OperacionReporte('ColoniasPorSector','','IMP', 1);        
end;

end.
