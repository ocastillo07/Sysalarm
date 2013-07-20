//2008/02/28 dalyla zona horaria ok
//Ultima Modificacion:
//Modificado por:
unit UExClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DB, MyAccess, Menus, MemDS, DBAccess, Grids,
  DBGrids, Mask, StdCtrls, RzCmboBx, RzDBEdit, RzButton, RzEdit, RzLabel,
  RzDBCmbo, UCBase, LMDCustomComponent, LMDWndProcComponent,
  LMDMouseBaseCtrl, LMDMouseFencer, DBCtrls, ComCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit,
  cxMaskEdit, RzTabs, RzDBNav, cxCurrencyEdit, RzBtnEdt, RzDBBnEd,
  LMDPopupMenu, LMDContainerComponent, LMDBaseDialog, LMDCalendarDlg,
  RzDTP, RzDBDTP, RzRadChk, RzDBChk, ToolWin, RzBckgnd;
                                                  {CurrEdit,  ToolWin, ToolEdit,}
type
    TfrmExClientes = class(TForm)
    DSclientes: TDataSource;
    sqlgeneral: TMyQuery;
    tblexclientes: TMyTable;
    fuentes: TFontDialog;
    gbclientes: TGroupBox;
    RzLabel2: TRzLabel;
    lblcp: TRzLabel;
    lblcalle: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblalta: TRzLabel;
    lblamaterno: TRzLabel;
    lblapaterno: TRzLabel;
    lblrazon: TRzLabel;
    lblcomentarios: TRzLabel;
    lblnombre: TRzLabel;
    edciudad: TRzDBEdit;
    edcalle: TRzDBEdit;
    edestado: TRzDBEdit;
    dtalta: TRzDBDateTimeEdit;
    edamaterno: TRzDBEdit;
    edapaterno: TRzDBEdit;
    ednombre: TRzDBEdit;
    edrazon: TRzDBEdit;
    recomentarios: TRzDBRichEdit;
    ednumero: TRzDBEdit;
    edmskrfc: TcxDBMaskEdit;
    navegador: TRzDBNavigator;
    lblclave: TRzLabel;
    DScolonias: TDataSource;
    RzLabel3: TRzLabel;
    EDMAIL: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzLabel6: TRzLabel;
    cbocolonias: TRzDBLookupComboBox;
    DScategoria: TDataSource;
    tblcategoria: TMyTable;
    tblcategoriaidcategoria: TIntegerField;
    tblcategorianombre: TStringField;
    RzLabel1: TRzLabel;
    RzLabel8: TRzLabel;
    EDcp: TRzDBEdit;
    SQLcolonias: TMyQuery;
    EDsector: TRzDBEdit;
    RzLabel9: TRzLabel;
    edmskcurp: TcxDBMaskEdit;
    RzLabel10: TRzLabel;
    cboprecio: TRzDBComboBox;
    EDCONTRASENA: TRzDBEdit;
    RzLabel11: TRzLabel;
    ednum_giro: TRzDBNumericEdit;
    lblgiro: TRzLabel;
    cbonom_giro: TRzComboBox;
    ednum_categoria: TRzDBNumericEdit;
    cbonom_categoria: TRzComboBox;
    lblcategoria: TRzLabel;
    cboalarma: TRzDBComboBox;
    ednum_fuente: TRzDBNumericEdit;
    cbonom_fuente: TRzComboBox;
    lblfuente: TRzLabel;
    cbonom_origen: TRzComboBox;
    lblorigen: TRzLabel;
    edclave: TRzButtonEdit;
    SQLcoloniasnombre: TStringField;
    SQLcoloniasidcol: TIntegerField;
    SQLcoloniascp: TIntegerField;
    SQLcoloniasidsector: TSmallintField;
    SQLcoloniassector: TStringField;
    RzLabel5: TRzLabel;
    edcredito: TRzDBNumericEdit;
    RzLabel7: TRzLabel;
    RzLabel12: TRzLabel;
    edplazo: TRzDBEdit;
    ppmopciones: TLMDPopupMenu;
    DatosFacturacion1: TMenuItem;
    telefonos1: TMenuItem;
    Responsables1: TMenuItem;
    Referencias1: TMenuItem;
    Usuarios1: TMenuItem;
    OtrosDatos1: TMenuItem;
    RzLabel13: TRzLabel;
    cboestatus: TRzComboBox;
    ppmnotas: TLMDPopupMenu;
    Generales1: TMenuItem;
    emporales1: TMenuItem;
    lblCantBloq: TRzLabel;
    lblbloqueado: TRzLabel;
    Historial1: TMenuItem;
    Motivocancelacin1: TMenuItem;
    ednum_origen: TRzDBEdit;
    Ventas1: TMenuItem;
    gbcontrato: TRzGroupBox;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    edmontocont: TRzDBEdit;
    dtpdesdecont: TRzDBDateTimePicker;
    dtphastacont: TRzDBDateTimePicker;
    edTipoCont: TRzButtonEdit;
    edNomContrato: TRzEdit;
    gbabogado: TRzGroupBox;
    lblidabogado: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    edNumDemanda: TRzDBEdit;
    dtpfechaabo: TRzDBDateTimePicker;
    edcveabogado: TRzButtonEdit;
    edNumEmbargo: TRzDBEdit;
    RzLabel21: TRzLabel;
    edNomAbogado: TRzEdit;
    RzLabel22: TRzLabel;
    Cobros1: TMenuItem;
    RzDBCheckBox1: TRzDBCheckBox;
    edCveVend: TRzEdit;
    CboVendedor: TRzComboBox;
    lblFecBloq: TRzLabel;
    lAA1: TMenuItem;
    emporalMonitoreo1: TMenuItem;
    edReferencias: TRzDBEdit;
    RzLabel23: TRzLabel;
    RzDBRichEdit1: TRzDBRichEdit;
    btnzonas: TRzBitBtn;
    btntrafico: TRzBitBtn;
    lbUltMod: TRzLabel;
    chkonline: TRzDBCheckBox;
    btnservicios: TRzBitBtn;
    lbltelefono: TRzLabel;
    RzDBCheckBox2: TRzDBCheckBox;
    RzDBCheckBox3: TRzDBCheckBox;
    btnnotas: TRzMenuButton;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    btnopciones: TRzMenuButton;
    bonificaciones: TMenuItem;
    RzDBCheckBox4: TRzDBCheckBox;
    lbcargosautomaticos: TRzLabel;
    RzDBCheckBox5: TRzDBCheckBox;
    Componentes1: TMenuItem;
    lblUltServicio: TRzLabel;
    HorariosdeAperturasyCierres1: TMenuItem;
    RzDBCheckBox6: TRzDBCheckBox;
    SeguimientoNoseales1: TMenuItem;
    lbltravelers: TRzLabel;
    lblservicios: TRzLabel;
    lblinstalaciones: TRzLabel;
    RzLabel25: TRzLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzLabel26: TRzLabel;
    Pweb: TRzGroupBox;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    edusuarioweb: TRzDBEdit;
    edpasswordweb: TRzDBEdit;
    lbAdeudos: TRzLabel;
    RzLabel24: TRzLabel;
    cboprotocolos: TRzComboBox;
    tblexclientesidcliente: TIntegerField;
    tblexclientesrfc: TStringField;
    tblexclientesrsocial: TStringField;
    tblexclientescurp: TStringField;
    tblexclientesnombre: TStringField;
    tblexclientesapaterno: TStringField;
    tblexclientesamaterno: TStringField;
    tblexclientesdir: TStringField;
    tblexclientesnumero: TStringField;
    tblexclientesciudad: TStringField;
    tblexclientesestado: TStringField;
    tblexclientescp: TStringField;
    tblexclientessector: TStringField;
    tblexclientesrefs: TStringField;
    tblexclientespass: TStringField;
    tblexclientesidtipo: TSmallintField;
    tblexclientesalarm: TStringField;
    tblexclientespermit: TStringField;
    tblexclientestelefono: TStringField;
    tblexclientesstopmode: TStringField;
    tblexclientesemail: TStringField;
    tblexclientessendmail: TSmallintField;
    tblexclientesidcol: TStringField;
    tblexclientesst_date: TDateField;
    tblexclientesidgiro: TIntegerField;
    tblexclientesidtel: TIntegerField;
    tblexclientesidcontacto: TIntegerField;
    tblexclientesprecio: TStringField;
    tblexclientesidcategoria: TSmallintField;
    tblexclientespassword: TStringField;
    tblexclientesbeeper: TStringField;
    tblexclientescelular: TStringField;
    tblexclientescomentario: TMemoField;
    tblexclientesidvendedor: TIntegerField;
    tblexclientestype: TStringField;
    tblexclientesidfact: TIntegerField;
    tblexclientesidorigen: TIntegerField;
    tblexclientesidfuente: TIntegerField;
    tblexclientesusuario: TStringField;
    tblexclientesfecha: TStringField;
    tblexclienteshora: TStringField;
    tblexclientesidreferencia: TIntegerField;
    tblexclientescredito: TFloatField;
    tblexclientesPlazoCredito: TIntegerField;
    tblexclientesidusuario: TIntegerField;
    tblexclientesestatus: TSmallintField;
    tblexclientesidnota: TLargeintField;
    tblexclientesbloqueado: TSmallintField;
    tblexclientesNotaBloqueo: TMemoField;
    tblexclientesUltimaCompra: TDateField;
    tblexclientesTotComprado: TFloatField;
    tblexclientessaldo: TFloatField;
    tblexclientesidusuarios: TIntegerField;
    tblexclientesidprotocolo: TIntegerField;
    tblexclientesPruebaSema: TIntegerField;
    tblexclientespoliza: TIntegerField;
    tblexclientesFechaPoli: TDateField;
    tblexclientesEstVul: TIntegerField;
    tblexclientesArtDesc: TIntegerField;
    tblexclientesFechaPolVe: TDateField;
    tblexclientesNoPatrulla: TIntegerField;
    tblexclientesClienteAlarmex: TIntegerField;
    tblexclientesCantUltCompra: TFloatField;
    tblexclientesvendedor: TStringField;
    tblexclientesMontoCont: TFloatField;
    tblexclientesTipoCont: TStringField;
    tblexclientesDesdeCont: TDateField;
    tblexclientesHastaCont: TDateField;
    tblexclientesidabogado: TIntegerField;
    tblexclientesFechaAbo: TDateField;
    tblexclientesNumDemanda: TStringField;
    tblexclientesNumEmbargo: TStringField;
    tblexclientesFechaCancelacion: TDateField;
    tblexclientesMemoCancelacion: TMemoField;
    tblexclientesidmotivo: TIntegerField;
    tblexclientesdeducible: TBooleanField;
    tblexclientesNotaUbicacion: TMemoField;
    tblexclientesidsupervisor: TIntegerField;
    tblexclientesultfectraf: TDateField;
    tblexclientesultfecps: TDateField;
    tblexclientesGrupoTrafico: TIntegerField;
    tblexclientesVenceContrato: TSmallintField;
    tblexclientesidnocliente: TIntegerField;
    tblexclientesFechaNoCliente: TDateField;
    tblexclientesidOpenClose: TIntegerField;
    tblexclientesusuarioweb: TStringField;
    tblexclientespasswordweb: TStringField;
    RzLabel29: TRzLabel;
    DTBaja: TRzDBDateTimeEdit;
    RzLabel30: TRzLabel;
    edidnocliente: TRzEdit;
    ltitulo: TRzLabel;
    btncancelar: TRzBitBtn;
    btnalta: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    bg: TRzPanel;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure rejilla_telsDblClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure popmtelefonosPopup(Sender: TObject);
    procedure dtaltaClick(Sender: TObject);
    procedure edtelefonoEnter(Sender: TObject);
    procedure edtelefonoExit(Sender: TObject);
    procedure edciudadEnter(Sender: TObject);
    procedure edestadoEnter(Sender: TObject);
    procedure edamaternoKeyPress(Sender: TObject; var Key: Char);
    procedure btnfuentesClick(Sender: TObject);
    procedure recomentariosEnter(Sender: TObject);
    procedure recomentariosExit(Sender: TObject);
    procedure edrazonChange(Sender: TObject);
    procedure edmskrfcKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreChange(Sender: TObject);
    procedure SQLcoloniasAfterScroll(DataSet: TDataSet);
    procedure cbocoloniasKeyPress(Sender: TObject; var Key: Char);
    procedure LBtipoKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_giroKeyPress(Sender: TObject; var Key: Char);
    procedure cbotelefonosKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_giroKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_giroExit(Sender: TObject);
    procedure cbonom_giroExit(Sender: TObject);
    procedure ednum_categoriaExit(Sender: TObject);
    procedure ednum_categoriaKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_categoriaExit(Sender: TObject);
    procedure cbonom_categoriaKeyPress(Sender: TObject; var Key: Char);
    procedure cboalarmaDropDown(Sender: TObject);
    procedure cbonom_giroSelect(Sender: TObject);
    procedure cbonom_categoriaSelect(Sender: TObject);
    procedure edmskrfcPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure ednum_origenKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_origenExit(Sender: TObject);
    procedure cbonom_origenSelect(Sender: TObject);
    procedure cbonom_origenKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_origenExit(Sender: TObject);
    procedure ednum_fuenteKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_fuenteExit(Sender: TObject);
    procedure cbonom_fuenteSelect(Sender: TObject);
    procedure cbonom_fuenteKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_fuenteExit(Sender: TObject);
    procedure cbonom_fuenteDropDown(Sender: TObject);
    procedure cbonom_origenDropDown(Sender: TObject);
    procedure cboprecioKeyPress(Sender: TObject; var Key: Char);
    procedure cboalarmaKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure CboVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure edcreditoKeyPress(Sender: TObject; var Key: Char);
    procedure DatosFacturacion1Click(Sender: TObject);
    procedure OtrosDatos1Click(Sender: TObject);
    procedure Responsables1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure telefonos1Click(Sender: TObject);
    procedure Notas1Click(Sender: TObject);
    procedure ppmopcionesBeforePopUp(Sender: TObject; X, Y: Integer;
      var Cancel: Boolean);
    procedure Generales1Click(Sender: TObject);
    procedure emporales1Click(Sender: TObject);
    procedure Historial1Click(Sender: TObject);
    procedure Motivocancelacin1Click(Sender: TObject);
    procedure Ventas1Click(Sender: TObject);
    procedure edTipoContButtonClick(Sender: TObject);
    procedure edTipoContKeyPress(Sender: TObject; var Key: Char);
    procedure edTipoContExit(Sender: TObject);
    procedure edcveabogadoKeyPress(Sender: TObject; var Key: Char);
    procedure edcveabogadoExit(Sender: TObject);
    procedure edcveabogadoButtonClick(Sender: TObject);
    procedure edmontocontKeyPress(Sender: TObject; var Key: Char);
    procedure edNumEmbargoKeyPress(Sender: TObject; var Key: Char);
    procedure edNumDemandaKeyPress(Sender: TObject; var Key: Char);
    procedure Cobros1Click(Sender: TObject);
    procedure edCveVendKeyPress(Sender: TObject; var Key: Char);
    procedure edCveVendChange(Sender: TObject);
    procedure tblexclientesAfterScroll(DataSet: TDataSet);
    procedure CboVendedorSelect(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CboVendedorChange(Sender: TObject);
    procedure lAA1Click(Sender: TObject);
    procedure Zonas1Click(Sender: TObject);
    procedure emporalMonitoreo1Click(Sender: TObject);
    procedure rafico1Click(Sender: TObject);
    procedure edmskrfcExit(Sender: TObject);
    procedure btnzonasClick(Sender: TObject);
    procedure tblexclientesBeforePost(DataSet: TDataSet);
    procedure cbocoloniasClick(Sender: TObject);
    procedure bonificacionesClick(Sender: TObject);
    procedure Componentes1Click(Sender: TObject);
    procedure HorariosdeAperturasyCierres1Click(Sender: TObject);
    procedure SeguimientoNoseales1Click(Sender: TObject);
    procedure tblexclientesAfterPost(DataSet: TDataSet);
    procedure cboalarmaSelect(Sender: TObject);
    procedure edidnoclienteChange(Sender: TObject);
    procedure edidnoclienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure btnserviciosClick(Sender: TObject);
  private
    { Private declarations }
    idtelefono:string;
    procedure trae_datos(Sender: TObject);
    procedure limpia_combos(Sender: TObject);
  public
    { Public declarations }
    EstatusCliente:string;
    procedure nombre_clave(const edit:trzdbnumericedit;combo:trzcombobox;Const query:string;Sender: TObject);
    procedure buscarlocate;
    constructor inicializa(const cuenta:string);
    procedure CambiaEnabledBotones(NuevoValor:boolean);

  end;

var
  frmExClientes: TfrmExClientes;
  tecla:char;
implementation

uses Udm, Uprincipal, Ubusquedas, Uasig_eve_vend, Ucontactos, Utel,
  Udatosfactura, UDatAdiCliente, UNotas, Urecursos, Uclie_cancel,
  UNoVistaVtasCliente, UfrmPagosDebe, Ucliente_zonas, utraficocliente,
  Udmrep, UBuscarServ, Ubonificaciones, Umensaje, UNoClientes,
  UAperturaCierre, Uautentificacion, UExDatosfactura, UNoClienteZonas,
  UExTel, UExBuscarServ, UExNotas;

{$R *.dfm}

procedure TfrmExClientes.CambiaEnabledBotones(NuevoValor:boolean);
begin
 btnzonas.Enabled := NuevoValor;
 btntrafico.Enabled := NuevoValor;
 btnservicios.Enabled := NuevoValor;
// btnbloqueo.Enabled := NuevoValor;
 btnopciones.Enabled := NuevoValor;
 btnnotas.Enabled := NuevoValor;
end;

constructor TfrmExClientes.inicializa(const cuenta:string);
begin
  //carga los vendedores
CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre '+
'FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1) order by usuarios.nombre','Vendedores',cbovendedor);
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
edclave.Text:='';
if cuenta <> '0' then
  begin
  edclave.text:=cuenta;
  buscarlocate;
  end;{
else
  begin
 { //verifica si el usuario actual esta en el area administracion y puesto gerente
  querys('Select usuarios.nombre From usuarios Inner Join puestos ON usuarios.idpuesto = puestos.idpuesto Inner Join areas ON usuarios.idarea = areas.idarea Where areas.nombre = ''ADMINISTRACION'' AND puestos.nombre=''GERENTE'' AND usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
   {querys('Select idcliente From NoClientes where estatus=2 and st_date>='+quotedstr(datetostr(date-60))+' order by idcliente',0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
    begin
     if application.MessageBox('Tiene clientes con estatus por revisar, desea verlos?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
      begin
       //trae los clientes que tienen 60 dias de alta y que estatus = 2
       frmbusquedas.query:='Select idcliente,if(nombre<>'''' and apaterno<>'''' and amaterno<>'''',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,estatus as Estatus,bloqueado as Bloqueado,dir as Direccion,' +
                           'numero as Numero,ciudad as Ciudad,estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From NoClientes where estatus=2 and st_date>='+quotedstr(datetostr(date-60))+' order by idcliente';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tblorigen := 'NoClientes';
       frmbusquedas.tabla:='NoClientes';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
        begin
         gbclientes.Enabled:=true;
         Pweb.Enabled:=true;
         tblexclientes.Active:=true;
         tblexclientes.Locate('idcliente',frmbusquedas.resultado,[]);
         sqlcolonias.Active:=true;
         tblcategoria.Active:=true;
         cboestatus.ItemIndex := tblexclientesestatus.AsInteger;
         edclave.Text:=frmbusquedas.resultado;
         edclave.SetFocus;
         buscarlocate;
         //btnborrar.Enabled:=true;
         btnmodificar.Enabled:=true;
         gbclientes.Enabled:=false;
         Pweb.Enabled:=false;
        end;
       end;
      end;
     end;
  end;  }
end;

procedure TfrmExClientes.buscarlocate;
begin
tblexclientes.Active:=true;
if tblexclientes.Locate('idnocliente',edidnocliente.Text,[]) then
   begin
   edclave.text := tblexclientesidcliente.AsString;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    if navegador.Enabled = false then
       navegador.Enabled:=true;
    trae_datos(self);
    edclave.SetFocus;
    sqlcolonias.Active:=true;
    CambiaEnabledBotones(true);
   end
else
  begin
    lbUltMod.Caption := 'Ultima Modificación Estatus :';
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Cliente no Existe','Información',mb_ok+mb_iconinformation);
    lblbloqueado.Caption:='Esta Bloqueado?';
    lblbloqueado.Font.Color:=clblack;
    lblcantbloq.Caption:='Cantidad de Bloqueos:';
    tblexclientes.Active:=false;
    limpia_combos(self);
    edclave.Text:='';
    lblUltServicio.caption := 'Ultimo Servicio :';
    edclave.SetFocus;
  end;


end;

procedure tfrmExClientes.nombre_clave(const edit:trzdbnumericedit;combo:trzcombobox;Const query:string;Sender: TObject);
begin
 querys(query,0,sqlgeneral);
 if ((sqlgeneral.Fields.Fields[0].AsString='')and(sqlgeneral.Fields.Fields[1].AsString='')) and ((btnalta.Caption='&Guardar')or(btnmodificar.Caption='&Guardar')) then
    begin
    application.MessageBox('No se encontro ningun registro con ese criterio','Información',mb_ok+mb_iconinformation);
     edit.Text:='';
     combo.Text:='';
    end
 else
   begin
     edit.Text:=sqlgeneral.Fields.Fields[0].AsString;
     combo.Text:=sqlgeneral.Fields.Fields[1].AsString;
   end;
end;

procedure tfrmExClientes.limpia_combos(Sender: TObject);
begin
ppmopciones.Items.Items[11].Visible := false;
cboprotocolos.Text := '';
lblUltServicio.Caption := 'Ultimo Servicio';
lbltelefono.Caption := 'Telefono';
lbultmod.Caption := 'Ultima Mod Estatus:';
lbcargosautomaticos.Caption := '-';
CambiaEnabledBotones(false);
cbonom_origen.Text := '';
cbonom_fuente.Text :='';
cbonom_giro.Text := '';
cbonom_categoria.Text := '';
edCveVend.Clear;
CboVendedor.Text := '';
EdTipoCont.Clear;
edNomContrato.Clear;
cbonom_giro.Text:='';
edestado.Text:='';
ednombre.Text:='';
edapaterno.Text:='';
edamaterno.Text:='';
edcalle.Text:='';
ednumero.Text:='';
edciudad.Text:='';
idtelefono:='';
edsector.clear;
cboestatus.text := '';
lblinstalaciones.caption := 'Instalaciones';
lbAdeudos.caption := 'Adeudos';
lbltravelers.Caption := 'Travelers';
lblservicios.Caption := 'Servicios';

end;

procedure TfrmExClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;
                             
procedure TfrmExClientes.FormCreate(Sender: TObject);
begin
trae_datos(self);
gbclientes.Enabled:=false;
Pweb.Enabled:=false;
end;

procedure tfrmExClientes.trae_datos(Sender: TObject);
//var cadena:string;
begin
if tblexclientes.Active then
  begin
   lbufh.Caption := UFH(tblexclientes);
    BuscaPendientesCliente('Travelers: ','No Tiene Travelers Pendientes','SELECT travel.idtravel as id FROM travel inner join NoClientes on NoClientes.idcliente=travel.idcliente JOIN EstatusServicios ON (travel.idestatus = EstatusServicios.orden) INNER JOIN '+
                           ' TipoServicios ON (EstatusServicios.idserv = TipoServicios.idserv) WHERE (TipoServicios.nombre = ''TRAVEL'') AND  EstatusServicios.finaliza=0 and NoClientes.idcliente='+edclave.Text+' order by travel.idtravel',lbltravelers);
   BuscaPendientesCliente('Servicios: ','No Tiene Servicios Pendientes','select s.sid as id from NoServicios as s left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) inner join  NoClientes as c on c.idcliente = s.idcliente where s.status < 4 '+
          ' and ts.nombre=''ESTATUS SERVICIO'' and c.idcliente='+edclave.Text+' order by sid desc',lblservicios);
   BuscaPendientesCliente('Instalaciones: ','No hay instalaciones Pendientes','SELECT i.idinstalacion as id FROM NoRemiFact as rf LEFT JOIN NoPedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN NoClientes as c ON (c.idcliente=p.idcliente) LEFT JOIN NoInstalaciones as i ON '+
                          ' (i.idpedido=p.idpedido) LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) lEFT JOIN usuarios as u ON (i.instalador1=u.codigo) WHERE  i.estatus = 0  and p.estatus in(3,4) and p.idcliente='+edclave.text+' GROUP BY p.idpedido order by u.idusuario,idinstalacion',lblinstalaciones);
   BuscaPendientesCliente('Adeudos vencidos :','No tiene adeudo vencido', 'SELECT distinct pc.idpedido as id FROM NoPagosClientes as pc  left join NoPedidos as p on(p.idpedido=pc.idpedido) where pc.idcliente = '+edclave.text+' and pc.FechaVence <= "'+datetostr(date)+'" and pc.movimiento in(0,1) and pc.cargo > 0 and p.saldado=0',lbAdeudos);
    {querys('Select * from ClientesCambios  where idcliente='+quotedstr(edclave.Text)+' order by fecha desc',0,sqlgeneral);
    if sqlgeneral.FieldByName('idcliente').AsString <> '' then
        lbUltMod.Caption := 'Ultima Mod Estatus : '+sqlgeneral.FieldByName('usuario').AsString+' ('+sqlgeneral.FieldByName('fecha').AsString+','+sqlgeneral.FieldByName('hora').AsString +')'
    else
        lbUltMod.Caption := 'Ultima Mod Estatus :';}
    //verifica si el cliente tiene la opcion de aperturas y cerres
    if tblexclientes.FieldByName('idOpenClose').Asinteger = 1 then
     ppmopciones.Items.Items[11].Visible := true
    else
     ppmopciones.Items.Items[11].Visible := false;
     //si cuenta con cargos automaticos
     querys('Select flcargo from NoDetClientes where idcliente = '+quotedstr(edclave.Text),0,sqlgeneral);

     if sqlgeneral.FieldByName('flcargo').AsString = '1' then
         lbcargosautomaticos.Caption := 'Cuenta con cargo automático'
     else
         lbcargosautomaticos.Caption := '';


    edclave.Text:=inttostr(tblexclientes.fieldbyname('idcliente').AsInteger);


      //ultimo servicio realizado al cliente.
     querys('Select sid,fecha_creacion,CodTecnico from NoServicios where idcliente='+edclave.Text+' order by sid desc limit 1',0,sqlgeneral);
     if sqlgeneral.fieldbyname('fecha_creacion').AsString <>  '' then
         lblUltServicio.Caption := 'Ultimo Servicio : '+  sqlgeneral.fieldbyname('fecha_creacion').AsString +' ('+ sqlgeneral.fieldbyname('CodTecnico').AsString +')'
     else
         lblUltServicio.Caption := 'No se ha realizado ningun servicio';

    cboestatus.ItemIndex:=tblexclientes.fieldbyname('estatus').Asinteger;
    cboestatus.Text := cboestatus.Items.Strings[cboestatus.ItemIndex];
    //me trae el primer telefono que tenga el cliente
    querys('select t.telefono,t.tipo_tel from NoClientes left join NoTelefonos t on t.idtel = NoClientes.idtel where idcliente='+edclave.Text+' group by idcliente order by t.tipo_tel',0,sqlgeneral);
    lbltelefono.Caption :='Telefono:'+sqlgeneral.fieldbyname('telefono').AsString+' Tipo:'+sqlgeneral.fieldbyname('tipo_tel').AsString;

    if tblexclientes.FieldByName('idgiro').AsString <> '' then
        begin
         ednum_giro.Text:=tblexclientes.FieldByName('idgiro').AsString;
         tecla:=#13;
         ednum_giro.OnKeyPress(self,tecla);
        end;

    if tblexclientesidprotocolo.AsInteger <> 0 then
     begin
      querys('select protocolo from protocolos where idprotocolo='+tblexclientesidprotocolo.AsString,0,sqlgeneral);
      cboprotocolos.Text := sqlgeneral.fieldbyname('protocolo').AsString;
     end;

     if tblexclientesidvendedor.AsInteger <> 0 then
      begin
       try
        querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario,codigo FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1 and  usuarios.idusuario='+tblexclientesidvendedor.AsString,0,SqlGeneral);
       except
        querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario,codigo FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1 and  usuarios.codigo='+quotedstr(tblexclientesidvendedor.AsString),0,SqlGeneral);
       end;
        cbovendedor.Text := sqlgeneral.fieldbyname('nombre').AsString;
        edCveVend.Text := sqlgeneral.fieldbyname('idusuario').AsString;
//       querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = ''VENDEDOR'' AND usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull'+
  //     '(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) ='+quotedstr(.Text)+' order by usuarios.nombre',0,SqlGeneral);
   //    edcvevend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
       end
      else
       begin
        cbovendedor.Text := '';
        edcvevend.Text := '';
       end;

     if tblexclientesidabogado.AsString <> '0' then
      begin
       querys('select nombre,idabogado from abogados where idabogado = '+tblexclientesidabogado.Asstring,0,sqlgeneral);
         if sqlgeneral.FieldByName('idabogado').AsString <> '' then
           begin
              edNomAbogado.Text:=sqlgeneral.fieldbyname('nombre').AsString;
              edcveabogado.text:=sqlgeneral.fieldbyname('idabogado').AsString;
           end else
             edcveabogado.text := tblexclientesidabogado.Asstring;

      end
     else begin
       edNomAbogado.Text:='';
       edcveabogado.text:='';
     end;

     if tblexclientesTipoCont.AsString <> '' then
      begin
          querys('select nombre,TipoCont,cancelado,estatus,TieneVigencia from contratos where TipoCont ='+quotedstr(tblexclientesTipoCont.AsString),0,sqlgeneral);
         edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
         edTipoCont.Text := sqlgeneral.fieldbyname('TipoCont').AsString;
         if sqlgeneral.fieldbyname('estatus').Asinteger = 0 then
          cboestatus.ItemIndex:=0;
         if sqlgeneral.fieldbyname('TieneVigencia').Asinteger = 0 then
          begin
           dtpdesdecont.enabled := false;
           dtphastacont.enabled := false;
          end
         else
          begin
           dtpdesdecont.enabled := true;
           dtphastacont.enabled := true;
          end;
        // else
         // cboestatus.ItemIndex :=1;
      end
     else begin
      edNomContrato.Text := '';
      edTipoCont.Text := '';
     end;

     if tblexclientesidnota.AsString <> '' then
      begin
       //trae la cantidad de bloqueos de este cliente
       querys('select count(nota) from NoNotas where idnota='+tblexclientesidnota.AsString+' and TipoNota='+quotedstr('BLOQUEO'),0,sqlgeneral);
       lblCantBloq.Caption:='Cantidad de Bloqueos: '+inttostr(sqlgeneral.Fields.Fields[0].AsInteger);
      end;

       //verifica si la cuenta esta bloqueada
     if tblexclientesbloqueado.AsInteger = 1 then
       begin
         lblbloqueado.Caption:='Cliente Bloqueado? Si';
         lblbloqueado.Font.Color:=clred;
         frmnotas.REAnterior.Text:=tblexclientesNotaBloqueo.AsString;
         frmnotas.TipoNota:='-1';
         frmnotas.idNota:=tblexclientesidnota.AsInteger;
         if tblexclientesidnota.AsInteger <> 0 then
          begin
           //trae la ultima fecha de bloqueo
           querys('SELECT MAX(fecha) as fecha,hora,nota from NoNotas where TipoNota=''BLOQUEO'' and idnota = '+tblexclientesidnota.Asstring+' group by idnota',0,sqlgeneral);
           lblFecBloq.Caption :='Fecha del Bloqueo: '+sqlgeneral.fieldbyname('fecha').asstring;
           frmnotas.ShowModal;
          end;
       //    btnbloqueo.Caption:='DesBlo&quear';
       end
     else
       begin
//        btnbloqueo.Caption:='B&loquear';
        lblbloqueado.Caption:='Cliente Bloqueado? No';
        lblbloqueado.Font.Color:=clblack;
        lblFecBloq.Caption :='';
       end;

        //verifica si tiene una nota temporal para esta fecha
        querys('SELECT nota from NoNotas where (dfecha<='+quotedstr(datetostr(FechaServidor))+' and hfecha>='+quotedstr(datetostr(FechaServidor))+' and dhora<='+quotedstr(timetostr(HoraServidor))+' and hhora>='+quotedstr(timetostr(HoraServidor))+') and idnota='+inttostr(tblexclientesidnota.Asinteger)+' and TipoNota='+quotedstr('TEMPORAL'),0,sqlgeneral);
        if sqlgeneral.RecordCount > 0 then
        begin
         frmnotas.REAnterior.Text:=sqlgeneral.fieldbyname('nota').AsString;
         frmnotas.TipoNota:='-2';
         frmnotas.idNota:=tblexclientesidnota.AsInteger;
         frmnotas.ShowModal;
        end;

      if tblexclientes.FieldByName('idcategoria').AsString <> '' then
        begin
         ednum_categoria.Text:=tblexclientes.FieldByName('idcategoria').AsString;
         tecla:=#13;
         ednum_categoria.OnKeyPress(self,tecla);
        end;

     if tblexclientes.FieldByName('idorigen').AsString <> '' then
        begin
         ednum_origen.Text:=tblexclientes.FieldByName('idorigen').AsString;
         tecla:=#13;
         ednum_origen.OnKeyPress(self,tecla);
        end;

      if tblexclientes.FieldByName('idfuente').AsString <> '' then
        begin
         ednum_fuente.Text:=tblexclientes.FieldByName('idfuente').AsString;
         tecla:=#13;
         ednum_fuente.OnKeyPress(self,tecla);
        end;

      if tblexclientes.FieldByName('idcol').AsString <> '' then
       begin
        querys('SELECT colonias.cp,if(sectores.nombre is not null,concat(''Sector '',sectores.nombre),''No Definido'') as Sector,NoClientes.sector as sec FROM NoClientes INNER JOIN col_sector ON (NoClientes.idcol = col_sector.idcol) INNER JOIN sectores ON  '+
               '(col_sector.idsector=sectores.idsector) inner join colonias on NoClientes.idcol = colonias.idcol WHERE NoClientes.idcliente ='+tblexclientes.FieldByName('idcliente').AsString,0,sqlgeneral);
        edSector.Text := sqlgeneral.FieldByName('sec').AsString;
        edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
       end
      else
       begin
        edsector.Text := '';
        edcp.Text := '';
       end;

 end;
end;

procedure TfrmExClientes.btnaltaClick(Sender: TObject);
//var cta : string;
begin {
if btnalta.Caption='&Alta' then
   begin
   navegador.Enabled:=false;
      //pone la tabla de clientes en modo de insercion
   tblexclientes.Active:=true;
   sqlcolonias.Active:=true;
//   sqlvendedores.Active := true;
   tblcategoria.Active:=true;
   tblexclientes.insert;
    //trae el maximo idcliente + 1
    querys('select max(idcliente) as idcliente from clientes',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].asinteger + 1);
   edclave.Enabled:=false;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   gbclientes.Enabled:=true;
   Pweb.Enabled:=true;
   limpia_combos(self);
   dtalta.Date:=date;
   dtalta.Text:=datetostr(FechaServidor);
    edmskrfc.SetFocus;
    cboprecio.ItemIndex := 0;
   dtpdesdecont.Date := FechaServidor;
   dtphastacont.Date  := FechaServidor;
   dtpfechaabo.Date  := FechaServidor;
   CambiaEnabledBotones(false);
   end
   else
   begin
   if cbocolonias.Text = '' then
    begin
     application.MessageBox('Debe indicar la colonia','Aviso',mb_iconinformation);
     exit;
    end;

     if edsector.Text = '' then
      begin
       application.MessageBox('La Colonia selecionada no esta sectorizada, favor de sectorizarla si desea usarla','Aviso',mb_iconinformation);
       exit;
      end;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta a un Cliente';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     navegador.Enabled:=true;
     //btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     gbclientes.Enabled:=false;
     Pweb.Enabled:=false;

     //trae el maximo idcliente + 1
     querys('select max(idcliente) as idcliente from clientes',0,sqlgeneral);
     tblexclientes.FieldByName('idcliente').asinteger:=(sqlgeneral.Fields.Fields[0].Asinteger + 1);
     tblexclientes.fieldbyname('estatus').Asinteger:= cboestatus.ItemIndex;

     repeat
     cta:=inputbox('Captura de Cuenta','Indique la Cuenta que desea para este cliente: ',inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1));
     try
     strtoint(cta);
     querys('select idcliente from clientes where idcliente ='+cta,0,sqlgeneral);
     if sqlgeneral.RecordCount > 0 then
      application.MessageBox('Esa cuenta ya ha sido asignada','Aviso',mb_iconinformation);
     except
      application.MessageBox('Debe de teclear solo numero','Aviso',mb_iconinformation);
     end;
     until sqlgeneral.RecordCount = 0;

     if cboprotocolos.Text <> '' then
      begin
       querys('select idprotocolo from protocolos where protocolo='+quotedstr(cboprotocolos.Text),0,sqlgeneral);
       tblexclientesidprotocolo.AsInteger:=sqlgeneral.fieldbyname('idprotocolo').AsInteger;
      end;

     tblexclientes.FieldByName('idcliente').asinteger := strtoint(cta);
     edclave.Text := cta;
     frmprincipal.ucprincipal.Log('Dio de Alta al cliente '+ednombre.text,1);
     if edTipoCont.Text <> '' then
      tblexclientestipocont.AsString := edTipoCont.Text;
     if edcveabogado.Text <> '' then
      tblexclientesidabogado.AsString := edcveabogado.Text;
     if edcvevend.Text <> '' then
      tblexclientesidvendedor.AsString := edcvevend.Text;
     tblexclientes.Post;
     if tblexclientesidfact.AsInteger = 0 then
        begin
          application.MessageBox('No ha ingresado los datos de facturacion para este cliente y son necesarios, capturelos por favor.','Aviso',mb_iconinformation);
          btnmodificar.Click;
          DatosFacturacion1.Click;
          CambiaEnabledBotones(true);
        end;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update clientes set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcliente='+edclave.Text,1,sqlgeneral);
      querys('delete from clientes where idcliente=0',1,sqlgeneral);
     end;  }

end;

procedure TfrmExClientes.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
 lbUltMod.Caption := 'Ultima Modificación Estatus :';
 edTipocont.Clear;
 edcveabogado.Clear;
 edNomContrato.Clear;
 edNomAbogado.Clear;
 cboestatus.Text := '';
 cboprotocolos.Text := '';
 lbufh.Caption := '';
        lblbloqueado.Caption:='Esta Bloqueado?';
        lblbloqueado.Font.Color:=clblack;
        lblcantbloq.Caption:='Cantidad de Bloqueos:';
        tblexclientes.Cancel;
        tblexclientes.Active:=false;
        limpia_combos(self);
        btncancelar.Hint:='Cerrar esta Pantalla';
        btncancelar.Caption:='&Cerrar';
        gbclientes.Enabled:=false;
        Pweb.Enabled:=false;
        edclave.Enabled:=true;
        edclave.Text:='';
        btnalta.Enabled:=true;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        edclave.SetFocus;
 end
else
close;

end;

{procedure Tfrmclientes.CargaCombo(sql,tabla:string;combo : TRzComboBox);
begin
combo.Items.Clear;
//carga los vendedores
querys(sql,0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
   application.MessageBox(pchar('No hay '+tabla+' registrados en el sistema!'),'Aviso',mb_iconwarning)
else
  begin
    SqlGeneral.First;
    while not SqlGeneral.Eof do
       begin
          combo.Items.Add(SqlGeneral.Fieldbyname('Nombre').AsString);
          SqlGeneral.Next;
       end;
  end;
end;}

procedure TfrmExClientes.FormShow(Sender: TObject);
begin
//carga los vendedores

CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1) order by usuarios.nombre','Vendedores',cbovendedor);
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
edclave.Text:='';
lbltelefono.Caption := '';
{
querys('SELECT usuarios.codigo,usuarios.nombre,areas.nombre FROM puestos INNER JOIN usuarios ON (puestos.idpuesto = usuarios.idpuesto) INNER JOIN areas ON (usuarios.idarea = areas.idarea) WHERE (areas.nombre = ''ADMINISTRACION'') AND '+
       ' (puestos.nombre = ''GERENTE'') AND usuarios.idusuario ='+frmprincipal.idmaq,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  querys('Select idcliente From NoClientes where estatus=2 order by idcliente',0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    if application.MessageBox('Tiene clientes con estatus por revisar, desea verlos?','Pregunta',mb_yesno+mb_iconquestion) = idyes then
     begin
     //trae los clientes que estatus = 2
     frmbusquedas.query:='Select idcliente,if(nombre<>'''' and apaterno<>'''' and amaterno<>'''',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,estatus as Estatus,bloqueado as Bloqueado,dir as Direccion,' +
                         'numero as Numero,ciudad as Ciudad,estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes where estatus=2 and st_date>='+quotedstr(datetostr(date-60))+' order by idcliente';
     frmbusquedas.campo_retorno:='idcliente';
     frmbusquedas.campo_busqueda:='Nombre';
     frmbusquedas.tblorigen := 'clientes';
     frmbusquedas.tabla:='clientes';
     frmbusquedas.cbofiltro.ItemIndex:=1;
     frmbusquedas.cbofiltro.OnClick(self);
     frmbusquedas.ShowModal;
     if frmbusquedas.resultado <> '' then
      begin
       gbclientes.Enabled:=true;
       Pweb.Enabled:=true;
       tblexclientes.Active:=true;
       edclave.Text := frmbusquedas.resultado;
       tblexclientes.Locate('idcliente',frmbusquedas.resultado,[]);
       sqlcolonias.Active:=true;
       tblcategoria.Active:=true;
       cboestatus.ItemIndex := tblexclientesestatus.AsInteger;
       edclave.Text:=frmbusquedas.resultado;
       edclave.SetFocus;
       buscarlocate;
       btnborrar.Enabled:=true;
       btnmodificar.Enabled:=true;
       gbclientes.Enabled:=false;
       Pweb.Enabled:=false;
      end;
     end;
    end;
   end;    }
 cargacombo('select protocolo as Nombre from protocolos order by protocolo','protocolos',cboprotocolos);
 CargaCombo('select nombre from giros order by nombre','Giros',cbonom_giro);
end;

procedure TfrmExClientes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) and (gbclientes.Enabled=false) then
    begin

       frmbusquedas.query:='Select c.idcliente, c.idnocliente, '+ClienteNombre('c')+' as Nombre, '+ClienteNombre('cf')+' as Facturacion, t.telefono,t.tipo_tel as Tipo, case 1 when c.estatus=0 then "Inactivo" '+
                           'when estatus=1 then "Activo" when c.estatus=2 then "Por Revisar" when c.estatus=3 then "Cortesia" when c.estatus=4 then '+
                           '"Moroso" when c.estatus=5 then  "Cancelado" when c.estatus = 6 then "Libre" end as Estatus,c.bloqueado as Bloqueado,c.TipoCont,'+
                           ' concat(c.dir,",",c.numero,",",c.ciudad,",",c.estado) as Direccion,c.usuario as Usuario,c.fecha as Fecha,c.hora as Hora '+
                           'From NoClientes as c left join NoClientesFact as cf on c.idfact = cf.idfact left join NoTelefonos as t on c.idtel=t.idtel '+
                           'group by idcliente, idnocliente order by idcliente,t.telefono';
       frmbusquedas.campo_retorno:='idnocliente';
       frmbusquedas.campo_busqueda:='Nombre';                                                                                            ////,NoClientes.NotaBloqueo,NoClientes.numero as Numero,NoClientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen := 'NoClientes';
       frmbusquedas.tabla:='';
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             gbclientes.Enabled:=true;
             Pweb.Enabled:=true;
             tblexclientes.Active:=true;
             edidnocliente.Text := frmbusquedas.resultado;
             sqlcolonias.Active:=true;
             tblcategoria.Active:=true;
             edclave.Text:=tblexclientesidcliente.AsString;
             edclave.SetFocus;
             buscarlocate;
             //btnborrar.Enabled:=true;
             btnmodificar.Enabled:=true;
             gbclientes.Enabled:=false;
             Pweb.Enabled:=false;
             btnzonas.Enabled := true;
             btntrafico.Enabled := true;

             edTipoCont.text := tblexclientesTipoCont.AsString;
             if tblexclientesTipoCont.AsString <> '' then
              begin
               //trae el nombre del contrato
               querys('select nombre from contratos where TipoCont ='+quotedstr(edTipoCont.Text),0,sqlgeneral);
               edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
              end;
              if tblexclientesidabogado.AsString <> '0' then
               begin
                edcveabogado.Text := tblexclientesidabogado.AsString;
                //trae el nombre del abogado
                querys('select nombre from abogados where idabogado = '+edcveabogado.Text,0,sqlgeneral);
                edNomAbogado.Text:=sqlgeneral.fieldbyname('nombre').AsString;
               end else
                   edcveabogado.Text :=  '';
            end;
    end;
end;

procedure TfrmExClientes.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblexclientes.Active:=true;
if tblexclientes.Locate('idcliente',edclave.Text,[]) then
   begin

    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    //btnborrar.Enabled:=true;
    if navegador.Enabled = false then
       navegador.Enabled:=true;
    trae_datos(self);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Cliente no Existe','Información',mb_ok+mb_iconinformation);
    tblexclientes.Active:=false;
    limpia_combos(self);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure TfrmExClientes.rejilla_telsDblClick(Sender: TObject);
begin
{if gbclientes.Enabled then begin
btntelefonos.Caption:='&Grabar';
btntelefonos.Enabled:=true;
cbotelefonos.Text:=rejilla_tels.DataSource.DataSet.fieldbyname('tipo').AsString;
edtelefono.Text:=rejilla_tels.DataSource.DataSet.fieldbyname('telefono').AsString;
edtelefono.SetFocus;
end;}
end;

procedure TfrmExClientes.edclaveChange(Sender: TObject);
begin  {
if edclave.Text='' then
   btnbuscar.Enabled:=false
else
   btnbuscar.Enabled:=true;}
if edclave.Text = '' then
 begin
  tblexclientes.Active:=false;
  limpia_combos(self);
  CambiaEnabledBotones(false);
  lbufh.Caption := '';
 end;
end;

procedure TfrmExClientes.btnborrarClick(Sender: TObject);
begin
{if application.MessageBox('Estas Seguro que deseas borrar este Cliente, se perderan sus telefonos y contactos?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el cliente '+tblexclientesnombre.asstring+' y #'+tblexclientesidcliente.AsString,3);
      if tblexclientesidfact.AsString <> '' then
      //elimina los datos de facturacion
      querys('delete from ClientesFact where idfact='+tblexclientesidfact.AsString,1,sqlgeneral);
      if tblexclientesidtel.AsString <> '' then
      //elimina los telefonos de la tabla de telefonos
      querys('delete from telefonos where idtel='+tblexclientesidtel.AsString,1,sqlgeneral);
      if tblexclientesidcontacto.AsString <> '' then
      //elimina los contactos de la tabla de contactos
      querys('delete from contactos where idcontacto='+tblexclientesidcontacto.AsString,1,sqlgeneral);
      if tblexclientesidusuario.AsString <> '' then
      //elimina los usuarios de la tabla de contactos
      querys('delete from contactos where idcontacto='+tblexclientesidusuario.AsString,1,sqlgeneral);
      tblexclientes.Delete;
      application.MessageBox('Eliminacion del Cliente Exitosa','Información',mb_ok);
      tblexclientes.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblexclientes.Active:=false;
      limpia_combos(self);
      edclave.Text:='';
      edclave.SetFocus;
      btnzonas.Enabled := false;
      btntrafico.Enabled := false;
   end;     }
end;

procedure TfrmExClientes.popmtelefonosPopup(Sender: TObject);
begin
{if (rejilla_tels.DataSource.DataSet.RecordCount = 0)or(btncancelar.Caption='&Cerrar') then
   begin
     popmtelefonos.Items.Items[0].Enabled:=false;
     popmtelefonos.Items.Items[1].Enabled:=false;
   end
else
      begin
        popmtelefonos.Items.Items[0].Enabled:=true;
        popmtelefonos.Items.Items[1].Enabled:=true;
      end;}
end;

procedure TfrmExClientes.dtaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   begin
     dtalta.Date:=date;
     dtalta.Text:=datetostr(date);
   end;
end;

procedure TfrmExClientes.edtelefonoEnter(Sender: TObject);
begin
//edtelefono.Color:=clskyblue;
end;

procedure TfrmExClientes.edtelefonoExit(Sender: TObject);
begin
//edtelefono.Color:=clwhite;
end;

procedure TfrmExClientes.edciudadEnter(Sender: TObject);
begin
if edciudad.Text='' then
  begin
  querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
  edciudad.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure TfrmExClientes.edestadoEnter(Sender: TObject);
begin
if edestado.Text='' then
  begin
  querys('Select valor from configuraciones where concepto = "estado"', 0, sqlgeneral);
  edestado.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure TfrmExClientes.edamaternoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
{  begin
     key:=#0;
     querys('SELECT * FROM clientes WHERE clientes.nombre ='+quotedstr(ednombre.Text)+' AND clientes.apaterno = '+quotedstr(edapaterno.Text)+' AND clientes.amaterno = '+quotedstr(edamaterno.Text),0,self);
if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox('Ya se encuentra un Proveedor registrado bajo ese nombre, Se cargaran sus datos.','Aviso',mb_iconinformation);
     edclave.Text:=sqlgeneral.fieldbyname('account').AsString;
     edcalle.Text:=sqlgeneral.fieldbyname('dir').AsString;
     ednumero.Text:=sqlgeneral.fieldbyname('numero').AsString;
   end
else}
    edcalle.SetFocus;

end;

procedure TfrmExClientes.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := recomentarios.Font;
  if fuentes.Execute then
   begin
      recomentarios.SelAttributes.Size:=fuentes.Font.Size;
      recomentarios.SelAttributes.color:=fuentes.Font.color;
      recomentarios.SelAttributes.style:=fuentes.Font.style;
    end;
end;

procedure TfrmExClientes.recomentariosEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmExClientes.recomentariosExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmExClientes.edrazonChange(Sender: TObject);
begin
if edrazon.Text <> '' then
   begin
     ednombre.Enabled:=false;
     edapaterno.Enabled:=false;
     edamaterno.Enabled:=false;
     ednombre.Text:='';
     edapaterno.Text:='';
     edamaterno.Text:='';
   end
else
  begin
    ednombre.Enabled:=true;
    edapaterno.Enabled:=true;
    edamaterno.Enabled:=true;
  end;
end;

procedure TfrmExClientes.edmskrfcKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.ednombreChange(Sender: TObject);
begin
if (ednombre.Text<>'') or (edapaterno.Text<>'') or (edamaterno.Text<>'') then
   begin
     edrazon.Enabled:=false;
//     edrazon.Text:='';
     ednombre.Enabled:=true;
     edapaterno.Enabled:=true;
     edamaterno.Enabled:=true;
   end
else
  edrazon.Enabled:=true;
end;

procedure TfrmExClientes.SQLcoloniasAfterScroll(DataSet: TDataSet);
begin
//IF (tblexclientes.State = dsEdit)  or (tblexclientes.State = dsinsert) then
//begin
  //edsector.Text:=sqlcoloniassector.AsString;
//end;

end;

procedure TfrmExClientes.cbocoloniasKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.LBtipoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.cbonom_giroKeyPress(Sender: TObject; var Key: Char);
begin
{if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;}
if (key=#13)and(cbonom_giro.Text<>'') then
   begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    cbonom_giro.Onclick(self);
   end
  else
  ednum_giro.Text:='';
end;

procedure TfrmExClientes.cbotelefonosKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.ednum_giroKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednum_giro.Text<>'')and(ednum_giro.Text<>'0') then
   begin
    nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where idgiro='+ednum_giro.Text,self);
    key:=#0;
    CargaCombo('SELECT categorias.nombre,categorias.idcategoria FROM giros INNER JOIN categorias ON (giros.idgiro = categorias.idgiro) WHERE giros.idgiro ='+ednum_giro.Text,'Categorias',cbonom_categoria);
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TfrmExClientes.ednum_giroExit(Sender: TObject);
begin
tecla:=#13;
if ednum_giro.Text<>'' then
     ednum_giro.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.cbonom_giroExit(Sender: TObject);
begin
tecla:=#13;
if (cbonom_giro.Text<>'')and(ednum_giro.Text='') then
     cbonom_giro.OnSelect(self);
if (ednum_giro.Text<>'')and(cbonom_giro.Text='') then
   ednum_giro.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.ednum_categoriaExit(Sender: TObject);
begin
tecla:=#13;
if ednum_categoria.Text<>'' then
     ednum_categoria.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.ednum_categoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_categoria.Text<>'')and(ednum_categoria.Text<>'0') then
   begin
      cbonom_categoria.Text:='';
      if (ednum_giro.Text <> '') and (ednum_categoria.Text<>'') then
         begin
         nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where idcategoria='+ednum_categoria.Text+' and idgiro='+ednum_giro.Text,self);
         key:=#0;
         SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
         end;
   end;
end;

procedure TfrmExClientes.cbonom_categoriaExit(Sender: TObject);
begin
tecla:=#13;
if (cbonom_categoria.Text<>'')and(ednum_categoria.Text='') then
     cbonom_categoria.OnSelect(self);
if (ednum_categoria.Text<>'')and(cbonom_categoria.Text='') then
   ednum_categoria.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.cbonom_categoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_categoria.Text<>'') then
   begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    cbonom_categoria.OnSelect(self);
   end
  else
  ednum_categoria.Text:='';
end;

procedure TfrmExClientes.cboalarmaDropDown(Sender: TObject);
begin
//trae todos los modelos de controles siendo estos extraidos de de la tabla de articulos donde el departamento sea controles asi que debe de existir un departamento
//llamado "controles"
querys('SELECT articulos.cod_cve FROM articulos INNER JOIN dptos ON (articulos.iddpto = dptos.iddpto) WHERE dptos.nombre = '+quotedstr('CONTROLES'),0,sqlgeneral);
sqlgeneral.First;
cboalarma.Clear;
while not sqlgeneral.Eof do
 begin
  cboalarma.Items.Add(sqlgeneral.fieldbyname('cod_cve').AsString);
  sqlgeneral.Next;
 end;
end;

procedure TfrmExClientes.cbonom_giroSelect(Sender: TObject);
begin
nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where nombre='+quotedstr(cbonom_giro.Text),self);
CargaCombo('SELECT categorias.nombre,categorias.idcategoria FROM giros INNER JOIN categorias ON (giros.idgiro = categorias.idgiro) WHERE giros.idgiro ='+ednum_giro.Text,'Categorias',cbonom_categoria);
ednum_categoria.Clear;
end;

procedure TfrmExClientes.cbonom_categoriaSelect(Sender: TObject);
begin
nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where nombre='+quotedstr(cbonom_categoria.Text)+' and idgiro='+ednum_giro.Text,self);
end;

procedure TfrmExClientes.edmskrfcPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
 if error then
     if errortext='The edit value is invalid' then
        begin
        errortext:='El RFC tecleado es invalido o esta incompleto';
        edmskrfc.Clear;
        end;
end;

procedure TfrmExClientes.ednum_origenKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_origen.Text<>'')and(ednum_origen.Text<>'0') then
   begin
    //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend
    querys('select idorigen,nombre from origen where idorigen='+ednum_origen.Text,0,SqlGeneral);
    key:=#0;
   if SqlGeneral.RecordCount > 0 then
    begin
     cbonom_origen.Text := SqlGeneral.fieldbyname('nombre').AsString;
//      cbonom_origen.SetFocus;
    end
   else
    begin
     application.MessageBox('Esa Clave de Origen no Existe, verifiquelo y vuelva a intentarlo!','Error',mb_ok+mb_iconwarning);
     ednum_origen.Text:='';
    end;
   end;
     SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
   end;

procedure TfrmExClientes.ednum_origenExit(Sender: TObject);
begin
tecla:=#13;
ednum_origen.Color:=clwhite;
if (ednum_origen.Text<>'')and(ednum_origen.Text<>'0') then
     ednum_origen.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.cbonom_origenSelect(Sender: TObject);
begin
  // nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where nombre='+quotedstr(cbonom_origen.Text),self);
//   ednum_fuente.SetFocus;
end;

procedure TfrmExClientes.cbonom_origenKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_origen.Text<>'') then
   begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    cbonom_origen.OnSelect(self);
   end
  else
  ednum_origen.Text:='';
end;

procedure TfrmExClientes.cbonom_origenExit(Sender: TObject);
begin
tecla:=#13;
cbonom_origen.Color:=clwhite;
if (cbonom_origen.Text<>'')and(ednum_origen.Text='') then
     cbonom_origen.OnSelect(self);
if (ednum_origen.Text<>'')and(cbonom_origen.Text='') then
   ednum_origen.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.ednum_fuenteKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_fuente.Text<>'')and(ednum_fuente.Text<>'0') then
   begin
      cbonom_fuente.Text:='';
      nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where idfuente='+ednum_fuente.Text,self);
      if cbonom_fuente.Text<>'' then
         begin
                if tblexclientes.State = dsinsert then
                    begin
                      cbonom_giro.Text:='RESIDENCIAL';
                      cbonom_giro.OnSelect(self);
                      cbonom_categoria.Text:='RESIDENCIAL';
                      cbonom_categoria.OnSelect(self);
                    end
                else
                   if gbclientes.Enabled then
                    ednum_giro.SetFocus;
           key:=#0;
           SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
         end;
    end;
end;

procedure TfrmExClientes.ednum_fuenteExit(Sender: TObject);
begin
tecla:=#13;
ednum_fuente.Color:=clwhite;
if (ednum_fuente.Text<>'')and(cbonom_fuente.Text='') then
     ednum_fuente.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.cbonom_fuenteSelect(Sender: TObject);
begin
nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where nombre='+quotedstr(cbonom_fuente.Text),self);
if tblexclientes.State = dsinsert then
    begin
      cbonom_giro.Text:='RESIDENCIAL';
      cbonom_giro.OnSelect(self);
      cbonom_categoria.Text:='RESIDENCIAL';
      cbonom_categoria.OnSelect(self);
   end
else
   ednum_giro.setfocus;
end;

procedure TfrmExClientes.cbonom_fuenteKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbonom_fuente.Text<>'') then
   begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    cbonom_fuente.OnSelect(self);
   end
  else
  ednum_fuente.Text:='';

end;

procedure TfrmExClientes.cbonom_fuenteExit(Sender: TObject);
begin
tecla:=#13;
cbonom_fuente.Color:=clwhite;
if (cbonom_fuente.Text<>'')and(ednum_fuente.Text='') then
     cbonom_fuente.OnSelect(self);
if (cbonom_fuente.Text='')and(ednum_fuente.Text<>'') then
    ednum_fuente.OnKeyPress(self,tecla);
end;

procedure TfrmExClientes.cbonom_fuenteDropDown(Sender: TObject);
begin
CargaCombo('select nombre from fuentes order by nombre','Fuentes',cbonom_fuente);
end;

procedure TfrmExClientes.cbonom_origenDropDown(Sender: TObject);
begin
CargaCombo('select nombre from origen order by nombre','Origenes',cbonom_origen);
end;

procedure TfrmExClientes.cboprecioKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.cboalarmaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure TfrmExClientes.edclaveKeyPress(Sender: TObject; var Key: Char);
begin

key := ValidaNumeros(key,true);
  if key=#13 then
   begin
   querys('Select idnocliente from NoClientes where idcliente ='+edclave.text, 0, sqlgeneral);
   edidnocliente.text := sqlgeneral.fieldbyname('idnocliente').asstring;
    key:=#0;
    if edclave.Text <> '' then
     buscarlocate
    else
     edclave.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;

end;

procedure TfrmExClientes.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=tblexclientes.fieldbyname('idcliente').AsString;
edidnocliente.Text:=tblexclientes.fieldbyname('idnocliente').AsString;
cboestatus.ItemIndex:=tblexclientes.fieldbyname('estatus').Asinteger;
trae_datos(self);
lbufh.Caption := UFH(tblexclientes);
end;

procedure TfrmExClientes.CboVendedorKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmExClientes.edcreditoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure TfrmExClientes.DatosFacturacion1Click(Sender: TObject);
var hija:TfrmExDatosFactura;
begin
 hija:=TfrmExDatosFactura.Create(self);
 hija.inicializa(tblexclientesidcliente.AsString,tblexclientesidfact.asinteger);
 hija.Show;
end;

procedure TfrmExClientes.OtrosDatos1Click(Sender: TObject);
//var hija:TfrmDatAdiCliente;
begin{
//if btnmodificar.Caption='&Guardar' then
// tblexclientes.Post;
 hija:=TfrmDatAdiCliente.Create(self);
 hija.inicializa(strtoint(edclave.Text));
 hija.Show;
{ tblexclientes.Refresh;
 tblexclientes.Edit;}
end;

procedure TfrmExClientes.Responsables1Click(Sender: TObject);
begin{
if btnmodificar.Caption='&Guardar' then
//  tblexclientes.Post;
  frmcontacto.inicializa(strtoint(edclave.Text),tblexclientes.fieldbyname('idcontacto').AsInteger,'clientes','idcliente');
  frmcontacto.ShowModal;
{  tblexclientes.Refresh;
  tblexclientes.Edit;}
end;

procedure TfrmExClientes.Usuarios1Click(Sender: TObject);
begin{
if btnmodificar.Caption='&Guardar' then
// tblexclientes.Post;
 frmcontacto.inicializa(strtoint(edclave.Text),tblexclientes.fieldbyname('idcontacto').AsInteger,'clientes/usuarios','idcliente');
 frmcontacto.ShowModal;
{ tblexclientes.Refresh;
 tblexclientes.Edit;}
end;

procedure TfrmExClientes.telefonos1Click(Sender: TObject);
var hija:tfrmExTel;
begin
hija := tfrmExTel.Create(self);
hija.inicializa(strtoint(edclave.text),tblexclientesidtel.asinteger,0,'clientes','idcliente',false);
hija.Show;
end;

procedure TfrmExClientes.Notas1Click(Sender: TObject);
//var hija:tfrmnotas;
begin
//hija:=tfrmnotas.Create(self);
//hija.Show;
end;

procedure TfrmExClientes.ppmopcionesBeforePopUp(Sender: TObject; X,
  Y: Integer; var Cancel: Boolean);
begin
if tblexclientes.Active then
cancel:=false
else
cancel:=true;
end;

procedure TfrmExClientes.Generales1Click(Sender: TObject);
begin{
if btnmodificar.Caption='&Guardar' then
//tblexclientes.Post;
frmnotas.Caption:='Notas Generales de este Cliente';
frmnotas.idProcedencia:=tblexclientesidcliente.AsInteger;
frmnotas.idNota:=tblexclientesidnota.AsInteger;
frmnotas.TipoNota:='GENERALES';
frmnotas.tabla:='NoClientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
{tblexclientes.Refresh;
tblexclientes.Edit;}
end;

procedure TfrmExClientes.emporales1Click(Sender: TObject);
begin         {
if btnmodificar.Caption='&Guardar' then
//tblexclientes.Post;
frmnotas.Caption:='Notas Temporales de este Cliente';
frmnotas.idProcedencia:=tblexclientesidcliente.AsInteger;
frmnotas.idNota:=tblexclientesidnota.AsInteger;
frmnotas.TipoNota:='TEMPORAL';
frmnotas.tabla:='NoClientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
{tblexclientes.Refresh;
tblexclientes.Edit;}
end;

procedure TfrmExClientes.Historial1Click(Sender: TObject);
var hija : TfrmExNotas;
begin
hija := TfrmExNotas.Create(self);
hija.idNota:=tblexclientesidnota.AsInteger;
hija.Show;
end;

procedure TfrmExClientes.Motivocancelacin1Click(Sender: TObject);
//var hija:Tfrmclie_cancel;
begin
  {   hija:=Tfrmclie_cancel.Create(self);
     hija.inicializa(0,strtoint(edclave.text));
     hija.Show;}
end;

procedure TfrmExClientes.Ventas1Click(Sender: TObject);
var hija:TfrmNoVistaVtasCliente;
begin
     hija:=TfrmNoVistaVtasCliente.Create(self);
     hija.inicializa(edclave.text);
     hija.Show;
end;

procedure TfrmExClientes.edTipoContButtonClick(Sender: TObject);
begin
 frmbusquedas.query:='Select TipoCont,nombre,case 1 when estatus=0 then ''Inactivo'' when estatus=1 then ''Activo'' when estatus=2 then ''Por Revisar'' when estatus=3 then ''Cortesia'' when estatus=4 then ''Moroso'' when estatus=5 then ' +
                           ' ''Cancelado'' when estatus = 6 then ''Libre'' end as Estatus,abogado From contratos order by TipoCont';
       frmbusquedas.campo_retorno:='TipoCont';
       frmbusquedas.campo_busqueda:='nombre';
       frmbusquedas.tblorigen := 'contratos';
       frmbusquedas.tabla:='';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
         begin
         edTipoCont.Text:=frmbusquedas.resultado;
         //trae el nombre del contrato
         querys('select nombre,cancelado,TieneVigencia from contratos where TipoCont ='+quotedstr(edTipoCont.Text),0,sqlgeneral);
         if sqlgeneral.FieldByName('cancelado').AsInteger = 1 then
          cboestatus.ItemIndex :=0
         else
          cboestatus.ItemIndex :=1;
         if sqlgeneral.FieldByName('TieneVigencia').AsInteger = 1 then
          begin
           dtpdesdecont.Enabled := true;
           dtphastacont.enabled := true;
          end
         else
          begin
           dtpdesdecont.Enabled := false;
           dtphastacont.enabled := false;
          end;


         edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
         edTipoCont.SetFocus;

         end;
end;

procedure TfrmExClientes.edTipoContKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edtipocont.Text<>'') then
begin
key:=#0;
         //trae el nombre del contrato
         querys('select nombre,cancelado,estatus,TieneVigencia from contratos where TipoCont ='+quotedstr(edTipoCont.Text),0,sqlgeneral);
         if sqlgeneral.FieldByName('estatus').AsInteger = 0 then
          cboestatus.ItemIndex :=0
         else
          cboestatus.ItemIndex :=1;
        if sqlgeneral.FieldByName('TieneVigencia').AsInteger = 1 then
          begin
           dtpdesdecont.Enabled := true;
           dtphastacont.enabled := true;
          end
         else
          begin
           dtpdesdecont.Enabled := false;
           dtphastacont.enabled := false;
          end;

         edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
         edTipoCont.SetFocus;

edmontocont.SetFocus;
end;
end;

procedure TfrmExClientes.edTipoContExit(Sender: TObject);
//var  hija:Tfrmclie_cancel;
begin{
if edTipoCont.Text <> '' then
begin
//verifica que esa clave de contrato sea valida
querys('select TipoCont,nombre from contratos where TipoCont='+quotedstr(edtipocont.Text),0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox('Ese Tipo de Contrato No Existe','Aviso',mb_iconinformation);
    edtipocont.Clear;
    edtipocont.SetFocus;
   end
else
 begin
   edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
     if (edTipoCont.Text = 'CAN')and(tblexclientesTipoCont.AsString<>'CAN') then
          begin
             hija:=Tfrmclie_cancel.Create(self);
             hija.inicializa(1,strtoint(edclave.text));
             hija.Show;
         end;

   end;
end;  }
end;

procedure TfrmExClientes.edcveabogadoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edcveabogado.Text<>'') then
begin
key:=#0;
querys('select nombre from abogados where idabogado = '+edcveabogado.Text,0,sqlgeneral);
if  sqlgeneral.fieldbyname('nombre').AsString <> '' then
  begin
    edNomAbogado.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    edNumDemanda.SetFocus;
  end else
    begin
    edNomAbogado.text := '';
    edcveabogado.text := '';
  end;



end;
end;

procedure TfrmExClientes.edcveabogadoExit(Sender: TObject);
begin

//if ((edcveabogado.Text <> '') and (edcveabogado.Text <> '0' )) then
//   begin
  if tblexclientesidabogado.AsString <> edcveabogado.Text then
   begin
      if edcveabogado.Text = '' then
          tblexclientesidabogado.AsString := '0'
      else begin
      querys('select idabogado from abogados where idabogado='+quotedstr(edcveabogado.Text),0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
         begin
             application.MessageBox('Ese Abogado No Existe','Aviso',mb_iconinformation);
             edcveabogado.Clear;
             edcveabogado.SetFocus;
         end else
                tblexclientesidabogado.AsString := edcveabogado.Text;


      end;
      end;
//   end;
end;

procedure TfrmExClientes.edcveabogadoButtonClick(Sender: TObject);
begin
 frmbusquedas.query:='Select idabogado,nombre,apaterno,amaterno From abogados order by idabogado';
       frmbusquedas.campo_retorno:='idabogado';
       frmbusquedas.campo_busqueda:='nombre';
       frmbusquedas.tblorigen :='abogados';
       frmbusquedas.tabla:='';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
         begin
         edcveabogado.Text:=frmbusquedas.resultado;
         //trae el nombre del abogado
         querys('select nombre from abogados where idabogado = '+edcveabogado.Text,0,sqlgeneral);
         edNomAbogado.Text:=sqlgeneral.fieldbyname('nombre').AsString;
         edcveabogado.SetFocus;
         end;
end;

procedure TfrmExClientes.edmontocontKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edmontocont.Text,key);
if key=#13 then
dtpdesdecont.SetFocus;
end;

procedure TfrmExClientes.edNumEmbargoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
key:=#0;
dtpfechaabo.SetFocus;
end;
end;

procedure TfrmExClientes.edNumDemandaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edNumDemanda.Text<>'') then
begin
key:=#0;
edNumEmbargo.SetFocus;
end;
end;

procedure TfrmExClientes.Cobros1Click(Sender: TObject);
//var hija:TfrmPagosDebe;
begin
  {   hija:=TfrmPagosDebe.Create(self);
     hija.inicializa(edclave.text);
     hija.Show;}
end;

procedure TfrmExClientes.edCveVendKeyPress(Sender: TObject; var Key: Char);
begin
if (edCveVend.Text<>'')and(key=#13) then
   begin
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
     cbovendedor.Text := SqlGeneral.fieldbyname('nombre').AsString;
     edCveVend.Text := SqlGeneral.fieldbyname('idusuario').AsString;
     CboVendedor.SetFocus;
    end
   else
    begin
     application.MessageBox('Esa Clave de Usuario no Existe o no esta activo, verifiquelo y vuelva a intentarlo!','Error',mb_ok+mb_iconwarning);
     edCveVend.Text:='';
    end;
   end;

if key = #13 then
begin
 key := #0;
 cboVendedor.SetFocus;
end;
end;

procedure TfrmExClientes.edCveVendChange(Sender: TObject);
begin
//if edCveVend.Text = '' then
//cboVendedor.Text:='';
end;

procedure TfrmExClientes.tblexclientesAfterScroll(DataSet: TDataSet);
begin
if (dataset.State <> dsedit) and (dataset.State <> dsinsert)and(tblexclientesidvendedor.Asinteger<>0) then
 begin
   querys('select idusuario from usuarios where idusuario = '+tblexclientesidvendedor.AsString,0,sqlgeneral);
   edCveVend.Text := sqlgeneral.fieldbyname('idusuario').AsString;
 end;
end;

procedure TfrmExClientes.CboVendedorSelect(Sender: TObject);
begin
querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = ''VENDEDOR'' AND usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull'+
       '(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) like '+quotedstr('%'+cboVendedor.Text+'%')+' or usuarios.nombre like '+quotedstr('%'+cboVendedor.Text+'%')+' order by usuarios.nombre',0,SqlGeneral);
edCveVend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
end;

procedure TfrmExClientes.FormActivate(Sender: TObject);
begin
self.WindowState:=wsMaximized;
end;

procedure TfrmExClientes.CboVendedorChange(Sender: TObject);
begin
if cbovendedor.text = '' then
 edCvevend.clear;
end;

procedure TfrmExClientes.lAA1Click(Sender: TObject);
begin
if btnmodificar.Caption='&Guardar' then
//tblexclientes.Post;
frmnotas.Caption:='Notas de Llamadas de este Cliente';
frmnotas.idProcedencia:=tblexclientesidcliente.AsInteger;
frmnotas.idNota:=tblexclientesidnota.AsInteger;
frmnotas.TipoNota:='LLAMADA';
frmnotas.tabla:='NoClientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
{tblexclientes.Refresh;
tblexclientes.Edit;}
end;

procedure TfrmExClientes.Zonas1Click(Sender: TObject);
//var hija:TfrmZonasCliente;
begin{
hija:=TfrmZonasCliente.Create(self);
hija.edclave.Text:= edclave.Text;
hija.eshija := true;
hija.edclave.Enabled := false;
hija.buscarlocate;
hija.Show;}
end;

procedure TfrmExClientes.emporalMonitoreo1Click(Sender: TObject);
begin    {
if btnmodificar.Caption='&Guardar' then
//tblexclientes.Post;
frmnotas.Caption:='Notas Temporales de Monitoreo';
frmnotas.idProcedencia:=tblexclientesidcliente.AsInteger;
frmnotas.idNota:=tblexclientesidnota.AsInteger;
frmnotas.TipoNota:='TEMPORAL_MONITOREO';
frmnotas.tabla:='NoClientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
{tblexclientes.Refresh;
tblexclientes.Edit;}
end;

procedure TfrmExClientes.rafico1Click(Sender: TObject);
//var hijo:Tfrmtraficocliente;
begin{
hijo:=Tfrmtraficocliente.Create(self);
hijo.edclave.Text:= edclave.Text;
hijo.eshijo := true;
hijo.edclave.Enabled := false;
hijo.btnbuscar.OnClick(self);
hijo.Show;}
end;

procedure TfrmExClientes.edmskrfcExit(Sender: TObject);
//var hija:tfrmdatosfactura;
begin{
if (edmskrfc.Text<>'')and(tblexclientesidfact.AsInteger = 0) and ((btnalta.Caption = '&Guardar') or (btnmodificar.caption = '&Guardar')) then
 begin
  querys('select NoClientesFact.idcliente,if(NoClientesFact.rsocial='''' OR NoClientesFact.rsocial is null,concat(ifnull(NoClientesFact.nombre,''''),'' '',ifnull(NoClientesFact.apaterno,''''),'' '',ifnull(NoClientesFact.amaterno,'''')),NoClientesFact.rsocial) as nombre '+
         ' from NoClientesFact where rfc like '+quotedstr('%'+trim(edmskrfc.Text)+'%'),0,sqlgeneral);
  if (sqlgeneral.RecordCount > 0) and (sqlgeneral.FieldByName('idcliente').AsString<>edclave.Text) then
   if application.MessageBox(pchar('Se ha detectado este RFC en los datos de facturacion de el cliente '+sqlgeneral.fieldbyname('nombre').asstring+', Desea asignar esos datos de facturacion a esta cuenta?'),'Aviso',mb_iconquestion+mb_yesno)= idyes then
    begin
     frmbusquedas.query:='SELECT  NoClientesFact.idcliente,NoClientesFact.idfact,if(NoClientesFact.rsocial='''',concat(ifnull(NoClientesFact.nombre,''''),'' '',ifnull(NoClientesFact.apaterno,''''),'' '',ifnull(NoClientesFact.amaterno,'''')),NoClientesFact.rsocial) as nombre, '+
                         ' NoClientesFact.dir, NoClientesFact.numero,colonias.nombre AS Colonia,NoClientesFact.ciudad,NoClientesFact.cp,NoClientesFact.rfc FROM NoClientesFact INNER JOIN colonias ON (NoClientesFact.idcol = colonias.idcol) '+
                         ' where NoClientesFact.rfc like '+quotedstr('%'+trim(edmskrfc.Text)+'%')+ ' order by NoClientesFact.idcliente';
       frmbusquedas.campo_retorno:='idfact';
       frmbusquedas.campo_busqueda:='nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen := 'NoClientesFact';
       frmbusquedas.tabla:='';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
        tblexclientesidfact.Asstring := frmbusquedas.resultado;
    end
   else
    begin
     hija:=tfrmdatosfactura.Create(self);
     hija.inicializa(tblexclientesidcliente.AsString,tblexclientesidfact.asinteger);
     hija.Show;
     {tblexclientes.Post;
     tblexclientes.Refresh;
     tblexclientes.Edit;
    end;
   end;}
  end;

procedure TfrmExClientes.btnzonasClick(Sender: TObject);
var hija:TfrmNoZonasCliente;
begin
hija:=TfrmNoZonasCliente.Create(self);
hija.edclave.Text:= edclave.Text;
hija.edidnocliente.text := edidnocliente.text;
hija.eshija := true;
hija.edclave.Enabled := false;
hija.buscarlocate;
hija.Show;
end;

procedure TfrmExClientes.tblexclientesBeforePost(DataSet: TDataSet);
//var habilitado:integer;
begin      {
bpcambios('clientes', edclave.text, 'idcliente');
if edpasswordweb.Text = '' then
  edpasswordweb.Text := edcontrasena.Text;

if edusuarioweb.Text = '' then
  edusuarioweb.Text := edclave.Text;
}
end;

procedure TfrmExClientes.btnserviciosClick(Sender: TObject);
var forma:TfrmExBuscarServ;
begin
forma := TfrmExBuscarServ.Create(self);
forma.inicializa(edclave.Text,'CLIENTES',false);
forma.Show;
end;

procedure TfrmExClientes.cbocoloniasClick(Sender: TObject);
begin
 querys('SELECT colonias.cp,if(sectores.nombre is not null,concat(''Sector '',sectores.nombre),''No Definido'') as Sector,col_sector.idsector as sec FROM col_sector  left JOIN sectores ON (col_sector.idsector=sectores.idsector)   '+
        'left join colonias on colonias.idcol = col_sector.idcol WHERE colonias.nombre ='+quotedstr(cbocolonias.Text),0,sqlgeneral);
 edSector.Text := sqlgeneral.FieldByName('sec').AsString;
 edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure TfrmExClientes.bonificacionesClick(Sender: TObject);
//var hija : tfrmbonificaciones;
begin{
hija := tfrmbonificaciones.Create(self);
hija.inicializa(edclave.Text);}
end;

procedure TfrmExClientes.Componentes1Click(Sender: TObject);
begin
querys('select count(DetPedido.cod_cve) as cant,DetPedido.cod_cve,articulos.nombre,pedidos.idcliente from NoPedidos inner join NoDetPedido on DetPedido.idpedido = pedidos.idpedido inner join articulos on articulos.cod_cve = DetPedido.cod_cve inner join '+
       ' NoClientes on NoClientes.idcliente = pedidos.idcliente where articulos.idlinea=4 and articulos.inventariable=1 and pedidos.FechaCreacion>=NoClientes.st_date and NoClientes.idcliente='+edclave.Text+' group by DetPedido.cod_cve,pedidos.idcliente order by pedidos.idcliente',0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount > 0 then
 OperacionReporte('ComponentesCta','','IMP',1)
else
 application.MessageBox('No se encontraron ventas de equipo con fecha mayor a la fecha de alta del cliente','Aviso',mb_iconinformation);
end;

procedure TfrmExClientes.HorariosdeAperturasyCierres1Click(Sender: TObject);
//var hija : tfrmAperturaCierre;
begin{
hija := tfrmAperturaCierre.Create(self);
hija.inicializa(edclave.Text);
hija.Show;}
end;

procedure TfrmExClientes.SeguimientoNoseales1Click(Sender: TObject);
begin      {
if btnmodificar.Caption='&Guardar' then
tblexclientes.Post;
frmnotas.Caption:='Notas de Seguimiento a No Señales de este Cliente';
frmnotas.idProcedencia:=tblexclientesidcliente.AsInteger;
frmnotas.idNota:=tblexclientesidnota.AsInteger;
frmnotas.TipoNota:='NOALARMAS';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
tblexclientes.Refresh;
tblexclientes.Edit;}
end;

procedure TfrmExClientes.tblexclientesAfterPost(DataSet: TDataSet);
// var hija : TfrmZonasCliente;
begin{
apcambios('idcliente', edclave.Text, 'clientes', 'frmclientes');
querys('Select * from Cambios where idprimario='+quotedstr(edclave.text)+
        ' and campo=''idprotocolo'' and pantalla = ''frmclientes'' and fecha='+quotedstr(datetostr(FechaServidor))+
        ' order by idcambio desc',0, sqlgeneral);
if sqlgeneral.recordcount > 0 then
  begin    
  querys('Select p.protocolo  from cliente_zonas as c  left join protocolos as p on(p.idprotocolo=c.idprotocolo) where cid ='+quotedstr(edclave.text)+' group by cid', 0, frmprincipal.sqlgeneral);
  if frmprincipal.sqlgeneral.fieldbyname('protocolo').asstring <> (cboprotocolos.text) then
    begin
    if (sqlgeneral.FieldByName('anterior').asstring = '1' ) and (sqlgeneral.FieldByName('nuevo').asstring  = '2') then
      begin
      application.MessageBox('Se comenzara a hacer el cambio de Zonas del protocolo 4x2 al protocolo SIA', 'Atencion', MB_ICONINFORMATION);
      hija:=TfrmZonasCliente.Create(self);
      hija.edclave.Text:= edclave.Text;
      hija.eshija := true;
      hija.edclave.Enabled := false;
      hija.buscarlocate;
      hija.btnmodificarClick(self);
      hija.edprotocolo.text := 'SIA';
      hija.btnconverClick(self);
      application.MessageBox('Termino de hacer el cambio de zonas', 'Aviso', MB_ICONINFORMATION);
      //hija.Show;
      end
    else
      begin
      hija:=TfrmZonasCliente.Create(self);
      hija.edclave.Text:= edclave.Text;
      hija.eshija := true;
      hija.edclave.Enabled := false;
      hija.buscarlocate;
      hija.btnmodificarClick(self);
      hija.edprotocolo.text := cboprotocolos.text;
      end;
    end;
  end;    }
end;

procedure TfrmExClientes.cboalarmaSelect(Sender: TObject);
begin
querys('Select protocolos.protocolo,protocolos.idprotocolo From articulos Inner Join protocolos ON articulos.idprotocolo = protocolos.idprotocolo Where articulos.cod_cve = '+quotedstr(cboalarma.Text),0,sqlgeneral);
cboprotocolos.Tag := sqlgeneral.fieldbyname('idprotocolo').asinteger;
cboprotocolos.text := sqlgeneral.fieldbyname('protocolo').asstring;
end;

procedure TfrmExClientes.edidnoclienteChange(Sender: TObject);
begin
if edidnocliente.Text = '' then
  edclave.Text := '';
end;

procedure TfrmExClientes.edidnoclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  buscarlocate;
  end;
end;

procedure TfrmExClientes.FormResize(Sender: TObject);
begin
ltitulo.Top := bg.Top + 5;
end;

End.

