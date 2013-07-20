{////////////////////////// MODIFICACIONES /////////////////////////////////////
2008/08/12 dalyla calcula costo chino
2008/08/01 dalyla buscarlocate no ponga en ceros en el tc change
2008/07/14 dalyla pedir pedimento segun proveedor
2008/06/25-30 dalyla cambios por inventario
2008/06/10 dalyla limpiar error en alta
2008/06/06 dalyla querys de surtido en actualizar
2008/05/28 dalyla articulos.status como integer
2008/05/26 dalyla Validaciones de pedimento, proveedor, etc
2008/05/23 dalyla Tipo de Cambio con 4 decimales
2008/02/28 dalyla zona horaria ok
2007/12/06 Dalila Calcula costo promedio
2007/12/04 Dalila Calculo de Costo promedio llamar funcion donde se ocupe

NOTA LA LISTA NO CALCULA O CUADRA VALORES POR FALTA DE INFORMACION CONTRA EL
PEDIMENTO.... ES DECIR NO SUPIERON COMO CUADRAR
}///////////////////////////////////////////////////////////////////////////////

unit Ucompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MyAccess, MemDS, DBAccess, StdCtrls,
  RzCmboBx, RzDBCmbo, RzDBEdit, DBCtrls, RzEdit, RzBtnEdt, RzButton, Mask,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  cxCurrencyEdit, cxDBEdit, RzPanel, RzRadGrp, RzDBRGrp, ExtCtrls, RzLabel,
  Buttons, ComCtrls, ToolWin, RzDTP, RzDBDTP, RzLstBox, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDInputDlg;

type
  Tfrmcompras = class(TForm)
    pnldatos: TPanel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel11: TRzLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    gbarticulo: TGroupBox;
    RzLabel13: TRzLabel;
    lblproducto: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    Label1: TLabel;
    RzLabel20: TRzLabel;
    btnagregar: TRzBitBtn;
    edDescripcion: TRzEdit;
    edcodigo: TRzButtonEdit;
    edcomentarios: TRzMemo;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    tblcompras: TMyTable;
    DScompras: TDataSource;
    Sqlrejillaalta: TMyQuery;
    DsRejilla: TDataSource;
    SqlGeneral: TMyQuery;
    Sqlrejillaaltatemp: TMyQuery;
    GroupBox1: TGroupBox;
    edbuscar: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    edFechaOrd1: TRzDBEdit;
    RzLabel3: TRzLabel;
    edHoraOrd: TRzDBEdit;
    RzLabel21: TRzLabel;
    RzLabel23: TRzLabel;
    lborden: TRzLabel;
    edbuscarorden: TRzButtonEdit;
    edbuscarprov: TRzButtonEdit;
    edprov: TRzEdit;
    spbarticulos: TSpeedButton;
    dimportacion: TRzDBDateTimeEdit;
    RzLabel25: TRzLabel;
    RzLabel19: TRzLabel;
    edultcompra: TRzEdit;
    RzLabel26: TRzLabel;
    edmin: TRzEdit;
    RzLabel27: TRzLabel;
    edmax: TRzEdit;
    edexist: TRzEdit;
    RzLabel28: TRzLabel;
    sqlgeneral2: TMyQuery;
    EdCosto_unidad: TRzEdit;
    edaduana: TRzDBEdit;
    RzLabel29: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    dpago: TRzDBDateTimeEdit;
    tblcomprasidcompra: TIntegerField;
    tblcomprasidprov: TIntegerField;
    tblcomprasNumPedimento: TStringField;
    tblcomprasaduana: TStringField;
    tblcomprasFechaImp: TDateField;
    tblcomprasFechaCompra: TDateField;
    tblcomprasHoraCompra: TTimeField;
    tblcomprasFechaVigencia: TDateField;
    tblcomprasFechaRecepcion: TDateField;
    tblcomprasFechaPago: TDateField;
    tblcomprasmoneda: TStringField;
    tblcomprasTipoCambio: TFloatField;
    tblcomprasDetallesCompra: TMemoField;
    tblcomprasanticipo: TFloatField;
    tblcomprasfletes: TFloatField;
    tblcomprasotros: TFloatField;
    tblcomprassubtotal: TFloatField;
    tblcomprasiva: TFloatField;
    tblcomprastotal: TFloatField;
    tblcomprastotalmn: TFloatField;
    tblcomprasTotalProductos: TIntegerField;
    tblcomprasusuario: TStringField;
    tblcomprasfecha: TStringField;
    tblcomprashora: TStringField;
    edTipoCambio: TRzEdit;
    rgmoneda: TRzComboBox;
    tblcomprasdescuento: TFloatField;
    estatus: TRzLabel;
    tblcomprasestatus: TStringField;
    tblcomprasUsuarioUltMod: TStringField;
    tblcomprasFechaUltMod: TStringField;
    tblcomprasHoraUltMod: TStringField;
    eddatosentrega: TRzDBRichEdit;
    tblcomprasNumFactura: TStringField;
    edpieza: TRzEdit;
    RzLabel24: TRzLabel;
    gbtotalfactura: TGroupBox;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBCurrencyEdit2: TcxDBCurrencyEdit;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    idorden: TcxGridDBColumn;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    comentarios: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    cant_surt: TcxGridDBColumn;
    precio_costo: TcxGridDBColumn;
    subtotal: TcxGridDBColumn;
    dbiva: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    edCantidad: TRzEdit;
    edFechaOrd: TRzDBDateTimePicker;
    btnimprimir: TRzBitBtn;
    cbiva: TRzComboBox;
    RzLabel36: TRzLabel;
    tblcompraspiva: TFloatField;
    tblcomprasobservaciones: TMemoField;
    edpedimento: TRzMaskEdit;
    tbfacturas: TRzTabbedListBox;
    edfacmonto: TRzEdit;
    RzLabel6: TRzLabel;
    gbtotales: TGroupBox;
    RzLabel22: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel17: TRzLabel;
    edtp: TRzDBNumericEdit;
    edotros: TRzEdit;
    edfletes: TRzEdit;
    edtotalmn: TRzDBNumericEdit;
    edtotal: TRzDBNumericEdit;
    edsubtotal: TRzDBNumericEdit;
    gbanticipos: TGroupBox;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    edanticipo: TcxDBCurrencyEdit;
    eddescuento: TcxDBCurrencyEdit;
    ediva: TRzDBNumericEdit;
    ednfactura: TRzEdit;
    idMonto: TLMDInputDlg;
    LMonto: TRzLabel;
    lbufh: TRzLabel;

    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure edbuscarordenButtonClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edbuscarprovKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarprovButtonClick(Sender: TObject);
    procedure edbuscarordenKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarClick(Sender: TObject);
    procedure edpedimentoKeyPress(Sender: TObject; var Key: Char);
    procedure edTipoCambioExit(Sender: TObject);
    procedure edfleteKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure spbarticulosClick(Sender: TObject);
    procedure dimportacionEnter(Sender: TObject);
    procedure rgmonedaChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure edfletesKeyPress(Sender: TObject; var Key: Char);
    procedure rgmonedaExit(Sender: TObject);
    procedure RejillaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarprovChange(Sender: TObject);
    procedure edfletesExit(Sender: TObject);
    procedure EdCosto_unidadKeyPress(Sender: TObject; var Key: Char);
    procedure edTipoCambioKeyPress(Sender: TObject; var Key: Char);
    procedure dpagoKeyPress(Sender: TObject; var Key: Char);
    procedure dpagoEnter(Sender: TObject);
    procedure edaduanaEnter(Sender: TObject);
    procedure edotrosKeyPress(Sender: TObject; var Key: Char);
    procedure edotrosExit(Sender: TObject);
    procedure rgmonedaNotInList(Sender: TObject);
    procedure rgmonedaEnter(Sender: TObject);
    procedure eddescuentoExit(Sender: TObject);
    procedure edcodigoChange(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbivaExit(Sender: TObject);
    procedure edfacmontoKeyPress(Sender: TObject; var Key: Char);
    procedure tbfacturasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edivaChange(Sender: TObject);
    procedure edivaKeyPress(Sender: TObject; var Key: Char);
    procedure rgmonedaKeyPress(Sender: TObject; var Key: Char);
    procedure tblcomprasBeforePost(DataSet: TDataSet);
    procedure edTipoCambioChange(Sender: TObject);
    procedure LMontoDblClick(Sender: TObject);
  private
    moneda :string;
    procedure mostrar_registros;
    procedure buscarlocate;
    procedure buscarordenlocate;
    procedure buscarprovlocate;
    procedure actualizar;
    procedure operacion;
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure LimpiaDatArt;
    function ValidaProducto(CodCve:string):integer;
    procedure RejillaAlta;
    procedure RejillaAltaTemp;
    procedure ActualizaXMoneda;
    procedure CalcularCostoAP;
    procedure HabilitarPedimento;
    procedure Limpiar;
    { Private declarations }
  public
    { Public declarations }
      idcompra,idprov,idord:string; //variables globales el id de la compra, el id del proveedor, y total productos de la compra
      tp,tipo,ban:integer;
      og,fl,_gCosto, Monto:double;
      constructor inicializa(const compra:integer);
  end;

var
  frmcompras: Tfrmcompras;

implementation

uses Ubusquedas, Uprincipal, Urecursos, Uproveedores, Uarticulos, Udm,
  Urelacionborrar, UBuscaArt, Udmrep;

{$R *.dfm}

constructor Tfrmcompras.inicializa(const compra:integer);
begin
tipo:=compra;
if tipo = 0 then
  begin
  lborden.Visible:=false;
  edbuscarorden.Visible:=false;
  end;

if tipo = 2 then //Compras Anteriores
  begin
  lborden.Visible:=false;
  edbuscarorden.Visible:=false;
  Self.Caption := 'Compras Atrasadas';
  end;
end;

procedure Tfrmcompras.mostrar_registros;
begin
  idord:=RejillaDBTableView1.DataController.DataSet.fieldbyname('idorden').AsString;
  edultcompra.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('ultima_compra').AsString;
  edmin.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('minimo').AsString;
  edmax.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('maximo').AsString;
  edexist.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('existencia').AsString;
  edDescripcion.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('nombre').AsString;
  EdCosto_unidad.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('costo').AsString;
//  edmoneda.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('moneda').AsString;
//  ediva_art.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('iva').AsString;
  edcodigo.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('cod_cve').AsString;
  edcantidad.text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('cant_ord').AsString;
end;

procedure Tfrmcompras.buscarprovlocate;
  var hija:tfrmproveedores;
  var entro:boolean;
begin
///busqueda del proveedor
querys('select idprov,'+ClienteNombre('p')+' as nombre,estatus,nacional from proveedores as p where idprov='+quotedstr(idprov),0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
  begin
  if application.MessageBox('No existe ese Proveedor!, deseas darlo de alta','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
    frmprincipal.muestra_mdichild(361,690,tfrmproveedores,'Acceso la Pantalla de Proveedores');
    frmprincipal.ucprincipal.Log('Acceso a la Pantalla de Proveedores',1);
    hija:=tfrmproveedores.Create(self);
    hija.Show;
    end;
  edbuscarprov.Text:='';
  edprov.text:='';
  end
else
  begin
  entro := false;
  if((btnalta.Caption = '&Alta') and (btnmodificar.Caption='&Editar')) then
      entro := true;

  if not (entro) then
    if SqlGeneral.fieldbyname('estatus').AsBoolean = true then
       entro := true
    else
      begin
        application.MessageBox('Ese proveedor no esta Activo','Confirmación',mb_iconwarning);
        edbuscarprov.Text:='';
      end;

    if(entro) then
     begin
        idprov:=SqlGeneral.fieldbyname('idprov').AsString;
        edbuscarprov.text:=SqlGeneral.fieldbyname('idprov').AsString;
        edprov.text:=SqlGeneral.fieldbyname('nombre').AsString;
        HabilitarPedimento;
     end;

  end;//if recordcount
end;


procedure Tfrmcompras.buscarordenlocate;
begin
//buscar la orden por la cual comprar
querys('Select idorden,idproveedor,FechaOrden,total,TotalProductos,estatus,fletes,otros,moneda,piva,TipoCambio from Ordenes where (estatus <> ''SURTIDO'' and estatus <> ''CANCELADA'' and estatus <> ''FACTURANDO'') and idorden='+edbuscarorden.text,0,SqlGeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  {if application.MessageBox('Desea insertar los articulos de la orden?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
     begin }
     idprov:=sqlgeneral.fieldbyname('idproveedor').asstring;
     edbuscarprov.Text:=idprov;
     rgmoneda.Text:=sqlgeneral.fieldbyname('moneda').AsString;
     moneda :=rgmoneda.text;
     cbiva.text := sqlgeneral.fieldbyname('piva').AsString;
     edTipoCambio.Text:=sqlgeneral.fieldbyname('TipoCambio').AsString;
     if edfletes.text = '' then
       edfletes.Text:=sqlgeneral.fieldbyname('fletes').AsString
     else
       edfletes.Text:=floattostr(strtofloat(edfletes.Text) + sqlgeneral.fieldbyname('fletes').asfloat);
     if edotros.text = '' then
        edotros.Text:=sqlgeneral.fieldbyname('otros').AsString
     else
        edotros.Text:=floattostr(strtofloat(edotros.Text) + sqlgeneral.fieldbyname('otros').AsFloat);
     buscarprovlocate;

     /////////////////////////INSERTAR A TEMPORAL////////////////////////////////////
     //insertar los datos de la orden a la tabla temporal de detalles compra
     querys('insert into DetComprasTemp(idcompra,idorden,cod_cve,cant_ord,costo,comentarios,idmaq) select '+quotedstr(edbuscar.Text)+',idorden,cod_cve,cant_ord,costo,comentarios,'+quotedstr(frmprincipal.idmaq)+' from DetOrden where cant_ord > 0 and idorden='+quotedstr(edbuscarorden.Text),1,SqlGeneral);
     querys('UPDATE Ordenes  SET estatus=''FACTURANDO'' WHERE idorden='+quotedstr(edbuscarorden.Text),1,SqlGeneral);

     RejillaAltaTemp;
     operacion;
     edbuscarorden.Text:='';
     edbuscarorden.SetFocus;
     if ban = 0 then
       begin
       rejilla.enabled:=true;
       gbarticulo.Enabled:=true;
       edbuscarprov.Enabled:=true;
       tblcomprasidcompra.AsString:=idcompra;
       //  tblcompras.Post;///grabar y poner en modo edición....
       //  tblcompras.Edit;
       btnalta.Enabled:=true;
       ban:=1;
       end;
{     end
  else
    begin
    edbuscarorden.Text:='';
    edbuscarorden.SetFocus;
    end;}
  end
else
  begin
  application.MessageBox('Esa orden no existe!','Aviso',mb_iconinformation);
  edbuscarorden.Text:='';
  edbuscarprov.Text:='';
  edprov.Text:='';
  edbuscarorden.SetFocus;
  end;
end;

procedure Tfrmcompras.buscarlocate;
var _arreglo: TStringList;   f:string;
y:integer;
begin
//busqueda de la orden por medio un locate esto si es oprimido el enter despues de haber tecleado un digito

tblcompras.Active:=true;
if tblcompras.Locate('idcompra',edbuscar.Text,[]) then
  begin
  IF (tblcompras.fieldbyname('estatus').AsString = 'CANCELADA')  THEN
    estatus.caption:=tblcompras.fieldbyname('estatus').AsString
  else
    estatus.caption:='';
  idprov:=tblcompras.fieldbyname('idprov').AsString;
  idcompra:=tblcompras.fieldbyname('idcompra').AsString;
  edpedimento.text := tblcompras.fieldbyname('NumPedimento').AsString;
  btnmodificar.Enabled:=true;
  btnalta.Enabled:=true;
  btnborrar.Enabled:=true;
  edbuscarprov.Text:=idprov;
  rgmoneda.Text:=tblcomprasmoneda.AsString;
  cbiva.Text:= tblcompraspiva.AsString;
  buscarprovlocate;
  lbufh.Caption := UFH(tblcompras);

  RejillaAlta;

  edfletes.Text:=tblcomprasfletes.AsString;
  edotros.Text:=tblcomprasotros.AsString;
  edTipoCambio.Text:=tblcomprasTipoCambio.AsString;
  btnimprimir.enabled:=true;
  tbfacturas.Clear;
  _arreglo := TStringList.Create;
  DividirCadenaPorDelimitador_Split(#13, tblcomprasNumFactura.AsString, _arreglo);
  if(_arreglo.Count > 1) then
  for y:=0 to _arreglo.Count-1 do
    begin
    if ((y+1) mod 2) = 1 then
      tbfacturas.Add(_arreglo[y])
    else
      begin
      f:= _arreglo[y-1];
      tbfacturas.Delete(tbfacturas.Count-1);
      tbfacturas.Add( f + #9 + _arreglo[y] )
      end;
    end;

  end
else
  begin
  estatus.Caption:='';
  rgmoneda.ItemIndex:=-1;
  btnmodificar.Enabled:=false;
  btnborrar.Enabled:=false;
  application.MessageBox('Esa Compra no Existe','Información',mb_ok+mb_iconinformation);
  edbuscarorden.text:='';
  edbuscarprov.text:='';
  edprov.Text:='';
  tblcompras.Active:=false;
  SqlRejillaAlta.Close;
  edbuscar.Text:='';
  edbuscar.SetFocus;
  btnmodificar.Enabled:=false;
  btnborrar.Enabled:=false;
  end;// idarea
end;

procedure Tfrmcompras.actualizar;
  //var ban:integer;// costo:double;      cantidad,idpedido,
begin
//ban:=0;
if tipo <> 2 then
  begin
  if btnalta.enabled then
    querys('UPDATE articulos,DetCompras SET articulos.ultima_compra="'+datetostr(edFechaOrd.date)+'", UltimoCosto = articulos.costo '+
           'WHERE articulos.cod_cve=DetCompras.cod_cve AND DetCompras.idcompra="'+idcompra+'"',1,sqlgeneral);

  //////ACTUALIZAR EL DATO DE ordenados DE ARTICULOS.......
  querys('select dc.cod_cve, if((sum(dor.cant_ord) <= dc.cant_ord), if(((sum(dor.cant_ord)*a.piezasxunidad)<=0),0,(sum(dor.cant_ord)'+
         '*a.piezasxunidad)), if ((((sum(dc.cant_ord) *a.piezasxunidad)) <=0),0,(sum(dc.cant_ord) *a.piezasxunidad))) as n '+
         'from articulos a inner join DetCompras dc on a.cod_cve=dc.cod_cve inner join DetOrden dor on a.cod_cve=dor.cod_cve '+
         'AND dor.idorden=dc.idorden inner join compras c on  c.idcompra=dc.idcompra WHERE  dc.idcompra='+edbuscar.text+
         ' group by dc.cod_cve ', 0, sqlgeneral);
  sqlgeneral.first;
  while not sqlgeneral.Eof = true do
    begin
    querys('UPDATE articulos a SET a.ordenados = ordenados - '+sqlgeneral.fieldbyname('n').asstring+' WHERE a.cod_cve="'+
            sqlgeneral.fieldbyname('cod_cve').asstring+'"',1,dmaccesos.sqlgeneral);
    sqlgeneral.next;
    end;
  end;

///actualizar la orden con la cantidad surtida.....
querys('UPDATE DetOrden,compras,DetCompras SET  DetOrden.cant_sur=if (DetOrden.cant_ord<=DetCompras.cant_ord,DetOrden.cant_ord+DetOrden.cant_sur,(DetCompras.cant_ord)+DetOrden.cant_sur), DetOrden.cant_ord=if '+
       '(DetOrden.cant_ord<=DetCompras.cant_ord,0, (DetOrden.cant_ord-DetCompras.cant_ord)) WHERE DetOrden.idorden=DetCompras.idorden AND DetOrden.cod_cve=DetCompras.cod_cve AND DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);

querys('UPDATE Ordenes,DetCompras,DetOrden SET Ordenes.estatus=''SURTIDO'' WHERE Ordenes.idorden=DetCompras.idorden AND DetOrden.idorden=Ordenes.idorden and DetOrden.cant_ord = 0 and  DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);
querys('UPDATE Ordenes,DetCompras,DetOrden SET Ordenes.estatus=''INCOMPLETO'' WHERE Ordenes.idorden=DetCompras.idorden AND DetOrden.idorden=Ordenes.idorden and DetOrden.cant_ord > 0 and  DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);

//insertar registros en la tabla de movimientos
querys('INSERT INTO MovArt(iddoc,cod_cve,cant,NumPedimento,usuario,fecha,hora) SELECT '+quotedstr(idcompra)+',DetCompras.cod_cve,DetCompras.cant_ord,compras.NumPedimento,'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(edFechaOrd.date))+','+quotedstr(edHoraOrd.text)+' FROM DetCompras INNER JOIN compras ON(compras.idcompra = DetCompras.idcompra) WHERE DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);

if tipo <> 2 then
  begin
  //insertar datos a art_prov
  querys('SELECT compras.idprov as idprov,DetCompras.cod_cve as cod_cve,DetCompras.costo as costo FROM compras inner join DetCompras on (compras.idcompra=DetCompras.idcompra) where compras.idcompra='+quotedstr(idcompra),0,SqlGeneral2);
  while not sqlgeneral2.Eof do
    begin
    querys('Select idprov,cod_cve from art_prov where idprov='+quotedstr(sqlgeneral2.Fields.Fields[0].asstring)+' and cod_cve='+quotedstr(sqlgeneral2.Fields.Fields[1].asstring),0,sqlgeneral);
    if sqlgeneral.FieldByName('idprov').AsString <> '' then
      querys('UPDATE art_prov set costo='+quotedstr(sqlgeneral2.FieldByName('costo').AsString)+' where idprov='+quotedstr(sqlgeneral2.FieldByName('idprov').AsString)+' and cod_cve='+quotedstr(sqlgeneral2.FieldByName('cod_cve').AsString),1,SqlGeneral)
    else
      querys('INSERT INTO art_prov(idprov,cod_cve,costo,fecha,hora,usuario) values('+quotedstr(sqlgeneral2.FieldByName('idprov').AsString)+','+quotedstr(sqlgeneral2.FieldByName('cod_cve').AsString)+','+quotedstr(sqlgeneral2.FieldByName('costo').AsString)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+')',1,SqlGeneral);
    sqlgeneral2.Next;
    end;
  end;

////insertar en la tabla de cardex
querys('SELECT idmovi FROM TipoMov WHERE nombre="COMPRA" ',0,sqlgeneral2);
querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
       'SELECT dc.cod_cve,dc.idcompra,((dc.cant_ord) * (a.piezasxunidad)),dc.costo,"E","'+
       sqlgeneral2.fieldbyname('idmovi').AsString+'","'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'","'+
       frmprincipal.ucprincipal.CurrentUser.loginname+'", "Compra de Mercancia" FROM  DetCompras as dc LEFT JOIN articulos as a ON '+
       '(a.cod_cve=dc.cod_cve) WHERE idcompra='+quotedstr(idcompra),1,sqlgeneral);

CalcularCostoAP;

//si hay una orden que fue hecha por una requisicion hacer los siguiente.........
//afectamos el backorder de articulos
{     querys('UPDATE articulos,DetCompras,DetOrden,requisiciones SET articulos.backorder=if (((DetCompras.cant_ord*articulos.piezasxunidad)<=articulos.backorder),if((articulos.backorder-(DetCompras.cant_ord*articulos.piezasxunidad)<=0),0,articulos.backorder- '+
            '(DetCompras.cant_ord*articulos.piezasxunidad)), if (((articulos.backorder-(DetCompras.cant_ord*articulos.piezasxunidad)) <=0),0,articulos.backorder-(DetCompras.cant_ord*articulos.piezasxunidad))) WHERE articulos.cod_cve=DetCompras.cod_cve AND '+
            'DetOrden.idorden=requisiciones.idorden AND DetCompras.idorden=DetOrden.idorden AND DetCompras.cod_cve=DetOrden.cod_cve AND DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);}

//afectamos el backorder de articulos
if tipo = 2 then
  exit;

//Actualiza existencia - requerido
querys('select if(r.idorden is null, 0, if( sum(cant_ord) >=(sum(cantidad)-sum(surtido)), (sum(cantidad)-sum(surtido)), '+
       'sum(cant_ord))) as e, c.cod_cve from DetCompras c left join requisiciones r on r.cod_cve = c.cod_cve '+
       'and r.idorden=c.idorden  where c.idcompra = '+edbuscar.text+' group by c.cod_cve', 0, sqlgeneral);
sqlgeneral.first;
while not sqlgeneral.eof = true do
  begin
  querys('update articulos a set existencia = existencia - '+sqlgeneral.fieldbyname('e').asstring+
         ' where a.cod_cve = "'+sqlgeneral.fieldbyname('cod_cve').asstring+'"' , 1, dmaccesos.sqlgeneral);
  sqlgeneral.next;
  end;

//Actualizamos el surtido de la requisicion
querys('update requisiciones r, DetCompras c set surtido = surtido +  if( cant_ord >= (cantidad-surtido), '+
       '(cantidad-surtido),  cant_ord) where r.cod_cve = c.cod_cve and r.idorden=c.idorden and c.idcompra = '+edbuscar.text, 1, sqlgeneral);

{querys('UPDATE articulos,DetCompras SET articulos.backorder = if (((DetCompras.cant_ord*articulos.piezasxunidad)<=articulos.backorder),if((articulos.backorder-(DetCompras.cant_ord*articulos.piezasxunidad)<=0),0,articulos.backorder- '+
       '(DetCompras.cant_ord*articulos.piezasxunidad)), if (((articulos.backorder-(DetCompras.cant_ord*articulos.piezasxunidad)) <=0),0,articulos.backorder-(DetCompras.cant_ord*articulos.piezasxunidad))) WHERE articulos.cod_cve=DetCompras.cod_cve '+
       ' AND DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);}
  {
//HAY REQUISICIONES
if querys('SELECT idcompra FROM DetCompras INNER JOIN requisiciones ON (DetCompras.idorden=requisiciones.idorden) WHERE idcompra='+quotedstr(idcompra),0,sqlgeneral) > 0 then
  begin
  ////hacemos busqueda de articulos que sean unidadades y por piezas para insertarlos a una tabla temporal que  trae el concentrado de cada articulo necesarios para la existencia y los apartados
  querys('DROP TABLE IF EXISTS temporal_compras'+frmprincipal.idmaq,1,sqlgeneral);
  querys('CREATE TABLE temporal_compras'+frmprincipal.idmaq+' (cod_cve integer (11),cantidad integer (11),surtido integer (11),KEY cod_cve(cod_cve)) ',1,sqlgeneral);

  querys('INSERT INTO temporal_compras'+frmprincipal.idmaq+' (cod_cve,cantidad,surtido) '+
         'SELECT requisiciones.cod_cve, sum(requisiciones.cantidad) as cantidad, sum(requisiciones.surtido) as surtido '+
         'from requisiciones  INNER JOIN DetCompras ON (requisiciones.idorden = DetCompras.idorden) WHERE DetCompras.idcompra='+
         quotedstr(idcompra)+' AND   DetCompras.cod_cve=requisiciones.cod_cve GROUP BY requisiciones.cod_cve',1,sqlgeneral);

//si hay una orden que fue hecha por una requisicion hacer los siguiente.........
//afectamos el backorder de articulos
     querys('UPDATE articulos a,DetCompras dc,DetOrden dor,requisiciones r SET a.backorder = if(((dc.cant_ord*a.piezasxunidad) <= a.backorder), '+
            'if((a.backorder-(dc.cant_ord*a.piezasxunidad)<= 0 ), 0, a.backorder - (dc.cant_ord*a.piezasxunidad)), '+
            'if(((a.backorder-(dc.cant_ord*a.piezasxunidad)) <= 0 ),0,a.backorder-(dc.cant_ord*a.piezasxunidad))) '+
            'WHERE a.cod_cve=dc.cod_cve AND dor.idorden=r.idorden AND dc.idorden=dor.idorden AND dc.cod_cve=dor.cod_cve '+
            'AND dc.idcompra='+quotedstr(idcompra),1,sqlgeneral);

  ////actualizar existencias y Apartados de la compra realizada, utilizando la tabla temporal
  querys('select sum(cant_ord) as c_cantidad,cod_cve from DetCompras where idcompra='+quotedstr(idcompra)+' group by cod_cve',0,sqlgeneral);
  while not sqlgeneral.Eof do
    begin
    querys('UPDATE articulos a, temporal_compras'+frmprincipal.idmaq+' tc '+
           'SET a.apartado = if(((tc.cantidad-tc.surtido) >= ('+sqlgeneral.FieldByName('c_cantidad').AsString+'*a.piezasxunidad)),'+
           'a.apartado + ('+sqlgeneral.FieldByName('c_cantidad').AsString+'*a.piezasxunidad), a.apartado + (tc.cantidad-tc.surtido)), '+

           'a.existencia = if (((tc.cantidad-tc.surtido) >= ('+sqlgeneral.FieldByName('c_cantidad').AsString+'*a.piezasxunidad)), '+
           'a.existencia,(a.existencia +  (('+sqlgeneral.FieldByName('c_cantidad').AsString+'*a.piezasxunidad)-(tc.cantidad-tc.surtido)))) '+
           'WHERE a.cod_cve="'+sqlgeneral.FieldByName('cod_cve').AsString+'" AND tc.cod_cve='+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString),1,sqlgeneral2);

    sqlgeneral.next;
    end;

  querys('DROP TABLE IF EXISTS temporal_compras'+frmprincipal.idmaq,1,sqlgeneral);

 // Aqui actualizamos en requisiones cuales son las que quedan incompletas y cuales completas ,  los estatus son:
//   0 = sin afectar  1 = en orden   2 = surtido   3 = incompleto    4 = cancelado


  querys('SELECT articulos.cod_cve AS cod_cve,(articulos.piezasxunidad * DetCompras.cant_ord) AS cant_ord,DetCompras.idorden AS idorden,DetCompras.idcompra AS idcompra,articulos.piezasxunidad as piezas '+
         'FROM articulos,DetCompras WHERE articulos.cod_cve = DetCompras.cod_cve AND idcompra='+quotedstr(idcompra)+' ORDER BY idorden',0,sqlgeneral);

  while not sqlgeneral.Eof do
    begin
    cantidad:=sqlgeneral.fieldbyname('cant_ord').AsInteger;

    querys('SELECT * FROM requisiciones WHERE (idorden='+quotedstr(sqlgeneral.fieldbyname('idorden').AsString)+') AND (cod_cve='+quotedstr(sqlgeneral.fieldbyname('cod_cve').AsString)+') AND (estatus <> 4 and estatus <> 2) ',0,sqlgeneral2);
    while not sqlgeneral2.Eof do
      begin
      if cantidad > 0 then
        begin
        //    if sqlgeneral2.FieldByName('piezas').AsInteger = 1  then begin
        if ((sqlgeneral2.FieldByName('cantidad').asinteger - sqlgeneral2.FieldByName('surtido').asinteger) >= cantidad ) then
          begin
          querys('Update requisiciones set surtido = surtido + '+inttostr(cantidad)+' where cod_cve="'+sqlgeneral2.FieldByName('cod_cve').asstring+'"', 1, dmreportes.sqlgeneral6);
          cantidad:=0;
          end
        else
          begin
          cantidad:=(cantidad - (sqlgeneral2.FieldByName('cantidad').AsInteger - sqlgeneral2.FieldByName('surtido').AsInteger));
          querys('Update requisiciones set estatus = 2, surtido = surtido + (cantidad-surtido) where cod_cve="'+sqlgeneral2.FieldByName('cod_cve').asstring+'"', 1, dmreportes.sqlgeneral6);
          end; //if cantidad
        sqlgeneral2.Next;
        end
      else
        sqlgeneral2.Last;//cantidad
      end;//while
    sqlgeneral.Next;
    end;////el campo surtido ha sido modificado

  ////////////////actulizar requisiciones y pedidos(SUS ESTATUS)........
  querys('UPDATE requisiciones SET estatus=if(cantidad<=surtido,2,estatus)',1,sqlgeneral);

  querys('SELECT pedidos.idPedidoHijo as idhijo,requisiciones.cantidad as cantidad,requisiciones.surtido as surtido,requisiciones.cod_cve as cod_cve FROM pedidos INNER JOIN requisiciones ON (requisiciones.iddoc=pedidos.idpedido) '+
         'INNER JOIN DetCompras ON (DetCompras.idorden=requisiciones.idorden) WHERE requisiciones.cod_cve=DetCompras.cod_cve and DetCompras.idcompra='+quotedstr(idcompra),0,sqlgeneral);
  while not sqlgeneral.Eof do
    begin
    querys('UPDATE DetPedido SET DetPedido.surtido=if(('+quotedstr(sqlgeneral.FieldByName('cantidad').Asstring)+' <= '+quotedstr(sqlgeneral.FieldByName('surtido').Asstring)+'),1,2) WHERE DetPedido.idpedido='+quotedstr(sqlgeneral.FieldByName('idhijo').Asstring)+' AND '+
           'DetPedido.cod_cve='+quotedstr(sqlgeneral.FieldByName('cod_cve').Asstring),1,sqlgeneral2);
    sqlgeneral.Next;
    end;

  //actualizar el estatus de los pedidos

  querys('SELECT idpedido,IF(surtido =1,1,0) as condicion FROM DetPedido dp left join DetCompras dc on dp.cod_cve=dc.cod_cve '+
         'where idcompra = '+edbuscar.text+' and surtido = 0 ORDER BY idpedido',0,sqlgeneral);
  idpedido:=sqlgeneral.FieldByName('idpedido').AsInteger;
  while not sqlgeneral.Eof do
    begin
    querys('UPDATE pedidos SET estatus=0 WHERE idpedido='+inttostr(idpedido)+' and estatus=2',1,sqlgeneral2);
    sqlgeneral.Next;
    end;

  if ban=0 then
    querys('UPDATE pedidos SET estatus=0 WHERE  idpedido='+inttostr(idpedido)+' and estatus=2',1,sqlgeneral2);

  end
else//if requisiciones   //////////actualizar existencias si no hay requisiciones
  begin
  //Pasamos el backorder a apartados si hay backorder pero no hay requis
  
  if querys('select backorder from articulos a left join DetCompras dc on dc.cod_cve=a.cod_cve where idcompra ='+idcompra+
            ' and backorder > 0', 0,sqlgeneral) > 0 then
    querys('UPDATE articulos a,DetCompras dc SET a.backorder = if (((dc.cant_ord*a.piezasxunidad) <= a.backorder), '+
           'if((a.backorder-(dc.cant_ord * a.piezasxunidad)<=0), 0, a.backorder - (dc.cant_ord*a.piezasxunidad)), '+
           'if (((a.backorder-(dc.cant_ord*a.piezasxunidad)) <=0), 0, a.backorder-(dc.cant_ord*a.piezasxunidad))), '+

           ' apartado = apartado + (if(((dc.cant_ord*a.piezasxunidad)<=a.backorder), '+
           'if(( a.backorder - (dc.cant_ord*a.piezasxunidad)<=0), a.backorder, a.backorder - (dc.cant_ord*a.piezasxunidad)), '+
           'if (((a.backorder-(dc.cant_ord * a.piezasxunidad)) <= 0), a.backorder, a.backorder - (dc.cant_ord*a.piezasxunidad)))) '+
           'WHERE a.cod_cve=dc.cod_cve AND dc.idcompra= "'+idcompra+'"',1,sqlgeneral)
  else}
    querys('UPDATE articulos a, (select sum(cant_ord) as cant_ord, cod_cve, idcompra from DetCompras where idcompra = '+
           idcompra+' group by cod_cve) dc SET a.existencia=(a.existencia + (dc.cant_ord*a.piezasxunidad)) '+
           'WHERE a.cod_cve=dc.cod_cve AND dc.idcompra='+quotedstr(idcompra),1,sqlgeneral);
//  end;
end;

procedure Tfrmcompras.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
// modifica un articulo de la rejilla ya sea la cantidada o el costo
if dsrejilla.DataSet.RecordCount > 0 then
  begin
  edcodigo.Text:=dsrejilla.DataSet.FieldValues['cod_cve'];
  eddescripcion.Text:=dsrejilla.DataSet.FieldValues['nombre'];
  EdCosto_unidad.Text:=dsrejilla.DataSet.FieldValues['costo'];
  _gCosto := strtofloat(EdCosto_unidad.Text);
//  edmoneda.Text:=dsrejilla.DataSet.FieldValues['moneda'];
  edcantidad.Text:=dsrejilla.DataSet.FieldValues['cant_ord'];
  edcomentarios.Text:=dsrejilla.DataSet.FieldValues['comentarios'];

  //elimina el registro del articulo
  querys('select idorden from DetComprasTemp where idorden='+quotedstr(idord),0,sqlgeneral);
  if sqlgeneral.RecordCount = 1 then
    querys('UPDATE Ordenes,DetComprasTemp  SET Ordenes.estatus=''PENDIENTE'' WHERE DetComprasTemp.idorden=Ordenes.idorden and DetComprasTemp.idorden='+quotedstr(idord)+' and DetComprasTemp.idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);

  querys('delete from '+tabla+' where idmaq='+quotedstr(frmprincipal.idmaq)+' and '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and cant_ord='+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord']),1,SqlGeneral);
  //refresca la rejilla de datos

  idcompra := valor;
  RejillaAltaTemp;
  { query.Close;
  query.ParamByName('id').asstring:=valor;
  query.Open;}

  dsrejilla.DataSet:=query;
  btnagregar.Enabled:=true;
  edcodigo.Enabled:=false;
  edcantidad.Enabled:=true;
  edcantidad.SetFocus;
  operacion;
  end;
end;

procedure TfrmCompras.operacion;
var id:string;
cambio:double;
begin // se calcula los totales conforme a los datos de los campos
if rgmoneda.text = '' then
  begin
  application.messagebox('Especifique la moneda que utilizara', 'Atencion', MB_ICONEXCLAMATION);
  rgmoneda.setfocus;
  exit;
  end
else
  if (rgmoneda.Text = 'D') and (EdTipoCambio.text = '') then
    begin
    application.messagebox('Especifique el Tipo de Cambio que utilizara', 'Atencion', MB_ICONEXCLAMATION);
    EdTipoCambio.setfocus;
    exit;
    end;

id:=edbuscar.text;

querys('Select SUM(d.cant_ord * d.costo) as SUBTOTAL, SUM(d.cant_ord * d.costo*'+cbiva.text+') as IVA,'+
       'SUM(d.cant_ord * d.costo*'+floattostr(1+strtofloat(cbiva.text))+') as TOTAL,'+
       'SUM(d.cant_ord) as TotalProductos From DetComprasTemp as d '+
       'WHERE d.idcompra='+id+' Order By d.cod_cve', 0, sqlgeneral);

if rgmoneda.text = 'D' then
  cambio := strtofloat(edTipoCambio.text)
else
  cambio := 1;

edtp.text:=inttostr(SqlGeneral.fieldbyname('TotalProductos').AsInteger);
edsubtotal.Text:=floattostr(SqlGeneral.fieldbyname('SUBTOTAL').AsFloat) ; // *  (1 + (quitacaracteres(eddescuento.Text,'$')/100)) ) ;
//if not(edpedimento.Enabled) then
  ediva.Text:=floattostr(SqlGeneral.fieldbyname('IVA').AsFloat);

if edotros.Text = '' then
  edotros.text := '0';
if edfletes.Text = '' then
  edfletes.text := '0';
if rgmoneda.text = 'D' then
  edtotal.Text:=floattostr((strtofloat(edfletes.text) + strtofloat(edotros.text)) + (SqlGeneral.fieldbyname('SUBTOTAL').AsFloat) + strtofloat(ediva.Text))
else
  if (edTipoCambio.Text <> '') then
    edtotal.Text:=floattostr((strtofloat(edfletes.text) + strtofloat(edotros.text) + (SqlGeneral.fieldbyname('SUBTOTAL').AsFloat+strtofloat(ediva.Text))/cambio))
  else
    edtotal.Text:=floattostr((strtofloat(edfletes.text) + strtofloat(edotros.text) + (SqlGeneral.fieldbyname('SUBTOTAL').AsFloat+strtofloat(ediva.Text))*cambio));
edtotalmn.Text:=Format('%8.2f',[strtofloat(edtotal.Text)*cambio]);
if (edTipoCambio.Text <> '') and (rgmoneda.text = 'P') then
  edtotal.text := '0.00';
end;

procedure Tfrmcompras.InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
var temp:string;
begin
if ((btnagregar.Enabled) and (edcodigo.text <> ''))then
  begin
  if rejilla.Enabled = false then
    rejilla.Enabled:=true;

  //verifica que no exista el articulo en la lista insercion para unidades.
  querys('select * from '+tabla+' where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+
         ' and idmaq='+quotedstr(frmprincipal.idmaq),0,SqlGeneral);
  if SqlGeneral.RecordCount = 0 then
    begin
    querys('select cod_cve,if ( maximo >= '+quotedstr(edcantidad.Text)+' + (existencia/piezasxunidad), 1, 0) as '+
           'condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,sqlgeneral);
    if sqlgeneral.FieldByName('cod_cve').AsString = '' then
      application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
    //inserta los datos del articulo en art_compuestos
    querys('insert into '+tabla+'(cant_ord,cod_cve,'+campo+',costo,comentarios,idmaq) values ('+edcantidad.Text+','+
            '"'+edcodigo.Text+'","'+valor+'",'+quotedstr(EdCosto_unidad.Text)+','+quotedstr(edcomentarios.Text)+','+
            quotedstr(frmprincipal.idmaq)+')',1,SqlGeneral);
    end
  else
    begin
    temp:=sqlgeneral.fieldbyname('idorden').AsString;
    //solo actualiza las existencias en caso de ya estar en la tabla
    querys('select cod_cve,if ( maximo >= (('+quotedstr(sqlgeneral.fieldbyname('cant_ord').asstring)+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,dmaccesos.sqlgeneral);
    if dmaccesos.sqlgeneral.FieldByName('cod_cve').AsString = '' then
    application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
    querys('update '+tabla+' set cant_ord=cant_ord+'+quotedstr(edcantidad.Text)+',costo='+quotedstr(EdCosto_unidad.Text)+',comentarios='+quotedstr(edcomentarios.Text)+'  where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and idorden='+quotedstr(temp),1,SqlGeneral);
    end;
  end
else
  begin
  //solo actualiza las existencias en caso de ya estar en la tabla
  querys('update '+tabla+' set costo='+quotedstr(EdCosto_unidad.Text)+'  where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and idorden='+quotedstr(idord),1,SqlGeneral);
  end;

//SACAR LOS COSTOS Y LOS TIEMPOS
//mostrar los articulos del paquete en la rejilla.......
operacion;
rejilla.Enabled:=true;
//vuelve a abrir la query con el id;
idcompra := valor;
RejillaAltaTemp;
{query.Close;
query.ParamByName('id').AsString:=valor;
query.Open; }
LimpiaDatArt;
end;

procedure Tfrmcompras.LimpiaDatArt;
begin
//limpia los campos
edmin.Text:='';
edmax.Text:='';
edultcompra.Text:='';
btnagregar.Enabled:=false;
edcantidad.Text:='1';
edcantidad.Enabled:=false;
edcosto_unidad.Text:='';
edDescripcion.Text:='';
edcomentarios.text:='';
edCodigo.Text:='';
edcodigo.Enabled:=true;
edexist.text:='';
if (btncancelar.Caption = '&Cancelar')  then
  edcodigo.SetFocus;
end;

function Tfrmcompras.ValidaProducto(CodCve:string):integer;
var cost:double;
begin// realiza una busqueda para saber si existe el articulo...
querys('SELECT cod_cve, nombre, costo, round(costo*'+cbiva.Text+') as iva, ultima_compra, minimo, maximo, nacional, '+
       'FLOOR(existencia/piezasxunidad) as existencia, MOD(existencia,piezasxunidad) as piezas, status, moneda '+
       'from articulos WHERE cod_cve='+quotedstr(edcodigo.Text)+' AND paquete=0 AND servicio=0 ORDER BY nombre ASC',0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
   begin
   application.MessageBox('No existe ningun Articulo con esa Clave!','ATENCION',mb_IconInformation);
   edcodigo.SelectAll;
   SqlGeneral.Close;
   result:=0;
   end
else
  begin
  if sqlgeneral.fieldbyname('status').asinteger = 1 then
    begin
    // si hay datos en el campo piezas_envase entonces que se habilite el checkbox de piezas........
    edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
    if SqlGeneral.fieldbyname('moneda').asstring = rgmoneda.Text then
      edCosto_Unidad.Text:=SqlGeneral.fieldbyname('costo').AsString
    else
      begin
      cost := SqlGeneral.fieldbyname('costo').AsFloat;

      if rgmoneda.Text = 'D' then //Pesos a Dolares
        edCosto_Unidad.Text := Format('%8.2f',[cost/strtofloat(edTipoCambio.text)])
      else
        edCosto_Unidad.Text := Format('%8.2f',[cost*strtofloat(edTipoCambio.text)]);
      end;

      _gCosto :=  StrToFloat(edCosto_Unidad.Text);
    edultcompra.Text:=SqlGeneral.fieldbyname('ultima_compra').AsString;
    edmin.Text:=SqlGeneral.fieldbyname('minimo').AsString;
    edmax.Text:=SqlGeneral.fieldbyname('maximo').AsString;
    edexist.Text:=SqlGeneral.fieldbyname('existencia').AsString;
    edpieza.Text:=SqlGeneral.fieldbyname('piezas').AsString;
    result:=1;
    end
  else
    begin
    application.MessageBox('Este Articulo se encuentra INACTIVO!','ATENCION',mb_IconInformation);
    edcodigo.SelectAll;
    SqlGeneral.Close;
    result:=0;
    end;
  end;
end;

procedure Tfrmcompras.edbuscarKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmcompras.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure Tfrmcompras.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
    frmbusquedas.query:='Select idcompra,idprov as IdProveedor,TotalProductos,usuario as Usuario,fecha as Fecha,hora as Hora From compras order by FechaCompra,HoraCompra asc';
    frmbusquedas.campo_retorno:='idcompra';
    frmbusquedas.campo_busqueda:='idcompra';
    frmbusquedas.tblorigen := 'compras';
    frmbusquedas.tabla:='';
    frmbusquedas.ShowModal;
    if frmbusquedas.resultado <> '' then
      begin
      tblcompras.Active:=true;
      edbuscar.Text:=frmbusquedas.resultado;
      buscarlocate; // buscar los demas datos del registro desde la tabla
      end;
    end;   
end;

procedure Tfrmcompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmcompras.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin //if 1
  {key:=#0;       and}
  if rgmoneda.itemindex = -1 then
    begin
    application.MessageBox('No ha seleccionado la moneda', 'Atencion', MB_ICONASTERISK);
    rgmoneda.SetFocus;
    exit;
    end;
    
  if (edcodigo.text<>'') then
    begin
    if ValidaProducto(edcodigo.Text) = 1 then
      begin
      edcantidad.Enabled:=true;
      edcantidad.SetFocus;
      btnagregar.Enabled:=true;
      end;
    end
  else
    edcodigo.onbuttonclick(self);
  end;
if key = #27 then
  LimpiaDatArt;
end;

procedure Tfrmcompras.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
   edcantidad.Text:='1';
end;

procedure Tfrmcompras.edcodigoButtonClick(Sender: TObject);
begin
//mandar llamar la forma de busquedas
 { frmbusquedas.query:='SELECT cod_cve,nombre as Nombre,UltimoCosto as Costo,iva as Iva,usuario as Usuario,fecha as Fecha,hora as Hora from articulos WHERE paquete=0 AND servicio=0 ORDER BY nombre ASC';
  frmbusquedas.campo_retorno:='cod_cve';
  frmbusquedas.campo_busqueda:='cod_cve';
  frmbusquedas.tblorigen := 'articulos';
  frmbusquedas.tabla:='Articulos';
  frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
        begin}
frmbuscaart.ShowModal;
if frmbuscaart.cod_cve <> '' then
  begin
  edcodigo.Text:=frmbuscaart.cod_cve;  // frmbusquedas.resultado;
  if ValidaProducto(edcodigo.text) = 1 then
    begin
    edcantidad.Enabled:=true;
    edcantidad.SetFocus;
    btnagregar.Enabled:=true;
    edcodigo.Enabled:=false;
    end
  else
    begin
    edcodigo.Text:='';
    edcodigo.SetFocus;
    end;
  end;
end;

procedure Tfrmcompras.edbuscarordenButtonClick(Sender: TObject);
begin
//BUSCAR POR CATALOGO//
frmbusquedas.query:='Select FechaOrden,idorden,idproveedor,total,TotalProductos,estatus,fletes,otros,usuario,fecha,hora from Ordenes where (estatus <> ''SURTIDO'' and estatus <> ''CANCELADA'' and estatus <> ''FACTURANDO'')  order by FechaOrden,HoraOrden desc';
frmbusquedas.campo_retorno:='idorden';
frmbusquedas.campo_busqueda:='idorden';
frmbusquedas.tblorigen := 'Ordenes';
frmbusquedas.tabla:='';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
  begin
  edbuscarorden.Text:=frmbusquedas.resultado;
  buscarordenlocate;
  end;
end;

procedure Tfrmcompras.btnaltaClick(Sender: TObject);
  var tiempo,fecha:string;
      y:integer;
begin

if tipo =1 then
  begin
  querys('Select idorden,idproveedor,FechaOrden,total,TotalProductos,estatus from Ordenes where (estatus <> ''SURTIDO'' and estatus <> ''CANCELADA'')',0,SqlGeneral);
  if sqlgeneral.FieldByName('idorden').AsString = '' then
    begin
    application.MessageBox('No hay ordenes de compra por surtir.','Confirmación',mb_iconwarning);
    exit;
    end;
  end;

if btnalta.Caption = '&Alta' then
  begin
  monto := strtofloat(idmonto.InputBox('Ingrese el monto de la factura', 'Monto: $', '0'));
  lmonto.caption := 'Monto: $'+floattostr(monto);
  limpiar;
  //trae el maximo idorden + 1
  querys('select max(idcompra)as idcompra from compras',0,sqlgeneral);
  edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
  idcompra:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
  ban:=0;
  querys('delete from DetComprasTemp where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);
  if edTipoCambio.enabled = false then
      edTipoCambio.enabled:=true;
  pnldatos.Enabled:=true;
  estatus.Caption:='';
  Sqlrejillaalta.Close;
  Sqlrejillaaltatemp.Close;
  
  edbuscarprov.Text:='';
  edfletes.text:='';
  edotros.text:='';
  edtp.text := '0';
  tbfacturas.Clear;
  //pone la tabla de Ordenes de Compra en modo de insercion
  tblcompras.Cancel;
  tblcompras.Active:=true;
  tblcompras.insert;
  querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
  edaduana.Text:=sqlgeneral.fieldbyname('valor').AsString;
  querys('delete from DetComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  dsrejilla.DataSet:=Sqlrejillaaltatemp;
  //RejillaAltaTemp;
  dimportacion.Date:=now;
  dpago.Date:=now;
  edFechaOrd.date:=now;
  rgmoneda.itemindex := 0;
  moneda := 'D';
  rgmoneda.onexit(self);
  edFechaOrd.Enabled := true;
  edhoraord.text:= FormatDateTime('HH:mm:ss',Time);
  edbuscar.Enabled:=false;


  if tipo = 1 then
    begin
    edbuscarorden.Enabled:=true;
    edbuscarorden.Text:='';
    edbuscarorden.SetFocus;
    //btnalta.Enabled:=false;
    gbarticulo.Enabled:=false;
    end
  else
    begin
    edbuscarprov.Enabled:=true;
    edbuscarprov.SetFocus;
    dsrejilla.DataSet:=Sqlrejillaaltatemp;
    RejillaAltaTemp;
    gbarticulo.enabled:=true;
    end;
  end
else
  begin
  if sqlrejillaaltatemp.RecordCount > 0 then
    begin
    if (rgmoneda.text = 'P') then
      if (strtofloat(Format('%8.4f',[monto])) <> strtofloat(Format('%8.4f',[strtofloat(edtotalmn.text)]))) then
        begin
        application.MessageBox('La cantidad no cuadra con la ingresada al principio de la compra', 'Atencion', MB_ICONINFORMATION);
        exit;
        end;
    if (rgmoneda.text = 'D') then
      if (strtofloat(Format('%8.2f',[monto])) <> strtofloat(Format('%8.2f',[strtofloat(edtotal.text)]))) then
        begin
        application.MessageBox(pchar('La cantidad no cuadra con la ingresada al principio de la compra. ' ), 'Atencion', MB_ICONINFORMATION);
        exit;
        end;

    //if (rgmoneda.text = 'D') then
      if querys('select nacional from proveedores where idprov='+edbuscarprov.text+' and nacional <> "Nac"', 0, sqlgeneral) > 0 then
        if (edpedimento.Text = '    -       ') then
          begin
          application.MessageBox(pchar('Falta el Pedimento' ), 'Atencion', MB_ICONINFORMATION);
          exit;
          end;

    if tbfacturas.Items.Count = 0 then
      begin
      application.MessageBox(pchar('No ha ingresado ninguna factura' ), 'Atencion', MB_ICONINFORMATION);
      exit;
      end;

      if (edbuscarprov.Text <> '0') then
        begin
        if edpedimento.Text <> '' then
          begin
          if application.MessageBox('Estan correctos los datos?,no se podran modificar despues!','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            begin
            screen.cursor := crhourglass;
            tp:=strtoint(edtp.text); //total productos
            idprov:=edbuscarprov.Text;
            pnldatos.Enabled:=false;
            btnalta.Caption:='&Alta';
            btnalta.Hint:='Dar de Alta una Compra';
            btncancelar.Caption:='&Cerrar';
            btncancelar.Hint:='Cerrar esta Ventana';
            btnalta.ImageIndex:=5;
            btnborrar.Enabled:=true;
            btnmodificar.Enabled:=true;

            tblcomprasFechaCompra.AsDateTime:=edfechaord.date;
            tblcomprasHoraCompra.AsDateTime:=HoraServidor();
            tblcomprasusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
            tblcomprasfecha.AsString:=datetostr(date);
            tblcomprashora.AsString:=timetostr(time);
            tblcomprasUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
            tblcomprasFechaUltMod.AsString:=datetostr(date);
            tblcomprasHoraUltMod.AsString:=timetostr(time);
            querys('select max(idcompra)as idcompra from compras',0,sqlgeneral);
            edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
            idcompra:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
            tblcomprasidcompra.AsString:=idcompra;
            tblcomprasidprov.AsString:=edbuscarprov.Text;
            tblcomprasfletes.AsString:=edfletes.Text;
            tblcomprasotros.AsString:=edotros.Text;
            tblcomprasTipoCambio.AsString:=edTipoCambio.Text;
            tblcomprasmoneda.AsString:=rgmoneda.Text;
            tblcompraspiva.Asstring := cbiva.text;
            if(edpedimento.Enabled) then
                tblcomprasNumPedimento.AsString := edpedimento.Text;
            tblcomprasNumFactura.AsString := '';
            if(tbfacturas.Items.Count > 0) then
              for y:=0 to tbfacturas.Items.Count -1 do
                tblcomprasNumFactura.AsString := tblcomprasNumFactura.AsString + tbfacturas.ItemCaption(y) + #13;


            tblcompras.Post;
            frmprincipal.ucprincipal.Log('Dio de Alta la Compra:'+edbuscar.text,1);
            querys('UPDATE DetComprasTemp SET idcompra= '+quotedstr(edbuscar.Text)+' WHERE idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
            querys('insert into DetCompras(idorden,idcompra,cod_cve,cant_ord,costo,comentarios) select idorden,idcompra,cod_cve,cant_ord,costo,comentarios from DetComprasTemp where idcompra = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
             //borrar temporales......
            querys('delete from DetComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq)+' and idcompra='+quotedstr(edbuscar.Text),1,SqlGeneral);
            actualizar;
            LimpiaDatArt;
            dsrejilla.DataSet:=Sqlrejillaalta;
            RejillaAlta;
            edbuscar.Enabled:=true;
            edpedimento.Enabled:=true;
            //abonar a PagosProv
            tiempo:=timetostr(HoraServidor());
            fecha:=datetostr(FechaServidor());
            querys('SELECT idmovi FROM TipoMov where nombre=''COMPRA'' ',0,sqlgeneral2);
            querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,cargo,abono,restante,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
                   'SELECT idprov,idcompra,'+quotedstr(ednfactura.Text)+',"'+datetostr(date)+'",if(anticipo <> " " ,anticipo,0),'+
                   '(subtotal + iva),if(anticipo <>" ",(subtotal + iva)-anticipo,(subtotal + iva)),"CREDITO", FechaPago, TipoCambio,'+
                   quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(fecha)+','+quotedstr(tiempo)+' '+
                     'FROM compras where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);
            application.MessageBox('Compra registrada','Información',mb_iconInformation);
            edbuscarorden.Enabled:=false;
            edbuscarprov.Enabled:=false;
            edFechaOrd.Enabled := false;
            lmonto.caption := 'Monto: $0.00';
            end;
          end
        else
          begin
          application.MessageBox('Falto el campo de pedimento!','Confirmación',mb_iconwarning);
          edpedimento.SetFocus;
          end;
        end
      else
        begin
        application.MessageBox('Escoge el proveedor!','Confirmación',mb_iconwarning);
        edbuscarprov.SetFocus;
        end;//edbuscarprov

    end else begin
       application.MessageBox('Mínimo necesita capturar un articulo para guardar','Atención',mb_ok);
       edcodigo.SetFocus;
    end;
  end;///btnalta
screen.cursor := crdefault;
end;

procedure Tfrmcompras.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin

    if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then
       begin
         Rejilla.enabled:=true;
         if btnalta.Caption='&Guardar' then
            begin
              btnalta.Caption:='&Alta';
              btnalta.Hint:='Dar de Alta una Compra';
              btnalta.ImageIndex:=5;

              RejillaAltaTemp;

              tblcompras.Cancel;
              rgmoneda.ItemIndex:=-1;
              querys('UPDATE Ordenes,DetComprasTemp  SET Ordenes.estatus=''PENDIENTE'' WHERE DetComprasTemp.idorden=Ordenes.idorden and DetComprasTemp.idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
            end;//guardar

         if btnmodificar.Caption='&Guardar' then
            begin
             //borra temporales y graba los datos anteriores en la tabla original
             querys('delete from DetComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
             btnmodificar.Caption:='&Editar';
             btnmodificar.hint:='Editar los datos de la Compra Actual';
             btnmodificar.ImageIndex:=2;

             RejillaAlta;
             tblcompras.Cancel;
            end;//guardar

             querys('delete from DetComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq)+' and idcompra='+quotedstr(edbuscar.Text),1,SqlGeneral);

             tblcompras.Active:=false;
             edbuscarorden.Enabled:=true;
             {edbuscarorden.Text:='';
             edbuscarprov.Text:='';
             edprov.text:='';
             edfletes.Text:='';
             edotros.Text:='';
             edTipoCambio.Text:='';    }
             limpiar;
             btncancelar.Hint:='Cerrar esta Pantalla';
             btncancelar.Caption:='&Cerrar';
             pnldatos.Enabled:=false;
             gbarticulo.Enabled:=false;
             rejilla.Enabled:=false;

             btnalta.Enabled:=true;
             btnborrar.Enabled:=TRUE;
             btnmodificar.Enabled:=TRUE;
             LimpiaDatArt;
             edbuscarorden.Enabled:=false;
             edbuscarprov.Enabled:=false;
             edFechaOrd.Enabled := false;
             edbuscar.Enabled:=true;
             edbuscar.Text:='';
             edbuscar.SetFocus;
             dsrejilla.DataSet:=Sqlrejillaalta;
             if  edTipoCambio.enabled = false then
                 edTipoCambio.enabled:=true;
       end;//pregunta?
    lmonto.caption := 'Monto: $0.00';
end  else //btncancelar
 close;

end;

procedure Tfrmcompras.edbuscarprovKeyPress(Sender: TObject; var Key: Char);
begin

    if (key=#13)then
        if edbuscarprov.Text <> '' then begin
          idprov:=edbuscarprov.Text;
          buscarprovlocate
        end else
          edbuscarprov.OnButtonClick(self);
    //key:=#0;

    if key = #27 then
        begin
          key:=#0;
          edbuscarprov.Text:='';
        end;


end;

procedure Tfrmcompras.HabilitarPedimento;
begin
             if(SqlGeneral.fieldbyname('nacional').AsString = 'Nac') then
                   begin
                     // dvigencia.SetFocus;
                     edpedimento.Enabled := false;
                     edaduana.Enabled := false;
                     dimportacion.Enabled := false;
                     if(pnldatos.Enabled) then
                      ednfactura.SetFocus;
                     ediva.Enabled := false;
                     rgmoneda.Text := 'P';
                   end else
                     begin
                     ediva.Enabled := true;
                     edpedimento.Enabled := true;
                     edaduana.Enabled := true;
                     dimportacion.Enabled := true;
                     if(pnldatos.Enabled) then
                       edpedimento.SetFocus;
                     rgmoneda.Text := 'D';
                     edtipocambio.Enabled := true;
                   end;
end;

procedure Tfrmcompras.edbuscarprovButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
    frmbusquedas.query:='select idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as Proveedor,usuario,fecha,hora as nombre from proveedores order by nombre asc';
    frmbusquedas.campo_retorno:='idprov';
    frmbusquedas.campo_busqueda:='idprov';
    frmbusquedas.tblorigen := 'proveedores';
    frmbusquedas.tabla:='';
    frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
             ///////si hay un dato en la busqueda/////////
             edbuscarprov.Text:=frmbusquedas.resultado;
             idprov:=frmbusquedas.resultado;
             //se realiza la busqueda para los datos necesarios de la orden con el idorden
             querys('select  idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as nombre,estatus,nacional from proveedores where idprov='+quotedstr(edbuscarprov.Text),0,SqlGeneral);
             if SqlGeneral.fieldbyname('estatus').AsBoolean = true then begin
                  edprov.text:=SqlGeneral.fieldbyname('nombre').AsString;
                  HabilitarPedimento;

             end else begin
                  application.MessageBox('Ese proveedor no esta Activo','Confirmación',mb_iconwarning);
                  edbuscarprov.text:='';
             end;
            end;//frmbusquedas

end;

procedure Tfrmcompras.edbuscarordenKeyPress(Sender: TObject;
  var Key: Char);

  begin
    if (key=#13) then
         if edbuscarorden.Text <> '' then
            buscarordenlocate
         else
            edbuscarorden.OnButtonClick(self);

    if key = #27 then
        begin
          key:=#0;
          edbuscarorden.Text:='';
        end;
end;

procedure Tfrmcompras.edcantidadKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
    end;

if key = #27 then //SI PRESIONA LA TECLA ESC.....
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;
end;

procedure Tfrmcompras.btnagregarClick(Sender: TObject);
begin
    InsertaArticulo(Sqlrejillaaltatemp,'DetComprasTemp','idcompra',edbuscar.Text);
    LimpiaDatArt;
end;

procedure Tfrmcompras.edpedimentoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcompras.edTipoCambioExit(Sender: TObject);
begin
if edTipoCambio.Text = '' then
   edTipoCambio.SetFocus;
end;

procedure Tfrmcompras.edfleteKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcompras.RejillaDBTableView1DblClick(Sender: TObject);
begin
if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then
   ModificaArticulo(SqlRejillaAltatemp,'DetComprasTemp','idcompra',edbuscar.Text);
end;

procedure Tfrmcompras.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if btnalta.Caption='&Guardar' then begin
// si se aplasto al boton de + o el de - hacer la operacion correspondiente
if (rejilla.Enabled) and (key='+') then
    begin
      //incrementa en uno la cantidad de unidades que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
       begin
          querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
          //querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+')/piezasxunidad) + existencia, 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
           if sqlgeneral.FieldByName('cod_cve').AsString = '' then
              application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
                querys('update DetComprasTemp set cant_ord=cant_ord+1 where (idcompra='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                operacion;

       end else begin

          if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and  (btnalta.Enabled=false) then
             begin
             querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
              if sqlgeneral.FieldByName('cod_cve').AsString = '' then
                 application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
                    querys('update DetComprasTemp set cant_ord=cant_ord+1 where (idcompra='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                    operacion;

             end;
       end;
end;

if (rejilla.Enabled) and (key='-') then
    begin
      //decrementa en uno la cantidad de unidades que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
        begin
                querys('update DetComprasTemp set cant_ord=cant_ord-1 where (idcompra='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                operacion;

        end else begin

          if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled=false) then
             begin
                querys('update DetComprasTemp set cant_ord=cant_ord-1 where (idcompra='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                operacion;
             end;
        end;                                                                                                                               //  sleep(1000);
                //borrar los registros que no tengan valores en cantidad y piezas.........
                querys('delete from DetComprasTemp where cant_ord=0 and idmaq='+quotedstr(frmprincipal.idmaq)+' and idcompra='+quotedstr(edbuscar.Text),1,sqlgeneral);
end;

//cerrar y abrir la consulta,
      SqlRejillaAltatemp.Close;
      SqlRejillaAltatemp.Open;
      if SqlRejillaAltatemp.RecordCount = 0 then begin
            rejilla.Enabled:=false;
      end;
end;//if btnalta......
end;

procedure Tfrmcompras.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if btnalta.Caption='&Guardar' then begin
if (key=46) and (rejilla.Enabled) then
  begin
            //elimina el registro del articulo
            querys('select idorden from DetComprasTemp where idorden='+quotedstr(idord),0,sqlgeneral);
            if sqlgeneral.RecordCount = 1 then
            querys('UPDATE Ordenes,DetComprasTemp  SET Ordenes.estatus=''PENDIENTE'' WHERE DetComprasTemp.idorden=Ordenes.idorden and DetComprasTemp.idorden='+quotedstr(idord)+' and DetComprasTemp.idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
            querys('delete from DetComprasTemp where idcompra='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(RejillaDBTableView1.DataController.DataSet.fieldbyname('cod_cve').AsString)+' and idorden='+quotedstr(idord),1,SqlGeneral);
            operacion;

     //refresca la rejilla de datos
     sqlrejillaaltatemp.Close;
     sqlrejillaaltatemp.Open;
     if SqlRejillaAltatemp.RecordCount = 0 then begin
            rejilla.Enabled:=false;
     end;

  end;
end;
if ((key=40) or (key=38) or (key=33) or (key=34)) then  //si fue un pg dowm ó flechas
mostrar_registros;

end;

procedure Tfrmcompras.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
tiempo,fecha:string;
begin
if  (tblcompras.fieldbyname('estatus').AsString = 'CANCELADA')  then
     application.MessageBox('Esta Compra ya esta cancelada!','Confirmación',mb_iconinformation)
else begin

//verifica que no existe una requisicion en alguna de las ordenes en las que estan en la compra
querys('SELECT * FROM DetCompras  INNER JOIN requisiciones  ON  (requisiciones.idorden= DetCompras.idorden) WHERE DetCompras.idcompra ='+quotedstr(edbuscar.Text)+'  LIMIT 1 ',0,sqlgeneral);
if sqlgeneral.FieldByName('cod_cve').AsString = '' then begin

//valida que no se este usando esta compra en la tabla de DevSobreCompras
querys('select iddev as ID,FechaDev,HoraDev,usuario as Usuario,fecha as Fecha,hora as Hora from DevCompras where idcompra='+quotedstr(edbuscar.Text),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then begin
   application.MessageBox('Esta compra esta siendo utilizada por una devolución sobre compra, debe eliminar primero la relación','Operación No Realizada',mb_iconInformation);
   if sqlgeneral.RecordCount > 0 then
        begin
        hija:=tfrmrelacionborrar.Create(self);
        hija.inicializa(sqlgeneral);
        hija.Show;
        end;
end else
 begin

if application.MessageBox('Deseas Cancelar esta Compra del sistema?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin

      //ACTUALIZAR COSTO PROMEDIO
      querys('Select costo, cod_cve, cant_ord as cant from DetCompras where idcompra='+idcompra, 0, sqlgeneral);
      sqlgeneral.First;
      while not sqlgeneral.Eof = true do
        begin
        CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat,'S', sqlgeneral.fieldbyname('cod_cve').AsString, '-', sqlgeneral.fieldbyname('cant').AsInteger);
        sqlgeneral.Next;
        end;

      {querys('UPDATE articulos,DetCompras SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) - (DetCompras.costo *(DetCompras.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) -'+
             '(DetCompras.cant_ord/articulos.piezasxunidad) )  ),3) WHERE articulos.cod_cve=DetCompras.cod_cve AND DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);}

       tiempo:=timetostr(HoraServidor());
       fecha:=datetostr(FechaServidor());
       querys('SELECT idmovi FROM TipoMov where nombre=''CAN/COMPRAS'' ',0,sqlgeneral2);
       querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,cargo,abono,restante,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
              'SELECT idprov,idcompra,'+quotedstr(ednfactura.Text)+',"'+datetostr(date)+'",(subtotal + iva),if(anticipo <> '' '' ,anticipo,0),if(anticipo <>'' '',(subtotal + iva)-anticipo,(subtotal + iva)),''CREDITO/CAN'',FechaPago,TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(fecha)+','+quotedstr(tiempo)+'  '+
              'FROM compras where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);

     //minimizar las existencias de inventarios y ordenados
     querys('update articulos,DetCompras set articulos.existencia= if ( (articulos.existencia - (DetCompras.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetCompras.cant_ord*articulos.piezasxunidad))), articulos.ordenados='+
            'if ((articulos.ordenados -DetCompras.cant_ord <=0),0,articulos.ordenados -(DetCompras.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetCompras.cod_cve and DetCompras.idcompra='+quotedstr(edbuscar.Text),1,sqlgeneral);

     //actualizar cant_sur y cant_ord de ordenes
     querys('UPDATE DetOrden,compras,DetCompras SET  DetOrden.cant_sur=if ((DetCompras.cant_ord+DetOrden.cant_sur)<=DetCompras.cant_ord,0,DetOrden.cant_sur - DetCompras.cant_ord), DetOrden.cant_ord=if ((DetCompras.cant_ord+DetOrden.cant_sur)<=DetCompras.cant_ord,'+
            '(DetCompras.cant_ord+DetOrden.cant_sur),DetCompras.cant_ord + DetOrden.cant_ord) WHERE DetOrden.idorden=DetCompras.idorden AND DetOrden.cod_cve=DetCompras.cod_cve AND DetCompras.idcompra=compras.idcompra AND DetCompras.idcompra='+quotedstr(edbuscar.Text),1,sqlgeneral);

       querys('UPDATE Ordenes,DetCompras,DetOrden SET Ordenes.estatus=''SURTIDO'' WHERE Ordenes.idorden=DetCompras.idorden AND DetOrden.idorden=Ordenes.idorden and DetOrden.cant_ord = 0 and  DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);
       querys('UPDATE Ordenes,DetCompras,DetOrden SET Ordenes.estatus=''INCOMPLETO'' WHERE Ordenes.idorden=DetCompras.idorden AND DetOrden.idorden=Ordenes.idorden and DetOrden.cant_ord > 0 and  DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);

     //insertar en la tabla de cardex concepto de devolucion...
     querys('SELECT idmovi FROM TipoMov where nombre=''CAN/COMPRAS'' ',0,sqlgeneral2);
     querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
            'SELECT cod_cve,idcompra,cant_ord,costo,''S'','+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+',"'+
            datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'","'+frmprincipal.ucprincipal.CurrentUser.loginname+
            '", "Cancelacion de la Compra" FROM  DetCompras WHERE idcompra='+quotedstr(edbuscar.Text),1,sqlgeneral);
     querys('delete from DetComprasTemp where idcompra='+quotedstr(edbuscar.Text),1,SqlGeneral); //idmaq='+quotedstr(frmprincipal.idmaq)+' and
     querys('delete from DetComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);

     tblcompras.Edit;
     tblcomprasestatus.AsString:='CANCELADA';
     tblcomprasUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
     tblcomprasFechaUltMod.AsString:=datetostr(date);
     tblcomprasHoraUltMod.AsString:=timetostr(time);
     tblcompras.Post;

     tblcompras.Active:=FALSE;
     application.MessageBox('Cancelación realizada?','Confirmación',mb_iconinformation);
     frmprincipal.ucprincipal.Log('Dio Cancelar la Compra:'+edbuscar.text,3);
     querys('select idcompra from compras',0,sqlgeneral);
     edbuscar.text:='';
     rgmoneda.ItemIndex:=-1;
     edbuscar.enabled:=true;
     LimpiaDatArt;
     edbuscar.setfocus;
end;
end;

end else
     application.MessageBox('Esta compra fue hecha con requisiciones, por tal no puede ser cancelada?','Confirmación',mb_iconwarning);

end;
end;

procedure Tfrmcompras.btnmodificarClick(Sender: TObject);
var y:integer;
begin
if  (tblcompras.fieldbyname('estatus').AsString = 'CANCELADA')  then
     application.MessageBox('Esta Compra esta cancelada!','Confirmación',mb_iconwarning)
else begin
//verifica que no existe una requisicion en alguna de las ordenes en las que estan en la compra
querys('SELECT * FROM DetCompras INNER JOIN requisiciones  ON  (requisiciones.idorden= DetCompras.idorden) WHERE DetCompras.idcompra ='+quotedstr(edbuscar.Text)+'  LIMIT 1 ',0,sqlgeneral);
if sqlgeneral.FieldByName('cod_cve').AsString = '' then begin

if btnmodificar.Caption = '&Editar' then
   begin
     querys('delete from DetComprasTemp where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);
     pnldatos.Enabled:=true;
     gbarticulo.Enabled:=true;
     idprov:=edbuscarprov.Text;
     frmprincipal.ucprincipal.Log('Dio click en el botón editar Compras',0);
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guardar los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     edbuscar.Enabled:=false;
     tblcompras.Edit;
     idcompra:=tblcomprasidcompra.AsString;
     if tipo =1 then begin
     edbuscar.Enabled:=false;
     edbuscarorden.Enabled:=false;
     end else begin
     buscarprovlocate;
     end;
     rejilla.Enabled:=false;
     //actualizar la existencia restando contra lo comprado
     querys('insert into DetComprasTemp(idorden,idcompra,cod_cve,cant_ord,costo,comentarios,idmaq) select idorden,idcompra,cod_cve,cant_ord,costo,comentarios,'+quotedstr(frmprincipal.idmaq)+' from DetCompras where idcompra = '+quotedstr(edbuscar.Text),1,SqlGeneral);
     dsrejilla.DataSet:=Sqlrejillaaltatemp;

     RejillaAltaTemp;

     edbuscarprov.Enabled:=true;
     edFechaOrd.Enabled := true;
//     dvigencia.Enabled := false;
//     dentrega.Enabled := false;
     dpago.Enabled := false;
     rgmoneda.Enabled := true;
     edTipoCambio.Enabled := true;
     //edpedimento.Enabled := false;
     //edaduana.Enabled := false;
     if(edpedimento.enabled) then
         edpedimento.SetFocus
     else
         ednfactura.SetFocus;
     //dimportacion.Enabled := false;
   end
else
  begin

     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos de la Compra Actual';
     btnmodificar.ImageIndex:=2;
     frmprincipal.ucprincipal.Log('Edito la compra:'+tblcomprasidcompra.AsString,2);
     if tipo =1 then
       begin
       edbuscar.Enabled:=true;
       edbuscarorden.Enabled:=true;
       end;
     edbuscarprov.Enabled:=true;
     btnmodificar.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     pnldatos.Enabled:=false;
     gbarticulo.Enabled:=false;
     rejilla.Enabled:=false;
     tblcomprasfletes.AsString:=edfletes.Text;
     tblcomprasotros.AsString:=edotros.Text;
     tblcomprasmoneda.AsString:=rgmoneda.Text;
     tblcompraspiva.Asstring := cbiva.text;
     tblcomprasTipoCambio.AsString:=edTipoCambio.Text;
     tblcomprasusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
//     tblcomprasfecha.AsString:=datetostr(date);
     tblcomprashora.AsString:=timetostr(time);
     tblcomprasidprov.AsString:=edbuscarprov.Text;
     //////CUENTAS X PAGAR
      querys('SELECT idmovi FROM TipoMov where nombre=''CAN/COMPRAS'' ',0,sqlgeneral2);
      querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,cargo,abono,restante,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
             'SELECT idprov,idcompra,'+quotedstr(ednfactura.Text)+',"'+datetostr(date)+'",(subtotal + iva),if(anticipo <> '' '' ,anticipo,0),if(anticipo <>'' '',(subtotal + iva)-anticipo,(subtotal + iva)),''CREDITO'',FechaPago,TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(now))+','+quotedstr(timetostr(time))+' '+
             'FROM compras where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);
     if(edpedimento.Enabled) then
        tblcomprasNumPedimento.AsString := edpedimento.Text;
      tblcomprasNumFactura.AsString := '';
       if(tbfacturas.Items.Count > 0) then
          for y:=0 to tbfacturas.Items.Count -1 do
              tblcomprasNumFactura.AsString := tblcomprasNumFactura.AsString + tbfacturas.ItemCaption(y)+#13;

     tblcompras.Post;
     lmonto.caption := 'Monto: $0.00';
querys('update articulos,DetCompras set articulos.existencia= if ( (articulos.existencia - (DetCompras.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetCompras.cant_ord*articulos.piezasxunidad))), articulos.ordenados='+
       'if ((articulos.ordenados -DetCompras.cant_ord <=0),0,articulos.ordenados -(DetCompras.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetCompras.cod_cve and DetCompras.idcompra='+quotedstr(edbuscar.Text),1,sqlgeneral);

CalcularCostoAP;

//////////DAR SALIDA A ARTICULOS
     querys('SELECT idmovi FROM TipoMov where nombre=''COMPRA'' ',0,sqlgeneral2);
//     querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario) SELECT cod_cve,idcompra,cant_ord,costo,''S'','+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' FROM  DetCompras WHERE idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);
     querys('DELETE FROM CardexArt WHERE iddoc='+quotedstr(edbuscar.text)+' AND idmovi='+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString),1,sqlgeneral);
///////////////actualizar la orden con la cantidad surtida.. ANTES DE ACTUALIZAR...
       querys('UPDATE DetOrden,DetCompras SET  DetOrden.cant_sur=if ((DetOrden.cant_ord+DetOrden.cant_sur)<=DetCompras.cant_ord,0,DetOrden.cant_sur - DetCompras.cant_ord), DetOrden.cant_ord=if ((DetOrden.cant_ord+DetOrden.cant_sur)<=DetCompras.cant_ord,'+
             '(DetOrden.cant_ord+DetOrden.cant_sur),DetCompras.cant_ord + DetOrden.cant_ord) WHERE DetOrden.idorden=DetOrden.idorden AND DetOrden.cod_cve=DetCompras.cod_cve AND DetCompras.idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);

       querys('delete from DetCompras where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);

       querys('insert into DetCompras(idorden,idcompra,cod_cve,cant_ord,costo,comentarios) select idorden,idcompra,cod_cve,cant_ord,costo,comentarios from DetComprasTemp where idcompra = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);

//////////////CUENTAS X PAGAR
      querys('SELECT idmovi FROM TipoMov where nombre=''COMPRA'' ',0,sqlgeneral2);
      querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,cargo,abono,restante,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
             'SELECT idprov,idcompra,'+quotedstr(ednfactura.Text)+',"'+datetostr(date)+'",if(anticipo <> '' '' ,anticipo,0),(subtotal + iva),if(anticipo <>'' '',(subtotal + iva)-anticipo,(subtotal + iva)),''CREDITO'',FechaPago,TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(now))+','+quotedstr(timetostr(time))+' '+
             'FROM compras where idcompra='+quotedstr(edbuscar.text),1,sqlgeneral);



  CalcularCostoAP;
     if tipo <> 2 then
      //ACTUALIZAR EXISTENCIAS
     querys('UPDATE articulos,DetCompras SET articulos.existencia=(articulos.existencia + (DetCompras.cant_ord*articulos.piezasxunidad)) WHERE articulos.cod_cve=DetCompras.cod_cve AND '+
            'DetCompras.idcompra='+quotedstr(edbuscar.Text),1,sqlgeneral);

     
     /////////actualizar la orden con la cantidad surtida.....
     querys('UPDATE DetOrden,DetCompras SET DetOrden.cant_sur=if (DetOrden.cant_ord<=DetCompras.cant_ord,DetOrden.cant_ord+DetOrden.cant_sur,(DetCompras.cant_ord)+DetOrden.cant_sur), DetOrden.cant_ord=if '+
            '(DetOrden.cant_ord<=DetCompras.cant_ord,0, (DetOrden.cant_ord-DetCompras.cant_ord)) WHERE DetOrden.idorden=DetCompras.idorden AND DetOrden.cod_cve=DetCompras.cod_cve AND DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);

     //DAR ENTRADA DE ARTICULOS
     querys('SELECT idmovi FROM TipoMov where nombre=''COMPRA'' ',0,sqlgeneral2);
     querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
            'SELECT cod_cve,idcompra,cant_ord,costo, "E", "'+sqlgeneral2.fieldbyname('idmovi').AsString+'","'+
            datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
            ', "compra de Mercancia : '+idcompra+'" FROM  DetCompras WHERE idcompra='+quotedstr(idcompra),1,sqlgeneral);
     //borrar temporales......
     querys('delete from DetComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq)+' and idcompra='+quotedstr(edbuscar.Text),1,SqlGeneral);

     // actulizamos el campo totalproductos en la orden

       querys('UPDATE Ordenes,DetCompras,DetOrden SET Ordenes.estatus=''SURTIDO'' WHERE Ordenes.idorden=DetCompras.idorden AND DetOrden.idorden=Ordenes.idorden and DetOrden.cant_ord = 0 and  DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);
       querys('UPDATE Ordenes,DetCompras,DetOrden SET Ordenes.estatus=''INCOMPLETO'' WHERE Ordenes.idorden=DetCompras.idorden AND DetOrden.idorden=Ordenes.idorden and DetOrden.cant_ord > 0 and  DetCompras.idcompra='+quotedstr(idcompra),1,sqlgeneral);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     application.MessageBox('Compra Modificada!','Información',mb_iconinformation);
     dsrejilla.DataSet:=Sqlrejillaalta;

     RejillaAlta;

     edbuscarprov.Enabled:=false;
     edFechaOrd.Enabled := false;
     edbuscar.enabled:=true;
     LimpiaDatArt;
     //limpiar;
     edbuscar.setfocus;
     end;


end else
     application.MessageBox('Esta compra fue hecha con requisiciones, por tal no puede ser cancelada?','Confirmación',mb_iconwarning);
end;
end;

procedure Tfrmcompras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then begin
     showmessage('No has guardado los datos, si deseas salir oprime el boton cancelar');
     canclose:=false;
  end;//botones

end;

procedure Tfrmcompras.spbarticulosClick(Sender: TObject);
begin
frmprincipal.muestra_mdichild(535,759,tfrmarticulos,'Acceso la Pantalla de tipos de Articulos');
end;

procedure Tfrmcompras.dimportacionEnter(Sender: TObject);
begin
dimportacion.Date:=NOW;
end;

procedure Tfrmcompras.rgmonedaExit(Sender: TObject);
begin
if edTipoCambio.text = '' then
  begin
  querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
  edTipoCambio.text:=Format('%2.4f',[sqlgeneral.Fields.Fields[0].asfloat]);
  end;

if rgmoneda.Text = 'D' then
  begin
  edtipocambio.Enabled:=true;
  end
else
  begin
  edtipocambio.Enabled:=false;
  end;
ActualizaXMoneda;
moneda := rgmoneda.text;
end;

procedure Tfrmcompras.rgmonedaChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
if newindex = 0 then
   edTipoCambio.Enabled:=true
else
   edTipoCambio.Enabled:=false;
end;

procedure Tfrmcompras.rgmonedaNotInList(Sender: TObject);
begin
rgmoneda.itemindex:=0;
rgmoneda.OnExit(self);
end;

procedure Tfrmcompras.rgmonedaEnter(Sender: TObject);
begin
edtipocambio.enabled:=true;
end;

procedure Tfrmcompras.edTipoCambioKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edTipoCambio.Text,key);
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcompras.edfletesKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edfletes.Text,key);
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;
               
procedure Tfrmcompras.RejillaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
if btnalta.Caption='&Guardar' then 
mostrar_registros;
end;

procedure Tfrmcompras.edbuscarChange(Sender: TObject);
begin

    if edbuscar.Text = '' then begin
       tblcompras.Active:=false;
       Sqlrejillaalta.close;
       {estatus.caption:='';
       if tipo=1 then
       edbuscarorden.Text:='';
       edbuscarprov.Text:='';
       edprov.Text:='';
       edfletes.Text:='';
       edotros.Text:='';
       edTipoCambio.Text:='';
       rgmoneda.ItemIndex:=-1;
       tbfacturas.clear;
       ednfactura.text := '';}
       limpiar;
       btnmodificar.enabled:=false;
       btnborrar.enabled:=false;
       btnimprimir.enabled:=false;

    end;

end;

procedure Tfrmcompras.edbuscarprovChange(Sender: TObject);
begin
if edbuscarprov.text = '' then
edprov.text:='';
end;

procedure Tfrmcompras.edfletesExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmcompras.EdCosto_unidadKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edCosto_unidad.Text,key);
if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
    end;
end;

procedure Tfrmcompras.dpagoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     rgmoneda.setfocus;
  end;
end;

procedure Tfrmcompras.dpagoEnter(Sender: TObject);
begin
dpago.Date:=NOW;
end;

procedure Tfrmcompras.edaduanaEnter(Sender: TObject);
begin
querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
edaduana.Text:=sqlgeneral.fieldbyname('valor').AsString;
end;

procedure Tfrmcompras.edotrosKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edotros.Text,key);
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcompras.edotrosExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmcompras.eddescuentoExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmcompras.edcodigoChange(Sender: TObject);
begin
if edcodigo.text = '' then
    LimpiaDatArt;
end;

procedure Tfrmcompras.btnimprimirClick(Sender: TObject);
begin
querys('Select DetCompras.idcompra as id, DetCompras.cod_cve, DetCompras.cant_ord, DetCompras.costo, '+
       'articulos.nombre, (DetCompras.cant_ord * DetCompras.costo)  as importe '+
       'from DetCompras left join articulos on(DetCompras.cod_cve = articulos.cod_cve) '+
       'where idcompra = '+quotedstr(edbuscar.text), 0, dmreportes.sqlgeneral);
querys('Select idcompra as id, NumPedimento, NumFactura, TotalProductos, TipoCambio, FechaCompra as fecha, DetallesCompra, '+
       'c.iva, totalmn, "REPORTE DE COMPRAS" as titulo, if(p.rsocial is NULL or p.rsocial="", if(p.apaterno is '+
       'NULL or p.apaterno="", p.nombre, if(p.amaterno is NULL or p.amaterno="", concat(p.nombre, " ", '+
       'p.apaterno), concat(p.nombre, " ", p.apaterno, " ", p.amaterno))), p.rsocial) as prov from compras as c '+
       'left join proveedores as p on(p.idprov = c.idprov) where idcompra ='+quotedstr(edbuscar.text), 0, dmreportes.sqlgeneral2);
OperacionReporte('ComprasImpresion', 'ComprasImpresion', 'IMP', 1);
end;

procedure Tfrmcompras.RejillaAlta;
begin
querys('SELECT d.idorden, d.idcompra, d.cod_cve, d.cant_ord, d.comentarios, d.costo, articulos.nombre, '+
       'round(d.cant_ord *d.costo*'+cbiva.Text+',2) as iva, articulos.ultima_compra, articulos.minimo, articulos.maximo, '+
       '(articulos.existencia/articulos.piezasxunidad) as existencia, (d.cant_ord * d.costo) as subtotal, moneda, '+
       'ROUND(d.cant_ord * d.costo*'+floattostr(1+strtofloat(cbiva.Text))+',2) as TOTAL FROM DetCompras as d inner join articulos on '+
       'd.cod_cve = articulos.cod_cve WHERE d.idcompra='+idcompra+' ORDER BY  d.id ASC', 0, SqlRejillaAlta);
end;

procedure Tfrmcompras.RejillaAltaTemp;
begin
querys('SELECT d.idorden, d.idcompra, d.cod_cve, d.cant_ord, d.comentarios, d.costo, articulos.nombre, '+
       'round(d.cant_ord *d.costo*'+cbiva.Text+',2) as iva, articulos.ultima_compra, articulos.minimo, articulos.maximo, '+
       '(articulos.existencia/articulos.piezasxunidad) as existencia, (d.cant_ord * d.costo) as subtotal, moneda,'+
       'ROUND(d.cant_ord * d.costo*'+floattostr(1+strtofloat(cbiva.Text))+',2) as TOTAL FROM DetComprasTemp as d inner join articulos '+
       'on d.cod_cve = articulos.cod_cve WHERE d.idcompra='+idcompra+' ORDER BY  d.id ASC', 0, sqlrejillaAltaTemp);
end;

procedure Tfrmcompras.FormShow(Sender: TObject);
begin
CargaCombo2('SELECT valor, concepto from configuraciones where concepto in ("IVA", "IVA2") order by concepto','valor', 'concepto',cbiva);
cbiva.itemindex := 0;
end;

procedure Tfrmcompras.ActualizaXMoneda;
var tabla :string;
begin
if moneda = rgmoneda.text then
  exit;
if dsrejilla.DataSet = sqlrejillaalta then
  tabla := 'DetCompras'
else
  tabla := 'DetComprasTemp';
if dsrejilla.DataSet.RecordCount > 0 then
  begin
  if rgmoneda.Text = 'D' then //Pesos a Dolares
    querys('Update '+tabla+' as d set costo = round(costo/'+edTipoCambio.text+',4) where d.idcompra='+idcompra, 1, sqlgeneral)
  else
    querys('Update '+tabla+' as d set costo = round(costo*'+edTipoCambio.text+',4) where d.idcompra='+idcompra, 1, sqlgeneral);
  dsrejilla.DataSet.Close;
  dsrejilla.DataSet.Open;
  end;
operacion;
end;

procedure Tfrmcompras.cbivaExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmcompras.CalcularCostoAP; //Calcular el costo promedio despues de grabar
var costo, cos:double;  ban:integer; precioa, linea, depto :string;
begin
cos:=0;
querys('Select d.costo, d.cod_cve, d.cant_ord as cant, a.moneda, a.nacional from DetCompras as d left join articulos as a '+
       'on d.cod_cve=a.cod_cve where idcompra='+idcompra, 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  if tipo <> 2 then
    begin
    if sqlgeneral.fieldbyname('moneda').AsString = rgmoneda.text then
      costo := sqlgeneral.fieldbyname('costo').AsFloat
    else
      begin
      if rgmoneda.text = 'D' then
        costo := sqlgeneral.fieldbyname('costo').AsFloat * strtofloat(edtipocambio.text)
      else
        costo := sqlgeneral.fieldbyname('costo').AsFloat / strtofloat(edtipocambio.text);
      end;
    CalculaCostoPromedio(costo,'E', sqlgeneral.fieldbyname('cod_cve').AsString, '+', sqlgeneral.fieldbyname('cant').AsInteger);

    ///CALCULO DE LO CHINO
    if sqlgeneral.fieldbyname('nacional').AsString = 'Chn' then
      begin
      if application.MessageBox(pchar('Deseas capturar el precio de '+sqlgeneral.fieldbyname('cod_cve').AsString+' acuerdo a otro costo?'), 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
        begin
        repeat
          try
          cos := strtofloat(InputBox('Captura el costo',pchar('El articulo '+sqlgeneral.fieldbyname('cod_cve').AsString+
                            ' es Chino'+char(#13)+'Escriba el costo con el que se calculara el precio'), '0'));
          ban := 1;
          except
          ban := 0;
          end;
        until ban = 1;
        querys('Select d.nombre as depto, l.nombre as linea from articulos a left join dptos d on a.iddpto=d.iddpto '+
               'left join lineas l on a.idlinea=l.idlinea where a.cod_cve = "'+sqlgeneral.fieldbyname('cod_cve').AsString+'"', 0, sqlgeneral2);
        linea := sqlgeneral2.fieldbyname('linea').AsString;
        depto :=  sqlgeneral2.fieldbyname('depto').AsString;
        precioa := Format('%8.2f',[frmarticulos.CalculaCosto(cos, sqlgeneral.fieldbyname('cod_cve').AsString, depto, linea)]);
        querys('UPDATE articulos SET precioa = '+precioa+', utila = round((('+precioa+'-costo)*100)/costo,2) where cod_cve= "'+sqlgeneral.fieldbyname('cod_cve').AsString+'"' , 1, sqlgeneral2);
        frmprincipal.ucprincipal.Log('Cambio el precioa del articulo en compra: '+sqlgeneral.fieldbyname('cod_cve').AsString, 2);
        end;
      end;
    end
  else
    begin
    if querys('Select cod_cve, round(sum(cant*costo) /sum(cant),2)  as cp From CardexArt '+
              'Where cod_cve = "'+sqlgeneral.fieldbyname('cod_cve').AsString+'" AND movimiento = "E" '+
              'and idmovi = 11 group by cod_cve', 0, dmaccesos.sqlgeneral) > 0 then
      querys('Update articulos set CostoPromedio="'+dmaccesos.sqlgeneral.fieldbyname('cp').AsString+
             '" where cod_cve = "'+sqlgeneral.fieldbyname('cod_cve').AsString+'"', 1, dmaccesos.sqlgeneral);
    end;
  sqlgeneral.Next;
  end;
end;

procedure Tfrmcompras.edfacmontoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    if(edfacmonto.Text <> '') and (ednfactura.Text <> '')then
      begin
         tbfacturas.Add(ednfactura.text+#9+'$'+edfacmonto.text);
         ednfactura.Text := '';
         edfacmonto.text := '';
         ednfactura.setfocus;
      end else
         dpago.SetFocus;

  end;
end;

procedure Tfrmcompras.tbfacturasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=46) then
 begin
    if(tbfacturas.Items.Count >0 )then
      begin
          tbfacturas.DeleteSelected;
      end;
 end;
end;

procedure Tfrmcompras.edivaChange(Sender: TObject);
begin
if not ((btnalta.Caption='&Alta') and (btnmodificar.Caption = '&Editar')) then
     if((ediva.Text <> '0.00') and (ediva.Text <>'')) then
        begin
        if rgmoneda.text = 'P' then
          edtotalmn.text :=  floattostr(strtofloat(edsubtotal.text) + strtofloat(ediva.text))
        else
          begin
          edtotal.text :=  floattostr(strtofloat(edsubtotal.text) + strtofloat(ediva.text));
          edtotalmn.Text := floattostr(strtofloat(edtotal.text) * strtofloat(edtipocambio.text));
          end;
        end;
end;

procedure Tfrmcompras.edivaKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(ediva.Text,key);
if key = #13 then
  begin
  ediva.OnChange(Sender);
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcompras.Limpiar;
begin
estatus.caption := '';
if tipo = 1 then
  edbuscarorden.Text := '';
edbuscarprov.Text := '';
edprov.Text := '';
edfletes.Text := '';
edotros.Text := '';
//edTipoCambio.Text :='';
//rgmoneda.ItemIndex := -1;
tbfacturas.clear;
ednfactura.text := '';
edpedimento.text := '';
lbufh.Caption := '';
end;

procedure Tfrmcompras.rgmonedaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin

     key:=#0;
     if(rgmoneda.Text = 'D') then
        sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0)
     else
        cbiva.SetFocus;

   end;
end;

procedure Tfrmcompras.tblcomprasBeforePost(DataSet: TDataSet);
begin
tblcomprasDetallesCompra.AsString := eddatosentrega.text;
end;

procedure Tfrmcompras.edTipoCambioChange(Sender: TObject);
begin
if ((sqlrejillaalta.RecordCount <> 0) or (sqlrejillaaltatemp.RecordCount <> 0)) and (btncancelar.caption <> '&Cerrar') then
  operacion;
end;

procedure Tfrmcompras.LMontoDblClick(Sender: TObject);
begin
monto := strtofloat(idmonto.InputBox('Ingrese el monto de la factura', 'Monto: $', ''));
lmonto.caption := 'Monto: $'+floattostr(monto);
end;

End.



