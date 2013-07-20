unit Urepdetalle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess, MyAccess, StdCtrls,
  RzEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzButton, RpDefine, RpCon, RpConDS, DBCtrls, RzDBEdit;

type
  Tfrmrepdetalle = class(TForm)
    btnmail: TRzBitBtn;
    btnimprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    GRDetalleDBTableView1: TcxGridDBTableView;
    GRDetalleLevel1: TcxGridLevel;
    GRDetalle: TcxGrid;
    colfecha: TcxGridDBColumn;
    colhora: TcxGridDBColumn;
    coluser: TcxGridDBColumn;
    colaction: TcxGridDBColumn;
    Edmemo: TRzDBMemo;
    Qdetalle: TMyQuery;
    DSDetalle: TDataSource;
    Qskalarmas: TMyQuery;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnmailClick(Sender: TObject);
  private
    procedure CrearReporte;
    { Private declarations }
  public
    idalarma, idcliente, usuario:string;
    constructor alarma(var idalarm, idcli, user:string);
    { Public declarations }
  end;

var
  frmrepdetalle: Tfrmrepdetalle;

implementation

uses utraficocliente, Uprincipal, Urecursos, Udm, Udmrep, UEnviarCorreo;

{$R *.dfm}

procedure Tfrmrepdetalle.btncerrarClick(Sender: TObject);
begin
if FileExists(uprincipal.my_path+'RepEventosCliente'+frmprincipal.idmaq+'.pdf') then
  DeleteFile(uprincipal.my_path+'RepEventosCliente'+frmprincipal.idmaq+'.pdf');
release;
end;

procedure Tfrmrepdetalle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmrepdetalle.btnimprimirClick(Sender: TObject);
begin
CrearReporte;
OperacionReporte('RepEventosCliente','','IMP',0);
end;

constructor Tfrmrepdetalle.alarma(var idalarm, idcli, user:string);
begin
idalarma:= idalarm;
idcliente:=idcli;
usuario:=user;
querys('Select * From alarmas_detalle WHERE AID ='+quotedstr(idalarma)+' order by did', 0, qdetalle);
end;

procedure Tfrmrepdetalle.FormShow(Sender: TObject);
begin
self.Width :=  436;
self.Height := 480;
end;

procedure Tfrmrepdetalle.CrearReporte;
var sqltemp : tmyquery;
begin
sqltemp := tmyquery.Create(self);
sqltemp.Connection := dmaccesos.conexion;
querys('Select idcliente, telefono, dir, numero, clientes.nombre, clientes.idcategoria,if(rsocial is NULL or rsocial='''',if(clientes.apaterno is NULL or clientes.apaterno='''',clientes.nombre,if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))),clientes.rsocial) as nombres, colonias.cp, colonias.idmnp,colonias.nombre as colonia,categorias.nombre as categoria, '+
       'municipios.nombre as municipio From clientes left join colonias on (clientes.idcol=colonias.idcol) left join categorias on (clientes.idcategoria=categorias.idcategoria ) left join  municipios on (colonias.idmnp = municipios.idmnp) WHERE idcliente='+
       quotedstr(idcliente), 0, dmreportes.sqlgeneral2);

querys('Select id, hora_pc, fecha_pc, descripcion, c_zona, zona, tipo from sk_alarmas where id ='+quotedstr(idalarma), 0, qskalarmas);
  with dmreportes do
   begin
  //buscar a que hora contesto el cliente......
  querys('select IF ((left(detalle,14)= ''SI CONTESTARON''),date_format(alarmas_detalle.hora,''%h:%i:%s %p''),0) as detalle from alarmas_detalle where aid='+quotedstr(idalarma)+' having detalle > 0',0,sqltemp);
  RVP.SetParam('cuenta',sqltemp.FieldByName('detalle').AsString);

  querys('select tiempo_respuesta.hora, hora_llegada, clasif_servicios.nombre as mr, clasif_servicios.descripcion as nombrem, tiempo, mmdesc '+
  'from tiempo_respuesta left join clasif_servicios on (tiempo_respuesta.idmotivo = clasif_servicios.idstatus and  clasif_servicios.idserv = 3)'+
  ' where tiempo_respuesta.aid='+quotedstr(idalarma),0,sqltemp);
  RVP.SetParam('fecha',sqltemp.FieldByName('hora').AsString);
  RVP.SetParam('protocolo',sqltemp.FieldByName('hora_llegada').AsString);
  RVP.SetParam('Tax',sqltemp.FieldByName('tiempo').AsString);

//vamos a mostrar el motivo del retraso.
  if sqltemp.FieldByName('nombrem').AsString <> '' then
    begin
    if sqltemp.FieldByName('mr').AsString = 'OTROS' then
      begin
      if sqltemp.FieldByName('mmdesc').AsString  <> '' then
        RVP.SetParam('TotalPrice','Motivo del Retardo: '+sqltemp.FieldByName('mmdesc').AsString)
      else
        RVP.SetParam('TotalPrice','Motivo del Retardo : '+sqltemp.FieldByName('nombrem').AsString);
      end
    else
      RVP.SetParam('TotalPrice','Motivo del Retardo : '+sqltemp.FieldByName('nombrem').AsString);
    end
  else
   RVP.SetParam('TotalPrice','');
   RVP.SetParam('user',usuario);

  RVP.SetParam('titulo','Reporte de Atención de al Cliente');
  end;
dmreportes.RVDSskalarmas.DataSet :=Qskalarmas;
dmreportes.RVDSDetalle.DataSet := Qdetalle;
dmreportes.sqlgeneral2.Execute;
end;


procedure Tfrmrepdetalle.btnmailClick(Sender: TObject);
begin
CrearReporte;
querys('Select idcliente, email from clientes where idcliente ='+quotedstr(idcliente), 0, dmreportes.sqlgeneral8);
ObtenerCorreo('Tfrmrepdetalle', dmreportes.sqlgeneral8.fieldbyname('email').asstring);
OperacionReporte('RepEventosCliente','Reporte de Atencion al Cliente','PDF', 0);
end;


end.
