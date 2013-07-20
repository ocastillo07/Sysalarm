{///////////////////////////////////////////////////////////////////////////////
2008/09/26 dalyla que se borre el archivo al cerrar del envio
2008/06/24 dalyla cambios por inventario
2008/06/23 dalyla no disminuir si rebasa el requerido
2008/05/28 dalyla articulos.status como integer
}///////////////////////////////////////////////////////////////////////////////
unit UOrdenCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAccess, DB, MemDS, DBAccess, StdCtrls, RzLabel, Mask, RzEdit,
  RzDBEdit, ExtCtrls, RzBtnEdt, DBCtrls, RzDBCmbo, RzPanel, RzRadGrp,
  RzDBRGrp, cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxDBEdit, RzButton, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  RzCmboBx, RzDBNav, Buttons, ComCtrls, ToolWin, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDCustomCheckListDlg,
  LMDCheckListDlg, RzDTP, RzDBDTP, DateUtils;

type
  TfrmOrdenCompra = class(TForm)
    gbdatos: TGroupBox;
    SqlGeneral: TMyQuery;
    DSOrdenes: TDataSource;
    tblOrdenes: TMyTable;
    pnldatos: TPanel;
    RzLabel2: TRzLabel;
    Sqlproveedores: TMyQuery;
    DSProveedores: TDataSource;
    RzLabel5: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    dbiva: TcxGridDBColumn;
    descuento: TcxGridDBColumn;
    aplica_desc: TcxGridDBColumn;
    precio_costo: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    dentrega: TRzDBDateTimeEdit;
    dvigencia: TRzDBDateTimeEdit;
    RzLabel11: TRzLabel;
    gbarticulo: TGroupBox;
    RzLabel13: TRzLabel;
    lblproducto: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    Label1: TLabel;
    edcantidad: TRzNumericEdit;
    btnagregar: TRzBitBtn;
    edDescripcion: TRzEdit;
    EdCosto_unidad: TRzEdit;
    ediva_art: TRzEdit;
    edcodigo: TRzButtonEdit;
    RzLabel16: TRzLabel;
    Sqlrejillaalta: TMyQuery;
    DsRejilla: TDataSource;
    subtotal: TcxGridDBColumn;
    cant_surt: TcxGridDBColumn;
    Label2: TLabel;
    comentarios: TcxGridDBColumn;
    RzLabel19: TRzLabel;
    edcant_sur: TRzNumericEdit;
    edcomentarios: TRzMemo;
    RzLabel20: TRzLabel;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    edbuscar: TRzButtonEdit;
    RzLabel3: TRzLabel;
    edHoraOrd: TRzDBEdit;
    RzLabel4: TRzLabel;
    edFechaOrd1: TRzDBEdit;
    RzLabel17: TRzLabel;
    spbarticulos: TSpeedButton;
    edbuscarprov: TRzButtonEdit;
    edprov: TRzEdit;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    edultcompra: TRzEdit;
    RzLabel25: TRzLabel;
    edmin: TRzEdit;
    edmax: TRzEdit;
    RzLabel24: TRzLabel;
    edestatus: TRzComboBox;
    RzLabel26: TRzLabel;
    edexist: TRzEdit;
    sqlrejillaaltatemp: TMyQuery;
    gbtotales: TGroupBox;
    RzLabel9: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel21: TRzLabel;
    edtp: TRzDBNumericEdit;
    edfletes: TcxDBCurrencyEdit;
    edotrosg: TcxDBCurrencyEdit;
    RzLabel10: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel8: TRzLabel;
    edsubtotal: TRzDBNumericEdit;
    ediva: TRzDBNumericEdit;
    edtotal: TRzDBNumericEdit;
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
    edpieza: TRzEdit;
    RzLabel27: TRzLabel;
    edFechaOrd: TRzDBDateTimePicker;
    btnimprimir: TRzBitBtn;
    tblOrdenesidorden: TIntegerField;
    tblOrdenesidproveedor: TIntegerField;
    tblOrdenesFechaOrden: TDateField;
    tblOrdenesHoraOrden: TTimeField;
    tblOrdenesFechaEntrega: TDateField;
    tblOrdenesFechaVigencia: TDateField;
    tblOrdenesTipoCambio: TFloatField;
    tblOrdenesmoneda: TStringField;
    tblOrdenessubtotal: TFloatField;
    tblOrdenesiva: TFloatField;
    tblOrdenestotal: TFloatField;
    tblOrdenesestatus: TStringField;
    tblOrdenesfletes: TFloatField;
    tblOrdenesotros: TFloatField;
    tblOrdenesDatosEntrega: TMemoField;
    tblOrdenesTotalProductos: TIntegerField;
    tblOrdenesusuario: TStringField;
    tblOrdenesfecha: TStringField;
    tblOrdeneshora: TStringField;
    tblOrdenesUsuarioUltMod: TStringField;
    tblOrdenesFechaUltMod: TStringField;
    tblOrdenesHoraUltMod: TStringField;
    cbiva: TRzComboBox;
    RzLabel36: TRzLabel;
    tblOrdenespiva: TFloatField;
    lexcede: TRzLabel;
    btnenviar: TRzBitBtn;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure cboproveedorKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTipoCambioKeyPress(Sender: TObject; var Key: Char);
    procedure edfleteKeyPress(Sender: TObject; var Key: Char);
    procedure edcomentariosKeyPress(Sender: TObject; var Key: Char);
    procedure rgmonedaChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure spproveedoresClick(Sender: TObject);
    procedure spbarticulosClick(Sender: TObject);
    procedure dvigenciaEnter(Sender: TObject);
    procedure dentregaEnter(Sender: TObject);
    procedure edfletesKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarprovButtonClick(Sender: TObject);
    procedure edbuscarprovKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarprovExit(Sender: TObject);
    procedure rgmonedaExit(Sender: TObject);
    procedure edestatusKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarprovChange(Sender: TObject);
    procedure edestatusExit(Sender: TObject);
    procedure rgmonedaKeyPress(Sender: TObject; var Key: Char);
    procedure edTipoCambioExit(Sender: TObject);
    procedure rgmonedaEnter(Sender: TObject);
    procedure edestatusEnter(Sender: TObject);
    procedure edfletesExit(Sender: TObject);
    procedure edotrosgExit(Sender: TObject);
    procedure edestatusNotInList(Sender: TObject);
    procedure rgmonedaNotInList(Sender: TObject);
    procedure edcodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edcomentariosEnter(Sender: TObject);
    procedure edcomentariosExit(Sender: TObject);
    procedure eddatosentregaEnter(Sender: TObject);
    procedure eddatosentregaExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure mmdescripcionEnter(Sender: TObject);
    procedure mmdescripcionExit(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure cbivaExit(Sender: TObject);
    procedure SqlrejillaaltaAfterScroll(DataSet: TDataSet);
    procedure sqlrejillaaltatempAfterScroll(DataSet: TDataSet);
    procedure btnenviarClick(Sender: TObject);

  private
    { Private declarations }
    moneda :string;
    procedure mostrar_registros;
    procedure buscarlocate;
    procedure buscarprovlocate;
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure operacion;
    procedure LimpiaDatArt;
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure ActualizaXMoneda;
    procedure imprimir;

    function ValidaProducto(CodCve:string):integer;
  public
    { Public declarations }
    idprov:string;
    pedido:integer;
  end;

var
  frmOrdenCompra: TfrmOrdenCompra;

implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas, UBuscaArt, Uproveedores,
  Uarticulos, Urelacionborrar, Udmrep, Umoduloreportes;

{$R *.dfm}
procedure TfrmOrdenCompra.mostrar_registros;
begin
  edultcompra.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('ultima_compra').AsString;
  edmin.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('minimo').AsString;
  edmax.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('maximo').AsString;
  edexist.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('existencia').AsString;
  edDescripcion.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('nombre').AsString;
  EdCosto_unidad.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('costo').AsString;
  edcodigo.Text := RejillaDBTableView1.DataController.DataSet.fieldbyname('cod_cve').AsString;
end;

procedure TfrmOrdenCompra.buscarprovlocate;
var hija:tfrmproveedores;
begin
if querys('select idprov,'+clienteNombre('proveedores')+' as nombre,estatus from proveedores where idprov="'+edbuscarprov.Text+'"',0,SqlGeneral) = 0 then
  begin
  if application.MessageBox('No existe ese Proveedor!, deseas darlo de alta','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
    frmprincipal.ucprincipal.Log('Acceso a la Pantalla de Proveedores',1);
    hija:=tfrmproveedores.Create(self);
    hija.Show;
    end;
  edbuscarprov.Text:='';
  edprov.text:='';
  end
else
  begin
  if SqlGeneral.fieldbyname('estatus').AsBoolean = true  then
    begin
    idprov:=SqlGeneral.fieldbyname('idprov').AsString;
    edbuscarprov.text:=SqlGeneral.fieldbyname('idprov').AsString;
    edprov.text:=SqlGeneral.fieldbyname('nombre').AsString;
    if pnldatos.enabled = true then
      edestatus.SetFocus;
    end
  else
    begin
    application.MessageBox('Ese proveedor no esta Activo','Confirmación',mb_iconwarning);
    edbuscarprov.Text:='';
    end;
  end;
end;


procedure TfrmOrdenCompra.buscarlocate;
begin
tblOrdenes.Active:=true;
if tblOrdenes.Locate('idorden',edbuscar.Text,[]) then
   begin
    edTipoCambio.Text:=tblOrdenes.fieldbyname('TipoCambio').AsString;
    rgmoneda.Text:=tblOrdenes.fieldbyname('moneda').AsString;
    idprov:=tblOrdenes.fieldbyname('idproveedor').AsString;
    edestatus.Text:=tblOrdenes.fieldbyname('estatus').AsString;
    cbiva.text := tblOrdenes.fieldbyname('piva').AsString;
    lbufh.Caption := UFH(tblOrdenes);
    edbuscarprov.Text:=idprov;
    buscarprovlocate;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    SqlRejillaAlta.Close;
    SqlRejillaAlta.ParamByName('id').AsString:=edbuscar.text;
    SqlRejillaAlta.ParamByName('iva').AsString:=cbiva.text;
    SqlRejillaAlta.Open;
    IF tblOrdenes.fieldbyname('estatus').AsString  = 'CANCELADA' THEN
      estatus.Caption:=tblOrdenes.fieldbyname('estatus').AsString
    ELSE
      estatus.caption:='';
    btnimprimir.enabled:=true;
    btnenviar.Enabled := true;
   end
else
  begin
    estatus.Caption:='';
    edestatus.Text:='';
    edbuscarprov.Text:='';
    edprov.text:='';
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Orden de Compra no Existe','Información',mb_ok+mb_iconinformation);
    tblOrdenes.Active:=false;
    SqlRejillaAlta.Close;
    edbuscar.Text:='';
    rgmoneda.ItemIndex:=-1;
    edbuscar.SetFocus;
  end;
end;


procedure TfrmOrdenCompra.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
if dsrejilla.DataSet.RecordCount > 0 then
  begin
  mostrar_registros;

  query.Close;
  query.ParamByName('id').asstring:=valor;
  query.ParamByName('iva').AsString:=cbiva.text;
  query.Open;

  dsrejilla.DataSet:=query;
  btnagregar.Enabled:=true;
  edcodigo.Enabled:=false;
  edcantidad.Enabled:=true;
  EdCosto_unidad.Enabled:=true;
  edcantidad.SetFocus;
  operacion;
  end;
end;


procedure TfrmOrdenCompra.operacion;
  var id:string;
begin
id:=edbuscar.text;
querys('Select TRUNCATE(SUM(d.cant_ord * d.costo),3) as SUBTOTAL, '+
       'TRUNCATE(SUM((d.cant_ord * d.costo)*'+cbiva.text+'),2) as IVA,'+
       'TRUNCATE(SUM(d.cant_ord * d.costo)*'+floattostr(1+strtofloat(cbiva.text))+',2) as TOTAL, '+
       'SUM(d.cant_ord) as TotalProductos From DetOrdenTemp as d inner join articulos as a on d.cod_cve=a.cod_cve '+
       'WHERE d.idorden='+id+' and idmaq="'+frmprincipal.idmaq+'" Order By d.cod_cve', 0, SqlGeneral);

    edtp.text:=inttostr(SqlGeneral.fieldbyname('TotalProductos').AsInteger);
    edsubtotal.Text:='$'+floattostr(SqlGeneral.fieldbyname('SUBTOTAL').AsFloat);
    ediva.Text:='$'+floattostr(SqlGeneral.fieldbyname('IVA').AsFloat);
    edtotal.Text:='$'+floattostr((edfletes.value + edotrosg.value) + (SqlGeneral.fieldbyname('TOTAL').AsFloat));
end;


procedure TfrmOrdenCompra.InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
  if rejilla.Enabled = false then
     rejilla.Enabled:=true;

  //verifica que no exista el articulo en la lista
  //insercion para unidades.
  if querys('select * from '+tabla+' where '+campo+'='+quotedstr(valor)+' and cod_cve="'+edcodigo.Text+
            '" and idmaq='+frmprincipal.idmaq,0,SqlGeneral) = 0 then
     begin
     querys('select cod_cve,if ( maximo >= '+quotedstr(edcantidad.Text)+' + (existencia/piezasxunidad), 1, 0) as condicion, moneda '+
            ' from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,sqlgeneral);

     if sqlgeneral.FieldByName('cod_cve').AsString = '' then
       lexcede.Visible := true;
        //application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
     //inserta los datos del articulo en art_compuestos
     querys('insert into '+tabla+'(cant_ord,cod_cve,'+campo+',costo,comentarios,cant_sur,idmaq) values ('+
            edcantidad.Text+',"'+edcodigo.Text+'", "'+valor+'",'+quotedstr(EdCosto_unidad.Text)+','+
            quotedstr(edcomentarios.Text)+','+quotedstr(edcant_sur.Text)+','+quotedstr(frmprincipal.idmaq)+')',1,SqlGeneral);
     end
  else
     begin
     //solo actualiza las existencias en caso de ya estar en la tabla
     querys('select cod_cve,if ( maximo >= (('+sqlgeneral.fieldbyname('cant_ord').asstring+' + '+edcantidad.text+
            ') + (existencia/piezasxunidad)), 1, 0) as condicion, moneda '+
            'from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',0,dmaccesos.sqlgeneral);
     if dmaccesos.sqlgeneral.FieldByName('cod_cve').AsString = '' then
       lexcede.Visible := true;
        //application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
     querys('update '+tabla+' set cant_ord=cant_ord+'+quotedstr(edcantidad.Text)+',costo='+quotedstr(EdCosto_unidad.Text)+',comentarios='+quotedstr(edcomentarios.Text)+'  where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
     end;

  //SACAR LOS COSTOS Y LOS TIEMPOS
  //mostrar los articulos del paquete en la rejilla.......
  operacion;
  rejilla.Enabled:=true;
  query.Close;
  query.ParamByName('id').AsString:=valor;
  query.ParamByName('iva').AsString:=cbiva.text;
  query.Open;
  query.Locate('cod_cve', edcodigo.Text, []);
  LimpiaDatArt;
end;

procedure TfrmOrdenCompra.LimpiaDatArt;
begin
  //limpia los campos
  edexist.Text:='';
  edmin.Text:='';
  edmax.Text:='';
  edultcompra.Text:='';
  btnagregar.Enabled:=false;
  edcantidad.Text:='1';
  edcantidad.Enabled:=false;
  EdCosto_unidad.Enabled:=false;
  edcosto_unidad.Text:='';
  edDescripcion.Text:='';
  edCodigo.Text:='';
  edcodigo.Enabled:=true;
  ediva_art.Text:='';
  edcant_sur.text:='';
  edcomentarios.text:='';
  if (btncancelar.Caption ='&Cancelar') then
     edcodigo.SetFocus;
end;


function TfrmOrdenCompra.ValidaProducto(CodCve:string):integer;
var cost:double;
begin
//aqui busca el articulo por codigo de barras o por clave
if querys('SELECT cod_cve,nombre,costo,iva,minimo,maximo,moneda, ultima_compra,FLOOR(existencia/piezasxunidad) '+
          'as existencia,MOD(existencia,piezasxunidad) as piezas, status FROM articulos WHERE cod_cve="'+edcodigo.Text+
          '" AND paquete=0 and servicio=0 ORDER BY nombre ASC',0,SqlGeneral) = 0 then
  begin
   application.MessageBox('No existe ningun Articulo con esa Clave!','Atencion',mb_IConInformation);
  //frmprincipal.muestra_mdichild(535,759,tfrmarticulos,'Acceso la Pantalla de tipos de Articulos');
  //end;
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
    edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
    // ediva_art.Text:=SqlGeneral.fieldbyname('iva').AsString;
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


procedure TfrmOrdenCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FileExists(uprincipal.my_path+'ComprasImpresion'+frmprincipal.idmaq+'.pdf') then
  DeleteFile(uprincipal.my_path+'ComprasImpresion'+frmprincipal.idmaq+'.pdf');
action:=cafree;
end;

procedure TfrmOrdenCompra.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
   estatus.Caption:='';
   lbufh.Caption := '';
  //pone la tabla de Ordenes de Compra en modo de insercion
   tblordenes.Active:=true;
   tblordenes.insert;
   pnldatos.Enabled:=true;
   if pedido = 0 then begin
   querys('select max(idorden) as idorden from Ordenes',0,sqlgeneral);
   edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
   querys('delete from DetOrdenTemp where idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
   end;
   CargaCombo2('SELECT valor, concepto from configuraciones where concepto in ("IVA", "IVA2") order by concepto','valor', 'concepto',cbiva);
  cbiva.itemindex := 0;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edFechaOrd.date:=FechaServidor;
   sqlrejillaalta.close;
   dsrejilla.DataSet:=Sqlrejillaaltatemp;
   sqlrejillaaltatemp.Close;
   sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
   SqlRejillaAltatemp.ParamByName('iva').AsString:=cbiva.text;
   SqlRejillaAltaTemp.Open;
   dvigencia.date:=now;
   dentrega.date:=now;
   edbuscar.Enabled:=false;
   edFechaOrd.Enabled:=true;
   edbuscarprov.Enabled:=true;
   edbuscarprov.Text:='';
   edprov.Text:='';
   edestatus.itemindex:=0;
   rgmoneda.ItemIndex:=0;
   edbuscarprov.setfocus;
   gbarticulo.Enabled:=true;

   end
   else
   begin

   if sqlrejillaaltatemp.RecordCount > 0 then begin
    if edbuscarprov.Text <> '' then begin

         pnldatos.Enabled:=false;
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta una Orden de Compra';
         btncancelar.Caption:='&Cerrar';
         btncancelar.Hint:='Cerrar esta Ventana';
         btnalta.ImageIndex:=5;
         btnborrar.Enabled:=true;
         btnmodificar.Enabled:=true;
         querys('select max(idorden) as idorden from Ordenes',0,sqlgeneral);
         edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
         tblordenesidorden.asstring:=edbuscar.text;
         frmprincipal.ucprincipal.Log('Dio de Alta la Orden de Compra:'+edbuscar.text,1);
         tblordenesFechaOrden.AsDateTime:=edfechaord.date;
         tblordenesHoraOrden.AsDateTime:=HoraServidor;
         tblordenesusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
         tblOrdenes.fieldbyname('estatus').AsString:=edestatus.Text;
         tblOrdenes.fieldbyname('fecha').AsString:=datetostr(date);
         tblOrdenes.fieldbyname('hora').AsString:=timetostr(time);
         tblordenesUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
         tblOrdenes.fieldbyname('estatus').AsString:=edestatus.Text;
         tblOrdenes.fieldbyname('FechaUltMod').AsString:=datetostr(date);
         tblOrdenes.fieldbyname('HoraUltMod').AsString:=timetostr(time);
         tblOrdenes.fieldbyname('TipoCambio').AsString := edTipoCambio.Text;
         tblOrdenes.fieldbyname('moneda').AsString:=rgmoneda.Text;
         tblordenes.FieldByName('idproveedor').AsString:=idprov;
         tblordenes.FieldByName('piva').AsString:=cbiva.text;
         tblordenes.Post;///grabar y poner en modo edición....
         LimpiaDatArt;
         ///actualizar articulos
         querys('UPDATE DetOrdenTemp SET  idorden ='+quotedstr(edbuscar.Text)+' WHERE idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
         querys('insert into DetOrden(idorden,cod_cve,cant_ord,costo,comentarios) select idorden,cod_cve,cant_ord,costo,comentarios from DetOrdenTemp where idorden = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
         querys('update articulos,DetOrden set articulos.ordenados = ((DetOrden.cant_ord*articulos.piezasxunidad) + articulos.ordenados) '+
                'where articulos.cod_cve=DetOrden.cod_cve and DetOrden.idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
         //backorder
         querys('update articulos a, (Select sum(cantidad) as cantidad, cod_cve from requisiciones where idorden = '+edbuscar.text+
                ' group by cod_cve) as r set backorder = (backorder -  r.cantidad) where r.cod_cve = a.cod_cve',1,sqlgeneral);
         //borrar temporales......
         querys('delete from DetOrdenTemp where idmaq='+quotedstr(frmprincipal.idmaq)+' and idorden='+quotedstr(edbuscar.Text),1,SqlGeneral);
         edbuscar.Enabled:=true;
         application.MessageBox('Orden de compra registrada','Información',mb_iconInformation);
         dsrejilla.DataSet:=Sqlrejillaalta;
         Sqlrejillaalta.Close;
         Sqlrejillaalta.ParamByName('id').AsString:=edbuscar.Text;
         SqlRejillaAlta.ParamByName('iva').AsString:=cbiva.text;
         Sqlrejillaalta.Open;
         edFechaOrd.Enabled:=false;
         pedido:=0;

  end else begin
         application.MessageBox('Falta el proveedor!','Atención',mb_ok);
         edbuscarprov.SetFocus;
   end;


   end else begin
         application.MessageBox('Mínimo necesita capturar un articulo para guardar!','Atención',mb_ok);
         edcodigo.SetFocus;
   end;
   end;

end;


procedure TfrmOrdenCompra.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmOrdenCompra.edbuscarKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmOrdenCompra.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select * From Ordenes order by FechaOrden,HoraOrden asc';
      frmbusquedas.campo_retorno:='idorden';
      frmbusquedas.campo_busqueda:='idorden';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'Ordenes';
      //frmbusquedas.lbldesc.Caption:='Buscar por idorden';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblordenes.Active:=true;
             edbuscar.Text:=frmbusquedas.resultado;
             buscarlocate;

            end;
    end;
end;

procedure TfrmOrdenCompra.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin

    if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then begin

         if btnalta.Caption='&Guardar' then
            begin
              querys('UPDATE requisiciones SET estatus=0,idorden=0 WHERE idorden='+quotedstr(edbuscar.Text),1,sqlgeneral);
              querys('DELETE FROM DetOrdenTemp WHERE idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
              btnalta.Caption:='&Alta';
              btnalta.Hint:='Dar de Alta una Orden de Compra';
              btnalta.ImageIndex:=5;
              tblordenes.delete;
              rgmoneda.ItemIndex:=-1;
              pedido:=0;
              edTipoCambio.Text:='';
            end;


        if btnmodificar.Caption='&Guardar' then
           begin               
             querys('delete from DetOrdenTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
             btnmodificar.Caption:='&Editar';
             btnmodificar.hint:='Editar los datos de la Orden Actual';
             btnmodificar.ImageIndex:=2;
             tblordenes.Cancel;
        end;

             lbufh.Caption := '';
             edestatus.text:='';
             btncancelar.Hint:='Cerrar esta Pantalla';
             btncancelar.Caption:='&Cerrar';
             LimpiaDatArt;
             pnldatos.Enabled:=false;
             gbarticulo.Enabled:=false;
             rejilla.Enabled:=false;
             edbuscar.Enabled:=true;
             edbuscar.Text:='';
             edbuscar.setfocus;
             edbuscarprov.enabled:=true;
             edbuscarprov.Text:='';
             edprov.Text:='';
             btnalta.Enabled:=TRUE;
             dsrejilla.DataSet:=Sqlrejillaalta;
             SqlRejillaAlta.Close;
             dsrejilla.DataSet:=Sqlrejillaalta;
             edFechaOrd.Enabled:=false;
             tblOrdenes.Active:=false;

    end;//pregunta ?

   lexcede.Visible := false;
end
else
 close;
end;

procedure TfrmOrdenCompra.edcodigoButtonClick(Sender: TObject);
begin

   frmbuscaart.ShowModal;
     if frmbuscaart.cod_cve <> '' then
        begin
           edcodigo.Text:=frmbuscaart.cod_cve; // edcodigo.Text:=frmbusquedas.resultado;

           if ValidaProducto(edcodigo.text) = 1 then
             begin
              edcantidad.Enabled:=true;
              EdCosto_unidad.Enabled:=true;
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

procedure TfrmOrdenCompra.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
   edcantidad.Text:='1';

end;

procedure TfrmOrdenCompra.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13)  then begin
  if (edcodigo.text<>'') then begin
   if ValidaProducto(edcodigo.Text) = 1 then
      begin
          edcantidad.Enabled:=true;
          EdCosto_unidad.Enabled:=true;
          edcantidad.SetFocus;
          btnagregar.Enabled:=true;
      end;
   end else
     edcodigo.OnButtonClick(self);
  end;

  if key = #27 then
   LimpiaDatArt;
end;


procedure TfrmOrdenCompra.cboproveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     rgmoneda.setfocus;
  end;
end;

procedure TfrmOrdenCompra.edcantidadKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmOrdenCompra.btnagregarClick(Sender: TObject);
begin
    InsertaArticulo(sqlrejillaaltatemp,'DetOrdenTemp','idorden',edbuscar.Text);
    LimpiaDatArt;
end;

procedure TfrmOrdenCompra.btnmodificarClick(Sender: TObject);
begin
if ((tblOrdenes.fieldbyname('estatus').AsString ='CANCELADA') OR (tblOrdenes.fieldbyname('estatus').AsString ='ACEPTADA') OR  (tblOrdenes.fieldbyname('estatus').AsString ='SURTIDO') OR  (tblOrdenes.fieldbyname('estatus').AsString ='FACTURANDO')) then
                 application.MessageBox('Por el estatus de esta orden ya no puede ser modificada ?','Confirmación',mb_iconwarning)
else begin

if btnmodificar.Caption = '&Editar' then
   begin

   querys('select idorden from DetCompras where idorden='+edbuscar.Text,0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then begin
          querys('delete from DetOrdenTemp where idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
          idprov:=edbuscar.Text;
          frmprincipal.ucprincipal.Log('Dio click en el boton editar de Ordenes de Compra',0);
          btncancelar.Caption:='&Cancelar';
          btncancelar.Hint:='Cancelar la Edición';
          btnmodificar.Caption:='&Guardar';
          btnmodificar.hint:='Guardar los Cambios Realizados';
          btnmodificar.ImageIndex:=1;
          btnalta.Enabled:=false;
          btnborrar.Enabled:=false;
          edbuscar.Enabled:=false;
          pnldatos.Enabled:=true;
          edFechaOrd.Enabled:=true;
          gbarticulo.Enabled:=true;
          tblordenes.Edit;
          edbuscar.Enabled:=false;
          rejilla.Enabled:=true;
          sqlrejillaalta.close;
          querys('insert into DetOrdenTemp(idorden,cod_cve,cant_ord,cant_sur,costo,comentarios,idmaq) select idorden,cod_cve,cant_ord,cant_sur,costo,comentarios,'+quotedstr(frmprincipal.idmaq)+' from DetOrden where idorden = '+quotedstr(edbuscar.Text),1,SqlGeneral);
          dsrejilla.DataSet:=Sqlrejillaaltatemp;
          sqlrejillaaltatemp.Close;
          sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
          SqlRejillaAltatemp.ParamByName('iva').AsString:=cbiva.text;
          sqlRejillaAltatemp.open;
          edestatus.SetFocus;
          edbuscar.Enabled:=false;
          edbuscarprov.Enabled:=false;

   end else
          application.MessageBox('No puedes Modificar esta orden, existe una compra utilizando esta orden?','Confirmación',mb_iconwarning);

   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos de la Orden de Compra Actual';
     btnmodificar.ImageIndex:=2;
     frmprincipal.ucprincipal.Log('Edito la orden de compra:'+tblordenesidorden.AsString,2);
     tblOrdenes.fieldbyname('estatus').AsString:=edestatus.Text;
     tblOrdenes.fieldbyname('moneda').AsString:=rgmoneda.Text;
     tblordenes.FieldByName('piva').AsString:=cbiva.text;
     //modificar el campo ordenados de articulos y insertar las modificaciones de ordenes
     querys('update articulos,DetOrden set articulos.ordenados=if ((articulos.ordenados - (DetOrden.cant_ord*articulos.piezasxunidad))<= 0,0,articulos.ordenados - (DetOrden.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetOrden.cod_cve and' +
            ' DetOrden.idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
            
     querys('delete from DetOrden where idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
     querys('insert into DetOrden(idorden,cod_cve,cant_ord,costo,comentarios) select idorden,cod_cve,cant_ord,costo,comentarios from DetOrdenTemp where idorden = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
     querys('update articulos,DetOrden set articulos.ordenados=(articulos.ordenados + (DetOrden.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetOrden.cod_cve and DetOrden.idorden='+quotedstr(edbuscar.text),1,sqlgeneral);
     tblordenes.Post;
     querys('delete from DetOrdenTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
     dsrejilla.DataSet:=Sqlrejillaalta;
     Sqlrejillaalta.Close;
     Sqlrejillaalta.ParamByName('id').AsString:=edbuscar.Text;
     SqlRejillaAlta.ParamByName('iva').AsString:=cbiva.text;
     Sqlrejillaalta.Open;
     edbuscar.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     pnldatos.Enabled:=false;
     gbarticulo.Enabled:=false;
     rejilla.Enabled:=false;
     edFechaOrd.Enabled:=false;
     LimpiaDatArt;
     edbuscar.Enabled:=true;
     edbuscarprov.Enabled:=true;
     application.MessageBox('Orden de Compra Modificada!','Información',mb_iconinformation);
     end;

  end;
end;

procedure TfrmOrdenCompra.btnborrarClick(Sender: TObject);
//var hija:tfrmrelacionborrar;
begin
if ((tblOrdenes.fieldbyname('estatus').AsString ='CANCELADA') OR (tblOrdenes.fieldbyname('estatus').AsString ='ACEPTADA') OR  (tblOrdenes.fieldbyname('estatus').AsString ='SURTIDO') OR  (tblOrdenes.fieldbyname('estatus').AsString ='FACTURANDO')) then
                 application.MessageBox('Por el estatus de esta orden ya no puede ser modificada!','Confirmación',mb_iconInformation)
else begin

{//valida que no se este usando esta compra en la tabla de DevSobreCompras
querys('select compras.idcompra as ID,compras.FechaCompra,compras.HoraCompra,compras.usuario as Usuario,compras.fecha as Fecha,compras.hora as Hora from compras INNER JOIN DetCompras ON (compras.idcompra=DetCompras.idcompra) where DetCompras.idorden='+quotedstr(edbuscar.Text),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then  begin
                application.MessageBox('No puedes Cancelar, existe una compra utilizando esta orden?','Operación No Realizada',mb_iconwarning);
                if sqlgeneral.RecordCount > 0 then
                    begin
                    hija:=tfrmrelacionborrar.Create(self);
                    hija.inicializa(sqlgeneral);
                    hija.Show;
                    end;

 end else
 begin}
if application.MessageBox('Deseas Cancelar esta Orden de Compra del sistema?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin

               querys('update articulos,DetOrden set articulos.ordenados=if ((articulos.ordenados - (DetOrden.cant_ord*articulos.piezasxunidad))<= 0,0,articulos.ordenados - (DetOrden.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetOrden.cod_cve and '+
                      ' DetOrden.idorden='+quotedstr(edbuscar.text),1,sqlgeneral);

                 querys('UPDATE requisiciones SET estatus=0 WHERE idorden='+quotedstr(edbuscar.Text)+' and estatus = 1',1,sqlgeneral);
                 tblordenes.Edit;
                 tblordenesUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
                 tblOrdenes.fieldbyname('estatus').AsString:='CANCELADA';
                 tblOrdenes.fieldbyname('FechaUltMod').AsString:=datetostr(date);
                 tblOrdenes.fieldbyname('HoraUltMod').AsString:=timetostr(time);
                 tblordenes.Post;

                 application.MessageBox('Cancelación realizada','Confirmación',mb_Iconinformation);
                 frmprincipal.ucprincipal.Log('Dio Cancelar la Orden de Compra'+edbuscar.text,3);
                 tblOrdenes.Active:=false;
                 SqlRejillaAlta.Close;
                 querys('select idorden from Ordenes',0,sqlgeneral);
                 edbuscar.text:='';
                 edbuscarprov.Text:='';
                 rgmoneda.ItemIndex:=-1;
                   if sqlgeneral.RecordCount = 0 then
                       begin
                          btnmodificar.Enabled:=false;
                          btnborrar.Enabled:=false;
                       end;
//end;
end;

end;
end;

procedure TfrmOrdenCompra.RejillaDBTableView1DblClick(Sender: TObject);
begin
   ModificaArticulo(SqlRejillaAltatemp,'DetOrdenTemp','idorden',edbuscar.Text);
end;

procedure TfrmOrdenCompra.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if (rejilla.Enabled) and (key='+') then
  begin
  //incrementa en uno la cantidad de unidades o piezas que se halla cotizado

  if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
    begin
    querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
    if sqlgeneral.FieldByName('cod_cve').AsString = '' then
      lexcede.visible := true;
      //application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
    querys('update DetOrdenTemp set cant_ord=cant_ord+1 where (idorden='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
    operacion;
    end
  else
    begin
    if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and  (btnalta.Enabled=false) then
      begin
      querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
      if sqlgeneral.FieldByName('cod_cve').AsString = '' then
        lexcede.visible := true;
        //application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
      querys('update DetOrdenTemp set cant_ord=cant_ord+1 where (idorden='+quotedstr(dsrejilla.DataSet.FieldValues['idorden'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
      operacion;
      end;
    end;
  end;

if (rejilla.Enabled) and (key='-') then
  begin
  //Es menor a lo requerido
  if querys('Select if(('+vartostr(dsrejilla.DataSet.FieldValues['cant_ord'])+' - sum(cantidad) )<= 0, "no", "si") as r '+
            'from requisiciones where idorden = '+edbuscar.Text+' and cod_cve="'+dsrejilla.DataSet.FieldValues['cod_cve']+
            '" group by idorden', 0, sqlgeneral) > 0 then
    if sqlgeneral.FieldByName('r').AsString = 'no' then
      begin
      application.MessageBox('No puedes solicitar menos de la requisicion existente', 'Atencion', MB_ICONINFORMATION);
      exit;
      end;

  //decrementa en uno la cantidad de unidades o piezas que se halla cotizado
  if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
    begin
    querys('update DetOrdenTemp set cant_ord=cant_ord-1 where (idorden='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
    operacion;
    end
  else
    begin
    if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled=false) then
      begin
      querys('update DetOrdenTemp set cant_ord=cant_ord-1 where (idorden='+quotedstr(dsrejilla.DataSet.FieldValues['idorden'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq)+')',1,sqlgeneral);
      operacion;
      end;
    end;
                                                                                                                           //sleep(1000);
  //borrar los registros que no tengan valores en cantidad y piezas.........
  querys('UPDATE requisiciones as r,DetOrdenTemp as d set r.estatus=0,r.idorden = 0 where r.idorden=d.idorden and r.cod_cve=d.cod_cve and cant_ord=0 and d.idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgeneral);
  querys('delete from DetOrdenTemp where cant_ord=0 and idorden='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgeneral);
  end;

//cerrar y abrir la consulta,

SqlRejillaAltaTemp.Close;
SqlRejillaAltaTemp.Open;
if SqlRejillaAltaTemp.RecordCount = 0 then
  begin
  rejilla.Enabled:=false;
  edsubtotal.Text:='$0';
  edtotal.Text:='$0';
  end;
end;

procedure TfrmOrdenCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then begin
     showmessage('No has guardado los datos, si deseas salir oprime el boton cancelar');
     canclose:=false;
  end;//botones

end;

procedure TfrmOrdenCompra.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//if  ((btnalta.enabled = false) or (btnmodificar.enabled =false)) then begin
if (key=46) and (rejilla.Enabled) then
  begin
            //modifica requision si estaba con esta orden
            querys('UPDATE requisiciones set estatus=0 ,idorden = 0 where idorden='+quotedstr(edbuscar.Text)+' and estatus=1 and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,sqlgeneral);
            //elimina el registro del articulo
            querys('delete from DetOrdenTemp where idorden='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);

            operacion;

     //refresca la rejilla de datos
     sqlrejillaaltatemp.Close;
     sqlrejillaaltatemp.Open;
     if SqlRejillaAltatemp.RecordCount = 0 then begin
            rejilla.Enabled:=false;
      end;

  end;

//end;

if ((key=40) or (key=38) or (key=33) or (key=34)) then  //si fue un pg dowm ó flechas
mostrar_registros;


end;

procedure TfrmOrdenCompra.edTipoCambioKeyPress(Sender: TObject;
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

procedure TfrmOrdenCompra.edfleteKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenCompra.edcomentariosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     btnagregar.setfocus;

  end;
end;

procedure TfrmOrdenCompra.rgmonedaChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
if newindex = 0 then
   edTipoCambio.Enabled:=true
else
   edTipoCambio.Enabled:=false;
end;

procedure TfrmOrdenCompra.spproveedoresClick(Sender: TObject);
begin
frmprincipal.muestra_mdichild(361,690,tfrmproveedores,'Acceso la Pantalla de Proveedores');
end;

procedure TfrmOrdenCompra.spbarticulosClick(Sender: TObject);
begin
frmprincipal.muestra_mdichild(535,759,tfrmarticulos,'Acceso la Pantalla de tipos de Articulos');
end;

procedure TfrmOrdenCompra.dvigenciaEnter(Sender: TObject);
begin
if btnalta.Enabled =true then
dvigencia.Date:=NOW;
end;

procedure TfrmOrdenCompra.dentregaEnter(Sender: TObject);
begin
if btnalta.Enabled =true then
dentrega.Date:=NOW;
end;

procedure TfrmOrdenCompra.edfletesKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenCompra.edbuscarprovButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
    frmbusquedas.query:='select idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as nombre,usuario,fecha,hora,estatus from proveedores order by nombre asc';
    frmbusquedas.campo_retorno:='idprov';
    frmbusquedas.campo_busqueda:='idprov';
    frmbusquedas.tblorigen := 'proveedores';
    frmbusquedas.tabla:='';
    frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
             ///////si hay un dato en la busqueda/////////
             edbuscarprov.Text:=frmbusquedas.resultado;
             //se realiza la busqueda para los datos necesarios de la orden con el idorden
              querys('select  idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as nombre,estatus from proveedores where idprov='+quotedstr(edbuscarprov.Text),0,SqlGeneral);
              if SqlGeneral.fieldbyname('estatus').AsBoolean = true then begin
                  idprov:=frmbusquedas.resultado;
                  edprov.text:=SqlGeneral.fieldbyname('nombre').AsString;
                  edestatus.SetFocus;
                  edestatus.itemindex:=0;
              end else begin
                  application.MessageBox('Ese proveedor no esta Activo','Confirmación',mb_iconwarning);
                  edbuscarprov.text:='';
                  end;
            end;//frmbusquedas

end;

procedure TfrmOrdenCompra.edbuscarprovKeyPress(Sender: TObject;
  var Key: Char);
begin

   if (key=#13)then begin
        key:=#0;
         if edbuscarprov.Text <> '' then
            buscarprovlocate
         else
            edbuscarprov.OnButtonClick(self);
   end;

   if key = #27 then
      begin
      key:=#0;
      edbuscarprov.Text:='';
      edprov.Text:='';
   end;

end;

procedure TfrmOrdenCompra.edbuscarprovExit(Sender: TObject);
begin
 if edbuscarprov.Text <> '' then begin

   querys('select idprov from proveedores where idprov='+quotedstr(edbuscarprov.Text),0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then begin
        idprov:=edbuscarprov.Text;
        edestatus.ItemIndex:=0;
        edestatus.SetFocus;
    end else begin
        application.MessageBox('Es proveedor no existe!','Aviso',mb_iconwarning);
        edbuscarprov.SetFocus;
        edprov.text:='';
    end;
end;
end;

procedure TfrmOrdenCompra.rgmonedaExit(Sender: TObject);
begin
if rgmoneda.Text = 'D' then begin
querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
edTipoCambio.Text:=Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]);

edtipocambio.Enabled:=true;
edTipoCambio.SetFocus;
end else begin
edtipocambio.Enabled:=false;
dvigencia.setfocus;
end;
ActualizaXMoneda;
moneda := rgmoneda.text;
end;

procedure TfrmOrdenCompra.edestatusKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     rgmoneda.ItemIndex:=0;
  end;
end;

procedure TfrmOrdenCompra.RejillaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
mostrar_registros;
end;

procedure TfrmOrdenCompra.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then begin
   tblordenes.Active:=false;
   Sqlrejillaalta.Close;
   edbuscarprov.text:='';
   edprov.text:='';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edestatus.text:='';
   estatus.caption:='';
   edTipoCambio.Text:='';
   btnimprimir.enabled:=false;
   btnenviar.Enabled := false;
   lbufh.Caption := '';
   end;
end;

procedure TfrmOrdenCompra.edbuscarprovChange(Sender: TObject);
begin
    if edbuscarprov.text = '' then
       edprov.text:='';
end;

procedure TfrmOrdenCompra.edestatusExit(Sender: TObject);
begin
     rgmoneda.ItemIndex:=0;
end;

procedure TfrmOrdenCompra.rgmonedaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)  then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrdenCompra.edTipoCambioExit(Sender: TObject);
begin
if edTipoCambio.Text = '' then
edTipoCambio.SetFocus;
end;

procedure TfrmOrdenCompra.rgmonedaEnter(Sender: TObject);
begin
rgmoneda.ItemIndex:=0;
edtipocambio.enabled:=true;
end;

procedure TfrmOrdenCompra.edestatusEnter(Sender: TObject);
begin
edestatus.itemindex:=0;
end;

procedure TfrmOrdenCompra.edfletesExit(Sender: TObject);
begin
operacion;
end;

procedure TfrmOrdenCompra.edotrosgExit(Sender: TObject);
begin
operacion;
end;

procedure TfrmOrdenCompra.edestatusNotInList(Sender: TObject);
begin
edestatus.itemindex:=0;
end;

procedure TfrmOrdenCompra.rgmonedaNotInList(Sender: TObject);
begin
rgmoneda.itemindex:=0;
end;

procedure TfrmOrdenCompra.edcodigoChange(Sender: TObject);
begin
if edcodigo.text = '' then
    LimpiaDatArt;
end;

procedure TfrmOrdenCompra.FormShow(Sender: TObject);
var c:integer;
begin
pedido:=0;
CargaCombo2('SELECT valor, concepto from configuraciones where concepto in ("IVA", "IVA2") order by concepto','valor', 'concepto',cbiva);
cbiva.itemindex := 0;
querys('SELECT idrequisicion FROM requisiciones WHERE estatus=0',0,sqlgeneral);
if sqlgeneral.FieldByName('idrequisicion').AsString <> '' then begin
  if pregunta.Execute then
    if pregunta.Value = 0 then begin
      pedido:=1; // no hacer busqueda del max(id) de ordenes....

querys('select max(idorden) as idorden from Ordenes',0,sqlgeneral);
edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
rgmoneda.itemindex := 0;
edtipocambio.text := GetConfiguraciones('TipoCambio', true);

querys('delete from DetOrdenTemp where idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgeneral);

//vamos a insertar a la tabla de DetOrdenTemp las requisiciones
//hacemos busqueda de articulos que sean unidadades y por piezas

for c:=1 to 2 do begin
  if c = 1 then
    querys('select requisiciones.cod_cve as cod_cve,sum(requisiciones.cantidad/articulos.piezasxunidad) as cantidad, '+
           'if(moneda = "D", costo, round(costo/'+edtipocambio.text+', 2)) as costo from requisiciones inner join articulos on (articulos.cod_cve=requisiciones.cod_cve) where piezas=0 and (estatus IS NULL OR estatus=0) '+
           'group by requisiciones.cod_cve',0,sqlgeneral)
  else
    querys('select requisiciones.cod_cve as cod_cve,ceiling((sum(requisiciones.cantidad)/articulos.piezasxunidad)) as cantidad, '+
            'if(moneda = "D", costo, round(costo/'+edtipocambio.text+', 2)) as costo '+
            'from requisiciones inner join articulos on (articulos.cod_cve=requisiciones.cod_cve) where piezas= 1 and '+
            '(estatus IS NULL OR estatus=0) group by requisiciones.cod_cve',0,sqlgeneral);
//     querys('select requisiciones.cod_cve as cod_cve,sum(requisiciones.cantidad) as cantidad,costo from requisiciones inner join articulos on (articulos.cod_cve=requisiciones.cod_cve) where piezas=1 and  '+
//            '(estatus IS NULL OR estatus=0) group by requisiciones.cod_cve',0,sqlgeneral);


      if sqlgeneral.FieldByName('cod_cve').AsString <> '' then begin
      sqlgeneral.First;
      while not sqlgeneral.Eof do begin
             querys('UPDATE DetOrdenTemp set cant_ord=cant_ord+'+quotedstr(sqlgeneral.FieldByName('cantidad').AsString)+' WHERE cod_cve='+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,dmaccesos.SqlGeneral);
          if dmaccesos.sqlgeneral.RowsAffected = 0 then
             querys('INSERT into DetOrdenTemp(idorden,cod_cve,cant_ord,costo,idmaq) values('+quotedstr(edbuscar.Text)+','+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString)+','+quotedstr(sqlgeneral.FieldByName('cantidad').AsString)+','+quotedstr(sqlgeneral.FieldByName('costo').AsString)+','+quotedstr(frmprincipal.idmaq)+')',1,dmaccesos.sqlgeneral);
         sqlgeneral.Next;
      end;
      end;

end;
//////////-----------------------------------------------------------------------------------------
//para que no vuelva ser usuada en otra orden....
   querys('UPDATE requisiciones SET estatus=1,idorden='+quotedstr(edbuscar.Text)+' where (estatus=0) ',1,sqlgeneral);
   btnalta.OnClick(self);
   operacion;
   gbarticulo.enabled:=true;
        if rejilla.Enabled = false then
           rejilla.Enabled:=true;
   eddatosentrega.Text:='Orden hecha para requisiciones';
end;
end;
end;

procedure TfrmOrdenCompra.edcomentariosEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmOrdenCompra.edcomentariosExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmOrdenCompra.eddatosentregaEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmOrdenCompra.eddatosentregaExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmOrdenCompra.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := eddatosentrega.Font;
  if fuentes.Execute then
     eddatosentrega.SelAttributes.Assign(fuentes.Font);
end;

procedure TfrmOrdenCompra.mmdescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmOrdenCompra.mmdescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmOrdenCompra.btnimprimirClick(Sender: TObject);
begin
{querys('Select DetOrden.idorden as id, DetOrden.cod_cve, DetOrden.cant_ord, DetOrden.costo, articulos.nombre, (DetOrden.cant_ord * DetOrden.costo)  as importe '+
       'from DetOrden left join articulos on(DetOrden.cod_cve = articulos.cod_cve) '+
       'where idorden = '+quotedstr(edbuscar.text), 0, dmreportes.sqlgeneral);}

imprimir;

querys('Select idorden as id, TotalProductos, TipoCambio, FechaOrden as fecha, DatosEntrega as observaciones, iva, total as totalmn, ''REPORTE DE ORDEN DE COMPRAS'' as titulo from Ordenes where idorden ='+quotedstr(edbuscar.text), 0, dmreportes.sqlgeneral2);
OperacionReporte('ComprasOrden', 'ComprasImpresion', 'IMP', 1);
end;

procedure TfrmOrdenCompra.cbivaExit(Sender: TObject);
begin
operacion;
end;

procedure TfrmOrdenCompra.ActualizaXMoneda;
var tabla :string;
begin
if moneda = rgmoneda.text then
  exit;
if dsrejilla.DataSet = sqlrejillaalta then
  tabla := 'DetOrden'
else
  tabla := 'DetOrdenTemp';
if dsrejilla.DataSet.RecordCount > 0 then
  begin
  if rgmoneda.Text = 'D' then //Pesos a Dolares
    querys('Update '+tabla+' as d set costo = round(costo/'+edTipoCambio.text+',2) where d.idorden='+edbuscar.text, 1, sqlgeneral)
  else
    querys('Update '+tabla+' as d set costo = round(costo*'+edTipoCambio.text+',2) where d.idorden='+edbuscar.text, 1, sqlgeneral);
  dsrejilla.DataSet.Close;
  dsrejilla.DataSet.Open;
  end;
operacion;
end;

procedure TfrmOrdenCompra.SqlrejillaaltaAfterScroll(DataSet: TDataSet);
begin
if Sqlrejillaalta.FieldByName('maximo').AsInteger  < Sqlrejillaalta.FieldByName('cant_ord').AsInteger then
  lexcede.Visible := true
else
  lexcede.Visible := false;
end;

procedure TfrmOrdenCompra.sqlrejillaaltatempAfterScroll(DataSet: TDataSet);
begin

if sqlrejillaaltatemp.FieldByName('maximo').AsInteger  < sqlrejillaaltatemp.FieldByName('cant_ord').AsInteger then
  lexcede.Visible := true
else
  lexcede.Visible := false;
end;

procedure TfrmOrdenCompra.btnenviarClick(Sender: TObject);
begin
{querys('Select DetOrden.idorden as id, DetOrden.cod_cve, DetOrden.cant_ord, DetOrden.costo, articulos.nombre, (DetOrden.cant_ord * DetOrden.costo)  as importe '+
       'from DetOrden left join articulos on(DetOrden.cod_cve = articulos.cod_cve) '+
       'where idorden = '+quotedstr(edbuscar.text), 0, dmreportes.sqlgeneral);}
imprimir;
querys('Select idorden as id, TotalProductos, TipoCambio, FechaOrden as fecha, DatosEntrega as observaciones, iva, total as totalmn, ''REPORTE DE ORDEN DE COMPRAS'' as titulo from Ordenes where idorden ='+quotedstr(edbuscar.text), 0, dmreportes.sqlgeneral2);
OperacionReporte('ComprasOrden', 'Orden de Compra', 'PDF', 1);

end;

procedure TfrmOrdenCompra.imprimir;
var fecha1, fecha2, m:string;
begin
fecha1 := InputBox('Fecha :', 'Fecha de Inicio de Inventario', datetostr(PrimeroMesActual));
fecha2 :=  datetostr(date);
frmmoduloreportes.inventarioxfecha2(fecha1, fecha2, 'D', 'and a.status = 1 ');

if strtodate(fecha2) < today then
  begin
  frmmoduloreportes.inventarioxfecha2(fecha2, datetostr(today), 'A', 'and a.status = 1 ');

  with dmreportes do
    begin
    querys('Update tmpInventariosD'+frmprincipal.idmaq+' d, tmpInventariosA'+frmprincipal.idmaq+' a set d.existencia= a.InvIni where d.codigo=a.codigo', 1, sqlgeneral2);
    querys('Update tmpInventariosD'+frmprincipal.idmaq+' set Resurtido= maximo-existencia, InvReal = existencia+apartado+PendAsig', 1, sqlgeneral2);
    querys('update tmpInventariosD'+frmprincipal.idmaq+' SET InvIni=(DEVCOMPRAS+AJUSTESALIDA+VENTAS+existencia+apartado)-(COMPRA+AJUSTEENTRADA+DEVVENTAS),Resurtido=maximo-existencia,InvReal=existencia+apartado+PendAsig',1,sqlgeneral2);

    querys('update tmpInventariosD'+frmprincipal.idmaq+' SET InvIni = 0 where InvIni is null ',1,sqlgeneral2);
    querys('update tmpInventariosD'+frmprincipal.idmaq+' SET  Resurtido = 0 where Resurtido is null ',1,sqlgeneral2);
    querys('update tmpInventariosD'+frmprincipal.idmaq+' SET InvReal = 0 where InvReal is null ',1,sqlgeneral2);
    querys('update tmpInventariosD'+frmprincipal.idmaq+' SET existencia = 0 where existencia is null ',1,sqlgeneral2);
    end;
 end;

m := floattostr(DaysBetween(strtodate(fecha1),strtodate(fecha2))/30);
  if m = '' then
    m := '1';

querys('SELECT t.codigo, t.descripcion, t.InvIni, t.COMPRA, t.AJUSTEENTRADA, t.DEVVENTAS, t.VENTAS, '+
       't.AJUSTESALIDA as garantias, d.costo, d.cant_ord, d.costo* d.cant_ord as importe, t.apartado, '+
       't.existencia, t.minimo, t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado as salidas, '+
       'if (t.minimo - t.existencia  < 0, 0, t.minimo - t.existencia )  as Orden, '+
       '(t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado) / round(1) as promedio, t.InvReal, '+
       '"'+fecha1+'" as fechaini FROM DetOrden d left join articulos a on a.cod_cve=d.cod_cve '+
       'left join tmpInventariosD'+frmprincipal.idmaq+' AS t on t.codigo=d.cod_Cve where  idorden = '+
       edbuscar.text+' order by codigo', 0, dmreportes.sqlgeneral);
 {
querys('select "'+datetostr(fecha)+'" as desde, a.cod_cve, a.nombre, d.cant_ord, d.costo, '+
       '(d.cant_ord * d.costo) as importe, a.existencia + '+
       'ifnull(r.cant,0)+ ifnull(aphoy.cant,0) as disponible, a.existencia, minimo, maximo-existencia as dif, '+
       '(maximo-existencia)-d.cant_ord as diford '+

       'from  DetOrden d left join articulos a on a.cod_cve=d.cod_cve '+
       'left join ( select cod_cve, sum(cant) as cant from ( select dc.cod_cve, sum(dc.cant_ord) * -1 as cant '+
       'from DetOrden d left join DetCompras dc on d.cod_cve=dc.cod_cve left join compras c on c.idcompra = '+
       'dc.idcompra where d.idorden ='+edbuscar.text+' and FechaCompra between adddate("'+datetostr(fecha)+'", '+
       'interval 1 day) and curdate() group by cod_cve union '+
       'select cod_cve, sum(cant) as cant from ( select dc.cod_cve, if(movimiento = "E", dc.cant_ord*-1, dc.cant_ord) '+
       'as cant from DetOrden d left join DetAjusteInv dc on d.cod_cve=dc.cod_cve left join AjusteInv c on c.idajuste '+
       '= dc.idajuste where  idorden ='+edbuscar.text+' and FechaAlta between adddate("'+datetostr(fecha)+'", interval '+
       '1 day) and curdate() ) as ai group by cod_cve union '+
       'select dp.cod_cve as cod, sum(cant)*-1 as cant from DetOrden d left join DetPedido as dp on d.cod_cve=dp.cod_cve '+
       'left join pedidos as p ON dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where '+
       'idorden ='+edbuscar.text+' and p.FechaRemision between adddate("'+datetostr(fecha)+'", interval 1 day) and '+
       'curdate()  and p.estatus in(5) and a.inventariable = 1 and a.servicio = 0 and a.paquete=0 and a.status=1 '+
       'group by dp.cod_cve UNION ALL '+
       'select sum(if(dn.cant is null, dp.cant,dp.cant-dn.cant))*-1 as cant, dp.cod_cve as cod from DetOrden d left '+
       'join DetPedido as dp on d.cod_cve=dp.cod_cve left join pedidos as p ON dp.idpedido=p.idpedido left join '+
       'articulos as a ON a.cod_cve=dp.cod_cve left join instalaciones as i ON i.idpedido=p.idpedido left join '+
       'UnidadNegocio as uni on uni.idUnidadNegocio=p.idUnidadNegocio inner join DetNotasCredito as dn on '+
       '(dn.idpedido = p.idpedido and dp.cod_cve= dn.cod_cve) where idorden ='+edbuscar.text+' and p.FechaRemision '+
       'between adddate("'+datetostr(fecha)+'", interval 1 day) and curdate() and  p.estatus in(3,4) and i.FechaInicio '+
       'is null and a.inventariable = 1 and a.servicio = 0 and a.paquete = 0 and a.status = 1 and uni.instalacion = '+
       '1 and i.estatus = 0 group by dp.cod_cve,dp.idpedido having cant > 0 union '+
       'select dp.cod_cve as cod, sum(cant) as cant from DetOrden d left join DetPedido as dp on d.cod_cve=dp.cod_cve '+
       'left join pedidos as p ON dp.idpedido = p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where '+
       'idorden ='+edbuscar.text+' and p.FechaRemision between adddate("'+datetostr(fecha)+'", interval 1 day) and '+
       'curdate() and p.estatus in(3,4) and a.inventariable =1 and a.servicio=0 and a.paquete=0 and a.status = 1 '+
       'group by dp.cod_cve union '+
       'select dc.cod_cve as cod, sum(dc.cant_ord) as cant from DetOrden d left join DetDevCompras dc on '+
       'dc.cod_cve=d.cod_cve left join DevCompras c on dc.iddev=c.iddev where d.idorden ='+edbuscar.text+' and '+
       'c.FechaDev between adddate("'+datetostr(fecha)+'", interval 1 day) and curdate() group by dc.cod_cve '+
       ') as r group by cod_cve ) as r on r.cod_cve = a.cod_cve left join ( '+
       'select dp.cod_cve, sum(cant) as cant from DetOrden d left join DetPedido as dp on d.cod_cve=dp.cod_cve '+
       'left join pedidos as p ON dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where '+
       'idorden ='+edbuscar.text+' and p.FechaCreacion between "'+datetostr(fecha)+'" and subdate( curdate(), interval '+
       '1 day) and p.estatus in(0) and a.inventariable =1 and a.servicio=0 and a.paquete = 0 and a.status = 1 '+
       'group by dp.cod_cve ) as ap on ap.cod_cve=a.cod_cve left join ( select dp.cod_cve, sum(cant) as cant from DetOrden '+
       'd left join DetPedido as dp on d.cod_cve=dp.cod_cve left join pedidos as p ON dp.idpedido=p.idpedido left join '+
       'articulos as a ON a.cod_cve=dp.cod_cve where  idorden ='+edbuscar.text+' and p.FechaCreacion = curdate() and '+
       'p.estatus in(0) and a.inventariable =1 and a.servicio=0 and a.paquete = 0 and a.status = 1 group by dp.cod_cve '+
       ') as aphoy on aphoy.cod_cve=a.cod_cve where d.idorden ='+edbuscar.text+' order by iddpto, nombre', 0, dmreportes.sqlgeneral);}
end;
   {
SELECT t.codigo, t.descripcion, t.InvIni, t.COMPRA, t.AJUSTEENTRADA, t.DEVVENTAS, t.VENTAS, t.AJUSTESALIDA,
t.DEVCOMPRAS, t.apartado, t.existencia, t.minimo, t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado as salidas,
if ((t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado ) - minimo < 0, 0,(t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS
+ t.apartado ) - minimo)  as Orden, (t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado) / round(1) as promedio,
t.PendAsig, t.InvReal,"Del '+dfecha1.text+' al '+dfecha2.text+'" as fechaini FROM tmpInventariosD200 AS t order by    }
End.
    

