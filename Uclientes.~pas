{///////////////////////////////////////////////////////////////////////////////
2012/05/28 dalyla campos de linea telefonica
--------------------------------------------------------------------------------
2010/04/09 Oscar cambio de contrato de poliza por mantenimiento
2009/04/02 dalyla campo de estudio de vuln y articulos
2009/04/01 dalyla modificar notas temporales
2009/03/18 dalyla agregar presp 100%
2009/03/02 dalyla Utilizar campos ay existentes de polizas
2009/02/25 label de mantenimientos preventivos
2009/01/21 dalyla derechos de clientes compartidos en su pantalla,
                  aki ke se puedan ver
--------------------------------------------------------------------------------
2008/11/25 oscar comunicadores
2008/10/24 Oscar modifique el query del combo vendedor
2008/10/03 Oscar agrege el modulo de comunicador
2008/07/24 Cambios sincronizacion
2008/07/23 dalyla derechossys  (contratos, abogados)
2008/07/11 dalyla Nota Ubicacion rich por memo
2008/02/28 dalyla zona horaria ok
2007/11/08 Oscar validaciones de campos control,origen,vendedor,opciones de
                 usuarios y contactos
2007/02/08 Angel
}///////////////////////////////////////////////////////////////////////////////
unit Uclientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DB, MyAccess, Menus, MemDS, DBAccess, Grids,
  DBGrids, Mask, StdCtrls, RzCmboBx, RzDBEdit, RzButton, RzEdit, RzLabel,
  RzDBCmbo, UCBase, LMDCustomComponent, LMDWndProcComponent, LMDMouseBaseCtrl,
  LMDMouseFencer, DBCtrls, ComCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxDBEdit, cxMaskEdit, RzTabs, RzDBNav, cxCurrencyEdit, RzBtnEdt,
  RzDBBnEd, LMDPopupMenu, LMDContainerComponent, LMDBaseDialog, LMDCalendarDlg,
  RzDTP, RzDBDTP, RzRadChk, RzDBChk, ToolWin, dateutils;

type                                    {ToolWin, ToolEdit,CurrEdit,}
    Tfrmclientes = class(TForm)
    DSclientes: TDataSource;
    sqlgeneral: TMyQuery;
    tblclientes: TMyTable;
    fuentes: TFontDialog;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
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
    btnzonas: TRzBitBtn;
    btntrafico: TRzBitBtn;
    lbUltMod: TRzLabel;
    chkonline: TRzDBCheckBox;
    btnservicios: TRzBitBtn;
    lbltelefono: TRzLabel;
    RzDBCheckBox2: TRzDBCheckBox;
    RzDBCheckBox3: TRzDBCheckBox;
    btnbloqueo: TRzBitBtn;
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
    NoClientes1: TMenuItem;
    HorariosdeAperturasyCierres1: TMenuItem;
    RzDBCheckBox6: TRzDBCheckBox;
    tblclientesidcliente: TIntegerField;
    tblclientesrfc: TStringField;
    tblclientesrsocial: TStringField;
    tblclientescurp: TStringField;
    tblclientesnombre: TStringField;
    tblclientesapaterno: TStringField;
    tblclientesamaterno: TStringField;
    tblclientesdir: TStringField;
    tblclientesnumero: TStringField;
    tblclientesciudad: TStringField;
    tblclientesestado: TStringField;
    tblclientescp: TStringField;
    tblclientessector: TStringField;
    tblclientesrefs: TStringField;
    tblclientespass: TStringField;
    tblclientesidtipo: TSmallintField;
    tblclientesalarm: TStringField;
    tblclientespermit: TStringField;
    tblclientestelefono: TStringField;
    tblclientesstopmode: TStringField;
    tblclientesemail: TStringField;
    tblclientessendmail: TSmallintField;
    tblclientesidcol: TStringField;
    tblclientesst_date: TDateField;
    tblclientesidgiro: TIntegerField;
    tblclientesidtel: TIntegerField;
    tblclientesidcontacto: TIntegerField;
    tblclientesprecio: TStringField;
    tblclientesidcategoria: TSmallintField;
    tblclientespassword: TStringField;
    tblclientesbeeper: TStringField;
    tblclientescelular: TStringField;
    tblclientescomentario: TMemoField;
    tblclientesidvendedor: TIntegerField;
    tblclientestype: TStringField;
    tblclientesidfact: TIntegerField;
    tblclientesidorigen: TIntegerField;
    tblclientesidfuente: TIntegerField;
    tblclientesusuario: TStringField;
    tblclientesfecha: TStringField;
    tblclienteshora: TStringField;
    tblclientesidreferencia: TIntegerField;
    tblclientescredito: TFloatField;
    tblclientesPlazoCredito: TIntegerField;
    tblclientesidusuario: TIntegerField;
    tblclientesestatus: TSmallintField;
    tblclientesidnota: TLargeintField;
    tblclientesbloqueado: TSmallintField;
    tblclientesNotaBloqueo: TMemoField;
    tblclientesUltimaCompra: TDateField;
    tblclientesTotComprado: TFloatField;
    tblclientessaldo: TFloatField;
    tblclientesidusuarios: TIntegerField;
    tblclientesidprotocolo: TIntegerField;
    tblclientesPruebaSema: TIntegerField;
    tblclientespoliza: TIntegerField;
    tblclientesFechaPoli: TDateField;
    tblclientesEstVul: TIntegerField;
    tblclientesArtDesc: TIntegerField;
    tblclientesFechaPolVe: TDateField;
    tblclientesNoPatrulla: TIntegerField;
    tblclientesClienteAlarmex: TIntegerField;
    tblclientesCantUltCompra: TFloatField;
    tblclientesvendedor: TStringField;
    tblclientesMontoCont: TFloatField;
    tblclientesTipoCont: TStringField;
    tblclientesDesdeCont: TDateField;
    tblclientesHastaCont: TDateField;
    tblclientesidabogado: TIntegerField;
    tblclientesFechaAbo: TDateField;
    tblclientesNumDemanda: TStringField;
    tblclientesNumEmbargo: TStringField;
    tblclientesFechaCancelacion: TDateField;
    tblclientesMemoCancelacion: TMemoField;
    tblclientesidmotivo: TIntegerField;
    tblclientesdeducible: TBooleanField;
    tblclientesNotaUbicacion: TMemoField;
    tblclientesidsupervisor: TIntegerField;
    tblclientesultfectraf: TDateField;
    tblclientesultfecps: TDateField;
    tblclientesGrupoTrafico: TIntegerField;
    tblclientesVenceContrato: TSmallintField;
    tblclientesidnocliente: TIntegerField;
    tblclientesidOpenClose: TIntegerField;
    SeguimientoNoseales1: TMenuItem;
    lbltravelers: TRzLabel;
    lblservicios: TRzLabel;
    lblinstalaciones: TRzLabel;
    RzLabel25: TRzLabel;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    tblclientesusuarioweb: TStringField;
    tblclientespasswordweb: TStringField;
    RzLabel26: TRzLabel;
    Pweb: TRzGroupBox;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    edusuarioweb: TRzDBEdit;
    edpasswordweb: TRzDBEdit;
    lbAdeudos: TRzLabel;
    chkNoReporte: TRzDBCheckBox;
    tblclientesNoReporte: TSmallintField;
    RzLabel24: TRzLabel;
    cboprotocolos: TRzComboBox;
    ednum_origen: TRzDBNumericEdit;
    ips1: TMenuItem;
    RzDBCheckBox7: TRzDBCheckBox;
    tblclientesFinLinea: TIntegerField;
    CuentasCompartidas1: TMenuItem;
    ednotaubica: TRzDBMemo;
    DigitalizarDocumentos1: TMenuItem;
    lmantenimientos: TRzLabel;
    rgpoliza: TRzGroupBox;
    RzDBCheckBox8: TRzDBCheckBox;
    dtpoliza: TRzDBDateTimeEdit;
    RzLabel29: TRzLabel;
    dtpolvence: TRzDBDateTimeEdit;
    RzDBCheckBox9: TRzDBCheckBox;
    tblclientesPresp100: TStringField;
    Modificaciones1: TMenuItem;
    ModificarTemporal1: TMenuItem;
    RzDBCheckBox10: TRzDBCheckBox;
    RzLabel30: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    chkpreventivo: TRzCheckBox;
    lbpreventivo: TRzLabel;
    btnservesp: TRzBitBtn;
    RzLabel31: TRzLabel;
    chkkcambiocodigo: TRzCheckBox;
    lbufh: TRzLabel;
    chkbasecel: TRzDBCheckBox;
    chkprepago: TRzDBCheckBox;
    RzLabel32: TRzLabel;
    cbprovtel: TRzComboBox;
    tblclientesidprovtel: TSmallintField;
    tblclientesbasecel: TBooleanField;
    tblclientesprepago: TBooleanField;
    chklineatel: TRzDBCheckBox;
    RzLabel33: TRzLabel;
    cbprovcel: TRzComboBox;
    tblclientesidprovcel: TSmallintField;
    tblclienteslineatel: TSmallintField;
    RzDBCheckBox11: TRzDBCheckBox;
    tblclientesdeducibleIEPS: TBooleanField;
    chkemailoc: TRzDBCheckBox;
    tblclientesemailoc: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure rejilla_telsDblClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure dtaltaClick(Sender: TObject);
    procedure edciudadEnter(Sender: TObject);
    procedure edestadoEnter(Sender: TObject);
    procedure edamaternoKeyPress(Sender: TObject; var Key: Char);
    procedure btnfuentesClick(Sender: TObject);
    procedure recomentariosEnter(Sender: TObject);
    procedure recomentariosExit(Sender: TObject);
    procedure edrazonChange(Sender: TObject);
    procedure edmskrfcKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreChange(Sender: TObject);
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
    procedure ednum_origen2KeyPress(Sender: TObject; var Key: Char);
    procedure ednum_origen2Exit(Sender: TObject);
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
    procedure Referencias1Click(Sender: TObject);
    procedure DatosFacturacion1Click(Sender: TObject);
    procedure OtrosDatos1Click(Sender: TObject);
    procedure Responsables1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure telefonos1Click(Sender: TObject);
    procedure ppmopcionesBeforePopUp(Sender: TObject; X, Y: Integer;
      var Cancel: Boolean);
    procedure btnbloqueoClick(Sender: TObject);
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
    procedure tblclientesAfterScroll(DataSet: TDataSet);
    procedure CboVendedorSelect(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CboVendedorChange(Sender: TObject);
    procedure lAA1Click(Sender: TObject);
    procedure Zonas1Click(Sender: TObject);
    procedure emporalMonitoreo1Click(Sender: TObject);
    procedure rafico1Click(Sender: TObject);
    procedure edmskrfcExit(Sender: TObject);
    procedure btnzonasClick(Sender: TObject);
    procedure btntraficoClick(Sender: TObject);
    procedure tblclientesBeforePost(DataSet: TDataSet);
    procedure btnserviciosClick(Sender: TObject);
    procedure cbocoloniasClick(Sender: TObject);
    procedure bonificacionesClick(Sender: TObject);
    procedure Componentes1Click(Sender: TObject);
    procedure NoClientes1Click(Sender: TObject);
    procedure HorariosdeAperturasyCierres1Click(Sender: TObject);
    procedure SeguimientoNoseales1Click(Sender: TObject);
    procedure tblclientesAfterPost(DataSet: TDataSet);
    procedure cboalarmaSelect(Sender: TObject);
    procedure ips1Click(Sender: TObject);
    procedure ednum_origenExit(Sender: TObject);
    procedure ednum_origenKeyPress(Sender: TObject; var Key: Char);
    procedure edCveVendExit(Sender: TObject);
    procedure CuentasCompartidas1Click(Sender: TObject);
    procedure DigitalizarDocumentos1Click(Sender: TObject);
    procedure Modificaciones1Click(Sender: TObject);
    procedure ModificarTemporal1Click(Sender: TObject);
    procedure btnservespClick(Sender: TObject);
  private
    { Private declarations }
    idtelefono:string;
    vienedeforma:boolean;
    procedure trae_datos(Sender: TObject);
// procedure limpia_combos(Sender: TObject);
    procedure AgregarPreventivo;
    function Validar:boolean;
  public
    { Public declarations }
    EstatusCliente:string;
    procedure nombre_clave(const edit:trzdbnumericedit;combo:trzcombobox;Const query:string;Sender: TObject);
    procedure buscarlocate;
    constructor inicializa(const cuenta:string);
    procedure CambiaEnabledBotones(NuevoValor:boolean);
    procedure eliminarpedidos;
    procedure limpiar;
    procedure TraeContrato;
    procedure CargaContrato;
  end;

var
  frmclientes: Tfrmclientes;
  tecla:char;
implementation

uses Udm, Uprincipal, Ubusquedas, Uasig_eve_vend, Ucontactos, Utel,
  Udatosfactura, UDatAdiCliente, UNotas, Urecursos, Uclie_cancel,
  UVistaVtasCliente, UfrmPagosDebe, Ucliente_zonas, utraficocliente,
  Udmrep, UBuscarServ, Ubonificaciones, Umensaje,
  UAperturaCierre, Uautentificacion, Utips, UCuentascompartidas, uscanner,
  URepClientes, uNotasTemp, uservicios_esp;

{$R *.dfm}

constructor Tfrmclientes.inicializa(const cuenta:string);
begin
  CargaCombo('SELECT u.idusuario, '+UsuarioNombre('u')+' AS Nombre FROM usuarios u '+
             'INNER JOIN puestos  p ON u.idpuesto = p.idpuesto '+
             'WHERE p.nombre like "%VENDEDOR%" and  u.estatus=1 order by u.nombre', 'Vendedores', cbovendedor);
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edclave.Text:='';

  if cuenta <> '0' then
  begin
  edclave.text := cuenta;
  buscarlocate;
  end
else
  begin
  //verifica si el usuario actual esta en el area administracion y puesto gerente
  if (frmprincipal.AreaUsuario = 'ADMINISTRACION' ) and ( frmprincipal.PuestoUsuario = 'GERENTE') then
    begin
    if querys('Select idcliente From clientes where estatus=2 and st_date > = "'+datetostr(date-60)+'" order by idcliente',0,sqlgeneral) > 0 then
      begin
      if application.MessageBox('Tiene clientes con estatus por revisar, desea verlos?', 'Pregunta', mb_yesno+mb_iconquestion) = idyes then
        begin
        //trae los clientes que tienen 60 dias de alta y que estatus = 2
        frmbusquedas.query := 'Select idcliente, '+UsuarioNombre('c')+' as Nombre, rsocial AS RazonSocial, estatus as Estatus, '+
                              'bloqueado as Bloqueado, dir as Direccion, numero as Numero, ciudad as Ciudad, estado as Estado, '+
                              'usuario as Usuario, fecha as Fecha, hora as Hora '+
                              'From clientes where estatus=2 and st_date>="'+datetostr(date-60)+'" order by idcliente';
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
          tblclientes.Active:=true;
          tblclientes.Locate('idcliente',frmbusquedas.resultado,[]);
          sqlcolonias.Active:=true;
          tblcategoria.Active:=true;
          cboestatus.ItemIndex := tblclientesestatus.AsInteger;
          edclave.Text:=frmbusquedas.resultado;
          edclave.SetFocus;
          buscarlocate;
          btnmodificar.Enabled:=true;
          gbclientes.Enabled:=false;
          Pweb.Enabled:=false;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfrmclientes.buscarlocate;
begin
  tblclientes.Active:=true;
  if tblclientes.Locate('idcliente',edclave.Text,[]) then
    begin
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
    tblclientes.Active:=false;
    //limpia_combos(self);
    limpiar;
    edclave.Text:='';
    lblUltServicio.caption := 'Ultimo Servicio :';
    edclave.SetFocus;
    end;
end;

procedure tfrmclientes.nombre_clave(const edit:trzdbnumericedit;combo:trzcombobox;Const query:string;Sender: TObject);
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
              {
procedure tfrmclientes.limpia_combos(Sender: TObject);
begin
ppmopciones.Items.Items[12].Visible := false;
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
lmantenimientos.Caption := 'Mantenimientos';

end; }

procedure Tfrmclientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmclientes.FormCreate(Sender: TObject);
begin
trae_datos(self);
gbclientes.Enabled:=false;
Pweb.Enabled:=false;
if  DerechosSys('Alta Clientes') = false then
  btnalta.Visible := false;
end;

procedure tfrmclientes.trae_datos(Sender: TObject);
//var cadena:string;
begin
if tblclientes.Active then
   begin
   BuscaPendientesCliente('Travelers: ','No Tiene Travelers Pendientes','SELECT travel.idtravel as id FROM travel inner join clientes on clientes.idcliente=travel.idcliente JOIN EstatusServicios ON (travel.idestatus = EstatusServicios.orden) INNER JOIN '+
                           ' TipoServicios ON (EstatusServicios.idserv = TipoServicios.idserv) WHERE (TipoServicios.nombre = ''TRAVEL'') AND  EstatusServicios.finaliza=0 and clientes.idcliente='+edclave.Text+' order by travel.idtravel',lbltravelers);
   BuscaPendientesCliente('Servicios: ','No Tiene Servicios Pendientes','select s.sid as id from servicios as s left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) inner join  clientes as c on c.idcliente = s.idcliente where s.status < 4 '+
                           ' and ts.nombre=''ESTATUS SERVICIO'' and c.idcliente='+edclave.Text+' order by sid desc',lblservicios);
   BuscaPendientesCliente('Instalaciones: ','No hay instalaciones Pendientes','SELECT i.idinstalacion as id FROM RemiFact as rf LEFT JOIN pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON '+
                          ' (i.idpedido=p.idpedido) LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) lEFT JOIN usuarios as u ON (i.instalador1=u.codigo) WHERE  i.estatus = 0  and p.estatus in(3,4) and p.idcliente='+edclave.text+' GROUP BY p.idpedido order by u.idusuario,idinstalacion',lblinstalaciones);
   //BuscaPendientesCliente('Adeudos vencidos :','No tiene adeudo vencido', 'SELECT distinct pc.idpedido as id FROM PagosClientes as pc  left join pedidos as p on(p.idpedido=pc.idpedido) where pc.idcliente = '+edclave.text+' and pc.FechaVence <= "'+datetostr(date)+'" and pc.movimiento in(0,1) and pc.cargo > 0 and p.saldado=0',lbAdeudos);
   BuscaPendientesCliente('Adeudos vencidos :','No tiene adeudo vencido', 'SELECT distinct pc.idpedido as id, if(pc.movimiento= 0,if(pc2.movimiento = 1, -1,0),1) as condicion '+
   ' from PagosClientes as pc left join pedidos as p on (p.idpedido=pc.idpedido) left join PagosClientes as pc2 on (pc2.idpedido = pc.idpedido and pc2.movimiento = 1) '+
   ' where pc.idcliente = '+edclave.text+'  and p.estatus in(3,4,6) and p.saldado=0  and pc.movimiento in(0,1) and pc.restante > 0 having condicion >= 0 ',lbAdeudos);
   BuscaPendientesCliente('Mantenimientos :','No tiene mantenimientos', 'SELECT max(FechaRealizada) as id FROM DetMantenimientos where idcliente = '+edclave.text+' and realizada = 1',lmantenimientos);

   lbufh.Caption := UFH(tblclientes);

   querys('Select * from ClientesCambios  where idcliente='+quotedstr(edclave.Text)+' order by fecha desc',0,sqlgeneral);
    if sqlgeneral.FieldByName('idcliente').AsString <> '' then
        lbUltMod.Caption := 'Ultima Mod Estatus : '+sqlgeneral.FieldByName('usuario').AsString+' ('+sqlgeneral.FieldByName('fecha').AsString+','+sqlgeneral.FieldByName('hora').AsString +')'
    else
        lbUltMod.Caption := 'Ultima Mod Estatus :';

    //verifica si el cliente tiene la opcion de aperturas y cerres
    if tblclientes.FieldByName('idOpenClose').Asinteger = 1 then
     ppmopciones.Items.Items[12].Visible := true
    else
     ppmopciones.Items.Items[12].Visible := false;
     //si cuenta con cargos automaticos
     querys('Select flcargo from DetClientes where idcliente = '+quotedstr(edclave.Text),0,sqlgeneral);

     if sqlgeneral.FieldByName('flcargo').AsString = '1' then
         lbcargosautomaticos.Caption := 'Cuenta con cargo automático'
     else
         lbcargosautomaticos.Caption := '';

     //cambio de codigo maestro en alarma fisica
     if(querys('SELECT idcontador from CambioCodigo where idcliente = "'+edclave.text+'"', 0, sqlgeneral)) > 0 then
         chkkcambiocodigo.checked := true
     else
         chkkcambiocodigo.checked := false;

    edclave.Text:=inttostr(tblclientes.fieldbyname('idcliente').AsInteger);

    if(querys('Select fechacreacion, year(fechacreacion) as a from servicios_preventivos s '+
       'where idcliente = '+edclave.Text+' order by idservicio desc ', 0, sqlgeneral)) > 0 then
       begin
       lbpreventivo.Caption := 'Preventivo Anual: '+sqlgeneral.fieldbyname('fechacreacion').AsString;
       if sqlgeneral.fieldbyname('a').AsInteger = yearof(date()) then
         chkpreventivo.Checked := true
       else
         chkpreventivo.Checked := false;
       end
     else
         begin
         chkpreventivo.Checked := false;
         lbpreventivo.Caption := 'Preventivo Anual: ';
         end;

      //ultimo servicio realizado al cliente.
     querys('Select sid,fecha_creacion,CodTecnico from servicios where idcliente='+edclave.Text+' order by sid desc limit 1',0,sqlgeneral);
     if sqlgeneral.fieldbyname('fecha_creacion').AsString <>  '' then
         lblUltServicio.Caption := 'Ultimo Servicio : '+  sqlgeneral.fieldbyname('fecha_creacion').AsString +' ('+ sqlgeneral.fieldbyname('CodTecnico').AsString +')'
     else
         lblUltServicio.Caption := 'No se ha realizado ningun servicio';

    cboestatus.ItemIndex:=tblclientes.fieldbyname('estatus').Asinteger;
    cboestatus.Text := cboestatus.Items.Strings[cboestatus.ItemIndex];
    //me trae el primer telefono que tenga el cliente
    querys('select telefonos.telefono,telefonos.tipo_tel from clientes left join telefonos on telefonos.idtel = clientes.idtel where idcliente='+edclave.Text+' group by idcliente order by telefonos.tipo_tel',0,sqlgeneral);
    lbltelefono.Caption :='Telefono:'+sqlgeneral.fieldbyname('telefono').AsString+' Tipo:'+sqlgeneral.fieldbyname('tipo_tel').AsString;

    if tblclientes.FieldByName('idgiro').AsString <> '' then
        begin
         ednum_giro.Text:=tblclientes.FieldByName('idgiro').AsString;
         tecla:=#13;
         ednum_giro.OnKeyPress(self,tecla);
        end;

    if tblclientesidprotocolo.AsInteger <> 0 then
     begin
      querys('select protocolo from protocolos where idprotocolo='+tblclientesidprotocolo.AsString,0,sqlgeneral);
      cboprotocolos.Text := sqlgeneral.fieldbyname('protocolo').AsString;
     end
     else
       cboprotocolos.itemindex := -1;

     if tblclientesidprovtel.AsInteger <> 0 then
     begin
      querys('select nombre from provtel where idproveedor='+tblclientesidprovtel.AsString,0,sqlgeneral);
      cbprovtel.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
     else
       cbprovtel.itemindex := -1;

     if tblclientesidprovcel.AsInteger <> 0 then
     begin
      querys('select nombre from provtel where idproveedor='+tblclientesidprovcel.AsString,0,sqlgeneral);
      cbprovcel.Text := sqlgeneral.fieldbyname('nombre').AsString;
     end
     else
       cbprovcel.itemindex := -1;                                      

     if tblclientesidvendedor.AsInteger <> 0 then
      begin
       try
        querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '','+
        'ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario,codigo FROM usuarios INNER JOIN puestos ON '+
        '(usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre like "%VENDEDOR%" and  '+
        'usuarios.idusuario='+tblclientesidvendedor.AsString,0,SqlGeneral);          //AND usuarios.estatus = 1   usuarios.estatus = 1 and
       except
        querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull'+
        '(usuarios.amaterno,'' '')) AS Nombre,idusuario,codigo FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = '+
        ' puestos.idpuesto) WHERE puestos.nombre like "%VENDEDOR%" AND usuarios.codigo='+
        quotedstr(tblclientesidvendedor.AsString),0,SqlGeneral);
       end;
        cbovendedor.Text := sqlgeneral.fieldbyname('nombre').AsString;
        edCveVend.Text := sqlgeneral.fieldbyname('idusuario').AsString;
       end
      else
       begin
        cbovendedor.Text := '';
        edcvevend.Text := '';
       end;

     if tblclientesidabogado.AsInteger <> 0 then
      begin
       querys('select nombre,idabogado from abogados where idabogado = '+tblclientesidabogado.Asstring,0,sqlgeneral);
         if sqlgeneral.FieldByName('idabogado').AsString <> '' then
           begin
              edNomAbogado.Text:=sqlgeneral.fieldbyname('nombre').AsString;
              edcveabogado.text:=sqlgeneral.fieldbyname('idabogado').AsString;
           end else
             edcveabogado.text := tblclientesidabogado.Asstring;
      end
     else begin
       edNomAbogado.Text:='';
       edcveabogado.text:='';
     end;

     if tblclientesTipoCont.AsString <> '' then
      begin
          querys('select nombre,TipoCont,cancelado,estatus,TieneVigencia from contratos where TipoCont ='+quotedstr(tblclientesTipoCont.AsString),0,sqlgeneral);
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
      end
     else begin
      edNomContrato.Text := '';
      edTipoCont.Text := '';
     end;

     if tblclientesidnota.AsString <> '' then
      begin
       //trae la cantidad de bloqueos de este cliente
       querys('select count(nota) from notas where idnota='+tblclientesidnota.AsString+' and TipoNota='+quotedstr('BLOQUEO'),0,sqlgeneral);
       lblCantBloq.Caption:='Cantidad de Bloqueos: '+inttostr(sqlgeneral.Fields.Fields[0].AsInteger);
      end;

       //verifica si la cuenta esta bloqueada
     if tblclientesbloqueado.AsInteger = 1 then
       begin
         lblbloqueado.Caption:='Cliente Bloqueado? Si';
         lblbloqueado.Font.Color:=clred;
         frmnotas.REAnterior.Text:=tblclientesNotaBloqueo.AsString;
         frmnotas.TipoNota:='-1';
         frmnotas.idNota:=tblclientesidnota.AsInteger;
         if tblclientesidnota.AsInteger <> 0 then
          begin
           //trae la ultima fecha de bloqueo
           querys('SELECT MAX(fecha) as fecha,hora,nota from notas where TipoNota=''BLOQUEO'' and idnota = '+tblclientesidnota.Asstring+' group by idnota',0,sqlgeneral);
           lblFecBloq.Caption :='Fecha del Bloqueo: '+sqlgeneral.fieldbyname('fecha').asstring;
           frmnotas.ShowModal;
          end;
           btnbloqueo.Caption:='DesBlo&quear';
       end
     else
       begin
        btnbloqueo.Caption:='B&loquear';
        lblbloqueado.Caption:='Cliente Bloqueado? No';
        lblbloqueado.Font.Color:=clblack;
        lblFecBloq.Caption :='';
       end;

        //verifica si tiene una nota temporal para esta fecha
        querys('SELECT nota from notas where (dfecha<='+quotedstr(datetostr(FechaServidor))+' and hfecha>='+quotedstr(datetostr(FechaServidor))+' and dhora<='+quotedstr(FormatDateTime('HH:mm:ss',Time))+' and hhora>='+quotedstr(FormatDateTime('HH:mm:ss',Time))+') and idnota='+inttostr(tblclientesidnota.Asinteger)+' and TipoNota='+quotedstr('TEMPORAL'),0,sqlgeneral);
        if sqlgeneral.RecordCount > 0 then
        begin
         frmnotas.REAnterior.Text:=sqlgeneral.fieldbyname('nota').AsString;
         frmnotas.TipoNota:='-2';
         frmnotas.idNota:=tblclientesidnota.AsInteger;
         frmnotas.ShowModal;
        end;

      if tblclientes.FieldByName('idcategoria').AsString <> '' then
        begin
         ednum_categoria.Text:=tblclientes.FieldByName('idcategoria').AsString;
         tecla:=#13;
         ednum_categoria.OnKeyPress(self,tecla);
        end;

     if tblclientes.FieldByName('idorigen').AsString <> '' then
        begin
         ednum_origen.Text:=tblclientes.FieldByName('idorigen').AsString;
         tecla:=#13;
         ednum_origen.OnKeyPress(self,tecla);
        end;

      if tblclientes.FieldByName('idfuente').AsString <> '' then
        begin
         ednum_fuente.Text:=tblclientes.FieldByName('idfuente').AsString;
         tecla:=#13;
         ednum_fuente.OnKeyPress(self,tecla);
        end;

      if tblclientes.FieldByName('idcol').AsString <> '' then
       begin
        querys('SELECT colonias.cp,if(sectores.nombre is not null,concat(''Sector '',sectores.nombre),''No Definido'') as Sector,clientes.sector as sec FROM clientes INNER JOIN col_sector ON (clientes.idcol = col_sector.idcol) INNER JOIN sectores ON  '+
               '(col_sector.idsector=sectores.idsector) inner join colonias on clientes.idcol = colonias.idcol WHERE clientes.idcliente ='+tblclientes.FieldByName('idcliente').AsString,0,sqlgeneral);
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

procedure Tfrmclientes.btnaltaClick(Sender: TObject);
var cta : string;
begin
if btnalta.Caption = '&Alta' then
   begin
   navegador.Enabled:=false;
   tblclientes.Active:=true;
   sqlcolonias.Active:=true;
   tblcategoria.Active:=true;
   tblclientes.insert;

   edclave.Enabled:=false;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';

   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   gbclientes.Enabled:=true;
   Pweb.Enabled:=true;
   limpiar;
   edmskrfc.SetFocus;

   edclave.Text := inttostr(CuentaLibre); //inttostr(sqlgeneral.Fields.Fields[0].asinteger + 1);
   dtalta.Date:=date;
   dtalta.Text:=datetostr(FechaServidor);
   cboprecio.ItemIndex := 0;
   dtpdesdecont.Date := FechaServidor;
   dtphastacont.Date  := FechaServidor;
   dtpfechaabo.Date  := FechaServidor;
   CambiaEnabledBotones(false);
   end
else
   begin
   if Validar = false then
     exit;
   TraeContrato;
   btnalta.Caption:='&Alta';
   btnalta.Hint:='Dar de Alta a un Cliente';
   btncancelar.Caption:='&Cerrar';
   btncancelar.Hint:='Cerrar esta Ventana';
   btnalta.ImageIndex:=5;
   navegador.Enabled:=true;
   btnmodificar.Enabled:=true;
   gbclientes.Enabled:=false;
   Pweb.Enabled:=false;
   edclave.Enabled:=true;

   {//trae el maximo idcliente + 1
   querys('select max(idcliente) as idcliente from clientes',0,sqlgeneral);
   tblclientes.FieldByName('idcliente').asinteger:=(sqlgeneral.Fields.Fields[0].Asinteger + 1);}

   tblclientes.FieldByName('idcliente').asinteger := strtoint(edclave.text);
   tblclientes.fieldbyname('estatus').Asinteger:= cboestatus.ItemIndex;
   tblclientes.FieldByName('st_date').AsDateTime := Today;

   repeat
   cta := InputBox('Captura de Cuenta','Indique la Cuenta que desea para este cliente: ',inttostr(CuentaLibre));
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
        tblclientesidprotocolo.AsInteger:=sqlgeneral.fieldbyname('idprotocolo').AsInteger;
        end;

      if tblclientesidprovtel.AsInteger <> 0 then
     begin
      querys('select idproveedor from provtel where idproveedor='+tblclientesidprovtel.AsString,0,sqlgeneral);
      cbprovtel.Text := sqlgeneral.fieldbyname('idproveedor').AsString;
     end;

      if tblclientesidprovcel.AsInteger <> 0 then
     begin
      querys('select idproveedor from provtel where idproveedor='+tblclientesidprovcel.AsString,0,sqlgeneral);
      cbprovcel.Text := sqlgeneral.fieldbyname('idproveedor').AsString;
     end;

      tblclientes.FieldByName('idcliente').asinteger := strtoint(cta);
      edclave.Text := cta;
      frmprincipal.ucprincipal.Log('Dio de Alta al cliente '+ednombre.text,1);

      if edTipoCont.Text <> '' then
        tblclientestipocont.AsString := edTipoCont.Text;
      if edcveabogado.Text <> '' then
        tblclientesidabogado.AsString := edcveabogado.Text;
      if edcvevend.Text <> '' then
        tblclientesidvendedor.AsString := edcvevend.Text;
      tblclientes.Post;

      if tblclientesidfact.AsInteger = 0 then
         begin
         application.MessageBox('No ha ingresado los datos de facturacion para este cliente y son necesarios, capturelos por favor.','Aviso',mb_iconinformation);
         btnmodificar.Click;
         DatosFacturacion1.Click;
         CambiaEnabledBotones(true);
         end;

      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update clientes set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcliente='+edclave.Text,1,sqlgeneral);
      querys('delete from clientes where idcliente=0',1,sqlgeneral);
      end;
end;

procedure Tfrmclientes.btnmodificarClick(Sender: TObject);
var cta : string;
  maximocta:integer;   // idNota,
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if btnmodificar.Caption = '&Editar' then
  begin
  EstatusCliente :=  cboestatus.text;
  tblclientes.Active:=true;
  sqlcolonias.Active:=true;
  tblcategoria.Active:=true;
  frmprincipal.ucprincipal.Log('Dio click en el boton editar de Clientes : '+tblclientesidcliente.AsString,0);
  btnmodificar.Caption:='&Guardar';
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Edición';
  btnmodificar.hint:='Guarda los Cambios Realizados';
  btnmodificar.ImageIndex:=1;
  navegador.Enabled:=false;
  btnalta.Enabled:=false;
  btnborrar.Enabled:=false;
  gbclientes.Enabled:=true;
  Pweb.Enabled:=true;
  idtelefono:='';
  edclave.Enabled:=false;
  tblclientes.Edit;
  ///////Buscar abogados
  if DerechosSys('Modificar Abogados') = true then
    gbabogado.Enabled := true
  else
    gbabogado.Enabled := false;
  if DerechosSys('Modifica Contratos') = true then
    gbcontrato.Enabled := true
  else
    gbcontrato.Enabled := false;
  if tblclientesestatus.Asinteger = 2 then
    begin
    repeat
      sqlgeneral.close;
      cta := edclave.Text;
      if inputquery('Confirmación','Indique el # de Cuenta que desea para este cliente: ',cta) = true then
        begin
        try
          strtoint(cta);
          querys('select idcliente from clientes where idcliente ='+cta+' and estatus=1' ,0,sqlgeneral);
          if sqlgeneral.RecordCount > 0 then
          application.MessageBox('Esa cuenta ya ha sido asignada y esta activa','Aviso',mb_iconinformation);
        except
          application.MessageBox('Debe de teclear solo numeros','Aviso',mb_iconinformation);
          end;
        end;
    until sqlgeneral.RecordCount = 0;
    edclave.Text := cta;
    RzDBCheckBox5.Checked := true;
    querys('update oportunidades set cuenta='+cta+' where cuenta='+tblclientesidcliente.AsString,1,sqlgeneral);
    tblclientesidcliente.AsString := cta;
    end;
  EDMSKRFC.setfocus;
  end
else    {GUARDAR}
  begin
  if dtpDesdeCont.Date > dtpHastaCont.Date then
    begin
    application.MessageBox('La fecha de inicio (desde) no puede ser mayor que la fecha de termino (hasta)!','Error',mb_iconwarning);
    exit;
    end;
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

  TraeContrato;
  navegador.Enabled:=true;
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Cliente Actual';
  btnmodificar.ImageIndex:=2;
  gbclientes.Enabled:=false;
  Pweb.Enabled:=false;
  btnalta.Enabled:=true;
  //btnborrar.Enabled:=true;
  frmprincipal.ucprincipal.Log('Edito el Cliente : '+tblclientesidcliente.AsString,2);
  if cboprotocolos.Text <> '' then
    begin
     querys('select idprotocolo from protocolos where protocolo='+quotedstr(cboprotocolos.Text),0,sqlgeneral);
     tblclientesidprotocolo.AsInteger:=sqlgeneral.fieldbyname('idprotocolo').AsInteger;
    end;

  if cbprovtel.Text <> '' then
     begin
      querys('select idproveedor from provtel where nombre='+quotedstr(cbprovtel.Text),0,sqlgeneral);
      tblclientesidprovtel.AsInteger := sqlgeneral.fieldbyname('idproveedor').AsInteger;
     end;

  if cbprovcel.Text <> '' then
     begin
      querys('select idproveedor from provtel where nombre='+quotedstr(cbprovcel.Text),0,sqlgeneral);
      tblclientesidprovcel.AsInteger := sqlgeneral.fieldbyname('idproveedor').AsInteger;
     end;

  if edTipoCont.Text <> '' then
    begin
    tblclientestipocont.AsString := edTipoCont.Text;
    end;
   //verifica si el cliente tiene la opcion de aperturas y cierres
  if tblclientes.FieldByName('idOpenClose').Asinteger = 1 then
   ppmopciones.Items.Items[12].Visible := true
  else
   ppmopciones.Items.Items[12].Visible := false;

   if(cboestatus.ItemIndex = 1) then
      RzDBCheckBox5.Checked := true
   else
      RzDBCheckBox5.Checked := false;


  tblclientesestatus.Asinteger := cboestatus.ItemIndex;
  if edcvevend.Text <> '' then
  tblclientesidvendedor.AsInteger := strtoint(edcvevend.Text);
  tblclientessector.AsString := edsector.Text;
   AgregarPreventivo;
  tblclientes.Post;

  if chkkcambiocodigo.checked = true then
     begin
     if querys('Select idcliente from CambioCodigo where idcliente = '+edclave.text+'', 0, dmaccesos.sqlgeneral) = 0 then
         begin
         querys('Select codigo from usuarios where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID), 0, dmaccesos.sqlgeneral);

         querys('Insert into CambioCodigo (idcliente, idservicio, CodTecnico, fechacambio, usuario, fecha, hora) values  '+
                '('+edclave.text+', 0, "'+dmaccesos.sqlgeneral.fieldbyname('codigo').asstring+'", "'+datetostr(date)+'", '+
                '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'","'+timetostr(time)+'")', 1, dmaccesos.sqlgeneral);
         end;
     end;

  edclave.Enabled:=true;

  //========================================================================
      // SI A LA CUENTA SE LE ASIGNO UN ABOGADO

      if edcveabogado.Text <> '' then
      begin
         querys('select idSeguimientoAbogado from SeguimientoAbogado where idcliente = '+edclave.Text,0,sqlgeneral);
         if not (sqlgeneral.RecordCount > 0) then
         begin
            querys('select max(idSeguimientoAbogado) as id from SeguimientoAbogado',0,sqlgeneral);
            if sqlgeneral.RecordCount > 0 then
               maximocta:= sqlgeneral.fieldbyname('id').AsInteger + 1
            else
               maximocta:= 1;

            querys('insert into SeguimientoAbogado (idSeguimientoAbogado,idcliente,demanda,fechaAbogado,fechaDemanda,fechaResolucion,usuario,fecha,hora) VALUES '+
                                                  '("'+inttostr(maximocta)+'","'+edclave.Text+'","'+edNumDemanda.Text+'","'+datetostr(date)+'","'+datetostr(date)+'","'+datetostr(date)+'","'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'")',1,sqlgeneral);
         end;
      end;

  //========================================================================

  end;
end;

procedure Tfrmclientes.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
 lbUltMod.Caption := 'Ultima Modificación Estatus :';
 {edTipocont.Clear;
 edcveabogado.Clear;
 edNomContrato.Clear;
 edNomAbogado.Clear;
 cboestatus.Text := '';
 cboprotocolos.Text := '';
 cbprovtel.Text := '';
 cbprovcel.Text := '';
 lbufh.Caption := '';  }
   if btnalta.Caption='&Guardar' then
      begin
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta a un Cliente';
         btnalta.ImageIndex:=5;
         querys('delete from clientes where idcliente='+edclave.Text,1,sqlgeneral);
    end;

    if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Cliente Actual';
         btnmodificar.ImageIndex:=2;
        end;
        lblbloqueado.Caption:='Esta Bloqueado?';
        lblbloqueado.Font.Color:=clblack;
        lblcantbloq.Caption:='Cantidad de Bloqueos:';
        tblclientes.Cancel;
        tblclientes.Active:=false;
        //limpia_combos(self);
        limpiar;
        btncancelar.Hint:='Cerrar esta Pantalla';
        btncancelar.Caption:='&Cerrar';
        gbclientes.Enabled:=false;
        Pweb.Enabled:=false;
        edclave.Enabled:=true;
        edclave.Text:='';
        btnalta.Enabled:=true;
        btnborrar.Enabled:=false;
        //btnmodificar.Enabled:=false;
        edclave.SetFocus;
 end
else
close;
end;


procedure Tfrmclientes.FormShow(Sender: TObject);
begin
//carga los vendedores
CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1) order by usuarios.nombre','Vendedores',cbovendedor);
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
edclave.Text:='';
lbltelefono.Caption := '';
querys('SELECT usuarios.codigo,usuarios.nombre,areas.nombre FROM puestos INNER JOIN usuarios ON (puestos.idpuesto = usuarios.idpuesto) INNER JOIN areas ON (usuarios.idarea = areas.idarea) WHERE (areas.nombre = ''ADMINISTRACION'') AND '+
       ' (puestos.nombre = ''GERENTE'') AND usuarios.idusuario ='+frmprincipal.idmaq,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  querys('Select idcliente From clientes where estatus=2 order by idcliente',0,sqlgeneral);
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
       tblclientes.Active:=true;
       edclave.Text := frmbusquedas.resultado;
       tblclientes.Locate('idcliente',frmbusquedas.resultado,[]);
       sqlcolonias.Active:=true;
       tblcategoria.Active:=true;
       cboestatus.ItemIndex := tblclientesestatus.AsInteger;
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
   end;
 cargacombo('select protocolo as Nombre from protocolos order by protocolo','protocolos',cboprotocolos);
 CargaCombo('select nombre from giros order by nombre','Giros',cbonom_giro);
 CargaCombo('select nombre from provtel where celular = 0 order by nombre','provtel',cbprovtel);
 CargaCombo('select nombre from provtel where celular = 1 order by nombre','provtel',cbprovcel);

end;

procedure Tfrmclientes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) and (gbclientes.Enabled=false) then
    begin

       frmbusquedas.query:='Select clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial = '''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'' '')),clientes.rsocial) as Nombre, '+
                           ' ClientesFact.rsocial AS Razon_Social,telefonos.telefono,telefonos.tipo_tel as Tipo,case 1 when clientes.estatus=0  then ''Inactivo'' when estatus=1 then ''Activo'' when clientes.estatus=2 then ''Por Revisar'' when '+
                           ' clientes.estatus=3 then ''Cortesia'' when clientes.estatus=4 then ''Moroso'' when clientes.estatus=5 then  ''Cancelado'' when clientes.estatus = 6 then ''Libre'' end as Estatus,clientes.bloqueado as Bloqueado,clientes.TipoCont,'+
                           ' concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','',clientes.estado) as Direccion,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on '+
                           ' clientes.idfact = ClientesFact.idfact left join telefonos on clientes.idtel=telefonos.idtel group by idcliente  order by idcliente,telefonos.telefono';
                           frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             gbclientes.Enabled:=true;
             Pweb.Enabled:=true;
             tblclientes.Active:=true;
             tblclientes.Locate('idcliente',frmbusquedas.resultado,[]);
             sqlcolonias.Active:=true;
             tblcategoria.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             edclave.SetFocus;
             buscarlocate;
             //btnborrar.Enabled:=true;
             btnmodificar.Enabled:=true;
             gbclientes.Enabled:=false;
             Pweb.Enabled:=false;
             btnzonas.Enabled := true;
             btntrafico.Enabled := true;

             edTipoCont.text := tblclientesTipoCont.AsString;
             if tblclientesTipoCont.AsString <> '' then
              begin
               //trae el nombre del contrato
               querys('select nombre from contratos where TipoCont ='+quotedstr(edTipoCont.Text),0,sqlgeneral);
               edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
              end;
              if tblclientesidabogado.AsString <> '0' then
               begin
                edcveabogado.Text := tblclientesidabogado.AsString;
                //trae el nombre del abogado
                querys('select nombre from abogados where idabogado = '+edcveabogado.Text,0,sqlgeneral);
                edNomAbogado.Text:=sqlgeneral.fieldbyname('nombre').AsString;
               end else
                   edcveabogado.Text :=  '';
            end;
    end;

end;

procedure Tfrmclientes.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblclientes.Active:=true;
if tblclientes.Locate('idcliente',edclave.Text,[]) then
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
    tblclientes.Active:=false;
    //limpia_combos(self);
    limpiar;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmclientes.rejilla_telsDblClick(Sender: TObject);
begin
{if gbclientes.Enabled then begin
btntelefonos.Caption:='&Grabar';
btntelefonos.Enabled:=true;
cbotelefonos.Text:=rejilla_tels.DataSource.DataSet.fieldbyname('tipo').AsString;
edtelefono.Text:=rejilla_tels.DataSource.DataSet.fieldbyname('telefono').AsString;
edtelefono.SetFocus;
end;}
end;

procedure Tfrmclientes.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
 begin
  tblclientes.Active:=false;
  //limpia_combos(self);
  limpiar;
  CambiaEnabledBotones(false);
  lbufh.Caption := '';
 end;
end;

procedure Tfrmclientes.btnborrarClick(Sender: TObject);
begin
if application.MessageBox('Estas Seguro que deseas borrar este Cliente, se perderan sus telefonos y contactos?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el cliente '+tblclientesnombre.asstring+' y #'+tblclientesidcliente.AsString,3);
      if tblclientesidfact.AsString <> '' then
      //elimina los datos de facturacion
      querys('delete from ClientesFact where idfact='+tblclientesidfact.AsString,1,sqlgeneral);
      if tblclientesidtel.AsString <> '' then
      //elimina los telefonos de la tabla de telefonos
      querys('delete from telefonos where idtel='+tblclientesidtel.AsString,1,sqlgeneral);
      if tblclientesidcontacto.AsString <> '' then
      //elimina los contactos de la tabla de contactos
      querys('delete from contactos where idcontacto='+tblclientesidcontacto.AsString,1,sqlgeneral);
      if tblclientesidusuario.AsString <> '' then
      //elimina los usuarios de la tabla de contactos
      querys('delete from contactos where idcontacto='+tblclientesidusuario.AsString,1,sqlgeneral);
      tblclientes.Delete;
      application.MessageBox('Eliminacion del Cliente Exitosa','Información',mb_ok);
      tblclientes.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblclientes.Active:=false;
      //limpia_combos(self);
      limpiar;
      edclave.Text:='';
      edclave.SetFocus;
      btnzonas.Enabled := false;
      btntrafico.Enabled := false;
   end;
end;

procedure Tfrmclientes.dtaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   begin
     dtalta.Date:=date;
     dtalta.Text:=datetostr(date);
   end;
end;

procedure Tfrmclientes.edciudadEnter(Sender: TObject);
begin
if edciudad.Text='' then
  begin
   querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
  edciudad.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure Tfrmclientes.edestadoEnter(Sender: TObject);
begin
if edestado.Text='' then
  begin
  querys('Select valor from configuraciones where concepto = "estado"', 0, sqlgeneral);
  edestado.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure Tfrmclientes.edamaternoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
    edcalle.SetFocus;

end;

procedure Tfrmclientes.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := recomentarios.Font;
  if fuentes.Execute then
   begin
      recomentarios.SelAttributes.Size:=fuentes.Font.Size;
      recomentarios.SelAttributes.color:=fuentes.Font.color;
      recomentarios.SelAttributes.style:=fuentes.Font.style;
    end;
end;

procedure Tfrmclientes.recomentariosEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmclientes.recomentariosExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmclientes.edrazonChange(Sender: TObject);
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

procedure Tfrmclientes.edmskrfcKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.ednombreChange(Sender: TObject);
begin
if (trim(ednombre.Text)<>'') or (trim(edapaterno.Text)<>'') or (trim(edamaterno.Text)<>'') then
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

procedure Tfrmclientes.cbocoloniasKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.LBtipoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.cbonom_giroKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cbonom_giro.Text<>'') then
   begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    cbonom_giro.Onclick(self);
   end
  else
  ednum_giro.Text:='';
end;

procedure Tfrmclientes.cbotelefonosKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.ednum_giroKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednum_giro.Text<>'')and(ednum_giro.Text<>'0') then
   begin
    nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where idgiro='+ednum_giro.Text,self);
    key:=#0;
    CargaCombo('SELECT categorias.nombre,categorias.idcategoria FROM giros INNER JOIN categorias ON (giros.idgiro = categorias.idgiro) WHERE giros.idgiro ='+ednum_giro.Text,'Categorias',cbonom_categoria);
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure Tfrmclientes.ednum_giroExit(Sender: TObject);
begin
tecla:=#13;
if ednum_giro.Text<>'' then
     ednum_giro.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.cbonom_giroExit(Sender: TObject);
begin
tecla:=#13;
if (cbonom_giro.Text<>'')and(ednum_giro.Text='') then
     cbonom_giro.OnSelect(self);
if (ednum_giro.Text<>'')and(cbonom_giro.Text='') then
   ednum_giro.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.ednum_categoriaExit(Sender: TObject);
begin
tecla:=#13;
if ednum_categoria.Text<>'' then
     ednum_categoria.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.ednum_categoriaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_categoria.Text<>'')and(ednum_categoria.Text<>'0') then
   begin
      cbonom_categoria.Text:='';
      if (ednum_giro.Text <> '') and (ednum_categoria.Text<>'') then
      begin
         nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where idcategoria='+
                      ednum_categoria.Text+' and idgiro='+ednum_giro.Text,self);
         //tipos de monitoreo
         if(querys('select c.idtipomonitoreo,color,patrullaje from categorias c left join TiposMonitoreo t '+
         ' on c.idtipomonitoreo=t.idtipomonitoreo where idcategoria="'+
                      ednum_categoria.Text+'" and idgiro='+ednum_giro.Text,0,sqlgeneral)>0) then
         begin
          try
            Panel1.Color:= RGBToColor(sqlgeneral.FieldByName('color').AsString);
            Panel2.Color:= RGBToColor(sqlgeneral.FieldByName('color').AsString);
            if(sqlgeneral.FieldByName('patrullaje').AsString='1') then
              RzDBCheckBox2.Checked:=false
            else
              RzDBCheckBox2.Checked:=true;
          except
            on E : Exception do
            begin
              ShowMessage('Error al Cambiar Color a la Pantalla : '+E.Message);
              Panel1.Color:= clWhite;
              Panel2.Color:= clWhite;
            end;
          end;
         end;
         key:=#0;
         SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
      end;
   end;
end;

procedure Tfrmclientes.cbonom_categoriaExit(Sender: TObject);
begin
tecla:=#13;
if (cbonom_categoria.Text<>'')and(ednum_categoria.Text='') then
     cbonom_categoria.OnSelect(self);
if (ednum_categoria.Text<>'')and(cbonom_categoria.Text='') then
   ednum_categoria.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.cbonom_categoriaKeyPress(Sender: TObject;
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

procedure Tfrmclientes.cboalarmaDropDown(Sender: TObject);
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

procedure Tfrmclientes.cbonom_giroSelect(Sender: TObject);
begin
nombre_clave(ednum_giro,cbonom_giro,'select idgiro,nombre from giros where nombre='+quotedstr(cbonom_giro.Text),self);
CargaCombo('SELECT categorias.nombre,categorias.idcategoria FROM giros INNER JOIN categorias ON (giros.idgiro = categorias.idgiro) WHERE giros.idgiro ='+ednum_giro.Text,'Categorias',cbonom_categoria);
ednum_categoria.Clear;
end;

procedure Tfrmclientes.cbonom_categoriaSelect(Sender: TObject);
begin
nombre_clave(ednum_categoria,cbonom_categoria,'select idcategoria,nombre from categorias where nombre='+
quotedstr(cbonom_categoria.Text)+' and idgiro='+ednum_giro.Text,self);
querys('select color,patrullaje from categorias c left join TiposMonitoreo m on c.idtipomonitoreo=m.idtipomonitoreo where c.nombre='+
        quotedstr(cbonom_categoria.Text)+' and idgiro='+ednum_giro.Text,0,sqlgeneral);
try
  Panel1.Color:= RGBToColor(sqlgeneral.FieldByName('color').AsString);
  Panel2.Color:= RGBToColor(sqlgeneral.FieldByName('color').AsString);
  if(sqlgeneral.FieldByName('patrullaje').AsString='1') then
    RzDBCheckBox2.Checked:=false
  else
    RzDBCheckBox2.Checked:=true;
  except
    on E : Exception do
    begin
      ShowMessage('Error al Cambiar Color a la Pantalla : '+E.Message);
      Panel1.Color:= clWhite;
      Panel2.Color:= clWhite;
    end;
  end;
end;

procedure Tfrmclientes.edmskrfcPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
 if error then
     if errortext='The edit value is invalid' then
        begin
        errortext:='El RFC tecleado es invalido o esta incompleto';
        edmskrfc.Clear;
        end;
end;

procedure Tfrmclientes.ednum_origen2KeyPress(Sender: TObject;
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
    end
    else
    begin
      application.MessageBox('Esa Clave de Origen no Existe, verifiquelo y vuelva a intentarlo!','Error',mb_ok+mb_iconwarning);
      ednum_origen.Text:='';
    end;
  end;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure Tfrmclientes.ednum_origen2Exit(Sender: TObject);
begin
tecla:=#13;
ednum_origen.Color:=clwhite;
if (ednum_origen.Text<>'')and(ednum_origen.Text<>'0') then
     ednum_origen.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.cbonom_origenSelect(Sender: TObject);
begin
   nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where nombre='+quotedstr(cbonom_origen.Text),self);
   ednum_fuente.SetFocus;
end;

procedure Tfrmclientes.cbonom_origenKeyPress(Sender: TObject;
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

procedure Tfrmclientes.cbonom_origenExit(Sender: TObject);
begin
tecla:=#13;
cbonom_origen.Color:=clwhite;
if (cbonom_origen.Text<>'')and(ednum_origen.Text='') then
     cbonom_origen.OnSelect(self);
if (ednum_origen.Text<>'')and(cbonom_origen.Text='') then
   ednum_origen.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.ednum_fuenteKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_fuente.Text<>'')and(ednum_fuente.Text<>'0') then
   begin
      cbonom_fuente.Text:='';
      nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where idfuente='+ednum_fuente.Text,self);
      if cbonom_fuente.Text<>'' then
         begin
                if tblclientes.State = dsinsert then
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

procedure Tfrmclientes.ednum_fuenteExit(Sender: TObject);
begin
tecla:=#13;
ednum_fuente.Color:=clwhite;
if (ednum_fuente.Text<>'')and(cbonom_fuente.Text='') then
     ednum_fuente.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.cbonom_fuenteSelect(Sender: TObject);
begin
nombre_clave(ednum_fuente,cbonom_fuente,'select idfuente,nombre from fuentes where nombre='+quotedstr(cbonom_fuente.Text),self);
if tblclientes.State = dsinsert then
    begin
      cbonom_giro.Text:='RESIDENCIAL';
      cbonom_giro.OnSelect(self);
      cbonom_categoria.Text:='RESIDENCIAL';
      cbonom_categoria.OnSelect(self);
   end
else
   ednum_giro.setfocus;
end;

procedure Tfrmclientes.cbonom_fuenteKeyPress(Sender: TObject;
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

procedure Tfrmclientes.cbonom_fuenteExit(Sender: TObject);
begin
tecla:=#13;
cbonom_fuente.Color:=clwhite;
if (cbonom_fuente.Text<>'')and(ednum_fuente.Text='') then
     cbonom_fuente.OnSelect(self);
if (cbonom_fuente.Text='')and(ednum_fuente.Text<>'') then
    ednum_fuente.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.cbonom_fuenteDropDown(Sender: TObject);
begin
CargaCombo('select nombre from fuentes order by nombre','Fuentes',cbonom_fuente);
end;

procedure Tfrmclientes.cbonom_origenDropDown(Sender: TObject);
begin
     CargaCombo('select nombre from origen order by nombre','Origenes',cbonom_origen);
end;

procedure Tfrmclientes.cboprecioKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.cboalarmaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure Tfrmclientes.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key,true);
  if key=#13 then
   begin
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

procedure Tfrmclientes.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
//tblclientes.Filter := '';
//tblclientes.Refresh;

edclave.Text:=tblclientes.fieldbyname('idcliente').AsString;
cboestatus.ItemIndex:=tblclientes.fieldbyname('estatus').Asinteger;
trae_datos(self);
end;

procedure Tfrmclientes.CboVendedorKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmclientes.edcreditoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
 begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
 end;
end;

procedure Tfrmclientes.Referencias1Click(Sender: TObject);
begin
if btnmodificar.Caption='&Guardar' then
 tblclientes.Post;
 frmcontacto.inicializa(strtoint(edclave.Text),tblclientes.fieldbyname('idreferencia').AsInteger,'clientes/referencias','idcliente');
 frmcontacto.ShowModal;
 tblclientes.Refresh;
 tblclientes.Edit;
end;

procedure Tfrmclientes.DatosFacturacion1Click(Sender: TObject);
var hija:tfrmdatosfactura;
begin
if tblclientes.State = dsedit then
 tblclientes.Post;
 hija:=tfrmdatosfactura.Create(self);
 hija.inicializa(tblclientesidcliente.AsString,tblclientesidfact.asinteger);
 hija.ShowMODAL;
 vienedeforma:= true;
 tblclientes.Refresh;
 tblclientes.Edit;
end;

procedure Tfrmclientes.OtrosDatos1Click(Sender: TObject);
var hija:TfrmDatAdiCliente;
begin
if DerechosSys('Datos Adicionales') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

if btnmodificar.Caption='&Guardar' then
 tblclientes.Post;
 hija:=TfrmDatAdiCliente.Create(self);
 hija.inicializa(strtoint(edclave.Text));
 hija.Show;
 tblclientes.Refresh;
 tblclientes.Edit;
end;

procedure Tfrmclientes.Responsables1Click(Sender: TObject);
begin
if btnmodificar.Caption='&Guardar' then
  tblclientes.Post;
  frmcontacto.inicializa(strtoint(edclave.Text),tblclientes.fieldbyname('idcontacto').AsInteger,'clientes','idcliente');
  frmcontacto.ShowModal;
  tblclientes.Refresh;
  tblclientes.Edit;
end;

procedure Tfrmclientes.Usuarios1Click(Sender: TObject);
begin
if btnmodificar.Caption='&Guardar' then
 tblclientes.Post;
 frmcontacto.inicializa(strtoint(edclave.Text),tblclientes.fieldbyname('idusuario').AsInteger,'clientes/usuarios','idcliente');
 frmcontacto.ShowModal;
 tblclientes.Refresh;
 tblclientes.Edit;
end;

procedure Tfrmclientes.telefonos1Click(Sender: TObject);
begin
if btnmodificar.Caption='&Guardar' then
 TBLclientes.Post;
 frmtel.inicializa(strtoint(edclave.text),TBLclientesidtel.asinteger,0,'clientes','idcliente',false);
 frmtel.ShowModal;
 tblclientes.Refresh;
 TBLclientes.Edit;
end;

procedure Tfrmclientes.ppmopcionesBeforePopUp(Sender: TObject; X,
  Y: Integer; var Cancel: Boolean);
begin
if tblclientes.Active then
cancel:=false
else
cancel:=true;
end;

procedure Tfrmclientes.btnbloqueoClick(Sender: TObject);
var resultado:integer;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;

if DerechosSys('Bloquear') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
if btnbloqueo.Caption = 'B&loquear' then
begin
frmnotas.Caption:='Motivo de Bloqueo';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='BLOQUEO';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
resultado:=frmnotas.ShowModal;
if resultado = 6 then
 begin
  btnbloqueo.Caption:='DesBlo&quear';
  lblbloqueado.Caption:='Cliente Bloqueado? Si';
  lblbloqueado.Font.Color:=clred;
 end;

end
else
begin
frmnotas.Caption:='Motivo de DesBloqueo';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='DESBLOQUEO';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
resultado:=frmnotas.ShowModal;
if resultado = 6 then
 begin
  btnbloqueo.Caption:='B&loquear';
  lblbloqueado.Caption:='Cliente Bloqueado? No';
 end;
end;

TBLclientes.Refresh;
end;

procedure Tfrmclientes.Generales1Click(Sender: TObject);
begin
if btnmodificar.Caption='&Guardar' then
TBLclientes.Post;
frmnotas.Caption:='Notas Generales de este Cliente';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='GENERALES';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
tblclientes.Refresh;
TBLclientes.Edit;
end;

procedure Tfrmclientes.emporales1Click(Sender: TObject);
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Notas Temporales') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
if btnmodificar.Caption='&Guardar' then
TBLclientes.Post;
frmnotas.Caption:='Notas Temporales de este Cliente';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='TEMPORAL';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
tblclientes.Refresh;
TBLclientes.Edit;
end;

procedure Tfrmclientes.Historial1Click(Sender: TObject);
begin
         frmnotas.idNota:=tblclientesidnota.AsInteger;
         frmnotas.TipoNota:='-3';
         frmnotas.ShowModal;
end;

procedure Tfrmclientes.Motivocancelacin1Click(Sender: TObject);
var hija:Tfrmclie_cancel;
begin
if DerechosSys('Motivos de Cancelacion') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

     hija:=Tfrmclie_cancel.Create(self);
     hija.inicializa(0,strtoint(edclave.text));
     hija.Show;
end;

procedure Tfrmclientes.Ventas1Click(Sender: TObject);
var hija:TfrmVistaVtasCliente;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Ventas Cliente') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
     hija:=TfrmVistaVtasCliente.Create(self);
     hija.inicializa(edclave.text);
     hija.Show;
end;

{##############Comunicador#########################}

procedure Tfrmclientes.edTipoContButtonClick(Sender: TObject);
begin
   frmbusquedas.query:='Select TipoCont, nombre, case 1 when estatus=0 then ''Inactivo'' when estatus=1 then ''Activo'' '+
   ' when estatus=2 then ''Por Revisar'' when estatus=3 then ''Cortesia'' when estatus=4 then ''Moroso'' when estatus=5 then ' +
   ' ''Cancelado'' when estatus = 6 then ''Libre'' end as Estatus,abogado From contratos order by TipoCont';
   frmbusquedas.campo_retorno:='TipoCont';
   frmbusquedas.campo_busqueda:='nombre';
   frmbusquedas.tblorigen := 'contratos';
   frmbusquedas.tabla:='';
   frmbusquedas.ShowModal;
   if frmbusquedas.resultado <> '' then
   begin
      if (frmbusquedas.resultado = 'CAN') and (DerechosSys('Cancelar Cuentas')= false) then
      begin
        application.MessageBox('No tienes derechos para Cancelar Cuentas, consulta al Administrador!','Aviso',mb_iconinformation);
        exit;
      end;
      edTipoCont.Text:=frmbusquedas.resultado;
      CargaContrato;
      {TraeContrato;
      //trae el nombre del contrato
      querys('select nombre,cancelado,TieneVigencia from contratos where TipoCont ='+
      quotedstr(edTipoCont.Text),0,sqlgeneral);
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
      edNomContrato.text:=sqlgeneral.fieldbyname('nombre').asstring;
      //comunicador
      if Application.MessageBox(pchar('Estas Seguro que deseas cambiar el contrato a: '+
      sqlgeneral.fieldbyname('nombre').AsString),'Aviso',MB_YESNO+MB_ICONWARNING)=idyes then
      begin
         // si es contrato comunicador
         if edtipocont.text='17' then
         begin
            if application.MessageBox('Se generaran los pedidos correspondientes a la Renta de Comunicador, '+
            'Deseas continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idno then
            begin
               edTipoCont.Text:=tipoanterior;
               edNomContrato.text:=conanterior;
               exit;
            end
            else
            begin
               meses:=GetConfiguraciones('nopedidoscom',true);
               meses:=InputBox('Rentas','Cuantos Meses deseas darle de Renta',meses);
               repeat
                  if strtoint(meses)<strtoint(getconfiguraciones('nopedidoscom',true)) then
                     meses:=inputbox('Rentas','No pueden ser menores a: '+getconfiguraciones('nopedidoscom',true)+#13+
                     ' Favor de Ingresar los meses de Renta de nuevo',meses);
               until strtoint(meses)>=strtoint(getconfiguraciones('nopedidoscom',true));
               if generarpedidosCom(edclave.Text,strtoint(meses),true)=false then
               begin
                  edTipoCont.Text:=tipoanterior;
                  edNomContrato.text:=conanterior;
                  exit;
               end;
               application.MessageBox('Pedidos Generados','Aviso',MB_ICONINFORMATION);
            end;
         end;
         //si el contrato es poliza de mantenimiento
         if edtipocont.text='18' then
         begin
            if application.MessageBox('Se generaran los pedidos correspondientes a la Poliza de Mantenimiento, '+
            'Deseas continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idno then
            begin
               edTipoCont.Text:=tipoanterior;
               edNomContrato.text:=conanterior;
               exit;
            end
            else
            begin
               meses:=GetConfiguraciones('nopedidosmanto',true);
               meses:=InputBox('Rentas','Cuantos Meses deseas darle de Poliza',meses);
               repeat
                  if strtoint(meses)<strtoint(getconfiguraciones('nopedidosmanto',true)) then
                     meses:=inputbox('Rentas','No pueden ser menores a: '+getconfiguraciones('nopedidosmanto',true)+#13+
                     ' Favor de Ingresar los meses de Poliza de nuevo',meses);
               until strtoint(meses)>=strtoint(getconfiguraciones('nopedidosmanto',true));
               if generarpedidosPol(edclave.Text,strtoint(meses))=false then
               begin
                  edTipoCont.Text:=tipoanterior;
                  edNomContrato.text:=conanterior;
                  exit;
               end;
               application.MessageBox('Pedidos Generados','Aviso',MB_ICONINFORMATION);
            end;
         end
         else
         begin
            //si el cambio es de comunicador a cualquier otro contrato
            if tipoanterior='17' then
            begin
               if application.MessageBox('Se eliminaran los pedidos pendientes de la Renta de Comunicador, Deseas Continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idyes then
               begin
                  eliminarpedidosCom(edclave.text,tipoanterior);
                  application.MessageBox('Pedidos Eliminados','Aviso',MB_ICONINFORMATION);
               end
               else
               begin
                  edTipoCont.Text:=tipoanterior;
                  edNomContrato.text:=conanterior;
                  exit;
               end;
            end;
            //si el cambio es de poliza mantenimiento a cualquier otro contrato
            if tipoanterior='18' then
            begin
               if application.MessageBox('Se eliminaran los pedidos pendientes de la Poliza por Mantenimiento, Deseas Continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idyes then
               begin
                  eliminarpedidosCom(edclave.text,tipoanterior);
                  application.MessageBox('Pedidos Eliminados','Aviso',MB_ICONINFORMATION);
               end
               else
               begin
                  edTipoCont.Text:=tipoanterior;
                  edNomContrato.text:=conanterior;
                  exit;
               end;
            end;
         end;
         edTipoCont.SetFocus;
         btnmodificar.click;
      end
      else
      begin
         edtipocont.text:=tipoanterior;
         edNomContrato.text:=conanterior;
         edTipoCont.SetFocus;
      end;    }
   end;
end;

{comunicador}
procedure Tfrmclientes.edTipoContKeyPress(Sender: TObject; var Key: Char);
//var tipoanterior,conanterior,meses:string;
begin
   if (key=#13)and(edtipocont.Text<>'') then
   begin
      key:=#0;
      CargaContrato;
      {TraeContrato;

      //comunicador
      if Application.MessageBox(pchar('Estas Seguro que deseas cambiar el contrato a: '+
      sqlgeneral.fieldbyname('nombre').AsString),'Aviso',MB_YESNO+MB_ICONWARNING)=idyes then
      begin
         // si es contrato comunicador
         if edtipocont.text='17' then
         begin
            if application.MessageBox('Se generaran los pedidos correspondientes a la Renta de Comunicador'+
            ', Deseas continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idno then
            begin
               edTipoCont.Text:=tipoanterior;
               edNomContrato.text:=conanterior;
               exit;
            end
            else
            begin
               meses:=GetConfiguraciones('nopedidoscom',true);
               meses:=InputBox('Rentas','Cuantos Meses deseas darle de Renta',meses);
               repeat
                  if strtoint(meses)<strtoint(getconfiguraciones('nopedidoscom',true)) then
                     meses:=inputbox('Rentas','No pueden ser menores a: '+getconfiguraciones('nopedidoscom',true)+#13+
                     ' Favor de Ingresar los meses de Renta de nuevo',meses);
               until strtoint(meses)>=strtoint(getconfiguraciones('nopedidoscom',true));
               if generarpedidosCom(edclave.Text,strtoint(meses),true)=false then
               begin
                  edTipoCont.Text:=tipoanterior;
                  edNomContrato.text:=conanterior;
                  exit;
               end;
               application.MessageBox('Pedidos Generados','Aviso',MB_ICONINFORMATION);
            end;
         end
         else
         begin
            //si el cambio es de comunicador a cualquier otro contrato
            if tipoanterior='17' then
            begin
               if application.MessageBox('Se eliminaran los pedidos pendientes de la Renta de Comunicador, Deseas Continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idyes then
                  eliminarpedidos
               else
               begin
                  edTipoCont.Text:=tipoanterior;
                  edNomContrato.text:=conanterior;
                  exit;
               end;
            end;
         end;
         edTipoCont.SetFocus;
         btnmodificar.click;
      end
      else
      begin
         edNomContrato.text:=conanterior;
         edTipoCont.text:=tipoanterior;
         edTipoCont.SetFocus;
      end;    }
   end;
end;

{##############Comunicador#########################}
procedure Tfrmclientes.edTipoContExit(Sender: TObject);
//var  hija:Tfrmclie_cancel;
begin
if edTipoCont.Text <> '' then
   begin
   //TraeContrato;
   CargaContrato;
   //verifica que esa clave de contrato sea valida

     {
     if ((edTipoCont.Text = 'CAN')and(tblclientesTipoCont.AsString<>'CAN')) or
        ((edTipoCont.Text = 'MOR')and(tblclientesTipoCont.AsString<>'MOR')) then
         begin
         hija:=Tfrmclie_cancel.Create(self);
         hija.inicializa(1,strtoint(edclave.text));
         hija.Show;
         RzDBCheckBox5.Checked := false;
         end
     else
         RzDBCheckBox5.Checked := true;
     end; }
   end;
end;

procedure Tfrmclientes.edcveabogadoKeyPress(Sender: TObject;
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

procedure Tfrmclientes.edcveabogadoExit(Sender: TObject);
begin
  if tblclientesidabogado.AsString <> edcveabogado.Text then
   begin
      if edcveabogado.Text = '' then
          tblclientesidabogado.AsString := '0'
      else
      begin
         querys('select idabogado from abogados where idabogado='+quotedstr(edcveabogado.Text),0,sqlgeneral);
         if sqlgeneral.RecordCount = 0 then
         begin
             application.MessageBox('Ese Abogado No Existe','Aviso',mb_iconinformation);
             edcveabogado.Clear;
             edcveabogado.SetFocus;
         end
         else
            tblclientesidabogado.AsString := edcveabogado.Text;
      end;
   end;
end;

procedure Tfrmclientes.edcveabogadoButtonClick(Sender: TObject);
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

procedure Tfrmclientes.edmontocontKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edmontocont.Text,key);
if key=#13 then
dtpdesdecont.SetFocus;
end;

procedure Tfrmclientes.edNumEmbargoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
key:=#0;
dtpfechaabo.SetFocus;
end;
end;

procedure Tfrmclientes.edNumDemandaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edNumDemanda.Text<>'') then
begin
key:=#0;
edNumEmbargo.SetFocus;
end;
end;

procedure Tfrmclientes.Cobros1Click(Sender: TObject);
var hija:TfrmPagosDebe;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Cobros') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
     hija:=TfrmPagosDebe.Create(self);
     hija.inicializa(edclave.text);
     hija.Show;
end;

procedure Tfrmclientes.edCveVendKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmclientes.edCveVendChange(Sender: TObject);
begin
//if edCveVend.Text = '' then
//cboVendedor.Text:='';
end;

procedure Tfrmclientes.tblclientesAfterScroll(DataSet: TDataSet);
begin
if (dataset.State <> dsedit) and (dataset.State <> dsinsert)and(tblclientesidvendedor.Asinteger<>0) then
 begin
   querys('select idusuario from usuarios where idusuario = '+tblclientesidvendedor.AsString,0,sqlgeneral);
   edCveVend.Text := sqlgeneral.fieldbyname('idusuario').AsString;
 end;
end;

procedure Tfrmclientes.CboVendedorSelect(Sender: TObject);
begin
querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE puestos.nombre = ''VENDEDOR'' AND usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull'+
       '(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) like '+quotedstr('%'+cboVendedor.Text+'%')+' or usuarios.nombre like '+quotedstr('%'+cboVendedor.Text+'%')+' order by usuarios.nombre',0,SqlGeneral);
edCveVend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
end;

procedure Tfrmclientes.FormActivate(Sender: TObject);
begin
self.WindowState:=wsMaximized;
if  (tblclientes.Active = true) and (vienedeforma =true) then
  begin
  tblclientes.Refresh;
  vienedeforma := false;
  end;
end;

procedure Tfrmclientes.CboVendedorChange(Sender: TObject);
begin
if cbovendedor.text = '' then
 edCvevend.clear;
end;

procedure Tfrmclientes.lAA1Click(Sender: TObject);
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Notas Llamadas') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
if btnmodificar.Caption='&Guardar' then
TBLclientes.Post;
frmnotas.Caption:='Notas de Llamadas de este Cliente';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='LLAMADA';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
tblclientes.Refresh;
TBLclientes.Edit;
end;

procedure Tfrmclientes.Zonas1Click(Sender: TObject);
var hija:TfrmZonasCliente;
begin
hija:=TfrmZonasCliente.Create(self);
hija.edclave.Text:= edclave.Text;
hija.eshija := true;
hija.edclave.Enabled := false;
hija.buscarlocate;
hija.Show;
end;

procedure Tfrmclientes.emporalMonitoreo1Click(Sender: TObject);
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Notas Temporales Monitoreo') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
if btnmodificar.Caption='&Guardar' then
TBLclientes.Post;
frmnotas.Caption:='Notas Temporales de Monitoreo';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='TEMPORAL_MONITOREO';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
tblclientes.Refresh;
TBLclientes.Edit;
end;

procedure Tfrmclientes.rafico1Click(Sender: TObject);
var hijo:Tfrmtraficocliente;
begin
hijo:=Tfrmtraficocliente.Create(self);
hijo.edclave.Text:= edclave.Text;
hijo.eshijo := true;
hijo.edclave.Enabled := false;
hijo.btnbuscar.OnClick(self);
hijo.Show;
end;

procedure Tfrmclientes.edmskrfcExit(Sender: TObject);
var hija:tfrmdatosfactura;
begin
if (edmskrfc.Text<>'    -      -   ') and (tblclientesidfact.AsInteger = 0) and ((btnalta.Caption = '&Guardar') or (btnmodificar.caption = '&Guardar')) then
  begin
  querys('select ClientesFact.idcliente,if(ClientesFact.rsocial='''' OR ClientesFact.rsocial is null,concat(ifnull(ClientesFact.nombre,''''),'' '',ifnull(ClientesFact.apaterno,''''),'' '',ifnull(ClientesFact.amaterno,'''')),ClientesFact.rsocial) as nombre '+
         ' from ClientesFact where rfc like '+quotedstr('%'+trim(edmskrfc.Text)+'%'),0,sqlgeneral);
  if (sqlgeneral.RecordCount > 0) and (sqlgeneral.FieldByName('idcliente').AsString<>edclave.Text) then
    if application.MessageBox(pchar('Se ha detectado este RFC en los datos de facturacion de el cliente '+sqlgeneral.fieldbyname('nombre').asstring+', Desea asignar esos datos de facturacion a esta cuenta?'),'Aviso',mb_iconquestion+mb_yesno)= idyes then
      begin
      frmbusquedas.query:='SELECT  ClientesFact.idcliente,ClientesFact.idfact,if(ClientesFact.rsocial='''',concat(ifnull(ClientesFact.nombre,''''),'' '',ifnull(ClientesFact.apaterno,''''),'' '',ifnull(ClientesFact.amaterno,'''')),ClientesFact.rsocial) as nombre, '+
                          ' ClientesFact.dir, ClientesFact.numero,colonias.nombre AS Colonia,ClientesFact.ciudad,ClientesFact.cp,ClientesFact.rfc FROM ClientesFact INNER JOIN colonias ON (ClientesFact.idcol = colonias.idcol) '+
                          ' where ClientesFact.rfc like '+quotedstr('%'+trim(edmskrfc.Text)+'%')+ ' order by ClientesFact.idcliente';
      frmbusquedas.campo_retorno:='idfact';
      frmbusquedas.campo_busqueda:='nombre';                                                                                            ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
      frmbusquedas.tblorigen := 'ClientesFact';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
        tblclientesidfact.Asstring := frmbusquedas.resultado;
      end
    else
      begin
      hija:=tfrmdatosfactura.Create(self);
      hija.inicializa(tblclientesidcliente.AsString,tblclientesidfact.asinteger);
      hija.Show;
      tblclientes.Post;
      tblclientes.Refresh;
      tblclientes.Edit;
      end;
  end;
 {
if (edmskrfc.Text<>'    -      -   ') and (tblclientesidfact.AsInteger <> 0) and ((btnalta.Caption = '&Guardar') or (btnmodificar.caption = '&Guardar')) then
  RzDBCheckBox1.Checked := true
else
  RzDBCheckBox1.Checked := false;   }
end;

procedure Tfrmclientes.btnzonasClick(Sender: TObject);
var hija:TfrmZonasCliente;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Ver Zonas') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

  hija:=TfrmZonasCliente.Create(self);
  hija.edclave.Text:= edclave.Text;
  hija.eshija := true;
  hija.edclave.Enabled := false;
  hija.buscarlocate;
  hija.Show;

end;

procedure Tfrmclientes.btntraficoClick(Sender: TObject);
var hijo:Tfrmtraficocliente;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Ver trafico') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

  hijo:=Tfrmtraficocliente.Create(self);
  hijo.edclave.Text:= edclave.Text;
  hijo.eshijo := true;
  hijo.edclave.Enabled := false;
  hijo.btnbuscar.OnClick(self);
  hijo.Show;

end;

procedure Tfrmclientes.tblclientesBeforePost(DataSet: TDataSet);
begin

if edpasswordweb.Text = '' then
  tblclientespasswordweb.AsString := edcontrasena.Text;

if edusuarioweb.Text = '' then
  tblclientesusuarioweb.AsString := edclave.Text;

 {DEDUCCION IVA}
  if querys('Select c.idfact, cf.rfc from clientes as c left join ClientesFact as cf on c.idfact=cf.idfact where c.idcliente = '+edclave.text, 0, sqlgeneral) > 0 then
    if (sqlgeneral.fieldbyname('rfc').AsString = '') or (sqlgeneral.fieldbyname('rfc').AsString = NULL) then
      tblclientesdeducible.AsBoolean := false //      RzDBCheckBox1.Checked := false
    else
      tblclientesdeducible.AsBoolean := true;
  {FIN DEDUCCION IVA}



bpcambios('clientes', edclave.text, 'idcliente');

end;

procedure Tfrmclientes.btnserviciosClick(Sender: TObject);
var forma:TfrmBuscarServ;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Ver Servicios') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
forma := TfrmBuscarServ.Create(self);
forma.inicializa(edclave.Text,'CLIENTES',false);
forma.Show;
end;

procedure Tfrmclientes.btnservespClick(Sender: TObject);
var forma:Tfrmservicios_esp;
begin
forma := Tfrmservicios_esp.Create(self);
forma.inicializa(edclave.Text);
forma.Show;
end;

procedure Tfrmclientes.cbocoloniasClick(Sender: TObject);
begin
 querys('SELECT colonias.cp,if(sectores.nombre is not null,concat(''Sector '',sectores.nombre),''No Definido'') as Sector,col_sector.idsector as sec FROM col_sector  left JOIN sectores ON (col_sector.idsector=sectores.idsector)   '+
        'left join colonias on colonias.idcol = col_sector.idcol WHERE colonias.nombre ='+quotedstr(cbocolonias.Text),0,sqlgeneral);
 edSector.Text := sqlgeneral.FieldByName('sec').AsString;
 edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure Tfrmclientes.bonificacionesClick(Sender: TObject);
var hija : tfrmbonificaciones;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Bonificaciones') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
hija := tfrmbonificaciones.Create(self);
hija.inicializa(edclave.Text);
end;

procedure Tfrmclientes.Componentes1Click(Sender: TObject);
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Componentes') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
querys('select count(DetPedido.cod_cve) as cant,DetPedido.cod_cve,articulos.nombre,pedidos.idcliente from pedidos inner join DetPedido on DetPedido.idpedido = pedidos.idpedido inner join articulos on articulos.cod_cve = DetPedido.cod_cve inner join '+
       ' clientes on clientes.idcliente = pedidos.idcliente where articulos.idlinea=4 and articulos.inventariable=1 and pedidos.FechaRemision>=clientes.st_date and clientes.idcliente='+edclave.Text+' group by DetPedido.cod_cve,pedidos.idcliente order by pedidos.idcliente',0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount > 0 then
 OperacionReporte('ComponentesCta','','IMP',1)
else
 application.MessageBox('No se encontraron ventas de equipo con fecha mayor a la fecha de alta del cliente','Aviso',mb_iconinformation);
end;

procedure Tfrmclientes.NoClientes1Click(Sender: TObject);
begin
application.messagebox('Opcion deshabilitada.', 'Aviso', mb_iconinformation);
end;

procedure Tfrmclientes.HorariosdeAperturasyCierres1Click(Sender: TObject);
var hija : tfrmAperturaCierre;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Horarios Apertura y Cierre') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
hija := tfrmAperturaCierre.Create(self);
hija.inicializa(edclave.Text);
hija.Show;
end;

procedure Tfrmclientes.SeguimientoNoseales1Click(Sender: TObject);
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Notas Seguimiento no senales') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
if btnmodificar.Caption='&Guardar' then
TBLclientes.Post;
frmnotas.Caption:='Notas de Seguimiento a No Señales de este Cliente';
frmnotas.idProcedencia:=tblclientesidcliente.AsInteger;
frmnotas.idNota:=tblclientesidnota.AsInteger;
frmnotas.TipoNota:='NOALARMAS';
frmnotas.tabla:='clientes';
frmnotas.campo:='idcliente';
frmnotas.ShowModal;
tblclientes.Refresh;
TBLclientes.Edit;
end;

procedure Tfrmclientes.tblclientesAfterPost(DataSet: TDataSet);
 var hija : TfrmZonasCliente;
begin
if cboestatus.ItemIndex <> 0 then
  begin
  apcambios('idcliente', edclave.Text, 'clientes', 'frmclientes');
  querys('Select * from Cambios where idprimario='+quotedstr(edclave.text)+
         ' and campo=''idprotocolo'' and pantalla = ''frmclientes'' and fecha='+quotedstr(datetostr(FechaServidor))+
         ' order by idcambio desc',0, sqlgeneral);
  if sqlgeneral.recordcount > 0 then
    begin
    querys('Select p.protocolo from cliente_zonas as c left join protocolos as p on(p.idprotocolo=c.idprotocolo) where cid ='+quotedstr(edclave.text)+' group by cid', 0, frmprincipal.sqlgeneral);
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
    end;
  end;
end;

procedure Tfrmclientes.cboalarmaSelect(Sender: TObject);
begin
querys('Select protocolos.protocolo,protocolos.idprotocolo From articulos Inner Join protocolos ON articulos.idprotocolo = protocolos.idprotocolo Where articulos.cod_cve = '+quotedstr(cboalarma.Text),0,sqlgeneral);
cboprotocolos.Tag := sqlgeneral.fieldbyname('idprotocolo').asinteger;
cboprotocolos.text := sqlgeneral.fieldbyname('protocolo').asstring;
end;

procedure Tfrmclientes.ips1Click(Sender: TObject);
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
if DerechosSys('Tips') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

  if cboalarma.Text<>'' then
  begin
    if (LowerCase(copy(cboalarma.Text,1,3))='dsc') or (lowercase(copy(cboalarma.Text,1,3))='pow') or (lowercase(copy(cboalarma.Text,1,3))='env') then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('dsc');
        frmtips.Show;
    end;
    if (lowercase(copy(cboalarma.Text,1,4))='fbii') or (lowercase(copy(cboalarma.Text,1,4))='omni') then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('fbii');
        frmtips.Show;
    end;
    if (lowercase(copy(cboalarma.Text,1,4))='adem') or (lowercase(copy(cboalarma.Text,1,4))='firs') or (lowercase(copy(cboalarma.Text,1,4))='hoon') then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('ademco');
        frmtips.Show;
    end;
    if lowercase(copy(cboalarma.Text,1,5))='napco' then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('napco');
        frmtips.Show;
    end;
    if lowercase(copy(cboalarma.Text,1,5))='espec' then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('espec');
        frmtips.Show;
    end;
    if lowercase(copy(cboalarma.Text,1,5))='parad' then
    begin
        frmtips:=tfrmtips.Create(nil);
        frmtips.parametro('parad');
        frmtips.Show;
    end;
  end;
end;

procedure Tfrmclientes.ednum_origenExit(Sender: TObject);
begin
tecla:=#13;
ednum_origen.Color:=clwhite;
if (ednum_origen.Text<>'')and(cbonom_origen.Text='') then
     ednum_origen.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.ednum_origenKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednum_origen.Text<>'')and(ednum_origen.Text<>'0') then
   begin
      cbonom_origen.Text:='';
      nombre_clave(ednum_origen,cbonom_origen,'select idorigen,nombre from origen where idorigen='+ednum_origen.Text,self);
      if cbonom_origen.Text<>'' then
         begin
                if tblclientes.State = dsinsert then
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

procedure Tfrmclientes.edCveVendExit(Sender: TObject);
begin
tecla:=#13;
edCveVend.Color:=clwhite;
if (edCveVend.Text<>'')and(CboVendedor.Text='') then
     edCveVend.OnKeyPress(self,tecla);
end;

procedure Tfrmclientes.CuentasCompartidas1Click(Sender: TObject);
var hija : TfrmCuentascompartidas;
begin
if ConectadaServidor = false then
  if querys('Select Sincronizado from clientes where idcliente = '+edclave.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
   querys('select compartido from contratos where TipoCont='+edTipoCont.text,0,dmreportes.sqlgeneral);
   if dmreportes.sqlgeneral.fieldbyname('compartido').asstring='1' then
   begin
      hija := TfrmCuentascompartidas.Create(self);
      hija.inicializa(edclave.Text,true);
      hija.Width:=540;
      hija.Height:=360;
      hija.left:=300;
      hija.top:=213;
      hija.ShowModal;
   end
   else if dmreportes.sqlgeneral.fieldbyname('compartido').asstring='2' then
   begin
      querys('select CuentaMaestra from ClientesCompartido where cuentacom='+edclave.text,0,dmreportes.sqlgeneral);
      hija := TfrmCuentascompartidas.Create(self);
      hija.inicializa(dmreportes.sqlgeneral.fieldbyname('CuentaMaestra').asstring,false);
      hija.Width:=540;
      hija.Height:=360;
      hija.left:=300;
      hija.top:=213;
      hija.ShowModal;
   end

   else
      application.MessageBox('No se puede abrir esta pantalla, no corresponde al tipo de contrato','Aviso',MB_OK+MB_ICONWARNING);
end;

procedure Tfrmclientes.eliminarpedidos;
begin
   with dmreportes do
   begin
      querys('select idpedido,concepto from pedidos p left join DetPedido dp using(idpedido) '+
      ' where p.estatus=0 and idunidadnegocio=2 and dp.cod_cve="COMUNICADOR" and p.idcliente='+edclave.text+
      ' and fechacreacion>"'+datetostr(Date)+'"',0,sqlgeneral);
      sqlgeneral.First;
      while not sqlgeneral.Eof do
      begin
         querys('delete from pedidos where idpedido='+sqlgeneral.fieldbyname('idpedido').asstring,1,sqlgeneral2);
         querys('delete from DetPedido where idpedido='+sqlgeneral.fieldbyname('idpedido').asstring,1,sqlgeneral2);
         querys('delete from rentascom where idpedido='+sqlgeneral.fieldbyname('idpedido').asstring,1,sqlgeneral2);
         querys('delete from boletas where idpedido='+sqlgeneral.fieldbyname('idpedido').asstring,1,sqlgeneral2);
         sqlgeneral.Next;
      end;
   end;
end;


procedure Tfrmclientes.DigitalizarDocumentos1Click(Sender: TObject);
var hija:Tfrmscan;
begin
if btnmodificar.Caption='&Guardar' then
  tblclientes.Post;
 hija:=Tfrmscan.Create(self);
 hija.inicializa(edclave.Text);
 hija.Show;
 tblclientes.Refresh;
 tblclientes.Edit;
end;

procedure Tfrmclientes.Modificaciones1Click(Sender: TObject);
var hija:TfrmRepClientes;
begin
frmprincipal.ucprincipal.Log('Acceso al Reporte de Modificaciones de Clientes', 0);
hija:=TfrmRepClientes.Create(self);
hija.Reporte :=10;
hija.Inicializa;
hija.Height := 480;
hija.Width := 815;
hija.Show;
end;

procedure Tfrmclientes.ModificarTemporal1Click(Sender: TObject);
var hija:TfrmNotasTemp;
begin
if tblclientes.State = dsedit then
 tblclientes.Post;
 hija:=TfrmNotasTemp.Create(self);
 hija.inicializa(tblclientesidcliente.AsString);
 hija.Show;
end;

procedure Tfrmclientes.AgregarPreventivo;
begin
if chkpreventivo.Checked  then
begin
if(querys('Select year(fechacreacion) as a from servicios_preventivos s '+
       'where idcliente = '+edclave.Text+' and year("'+datetostr(FechaServidor)+'") = year(fechacreacion) ', 0, sqlgeneral)) = 0 then
   begin
   querys('insert into servicios_preventivos (idcliente, fechacreacion, usuario, fecha, hora) '+
          'values ('+edclave.Text+', "'+datetostr(FechaServidor)+'", "'+
          frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(FechaServidor)+'", "'+
          timetostr(HoraServidor)+'" )', 1, sqlgeneral);
   lbpreventivo.Caption := 'Preventivo Anual: '+datetostr(FechaServidor);
   end;
   end;
end;

function Tfrmclientes.Validar:boolean;
begin
  result := true;

  if  DerechosSys('Alta Clientes') = false then
    begin
    application.MessageBox('No tiene derechos para dar de alta clientes, utilice prospectacion','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if ( ednombre.Text = '' ) AND ( edrazon.Text = '') then
    begin
    application.MessageBox('Debe indicar el nombre','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if ( ednombre.Text <> '' ) and (( edapaterno.Text = '') or ( edamaterno.Text = '')) then
    begin
    application.MessageBox('Debe indicar el apellido','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if edcalle.Text = '' then
    begin
    application.MessageBox('Debe indicar la calle','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if ednumero.Text = '' then
    begin
    application.MessageBox('Debe indicar el numero','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if cbocolonias.Text = '' then
    begin
    application.MessageBox('Debe indicar la colonia','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if edsector.Text = '' then
    begin
    application.MessageBox('La Colonia selecionada no esta sectorizada, favor de sectorizarla si desea usarla','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if edciudad.Text = '' then
    begin
    application.MessageBox('Debe indicar la ciudad','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if edestado.Text = '' then
    begin
    application.MessageBox('Debe indicar el estado','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if cbonom_giro.Text = '' then
    begin
    application.MessageBox('Debe indicar el giro','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if cbonom_categoria.Text = '' then
    begin
    application.MessageBox('Debe indicar la categoria','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;

  if edTipoCont.Text = '' then
    begin
    application.MessageBox('Debe indicar el contrato','Aviso',mb_iconinformation);
    result := false;
    exit;
    end;
end;

procedure Tfrmclientes.TraeContrato;
var tipoanterior, nombreanterior, meses:string;
    hija:Tfrmclie_cancel;
begin
   querys('Select c.TipoCont, c.nombre from clientes t left join contratos c on t.Tipocont=c.TipoCont '+
          'where idcliente ='+edclave.text, 0, sqlgeneral);
   tipoanterior := sqlgeneral.FieldByName('TipoCont').AsString;
   nombreanterior := sqlgeneral.FieldByName('nombre').AsString;

   if  tipoanterior = edTipoCont.text then
      exit;

   querys('Select estatus From clientes where idcliente='+edclave.text, 0, sqlgeneral);
   if (sqlgeneral.fieldbyname('estatus').AsInteger = 2) and (cboestatus.ItemIndex = 1) then
      begin
      if (cbprovtel.ItemIndex = -1) and (cbprovcel.ItemIndex = -1) then
        begin
        Application.MessageBox('Debe de indicar el proveedor telefonico', 'Atencion', MB_ICONINFORMATION);
        exit;
        end;

       if (chkbasecel.Checked = false) and (chklineatel.Checked = false) then
        begin
        Application.MessageBox('Debe de indicar el tipo de enlace telefonico', 'Atencion', MB_ICONINFORMATION);
        exit;
        end;
      end;

  if Application.MessageBox(pchar('Estas Seguro que deseas cambiar el contrato a: '+
    ednomcontrato.text), 'Aviso', MB_YESNO+MB_ICONWARNING) = idyes then
    begin
    
    //CANCELADO
    if ((edTipoCont.Text = 'CAN')and(tblclientesTipoCont.AsString<>'CAN')) or
        ((edTipoCont.Text = 'MOR')and(tblclientesTipoCont.AsString<>'MOR')) then
         begin
         hija:=Tfrmclie_cancel.Create(self);
         hija.inicializa(1,strtoint(edclave.text));
         hija.Show;
         RzDBCheckBox5.Checked := false;
         end
     else
         RzDBCheckBox5.Checked := true;

    // COMUNICADOR
    if edtipocont.text = '17' then
      begin
      if application.MessageBox('Se generaran los pedidos correspondientes a la Renta de Comunicador, '+
        'Deseas continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idno then
        begin
        edTipoCont.Text:=tipoanterior;
        edNomContrato.text:=nombreanterior;
        exit;
        end
      else
        begin
        meses := GetConfiguraciones('nopedidoscom',true);
        meses := InputBox('Rentas','Cuantos Meses deseas darle de Renta',meses);

          repeat
            if strtoint(meses)<strtoint(getconfiguraciones('nopedidoscom',true)) then
              meses := inputbox('Rentas','No pueden ser menores a: '+getconfiguraciones('nopedidoscom',true)+#13+
                       ' Favor de Ingresar los meses de Renta de nuevo',meses);
          until strtoint(meses)>=strtoint(getconfiguraciones('nopedidoscom',true));

        if generarpedidosCom(edclave.Text,strtoint(meses),true)=false then
          begin
          edTipoCont.Text:=tipoanterior;
          edNomContrato.text:=nombreanterior;
          exit;
          end;

        application.MessageBox('Pedidos Generados','Aviso',MB_ICONINFORMATION);
        end;
      end;

    //POLIZA DE MANTENIMIENTO
    if edtipocont.text = '18' then
      begin
      if application.MessageBox('Se generaran los pedidos correspondientes a la Poliza de Mantenimiento, '+
            'Deseas continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idno then
        begin
        edTipoCont.Text:=tipoanterior;
        edNomContrato.text:=nombreanterior;
        exit;
        end
      else
        begin
        meses:=GetConfiguraciones('nopedidosmanto',true);
        meses:=InputBox('Rentas','Cuantos Meses deseas darle de Poliza',meses);
          repeat
            if strtoint(meses)<strtoint(getconfiguraciones('nopedidosmanto',true)) then
              meses := inputbox('Rentas','No pueden ser menores a: '+getconfiguraciones('nopedidosmanto',true)+#13+
                       ' Favor de Ingresar los meses de Poliza de nuevo',meses);
          until strtoint(meses)>=strtoint(getconfiguraciones('nopedidosmanto',true));
        if generarpedidosPol(edclave.Text,strtoint(meses))=false then
          begin
          edTipoCont.Text:=tipoanterior;
          edNomContrato.text:=nombreanterior;
          exit;
          end;
        application.MessageBox('Pedidos Generados','Aviso',MB_ICONINFORMATION);
        end;
      end
    else
      begin

      //si el cambio es de comunicador a cualquier otro contrato
      if tipoanterior = '17' then
        begin
        if application.MessageBox('Se eliminaran los pedidos pendientes de la Renta de Comunicador, Deseas Continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idyes then
          begin
          eliminarpedidosCom(edclave.text,tipoanterior);
          application.MessageBox('Pedidos Eliminados','Aviso',MB_ICONINFORMATION);
          end
        else
          begin
          edTipoCont.Text:=tipoanterior;
          edNomContrato.text:=nombreanterior;
          exit;
          end;
        end;

      //si el cambio es de poliza mantenimiento a cualquier otro contrato
      if tipoanterior = '18' then
        begin
        if application.MessageBox('Se eliminaran los pedidos pendientes de la Poliza por Mantenimiento, Deseas Continuar?','Aviso',MB_YESNO+MB_ICONINFORMATION)=idyes then
          begin
          eliminarpedidosCom(edclave.text,tipoanterior);
          application.MessageBox('Pedidos Eliminados','Aviso',MB_ICONINFORMATION);
          end
        else
          begin
          edTipoCont.Text:=tipoanterior;
          edNomContrato.text:=nombreanterior;
          exit;
          end;
        end;
      end;
    //ultima modificacion de estatus
    querys('Insert into ClientesCambios (idcliente,estatus,usuario,fecha,hora) '+
           'values('+edclave.Text+','+inttostr(cboestatus.ItemIndex)+','+
           '"'+frmprincipal.ucprincipal.CurrentUser.Username+'","'+datetostr(date)+'",'+
           '"'+FormatDateTime('HH:mm:ss',Time)+'") ',1,sqlgeneral);
    //aqui continua guardando
    {edTipoCont.SetFocus;
    if btnalta.enabled then
      btnalta.Click
    else
      btnmodificar.click;}
    end
  else
    begin
    edtipocont.text:=tipoanterior;
    edNomContrato.text:=nombreanterior;
    edTipoCont.SetFocus;
    end;
end;

procedure Tfrmclientes.CargaContrato;
begin
if edtipocont.Text <> '' then
  begin
  querys('select nombre, cancelado, estatus, TieneVigencia '+
         'from contratos where TipoCont='+quotedstr(edtipocont.Text),0,sqlgeneral);


   if sqlgeneral.RecordCount = 0 then
      begin
      application.MessageBox('Ese Tipo de Contrato No Existe','Aviso',mb_iconinformation);
      edtipocont.Clear;
      edtipocont.SetFocus;
      end
    else
      begin
      edNomContrato.Text := sqlgeneral.fieldbyname('nombre').AsString;
      cboestatus.ItemIndex := sqlgeneral.fieldbyname('estatus').AsInteger;

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
      end;
    end;
end;


procedure Tfrmclientes.limpiar;
var i:integer;
begin

for i := 0  to self.ComponentCount-1 do
  begin
  if self.Components[i].ClassName = 'TRzCheckBox' then
    (self.Components[i] as TRzCheckBox).Checked := false;

  if self.Components[i].ClassName = 'TRzDBEdit' then
    (self.Components[i] as TRzDBEdit).Text := '';

  if self.Components[i].ClassName = 'TRzEdit' then
    (self.Components[i] as TRzEdit).Text := '';

  if self.Components[i].ClassName = 'TRzButtonEdit' then
    (self.Components[i] as TRzButtonEdit).Text := '';

  if self.Components[i].ClassName = 'TRzDBComboBox' then
    (self.Components[i] as TRzDBComboBox).Text := '';

  if self.Components[i].ClassName = 'TRzComboBox' then
    (self.Components[i] as TRzComboBox).Text := '';
  end;

  lblUltServicio.Caption := 'Ultimo Servicio';
  lbltelefono.Caption := 'Telefono';
  lbultmod.Caption := 'Ultima Mod Estatus:';
  lblinstalaciones.caption := 'Instalaciones';
  lbAdeudos.caption := 'Adeudos';
  lbltravelers.Caption := 'Travelers';
  lblservicios.Caption := 'Servicios';
  lmantenimientos.Caption := 'Mantenimientos';
  lbcargosautomaticos.Caption := '-';

  ppmopciones.Items.Items[12].Visible := false;
  CambiaEnabledBotones(false);
end;

procedure Tfrmclientes.CambiaEnabledBotones(NuevoValor:boolean);
begin
 btnzonas.Enabled := NuevoValor;
 btntrafico.Enabled := NuevoValor;
 btnservicios.Enabled := NuevoValor;
 btnbloqueo.Enabled := NuevoValor;
 btnopciones.Enabled := NuevoValor;
 btnnotas.Enabled := NuevoValor;
 btnservesp.Enabled := NuevoValor;
end;

End.

