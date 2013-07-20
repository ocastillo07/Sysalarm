{///////////////////////////////////////////////////////////////////////////////
2012/07/19 dalyla correo a proveedor
2012/05/15 dalyla validarguardar pida fuente
2012/04/30 dalyla se muestra fuente en travel y al cargar no usa el key press del vendedor
2011/08/08 dalyla correccion de tags y guardar alta
2011/06/27 dalyla fuente es origen "a quien se le ocurre >>"
                  envio de correo a todos los mencionados en area al finalizar
2009/05/08 dalyla nombre de sucursal
2008/09/30 dalyla correcion de proveedor y empleado nombre en automatico
2008/09/26 dalyla multiples usuarios y correccion de tipo solicitante
2008-05-10 Que no solo pueda ser por cuenta sino por Empleado =0, Cliente =1 ,  Proveedor =3 y Otro = 4 , campo agregado TipoTravel int. Se agrego campos de nombre, telefono para cuando es otro, se graba el nombre directamente de las tablas.
ademas los campos idProblemaCausa INT  y ComentariosAuditor TEXT

200/03/27 dalyla en el filtro se miren todos y el encargado de area pueda
                 modificar a quien va dirigido
Creado por: Angel Javier Hernandez
}///////////////////////////////////////////////////////////////////////////////
unit Utravel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, RzButton, ExtCtrls, RzPanel, StdCtrls, ComCtrls, ToolWin,
  cxControls, cxNavigator, cxDBNavigator, Grids, DBGrids, DB, MemDS,
  DBAccess, MyAccess, RzLabel, Mask, RzEdit, RzBtnEdt, RzCmboBx, RzRadChk,
  RzRadGrp, UCBase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzBckgnd, DateUtils, RzLstBox;

type
  Tfrmtravel = class(TForm)
    pcprincipal: TRzPageControl;
    tstabla: TRzTabSheet;
    tsficha: TRzTabSheet;
    dstravel: TDataSource;
    sqltravel: TMyQuery;
    dbnavegador: TcxDBNavigator;
    lblBusqueda: TRzLabel;
    edcvecte: TRzButtonEdit;
    edNomCte: TRzEdit;
    RzLabel2: TRzLabel;
    SqlGeneral: TMyQuery;
    RzLabel3: TRzLabel;
    edtelefono: TRzEdit;
    RzLabel4: TRzLabel;
    edsector: TRzEdit;
    Edcve_vend: TRzEdit;
    cbonom_vend: TRzComboBox;
    RzLabel5: TRzLabel;
    edcve_usrrec: TRzEdit;
    ednom_usrrec: TRzEdit;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    edFechaRec: TRzEdit;
    edHoraRec: TRzEdit;
    cboasunto: TRzComboBox;
    RzLabel9: TRzLabel;
    cbofuente: TRzComboBox;
    RzLabel10: TRzLabel;
    cboAreaRecive: TRzComboBox;
    RzLabel12: TRzLabel;
    cboAreaDestino: TRzComboBox;
    RzLabel13: TRzLabel;
    cboquejas: TRzComboBox;
    RzLabel14: TRzLabel;
    cbomagnitud: TRzComboBox;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    lblaccion: TRzLabel;
    cboaudito: TRzComboBox;
    RzLabel18: TRzLabel;
    chkauditado: TRzCheckBox;
    edFechaAudito: TRzEdit;
    RzLabel19: TRzLabel;
    edHoraAudito: TRzEdit;
    rgcomunico: TRzRadioGroup;
    chkresuelto: TRzCheckBox;
    edComOtro: TRzEdit;
    rejilla: TcxGrid;
    vista1: TcxGridDBTableView;
    nivel1: TcxGridLevel;
    cxidt: TcxGridDBColumn;
    cxcuenta: TcxGridDBColumn;
    cxcliente: TcxGridDBColumn;
    cxproblema: TcxGridDBColumn;
    cxdepto: TcxGridDBColumn;
    cxusuarioa: TcxGridDBColumn;
    cxqueja: TcxGridDBColumn;
    cxasunto: TcxGridDBColumn;
    cxmagnitud: TcxGridDBColumn;
    cxfechacreacion: TcxGridDBColumn;
    cxhoracreacion: TcxGridDBColumn;
    cxResuelto: TcxGridDBColumn;
    btnOrdServ: TRzBitBtn;
    RzSeparator1: TRzSeparator;
    RzLabel8: TRzLabel;
    cxAuditado: TcxGridDBColumn;
    RzLabel11: TRzLabel;
    ednumtravel: TRzEdit;
    cboestatus: TRzComboBox;
    RzLabel17: TRzLabel;
    Label1: TLabel;
    CboFiltraArea: TRzComboBox;
    RzSeparator2: TRzSeparator;
    requeja: TRzMemo;
    reaccion: TRzMemo;
    RzMemo1: TRzMemo;
    dtdesde: TRzDateTimeEdit;
    dthasta: TRzDateTimeEdit;
    btnalta: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzPanel1: TRzPanel;
    btnImprimir: TRzBitBtn;
    cbusuario: TRzComboBox;
    pfiltro: TRzPanel;
    Label2: TLabel;
    Label4: TLabel;
    cbestatus: TRzComboBox;
    btnfiltrar: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    chkPeriodo: TRzCheckBox;
    cboAltaTravel: TRzComboBox;
    RzLabel20: TRzLabel;
    RzLabel1: TRzLabel;
    mmComentarioAuditor: TRzMemo;
    RzSeparator3: TRzSeparator;
    cboProblemaCausa: TRzComboBox;
    RzLabel21: TRzLabel;
    cxfuente: TcxGridDBColumn;
    btnenviar: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edcvecteButtonClick(Sender: TObject);
    procedure edcvecteExit(Sender: TObject);
    procedure edcvecteKeyPress(Sender: TObject; var Key: Char);
    procedure edcvecteChange(Sender: TObject);
    procedure Edcve_vendKeyPress(Sender: TObject; var Key: Char);
    procedure Edcve_vendChange(Sender: TObject);
    procedure cbonom_vendChange(Sender: TObject);
    procedure cbonom_vendClick(Sender: TObject);
    procedure cbonom_vendKeyPress(Sender: TObject; var Key: Char);
    procedure TBAddClick(Sender: TObject);
    procedure cboasuntoNotInList(Sender: TObject);
    procedure cbofuenteNotInList(Sender: TObject);
    procedure cboAreaReciveNotInList(Sender: TObject);
    procedure cboAreaDestinoNotInList(Sender: TObject);
    procedure cboquejasNotInList(Sender: TObject);
    procedure cboasuntoClick(Sender: TObject);
    procedure cbofuenteSelect(Sender: TObject);
    procedure cboAreaDestinoSelect(Sender: TObject);
    procedure cboquejasSelect(Sender: TObject);
    procedure cbomagnitudSelect(Sender: TObject);
    procedure cboauditoSelect(Sender: TObject);
    procedure vista1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure chkauditadoClick(Sender: TObject);
    procedure vista1DblClick(Sender: TObject);
    procedure cboAreaDestinoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOrdServClick(Sender: TObject);
    procedure chkresueltoClick(Sender: TObject);
    procedure dbnavegadorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure pcprincipalTabClick(Sender: TObject);
    procedure cboestatusNotInList(Sender: TObject);
    procedure cboestatusClick(Sender: TObject);
    procedure CboFiltraAreaNotInList(Sender: TObject);
    procedure CboFiltraAreaKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure TBBorrarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnfiltrarClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure CboFiltraAreaChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cboAltaTravelChange(Sender: TObject);
    procedure cboAltaTravelKeyPress(Sender: TObject; var Key: Char);
    procedure BuscarSolicitante;
    procedure edNomCteKeyPress(Sender: TObject; var Key: Char);
    procedure edtelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure cboestatusKeyPress(Sender: TObject; var Key: Char);
    procedure btnenviarClick(Sender: TObject);
  private
    { Private declarations }
    idservicio : string;
    rep:boolean;
    procedure InsertaTravel(resuelto, auditado:string);
  public
  body: tmemo;
  procedure Limpia;
  procedure filtrar;
  procedure TraeDatosTravel(id:string);
  procedure HabilitaTabla;
  function validaguardar:boolean;

    { Public declarations }
  end;

var
  frmtravel: Tfrmtravel;

implementation

uses Udm, Urecursos, Ubusquedas, Uautentificacion, Uprincipal, Uservicios,
  Udmrep;

{$R *.dfm}

procedure tfrmtravel.HabilitaTabla;
begin
 limpia;
 tsficha.Enabled := false;
 tsficha.TabEnabled := false;
 tstabla.Enabled := true;
 tstabla.TabEnabled := true;
 pcprincipal.ActivePageIndex := 0;
 sqltravel.Close;
 sqltravel.Open;
end;

procedure tfrmtravel.TraeDatosTravel(id:string);
var sqlgral : tmyquery;
begin
Limpia;
sqlgral := tmyquery.Create(self);
sqlgral.Connection := dmaccesos.conexion;
querys('Select t.idtravel, idservicio, t.idcliente, t.nombre AS Cliente, solicitante, telefono, ComentariosAuditor, '+
       'idProblemaCausa, q.nombre as queja, q.idqueja, t.idusraudito, t.idusra, a.nombre AS Depto, t.FechaRecive, '+
       't.HoraRecive, t.descripcion, m.nombre AS Magnitud, q.nombre, t.idfuente, t.HoraAudito, '+
       't.idasunto, if(t.resuelto=1,"Si","No") AS Resuelto, if(t.auditado=1,"Si", "No") AS Auditado, '+
       't.idusrrecive, t.iddptorecive, t.idusraudito, t.FechaAudito, t.comunico, t.ComunicoOtro, t.idestatus, '+
       't.accion, '+UsuarioNombre('u')+' as usuarioa '+
       'From travel t left Join usuarios u ON t.idusra = u.idusuario '+
       'left Join areas a ON t.iddptoa = a.idarea left Join magnitudes m ON t.idmagnitud = m.idmagnitud '+
       'left Join quejas q ON t.idqueja = q.idqueja left Join asuntos ast ON t.idasunto = ast.idasunto '+
       'where idtravel='+id,0,sqlgral);

ednumtravel.Text := sqlgral.fieldbyname('idtravel').AsString;
idservicio := sqlgral.fieldbyname('idservicio').AsString;
edcvecte.Text :=sqlgral.fieldbyname('idcliente').AsString;
edNomCte.Text :=  sqlgral.fieldbyname('Cliente').AsString;
cboAltaTravel.ItemIndex := sqlgral.fieldbyname('solicitante').AsInteger;
edtelefono.Text := sqlgral.fieldbyname('telefono').AsString;
mmComentarioAuditor.Text := sqlgral.fieldbyname('ComentariosAuditor').AsString;
cboProblemaCausa.ItemIndex := sqlgral.fieldbyname('idProblemaCausa').AsInteger;
edcve_usrrec.Text :=sqlgral.fieldbyname('idusrrecive').AsString;

//trae el nombre del usuario que recibio el evento
querys('select '+UsuarioNombre('u')+' AS Usuario from usuarios u where idusuario='+edcve_usrrec.Text,0,sqlgeneral);
ednom_usrrec.Text := sqlgeneral.fieldbyname('usuario').AsString;

edFechaRec.Text := sqlgral.fieldbyname('FechaRecive').AsString;
edhoraRec.Text :=  sqlgral.fieldbyname('HoraRecive').AsString;
edcve_vend.Text := sqlgral.fieldbyname('idusra').AsString;
cbonom_vend.Tag := sqlgral.fieldbyname('idusra').AsInteger;
cbonom_vend.Text := sqlgral.fieldbyname('usuarioa').AsString;
//trae el asunto
querys('select nombre from asuntos where idasunto='+sqlgral.Fieldbyname('idasunto').AsString,0,sqlgeneral);
cboasunto.Text := sqlgeneral.fieldbyname('nombre').AsString;
cboasunto.Tag := sqlgral.Fieldbyname('idasunto').Asinteger;
//trae la fuente
querys('select nombre from origen where idorigen='+sqlgral.fieldbyname('idfuente').AsString,0,sqlgeneral);
cbofuente.Text := sqlgeneral.fieldbyname('nombre').AsString;
querys('select nombre from areas where idarea='+sqlgral.fieldbyname('iddptorecive').AsString,0,sqlgeneral);
cboAreaRecive.Text :=  sqlgeneral.fieldbyname('nombre').AsString;
cboareadestino.Text :=  sqlgral.fieldbyname('depto').AsString;
querys('select idarea from areas where nombre='+quotedstr(sqlgral.fieldbyname('depto').AsString),0,sqlgeneral);
cboareadestino.Tag := sqlgeneral.fieldbyname('idarea').Asinteger;
CargaCombo('SELECT distinct asuntos.nombre FROM asuntos INNER JOIN quejas ON (asuntos.idasunto = quejas.idasunto) INNER JOIN areas ON (quejas.idarea = areas.idarea) WHERE areas.nombre = '+quotedstr(cboareadestino.Text)+' order by asuntos.nombre','Asuntos en esta area',cboasunto);
cboasunto.OnClick(self);
cboquejas.Tag := sqlgral.fieldbyname('idqueja').Asinteger;
cboquejas.Text :=  sqlgral.fieldbyname('queja').AsString;
cbomagnitud.Text :=  sqlgral.fieldbyname('magnitud').AsString;
querys('select idmagnitud from magnitudes where nombre='+quotedstr(cbomagnitud.Text),0,sqlgeneral);
cbomagnitud.Tag := sqlgeneral.fieldbyname('idmagnitud').Asinteger;
querys('SELECT EstatusServicios.nombre FROM TipoServicios INNER JOIN EstatusServicios ON (TipoServicios.idserv = EstatusServicios.idserv) WHERE TipoServicios.nombre = ''TRAVEL'' and EstatusServicios.orden = '+sqlgral.fieldbyname('idestatus').AsString,0,sqlgeneral);
cboestatus.Text := sqlgeneral.fieldbyname('nombre').AsString;
if sqlgral.fieldbyname('auditado').AsString = 'Si' then
 chkauditado.Checked := true
else
 chkauditado.Checked := false;
//trae el nombre del usuario que audito
querys('select '+UsuarioNombre('u')+' AS Usuario from usuarios u where idusuario='+sqlgral.fieldbyname('idusraudito').AsString,0,sqlgeneral);
cboaudito.Text := sqlgeneral.fieldbyname('usuario').AsString;
cboaudito.Tag := sqlgral.fieldbyname('idusraudito').Asinteger;
edFechaAudito.Text:=sqlgral.fieldbyname('FechaAudito').AsString;
edHoraAudito.Text :=sqlgral.fieldbyname('HoraAudito').AsString;
rgcomunico.ItemIndex := sqlgral.fieldbyname('comunico').Asinteger;
edComOtro.Text := sqlgral.fieldbyname('ComunicoOtro').AsString;
if sqlgral.fieldbyname('resuelto').AsString = 'Si' then
 chkresuelto.Checked:=true
else
 chkresuelto.Checked := false;
requeja.Text := sqlgral.fieldbyname('descripcion').AsString;
reaccion.Text := sqlgral.fieldbyname('accion').AsString;
end;

procedure tfrmtravel.Limpia;
begin

edNumTravel.Clear;
edcvecte.Clear;
edNomCte.Clear;
edtelefono.Clear;
edsector.Clear;
edcve_usrrec.Clear;
ednom_usrrec.Clear;
edFechaRec.Clear;
edHoraRec.Clear;
edcve_vend.Clear;
requeja.Clear;
reaccion.Clear;
edComOtro.Clear;
edfechaaudito.Clear;
edhoraaudito.Clear;
mmComentarioAuditor.Clear;

chkresuelto.Checked := false;
chkauditado.Checked := false;
rgcomunico.ItemIndex := -1;
cboestatus.itemindex := -1;

cbonom_vend.ItemIndex := -1;
cbonom_vend.Tag := 0;
cboasunto.ItemIndex := -1;
cboasunto.Tag := 0;
cbofuente.ItemIndex := -1;
cbofuente.Tag := 0;
cboarearecive.ItemIndex := -1;
cboarearecive.Tag := 0;
cboareadestino.ItemIndex := -1;
cboareadestino.Tag := 0;
cboquejas.ItemIndex := -1;
cboquejas.Tag := 0;
cbomagnitud.ItemIndex := -1;
cbomagnitud.Tag := 0;
cboaudito.ItemIndex := -1;
cboaudito.Tag := 0;
end;

procedure Tfrmtravel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;             

procedure Tfrmtravel.TBSalirClick(Sender: TObject);
begin
close;
end;

procedure Tfrmtravel.FormShow(Sender: TObject);
begin
body:=tmemo.Create(self);
body.Visible := false;
body.Parent:=tsficha;
body.Height := self.Height;
body.Width := self.Width;

sqltravel.Active := true;
if sqltravel.RecordCount = 0 then
  btnmodificar.Enabled := false;

tsficha.Enabled := false;
//tbtabla.Down :=  true;
dtdesde.Date := encodedate(yearof(today), monthof(today),1);
dthasta.Date := today;
pcprincipal.ActivePageIndex := 0;

CargaCombo('select nombre from asuntos order by nombre','Asuntos',cboasunto);
CargaCombo('select nombre from origen where nombre <> "SIN ORIGEN" order by nombre','origen',cbofuente);
CargaCombo('select nombre from areas order by nombre','Areas',cboAreaRecive);
CargaCombo('select nombre from areas order by nombre','Areas',cboAreaDestino);

CargaCombo('select nombre from magnitudes order by nombre','Magnitudes',cbomagnitud);
CargaCombo('select concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'' '')) as Nombre from usuarios where concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'' '')) <> ''''','Usuarios',cboaudito);
CargaCombo('SELECT EstatusServicios.nombre FROM TipoServicios INNER JOIN EstatusServicios ON (TipoServicios.idserv = EstatusServicios.idserv) WHERE (TipoServicios.nombre = ''TRAVEL'') ORDER BY EstatusServicios.orden','Estatus de Travel',cboestatus);
CargaCombo('select nombre from areas order by nombre','Areas',CboFiltraArea);
cargacombo2('Select idusuario, '+UsuarioNombre('u')+' as nombre from usuarios as u where estatus = 1', 'nombre', 'idusuario', cbusuario);
cbusuario.Items.Add('TODOS');
cbusuario.Text := 'TODOS';
cbestatus.text := 'SIN RESOLVER';
CboFiltraArea.Items.Add('TODOS');
CboFiltraArea.Text := 'TODOS';
cargacombo2('SELECT  s.nombre as Nombre,orden FROM TipoServicios as t inner join EstatusServicios as s on(s.idserv=t.idserv) where t.nombre = "PROBLEMA-CAUSA" order by orden', 'Nombre', 'orden', cboProblemaCausa);
cboProblemaCausa.ItemIndex := 0;

querys('Select t.idtravel, t.idcliente, t.nombre AS Cliente, '+UsuarioNombre('u')+' AS Usuario, '+
       'a.nombre AS Depto, t.FechaRecive, t.HoraRecive, t.descripcion, m.nombre AS Magnitud, '+
       'q.nombre AS Queja, an.nombre AS Asunto, if(t.resuelto = 1, "Si", "No") as Resuelto, '+
       'if(t.auditado = 1, "Si", "No") as Auditado, idservicio, f.nombre as Fuente  '+
       'From travel t left Join usuarios u ON t.idusra = u.idusuario '+
       'left Join areas a ON t.iddptoa = a.idarea left Join magnitudes m ON t.idmagnitud = m.idmagnitud '+
       'left Join quejas q ON t.idqueja = q.idqueja left Join asuntos an ON t.idasunto = an.idasunto '+
       'left join fuentes f on f.idfuente=t.idfuente '+
       'where t.resuelto=0 and t.auditado=0 order by depto, resuelto',0,sqltravel);
end;

procedure Tfrmtravel.edcvecteButtonClick(Sender: TObject);
begin
if(cboAltaTravel.ItemIndex = 1) then
begin
 frmbusquedas.query:='Select idcliente,'+ ClienteNombre('clientes') +' as Nombre,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
                           ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora,precio From clientes order by idcliente';
 frmbusquedas.campo_retorno:='idcliente';
 frmbusquedas.campo_busqueda:='Nombre';
 frmbusquedas.tabla:='clientes';
 frmbusquedas.tblorigen := 'clientes';
 frmbusquedas.cbofiltro.ItemIndex:=1;
 frmbusquedas.cbofiltro.OnClick(nil);
 frmbusquedas.ShowModal;
          if frmbusquedas.resultado <> '' then
            begin
                 edcvecte.Text := frmbusquedas.resultado;
                 querys('select clientes.idtel,clientes.sector,'+ ClienteNombre('clientes') +' AS nombre  '+
                        ' from clientes where clientes.idcliente='+edcvecte.Text,0,sqlgeneral);
                 edsector.Text := sqlgeneral.fieldbyname('sector').AsString;
                 ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
                 //trae el telefono
                 querys('select telefono from telefonos where idtel='+sqlgeneral.fieldbyname('idtel').AsString+' and (tipo_tel=''CASA'' or tipo_tel=''ALARMA'' or telefonos.tipo_tel=''CONVENCIONAL'') limit 1',0,sqlgeneral);
                 edtelefono.Text :=sqlgeneral.fieldbyname('telefono').AsString;
                 cboareadestino.SetFocus;
            end;
end;

if(cboAltaTravel.ItemIndex = 0) then
begin
 frmbusquedas.query:='Select idusuario,'+ UsuarioNombre('usuarios') +' as Nombre,idsector From usuarios where estatus = 1 order by idusuario';
 frmbusquedas.campo_retorno:='idusuario';
 frmbusquedas.campo_busqueda:='Nombre';
 frmbusquedas.tabla:='usuarios';
 frmbusquedas.tblorigen := 'usuarios';
 frmbusquedas.cbofiltro.ItemIndex:=1;
 frmbusquedas.cbofiltro.OnClick(nil);
 frmbusquedas.ShowModal;
          if frmbusquedas.resultado <> '' then
            begin
                 edcvecte.Text := frmbusquedas.resultado;
                 querys('select idusuario,'+ ClienteNombre('usuarios') +' as Nombre,idsector From usuarios  where idusuario='+edcvecte.Text,0,sqlgeneral);
                 edsector.Text := sqlgeneral.fieldbyname('idsector').AsString;
                 ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
                 cboareadestino.SetFocus;
            end;
end;

if(cboAltaTravel.ItemIndex = 2) then
begin
 frmbusquedas.query:='Select idprov,'+ ClienteNombre('proveedores') +' as Nombre From proveedores where estatus =1 order by idprov';
 frmbusquedas.campo_retorno:='idprov';
 frmbusquedas.campo_busqueda:='Nombre';
 frmbusquedas.tabla:='proveedores';
 frmbusquedas.tblorigen := 'proveedores';
 frmbusquedas.cbofiltro.ItemIndex:=1;
 frmbusquedas.cbofiltro.OnClick(nil);
 frmbusquedas.ShowModal;
          if frmbusquedas.resultado <> '' then
            begin
                 edcvecte.Text := frmbusquedas.resultado;
                 querys('select idprov,'+ ClienteNombre('proveedores') +' as Nombre From proveedores where idprov='+edcvecte.Text,0,sqlgeneral);
                 ednomcte.Text := sqlgeneral.fieldbyname('Nombre').AsString;
                 cboareadestino.SetFocus;
            end;
end;


end;

procedure Tfrmtravel.BuscarSolicitante;
begin
   if(cboAltaTravel.ItemIndex = 1) then
    begin
           //verifica que lo que se halla tecleado en cve_cte sea valido
            querys('select clientes.idtel,clientes.sector,'+ClienteNombre('clientes')+' AS nombre  '+
                   ' from clientes where clientes.idcliente='+edcvecte.Text,0,sqlgeneral);
                 if sqlgeneral.RecordCount = 0 then
                     begin
                        application.MessageBox(pchar('Ese cliente #'+edcvecte.text+' no existe'),'Aviso',mb_iconinformation);
                        edcvecte.Text := '';
                        edcvecte.SetFocus;
                     end
                      else
                     begin
                        ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
                        edsector.Text := sqlgeneral.fieldbyname('sector').AsString;
                        //trae el telefono
                        querys('select telefono from telefonos where idtel='+sqlgeneral.fieldbyname('idtel').AsString+' and (tipo_tel=''CASA'' or tipo_tel=''ALARMA'' or telefonos.tipo_tel=''CONVENCIONAL'') limit 1',0,sqlgeneral);
                        edtelefono.Text :=sqlgeneral.fieldbyname('telefono').AsString;
                        if (pcprincipal.ActivePageIndex = 1) and (tsficha.enabled) then
                            cboAreaDestino.setfocus;
                     end;
    end;

    if(cboAltaTravel.ItemIndex = 0) then
    begin
           //verifica que lo que se halla tecleado en cve_cte sea valido
            querys('select '+UsuarioNombre('usuarios')+' AS nombre,idsector  '+
                   ' from usuarios where idusuario='+edcvecte.Text+' and estatus =1',0,sqlgeneral);
                 if sqlgeneral.RecordCount = 0 then
                     begin
                        application.MessageBox(pchar('Ese usuario #'+edcvecte.text+' no existe'),'Aviso',mb_iconinformation);
                        edcvecte.Text := '';
                        edcvecte.SetFocus;
                     end
                      else
                     begin
                        ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
                        edsector.Text := sqlgeneral.fieldbyname('idsector').AsString;
                        if (pcprincipal.ActivePageIndex = 1) and (tsficha.enabled) then
                            cboAreaDestino.setfocus;
                     end;
    end;

    if(cboAltaTravel.ItemIndex = 2) then
    begin
           //verifica que lo que se halla tecleado en cve_cte sea valido
            querys('select '+ClienteNombre('proveedores')+' AS nombre  '+
                   ' from proveedores where idprov='+edcvecte.Text+' and estatus =1 ',0,sqlgeneral);
                 if sqlgeneral.RecordCount = 0 then
                     begin
                        application.MessageBox(pchar('Ese proveedor #'+edcvecte.text+' no existe'),'Aviso',mb_iconinformation);
                        edcvecte.Text := '';
                        edcvecte.SetFocus;
                     end
                      else
                     begin
                        ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
                        if (pcprincipal.ActivePageIndex = 1) and (tsficha.enabled) then
                            cboAreaDestino.setfocus;
                     end;
    end;

end;


procedure Tfrmtravel.edcvecteExit(Sender: TObject);
begin
if edcvecte.Text <> '' then
      BuscarSolicitante;


    {
  //verifica que lo que se halla tecleado en cve_cte sea valido
  querys('select clientes.idtel,clientes.sector,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) AS nombre  '+
         ' from clientes where clientes.idcliente='+edcvecte.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox(pchar('Ese cliente #'+edcvecte.text+' no existe'),'Aviso',mb_iconinformation);
    edcvecte.Text := '';
    edcvecte.SetFocus;
   end
  else
   begin
    ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
    edsector.Text := sqlgeneral.fieldbyname('sector').AsString;
    //trae el telefono
    querys('select telefono from telefonos where idtel='+sqlgeneral.fieldbyname('idtel').AsString+' and (tipo_tel=''CASA'' or tipo_tel=''ALARMA'' or telefonos.tipo_tel=''CONVENCIONAL'') limit 1',0,sqlgeneral);
    edtelefono.Text :=sqlgeneral.fieldbyname('telefono').AsString;
   end;
   }

end;

procedure Tfrmtravel.edcvecteKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto(edcvecte.Text+'.',key);
  if key=#13 then
   begin
     key:=#0;
       if edcvecte.Text <> '' then

              BuscarSolicitante
         {
  querys('select clientes.sector,telefonos.telefono,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) AS nombre  '+
         ' from clientes left join telefonos on clientes.idtel = telefonos.idtel where clientes.idcliente='+edcvecte.Text+'  limit 1',0,sqlgeneral);
         if sqlgeneral.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
             //if tbgrabar.Enabled then
             //SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
           end
         else
           begin
            ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
            edtelefono.Text := sqlgeneral.fieldbyname('telefono').AsString;
            edsector.Text := sqlgeneral.fieldbyname('sector').AsString;
            if (pcprincipal.ActivePageIndex = 1) and (tsficha.enabled) then
             cboAreaDestino.setfocus;
            end; }

     else
        edcvecte.OnButtonClick(self);
  end;

  if key = #27 then
   begin
      key:=#0;
     edcvecte.Text:='';
   end;

end;

procedure Tfrmtravel.edcvecteChange(Sender: TObject);
begin
if edcvecte.Text = '' then
 begin
  ednomcte.Text := '';
  edsector.Text := '';
  edtelefono.Text := '';
 end;
end;

procedure Tfrmtravel.Edcve_vendKeyPress(Sender: TObject; var Key: Char);
begin
if (edcve_vend.Text<>'')and(key=#13) then
   begin
    try
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend
     querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario '+
            'FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
            ' WHERE  usuarios.estatus = 1 and  usuarios.idusuario='+EdCve_Vend.Text,0,SqlGeneral);
    except
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend
     querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario '+
            'FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  usuarios.estatus = 1 and usuarios.codigo='+quotedstr(EdCve_Vend.Text),0,SqlGeneral);
    end;
     key:=#0;
   if SqlGeneral.RecordCount > 0 then
    begin
     CboNom_Vend.Text := SqlGeneral.fieldbyname('nombre').AsString;
     edcve_vend.Text :=SqlGeneral.fieldbyname('idusuario').AsString;
     cbonom_vend.Tag :=SqlGeneral.fieldbyname('idusuario').AsInteger;
    end
   else
    begin
     cbonom_vend.Tag :=0;
     if application.MessageBox('Esa Clave de Vendedor no se encontro deseas buscarlo!','Error',mb_yesno+mb_iconInformation) = idyes then begin
      frmbusquedas.query:='Select u.idusuario,u.codigo,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Nombre,u.idsector as Sector, '+
                          'a.nombre as Area,p.nombre as Puesto From usuarios as u LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE u.estatus = 1 order by u.codigo';
      frmbusquedas.campo_retorno:='codigo';
      frmbusquedas.campo_busqueda:='codigo';
      frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.ShowModal;

      if frmbusquedas.resultado <> '' then
       begin
              edcve_vend.Text := frmbusquedas.resultado;
              chtecla:=#13;
              edcve_vend.OnKeyPress(self,chtecla);
       end;
     end else begin
     edcve_vend.Text:='';
     end;
    end;
   end;

if key = #13 then
begin
 key := #0;
 //if tsficha.Tabvisible then
//  cbonom_vend.SetFocus;
end;

end;

procedure Tfrmtravel.Edcve_vendChange(Sender: TObject);
begin
if edcve_vend.Text = '' then
 begin
  cbonom_vend.Tag :=0;
  cbonom_vend.Text:='';
 end;
end;

procedure Tfrmtravel.cbonom_vendChange(Sender: TObject);
begin
if cbonom_vend.Text = '' then
 edcve_vend.Text:='';
end;

procedure Tfrmtravel.cbonom_vendClick(Sender: TObject);
begin
querys('SELECT u.idusuario, u.email1, u.email2 FROM usuarios u '+
       'INNER JOIN puestos p ON u.idpuesto = p.idpuesto '+
       'WHERE  u.estatus = 1 and '+UsuarioNombre('u')+' = "'+cbonom_vend.Text+'"',0,SqlGeneral);
edcve_vend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
cbonom_vend.Tag :=SqlGeneral.fieldbyname('idusuario').AsInteger;
if (SqlGeneral.fieldbyname('email1').AsString = '') and (SqlGeneral.fieldbyname('email2').AsString='') then
 if application.MessageBox('El usuario destino no tiene una direccion de email y no se le notificara que tiene un nuevo travel, Desea continuar generando el Travel?','Pregunta',mb_iconquestion+mb_yesno) = idno then
   btncancelar.Click;
end;

procedure Tfrmtravel.cbonom_vendKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
 key := #0;
 SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmtravel.TBAddClick(Sender: TObject);
begin
  sqltravel.Close;
  tstabla.TabEnabled := false;
  tsficha.TabEnabled := true;
  tsficha.enabled := true;
  pcprincipal.ActivePageIndex := 1;
  Limpia;
    edcvecte.Enabled := true;
    edcve_vend.Enabled := true;
    cbonom_vend.Enabled := true;
    cboasunto.Enabled := true;
    cbofuente.Enabled := true;
    cboarearecive.Enabled := true;
    cboAreaDestino.Enabled := true;
    cboquejas.Enabled := true;
    cbomagnitud.Enabled := true;
    chkauditado.Enabled := false;
    requeja.Enabled := true;
    reaccion.Enabled := true;
    cboestatus.Enabled := true;
    rgcomunico.Enabled := true;
    cboaudito.Enabled := true;
if frmautentificacion.ShowModal = mrok then
  begin
  querys('select usuarios.idusuario,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Nombre,areas.nombre as area,areas.idarea from usuarios inner join UCTabUsers on usuarios.idusuario = UCTabUsers.UCidUser '+
         ' inner join areas on usuarios.idarea = areas.idarea where UCTabUsers.UCLogin ='+quotedstr(frmautentificacion.edusuario.Text),0,sqlgeneral);
   if sqlgeneral.RecordCount = 0 then
    begin
     application.MessageBox('No tiene asignada una area y no podra crear un travel, consulte a su administrador de sistema','Aviso',mb_iconinformation);
     HabilitaTabla;
     exit;
    end;
  edcve_usrrec.Text := sqlgeneral.fieldbyname('idusuario').AsString;
  ednom_usrrec.Text := sqlgeneral.fieldbyname('nombre').AsString;
  cboAreaRecive.Text := sqlgeneral.fieldbyname('area').AsString;
  cboarearecive.Tag := sqlgeneral.fieldbyname('idarea').AsInteger;
  cboestatus.ItemIndex := 0;
  cbomagnitud.ItemIndex := 0;
  edfecharec.Text := datetostr(FechaServidor);
  edhorarec.Text := timetostr(HoraServidor);
  querys('select max(idtravel) as id from travel',0,sqlgeneral);
  edNumTravel.Text := inttostr(sqlgeneral.fieldbyname('id').AsInteger+1);
  edcvecte.SetFocus;
  edNumTravel.Enabled := false;
 end
else
 begin

  HabilitaTabla;

 end;
end;

procedure Tfrmtravel.cboasuntoNotInList(Sender: TObject);
begin
(sender as trzcombobox).Text := '';
(sender as trzcombobox).Tag := 0;
end;

procedure Tfrmtravel.cbofuenteNotInList(Sender: TObject);
begin
cbofuente.Text := '';
end;

procedure Tfrmtravel.cboAreaReciveNotInList(Sender: TObject);
begin
cboarearecive.Text := '';
end;

procedure Tfrmtravel.cboAreaDestinoNotInList(Sender: TObject);
begin
cboareadestino.Text := '';
end;

procedure Tfrmtravel.cboquejasNotInList(Sender: TObject);
begin
cboquejas.Text := '';
end;

procedure Tfrmtravel.cboasuntoClick(Sender: TObject);
begin
querys('select idasunto from asuntos where nombre='+quotedstr(cboasunto.Text),0,sqlgeneral);
cboasunto.Tag := sqlgeneral.fieldbyname('idasunto').AsInteger;
if (cboareadestino.Text <> '') and (cboasunto.Text <> '')and(pcprincipal.ActivePageIndex=0) then
 begin
  querys('select quejas.nombre from quejas where quejas.idarea = '+inttostr(cboareadestino.Tag)+' and quejas.idasunto='+inttostr(cboasunto.Tag)+' order by quejas.nombre',0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
  CargaCombo('select quejas.nombre from quejas where quejas.idarea = '+inttostr(cboareadestino.Tag)+' and quejas.idasunto='+inttostr(cboasunto.Tag)+' order by quejas.nombre','Sub asuntos',cboquejas);
 end;

if (cboareadestino.Text <> '') and (cboasunto.Text <> '')and(pcprincipal.ActivePageIndex=1) then
 CargaCombo('select quejas.nombre from quejas where quejas.idarea = '+inttostr(cboareadestino.Tag)+' and quejas.idasunto='+inttostr(cboasunto.Tag)+' order by quejas.nombre','Sub asuntos',cboquejas);

 end;

procedure Tfrmtravel.cbofuenteSelect(Sender: TObject);
begin
querys('select idorigen from origen where nombre ='+quotedstr(cbofuente.Text),0,sqlgeneral);
cbofuente.Tag := sqlgeneral.fieldbyname('idorigen').AsInteger;
end;

procedure Tfrmtravel.cboAreaDestinoSelect(Sender: TObject);
begin
querys('select idarea from areas where nombre ='+quotedstr(cboareadestino.Text),0,sqlgeneral);
cboAreaDestino.Tag := sqlgeneral.fieldbyname('idarea').AsInteger;
//carga los usuarios del area seleccionada                                                                                                                                                                                                                             puestos.nombre = '+quotedstr('VENDEDOR')+' AND
if(sqlgeneral.RecordCount > 0 ) then
     begin
          CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
                     ' inner join areas on areas.idarea=usuarios.idarea WHERE  usuarios.estatus = 1 and areas.idarea='+sqlgeneral.fieldbyname('idarea').AsString+' order by usuarios.nombre','usuarios en esta area',cboNom_Vend);
          //carga los asuntos que tengan subasuntos
          CargaCombo('SELECT distinct asuntos.nombre FROM asuntos INNER JOIN quejas ON (asuntos.idasunto = quejas.idasunto) INNER JOIN areas ON (quejas.idarea = areas.idarea) WHERE areas.nombre = '+quotedstr(cboareadestino.Text)+' order by asuntos.nombre','Asuntos en esta area',cboasunto);
          if cbonom_vend.Items.Count = 0 then
           begin
            edcve_vend.Text := '';
            cbonom_vend.Text := '';
           end;
     end;
end;

procedure Tfrmtravel.cboquejasSelect(Sender: TObject);
begin
querys('select idqueja from quejas where nombre ='+quotedstr(cboquejas.Text),0,sqlgeneral);
cboquejas.Tag := sqlgeneral.fieldbyname('idqueja').AsInteger;
end;

procedure Tfrmtravel.cbomagnitudSelect(Sender: TObject);
begin
querys('select idmagnitud from magnitudes where nombre ='+quotedstr(cbomagnitud.Text),0,sqlgeneral);
cbomagnitud.Tag := sqlgeneral.fieldbyname('idmagnitud').AsInteger;
end;

procedure Tfrmtravel.cboauditoSelect(Sender: TObject);
begin
querys('select idusuario from usuarios where concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'''')) ='+quotedstr(cboaudito.Text),0,sqlgeneral);
cboaudito.Tag := sqlgeneral.fieldbyname('idusuario').AsInteger;
end;

procedure Tfrmtravel.vista1CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
TraeDatosTravel(sqltravel.FieldByName('idtravel').AsString);
end;

procedure Tfrmtravel.chkauditadoClick(Sender: TObject);
begin
if chkauditado.Checked = true then
  begin
  if btnmodificar.Caption = '&Guardar' then
   begin
    querys('SELECT EstatusServicios.finaliza FROM EstatusServicios  INNER JOIN TipoServicios ON (EstatusServicios.idserv = TipoServicios.idserv) WHERE (TipoServicios.nombre = ''TRAVEL'') AND EstatusServicios.nombre = '+quotedstr(cboestatus.Text),0,sqlgeneral);
    if sqlgeneral.FieldByName('finaliza').AsInteger = 0 then
     begin
      chkauditado.Checked := false;
      application.MessageBox('Ya que el estatus actual no es de finalizacion del travel no podra auditarlo!','Aviso',mb_iconinformation);
      exit;
     end;
     if idservicio <> '' then
      begin
       querys('Select sid as servicio from servicios  left join EstatusServicios as es ON (es.orden=servicios.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) where sid = '+idservicio+' and  es.finaliza =1 group by sid ',0,sqlgeneral);
       if sqlgeneral.FieldByName('servicio').AsString = '' then
        begin
         with Application do
          begin
           NormalizeTopMosts;
           MessageBox(pchar('Este travel tiene el servicio :'+idservicio+' sin cerrar, por tal no puede ser auditado todavia '), 'Atención', mb_IconInformation);
           RestoreTopMosts;
          end;
         chkauditado.Checked := false;
         exit;
        end;
      end;

  querys('SELECT usuarios.idusuario as us,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  cboaudito.Text := sqlgeneral.fieldbyname('nombre').AsString;
  cboaudito.tag :=  sqlgeneral.fieldbyname('us').AsInteger;
  edFechaAudito.Text := datetostr(FechaServidor);
  edHoraAudito.Text := timetostr(HoraServidor);
  end;
 end
else
 begin
  cboaudito.Text := '';
  edFechaAudito.Clear;
  edHoraAudito.Clear;
  cboaudito.tag := 0;
 end;

end;

procedure Tfrmtravel.vista1DblClick(Sender: TObject);
begin
pcprincipal.TabIndex := 1;
pfiltro.Enabled := false;
end;

procedure Tfrmtravel.cboAreaDestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
   key:=#0;
  if (cboareadestino.Text <> '') and (cboasunto.Text <> '') then
   CargaCombo('select quejas.nombre from quejas where quejas.idarea = '+inttostr(cboareadestino.Tag)+' and quejas.idasunto='+inttostr(cboasunto.Tag)+' order by quejas.nombre','Sub asuntos',cboquejas);
   SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

end;

procedure Tfrmtravel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if btncancelar.Caption = '&Cancelar' then
 begin
  application.MessageBox('Debe de Guardar los datos o cancelar para poder salir de esta pantalla!','Aviso',mb_iconwarning);
  canclose := false;
 end
else
canclose := true;
end;

procedure Tfrmtravel.btnOrdServClick(Sender: TObject);
Var hija : Tfrmservicios;
    emailusr,emailjefe,resuelto,auditado:string;
begin
//saca las direcciones de correo electronico
querys('select email1 from usuarios where idusuario='+edcve_vend.Text,0,sqlgeneral);
emailusr:=sqlgeneral.fieldbyname('email1').AsString;
querys('select usuarios.email1 from usuarios inner join puestos on puestos.idpuesto = usuarios.idpuesto '+
       'inner join areas on areas.idarea = usuarios.idarea where areas.nombre='+quotedstr(cboAreadestino.Text)+' '+
       'and  puestos.nombre=''GERENTE'' and usuarios.estatus=1',0,sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof do
 begin
 if sqlgeneral.fieldbyname('email1').AsString <> '' then
  emailjefe := emailjefe + sqlgeneral.fieldbyname('email1').AsString+',';
 sqlgeneral.Next;
end;
delete(emailjefe,length(emailjefe),1);

if chkresuelto.Checked then
 resuelto := '1'
else
 resuelto := '0';

if chkauditado.Checked then
 auditado := '1'
else
 auditado := '0';

if btnalta.Caption = '&Guardar' then
 begin
  if application.MessageBox('Para poder crear una orden de servicio debe de guardarse el travel,desea que sea guardado?','Pregunta',mb_yesno+mb_iconquestion)=idyes then
    begin
     querys('insert into travel(idtravel,idcliente,idasunto,idfuente,idqueja,iddptorecive,iddptoa,idusrrecive,idusra,idmagnitud,FechaRecive,HoraRecive,resuelto,auditado,idusraudito,FechaAudito,comunico,ComunicoOtro,descripcion,accion) values ('+
     edNumTravel.Text+','+edcvecte.Text+','+inttostr(cboasunto.Tag)+','+inttostr(cbofuente.Tag)+','+inttostr(cboquejas.Tag)+','+inttostr(cboAreaRecive.Tag)+','+inttostr(cboAreaDestino.Tag)+','+edcve_usrrec.text+','+edcve_vend.Text+','+inttostr(cbomagnitud.Tag)+','+quotedstr(edFechaRec.Text)+','+
     quotedstr(edHoraRec.Text)+','+resuelto+','+auditado+','+inttostr(cboaudito.Tag)+','+quotedstr(edfechaaudito.Text)+','+inttostr(rgcomunico.ItemIndex)+','+quotedstr(edComotro.Text)+','+quotedstr(requeja.Text)+','+quotedstr(reaccion.Text)+')',1,sqlgeneral);
     body.Lines.Clear;
     body.Lines.Add(ednom_usrrec.Text+' Creo el travel #'+ednumtravel.Text+' a la cuenta '+edcvecte.Text+ ' de ' + ednomcte.Text);
     body.Lines.Add('Quejandose por lo siguiente:');
     body.Lines.Add('                                            ');
     body.Lines.Add(requeja.Text);
     frmprincipal.mmdatos.Clear;
     //comentado por edwin para que no envie correos haciendo pruebas
    { if send_email(emailusr,emailusr,emailjefe+','+emailusr,'Traveler nuevo. cuenta '+edcvecte.Text+' '+ednomcte.Text,frmprincipal.mmdatos,body,1) = 1 then
      application.MessageBox('No se pudo enviar email a la persona encargada de este Traveler','Aviso',mb_iconinformation);}
    end;
   hija := Tfrmservicios.Create(self);
   hija.inicializa(edcvecte.Text,true,edNumTravel.text);
   hija.Show;
   end;
if btnmodificar.Caption = '&Guardar' then
  begin
  hija := Tfrmservicios.Create(self);
  hija.inicializa(edcvecte.Text,true,edNumTravel.text);
  hija.Show;
  end;
end;

procedure Tfrmtravel.chkresueltoClick(Sender: TObject);
begin
if (chkresuelto.Checked)and(btnmodificar.Caption = '&Guardar') then
 begin
  if (cboAreaDestino.Text='')or(cbonom_vend.Text='')or(cbofuente.Text='')or(cboasunto.Text='')or(cboquejas.Text='')or(cbomagnitud.Text='') then
   begin
    application.MessageBox('Debe de llenar todos los campos para poder indicar que ya resolvio el travel','Aviso',mb_iconinformation);
    cboestatus.ItemIndex := 0;
    chkresuelto.Checked := false;
   end;
  end;
end;

procedure Tfrmtravel.dbnavegadorButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
if sqltravel.RecordCount > 0 then
TraeDatosTravel(sqltravel.fieldbyname('idtravel').AsString);
end;

procedure Tfrmtravel.pcprincipalTabClick(Sender: TObject);
begin
//if((btnmodificar.Caption = '&Editar') and (btnalta.Caption = '&Alta') and (btnalta.Visible = true)) then
if pcprincipal.TabIndex = 1 then
 begin
// pcprincipal.ActivePageIndex := 0;
 cboFiltraArea.Enabled := false;
 pfiltro.Enabled := false;
 end
else
 begin
 //pcprincipal.ActivePageIndex := 1;
  cboFiltraArea.Enabled := true;
  pfiltro.Enabled := true;
 end;

end;

procedure Tfrmtravel.cboestatusNotInList(Sender: TObject);
begin
cboestatus.ItemIndex := 0;
end;

procedure Tfrmtravel.cboestatusClick(Sender: TObject);
begin
if cboestatus.Text <> '' then
 begin
  //verifica el nuevo estatus
  querys('SELECT finaliza FROM TipoServicios INNER JOIN EstatusServicios ON (TipoServicios.idserv = EstatusServicios.idserv) WHERE TipoServicios.nombre = ''TRAVEL'' and EstatusServicios.nombre ='+quotedstr(cboestatus.Text),0,sqlgeneral);
   if sqlgeneral.FieldByName('finaliza').AsInteger = 1 then
    chkresuelto.Checked := true
   else
    chkresuelto.Checked := false;
 end;
end;

procedure Tfrmtravel.CboFiltraAreaNotInList(Sender: TObject);
begin
CboFiltraArea.Text := 'TODOS';
querys('Select t.idtravel, c.idcliente, '+ClienteNombre('c')+' AS Cliente, '+UsuarioNombre('u')+' AS Usuario, '+
       'a.nombre AS Depto, t.FechaRecive, t.HoraRecive, t.descripcion, m.nombre AS Magnitud, q.nombre AS Queja, '+
       'an.nombre AS Asunto, if(t.resuelto = 1,''Si'',''No'') as Resuelto, if(t.auditado = 1,''Si'',''No'') as Auditado, '+
       'idservicio, f.nombre as Fuente '+
       'From travel t left Join clientes c ON t.idcliente = c.idcliente left Join usuarios u ON t.idusra = u.idusuario '+
       'left Join areas a ON t.iddptoa = a.idarea left Join magnitudes m ON t.idmagnitud = m.idmagnitud '+
       'left Join quejas q ON t.idqueja = q.idqueja left Join asuntos an ON t.idasunto = a.idasunto '+
       'left join fuentes f on f.idfuente=t.idfuente '+
       'order by t.idtravel',0,sqltravel);
end;

procedure Tfrmtravel.CboFiltraAreaKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;


procedure Tfrmtravel.btnaltaClick(Sender: TObject);
  var resuelto,auditado:string;//,emailusr,emailusr2,emailjefe,mailtravel
   ban:boolean;  key:char;
begin
if btnAlta.Caption = '&Alta' then
  begin
  btnalta.Caption := '&Guardar';
  btncancelar.Caption := '&Cancelar';
  btnmodificar.Enabled := false;

  sqltravel.Close;
  tstabla.TabEnabled := false;
  tsficha.TabEnabled := true;
  tsficha.enabled := true;
  pcprincipal.ActivePageIndex := 1;
  Limpia;
  edcvecte.Enabled := true;
  edcve_vend.Enabled := true;
  cbonom_vend.Enabled := true;
  cboasunto.Enabled := true;
  cbofuente.Enabled := true;
  cboarearecive.Enabled := true;
  cboAreaDestino.Enabled := true;
  cboquejas.Enabled := true;
  cbomagnitud.Enabled := true;
  chkauditado.Enabled := false;
  requeja.Enabled := true;
  reaccion.Enabled := true;
  cboestatus.Enabled := true;
  rgcomunico.Enabled := true;
  cboaudito.Enabled := true;

  if frmautentificacion.ShowModal = mrok then
    begin
    querys('select idusuario, '+UsuarioNombre('u')+' as Nombre, a.nombre as area, a.idarea from usuarios u '+
           'inner join UCTabUsers uc on u.idusuario = uc.UCidUser '+
           ' inner join areas a on u.idarea = a.idarea '+
           'where uc.UCLogin ='+quotedstr(frmautentificacion.edusuario.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
      begin
      application.MessageBox('No tiene asignada una area y no podra crear un travel, consulte a su administrador de sistema','Aviso',mb_iconinformation);
      HabilitaTabla;
      exit;
      end;
    edcve_usrrec.Text := sqlgeneral.fieldbyname('idusuario').AsString;
    ednom_usrrec.Text := sqlgeneral.fieldbyname('nombre').AsString;
    cboAreaRecive.Text := sqlgeneral.fieldbyname('area').AsString;
    cboarearecive.Tag := sqlgeneral.fieldbyname('idarea').AsInteger;
    cboestatus.ItemIndex := 0;
    cbomagnitud.ItemIndex := 0;
    edfecharec.Text := datetostr(FechaServidor);
    edhorarec.Text := timetostr(HoraServidor);
    querys('select max(idtravel) as id from travel',0,sqlgeneral);
    edNumTravel.Text := inttostr(sqlgeneral.fieldbyname('id').AsInteger+1);
     cboAltaTravel.ItemIndex := 1;
     cboAltaTravel.SetFocus;
    edNumTravel.Enabled := false;
    end
  else
    begin
    HabilitaTabla;
    btncancelar.Click;
    end;
  end
else
  begin  //Grabar
  if validaguardar = false then
    exit;

  //////ALTA
  if btnalta.Caption = '&Guardar' then
    begin
    if application.MessageBox('Todos los datos capturados estan correctos ya que algunos de estos no podran ser modificados despues?','Pregunta',mb_iconquestion+mb_yesno)=idno then
      exit
    else
      begin
      insertatravel(resuelto, auditado);
      if Application.MessageBox('¿Deseas generar el travel a alguien mas?', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
         begin
         with frmbusquedas do
            begin
            query := 'Select u.idusuario, u.codigo, '+UsuarioNombre('u')+' as nombre, a.nombre as Area, p.nombre as '+
                     'Puesto,if(u.estatus = 0, "INACTIVO", "ACTIVO") as estatus From usuarios u left join areas a on '+
                     'a.idarea=u.idarea left join puestos p on p.idpuesto=u.idpuesto order by idusuario';
            campo_retorno:='idusuario';
            campo_busqueda:='nombre';
            tblorigen := 'usuarios';
            ShowModal;
            if resultado <> '' then
              begin
              Edcve_vend.Text := resultado;
              key := #13;
              Edcve_vend.OnKeyPress(self, key);
              querys('Select a.nombre, a.idarea from areas a left join usuarios u on u.idarea=a.idarea where idusuario = '+resultado, 0, sqlgeneral);
              cboAreaDestino.Text := sqlgeneral.fieldbyname('nombre').AsString;
              cboAreaDestino.Tag := sqlgeneral.fieldbyname('idarea').AsInteger;
              rep:=true;
              btnalta.OnClick(self);
              ban:=false;

              end;
            end;
          end
        else
          begin
          ban := true;
          end;
      //until ban = true;
      end;
    end;

  Limpia;
  tstabla.TabEnabled := true;
  pcprincipal.Pages[1].Enabled := false;
  sqltravel.Close;
  sqltravel.Open;
  edNumTravel.Enabled := true;
  edcvecte.Enabled := true;
  edcve_vend.Enabled := true;
  cbonom_vend.Enabled := true;
  cboasunto.Enabled := true;
  cbofuente.Enabled := true;
  cboarearecive.Enabled := true;
  cboAreaDestino.Enabled := true;
  cboquejas.Enabled := true;
  cbomagnitud.Enabled := true;
  cboestatus.Enabled := true;
  rgcomunico.Enabled := true;
  cboaudito.Enabled := true;
  pfiltro.Enabled := true;
  btnalta.Caption := '&Alta';
  btnmodificar.Caption := '&Editar';
  btncancelar.caption := '&Cerrar';
  end;
end;

procedure Tfrmtravel.btnmodificarClick(Sender: TObject);
  var resuelto,auditado,emailusr,emailusr2,emailjefe:string;
begin
if btnmodificar.Caption = '&Editar' then
  begin
  btnalta.Enabled := false;
  btnmodificar.Caption := '&Guardar';
  btncancelar.caption := '&Cancelar';
  tstabla.TabEnabled := false;
  tsficha.Enabled := true;
  tsficha.TabEnabled := true;
  btnimprimir.enabled := false;
  querys('select audittravel, p.nombre as puesto, a.nombre as area, u.idusuario '+
         'from usuarios u inner join puestos p on u.idpuesto = p.idpuesto '+
         'inner join areas a on a.idarea = u.idarea where u.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  if (sqlgeneral.fieldbyname('idusuario').asstring <> edcve_vend.Text)and(DerechosSys('Auditor de Traveler') = true) then
    begin
    edcve_vend.Enabled := false;
    cbonom_vend.Enabled := false;
    cboasunto.Enabled := false;
    cbofuente.Enabled := false;
    cboarearecive.Enabled := false;
    cboAreaDestino.Enabled := false;
    cboquejas.Enabled := false;
    cbomagnitud.Enabled := false;
    chkauditado.Enabled := false;
    requeja.Enabled := false;
    reaccion.Enabled := false;
    cboestatus.Enabled := false;
    rgcomunico.Enabled := false;
    cboaudito.Enabled := false;
    end
  else
    begin
    edcve_vend.Enabled := true;
    cbonom_vend.Enabled := true;
    cboasunto.Enabled := true;
    cbofuente.Enabled := true;
    cboarearecive.Enabled := true;
    cboAreaDestino.Enabled := true;
    cboquejas.Enabled := true;
    cbomagnitud.Enabled := true;
    chkauditado.Enabled := true;
    requeja.Enabled := true;
    reaccion.Enabled := true;
    cboestatus.Enabled := true;
    rgcomunico.Enabled := true;
    cboaudito.Enabled := true;
    cbomagnitud.Enabled := true;
    end;

  //para cuando el usuario actual es un auditor
  if DerechosSys('Auditor de Traveler') = true then
    begin
    chkauditado.Enabled := true;
    cboaudito.Enabled := true;
    reaccion.Enabled := true;
    cboestatus.Enabled := true;
    mmComentarioAuditor.Enabled := true;
    cboProblemaCausa.Enabled := true;
    cbomagnitud.Enabled := true;
    end
  else
    begin
    chkauditado.Enabled := false;
    cboaudito.Enabled := false;
    mmComentarioAuditor.Enabled := false;
    cboProblemaCausa.Enabled := false;
    end;

  //para cuando el usuario actual es un gerente de area
  if (sqlgeneral.fieldbyname('puesto').asstring='GERENTE') and (sqlgeneral.fieldbyname('area').asstring = cboareadestino.Text) then
    begin
    CargaCombo('SELECT usuarios.idusuario, '+UsuarioNombre('usuarios')+' AS Nombre FROM usuarios LEFT JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
               ' left join areas on areas.idarea=usuarios.idarea WHERE  usuarios.estatus = 1 and areas.nombre="'+cboAreaDestino.text+'" order by usuarios.nombre','usuarios en esta area',cboNom_Vend);
  
    cbonom_vend.Enabled := true;
    cboestatus.Enabled := true;
    cbomagnitud.Enabled := true;
    reaccion.Enabled := true;
    end;

  if (edcvecte.Text = '') and (sqltravel.RecordCount > 0) then
    TraeDatosTravel(sqltravel.fieldbyname('idtravel').AsString);
  sqltravel.Close;
  end
else
  begin //                 ^^^^^^^  GUARDAR  ^^^^^^^
  if validaguardar = false then
    exit;

  if chkresuelto.Checked then
    resuelto := '1'
  else
    resuelto := '0';

  if chkauditado.Checked then
    auditado := '1'
  else
    auditado := '0';

  //saca el correo de quien origina el correo
  querys('select email2,email1,'+usuarionombre('usuarios')+' as Nombre  from usuarios where idusuario='+edcve_usrrec.Text,0,sqlgeneral);
  if (sqlgeneral.fieldbyname('email1').AsString = '') and (sqlgeneral.fieldbyname('email2').AsString = '') then
    begin
    application.MessageBox(pchar('El Usuario con nombre '+sqlgeneral.FieldByName('nombre').Asstring+' no se le ha capturado email, favor de ir a la pantalla usuarios y capturelo'),'Aviso',mb_iconwarning);
    querys('Select valor from configuraciones where concepto = ''UserEmailInterno''', 0, sqlgeneral);
    emailusr:=sqlgeneral.fieldbyname('valor').AsString;
    end
  else
    begin
    if sqlgeneral.fieldbyname('email1').AsString <> '' then
      emailusr:=sqlgeneral.fieldbyname('email1').AsString
    else
      emailusr:=sqlgeneral.fieldbyname('email2').AsString;
    end;

  //saca el correo de a quien contestar
  querys('select email2,email1,concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'''')) as Nombre  '+
         'from usuarios where idusuario='+edcve_vend.Text,0,sqlgeneral);
  if (sqlgeneral.fieldbyname('email1').AsString = '') and (sqlgeneral.fieldbyname('email2').AsString = '') then
    begin
    application.MessageBox(pchar('El Usuario con nombre '+sqlgeneral.FieldByName('nombre').Asstring+' no se le ha capturado email, favor de ir a la pantalla usuarios y capturelo'),'Aviso',mb_iconwarning);
    querys('Select valor from configuraciones where concepto = ''UserEmailInterno''', 0, sqlgeneral);
    emailusr2:=sqlgeneral.fieldbyname('valor').AsString;
    end
  else
    begin
    if sqlgeneral.fieldbyname('email1').AsString <> '' then
      emailusr2:=sqlgeneral.fieldbyname('email1').AsString
    else
      emailusr2:=sqlgeneral.fieldbyname('email2').AsString;
    end;

  querys('select usuarios.email1 from usuarios inner join puestos on puestos.idpuesto = usuarios.idpuesto '+
         'inner join areas on areas.idarea = usuarios.idarea where areas.nombre='+quotedstr(cboAreadestino.Text)+' '+
         'and  puestos.nombre=''GERENTE'' and usuarios.estatus=1',0,sqlgeneral);
  sqlgeneral.First;
  while not sqlgeneral.Eof do
    begin
    if sqlgeneral.fieldbyname('email1').AsString <> '' then
      emailjefe := emailjefe + sqlgeneral.fieldbyname('email1').AsString+',';
    sqlgeneral.Next;
    end;
  delete(emailjefe,length(emailjefe),1);

  /////////EDITAR
  if btnmodificar.Caption = '&Guardar' then
    begin
    if (chkauditado.Checked) and (cboaudito.Text = '') then
      begin
      application.MessageBox('Debe indicar el usuario que esta auditando el travel','Aviso',mb_iconinformation);
      cboaudito.SetFocus;
      exit;
      end;

    if (reaccion.Text = '')and(chkauditado.Checked) then
      begin
      application.MessageBox('Debe introducir la descripcion del problema','Aviso',mb_iconinformation);
      requeja.SetFocus;
      exit;
      end;

    querys('select auditado, resuelto from travel where idtravel='+edNumTravel.Text,0,sqlgeneral);
    if (sqlgeneral.FieldByName('resuelto').AsInteger = 0) and (chkresuelto.Checked) then
      begin
      body.Lines.Clear;
      body.Lines.Add(cbonom_vend.Text+' Cerro el travel #'+ednumtravel.Text+' de la cuenta '+edcvecte.Text+ ' de ' + ednomcte.Text);
      body.Lines.Add('Con la siguiente resolucion:');
      body.Lines.Add('                                            ');
      body.Lines.Add(reaccion.Text);
      frmprincipal.mmdatos.Text := '';

      querys('select EmailTravel from areas where idarea='+inttostr(cboAreaDestino.tag),0,sqlgeneral);
      emailjefe := emailjefe+','+sqlgeneral.fieldbyname('EmailTravel').AsString;
         //comentado por edwin para que no envie correos haciendo pruebas
      if send_email(emailusr,emailusr2,emailjefe+','+emailusr,'Se ha resuelto un traveler. cuenta #'+edcvecte.Text+' '+ednomcte.Text,frmprincipal.mmdatos,body,1) = 1 then
        application.MessageBox('No se pudo enviar email a la persona encargada de este Traveler','Aviso',mb_iconinformation);

      end;

    //Cambio de usuario al que se dirige
    if (frmprincipal.PuestoUsuario='GERENTE') and (frmprincipal.AreaUsuario = cboareadestino.Text) and (btnmodificar.Caption = '&Guardar') then
      begin
      querys('update travel set idusra = '+Edcve_vend.Text+' where idtravel = '+edNumTravel.Text,1,sqlgeneral);
      body.Lines.Clear;
      body.Lines.Add(ednom_usrrec.Text+' Creo el travel #'+ednumtravel.Text+' a la cuenta '+edcvecte.Text+ ' de ' + ednomcte.Text);
      body.Lines.Add('Elaborado por el area '+cboarearecive.Text+' y Dirigido al area '+cboareadestino.Text+' al trabajador con nombre '+cbonom_vend.Text);
      body.Lines.Add('Quejandose por lo siguiente:');
      body.Lines.Add('                                            ');
      body.Lines.Add(requeja.Text);
      frmprincipal.mmdatos.Clear;
      if emailjefe='' then
        emailjefe := emailusr;
      //origen, contestar, address, asunto
      {  //comentado por edwin para que no envie correos haciendo pruebas
      if send_email(emailusr,emailusr2,emailjefe+','+emailusr2+','+mailtravel,'Traveler nuevo. cuenta '+edcvecte.Text+' '+ednomcte.Text,frmprincipal.mmdatos,body,1) = 1 then
        application.MessageBox('No se pudo enviar email a la persona encargada de este Traveler','Aviso',mb_iconinformation);}
      end;
    if(edcvecte.Text = '') then edcvecte.Text := '0';
    querys('update travel set auditado='+auditado+',idusraudito='+inttostr(cboaudito.Tag)+',FechaAudito='+quotedstr(edFechaAudito.Text)+',HoraAudito='+quotedstr(edHoraAudito.Text)+',comunico='+inttostr(rgcomunico.ItemIndex)+',ComunicoOtro='+quotedstr(edComOtro.Text)+
           ',resuelto='+resuelto+',descripcion='+quotedstr(requeja.Text)+',accion='+quotedstr(reaccion.Text)+',idestatus='+inttostr(cboestatus.itemindex+1)+',idmagnitud='+inttostr(cbomagnitud.Tag)+',iddptoa='+inttostr(cboareadestino.Tag)+',nuevo=0,idqueja='+inttostr(cboquejas.tag)+',idasunto='+inttostr(cboasunto.Tag)+',solicitante='+IntToStr(cboAltaTravel.ItemIndex)+',nombre="'+edNomCte.Text+'",telefono="'+edtelefono.Text+'",ComentariosAuditor="'+mmComentarioAuditor.Text+'",idProblemaCausa='+IntToStr(cboProblemaCausa.ItemIndex)+' where idtravel = '+edNumTravel.Text,1,sqlgeneral);

    end;

  Limpia;
  tstabla.TabEnabled := true;
  pcprincipal.Pages[1].Enabled := false;
  sqltravel.Close;
  sqltravel.Open;
  edNumTravel.Enabled := true;
  edcvecte.Enabled := true;
  edcve_vend.Enabled := true;
  cbonom_vend.Enabled := true;
  cboasunto.Enabled := true;
  cbofuente.Enabled := true;
  cboarearecive.Enabled := true;
  cboAreaDestino.Enabled := true;
  cboquejas.Enabled := true;
  cbomagnitud.Enabled := true;
  cboestatus.Enabled := true;
  rgcomunico.Enabled := true;
  cboaudito.Enabled := true;
  pfiltro.Enabled := true;

  btnalta.Enabled := true;
  btnmodificar.Caption := '&Editar';
  btncancelar.caption := '&Cerrar';
  end;
end;

procedure Tfrmtravel.TBBorrarClick(Sender: TObject);
begin

querys('Select t.idtravel,c.idcliente,'+clientenombre('c')+' AS Cliente , '+UsuarioNombre('u2')+' as QuienAudito, '+
       UsuarioNombre('u1')+' as VaDirijido, '+
       'a.nombre AS DeptoRecibe,a2.nombre as DeptoDestino,t.FechaRecive,t.HoraRecive,t.descripcion,m.nombre AS Magnitud,q.nombre as NombreQueja,ori.nombre as Fuente,t.HoraAudito , '+
       ' if(travel.resuelto=1,''Si'',''No'') AS Resuelto,if(travel.auditado=1,''Si'',''No'') AS Auditado,concat(if(u3.nombre <> '''' or u3.nombre is not null,u3.nombre,''''),'' '',if(u3.apaterno <> '''' or u3.apaterno is not null '+
       ',u3.apaterno,'''') ,'' '' ,if(u3.amaterno <> '''' or u3.amaterno is not null,u3.amaterno,'''') ) as QuienNotifica,if (comunico =0,''Telefono'',if(comunico=1,''Correo'',if(comunico=2,''Personalmente'',if(comunico=3,''Otro'',''SIN CLASIFICAR''  ))) ) as Comunico, '+
       'travel.ComunicoOtro,accion,travel.FechaAudito,  travel.accion,asuntos.nombre as asunto,E1.nombre as estatus,travel.idqueja From travel '+
       ' Inner Join clientes ON travel.idcliente = clientes.idcliente LEFT Join usuarios as u1 ON (travel.idusra = u1.idusuario) '+
       'LEFT JOIN usuarios as u2 ON (travel.idusraudito = u2.idusuario) LEFT JOIN usuarios as u3 ON (travel.idusrrecive = u3.idusuario) LEFT Join areas ON travel.iddptoa = areas.idarea LEFT Join areas as areas2 ON travel.iddptorecive = areas2.idarea '+
       'LEFT Join  magnitudes ON travel.idmagnitud = magnitudes.idmagnitud LEFT Join quejas ON travel.idqueja = quejas.idqueja LEFT Join asuntos ON travel.idasunto = asuntos.idasunto LEFT JOIN origen  as ori ON (ori.idorigen=travel.idfuente) '+
       'LEFT JOIN EstatusServicios E1 ON (E1.orden=travel.idestatus) LEFT JOIN TipoServicios ON (TipoServicios.idserv = E1.idserv ) where idtravel='+edNumTravel.Text+' AND TipoServicios.nombre = ''TRAVEL'' ',0,dmreportes.sqlgeneral);

  dmreportes.ppReport.Template.DatabaseSettings.Name := 'Traveler';
  dmreportes.ppReport.Template.LoadFromDatabase;
  dmreportes.ppReport.Template.SaveToDatabase;
  dmreportes.ppReport.Print;


end;

procedure Tfrmtravel.btncancelarClick(Sender: TObject);
begin
if btncancelar.caption = '&Cancelar' then
  begin
  btncancelar.Caption := '&Cerrar';
  btnalta.Caption := '&Alta';
  btnmodificar.Caption := '&Editar';
  btnalta.enabled :=true;
  btnmodificar.enabled := true;
  tsficha.Enabled := false;
  tstabla.TabEnabled := true;
  pcprincipal.ActivePageIndex := 0;
  sqltravel.Close;
  sqltravel.open;
  requeja.text := '';
  reaccion.text := '';
  pfiltro.Enabled := true;
  end
else
  Close;
end;

function Tfrmtravel.validaguardar:boolean;
begin
result := false;
  if edcve_vend.Text = '' then
    begin
    application.MessageBox('No podra guardar este travel hasta que no especifique el usuario al que va dirigido el travel!','Aviso',mb_iconinformation);
    exit;
    end;

  if cbomagnitud.Text = '' then
    begin
    application.MessageBox('No podra guardar este travel hasta que no especifique la Magnitud!','Aviso',mb_iconinformation);
    exit;
    end;

  if cbofuente.Text = '' then
    begin
    application.MessageBox('No podra guardar este travel hasta que no especifique la Fuente!','Aviso',mb_iconinformation);
    exit;
    end;

  

  if((cboAltaTravel.ItemIndex <> 3 ) and (edcvecte.Text = '')) then
   begin
    application.MessageBox('No podra guardar este travel hasta que no especifique a quien!','Aviso',mb_iconinformation);
    edcvecte.SetFocus;
    exit;
   end;
   if((cboAltaTravel.ItemIndex = 3 ) and (edNomCte.Text = '')) then
   begin
    application.MessageBox('No podra guardar este travel hasta que no especifique a quien!','Aviso',mb_iconinformation);
    edNomCte.SetFocus;
    exit;
   end;

  if (chkauditado.Checked)and(cboaudito.Text='') then
    begin
    application.MessageBox('Debe indicar quien audito este travel','Aviso',mb_iconinformation);
    exit;
    end;

  if requeja.Text = '' then
    begin
    application.MessageBox('Debe introducir la descripcion del problema','Aviso',mb_iconinformation);
    requeja.SetFocus;
    exit;
    end;

  if (chkresuelto.Checked)and((requeja.Text = '')or(reaccion.Text = '')) then
    begin
    application.MessageBox(pchar('Para definir el estatus '+cboestatus.Text+' debe de indicar el problema y la accion tomada'),'Aviso',mb_iconinformation);
    exit;
    end;

  if cboasunto.text = '' then //(cboasunto.Tag = 0) or (cboasunto.itemindex = -1) then
    begin
    application.MessageBox('Debe de indicar el Asunto','Aviso',mb_iconinformation);
    exit;
    end;

  if cboquejas.Tag = 0 then
    begin
    application.MessageBox('Debe de indicar el SubAsunto','Aviso',mb_iconinformation);
    exit;
    end;

  if (chkauditado.checked = true) and (cboestatus.Text = 'FINALIZADO') and (cboProblemaCausa.Text = 'SIN CLASIFICAR') then
    begin
    application.MessageBox('Debe indicar el probelma - causa','Aviso',mb_iconinformation);
    exit;
    end;
result := true;
end;

procedure Tfrmtravel.btnfiltrarClick(Sender: TObject);
begin
filtrar;
end;

procedure Tfrmtravel.filtrar;
var cadena:string;
begin
cadena := 'Select t.idtravel,t.idcliente,t.nombre AS Cliente, '+UsuarioNombre('u')+' AS Usuario,a.nombre AS Depto, '+
          't.FechaRecive,t.HoraRecive,t.descripcion,m.nombre AS Magnitud,q.nombre AS Queja,at.nombre AS Asunto, '+
          'if(t.resuelto = 1,"Si","No") as Resuelto,if(t.auditado = 1,"Si","No") as Auditado,idservicio, f.nombre as Fuente '+
          'From travel t left Join usuarios u ON t.idusra = u.idusuario left Join areas a ON t.iddptoa = a.idarea '+
          'left Join magnitudes m ON t.idmagnitud = m.idmagnitud left Join quejas q ON t.idqueja = q.idqueja '+
          'left Join asuntos at ON t.idasunto = at.idasunto left join fuentes f on f.idfuente=t.idfuente where idtravel <> 0 ';

if chkPeriodo.Checked then
  cadena := cadena+ 'and FechaRecive between "'+datetostr(dtdesde.Date)+'" and "'+datetostr(dthasta.Date)+'" ';

if CboFiltraArea.Text <> 'TODOS' then
  cadena := cadena +'and a.nombre='+quotedstr(CboFiltraArea.Text);

if cbusuario.Text <> 'TODOS' then
  cadena := cadena +'and '+UsuarioNombre('u')+' = "'+cbusuario.text+'" ';

case cbestatus.ItemIndex of
  1: // SIN RESOLVER
    cadena := cadena +' and resuelto = 0 ';
  2: //RESUELTOS NO AUDITADO
    cadena:=cadena+' and resuelto=1 and auditado=0';
  3: // RESUELTOS
    cadena := cadena +' and resuelto = 1';
  4: // AUDITADOS
    cadena := cadena +' and auditado = 1 ';
  end;
  querys(cadena+ ' order by depto, resuelto', 0, sqltravel);

end;

procedure Tfrmtravel.RzBitBtn1Click(Sender: TObject);
var cadena:string;
begin
cadena := 'Select t.idtravel,t.idcliente,t.nombre AS Cliente, '+UsuarioNombre('u')+' AS Usuario, '+
          'a.nombre AS Depto, t.FechaRecive, t.HoraRecive, t.descripcion, m.nombre AS Magnitud, q.nombre AS Queja, '+
          'asu.nombre AS Asunto, if(t.resuelto = 1,"Si","No") as Resuelto, if(t.auditado = 1, "Si", "No") as Auditado, '+
          'idservicio From travel as t left Join usuarios as u ON '+
          't.idusra = u.idusuario left Join areas as a ON t.iddptoa = a.idarea left Join magnitudes as m ON t.idmagnitud '+
          '= m.idmagnitud left Join quejas as q ON t.idqueja = q.idqueja '+
          'left Join asuntos as asu ON t.idasunto = asu.idasunto where idtravel <> 0 ';

if chkPeriodo.Checked then
  cadena := cadena+ 'and FechaRecive between "'+datetostr(dtdesde.Date)+'" and "'+datetostr(dthasta.Date)+'" ';

if CboFiltraArea.Text <> 'TODOS' then
  cadena := cadena +'and a.nombre='+quotedstr(CboFiltraArea.Text);

if cbusuario.Text <> 'TODOS' then
  cadena := cadena +'and '+UsuarioNombre('u')+' = "'+cbusuario.text+'" ';

case cbestatus.ItemIndex of
  1: // SIN RESOLVER
    cadena := cadena +' and resuelto = 0 ';
  2: // RESUELTOS
    cadena := cadena +' and resuelto = 1 ';
  3: // AUDITADOS
    cadena := cadena +' and auditado = 1 ';
  end;
  querys(cadena+ ' order by depto, resuelto', 0, dmreportes.sqlgeneral);
operacionreporte('TravelRejilla', '', 'IMP',1);
end;

procedure Tfrmtravel.CboFiltraAreaChange(Sender: TObject);
begin

if CboFiltraArea.Text <> 'TODOS' then
   cargacombo2('Select idusuario, '+UsuarioNombre('u')+' as nombre from usuarios as u inner join areas as a on (a.idarea=u.idarea) where u.estatus = 1 and a.nombre = "'+CboFiltraArea.Text+'"  order by u.nombre', 'nombre', 'idusuario', cbusuario)
else
   cargacombo2('Select idusuario, '+UsuarioNombre('u')+' as nombre from usuarios as u where estatus = 1', 'nombre', 'idusuario', cbusuario);

cbusuario.Items.Add('TODOS');
cbusuario.Text := 'TODOS';   
end;

procedure Tfrmtravel.btnImprimirClick(Sender: TObject);
begin

if(edNumTravel.Text <> '') then
begin
//querys('Select travel.idtravel,clientes.idcliente,if(clientes.rsocial='''' OR clientes.rsocial Is Null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) AS Cliente , '+
querys('Select travel.idtravel,travel.idcliente,travel.nombre AS Cliente , '+
       'concat(if(u2.nombre <> '''' or u2.nombre is not null,u2.nombre,''''),'' '',if(u2.apaterno <> '''' or u2.apaterno is not null,u2.apaterno,'''') ,'' '' ,if(u2.amaterno <> '''' or u2.amaterno is not null,u2.amaterno,'''') ) as QuienAudito, '+
       'concat(if(u1.nombre <> '''' or u1.nombre is not null,u1.nombre,''''),'' '',if(u1.apaterno <> '''' or u1.apaterno is not null,u1.apaterno,'' '') ,'' '' ,if(u1.amaterno <> '' '' or u1.amaterno is not null,u1.amaterno,'' '') ) as VaDirijido, '+
       'areas.nombre AS DeptoRecibe,areas2.nombre as DeptoDestino,travel.FechaRecive,travel.HoraRecive,travel.descripcion,magnitudes.nombre AS Magnitud,quejas.nombre as NombreQueja,ori.nombre as Fuente,travel.HoraAudito , '+
       ' if(travel.resuelto=1,''Si'',''No'') AS Resuelto,if(travel.auditado=1,''Si'',''No'') AS Auditado,concat(if(u3.nombre <> '''' or u3.nombre is not null,u3.nombre,''''),'' '',if(u3.apaterno <> '''' or u3.apaterno is not null '+
       ',u3.apaterno,'''') ,'' '' ,if(u3.amaterno <> '''' or u3.amaterno is not null,u3.amaterno,'''') ) as QuienNotifica,if (comunico =0,''Telefono'',if(comunico=1,''Correo'',if(comunico=2,''Personalmente'',if(comunico=3,''Otro'',''SIN CLASIFICAR''  ))) ) as Comunico, '+
       'travel.ComunicoOtro,accion,travel.FechaAudito,  travel.accion,asuntos.nombre as asunto,E1.nombre as estatus,travel.idqueja From travel '+
       'LEFT Join usuarios as u1 ON (travel.idusra = u1.idusuario) '+
       'LEFT JOIN usuarios as u2 ON (travel.idusraudito = u2.idusuario) LEFT JOIN usuarios as u3 ON (travel.idusrrecive = u3.idusuario) LEFT Join areas ON travel.iddptoa = areas.idarea LEFT Join areas as areas2 ON travel.iddptorecive = areas2.idarea '+
       'LEFT Join  magnitudes ON travel.idmagnitud = magnitudes.idmagnitud LEFT Join quejas ON travel.idqueja = quejas.idqueja LEFT Join asuntos ON travel.idasunto = asuntos.idasunto LEFT JOIN origen  as ori ON (ori.idorigen=travel.idfuente) '+
       'LEFT JOIN EstatusServicios E1 ON (E1.orden=travel.idestatus) LEFT JOIN TipoServicios ON (TipoServicios.idserv = E1.idserv ) where idtravel='+edNumTravel.Text+' AND TipoServicios.nombre = ''TRAVEL'' ',0,dmreportes.sqlgeneral);

OperacionReporte('Traveler','','IMP',1);
end;
{  dmreportes.ppReport.Template.DatabaseSettings.Name := 'Traveler';
  dmreportes.ppReport.Template.LoadFromDatabase;
  dmreportes.ppReport.Template.SaveToDatabase;
  dmreportes.ppReport.Print; }

end;

procedure Tfrmtravel.cboAltaTravelChange(Sender: TObject);
begin
edcvecte.Enabled := true;
edNomCte.Enabled := true;
edcvecte.text := '';
edNomCte.text := '';
case cboAltaTravel.ItemIndex of
     0: begin
        lblBusqueda.Caption := 'Empleado';
        edcvecte.Enabled := false;
        edNomCte.Enabled := false;
        edcvecte.text := edcve_usrrec.Text;
        edNomCte.text := ednom_usrrec.Text;
        end;
     1: lblBusqueda.Caption := 'Cuenta';
     2: lblBusqueda.Caption := 'Proveedor';
     3: lblBusqueda.Caption := 'Otro';
end;

end;

procedure Tfrmtravel.cboAltaTravelKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  if(cboAltaTravel.ItemIndex <> 3) then
    edcvecte.SetFocus
  else
    edNomCte.SetFocus;

//  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmtravel.edNomCteKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
   edtelefono.SetFocus;
end;
end;

procedure Tfrmtravel.edtelefonoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
   cboAreaDestino.SetFocus;
end;
end;

procedure Tfrmtravel.cboestatusKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
   requeja.SetFocus;
end;
end;

procedure Tfrmtravel.insertatravel(resuelto, auditado:string);
var emailusr,emailusr2,emailjefe,mailtravel, envia:string;
begin
if chkresuelto.Checked then
    resuelto := '1'
  else
    resuelto := '0';

  if chkauditado.Checked then
    auditado := '1'
  else
    auditado := '0';

  //saca el correo de quien origina el correo
  querys('select email2, email1, '+UsuarioNombre('u')+' as Nombre from usuarios u where idusuario='+edcve_usrrec.Text,0,sqlgeneral);
  if (sqlgeneral.fieldbyname('email1').AsString = '') and (sqlgeneral.fieldbyname('email2').AsString = '') then
    begin
    application.MessageBox(pchar('El Usuario con nombre '+sqlgeneral.FieldByName('nombre').Asstring+' no se le ha capturado email, favor de ir a la pantalla usuarios y capturelo'),'Aviso',mb_iconwarning);
    querys('Select valor from configuraciones where concepto = ''UserEmailInterno''', 0, sqlgeneral);
    emailusr:=sqlgeneral.fieldbyname('valor').AsString;
    end
  else
    begin
    if sqlgeneral.fieldbyname('email1').AsString <> '' then
      emailusr:=sqlgeneral.fieldbyname('email1').AsString
    else
      emailusr:=sqlgeneral.fieldbyname('email2').AsString;
    end;

  //saca el correo de a quien contestar
  querys('select email2, email1, '+UsuarioNombre('u')+' as Nombre from usuarios u where idusuario='+edcve_vend.Text,0,sqlgeneral);
  if (sqlgeneral.fieldbyname('email1').AsString = '') and (sqlgeneral.fieldbyname('email2').AsString = '') then
    begin
    application.MessageBox(pchar('El Usuario con nombre '+sqlgeneral.FieldByName('nombre').Asstring+' no se le ha capturado email, favor de ir a la pantalla usuarios y capturelo'),'Aviso',mb_iconwarning);
    querys('Select valor from configuraciones where concepto = ''UserEmailInterno''', 0, sqlgeneral);
    emailusr2:=sqlgeneral.fieldbyname('valor').AsString;
    end
  else
    begin
    if sqlgeneral.fieldbyname('email1').AsString <> '' then
      emailusr2:=sqlgeneral.fieldbyname('email1').AsString
    else
      emailusr2:=sqlgeneral.fieldbyname('email2').AsString;
    end;

  querys('select usuarios.email1 from usuarios inner join puestos on puestos.idpuesto = usuarios.idpuesto '+
         'inner join areas on areas.idarea = usuarios.idarea where areas.nombre='+quotedstr(cboAreadestino.Text)+' '+
         'and  puestos.nombre=''GERENTE'' and usuarios.estatus=1',0,sqlgeneral);
  sqlgeneral.First;
  while not sqlgeneral.Eof do
    begin
    if sqlgeneral.fieldbyname('email1').AsString <> '' then
      emailjefe := emailjefe + sqlgeneral.fieldbyname('email1').AsString+',';
    sqlgeneral.Next;
    end;
  delete(emailjefe,length(emailjefe),1);

  //trae el ultimo idtravel
  querys('select max(idtravel) as id from travel',0,sqlgeneral);
  edNumTravel.Text := inttostr(sqlgeneral.fieldbyname('id').AsInteger+1);

  //trae el correo de los auditores
  querys('select EmailTravel from areas where idarea='+inttostr(cboAreaDestino.tag),0,sqlgeneral);
  mailtravel := sqlgeneral.fieldbyname('EmailTravel').AsString;

  //inserta en la tabla
  if edcvecte.Text = '' then
    edcvecte.Text := '0';

  querys('insert into travel(idtravel, idcliente, idasunto, idfuente, idqueja, iddptorecive, iddptoa, idusrrecive, '+
         'idusra, idmagnitud, FechaRecive, HoraRecive, resuelto, auditado, idusraudito, FechaAudito, comunico, '+
         'ComunicoOtro, descripcion, accion, solicitante, nombre, telefono, ComentariosAuditor, idProblemaCausa) '+
         'values ('+edNumTravel.Text+', '+edcvecte.Text+', '+inttostr(cboasunto.Tag)+', '+inttostr(cbofuente.Tag)+','+inttostr(cboquejas.Tag)+','+inttostr(cboAreaRecive.Tag)+','+inttostr(cboAreaDestino.Tag)+','+
      ''+edcve_usrrec.text+','+edcve_vend.Text+','+inttostr(cbomagnitud.Tag)+','+quotedstr(edFechaRec.Text)+','+quotedstr(edHoraRec.Text)+','+resuelto+','+auditado+','+inttostr(cboaudito.Tag)+','+quotedstr(edfechaaudito.Text)+', '+
      ' '+inttostr(rgcomunico.ItemIndex)+','+quotedstr(edComotro.Text)+','+quotedstr(requeja.Text)+','+quotedstr(reaccion.Text)+','+inttostr(cboAltaTravel.ItemIndex)+',"'+edNomCte.Text+'","'+edtelefono.Text+'","'+mmComentarioAuditor.Text+'",'+IntToStr(cboProblemaCausa.ItemIndex)+')',1,sqlgeneral);
      body.Lines.Clear;
      body.Lines.Add(ednom_usrrec.Text+' de la sucursal de ['+GetConfiguraciones('ciudad', true)+'] Creo el travel #'+ednumtravel.Text+' a la cuenta '+edcvecte.Text+ ' de ' + ednomcte.Text);
      body.Lines.Add('Elaborado por el area '+cboarearecive.Text+' y Dirigido al area '+cboareadestino.Text+' al trabajador con nombre '+cbonom_vend.Text);
      body.Lines.Add('Quejandose por lo siguiente:');
      body.Lines.Add('                                            ');
      body.Lines.Add(requeja.Text);
      frmprincipal.mmdatos.Clear;
      if emailjefe='' then
        emailjefe := emailusr;
      //origen, contestar, address, asunto
      //comentado por edwin para que no envie correos haciendo pruebas
      if rep = false then
        envia := emailjefe+','+emailusr2+','+mailtravel
      else
        envia := emailusr2;
      if send_email(emailusr,emailusr2,envia,'Traveler Nuevo cuenta '+edcvecte.Text+' '+ednomcte.Text,frmprincipal.mmdatos,body,1) = 1 then
        application.MessageBox('No se pudo enviar email a la persona encargada de este Traveler','Aviso',mb_iconinformation);
end;


procedure Tfrmtravel.btnenviarClick(Sender: TObject);
begin
if(edNumTravel.Text <> '') then
//querys('Select travel.idtravel,clientes.idcliente,if(clientes.rsocial='''' OR clientes.rsocial Is Null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) AS Cliente , '+
querys('Select travel.idtravel,travel.idcliente,travel.nombre AS Cliente , '+
       'concat(if(u2.nombre <> '''' or u2.nombre is not null,u2.nombre,''''),'' '',if(u2.apaterno <> '''' or u2.apaterno is not null,u2.apaterno,'''') ,'' '' ,if(u2.amaterno <> '''' or u2.amaterno is not null,u2.amaterno,'''') ) as QuienAudito, '+
       'concat(if(u1.nombre <> '''' or u1.nombre is not null,u1.nombre,''''),'' '',if(u1.apaterno <> '''' or u1.apaterno is not null,u1.apaterno,'' '') ,'' '' ,if(u1.amaterno <> '' '' or u1.amaterno is not null,u1.amaterno,'' '') ) as VaDirijido, '+
       'areas.nombre AS DeptoRecibe,areas2.nombre as DeptoDestino,travel.FechaRecive,travel.HoraRecive,travel.descripcion,magnitudes.nombre AS Magnitud,quejas.nombre as NombreQueja,ori.nombre as Fuente,travel.HoraAudito , '+
       ' if(travel.resuelto=1,''Si'',''No'') AS Resuelto,if(travel.auditado=1,''Si'',''No'') AS Auditado,concat(if(u3.nombre <> '''' or u3.nombre is not null,u3.nombre,''''),'' '',if(u3.apaterno <> '''' or u3.apaterno is not null '+
       ',u3.apaterno,'''') ,'' '' ,if(u3.amaterno <> '''' or u3.amaterno is not null,u3.amaterno,'''') ) as QuienNotifica,if (comunico =0,''Telefono'',if(comunico=1,''Correo'',if(comunico=2,''Personalmente'',if(comunico=3,''Otro'',''SIN CLASIFICAR''  ))) ) as Comunico, '+
       'travel.ComunicoOtro,accion,travel.FechaAudito,  travel.accion,asuntos.nombre as asunto,E1.nombre as estatus,travel.idqueja From travel '+
       'LEFT Join usuarios as u1 ON (travel.idusra = u1.idusuario) '+
       'LEFT JOIN usuarios as u2 ON (travel.idusraudito = u2.idusuario) LEFT JOIN usuarios as u3 ON (travel.idusrrecive = u3.idusuario) LEFT Join areas ON travel.iddptoa = areas.idarea LEFT Join areas as areas2 ON travel.iddptorecive = areas2.idarea '+
       'LEFT Join  magnitudes ON travel.idmagnitud = magnitudes.idmagnitud LEFT Join quejas ON travel.idqueja = quejas.idqueja LEFT Join asuntos ON travel.idasunto = asuntos.idasunto LEFT JOIN origen  as ori ON (ori.idorigen=travel.idfuente) '+
       'LEFT JOIN EstatusServicios E1 ON (E1.orden=travel.idestatus) LEFT JOIN TipoServicios ON (TipoServicios.idserv = E1.idserv ) where idtravel='+edNumTravel.Text+' AND TipoServicios.nombre = ''TRAVEL'' ',0,dmreportes.sqlgeneral);

if cboAltaTravel.Text = 'Proveedor' then
  OperacionReporte('Traveler','','PDF',1, 'P')
else
  OperacionReporte('Traveler','','PDF',1);


end;

End.


