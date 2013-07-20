{///////////////////////////////////////////////////////////////////////////////
2008/06/12 dalyla deshabilitar el agregar
2008/03/31 dalyla motivos de cortesia
2008/02/28 dalyla zona horaria ok
}///////////////////////////////////////////////////////////////////////////////
unit Ubonificaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, Mask, RzEdit, RzSpnEdt,
  RzLabel, RzCmboBx, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzBtnEdt, MemDS, DBAccess, MyAccess, RzButton,dateutils;

type
  Tfrmbonificaciones = class(TForm)
    VBonificacion: TcxGridDBTableView;
    LBonificacion: TcxGridLevel;
    GBonificacion: TcxGrid;
    cbomes: TRzComboBox;
    lblmeses: TRzLabel;
    edano: TRzSpinEdit;
    RzLabel1: TRzLabel;
    lblclave: TRzLabel;
    edclave: TRzButtonEdit;
    ednomcte: TRzEdit;
    RzLabel6: TRzLabel;
    SqlGeneral: TMyQuery;
    btnagregar: TRzBitBtn;
    btneliminar: TRzBitBtn;
    sqlbonificaciones: TMyQuery;
    dsbonificaciones: TDataSource;
    cxano: TcxGridDBColumn;
    cxmes: TcxGridDBColumn;
    cxusuario: TcxGridDBColumn;
    cxfecha: TcxGridDBColumn;
    cxhora: TcxGridDBColumn;
    btnsalir: TRzBitBtn;
    lblregistros: TRzLabel;
    RzLabel2: TRzLabel;
    cbmotivo: TRzComboBox;
    cxmotivo: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure cbomesChange(Sender: TObject);
    procedure sqlbonificacionesAfterOpen(DataSet: TDataSet);
    procedure btnsalirClick(Sender: TObject);
    procedure sqlbonificacionesBeforeOpen(DataSet: TDataSet);
    procedure sqlbonificacionesAfterRefresh(DataSet: TDataSet);
  private
    { Private declarations }
    //cuenta : string;
  public
    { Public declarations }
    constructor inicializa(cta:string);
  end;

var
  frmbonificaciones: Tfrmbonificaciones;

implementation

uses Urecursos, Ubusquedas, Udm, Uprincipal;

{$R *.dfm}

constructor tfrmbonificaciones.inicializa(cta:string);
begin
 edclave.text := cta;
 querys('select idcliente, '+ClienteNombre('clientes')+' as nombre from clientes where idcliente='+cta,0,sqlgeneral);
 ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
 //edclave.Text := sqlgeneral.fieldbyname('idcliente').AsString;
 edclave.Button.Visible := false;
 edclave.ReadOnly := true;
 sqlbonificaciones.Open;
 edano.Text := inttostr(yearof(FechaServidor));
 cargacombo2('Select idmotivo, nombre from MotCortesia order by nombre', 'nombre', 'idmotivo', cbmotivo);

end;

procedure Tfrmbonificaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure Tfrmbonificaciones.edclaveButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='Select clientes.idcliente, '+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial AS Razon_Social,telefonos.telefono,telefonos.tipo_tel '+
         ' as Tipo,case 1 when clientes.estatus=0  then ''Inactivo'' when estatus=1 then ''Activo'' when clientes.estatus=2 then ''Por Revisar'' when clientes.estatus=3 then ''Cortesia'' when clientes.estatus=4 then ''Moroso'' when '+
         ' clientes.estatus=5 then  ''Cancelado'' when clientes.estatus = 6 then ''Libre'' end as Estatus,clientes.bloqueado as Bloqueado,clientes.TipoCont,concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','','+
         ' clientes.estado) as Direccion,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact left join telefonos on clientes.idtel='+
         ' telefonos.idtel group by idcliente  order by idcliente,telefonos.telefono';
  campo_retorno:='idcliente';
  campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
  tblorigen := 'clientes';
  tabla:='clientes';
  cbofiltro.ItemIndex:=1;
  cbofiltro.OnClick(self);
  ShowModal;
  if resultado <> '' then
    begin
    edclave.Text := resultado;
    querys('select idcliente,'+ClienteNombre('clientes')+' as nombre from clientes where idcliente='+resultado,0,sqlgeneral);
    ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
    end;
  end;
end;

procedure Tfrmbonificaciones.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
   begin
    key:=#0;
    if edclave.Text <> '' then
     begin
      querys('select idcliente,'+ClienteNombre('clientes')+' as nombre from clientes where idcliente='+edclave.Text,0,sqlgeneral);
      ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
    else
     edclave.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure Tfrmbonificaciones.FormShow(Sender: TObject);
begin
{if edclave.text <> '' then
 begin
 edano.Text := inttostr(yearof(FechaServidor));
 sqlbonificaciones.open;
  //querys('select  b.ano, b.mes, b.usuario, b.fecha, b.hora, m.nombre as motivo from bonificaciones as b left join MotCortesia as m '+         'on m.idmotcortesia=b.idmotcortesia where idcliente = '+cuenta+' order by fecha,hora',0,sqlbonificaciones);
 cargacombo2('Select idmotcortesia, nombre from MotCortesia order by nombre', 'nombre', 'valor', cbmotivo);
 end;}
end;

procedure Tfrmbonificaciones.btnagregarClick(Sender: TObject);
begin
//verifica si y aexiste una bonificacion de ese mes y año
querys('select * from bonificaciones where idcliente='+edclave.text+' and mes='+quotedstr(cbomes.Text)+' and ano='+edano.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 application.MessageBox('Ya existe esa bonificacion','Aviso',mb_iconinformation)
else
 begin
  querys('Select idmotivo from MotCortesia where nombre = "'+cbmotivo.Text+'"', 0, sqlgeneral);
  querys('insert into bonificaciones(idcliente,mes,ano,usuario,fecha,hora,NumMes, idmotivo) values ('+edclave.text+','+quotedstr(cbomes.Text)+','+edano.Text+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+inttostr(cbomes.ItemIndex+1)+', '+sqlgeneral.fieldbyname('idmotivo').AsString+')',1,sqlgeneral);
  sqlbonificaciones.Refresh;
  //querys('select * from bonificaciones where idcliente = '+cuenta+' order by fecha,hora',0,sqlbonificaciones);
 end;
end;

procedure Tfrmbonificaciones.btneliminarClick(Sender: TObject);
begin
querys('delete from bonificaciones where idcliente='+edclave.text+' and mes='+quotedstr(sqlbonificaciones.fieldbyname('mes').AsString)+' and ano='+sqlbonificaciones.fieldbyname('ano').AsString,1,sqlgeneral);
//querys('select * from bonificaciones where idcliente = '+cuenta+' order by fecha,hora',0,sqlbonificaciones);
sqlbonificaciones.Refresh;
end;

procedure Tfrmbonificaciones.cbomesChange(Sender: TObject);
begin
if cbomes.Text <> '' then
 btnagregar.Enabled := false//true
else
 btnagregar.Enabled := false;

end;

procedure Tfrmbonificaciones.sqlbonificacionesAfterOpen(DataSet: TDataSet);
begin
if dataset.RecordCount > 0 then
 btneliminar.Enabled := true
else
 btneliminar.Enabled := false;
lblregistros.Caption := 'Registros Encontrados '+inttostr(dataset.RecordCount);
end;

procedure Tfrmbonificaciones.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmbonificaciones.sqlbonificacionesBeforeOpen(
  DataSet: TDataSet);
begin
sqlbonificaciones.ParamByName('cuenta').AsString := edclave.Text;
end;

procedure Tfrmbonificaciones.sqlbonificacionesAfterRefresh(
  DataSet: TDataSet);
begin
lblregistros.Caption := 'Registros Encontrados '+inttostr(dataset.RecordCount);
end;

end.
