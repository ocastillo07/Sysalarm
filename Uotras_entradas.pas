{////////////////////////// MODIFICACIONES /////////////////////////////////////
2008/05/31 dalyla rebasa el minimo mensaje correccion
2008/05/30 dalyla quite costo promedio y agregue descripcion en cardex
2008/05/30 dalyla backorder y apartados en inventario2008/05/30 dalyla backorder y apartados en inventario
2008/05/23 dalyla limpieza donde debe y donde encontre jajaja
2008/02/28 dalyla zona horaria ok
2007/12/06 Dalila Calcula Costo promedio
2007/12/04 Dalila Calculo de Costo promedio llamar funcion donde se ocupe
}///////////////////////////////////////////////////////////////////////////////

unit Uotras_entradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, RzCmboBx, StdCtrls, RzDBCmbo,
  RzDBEdit, DBCtrls, RzEdit, RzButton, Buttons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  cxCurrencyEdit, cxDBEdit, ExtCtrls, Mask, RzBtnEdt, RzLabel, MyAccess,
  MemDS, DBAccess, ComCtrls, ToolWin, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDCustomCheckListDlg,
  LMDCheckListDlg, dateutils;

type
  Tfrmotras_entradas = class(TForm)
    gbdatos: TGroupBox;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edbuscar: TRzButtonEdit;
    edHoraAlta: TRzDBEdit;
    pnldatos: TPanel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel11: TRzLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RzLabel22: TRzLabel;
    dpago: TRzDBDateTimeEdit;
    dentrada: TRzDBDateTimeEdit;
    gbarticulo: TGroupBox;
    RzLabel13: TRzLabel;
    lblproducto: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    Label1: TLabel;
    RzLabel16: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel26: TRzLabel;
    edcantidad: TRzNumericEdit;
    btnagregar: TRzBitBtn;
    edDescripcion: TRzEdit;
    EdCosto_unidad: TRzEdit;
    ediva_art: TRzEdit;
    edcodigo: TRzButtonEdit;
    edcant_sur: TRzNumericEdit;
    edcomentarios: TRzMemo;
    edultcompra: TRzEdit;
    edmin: TRzEdit;
    edmax: TRzEdit;
    edexist: TRzEdit;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    DSajusteinv: TDataSource;
    tblajusteinv: TMyTable;
    DsRejilla: TDataSource;
    Sqlrejillaalta: TMyQuery;
    SqlGeneral: TMyQuery;
    sqlrejillaaltatemp: TMyQuery;
    ednfactura1: TRzDBEdit;
    RzLabel17: TRzLabel;
    RzLabel28: TRzLabel;
    dimportacion: TRzDBDateTimeEdit;
    edbuscares: TRzButtonEdit;
    ednombrec: TRzEdit;
    edmovc: TRzEdit;
    gbtotales: TGroupBox;
    RzLabel21: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel9: TRzLabel;
    edotrosg: TcxDBCurrencyEdit;
    edfletes: TcxDBCurrencyEdit;
    edtp: TRzDBNumericEdit;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel27: TRzLabel;
    edtotalmn: TRzDBNumericEdit;
    edtotal: TRzDBNumericEdit;
    ediva: TRzDBNumericEdit;
    edsubtotal: TRzDBNumericEdit;
    gbanticipos: TGroupBox;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    edanticipo: TcxDBCurrencyEdit;
    eddescuento: TcxDBCurrencyEdit;
    rgmoneda: TRzComboBox;
    estatus: TRzLabel;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    pregunta: TLMDCheckListDlg;
    fuentes: TFontDialog;
    eddatosentrega: TRzDBRichEdit;
    edTipoCambio: TRzEdit;
    edpiezas: TRzEdit;
    RzLabel29: TRzLabel;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    descuento: TcxGridDBColumn;
    aplica_desc: TcxGridDBColumn;
    precio_costo: TcxGridDBColumn;
    subtotal: TcxGridDBColumn;
    dbiva: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    edcliente: TRzButtonEdit;
    RzLabel30: TRzLabel;
    tblajusteinvidajuste: TIntegerField;
    tblajusteinvidconcepto_es: TStringField;
    tblajusteinvFechaAlta: TDateField;
    tblajusteinvHoraAlta: TTimeField;
    tblajusteinvFechaEntrada: TDateField;
    tblajusteinvHoraEntrada: TTimeField;
    tblajusteinvFechaPago: TDateField;
    tblajusteinvidcliente: TIntegerField;
    tblajusteinvmoneda: TStringField;
    tblajusteinvTipoCambio: TFloatField;
    tblajusteinvanticipo: TFloatField;
    tblajusteinvdescuento: TFloatField;
    tblajusteinvSubTotal: TFloatField;
    tblajusteinviva: TFloatField;
    tblajusteinvfletes: TFloatField;
    tblajusteinvotros: TFloatField;
    tblajusteinvtotal: TFloatField;
    tblajusteinvtotalmn: TFloatField;
    tblajusteinvTotalProductos: TIntegerField;
    tblajusteinvobservaciones: TMemoField;
    tblajusteinvFechaImportacion: TDateField;
    tblajusteinvestatus: TStringField;
    tblajusteinvusuario: TStringField;
    tblajusteinvfecha: TStringField;
    tblajusteinvhora: TStringField;
    tblajusteinvUsuarioUltMod: TStringField;
    tblajusteinvFechaUltMod: TStringField;
    tblajusteinvHoraUltMod: TStringField;
    tblajusteinvmovimiento: TStringField;
    tblajusteinvidservicio: TIntegerField;
    edservicio: TRzButtonEdit;
    RzBitBtn1: TRzBitBtn;
    tblajusteinvfactura: TStringField;
    cbiva: TRzComboBox;
    RzLabel36: TRzLabel;
    tblajusteinvpiva: TFloatField;
    edFechaAlta: TRzDBDateTimeEdit;
    lbufh: TRzLabel;
    procedure dimportacionEnter(Sender: TObject);
    procedure dentradaEnter(Sender: TObject);
    procedure dpagoEnter(Sender: TObject);
    procedure ednfactura1Exit(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edconceptoKeyPress(Sender: TObject; var Key: Char);
    procedure rgmonedaExit(Sender: TObject);
    procedure edTipoCambioExit(Sender: TObject);
    procedure rgmonedaEnter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarClick(Sender: TObject);
    procedure RejillaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure edfletesExit(Sender: TObject);
    procedure edotrosgExit(Sender: TObject);
    procedure edfletesKeyPress(Sender: TObject; var Key: Char);
    procedure edotrosgKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscaresButtonClick(Sender: TObject);
    procedure edbuscaresChange(Sender: TObject);
    procedure edbuscaresExit(Sender: TObject);
    procedure edbuscaresKeyPress(Sender: TObject; var Key: Char);
    procedure rgmonedaNotInList(Sender: TObject);
    procedure EdCosto_unidadKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoChange(Sender: TObject);
    procedure edcomentariosEnter(Sender: TObject);
    procedure edcomentariosExit(Sender: TObject);
    procedure eddatosentregaExit(Sender: TObject);
    procedure eddatosentregaEnter(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure edTipoCambioKeyPress(Sender: TObject; var Key: Char);
    procedure edclienteButtonClick(Sender: TObject);
    procedure edclienteKeyPress(Sender: TObject; var Key: Char);
    procedure edclienteExit(Sender: TObject);
    procedure edservicioButtonClick(Sender: TObject);
    procedure edservicioKeyPress(Sender: TObject; var Key: Char);
    procedure edservicioExit(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbivaExit(Sender: TObject);

  private
    moneda :string;
    procedure LimpiaDatArt;
    function ValidaProducto(CodCve:string):integer;
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure buscarlocate;
    procedure operacion;
    procedure mostrar_registros;
    procedure buscarconceptolocate;
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure ActualizaXMoneda;
    { Private declarations }
  public
    { Public declarations }
    id,idconcepto,movimiento:string;
    idservicio:integer;
     _gCosto:double;
    constructor inicializa(idserv:integer);
  end;

var
  frmotras_entradas: Tfrmotras_entradas;

implementation

uses Urecursos, Udm, Ubusquedas, Uprincipal, Uarticulos, Uconcepto_es,
  UBuscaArt, UBuscarServ, Udmrep;

{$R *.dfm}

constructor Tfrmotras_entradas.inicializa(idserv:integer);
begin
idservicio := idserv;
edservicio.Text := inttostr(idserv);
querys('select valor from configuraciones where concepto=''TipoCambio''',0,sqlgeneral);
edTipoCambio.Text := sqlgeneral.fieldbyname('valor').AsString;
edTipoCambio.Enabled := false;
rgmoneda.ItemIndex := 1;
rgmoneda.Enabled := false;
querys('select idconcepto_es from ConceptoES where nombre=''GARANTIA SALIDA''',0,sqlgeneral);
edbuscares.Text := sqlgeneral.fieldbyname('idconcepto_es').AsString;
chtecla:=#13;
edbuscares.OnKeyPress(self,chtecla);
edbuscares.Enabled := false;
end;

procedure Tfrmotras_entradas.buscarconceptolocate;
begin
querys('select  idconcepto_es as ID,nombre as Nombre,movimiento as Movimiento from ConceptoES where movimiento='+quotedstr(movimiento)+' and idconcepto_es='+quotedstr(edbuscares.Text),0,SqlGeneral);
if SqlGeneral.recordcount = 0 then
 begin
  if application.MessageBox('No existe ese concepto!, deseas darlo de alta','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
    frmprincipal.muestra_mdichild(163,299,tfrmconcepto_es,'Acceso la Pantalla de Concepto de E/S');
   end;
   edbuscares.text:='';
   ednombrec.text:=''
 end
else
 begin
   idconcepto:=SqlGeneral.fieldbyname('ID').AsString;
   edbuscares.text:=SqlGeneral.fieldbyname('ID').AsString;
   ednombrec.text:=SqlGeneral.fieldbyname('Nombre').AsString;
   if SqlGeneral.fieldbyname('Movimiento').AsString ='E' THEN
    edmovc.Text:='ENTRADA'
   else
    edmovc.Text:='SALIDA';
   if ednombrec.Text = 'GARANTIA SALIDA' then
    edservicio.Enabled := true
   else
    edservicio.Enabled := false;
   if pnldatos.enabled = true then
    rgmoneda.SetFocus;
 end;//if recordcount
end;

procedure Tfrmotras_entradas.mostrar_registros;
begin
       edultcompra.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('ultima_compra').AsString;
       edmin.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('minimo').AsString;
       edmax.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('maximo').AsString;
       edexist.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('existencia').AsString;
       edDescripcion.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('nombre').AsString;
       EdCosto_unidad.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('costo').AsString;
       Edcodigo.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('cod_cve').AsString;
       Edcantidad.text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('cant_ord').AsString;
end;


procedure Tfrmotras_entradas.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
if dsrejilla.DataSet.RecordCount > 0 then
  begin
    edcodigo.Text:=dsrejilla.DataSet.FieldValues['cod_cve'];
    eddescripcion.Text:=dsrejilla.DataSet.FieldValues['nombre'];
    EdCosto_unidad.Text:=dsrejilla.DataSet.FieldValues['costo'];
    _gCosto :=  StrToFloat(edCosto_Unidad.Text);
    edcantidad.Text:=dsrejilla.DataSet.FieldValues['cant_ord'];
    edcomentarios.Text:=dsrejilla.DataSet.FieldValues['comentarios'];
    //edcant_sur.Text:=dsrejilla.DataSet.FieldValues['cant_sur'];

    //elimina el registro del articulo
    querys('delete from '+tabla+' where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and cant_ord='+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
    //refresca la rejilla de datos
    query.Close;
    query.ParamByName('id').asstring:=valor;
    query.Open;
    dsrejilla.DataSet:=query;
    btnagregar.Enabled:=true;
    edcodigo.Enabled:=false;
    edcantidad.Enabled:=true;
    edcantidad.SetFocus;
    operacion;
  end;
end;




procedure Tfrmotras_entradas.operacion;
var id:string;
cambio:double;
begin
id:=edbuscar.text;
querys('Select TRUNCATE(SUM(d.cant_ord * d.costo),2) as SUBTOTAL, TRUNCATE(SUM((d.cant_ord * d.costo)*'+cbiva.text+'),2) as IVA, '+
       'TRUNCATE(SUM((d.cant_ord * d.costo)*'+floattostr(1+strtofloat(cbiva.text))+'),2) as TOTAL, SUM(d.cant_ord) as TotalProductos '+
       'From DetAjusteInvTemp as d inner join articulos as a on d.cod_cve=a.cod_cve WHERE d.idajuste='+id+' and idmaq="'+
       frmprincipal.idmaq+'" Order By d.cod_cve', 0, sqlGeneral);

edtp.text:=inttostr(SqlGeneral.fieldbyname('TotalProductos').AsInteger);
edsubtotal.Text:='$'+floattostr(SqlGeneral.fieldbyname('SUBTOTAL').AsFloat);
ediva.Text:='$'+floattostr(SqlGeneral.fieldbyname('IVA').AsFloat);
cambio:=quitacaracteres(edtipocambio.Text,'$');
edtotal.Text:='$'+floattostr((edfletes.value + edotrosg.value) + (SqlGeneral.fieldbyname('TOTAL').AsFloat));
edtotalmn.Text:='$'+ floattostr(round(((((edfletes.value) + (edotrosg.value)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat))*cambio)*100)/100)
end;



procedure Tfrmotras_entradas.InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
if ((btnagregar.Enabled) and (edcodigo.text <> ''))then
  begin
  if movimiento='E' then

    if _gCosto >  strtofloat(edCosto_Unidad.Text) then
      begin
      if BuscarCostoPromedioSistema then
         if (application.MessageBox(pchar('El Costo que se esta capturando sobre el articulo es menor al costo en sistema! '+char(13)+
            'Se cambiara el costo del articulo ya realizada la compra ,'+char(13)+' desea continuar?, se puede modificar despues en la pantalla de articulos el costo.'),'Atención',mb_yesno+MB_ICONWARNING)= IDNO) then
           Exit;
      end;


  if rejilla.Enabled = false then
    rejilla.Enabled:=true;

  //verifica que no exista el articulo en la lista
  //insercion para unidades.
  querys('select * from '+tabla+' where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),0,SqlGeneral);

  if SqlGeneral.RecordCount = 0 then
    begin
    if movimiento='E' then
      begin
      if querys('select cod_cve,if ( maximo < (FLOOR(('+edcantidad.Text+' + existencia)/piezasxunidad)), 1, 0) as condicion '+
             'from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,sqlgeneral) > 0 then
      application.MessageBox('Se excede de existencias para ese articulo!','Información',mb_ok+mb_iconinformation);
      end
    else
      begin
      if querys('select cod_cve, (FLOOR((existencia - '+edcantidad.Text+')/piezasxunidad)) as resta, if ( minimo >= (FLOOR((existencia - '+edcantidad.Text+')/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,sqlgeneral) > 0 then
        if sqlgeneral.fieldbyname('resta').AsInteger < 0 then
          begin
          application.MessageBox('La salida de este articulo rebasa la existencia!','Información',mb_ok+mb_iconinformation);
          exit;
          end
        else
          application.MessageBox('La salida de este articulo rebasa lo minimo!','Información',mb_ok+mb_iconinformation);
      end;

    querys('insert into '+tabla+'(cant_ord,cod_cve,'+campo+',costo,comentarios,idmaq) values ('+edcantidad.Text+',"'+edcodigo.Text+'",'+quotedstr(valor)+','+quotedstr(EdCosto_unidad.Text)+','+quotedstr(edcomentarios.Text)+','+quotedstr(frmprincipal.idmaq)+')',1,SqlGeneral);
    end
  else
    begin // recordcount
    //solo actualiza las existencias en caso de ya estar en la tabla
    if movimiento='E' then//entradas
      begin
      if querys('select cod_cve,if ( maximo < (FLOOR(('+quotedstr(sqlgeneral.fieldbyname('cant_ord').asstring)+' + '+quotedstr(edcantidad.text)+' + existencia)/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,dmaccesos.sqlgeneral) > 0 then
        application.MessageBox('Se excede de existencias para ese articulo!','Información',mb_ok+mb_iconinformation);
      end
    else
      begin
      if querys('select cod_cve, (FLOOR((existencia - '+edcantidad.Text+')/piezasxunidad)) as resta,  if ( minimo >= (FLOOR((existencia - '+quotedstr(sqlgeneral.fieldbyname('cant_ord').asstring)+' + '+
                quotedstr(edcantidad.text)+')/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,dmaccesos.sqlgeneral) > 0 then
        if sqlgeneral.fieldbyname('resta').AsInteger < 0 then
          begin
          application.MessageBox('La salida de este articulo rebasa la existencia!','Información',mb_ok+mb_iconinformation);
          exit;
          end
        else
          application.MessageBox('La salida de este articulo rebasa lo minimo!','Información',mb_ok+mb_iconinformation);
      end;

    querys('update '+tabla+' set cant_ord=cant_ord+'+quotedstr(edcantidad.Text)+',costo='+quotedstr(EdCosto_unidad.Text)+',comentarios='+quotedstr(edcomentarios.Text)+'  where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
    end;//recordcount
  end
else
  begin
  //solo actualiza las existencias en caso de ya estar en la tabla
  querys('update '+tabla+' set costo='+quotedstr(EdCosto_unidad.Text)+'  where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
  end;


//SACAR LOS COSTOS Y LOS TIEMPOS
//mostrar los articulos del paquete en la rejilla.......
operacion;
rejilla.Enabled:=true;
//vuelve a abrir la query con el id;
query.Close;
query.ParamByName('id').AsString:=valor;
query.Open;
LimpiaDatArt;
end;




function Tfrmotras_entradas.ValidaProducto(CodCve:string):integer;
var cost :double;
begin
//aqui busca el articulo por codigo de barras o por clave
querys('SELECT cod_cve,nombre,(costo/piezasxunidad) as costo,iva,minimo,maximo,moneda, ultima_compra,FLOOR(existencia/piezasxunidad) as Unidades,MOD(existencia,piezasxunidad) as Piezas, status FROM articulos WHERE cod_cve='+quotedstr(edcodigo.Text)+' AND paquete=0 and servicio=0 ORDER BY nombre ASC',0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
  begin
  application.MessageBox('No existe ningun Articulo con esa Clave!','Atencion',mb_iconInformation);
  //frmprincipal.muestra_mdichild(535,759,tfrmarticulos,'Acceso la Pantalla de tipos de Articulos');

  edcodigo.SelectAll;
  SqlGeneral.Close;
  edcantidad.Text:='1';
  LimpiaDatArt;
  result:=0;
  end
else
  begin
  if sqlgeneral.fieldbyname('status').asinteger = 1 then
    begin
    // si hay datos en el campo piezas_envase entonces que se habilite el checkbox de piezas........
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
    edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
    ediva_art.Text:=SqlGeneral.fieldbyname('iva').AsString;
    edultcompra.Text:=SqlGeneral.fieldbyname('ultima_compra').AsString;
    edmin.Text:=SqlGeneral.fieldbyname('minimo').AsString;
    edmax.Text:=SqlGeneral.fieldbyname('maximo').AsString;
    edexist.text := SqlGeneral.fieldbyname('Unidades').AsString;
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



procedure Tfrmotras_entradas.LimpiaDatArt;
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
     ediva_art.Text:='';
     edcomentarios.text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
     edexist.text:='';
     if (btncancelar.Caption = '&Cancelar')  then
     edcodigo.SetFocus;

end;

procedure Tfrmotras_entradas.buscarlocate;
begin
tblajusteinv.Active:=true;
edcliente.clear;
if tblajusteinv.Locate('idajuste',edbuscar.Text,[]) then
   begin
    edcliente.Text := tblajusteinvidcliente.AsString;
    edservicio.Text := tblajusteinvidservicio.AsString;
    rgmoneda.Text:=tblajusteinvmoneda.AsString;
    edTipoCambio.Text:=tblajusteinvTipoCambio.AsString;
    cbiva.text := tblajusteinvpiva.AsString;
    id:=tblajusteinv.fieldbyname('idajuste').AsString;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    SqlRejillaAlta.Close;
    SqlRejillaAlta.ParamByName('id').AsString:=edbuscar.text;
    SqlRejillaAlta.Open;
    edfletes.Text:=tblajusteinvfletes.AsString;
    edotrosg.Text:=tblajusteinvotros.AsString;
    edTipoCambio.Text:=tblajusteinvTipoCambio.AsString;
    lbufh.Caption := UFH(tblajusteinv);
    IF tblajusteinv.fieldbyname('estatus').AsString = 'CANCELADA' THEN
       estatus.Caption:=tblajusteinv.fieldbyname('estatus').AsString
    else
      estatus.caption:='';

    querys('select nombre,if( movimiento =''E'',''ENTRADA'',''SALIDA'') AS movimientodesc,movimiento  from ConceptoES where idconcepto_es='+quotedstr(tblajusteinv.fieldbyname('idconcepto_es').asstring),0,sqlgeneral);
    ednombrec.Text:=sqlgeneral.fieldbyname('nombre').asstring;
    edmovc.Text:=sqlgeneral.fieldbyname('movimientodesc').asstring;
    edbuscares.Text:= tblajusteinv.fieldbyname('idconcepto_es').AsString;
    movimiento:=sqlgeneral.fieldbyname('movimiento').asstring;
     if (ednombrec.Text = 'GARANTIA SALIDA')and(btnmodificar.Caption='&Guardar') then
       edservicio.Enabled := true
      else
       edservicio.Enabled := false;
   end
else
  begin
    estatus.Caption:='';
    rgmoneda.ItemIndex:=-1;
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Ajuste de inventarios no Existe','Información',mb_ok+mb_iconinformation);
    tblajusteinv.Active:=false;
    SqlRejillaAlta.Close;
    edbuscar.Text:='';
    edbuscar.SetFocus;
  end;// idarea
end;



procedure Tfrmotras_entradas.dimportacionEnter(Sender: TObject);
begin
dimportacion.Date:=FechaServidor();
end;

procedure Tfrmotras_entradas.dentradaEnter(Sender: TObject);
begin
dentrada.Date:=FechaServidor();
end;

procedure Tfrmotras_entradas.dpagoEnter(Sender: TObject);
begin
dpago.Date:=FechaServidor();
end;

procedure Tfrmotras_entradas.ednfactura1Exit(Sender: TObject);
begin
rgmoneda.ItemIndex:=0;
end;

procedure Tfrmotras_entradas.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmotras_entradas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select a.idajuste,a.idconcepto_es as Concepto,c.nombre as NombreConcepto,if(a.movimiento=''E'',''ENTRADA'',''SALIDA'') AS Ajuste,a.total as Total,a.usuario as Usuario,a.fecha as Fecha,a.hora as Hora '+
                          'From AjusteInv as a LEFT JOIN ConceptoES as c ON (c.idconcepto_es=a.idconcepto_es)  order by idajuste desc';
      frmbusquedas.campo_retorno:='idajuste';
      frmbusquedas.campo_busqueda:='idajuste';
      frmbusquedas.tblorigen := 'AjusteInv';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblajusteinv.Active:=true;
             edbuscar.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;
end;

procedure Tfrmotras_entradas.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then begin
   tblajusteinv.Active:=false;
   Sqlrejillaalta.Close;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   estatus.Caption:='';
   edbuscares.Text:='';
   edmovc.Text:='';
   ednombrec.Text:='';
   edTipoCambio.Text:='';
   lbufh.Caption := '';
   end;
end;

procedure Tfrmotras_entradas.edbuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
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

procedure Tfrmotras_entradas.edconceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)  then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmotras_entradas.rgmonedaExit(Sender: TObject);
begin
if rgmoneda.Text = 'D' then begin
querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
edTipoCambio.text:=Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]);
edtipocambio.Enabled:=true;
//edTipoCambio.SetFocus;
end else begin
edtipocambio.Enabled:=false;
dentrada.setfocus;
end;
ActualizaXMoneda;
moneda := rgmoneda.text;
end;

procedure Tfrmotras_entradas.edTipoCambioExit(Sender: TObject);
begin
if edTipoCambio.Text = '' then
edTipoCambio.SetFocus;
end;

procedure Tfrmotras_entradas.rgmonedaEnter(Sender: TObject);
begin
rgmoneda.ItemIndex:=0;
edtipocambio.enabled:=true;
end;

procedure Tfrmotras_entradas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then begin
     showmessage('No has guardado los datos, si deseas salir oprime el boton Cancelar');
     canclose:=false;
  end;//botones

end;

procedure Tfrmotras_entradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmotras_entradas.btnaltaClick(Sender: TObject);
var idmovi:string;
begin
if btnalta.Caption='&Alta' then
  begin
  if pregunta.Execute then
    if pregunta.Value =1 then
      begin
      // if application.MessageBox('Vas a dar de alta un Ajuste de Entrada(presione yes)?, si es un Ajuste de Salida(presione no)','Confirmación',mb_yesno) = idNo then begin
      movimiento:='S';
      EdCosto_unidad.Hint:='Costo del articulo';
      EdCosto_unidad.Enabled:=false;
      end
    else
      begin
      movimiento:='E';
      //EdCosto_unidad.Hint:='Costo del articulo, dar enter para modificarlo o agregar el articulo';
      //EdCosto_unidad.Enabled:=true;
      end;
      //pone la tabla de otras entradas en modo de insercion
    estatus.Caption:='';
    lbufh.Caption := '';
    tblajusteinv.Active:=true;
    tblajusteinv.insert;
    pnldatos.Enabled:=true;
    //trae el maximo idorden + 1
    querys('select max(idajuste) as id from AjusteInv',0,sqlgeneral);
    edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    id:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    querys('delete from DetAjusteInvTemp where idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgeneral);
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    sqlrejillaalta.close;
    dsrejilla.DataSet:=Sqlrejillaaltatemp;
    sqlrejillaaltatemp.Close;
    sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
    dentrada.date:=FechaServidor();
    edFechaAlta.text:=dentrada.Text;
    edfechaalta.Enabled := true;
    dpago.date:=dentrada.date;
    dimportacion.date:=dentrada.date;
    edbuscar.Enabled:=false;
    edbuscares.text:='';
    ednombrec.text:='';
    edservicio.Text := '';
    edbuscares.SetFocus;
    rgmoneda.ItemIndex:=-1;
    end
  else
    begin
    if sqlrejillaaltatemp.RecordCount > 0 then
      begin
      if edbuscares.Text <> '' then
        begin
        // if application.MessageBox('Estan correctos los datos?,no se podran modificar despues!','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
        if (ednombrec.Text = 'GARANTIA SALIDA') and ((edservicio.Text = '')or(edcliente.Text='')) then
          begin
          application.MessageBox('Debe de especificar el numero de servicio con que se relaciona esta salida y el numero de cliente','Aviso',mb_iconwarning);
          exit;
          end;
        pnldatos.Enabled:=false;
        btnalta.Caption:='&Alta';
        btnalta.Hint:='Dar de Alta un Ajuste de Inventario';
        btncancelar.Caption:='&Cerrar';
        btncancelar.Hint:='Cerrar esta Ventana';
        btnalta.ImageIndex:=5;
        btnborrar.Enabled:=true;
        btnmodificar.Enabled:=true;
        tblajusteinvmovimiento.AsString:=movimiento;
        //tblajusteinvFechaAlta.AsDateTime:=FechaServidor();
        tblajusteinvHoraAlta.AsDateTime:=HoraServidor();
        tblajusteinvusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
        tblajusteinvmoneda.AsString:=rgmoneda.Text;
        tblajusteinvpiva.AsString := cbiva.text;      
        tblajusteinv.fieldbyname('fecha').AsString:=datetostr(date);
        tblajusteinv.fieldbyname('hora').AsString:=timetostr(time);
        tblajusteinv.fieldbyname('idconcepto_es').AsString:=edbuscares.Text;
        tblajusteinvidcliente.AsString := edcliente.Text;
        tblajusteinvidservicio.Asstring := edservicio.text;
        tblajusteinvUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
        tblajusteinvFechaUltMod.AsString:=datetostr(date);
        tblajusteinvFechaUltMod.AsString:=timetostr(time);
        tblajusteinvFechaAlta.AsString:= edFechaAlta.Text;
        //trae el maximo idajuste + 1
        querys('select max(idajuste) as id from AjusteInv',0,sqlgeneral);
        edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
        id:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
        tblajusteinvidajuste.asstring:=id;
        frmprincipal.ucprincipal.Log('Dio el Ajuste:'+edbuscar.text,1);
        tblajusteinvTipoCambio.AsString:=edTipoCambio.Text;
        tblajusteinv.Post;
        idClienteGral := '';
        idServicioGral := '';
        if ednombrec.Text = 'GARANTIA SALIDA' then
          querys('update servicios set idajuste='+edbuscar.Text+' where sid="'+edservicio.Text+'"',1,sqlgeneral);
        LimpiaDatArt;

        ///////////actualizar articulos
        querys('UPDATE DetAjusteInvTemp SET idajuste = '+quotedstr(edbuscar.Text)+' WHERE idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
        querys('insert into DetAjusteInv(idajuste,cod_cve,cant_ord,costo,comentarios) select idajuste,cod_cve,cant_ord,costo,comentarios from DetAjusteInvTemp where idajuste = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);

        ///////////borrar temporales......
        querys('delete from DetAjusteInvTemp where idmaq='+quotedstr(frmprincipal.idmaq)+' or idajuste='+quotedstr(edbuscar.Text),1,SqlGeneral);
        if movimiento ='E' then
          begin
          //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
          //querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) + (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) + '+
          //       '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
          {querys('Select d.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on a.cod_cve = d.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
          sqlgeneral.First;
          while not sqlgeneral.Eof = true do
            begin
            CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat,'E', sqlgeneral.fieldbyname('cod_cve').AsString, '+', sqlgeneral.fieldbyname('cant').AsInteger);
            sqlgeneral.Next;
            end;}

          /////////////////actualizar existencias///////////////////////////////////////////////////////
          querys('UPDATE articulos,DetAjusteInv SET  articulos.existencia=(articulos.existencia + DetAjusteInv.cant_ord)  WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);

          ////////////////actualizar el costo del articulo con este ultimo y realizar las transacciones para los campos correspondientes, precios...../////////
          {querys('UPDATE articulos,DetAjusteInv SET articulos.precioa=TRUNCATE(((DetAjusteInv.costo*(articulos.utila/100))+DetAjusteInv.costo),3),articulos.preciob=ROUND(((DetAjusteInv.costo*(articulos.utilb/100))+DetAjusteInv.costo),3),'+
                 'articulos.precioc=ROUND(((DetAjusteInv.costo*(articulos.utilc/100))+DetAjusteInv.costo),3),articulos.preciod=ROUND(((DetAjusteInv.costo*(articulos.utild/100))+DetAjusteInv.costo),3),articulos.precio_desc=ROUND(((DetAjusteInv.costo*(desc_esp/100)) '+
                 '+DetAjusteInv.costo),3),articulos.existencia=(articulos.existencia + (DetAjusteInv.cant_ord*articulos.piezasxunidad)) WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);}
          //insertar al cardex
          querys('SELECT idmovi FROM TipoMov where nombre=''AJUSTE/ENTRADA'' ',0,sqlgeneral);
          idmovi:=sqlgeneral.fieldbyname('idmovi').AsString;
          querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
                 'SELECT da.cod_cve,da.idajuste,(da.cant_ord * a.piezasxunidad),da.costo,'+quotedstr(movimiento)+','+quotedstr(idmovi)+', '+
                 '"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', '+
                 '"Ajuste de Entrada: '+edbuscar.text+'" FROM  DetAjusteInv as da LEFT JOIN articulos as a ON (a.cod_cve=da.cod_cve) WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
          end
        else
          begin
           {querys('Select d.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on a.cod_cve = d.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
           sqlgeneral.First;
            while not sqlgeneral.Eof = true do
              begin
                CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat,'N', sqlgeneral.fieldbyname('cod_cve').AsString, '-', sqlgeneral.fieldbyname('cant').AsInteger);
                sqlgeneral.Next;
              end;}

          querys('UPDATE articulos,DetAjusteInv SET articulos.existencia=(articulos.existencia - DetAjusteInv.cant_ord) WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
          querys('SELECT idmovi FROM TipoMov where nombre=''AJUSTE/SALIDA'' ',0,sqlgeneral);
          idmovi:=sqlgeneral.fieldbyname('idmovi').AsString;
          querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
                 'SELECT da.cod_cve,da.idajuste,(da.cant_ord * a.piezasxunidad),da.costo,'+quotedstr(movimiento)+','+quotedstr(idmovi)+', '+
                 '"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', '+
                 '"Ajuste de Salida: '+edbuscar.text+'" FROM  DetAjusteInv as da LEFT JOIN articulos as a ON (a.cod_cve=da.cod_cve) WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
          end;
        //insertar a la tabla de cardexArt
        edbuscar.Enabled:=true;
        edservicio.Enabled := false;
        dsrejilla.DataSet:=Sqlrejillaalta;
        Sqlrejillaalta.Close;
        Sqlrejillaalta.ParamByName('id').AsString:=edbuscar.Text;
        Sqlrejillaalta.Open;
        edfechaalta.Enabled := false;
        application.MessageBox('Ajuste Registrado','Información',mb_ok+mb_iconinformation);
        //end;//if pregunta....
        end
      else
        begin
        application.MessageBox('No tiene concepto!','Atención',mb_ok);
        edbuscares.SetFocus;
        end;


   end else begin
       application.MessageBox('Mínimo necesita capturar un articulo para guardar','Atención',mb_ok);
       try
          edcodigo.SetFocus;
       except
           eddatosentrega.setfocus;
       end;
   end;
 end;
end;

procedure Tfrmotras_entradas.btnborrarClick(Sender: TObject);
var idmovi:string;
begin
if tblajusteinvestatus.AsString='CANCELADA' then
  application.MessageBox('Este Ajuste esta cancelado','Confirmación',mb_iconInformation)
else
  begin
  if application.MessageBox('Deseas Cancelar este ajuste del sistema?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
    if movimiento='E' then
      begin
       //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
      {querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) - (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) - '+
             '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);}
      //deshabilitado 2008-05-17 ya que solo las entradas afectan.
      {querys('Select a.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on a.cod_cve = d.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
          sqlgeneral.First;
          while not sqlgeneral.Eof = true do
            begin
            CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat, sqlgeneral.fieldbyname('cod_cve').AsString, '-', sqlgeneral.fieldbyname('cant').AsInteger);
            sqlgeneral.Next;
            end;    }

      querys('UPDATE articulos,DetAjusteInv SET articulos.existencia= IF ( (articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad))) '+
             'where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
      querys('SELECT idmovi FROM TipoMov where nombre=''CAN/AJUSTE/ENTRADA'' ',0,sqlgeneral);
      idmovi:=sqlgeneral.fieldbyname('idmovi').AsString;
      querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
              'SELECT cod_cve,idajuste,cant_ord,costo,''S'','+quotedstr(idmovi)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+
              quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', "Cancelacion de Ajuste de Entrada: '+edbuscar.text+'" '+
              'FROM  DetAjusteInv WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
      end
    else
      begin
      //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
      {querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) + (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) + '+
             '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);}
       //deshabilitado 2008-05-17 ya que solo las entradas afectan.
     { querys('Select a.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on a.cod_cve = d.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
          sqlgeneral.First;
          while not sqlgeneral.Eof = true do
            begin
            CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat, sqlgeneral.fieldbyname('cod_cve').AsString, '+', sqlgeneral.fieldbyname('cant').AsInteger);
            sqlgeneral.Next;
            end;
      }
      querys('UPDATE articulos,DetAjusteInv SET articulos.existencia=(articulos.existencia + (DetAjusteInv.cant_ord*articulos.piezasxunidad)) WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
      querys('SELECT idmovi FROM TipoMov where nombre=''CAN/AJUSTE/SALIDA'' ',0,sqlgeneral);
      idmovi:=sqlgeneral.fieldbyname('idmovi').AsString;
      querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
             'SELECT cod_cve,idajuste,cant_ord,costo,''E'','+quotedstr(idmovi)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+
             quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', "Cancelacion de Ajuste de Salida: '+edbuscar.text+'" FROM  DetAjusteInv WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);

      end;
    // querys('DELETE FROM DetAjusteInv where idajuste='+quotedstr(id),1,sqlgeneral);
    // tblajusteinv.Delete;
    tblajusteinv.Edit;
    tblajusteinvestatus.AsString:='CANCELADA';
    tblajusteinvUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
    tblajusteinvFechaUltMod.AsString:=datetostr(date);
    tblajusteinvFechaUltMod.AsString:=timetostr(time);
    tblajusteinv.Post;
    // querys('UPDATE AjusteInv SET estatus=''CANCELADA'' WHERE idajuste='+quotedstr(id),1,sqlgeneral);
    application.MessageBox('Cancelación realizada','Confirmación',mb_iconInformation);
    frmprincipal.ucprincipal.Log('Dio de Baja el ajuste'+edbuscar.text,3);
    tblajusteinv.Active:=false;
    //sqlproveedores.close;
    SqlRejillaAlta.Close;
    querys('select idajuste from AjusteInv',0,sqlgeneral);
    edbuscar.text:='';
    rgmoneda.ItemIndex:=-1;
    if sqlgeneral.RecordCount = 0 then
      begin
      btnmodificar.Enabled:=false;
      btnborrar.Enabled:=false;
      tblajusteinv.Active:=false;
      end;
    end;
  end;
end;

procedure Tfrmotras_entradas.btnmodificarClick(Sender: TObject);
VAR idmovi:string;
begin
if tblajusteinvestatus.AsString='CANCELADA' then
   application.MessageBox('Este Ajuste esta cancelado','Confirmación',mb_iconwarning)
else begin

if btnmodificar.Caption = '&Editar' then
   begin
         if edmovc.Text = 'ENTRADA' then begin
            movimiento:='E';
            //EdCosto_unidad.Hint:='Costo del articulo, dar enter para modificarlo o agregar el articulo';
            //EdCosto_unidad.Enabled:=true;
         end else begin
            movimiento:='S';
            EdCosto_unidad.Hint:='Costo del articulo';
            EdCosto_unidad.Enabled:=false;
         end;
          querys('DELETE FROM DetAjusteInvTemp WHERE idajuste='+quotedstr(edbuscar.text),1,sqlgeneral);
          frmprincipal.ucprincipal.Log('Dio click en el boton editar de ajuste de inventarios',0);
          btncancelar.Caption:='&Cancelar';
          btncancelar.Hint:='Cancelar la Edición';
          btnmodificar.Caption:='&Guardar';
          btnmodificar.hint:='Guardar los Cambios Realizados';
          btnmodificar.ImageIndex:=1;
          edservicio.Enabled := true;
          btnalta.Enabled:=false;
          btnborrar.Enabled:=false;
          edbuscar.Enabled:=false;
          pnldatos.Enabled:=true;
          gbarticulo.Enabled:=true;
          tblajusteinv.Edit;
          edfechaalta.Enabled := true;
          edbuscar.Enabled:=false;
          rejilla.Enabled:=true;
          sqlrejillaalta.close;
          querys('INSERT INTO DetAjusteInvTemp(idajuste,cod_cve,cant_ord,costo,comentarios,idmaq) SELECT idajuste,cod_cve,cant_ord,costo,comentarios,'+quotedstr(frmprincipal.idmaq)+' FROM DetAjusteInv WHERE idajuste = '+quotedstr(edbuscar.Text),1,SqlGeneral);
{          if movimiento = 'E' then
                querys('update articulos,DetAjusteInv set articulos.existencia= if ( (articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad))) '+
                       'where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral)
          else
                querys('update articulos,DetAjusteInv set articulos.existencia= (articulos.existencia + (DetAjusteInv.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
}

          dsrejilla.DataSet:=Sqlrejillaaltatemp;
          sqlrejillaaltatemp.Close;
          sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
          sqlRejillaAltatemp.open;
          edbuscar.Enabled:=false;
          edbuscares.SetFocus;

   end
else
  begin   //para guardar
   if edbuscares.Text <> '' then begin
     if sqlrejillaaltatemp.RecordCount > 0 then begin

      if movimiento = 'E' then begin
     querys('SELECT idmovi FROM TipoMov where nombre="MOD/ENTRADA" ',0,sqlgeneral);
     idmovi:=sqlgeneral.fieldbyname('idmovi').AsString;
     querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
            'SELECT cod_cve,idajuste,cant_ord,costo,''S'','+quotedstr(idmovi)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+
            quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', "Modificacion de Ajuste de Entrada: '+edbuscar.text+'" FROM  DetAjusteInv WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
     //querys('DELETE FROM CardexArt WHERE iddoc='+quotedstr(edbuscar.Text)+' AND idmovi='+quotedstr(idmovi),1,sqlgeneral);
      //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
      //querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) - (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) - '+
      //       '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
     end else begin
           //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
     // querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) + (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) + '+
     //        '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);

     querys('SELECT idmovi FROM TipoMov where nombre="MOD/SALIDA" ',0,sqlgeneral);
     idmovi:=sqlgeneral.fieldbyname('idmovi').AsString;
     querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
            'SELECT cod_cve,idajuste,cant_ord,costo,''E'','+quotedstr(idmovi)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+
            quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', "?Modificacion de Ajuste de Salidda: '+edbuscar.text+'" FROM  DetAjusteInv WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
//     querys('DELETE FROM CardexArt WHERE iddoc='+quotedstr(edbuscar.Text)+' AND idmovi='+quotedstr(idmovi),1,sqlgeneral);
     end;
         { if movimiento = 'E' then
            begin
            querys('Select d.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on a.cod_cve = d.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
               sqlgeneral.First;
               while not sqlgeneral.Eof = true do
                 begin
                  CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat,'E', sqlgeneral.fieldbyname('cod_cve').AsString, '+', sqlgeneral.fieldbyname('cant').AsInteger);
                  sqlgeneral.Next;
                 end;
            //querys('update articulos,DetAjusteInv set articulos.existencia= articulos.existencia - DetAjusteInv.cant_ord '+
             //      'where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral)
            end else
            begin

              querys('Select a.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on  d.cod_cve = a.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
               sqlgeneral.First;
                    while not sqlgeneral.Eof = true do
                      begin
                         CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat,'N', sqlgeneral.fieldbyname('cod_cve').AsString, '-', sqlgeneral.fieldbyname('cant').AsInteger);
                         sqlgeneral.Next;
                      end;
            end;             }
//          else
//restar la existencia , ya que en la siguiente parte le actualiza el nuevo valor
     if movimiento = 'E' then
       querys('update articulos,DetAjusteInv set articulos.existencia= articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad) where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral)
     else
       querys('update articulos,DetAjusteInv set articulos.existencia= articulos.existencia + (DetAjusteInv.cant_ord*articulos.piezasxunidad) where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);

     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos del Ajuste Actual';
     btnmodificar.ImageIndex:=2;
     if edservicio.Text <>'0' then //actualiza al nuevo sid el idajuste
       querys('update servicios set idajuste='+edbuscar.Text+' where sid="'+edservicio.Text+'"',1,sqlgeneral);
     if tblajusteinvidservicio.AsString <> edservicio.Text then        //actualiza al viejo sid el idajuste a 0
       querys('update servicios set idajuste=0 where sid="'+tblajusteinvidservicio.AsString+'"',1,sqlgeneral);
     tblajusteinvmoneda.AsString:=rgmoneda.Text;
     tblajusteinvidservicio.AsString := edservicio.Text;
     tblajusteinv.fieldbyname('idconcepto_es').AsString:=edbuscares.Text;
     tblajusteinvidcliente.asstring := edcliente.text;
     tblajusteinvpiva.AsString := cbiva.text;
     frmprincipal.ucprincipal.Log('Edito el ajuste:'+tblajusteinvidajuste.AsString,2);
     querys('delete from DetAjusteInv where idajuste='+quotedstr(edbuscar.text),1,sqlgeneral);
     querys('insert into DetAjusteInv(idajuste,cod_cve,cant_ord,costo,comentarios) select idajuste,cod_cve,cant_ord,costo,comentarios from DetAjusteInvTemp where idajuste = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
      tblajusteinv.Post;
          if movimiento = 'E' then begin
            //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
            //querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) + (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) + '+
            //      '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
           { querys('Select a.costo, cant_ord as cant, d.cod_cve from DetAjusteInv as d left join articulos as a on  d.cod_cve = a.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
          sqlgeneral.First;
          while not sqlgeneral.Eof = true do
            begin
            CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat, sqlgeneral.fieldbyname('cod_cve').AsString, '+', sqlgeneral.fieldbyname('cant').AsInteger);
            sqlgeneral.Next;
            end;}
            querys('update articulos,DetAjusteInv set articulos.existencia= (articulos.existencia + DetAjusteInv.cant_ord) where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
            querys('SELECT idmovi FROM TipoMov where nombre=''AJUSTE/ENTRADA'' ',0,sqlgeneral);
            idmovi:=sqlgeneral.fieldbyname('idmovi').asstring;
            querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
                  'SELECT cod_cve,idajuste,cant_ord,costo,'+quotedstr(movimiento)+','+quotedstr(idmovi)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+
                  quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', "Ajuste de Entrada: '+edbuscar.text+'" '+
                  'FROM  DetAjusteInv WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);

        end else begin
              //////////////////actualizar el costo promedio ponderado de los articulos/////////////////////
           // querys('UPDATE articulos,DetAjusteInv SET articulos.costo=TRUNCATE( (((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) - (DetAjusteInv.costo *(DetAjusteInv.cant_ord/articulos.piezasxunidad) ) )/ ((articulos.existencia/articulos.piezasxunidad) - '+
           //        '(DetAjusteInv.cant_ord/articulos.piezasxunidad) )  ),3), articulos.UltimoCosto=DetAjusteInv.costo WHERE articulos.cod_cve=DetAjusteInv.cod_cve AND DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
           //deshabilitado 2008-05-17 no deben hacer nada si es un salida.
          { querys('Select a.costo, cant_ord as cant, d.od_cve from DetAjusteInv as d left join d.cod_cve = a.cod_cve where idajuste ='+edbuscar.text, 0, sqlgeneral);
          sqlgeneral.First;
          while not sqlgeneral.Eof = true do
            begin
            CalculaCostoPromedio(sqlgeneral.fieldbyname('costo').AsFloat, sqlgeneral.fieldbyname('cod_cve').AsString, '-', sqlgeneral.fieldbyname('cant').AsInteger);
            sqlgeneral.Next;
            end;            }

            querys('update articulos,DetAjusteInv set articulos.existencia=(articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
            querys('SELECT idmovi FROM TipoMov where nombre=''AJUSTE/SALIDA'' ',0,sqlgeneral);
            idmovi:=sqlgeneral.fieldbyname('idmovi').asstring;
            querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario, descripcion) '+
                   'SELECT cod_cve,idajuste,cant_ord,costo,'+quotedstr(movimiento)+','+quotedstr(idmovi)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+
                   quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', "Ajuste de Salida: '+edbuscar.text+'" FROM  DetAjusteInv WHERE idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
        end;
     querys('delete from DetAjusteInvTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
     dsrejilla.DataSet:=Sqlrejillaalta;
     Sqlrejillaalta.Close;
     Sqlrejillaalta.ParamByName('id').AsString:=edbuscar.Text;
     Sqlrejillaalta.Open;
     edbuscar.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     pnldatos.Enabled:=false;
     gbarticulo.Enabled:=false;
     rejilla.Enabled:=false;
     edfechaalta.Enabled := false;
     edservicio.Enabled := false;
     LimpiaDatArt;
     edbuscar.Enabled:=true;
     application.MessageBox('Ajuste Modificado con exito!','Información',mb_ok+mb_iconinformation);
     end else begin
       application.MessageBox('Mínimo necesita capturar un articulo para guardar','Atención',mb_ok);
       try
          edcodigo.SetFocus;
       except
           eddatosentrega.setfocus;
       end;
     end;

     end else begin
       application.MessageBox('No tiene concepto!','Atención',mb_ok);
       edbuscares.SetFocus;
     end;
     end;
end;
end;

procedure Tfrmotras_entradas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
 begin
  if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then
   begin
    Rejilla.enabled:=true;
    if btnalta.Caption='&Guardar' then
     begin
      querys('delete from DetAjusteInvTemp where idajuste='+quotedstr(edbuscar.text),1,sqlgeneral);
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta un Ajuste';
      btnalta.ImageIndex:=5;
      tblajusteinv.Delete;
      rgmoneda.ItemIndex:=-1;
     end;
    if btnmodificar.Caption='&Guardar' then
     begin
      //borra temporales y graba los datos anteriores en la tabla original
      querys('delete from DetAjusteInvTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
      { if movimiento = 'E' then
      querys('update articulos,DetAjusteInv set articulos.existencia= (articulos.existencia + (DetAjusteInv.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral)
      else
      querys('update articulos,DetAjusteInv set articulos.existencia= if ( (articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetAjusteInv.cant_ord*articulos.piezasxunidad)))'+
      'where articulos.cod_cve=DetAjusteInv.cod_cve and DetAjusteInv.idajuste='+quotedstr(edbuscar.Text),1,sqlgeneral);
      }
      btnmodificar.Caption:='&Editar';
      btnmodificar.hint:='Editar los datos del Ajuste';
      btnmodificar.ImageIndex:=2;
      tblajusteinv.Cancel;
     end;
   edbuscares.text:='';
   edmovc.text:='';
   lbufh.Caption := '';
   ednombrec.text:='';
   edservicio.Text := '';
   btncancelar.Hint:='Cerrar esta Pantalla';
   btncancelar.Caption:='&Cerrar';
   LimpiaDatArt;
   pnldatos.Enabled:=false;
   gbarticulo.Enabled:=false;
   rejilla.Enabled:=false;
   edbuscar.Enabled:=true;
   edbuscar.Text:='';
   edbuscar.setfocus;
   btnalta.Enabled:=TRUE;
   dsrejilla.DataSet:=Sqlrejillaalta;
   SqlRejillaAlta.Close;
   dsrejilla.DataSet:=Sqlrejillaalta;
   tblajusteinv.Active:=false;
   limpiaDatArt;
   edTipoCambio.Text:='';
   edservicio.Enabled := false;
   edfechaalta.Enabled := false;
   edservicio.Clear;
  end;//pregunta ?
 end
else
 close;
end;

procedure Tfrmotras_entradas.edcodigoButtonClick(Sender: TObject);
begin
frmbuscaart.ShowModal;
if frmbuscaart.cod_cve <> '' then
  begin
  edcodigo.Text:=frmbuscaart.cod_cve; // edcodigo.Text:=frmbusquedas.resultado;
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

procedure Tfrmotras_entradas.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
   edcantidad.Text:='1';

end;

procedure Tfrmotras_entradas.edcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then begin //if 1
     {key:=#0;
      and}
   if (edcodigo.text<>'') then begin
   if ValidaProducto(edcodigo.Text) = 1 then
      begin
          edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          btnagregar.Enabled:=true;
      end;
   end else
   edcodigo.onbuttonclick(self);

end;
  if key = #27 then
   LimpiaDatArt;


end;

procedure Tfrmotras_entradas.btnagregarClick(Sender: TObject);
begin
    InsertaArticulo(Sqlrejillaaltatemp,'DetAjusteInvTemp','idajuste',edbuscar.Text);
    LimpiaDatArt;
end;

procedure Tfrmotras_entradas.RejillaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
if ((btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar'))then
        mostrar_registros;
end;

procedure Tfrmotras_entradas.RejillaDBTableView1DblClick(Sender: TObject);
begin
if ((btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar'))then
   ModificaArticulo(SqlRejillaAltatemp,'DetAjusteInvTemp','idajuste',edbuscar.Text);
end;

procedure Tfrmotras_entradas.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if ((btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar'))then begin
if (rejilla.Enabled) and (key='+') then
    begin
      //incrementa en uno la cantidad de unidades o piezas que se halla cotizado

      if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
       begin

         if movimiento='E' then//entradas
            //querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral)
              querys('select cod_cve,if ( maximo >= (FLOOR(('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+' + existencia)/piezasxunidad)), 0, 1) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral)
         else//salidas
            //querys('select cod_cve,if ( minimo <= ((existencia/piezasxunidad) - ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') ), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
              querys('select cod_cve,if ( minimo >= (FLOOR((existencia - ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+'))/piezasxunidad) ), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
           if sqlgeneral.FieldByName('cod_cve').AsString = '' then
                if movimiento='E' then//entradas
                application.MessageBox('Se excede de existencias para ese articulo!','Información',mb_ok+mb_iconinformation)
                else
                application.MessageBox('La salida de este articulo rebasa los minimos en inventario!','Información',mb_ok+mb_iconinformation);

                querys('update DetAjusteInvTemp set cant_ord=cant_ord+1 where (idajuste='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
                operacion;
       end else begin

          if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and  (btnalta.Enabled=false) then
             begin
             if movimiento='E' then//entradas
               //querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral)
                querys('select cod_cve,if ( maximo >= (FLOOR(('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+' + existencia)/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral)
             else
               //querys('select cod_cve,if ( minimo <= ((existencia/piezasxunidad) - ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+')), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
                 querys('select cod_cve,if ( minimo <= (FLOOR((existencia - ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+'))/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
                if sqlgeneral.FieldByName('cod_cve').AsString = '' then
                     if movimiento='E' then//entradas
                     application.MessageBox('Se excede de existencias para ese articulo!','Información',mb_ok+mb_iconinformation)
                     else
                     application.MessageBox('La salida de este articulo rebasa los minimos en inventario!','Información',mb_ok+mb_iconinformation);

                     querys('update DetAjusteInvTemp set cant_ord=cant_ord+1 where (idajuste='+quotedstr(dsrejilla.DataSet.FieldValues['idajuste'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
                     operacion;

                //end;

              end;
       end;
end;

if (rejilla.Enabled) and (key='-') then
    begin
      //decrementa en uno la cantidad de unidades o piezas que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
        begin
                querys('update DetAjusteInvTemp set cant_ord=cant_ord-1 where (idajuste='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
                operacion;

        end else begin

          if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled=false) then
             begin
                  querys('update DetAjusteInvTemp set cant_ord=cant_ord-1 where (idajuste = '+quotedstr(dsrejilla.DataSet.FieldValues['idajuste'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
                  operacion;
             end;
        end;                                                                                                                                 //sleep(1000);
            //borrar los registros que no tengan valores en cantidad y piezas.........
            querys('delete from DetAjusteInvTemp where cant_ord=0 and idajuste='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgeneral);
end;

//cerrar y abrir la consulta,

      SqlRejillaAltaTemp.Close;
      SqlRejillaAltaTemp.Open;
      if SqlRejillaAltaTemp.RecordCount = 0 then begin
           rejilla.Enabled:=false;
            edsubtotal.Text:='$0';
            edtotal.Text:='$0';
      end;
end;
end;

procedure Tfrmotras_entradas.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if ((btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar'))then begin
if (key=46) and (rejilla.Enabled) then
  begin
            //elimina el registro del articulo
            querys('delete from DetAjusteInvTemp where idajuste='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
            operacion;

     //refresca la rejilla de datos
     sqlrejillaaltatemp.Close;
     sqlrejillaaltatemp.Open;
     if SqlRejillaAltatemp.RecordCount = 0 then begin
            rejilla.Enabled:=false;
      end;

  end;

if ((key=40) or (key=38) or (key=33) or (key=34)) then  //si fue un pg dowm ó flechas
mostrar_registros;
end;
end;

procedure Tfrmotras_entradas.edcantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
    end;

if (key = #27) or (key = #0) then //SI PRESIONA LA TECLA ESC.....
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;
end;

procedure Tfrmotras_entradas.edfletesExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmotras_entradas.edotrosgExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmotras_entradas.edfletesKeyPress(Sender: TObject;
  var Key: Char);
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

procedure Tfrmotras_entradas.edotrosgKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edotrosg.Text,key);
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmotras_entradas.edbuscaresButtonClick(Sender: TObject);
begin
//BUSCAR POR CATALOGO//
frmbusquedas.query:='select idconcepto_es,nombre as Nombre,if(movimiento=''E'',''ENTRADA'',''SALIDA'') as Movimiento,usuario as Usuario,fecha as Fecha,hora as hora  from ConceptoES where movimiento='+quotedstr(movimiento)+' order by idconcepto_es asc';
frmbusquedas.campo_retorno:='idconcepto_es';
frmbusquedas.campo_busqueda:='idconcepto_es';
frmbusquedas.tblorigen := 'ConceptoES';
frmbusquedas.tabla:='';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  ///////si hay un dato en la busqueda/////////
  edbuscares.Text:=frmbusquedas.resultado;
  //se realiza la busqueda para los datos necesarios
  querys('select  idconcepto_es as ID,nombre as Nombre,movimiento as Movimiento from ConceptoES where idconcepto_es='+quotedstr(edbuscares.Text),0,SqlGeneral);
  if SqlGeneral.fieldbyname('ID').AsString <> '' then
   begin
    idconcepto:=frmbusquedas.resultado;
    ednombrec.text:=SqlGeneral.fieldbyname('Nombre').AsString;
    if ednombrec.Text = 'GARANTIA SALIDA' then
     edservicio.Enabled := true
    else
     edservicio.Enabled := false;
   if SqlGeneral.fieldbyname('Movimiento').AsString ='E' THEN
    edmovc.Text:='ENTRADA'
   else
    edmovc.Text:='SALIDA';
    rgmoneda.SetFocus;
    rgmoneda.ItemIndex:=0;
    end;
   end
  else
   begin
    application.MessageBox('Ese Id de concepto no existe','Confirmación',mb_iconwarning);
    edbuscares.text:='';
   end;
end;

procedure Tfrmotras_entradas.edbuscaresChange(Sender: TObject);
begin
    if edbuscares.text = '' then
     begin
      ednombrec.text:='';
      edmovc.Text:='';
     end;
end;

procedure Tfrmotras_entradas.edbuscaresExit(Sender: TObject);
begin
if edbuscares.Text <> '' then
 begin
  querys('select  idconcepto_es as ID,nombre as Nombre,movimiento as Movimiento from ConceptoES where  movimiento='+quotedstr(movimiento)+' and idconcepto_es='+quotedstr(edbuscares.Text),0,SqlGeneral);
  if SqlGeneral.fieldbyname('ID').AsString <> '' then
   begin
   idconcepto:=frmbusquedas.resultado;
   ednombrec.text:=SqlGeneral.fieldbyname('Nombre').AsString;
   if SqlGeneral.fieldbyname('Movimiento').AsString ='E' THEN
    edmovc.Text:='ENTRADA'
   else
    edmovc.Text:='SALIDA';
   //  rgmoneda.SetFocus;
   //sacar el valor maximo de ordenes
   if btnalta.enabled= true then
    begin
     querys('select max(idajuste) as id from AjusteInv',0,sqlgeneral);
     edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
     id:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
     tblajusteinvidajuste.asstring:=id;
     sqlrejillaaltatemp.Close;
     sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
     sqlrejillaaltatemp.Open;
     //   tblajusteinv.Post;///grabar y poner en modo edición....
     //   tblajusteinv.Edit;
    end;
   gbarticulo.enabled:=true;
   //rgmoneda.SetFocus;
  end
  else
   begin
    application.MessageBox('Ese concepto no existe ó no esta bien clasificado en su tipo de movimiento!','Aviso',mb_iconwarning);
    edbuscares.SetFocus;
    edbuscares.text:='';
   end;
 end;
end;

procedure Tfrmotras_entradas.edbuscaresKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
   if (key=#13)then begin
        key:=#0;
         if edbuscares.Text <> '' then
            buscarconceptolocate
         else
            edbuscares.OnButtonClick(self);
   end;

   if key = #27 then
      begin
      key:=#0;
      edbuscares.Text:='';
      ednombrec.Text:='';
      edmovc.text:='';
   end;
end;

procedure Tfrmotras_entradas.rgmonedaNotInList(Sender: TObject);
begin
rgmoneda.itemindex:=0;
end;

procedure Tfrmotras_entradas.EdCosto_unidadKeyPress(Sender: TObject;
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

procedure Tfrmotras_entradas.edcodigoChange(Sender: TObject);
begin
if edcodigo.text = '' then
    LimpiaDatArt;
end;

procedure Tfrmotras_entradas.edcomentariosEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmotras_entradas.edcomentariosExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmotras_entradas.eddatosentregaExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmotras_entradas.eddatosentregaEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmotras_entradas.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := eddatosentrega.Font;
  if fuentes.Execute then
     eddatosentrega.SelAttributes.Assign(fuentes.Font);
end;

procedure Tfrmotras_entradas.edTipoCambioKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edTipoCambio.Text,key);
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmotras_entradas.edclienteButtonClick(Sender: TObject);
begin
frmbusquedas.query:='Select clientes.idcliente,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as Nombre,ClientesFact.rsocial AS Razon_Social,case 1 when clientes.estatus=0 ' +
                    ' then ''Inactivo'' when estatus=1 then ''Activo'' when clientes.estatus=2 then ''Por Revisar'' when clientes.estatus=3 then ''Cortesia'' when clientes.estatus=4 then ''Moroso'' when clientes.estatus=5 then ' +
                    ' ''Cancelado'' when clientes.estatus = 6 then ''Libre'' end as Estatus,clientes.bloqueado as Bloqueado,clientes.TipoCont,concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','',clientes.estado) as Direccion,' +
                    'clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact order by idcliente';
frmbusquedas.campo_retorno:='idcliente';
frmbusquedas.campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
frmbusquedas.tblorigen := 'clientes';
frmbusquedas.tabla:='clientes';
frmbusquedas.cbofiltro.ItemIndex:=1;
frmbusquedas.cbofiltro.OnClick(self);
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
  edcliente.Text:=frmbusquedas.resultado;
end;

procedure Tfrmotras_entradas.edclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if key=#13 then
   begin
    key:=#0;
    if edcliente.Text <> '' then
     begin
      querys('select idcliente from clientes where idcliente='+edcliente.Text,0,sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
       edcliente.Text := sqlgeneral.fieldbyname('idcliente').AsString
      else
       application.MessageBox('El numero de cliente tecleado no existe, verifique y vuelva a intentarlo','Aviso',mb_iconinformation);
     end
    else
     edcliente.OnButtonClick(self);
  end;
  if key = #27 then
   begin
    key:=#0;
    edcliente.Text:='';
   end;
end;

procedure Tfrmotras_entradas.edclienteExit(Sender: TObject);
begin
chtecla:=#13;
edcliente.OnKeyPress(self,chtecla);
end;

procedure Tfrmotras_entradas.edservicioButtonClick(Sender: TObject);
var forma:TfrmBuscarServ;
begin
idClienteGral := '';
idServicioGral := '';
forma := TfrmBuscarServ.Create(self);
forma.inicializa('0','Ajuste',false);
forma.FormStyle := fsnormal;
forma.Showmodal;
if idServicioGral <> '' then
 begin
  querys('select idajuste from AjusteInv where idservicio='+idServicioGral+' and idajuste<>'+edbuscar.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    edservicio.Text :='';
    application.MessageBox('Ese Numero de servicios ya ha sido asignado a otro ajuste de inventario','Aviso',mb_iconinformation);
   end
  else
   begin
    edservicio.Text := idServicioGral;
    querys('select idcliente from servicios where sid='+edservicio.Text,0,sqlgeneral);
    edcliente.Text := sqlgeneral.fieldbyname('idcliente').AsString;
   end;
 end;
end;

procedure Tfrmotras_entradas.edservicioKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
end;

procedure Tfrmotras_entradas.edservicioExit(Sender: TObject);
begin
if edservicio.Text <> '' then
 begin
  querys('select sid,idcliente from servicios where sid='+edservicio.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    edservicio.text:='0';
    edcliente.Text := '0';
   end
  else
   edcliente.Text := sqlgeneral.fieldbyname('idcliente').AsString;
 end
else
 begin
  edservicio.Text := '0';
  edcliente.Text := '0';
 end;
end;

procedure Tfrmotras_entradas.RzBitBtn1Click(Sender: TObject);
begin
//trae el encabezado
querys('SELECT servicios.sid,servicios.idcliente,if(clientes.rsocial is NULL or clientes.rsocial = '''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno = '''', '+
       ' concat(clientes.nombre,'''', clientes.apaterno),concat(clientes.nombre,'''',clientes.apaterno,'' '', clientes.amaterno))),clientes.rsocial) AS cliente,servicios.FechaFinSys,servicios.idajuste,servicios.CodTecnico, servicios.problema,'+
       ' servicios.trab_realizado,AjusteInv.TipoCambio FROM AjusteInv INNER JOIN servicios ON (AjusteInv.idajuste = servicios.idajuste) INNER JOIN clientes ON (servicios.idcliente = clientes.idcliente) WHERE servicios.idcliente = '+edcliente.Text+
       ' AND (servicios.FechaFinSys BETWEEN "'+datetostr(Encodedate(yearof(today), monthof(today), 1))+'" AND "'+datetostr(Encodedate(yearof(today), monthof(today), dayof(today)))+'")',0,dmreportes.sqlgeneral);
//trae el detalle
{querys('SELECT AjusteInv.SubTotal,AjusteInv.iva,AjusteInv.total,AjusteInv.totalmn,AjusteInv.TotalProductos,DetAjusteInv.cod_cve,DetAjusteInv.cant_ord,DetAjusteInv.costo,(DetAjusteInv.costo*  `DetAjusteInv`.`cant_ord`) as TotalArt,'+
       ' articulos.nombre FROM AjusteInv INNER JOIN DetAjusteInv ON (AjusteInv.idajuste = DetAjusteInv.idajuste) INNER JOIN articulos ON (DetAjusteInv.cod_cve = articulos.cod_cve) WHERE AjusteInv.idajuste ='+dmreportes.sqlgeneral.fieldbyname('idajuste').AsString,0,dmreportes.sqlgeneral2);}
querys('SELECT AjusteInv.SubTotal,AjusteInv.SubTotal*'+cbiva.Text+' as iva,AjusteInv.total*'+floattostr(1+strtofloat(cbiva.Text))+' as total,AjusteInv.totalmn*'+floattostr(1+strtofloat(cbiva.Text))+' as totalmn,AjusteInv.TotalProductos,DetAjusteInv.cod_cve,DetAjusteInv.cant_ord,DetAjusteInv.costo,(DetAjusteInv.costo*DetAjusteInv.cant_ord) '+
       ' as TotalArt,articulos.nombre FROM AjusteInv INNER JOIN DetAjusteInv ON (AjusteInv.idajuste = DetAjusteInv.idajuste) INNER JOIN articulos ON (DetAjusteInv.cod_cve = articulos.cod_cve) WHERE AjusteInv.idajuste ='+dmreportes.sqlgeneral.fieldbyname('idajuste').AsString,0,dmreportes.sqlgeneral2);
OperacionReporte('ServiciosCliente','','IMP', 1);
end;

procedure Tfrmotras_entradas.FormShow(Sender: TObject);
begin
CargaCombo2('SELECT valor, concepto from configuraciones where concepto in ("IVA", "IVA2") order by concepto','valor', 'concepto',cbiva);
cbiva.itemindex := 0;
end;

procedure Tfrmotras_entradas.cbivaExit(Sender: TObject);
begin
operacion;
end;

procedure Tfrmotras_entradas.ActualizaXMoneda;
var tabla :string;
begin
if moneda = rgmoneda.text then
  exit;
if dsrejilla.DataSet = sqlrejillaalta then
  tabla := 'DetAjusteInv'
else
  tabla := 'DetAjusteInvTemp';
if dsrejilla.DataSet.RecordCount > 0 then
  begin
  if rgmoneda.Text = 'D' then //Pesos a Dolares
    querys('Update '+tabla+' as d set costo = round(costo/'+edTipoCambio.text+',2) where d.idajuste='+edbuscar.text, 1, sqlgeneral)
  else
    querys('Update '+tabla+' as d set costo = round(costo*'+edTipoCambio.text+',2) where d.idajuste='+edbuscar.text, 1, sqlgeneral);
  dsrejilla.DataSet.Close;
  dsrejilla.DataSet.Open;
  end;
operacion;
end;

end.
