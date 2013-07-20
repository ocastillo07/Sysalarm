{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
2009/06/05 dalyla inicializa de remi fact (#CFD #FE)
2009/05/19 dalyla no cobrar a cuentas con abogado
2009-03-30 Oscar modificacion en el procedure actualizar
2009/03/25 dalyla Todas las facturas deducibles
2009/03/19 dalyla bpcambios al cambiar el contrato anual
2009/02/12 Oscar modificacion en actualizar para que en el cambio del contrato a Anual
            se regrese a pedido los meses que tenga remison y que tengan cargos   
2008/12/19 dalyla Descomentar cuando se pague anual cambie contrato
2008/09/05 dalyla cancelacion de pagos de cuentas identificadas
2008/05/02 dalyla error en update
2008/04/28 dalyla no cambiar fecha de creacion de pedidos
2008/01/16 dalyla idcliente por idfact en recibo
2008/04/15 dalyla poder cancelar cobros de cuenta identificada
2008/04/.. dalyla Facturacion MX 
2008/02/28 dalyla zona horaria ok
2007/11/06 Calculo de saldo de la cuenta 10000
2007/11/02 Cambie FechaCreacion por FechaAlta y mov 2 en la asginacion de FechaCSI
2007/10/23 Procedure BuscarDescuentoVenta Complete el nombre de los meses
           de Octubre a Diciembre para aplicacion de descuento
2007/10/03 Procedure ComisionesVend;  2007/10/06   lo quite

}///////////////////////////////////////////////////////////////////////////////
unit Ucobros;
// ultima modificacion Dalila 18/Sep/2007
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, RzPanel, ExtCtrls,
  ComCtrls, ToolWin, DBCtrls, RzDBEdit, RzButton, DB, MyAccess, MemDS,
  DBAccess, RzDBLbl, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzSplit, RzCmboBx, RzRadChk, RzRadGrp, RzLine,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog,
  LMDCustomCheckListDlg, LMDCheckListDlg,StrUtils;

type
   TipoPago = Record
   inicial,banco : string;
   aplicaDescuento : integer;
   end;


  Tfrmcobros = class(TForm)
    panel1: TRzPanel;
    RzLabel2: TRzLabel;
    edbuscar: TRzButtonEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    DSpagos: TDataSource;
    DSparcialidades: TDataSource;
    sqlgeneral: TMyQuery;
    sqlparcialidades: TMyQuery;
    SPpanel: TRzSplitter;
    rgdocumentos: TRzGroupBox;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    lfecha_venta: TRzDBLabel;
    lfecha_vence: TRzDBLabel;
    lrestante: TRzDBLabel;
    DBparcialidades: TcxGrid;
    DBGVista1: TcxGridDBTableView;
    cxNotas: TcxGridDBColumn;
    cxidpago: TcxGridDBColumn;
    DBGLevel1: TcxGridLevel;
    dbmnotas: TRzDBRichEdit;
    gbventa: TRzGroupBox;
    lborden: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    lsaldo_venta: TRzLabel;
    edbuscarventa: TRzButtonEdit;
    edbuscarfactura: TRzButtonEdit;
    gbcliente: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    lnombre: TRzLabel;
    lsaldo_cliente: TRzLabel;
    gbcobro: TRzGroupBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    lcuenta: TRzLabel;
    edabono: TRzEdit;
    cboFormaPago: TRzComboBox;
    lcancelado: TRzLabel;
    cxCantidad: TcxGridDBColumn;
    leyenda: TRzLabel;
    Bevel2: TBevel;
    letreropagos: TRzLabel;
    mmpagos: TRzMemo;
    cbobancos: TRzComboBox;
    edcheque: TRzEdit;
    lbcheque: TRzLabel;
    lbbanco: TRzLabel;
    edtipocambio: TRzEdit;
    RzLabel24: TRzLabel;
    rgmoneda: TRzRadioGroup;
    ckpesos: TRzCheckBox;
    ckdolares: TRzCheckBox;
    RzLine1: TRzLine;
    lbcobro: TRzLabel;
    lbcobrodlls: TRzLabel;
    RzLabel10: TRzLabel;
    lsaldoparcialidad: TRzLabel;
    csFechaCorta: TcxGridDBColumn;
    SqlPagos: TMyQuery;
    dfecha: TRzDateTimeEdit;
    ednotas: TRzMemo;
    lbtitulo: TRzLabel;
    lbfecha: TRzLabel;
    btnFechaAplica: TRzBitBtn;
    RzLabel22: TRzLabel;
    lbsector: TRzLabel;
    btnimprimir: TRzBitBtn;
    btncobros: TRzBitBtn;
    chkDescuento: TRzCheckBox;
    ltotalCSI: TRzLabel;
    procedure edbuscarButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarChange(Sender: TObject);
    procedure ednotasEnter(Sender: TObject);
    procedure ednotasExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure edbuscarventaButtonClick(Sender: TObject);
    procedure edbuscarventaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGVista1DblClick(Sender: TObject);
    procedure edabonoKeyPress(Sender: TObject; var Key: Char);
    procedure dfechaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGVista1KeyPress(Sender: TObject; var Key: Char);
    procedure cboFormaPagoNotInList(Sender: TObject);
    procedure edbuscarfacturaButtonClick(Sender: TObject);
    procedure edbuscarfacturaKeyPress(Sender: TObject; var Key: Char);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure cboFormaPagoEnter(Sender: TObject);
    procedure ckdolaresClick(Sender: TObject);
    procedure ckpesosClick(Sender: TObject);
    procedure cbobancosNotInList(Sender: TObject);
    procedure edtipocambioKeyPress(Sender: TObject; var Key: Char);
    procedure edabonoExit(Sender: TObject);
    procedure cboFormaPagoExit(Sender: TObject);
    procedure cboFormaPagoChange(Sender: TObject);
    procedure edtipocambioChange(Sender: TObject);
    procedure btnFechaAplicaClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btncobrosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkDescuentoClick(Sender: TObject);
  private
    { Private declarations }
    pedidoCSI, remisionCSI, fechaCSI : string;
    totalCSI:double;
    procedure cargarcombo;
    procedure buscarsaldos;
    procedure ImpresionTipoCobro;
//    procedure ComisionesVend(cobro, anticipo:boolean);
  public
    { Public declarations }

    idpago,idremicion,abono,restacadena,nota,TipoP,cliente:string;
    //transaccion:sirve para identificar si fue un cobro, varios cobros  a un pago ó un pago x varios cobros
    unidadNegocio,saldado,ban,tipocobro,Transaccion,CambiarFecha,MasRem,
    CargoAutomatico,TipoMovimiento:integer;

    cobro,resta,pesos,DescCargoAuto,temporalPagoVenta:double;

    constructor inicializa(const tipo:integer;idventa:string);

    procedure imprimir;       
    procedure buscarbloqueado;
    procedure ImprimirFact(TipoFact:string);
    procedure ImprimirFactura;
    procedure ImprimirFacturaCD;
    procedure ImprimirFacturaMX;
    procedure BuscarDescuentoVta;
    procedure visiblepagos(c:integer);
    procedure mostrargrid;
    procedure actualizar(operacion:string);
    procedure buscarfacturalocate;
    procedure buscarventalocate;
    procedure limpiar;
    procedure buscarlocate;

    function estatus:integer;
    function validarpedido(const id:string):integer;
    function UsuarioImpFact:integer;
    function UsuarioFacturaCD:integer;
    function UsuarioFacturaMX:integer;
    //procedure BuscarVentas;
  end;

var
  frmcobros: Tfrmcobros;
  FechaAplica:Tdatetime;
  ArregloTipoPago: array of TipoPago;

implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal, Udmrep, URemiFac,
  UFechaAplicacion, UMensajeCliente, UfrmPagosDebe, Upedidos,
  Umesesremision;

{$R *.dfm}


constructor Tfrmcobros.inicializa(const tipo:integer;idventa:string);
begin
shortdateformat:='yyyy/mm/dd';
saldado:=0;
cobro:=0;
resta:=0;
pesos:=0;
Transaccion:=0;
tipocobro:=0;
TipoMovimiento := -1; // sin tipo movimiento

if tipo = 1 then  //si es un cobro caja.......
  begin
  ckpesos.Checked:=true;
  tipocobro:=1;
  btnalta.Enabled:= false;
  btnmodificar.Enabled:= false;
  edbuscarventa.Text:=idventa;
  buscarventalocate;
  lbtitulo.Caption:='Facturar En  Caja';
  FechaAplica:=FechaServidor;
  lbfecha.caption:=datetostr(FechaAplica);
  end;

if tipo = 3 then //si es un cobro caja.......
  begin
  tipocobro:=3;
  lbtitulo.Blinking:=true;
  lbtitulo.Caption:='Facturar En Caja';
  lbtitulo.Font.Color:=clRed;
  FechaAplica:=FechaServidor;
  lbfecha.caption:=datetostr(FechaAplica);
  end;

if tipo=2 then
  begin //es un cobro a domicilio
  tipocobro:=2;
  lbtitulo.Caption:='Factura Domicilio';
  lbtitulo.Font.Color:=clRed;
  FechaAplica:=FechaServidor;
  lbfecha.caption:=datetostr(FechaAplica);
  lbtitulo.Blinking:=true;
  end;

if tipo = 0 then
  begin
  tipocobro:=0;
  lbtitulo.Caption:='Cobro';
  Application.CreateForm(TfrmFechaAplicacion,frmFechaAplicacion);
  frmFechaAplicacion.ShowModal;
  lbfecha.caption:=datetostr(FechaAplica);
  btnFechaAplica.Visible:=true;
  btnFechaAplica.Enabled:=true;
  end;

//Condicion agregada   CSI
if tipo = 4 then //Cliente Identificado
  begin
  tipocobro:=4;
  lbtitulo.Caption:='Clientes Identificados';
  Application.CreateForm(TfrmFechaAplicacion,frmFechaAplicacion);
  frmFechaAplicacion.ShowModal;
  lbfecha.caption:=datetostr(FechaAplica);
  btnFechaAplica.Visible:=true;
  btnFechaAplica.Enabled:=true;
  ltotalCSI.visible := true;
  end;

if tipo = 5 then //Facturacion MX
  begin
  tipocobro:=5;
  lbtitulo.Caption:='Facturacion MX';
  Application.CreateForm(TfrmFechaAplicacion,frmFechaAplicacion);
  lbtitulo.Font.Color:=clBlue;
  FechaAplica:=FechaServidor;
  lbfecha.caption:=datetostr(FechaAplica);
  end;

edbuscar.setfocus;

if TipoCobro = 0 then
  querys('SELECT concat(''('',iniciales,'')'',nombre) as nom,aplicaDescuento,banco FROM TiposPagos where tipo=0 ORDER BY idTipoPago asc',0,sqlgeneral)
else
  querys('SELECT concat(''('',iniciales,'')'',nombre) as nom,aplicaDescuento,banco FROM TiposPagos where tipo=1 ORDER BY idTipoPago asc',0,sqlgeneral);

if (sqlgeneral.RecordCount > 0) then
  SetLength(ArregloTipoPago,sqlgeneral.RecordCount)
else
  SetLength(ArregloTipoPago,1);

cboFormaPago.Clear;
while not sqlgeneral.eof do
  begin
  cboFormaPago.Items.Add(sqlgeneral.fieldbyname('nom').asstring);
  ArregloTipoPago[sqlgeneral.RecNo-1].inicial := sqlgeneral.fieldbyname('nom').asstring;
  ArregloTipoPago[sqlgeneral.RecNo-1].aplicaDescuento := sqlgeneral.fieldbyname('aplicaDescuento').AsInteger;
  ArregloTipoPago[sqlgeneral.RecNo-1].banco := sqlgeneral.fieldbyname('banco').asstring;
  sqlgeneral.Next;
  end;//while

querys('SELECT concat(''('',iniciales,'')'',nombre) as nom FROM TiposBancos ORDER BY idTipoBanco asc',0,sqlgeneral);
cbobancos.Clear;
while not sqlgeneral.eof do
  begin
  cbobancos.Items.Add(sqlgeneral.fieldbyname('nom').asstring);
  sqlgeneral.Next;
  end;//while

//buscar descuento en configuraciones
querys('Select valor from configuraciones where concepto ='+quotedstr('DescuentoCargoAuto')+' ',0,sqlgeneral);
if (sqlgeneral.FieldByName('valor').AsString <> '' ) then
  DescCargoAuto := (sqlgeneral.FieldByName('valor').AsFloat/100)
else
  DescCargoAuto := 0;
end;

procedure Tfrmcobros.BuscarDescuentoVta;
begin
querys('Select idpedido from pedidos inner join clientesMTC as mtc on (mtc.idcliente=pedidos.idcliente and if ( LOCATE('+quotedstr('ENERO')+',UPPER(concepto)) > 0,'+quotedstr('ENERO')+',if (LOCATE('+quotedstr('FEBR')+',UPPER(concepto)) >0 ,'+quotedstr('FEBRERO')+', '+
      'if (LOCATE('+quotedstr('MARZ')+',UPPER(concepto)) >0 ,'+quotedstr('MARZO')+',if (LOCATE('+quotedstr('ABRI')+',UPPER(concepto)) >0 ,'+quotedstr('ABRIL')+',if (LOCATE('+quotedstr('MAY')+',UPPER(concepto)) >0 ,'+quotedstr('MAYO')+','+
      'if (LOCATE('+quotedstr('JUNI')+',UPPER(concepto)) >0 ,'+quotedstr('JUNIO')+',if (LOCATE('+quotedstr('JUL')+',UPPER(concepto)) >0 ,'+quotedstr('JULIO')+',if (LOCATE('+quotedstr('AGOS')+',UPPER(concepto)) >0 ,'+quotedstr('AGOSTO')+','+
      'if (LOCATE('+quotedstr('SEPT')+',UPPER(concepto)) >0 ,'+quotedstr('SEPTIEMBRE')+',if (LOCATE('+quotedstr('OCT')+',UPPER(concepto)) >0 ,'+quotedstr('OCTUBRE')+',if (LOCATE('+quotedstr('NOV')+',UPPER(concepto)) >0 ,'+quotedstr('NOVIEMBRE')+','+
      'if (LOCATE('+quotedstr('DIC')+',UPPER(concepto)) >0 ,'+quotedstr('DICIEMBRE')+','+quotedstr('NO')+'))))))))))))= mtc.mes AND YEAR(fechacreacion) = mtc.ano) where idpedido = '+edbuscarventa.text,0,sqlgeneral);

if (sqlgeneral.FieldByName('idpedido').AsString <> '' ) then
  begin
  chkDescuento.Visible := true;
  chkDescuento.Enabled := true;
  end;
end;


function Tfrmcobros.validarpedido(const id:string):integer;
  var  mdipedidos : tfrmpedidos;
begin
querys('select * from DetPedido where idpedido='+quotedstr(id),0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
  begin
  if  application.messagebox('Esta venta no tiene detalles de articulos!, por lo tanto no se puede aplicar un cobro ó facturar, deseas ver el pedido?','Atención',mb_yesno+mb_IconWarning) = idyes  then
    begin
    btnalta.Caption:='&Cobrar';
    mdipedidos:=Tfrmpedidos.Create(self);
    frmprincipal.ucprincipal.Log('Acceso la Pantalla de Pedidos',0);
    mdipedidos.inicializa(id);
    mdipedidos.Show;
    result := 0
    end
  else
    begin
    application.MessageBox('No se puede aplicar cobro a esta venta!','Atención',mb_IconInformation);
    btnalta.Caption:='&Cobrar';
    btncancelar.OnClick(self);
    result := 0
    end;
  end
else
  result := 1;
end;

function Tfrmcobros.UsuarioImpFact:integer;
begin
querys('select idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.text)+' and idfactura <>''0'' ',0,sqlgeneral);
if sqlgeneral.FieldByName('idfactura').AsString = '' then
  begin
  //verifica de que tipo de facturas puede elaborar este usuario
  {querys('select FacturaC from usuarios where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  if sqlgeneral.Fields.Fields[0].Asboolean then}
  if DerechosSys('Facturar en Caja') = true then
    result:=1
  else
    result:=0;
  end
else
  result:=0;
end;

function  Tfrmcobros.UsuarioFacturaCD:integer;
begin
querys('select idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.text)+' and idfactura <>''0'' ',0,sqlgeneral);
if sqlgeneral.FieldByName('idfactura').AsString = '' then
  begin
  //verifica de que tipo de facturas puede elaborar este usuario
  {querys('select FacturaD from usuarios where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  if sqlgeneral.Fields.Fields[0].Asboolean then}
  if DerechosSys('Facturar en Domicilio') = true then
    result:=1
  else
    result:=0;
  end
else
  result:=0;
end;

function  Tfrmcobros.UsuarioFacturaMX:integer;
begin
querys('select idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.text)+' and idfactura <>''0'' ',0,sqlgeneral);
if sqlgeneral.FieldByName('idfactura').AsString = '' then
  begin
  //verifica de que tipo de facturas puede elaborar este usuario
  {querys('select FacturaP from usuarios where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  if sqlgeneral.Fields.Fields[0].Asboolean then}
  if DerechosSys('Facturar en Pedidos') = true then
    result:=1
  else
    result:=0;
  end
else
  result:=0;
end;

procedure Tfrmcobros.ImprimirFacturaCD;
var year,dia,mes:word;
    //CantEnLetras,
    remicionado:Boolean;
    idfactura,TotVenta,idfac,idcliente: string;    // ,deducible    dec,
begin
//solo podran imprimir facturas de cobro los usuarios con los derechos correspondientes
//si puede imprimir facturas el usuario.........
querys('select idremicion, idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.Text)+' and idfactura <> ''0'' ',0,sqlgeneral);
if sqlgeneral.FieldByName('idremicion').AsString = '0' then
  remicionado := false
else
  remicionado := true;

if sqlgeneral.FieldByName('idfactura').AsString = '' then
  begin
  //mostrar pantalla de facturar......
  //trae el maximo numero de factura
  querys('select FacturaD from folios',0,sqlgeneral);
  idfactura:='D'+inttostr(sqlgeneral.fieldbyname('FacturaD').AsInteger+1);
  idfac:=inttostr(sqlgeneral.fieldbyname('FacturaD').AsInteger+1);

  Application.CreateForm(TfrmRemiFac, frmRemiFac);
  frmremifac.inicializa(false,remicionado,strtoint(edbuscarventa.Text),idfactura, 'N');
  frmremifac.ShowModal;  //mostramos forma de factura.......

   //actualiza el estatus
  querys('Update pedidos set estatus=4 '+
         //',FechaCreacion="'+datetostr(date)+'" '
         'WHERE idpedido='+edbuscarventa.Text,1,sqlgeneral);
  querys('update folios set FacturaD='+quotedstr(idfac),1,sqlgeneral);
  querys('UPDATE PagosClientes SET idfactura='+quotedstr(idfactura)+' where idpedido='+quotedstr(edbuscarventa.text),1,sqlgeneral);

   ///actualiza el campo ultima compra del cliente al igual que su saldo
  bpcambios('clientes', lcuenta.caption, 'idcliente');
  querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',TotComprado=TotComprado+'+quotedstr(TotVenta)+' where idcliente='+quotedstr(lcuenta.caption),1,sqlgeneral);
  apcambios('idcliente', lcuenta.caption, 'clientes', 'frmcobros');
  end
else
  idfactura:='D'+sqlgeneral.fieldbyname('idfactura').AsString;

//////impresion de la factura..........................
querys('select TotMn from pedidos where idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
TotVenta:=sqlgeneral.fieldbyname('TotMn').AsString;
    {
try
  dmreportes.NumToLetras.Numero := strtoint(midstr(TotVenta,1,posex('.',TotVenta)-1));
  dec := midstr(TotVenta,posex('.',TotVenta)+1,length(TotVenta));
except
  dmreportes.NumToLetras.Numero := 0;
  dec := '0';
end;    }

with dmreportes do
  begin
  querys('select idcliente,FechaVencimiento from pedidos where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);
  querys('select idcliente,FechaVencimiento from pedidos where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);

  if sqlgeneral.FieldByName('idcliente').AsString <> '' then
    begin
    idcliente:=sqlgeneral.fieldbyname('idcliente').AsString;
    decodedate(sqlgeneral.fieldbyname('FechaVencimiento').AsDateTime,year,mes,dia);
    end;

  RVP.Engine:=RvSystem2;
  sqlclientesfact.Close;
  sqlclientesfact.ParamByName('dia').Value := dia;
  sqlclientesfact.ParamByName('mes').Value := meses[mes];
  sqlclientesfact.ParamByName('ano').Value := year;
  sqlclientesfact.ParamByName('ped').Value := strtoint(edbuscarventa.Text);
  sqlclientesfact.ParamByName('idcliente').Value :=idcliente;
  //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(dmreportes.NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
  sqlclientesfact.ParamByName('cant').Value :='PESOS';
  sqlclientesfact.ParamByName('Fact').Value :=idfactura;
  sqlclientesfact.Open;
 { if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
    deducible := '1'
  else
    deducible := floattostr(1+getIVA);}


  {querys('select DetPedido.idpedido,DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido.cant,DetPedido.piezas,if ('+floattostr(1+getIVA)+'='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetPedido.tc,if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') '+
         ' as aplica_desc,(DetPedido.costo*'+deducible+'*DetPedido.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1,(((DetPedido.costo-(DetPedido.costo*articulos.desc_esp/100)) + ((DetPedido.costo- '+
         '(DetPedido.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.cant) + ((((DetPedido.costo/articulos.piezasxunidad)-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPedido.costo/articulos.piezasxunidad)'+
         '-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), ((DetPedido.costo+(DetPedido.costo*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo/articulos.piezasxunidad)+'+
         '((DetPedido.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas))*'+deducible+'*DetPedido.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPedido.cant)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,'+
         'DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = articulos.cod_cve where DetPedido.idpedido='+quotedstr(edbuscarventa.Text)+' order by DetPedido.id',0,sqlgeneral2);}

   querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+edbuscarventa.Text+' '+
        'order by dp.id',0,sqlgeneral2);


  rvp.ProjectFile := GetConfiguraciones('PathSysalarmServer', true)+ 'Reportes_sysalarm.rav';
  RVP.ExecuteReport('Factura');
  RVP.Engine:=RvSystem1;
  end;
  //////finalizacion de la impresion.....................

end;

procedure Tfrmcobros.ImprimirFacturaMX;
var year,dia,mes:word;
    //CantEnLetras,
    remicionado:Boolean;
    _total:Currency;
    idfactura,TotVenta,idfac,idcliente: string;    // ,deducible      dec,
begin
///solo podran imprimir facturas de cobro los usuarios con los derechos correspondientes

   //si puede imprimir facturas el usuario.........

 querys('select idremicion, idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.Text)+' and idfactura <> ''0'' ',0,sqlgeneral);
 if sqlgeneral.FieldByName('idremicion').AsString = '0' then
  remicionado := false
else
  remicionado := true;

if sqlgeneral.FieldByName('idfactura').AsString = '' then begin
  ///mostrar pantalla de facturar......

   //trae el maximo numero de factura
    querys('select FacturaP from folios',0,sqlgeneral);
    idfactura:='P'+inttostr(sqlgeneral.fieldbyname('FacturaP').AsInteger+1);
    idfac:=inttostr(sqlgeneral.fieldbyname('FacturaP').AsInteger+1);

  Application.CreateForm(TfrmRemiFac, frmRemiFac);
  frmremifac.inicializa(false,remicionado,strtoint(edbuscarventa.Text),idfactura, 'N');
  frmremifac.ShowModal;  //mostramos forma de factura.......

   //actualiza el estatus
  querys('Update pedidos set estatus=4 '+
        //',FechaCreacion="'+datetostr(date)+'"'+
         ' WHERE idpedido='+edbuscarventa.Text,1,sqlgeneral);

  querys('update folios set FacturaP='+quotedstr(idfac),1,sqlgeneral);

  querys('UPDATE PagosClientes SET idfactura='+quotedstr(idfactura)+' where idpedido='+quotedstr(edbuscarventa.text),1,sqlgeneral);

   ///actualiza el campo ultima compra del cliente al igual que su saldo
   bpcambios('clientes', lcuenta.caption, 'idcliente');
  querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',TotComprado=TotComprado+'+quotedstr(TotVenta)+' where idcliente='+quotedstr(lcuenta.caption),1,sqlgeneral);
  apcambios('idcliente', lcuenta.caption, 'clientes', 'frmcobros');

end else
    idfactura:='P'+sqlgeneral.fieldbyname('idfactura').AsString;

//////impresion de la factura..........................

 querys('select TotMn from pedidos where idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
 _total:=sqlgeneral.fieldbyname('TotMn').AsFloat;
   {
      try
          TotVenta := CurrToStrF(_total,ffNumber,2);
          dmreportes.NumToLetras.Numero := strtoint(midstr(TotVenta,1,posex('.',TotVenta)-1));
          dec := midstr(TotVenta,posex('.',TotVenta)+1,length(TotVenta));
      except
           dmreportes.NumToLetras.Numero := 0;
           dec := '0';
      end;      }


with dmreportes do begin

querys('select idcliente,FechaVencimiento from pedidos where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);

if sqlgeneral.FieldByName('idcliente').AsString <> '' then begin
idcliente:=sqlgeneral.fieldbyname('idcliente').AsString;
decodedate(sqlgeneral.fieldbyname('FechaVencimiento').AsDateTime,year,mes,dia);
end;

 RVP.Engine:=RvSystem2;
 sqlclientesfact.Close;
 sqlclientesfact.ParamByName('dia').Value := dia;
 sqlclientesfact.ParamByName('mes').Value := meses[mes];
 sqlclientesfact.ParamByName('ano').Value := year;
 sqlclientesfact.ParamByName('ped').Value := strtoint(edbuscarventa.Text);
 sqlclientesfact.ParamByName('idcliente').Value :=idcliente;
 //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(dmreportes.NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
 sqlclientesfact.ParamByName('cant').Value := 'PESOS';
 sqlclientesfact.ParamByName('Fact').Value :=idfactura;
 sqlclientesfact.Open;

 { if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
  deducible := '1'
 else
  deducible := floattostr(1+getIVA);}


 {querys('select DetPedido.idpedido,DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido.cant,DetPedido.piezas,if ('+floattostr(1+getIVA)+'='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetPedido.tc,if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') '+
        ' as aplica_desc,(DetPedido.costo*'+deducible+'*DetPedido.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1,(((DetPedido.costo-(DetPedido.costo*articulos.desc_esp/100)) + ((DetPedido.costo- '+
        '(DetPedido.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.cant) + ((((DetPedido.costo/articulos.piezasxunidad)-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPedido.costo/articulos.piezasxunidad)'+
        '-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), ((DetPedido.costo+(DetPedido.costo*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo/articulos.piezasxunidad)+'+
        '((DetPedido.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas))*'+deducible+'*DetPedido.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPedido.cant)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,'+
        'DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = articulos.cod_cve where DetPedido.idpedido='+quotedstr(edbuscarventa.Text)+' order by DetPedido.id',0,sqlgeneral2);}
 querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+edbuscarventa.Text+' '+
        'order by dp.id',0,sqlgeneral2);


 rvp.ProjectFile := GetConfiguraciones('PathSysalarmServer', true)+ 'Reportes_sysalarm.rav';
 RVP.ExecuteReport('FacturasMX');
 RVP.Engine:=RvSystem1;

end;
//////finalizacion de la impresion.....................
end;

procedure Tfrmcobros.ImprimirFactura;
var year,dia,mes:word;
    //CantEnLetras,
    remicionado:Boolean;
    _total:Currency;
   idfactura,TotVenta,idfac,idcliente: string;   //   ,deducible        dec,
begin
///solo podran imprimir facturas de cobro los usuarios con los derechos correspondientes

   //si puede imprimir facturas el usuario.........

 querys('select idremicion, idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.Text)+' and idfactura <> ''0'' ',0,sqlgeneral);
 if sqlgeneral.FieldByName('idremicion').AsString = '0' then
  remicionado := false
else
  remicionado := true;

if sqlgeneral.FieldByName('idfactura').AsString = '' then begin
  ///mostrar pantalla de facturar......

   //trae el maximo numero de factura
    querys('select FacturaC from folios',0,sqlgeneral);
    idfactura:='C'+inttostr(sqlgeneral.fieldbyname('FacturaC').AsInteger+1);
    idfac:=inttostr(sqlgeneral.fieldbyname('FacturaC').AsInteger+1);

  Application.CreateForm(TfrmRemiFac, frmRemiFac);
  frmremifac.inicializa(false,remicionado,strtoint(edbuscarventa.Text),idfactura, 'N');
  frmremifac.ShowModal;  //mostramos forma de factura.......

   //actualiza el estatus
  querys('Update pedidos set estatus=4 '+
         //',FechaCreacion="'+datetostr(date)+'" '+
         'WHERE idpedido='+edbuscarventa.Text,1,sqlgeneral);

  querys('update folios set FacturaC='+quotedstr(idfac),1,sqlgeneral);

  querys('UPDATE PagosClientes SET idfactura='+quotedstr(idfactura)+' where idpedido='+quotedstr(edbuscarventa.text),1,sqlgeneral);

   ///actualiza el campo ultima compra del cliente al igual que su saldo
  bpcambios('clientes', lcuenta.caption, 'idcliente');
  querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',TotComprado=TotComprado+'+quotedstr(TotVenta)+' where idcliente='+quotedstr(lcuenta.caption),1,sqlgeneral);
  apcambios('idcliente', lcuenta.caption, 'clientes', 'frmcobros');

end else
    idfactura:='C'+sqlgeneral.fieldbyname('idfactura').AsString;

//////impresion de la factura..........................

 querys('select TotMn from pedidos where idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
 _total:=sqlgeneral.fieldbyname('TotMn').AsFloat;
       {
      try
          TotVenta := CurrToStrF(_total,ffNumber,2);
          dmreportes.NumToLetras.Numero := strtoint(midstr(TotVenta,1,posex('.',TotVenta)-1));
          dec := midstr(TotVenta,posex('.',TotVenta)+1,length(TotVenta));
      except
           dmreportes.NumToLetras.Numero := 0;
           dec := '0';
      end;
              }

with dmreportes do begin

querys('select idcliente,FechaVencimiento from pedidos where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);

if sqlgeneral.FieldByName('idcliente').AsString <> '' then begin
idcliente:=sqlgeneral.fieldbyname('idcliente').AsString;
decodedate(sqlgeneral.fieldbyname('FechaVencimiento').AsDateTime,year,mes,dia);
end;

 RVP.Engine:=RvSystem2;
 sqlclientesfact.Close;
 sqlclientesfact.ParamByName('dia').Value := dia;
 sqlclientesfact.ParamByName('mes').Value := meses[mes];
 sqlclientesfact.ParamByName('ano').Value := year;
 sqlclientesfact.ParamByName('ped').Value := strtoint(edbuscarventa.Text);
 sqlclientesfact.ParamByName('idcliente').Value :=idcliente;
 //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(dmreportes.NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
 sqlclientesfact.ParamByName('cant').Value := 'PESOS';
 sqlclientesfact.ParamByName('Fact').Value :=idfactura;
 sqlclientesfact.Open;

{  if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
  deducible := '1'
 else
  deducible := floattostr(1+getIVA);}


{ querys('select DetPedido.idpedido,DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido.cant,DetPedido.piezas,if ('+floattostr(1+getIVA)+'='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetPedido.tc,if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') '+
        ' as aplica_desc,(DetPedido.costo*'+deducible+'*DetPedido.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1,(((DetPedido.costo-(DetPedido.costo*articulos.desc_esp/100)) + ((DetPedido.costo- '+
        '(DetPedido.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.cant) + ((((DetPedido.costo/articulos.piezasxunidad)-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPedido.costo/articulos.piezasxunidad)'+
        '-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), ((DetPedido.costo+(DetPedido.costo*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo/articulos.piezasxunidad)+'+
        '((DetPedido.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas))*'+deducible+'*DetPedido.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPedido.cant)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,'+
        'DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = articulos.cod_cve where DetPedido.idpedido='+quotedstr(edbuscarventa.Text)+' order by DetPedido.id',0,sqlgeneral2);}

querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+edbuscarventa.Text+' '+
        'order by dp.id',0,sqlgeneral2);


 rvp.ProjectFile := GetConfiguraciones('PathSysalarmServer', true)+ 'Reportes_sysalarm.rav';
 RVP.ExecuteReport('Factura');
 RVP.Engine:=RvSystem1;

end;
//////finalizacion de la impresion.....................
end;

procedure Tfrmcobros.imprimir;     //Recibo
  var cadena:string;
begin
cadena:='';
with dmreportes do
  begin
  {cadena:='SELECT ClientesFact.idcliente,ClientesFact.NombreCres AS Cliente,';
  cadena:=cadena+'('+quotedstr(TipoP)+') as TipoP, pedidos.concepto,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) as Usuario, pedidos.idpedido,if (pc.movimiento=1,pc.notas,''Rem: ''+pc.idremicion) AS REM,(FolioRecibo + 1) as Folio,'+quotedstr(abono)+' as TotMn '+
                 'FROM pedidos LEFT OUTER JOIN ClientesFact ON (pedidos.idcliente = ClientesFact.idcliente) LEFT OUTER JOIN usuarios ON (pedidos.idvendedor = usuarios.idusuario) join folios LEFT JOIN PagosClientes as pc ON (pc.idpedido=pedidos.idpedido) WHERE pc.idpago='+quotedstr(idpago);
  querys(cadena,0,sqlgeneral);}

  querys('SELECT ClientesFact.idcliente,ClientesFact.NombreCres AS Cliente,'+
         '('+quotedstr(TipoP)+') as TipoP, pedidos.concepto,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) as Usuario, pedidos.idpedido,if (pc.movimiento=1,pc.notas,''Rem: ''+pc.idremicion) AS REM,(FolioRecibo + 1) as Folio,'+quotedstr(abono)+' as TotMn '+
         'FROM pedidos left join clientes as c on pedidos.idcliente=c.idcliente LEFT OUTER JOIN ClientesFact ON (c.idfact = ClientesFact.idfact) '+
         'LEFT OUTER JOIN usuarios ON (pedidos.idvendedor = usuarios.idusuario) join folios LEFT JOIN PagosClientes as pc ON (pc.idpedido=pedidos.idpedido) WHERE pc.idpago='+quotedstr(idpago),0,sqlgeneral);
  OperacionReporte('Recibos', 'Recibos', 'IMP', 1);
{  ppReport.DeviceType:='Printer';
  ppReport.Template.DatabaseSettings.Name := 'Recibos';
  ppReport.Template.LoadFromDatabase;
  ppReport.Template.SaveToDatabase;
  ppReport.Print;
  ppReport.DeviceType:='Screen';}

  //actualizar folio
  querys('UPDATE PagosClientes SET recibo='+quotedstr(sqlgeneral.fieldbyname('Folio').AsString)+' WHERE idpago='+quotedstr(edbuscar.text),1,sqlgeneral2);
  querys('UPDATE folios set FolioRecibo=FolioRecibo+1',1,sqlgeneral3);
  end;
end;

function Tfrmcobros.estatus:integer;
begin
if ((SqlPagos.FieldByName('movimiento').AsString = '1') or  (SqlPagos.FieldByName('movimiento').AsString = '0')) then
  result:=1
else
  if ((SqlPagos.FieldByName('movimiento').asinteger = 3) or (SqlPagos.FieldByName('movimiento').asinteger = 5) or (SqlPagos.FieldByName('movimiento').asinteger = 4)) then
    result:=2
  else
    result:=0;
end;

procedure Tfrmcobros.buscarsaldos;
begin
  querys('SELECT saldo FROM clientes WHERE idcliente='+quotedstr(lcuenta.Caption),0,sqlgeneral);
  lsaldo_cliente.Caption:=floattostr(sqlgeneral.FieldByName('saldo').AsFloat);

  querys('SELECT sum(restante) as saldo FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
  lsaldo_venta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);
end;

procedure Tfrmcobros.cargarcombo;
  var c:integer;
begin
chkDescuento.Visible := false;
//if TipoCobro = 0 then
//querys('SELECT banco,nombre FROM TiposPagos WHERE tipo=0 and iniciales='+quotedstr(cboFormaPago.text[2]+cboFormaPago.text[3]),0,sqlgeneral)
//else
//querys('SELECT banco,nombre FROM TiposPagos WHERE tipo=1 and iniciales='+quotedstr(cboFormaPago.text[2]+cboFormaPago.text[3]),0,sqlgeneral);

for c:=Low(ArregloTipoPago) to high(ArregloTipoPago) do
  begin
  if (ArregloTipoPago[c].inicial= cboFormaPago.Text) then
    begin
    if ArregloTipoPago[c].banco <> 'S' then
      begin
      cbobancos.Enabled:=false;
      edcheque.Enabled:=false;
      end
    else
      begin
      cbobancos.Enabled:=true;    //if banco
      edcheque.Enabled:=true;
      end;

    if (ArregloTipoPago[c].aplicaDescuento = 1) then  //aplicar el porcentaje de descuento
      begin
      if (CargoAutomatico=1) then
        BuscarDescuentoVta;
      end;
    end;//if
 end;//for
end;

procedure Tfrmcobros.visiblepagos(c:integer);
begin
if c = 0 then
  begin
  letreropagos.Visible:=false;
  mmpagos.Visible:=false;
  end
else
  begin
  letreropagos.Visible:=true;
  mmpagos.Visible:=true;
  end;
end;

procedure Tfrmcobros.mostrargrid;
begin
querys('SELECT idpago FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.Text)+' and movimiento=1 limit 1',0,sqlgeneral);
if sqlgeneral.fieldbyname('idpago').asstring = '' then
  begin
  ///mostramos las parcialidades......
  querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion,movimiento FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.text)+' AND restante > 0',0,sqlparcialidades);
  end
else
  begin
  //solo es un cobro...
  querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion,movimiento FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.text)+' AND restante > 0 AND movimiento =1',0,sqlparcialidades);
  end;

if sqlparcialidades.recordcount > 1 then
  begin
  SPpanel.Percent:=0;
  rgdocumentos.Enabled:=true;
  DBparcialidades.setfocus;
  end
else
  begin

  dfecha.date:=strtodate(lbfecha.Caption);
  idpago:=sqlparcialidades.fieldbyname('idpago').AsString;
  lsaldo_venta.Caption:=Format('%8.2f',[sqlparcialidades.fieldbyname('restante').Asfloat]);
  edabono.Text := Format('%8.2f',[sqlparcialidades.fieldbyname('restante').Asfloat]);
  cobro:=strtofloat(Format('%8.2f',[sqlparcialidades.fieldbyname('restante').AsFloat]));
  lsaldoparcialidad.caption:=Format('%8.2f',[sqlparcialidades.fieldbyname('restante').asfloat]);
  idremicion:=sqlparcialidades.fieldbyname('idremicion').AsString;
  if sqlparcialidades.fieldbyname('movimiento').AsInteger = 1 then
    nota:='Pago de '+ sqlparcialidades.fieldbyname('notas').AsString
  else
    nota:='Pago de la venta';

  gbcobro.Enabled:=true;
  btnalta.Enabled:=true;
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  ednotas.text:=nota;
  btnalta.ImageIndex:=1;
  edbuscarventa.Enabled:=false;
  edbuscarfactura.Enabled:=false;

  edabono.Enabled:=true;
  ednotas.Enabled:=true;
  cboFormaPago.enabled:=true;
  querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
  edtipocambio.Text:=Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]);
  try
    lbcobrodlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edabono.Text) / strtofloat(edtipocambio.Text) )]);
    lbcobro.caption:='Cobro en MN : '+edabono.text;
  except
    lbcobro.caption:='Cobro en MN : ';
    end;
  edtipocambio.enabled:=true;
  edtipocambio.SetFocus;
  cboFormaPago.itemindex:=0;
  end;
end;

procedure Tfrmcobros.actualizar(operacion:string);
var cliente:string;
begin
   abono:=edabono.Text;
   saldado := ActualizarSaldoCliente(lcuenta.Caption,edbuscarventa.text,lbfecha.caption);
   if querys('select idcliente from pedidos where anualidad<>0 and idpedido='+edbuscarventa.text+' and idunidadnegocio=4',0,sqlgeneral)>0 then
   begin
      //para las cuentas que pagan una anualidad y que tienen contrato compartido
      if querys('select idcliente from clientes where tipocont="006" and idcliente='+lcuenta.Caption,0,sqlgeneral)>0 then
      begin
         bpcambios('clientes', lcuenta.Caption, 'idcliente');
         querys('Update clientes as c,contratos  as con,pedidos as p set c.TipoCont=con.TipoCont '+
                ' where p.idcliente=c.idcliente and p.idpedido='+quotedstr(edbuscarventa.text)+
                ' and p.Anualidad <> 0 and con.tipocont in ("15")',1,sqlgeneral);
         apcambios('idcliente', lcuenta.Caption, 'clientes', 'frmcobros');
      end
      else //para las cuentas que pagan una anualidad y que tienen contrato mensual
      begin
         bpcambios('clientes', lcuenta.Caption, 'idcliente');
         querys('Update clientes as c,contratos  as con,pedidos as p set c.TipoCont=con.TipoCont '+
                ' where p.idcliente=c.idcliente and p.idpedido='+quotedstr(edbuscarventa.text)+
                ' and p.Anualidad <> 0 and con.tipocont in ("012")',1,sqlgeneral);
         apcambios('idcliente', lcuenta.Caption, 'clientes', 'frmcobros');
      end;
      if sqlgeneral.RowsAffected>0 then
      begin
         //traer los meses que pago la anualidad
         querys('select idcliente,cod_cve,anualidad from pedidos p left join DetPedido using(idpedido) '+
                ' where idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
         cliente:=sqlgeneral.fieldbyname('idcliente').asstring;
         sqlgeneral.First;
         while not sqlgeneral.Eof do
         begin
            //busca un pedido que este remisionado de los meses que ya se pago la anualidad
            //para regresarlo a pedido
            if querys('select idpedido,idcliente,totmn from pedidos p left join DetPedido using(idpedido) '+
                      ' where cod_cve="'+sqlgeneral.fieldbyname('cod_cve').asstring+'" and p.estatus=3 and '+
                      'p.idpedido<>'+edbuscarventa.text+' and idcliente='+cliente+
                      ' and concepto like"%'+sqlgeneral.fieldbyname('anualidad').asstring+'%"',0,dmreportes.sqlgeneral)>0 then
            begin
               dmreportes.sqlgeneral.first;
               while not dmreportes.sqlgeneral.eof do
               begin
                   //busca que el pedido no tenga ningun pago
                   if querys('select idpedido from PagosClientes where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString+
                          ' and movimiento not in (0,3)',0,dmreportes.sqlgeneral2)=0 then
                   begin
                      querys('update pedidos set estatus=0, fecharemision="",saldo=0 where idpedido='+
                              dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                      querys('delete from PagosClientes where idpedido='+
                             dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                      bpcambios('clientes', lcuenta.Caption, 'idcliente');
                      querys('update clientes set saldo=saldo-'+dmreportes.sqlgeneral.fieldbyname('totmn').asstring+
                             ' where idcliente='+cliente,1,dmreportes.sqlgeneral2);
                      apcambios('idcliente', lcuenta.Caption, 'clientes', 'frmcobros');
                      querys('delete from pedidos where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                      querys('delete from DetPedido where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                   end;
                   dmreportes.sqlgeneral.next;
               end;
            end;
            //buscar los recargos de monitoreo vencido para regresarlo a pedido
            if querys('select idpedido,idcliente,totmn from pedidos p left join DetPedido using(idpedido) '+
                    'where idcliente='+cliente+' and year(fechacreacion)='+
                    sqlgeneral.fieldbyname('anualidad').asstring+' and p.estatus=3 and idunidadnegocio=5 and cod_cve="recargos01"',0,dmreportes.sqlgeneral)>0 then
            begin
               //busca que el pedido no tenga ningun pago
               if querys('select idpedido from PagosClientes where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString+
                         ' and movimiento not in (0,3)',0,dmreportes.sqlgeneral2)=0 then
               begin
                  querys('update pedidos set estatus=0, fecharemision="",saldo=0 where idpedido='+
                         dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  querys('delete from PagosClientes where idpedido='+
                         dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  bpcambios('clientes', lcuenta.Caption, 'idcliente');
                  querys('update clientes set saldo=saldo-'+dmreportes.sqlgeneral.fieldbyname('totmn').asstring+
                         ' where idcliente='+cliente,1,dmreportes.sqlgeneral2);
                  apcambios('idcliente', lcuenta.Caption, 'clientes', 'frmcobros');
                  querys('delete from pedidos where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
               end;
            end;
            sqlgeneral.next;
         end;
      end;

      /////compartidas/////
      if querys('select idclientecom from clientesCompartido where idcliente='+lcuenta.Caption,0,sqlgeneral)>0 then
      begin
         //buscar todos los clientes compartidos de esta cuenta
         sqlgeneral.first;
         while not sqlgeneral.Eof do
         begin
            cliente:=sqlgeneral.fieldbyname('idclientecom').asstring;
            with dmreportes do
            begin
               //busca un pedido que este remisionado de las cuentas que estan compartidas
               //para regresarlo a pedido
               querys('select idcliente,idpedido,totmn from pedidos '+
                      ' where idcliente='+cliente+ ' and estatus=3 and idunidadnegocio in (4,5)',0,sqlgeneral3);
               sqlgeneral3.First;
               while not sqlgeneral3.Eof do
               begin
                  //busca que el pedido no tenga ningun pago
                  if querys('select idpedido from PagosClientes where idpedido='+sqlgeneral3.fieldbyname('idpedido').AsString+
                            ' and movimiento not in (0,3)',0,sqlgeneral4)=0 then
                  begin
                     querys('update pedidos set estatus=0, fecharemision="",saldo=0 where idpedido='+sqlgeneral3.fieldbyname('idpedido').AsString,1,sqlgeneral4);
                     querys('delete from PagosClientes where idpedido='+sqlgeneral3.fieldbyname('idpedido').AsString,1,sqlgeneral4);
                     bpcambios('clientes', lcuenta.Caption, 'idcliente');
                     querys('update clientes set saldo=saldo-'+sqlgeneral3.fieldbyname('totmn').asstring+
                            ' where idcliente='+sqlgeneral3.fieldbyname('idcliente').AsString,1,sqlgeneral4);
                     apcambios('idcliente', lcuenta.Caption, 'clientes', 'frmcobros');
                     querys('delete from pedidos where idpedido='+sqlgeneral3.fieldbyname('idpedido').AsString,1,sqlgeneral4);
                     querys('delete from DetPedido where idpedido='+sqlgeneral3.fieldbyname('idpedido').AsString,1,sqlgeneral4);
                  end;
                  sqlgeneral3.next;
               end;
            end;
            sqlgeneral.Next;
         end;
      end;
      //compartidas
   end;
end;

procedure Tfrmcobros.buscarfacturalocate;
begin
querys('SELECT idfactura,idpedido FROM RemiFact WHERE idfactura='+quotedstr(edbuscarfactura.text),0,SqlGeneral);
if SqlGeneral.FieldByName('idfactura').AsString <> '' then
  begin                                                                                                                              //
  edbuscarventa.Text:= SqlGeneral.FieldByName('idpedido').AsString;
  ////////////////buscar saldo de la factura
  querys('SELECT r.idfactura as factura, ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) as Cliente '+
         ',p.idcliente as id,p.saldado as saldado,c.saldo as total,p.idpedido as pedido FROM pedidos as p inner join clientes as c on   '+
         '(c.idcliente=p.idcliente) INNER JOIN RemiFact AS r ON (r.idpedido=p.idpedido) WHERE p.idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
  if sqlgeneral.FieldByName('saldado').AsInteger = 0 then
    begin// si hay algo que cobrar entonces
    //idpedido:=sqlgeneral.FieldByName('pedido').AsString;
    edbuscarventa.Text:=sqlgeneral.FieldByName('pedido').AsString;
    lcuenta.Caption:=sqlgeneral.FieldByName('id').AsString;
    lnombre.Caption:=sqlgeneral.FieldByName('Cliente').AsString;
    lsaldo_cliente.Caption:=floattostr(sqlgeneral.FieldByName('total').AsFloat);
    //edbuscarfactura.Text:=sqlgeneral.fieldbyname('factura').asstring;
    querys('SELECT sum(restante) as saldo FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);

    lsaldo_venta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);
    edbuscarventa.enabled:=false;
    edbuscarfactura.enabled:=false;
    //buscamos que la venta tenga parcialidas
    mostrargrid;
    end
  else//esta saldada.....
     application.MessageBox('Esa factura esta saldada!','Atención',mb_iconwarning);
  end
else
  begin
  application.MessageBox('Esa factura no existe!','Atención',mb_iconwarning);
  edbuscarfactura.Text:='';
  edbuscarfactura.SetFocus;
  end;//if recordcount
end;

procedure Tfrmcobros.limpiar;
begin
    edtipocambio.Text:='';
    edbuscarventa.text:='';
    edbuscarfactura.text:='';
    lsaldo_venta.Caption:='';
    lsaldo_cliente.Caption:='';
    lnombre.Caption:='';
    lcuenta.caption:='';
    lbsector.Caption:='';
    edbuscar.Text:='';
    lbcobro.Caption:='';
    ckpesos.checked:=false;
    ckdolares.checked:=false;
    cbobancos.ItemIndex:=-1;
    edcheque.Text:='';
    lbcobro.Caption:='Cobro en MN :';
    lbcobrodlls.Caption:='Cobro en DLLS :';
    edabono.text:='';
    cboFormaPago.ItemIndex:=-1;
    cbobancos.ItemIndex:=-1;
    lsaldoparcialidad.Caption:='';
    btnimprimir.Enabled:=false;
    chkDescuento.Checked := false;
    chkDescuento.enabled := false;
end;

procedure Tfrmcobros.buscarventalocate;
begin
if  validarpedido(edbuscarventa.Text) = 1 then
  begin
  querys('SELECT idpago FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.Text),0,SqlGeneral);
  if SqlGeneral.FieldByName('idpago').AsString <> '' then
    begin
    ////////////////buscar saldo de la venta
    { querys('SELECT r.idfactura as factura,if(((dc.rsocial is null) or (dc.rsocial = '''')),concat(ifnull(dc.nombre,'' ''),'' '',ifnull(dc.apaterno,'' ''),'' '',ifnull(dc.amaterno,'' '')),dc.rsocial) as Cliente, ' +
              'p.concepto,p.idcliente as id,p.saldado as saldado,c.saldo as total FROM pedidos as p inner join clientes as c on (c.idcliente=p.idcliente) left join ClientesFact as dc ON (dc.idcliente=c.idcliente)  '+
              'LEFT JOIN RemiFact AS r ON (r.idpedido=p.idpedido) WHERE p.idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
              }
    querys('SELECT r.idfactura as factura,dc.NombreCres as Cliente,c.sector as sec,dt.flcargo as CargoAutomatico, ' +
           'p.concepto,p.idcliente as id,p.saldado as saldado,c.saldo as total FROM pedidos as p inner join clientes as c on (c.idcliente=p.idcliente) left join ClientesFact as dc ON (dc.idfact=c.idfact)  '+
           'LEFT JOIN RemiFact AS r ON (r.idpedido=p.idpedido) LEFT JOIN DetClientes as dt on(dt.idcliente=c.idcliente) WHERE p.idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);

    if sqlgeneral.FieldByName('saldado').AsInteger = 0 then
      begin// si hay algo que cobrar entonces
      lcuenta.Caption:=sqlgeneral.FieldByName('id').AsString;
      lnombre.Caption:=sqlgeneral.FieldByName('Cliente').AsString;
      lsaldo_cliente.Caption:=floattostr(sqlgeneral.FieldByName('total').AsFloat);
      lbsector.caption:=sqlgeneral.FieldByName('sec').AsString;
      if (sqlgeneral.FieldByName('CargoAutomatico').AsString ='1') then
          CargoAutomatico := 1
      else
          CargoAutomatico := 0;

      edbuscarfactura.Text:=sqlgeneral.fieldbyname('factura').asstring;
      querys('SELECT sum(restante) as saldo FROM PagosClientes  WHERE  idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);
      lsaldo_venta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);

      edbuscarventa.enabled:=false;
      edbuscarfactura.enabled:=false;
      ///mostramos las parcialidades......
      //buscamos que la venta tenga parcialidas
      mostrargrid;

      //CSI//
      if tipocobro = 4 then
        begin
        application.MessageBox('Seleccione el pedido a afectar de la cuenta 10000, en otro caso se cancelara el cobro', 'Atencion', MB_ICONINFORMATION);
        with frmbusquedas do
          begin
          query:='Select p.idpedido, round(sum(pc.cargo), 2) as cargo, round(sum(pc.abono), 2) as abono, round(sum(pc.restante), 2) as restante, p.FechaCreacion '+
          'from pedidos as p left join PagosClientes as pc on p.idpedido=pc.idpedido where p.idcliente = 10000 and p.estatus = 3 '+
          'and movimiento <> 3 group by p.idpedido having abono > 0';

          campo_retorno:='idpedido';
          campo_busqueda:='idpedido';
          tblorigen := 'pedidos';
          maxrow := 2;
          showmodal;
          if resultado <> '' then
            begin
            pedidoCSI := resultado;
            querys('Select sum(pc.abono) as restante, idremicion, FechaAlta from pedidos as p left join PagosClientes as pc '+
                 'on p.idpedido=pc.idpedido where p.idpedido = '+pedidoCSI+' and movimiento = 2 group by p.idpedido', 0, dmreportes.sqlgeneral7);
            totalCSI := dmreportes.sqlgeneral7.fieldbyname('restante').AsFloat;
            ltotalcsi.caption := floattostr(totalcsi);
            remisionCSI := dmreportes.sqlgeneral7.fieldbyname('idremicion').AsString;
            FechaCSI := dmreportes.sqlgeneral7.fieldbyname('FechaAlta').AsString;
            end
          else
            btncancelar.OnClick(self);
          end;
        end;
      end
    else
      begin//esta saldada.....
      application.MessageBox('Esa venta esta saldada!','Atención',mb_iconwarning);
      if  tipocobro = 1 then
        close;
      end;
    end
  else
    begin
    application.MessageBox('Esa venta no esta realizada!','Atención',mb_iconwarning);
    if  tipocobro = 1 then
       close;
    edbuscarventa.Text:='';
    edbuscarventa.SetFocus;
    end;//if recordcount
  end;
end;

procedure Tfrmcobros.buscarlocate;
  var i:integer; cob:double;
begin
//busqueda de la orden por medio un locate esto si es oprimido el enter despues de haber tecleado un digito
querys('select * from PagosClientes where idpago='+quotedstr(edbuscar.Text),0,SqlPagos);
if SqlPagos.FieldByName('idpago').asstring  <> '' then
  begin
  case  SqlPagos.FieldByName('movimiento').AsInteger of
         /////////////////MOSTRAR ESTATUS DEL PAGO////////////////////////
     0: begin
        lcancelado.Caption:='MOV: VENTA';
        lcancelado.Font.Color:=clwhite;
        visiblepagos(0);
        end;

     1: begin
        lcancelado.Caption:='MOV: PARCIALIDAD';
        lcancelado.Font.Color:=clwhite;
        visiblepagos(0);
        end;

     2: begin
        lcancelado.Caption:='MOV: COBRO REALIZADO';
        lcancelado.Font.Color:=clwhite;
        letreropagos.Visible:=true;
        mmpagos.Visible:=true;
        visiblepagos(1);
        end;

     3: begin
        lcancelado.Caption:='MOV: COBRO CANCELADO';
        lcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

     4: begin
        lcancelado.Caption:='MOV: ABONO x PARCIALIZACION';
        lcancelado.Font.Color:=clwhite;
        visiblepagos(0);
        end;

     5: begin
        lcancelado.Caption:='MOV: CANCELACION ABONO';
        lcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

     6: begin
        lcancelado.Caption:='MOV: NOTA/CREDITO';
        lcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

     8: begin
        lcancelado.Caption:='MOV: PAGO DE CUENTA IDENTIFICADA';
        lcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

    10: begin
        lcancelado.Caption:='MOV: ABONO-NOTA/CREDITO';
        lcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

    11: begin
        lcancelado.Caption:='MOV: ABONO POR CORTESIAS';
        lcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;
     end;

              {
    if  SqlPagos.FieldByName('movimiento').AsInteger = 0 then begin
        lcancelado.Caption:='MOV: VENTA';
        lcancelado.Font.Color:=clwhite;
        visiblepagos(0);
    end;
    if SqlPagos.FieldByName('movimiento').AsInteger = 1 then begin
       lcancelado.Caption:='MOV: PARCIALIDAD';
       lcancelado.Font.Color:=clwhite;
       visiblepagos(0);
    end;
    if SqlPagos.FieldByName('movimiento').AsInteger = 2 then begin
       lcancelado.Caption:='MOV: COBRO REALIZADO';
       lcancelado.Font.Color:=clwhite;
       letreropagos.Visible:=true;
       mmpagos.Visible:=true;
       visiblepagos(1);
    end;
    if SqlPagos.FieldByName('movimiento').AsInteger = 3 then begin
       lcancelado.Caption:='MOV: COBRO CANCELADO';
       lcancelado.Font.Color:=clred;
       visiblepagos(0);
    end;
    if SqlPagos.FieldByName('movimiento').AsInteger = 4 then begin
       lcancelado.Caption:='MOV: ABONO x PARCIALIZACION';
       lcancelado.Font.Color:=clwhite;
       visiblepagos(0);
    end;
    if SqlPagos.FieldByName('movimiento').AsInteger = 5 then begin
       lcancelado.Caption:='MOV: CANCELACION ABONO';
       lcancelado.Font.Color:=clred;
       visiblepagos(0);
    end;
    if SqlPagos.FieldByName('movimiento').AsInteger = 5 then begin
       lcancelado.Caption:='MOV: CANCELACION ABONO';
       lcancelado.Font.Color:=clred;
       visiblepagos(0);
    end;


                }
  ckpesos.checked:=false;
  ckdolares.checked:=false;
  edcheque.Text := SqlPagos.fieldbyname('cheque').AsString;
  edbuscarventa.Text :=  SqlPagos.fieldbyname('idpedido').AsString;
  edabono.Text := Format('%8.2f',[SqlPagos.fieldbyname('abono').Asfloat]);
  edbuscarfactura.Text := SqlPagos.fieldbyname('idfactura').AsString;
  edTipoCambio.text:= Format('%8.2f',[SqlPagos.fieldbyname('TipoCambio').Asfloat]);
  cob:=strtofloat(Format('%8.2f',[SqlPagos.fieldbyname('abono').Asfloat]));
  lbcobro.caption:='Cobro en MN : '+ Format('%8.2f',[cob]);
  dfecha.Date:=SqlPagos.fieldbyname('FechaAlta').AsDateTime;
  ednotas.Text:=SqlPagos.fieldbyname('notas').asstring;

  if (edabono.text <> '0') then
    begin
    if SqlPagos.fieldbyname('moneda').AsString ='D' then
      begin
      ckdolares.Checked:=true;
      ckpesos.checked:=false;
      cob:=(strtofloat(edabono.Text)/ strtofloat(edtipocambio.Text));
      lbcobro.Caption:='Cobro en MN : '+edabono.text;
      edabono.Text:=Format('%8.2f',[cob]);
      lbcobrodlls.Caption:='Cobro en DLLS : '+edabono.text;
      end
  else
      begin
      try
        cob:=(strtofloat(edabono.Text) / strtofloat(edtipocambio.Text));
      except
      cob:=0;
      end;
      lbcobro.caption:='Cobro en MN : '+edabono.Text;
      lbcobrodlls.Caption :='Cobro en DLLS : '+Format('%8.2f',[cob]);
      ckpesos.Checked := true;
      ckdolares.checked := false;
      end;
  end;

  //buscar sus parcialidades o sus cargos pendientes a pagar......
  querys('SELECT idpago FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.Text)+' and movimiento=1 limit 1',0,sqlgeneral);
  if sqlgeneral.fieldbyname('idpago').asstring = '' then
    querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.text)+' AND restante > 0',0,sqlparcialidades)
  else
    querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion FROM PagosClientes WHERE idpedido='+quotedstr(edbuscarventa.text)+' AND restante > 0 and movimiento =1',0,sqlparcialidades);

  ////////buscar datos cliente
  querys('SELECT  cf.NombreCres as nombre, c.saldo as sa,c.sector as s FROM clientes as c left join ClientesFact as cf ON(cf.idcliente=c.idcliente) WHERE  c.idcliente='+quotedstr(SqlPagos.fieldbyname('idcliente').AsString),0,sqlgeneral);
  lnombre.Caption:=sqlgeneral.fieldbyname('nombre').AsString;
  lbsector.caption:=sqlgeneral.fieldbyname('s').AsString;
  lsaldo_cliente.Caption:=sqlgeneral.fieldbyname('sa').AsString;
  lcuenta.Caption:=SqlPagos.fieldbyname('idcliente').AsString;

  EstatusCliente(lcuenta.Caption,sqlgeneral);  //si esta cancelado o bloquedo.
  //////////buscar saldo de la venta
  querys('SELECT sum(restante) as saldo FROM PagosClientes  WHERE movimiento=1 and idpedido='+quotedstr(SqlPagos.fieldbyname('idpedido').AsString),0,sqlgeneral);
  if sqlgeneral.FieldByName('saldo').Asstring <> '' then
     lsaldo_venta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat])
  else
    begin
    querys('SELECT sum(restante) as saldo FROM PagosClientes WHERE movimiento=0 and idpedido='+quotedstr(SqlPagos.fieldbyname('idpedido').AsString),0,sqlgeneral);
  lsaldo_venta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);
  end;

  ////////////////////////////////
  btnmodificar.Enabled:=true;
  btnimprimir.Enabled:=true;
  btnalta.Enabled:=true;
  btnborrar.Enabled:=true;
  for i := 0 to cboformapago.Items.Count - 1 do
    if cboformapago.Items.Strings[i][2] + cboformapago.Items.Strings[i][3] =  SqlPagos.fieldbyname('TipoPago').Asstring then      begin
      cboFormaPago.text := cboformapago.Items.Strings[i];
      break;
      end;

  //cargarcombo;
  for i := 0 to cbobancos.Items.Count - 1 do
    if cbobancos.Items.Strings[i][2] + cbobancos.Items.Strings[i][3] =  SqlPagos.fieldbyname('TipoPago2').Asstring then      begin
      cbobancos.text := cbobancos.Items.Strings[i];
      break;
      end;

  //buscar a los pagos afectados por el cobro
  querys('SELECT idpago2 FROM PagosAfecta WHERE idpago='+quotedstr(edbuscar.Text),0,sqlgeneral);
  mmpagos.clear;
  while not sqlgeneral.eof do
    begin
    mmpagos.Lines.Add(sqlgeneral.fieldbyname('idpago2').asstring);
    sqlgeneral.next;
    end;

  end
else
  begin
  btnmodificar.Enabled:=false;
  btnborrar.Enabled:=false;
  application.MessageBox('Ese Pago no Existe','Información',mb_ok+mb_iconinformation);
  limpiar;
  //SqlPagos.Active:=false;
  edbuscar.SetFocus;
  btnmodificar.Enabled:=false;
  btnborrar.Enabled:=false;
  end;// idarea
end;

procedure Tfrmcobros.edbuscarButtonClick(Sender: TObject);
  var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure Tfrmcobros.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  //BUSCAR POR CATALOGO//
  frmbusquedas.query:='Select idpago,idcliente as Cuenta,idpedido as Venta,idfactura as Factura,idpago_afecta as Pago_Afecta,FechaAlta as Fecha,cargo as Cargo,abono as Abono,restante as Restante,TipoPago,FechaVence, '+
                      'movimiento as Mov,TipoCambio,usuario as Usuario,fecha as Fecha,hora as Hora FROM PagosClientes order by idpago desc';
  frmbusquedas.campo_retorno:='idpago';
  frmbusquedas.campo_busqueda:='idpago';
  frmbusquedas.tblorigen:='PagosClientes'; 
  frmbusquedas.ShowModal;
  if frmbusquedas.resultado <> '' then
    begin
    edbuscar.Text:=frmbusquedas.resultado;
    buscarlocate;
    end;
  end;
end;

procedure Tfrmcobros.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
   key:=#0;
   if edbuscar.Text <> '' then
      buscarlocate
   else
      edbuscar.OnButtonClick(self);
   end;

if key = #27 then
  begin
  key:=#0;
  edbuscar.Text:='';
  end;
end;

procedure Tfrmcobros.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then
  begin
  lcancelado.caption:='';
  limpiar;
  btnmodificar.enabled:=false;
  btnborrar.enabled:=false;
  visiblepagos(0);
  end;
end;

procedure Tfrmcobros.ednotasEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmcobros.ednotasExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
if btnalta.enabled= true then
  btnalta.setfocus
else
  btnmodificar.setfocus;
end;

procedure Tfrmcobros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if ban=1 then
  begin
  application.MessageBox('No puedes cerrar la pantalla hasta que termines el cobro','Atención',mb_iconwarning);
  exit;
  end;
action:=cafree;
end;

procedure Tfrmcobros.btncancelarClick(Sender: TObject);
begin
TipoMovimiento := -1;
if ban=1 then
  begin
  application.MessageBox('No puedes cerrar la pantalla hasta que termines el cobro','Atención',mb_iconwarning);
  exit;
  end;

if btncancelar.Caption='C&ancelar' then
  begin
  //if btnalta.Enabled = true then begin
  if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then
    begin
    //if btnalta.Caption='&Guardar' then
    //   begin
    btnalta.Caption:='&Cobrar';
    btnalta.Hint:='Dar de Alta un cobro';
    btnalta.ImageIndex:=5;
    btnalta.enabled:=true;
    //  end;

    if btnmodificar.Caption='&Guardar' then
      begin
      btnmodificar.Caption:='&Editar';
      btnmodificar.hint:='Editar los datos del cobro actual';
      btnmodificar.ImageIndex:=2;
      end;

    btncancelar.Hint:='Cerrar esta Pantalla';
    btncancelar.Caption:='C&errar';
    limpiar;
    edbuscar.Enabled:=true;
    edbuscar.Text:='';
    SPpanel.Percent:=97;
    edbuscarventa.enabled:=false;
    edbuscarfactura.enabled:=false;
    edbuscar.setfocus;
    ednotas.enabled:=false;
    end
  else //pregunta ?
    try
      edbuscarventa.setfocus;
    except
      btnalta.setfocus;
    end;
  end
else
  close;
end;

procedure Tfrmcobros.btnaltaClick(Sender: TObject);
  var //cadena,
  moneda,cheque,banco,tipo:string;
  rem,tmp_pago,tmp_pago2:integer;
  cob,cantidad, ab:double;
  //c:integer;
begin
   if btnalta.Caption='&Cobrar' then
   begin
      saldado:=0;MasRem:=0;//mas remisiones es para poder hacer varios pagos a varias remisiones....
      TipoP:='';
      Transaccion:=0;//normal
      ban:=0;
      pesos:=0;
      cobro:=0;
      unidadNegocio:=0;
      mmpagos.Clear;
      lcancelado.Caption:='';
      idpago:=''; idremicion:='';
      btnalta.Enabled:=false;
      btnmodificar.Enabled:=false;
      btnborrar.Enabled:=false;
      btncancelar.Caption:='C&ancelar';
      btncancelar.Hint:='Cancelar la Alta';
      btnalta.Hint:='Guardar los datos de la alta';
      edbuscar.Text:='';
      edbuscar.Enabled:=false;
      leyenda.Visible:=true;
      rgdocumentos.Enabled:=true;
      edbuscarventa.Enabled:=true;
      edbuscarfactura.Enabled:=true;
      dfecha.date:=strtodate(lbfecha.Caption);
      ckpesos.checked:=true;
      chkDescuento.Visible := false;
      temporalPagoVenta := 0;
      TipoMovimiento := -1;
      //si desea hacer la busqueda por cliente y luego por venta
      frmbusquedas.query:=' Select c.idcliente,cf.NombreCres as Nombre,c.estatus as Estatus,c.bloqueado as Bloqueado,'+
                          ' cf.DirCres as Direccion,c.numero as Numero,c.ciudad as Ciudad,c.estado as Estado,usuario as '+
                          ' Usuario,c.fecha as Fecha,c.hora as Hora From clientes as c left join ClientesFact as cf '+
                          ' ON(cf.idcliente=c.idcliente) order by c.idcliente';
      frmbusquedas.campo_retorno:='idcliente';
      frmbusquedas.campo_busqueda:='Numero';
      frmbusquedas.tblorigen := 'clientes';
      frmbusquedas.tabla:='clientes';
      frmbusquedas.cbofiltro.ItemIndex:=0;
      frmbusquedas.cbofiltro.OnClick(self);
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
      begin
         cliente:=frmbusquedas.resultado;
         EstatusCliente(cliente,sqlgeneral);
         querys('select idabogado from clientes where idcliente='+cliente, 0, sqlgeneral);
         if (sqlgeneral.FieldByName('idabogado').asinteger <> 0) and (tipocobro = 3) then
           begin
           btncancelar.onclick(self);
           exit;
           end;

         //mostrar mensaje si esta cancelado o bloqueado...
         ////////////////////////////////////cobro en caja...............................................
         //BUSCAR POR CATALOGO//                         //if(((c.rsocial is null) or (c.rsocial = '''')),concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')),c.rsocial) '+                           'as Cliente,
         querys('SELECT p.idcliente as IdCliente,p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura,'+
         ' p.FechaCreacion,p.TotMn as ImporteNeto,p.FechaVencimiento  '+
         ' FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) LEFT  JOIN '+
         ' PagosClientes as pc ON (pc.idpedido=p.idpedido) WHERE  p.idcliente='+quotedstr(cliente)+' and '+
         ' p.estatus in(0,3,4) and p.saldado=0 and p.FechaCreacion >  ''2005/02/01'' group by p.idpedido ',0,sqlgeneral);        //
         frmbusquedas.maxrow:=sqlgeneral.RecordCount+1;
         MasRem:=sqlgeneral.RecordCount;
         frmbusquedas.query:='SELECT p.idcliente as IdCliente,p.idpedido,if(p.estatus =0,''PED'',IF (p.estatus=3,''REM'',''FACT'')) as '+
         ' Estatus,pc.idfactura as IDFactura, p.concepto,p.FechaVencimiento,p.FechaCreacion,p.TotMn as ImporteNeto '+
         ' FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) LEFT JOIN PagosClientes as pc '+
         ' ON (pc.idpedido=p.idpedido) LEFT JOIN ClientesFact as dc ON(dc.idcliente=p.idcliente) WHERE  p.idcliente='+
         quotedstr(cliente)+' and p.estatus in(0,3,4) and p.saldado=0 and p.FechaCreacion >  ''2005/02/01'' '+
         ' group by p.idpedido order by p.FechaCreacion desc';
         frmbusquedas.campo_retorno:='idpedido';
         frmbusquedas.campo_busqueda:='idpedido';
         frmbusquedas.tabla:='';
         frmbusquedas.tblorigen:='pedidos';
         frmbusquedas.ShowModal;
         if frmbusquedas.resultado <> '' then
         begin
            edbuscarventa.Text:=frmbusquedas.resultado;
            frmbusquedas.maxrow:=0;
            /// aqui vamos a validar que si es una remision cobre normal, si no tener que remisionar la venta.....
            querys('select p.estatus as estatus,p.idcliente as idcliente,p.TotMn as TotMn,un.instalacion as inst, p.idUnidadNegocio as unNeg from pedidos as p left join UnidadNegocio as un ON(un.idUnidadNegocio=p.idUnidadNegocio) where p.idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
            unidadNegocio:= sqlgeneral.fieldbyname('unNeg').asInteger;
            if ((sqlgeneral.fieldbyname('estatus').asstring = '0') and (sqlgeneral.fieldbyname('inst').asstring = '0'))  then
            begin
               //vamos a preguntar si lo desea remisionar.....
               if application.MessageBox('Deseas remisionar este pedido?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
               begin
                  if validarpedido(edbuscarventa.Text) = 1 then
                  begin               //en este momento se remisiona la venta
                     //Remisionar(edbuscarventa.Text);
                     //actualiza el campo ultima compra del cliente al igual que su saldo
                     //trae el maximo numero de remicion
                     querys('select idremicion from folios',0,dmreportes.sqlgeneral);
                     rem:=dmreportes.sqlgeneral.fieldbyname('idremicion').AsInteger+1;
                     Application.CreateForm(TfrmRemiFac, frmRemiFac);
                     frmremifac.inicializa(true,false,strtoint(edbuscarventa.Text),inttostr(rem), 'N');
                     frmremifac.ShowModal;
                     querys('select FechaVencimiento,idUnidadNegocio from pedidos where idpedido='+
                     edbuscarventa.Text,0,dmreportes.sqlgeneral2);
                     if dmreportes.sqlgeneral2.recordcount > 0 then
                        unidadNegocio:= dmreportes.sqlgeneral2.fieldbyname('idUnidadNegocio').asInteger;
                     bpcambios('clientes', sqlgeneral.fieldbyname('idcliente').asstring, 'idcliente');
                     querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',saldo=saldo+'+
                     quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+',TotComprado=TotComprado + '+
                     quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+' where idcliente='+
                     quotedstr(sqlgeneral.fieldbyname('idcliente').asstring),1,dmreportes.sqlgeneral);
                     apcambios('idcliente', sqlgeneral.fieldbyname('idcliente').asstring, 'clientes', 'frmcobros');

                     querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,'+
                            'usuario,fecha,hora,restante) values (0,'+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+','+
                            quotedstr(edbuscarventa.Text)+','+inttostr(rem)+','+quotedstr(datetostr(FechaServidor))+', '+
                            ' '+quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+','+quotedstr(dmreportes.sqlgeneral2.fieldbyname('FechaVencimiento').asstring)+','+
                            quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+
                            quotedstr(timetostr(HoraServidor))+','+quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+')',1,dmreportes.sqlgeneral);
                     querys('update folios set idremicion='+inttostr(rem),1,dmreportes.sqlgeneral);
                     //actualiza el estatus
                     querys('Update pedidos set estatus=3,FechaCierre='+quotedstr(datetostr(FechaServidor))+' where idpedido='+
                     edbuscarventa.text,1,dmreportes.sqlgeneral);
                     //ya remisiona siguimos.............
                     buscarventalocate;
                  end
                  else
                     exit;
               end
               else
               begin
                  //di cancelar la remision...........
                  application.MessageBox('No se remisiono la venta!','Atención',mb_iconInformation);
                  edbuscarventa.SetFocus;
               end;
            end
            else
            begin
               if ((sqlgeneral.fieldbyname('estatus').asstring = '0') and (sqlgeneral.fieldbyname('inst').asstring = '1'))  then
               begin
                  application.MessageBox('Esta venta no se puede remisionar en este proceso, solo en la opcion de pedidos!','Atención',mb_iconInformation);
               end
               else   //si ya estaba remisionada que siga el proceso normal......
                  buscarventalocate;
            end;
         end
         else ///////frmbusquedas.......
            edbuscarventa.SetFocus;
      end; ///prime if
   end
   else
   begin
      {///////////////////////////////////////////////////////////////////////////////
                ***                 GUARDAR                  ***
      }///////////////////////////////////////////////////////////////////////////////
      querys('select idUnidadNegocio from pedidos where idpedido = '+edbuscarventa.text,0,sqlgeneral);
      unidadNegocio:=0;
      if sqlgeneral.recordcount > 0 then
         unidadNegocio:= sqlgeneral.fieldbyname('idUnidadNegocio').asinteger;
      if unidadNegocio = 4 then   //4 = MONITOREO
      begin
         with frmmesesremision do
         begin
            querys('select m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12 from ConcentradoAbonosxMonitoreo where idcliente = '+lcuenta.Caption,0,sqlgeneral);
            inicializa;
            if sqlgeneral.recordcount > 0 then
            begin
               m1:= sqlgeneral.fieldbyname('m1').asInteger; m2:= sqlgeneral.fieldbyname('m2').asInteger;
               m3:= sqlgeneral.fieldbyname('m3').asInteger; m4:= sqlgeneral.fieldbyname('m4').asInteger;
               m5:= sqlgeneral.fieldbyname('m5').asInteger; m6:= sqlgeneral.fieldbyname('m6').asInteger;
               m7:= sqlgeneral.fieldbyname('m7').asInteger; m8:= sqlgeneral.fieldbyname('m8').asInteger;
               m9:= sqlgeneral.fieldbyname('m9').asInteger; m10:= sqlgeneral.fieldbyname('m10').asInteger;
               m11:= sqlgeneral.fieldbyname('m11').asInteger; m12:= sqlgeneral.fieldbyname('m12').asInteger;
            end;
            ltitulo.Caption:= 'SELECCIONE LOS MESES A PAGAR';
            Update;
            ShowModal;
            tmp_pago:= Round(strtofloat(edabono.Text) / cont);
            querys('select cat.CostoMensual as pago from clientes c, categorias cat where c.idcategoria = cat.idcategoria and c.idcliente = '+lcuenta.Caption,0,sqlgeneral);
            if sqlgeneral.RecordCount > 0 then
            begin
               tmp_pago2:= Round(sqlgeneral.fieldbyname('pago').asFloat * 1.1);
               if (tmp_pago < tmp_pago2-1) then
               begin
                  if application.MessageBox('El pago que esta registrando es menor al que corresponde'+#13+'Desea continuar?','Advertencia',MB_YESNO+MB_ICONASTERISK) = IDNO then
                     exit;
               end;
            end;
         end;
      end;

      if dfecha.Text = '' then
      begin
         application.MessageBox('Debe tener una fecha','Atención',mb_iconwarning);
         edabono.SetFocus;
         exit;
      end;

      if (strtofloat(edabono.text) > strtofloat(lsaldo_venta.caption)) then
      begin
         application.MessageBox('El cobro no puede ser mayor que el saldo de la venta','Atención',mb_iconwarning);
         edabono.SetFocus;
         exit;
      end;

      if strtofloat(edabono.Text) <=  0 then
      begin
         application.MessageBox('El cobro no puede ser cero','Atención',mb_iconwarning);
         edabono.SetFocus;
         exit;
      end;

      //CSI
      if tipocobro = 4 then
      begin
         ab := strtofloat(Format('%8.2f',[strtofloat(trim(edabono.text))]));
         if strtofloat(FormatFloat('#####.##', ab)) > (strtofloat(FormatFloat('#####.##', totalCSI))) then
         begin
            application.MessageBox('El cobro no puede ser mayor al saldo del pedido de la cuenta 10000','Atención',mb_iconwarning);
            edabono.SetFocus;
            exit;
         end;
      end;

      if ckdolares.checked = true then
      begin
         cob:=strtofloat(Format('%8.2f',[(strtofloat(edabono.Text)* strtofloat(edtipocambio.Text))]));
         moneda:='D';
      end
      else
      begin
         cob:=strtofloat(edabono.Text);
         moneda:='P';
      end;
      abono:=Format('%8.2f',[cob]);
      if edcheque.text <> '' then
         cheque:=edcheque.text;
      if cbobancos.Text <> '' then
         banco:=cbobancos.text[2]+cbobancos.text[3];
      if tipocobro = 0 then
         tipo:='0'
      else
         tipo:='1';
      querys('Select idpago from PagosClientes where idpago='+quotedstr(idpago)+' and restante > 0',0,sqlgeneral);
      if sqlgeneral.fieldbyname('idpago').asstring <> '' then
      begin
         if(chkDescuento.checked =true) and (chkDescuento.enabled = true) then
         begin
            // actualizar tablas de clientes , pedidos,detpedidos, pagos clientes con el nuevo descuento.
            bpcambios('clientes', lcuenta.caption, 'idcliente');
            querys('update clientes,PagosClientes set saldo = round((saldo -  cargo ) + (restante - (restante * '+
                  floattostr(DescCargoAuto)+')  ),2), CantUltCompra=round((CantUltCompra -  restante ) + (restante - '+
                  '(restante * '+floattostr(DescCargoAuto)+')  ),2), TotComprado=round((TotComprado -  restante ) + '+
                  '(restante - (restante * '+floattostr(DescCargoAuto)+')  ),2) where clientes.idcliente='+
                  quotedstr(lcuenta.Caption)+' and PagosClientes.idpago ='+quotedstr(idpago),1,sqlgeneral);
            apcambios('idcliente', lcuenta.caption, 'clientes', 'frmcobros');
            querys('update pedidos,PagosClientes set Saldo = round((Saldo -  restante ) + (restante - (restante * '+
                   floattostr(DescCargoAuto)+')) ,2),TotMn=round((TotMn -  restante) + (restante - (restante * '+
                   floattostr(DescCargoAuto)+')) ,2), TotDlls = round((TotDlls-(restante/pedidos.TipoCambio)) + '+
                   '((restante/pedidos.TipoCambio) - ((restante - (restante * '+floattostr(DescCargoAuto)+
                   ')  ) )/pedidos.TipoCambio),2),Iva = round((Iva -((restante/'+floattostr(1+getIVA)+')*'+
                   floattostr(getIVA)+')) +  ((restante -(restante*'+floattostr(DescCargoAuto)+'))/'+floattostr(1+getIVA)+')*'+
                   floattostr(getIVA)+',2), SubTotal = round( (SubTotal - (restante / '+floattostr(1+getIVA)+')) + '+
                   '((restante - (restante * '+floattostr(DescCargoAuto)+')  )  / '+floattostr(1+getIVA)+')  ,2) where pedidos.idpedido='+
                   'PagosClientes.idpedido and PagosClientes.idpago ='+quotedstr(idpago),1,sqlgeneral);
            querys('update DetPedido,PagosClientes,pedidos set costo = round( costo - (costo *  ('+
                   floattostr(DescCargoAuto)+')) ,2) where DetPedido.idpedido= PagosClientes.idpedido and '+
                   'pedidos.idpedido = PagosClientes.idpedido and PagosClientes.idpago ='+
                   quotedstr(idpago),1,sqlgeneral);
            querys('update PagosClientes set cargo = round((cargo - (cargo * '+floattostr(DescCargoAuto)+
                   ')),2), restante = round((restante - (restante * '+floattostr(DescCargoAuto)+')  ),2) where '+
                   'PagosClientes.idpago = '+quotedstr(idpago),1,sqlgeneral);
         end;

         if tipocobro = 4 then
         begin
            TipoMovimiento := 8;
            ednotas.text :=  'Pago de la Venta, Deposito Realizado con fecha '+FechaCSI;
         end
         else
            TipoMovimiento := 2;
         querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
                'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
                'values('+quotedstr(moneda)+','+quotedstr(cheque)+','+quotedstr(banco)+','+
                quotedstr(cboFormaPago.Text[2]+cboFormaPago.Text[3])+','+
                quotedstr(Format('%8.2f',[strtofloat(edtipocambio.Text)]))+','+quotedstr(idpago) +','+
                quotedstr(lcuenta.Caption) +','+quotedstr(edbuscarventa.text) +','+quotedstr(abono) +','+
                quotedstr(edbuscarfactura.Text) +','+ quotedstr(idremicion)+','+inttostr(TipoMovimiento)+','+
                quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',"'+datetostr(date)+'",'+
                quotedstr(datetostr(FechaServidor))+',"'+timetostr(time)+'",'+quotedstr(dfecha.text)+','+
                quotedstr(tipo)+','+quotedstr(ednotas.text)+')',1,sqlpagos);
      end
      else
      begin
         application.MessageBox('Ya fue aplicado un pago a este cobro,cancele el cobro que esta realizando por que ya fue realizado,solicite informacion!','Atención',mb_IconInformation);
         exit;
      end;

      //////////////////  CSI   //////////////////////
      if tipocobro = 4 then
      begin
         //actualizar tablas de clientes , pedidos,detpedidos, pagos clientes con el nuevo descuento.
         querys('update clientes,PagosClientes set saldo = round((saldo +  cargo ) - (restante - (restante * '+
                floattostr(DescCargoAuto)+')  ),2) where clientes.idcliente=10000 and PagosClientes.idpago ='+
               quotedstr(idpago),1,sqlgeneral);
         querys('update pedidos,PagosClientes set Saldo = round(Saldo - restante,2) '+
                'where pedidos.idpedido= '+pedidoCSI+' '+
                'and PagosClientes.idpago ='+quotedstr(idpago),1,sqlgeneral);
         querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
                'idpedido,abono,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,'+
                'notas, restante) values('+quotedstr(moneda)+','+quotedstr(cheque)+','+quotedstr(banco)+','+
                quotedstr(cboFormaPago.Text[2]+cboFormaPago.Text[3])+','+
                quotedstr(Format('%8.2f',[strtofloat(edtipocambio.Text)]))+','+quotedstr(idpago) +', 10000,'+
                quotedstr(pedidoCSI) +', '+floattostr(strtofloat(abono)*-1)+','+
                quotedstr(remisionCSI)+',7,'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                ',"'+datetostr(date)+'",'+quotedstr(datetostr(FechaServidor))+',"'+timetostr(time)+'",'+quotedstr(dfecha.text)+
                ', 1, "Deduccion por cuenta Identificada: '+lcuenta.Caption+' del pedido: '+edbuscarventa.text+' ", '+
                'restante+('+floattostr(strtofloat(abono)*-1)+'))',1,sqlpagos);
         //movimiento 7 cargo por cliente identificado
      end;
      querys('select max(idpago) as id from PagosClientes where idcliente='+quotedstr(lcuenta.Caption)+
             ' and movimiento='+inttostr(TipoMovimiento)+' and idpedido='+quotedstr(edbuscarventa.text),0,SqlPagos);
             edbuscar.Text:=SqlPagos.FieldByName('id').asstring;
      querys('select nombre from TiposPagos where banco=''S'' and iniciales='+quotedstr(cboFormaPago.Text[2]+
             cboFormaPago.Text[3]),0,sqlgeneral);
      if sqlgeneral.FieldByName('nombre').AsString <> '' then
         TipoP:=TipoP+' '+sqlgeneral.FieldByName('nombre').AsString+' '+edcheque.Text;
      frmprincipal.ucprincipal.Log('Dio de Alta el cobro:'+edbuscar.text+ ' de la venta '+edbuscarventa.text,1);

      ///////SI LA CANTIDAD ES MAYOR QUE QUE EL COBRO QUE INDIQUE A QUE PARCILIDAD VA A AFECTAR////////////
      cantidad:=strtofloat(abono);
      pesos:=cantidad + pesos;
      if (cantidad > cobro ) then
      begin
         btnalta.Enabled:=false;
         restacadena:=Format('%8.2f',[(cantidad - cobro)]);
         resta:=strtofloat(Format('%8.2f',[(cantidad - cobro)]));
         querys('UPDATE PagosClientes SET restante=0 WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
         querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edbuscar.Text)+','+
                quotedstr(idpago)+','+quotedstr(abono)+')',1,sqlgeneral);
         // preguntar si desea imprimir recibo por pago de parcialidad
         if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
         begin
            imprimir;
         end;
         if application.MessageBox(pchar('El cobro realizado es mayor que la parcialidad, escoja la siguiente parcialidad que afectara!,la cantidad sobrante es :'+restacadena+''),'Atención',mb_yesno)=idyes then
         begin
            ban:=1;
            mostrargrid;
         end;
      end
      else
      begin
         if (cantidad = cobro ) then
         begin
            querys('UPDATE PagosClientes SET restante=0 WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
            querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edbuscar.Text)+','+
                   quotedstr(idpago)+','+quotedstr(abono)+')',1,sqlgeneral);
            actualizar('-');
         end
         else
         begin
            if (cantidad < cobro ) then
            begin
               querys('UPDATE PagosClientes SET restante=(restante - '+floattostr(cantidad)+') WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
               querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edbuscar.Text)+','+
               quotedstr(idpago)+','+quotedstr(abono)+')',1,sqlgeneral);
               actualizar('-');
               if application.MessageBox(pchar('Desea realizar otro pago al cobro?, faltan :('+floattostr(cobro-cantidad)+') para saldar el cobro'),'Atención',mb_yesno+mb_IconInformation) = idyes then
               begin
                  Transaccion:=1;//normal
                  buscarsaldos;
                  lsaldoparcialidad.caption:=Format('%8.2f',[floattostr(cobro-cantidad)]);
                  edtipocambio.setfocus;
                  edabono.Text:='';
                  buscarsaldos;
                  edabono.text:=floattostr(cobro-cantidad);
                  cobro   :=(cobro-cantidad);
                  ednotas.text:=nota;
                  dfecha.date:=strtodate(lbfecha.Caption);
                  if ckdolares.checked = true then
                  begin
                     ckdolares.Onclick(self);
                  end;
                  exit;
               end;//if application
            end;//if <
         end;//=

         //MODIFICACION\\
         querys('Select idinstal, instpend from pedidos where idpedido='+edbuscarventa.Text+' and instpend = 1', 0, sqlgeneral);
         if sqlgeneral.fieldbyname('instpend').asstring = '1' then
         begin
            querys('Update instalaciones set estatus = 0 where idinstalacion='+sqlgeneral.fieldbyname('idinstal').asstring, 1, sqlgeneral);
            querys('Update pedidos set instpend = 0 where idpedido='+edbuscarventa.Text, 1, sqlgeneral);
         end;
         //endMODIFICACION\\
         if unidadNegocio = 4 then   //4 = MONITOREO
         begin
            with frmmesesremision do
            begin
               querys('update ConcentradoAbonosxMonitoreo set m1='+inttostr(m1)+',m2='+inttostr(m2)+',m3='+
               inttostr(m3)+',m4='+inttostr(m4)+',m5='+inttostr(m5)+',m6='+inttostr(m6)+',m7='+inttostr(m7)+',m8='+
               inttostr(m8)+',m9='+inttostr(m9)+',m10='+inttostr(m10)+',m11='+inttostr(m11)+',m12='+inttostr(m12)+
               ' where idcliente = '+lcuenta.Caption+' and anio = "'+inttostr(anio)+'"',1,sqlgeneral);
            end;
         end;

         if saldado = 0 then
         begin
            if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
               imprimir
            else
               application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
         end
         else
         begin
            ImpresionTipoCobro;
         end;//saldado
         ////////////////////////////////////////////////////////////////////////////////
         ///////                                                                  ///////
         ///////                 AQUI YA SE REALIZO EL COBRO                      ///////
         ///////                                                                  ///////
         ////////////////////////////////////////////////////////////////////////////////
         if MasRem > 1 then
         begin
            if application.MessageBox('Deseas hacer otro cobro a una remision del mismo cliente?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            begin
               saldado:=0;MasRem:=0;//mas remisiones es para poder hacer varios pagos a varias remisiones....
               TipoP:='';
               Transaccion:=0;//normal
               ban:=0;
               pesos:=0;
               cobro:=0;
               mmpagos.Clear;
               lcancelado.Caption:='';
               idpago:=''; idremicion:='';
               btnalta.Enabled:=false;
               btnmodificar.Enabled:=false;
               btnborrar.Enabled:=false;
               btncancelar.Caption:='C&ancelar';
               btncancelar.Hint:='Cancelar la Alta';
               btnalta.Hint:='Guardar los datos de la alta';
               edbuscar.Text:='';
               edbuscar.Enabled:=false;
               leyenda.Visible:=true;
               rgdocumentos.Enabled:=true;
               edbuscarventa.Enabled:=true;
               edbuscarfactura.Enabled:=true;
               dfecha.date:=strtodate(lbfecha.Caption);
               ckpesos.checked:=true;
               ///////////////////   cobro en caja ////////////////////////////////
               //BUSCAR POR CATALOGO//
               querys('SELECT p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura,if(((c.rsocial is null) or '+
                      '(c.rsocial = '''')),concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')),c.rsocial) '+
                      'as Cliente,p.idcliente as IdCliente,p.FechaCreacion,p.TotMn as ImporteNeto,p.FechaVencimiento  '+
                      ' FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) LEFT  JOIN '+
                      ' PagosClientes as pc ON (pc.idpedido=p.idpedido) WHERE  p.idcliente='+quotedstr(cliente)+' and '+
                      ' p.estatus in(0,3,4) and p.saldado=0 and p.FechaCreacion >  ''2005/02/01'' group by p.idpedido ',0,sqlgeneral);        //
               frmbusquedas.maxrow:=sqlgeneral.RecordCount+1;
               MasRem:=sqlgeneral.RecordCount;
               frmbusquedas.query:='SELECT p.idcliente as IdCliente,p.idpedido,if (p.estatus =0,''PED'','+
                                   'IF (p.estatus=3,''REM'',''FACT'')) as Estatus,pc.idfactura as  IDFactura, '+
                                   'p.concepto,p.FechaVencimiento,p.FechaCreacion,p.TotMn as ImporteNeto FROM pedidos as p '+
                                   'INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) LEFT JOIN PagosClientes as pc ON '+
                                   ' (pc.idpedido=p.idpedido)  LEFT JOIN ClientesFact as dc ON(dc.idcliente=p.idcliente) '+
                                   ' WHERE  p.idcliente='+quotedstr(cliente)+' and p.estatus in(0,3,4) and p.saldado=0 and '+
                                   ' p.FechaCreacion >  ''2005/02/01'' group by p.idpedido order by p.FechaCreacion desc';
               frmbusquedas.campo_retorno:='idpedido';
               frmbusquedas.campo_busqueda:='idpedido';
               frmbusquedas.tabla:='';
               frmbusquedas.tblorigen:='pedidos';
               frmbusquedas.ShowModal;
               if frmbusquedas.resultado <> '' then
               begin
                  edbuscarventa.Text:=frmbusquedas.resultado;
                  frmbusquedas.maxrow:=0;
                  /// aqui vamos a validar que si es una remision cobre normal, si no tener que remisionar la venta.....
                  querys('select p.estatus as estatus,p.idcliente as idcliente,p.TotMn as TotMn,un.instalacion as inst '+
                  ' from pedidos as p left join UnidadNegocio as un ON(un.idUnidadNegocio=p.idUnidadNegocio) where p.idpedido='+
                  quotedstr(edbuscarventa.text),0,sqlgeneral);
                  if ((sqlgeneral.fieldbyname('estatus').asstring = '0') and (sqlgeneral.fieldbyname('inst').asstring = '0'))  then
                  begin                                              //// +' and p.estatus=1 and un.instalacion=0
                     //vamos a preguntar si lo desea remisionar.....
                     if application.MessageBox('Deseas remisionar este pedido?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
                     begin
                        //en este momento se remisiona la venta
                        //actualiza el campo ultima compra del cliente al igual que su saldo
                        //trae el maximo numero de remicion
                        querys('select idremicion from folios',0,dmreportes.sqlgeneral);
                        rem:=dmreportes.sqlgeneral.fieldbyname('idremicion').AsInteger+1;
                        Application.CreateForm(TfrmRemiFac, frmRemiFac);
                        frmremifac.inicializa(true,false,strtoint(edbuscarventa.Text),inttostr(rem), 'N');
                        frmremifac.ShowModal;
                        querys('select FechaVencimiento from pedidos where idpedido='+edbuscarventa.Text,0,dmreportes.sqlgeneral2);
                        bpcambios('clientes', sqlgeneral.fieldbyname('idcliente').asstring, 'idcliente');
                        querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',saldo=saldo+'+
                        quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+',TotComprado=TotComprado + '+
                        quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+' where idcliente='+
                        quotedstr(sqlgeneral.fieldbyname('idcliente').asstring),1,dmreportes.sqlgeneral);
                        apcambios('idcliente', sqlgeneral.fieldbyname('idcliente').asstring, 'clientes', 'frmcobros');
                        querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,usuario,'+
                               'fecha,hora,restante) values (0,'+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+','+
                               quotedstr(edbuscarventa.Text)+','+inttostr(rem)+','+quotedstr(datetostr(FechaServidor))+', '+
                               ' '+quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+','+quotedstr(dmreportes.sqlgeneral2.fieldbyname('FechaVencimiento').asstring)+','+
                               quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+
                               quotedstr(timetostr(HoraServidor))+','+quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+')',1,dmreportes.sqlgeneral);
                        querys('update folios set idremicion='+inttostr(rem),1,dmreportes.sqlgeneral);
                        //actualiza el estatus
                        querys('Update pedidos set estatus=3,FechaCierre='+quotedstr(datetostr(FechaServidor))+
                        ' where idpedido='+edbuscarventa.text,1,dmreportes.sqlgeneral);
                        //ya remisiona siguimos.............
                        buscarventalocate;
                     end
                     else
                     begin
                        //di cancelar la remision...........
                        application.MessageBox('No se remisiono la venta!','Atención',mb_iconInformation);
                        edbuscarventa.SetFocus;
                     end;
                  end
                  else
                  begin
                     if ((sqlgeneral.fieldbyname('estatus').asstring = '0') and (sqlgeneral.fieldbyname('inst').asstring = '1'))  then
                     begin
                        application.MessageBox('Esta venta no se puede remisionar en este proceso, solo en la opcion de pedidos!','Atención',mb_iconInformation);
                     end
                     else     //si ya estaba remisionada que siga el proceso normal......
                        buscarventalocate;
                  end;
               end
               else ///////frmbusquedas.......
                  edbuscarventa.SetFocus;
            end
            else
            begin
               edbuscar.Enabled:=true;
               btnmodificar.Enabled:=true;
               btnborrar.Enabled:=true;
               btnalta.Enabled:=true;
               btnalta.Caption:='&Cobrar';
               btnalta.Hint:='Dar de Alta un cobro';
               btncancelar.Caption:='C&errar';
               btncancelar.Hint:='Cerrar esta Ventana';
               edabono.Enabled:=false;
               ednotas.Enabled:=false;
               cboFormaPago.enabled:=false;
               edtipocambio.enabled:=false;
               buscarlocate;
               edbuscar.setfocus;
            end;
         end
         else
         begin
            edbuscar.Enabled:=true;
            btnmodificar.Enabled:=true;
            btnborrar.Enabled:=true;
            btnalta.Enabled:=true;
            btnalta.Caption:='&Cobrar';
            btnalta.Hint:='Dar de Alta un cobro';
            btncancelar.Caption:='C&errar';
            btncancelar.Hint:='Cerrar esta Ventana';
            edabono.Enabled:=false;
            ednotas.Enabled:=false;
            cboFormaPago.enabled:=false;
            edtipocambio.enabled:=false;
            buscarlocate;
            edbuscar.setfocus;
         end;
      end;//if cantidad > cobro
   end;
end;

procedure Tfrmcobros.edbuscarventaButtonClick(Sender: TObject);
begin
//BUSCAR POR CATALOGO//
querys('SELECT p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura,  '+
       'p.concepto,p.idcliente as IdCliente,p.FechaCreacion,p.TotMn as ImporteNeto,p.FechaVencimiento FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) '+
       ' INNER JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido)  WHERE  p.estatus IN(3,4,6) and p.saldado=0 group by p.idpedido',0,sqlgeneral);

frmbusquedas.maxrow:=sqlgeneral.RecordCount+1;
frmbusquedas.query:='SELECT p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura,if (c.nombre <> '' '',concat(c.nombre,'' '',c.apaterno,'' '',c.amaterno),c.rsocial) as Cliente,p.concepto,p.idcliente as IdCliente,p.FechaVencimiento,p.FechaCreacion,p.TotMn as ImporteNeto  '+
                    'FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) INNER JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido)  WHERE  p.estatus IN (3,4,6) and p.saldado=0 group by p.idpedido';
frmbusquedas.campo_retorno:='idpedido';
frmbusquedas.campo_busqueda:='idpedido';
frmbusquedas.tabla:='';
frmbusquedas.tblorigen:='pedidos';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
  begin
  edbuscarventa.Text:=frmbusquedas.resultado;
  buscarventalocate;
  frmbusquedas.maxrow:=0;
  end;
end;

procedure Tfrmcobros.edbuscarventaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
  key:=#0;
  if edbuscarventa.Text <> '' then
    buscarventalocate
  else
    edbuscarventa.OnButtonClick(self);
  end;

if key = #27 then
  begin
  key:=#0;
  edbuscarventa.Text:='';
  end;
end;

procedure Tfrmcobros.DBGVista1DblClick(Sender: TObject);
  var mensaje:integer;
  temp:string;
  rest : double;
begin
if ban=1 then
  begin
  cobro:=DSparcialidades.DataSet.FieldValues['restante'];
  idpago:=DSparcialidades.DataSet.FieldValues['idpago'];
  //lsaldo_venta.Caption:=Format('%8.2f',[DSparcialidades.DataSet.FieldValues['restante']]);
  lsaldo_venta.Caption:= DSparcialidades.DataSet.FieldValues['restante'];

  if resta > cobro then
    begin
    restacadena:=floattostr(cobro);
    mensaje:=1;
    end
  else
    begin
    restacadena:=floattostr(resta);
    mensaje:=0;
    end;

  temp:=Format('%8.2f',[strtofloat(restacadena)]);
  querys('UPDATE PagosClientes SET restante=(restante - '+quotedstr(temp)+')  WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
  querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edbuscar.Text)+','+
          quotedstr(idpago)+','+quotedstr(temp)+')',1,sqlgeneral);
  resta:=resta-cobro;
  restacadena:=floattostr(resta);

  if mensaje = 1 then
    begin
    mostrargrid;
    if sqlparcialidades.recordcount > 0 then
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir;
      showmessage('Sigue sobrando: '+restacadena+' , escoge otra parcialidad!');
      end
    else
      begin //recordcount
      if tipocobro = 0 then
        begin
        // if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        //         imprimir
        //       else
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;

      if tipocobro = 1  then
        begin
        if  UsuarioImpFact =1 then
          begin
          if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
            ImprimirFactura;
          if tipocobro=1 then
            close;
          end
        else
          begin
          if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            imprimir
          else
            application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
          end;//if imprimir factura
        end
      else
        begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir
        else
          application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;//imprimir factura caja.....
      end; //tipocobro

      if tipocobro=3  then
        begin
        if UsuarioImpFact =1 then
          begin
          if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
            ImprimirFactura;
          if tipocobro=1 then
            close;
          end
        else
          begin
          if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            imprimir
          else
            application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
          end;//if imprimir factura
        end
      else
        begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir
        else
          application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;//imprimir factura en domicilio.....
      end; //tipo cobro

      if tipocobro=2 then
        begin
        if  UsuarioFacturaCD =1 then
          begin
        if application.MessageBox('Deseas Imprimir la Factura Domicilio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
          ImprimirFacturaCD;
        if tipocobro=1 then
          close;
        end
      else
        begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir
        else
          application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;
      end
    else
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir
      else
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
      end;//imprimir factura a domicilio.....
    end;//cobro normal
     //end;
     // end; //tipocobro

          ban:=0;
          SPpanel.Percent:=97;
          buscarlocate;
          actualizar('-');
          edbuscar.Enabled:=true;
          btnalta.Enabled:=true;
          btnmodificar.Enabled:=true;
          btnborrar.Enabled:=true;
          btnalta.Caption:='&Cobrar';
          btnalta.Hint:='Dar de Alta un cobro';
          btncancelar.Caption:='C&errar';
          btncancelar.Hint:='Cerrar esta Ventana';
          end;///recordcount
        end
      else
        begin
        if sqlparcialidades.recordcount > 0 then
          begin
          if tipocobro =0 then
            begin
            if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
              imprimir
            else
              application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
            end;

          if tipocobro=1  then
            begin
            if  UsuarioImpFact =1 then
              begin
              if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
                ImprimirFactura;
              if tipocobro=1 then
                close;
              end
            else
              begin
              if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
                imprimir
              else
                application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
              end;//if imprimir factura
            end
          else
            begin
            if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
              imprimir
            else
              application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
            end;//imprimir factura caja.....
          end; //tipocobro

        if tipocobro=3  then
          begin
          if  UsuarioImpFact =1 then
            begin
            if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
              ImprimirFactura;
            if tipocobro=1 then
              close;
            end
          else
            begin
              if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
                imprimir
              else
                application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
            end;//if imprimir factura
          end
        else
          begin
          if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            imprimir
          else
            application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
          end;//imprimir factura en domicilio.....
        end; //tipo cobro

      if tipocobro=2 then
        begin
        if UsuarioFacturaCD =1 then
          begin
          if application.MessageBox('Deseas Imprimir la Factura Domicilio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            begin
            ImprimirFacturaCD;
            if tipocobro=1 then
              close;
            end
          else
            begin
            if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
              imprimir
            else
               application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
            end;
          end
        else
          begin
          if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            imprimir
          else
            application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
          end;//imprimir factura a domicilio.....
        end;//cobro normal
      end;

    ban:=0;
    SPpanel.Percent:=97;
    actualizar('-');
    edbuscar.Enabled:=true;
    buscarlocate;
    btnalta.Enabled:=true;
    btnmodificar.Enabled:=true;
    btnborrar.Enabled:=true;
    btnalta.Caption:='&Cobrar';
    btnalta.Hint:='Dar de Alta un cobro';
    btncancelar.Caption:='C&errar';
    btncancelar.Hint:='Cerrar esta Ventana';
    end;  //if recordcount
  end
else
  begin //mensaje
  if  ((btnalta.Enabled = false) and (btnmodificar.Enabled = false)) then
    begin
    rest := strtofloat(format('%8.2f',[DSparcialidades.DataSet.fieldbyname('restante').asfloat]));
    dfecha.date:=strtodate(lbfecha.Caption);
    idpago:=DSparcialidades.DataSet.FieldValues['idpago'];
    edabono.Text := floattostr(rest);
    cobro := rest;
    lsaldoparcialidad.caption := floattostr(rest);
    idremicion:=DSparcialidades.DataSet.FieldValues['idremicion'];
    if DSparcialidades.DataSet.FieldValues['movimiento'] <> 0 then
      nota:='Pago de '+ dbmnotas.lines.text
    else
      nota:='Pago de la venta';
    SPpanel.Percent:=97;
    gbcobro.Enabled:=true;
    btnalta.Enabled:=true;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    ednotas.text:=nota;
    btnalta.ImageIndex:=1;
    edbuscarventa.Enabled:=false;
    edbuscarfactura.Enabled:=false;
    //dfecha.Enabled:=true;
    edabono.Enabled:=true;
    ednotas.Enabled:=true;
    cboFormaPago.enabled:=true;
    querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
    edtipocambio.Text:=sqlgeneral.Fields.Fields[0].AsString;
    lbcobrodlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edabono.Text) / strtofloat(edtipocambio.Text) )]);
    lbcobro.caption:='Cobro en MN : '+edabono.text;
    edtipocambio.enabled:=true;
    edtipocambio.SetFocus;
    cboFormaPago.itemindex:=0;
    end;  // if btnalta
  end; //primer if
end;

procedure Tfrmcobros.edabonoKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edabono.Text,key);
if (key=#13)then
  begin
     key:=#0;
     //cboFormaPago.itemindex:=0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure Tfrmcobros.dfechaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcobros.DBGVista1KeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
     dbgvista1.OnDblClick(self);
  end;
end;

procedure Tfrmcobros.cboFormaPagoNotInList(Sender: TObject);
begin
cboFormaPago.itemindex:=0;
end;

procedure Tfrmcobros.edbuscarfacturaButtonClick(Sender: TObject);
begin
 //BUSCAR POR CATALOGO//
    frmbusquedas.query:='SELECT r.idfactura ,p.idpedido as IDVenta,ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) as Cliente,p.idcliente as IdCliente,p.FechaCreacion,Saldo as Total,FechaVencimiento  '+
                        'FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) INNER JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido) INNER JOIN RemiFact AS r ON (r.idpedido=p.idpedido) WHERE  p.estatus IN (3,4,6)  '+
                        'and p.saldado=0 and r.idfactura > 0 group by p.idpedido';
    frmbusquedas.campo_retorno:='idfactura';
    frmbusquedas.campo_busqueda:='idfactura';
    frmbusquedas.tabla:='pedidos';
    frmbusquedas.tblorigen:='pedidos';
    frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then begin
            edbuscarfactura.Text:=frmbusquedas.resultado;
            buscarfacturalocate;

        end;

end;

procedure Tfrmcobros.edbuscarfacturaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key=#13)then begin
        key:=#0;
         if edbuscarfactura.Text <> '' then
            buscarfacturalocate
         else
            edbuscarfactura.OnButtonClick(self);
   end;

   if key = #27 then
      begin
      key:=#0;
      edbuscarfactura.Text:='';
   end;

end;

procedure Tfrmcobros.btnborrarClick(Sender: TObject);
begin
//if (TipoMovimiento <> -1) then
if((lcancelado.Caption <> 'MOV: VENTA') and (lcancelado.Caption <> 'MOV: COBRO REALIZADO') and (lcancelado.Caption <> 'MOV: ABONO POR CORTESIAS') and (lcancelado.Caption <> 'MOV: PAGO DE CUENTA IDENTIFICADA')) then
  application.MessageBox('No puedes cancelar este movimiento!','Atención',mb_iconinformation)
else
  begin
  if lcancelado.Caption = 'MOV: VENTA' then
    begin
    if strtofloat(edabono.text) > 0 then
      begin
      if application.MessageBox('Deseas Cancelar el anticipo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        querys('UPDATE PagosClientes set abono=0,restante=restante + '+quotedstr(edabono.text)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edbuscar.text),1,sqlpagos);
        actualizar('+');//actualizar las tablas correspondientes....
        application.MessageBox('Anticipo cancelado!','Información',mb_iconinformation);
        frmprincipal.ucprincipal.Log('Elimino el cobro : '+edbuscar.text,3);
        end;
      end;
    end   // 'MOV: VENTA'
  else
    begin
    if (lcancelado.Caption = 'MOV: COBRO REALIZADO') then
      begin
      if application.MessageBox('Deseas Cancelar este cobro?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
               ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edbuscar.text),1,sqlgeneral);
        //Esta es la que estaba y a veces funciona
        querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) '+
               ' WHERE PagosClientes.idpago=PagosAfecta.idpago2 and PagosAfecta.idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
        // y  a veces funciona esta
        //querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) WHERE PagosClientes.idpago=PagosAfecta.idpago and PagosAfecta.idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
        querys('DELETE FROM PagosAfecta WHERE idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
        actualizar('+');//actualizar las tablas correspondientes....
        buscarlocate;
        application.MessageBox('Cobro cancelado!','Información',mb_iconinformation);
        frmprincipal.ucprincipal.Log('Elimino el cobro : '+edbuscar.text+' del pedido '+edbuscarventa.text ,3);
        end;
      end
    else
      begin
      if lcancelado.Caption = 'MOV: PAGO DE CUENTA IDENTIFICADA' then
        begin
        if application.MessageBox('Deseas Cancelar este cobro?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          begin
          querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                 ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edbuscar.text),1,sqlgeneral);
          //Esta es la que estaba y a veces funciona
          querys('UPDATE PagosClientes SET PagosClientes.restante=restante+'+edabono.text+' '+
                 ' WHERE idpedido='+edbuscarventa.text+' and movimiento = 0',1,sqlgeneral);
          // y  a veces funciona esta
          querys('DELETE FROM PagosAfecta WHERE idpago='+quotedstr(edbuscar.text),1,sqlgeneral);

          querys('UPDATE pedidos set saldo=saldo+'+edabono.text+', saldado=0, usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                   ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpedido='+edbuscarventa.text,1,sqlgeneral);
          actualizar('+');//actualizar las tablas correspondientes....
          //actualiza 10000
          if querys('Select idpedido from PagosClientes where idcliente = 10000 and movimiento = 7 and notas = '+
            '"Deduccion por cuenta Identificada: '+lcuenta.Caption+' del pedido: '+edbuscarventa.text+'"', 0, sqlgeneral) > 0 then
            begin
            pedidoCSI := sqlgeneral.fieldbyname('idpedido').asstring;
            querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                   ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpedido='+pedidoCSI+' and movimiento = 7',1,sqlgeneral);
            querys('UPDATE pedidos set saldo=saldo+'+edabono.text+', saldado=0, usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                   ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpedido='+pedidoCSI,1,sqlgeneral);
            end
          else
            application.MessageBox('No se encontro el pedido de la cuenta 10000!','Atencion',mb_iconinformation);


          buscarlocate;
          application.MessageBox('Cobro cancelado!','Información',mb_iconinformation);
          frmprincipal.ucprincipal.Log('Elimino el cobro : '+edbuscar.text+' del pedido '+edbuscarventa.text ,3);
          end;

        end
      else
        Application.MessageBox('No se puede cancelar este movimiento', 'Atencion', mb_iconinformation);
      end;
    end;//if venta-cobro
  end;
end;



{
case estatus of
    0: begin
       if application.MessageBox('Deseas Cancelar este cobro?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
         begin
         querys('select * from PagosClientes where idpedido='+quotedstr(edbuscarventa.Text)+' and movimiento =1',0,sqlgeneral);
         if sqlgeneral.FieldByName('idcliente').AsString <>  '' then
           begin
           querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                  ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edbuscar.text),1,sqlgeneral);
           querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) '+
                  'WHERE PagosClientes.idpago=PagosAfecta.idpago2 and PagosAfecta.idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
           querys('DELETE FROM PagosAfecta WHERE idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
           actualizar('+');//actualizar las tablas correspondientes....
           buscarlocate;
           application.MessageBox('Cobro cancelado!','Información',mb_iconinformation);
           end
         else
           begin
           if sqlpagos.fieldbyname('movimiento').asstring = '2' then  // si es movimiento 2 se puede eliminar
             begin
           querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                  ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edbuscar.text),1,sqlgeneral);
             //Esta es la que estaba y a veces funciona
           querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) '+
                  ' WHERE PagosClientes.idpago=PagosAfecta.idpago2 and PagosAfecta.idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
             // y  a veces funciona esta
             //querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) WHERE PagosClientes.idpago=PagosAfecta.idpago and PagosAfecta.idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
             querys('DELETE FROM PagosAfecta WHERE idpago='+quotedstr(edbuscar.text),1,sqlgeneral);
             actualizar('+');//actualizar las tablas correspondientes....
             buscarlocate;
             application.MessageBox('Cobro cancelado!','Información',mb_iconinformation);
             end
           else
             begin
             if sqlgeneral.fieldbyname('idpedido').asstring <> '' then
               application.MessageBox('Este cobro tiene parcialidades,solo se puede cancelar el cobro de la parcialidad!','Atención',mb_iconinformation);
             end; //if sql mov 2
           end;//if cliente
         end; //application
       end;// begin


    1: begin
       if SqlPagos.FieldByName('abono').asfloat > 0 then
         begin
         // si tiene abono ok se puede cancelar ese abono ......
         if application.MessageBox('Deseas Cancelar el anticipo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
           begin
           querys('UPDATE PagosClientes set abono=0,restante=restante + '+quotedstr(edabono.text)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edbuscar.text),1,sqlpagos);
           actualizar('+');//actualizar las tablas correspondientes....
           application.MessageBox('Anticipo cancelado!','Información',mb_iconinformation);
           end;
         end
       else
         application.MessageBox('No puedes cancelar este movimiento!','Atención',mb_iconinformation);
      end;// estatus  = 1

    2: application.MessageBox('Este movimiento ya fue cancelado!','Atención',mb_iconinformation);
end;//case
              }



procedure Tfrmcobros.btnmodificarClick(Sender: TObject);
begin   {
case estatus of

        0 : begin
            //buscar si hay que modificar algun cobro que hizo varios cobros
            querys('SELECT idpago FROM PagosAfecta WHERE idpago='+quotedstr(edbuscar.text),0,sqlgeneral);
            if sqlgeneral.recordcount = 1 then begin
                  if btnmodificar.Caption = '&Editar' then
                  begin

                  btnalta.Enabled:=false;
                  btnborrar.Enabled:=false;
                  //tblpagos.edit;
                  frmprincipal.ucprincipal.Log('Dio click en el botón editar cobros',0);
                  btnmodificar.Caption:='&Guardar';
                  btncancelar.Caption:='&Cancelar';
                  btncancelar.Hint:='Cancelar la Edición';
                  btnmodificar.hint:='Guardar los Cambios Realizados';
                  btnmodificar.ImageIndex:=1;
                  dfecha.Enabled:=true;
                  edabono.Enabled:=true;
                  ednotas.Enabled:=true;
                  cboFormaPago.enabled:=true;
                  dfecha.SetFocus;
                  //edabono.SetFocus;

                  end else begin

                      if strtofloat(edabono.Text) <=  0 then begin
                           application.MessageBox('El cobro no puede ser cero','Atención',mb_iconinformation);
                           edabono.SetFocus;
                           exit;
                      end;

                      if (strtofloat(edabono.text) <= cobro ) then begin
                          application.MessageBox('El cobro no puede ser mayor que el cargo de la parcialidad','Atención',mb_iconinformation);
                          edabono.text:=floattostr(cobro);
                          edabono.SetFocus;
                          exit;
                      end;

                        ///update el saldo de clientes
                      querys('UPDATE clientes SET saldo=(saldo + '+quotedstr(tblpagos.FieldByName('abono').AsString)+') WHERE idcliente='+quotedstr(lcuenta.Caption),1,sqlgeneral);
                        ///update a la parcialidad que afecto
                      querys('UPDATE PagosClientes SET restante=(restante + '+quotedstr(tblpagos.FieldByName('abono').AsString)+')  WHERE idpago='+quotedstr(tblpagos.FieldByName('idpago_afecta').AsString),1,sqlgeneral);

                       btnalta.Enabled:=true;
                       btncancelar.Caption:='&Cerrar';
                       btnmodificar.Caption:='&Editar';
                       btnmodificar.hint:='Editar los datos de la Compra Actual';
                       btnborrar.Enabled:=true;
                       edbuscar.Enabled:=true;
                       btncancelar.Caption:='&Cerrar';
                       btncancelar.Hint:='Cerrar esta Ventana';
                       tblpagos.FieldByName('abono').AsString:=edabono.Text;
                       tblpagos.FieldByName('TipoPago').AsString:= cboFormaPago.Text[2]+cboFormaPago.Text[3];
                       tblpagosusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
                       tblpagosFechaVence.AsString:=datetostr(date);
                       tblpagosfecha.AsString:=datetostr(date);
                       tblpagoshora.AsString:=timetostr(time);
                       tblpagos.Post;
                       actualizar('-');//actualizar las tablas correspondientes....
                       buscarlocate;
                       frmprincipal.ucprincipal.Log('Edito el cobro:'+tblpagosidpago.AsString,2);
                       application.MessageBox('Cambio Realizado!','Información',mb_iconinformation);
                  end;
             end else
                     application.MessageBox('Si necesitas modificar este cobro, primero cancelalo!','Atención',mb_iconinformation);

             end;
        1: application.MessageBox('No puedes cancelar este movimiento!','Atención',mb_iconinformation);

        2: application.MessageBox('Este movimiento ya fue cancelado!','Atención',mb_iconinformation);

end;//case


   }
end;

procedure Tfrmcobros.cboFormaPagoEnter(Sender: TObject);
begin
cboFormaPago.itemindex:=0;
end;

procedure Tfrmcobros.ckdolaresClick(Sender: TObject);
//var c:double;
begin
if ((btnalta.Caption = '&Guardar') or (btnmodificar.caption = '&Guardar')) then begin

if ckdolares.checked=true then begin
if ckpesos.checked = true then begin

    ckpesos.checked:=false;
    lbcobrodlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edabono.Text) / strtofloat(edtipocambio.Text) )]);
 edabono.text := Format('%8.2f',[( strtofloat(edabono.text) / strtofloat(edtipocambio.text)  )]);
 lbcobro.caption:='Cobro en MN : '+Format('%8.2f',[( strtofloat(edabono.text) * strtofloat(edtipocambio.text)  )]);

end;
end;

end;


end;

procedure Tfrmcobros.ckpesosClick(Sender: TObject);
begin
if ((btnalta.Caption = '&Guardar') or (btnmodificar.caption = '&Guardar')) then begin

if ckpesos.checked=true then
if ckdolares.checked = true then begin
   ckdolares.checked:=false;
   edabono.text:=Format('%8.2f',[( strtofloat(edabono.Text) * strtofloat(edtipocambio.Text))]);
   lbcobro.caption:='Cobro en MN : '+edabono.text;
   lbcobrodlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edabono.Text) / strtofloat(edtipocambio.Text) )]);


end;

end;//if
end;

procedure Tfrmcobros.cbobancosNotInList(Sender: TObject);
begin
cbobancos.itemindex:=0;
end;

procedure Tfrmcobros.edtipocambioKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edtipocambio.Text,key);
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcobros.edabonoExit(Sender: TObject);
var cob:double;
begin

    if ckdolares.checked = true then begin
        cob:=(strtofloat(edabono.Text)* strtofloat(edtipocambio.Text));
       lbcobro.caption:='Cobro en MN : '+ Format('%8.2f',[cob]);
    end else begin
        cob:=strtofloat(edabono.text);
        lbcobro.caption:='Cobro en MN : '+ Format('%8.2f',[cob]);
    end;

end;
procedure Tfrmcobros.cboFormaPagoExit(Sender: TObject);
begin
cargarcombo;
end;

procedure Tfrmcobros.cboFormaPagoChange(Sender: TObject);
begin
cargarcombo;
end;

procedure Tfrmcobros.edtipocambioChange(Sender: TObject);
begin
if ((edabono.text <> '') and (edtipocambio.text <> '') and ((btnalta.caption = '&Guardar') or (btnmodificar.caption = '&Guardar'))) then
lbcobrodlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edabono.Text) / strtofloat(edtipocambio.Text) )])
else
lbcobrodlls.Caption:='Cobro en DLLS : ';

end;

procedure Tfrmcobros.btnFechaAplicaClick(Sender: TObject);
begin


 if TipoCobro = 0 then
  begin
     Application.CreateForm(TfrmFechaAplicacion,frmFechaAplicacion);
     frmFechaAplicacion.ShowModal;
     lbfecha.caption:=datetostr(FechaAplica);
  end;

end;

procedure Tfrmcobros.btnimprimirClick(Sender: TObject);
begin

with dmreportes do
 begin

       querys('SELECT ClientesFact.idcliente,ClientesFact.NombreCres AS Cliente,concat(tp.nombre,'' '',pc.cheque) as TipoP, pedidos.concepto,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '', '+
              'ifnull(usuarios.amaterno,'' '')) as Usuario, pedidos.idpedido,if (pc.movimiento=1,pc.notas,''Rem: ''+pc.idremicion) AS REM,if (((pc.recibo is null) or (pc.recibo = '' '')),1,0) as actualizar,if (((pc.recibo is null) or (pc.recibo = '' '')) '+
              ',(FolioRecibo + 1),pc.recibo) as Folio,abono as TotMn FROM pedidos LEFT OUTER JOIN ClientesFact ON (pedidos.idcliente = ClientesFact.idcliente) LEFT OUTER JOIN usuarios ON '+
              ' (pedidos.idvendedor = usuarios.idusuario) join folios LEFT JOIN PagosClientes as pc ON (pc.idpedido=pedidos.idpedido) LEFT JOIN  TiposPagos  as tp ON(tp.iniciales=pc.TipoPago) WHERE pc.idpago='+quotedstr(edbuscar.text),0,sqlgeneral);

       //querys(cadena,0,sqlgeneral);

                ppReport.DeviceType:='Printer';
                ppReport.Template.DatabaseSettings.Name := 'Recibos';
                ppReport.Template.LoadFromDatabase;
                ppReport.Template.SaveToDatabase;
                ppReport.Print;
                ppReport.DeviceType:='Screen';

     if sqlgeneral.fieldbyname('actualizar').asstring = '1'  then begin
            ///actualizar folio
             querys('UPDATE PagosClientes SET recibo='+quotedstr(sqlgeneral.fieldbyname('Folio').AsString)+' WHERE idpago='+quotedstr(edbuscar.text),1,sqlgeneral2);
             querys('UPDATE folios set FolioRecibo=FolioRecibo+1',1,sqlgeneral3);
    end;


end;

end;

procedure Tfrmcobros.btncobrosClick(Sender: TObject);
var hija:TfrmPagosDebe;
begin

        if lcuenta.Caption <> '' then
        begin
           hija:=TfrmPagosDebe.Create(self);
           hija.inicializa(lcuenta.Caption);
           hija.Show;
        end else
                  application.messagebox('No hay cuenta con que consultar!','Atencion',mb_IconInformation);

end;

procedure Tfrmcobros.FormActivate(Sender: TObject);
begin
shortdateformat:='yyyy/mm/dd';
end;

procedure Tfrmcobros.buscarbloqueado;
begin        {
querys('SELECT pc.idcliente, sum(restante) as restante,c.idnota as nota  FROM clientes as c left join pedidos as p '+
       'ON(p.idpedido=pc.idpedido) LEFT JOIN PagosClientes as pc  ON(c.idcliente=pc.idcliente) LEFT '+
       'JOIN contratos as con ON(c.TipoCont=con.TipoCont) WHERE c.idcliente = '+quotedstr(lcuenta.caption)+
       ' and bloqueado = ''1'' and  p.estatus in(3,4) and pc.movimiento IN(0,1,4) '+
       'group by p.idcliente', 0, sqlgeneral);
if sqlgeneral.recordcount > 0 then
  begin
  if sqlgeneral.fieldbyname('restante').asinteger <= 2 then
    begin
    bpcambios('clientes', lcuenta.caption, 'idcliente');
    querys('Update clientes set bloqueado =''0'',NotaBloqueo='''' WHERE idcliente = '+quotedstr(lcuenta.caption), 1, dmreportes.sqlgeneral);
    apcambios('idcliente', lcuenta.caption, 'clientes', 'frmCobros');
    querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
    inttostr(sqlgeneral.fieldbyname('nota').asinteger)+','+quotedstr('DESBLOQUEO')+',CONCAT(''DESBLOQUEO AUTOMATICO EN CAJA A LA FECHA DE '','''',"'+datetostr(date)+'"),0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',"'+timetostr(time)+'","'+datetostr(date)+'",''CLIENTES'','+quotedstr(lcuenta.caption)+')',1,sqlgeneral);
    application.messagebox('El cliente se ha desbloqueado', 'Informacion', mb_iconinformation);
    end;
  end;      }

end;

procedure Tfrmcobros.chkDescuentoClick(Sender: TObject);
begin

if (btnalta.Enabled = false) then
   chkDescuento.checked := false

else
  begin

    if (chkDescuento.checked = true) then
    begin
         temporalPagoVenta := strtofloat(edabono.text);
         edabono.text := Format('%8.2f',[strtofloat(edabono.text) -  (strtofloat(edabono.text) * (DescCargoAuto)) ]);
         lsaldo_venta.caption := edabono.text;
         cobro := strtofloat(edabono.text);
         lsaldo_venta.caption := edabono.text;
         edNotas.text :='El descuento es del '+floattostr(DescCargoAuto*100)+'%, el nuevo valor de la venta es $'+edabono.text ;
//         application.messagebox(pchar('El descuento fue del '+floattostr(DescCargoAuto*100)+'%, el nuevo valor de la venta es $'+edabono.text),'Atencion',mb_IconInformation);
    end else
      begin
         //edabono.text := Format('%8.2f',[strtofloat(edabono.text) +  (strtofloat(edabono.text) * (DescCargoAuto))]);
         edabono.text :=  floattostr(temporalPagoVenta);
         application.messagebox(pchar('No se realizara el descuento el valor se mantiene a como fue remisionado : $'+edabono.text),'Atencion',mb_IconInformation);
         edNotas.text := '';
         cobro := strtofloat(edabono.text);
         lsaldo_venta.caption := edabono.text;
      end;


    end;
end;

procedure Tfrmcobros.ImprimirFact(TipoFact:string);
var year,dia,mes:word;
    //CantEnLetras,
    remicionado:Boolean;
    dec,idfactura,TotVenta,idfac,idcliente: string;    //   ,deducible
begin
TipoFact := 'D';
//solo podran imprimir facturas de cobro los usuarios con los derechos correspondientes
//si puede imprimir facturas el usuario.........
querys('select idremicion, idfactura from RemiFact where idpedido='+quotedstr(edbuscarventa.Text)+' and idfactura <> ''0'' ',0,sqlgeneral);
if sqlgeneral.FieldByName('idremicion').AsString = '0' then
  remicionado := false
else
  remicionado := true;
if sqlgeneral.FieldByName('idfactura').AsString = '' then
  begin
  //mostrar pantalla de facturar......
  //trae el maximo numero de factura
  querys('select Factura'+TipoFact+' from folios',0,sqlgeneral);
  if TipoFact = 'D' then
    begin
    idfactura:=TipoFact+inttostr(sqlgeneral.fieldbyname('FacturaD').AsInteger+1);
    idfac:=inttostr(sqlgeneral.fieldbyname('FacturaD').AsInteger+1);
    end
  else
    if TipoFact = 'C' then
      begin
      idfactura:=TipoFact+inttostr(sqlgeneral.fieldbyname('FacturaC').AsInteger+1);
      idfac:=inttostr(sqlgeneral.fieldbyname('FacturaC').AsInteger+1);
      end;

  Application.CreateForm(TfrmRemiFac, frmRemiFac);
  frmremifac.inicializa(false,remicionado,strtoint(edbuscarventa.Text),idfactura, 'N');
  frmremifac.ShowModal;  //mostramos forma de factura.......

   //actualiza el estatus
  querys('Update pedidos set estatus=4 '+
          //',FechaCreacion="'+datetostr(date)+'"'+
          ' WHERE idpedido='+edbuscarventa.Text,1,sqlgeneral);
  querys('update folios set Factura'+TipoFact+'='+quotedstr(idfac),1,sqlgeneral);
  querys('UPDATE PagosClientes SET idfactura='+quotedstr(idfactura)+' where idpedido='+quotedstr(edbuscarventa.text),1,sqlgeneral);

   ///actualiza el campo ultima compra del cliente al igual que su saldo
  bpcambios('clientes', lcuenta.caption, 'idcliente');
  querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',TotComprado=TotComprado+'+quotedstr(TotVenta)+' where idcliente='+quotedstr(lcuenta.caption),1,sqlgeneral);
  apcambios('idcliente', lcuenta.caption, 'clientes', 'frmcobros');
  end
else
  idfactura:=TipoFact+sqlgeneral.fieldbyname('idfactura').AsString;

//////impresion de la factura..........................
querys('select TotMn from pedidos where idpedido='+quotedstr(edbuscarventa.text),0,sqlgeneral);
TotVenta:=sqlgeneral.fieldbyname('TotMn').AsString;
     {
try
  dmreportes.NumToLetras.Numero := strtoint(midstr(TotVenta,1,posex('.',TotVenta)-1));
  dec := midstr(TotVenta,posex('.',TotVenta)+1,length(TotVenta));
except
  dmreportes.NumToLetras.Numero := 0;
  dec := '0';
end;    }

with dmreportes do
  begin
  querys('select idcliente,FechaVencimiento from pedidos where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);
  querys('select idcliente,FechaVencimiento from pedidos where idpedido='+quotedstr(edbuscarventa.Text),0,sqlgeneral);

  if sqlgeneral.FieldByName('idcliente').AsString <> '' then
    begin
    idcliente:=sqlgeneral.fieldbyname('idcliente').AsString;
    decodedate(sqlgeneral.fieldbyname('FechaVencimiento').AsDateTime,year,mes,dia);
    end;

  RVP.Engine:=RvSystem2;
  sqlclientesfact.Close;
  sqlclientesfact.ParamByName('dia').Value := dia;
  sqlclientesfact.ParamByName('mes').Value := meses[mes];
  sqlclientesfact.ParamByName('ano').Value := year;
  sqlclientesfact.ParamByName('ped').Value := strtoint(edbuscarventa.Text);
  sqlclientesfact.ParamByName('idcliente').Value :=idcliente;
  //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(dmreportes.NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
  sqlclientesfact.ParamByName('cant').Value := 'PESOS';
  sqlclientesfact.ParamByName('Fact').Value :=idfactura;
  sqlclientesfact.Open;
 { if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
    deducible := '1'
  else
    deducible := floattostr(1+getIVA);


  querys('select DetPedido.idpedido,DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido.cant,DetPedido.piezas,if ('+floattostr(1+getIVA)+'='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetPedido.tc,if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') '+
         ' as aplica_desc,(DetPedido.costo*'+deducible+'*DetPedido.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1,(((DetPedido.costo-(DetPedido.costo*articulos.desc_esp/100)) + ((DetPedido.costo- '+
         '(DetPedido.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.cant) + ((((DetPedido.costo/articulos.piezasxunidad)-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPedido.costo/articulos.piezasxunidad)'+
         '-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), ((DetPedido.costo+(DetPedido.costo*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo/articulos.piezasxunidad)+'+
         '((DetPedido.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas))*'+deducible+'*DetPedido.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPedido.cant)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,'+
         'DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = articulos.cod_cve where DetPedido.idpedido='+quotedstr(edbuscarventa.Text)+' order by DetPedido.id',0,sqlgeneral2);]
 }
  querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+edbuscarventa.Text+' '+
        'order by dp.id',0,sqlgeneral2);


  rvp.ProjectFile := GetConfiguraciones('PathSysalarmServer', true)+ 'Reportes_sysalarm.rav';
  RVP.ExecuteReport('Factura');
  RVP.Engine:=RvSystem1;
  end;
  //////finalizacion de la impresion.........

end;
{
procedure Tfrmcobros.ComisionesVend(cobro, anticipo:boolean);
begin
if cobro = true then
  begin
  if querys('select p.idpedido, p.idunidadnegocio, idvendedor from PagosClientes as pc right join pedidos '+
            'as p on p.idpedido=pc.idpedido left join UnidadNegocio as u on u.idunidadnegocio=p.idunidadnegocio '+
            'where idpago = '+edbuscar.text+' and comisiones = 1 and instalacion = 1', 0, sqlgeneral) > 0 then
    querys('Insert into ComisionesKardex (idusuario, idpedido, idpago, cargo, restante, '+
         'mes, movimiento, nota, idunidadnegocio, usuario, fecha, hora) values ('+sqlgeneral.fieldbyname('idvendedor').asstring+
         ', '+edbuscarventa.Text+', '+edbuscar.text+', '+edabono.Text+', '+edabono.Text+
         ', month("'+datetostr(date)+'"), 2, "ABONO POR COBRO REALIZADO", '+sqlgeneral.fieldbyname('idunidadnegocio').asstring+
         ', "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);
    end
  else
    begin
    if anticipo = false then
      querys('Delete from ComisionesKardex where idpago='+edbuscar.text, 1, sqlgeneral)
    else
      querys('Update ComisionesKardex set cargo=0, restante=restante-'+edabono.text+' where idpago='+edbuscar.text, 1, sqlgeneral);
    end;
end;}

procedure Tfrmcobros.ImpresionTipoCobro;
begin

if tipocobro = 0 then
  application.MessageBox('Cobro realizado!','Información',mb_iconinformation);

if tipocobro = 1 then
  begin
  if UsuarioImpFact = 1 then
    begin
    if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      begin
      ImprimirFactura;
      if tipocobro=1 then
        close;
      end
    else
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
         imprimir
      else
         application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
      end;//if imprimir factura
    end
  else
    begin
    if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      imprimir
    else
      application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
    end;//imprimir factura caja.....
  end; // tipocobro = 1
  
  if tipocobro = 3 then
    begin
    if UsuarioImpFact = 1 then
      begin
      if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        ImprimirFactura;
        if tipocobro = 1 then
          close;
        end
      else
        begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir
        else
          application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;//if imprimir factura
      end
    else
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir
      else
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
      end;//imprimir factura caja.....
    end;//tipocobro = 3


  if tipocobro = 2 then
    begin
    if UsuarioFacturaCD =1 then
      begin
      if application.MessageBox('Deseas Imprimir la Factura Domicilio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        ImprimirFacturaCD;
        if tipocobro = 1 then
          close;
        end
      else
        begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir
        else
          application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;
      end
    else
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir
      else
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
      end;
    end;//imprimir factura a domicilio.....

  /////////////////////////////////////////////////////////////////////////////
  if tipocobro=5 then
    begin
    if UsuarioFacturaMX = 1 then
      begin
      if application.MessageBox('Deseas Imprimir la Factura MX?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        ImprimirFacturaMX;
        end
      else
        begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir
        else
          application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
        end;
      end
    else
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir
      else
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
      end;
    end;
 {   }
end;

End.


