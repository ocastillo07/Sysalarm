{///////////////////////////////////////////////////////////////////////////////
///                                                                          ///
///                    Creado por Dalila Robledo Terrazas                    ///
///                    Ultima Modificacion 31/Ago/2007                       ///
///                                                                          ///
///////////////////////////////////////////////////////////////////////////////}
{
* Al cerrar en surtido incompleto como afecta las existencias de Cabms

}
unit URequisiciones;

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
  LMDCheckListDlg;

type
  TfrmRequisiciones = class(TForm)
    SqlGeneral: TMyQuery;
    DSOrdenes: TDataSource;
    tblOrdenes: TMyTable;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    Sqlreal: TMyQuery;
    DsRejilla: TDataSource;
    sqltemp: TMyQuery;
    pregunta: TLMDCheckListDlg;
    gbprov: TGroupBox;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    cant_surt: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    descuento: TcxGridDBColumn;
    aplica_desc: TcxGridDBColumn;
    comentarios: TcxGridDBColumn;
    precio_costo: TcxGridDBColumn;
    subtotal: TcxGridDBColumn;
    dbiva: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    gbtotales: TGroupBox;
    RzLabel9: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel8: TRzLabel;
    edtp: TRzDBNumericEdit;
    edsubtotal: TRzDBNumericEdit;
    ediva: TRzDBNumericEdit;
    edtotal: TRzDBNumericEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    PBuscaArt: TRzGroupBox;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    cbgrupo: TRzComboBox;
    cbclase: TRzComboBox;
    cbarticulo: TRzComboBox;
    btncerrar: TRzBitBtn;
    ppersonas: TRzPanel;
    RzLabel28: TRzLabel;
    edsolicitante: TRzButtonEdit;
    ednomsol: TRzEdit;
    RzLabel29: TRzLabel;
    edusuario: TRzButtonEdit;
    ednomuser: TRzEdit;
    RzLabel30: TRzLabel;
    edcargo: TRzButtonEdit;
    ednomcargo: TRzEdit;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    estatus: TRzLabel;
    edbuscar: TRzButtonEdit;
    edHoraOrd: TRzDBEdit;
    edFechaOrd: TRzDBEdit;
    RzLabel34: TRzLabel;
    RzLabel2: TRzLabel;
    edbuscarprov: TRzButtonEdit;
    edprov: TRzEdit;
    edfactura: TRzEdit;
    RzLabel22: TRzLabel;
    rgmoneda: TRzComboBox;
    RzLabel5: TRzLabel;
    edTipoCambio: TRzEdit;
    RzLabel6: TRzLabel;
    dentrega: TRzDateTimeEdit;
    RzLabel35: TRzLabel;
    edporpagar: TRzEdit;
    edotrosg: TRzDBEdit;
    edfletes: TRzDBEdit;
    tblOrdenesFechaRequisicion: TDateField;
    tblOrdenesHoraRequisicion: TTimeField;
    tblOrdenesFechaVigencia: TDateField;
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
    tblOrdenesidusuario: TIntegerField;
    tblOrdenessolicitante: TIntegerField;
    tblOrdenescarguesea: TIntegerField;
    tblOrdenesautorizado: TSmallintField;
    tblOrdenesfactura: TStringField;
    tblOrdenesidproveedor: TIntegerField;
    tblOrdenesmoneda: TStringField;
    tblOrdenestc: TFloatField;
    tblOrdenesfechaentrega: TDateField;
    pnldatos: TRzPanel;
    RzLabel7: TRzLabel;
    RzLabel11: TRzLabel;
    eddatosentrega: TRzDBRichEdit;
    dvigencia: TRzDBDateTimeEdit;
    RzLabel17: TRzLabel;
    edestatus: TRzComboBox;
    gbarticulo: TRzPanel;
    lblproducto: TRzLabel;
    edcodigo: TRzButtonEdit;
    btnbuscaart: TRzBitBtn;
    RzLabel14: TRzLabel;
    edDescripcion: TRzEdit;
    RzLabel23: TRzLabel;
    edultcompra: TRzEdit;
    Label1: TLabel;
    btnagregar: TRzBitBtn;
    edcomentarios: TRzMemo;
    RzLabel20: TRzLabel;
    RzLabel13: TRzLabel;
    edcantidad: TRzNumericEdit;
    edcant_sur: TRzNumericEdit;
    RzLabel19: TRzLabel;
    RzLabel16: TRzLabel;
    ediva_art: TRzEdit;
    RzLabel15: TRzLabel;
    EdCosto_unidad: TRzEdit;
    edmin: TRzEdit;
    RzLabel25: TRzLabel;
    RzLabel24: TRzLabel;
    edmax: TRzEdit;
    RzLabel27: TRzLabel;
    edpieza: TRzEdit;
    edexist: TRzEdit;
    RzLabel26: TRzLabel;
    tblOrdenesidrequisicion: TIntegerField;
    btnimprimir: TRzBitBtn;
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
    procedure dentrega1Enter(Sender: TObject);
    procedure edfletes1KeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarprovButtonClick(Sender: TObject);
    procedure edbuscarprovKeyPress(Sender: TObject; var Key: Char);
    procedure edestatusKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarprovChange(Sender: TObject);
    procedure rgmonedaKeyPress(Sender: TObject; var Key: Char);
    procedure edTipoCambioExit(Sender: TObject);
    procedure rgmonedaEnter(Sender: TObject);
    procedure edfletes1Exit(Sender: TObject);
    procedure edotrosg1Exit(Sender: TObject);
    procedure edestatusNotInList(Sender: TObject);
    procedure rgmonedaNotInList(Sender: TObject);
    procedure edcodigoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure cbgrupoSelect(Sender: TObject);
    procedure cbclaseSelect(Sender: TObject);
    procedure edsolicitanteButtonClick(Sender: TObject);
    procedure edsolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure edusuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edcargoKeyPress(Sender: TObject; var Key: Char);
    procedure btnbuscaartClick(Sender: TObject);
    procedure rgmonedaSelect(Sender: TObject);
    procedure EdCosto_unidadKeyPress(Sender: TObject; var Key: Char);
    procedure ediva_artKeyPress(Sender: TObject; var Key: Char);
    procedure tblOrdenesBeforePost(DataSet: TDataSet);
    procedure edcant_surKeyPress(Sender: TObject; var Key: Char);
    procedure dentregaKeyPress(Sender: TObject; var Key: Char);
    procedure edfacturaKeyPress(Sender: TObject; var Key: Char);
    procedure ednomsolKeyPress(Sender: TObject; var Key: Char);
    procedure ednomuserKeyPress(Sender: TObject; var Key: Char);
    procedure ednomcargoKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);
  private
    { Private declarations }
    NoAutorizables:Boolean;
    estreq:string;
    procedure buscausuario(editor:TRzEdit; editornum:TRzButtonEdit);
    procedure mostrar_registros;
    procedure buscarlocate;
    procedure buscarprovlocate;
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure operacion;
    procedure LimpiaDatArt;
    procedure InsertaArticulo(idarticulo:string);
    procedure CreaTemporal;
    procedure Alta;
    procedure Editar;
  public
    { Public declarations }
    idprov:string;
    pedido:integer;
  end;

var
  frmRequisiciones: TfrmRequisiciones;

implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas, UBuscaArt, Uproveedores,
  Uarticulos, Urelacionborrar, Udmrep;

{$R *.dfm}
procedure TfrmRequisiciones.mostrar_registros;
begin
  edcodigo.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('idcabm').AsString;
  edDescripcion.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('descripcion').AsString;
  edultcompra.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('ult_compra').AsString;
  EdCosto_unidad.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('costo').AsString;
  edmin.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('minimo').AsString;
  edmax.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('maximo').AsString;
  edexist.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('existencia').AsString;




  
end;

procedure TfrmRequisiciones.buscarprovlocate;
  var hija:tfrmproveedores;
begin
querys('select idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as nombre,estatus from proveedores where idprov='+quotedstr(edbuscarprov.Text)+' order by estatus, nombre',0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
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
         dentrega.setfocus;
      end
   else
      begin
      application.MessageBox('Ese proveedor no esta Activo','Confirmación',mb_iconwarning);
      edbuscarprov.Text:='';
      end;
   end;//if recordcount
end;


procedure TfrmRequisiciones.buscarlocate;
begin
tblOrdenes.Active:=true;
if tblOrdenes.Locate('idrequisicion',edbuscar.Text,[]) then
   begin
   edestatus.Text:=tblOrdenes.fieldbyname('estatus').AsString;
   btnalta.Enabled:=true;
   btnmodificar.Enabled:=true;
   btnborrar.Enabled:=true;
   querys('select ReqIntDetalle.idcabm, Cabms.descripcion, cantord, cantsurt, comentario, costo, subtotal, iva, total, '+
          'minimo, maximo, existencia, Cabms.ultima_compra as ult_compra '+
          'from ReqIntDetalle left join Cabms on (Cabms.idcabm=ReqIntDetalle.idcabm) where idrequisicion='+quotedstr(edbuscar.text)+' order by idcabm', 0, sqlreal);

   edbuscarprov.text:=tblordenes.FieldByName('idproveedor').AsString;
   buscarprovlocate;
   dentrega.date:=tblordenes.FieldByName('fechaentrega').AsDateTime;
   rgmoneda.text:=tblordenes.FieldByName('moneda').AsString;
   edTipoCambio.text:=tblordenes.FieldByName('tc').AsString;
   edfactura.text:=tblordenes.FieldByName('factura').AsString;
   edsolicitante.text :=  tblOrdenes.fieldbyname('solicitante').AsString;
   buscausuario(ednomsol, edsolicitante);
   edusuario.text :=  tblOrdenes.fieldbyname('idusuario').AsString;
   buscausuario(ednomuser, edusuario);
   edcargo.text :=  tblOrdenes.fieldbyname('carguesea').AsString;
   buscausuario(ednomcargo, edcargo);
   btnimprimir.Enabled := true;
   end
else
  begin
  estatus.Caption:='';
  edestatus.Text:='';
  edbuscarprov.Text:='';
  edprov.text:='';
  btnmodificar.Enabled:=false;
  btnborrar.Enabled:=false;
  application.MessageBox('Esa Requisicion Interna no Existe','Información',mb_ok+mb_iconinformation);
  tblOrdenes.Active:=false;
  sqlreal.Close;
  edbuscar.Text:='';
  rgmoneda.ItemIndex:=-1;
  btnimprimir.Enabled := false;
  edbuscar.SetFocus;
  end;
end;


procedure TfrmRequisiciones.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
var key:word;
begin
if dsrejilla.DataSet.RecordCount > 0 then
  begin
  mostrar_registros;
  //Refresca la rejilla de datos
  query.Close;
  query.Open;
  gbarticulo.enabled:=true;
  dsrejilla.DataSet:=query;
  btnagregar.Enabled:=true;
  edcodigo.Enabled:=false;
  edcantidad.Enabled:=true;
  edcantidad.SetFocus;
  key:=46;
  RejillaDBTableView1.OnKeyUp(Self, key, [ssCtrl]);
  //operacion;
  end;
end;

procedure TfrmRequisiciones.operacion;
  var id:string;
begin
  id:=edbuscar.text;
  querys('Select TRUNCATE(SUM(tmpReqDetalle'+frmprincipal.idmaq+'.cantord * tmpReqDetalle'+frmprincipal.idmaq+'.costo),2) as SUBTOTAL,TRUNCATE(SUM((tmpReqDetalle'+frmprincipal.idmaq+'.cantord * tmpReqDetalle'+frmprincipal.idmaq+'.costo)*(tmpReqDetalle'+frmprincipal.idmaq+'.iva/100)),2) as IVA,TRUNCATE(SUM(if (tmpReqDetalle'+frmprincipal.idmaq+'.iva > 0,((tmpReqDetalle'+frmprincipal.idmaq+'.cantord *tmpReqDetalle'+frmprincipal.idmaq+'.costo)*'+
         '(tmpReqDetalle'+frmprincipal.idmaq+'.iva/100))+ tmpReqDetalle'+frmprincipal.idmaq+'.cantord * tmpReqDetalle'+frmprincipal.idmaq+'.costo,tmpReqDetalle'+frmprincipal.idmaq+'.cantord * tmpReqDetalle'+frmprincipal.idmaq+'.costo)),2) as TOTAL,SUM(tmpReqDetalle'+frmprincipal.idmaq+'.cantord) as TotalProductos From tmpReqDetalle'+frmprincipal.idmaq+' left join Cabms on tmpReqDetalle'+frmprincipal.idmaq+'.idcabm=Cabms.idcabm '+
         ' Order By tmpReqDetalle'+frmprincipal.idmaq+'.idcabm', 0, sqlgeneral);

  edtp.text:=inttostr(SqlGeneral.fieldbyname('TotalProductos').AsInteger);
  edsubtotal.Text:=floattostr(SqlGeneral.fieldbyname('SUBTOTAL').AsFloat);
  ediva.Text:=floattostr(SqlGeneral.fieldbyname('IVA').AsFloat);
  if edfletes.text = '' then
     edfletes.text := '0.00';
  if edotrosg.text = '' then
     edotrosg.text := '0.00';           

  edtotal.Text:=floattostr(strtofloat(edfletes.text) + strtofloat(edotrosg.text) + SqlGeneral.fieldbyname('TOTAL').AsFloat);
end;

procedure TfrmRequisiciones.LimpiaDatArt;
begin
     //limpia los campos
     edexist.Text:='';
     edmin.Text:='';
     edmax.Text:='';
     edultcompra.Text:='';
     btnagregar.Enabled:=false;
     edcantidad.Text:='1';
     edcosto_unidad.Text:='';
     edDescripcion.Text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
     ediva_art.Text:='';
     edcant_sur.text:='';
     edcomentarios.text:='';
     edpieza.Text := '';
     edfactura.Text := '';

     if (btncancelar.Caption ='&Cancelar') then
     edcodigo.SetFocus;
end;

procedure TfrmRequisiciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;



procedure TfrmRequisiciones.tblOrdenesBeforePost(DataSet: TDataSet);
begin
  tblordenesFechaRequisicion.AsDateTime:=FechaServidor();
  tblordenesHoraRequisicion.AsDateTime:=HoraServidor;
  tblOrdenes.fieldbyname('estatus').AsString:=edestatus.Text;
  tblOrdenes.fieldbyname('fecha').AsString:=datetostr(date);
  tblOrdenes.fieldbyname('hora').AsString:=timetostr(time);
  tblordenesUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
  tblOrdenes.fieldbyname('estatus').AsString:=edestatus.Text;
  tblOrdenes.fieldbyname('FechaUltMod').AsString:=datetostr(date);
  tblOrdenes.fieldbyname('HoraUltMod').AsString:=timetostr(time);
  edsubtotal.DisplayFormat := '0.00';
  ediva.DisplayFormat := '0.00';
  edtotal.DisplayFormat := '0.00';
  tblordenes.FieldByName('subtotal').AsFloat:=strtofloat(Format('%8.2f', [strtofloat(edsubtotal.text)]));
  tblordenes.FieldByName('iva').AsFloat:=StrtoFloat(Format('%8.2f', [strtofloat(ediva.text)]));
  tblordenes.FieldByName('total').AsFloat:=StrtoFloat(Format('%8.2f', [strtofloat(edtotal.text)]));
  edsubtotal.DisplayFormat := ',0.00';
  ediva.DisplayFormat := ',0.00';
  edtotal.DisplayFormat := ',0.00';
  if edfletes.text = '' then
     edfletes.text := '0.00';
  if edotrosg.text = '' then                               
     edotrosg.text := '0.00';
  tblordenes.FieldByName('fletes').AsFloat:=StrtoFloat(Format('%8.2f', [strtofloat(edfletes.text)]));
  tblordenes.FieldByName('otros').AsFloat:=StrtoFloat(Format('%8.2f', [strtofloat(edotrosg.text)]));
  tblordenes.FieldByName('DatosEntrega').AsString:=eddatosentrega.text;
  tblordenes.FieldByName('idusuario').AsString:=edusuario.text;
  tblordenes.FieldByName('solicitante').AsString:=edsolicitante.text;
  tblordenes.FieldByName('carguesea').AsString:=edcargo.text;
  tblordenes.FieldByName('idproveedor').AsString:=edbuscarprov.text;
  tblordenes.FieldByName('fechaentrega').AsDatetime:=dentrega.date;
  tblordenes.FieldByName('moneda').AsString:=rgmoneda.text;
  tblordenes.FieldByName('tc').AsString:=edTipoCambio.text;
  tblordenes.FieldByName('factura').AsString:=edfactura.text;
end;

procedure TfrmRequisiciones.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmRequisiciones.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
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

procedure TfrmRequisiciones.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
    frmbusquedas.query:='Select * From RequisicionesInternas order by FechaRequisicion,HoraRequisicion asc';
    frmbusquedas.campo_retorno:='idrequisicion';
    frmbusquedas.campo_busqueda:='idrequisicion';
    frmbusquedas.tabla:='';
    frmbusquedas.tblorigen := 'RequisicionesInternas';
    frmbusquedas.ShowModal;
    if frmbusquedas.resultado <> '' then
       begin
       tblordenes.Active:=true;
       edbuscar.Text:= frmbusquedas.resultado;
       buscarlocate;
       end;

    end;
end;

procedure TfrmRequisiciones.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
   begin
   if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then
      begin
      if btnalta.Caption='&Guardar' then
         begin
        // querys('UPDATE requisiciones SET estatus=0,idorden=0 WHERE idorden='+quotedstr(edbuscar.Text),1,sqlgeneral);
         querys('Drop table if exists tmpReqDetalle'+frmprincipal.idmaq,1,sqlgeneral);
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
         querys('Drop table if exists tmpReqDetalle'+frmprincipal.idmaq,1,sqlgeneral);
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Orden Actual';
         btnmodificar.ImageIndex:=2;
         tblordenes.Cancel;
         end;

      edestatus.text:='';
      btncancelar.Hint:='Cerrar esta Pantalla';
      btncancelar.Caption:='&Cerrar';
      LimpiaDatArt;
      ppersonas.enabled := false;
      pnldatos.Enabled:=false;
      gbarticulo.Enabled:=false;
      gbprov.enabled:=false;
      edotrosg.Enabled:=false;
      edfletes.Enabled:=false;
      rejilla.Enabled:=false;
      edbuscar.Enabled:=true;
      edbuscar.Text:='';
      edbuscar.setfocus;
      edbuscarprov.enabled:=true;
      edbuscarprov.Text:='';
      edprov.Text:='';
      btnalta.Enabled:=TRUE;
      dsrejilla.DataSet:=sqlreal;
      sqlreal.Close;
      dsrejilla.DataSet:=sqlreal;
      tblOrdenes.Active:=false;
      end;//pregunta ?
   end
else
   close;
end;

procedure TfrmRequisiciones.edcodigoButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='select idcabm, descripcion, nivel, existencia, nacional, estatus, if(preautorizado = 1, ''NO'', ''SI'' ) as NecesitaAutorizacion from Cabms where descripcion is not null and estatus=1 order by descripcion asc';
  campo_retorno:='idcabm';
  campo_busqueda:='descripcion';
  tblorigen := 'Cabms';
  tabla:='';
  ShowModal;
  if resultado <> '' then
     begin
     ///////si hay un dato en la busqueda/////////
     edcodigo.Text := resultado;
     InsertaArticulo(resultado);
     end;//frmbusquedas
  end;
end;

procedure TfrmRequisiciones.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
   edcantidad.Text:='1';

end;

procedure TfrmRequisiciones.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13  then
     begin
     if edcodigo.text <> '' then
        begin
        InsertaArticulo(edcodigo.text);
        end
     else
        edcodigo.OnButtonClick(self);
     end;

if key = #27 then
   LimpiaDatArt;
end;


procedure TfrmRequisiciones.cboproveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
   begin
   key:=#0;
   sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
   rgmoneda.setfocus;
   end;
end;

procedure TfrmRequisiciones.edcantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key, false);
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

procedure TfrmRequisiciones.btnagregarClick(Sender: TObject);
//var tc:double;
begin
// Selecciono Articulo
if (Length(ediva_art.Text) = 0) then
  begin
      application.messagebox('Falta el iva!', 'Atencion', MB_ICONERROR);
      ediva_art.Text := '0';
      ediva_art.SetFocus;
      ediva_art.SelectAll;
      exit;

  end;


if (eddescripcion.text = '') or (edcodigo.Text = '') then
   begin
   application.messagebox('Debe seleccionar un Articulo', 'Atencion', MB_ICONERROR);
   edcodigo.SetFocus;
   exit;
   end;

// valida maximos
if strtoint(edcantidad.text) > strtoint(edmax.text) then
   begin
   application.messagebox('La cantidad no debe exceder el maximo permitido', 'Atencion', MB_ICONERROR);
   edcantidad.SetFocus;
   exit;
   end;

// valida proveedor
if (edbuscarprov.text = '') then
    begin
    application.messagebox('Falta el Proveedor de este Articulo o Servicio', 'Atencion', MB_ICONEXCLAMATION);
    edbuscarprov.setfocus;
    exit;
    end;

// valida cantidad surtida
 if (edcant_sur.text = '') and (NoAutorizables = true) then
    begin
    application.messagebox('Falta la Cantidad Surtida por el tipo de Articulo o Servicio', 'Atencion', MB_ICONEXCLAMATION);
    edcant_sur.setfocus;
    exit;
    end;
// tipo moneda
 if rgmoneda.text = '' then
    begin
    application.messagebox('Falta el Tipo de Moneda para el Articulo o Servicio', 'Atencion', MB_ICONEXCLAMATION);
    rgmoneda.setfocus;
    exit;
    end;

{// valida tipo cambio
if rgmoneda.text = 'P' then
   tc:= 1
else
  begin
  if edtipocambio.text ='' then
    begin
    application.messagebox('Falta el Tipo de Cambio para el Articulo o Servicio', 'Atencion', MB_ICONEXCLAMATION);
    edtipocambio.setfocus;
    exit;
    end
  else
    tc:= strtofloat(edtipocambio.text);
  end;}
 {
querys('Insert into tmpReqDetalle'+frmprincipal.idmaq+' (idcabm, nombre, cantord, cantsurt, comentario, costo, subtotal, iva, total, minimo, maximo) values ('+
        quotedstr(edcodigo.Text)+', '+quotedstr(edDescripcion.Text)+', '+quotedstr(edcantidad.Text)+', '+quotedstr(edcant_sur.Text)+', '+quotedstr(edcomentarios.text)+
        ', '+quotedstr(Format('%8.2f', [strtofloat(edcosto_unidad.Text)*tc]))+', '+quotedstr(Format('%8.2f',[(strtofloat(edcosto_unidad.Text)*tc)*strtofloat(edcantidad.Text)]))+
        ', '+quotedstr(Format('%8.2f',[(strtofloat(ediva_art.Text)*tc)* strtofloat(edcantidad.Text)]))+', '+quotedstr(Format('%8.2f',[((strtofloat(edcosto_unidad.Text)*tc)*strtofloat(edcantidad.Text))*1.10]))+
        ', '+quotedstr(edmin.Text)+', '+quotedstr(edmax.Text)+')', 1, sqlgeneral);       }

querys('Insert into tmpReqDetalle'+frmprincipal.idmaq+' (idcabm, descripcion, cantord, cantsurt, comentario, '+
       'costo, subtotal, iva, total, minimo, maximo) values ("'+edcodigo.Text+'", "'+edDescripcion.Text+
       '", "'+edcantidad.Text+'", "'+edcant_sur.Text+'", "'+edcomentarios.text+'", "'+
       Format('%8.2f', [strtofloat(edcosto_unidad.Text)])+'", "'+
       Format('%8.2f',[(strtofloat(edcosto_unidad.Text))*strtofloat(edcantidad.Text)])+
       '", "'+Format('%8.2f',[(strtofloat(ediva_art.Text))* strtofloat(edcantidad.Text)])+'", "'+
       Format('%8.2f',[((strtofloat(edcosto_unidad.Text))*strtofloat(edcantidad.Text))*(1+getIVA)])+
       '", "'+edmin.Text+'", "'+edmax.Text+'")', 1, sqlgeneral);


// LLena los totales
querys('select sum(cantord) as cantord, sum(subtotal) as subtotal, sum(iva) as iva, sum(total) as total from tmpReqDetalle'+frmprincipal.idmaq, 0, sqlgeneral);
edtp.Text := sqlgeneral.fieldbyname('cantord').AsString;
edsubtotal.Text := Format('%8.2f',[sqlgeneral.fieldbyname('subtotal').AsFloat]);
ediva.Text := Format('%8.2f',[sqlgeneral.fieldbyname('iva').AsFloat]);
edtotal.Text := Format('%8.2f',[sqlgeneral.fieldbyname('total').AsFloat]);

//Saca el total de Cantidad surtida con iva
querys('select sum((cantsurt*costo)*'+floattostr(1+getIVA)+') as porPagar  from tmpReqDetalle'+frmprincipal.idmaq, 0, sqlgeneral);
edporpagar.Text := Format('%8.2f',[strtofloat(edtotal.Text) - sqlgeneral.fieldbyname('porPagar').AsFloat]);

querys('Select * from tmpReqDetalle'+frmprincipal.idmaq+' order by idcabm', 0, sqlreal);

//*// Limpia los edits //*//
LimpiaDatArt;
{sqltemp.close;
sqltemp.open;}
//gbarticulo.enabled := false;
Rejilla.Enabled := true;
end;

procedure TfrmRequisiciones.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
   CreaTemporal;
   estatus.Caption:='';
  //pone la tabla de Ordenes de Compra en modo de INSERCION
   tblordenes.Active:=true;
   tblordenes.Insert;
   pnldatos.Enabled:=true;
   if pedido = 0 then
      begin
      querys('select max(idrequisicion) as idrequisicion from RequisicionesInternas',0,sqlgeneral);
      edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
      end;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edFechaOrd.text:=datetostr(now);
   edHoraOrd.Text:= timetostr(now);
   dvigencia.date:=now;
   dentrega.date:=now;

   edbuscarprov.Text:='';
   edprov.Text:='';
   edestatus.itemindex:=0;
   rgmoneda.text:='D';
   gbprov.enabled := true;
   gbarticulo.Enabled:=true;
   ppersonas.enabled:=true;
   edbuscarprov.Enabled:=true;
   edotrosg.Enabled:=true;
   edfletes.Enabled:=true;
   ednomsol.enabled:=false;
   ednomcargo.enabled:=false;
   ednomuser.enabled:=false;
   edbuscar.Enabled:=false;
   edcant_sur.Enabled:=false;
   edmin.Enabled:=false;
   edmax.Enabled:=false;
   edpieza.Enabled:=false;
   edexist.Enabled:=false;
   edultcompra.Enabled:=false;

   querys('select valor from configuraciones where concepto =''TipoCambio''', 0, sqlgeneral);
   edTipoCambio.text := sqlgeneral.fieldbyname('valor').asstring;

   dvigencia.setfocus;
   end
else    ///*** Guardar ***///
   begin
   if sqlreal.RecordCount > 0 then
      begin
      if edbuscarprov.Text <> '' then
         begin
         if (NoAutorizables = true) then
            begin
            if (edestatus.text = 'SURTIDO/SIN FACTURA') or (edestatus.text = 'SURTIDO/FACTURA') then
               Alta
            else
               begin
                application.messagebox('El estatus de este tipo de Productos o Servicios solo pueden utilizar "SURTIDO/SIN FACTURA" o "SURTIDO/FACTURA"', 'Atencion', MB_ICONSTOP);
                edestatus.Text := '';
                edestatus.SetFocus;
                exit;
                end;
            end
         else
            begin
            if (NoAutorizables = true) and ((edestatus.text = 'SURTIDO/SIN FACTURA') or (edestatus.text = 'SURTIDO/FACTURA')) then
               Alta
            else
               begin
               if (NoAutorizables = false) and (edestatus.text = 'REQUISICION') then
                  Alta
               else
                  begin
                  application.messagebox('El estatus de este tipo de Productos o Servicios solo puede ser "REQUISICION" ya que esta es una alta y debera ser "ACEPTADA" o "CANCELADA" para surtir o cerrar segun sea el caso.', 'Atencion', MB_ICONSTOP);
                  edestatus.Text := '';
                  edestatus.SetFocus;
                  exit;
                  end;
               end;
            end;
         end //prov <> ''
      else
         begin
         application.MessageBox('Falta el proveedor!','Atención',mb_ok);
         edbuscarprov.SetFocus;
         end;
      end//sqlrejilla reccount
   else
      begin
      application.MessageBox('Mínimo necesita capturar un articulo para guardar!','Atención',mb_ok);
      edcodigo.SetFocus;
      end;
   end;// else guardar
end;
                                                                                                                 

procedure TfrmRequisiciones.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
  begin
  if ((tblOrdenes.fieldbyname('estatus').AsString ='CANCELADA') OR (tblOrdenes.fieldbyname('estatus').AsString ='CERRADO INCOMPLETO') OR  (tblOrdenes.fieldbyname('estatus').AsString ='SURTIDO/FACTURA')) then
    begin
    application.MessageBox('Por el estatus de esta orden ya no puede ser modificada','Confirmación',mb_iconwarning);
    edbuscar.setfocus;
    exit;
    end;
  CreaTemporal;
  querys('Select * from ReqIntDetalle where idrequisicion = '+quotedstr(edbuscar.text)+' order by idcabm',0,sqlgeneral);
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
  edbuscarprov.Enabled:=false;
  pnldatos.Enabled:=true;
  gbarticulo.Enabled:=true;
  rejilla.Enabled:=true;
  edotrosg.Enabled:=true;
  edfletes.Enabled:=true;
  edbuscarprov.Enabled:=false;
  ppersonas.enabled:= false;
  ednomsol.Enabled:=false;
  ednomuser.Enabled:=false;
  ednomcargo.Enabled:=false;
  estreq := edestatus.text;
  edfactura.enabled := true;
  gbprov.enabled := true;
  if  edestatus.Text = 'REQUISICION' then
    begin
    ppersonas.enabled:=true;
    edbuscarprov.enabled:=true;
    end;


  // Pone la tabla en modo de EDICION
  tblOrdenes.Edit;
  querys('Insert into tmpReqDetalle'+frmprincipal.idmaq+' (idcabm, descripcion, cantord, cantsurt, comentario, costo, subtotal, iva, total, minimo, maximo, existencia) '+
         'select ReqIntDetalle.idcabm, Cabms.descripcion,  cantord, cantsurt, comentario, costo, subtotal, iva, total, minimo, maximo, existencia '+
         'from ReqIntDetalle left join Cabms on (Cabms.idcabm=ReqIntDetalle.idcabm) where idrequisicion='+quotedstr(edbuscar.text)+' order by idcabm',1,SqlGeneral);
  querys('Select * from tmpReqDetalle'+frmprincipal.idmaq,0, sqltemp);
  sqlreal.close;
  dsrejilla.DataSet.Close;
  dsrejilla.DataSet:= sqltemp;
  dsrejilla.DataSet.Open;
  edestatus.SetFocus;
  end
else    // GUARDAR EDICION //
  begin
  if edestatus.text = estreq then
     begin
     Editar;
     exit;
     end
  else
     begin
     if (estreq = 'REQUISICION') and ((edestatus.text = 'ACEPTADA') or (edestatus.text = 'CANCELADA')) then
        begin
        Editar;
        exit;
        end
     else
        begin
        if (estreq = 'ACEPTADA') and ((edestatus.text = 'INCOMPLETO') or (edestatus.text = 'SURTIDO/SIN FACTURA') or (edestatus.text = 'SURTIDO/FACTURA')) then
           begin
           querys('select idusuario from UCTabUsers left join usuarios on (usuarios.idusuario=UCTabUsers.UCIdUser)'+
                  'where UCLogin='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' and UCUserName = '+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+
                  ' and AutorizaRequisiciones=1', 0, sqlgeneral);
           if sqlgeneral.RecordCount > 0 then
              Editar
           else
              application.MessageBox('El usuario con el que se ha ingresado no tiene derechos para CERRAR una requisicion', 'Aviso', MB_ICONSTOP);
           exit;
           end
        else
           begin
           if (estreq = 'SURTIDO/SIN FACTURA') and (edestatus.text = 'SURTIDO/FACTURA') then
              begin
              Editar;
              exit;
              end
           else
              begin
              if (estreq = 'INCOMPLETO') and ((edestatus.text = 'SURTIDO/SIN FACTURA') or (edestatus.text = 'SURTIDO/FACTURA') or (edestatus.text = 'CERRADO INCOMPLETO')) then
                  begin
                  Editar;
                  exit;
                  end
              else
                  begin
                  application.MessageBox(PCHAR('El cambio de Estatus de '+quotedstr(estreq)+' a '+quotedstr(edestatus.text)+', no puede ser realizado en ese orden'), 'Atencion', MB_ICONEXCLAMATION);
                  edestatus.text := estreq;
                  edestatus.SetFocus;
                  exit;
                  end;
              end;
           end;
        end;
     end;
  end;     
end;

procedure TfrmRequisiciones.btnborrarClick(Sender: TObject);
begin
if ((tblOrdenes.fieldbyname('estatus').AsString ='CANCELADA') OR (tblOrdenes.fieldbyname('estatus').AsString ='ACEPTADA') OR  (tblOrdenes.fieldbyname('estatus').AsString ='SURTIDO') OR  (tblOrdenes.fieldbyname('estatus').AsString ='FACTURANDO')) then
   application.MessageBox('Por el estatus de esta orden ya no puede ser modificada!','Confirmación',mb_iconInformation)
else
   begin
   if application.MessageBox('Deseas Cancelar esta Orden de Compra del sistema?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      begin
      {querys('update Cabms,DetOrden set Cabms.ordenados=if ((Cabms.ordenados - (DetOrden.cant_ord*Cabms.piezasxunidad))<= 0,0,Cabms.ordenados - (DetOrden.cant_ord*Cabms.piezasxunidad)) where Cabms.idcabm=DetOrden.idcabm and '+
             ' DetOrden.idorden='+quotedstr(edbuscar.text),1,sqlgeneral);}

      //querys('UPDATE requisiciones SET estatus=0 WHERE idorden='+quotedstr(edbuscar.Text)+' and estatus = 1',1,sqlgeneral);
      tblordenes.Edit;
      tblordenesUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
      edestatus.text:='CANCELADA';
      tblOrdenes.fieldbyname('estatus').AsString:='CANCELADA';
      tblOrdenes.fieldbyname('FechaUltMod').AsString:=datetostr(date);
      tblOrdenes.fieldbyname('HoraUltMod').AsString:=timetostr(time);
      tblordenes.Post;

      application.MessageBox('Cancelación realizada','Confirmación',mb_Iconinformation);
      frmprincipal.ucprincipal.Log('Cancelo la Requisicion de Compra'+edbuscar.text,3);
      tblOrdenes.Active:=false;
      sqlreal.Close;
      querys('select idrequisicion from Requisicionesinternas',0,sqlgeneral);
      edbuscar.text:='';
      edbuscarprov.Text:='';
      rgmoneda.ItemIndex:=-1;
      if sqlgeneral.RecordCount = 0 then
         begin
         btnmodificar.Enabled:=false;
         btnborrar.Enabled:=false;
         end;
      end;
  end;
end;

procedure TfrmRequisiciones.RejillaDBTableView1DblClick(Sender: TObject);
begin
   ModificaArticulo(sqlreal,'tmpReqDetalle'+frmprincipal.idmaq,'idreqint',edbuscar.Text);
end;

procedure TfrmRequisiciones.RejillaDBTableView1KeyPress(Sender: TObject;var Key: Char);
var cant, idart :integer;
begin
idart := strtoint(dsrejilla.DataSet.FieldValues['idart']);
cant:=0;
if (rejilla.Enabled) and (key='+') then  //  SI ES +
   begin
   //incrementa en uno la cantidad de unidades o piezas que se halla cotizado
   if (dsrejilla.DataSet.FieldValues['cantord'] <> '0') and (btnalta.Enabled) then
      begin
      querys('select idcabm, if( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cantord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from Cabms where idcabm='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
      if sqlgeneral.FieldByName('idcabm').AsString = '' then
         begin
         application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
         exit;
         end;
      cant := strtoint(dsrejilla.DataSet.FieldValues['cantord']) + 1;
      end
   else
      begin
      if (dsrejilla.DataSet.FieldValues['cantord'] <> '0') and  (btnalta.Enabled=false) then
         begin
         querys('select idcabm,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cantord'])+' + '+quotedstr(edcantidad.text)+') + (existencia/piezasxunidad)), 1, 0) as condicion from Cabms where idcabm='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
         if sqlgeneral.FieldByName('idcabm').AsString = '' then
            begin
            application.MessageBox('Se excede de existencias para ese articulo','Información',mb_ok+mb_iconinformation);
            exit;
            end;
         cant := strtoint(dsrejilla.DataSet.FieldValues['cantord']) + 1;
         end;
      end;

   end;

if (rejilla.Enabled) and (key='-') then //
   begin
   if (dsrejilla.DataSet.FieldValues['cantord'] <> '0') and (btnalta.Enabled) then
      cant := strtoint(dsrejilla.DataSet.FieldValues['cantord']) - 1
   else
      begin
      if (dsrejilla.DataSet.FieldValues['cantord'] <> '0') and (btnalta.Enabled=false) then
         cant := strtoint(dsrejilla.DataSet.FieldValues['cantord']) - 1;
      end;
   end;

querys('update tmpReqDetalle'+frmprincipal.idmaq+' set cantord='+inttostr(cant)+', iva='+quotedstr(Format('%8.2f',[(strtofloat(edcosto_unidad.Text)*cant)*getIVA]))+
       ', subtotal='+quotedstr(Format('%8.2f',[(strtofloat(edcosto_unidad.Text)*cant)]))+', total='+quotedstr(Format('%8.2f',[(strtofloat(edcosto_unidad.Text)*cant)*(1+GetIva)]))+
       ' where idart='+quotedstr(dsrejilla.DataSet.FieldValues['idart']),1,sqlgeneral);
operacion;                                                                                                                              //sleep(1000);
//borrar los registros que no tengan valores en cantidad y piezas.........
querys('delete from tmpReqDetalle'+frmprincipal.idmaq+' where cantord=0 ',1,sqlgeneral);
                     
sqlreal.Close;
sqlreal.Open;
sqlreal.Locate('idart',idart,[]);
if sqlreal.RecordCount = 0 then
   begin
   rejilla.Enabled:=false;
   edsubtotal.Text:='0';
   edtotal.Text:='0';
   end;
   
end;

procedure TfrmRequisiciones.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

  if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then begin
     showmessage('No has guardado los datos, si deseas salir oprime el boton cancelar');
     canclose:=false;
  end;//botones

end;

procedure TfrmRequisiciones.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key=46) and (rejilla.Enabled) then
   begin
  //elimina el registro del articulo
   querys('delete from tmpReqDetalle'+frmprincipal.idmaq+' where idcabm='+quotedstr(dsrejilla.DataSet.FieldValues['idcabm']),1,SqlGeneral);
   operacion;
   //refresca la rejilla de datos
   sqltemp.Close;
   querys('Select * from tmpReqDetalle'+frmprincipal.idmaq+' order by idcabm',0, sqltemp);
   //sqltemp.Open;
   if sqltemp.RecordCount = 0 then
      rejilla.Enabled:=false;
   end;

if ((key=40) or (key=38) or (key=33) or (key=34)) then  //si fue un pg dowm ó flechas
   mostrar_registros;
end;

procedure TfrmRequisiciones.edTipoCambioKeyPress(Sender: TObject;
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

procedure TfrmRequisiciones.edfleteKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisiciones.edcomentariosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisiciones.rgmonedaChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
if newindex = 0 then
   edTipoCambio.Enabled:=true
else
   edTipoCambio.Enabled:=false;
end;

procedure TfrmRequisiciones.spproveedoresClick(Sender: TObject);
begin
frmprincipal.muestra_mdichild(361,690,tfrmproveedores,'Acceso la Pantalla de Proveedores');
end;

procedure TfrmRequisiciones.spbarticulosClick(Sender: TObject);
begin
frmprincipal.muestra_mdichild(535,759,tfrmarticulos,'Acceso la Pantalla de tipos de Cabms');
end;

procedure TfrmRequisiciones.dvigenciaEnter(Sender: TObject);
begin
if btnalta.Enabled =true then
dvigencia.Date:=NOW;
end;

procedure TfrmRequisiciones.dentrega1Enter(Sender: TObject);
begin
if btnalta.Enabled =true then
dentrega.Date:=NOW;
end;

procedure TfrmRequisiciones.edfletes1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisiciones.edbuscarprovButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
    frmbusquedas.query:='select idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as nombre,usuario,fecha,hora,estatus from proveedores order by estatus desc, nombre asc';
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

procedure TfrmRequisiciones.edbuscarprovKeyPress(Sender: TObject;
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

procedure TfrmRequisiciones.edestatusKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
  key:=#0;
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  //rgmoneda.ItemIndex:=0;
  end;
end;

procedure TfrmRequisiciones.RejillaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
mostrar_registros;
end;

procedure TfrmRequisiciones.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then
   begin
   tblordenes.Active:=false;
   sqlreal.Close;
   edbuscarprov.text:='';
   edprov.text:='';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edestatus.text:='';
   estatus.caption:='';
   edTipoCambio.Text:='';
   edsolicitante.Text:='';
   edusuario.Text:='';
   edcargo.Text:='';
   ednomsol.Text:='';
   ednomuser.Text:='';
   ednomcargo.Text:='';
   end;
end;

procedure TfrmRequisiciones.edbuscarprovChange(Sender: TObject);
begin
    if edbuscarprov.text = '' then
       edprov.text:='';
end;

procedure TfrmRequisiciones.rgmonedaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)  then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmRequisiciones.edTipoCambioExit(Sender: TObject);
begin
if edTipoCambio.Text = '' then
edTipoCambio.SetFocus;
end;

procedure TfrmRequisiciones.rgmonedaEnter(Sender: TObject);
begin
rgmoneda.ItemIndex:=0;
edtipocambio.enabled:=true;
end;

procedure TfrmRequisiciones.edfletes1Exit(Sender: TObject);
begin
operacion;
end;

procedure TfrmRequisiciones.edotrosg1Exit(Sender: TObject);
begin
operacion;
end;

procedure TfrmRequisiciones.edestatusNotInList(Sender: TObject);
begin
edestatus.itemindex:=0;
end;

procedure TfrmRequisiciones.rgmonedaNotInList(Sender: TObject);
begin
rgmoneda.itemindex:=0;
end;

procedure TfrmRequisiciones.edcodigoChange(Sender: TObject);
begin
if edcodigo.text = '' then
    LimpiaDatArt;
end;

procedure TfrmRequisiciones.FormShow(Sender: TObject);
begin
edbuscar.SetFocus;
end;

procedure TfrmRequisiciones.btncerrarClick(Sender: TObject);
begin
if Cbarticulo.text <> '' then
  begin
  querys('Select * from Cabms where descripcion='+quotedstr(cbarticulo.text), 0, sqlgeneral);
  InsertaArticulo(sqlgeneral.fieldbyname('idcabm').AsString);
  end;
PBuscaArt.visible := false;
end;

procedure TfrmRequisiciones.cbgrupoSelect(Sender: TObject);
begin
cbclase.clear;
cbarticulo.clear;
cbclase.text := '';
cbarticulo.text := '';
querys('Select left(idcabm, 3) as idcabm from CabmsGrupo where descripcion ='+quotedstr(cbgrupo.text), 0, sqlgeneral);
querys('select descripcion from CabmsClase where left(idcabm, 3)='+quotedstr(sqlgeneral.fieldbyname('idcabm').AsString), 0, dmreportes.sqlgeneral2);
if dmreportes.sqlgeneral2.recordcount <> 0 then
  begin
  cargacombo2('select idcabm, descripcion from CabmsClase where left(idcabm, 3) = '+quotedstr(sqlgeneral.fieldbyname('idcabm').AsString),  'descripcion', 'idcabm', cbclase);
  cbclase.enabled := true;
  end
else
  begin
  cargacombo2('select idcabm, descripcion from Cabms where left(idcabm, 3) = '+quotedstr(sqlgeneral.fieldbyname('idcabm').AsString),  'descripcion', 'idcabm', cbarticulo);
  cbclase.enabled := false;
  cbarticulo.SetFocus;
  exit;
  end;
cbclase.setfocus;
end;

procedure TfrmRequisiciones.cbclaseSelect(Sender: TObject);
begin
cbarticulo.clear;
cbarticulo.text := '';
querys('Select left(idcabm, 5) as idcabm from CabmsClase where descripcion ='+quotedstr(cbclase.text), 0, sqlgeneral);
cargacombo2('select idcabm, descripcion from Cabms where left(idcabm, 5) = '+quotedstr(sqlgeneral.fieldbyname('idcabm').AsString),  'descripcion', 'idcabm', cbarticulo);
cbclase.setfocus;
end;

procedure TfrmRequisiciones.edsolicitanteButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='select idusuario, if(usuarios.apaterno is NULL or usuarios.apaterno='''', usuarios.nombre, if(usuarios.amaterno is NULL or usuarios.amaterno='''', '+
         'concat(usuarios.nombre, '' '', usuarios.apaterno), concat(usuarios.nombre, '' '', usuarios.apaterno, '' '', usuarios.amaterno))) as Nombre '+
         'from usuarios having Nombre <> '''' order by nombre asc';
  campo_retorno:='idusuario';
  campo_busqueda:='nombre';
  tblorigen := 'usuarios';
  tabla:='';
  ShowModal;
  if resultado <> '' then
     begin
     querys('select idusuario, if(usuarios.apaterno is NULL or usuarios.apaterno='''', usuarios.nombre, if(usuarios.amaterno is NULL or usuarios.amaterno='''', '+
            'concat(usuarios.nombre, '' '', usuarios.apaterno), concat(usuarios.nombre, '' '', usuarios.apaterno, '' '', usuarios.amaterno))) as Nombre from usuarios where idusuario='+quotedstr(resultado),0,SqlGeneral);
     if edsolicitante.Focused = true then
        begin
        edsolicitante.Text:=frmbusquedas.resultado;
        ednomsol.Text := sqlgeneral.fieldbyname('nombre').AsString;
        end;
     if edusuario.Focused = true then
        begin
        edusuario.Text:=frmbusquedas.resultado;
        ednomuser.Text := sqlgeneral.fieldbyname('nombre').AsString;
        end;
     if edcargo.Focused = true then
        begin
        edcargo.Text:=frmbusquedas.resultado;
        ednomcargo.Text := sqlgeneral.fieldbyname('nombre').AsString;
        end;
     end;//frmbusquedas
  end;
end;

procedure TfrmRequisiciones.edsolicitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, true);
if (key = #13) and (edsolicitante.Text <> '') then
   begin
   buscausuario(ednomsol, edsolicitante);
   end;
end;

procedure TfrmRequisiciones.edusuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, true);
if (key = #13) and (edusuario.Text <> '') then
   begin
   buscausuario(ednomuser, edusuario);
   end;
end;

procedure TfrmRequisiciones.edcargoKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, true);
if (key = #13) and (edcargo.Text <> '') then
   begin
   buscausuario(ednomcargo, edcargo);
   end;
end;

procedure TfrmRequisiciones.buscausuario(editor:TRzEdit; editornum:TRzButtonEdit);
begin
  querys('select if(usuarios.apaterno is NULL or usuarios.apaterno='''', usuarios.nombre, if(usuarios.amaterno is NULL or usuarios.amaterno='''', concat(usuarios.nombre, '' '', usuarios.apaterno), '+
         'concat(usuarios.nombre, '' '', usuarios.apaterno, '' '', usuarios.amaterno))) as Nombre from usuarios where idusuario='+quotedstr(editornum.text), 0, sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
    begin
    application.messagebox('No existe ese usuario!', 'Aviso', MB_ICONEXCLAMATION);
    editornum.SetFocus;
    end
  else
    begin
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    editor.Text := sqlgeneral.fieldbyname('nombre').AsString;
    end;
end;

procedure TfrmRequisiciones.InsertaArticulo(idarticulo:string);
begin
  if querys('Select * from Cabms where idcabm='+quotedstr(idarticulo)+' and nivel = 3 and estatus = 1', 0, sqlgeneral) = 0 then
    begin
    application.messagebox('El articulo no existe o se encuentra Inactivo', 'Atencion', mb_iconinformation);
    edcodigo.setfocus;
    exit;
    end;


  edcodigo.text := sqlgeneral.fieldbyname('idcabm').AsString;
  // Este proceso es para verificar que no se revuelvan los productos preautoriazados con los no preautorizados

  if NoAutorizables = False then  // ej gasolina
     begin
     if (sqlreal.RecordCount >= 1) and (sqlgeneral.fieldbyname('preautorizado').asinteger = 1) then
        begin
        application.messagebox('No se pueden agregar Articulos pre autorizados a una requisicion de Articulos No Autorizados', 'Atencion', MB_ICONSTOP);
        edcodigo.text := '';
        edcodigo.SetFocus;
        exit;
        end;

     if sqlgeneral.fieldbyname('preautorizado').asinteger = 1 then
        begin
        NoAutorizables := True;
        edcant_sur.enabled:= true;
        end;
     end
  else
     begin
     if sqlgeneral.fieldbyname('preautorizado').asinteger = 1 then
        begin
        NoAutorizables := True;
        edcant_sur.enabled:= true;
        end
     else
        begin
        application.messagebox('No se pueden agregar Articulos no autorizados a una requisicion de Articulos previamente autorizados', 'Atencion', MB_ICONSTOP);
        edcodigo.text := '';
        edcodigo.SetFocus;
        exit;
        end;
     end;

  ediva_art.Text := '0.00';
  EdCosto_unidad.Text := '0.00';
  eddescripcion.text := sqlgeneral.fieldbyname('descripcion').AsString;
  edmin.Text := inttostr(sqlgeneral.fieldbyname('minimo').Asinteger);
  edmax.Text := inttostr(sqlgeneral.fieldbyname('maximo').Asinteger);
  edpieza.Text := inttostr(sqlgeneral.fieldbyname('piezasxunidad').Asinteger);
  edexist.Text := inttostr(sqlgeneral.fieldbyname('existencia').Asinteger);
  if sqlgeneral.fieldbyname('ultima_compra').asstring <> '' then
     edultcompra.Text := datetostr(sqlgeneral.fieldbyname('ultima_compra').AsDateTime);
  btnagregar.enabled:=true;
  EdCosto_unidad.setfocus;
end;

procedure TfrmRequisiciones.CreaTemporal;
begin
querys('Drop table if exists tmpReqDetalle'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpReqDetalle'+frmprincipal.idmaq+' (idcabm varchar(10), descripcion varchar(100), cantord int(11), cantsurt int(11), comentario text, '+
       'ult_compra date, costo float, subtotal float, iva float, total float, minimo int(11), maximo int(11), existencia int(11), idproveedor int(11), fechaentrega date, moneda varchar(1), '+
       'tc float, factura varchar(20), PRIMARY KEY (idcabm))', 1, sqlgeneral);
end;

procedure TfrmRequisiciones.btnbuscaartClick(Sender: TObject);
begin
PBuscaArt.visible := true;
cargacombo2('Select * from CabmsGrupo', 'descripcion', 'idcabm', cbgrupo);
cbgrupo.SetFocus;
end;

procedure TfrmRequisiciones.rgmonedaSelect(Sender: TObject);
begin
 if rgmoneda.Text = 'D' then
   begin
   querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
   edTipoCambio.Text:=Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]);
   edtipocambio.Enabled:=true;
   sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
   end
else
   begin
   edtipocambio.Enabled:=false;
   sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TfrmRequisiciones.EdCosto_unidadKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key, false);
  if (key = #13) and (EdCosto_unidad.Text <> '') then
     begin
     ediva_art.text := Format('%8.2f',[strtofloat(edcosto_unidad.text) * GetIVA]);
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;

end;

procedure TfrmRequisiciones.ediva_artKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key, false);
  if (key = #13) and (ediva_art.Text <> '') then
     begin
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure TfrmRequisiciones.edcant_surKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=ValidaNumeros(key, false);
  if (key = #13) and (edcant_sur.Text <> '') then
     begin
     edcantidad.text := edcant_sur.Text;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure TfrmRequisiciones.Alta;
begin  /// Guardar Alta
  try
    pnldatos.Enabled:=false;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Orden de Compra';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=true;
    btnmodificar.Enabled:=true;
    frmprincipal.ucprincipal.Log('Dio de Alta la Requisicion Interna:'+edbuscar.text,1);
    querys('select max(idrequisicion) as idorden from RequisicionesInternas',0,sqlgeneral);
    edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    tblordenesidrequisicion.asstring:=edbuscar.text;
    tblordenesusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
    tblordenes.Post;///grabar y poner en modo edición....
    LimpiaDatArt;
    /// Crea el Detalle de la requisicion
    querys('Select * from tmpReqDetalle'+frmprincipal.idmaq, 0, sqlreal);
    sqlreal.First;
    while not sqlreal.Eof = true do
      begin
      querys('Select max(idreqdetalle) as idreqdetalle from ReqIntDetalle', 0, sqlgeneral);
      querys('Insert into ReqIntDetalle (idreqdetalle, idrequisicion, idcabm, cantord, cantsurt, comentario, costo, subtotal, iva, total) values ('+
            quotedstr(inttostr(sqlgeneral.fieldbyname('idreqdetalle').Asinteger+1))+', '+quotedstr(edbuscar.text)+', '+quotedstr(sqlreal.fieldbyname('idcabm').AsString)+', '+
            quotedstr(sqlreal.fieldbyname('cantord').AsString)+', '+quotedstr(sqlreal.fieldbyname('cantsurt').AsString)+', '+quotedstr(sqlreal.fieldbyname('comentario').AsString)+', '+
            quotedstr(sqlreal.fieldbyname('costo').AsString)+', '+quotedstr(sqlreal.fieldbyname('subtotal').AsString)+', '+quotedstr(sqlreal.fieldbyname('iva').AsString)+', '+
            quotedstr(sqlreal.fieldbyname('total').AsString)+')',1,SqlGeneral);
      if (edestatus.text = 'SURTIDO/FACTURA') or (edestatus.text = 'CERRADO INCOMPLETO') then
      querys('Update Cabms set ultima_compra='+quotedstr(sqlreal.fieldbyname('fechaentrega').AsString)+' where idcabm='+quotedstr(sqlreal.fieldbyname('idcabm').AsString), 1, sqlgeneral);
      sqlreal.Next;
      end;
    //borrar temporales......
    querys('Drop Table if Exists tmpReqDetalle'+frmprincipal.idmaq,1,SqlGeneral);
    edbuscar.Enabled:=true;
    application.MessageBox('Requisicion Interna registrada','Información',mb_iconInformation);
  except
    begin   //comprobar si puede seguir guardandose
    application.MessageBox('Ocurrio un error al tratar de Guardar la Requisicion. Intente Guardarla de Nuevo o Cree una Nueva','Información',MB_ICONERROR);
    querys('Delete from RequisicionesInternas where idrequisicion='+edbuscar.text, 1, sqlgeneral);
    querys('Delete from ReqIntDetalle where idrequisicion='+edbuscar.text, 1, sqlgeneral);
    btnalta.caption := '&Guardar';
    btncancelar.caption := '&Cancelar';
    btnborrar.Enabled := false;
    btnmodificar.Enabled := false;
    btnalta.setfocus;
    end;
  end; //try
end;

procedure TfrmRequisiciones.Editar;
begin
if (edestatus.text = 'SURTIDO/FACTURA') and (edfactura.text = '') then
  begin
  application.MessageBox('Falta el campo de FACTURA', 'Atencion', MB_ICONEXCLAMATION);
  edfactura.SetFocus;
  exit;
  end;
/// guarda
   try
      btncancelar.Caption:='&Cerrar';
      btnmodificar.Caption:='&Editar';
      btnmodificar.hint:='Editar los datos de la Requisicion Actual';
      btnmodificar.ImageIndex:=2;
      frmprincipal.ucprincipal.Log('Edito la Requisicion:'+tblordenesidrequisicion.AsString,2);
      tblOrdenes.fieldbyname('estatus').AsString:=edestatus.Text;

      //modificar el campo ordenados de Cabms y insertar las modificaciones de ordenes
      querys('Delete from ReqIntDetalle where idrequisicion='+quotedstr(edbuscar.Text), 1, sqlgeneral);
      querys('Insert into ReqIntDetalle (idcabm, idrequisicion, cantord, cantsurt, comentario, costo, subtotal, iva, total) '+
             'select idcabm, '+quotedstr(edbuscar.Text)+' as idrequisicion, cantord, cantsurt, comentario, costo, subtotal, iva, total '+
             'from tmpReqDetalle'+frmprincipal.idmaq+' order by idcabm',1,frmprincipal.SqlGeneral);

      if (edestatus.text = 'SURTIDO/SIN FACTURA') or (edestatus.text = 'SURTIDO/FACTURA') then
        begin
        querys('select idcabm, cantord, total from tmpReqDetalle'+frmprincipal.idmaq+' order by idcabm',1,frmprincipal.SqlGeneral);
        querys('Update Cabms set existencia=existencia+'+frmprincipal.sqlgeneral.fieldbyname('cantord').asstring+', '+
               'ultimocosto='+frmprincipal.sqlgeneral.fieldbyname('total').asstring+', moneda="'+rgmoneda.text+'" '+
               'where idcabm = "'+frmprincipal.sqlgeneral.fieldbyname('idcabm').asstring+'"', 1, dmreportes.sqlgeneral4);
        end;
     {if edestatus.Text = 'CERRADO INCOMPLETO' then
        begin
        querys('select idcabm, cantsurt, total from tmpReqDetalle'+frmprincipal.idmaq,1,frmprincipal.SqlGeneral);
        querys('Update Cabms set existencia=existencia+'+frmprincipal.sqlgeneral.fieldbyname('cantsurt').asstring)+', '+
               'ultimocosto='+frmprincipal.sqlgeneral.fieldbyname('total').asstring)+', moneda='+rgmoneda.text+', '+
               'where idcabm = '+frmprincipal.sqlgeneral.fieldbyname('idcabm').asstring), 1, dmreportes.sqlgeneral4);
        end;}

      querys('DROP TABLE IF EXISTS tmpReqDetalle'+frmprincipal.idmaq, 1, sqlgeneral);
      tblordenes.Post;

      btnalta.Enabled:=true;
      btnborrar.Enabled:=true;
      edbuscar.Enabled:=true;
      edbuscarprov.Enabled:=true;
      pnldatos.Enabled:=false;
      gbarticulo.Enabled:=false;
      rejilla.Enabled:=false;
      LimpiaDatArt;

      application.MessageBox('Orden de Compra Modificada!','Información',mb_iconinformation);
      edbuscar.setfocus;
      //// fin guarda
   except
      application.MessageBox('Ocurrio un error al tratar de Guardar la Requisicion, verifique que esta haya sido guardada correctamente','Información',MB_ICONERROR);
   end;

end;

procedure TfrmRequisiciones.dentregaKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=ValidaNumeros(key, false);
  if key = #13 then
     begin
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure TfrmRequisiciones.edfacturaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
 
end;

procedure TfrmRequisiciones.ednomsolKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
     begin
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure TfrmRequisiciones.ednomuserKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     begin
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure TfrmRequisiciones.ednomcargoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     begin
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     end;
end;

procedure TfrmRequisiciones.btnimprimirClick(Sender: TObject);
begin
querys('Select r.idrequisicion, r.FechaRequisicion, r.HoraRequisicion, r.FechaVigencia, r.subtotal, r.iva, '+
       'r.total, r.estatus, r.fletes, r.otros, r.DatosEntrega, r.TotalProductos, '+
       'r.autorizado, r.factura, r.idproveedor, r.moneda, r.tc, r.fechaentrega, rd.idcabm, '+
       'c.descripcion, cantord, cantsurt, rd.comentario, rd.costo as rdcosto, rd.subtotal as rdsubtotal, '+
       'rd.iva as rdiva, rd.total as rdtotal, idprov, '+ClienteNombre('p')+' as proveedor, '+
       UsuarioNombre('u')+' as usuario, '+UsuarioNombre('cg')+' as carguesea, '+UsuarioNombre('s')+' as solicitante '+
       'From RequisicionesInternas AS r left join ReqIntDetalle as rd on rd.idrequisicion=r.idrequisicion '+
       'left join Cabms as c on c.idcabm=rd.idcabm left join proveedores as p on r.idproveedor=p.idprov '+
       'left join usuarios as s on s.idusuario=r.solicitante left join usuarios as cg on cg.idusuario=r.carguesea '+
       'left join usuarios as u on u.idusuario=r.idusuario', 0, dmreportes.sqlgeneral);

OperacionReporte('RequisicionesInternas', 'Requisicion Interna', 'IMP', 1);
end;

End.
