{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
2009/03/25 dalyla Desgloce el iva
--------------------------------------------------------------------------------
2007/12/06 Dalila Calcula Costo Promedio y quitar variables que no sirven 
}///////////////////////////////////////////////////////////////////////////////
unit UNoNotasCredito;

interface

uses
  Windows,strutils, Messages, SysUtils,dateutils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,qdialogs, RzEdit, RzBtnEdt, StdCtrls, Mask, RzDBEdit, RzLabel, RzCmboBx,
  RzButton, DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog,
  LMDCustomCheckListDlg, LMDCheckListDlg, RzDTP, ToolWin, cxCurrencyEdit,
  RzBckgnd;

type
  TfrmNoNotasCredito = class(TForm)
    gbcliente: TGroupBox;
    RzLabel9: TRzLabel;
    lblmovil: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblentre: TRzLabel;
    lblalta: TRzLabel;
    lblfuente: TRzLabel;
    lblorigen: TRzLabel;
    lblnombre: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel47: TRzLabel;
    RzLabel8: TRzLabel;
    lblcategoria: TRzLabel;
    RzLabel45: TRzLabel;
    edentre: TRzDBEdit;
    ednombre: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    c: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    edcuenta: TRzDBEdit;
    edrsocial: TRzDBEdit;
    edcontrol: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    edGiro: TRzDBEdit;
    GBprincipal: TGroupBox;
    edcvecte: TRzButtonEdit;
    RzLabel39: TRzLabel;
    edcvevend: TRzButtonEdit;
    RzLabel1: TRzLabel;
    gbarticulo: TGroupBox;
    RzLabel15: TRzLabel;
    Label8: TLabel;
    lblproducto: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    Label1: TLabel;
    chkpiezas: TCheckBox;
    btnagregar: TRzBitBtn;
    CboUtilidad: TRzComboBox;
    edDescripcion: TRzEdit;
    EdPrecio: TRzEdit;
    EdDesc: TRzEdit;
    edTInsta: TRzEdit;
    edcodigo: TRzButtonEdit;
    edCantidad: TRzEdit;
    sqlclientes: TMyQuery;
    dsclientes: TDataSource;
    btnalta: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel2: TRzLabel;
    edfactura: TRzButtonEdit;
    edFecha: TRzDateTimeEdit;
    RzLabel28: TRzLabel;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    paquete: TcxGridDBColumn;
    cxmoneda: TcxGridDBColumn;
    tiempo: TcxGridDBColumn;
    precio: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    sqlrejilla: TMyQuery;
    dsrejilla: TDataSource;
    edNumNC: TRzButtonEdit;
    RzLabel11: TRzLabel;
    Dialogo: TLMDCheckListDlg;
    SqlGeneral: TMyQuery;
    sqltemp: TMyQuery;
    gbtotales: TGroupBox;
    RzLabel22: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    edTotMat: TRzNumericEdit;
    edDescuento: TRzNumericEdit;
    ediva: TRzNumericEdit;
    edTotDlls: TRzNumericEdit;
    edTotMn: TRzNumericEdit;
    edSaldo: TRzNumericEdit;
    edAnticipo: TRzEdit;
    edTCP: TRzEdit;
    RzLabel40: TRzLabel;
    GBAdicionales: TGroupBox;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    edNumPed: TRzEdit;
    edAduana: TRzEdit;
    dtpFechaAduana: TRzDateTimePicker;
    sqlNotasCred: TMyQuery;
    dtpFecPagAnt: TRzDateTimePicker;
    RzLabel7: TRzLabel;
    mmObservaciones: TRzRichEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    sqlinserta: TMyQuery;
    RzLabel10: TRzLabel;
    edventa: TRzEdit;
    btnimprimir: TRzBitBtn;
    RzBackground1: TRzBackground;
    RzLabel16: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    lbufh: TRzLabel;
    procedure edcvevendButtonClick(Sender: TObject);
    procedure edcvecteButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edfacturaButtonClick(Sender: TObject);
    procedure edcvecteChange(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure edcvecteKeyPress(Sender: TObject; var Key: Char);
    procedure edcvecteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure edCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure edcvevendKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edfacturaKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure edCantidadChange(Sender: TObject);
    procedure EdPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure EdPrecioExit(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoChange(Sender: TObject);
    procedure edAnticipoKeyPress(Sender: TObject; var Key: Char);
    procedure edAnticipoExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure edNumNCButtonClick(Sender: TObject);
    procedure mmObservacionesChange(Sender: TObject);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure edNumNCKeyPress(Sender: TObject; var Key: Char);
    procedure edNumPedKeyPress(Sender: TObject; var Key: Char);
    procedure edAduanaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFechaAduanaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFecPagAntKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnimprimirClick(Sender: TObject);
    procedure edNumNCChange(Sender: TObject);
    procedure edTCPExit(Sender: TObject);
  private
    { Private declarations }
    semiauto : integer;
   procedure LimpiaTotales;
   procedure InsertaArticulo(cod_cve:string;cantidad:integer);
   procedure InsertaArticulosPaquete(cod_paquete:string;cantidad:integer);
   procedure LimpiaDatArt;
   procedure MetodoAlta;
   procedure CalculaTotales;
   function ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
   function ValidaProducto(CodCve:string):integer;
   function TraeNc(idnc : integer) : integer;
   procedure ModificaArticulo;
  // procedure InsertaArticulosPaquete(tabla,campo,valor,cod_paquete:string;query:tmyquery;cantidad:integer);
  public
    { Public declarations }
    idpedido : string;
    procedure limpia;
  end;

var
  frmNoNotasCredito: TfrmNoNotasCredito;

implementation

uses Urecursos, Ubusquedas, Udm, Uprincipal, UBuscaArt, Udmrep;

{$R *.dfm}

procedure tfrmNoNotasCredito.LimpiaTotales;
begin
    edTotMat.Text:='0';
    edDescuento.Text:='0';
    edIva.Text:='0';
    edTotDlls.Text:='0';
    edTotMn.Text:='0';
    edanticipo.Text:='0';
    edSaldo.Text:='0';
end;

function TfrmNoNotasCredito.TraeNc(idnc : integer) : integer;
begin
chtecla := #13;
 //trae los datos de la Nota de Credito si existe
 querys('select * from NoNotasCredito where idnc='+edNumNc.Text,0,SqlNotasCred);
 if SqlNotasCred.RecordCount > 0 then
  begin
   edcvecte.Text := SqlNotasCred.fieldbyname('idcliente').AsString;
   lbufh.Caption := UFH(SqlNotasCred);
   edcvecte.OnKeyPress(self,chtecla);
   if edGiro.Text = '' then
    begin
     limpia;
     result := 0;
     exit;
    end;
   btnimprimir.Enabled := true;
   //trae el idpedido
   querys('select idpedido from NoRemiFact where idfactura='+quotedstr(SqlNotasCred.fieldbyname('idfactura').AsString),0,sqlgeneral);
   edventa.Text := sqlgeneral.fieldbyname('idpedido').AsString;
   edcvevend.Text := SqlNotasCred.fieldbyname('idvendedor').AsString;
   edfactura.Text := SqlNotasCred.fieldbyname('idfactura').AsString;
   edfecha.Date := SqlNotasCred.fieldbyname('FechaNc').AsDateTime;
   edTCP.Text := trim(format('%8.2f',[SqlNotasCred.fieldbyname('TipoCambio').Asfloat]));
   if edTCP.Text = '0.00' then
    begin
     //trae el tipo de cambio
     querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
     if application.MessageBox(pchar('No se encontro el tipo de cambio desea utilizar el predeterminado $'+trim(format('%8.2f',[sqlgeneral.fieldbyname('valor').asfloat]))),'Confirmacion',mb_yesno+mb_iconquestion)=idyes then
      edtcp.Text :=trim(format('%8.2f',[sqlgeneral.fieldbyname('valor').asfloat]))
     else
      while edTCP.Text = '0' do
       edTCP.Text := floattostr(inputbox('Captura de Tipo de Cambio','No se encontro el tipo de cambio, debe de teclearlo:',1.000,1.000,100000.000,3));
    end;
   edNumPed.Text := SqlNotasCred.fieldbyname('pedimento').AsString;
   edAduana.Text := SqlNotasCred.fieldbyname('aduana').AsString;
   dtpFechaAduana.Date := SqlNotasCred.fieldbyname('FechaAduana').AsDateTime;
   dtpFecPagAnt.Date := SqlNotasCred.fieldbyname('FechaPago').AsDateTime;
   mmObservaciones.Text := SqlNotasCred.fieldbyname('observaciones').AsString;
   //refresca la rejilla de datos
   sqlrejilla.Close;
   sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
   sqlrejilla.ParamByName('idnc').Value := edNumNc.Text;
   sqlrejilla.Open;
   CalculaTotales;
   {
   edTotMat.Text:=Format('%8.2f',[strtofloat(SqlNotasCred.fieldbyname('subtotal').AsString)]);
   ediva.Text := format('%8.2f',[strtofloat(SqlNotasCred.fieldbyname('impuesto').AsString)]);
   edSaldo.Text:=Format('%8.2f',[strtofloat(SqlNotasCred.fieldbyname('saldo').AsString)]);
   }
   gbarticulo.Enabled := false;
   result := 1;
  end
 else
  begin
   application.MessageBox('Ese numero de Nota de Credito no Existe','Aviso',mb_iconinformation);
   result:=0;
 end;
end;

function TfrmNoNotasCredito.ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
var
unidades,c,p,pxu,ex,dif:integer;
begin
//los resultados de esta funcion son los siguientes
//si regresa 0 significa que puede vender bien
//si regresa cantidad negativa es que ya no hay existencias
//si regresa cantidad positiva significa que no puede vender por completo la mercancia
//p:=0;c:=0;ex:=0;pxu:=0;unidades:=0;
querys('select sum(cant) as cant, sum(piezas) as piezas from NoDetNotasCredito where (idnc='+edNumNc.Text+' or idmaq='+frmprincipal.idmaq+' or idpedido='+idpedido+') and cod_cve='+quotedstr(CodCve),0,sqlgeneral);
c:=sqlgeneral.fieldbyname('cant').AsInteger;
p:=sqlgeneral.fieldbyname('piezas').AsInteger;
if piezas then
 p:=p+cantidad
else
 c:=c+cantidad;

unidades:=cantidad;
//aqui busca el articulo por codigo de barras o por clave en la detalle de pedidos
querys('SELECT DetPedido.cod_cve,sum((DetPedido.cant * articulos.piezasxunidad) + DetPedido.piezas) AS existencia,articulos.servicio,articulos.paquete,articulos.PrecioCapturable,articulos.piezasxunidad '+
       'FROM NoDetPedido as DetPedido INNER JOIN articulos ON (DetPedido.cod_cve = articulos.cod_cve) '+
       'WHERE (DetPedido.idpedido = '+idpedido+') AND ((articulos.cod_barras = '+quotedstr(CodCve)+') or (articulos.cod_cve = '+quotedstr(CodCve)+')) GROUP BY DetPedido.cod_cve,articulos.servicio,articulos.paquete,articulos.PrecioCapturable,articulos.piezasxunidad',0,SqlGeneral);
if (SqlGeneral.FieldByName('servicio').AsInteger = 0) and (SqlGeneral.FieldByName('paquete').AsInteger = 0) then
  begin
  ex:=SqlGeneral.FieldByName('existencia').AsInteger;
  pxu:=SqlGeneral.FieldByName('piezasxunidad').AsInteger;

  if ex <> 0 then
    begin
    if piezas then
      begin
      if SqlGeneral.FieldByName('piezasxunidad').AsInteger = 1 then
        begin
        btnagregar.Tag:=1;
        result:=ex-p;
        exit;
        end;
      end
    else
      unidades:=unidades*pxu;

    dif:=(ex-p-(c*pxu));
    if dif < 0 then
      begin
      {Lo quite porque la siguiente condicion elimina esto :p
      if piezas then
        result:=cantidad
      else
        result:=dif;}
      if pxu > 1 then
        result:=dif*pxu
      else
        result:=(dif div pxu);
      end
    else
      begin
      if dif >= 0 then
        begin
        result:=0;
        exit;
        end
      else
        if piezas then
          result:=cantidad*(-1)
        else
          result:=cantidad*(-1)*pxu;
      end;
    end
  else
    if piezas then
      result:=p*(-1)
    else
      result:=c*(-1)*pxu;
  end
else //valida los paquetes
  if SqlGeneral.FieldByName('paquete').AsInteger = 1 then
    if SqlGeneral.FieldByName('existencia').AsInteger >= c then
      result := 0
    else
      result := -1;
end;

procedure TfrmNoNotasCredito.InsertaArticulosPaquete(cod_paquete:string;cantidad:integer);
var pzsXunidad,cant,pzs : integer;
cod_cve:string;
begin
//querys('delete from '+tabla+' where '+campo+' = '+valor+' and (cod_cve='+quotedstr(cod_paquete)+' or paquete='+quotedstr(cod_paquete)+')',1,sqlgeneral);
if cantidad > 0 then
 begin
  //trae el indice del concepto VENTAS para insertar la venta del articulo
 // querys('select idmovi from TipoMov where nombre='+quotedstr('VENTAS'),0,sqlgeneral);
 // idcardexart:=sqlgeneral.Fields.Fields[0].Asinteger;
  InsertaArticulo(cod_paquete,cantidad);
  querys('select articulos.piezasxunidad,art_compuestos.cod_cve,art_compuestos.cant,art_compuestos.piezas from art_compuestos inner join articulos on art_compuestos.cod_cve = articulos.cod_cve where art_compuestos.cod_paq='+quotedstr(cod_paquete),0,sqlgeneral);
  sqlgeneral.First;
  while not sqlgeneral.Eof do
   begin
    pzsxunidad:=sqlgeneral.fieldbyname('piezasxunidad').AsInteger;
    cant:=sqlgeneral.fieldbyname('cant').AsInteger;
    pzs:=sqlgeneral.fieldbyname('piezas').AsInteger;
    cod_cve:=sqlgeneral.fieldbyname('cod_cve').Asstring;
    //inserta los datos del articulo en DetPedido
    querys('insert into NoDetNotasCredito(cant,piezas,cod_cve,utilidad,paquete,idmaq,usuario,fecha,hora) values ('+inttostr(cant*cantidad)+','+inttostr(pzs*cantidad)+','+quotedstr(cod_cve)+','+quotedstr(cboutilidad.text)+','+quotedstr(cod_paquete)+','+frmprincipal.idmaq+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(date))+','+quotedstr(timetostr(time))+')',1,sqltemp);
    sqlgeneral.Next;
   end;
end;
//refresca la rejilla de datos
      sqlrejilla.Close;
      sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
      sqlrejilla.ParamByName('idnc').Value := edNumNc.Text;
      sqlrejilla.Open;
end;

procedure TfrmNoNotasCredito.edcvevendButtonClick(Sender: TObject);
begin
{frmbusquedas.query := 'SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idsector FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE '+
                      'usuarios.estatus = 1';
frmbusquedas.campo_retorno:='idusuario';
frmbusquedas.tabla:='';
frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
              edcvevend.Text:=frmbusquedas.resultado;
           end;}
end;

procedure TfrmNoNotasCredito.edcvecteButtonClick(Sender: TObject);
var r : integer;
begin
r :=BuscaCliente(sqlclientes);
if (r <> 0) and (btnalta.Caption='&Guardar') then
begin
edcvecte.Text := inttostr(r);
if sqlclientes.FieldByName('precio').asstring = '' then
 begin
  application.MessageBox('Este cliente no tiene especificado un precio y no podra crearle una nota de credito','Aviso',mb_iconwarning);
  edcvecte.Text := '';
 end
else
 cboutilidad.Text := sqlclientes.FieldByName('precio').asstring;
end;

end;

procedure TfrmNoNotasCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmNoNotasCredito.edfacturaButtonClick(Sender: TObject);
var sqlarticulos : TMyquery;
begin
sqlarticulos := tmyquery.Create(self);
sqlarticulos.Connection := dmaccesos.conexion;
frmbusquedas.query:='SELECT RemiFact.idfactura,RemiFact.idremicion,pedidos.idpedido,if ((clientes.nombre = '''' or clientes.nombre is null) and (clientes.apaterno='''' or clientes.apaterno is null) and (clientes.amaterno='''' or clientes.amaterno is null) ' +
                    ', clientes.rsocial,concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as Cliente,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                    ',''Facturado'')))) as Estatus,pedidos.TotMn,pedidos.FechaCreacion,pedidos.usuario,pedidos.fecha,pedidos.hora,pedidos.idvendedor,pedidos.TipoCambio '+
                    'FROM Nopedidos as pedidos INNER JOIN NoClientes as clientes ON (pedidos.idcliente = clientes.idcliente)  '+
                    ' left join NoRemiFact as RemiFact on pedidos.idpedido = RemiFact.idpedido where (pedidos.estatus=3 or pedidos.estatus=4) and  RemiFact.idfactura <> ''0'' and clientes.idcliente='+edcvecte.Text; //+' and (month(RemiFact.FechaAlta)<>month(current_date)
frmbusquedas.campo_retorno:='idfactura';
frmbusquedas.tblorigen := 'RemiFact';
querys('SELECT RemiFact.idfactura FROM NoPedidos as pedidos INNER JOIN NoClientes clientes ON (pedidos.idcliente = clientes.idcliente) left join NoRemiFact as RemiFact on pedidos.idpedido = RemiFact.idpedido '+
       'where (pedidos.estatus=3 or pedidos.estatus=4) and  RemiFact.idfactura <> ''0'''+
       ' and clientes.idcliente='+edcvecte.Text,0,sqlgeneral);//+' and (month(RemiFact.FechaAlta)<>month(current_date))
frmbusquedas.maxrow := sqlgeneral.RecordCount;
frmbusquedas.tabla:='';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  //trae el idfactura
  edfactura.Text:=frmbusquedas.resultado;
  gbarticulo.Enabled := true;
   //trae el numero de pedido en base a la factura
   querys('select pedidos.idpedido,pedidos.TipoCambio,pedidos.idvendedor,RemiFact.FechaAlta from NoRemiFact as RemiFact inner join NoPedidos AS pedidos on pedidos.idpedido = RemiFact.idpedido where RemiFact.idfactura='+quotedstr(edfactura.Text),0,sqlgeneral);
  //querys('select idpedido from RemiFact where idfactura='+quotedstr(edfactura.Text),0,sqlgeneral);
  if (monthof(sqlgeneral.fieldbyname('FechaAlta').AsDateTime) = monthof(date)) and (yearof(sqlgeneral.fieldbyname('FechaAlta').AsDateTime) = yearof(date)) then
   if application.MessageBox('Esa venta es de este mes, desea Continuar con la Nota de Credito?','Pregunta',mb_yesno+mb_iconquestion)=idno then
     begin
     sqlrejilla.close;
//     CalculaTotales;
//     sqlrejilla.sql.Clear;
     exit;
     end;
  idpedido := sqlgeneral.fieldbyname('idpedido').AsString;
  edcvevend.Text := sqlgeneral.fieldbyname('idvendedor').AsString;
  edtcp.Text := sqlgeneral.fieldbyname('TipoCambio').AsString;
  edventa.Text := idpedido;
  MetodoAlta;
 end;
end;

procedure TfrmNoNotasCredito.ModificaArticulo;
begin
if (dsrejilla.DataSet.RecordCount > 0) and (dsrejilla.DataSet.FieldByName('paquete').AsString = '') then
  begin
    gbarticulo.Enabled := true;
    edcodigo.Text:=dsrejilla.DataSet.FieldValues['cod_cve'];
    eddescripcion.Text:=dsrejilla.DataSet.FieldValues['nombre'];
    edprecio.Text:=dsrejilla.DataSet.FieldValues['precio'];
    eddesc.Text:=dsrejilla.DataSet.FieldValues['descuento'];
    edtinsta.Text:=dsrejilla.DataSet.FieldValues['tinstalacion'];
    cboutilidad.Text:=dsrejilla.DataSet.FieldValues['utilidad'];
    if dsrejilla.DataSet.FieldValues['cant'] > 0 then
       edcantidad.Text:=dsrejilla.DataSet.FieldValues['cant']
    else
      begin
        edcantidad.Text:=dsrejilla.DataSet.FieldValues['piezas'];
        chkpiezas.Checked:=true;
      end;
      querys('delete from NoDetNotasCredito where id='+dsrejilla.DataSet.fieldbyname('id').AsString+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' or paquete='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
    //refresca la rejilla de datos
      sqlrejilla.Close;
      sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
      sqlrejilla.ParamByName('idnc').Value := 0;
      sqlrejilla.Open;
     btnagregar.Enabled:=true;
     edcodigo.Enabled:=false;
     edcantidad.Enabled:=true;
     edcantidad.SetFocus;
  end;
end;


procedure TfrmNoNotasCredito.MetodoAlta;
//Var sqlarticulos : TMyquery;
begin
{sqlarticulos := tmyquery.Create(self);
sqlarticulos.Connection := dmaccesos.conexion;
  dialogo.CaptionTitle := 'Como desea Trabajar?';
  dialogo.Prompt := 'Metodo de Captura:';
  dialogo.Items.Clear;
  dialogo.Items.Add('Automatico');
  dialogo.Items.Add('SemiAutomatico');
  dialogo.Items.Add('Manual');
if dialogo.Execute then
 begin
  case dialogo.Value of
   0: begin
     //trae los datos de DetPedido
     querys('select tc,cod_cve,sum(cant) as cant,sum(piezas) as piezas,utilidad,paquete,costo,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+idpedido+' from NoDetPedido as DetPedido where idpedido = '+idpedido+' group by cod_cve,costo',0,sqlgeneral);
    //trae los datos de DetNotasCredito
    // querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas from DetNotasCredito where idpedido = '+idpedido+' group by cod_cve',0,sqltemp);
     sqlgeneral.First;
     while not sqlgeneral.Eof do
      begin
      // sqltemp.First;
//        while not sqltemp.Eof do
 //        begin
       querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas from DetNotasCredito where idpedido = '+idpedido+' and cod_cve='+quotedstr(sqlgeneral.fieldbyname('cod_cve').AsString)+' group by cod_cve',0,sqltemp);
       //   if sqltemp.FieldByName('cod_cve').AsString = sqlgeneral.FieldByName('cod_cve').AsString then
          if sqltemp.RecordCount > 0 then
           begin
            if (sqlgeneral.FieldByName('cant').AsString > sqltemp.FieldByName('cant').AsString) or (sqlgeneral.FieldByName('piezas').AsString > sqltemp.FieldByName('piezas').AsString)  then
             begin
              querys('insert into NoDetNotasCredito (cant,piezas,cod_cve,utilidad,paquete,costo,idmaq,idpedido,tc,usuario,hora,fecha) values ('+inttostr(sqlgeneral.FieldByName('cant').Asinteger-sqltemp.FieldByName('cant').Asinteger)+','+inttostr(sqlgeneral.FieldByName('piezas').Asinteger-sqltemp.FieldByName('piezas').Asinteger)+
                     ','+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString)+','+quotedstr(sqlgeneral.FieldByName('utilidad').AsString)+','+quotedstr(sqlgeneral.FieldByName('paquete').AsString)+','+sqlgeneral.FieldByName('costo').AsString+','+frmprincipal.idmaq+','+
                     idpedido+','+sqlgeneral.FieldByName('tc').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(timetostr(Horaservidor))+','+quotedstr(datetostr(FechaServidor))+')',1,sqlinserta);
             end;
           end
          else
      //     sqltemp.Next;
       //   if sqltemp.Eof then
           begin
            querys('insert into NoDetNotasCredito (cant,piezas,cod_cve,utilidad,paquete,costo,idmaq,idpedido,tc,usuario,fecha,hora) values ('+inttostr(sqlgeneral.FieldByName('cant').Asinteger)+','+inttostr(sqlgeneral.FieldByName('piezas').Asinteger)+
                   ','+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString)+','+quotedstr(sqlgeneral.FieldByName('utilidad').AsString)+','+quotedstr(sqlgeneral.FieldByName('paquete').AsString)+','+sqlgeneral.FieldByName('costo').AsString+','+frmprincipal.idmaq+','+
                   idpedido+','+sqlgeneral.FieldByName('tc').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlinserta);
           end;
          sqlgeneral.Next;
         end;
       //inserta todos los detalles del DetPedido en DetNotasCredito
      //querys('insert into DetNotasCredito (cant,piezas,cod_cve,utilidad,paquete,costo,idmaq,idpedido) select cant,piezas,cod_cve,utilidad,paquete,costo,'+frmprincipal.idmaq+','+idpedido+' from DetPedido where idpedido='+idpedido,1,sqlgeneral);
      sqlrejilla.Close;
      sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
      sqlrejilla.ParamByName('idnc').Value := 0;
      sqlrejilla.Open;
      if sqlrejilla.RecordCount = 0 then
       application.MessageBox('No se encontro ningun articulo que se pueda devolver de este pedido','Aviso',mb_iconinformation)
      else
       begin
        CalculaTotales;
        edcodigo.SetFocus;
       end;

     end;
   1: begin
       //trae los datos de DetPedido
       querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas,utilidad,paquete,costo,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+idpedido+' from NoDetPedido where idpedido = '+idpedido+' group by cod_cve',0,sqlarticulos);



       sqlarticulos.First;
       while not sqlarticulos.Eof do
        begin
         //verifica si ya existe se ha hecho Nc de este articulo de ese pedido
        querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas from DetNotasCredito where idpedido = '+idpedido+' and cod_cve='+quotedstr(sqlarticulos.fieldbyname('cod_cve').AsString)+' group by cod_cve',0,sqltemp);
        if (sqlarticulos.FieldByName('cant').AsString > sqltemp.FieldByName('cant').AsString) or (sqlarticulos.FieldByName('piezas').AsString > sqltemp.FieldByName('piezas').AsString)  then
         begin
         if (sqlarticulos.fieldbyname('paquete').AsString <> '1')  then
          begin
           semiauto:=1;
           edcodigo.Text := sqlarticulos.fieldbyname('cod_cve').AsString;
           edprecio.Text := sqlarticulos.fieldbyname('costo').AsString;
           if sqlarticulos.fieldbyname('cant').Asinteger - sqltemp.fieldbyname('cant').Asinteger > 0 then
            edcantidad.Text := inttostr(sqlarticulos.fieldbyname('cant').Asinteger - sqltemp.fieldbyname('cant').Asinteger)
           else
            begin
             edcantidad.Text := inttostr(sqlarticulos.fieldbyname('piezas').Asinteger - sqltemp.fieldbyname('piezas').Asinteger);
             chkpiezas.Checked := true;
           end;
           ValidaProducto(edcodigo.Text);
           while semiauto = 1 do
            application.ProcessMessages;
            if semiauto = 2 then
             break;
          end;
        end;
         sqlarticulos.next;
       end;
        edcantidad.Text := '';
      end;
   2: edcodigo.SetFocus;
   end;
 gbarticulo.Enabled := true;
end
else
 gbarticulo.Enabled := false;     }
end;

procedure TfrmNoNotasCredito.edcvecteChange(Sender: TObject);
begin
if edcvecte.Text = '' then
 begin
  sqlclientes.Close;
  edfactura.Clear;
  edfactura.Enabled := false;
 end
else
 begin
  edfactura.Enabled:=true;
 end;
end;

procedure tfrmNoNotasCredito.limpia;
begin
edventa.Clear;
ednumnc.clear;
edcvecte.Clear;
edcvevend.Clear;
edfactura.Clear;
edfecha.Date := date;
sqlclientes.Close;
sqlrejilla.Close;
mmObservaciones.Lines.Clear;
edcantidad.Clear;
btnimprimir.Enabled := false;
LimpiaTotales;
lbufh.Caption := '';
end;

procedure TfrmNoNotasCredito.btnaltaClick(Sender: TObject);
//Var temp : string;
begin
{if btnalta.Caption='&Alta' then
   begin
     btnalta.Caption:='&Guardar';
     btnalta.Hint:='Guardar los datos de la alta';
     btnalta.ImageIndex:=1;
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Alta';
     limpia;
     gbprincipal.Enabled := true;
     //trae el maximo numero de nota de credito
     querys('select max(FolioNC) as idnc from folios',0,sqlgeneral);
     edNumNc.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //trae el tipo de combio y el precio por hora
     querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
     edTCP.Text:=format('%8.2f',[sqlgeneral.Fields.Fields[0].AsFloat]);
     edNumNc.Enabled := false;
     mmObservaciones.Enabled := true;
     edfactura.Enabled := false;
     edanticipo.Enabled := true;
     GBAdicionales.Enabled := true;
     edcvecte.setfocus;
   end
else
 begin
  if edcvevend.Text = '' then
   begin
    application.MessageBox('Debe de especificar el vendedor','Datos Incompletos',mb_iconinformation);
    exit;
   end;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Area';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     gbprincipal.Enabled := false;
     mmObservaciones.Enabled := false;
     edanticipo.Enabled := false;
  //trae el maximo numero de nota de credito
   querys('select max(FolioNC) as idnc from folios',0,sqlgeneral);
  edNumNc.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
  //inserta en la tabla de notas de credito
  querys('insert into NotasCredito(idnc,idcliente,idvendedor,idfactura,FechaNc,subtotal,impuesto,anticipo,total,pedimento,aduana,FechaAduana,FechaPago,observaciones,TipoCambio,saldo,usuario,fecha,hora) values ('+edNumNc.Text+','+edcvecte.Text+','+edcvevend.Text+','+quotedstr(edfactura.Text) +
         ','+quotedstr(edfecha.Text)+','+edTotMat.Text+','+ediva.Text+','+edanticipo.Text+','+edTotMn.Text+','+quotedstr(edNumPed.Text)+','+quotedstr(edAduana.Text)+','+quotedstr(datetostr(dtpfechaaduana.date))+','+quotedstr(datetostr(dtpFecPagAnt.date))+','+quotedstr(mmobservaciones.Text) +
         ','+edTCP.Text+','+floattostr(strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text))+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlgeneral);
//  actualiza el folio
  querys('update folios set FolioNC='+edNumNc.Text,1,sqlgeneral);
  //cambia el idnc que tiene los detalles de DetNotas_Credito
  querys('update DetNotasCredito set idnc='+edNumNc.Text+',idmaq=0 where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
  dsrejilla.DataSet.First;
  while not dsrejilla.DataSet.Eof do
   begin
    //trae las piezasxunidad del articulo
    querys('select piezasxunidad,servicio,paquete,PrecioCapturable, costo from articulos where cod_cve='+quotedstr(dsrejilla.DataSet.FieldByName('cod_cve').Asstring),0,sqlgeneral);
    if (sqlgeneral.FieldByName('paquete').AsInteger=0)and(sqlgeneral.FieldByName('servicio').AsInteger=0) then   //and(sqlgeneral.FieldByName('PrecioCapturable').AsInteger=0)
     begin
     CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat, dsrejilla.DataSet.FieldByName('cod_cve').Asstring, '-', dsrejilla.DataSet.FieldByName('cant').AsInteger);
      if dsrejilla.DataSet.FieldByName('cant').AsInteger > 0 then
        querys('update articulos set existencia=existencia+'+inttostr(dsrejilla.DataSet.FieldByName('cant').AsInteger*sqlgeneral.fieldbyname('piezasxunidad').AsInteger)+' where cod_cve='+quotedstr(dsrejilla.DataSet.FieldByName('cod_cve').Asstring),1,sqltemp)
      else
        querys('update articulos set existencia=existencia+'+dsrejilla.DataSet.FieldByName('piezas').Asstring+' where cod_cve='+dsrejilla.DataSet.FieldByName('cod_cve').Asstring,1,sqltemp);
       //trae el indice del concepto NOTASCREDITO
       querys('select idmovi from TipoMov where nombre='+quotedstr('NOTASCREDITO'),0,sqltemp);
       temp:=sqltemp.Fields.Fields[0].AsString;
       //inserta en el cardex de articulos
       querys('insert into CardexArt(cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,piezas,usuario,HoraMov) values ('+quotedstr(dsrejilla.DataSet.FieldByName('cod_cve').Asstring)+',''E'','+temp+','+quotedstr(datetostr(FechaServidor))+','+idpedido+','+dsrejilla.dataset.Fieldbyname('cant').AsString+','+dsrejilla.dataset.Fieldbyname('piezas').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(timetostr(HoraServidor))+')',1,sqltemp);
      end;
    dsrejilla.DataSet.Next;
   end;
     //trae el maximo numero de pago
     querys('select max(idpago) + 1 as pago from PagosClientes',0,sqlgeneral);
    //inserta en PagosClientes
    querys('insert into PagosClientes(idpago,movimiento,idcliente,idpedido,idremicion,idfactura,FechaAlta,cargo,abono,restante,usuario,fecha,hora,notas) values ('+sqlgeneral.fieldbyname('pago').AsString+',6,'+edcvecte.Text+','+idpedido+',0,'+quotedstr(edfactura.Text)+','+quotedstr(datetostr(FechaServidor))+','+edanticipo.text+','+edTotMn.text+','+floattostr(strtofloat(edanticipo.Text)-strtofloat(edTotMn.Text))+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+quotedstr('N.C. :'+edNumNc.Text)+')',1,sqltemp);
    //actualiza el saldo de pedidos
    querys('update pedidos set saldo=saldo-'+edTotMn.Text+' where idpedido='+edventa.Text,1,sqlgeneral);
    //pregunta por el saldo para ver si es 0 o negativo, de ser asi actualiza el campo saldado=1 de pedidos
    querys('select saldo from pedidos where idpedido='+edventa.Text,0,sqlgeneral);
    if sqlgeneral.FieldByName('saldo').AsFloat <=2 then
     querys('update pedidos set saldado=1 where idpedido='+edventa.Text,1,sqlgeneral);
    application.MessageBox('Alta Exitosa','Aviso',mb_iconinformation);
    GBAdicionales.Enabled := false;
    limpia;
  self.OnShow(self);
 end;     }
end;

procedure TfrmNoNotasCredito.edcvecteKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,false);
//key:=validapunto(ednumpedido.Text+'.',key);
  if key=#13 then begin
     key:=#0;
      if edcvecte.Text <> '' then
        begin
         sqlclientes.Close;
         sqlclientes.Params.Items[0].Value:=strtoint(edcvecte.Text);
         sqlclientes.Open;
         if sqlclientes.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
            edfactura.SetFocus;
           end
         else
           begin
           if edGiro.Text = '' then
            begin
              application.MessageBox('Ha este cliente no se le ha especificado el giro y no podra hacerle Notas deCredito hasta no especificar su giro, lo puede hacer en la pantalla de clientes','Aviso',mb_iconinformation);
              sqlclientes.Close;
            end
           else
            begin
              gbarticulo.Enabled:=true;
              btnagregar.Enabled:=false;
              if gbprincipal.enabled then
              edfactura.SetFocus;
            end;
          end;
         end
     else
        edcvecte.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edcvecte.Text:='';
  end;
end;

procedure TfrmNoNotasCredito.edcvecteExit(Sender: TObject);
begin
chtecla := #13;
if edcvecte.Text <> '' then
 edcvecte.OnKeyPress(self,chtecla);
end;

procedure TfrmNoNotasCredito.FormShow(Sender: TObject);
begin
semiauto := 0;
//verifica que existan notas de credito
querys('select idfactura from NotasCredito limit 1,1',0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  edNumNc.Enabled := true;
  edNumNc.SetFocus;
 end
else
 edNumNc.Enabled := false;

  shortdateformat:='yyyy/mm/dd';
end;

function TfrmNoNotasCredito.ValidaProducto(CodCve:string):integer;
Var cantvend,cantdev : integer;
begin
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve,nombre,precio'+lowercase(CboUtilidad.Text)+' as precio,desc_esp,tinstalacion,piezasxunidad,existencia,aplica_desc, '+
       ' nom_envase,nom_piezas,servicio,paquete,PrecioCapturable from articulos where cod_cve='+quotedstr(CodCve)+ ' or cod_barras='+quotedstr(CodCve),0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
 begin
  application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
  edcodigo.SelectAll;
  dmreportes.sqlgeneral.Close;
  edcantidad.Text:='1';
  edcodigo.Text:='';
  chkpiezas.Checked:=false;
  result := 0;
 end
else
 begin
  if (dmreportes.sqlgeneral.fieldbyname('servicio').Asinteger = 0) and (dmreportes.sqlgeneral.fieldbyname('PrecioCapturable').Asinteger = 0) then //si se cumple significa que es un articulo
   begin
    //valida que el artiulo introducido de halla vendido
    querys('select cant from DetPedido where cod_cve='+quotedstr(CodCve)+' and idpedido='+idpedido,0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
     begin
      application.MessageBox('El articulo tecleado no esta en la factura tecleada y no podra agregarlo a su Nota de Credito','Aviso',mb_iconinformation);
      edcodigo.Clear;
      result:=0;
      exit;
     end;
   end
  else
   begin
    //se trae de detalles de pedido la cantidad total en piezas que se halla vendido del articulo actual
    querys('SELECT sum(((DetPedido.cant * articulos.piezasxunidad) + DetPedido.piezas)) as total FROM NoDetPedido as DetPedido INNER JOIN articulos ON (DetPedido.cod_cve = articulos.cod_cve) WHERE DetPedido.idpedido = '+idpedido+' and DetPedido.cod_cve = '+quotedstr(CodCve),0,sqlgeneral);
    cantvend := sqlgeneral.fieldbyname('total').AsInteger;
    //se trae de detalles de notas de credito total en piezas que se hallan regresado
    querys('SELECT sum(((DetNotasCredito.cant * articulos.piezasxunidad) + DetNotasCredito.piezas)) as total FROM NoDetNotasCredito as DetNotasCredito INNER JOIN articulos ON (DetNotasCredito.cod_cve = articulos.cod_cve) WHERE ((DetNotasCredito.idnc = '+quotedstr(edNumNc.Text)+') or (DetNotasCredito.idmaq = '+frmprincipal.idmaq+') or (DetNotasCredito.idpedido='+idpedido+')) and DetNotasCredito.cod_cve='+quotedstr(CodCve),0,sqlgeneral);
    cantdev := sqlgeneral.fieldbyname('total').AsInteger;
    if cantvend <> 0 then
     if cantvend <= cantdev then
      begin
       application.MessageBox('Ya se a devuelto en su totalidad este articulo','Aviso',mb_iconinformation);
       result := 0;
       exit;
      end;
   end;

   if edcodigo.Text = 'MONITOREO' then
     begin
       querys('select CostoMensual from categorias where nombre = ' + quotedstr(edgiro.Text),0,dmreportes.sqlgeneral3);
       edPrecio.Text := dmreportes.sqlgeneral3.fieldbyname('CostoMensual').AsString;
     end
    else
      begin
      //cambio realizado el 20 enero 2007 *edwin*
      // edPrecio.Text:=dmreportes.sqlgeneral.fieldbyname('precio').AsString;
       if( edPrecio.Text = '') then
         edPrecio.Text:=dmreportes.sqlgeneral.fieldbyname('precio').AsString;

      end;
     querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(CodCve),0,sqlgeneral);
      if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
       begin
        edprecio.Enabled := true;
        edprecio.SetFocus;
       end
      else
       begin
        edcantidad.Enabled := true;
        edcantidad.setfocus;
       end;
     //pregunta si se va a poder ValidaProducto en piezas
      edDescripcion.Text:=dmreportes.sqlgeneral.fieldbyname('nombre').AsString;
      if dmreportes.sqlgeneral.FieldByName('aplica_desc').Asstring = 'True' then
       edDesc.Text:=dmreportes.sqlgeneral.fieldbyname('desc_esp').Asstring;
       edTInsta.Text:=dmreportes.sqlgeneral.fieldbyname('tinstalacion').AsString;
       result :=1;
  end;
end;

procedure TfrmNoNotasCredito.edcodigoButtonClick(Sender: TObject);
begin
frmbuscaart.ShowModal;
     if frmbuscaart.cod_cve <> '' then
        begin
         edcodigo.Text:=frmbuscaart.cod_cve;
            edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          chkpiezas.Enabled:=true;
         // btnagregar.Enabled:=true;
          edcodigo.Enabled:=false;
          ValidaProducto(edcodigo.text);
    if ValidaProducto(edcodigo.text) = 1 then
       begin
           edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          chkpiezas.Enabled:=true;
        //  btnagregar.Enabled:=true;
          edcodigo.Enabled:=false;
       end
    else
       begin
         edcodigo.Text:='';
         edcodigo.SetFocus;
       end;
        end;
end;

procedure TfrmNoNotasCredito.InsertaArticulo(cod_cve:string;cantidad:integer);
var tc,descu,costo:string;
cant,piezas:integer;
begin

cant:=0;
piezas:=0;
if chkpiezas.Checked then
 piezas:=cantidad
else
 cant:=cantidad;

if eddesc.Text = '' then
 descu:='0';

if rejilla.Enabled = false then
 rejilla.Enabled:=true;

querys('select PrecioCapturable,servicio,moneda from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
if sqlgeneral.FieldByName('moneda').AsString = 'P' then
 tc := '1'
else
 tc := edtcp.text;

 costo := edPrecio.Text;
 ///////**Comentado por edwin** le modifique el costo por el costo que tiene en el edit, si no tiene que si haga el if que tenia anteriormente ok
 if (costo = '') then
     begin

       if (sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 0) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
             begin
              //trae el costo del articulo en base al tipo de precio
              querys('select precio'+CboUtilidad.Text+' as costo from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
              costo := sqlgeneral.fieldbyname('costo').AsString;
             end
              else
                costo := edPrecio.Text;
     end;
//inserta los datos del articulo en DetPresupuesto


querys('insert into DetNotasCredito(cant,piezas,cod_cve,utilidad,costo,idmaq,idpedido,usuario,fecha,hora,tc) values ('+floattostr(cant)+','+floattostr(piezas)+','+quotedstr(cod_cve)+','+quotedstr(CboUtilidad.Text)+','+costo+','+frmprincipal.idmaq+','+idpedido+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(date))+','+quotedstr(timetostr(time))+','+tc+')',1,SqlGeneral);
//querys('delete from '+tabla+' where cant<=0 and piezas<=0',1,sqlgeneral);
//refresca la rejilla de datos
      sqlrejilla.Close;
      sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
      sqlrejilla.ParamByName('idnc').Value := 0;
      sqlrejilla.Open;
      LimpiaDatArt;
      semiauto := 0;
      edprecio.Enabled := false;
      edfactura.Enabled := false;
      edcantidad.Enabled := false;
end;


procedure TfrmNoNotasCredito.btnagregarClick(Sender: TObject);
var valor : integer;
begin
valor:=ValidaExistencias(edcodigo.Text,strtoint(edcantidad.text),chkpiezas.Checked);
//showmessage(pchar(inttostr(valor)));
if valor = 0 then
 begin
  //verifica si es paquete
  querys('select * from articulos where cod_cve='+quotedstr(edcodigo.Text)+ ' and paquete=1',0,SqlGeneral);
  if sqlgeneral.RecordCount > 0 then
   InsertaArticulosPaquete(edcodigo.Text,strtoint(edcantidad.text))
  else
  InsertaArticulo(edcodigo.Text,strtoint(edcantidad.text));
  CalculaTotales;
 end
else
 application.MessageBox('La cantidad que se desea devolver mas la ya devuelta es mayor a la comprada','Aviso',mb_iconwarning);
 //LimpiaDatArt;
end;

procedure TfrmNoNotasCredito.edCantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key<>'p') and (key<>'P') and (key<>#13) and (key <> #27) then
  key := ValidaNumeros(key,false);

{querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(edcodigo.Text),0,sqlgeneral);
if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
 begin
  key := ValidaPunto(edCodigo.Text,key);
 end;  }

if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
      if semiauto = 0 then
       edcodigo.SetFocus;
    end;

if (key = 'p') or (key = 'P') then
   begin
     if chkpiezas.Checked then
        chkpiezas.Checked:=false
     else
      begin
       //pregunta si se puede vender en piezas este articulo
       querys('select piezasxunidad from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
       if sqlgeneral.FieldByName('piezasxunidad').AsInteger > 1 then
        chkpiezas.Checked:=true
       else
        application.MessageBox('Este Articulo no se vende en piezas','Aviso',mb_iconinformation);
      end;
     key:=#0;
   end;

if key = #27 then
   begin
     semiauto := 0;
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;
end;

procedure TfrmNoNotasCredito.LimpiaDatArt;
begin
     //limpia los campos
     btnagregar.Enabled:=false;
     edcantidad.Text:='';
     edcantidad.Enabled := false;
     chkpiezas.Checked:=false;
     chkpiezas.Enabled:=false;
     Cboutilidad.Enabled:=false;
     edtinsta.Text:='';
     edDesc.Text:='';
     edprecio.Text:='';
     edprecio.Enabled := false;
     edDescripcion.Text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
end;


procedure TfrmNoNotasCredito.edcvevendKeyPress(Sender: TObject;
  var Key: Char);
begin
{if (edcvevend.Text<>'')and(key=#13) then
   begin
   //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend
  //  querys('SELECT concat(usuarios.nombre, '+quotedstr(' ')+', usuarios.apaterno,'+quotedstr(' ')+', usuarios.amaterno) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1 and  usuarios.idusuario='+edcvevend.Text+')',0,SqlGeneral);
   try
   //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre
    querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario,codigo FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1 and  usuarios.idusuario='+edCveVend.Text,0,SqlGeneral);
   except
    //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su codigo corto
    querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario,codigo FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1 and usuarios.codigo='+quotedstr(edCveVend.Text),0,SqlGeneral);
   end;

    key:=#0;
   if SqlGeneral.RecordCount > 0 then
    begin
     edcvevend.Text := sqlgeneral.fieldbyname('idusuario').AsString;
     edfactura.SetFocus;
    end
   else
    begin
     application.MessageBox('Esa Clave de Vendedor no Existe o no esta activo, verifiquelo y vuelva a intentarlo!','Error',mb_ok+mb_iconwarning);
     edcvevend.Text:='';
    end;
   end;}
end;

procedure TfrmNoNotasCredito.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if semiauto = 1 then
 if application.MessageBox('Se encuentra en proceso de alta, desea cancelar?','Pregunta',mb_yesno+mb_iconwarning) = idyes then
  begin
   semiauto := 2;
   canclose := true;
  end
 else
  canclose := false;
end;

procedure TfrmNoNotasCredito.edfacturaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edfactura.Text = '') then
 begin
  key := #0;
  edfactura.OnButtonClick(self);
 end;

if (key = #13) and (edfactura.Text <> '') then
   begin
    key:= #0;
    //verifica que este cliente tenga la factura tecleada
    querys('SELECT RemiFact.idfactura,pedidos.idpedido FROM RemiFact INNER JOIN pedidos ON (RemiFact.idpedido = pedidos.idpedido) WHERE RemiFact.idfactura = '+quotedstr(edfactura.Text)+' AND pedidos.idcliente = '+edcvecte.Text,0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
     begin
      application.MessageBox('La factura Tecleada no pertene al cliente seleccionado','Aviso',mb_iconinformation);
      exit;
     end;
    //verifica si no se ha cancelado esta venta
    querys('select movimiento from PagosClientes where movimiento = 5 and idfactura = '+quotedstr(edfactura.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
     begin
      application.MessageBox('Esta Venta ha sido cancelada','Aviso',mb_iconinformation);
      Limpia;
      exit;
     end
    else
     begin
      querys('select if((month(RemiFact.FechaAlta) = month(current_date)) and (year(RemiFact.FechaAlta)= year(current_date )),"No","Si") as Dif,'+
              'RemiFact.idremicion,RemiFact.idfactura,pedidos.idpedido,pedidos.idcliente,pedidos.TotMn from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido'+
             ' where RemiFact.idfactura='+quotedstr(edfactura.Text),0,SqlGeneral);
      if (SqlGeneral.RecordCount > 0) and (sqlgeneral.FieldByName('Dif').AsString='Si')  then
       begin
        //trae el numero de pedido
        querys('select pedidos.idpedido,pedidos.TipoCambio,pedidos.idvendedor from RemiFact inner join pedidos on pedidos.idpedido = RemiFact.idpedido where RemiFact.idfactura='+quotedstr(edfactura.Text),0,sqlgeneral);
        idpedido := sqlgeneral.fieldbyname('idpedido').AsString;
        edcvevend.Text := sqlgeneral.fieldbyname('idvendedor').AsString;
        edtcp.Text := sqlgeneral.fieldbyname('TipoCambio').AsString;
        edventa.Text := idpedido;
        MetodoAlta;
       end
    else
       if SqlGeneral.RecordCount = 0 then
        begin
         application.MessageBox('El numero de factura tecleado no existe','Aviso',mb_iconinformation);
         edfactura.Clear;
        end
       else
        begin
          if application.MessageBox('El numero de factura tecleado es del mes en curso, Desea Continuar?','Aviso',mb_iconquestion+mb_yesno) = idyes then
           begin
            //trae el numero de pedido
            querys('select pedidos.idpedido,pedidos.TipoCambio,pedidos.idvendedor from RemiFact inner join pedidos on pedidos.idpedido = RemiFact.idpedido where RemiFact.idfactura='+quotedstr(edfactura.Text),0,sqlgeneral);
            idpedido := sqlgeneral.fieldbyname('idpedido').AsString;
            edcvevend.Text := sqlgeneral.fieldbyname('idvendedor').AsString;
            edtcp.Text := sqlgeneral.fieldbyname('TipoCambio').AsString;
            edventa.Text := idpedido;
            MetodoAlta;
           end
          else
            begin
           sqlrejilla.close;
           edfactura.Clear;
//           CalculaTotales;
           exit;
           end;

        end;
   end;
 end;
end;

procedure TfrmNoNotasCredito.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption := '&Cerrar';
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Area';
          //elimina lo que se quedo en DetNotasCredito
          querys('delete from NoDetNotasCredito where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
          sqlrejilla.Close;
          limpia;
          LimpiaDatArt;
          GBAdicionales.Enabled := false;
          gbarticulo.Enabled := false;
        end;
        ednumnc.Enabled := true;
        ednumnc.Text :='';
        edventa.Clear;
        ednumnc.SetFocus;
        btnalta.Enabled:=true;
      //  btnborrar.Enabled:=false;
       // btnmodificar.Enabled:=false;
 end
else
close;
end;

procedure TfrmNoNotasCredito.edCantidadChange(Sender: TObject);
begin
if edcantidad.Text = '' then
 btnagregar.Enabled := false
else
 btnagregar.Enabled := true;
end;

procedure TfrmNoNotasCredito.CalculaTotales;
var subtotal,descuento,iva,hrs:double;
begin
if sqlrejilla.RecordCount = 0 then
 LimpiaTotales
else
  begin
     if btnalta.Caption = '&Guardar' then
         rejilla.Enabled:=true;
     //else
      //   rejilla.Enabled:=false;
    sqlrejilla.First;
while not sqlrejilla.Eof do
   begin
         if (sqlrejilla.FieldValues['cant'] > 0) or (sqlrejilla.FieldValues['cant'] < 0) then
          begin
           if sqlrejilla.FieldValues['moneda'] = 'PESOS' then
             begin
              subtotal:=subtotal+(sqlrejilla.FieldValues['cant']*sqlrejilla.FieldValues['precio']);
              iva:=iva+((sqlrejilla.FieldValues['precio']*sqlrejilla.FieldValues['iva'])*sqlrejilla.FieldValues['cant']);
              if sqlrejilla.FieldValues['aplica_desc'] then
               descuento:=descuento+((sqlrejilla.FieldValues['precio']*sqlrejilla.FieldValues['descuento'])*sqlrejilla.FieldValues['cant']);
             end
           else
            begin
              subtotal:=subtotal+(sqlrejilla.FieldValues['cant']*sqlrejilla.FieldValues['precio']*strtofloat(edtcp.Text));
              iva:=iva+(((sqlrejilla.FieldValues['precio']*sqlrejilla.FieldValues['iva'])*sqlrejilla.FieldValues['cant'])*strtofloat(edtcp.Text));
              if sqlrejilla.FieldValues['aplica_desc'] then
               descuento:=descuento+(((sqlrejilla.FieldValues['precio']*sqlrejilla.FieldValues['descuento'])*sqlrejilla.FieldValues['cant'])*strtofloat(edtcp.Text));
            end;
          end
       else
         begin
          if sqlrejilla.FieldValues['moneda'] = 'PESOS' then
           begin
            subtotal:=subtotal+(sqlrejilla.FieldValues['piezas']*(sqlrejilla.FieldValues['precio']/sqlrejilla.FieldValues['piezasxunidad']));
            iva:=iva+(((sqlrejilla.FieldValues['precio']/sqlrejilla.FieldValues['piezasxunidad'])*sqlrejilla.FieldValues['iva'])*sqlrejilla.FieldValues['piezas']);
            if sqlrejilla.FieldValues['aplica_desc'] then
              descuento:=descuento+(((sqlrejilla.FieldValues['precio']/sqlrejilla.FieldValues['piezasxunidad'])*sqlrejilla.FieldValues['descuento'])*sqlrejilla.FieldValues['piezas']);
           end
          else
           begin
            subtotal:=subtotal+(sqlrejilla.FieldValues['piezas']*(sqlrejilla.FieldValues['precio']/sqlrejilla.FieldValues['piezasxunidad'])*strtofloat(edtcp.Text));
            iva:=iva+((((sqlrejilla.FieldValues['precio']/sqlrejilla.FieldValues['piezasxunidad'])*sqlrejilla.FieldValues['iva'])*sqlrejilla.FieldValues['piezas'])*strtofloat(edtcp.Text));
            if sqlrejilla.FieldValues['aplica_desc'] then
             descuento:=descuento+((((sqlrejilla.FieldValues['precio']/sqlrejilla.FieldValues['piezasxunidad'])*sqlrejilla.FieldValues['descuento'])*sqlrejilla.FieldValues['piezas'])*strtofloat(edtcp.Text));
          end;
         end;
           hrs:=hrs+sqlrejilla.FieldValues['tinstalacion'];
           sqlrejilla.Next;
       end;
    edTotMat.Text:=Format('%8.2f',[subtotal]);
//    edTotHrs.Text:=Format('%8f',[hrs]);
   // edCostoHrs.Text:=Format('%8f',[strtofloat(edCostoHrs.Text)]);
   // edHoras.Text:=Format('%8',[strtofloat(edTotHrs.Text)*strtofloat(edCostoHrs.Text)*strtofloat(edtcp.text)]);
    ediva.Text := format('%8.2f',[strtofloat(edTotMat.Text)*GetIVA]);
    eddescuento.Text:=Format('%8.2f',[descuento]);
    edTotDlls.Text := Format('%8.2f',[((strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text))/strtofloat(edtcp.Text)]);
    edTotmn.Text:=Format('%8.2f',[(strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text)]);
   edSaldo.Text:=Format('%8.2f',[strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text)]);
 end;
end;


procedure TfrmNoNotasCredito.EdPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := ValidaNumeros(key,false);
  key := ValidaPunto(edprecio.Text,key);
if (key = #13) and (edPrecio.Text <> '') then
 begin
  key := #0;
  edcantidad.enabled := true;
  edCantidad.SetFocus;
 end;
end;

procedure TfrmNoNotasCredito.EdPrecioExit(Sender: TObject);
begin
if (strtofloat(edprecio.Text) <= 0) and (edcodigo.text = 'CARGOS') then
 begin
  application.MessageBox('El precio del articulo no puede ser Menor o Igual a 0','Cuidado',mb_iconwarning);
  edPrecio.Text := '1';
 end;
end;

procedure TfrmNoNotasCredito.edcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#27) then
 begin
  key:=#0;
  LimpiaDatArt;
 end;

if (key=#13)and(edcodigo.text<>'') then begin //if 1
     key:=#0;
     if ValidaProducto(edcodigo.Text) = 1 then
        begin
          edcantidad.Enabled:=true;
          //trae el campo PrecioCapturable
          querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
          if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
           edPrecio.SetFocus
          else
           edcantidad.SetFocus;
           edcantidad.Text := '1';
          //btnagregar.Enabled:=true;
        end;
     end;

if (key = #13) and (edcodigo.Text = '') then
   begin
     key:=#0;
    edcodigo.OnButtonClick(self);
   end;
end;

procedure TfrmNoNotasCredito.edcodigoChange(Sender: TObject);
begin
if edcodigo.Text = '' then
LimpiaDatArt;
end;

procedure TfrmNoNotasCredito.edAnticipoKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
end;

procedure TfrmNoNotasCredito.edAnticipoExit(Sender: TObject);
begin
if strtofloat(edanticipo.Text)>strtofloat(edTotMn.Text) then
 begin
   application.MessageBox('El anticipo no puede ser mayor que el total','Aviso',mb_iconinformation);
   edanticipo.Text:=edTotMn.Text;
 end;

if edanticipo.Text <> '' then
   begin
   edanticipo.Text:=trim(Format('%8.2f',[strtofloat(edanticipo.Text)]));
   end;
end;

procedure TfrmNoNotasCredito.btnfuentesClick(Sender: TObject);
begin
CambiaFont(mmobservaciones);
end;

procedure TfrmNoNotasCredito.edNumNCButtonClick(Sender: TObject);
begin
      frmbusquedas.query:='SELECT * FROM NoNotasCredito';
      frmbusquedas.campo_retorno:='idnc';
      frmbusquedas.campo_busqueda:='idnc';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'NotasCredito';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
       begin
        edNumNc.Text := frmbusquedas.resultado;
        TraeNc(strtoint(frmbusquedas.resultado));
       end;

end;

procedure TfrmNoNotasCredito.mmObservacionesChange(Sender: TObject);
begin
if tbherramientas <> nil then
if mmobservaciones.Text <> '' then
 btnfuentes.Enabled := true
else
 btnfuentes.Enabled := false;
end;

procedure TfrmNoNotasCredito.RejillaDBTableView1DblClick(Sender: TObject);
begin
if btnalta.Caption = '&Guardar' then
ModificaArticulo;
end;

procedure TfrmNoNotasCredito.edNumNCKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (edNumNc.Text <> '') then
 begin
  key := #0;
  TraeNc(strtoint(edNumNc.Text));
 end;
end;

procedure TfrmNoNotasCredito.edNumPedKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edNumPed.Text <> '') then
 begin
  key := #0;
  edAduana.SetFocus;
 end;
end;

procedure TfrmNoNotasCredito.edAduanaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edAduana.Text <> '') then
 begin
  key := #0;
  dtpFechaAduana.SetFocus;
 end;
end;

procedure TfrmNoNotasCredito.dtpFechaAduanaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  dtpFecPagAnt.SetFocus;
 end;
end;

procedure TfrmNoNotasCredito.dtpFecPagAntKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  mmObservaciones.SetFocus;
 end;
end;

procedure TfrmNoNotasCredito.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key = 46) and (sqlrejilla.RecordCount > 0) then
 begin
  querys('delete from NoDetNotasCredito where id='+sqlrejilla.fieldbyname('id').AsString,1,sqlgeneral);
  sqlrejilla.Close;
  sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
  sqlrejilla.ParamByName('idnc').Value := 0;
  sqlrejilla.Open;
  CalculaTotales;
 end;
end;

procedure TfrmNoNotasCredito.btnimprimirClick(Sender: TObject);
var dec : string;  // ,deducible
begin
//pregunta si se le deduce al cliente
{querys('select if(deducible=1,1,'+floattostr(1+getIVA)+') as deducible from NoClientes where idcliente='+edcuenta.Text,0,sqlgeneral);
deducible := sqlgeneral.fieldbyname('deducible').AsString;    }
{dmreportes.NumToLetras.Numero := strtoint(midstr(edTotMn.Text,1,posex('.',edTotMn.Text)-1));
dec := midstr(edsaldo.text,posex('.',edTotMn.Text)+1,length(edTotMn.Text));
dec:='(' + uppercase(dmreportes.NumToLetras.Letras) + ' PESOS ' + dec + '/100)';}
dec:='PESOS';
//trae el encabezado y los detalles de la nota de credito
querys('SELECT '+quotedstr(edfactura.Text)+' as Factura, LETRAS((NotasCredito.subtotal + NotasCredito.impuesto), '+quotedstr(dec)+') as NumLet,DetNotasCredito.idnc,DetNotasCredito.idpedido,DetNotasCredito.id,DetNotasCredito.cod_cve,articulos.nombre as NomArt,(DetNotasCredito.cant + DetNotasCredito.piezas) as cant,articulos.iva/100 as IvaArt,'+
       'articulos.desc_esp/100 as descuento,DetNotasCredito.tc, if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') as aplica_desc,NotasCredito.idnc,(DetNotasCredito.costo*DetNotasCredito.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'')'+
       ' as Moneda,(if (articulos.aplica_desc = 1,(((DetNotasCredito.costo-(DetNotasCredito.costo*articulos.desc_esp/100)) + ((DetNotasCredito.costo-(DetNotasCredito.costo*articulos.desc_esp/100))*articulos.iva/100))*DetNotasCredito.cant) + '+
       '((((DetNotasCredito.costo/articulos.piezasxunidad)-((DetNotasCredito.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetNotasCredito.costo/articulos.piezasxunidad)-((DetNotasCredito.costo/articulos.piezasxunidad)*'+
       'articulos.desc_esp/100))*articulos.iva/100))*DetNotasCredito.piezas),((DetNotasCredito.costo+(DetNotasCredito.costo*articulos.iva/100))*DetNotasCredito.cant)+(((DetNotasCredito.costo/articulos.piezasxunidad)+((DetNotasCredito.costo/'+
       'articulos.piezasxunidad)*articulos.iva/100))*DetNotasCredito.piezas))*DetNotasCredito.tc) as TotalArt,articulos.piezasxunidad,(articulos.tinstalacion*DetNotasCredito.cant) as tinstalacion,DetNotasCredito.utilidad,'+
       'DetNotasCredito.paquete,NotasCredito.idnc,NotasCredito.FechaNc,clientes.idcliente,ClientesFact.NombreCres  AS Cliente,concat(ifnull(ClientesFact.DirCres,'' ''),'''','' '',ifnull(ClientesFact.ColCres,'' '')) as dir,concat(ifnull( '+
       'ClientesFact.CdCres,'' '' ),'' '', ifnull(ClientesFact.EstadoCres ,'' ''))  AS ciudad,ClientesFact.RFCCres as rfc,ClientesFact.telefono,NotasCredito.observaciones,'+
       'round(NotasCredito.subtotal ,3) as SubTotal,'+
       'NotasCredito.impuesto as IvaNC,'+
       '(NotasCredito.subtotal + NotasCredito.impuesto) as TotalNC,DatosEmpresa.ciudad,DatosEmpresa.estado,'+
       'DatosEmpresa.InteresMoratorio,usuarios.codigo,clientes.deducible as deducible '+
       'FROM NoClientes as clientes LEFT JOIN NoClientesFact as ClientesFact ON (clientes.idfact = ClientesFact.idfact) LEFT JOIN contactos ON (clientes.idcontacto = contactos.idcontador) '+
       'LEFT  JOIN giros ON (clientes.idgiro = giros.idgiro) LEFT JOIN sectores ON (clientes.sector = sectores.idsector) '+
       'join DatosEmpresa join NoNotasCredito as NotasCredito left join NoDetNotasCredito as DetNotasCredito on DetNotasCredito.idnc=NotasCredito.idnc '+
       'left join usuarios on usuarios.idusuario = NotasCredito.idvendedor inner join articulos on DetNotasCredito.cod_cve = articulos.cod_cve WHERE clientes.idcliente='+edcvecte.Text+' and NotasCredito.idnc ='+edNumNc.text,0,dmreportes.sqlgeneral);

//trae el encabezado de la nota de credito
{querys('SELECT NotasCredito.idnc,NotasCredito.FechaNc,clientes.idcliente,ClientesFact.NombreCres  AS Cliente,concat(ifnull(ClientesFact.DirCres,'' ''),'''','' '',ifnull(ClientesFact.ColCres,'' '')) as dir,concat(ifnull( ClientesFact.CdCres,'' '' ) '+
      ', '' '', ifnull(ClientesFact.EstadoCres ,'' ''))  AS ciudad,ClientesFact.RFCCres as rfc,giros.nombre AS Giro,ClientesFact.telefono,sectores.nombre AS Movil,NotasCredito.observaciones,if (clientes.deducible=1, round(NotasCredito.subtotal ,3),'+
      'NotasCredito.subtotal + NotasCredito.impuesto) as SubTotal,if (clientes.deducible=1, (NotasCredito.impuesto) ,0)  as Iva,(NotasCredito.subtotal + NotasCredito.impuesto) as Total,DatosEmpresa.ciudad,DatosEmpresa.estado, '+
      'DatosEmpresa.InteresMoratorio,usuarios.codigo,clientes.deducible as deducible FROM clientes LEFT JOIN ClientesFact ON (clientes.idfact = ClientesFact.idfact) LEFT JOIN contactos ON (clientes.idcontacto = contactos.idcontador) '+
      ' LEFT  JOIN giros ON (clientes.idgiro = giros.idgiro) LEFT JOIN sectores ON (clientes.sector = sectores.idsector) ,DatosEmpresa,NotasCredito left join usuarios on usuarios.idusuario = NotasCredito.idvendedor WHERE NotasCredito.idcliente='+edcvecte.Text+' and NotasCredito.idnc ='+edNumNc.text,0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.FieldByName('deducible').AsBoolean then
   deducible:='1.1'
else
 deducible:='1';
//trae los detalles de la nota de credito
querys('select DetNotasCredito.idpedido,DetNotasCredito.id,DetNotasCredito.cod_cve,articulos.nombre,DetNotasCredito.cant,DetNotasCredito.piezas,if (1.1='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetNotasCredito.tc, '+
       'if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') as aplica_desc,(DetNotasCredito.costo*'+deducible+'*DetNotasCredito.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1, '+
       '(((DetNotasCredito.costo-(DetNotasCredito.costo*articulos.desc_esp/100)) + ((DetNotasCredito.costo-(DetNotasCredito.costo*articulos.desc_esp/100))*articulos.iva/100))*DetNotasCredito.cant) + ((((DetNotasCredito.costo/articulos.piezasxunidad)'+
       '-((DetNotasCredito.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetNotasCredito.costo/articulos.piezasxunidad)-((DetNotasCredito.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetNotasCredito.piezas)'+
       ',((DetNotasCredito.costo+(DetNotasCredito.costo*articulos.iva/100))*DetNotasCredito.cant)+(((DetNotasCredito.costo/articulos.piezasxunidad)+((DetNotasCredito.costo/articulos.piezasxunidad)*articulos.iva/100))*DetNotasCredito.piezas))*'+deducible+
       '*DetNotasCredito.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetNotasCredito.cant) as tinstalacion,DetNotasCredito.utilidad,DetNotasCredito.paquete from DetNotasCredito inner join articulos on DetNotasCredito.cod_cve = '+
       'articulos.cod_cve where DetNotasCredito.idnc='+edNumNc.Text,0,dmreportes.sqlgeneral2);}
//deducible:='0';
dmreportes.ppReport.Template.DatabaseSettings.Name := 'NotasCredito';
dmreportes.ppReport.Template.LoadFromDatabase;
if dmreportes.sqlgeneral.RecordCount > 8 then
 dmreportes.ppFooterBand1.PrintOnLastPage := true
else
 dmreportes.ppFooterBand1.PrintOnFirstPage := true;
dmreportes.ppReport.Print;
end;

procedure TfrmNoNotasCredito.edNumNCChange(Sender: TObject);
begin
if edNumNc.text = '' then
 limpia;
end;

procedure TfrmNoNotasCredito.edTCPExit(Sender: TObject);
begin
if edTCP.Text = '' then
 begin
  application.MessageBox('Debe de especificar el Tipo de Cambio','Cuidado',mb_iconwarning);
  edTCP.SetFocus;
 end
else
 begin
    CalculaTotales;
   //actualiza el tipo de cambio
 // querys('update configuraciones set valor = '+Format('%8.2f',[strtofloat(edTCP.Text)])+' where concepto='+quotedstr('TipoCambio'),1,sqlgeneral);
 end;
end;

end.
