{///////////////////////////////////////////////////////////////////////////////
2011/12/20 dalyla actualizar si la familia de ip es igual
2011/02/02 dalyla reacomodar codigo de menu y ajustar pantallas ya que se cortan
--------------------------------------------------------------------------------
2009/05/26 dalyla menu principal
2009-03-30 Oscar modificacion de ventas
2009/03/12 dalyla menu principal
2009/01/26 dalyla path de actualiza sistema
2009/01/22 Oscar actualizacion del sysalarm
--------------------------------------------------------------------------------
2008/10/27 Oscar Reporte de travelers vencidos
2008/08/04 dalyla quitar agenda gral y cuentas mensajeros porque no se usa
2008/07/28 actualizar laptop
2008/07/25 dalyla menu principal
2008/07/24 Cambios sincronizacion
2008/06/27 oscar agrege el proceso de exportar a contpaq y el reporte de
           cuentas morosas
2008/06/19 dalyla menu principal
2008/06/16 dalyla agregar nueva agenda
2008/04/24 dalyla cliente cambios
2008/03/06 dalyla CuentasXContrato
2008/02/28 dalyla zona horaria ok
2008/01/25 dalyla actualizar pcname en loginsuccess
2008/01/21 dalyla conexion al tcpserver en loginsuccess
--------------------------------------------------------------------------------
2007/12/24 lila opcion menu act..tikts fin
2007/11/15  ediwn Nuevo proceso autom de generacion de abonos x cuenta(timer).
2007/11/09  DALILA - Agregue Rep de Cobranza al menu, monit.venc
2007/10/31  DALILA - TICKETS PENDIENTES AGREGUE ESTATUS FINALIZA
}///////////////////////////////////////////////////////////////////////////////


unit Uprincipal;

interface

uses
  Windows,strutils,printers, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UCBase, StdCtrls, DateUtils,
  ActnList, ImgList, RzStatus, ExtCtrls, RzPanel,
  RzBHints, RzBckgnd, WinSkinData, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDTipDlg, StdActns, RzButton,
  RzTray, RzGroupBar, ToolWin, ComCtrls, Sockets, DB, MemDS, DBAccess,
  MyAccess, UCMyDACConn, MyBuilderClient,nrcommtapi, nrclasses, nrcomm,
  nrcommbox, RxGIF, jpeg, Buttons, ScktComp, RzLabel, RzLaunch;

type
  Tfrmprincipal = class(TForm)
    mnprincipal: TMainMenu;
    Usuarios1: TMenuItem;
    CrearyAsignarPermisos1: TMenuItem;
    CambiarContrasea1: TMenuItem;
    Perfiles1: TMenuItem;
    ActionList1: TActionList;
    Logout1: TMenuItem;
    AsignarDatosdeClientes1: TMenuItem;
    elemarketing1: TMenuItem;
    Prospectos1: TMenuItem;
    LogdeUsuarios1: TMenuItem;
    ipos1: TMenuItem;
    Estatus1: TMenuItem;
    crea_usuarios: TAction;
    Fuentes1: TMenuItem;
    Giros1: TMenuItem;
    Salir1: TMenuItem;
    Origenes1: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    marquesina: TRzMarqueeStatus;
    RzKeyStatus1: TRzKeyStatus;
    RzKeyStatus2: TRzKeyStatus;
    RzKeyStatus3: TRzKeyStatus;
    RzKeyStatus4: TRzKeyStatus;
    RCStatus: TRzClockStatus;
    RzBalloonHints1: TRzBalloonHints;
    Areas1: TMenuItem;
    Puestos1: TMenuItem;
    Giros2: TMenuItem;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    categorias1: TMenuItem;
    agenda1: TMenuItem;
    iposdeActividades1: TMenuItem;
    AgendaAdministradores1: TMenuItem;
    ucprincipal: TUserControl;
    Proveedores1: TMenuItem;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    Departamentos1: TMenuItem;
    ABCdeArticulos1: TMenuItem;
    Familias1: TMenuItem;
    Clientes1: TMenuItem;
    Secciones2: TMenuItem;
    Sectores1: TMenuItem;
    TcpClient: TTcpClient;
    SqlGeneral: TMyQuery;
    Pedidos1: TMenuItem;
    ArticulosCompuestos1: TMenuItem;
    Articuo1: TMenuItem;
    OrdendeCompra2: TMenuItem;
    Compra2: TMenuItem;
    Actividadesvendedor1: TMenuItem;
    ContactosPendientes1: TMenuItem;
    LLAMADASXFUENTE1: TMenuItem;
    Moviles1: TMenuItem;
    UCMyDACConn: TUCMyDACConn;
    Tbmain: TToolBar;
    colonias1: TMenuItem;
    ColoniasVsSectores1: TMenuItem;
    Lineas1: TMenuItem;
    Abogados1: TMenuItem;
    Contratos1: TMenuItem;
    MotivosCancelacin1: TMenuItem;
    ConceptodeES1: TMenuItem;
    AjustedeInventarios1: TMenuItem;
    DevSCompras1: TMenuItem;
    VistaVentas: TAction;
    Utilerias1: TMenuItem;
    SqlMonitor1: TMenuItem;
    MyBuilder1: TMenuItem;
    ComprasInmediatas1: TMenuItem;
    iposdeMovimientos1: TMenuItem;
    ucpropiedades: TUCSettings;
    Clientes2: TMenuItem;
    Cobros1: TMenuItem;
    Procesos1: TMenuItem;
    BoletasMonitoreo1: TMenuItem;
    BoletasMensuales1: TMenuItem;
    CancelacionesRemicionesFacturas1: TMenuItem;
    LogControl: TAction;
    Ventanas1: TMenuItem;
    uno1: TMenuItem;
    Cascada1: TMenuItem;
    Ordenadas1: TMenuItem;
    iNSTALACIONES1: TMenuItem;
    Modificardatos1: TMenuItem;
    Reportesdeoperacin1: TMenuItem;
    RemisionarBoletas1: TMenuItem;
    ReportePedidosPendientes1: TMenuItem;
    NotasdeCredito1: TMenuItem;
    AplicarSaldos1: TMenuItem;
    Facturarencaja1: TMenuItem;
    FacturarDomicilio1: TMenuItem;
    Configuraciones1: TMenuItem;
    FacturacionenLotes1: TMenuItem;
    ReimprimirBoletas1: TMenuItem;
    ReImprimirFacturas1: TMenuItem;
    AsiganarFacturaaPedido1: TMenuItem;
    BoletasdeVentas1: TMenuItem;
    Geografia1: TMenuItem;
    Estados1: TMenuItem;
    Municiopios1: TMenuItem;
    iposAsentamientos1: TMenuItem;
    Monitoreo2: TMenuItem;
    Monitoreo3: TMenuItem;
    Modems: TActionList;
    Discar: TAction;
    Rediscar: TAction;
    Cancel: TAction;
    AlarmasTipos1: TMenuItem;
    Zonas1: TMenuItem;
    ConfiguracionEquipos1: TMenuItem;
    ReClasificarEventos1: TMenuItem;
    urnos1: TMenuItem;
    Patrullaje1: TMenuItem;
    ravelers1: TMenuItem;
    Asuntos1: TMenuItem;
    Magnitudes1: TMenuItem;
    Quejas1: TMenuItem;
    ravelers2: TMenuItem;
    Servicios2: TMenuItem;
    CrearServicio1: TMenuItem;
    bprincipal: TRzBackground;
    Mantenimientos1: TMenuItem;
    UnidaddeNegocios1: TMenuItem;
    AbcTiposdeMantenimeintos1: TMenuItem;
    CambiarContratos1: TMenuItem;
    CambiarSaldosPequeos1: TMenuItem;
    BoletasAnuales1: TMenuItem;
    EliminaRangodeVentas1: TMenuItem;
    NoClientes1: TMenuItem;
    CambiodeNumerodeFactura1: TMenuItem;
    RecursosHumanos1: TMenuItem;
    EvaluaciondeDesempeo1: TMenuItem;
    FactoresIndividuales1: TMenuItem;
    DescripciondePuntuacion1: TMenuItem;
    Calificaciones1: TMenuItem;
    FormasdePago1: TMenuItem;
    HistoricoReportes1: TMenuItem;
    AjustedeExistencias1: TMenuItem;
    Presupuestos1: TMenuItem;
    spuser: TRzStatusPane;
    ColoniasporUsuario1: TMenuItem;
    Mantenimientos3: TMenuItem;
    AsignacionesPorOrigen1: TMenuItem;
    btntest: TRzBitBtn;
    Protocolos1: TMenuItem;
    SaldosClientesPedidos1: TMenuItem;
    PasarColonias1: TMenuItem;
    ConvertirZonas1: TMenuItem;
    ExClientes1: TMenuItem;
    ConsultarManuales1: TMenuItem;
    GenerarReportedeCobranza1: TMenuItem;
    GenerarReportedeCobranzaDesfazado1: TMenuItem;
    AutorizacindeCambios1: TMenuItem;
    Minuta1: TMenuItem;
    SolicitudesaSistemas1: TMenuItem;
    CambioNumerodeFacturaLote1: TMenuItem;
    ClientessinIdentificar1: TMenuItem;
    BurodeCrdito1: TMenuItem;
    DesaplicarNC1: TMenuItem;
    RepClientes1: TMenuItem;
    Anualidades1: TMenuItem;
    Bloqueados1: TMenuItem;
    Categorias2: TMenuItem;
    ClienteCuenta1: TMenuItem;
    CuentasActivasporColonia1: TMenuItem;
    EnviodeTraficoporTipo1: TMenuItem;
    EstadodeCuenta1: TMenuItem;
    EstadodeCuentaporLotes1: TMenuItem;
    Estatus2: TMenuItem;
    GastosMayores1: TMenuItem;
    Modificaciones1: TMenuItem;
    NoUbicados1: TMenuItem;
    OpenClose1: TMenuItem;
    Polizas1: TMenuItem;
    Protocolos2: TMenuItem;
    ProtocolosDiferentes1: TMenuItem;
    Resumen1: TMenuItem;
    SinAsignacion1: TMenuItem;
    arjetaCliente1: TMenuItem;
    ravelers3: TMenuItem;
    MinutaMensual1: TMenuItem;
    btnmsn: TRzBitBtn;
//    SCliente: TClientSocket;
    timer: TTimer;
    MarcacinTelefnicaCobranza1: TMenuItem;
    MarcacinTelefonicaAdmin1: TMenuItem;
    ipoEnviodeTraficoTotal1: TMenuItem;
    Comentarios1: TMenuItem;
    EnviarCorreo1: TMenuItem;
    otaldeServiciosAnual1: TMenuItem;
    GraficaGantt1: TMenuItem;
    ravelersdeQuejas1: TMenuItem;
    MultServicios1: TMenuItem;
    MultInstalaciones1: TMenuItem;
    RepCentral1: TMenuItem;
    MonitoreoVencido1: TMenuItem;
    RepVentas1: TMenuItem;
    LlamadasporTelemarketing1: TMenuItem;
    RepCobranza2: TMenuItem;
    SalidasdeInventario1: TMenuItem;
    Mantenimientos4: TMenuItem;
    AbonosporMonitoreo1: TMenuItem;
    FindeTurno1: TMenuItem;
    NotasActivPositivas1: TMenuItem;
    FechaCierre1: TMenuItem;
    BolNoImp1: TMenuItem;
    ClientesDeudores1: TMenuItem;
    CostosServicios1: TMenuItem;
    Ventas1: TMenuItem;
    Instalaciones2: TMenuItem;
    Servicios3: TMenuItem;
    EnviaPromocion1: TMenuItem;
    SeguimientoAbogados1: TMenuItem;                                          
    Central2: TMenuItem;
    pmensaje: TRzMarqueeStatus;
    ClientesconAbogado1: TMenuItem;
    EstatusdePedidos1: TMenuItem;
    Cobranza1: TMenuItem;
    Cobranza2: TMenuItem;
    EliminarRemisiones1: TMenuItem;
    P2: TMenuItem;
    ExClientes2: TMenuItem;
    NotasdeCredito2: TMenuItem;
    RMContratos1: TMenuItem;
    MotivosCortesia1: TMenuItem;
    MotivosCancelaciondePedidos1: TMenuItem;
    CuentasActivasporContrato1: TMenuItem;
    AbonosCuentasActivasPorMes1: TMenuItem;
    NotasdeCreditoRemisiones1: TMenuItem;
    ravelersporUsuario1: TMenuItem;
    ReporteRemisionado1: TMenuItem;
    Monitoreo1: TMenuItem;
    PagosporLineaporMes1: TMenuItem;
    ComprasAtrasadas1: TMenuItem;
    PorFechadeAlta1: TMenuItem;
    QuejasporUsuario1: TMenuItem;
    iempoAtencionActivacion1: TMenuItem;
    ObrasenProceso1: TMenuItem;
    ServiciosaOxxos1: TMenuItem;
    AsistenciasporAo1: TMenuItem;
    SectoresyTurnos1: TMenuItem;
    CuentassinSeal1: TMenuItem;
    ArticulosCosteado1: TMenuItem;
    PendientesPorHora1: TMenuItem;
    PedidosPendientes1: TMenuItem;
    PorPedido1: TMenuItem;
    PorFechas1: TMenuItem;
    odos1: TMenuItem;
    exportar: TMenuItem;
    morosos: TMenuItem;
    VentasPromedio1: TMenuItem;
    VentasArticulosAnual1: TMenuItem;
    LogUsuario1: TMenuItem;
    Derechos1: TMenuItem;
    FacturacionMX1: TMenuItem;
    LogSincronizacion1: TMenuItem;
    DeshacerCancelacion1: TMenuItem;
    UsuarioActual1: TMenuItem;
    endencia1: TMenuItem;
    ActivacionesporPeriodo1: TMenuItem;
    ReportedePagosenBanco1: TMenuItem;
    Comunidadores1: TMenuItem;
    EntregaComunicadores1: TMenuItem;
    Llamadas1: TMenuItem;
    LogdeLlamadas1: TMenuItem;
    ResumendeLlamadas1: TMenuItem;
    LlamadasporExtension1: TMenuItem;
    DirectoriodeExtensiones1: TMenuItem;
    BloqueadosyporBloquear1: TMenuItem;
    CobrodeActivaciones1: TMenuItem;
    ReporteTravelersmas2diasVencidos1: TMenuItem;
    Compras1: TMenuItem;
    Cancelaciones1: TMenuItem;
    Facturas1: TMenuItem;
    Enviode1: TMenuItem;
    lanzador: TRzLauncher;
    SolicitudesWeb1: TMenuItem;
    NotasporUsuario1: TMenuItem;
    Prospecciones1: TMenuItem;
    btnagenda: TRzBitBtn;
    btnlogout: TRzBitBtn;
    btnsalir: TRzBitBtn;
    endenciadeProspectadores1: TMenuItem;
    CuentasSin1: TMenuItem;
    CatalogosGeneral1: TMenuItem;
    ReportesGeneral1: TMenuItem;
    CatalogosVentas1: TMenuItem;
    ReportesVentas1: TMenuItem;
    CatalogosCobranza1: TMenuItem;
    ReportesCobranza1: TMenuItem;
    CatalogosInstalaciones: TMenuItem;
    ReportesInstalaciones1: TMenuItem;
    CatalogosServicios1: TMenuItem;
    ReportesServicios1: TMenuItem;
    CatalogosCentral1: TMenuItem;
    ReportesCetnral1: TMenuItem;
    ReportesTravelers1: TMenuItem;
    ReporteRH1: TMenuItem;
    Caja1: TMenuItem;
    Cierre1: TMenuItem;
    FacturaElectronica1: TMenuItem;
    LogFE1: TMenuItem;
    FERegresaraRemision1: TMenuItem;
    Colonias2: TMenuItem;
    ConteodePipes1: TMenuItem;
    CobrosFE1: TMenuItem;
    BancosFE1: TMenuItem;
    CajaFE1: TMenuItem;
    CajaAuxiliarFE1: TMenuItem;
    SectoresFE1: TMenuItem;
    ClientesSinIdentificarFe1: TMenuItem;
    FacturacionElectronicaenLotes1: TMenuItem;
    AsignarFacturaElectronicaaPedido1: TMenuItem;
    CancelaciondeFacturaElectronica1: TMenuItem;
    NotasdeCreditoFE1: TMenuItem;
    ConexionSQL1: TMenuItem;
    Launcher1: TRzLauncher;
    CancelacionenEdix1: TMenuItem;
    CorreosdeClientes1: TMenuItem;
    CuentasResidencialesYComercial1: TMenuItem;
    MotivosdeCancelaciondeFacturas1: TMenuItem;
    PedidosporLinea1: TMenuItem;
    RegresaraRemision1: TMenuItem;
    Bienvenida1: TMenuItem;
    ClientesRFC2: TMenuItem;
    OxxosPasswords1: TMenuItem;
    ServiciosEspeciales1: TMenuItem;
    NotasdeBonificaciones1: TMenuItem;
    CambiosdeCodigo1: TMenuItem;
    DeshacerHistorico1: TMenuItem;
    iempoyTrasladoPatrulleros1: TMenuItem;
    PagosporLineadelMesEISO1: TMenuItem;
    NotasdeCreditoHistorico1: TMenuItem;
    ActivacionesDiariasMensual1: TMenuItem;
    ActivacionesDiariasAnual1: TMenuItem;
    CuentasInactivasConTrafico1: TMenuItem;
    Cancel1: TMenuItem;
    ActualizarCategorias1: TMenuItem;
    DepartamentosCategorias1: TMenuItem;
    CuentasconComunicador1: TMenuItem;
    ProveedoresdeTelefonia1: TMenuItem;
    FoliosDerechos1: TMenuItem;
    BaseCelularCompra1: TMenuItem;
    ControldeVolantes1: TMenuItem;
    ReportedeMetas1: TMenuItem;
    ReporteMetasAnual1: TMenuItem;
    BoletasMensualesElectronicas1: TMenuItem;
    FacturacionenLotesPersonalizada1: TMenuItem;
    procedure DiscarExecute(Sender: TObject);
    procedure RediscarExecute(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AsignarDatosdeClientes1Click(Sender: TObject);
    procedure ucprincipalAddUser(Sender: TObject; var Login, Password,
      Name, Mail: String; var Profile: Integer; var Privuser: Boolean);
    procedure ucprincipalDeleteUser(Sender: TObject; IDUser: Integer;
      var CanDelete: Boolean; var ErrorMsg: String);
    procedure Salir1Click(Sender: TObject);
    procedure Prospectos1Click(Sender: TObject);
    procedure ucprincipalLoginSucess(Sender: TObject; IdUser: Integer;
      Usuario, Nome, Senha, Email: String; Privilegiado: Boolean);
    procedure ucprincipalLoginError(Sender: TObject; Usuario,
      Senha: String);
    procedure ipos1Click(Sender: TObject);
    procedure CrearyAsignarPermisos1Click(Sender: TObject);
    procedure CambiarContrasea1Click(Sender: TObject);
    procedure Estatus1Click(Sender: TObject);
    procedure Fuentes1Click(Sender: TObject);
    procedure Giros1Click(Sender: TObject);
    procedure Origenes1Click(Sender: TObject);
    procedure Areas1Click(Sender: TObject);
    procedure Puestos1Click(Sender: TObject);
    procedure Giros2Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure categorias1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure iposdeActividades1Click(Sender: TObject);
    procedure AgendaAdministradores1Click(Sender: TObject);
    procedure ucprincipalApplyRightsMenuIt(Sender: TObject;
      MenuItem: TMenuItem);
    procedure Proveedores1Click(Sender: TObject);
    procedure ucprincipalStartApplication(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
    procedure Departamentos1Click(Sender: TObject);
    procedure ABCdeArticulos1Click(Sender: TObject);
    procedure Familias1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Secciones2Click(Sender: TObject);
    procedure Sectores1Click(Sender: TObject);
    procedure Presupuestos1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure ArticulosCompuestos1Click(Sender: TObject);
    procedure Articuo1Click(Sender: TObject);
    procedure OrdendeCompra2Click(Sender: TObject);
    procedure Compra2Click(Sender: TObject);
    procedure Actividadesvendedor1Click(Sender: TObject);
    procedure ContactosPendientes1Click(Sender: TObject);
    procedure LLAMADASXFUENTE1Click(Sender: TObject);
    procedure Moviles1Click(Sender: TObject);
    procedure btnAgendaVendClick(Sender: TObject);
    procedure colonias1Click(Sender: TObject);
    procedure ColoniasVsSectores1Click(Sender: TObject);
//    procedure endenciavendedores1Click(Sender: TObject);
    procedure Lineas1Click(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure Abogados1Click(Sender: TObject);
    procedure Contratos1Click(Sender: TObject);
    procedure MotivosCancelacin1Click(Sender: TObject);
    procedure ConceptodeES1Click(Sender: TObject);
    procedure AjustedeInventarios1Click(Sender: TObject);
    procedure DevSCompras1Click(Sender: TObject);
    procedure SqlMonitor1Click(Sender: TObject);
    procedure MyBuilder1Click(Sender: TObject);
    procedure ComprasInmediatas1Click(Sender: TObject);
    procedure iposdeMovimientos1Click(Sender: TObject);
    procedure Cobros1Click(Sender: TObject);
    procedure BoletasMensuales1Click(Sender: TObject);
    procedure CancelacionesRemicionesFacturas1Click(Sender: TObject);
    procedure uno1Click(Sender: TObject);
    procedure Cascada1Click(Sender: TObject);
    procedure Ordenadas1Click(Sender: TObject);
    procedure Modificardatos1Click(Sender: TObject);
    procedure Reportesdeoperacin1Click(Sender: TObject);
    procedure RemisionarBoletas1Click(Sender: TObject);
    procedure ReportePedidosPendientes1Click(Sender: TObject);
    procedure NotasdeCredito1Click(Sender: TObject);
    procedure AplicarSaldos1Click(Sender: TObject);
    procedure VistaVentasExecute(Sender: TObject);
    procedure Facturarencaja1Click(Sender: TObject);
    procedure FacturarDomicilio1Click(Sender: TObject);
    procedure Configuraciones1Click(Sender: TObject);
    procedure FacturacionenLotes1Click(Sender: TObject);
    procedure ReimprimirBoletas1Click(Sender: TObject);
    procedure ReImprimirFacturas1Click(Sender: TObject);
    procedure AsiganarFacturaaPedido1Click(Sender: TObject);
    procedure BoletasdeVentas1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Municiopios1Click(Sender: TObject);
    procedure iposAsentamientos1Click(Sender: TObject);
    procedure Monitoreo3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ucprincipalLogoff(Sender: TObject; IDUser: Integer);
    procedure AlarmasTipos1Click(Sender: TObject);
    procedure Zonas1Click(Sender: TObject);
    procedure ConfiguracionEquipos1Click(Sender: TObject);
    procedure ReClasificarEventos1Click(Sender: TObject);
    procedure urnos1Click(Sender: TObject);
    procedure Patrullaje1Click(Sender: TObject);
    procedure Asuntos1Click(Sender: TObject);
    procedure Magnitudes1Click(Sender: TObject);
    procedure Quejas1Click(Sender: TObject);
    procedure ravelers2Click(Sender: TObject);
    procedure CrearServicio1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Mantenimientos1Click(Sender: TObject);
    procedure UnidaddeNegocios1Click(Sender: TObject);
    procedure AbcTiposdeMantenimeintos1Click(Sender: TObject);
    procedure CambiarContratos1Click(Sender: TObject);
    procedure CambiarSaldosPequeos1Click(Sender: TObject);
    procedure EliminaRangodeVentas1Click(Sender: TObject);
    procedure BoletasAnuales1Click(Sender: TObject);
    procedure NoClientes1Click(Sender: TObject);
    procedure CambiodeNumerodeFactura1Click(Sender: TObject);
    procedure EvaluaciondeDesempeo1Click(Sender: TObject);
    procedure FactoresIndividuales1Click(Sender: TObject);
    procedure DescripciondePuntuacion1Click(Sender: TObject);
    procedure Calificaciones1Click(Sender: TObject);
    procedure FormasdePago1Click(Sender: TObject);
    procedure HistoricoReportes1Click(Sender: TObject);
    procedure AjustedeExistencias1Click(Sender: TObject);
    procedure Configuracion1Click(Sender: TObject);
    procedure ColoniasporUsuario1Click(Sender: TObject);
    procedure Mantenimientos3Click(Sender: TObject);
    procedure Requisiciones2Click(Sender: TObject);
    procedure CatalogoCabms1Click(Sender: TObject);
    procedure AsignacionesPorOrigen1Click(Sender: TObject);
    procedure btntestClick(Sender: TObject);
    procedure Protocolos1Click(Sender: TObject);
    procedure SaldosClientesPedidos1Click(Sender: TObject);
    procedure PasarColonias1Click(Sender: TObject);
    procedure ConvertirZonas1Click(Sender: TObject);
    procedure ConsultarManuales1Click(Sender: TObject);
    procedure GenerarReportedeCobranza1Click(Sender: TObject);
    procedure GenerarReportedeCobranzaDesfazado1Click(Sender: TObject);
    procedure AutorizacindeCambios1Click(Sender: TObject);
    procedure Minuta1Click(Sender: TObject);
    procedure SolicitudesaSistemas1Click(Sender: TObject);
    procedure CambioNumerodeFacturaLote1Click(Sender: TObject);
    procedure ClientessinIdentificar1Click(Sender: TObject);
    procedure BurodeCrdito1Click(Sender: TObject);
    procedure DesaplicarNC1Click(Sender: TObject);
    procedure Anualidades1Click(Sender: TObject);
    procedure Bloqueados1Click(Sender: TObject);
    procedure Categorias2Click(Sender: TObject);
    procedure ClienteCuenta1Click(Sender: TObject);
    procedure CuentasActivasporColonia1Click(Sender: TObject);
    procedure EnviodeTraficoporTipo1Click(Sender: TObject);
    procedure EstadodeCuenta1Click(Sender: TObject);
    procedure EstadodeCuentaporLotes1Click(Sender: TObject);
    procedure Estatus2Click(Sender: TObject);
    procedure GastosMayores1Click(Sender: TObject);
    procedure Modificaciones1Click(Sender: TObject);
    procedure NoUbicados1Click(Sender: TObject);
    procedure OpenClose1Click(Sender: TObject);
    procedure Polizas1Click(Sender: TObject);
    procedure Protocolos2Click(Sender: TObject);
    procedure ProtocolosDiferentes1Click(Sender: TObject);
    procedure Resumen1Click(Sender: TObject);
    procedure SinAsignacion1Click(Sender: TObject);
    procedure arjetaCliente1Click(Sender: TObject);
    procedure ravelers3Click(Sender: TObject);
    procedure MinutaMensual1Click(Sender: TObject);
    procedure MinutaCoorporativa1Click(Sender: TObject);
    procedure btnmsnClick(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure MarcacinTelefnicaCobranza1Click(Sender: TObject);
    procedure MarcacinTelefonicaAdmin1Click(Sender: TObject);
    procedure ipoEnviodeTraficoTotal1Click(Sender: TObject);
    procedure Comentarios1Click(Sender: TObject);
    procedure EnviarCorreo1Click(Sender: TObject);
    procedure otaldeServiciosAnual1Click(Sender: TObject);
    procedure GraficaGantt1Click(Sender: TObject);
//    procedure ravelersdeQuejas1Click(Sender: TObject);
    procedure MultServicios1Click(Sender: TObject);
    procedure MultInstalaciones1Click(Sender: TObject);
    procedure RepCentral1Click(Sender: TObject);
    procedure MonitoreoVencido1Click(Sender: TObject);
    procedure RepVentas1Click(Sender: TObject);
    procedure LlamadasporTelemarketing1Click(Sender: TObject);
    procedure RepCobranza2Click(Sender: TObject);
    procedure SalidasdeInventario1Click(Sender: TObject);
    procedure Mantenimientos4Click(Sender: TObject);
    procedure AbonosporMonitoreo1Click(Sender: TObject);
    procedure BusServicios1Click(Sender: TObject);
    procedure MuestraRepCentral(Rep:integer;Mensaje:string);
    procedure FindeTurno1Click(Sender: TObject);
    procedure NotasActivPositivas1Click(Sender: TObject);
    procedure FechaCierre1Click(Sender: TObject);
    procedure BolNoImp1Click(Sender: TObject);
    procedure ActualizarTicketsFinalizados1Click(Sender: TObject);
    procedure ClientesDeudores1Click(Sender: TObject);
    procedure CostosServicios1Click(Sender: TObject);
    procedure Ventas1Click(Sender: TObject);
    procedure Instalaciones2Click(Sender: TObject);
    procedure Servicios3Click(Sender: TObject);
    procedure EnviaPromocion1Click(Sender: TObject);
    procedure SeguimientoAbogados1Click(Sender: TObject);
    procedure Central2Click(Sender: TObject);
    procedure ClientesconAbogado1Click(Sender: TObject);
    procedure EstatusdePedidos1Click(Sender: TObject);
    procedure Cobranza1Click(Sender: TObject);
    procedure Cobranza2Click(Sender: TObject);
    procedure EliminarRemisiones1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure ExClientes2Click(Sender: TObject);
    procedure NotasdeCredito2Click(Sender: TObject);
    procedure RMContratos1Click(Sender: TObject);
    procedure MotivosCancelaciondePedidos1Click(Sender: TObject);
    procedure MotivosCortesia1Click(Sender: TObject);
    procedure CuentasActivasporContrato1Click(Sender: TObject);
    procedure CuentasRemisionadas1Click(Sender: TObject);
    procedure CuentasCobradas1Click(Sender: TObject);
    procedure RemisionesdelMes1Click(Sender: TObject);
    procedure NoRemisionadasdelmes1Click(Sender: TObject);
    procedure AbonosCuentasActivasPorMes1Click(Sender: TObject);
    procedure NotasdeCreditoRemisiones1Click(Sender: TObject);
    procedure ravelersporUsuario1Click(Sender: TObject);
    procedure ReporteRemisionado1Click(Sender: TObject);
    procedure PagosporLineaporMes1Click(Sender: TObject);
    procedure ComprasAtrasadas1Click(Sender: TObject);
    procedure PorFechadeAlta1Click(Sender: TObject);
    procedure QuejasporUsuario1Click(Sender: TObject);
//    procedure ravelersporUsuario2Click(Sender: TObject);
    procedure iempoAtencionActivacion1Click(Sender: TObject);
    procedure ObrasenProceso1Click(Sender: TObject);
    procedure ServiciosaOxxos1Click(Sender: TObject);
    procedure AsistenciasporAo1Click(Sender: TObject);
    procedure SectoresyTurnos1Click(Sender: TObject);
    procedure CuentassinSeal1Click(Sender: TObject);
    procedure ArticulosCosteado1Click(Sender: TObject);
    procedure PendientesPorHora1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure PorPedido1Click(Sender: TObject);
    procedure PorFechas1Click(Sender: TObject);
    procedure exportarClick(Sender: TObject);
    procedure morososClick(Sender: TObject);
    procedure VentasPromedio1Click(Sender: TObject);
    procedure VentasArticulosAnual1Click(Sender: TObject);
    procedure LogUsuario1Click(Sender: TObject);
    procedure Derechos1Click(Sender: TObject);
    procedure FacturacionMX1Click(Sender: TObject);
    procedure LogSincronizacion1Click(Sender: TObject);
    procedure DeshacerCancelacion1Click(Sender: TObject);
    procedure UsuarioActual1Click(Sender: TObject);
    procedure endencia1Click(Sender: TObject);
    procedure ActivacionesporPeriodo1Click(Sender: TObject);
    procedure ReportedePagosenBanco1Click(Sender: TObject);
    procedure Comunidadores1Click(Sender: TObject);
    procedure EntregaComunicadores1Click(Sender: TObject);
    procedure LogdeLlamadas1Click(Sender: TObject);
    procedure ResumendeLlamadas1Click(Sender: TObject);
    procedure LlamadasporExtension1Click(Sender: TObject);
    procedure DirectoriodeExtensiones1Click(Sender: TObject);
    procedure BloqueadosyporBloquear1Click(Sender: TObject);
    procedure CobrodeActivaciones1Click(Sender: TObject);
    procedure ReporteTravelersmas2diasVencidos1Click(Sender: TObject);
    procedure Enviode1Click(Sender: TObject);
    procedure SolicitudesWeb1Click(Sender: TObject);
    procedure NotasporUsuario1Click(Sender: TObject);
    procedure Prospecciones1Click(Sender: TObject);
    procedure btnagendaClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure endenciadeProspectadores1Click(Sender: TObject);
    procedure CuentasSin1Click(Sender: TObject);
    procedure Caja1Click(Sender: TObject);
    procedure LogFE1Click(Sender: TObject);
    procedure FERegresaraRemision1Click(Sender: TObject);
    procedure Colonias2Click(Sender: TObject);
    procedure ConteodePipes1Click(Sender: TObject);
    procedure BancosFE1Click(Sender: TObject);
    procedure CajaFE1Click(Sender: TObject);
    procedure CajaAuxiliarFE1Click(Sender: TObject);
    procedure SectoresFE1Click(Sender: TObject);
    procedure ClientesSinIdentificarFe1Click(Sender: TObject);
    procedure FacturacionElectronicaenLotes1Click(Sender: TObject);
    procedure AsignarFacturaElectronicaaPedido1Click(Sender: TObject);
    procedure CancelaciondeFacturaElectronica1Click(Sender: TObject);
    procedure NotasdeCreditoFE1Click(Sender: TObject);
    procedure ConexionSQL1Click(Sender: TObject);
    procedure CancelacionenEdix1Click(Sender: TObject);
    procedure CorreosdeClientes1Click(Sender: TObject);
    procedure CuentasResidencialesYComercial1Click(Sender: TObject);
    procedure MotivosdeCancelaciondeFacturas1Click(Sender: TObject);
    procedure PedidosporLinea1Click(Sender: TObject);
    procedure RegresaraRemision1Click(Sender: TObject);
    procedure Bienvenida1Click(Sender: TObject);
    procedure ClientesRFC2Click(Sender: TObject);
    procedure OxxosPasswords1Click(Sender: TObject);
    procedure ServiciosEspeciales1Click(Sender: TObject);
    procedure NotasdeBonificaciones1Click(Sender: TObject);
    procedure CambiosdeCodigo1Click(Sender: TObject);
    procedure DeshacerHistorico1Click(Sender: TObject);
    procedure iempoyTrasladoPatrulleros1Click(Sender: TObject);
    procedure PagosporLineadelMesEISO1Click(Sender: TObject);
    procedure NotasdeCreditoHistorico1Click(Sender: TObject);
    procedure ActivacionesDiariasMensual1Click(Sender: TObject);
    procedure ActivacionesDiariasAnual1Click(Sender: TObject);
    procedure CuentasInactivasConTrafico1Click(Sender: TObject);
    procedure ActualizarCategorias1Click(Sender: TObject);
    procedure DepartamentosCategorias1Click(Sender: TObject);
    procedure CuentasconComunicador1Click(Sender: TObject);
    procedure ProveedoresdeTelefonia1Click(Sender: TObject);
    procedure FoliosDerechos1Click(Sender: TObject);
    procedure BaseCelularCompra1Click(Sender: TObject);
    procedure ControldeVolantes1Click(Sender: TObject);
    procedure ReportedeMetas1Click(Sender: TObject);
    procedure ReporteMetasAnual1Click(Sender: TObject);
    procedure BoletasMensualesElectronicas1Click(Sender: TObject);
    procedure FacturacionenLotesPersonalizada1Click(Sender: TObject);
  private
    { Private declarations }
    body: tmemo;

  public
    { Public declarations }
    origensspa, origensspainterno, ipmaq, idmaq, pcname,
    mysql_ver, AreaUsuario, PuestoUsuario, DiaReporte:string;
    saldototal,numeroclientes :integer;
    TipoCambio:double;
    mmdatos:tmemo;
    maqcorreo,conccobranza,_ModificarCierre:boolean;
    intento, myDate, myHour, myMin, mySec, myMilli:word;
    fechaGeneraIntereses,_fechaCierreMes:TDateTime; //Fecha en la que valida para generar los intereses para monitoreo

    procedure muestra_mdichild(const alto,ancho:integer;const forma:tformclass;const mensaje:string);
    procedure MuestraRepCli(Rep:Integer;Mensaje:String);
    procedure MuestraRepRecHum(Rep:Integer;Mensaje:String);
    procedure MuestraRepMultiple(Rep:Integer;Mensaje:String);
    procedure MuestraRepCobranza(Rep:Integer;Mensaje:String);
    procedure MuestraRepServicios(Rep:Integer;Mensaje:String);
    procedure MuestraRepLlamadasTmk(Rep:Integer;Mensaje:String);
    procedure MuestraRepEstandares(Rep:Integer;Mensaje:String);
    procedure MuestraRepInstalaciones(Rep:Integer;Mensaje:String);
    procedure MuestraRepVentas(Rep:Integer;Mensaje:String);
    procedure MuestraRepLlamdasTel(Rep:Integer;Mensaje:String);
    procedure MuestraRepFE(Rep:Integer;Mensaje:String);
    procedure MuestraFE(tipo:Integer;Mensaje:String);

    function DeCrypt(cadena:AnsiString):AnsiString;
  end;

var
  frmprincipal: Tfrmprincipal;
  perfil,my_path,estado:string;
  tapis,tapis2:tnrcommtapi;
  com1,com2:string;
  tipo_maquina:string;
  listausuarios:string;

implementation

uses Udm,Uprospectos, Utipos, Uestatus, Ufuentes, Uorigenes, Ugiros, Uareas,
  Upuestos, about, Ucategorias, Uasig_eve_vend, Utipo_servicios, Uproveedores,
  Utipos_actividades, Uasig_eve_vend_admin, Udpto, Utel, Uusuarios, Uarticulos,
  Ufamilias, Uclientes, Usecciones, Usectores, Upresupuestos, Urecursos, Udmrep,
  Upedidos, Udet_art, Uart_comp, UOrdenCompra, Uart_prov, Ucompras, UColonias,
  Ufrmrep_act_vend, Urep_oport, Urepllamadasxfuente, Umoviles, Ubusquedas,
  UColSector, Ulineas, Uabogados, Ucontratos, Umotivo_cancel, Urelacionborrar,
  UTiposNotas, Uotras_entradas, Uconcepto_es, UDevCompras, Uautentificacion,
  USqlViewer, Utipomovi,URemiFac, Ucobros, Uboletas_mensuales, UCancelaciones,
  UInstMod, Umoduloreportes, Uremisionar_boletas, UNotasCredito, Uaplica,
  UGenBol, Uparcializacion,  UVistaVtasCliente, Uconfiguraciones, UFactPed,
  UFacturacionLotes, UImpBoletas, UImpFact, Utipoasentamientos, Umunicipios,
  Utipo_alarmas, Uzonasdefault, Umodems, UClasifServ, Umonitoreo, Uestados,
  Umensaje, UReClasificacion, Uturnos, Upatrullaje, Utcflash, Uasuntos,
  Uquejas, Utravel, Uservicios, UMantenimientos, UunidadNegocio, umagnitudes,
  Uabcmantenimientos, Upedidospendientes, UCambiaContratos,
  UCambiaSaldos, UBorraVentas, UBolAnuales, UNoClientes, UAperturaCierre,
  UReasignaFacturas, UCfgPresupuestos, UPresupuesto2, Ucalificaciones,
  UEvaluacionDesempeno, UDescPuntFactor, UFactoresIndividuales, UFormaPagoPre,
  UHistoricoReportes, UCambiaExistencias, UColUsuarios,  UCambs,
  URepLlamXFuente, Uprotocolos, UPasarColonias, UConversionProtocolos,
  UExClientes, USectoresVencidos, UMantManuales, UBuscaManuales, URequisiciones,
  UAutorizacionCambios, UMinuta, UOrdenes, Utest, UCambioFactura, URepAsigOrig,
  Ullegada_patrulleros, Ureportes, uComisionistas, UMediaFiliacion, UGraficas,
  UBuroCredito, UDesaplicarNC, URepClientes, UMinutaMensual, uMantenimientosSys,
  UMinutaGerencial, UMsn, Math, UMarcacionCobranza, UMarcacionCobranzaAdm,
  UCometarios, UAgendaTelefonica, UEnviarCorreo, URepRecHumanos, URepMultiples,
  URepCobranza, URep_llamadastmk, USalidaInventario, URepServicios, URepCentral,
  UConfiguracionesXConcepto, UBolNoImp, UEnviaPromosion, UCostos_Servicios,
  UDerechosAdicionales, UTCPComCliente, UNotasActivPositivas,
  USeguimientoAbogado, UMetasCobranza, URemisionesAnuales, UNoNotasCredito,
  Umotivocancelapedidos, Umotivocortesias, USaldarCortesias, UObrasProceso,
  USectoresTurnos, UAgendaVendedor, uRepInstalaciones, Uexportar,
  UusuariosDerechos, uRepVendedores, Udmsincronizar, uDeshacerCancelacion,
  uUsuarioActual, URepEstandares, uscanner, uComunicador,
  uEntradasComunicador, uRepLlamadasTel, UAgendaGeneral, Ureports,
  uSolicitudesWeb, URepCaja, uFELog, Ureporteestadisticas,
  uFERegresaARemision, UAsigFactPedFE, UCancelacionesFE, UCobrosFE,
  UFacturacionLotesFE, UNotasCreditoFE, ucancelarEdixCFD,
  uRegresarARemision, uDeshacerHistorico, UNotasCreditoHist,
  uActualizarCategorias, udptocategorias, uprovtel, uFoliosUsuarios,
  uvolantes, Uboletas_mensualesElectronicas, UFacturacionLotesFECus;

{$R *.dfm}

procedure Tfrmprincipal.DiscarExecute(Sender: TObject);
begin
    F10(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion);
end;

procedure Tfrmprincipal.RediscarExecute(Sender: TObject);
begin
    F11(dmreportes.SqlTelefonosMarcar,dmreportes.SqlDetalle,dmaccesos.conexion,1);
end;

procedure Tfrmprincipal.CancelExecute(Sender: TObject);
begin
    CancelarLlamada;
end;

procedure tfrmprincipal.muestra_mdichild(const alto,ancho:integer;const forma:tformclass;Const mensaje:string);
var hija:tform; i:integer;
begin
if BuscaForma(forma.ClassName)=1 then
 begin
 for i:=0 to screen.FormCount-1 do
   begin
   if screen.Forms[i].Name=forma.ClassName then
     begin
     screen.Forms[i].show;
     exit;
     end;
   end;
 end
else
  begin
  ucprincipal.Log(mensaje,0);
  hija:=forma.Create(nil);
  hija.Height:=alto;
  hija.Width:=ancho;
  hija.Left := 1;
  hija.Top := 1;
  hija.Show;
  end;
end;

procedure Tfrmprincipal.Logout1Click(Sender: TObject);
begin
if  PantallasVisibles(screen) = 1 then
 ucprincipal.Logoff
else
 application.MessageBox('Debe de cerrar todas las ventanas que tiene abiertas','Aviso',mb_iconinformation);
end;

procedure Tfrmprincipal.FormActivate(Sender: TObject);
begin
mmdatos:=tmemo.Create(self);
mmdatos.Height:=100;
mmdatos.Width:=700;
mmdatos.Visible:=false;
mmdatos.Parent:=frmprincipal;
body := tmemo.Create(self);
body.Height:=100;
body.Width:=700;
body.Visible:=false;
body.Parent:=frmprincipal;
//extrae el path de la aplicacion
My_Path:=ExtractFilePath(Application.ExeName);
//ConectaServidor(dmaccesos.conexion,mmdatos);
end;

procedure Tfrmprincipal.ucprincipalAddUser(Sender: TObject; var Login,
  Password, Name, Mail: String; var Profile: Integer;
  var Privuser: Boolean);
var iduser:string;
begin
 querys('select max(UCidUser) as id from UCTabUsers',0,sqlgeneral);
 iduser:=sqlgeneral.fieldbyname('id').asstring;
 //con esto inserta en la tabla de usuarios el usuario dado de alta
 dmaccesos.sqlgeneral.close;
 dmaccesos.sqlgeneral.sql.Clear;
 dmaccesos.sqlgeneral.sql.Add('insert into usuarios (idusuario,nombre,email1) values ('+iduser+','+quotedstr(name)+','+quotedstr(mail)+')');
 dmaccesos.sqlgeneral.execute;
end;

procedure Tfrmprincipal.ucprincipalDeleteUser(Sender: TObject;
  IDUser: Integer; var CanDelete: Boolean; var ErrorMsg: String);
var hija : tfrmrelacionborrar;
begin
with dmaccesos.sqlgeneral do
   begin
    //busca si el idusuario esta siendo usado en agenda_vendedores
    querys('SELECT agenda_vendedores.idoportunidad,if(oportunidades.nombre <>'''' and oportunidades.apaterno<>'''' and oportunidades.amaterno <>'''',concat(oportunidades.nombre,'' '', oportunidades.apaterno,'' '',oportunidades.amatern' +
           'o),oportunidades.nombre) AS Nombre,oportunidades.rsocial as Razon_Social,dir,numero,ciudad,estado,oportunidades.estatus AS Estatus_Prospecto,estatus_eventos.nombre AS Estatus_Evento FROM oportunidades LEFT JOIN agenda_vendedores ON  '+
           '(oportunidades.idoportunidad=agenda_vendedores.idoportunidad) LEFT JOIN estatus_eventos ON (agenda_vendedores.idestatus=estatus_eventos.idestatus) WHERE agenda_vendedores.idvendedor='+inttostr(iduser)+
           ' order by agenda_vendedores.idoportunidad',0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
     begin
      frmprincipal.ucprincipal.Log('Elimino el usuario '+inttostr(iduser),3);
      //aqui borra los datos del usuario de la tabla de usuarios
      close;
      sql.Clear;
      sql.Add('delete from usuarios where idusuario='+inttostr(iduser));
      execute;
     end
    else
     begin
      application.MessageBox('No podra eliminar este usuario ya que esta relacionado con la agenda de vendedores!','Aviso',mb_iconwarning);
      hija:=tfrmrelacionborrar.Create(self);
      hija.inicializa(sqlgeneral);
      hija.Show;
     end;
   end;
end;

procedure Tfrmprincipal.ucprincipalLoginSucess(Sender: TObject;
  IdUser: Integer; Usuario, Nome, Senha, Email: String;
  Privilegiado: Boolean);
var HoraSistema : TSystemTime; problema, ciudadmd5, cl:string;
    ban, lic : boolean;
begin
if (PantallasVisibles(screen) = 2) and (BuscaForma('TLoginWindow')=1) then
  begin
    try
      problema := 'Licencia';
      lic := true;
      ban := true;
      querys('SELECT MD5(valor) as v from configuraciones where concepto="ciudad"', 0, sqlgeneral);
      ciudadmd5 := sqlgeneral.fieldbyname('v').asstring;
      if querys('SELECT descripcion_estatus from usuarios where idusuario=0', 0, sqlgeneral) = 0 then
        begin
        lic := false;
        end
      else
        begin
        if sqlgeneral.fieldbyname('descripcion_estatus').Asstring <> 'aec6751943b5060bf989f2fa8e0e3514'+ciudadmd5 then
          begin
          lic := false;
          end;
        end;

      if lic = false then
        begin

        cl := InputBox('Ingrese la clave de la Licencia', 'Clave:', '');
        if cl <> 'aec6751943b5060bf989f2fa8e0e3514'+ciudadmd5 then
          ban := false
        else
          begin
            querys('update usuarios set descripcion_estatus = "'+cl+'" where idusuario=0', 1, sqlgeneral);
            ban := true;
          end;
        end;

      if ban = false then
        begin
        querys('select if(curdate() > ADDDATE(fecha,INTERVAL 60 day), "X", "O") as f '+
               'from ( select min(fecha_pc) as fecha from sk_alarmas ) as t', 0, sqlgeneral);
        if sqlgeneral.fieldbyname('f').asstring = 'X' then
          begin
          showmessage('La version que esta usando es limitada');
          application.Terminate;
          end;
        end;

      problema := 'Guardar My path';
      My_Path:=ExtractFilePath(Application.ExeName);

      problema := 'Ajustar la Hora del Sistema';
      shortdateformat:='yyyy/mm/dd';
      querys('select adddate(current_timestamp, interval valor hour) from configuraciones '+
             'where concepto = "ZonaHoraria"',0,sqlgeneral);
      DateTimeToSystemTime(sqlgeneral.Fields.Fields[0].AsDateTime,HoraSistema);
      SetLocalTime(HoraSistema);

      problema := 'Busqueda de Version de MySQL';
      querys('SHOW VARIABLES LIKE '+quotedstr('version'),0,SqlGeneral);
      mysql_ver:=sqlgeneral.Fields.Fields[1].AsString;

      problema := 'Nombre del Host';
      pcname:=tcpclient.LocalHostName;

      problema := 'IP del Host';
      ipmaq := tcpclient.LocalHostAddr;

      //busca el nombre de la maquina en la tabla de maquinas
      querys('select idmaq,ipadress from maquinas where ipadress="'+ipmaq +'"',0,sqlgeneral);
      if sqlgeneral.RecordCount > 1 then
      begin
         querys('delete from maquinas where ipadress="'+sqlgeneral.fieldbyname('ipadress').AsString+'"',1,sqlgeneral);
         querys('insert into maquinas(pcname,ipadress) values ("'+tcpclient.LocalHostName+'","'+tcpclient.LocalHostAddr+'" )',1,sqlgeneral);
      end
      else
         if sqlgeneral.RecordCount = 1 then
         begin
            idmaq:=sqlgeneral.fieldbyname('idmaq').Asstring;
            querys('Update maquinas set pcname = "'+pcname+'" where ipadress="'+sqlgeneral.fieldbyname('ipadress').AsString+'"', 1, sqlgeneral);
         end
         else
            querys('insert into maquinas(pcname,ipadress) values ("'+tcpclient.LocalHostName+'","'+tcpclient.LocalHostAddr+'" )',1,sqlgeneral);

      if idmaq = '' then
      begin
         querys('select idmaq from maquinas where pcname="'+pcname+'" ' ,0,sqlgeneral);
         idmaq:=sqlgeneral.fieldbyname('idmaq').Asstring;
      end;

      //indica que esta maquina esta en linea
      problema := 'Actualizar maquina actual en linea';
      querys('update maquinas set online=1, monitoreando=0, usuario="'+ucprincipal.CurrentUser.loginname+'", fecha="'+datetostr(date)+'", '+
             'hora="'+FormatDateTime('HH:mm:ss',Time)+'" where ipadress="'+ipmaq+'"',1,sqlgeneral);

      //indica que el usuario ya esta en linea
      problema := 'Actualizar maquina actual en linea';
      querys('update usuarios set online=1, idmaq='+idmaq+' where idusuario='+inttostr(iduser),1,sqlgeneral);

      //Verifica si el usuario actual tiene traveler sin finalizar
      querys('select count(*) as c from travel where resuelto=0 and idusra='+inttostr(iduser)+' and nuevo=1',0,sqlgeneral);
      if sqlgeneral.FieldByName('c').AsInteger > 0 then
          application.MessageBox(pchar('Tiene '+sqlgeneral.FieldByName('c').Asstring+' Travelers Nuevos'),'Aviso',mb_iconinformation);

      dmaccesos.sqlgeneral.Close;
      dmaccesos.sqlgeneral.SQL.Clear;
      dmaccesos.sqlgeneral.SQL.Add('select UCUserName from UCTabUsers where UCIdUser='+inttostr(ucprincipal.CurrentUser.Profile));
      ucprincipal.Log('Acceso al sistema',0);

      problema := 'Actualizar el Tipo de Cambio, Revise la Configuracion Regional del Sistema Operativo';
      querys('select valor from configuraciones where concepto="TipoCambio" ',0,sqlgeneral);
      TipoCambio:=sqlgeneral.Fields.Fields[0].AsFloat;

      problema := 'Actualizar el puesto y area del usuario actual';
      querys('Select puestos.nombre as puesto,areas.nombre as area,ModCierre From usuarios inner join puestos on puestos.idpuesto = usuarios.idpuesto Inner Join areas ON usuarios.idarea = areas.idarea Where usuarios.idusuario = '+inttostr(ucprincipal.CurrentUser.UserID),0,sqlgeneral);
      PuestoUsuario := sqlgeneral.fieldbyname('puesto').AsString;
      AreaUsuario := sqlgeneral.fieldbyname('area').AsString;

      if DerechosSys('Modifica Cierre') then
         _ModificarCierre := true
      else
         _ModificarCierre := false;

      frmprincipal.Caption:='Sistema SysAlarm ';

      //RESOLUCION
      if (screen.Width < 1024) or (screen.Height < 768) then
         pmensaje.Caption := 'Atencion. La resolucion optima para este programa es de 1024*768 la cual es diferente a la actual.';

      //verifica que windows se esta corriendo si es win9x pongo invisible la barra de impresion de la pantlla de busquedas
      if posex('Win9X',quewindows) > 0 then
         frmbusquedas.TBherramientas.Visible := false;

      DatosEmail(dmaccesos.sqlgeneral);
      maqcorreo := false;
      conccobranza := false;
      spuser.Caption := 'Usuario Actual '+usuario;

      if AreaUsuario = 'SISTEMAS' then
         btntest.Visible := true
      else
         if ucprincipal.CurrentUser.LoginName = 'dalyla' then
            btntest.Visible := true
         else
            btntest.visible := false;

      querys('Select * from maquinas where EnviaCorreo=1 and idmaq="'+idmaq+'" ', 0, sqlgeneral);
      if sqlgeneral.recordcount > 0 then
      begin
         body:=tmemo.Create(self);
         body.Visible := false;
         body.parent := frmprincipal;
         body.Height := self.Height;
         body.Width := self.Width;
         maqcorreo :=  true;
         conccobranza := true;
         DiaReporte := formatdatetime('d',now);
      end;

      problema := 'El formato de fecha no es válido, comuniqueselo al depto de informática!';
      fechaGeneraIntereses := strtodate(formatdatetime('yyyy"/"mm"/"05', Now));//Fecha en la que valida para generar los intereses para monitoreo

      querys('Select valor from configuraciones where concepto = "FechaCierre" ',0,sqlgeneral);
      if(sqlgeneral.RecordCount >0) then
         if(sqlgeneral.Fields.Fields[0].asstring <> '') then
            _fechaCierreMes := strtodatetime(sqlgeneral.Fields.Fields[0].asstring);

      problema := 'No se puede identificar el Tipo de Maquina. [Sincronizacion]';
      querys('Select valor from configuraciones where concepto = "tipoAplicacion"', 0, sqlgeneral);
      tipoAplicacion := sqlgeneral.fieldbyname('valor').asstring;

      problema := 'No se pudo conectar al Servidor del conmutador';
      if (GetConfiguraciones('MensajesTelefonicos',true) = '1') then
         ConectarConmutador;


      problema:= 'Actualizacion';
      if GetFamilyAddress(tcpclient.LocalHostAddr) = GetFamilyAddress(DMAccesos.conexion.Server) then
      if ((FileDateToDateTime(FileAge(my_path+'Sysalarm.exe')))<(FileDateToDateTime(FileAge(GetConfiguraciones('PathSysalarmServer',true)+'Sysalarm.exe')))) then
      begin
         if application.MessageBox('DESEA ACTUALIZAR EL SYSALARM', 'Atencion', MB_ICONEXCLAMATION + MB_YESNO) = idyes then
         begin
            lanzador.StartDir:=ExtractFilePath(Application.ExeName);
            lanzador.FileName:='Actualizasys.exe';
            lanzador.Launch;
            Sleep(60000);
         end;
      end;

      {
      //sincronizacion
      problema := '[Sincronizacion]  Conexion local a Base de Datos';
      if dmaccesos.conexion.Server = GetConfiguraciones('IpServer', true) then
      begin
         bprincipal.ShowImage := true;
         if AnsiContainsStr(AreaUsuario, 'VENTAS') and AnsiContainsStr(PuestoUsuario, 'VENDEDOR')then
         begin
            if application.MessageBox('Deseas Sinchronizar ahora?', 'Atencion', MB_ICONEXCLAMATION+MB_YESNO) = idyes then
               DMSincronizar.sincronizar;
         end;
      end
      else
         bprincipal.ShowImage := false;
      }
      frmprincipal.Caption:=frmprincipal.Caption+ ' - ' + getconfiguraciones('ciudad',true);
    except
      application.MessageBox(pchar('Ocurrio un error al intentar accesar.'+#13+'Posible Problema: '+problema),'Error',mb_iconwarning);
      fechaGeneraIntereses :=  now;
    end;
  end;
end;

function tfrmprincipal.DeCrypt(cadena:AnsiString):AnsiString;
var
  I: Word;
  Seed: int64;
begin
  Result := cadena;
  Seed := 0;
  for I := 1 to Length(Result) do
  begin
    Result[I] := Char(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(cadena[I]) + Seed) * Word(52845) + Word(22719)
  end
end;

procedure Tfrmprincipal.ucprincipalLoginError(Sender: TObject; Usuario,
  Senha: String);
begin
ucprincipal.Log('Autentificacion Fallida',0);
end;


procedure Tfrmprincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var cont:integer;
  begin
cont := PantallasVisibles(screen);
if cont = 2 then
  begin
      if application.MessageBox('Se encuentra una pantalla abierta y se pueden perder datos, Desea Continuar?','Información',mb_iconwarning+mb_yesno)=idyes then
       canclose:=true
      else
       canclose:=false;
   end;

if cont = 3 then
begin
      if application.MessageBox('Se encuentra mas de una pantalla abierta y se pueden perder datos, Desea Continuar?','Información',mb_iconwarning+mb_yesno)=idyes then
       canclose:=true
      else
       canclose:=false;
end;
end;

procedure Tfrmprincipal.ucprincipalApplyRightsMenuIt(Sender: TObject;
  MenuItem: TMenuItem);
begin
if menuitem.Enabled = false then
   menuitem.Visible:=false
else
   menuitem.Visible:=true;
end;

procedure Tfrmprincipal.ucprincipalStartApplication(Sender: TObject);
begin
frmprincipal.Visible:=false;
end;

procedure Tfrmprincipal.Cerrar1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmprincipal.Salir1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmprincipal.btnsalirClick(Sender: TObject);
begin
CLOSE;
end;

//#CATALOGOS
procedure Tfrmprincipal.Clientes1Click(Sender: TObject);
begin
muestra_mdichild(547,913,tfrmclientes,'Entro a la pantalla de clientes');
end;

procedure Tfrmprincipal.categorias1Click(Sender: TObject);
begin
muestra_mdichild(525,410,tfrmcategorias,'Entro a la pantalla de Categorias');
end;

procedure Tfrmprincipal.Contratos1Click(Sender: TObject);
begin
muestra_mdichild(190,410,tfrmcontratos,'Acceso a la pantalla Contratos');
end;

procedure Tfrmprincipal.Giros2Click(Sender: TObject);
begin
muestra_mdichild(300,400,tfrmgiros,'Entro a la pantalla de Giros');
end;

procedure Tfrmprincipal.ipos1Click(Sender: TObject);
begin
muestra_mdichild(145,400,tfrmtipos,'Acceso la Pantalla de Tipos');
end;

//#ARTICULOS
procedure Tfrmprincipal.ABCdeArticulos1Click(Sender: TObject);
begin
muestra_mdichild(600,880,tfrmarticulos,'Acceso la Pantalla de tipos de Articulos');
end;

procedure Tfrmprincipal.ArticulosCompuestos1Click(Sender: TObject);
begin
muestra_mdichild(570,740,Tfrmart_comp,'Acceso la Pantalla de Articulos compuestos');
end;

procedure Tfrmprincipal.Articuo1Click(Sender: TObject);
begin
muestra_mdichild(282,500,Tfrmart_prov,'Acceso la Pantalla de Articulos-Proveedor');
end;

procedure Tfrmprincipal.Comunidadores1Click(Sender: TObject);
begin
muestra_mdichild(200,500,TfrmComunicadores,'Acceso a la pantalla de Comunicadores');
end;

procedure Tfrmprincipal.ConceptodeES1Click(Sender: TObject);
begin
muestra_mdichild(170,310,tfrmconcepto_es,'Acceso la Pantalla de Concepto de E/S');
end;

procedure Tfrmprincipal.Departamentos1Click(Sender: TObject);
begin
muestra_mdichild(625,480,tfrmdpto,'Acceso la Pantalla de tipos de Departamentos');
end;

procedure Tfrmprincipal.DepartamentosCategorias1Click(Sender: TObject);
begin
muestra_mdichild(234,475,Tfrmdptoscategorias,'Acceso la Pantalla de Categorias de Departamentos');
end;

procedure Tfrmprincipal.Familias1Click(Sender: TObject);
begin
muestra_mdichild(140,400,tfrmfamilias,'Acceso la Pantalla de Familias');
end;

procedure Tfrmprincipal.Proveedores1Click(Sender: TObject);
begin
muestra_mdichild(445,840,tfrmproveedores,'Acceso la Pantalla de Proveedores');
end;

procedure Tfrmprincipal.Secciones2Click(Sender: TObject);
begin
muestra_mdichild(270,400,tfrmsecciones,'Acceso la Patalla de Secciones');
end;

procedure Tfrmprincipal.Sectores1Click(Sender: TObject);
begin
muestra_mdichild(270,400,tfrmsectores,'Acceso la Pantalla de Sectores');
end;

procedure Tfrmprincipal.iposdeMovimientos1Click(Sender: TObject);
begin
muestra_mdichild(180,410,tfrmtiposmovi,'Acceso la Pantalla de Tipos de movimientos');
end;

//#CENTRAL
procedure Tfrmprincipal.AlarmasTipos1Click(Sender: TObject);
begin
muestra_mdichild(250,500,Tfrmtipoalarmas,'Acceso la Pantalla de alarmas tipos ');
end;

procedure Tfrmprincipal.Comentarios1Click(Sender: TObject);
begin
muestra_mdichild(230,380,Tfrmcomentarios,'Acceso la pantalla de Comentarios');
end;

procedure Tfrmprincipal.ConfiguracionEquipos1Click(Sender: TObject);
begin
   muestra_mdichild(324,410,Tfrmmodems,'Acceso la Pantalla de Configuración de equipos');
end;

procedure Tfrmprincipal.ConvertirZonas1Click(Sender: TObject);
begin
muestra_mdichild(220,500,TfrmConversionProtocolos,'Acceso la pantalla de Configuracion de Conversion de Zonas');
end;

procedure Tfrmprincipal.Protocolos1Click(Sender: TObject);
begin
muestra_mdichild(176,400,TfrmProtocolos,'Acceso la pantalla de Protocolos');
end;

procedure Tfrmprincipal.Zonas1Click(Sender: TObject);
begin
   muestra_mdichild(210,400,TfrmZonasDefault,'Acceso la Pantalla de zonas default');
end;

//#COBRANZA
procedure Tfrmprincipal.Abogados1Click(Sender: TObject);
begin
muestra_mdichild(330,415,tfrmabogados,'Acceso a la pantalla Abogados');
end;

procedure Tfrmprincipal.ActualizarCategorias1Click(Sender: TObject);
begin
 muestra_mdichild(250,400,TfrmActualizarCategorias,'Acceso a la pantalla Actualizar Categorias');
end;

procedure Tfrmprincipal.Cobranza1Click(Sender: TObject);
begin
muestra_mdichild(400,350,TfrmMetasCobranza,'Acceso la pantalla de Estandares de Cobranza');
end;

procedure Tfrmprincipal.Lineas1Click(Sender: TObject);
begin
muestra_mdichild(180,400,tfrmlineas,'Accesos a la pantalla de lineas');
end;

procedure Tfrmprincipal.MarcacinTelefonicaAdmin1Click(Sender: TObject);
begin
  muestra_mdichild(175,290,TfrmMarcacionCobranzaAdm,'Acceso la pantalla de Marcacion telefonica admin');
end;

procedure Tfrmprincipal.MotivosCancelacin1Click(Sender: TObject);
begin
muestra_mdichild(135,400,tfrmmotivos_cancel,'Acceso a la pantalla Motivos de Cancelacion');
end;

procedure Tfrmprincipal.MotivosCancelaciondePedidos1Click(Sender: TObject);
begin
muestra_mdichild(145,400,Tfrmmotcancelapedidos,'Acceso la Pantalla de Motivos de Cancelacion de Pedidos');
end;

procedure Tfrmprincipal.MotivosCortesia1Click(Sender: TObject);
begin
muestra_mdichild(130,400,Tfrmmotivocortesias,'Acceso la Pantalla Motivos de Cortesias');
end;

procedure Tfrmprincipal.UnidaddeNegocios1Click(Sender: TObject);
begin
  muestra_mdichild(235,520,TfrmUnidadNegocio,'Acceso la Pantalla de Unidad de Negocios');
end;

procedure Tfrmprincipal.SeguimientoAbogados1Click(Sender: TObject);
begin
muestra_mdichild(500,770,Tfrmseguimientoabogado,'Acceso la pantalla Seguimiento a Abogados');
end;

procedure Tfrmprincipal.ProveedoresdeTelefonia1Click(Sender: TObject);
begin
 muestra_mdichild(270,425,Tfrmprovtel,'Acceso la pantalla Proveedores de Telefonia');
end;


//#GEOGRAFIA
procedure Tfrmprincipal.colonias1Click(Sender: TObject);
begin
muestra_mdichild(272,470,tfrmcolonias,'Acceso a la pantalla Colonias');
end;

procedure Tfrmprincipal.ColoniasVsSectores1Click(Sender: TObject);
begin
muestra_mdichild(410,835,tfrmColSector,'Acceso a la pantalla Colonias Vs Sectores');
end;

procedure Tfrmprincipal.Estados1Click(Sender: TObject);
begin
  muestra_mdichild(155,420,Tfrmestados,'Acceso la Pantalla Estados');
end;

procedure Tfrmprincipal.Municiopios1Click(Sender: TObject);
begin
 muestra_mdichild(155,380,Tfrmmunicipios,'Acceso la Pantalla Municipios');
end;

procedure Tfrmprincipal.PasarColonias1Click(Sender: TObject);
begin
muestra_mdichild(480,790,TfrmPasarColonias,'Acceso la pantalla de Pasar Colonias');
end;

procedure Tfrmprincipal.Moviles1Click(Sender: TObject);
begin
muestra_mdichild(265,400,tfrmmoviles,'Entro a la pantalla de Sectores');
end;

procedure Tfrmprincipal.iposAsentamientos1Click(Sender: TObject);
begin
    muestra_mdichild(190,415,Tfrmtipoasenta,'Acceso la Pantalla Tipos de Asentamientos');
end;

//#SERVICIOS
procedure Tfrmprincipal.AbcTiposdeMantenimeintos1Click(Sender: TObject);
begin
 muestra_mdichild(270,550,Tfrmabcmantenimientos,'Acceso la Pantalla de Abc de Tipos de Mantenimientos');
end;

procedure Tfrmprincipal.CostosServicios1Click(Sender: TObject);
begin
   muestra_mdichild(170,330,Tfrmcostosservicios,'Acceso la pantalla de Costos Servicios');
end;

//#VENTAS
procedure Tfrmprincipal.Estatus1Click(Sender: TObject);
begin
muestra_mdichild(165,310,tfrmstatus_eventos,'Acceso la Pantalla de Estatus de eventos');
end;

procedure Tfrmprincipal.FormasdePago1Click(Sender: TObject);
begin
muestra_mdichild(200,450,TfrmFormasPagoPre,'Acceso la Pantalla de Formas de Pago de Presupuestos');
end;

procedure Tfrmprincipal.Fuentes1Click(Sender: TObject);
begin
muestra_mdichild(145,400,tfrmfuentes,'Acceso la Pantalla de Fuentes');
end;

procedure Tfrmprincipal.Origenes1Click(Sender: TObject);
begin
muestra_mdichild(135,415,tfrmorigenes,'Acceso la Pantalla de Origenes');
end;

procedure Tfrmprincipal.iposdeActividades1Click(Sender: TObject);
begin
muestra_mdichild(140,415,tfrmtipos_actividades,'Acceso la Pantalla de tipos de actividades');
end;

procedure Tfrmprincipal.Giros1Click(Sender: TObject);
begin
muestra_mdichild(145,410,tfrmtipo_servicios,'Acceso la Pantalla de Tipos de Oportunidades');
end;

//#EXCLIENTES
procedure Tfrmprincipal.ExClientes2Click(Sender: TObject);
begin
muestra_mdichild(643,945,TfrmExClientes,'Acceso la Pantalla de ExClientes');
end;

procedure Tfrmprincipal.NoClientes1Click(Sender: TObject);
begin
muestra_mdichild(641,1020,tfrmnoclientes,'Acceso la pantalla de No Clientes');
end;

procedure Tfrmprincipal.NotasdeCredito2Click(Sender: TObject);
begin
muestra_mdichild(635,1028,TfrmNoNotasCredito,'Acceso la Pantalla Notas de Credito de Exclientes');
end;

procedure Tfrmprincipal.Mantenimientos3Click(Sender: TObject);
begin
muestra_mdichild(210,525,TfrmMantenimientosSys,'Acceso la pantalla de Traspaso de Clientes');
end;

//#VENTAS
procedure Tfrmprincipal.Prospectos1Click(Sender: TObject);
begin
muestra_mdichild(470,830,tfrmprospectos,'Acceso la pantalla de Oportunidades');
end;

procedure Tfrmprincipal.Agenda1Click(Sender: TObject);
var hija:tfrmasig_even_vend;  band:integer;
begin
   band:=0;
   if BuscaForma(tfrmasig_even_vend.ClassName)=1 then
      if application.MessageBox('Esa pantalla ya esta cargada, desea cargar una copia de esta?','Pregunta',mb_yesno+mb_iconwarning) = idyes then
         band:=0
      else
         band:=1;

   if band=0 then
   begin
      hija:=tfrmasig_even_vend.Create(self);
      hija.inicializa(0,0);
      hija.Height:=534;
      hija.Width:=790;
      hija.Show;
   end;
end;

procedure Tfrmprincipal.AgendaAdministradores1Click(Sender: TObject);
var hija:tfrmasig_even_vend1; band:integer;
begin
   band := 0;
   if BuscaForma(tfrmasig_even_vend1.ClassName)=1 then
      if application.MessageBox('Esa pantalla ya esta cargada, desea cargar una copia de esta?','Pregunta',mb_yesno+mb_iconwarning) = idyes then
         band := 0
      else
         band := 1;

   if band = 0 then
   begin
     hija:=tfrmasig_even_vend1.Create(self);
     hija.Height:=534;
     hija.Width:=790;
     hija.Show;
   end;
end;

procedure Tfrmprincipal.AutorizacindeCambios1Click(Sender: TObject);
begin
  muestra_mdichild(535,890,TfrmAutorizacionCambios,'Acceso la pantalla de aplicación de cambios oportunidad-clientes');
end;

procedure Tfrmprincipal.Presupuestos1Click(Sender: TObject);
var forma:tfrmpresupuestos2;
begin
forma:=tfrmpresupuestos2.Create(self);
ucprincipal.Log('Acceso a la pantalla de presupuestos',0);
forma.inicializa(0,0);
forma.Show;
end;

procedure Tfrmprincipal.ControldeVolantes1Click(Sender: TObject);
begin
  muestra_mdichild(500,450,Tfrmvolantes,'Acceso la pantalla de Control de Volantes');
end;

//#COBRANZA
procedure Tfrmprincipal.Pedidos1Click(Sender: TObject);
begin
muestra_mdichild(620,900,tfrmpedidos,'Acceso la Pantalla de Pedidos');
end;

//#BOLETAS
procedure Tfrmprincipal.BoletasMensuales1Click(Sender: TObject);
begin
 muestra_mdichild(540,800,Tfrmboletas_mensuales,'Acceso la Pantalla de Boletas Mensuales ');
end;

procedure Tfrmprincipal.BoletasdeVentas1Click(Sender: TObject);
begin
  muestra_mdichild(500,460,TfrmGenBol,'Acceso la Pantalla Facturar Pedidos');
end;

procedure Tfrmprincipal.BoletasAnuales1Click(Sender: TObject);
begin
muestra_mdichild(490,840,TfrmBolAnuales,'Acceso la Pantalla de Boletas Anuales');
end;

procedure Tfrmprincipal.ReimprimirBoletas1Click(Sender: TObject);
begin
 muestra_mdichild(585,450,TfrmImpBoletas,'Acceso la Pantalla Reimpresion de Boletas');
end;

procedure Tfrmprincipal.RemisionarBoletas1Click(Sender: TObject);
begin
muestra_mdichild(445,455,Tfrmremisionar_boletas,'Acceso la Pantalla Remisionar Boletas');
end;

procedure Tfrmprincipal.EliminaRangodeVentas1Click(Sender: TObject);
begin
muestra_mdichild(515,490,TfrmBorraVentas,'Acceso la Pantalla de eliminacion de rango de ventas');
end;

procedure Tfrmprincipal.EliminarRemisiones1Click(Sender: TObject);
begin
muestra_mdichild(285,460,Tfrmremisionesanuales,'Acceso la pantalla de eliminar remisiones anuales');
end;

//#CANCELACIONES
procedure Tfrmprincipal.CancelacionesRemicionesFacturas1Click(
  Sender: TObject);
begin
muestra_mdichild(317,651,tfrmcancelaciones,'Acceso la Pantalla de Cancelaciones Remiciones/Facturas');
end;

procedure Tfrmprincipal.DeshacerCancelacion1Click(Sender: TObject);
begin
muestra_mdichild(200,440,TfrmDeshacerCancelacion,'Acceso a la pantalla Deshacer Cancelacion');
end;

procedure Tfrmprincipal.NotasdeCredito1Click(Sender: TObject);
begin
muestra_mdichild(635,1028,TfrmNotasCredito,'Acceso la Pantalla Notas de Credito');
end;

procedure Tfrmprincipal.NotasdeCreditoFE1Click(Sender: TObject);
begin
muestra_mdichild(635,1028,TfrmNotasCreditoFE,'Acceso la Pantalla Notas de Credito FE');
end;

procedure Tfrmprincipal.NotasdeCreditoHistorico1Click(Sender: TObject);
begin
muestra_mdichild(635,1028,TfrmNotasCreditoHist,'Acceso la Pantalla Notas de Credito Historico');
end;

procedure Tfrmprincipal.AplicarSaldos1Click(Sender: TObject);
begin
muestra_mdichild(635,730,Tfrmaplica,'Acceso la Pantalla Aplicacion de Saldos');
end;

procedure Tfrmprincipal.DesaplicarNC1Click(Sender: TObject);
begin
muestra_mdichild(290,560,TfrmDesaplicarNC,'Acceso a la pantalla de Desaplicar Notas de Credito');
end;

procedure Tfrmprincipal.RegresaraRemision1Click(Sender: TObject);
begin
muestra_mdichild(450, 433,TfrmRegresarARemision,'Acceso a la pantalla de Regresar a Remision Factura Normal');
end;

procedure Tfrmprincipal.FERegresaraRemision1Click(Sender: TObject);
begin
muestra_mdichild(445,440,TfrmFERegresarARemision,'Acceso a la pantalla de Regresar A Remision Factura Electronica');
end;

procedure Tfrmprincipal.NotasdeCreditoRemisiones1Click(Sender: TObject);
begin
muestra_mdichild(420,910,TfrmSaldarCortesias,'Acceso la Pantalla saldar cortesias');
end;

procedure Tfrmprincipal.CancelaciondeFacturaElectronica1Click(
  Sender: TObject);
begin
muestra_mdichild(317,651,tfrmCancelacionesFE,'Acceso la Pantalla de Cancelacion de Factura Electronica');
end;

procedure Tfrmprincipal.CancelacionenEdix1Click(Sender: TObject);
begin
muestra_mdichild(180,430,TfrmcancelarEdixFE,'Acceso la Pantalla de Cancelacion de FacturaElectronica en Edix');
end;

//#CIERRES

procedure Tfrmprincipal.HistoricoReportes1Click(Sender: TObject);
begin
muestra_mdichild(290,365,TfrmHistoricoReportes,'Acceso la Pantalla de Generar Historico Reportes');
end;

procedure Tfrmprincipal.FechaCierre1Click(Sender: TObject);
var hija:TfrmConfiguracionesXConcepto;
begin
   hija := TfrmConfiguracionesXConcepto.Create(self);
   hija.Height := 187;
   hija.Width := 289;
   hija.inicializa('FechaCierre','Fecha Cierre Cob.','Fecha','','date');
   hija.Show;
end;

procedure Tfrmprincipal.DeshacerHistorico1Click(Sender: TObject);
begin
muestra_mdichild(400,420,TfrmDeshacerHistorico,'Acceso a la pantalla de Deshacer Historico');
end;

//#COBROS
procedure Tfrmprincipal.Facturarencaja1Click(Sender: TObject);
var forma:Tfrmcobros;
begin
forma:=Tfrmcobros.Create(self);
ucprincipal.Log('Acceso la Pantalla de cobros',0);
forma.inicializa(3,'0');
forma.Show;
end;

procedure Tfrmprincipal.FacturarDomicilio1Click(Sender: TObject);
var forma:Tfrmcobros;
begin
forma:=Tfrmcobros.Create(self);
ucprincipal.Log('Acceso la Pantalla de cobros',0);
forma.inicializa(2,'0');
forma.Show;
end;

procedure Tfrmprincipal.FacturacionMX1Click(Sender: TObject);
var forma:Tfrmcobros;
begin
forma:=Tfrmcobros.Create(self);
ucprincipal.Log('Acceso la Pantalla de FacturacionMX',0);
forma.inicializa(5,'0');
forma.Show;
end;

procedure Tfrmprincipal.Cobros1Click(Sender: TObject);
var forma:Tfrmcobros;
begin
forma:=Tfrmcobros.Create(self);
ucprincipal.Log('Acceso la Pantalla de cobros',0);
forma.inicializa(0,'0');
forma.Show;
end;

procedure Tfrmprincipal.ClientessinIdentificar1Click(Sender: TObject);
var forma:Tfrmcobros;
begin
forma:=Tfrmcobros.Create(self);
ucprincipal.Log('Acceso la Pantalla de cobros para Clientes sin Identificar',0);
forma.inicializa(4,'0');
forma.Show;
end;

//#COBROS FE
//#FE
procedure Tfrmprincipal.MuestraFE(tipo:Integer;Mensaje:String);
var hija:TfrmCobrosFE;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmCobrosFE.Create(self);
hija.Inicializa(tipo);
hija.Show;
end;

procedure Tfrmprincipal.BancosFE1Click(Sender: TObject);
begin
MuestraFE(0,'Acceso a Cobros Bancarios por FE');
end;

procedure Tfrmprincipal.CajaFE1Click(Sender: TObject);
begin
MuestraFE(1,'Acceso a Cobros en Caja por FE');
end;

procedure Tfrmprincipal.CajaAuxiliarFE1Click(Sender: TObject);
begin
MuestraFE(2,'Acceso a Cobros en Caja auxiliar por FE');
end;

procedure Tfrmprincipal.SectoresFE1Click(Sender: TObject);
begin
MuestraFE(3,'Acceso a Cobros en Sectores por FE');
end;

procedure Tfrmprincipal.ClientesSinIdentificarFe1Click(Sender: TObject);
begin
MuestraFE(4,'Acceso a Cobros en Clientes Identificados por FE');
end;

//#FACTURAS
procedure Tfrmprincipal.FacturacionenLotes1Click(Sender: TObject);
begin
 muestra_mdichild(435,760,TfrmFacturacionLotes,'Acceso la Pantalla Facturacion por Lotes');
end;

procedure Tfrmprincipal.ReImprimirFacturas1Click(Sender: TObject);
begin
 muestra_mdichild(509,435,TfrmImpFact,'Acceso la Pantalla Reimpresion de Facturas');
end;

procedure Tfrmprincipal.FacturacionElectronicaenLotes1Click(
  Sender: TObject);
begin
muestra_mdichild(435,760,TfrmFacturacionLotesFE,'Acceso la Pantalla Facturacion Electronica por Lotes');
end;

procedure Tfrmprincipal.AsiganarFacturaaPedido1Click(Sender: TObject);
begin
 muestra_mdichild(300,350,TfrmFactPed,'Acceso la Pantalla Facturar Pedidos');
end;

procedure Tfrmprincipal.AsignarFacturaElectronicaaPedido1Click(
  Sender: TObject);
begin
muestra_mdichild(300,350,TfrmAsigFactPedFE,'Acceso la Pantalla Facturar Pedidos');
end;

procedure Tfrmprincipal.CambiodeNumerodeFactura1Click(Sender: TObject);
begin
muestra_mdichild(131,285,TfrmReasignaFact,'Acceso la Pantalla Reasignacion de Facturas');
end;

procedure Tfrmprincipal.CambioNumerodeFacturaLote1Click(Sender: TObject);
begin
 muestra_mdichild(272,294,TfrmCambioFactura,'Acceso la pantalla de Cambio de numeros de Facturas X Lote');
end;

//#COBRANZA RESTANTE
procedure Tfrmprincipal.BurodeCrdito1Click(Sender: TObject);
begin
  muestra_mdichild(189,500,TfrmBuroCredito,'Acceso a la pantalla de Buro de Crédito');
end;

procedure Tfrmprincipal.CambiarContratos1Click(Sender: TObject);
begin
  muestra_mdichild(400,873,TfrmCambiaContrato,'Acceso la Pantalla de Cambia Contratos');
end;

procedure Tfrmprincipal.CambiarSaldosPequeos1Click(Sender: TObject);
begin
muestra_mdichild(370,350,TfrmCambiaSaldos,'Acceso la Pantalla de Cambios de Saldos pequeños');
end;

procedure Tfrmprincipal.exportarClick(Sender: TObject);
begin
  muestra_mdichild(182,221,Tfrmexportar,'Acceso a la pantalla Exportar Polizas');
end;

procedure Tfrmprincipal.GenerarReportedeCobranza1Click(Sender: TObject);
begin
if application.MessageBox('Se generara proceso para reporte de cobranza ?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
        ConcentradoCobranza(formatdatetime('yyyy/mm/dd',now),'1');
    end;
end;

procedure Tfrmprincipal.GenerarReportedeCobranzaDesfazado1Click(
  Sender: TObject);
  var fecha_date:tdatetime;
  fecha:string;
begin
   fecha_date := today;
   if inputquery('Confirmación','Indique la fecha(la fecha debe tener este formato :año/mes/dia): ',fecha) = true then
   begin
      try
         fecha_date := strtodatetime(fecha);
      except
         application.MessageBox('Debe teclear el formato correspondiente','Aviso',mb_iconinformation);
      end;

   if (fecha_date < now) then
      ConcentradoCobranza(fecha,'0')
   else
      application.MessageBox('La fecha no debe ser mayor a la fecha actual','Aviso',mb_iconinformation);
   end;
end;

procedure Tfrmprincipal.MarcacinTelefnicaCobranza1Click(Sender: TObject);
begin
  muestra_mdichild(585,870,TfrmMarcacionCobranza,'Acceso la pantalla de Marcacion telefonica');
end;

//#INSTALACIONES
procedure Tfrmprincipal.Modificardatos1Click(Sender: TObject);
var forma:TfrmInstMod;
begin
forma:=TfrmInstMod.Create(self);
ucprincipal.Log('Acceso la Pantalla de Modificar datos de instalación',0);
forma.Show;
end;

procedure Tfrmprincipal.OrdendeCompra2Click(Sender: TObject);
begin
muestra_mdichild(585,745,TfrmOrdenCompra,'Acceso la Pantalla de Ordenes de Compra');
end;

procedure Tfrmprincipal.Compra2Click(Sender: TObject);
var forma:TfrmCompras;
begin
forma:=TfrmCompras.Create(self);
ucprincipal.Log('Acceso la Pantalla de Compras',0);
forma.inicializa(1);
forma.Show;
end;

procedure Tfrmprincipal.ComprasInmediatas1Click(Sender: TObject);
var forma:TfrmCompras;
begin
forma:=TfrmCompras.Create(self);
ucprincipal.Log('Acceso la Pantalla de Compras Inmediatas',0);
forma.inicializa(0);
forma.Show;
end;

procedure Tfrmprincipal.ComprasAtrasadas1Click(Sender: TObject);
var forma:TfrmCompras;
begin
forma:=TfrmCompras.Create(self);
ucprincipal.Log('Acceso la Pantalla de Compras Atrasadas',0);
forma.inicializa(2);
forma.Show;
end;

procedure Tfrmprincipal.DevSCompras1Click(Sender: TObject);
begin
muestra_mdichild(567,737,tfrmDevCompras,'Acceso a la pantalla Otras Entradas');
end;

procedure Tfrmprincipal.AjustedeExistencias1Click(Sender: TObject);
begin
muestra_mdichild(107,686,TfrmCambiaExistencias,'Acceso la Pantalla de Cambio de Existencias');
end;

procedure Tfrmprincipal.AjustedeInventarios1Click(Sender: TObject);
begin
muestra_mdichild(567,737,tfrmotras_entradas,'Acceso a la pantalla Otras Entradas');
end;

procedure Tfrmprincipal.EntregaComunicadores1Click(Sender: TObject);
begin
muestra_mdichild(335,470,TfrmEntradasComunicador,'Acceso a la pantalla de Entrega y Salida de Comunicadores');
end;

procedure Tfrmprincipal.ObrasenProceso1Click(Sender: TObject);
begin
muestra_mdichild(380,600,TfrmObrasProceso,'Acceso la Pantalla de Obras en Proceso');
end;

procedure Tfrmprincipal.SalidasdeInventario1Click(Sender: TObject);
begin
muestra_mdichild(470,630,TfrmSalidaInventario,'Acceso la pantalla de Salida de Inventario');
end;

//#SERVICIOS
procedure Tfrmprincipal.CrearServicio1Click(Sender: TObject);
var forma:Tfrmservicios;
begin
forma:=Tfrmservicios.Create(self);
forma.inicializa('',false,'');
forma.Show;
end;

procedure Tfrmprincipal.Mantenimientos1Click(Sender: TObject);
begin
  muestra_mdichild(629,800,Tfrmmantenimientos,'Acceso la Pantalla de Creacion de Mantenimientos a Cuentas');
end;

//#CENTRAL
procedure Tfrmprincipal.Monitoreo3Click(Sender: TObject);
begin
   Tbmain.Visible := false;
   if VerificarMarcacion(frmprincipal.idmaq,dmaccesos.conexion) = 0 then
   begin
     application.MessageBox('Esta máquina no cuenta con modems configurados, por tal no podra marcar a los telefonos de los contactos!,Consulte con su administrador de sistema','Atención',mb_IconInformation);
     frmprincipal.Discar.Enabled := false;
     frmprincipal.Cancel.Enabled := false;
     frmprincipal.Rediscar.Enabled := false;
   end
   else
   begin
     frmprincipal.Discar.Enabled := true;
     frmprincipal.Cancel.Enabled := true;
     frmprincipal.Rediscar.Enabled := true;
     TipoLlamada := 1;
   end;
   muestra_mdichild(628,841,TfrmMonitoreo,'Acceso la Pantalla de monitoreo');
end;

procedure Tfrmprincipal.Enviode1Click(Sender: TObject);
begin
muestra_mdichild(590,1031,TReports_Alarmex,'Acceso a la pantalla de Envio de Trafico');
end;

procedure Tfrmprincipal.NotasActivPositivas1Click(Sender: TObject);
begin
   muestra_mdichild(460,710,Tfrmnotasactivpositivas,'Acceso la pantalla de Notas de Activaciones Positivas');
end;

procedure Tfrmprincipal.Patrullaje1Click(Sender: TObject);
begin
   muestra_mdichild(520,725,Tfrmpatrulleros,'Acceso la Pantalla de Patrullaje');
end;

procedure Tfrmprincipal.ReClasificarEventos1Click(Sender: TObject);
begin
   muestra_mdichild(628,841,TfrmReClasificacion,'Acceso la Pantalla de ReClasificacion de Eventos');
end;

//#REPORTES
procedure Tfrmprincipal.Reportesdeoperacin1Click(Sender: TObject);
begin
muestra_mdichild(609,734,Tfrmmoduloreportes,'Acceso la Pantalla Reportes de Operación');
end;

//#REP CLIENTES
procedure Tfrmprincipal.MuestraRepCli(Rep:Integer;Mensaje:String);
var hija:TfrmRepClientes;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepClientes.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Height := 480;
hija.Width := 815;
hija.Show;
end;

procedure Tfrmprincipal.Anualidades1Click(Sender: TObject);
begin
   MuestraRepCli(0,'Acceso al Reporte de Anualidades');
end;

procedure Tfrmprincipal.Bloqueados1Click(Sender: TObject);
begin
   MuestraRepCli(1,'Acceso al Reporte de Bloqueados');
end;

procedure Tfrmprincipal.Categorias2Click(Sender: TObject);
begin
   MuestraRepCli(2,'Acceso al Reporte de Categorias');
end;

procedure Tfrmprincipal.ClienteCuenta1Click(Sender: TObject);
begin
   MuestraRepCli(3,'Acceso al Reporte de Cliente Cuenta');
end;

procedure Tfrmprincipal.CuentasActivasporColonia1Click(Sender: TObject);
begin
   MuestraRepCli(4,'Acceso al Reporte de Cuentas Activas por Colonias');
end;

procedure Tfrmprincipal.EnviodeTraficoporTipo1Click(Sender: TObject);
begin
   MuestraRepCli(5,'Acceso al Reporte de Trafico por Tipo');
end;

procedure Tfrmprincipal.EstadodeCuenta1Click(Sender: TObject);
begin
   MuestraRepCli(6,'Acceso al Reporte de Estado de Cuenta');
end;

procedure Tfrmprincipal.EstadodeCuentaporLotes1Click(Sender: TObject);
begin
   MuestraRepCli(7,'Acceso al Reporte de Estado de Cuenta por Lotes');
end;

procedure Tfrmprincipal.Estatus2Click(Sender: TObject);
begin
   MuestraRepCli(8,'Acceso al Reporte de Estatus del Cliente');
end;

procedure Tfrmprincipal.GastosMayores1Click(Sender: TObject);
begin
   MuestraRepCli(9,'Acceso al Reporte de Gastos Mayores');
end;

procedure Tfrmprincipal.Modificaciones1Click(Sender: TObject);
begin
   MuestraRepCli(10,'Acceso al Reporte de Modificaciones de Clientes');
end;

procedure Tfrmprincipal.NoUbicados1Click(Sender: TObject);
begin
   MuestraRepCli(11,'Acceso al Reporte de Clientes No Ubicados');
end;

procedure Tfrmprincipal.OpenClose1Click(Sender: TObject);
begin
   MuestraRepCli(12,'Acceso al Reporte de Open Close');
end;

procedure Tfrmprincipal.Polizas1Click(Sender: TObject);
begin
   MuestraRepCli(13,'Acceso al Reporte de Polizas');
end;

procedure Tfrmprincipal.Protocolos2Click(Sender: TObject);
begin
   MuestraRepCli(14,'Acceso al Reporte de Protocolos de Clientes');
end;

procedure Tfrmprincipal.ProtocolosDiferentes1Click(Sender: TObject);
begin
   MuestraRepCli(15,'Acceso al Reporte de Protocolos Diferentes');
end;

procedure Tfrmprincipal.Resumen1Click(Sender: TObject);
begin
   MuestraRepCli(16,'Acceso al Reporte de Resumen de Clientes');
end;

procedure Tfrmprincipal.SinAsignacion1Click(Sender: TObject);
begin
   MuestraRepCli(17,'Acceso al Reporte de Clientes sin Asignacion');
end;

procedure Tfrmprincipal.arjetaCliente1Click(Sender: TObject);
begin
   MuestraRepCli(18,'Acceso al Reporte de Tarjeta de Cliente');
end;

procedure Tfrmprincipal.ravelers3Click(Sender: TObject);
begin
   MuestraRepCli(19,'Acceso al Reporte de Travelers por Cliente');
end;

procedure Tfrmprincipal.ipoEnviodeTraficoTotal1Click(Sender: TObject);
begin
   MuestraRepCli(20,'Acceso al Reporte de Tipo Envio de Trafico Total');
end;

procedure Tfrmprincipal.otaldeServiciosAnual1Click(Sender: TObject);
begin
   MuestraRepCli(21,'Acceso al Reporte de Total de Servicios por Cliente Anual');
end;

procedure Tfrmprincipal.CuentasActivasporContrato1Click(Sender: TObject);
begin
   MuestraRepCli(22,'Acceso al Reporte de Cuentas Activas por Contrato');
end;

procedure Tfrmprincipal.CuentasRemisionadas1Click(Sender: TObject);
begin
   MuestraRepCli(23,'Acceso al Reporte de Cuentas Remisionadas por Contrato');
end;

procedure Tfrmprincipal.CuentasCobradas1Click(Sender: TObject);
begin
   MuestraRepCli(24,'Acceso al Reporte de Cuentas Remisionadas por Contrato');
end;

procedure Tfrmprincipal.RemisionesdelMes1Click(Sender: TObject);
begin
   MuestraRepCli(25,'Acceso al Reporte de Cuentas Remisionadas por Contrato');
end;

procedure Tfrmprincipal.NoRemisionadasdelmes1Click(Sender: TObject);
begin
   MuestraRepCli(26,'Acceso al Reporte de Cuentas Remisionadas por Contrato');
end;

procedure Tfrmprincipal.ReporteRemisionado1Click(Sender: TObject);
begin
   MuestraRepCli(29,'Acceso al Reporte de Remisiones Saldadas');
end;

procedure Tfrmprincipal.PorFechadeAlta1Click(Sender: TObject);
begin
   MuestraRepCli(30,'Acceso al Reporte de Cuentas Activas por Contrato');
end;

procedure Tfrmprincipal.ReportedePagosenBanco1Click(Sender: TObject);
begin
   MuestraRepCli(31,'Acceso al reporte Pagos en Banco');
end;

procedure Tfrmprincipal.AbonosCuentasActivasPorMes1Click(Sender: TObject);
begin
   MuestraRepCli(32,'Acceso al Reporte de Cuentas Remisionadas por Contrato');
end;

procedure Tfrmprincipal.CorreosdeClientes1Click(Sender: TObject);
begin
   MuestraRepCli(33,'Acceso al Reporte de Correos de clientes');
end;

procedure Tfrmprincipal.CuentasResidencialesYComercial1Click(
  Sender: TObject);
begin
   MuestraRepCli(34,'Acceso al Reporte de Cuentas Por Categorias');
end;

procedure Tfrmprincipal.Bienvenida1Click(Sender: TObject);
begin
   MuestraRepCli(35,'Acceso al Reporte de Cuentas Por Categorias');
end;

procedure Tfrmprincipal.ClientesRFC2Click(Sender: TObject);
begin
   MuestraRepCli(36,'Acceso al reporte de clientes RFC');
end;

procedure Tfrmprincipal.ServiciosEspeciales1Click(Sender: TObject);
begin
   MuestraRepCli(37,'Acceso al reporte de Servicios Especiales');
end;

procedure Tfrmprincipal.PagosporLineadelMesEISO1Click(Sender: TObject);
begin
   MuestraRepCli(38,'Acceso al reporte de Pagos por Linea del EISO');
end;

procedure Tfrmprincipal.CuentasconComunicador1Click(Sender: TObject);
begin
   MuestraRepCli(39,'Acceso al reporte de Base Celular Renta');
end;

procedure Tfrmprincipal.BaseCelularCompra1Click(Sender: TObject);
begin
   MuestraRepCli(40,'Acceso al reporte de Base Celular Compra');
end;

//#REP CENTRAL
procedure Tfrmprincipal.MuestraRepCentral(Rep:integer;Mensaje:string);
   var hija:Tfrmrepcentral;
begin
   ucprincipal.Log(Mensaje, 0);
   hija:=Tfrmrepcentral.Create(self);
   hija.Height := 195;
   hija.Width := 380;
   hija.Rep := Rep;
   hija.inicializa;
   hija.Show;
end;

procedure Tfrmprincipal.FindeTurno1Click(Sender: TObject);
begin
   MuestraRepCentral(1,'Acceso al Reporte de Fin de Turno');
end;

procedure Tfrmprincipal.iempoAtencionActivacion1Click(Sender: TObject);
begin
MuestraRepCentral(2,'Acceso al Reporte de Tiempo de Atencion de Activaciones');
end;

procedure Tfrmprincipal.AsistenciasporAo1Click(Sender: TObject);
begin
MuestraRepCentral(3,'Acceso al Reporte de Asistencia Patrullero');
end;

procedure Tfrmprincipal.CuentassinSeal1Click(Sender: TObject);
begin
MuestraRepCentral(4,'Acceso al Reporte de Cuentas Sin Señal');
end;

procedure Tfrmprincipal.ActivacionesporPeriodo1Click(Sender: TObject);
begin
MuestraRepCentral(5,'Acceso al Reporte de Cuentas Sin Señal');
end;

procedure Tfrmprincipal.CobrodeActivaciones1Click(Sender: TObject);
begin
MuestraRepCentral(6,'Acceso al Reporte de Cobros por Activacion');
end;

procedure Tfrmprincipal.CuentasSin1Click(Sender: TObject);
begin
MuestraRepCentral(7,'Acceso al Reporte de cuentas sin armar');
end;

procedure Tfrmprincipal.Colonias2Click(Sender: TObject);
begin
MuestraRepCentral(8,'Acceso al Reporte de Colonias por sector');
end;

procedure Tfrmprincipal.OxxosPasswords1Click(Sender: TObject);
begin
MuestraRepCentral(9,'Acceso al Reporte de Passwords de Oxxos');
end;

procedure Tfrmprincipal.iempoyTrasladoPatrulleros1Click(Sender: TObject);
begin
MuestraRepCentral(10,'Acceso al Reporte de Tiempo y Traslado de Patrulleros');
end;

procedure Tfrmprincipal.ActivacionesDiariasMensual1Click(Sender: TObject);
begin
MuestraRepCentral(11,'Acceso al Reporte Activacion Diaria Mensual');
end;

procedure Tfrmprincipal.ActivacionesDiariasAnual1Click(Sender: TObject);
begin
MuestraRepCentral(12,'Acceso al Reporte Activacion Diaria Anual');
end;

procedure Tfrmprincipal.CuentasInactivasConTrafico1Click(Sender: TObject);
begin
MuestraRepCentral(13,'Acceso al Reporte Cuentas Inactivas con Trafico');
end;

//#REP COBRANZA
procedure Tfrmprincipal.MuestraRepCobranza(Rep:Integer;Mensaje:String);
var hija:TfrmRepCobranza;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepCobranza.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.MonitoreoVencido1Click(Sender: TObject);
begin
MuestraRepCobranza(1,'Acceso al Reporte Monitoreo Vencidos');
end;

procedure Tfrmprincipal.AbonosporMonitoreo1Click(Sender: TObject);
begin
MuestraRepCobranza(2,'Acceso al reporte de abonos x monitoreo');
end;

procedure Tfrmprincipal.ClientesDeudores1Click(Sender: TObject);
begin
MuestraRepCobranza(3,'Acceso al reporte de clientes deudores');
end;

procedure Tfrmprincipal.ClientesconAbogado1Click(Sender: TObject);
begin
MuestraRepCobranza(4,'Acceso al reporte de clientes con abogado');
end;

procedure Tfrmprincipal.EstatusdePedidos1Click(Sender: TObject);
begin
MuestraRepCobranza(5,'Acceso al reporte de estatus de pedidos');
end;

procedure Tfrmprincipal.P2Click(Sender: TObject);
begin
MuestraRepCobranza(6,'Acceso al reporte de pedidos del mes');
end;

procedure Tfrmprincipal.PagosporLineaporMes1Click(Sender: TObject);
begin
MuestraRepCobranza(7,'Acceso al reporte de Pagos por linea por mes');
end;

procedure Tfrmprincipal.BloqueadosyporBloquear1Click(Sender: TObject);
begin
MuestraRepCobranza(8, 'Acceso al Reporte bloqueados y por bloquear');
end;

procedure Tfrmprincipal.MotivosdeCancelaciondeFacturas1Click(
  Sender: TObject);
begin
MuestraRepCobranza(9, 'Acceso al Reporte Motivos de Cancelacion de Facturas');
end;

procedure Tfrmprincipal.PedidosporLinea1Click(Sender: TObject);
begin
MuestraRepCobranza(10, 'Acceso al Reporte Pedidos por Linea');
end;

//#REP INSTALACIONES
procedure Tfrmprincipal.ReportePedidosPendientes1Click(Sender: TObject);
begin
muestra_mdichild(313,377,Tfrmpedidospendientes,'Acceso la Pantalla de Reporte de pedidos pendientes');
end;

procedure Tfrmprincipal.MuestraRepInstalaciones(Rep:Integer;Mensaje:String);
var hija:TfrmRepInstalaciones;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepInstalaciones.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.ArticulosCosteado1Click(Sender: TObject);
begin
MuestraRepInstalaciones(1,'Acceso al Reporte de Articulos Costeado');
end;

procedure Tfrmprincipal.PendientesPorHora1Click(Sender: TObject);
begin
MuestraRepInstalaciones(2,'Acceso al Reporte de Instalaciones Pendientes por Hora');
end;

procedure Tfrmprincipal.odos1Click(Sender: TObject);
begin
MuestraRepInstalaciones(3,'Acceso al Reporte de Pedidos Pendientes');
end;

procedure Tfrmprincipal.PorPedido1Click(Sender: TObject);
begin
MuestraRepInstalaciones(4,'Acceso al Reporte de Pedidos Pendientes por Instalador');
end;

procedure Tfrmprincipal.PorFechas1Click(Sender: TObject);
begin
MuestraRepInstalaciones(5,'Acceso al Reporte de Pedidos Pendientes por Fechas');
end;

procedure Tfrmprincipal.VentasPromedio1Click(Sender: TObject);
begin
MuestraRepInstalaciones(6,'Acceso al Reporte de Ventas Promedio');
end;

procedure Tfrmprincipal.VentasArticulosAnual1Click(Sender: TObject);
begin
MuestraRepInstalaciones(7,'Acceso al Reporte de Ventas Articulo Anual');
end;        

procedure Tfrmprincipal.endencia1Click(Sender: TObject);
begin
MuestraRepInstalaciones(8,'Acceso al Reporte de Tendencia de Instalaciones');
end;

//#REP SERVICIOS
procedure Tfrmprincipal.MuestraRepServicios(Rep:Integer;Mensaje:String);
var hija:TfrmRepServicios;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepServicios.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.Mantenimientos4Click(Sender: TObject);
begin
MuestraRepServicios(1,'Acceso al Reporte de Servicios de Mantenimiento');
end;

procedure Tfrmprincipal.BusServicios1Click(Sender: TObject);
begin
MuestraRepServicios(2,'Acceso al Reporte de Busqueda de Servicios');
end;

procedure Tfrmprincipal.ActualizarTicketsFinalizados1Click(
  Sender: TObject);
begin
MuestraRepServicios(3,'Acceso a la pantalla de Actualizacion de Tickets Finalizados');
end;

procedure Tfrmprincipal.ServiciosaOxxos1Click(Sender: TObject);
begin
MuestraRepServicios(4,'Acceso al reporte de Actualizacion de Tickets Finalizados');
end;

procedure Tfrmprincipal.CambiosdeCodigo1Click(Sender: TObject);
begin
MuestraRepServicios(5,'Acceso al reporte de Cambios de codigo');
end;

//#REP ESTANDARES
procedure Tfrmprincipal.MuestraRepEstandares(Rep:Integer;Mensaje:String);
   var hija:TfrmRepEstandares;
begin
   ucprincipal.Log(Mensaje, 0);
   hija:= TfrmRepEstandares.Create(self);
   hija.Height:= 200;
   hija.Width:= 411;
   hija.Rep:= Rep;
   hija.inicializa;
   hija.Show;
end;

procedure Tfrmprincipal.Ventas1Click(Sender: TObject);
begin
MuestraRepEstandares(1,'Acceso la pantalla de Estandares de Medicion (Ventas)');
end;

procedure Tfrmprincipal.Instalaciones2Click(Sender: TObject);
begin
MuestraRepEstandares(2,'Acceso la pantalla de Estandares de Medicion (Instalaciones)');
end;

procedure Tfrmprincipal.Servicios3Click(Sender: TObject);
begin
MuestraRepEstandares(3,'Acceso la pantalla de Estandares de Medicion (Servicios)');
end;

procedure Tfrmprincipal.Central2Click(Sender: TObject);
begin
MuestraRepEstandares(4,'Acceso la pantalla de Estandares de Medicion (Central)');
end;

procedure Tfrmprincipal.Cobranza2Click(Sender: TObject);
begin
MuestraRepEstandares(5,'Acceso la pantalla de Estandares de Medicion (Cobranza)');
end;

//#REP TRAVELERS
procedure Tfrmprincipal.ReporteTravelersmas2diasVencidos1Click(Sender: TObject);
begin
  querys('SELECT travel.idtravel,travel.idcliente,areas.nombre,travel.FechaRecive,travel.HoraRecive,if(travel.resuelto=1,''Ya se Resolvio'',''No se ha Resuelto'') as Resuelto,if(travel.auditado=1,''Auditado'',''No Auditado'') as Auditado,'+
         '(to_days(current_date))-to_days(travel.FechaRecive) as Dias FROM travel INNER JOIN areas ON (travel.iddptoa = areas.idarea) WHERE ((travel.resuelto = 0) or (travel.auditado = 0)) and (to_days(travel.FechaRecive)<=(to_days(current_date)-2)) '+
         ' order by areas.nombre,travel.FechaRecive desc',0,dmreportes.sqlgeneral2);
   OperacionReporte('TravelerVencidos', 'Traveler Vencidos por mas de dos dias', 'IMP', 1);
end;

//#REP VENTAS
procedure Tfrmprincipal.Actividadesvendedor1Click(Sender: TObject);
begin
muestra_mdichild(244,261,tfrmrep_act_vend,'Acceso la Pantalla de Reportes de Actividades Vendedores');
end;

procedure Tfrmprincipal.AsignacionesPorOrigen1Click(Sender: TObject);
begin
muestra_mdichild(200,368,TfrmRepAsigOrig,'Acceso la pantalla de Reporte de Asignaciones por Origen');
end;

procedure Tfrmprincipal.ContactosPendientes1Click(Sender: TObject);
begin
muestra_mdichild(502,818,tfrmrep_oportu,'Acceso la Pantalla de Reportes de contactos pendientes');
end;

procedure Tfrmprincipal.LLAMADASXFUENTE1Click(Sender: TObject);
begin
muestra_mdichild(219,375,TfrmLlamXFuente,'Acceso la Pantalla de Reportes de llamadas x fuente');
end;

procedure Tfrmprincipal.MuestraRepLlamadasTmk(Rep:Integer;Mensaje:String);
   var hija:Tfrmrepllamadastmk;
begin
   ucprincipal.Log(Mensaje, 0);
   hija:=Tfrmrepllamadastmk.Create(self);
   hija.Reporte := Rep;
   hija.Inicializa;
   hija.Show;
end;

procedure Tfrmprincipal.LlamadasporTelemarketing1Click(Sender: TObject);
begin
MuestraRepLlamadasTmk(1,'Acceso a la pantalla de Llamadas por Telemarketing');
end;

procedure Tfrmprincipal.MuestraRepVentas(Rep:Integer;Mensaje:String);
var hija:TfrmRepVendedores;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepVendedores.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.LogSincronizacion1Click(Sender: TObject);
begin
MuestraRepVentas(1,'Acceso al Reporte de log de Sincronizacion');
end;

procedure Tfrmprincipal.Prospecciones1Click(Sender: TObject);
begin
MuestraRepVentas(2,'Acceso al Reporte de Prospecciones');
end;

procedure Tfrmprincipal.endenciadeProspectadores1Click(Sender: TObject);
begin
MuestraRepVentas(3,'Acceso al Reporte de Tendencia Prospectadores');
end;

procedure Tfrmprincipal.ReportedeMetas1Click(Sender: TObject);
begin
MuestraRepVentas(4,'Acceso al Reporte de Metas Vendedor');
end;


procedure Tfrmprincipal.ReporteMetasAnual1Click(Sender: TObject);
begin
MuestraRepVentas(5,'Acceso al Reporte de Metas Vendedor Anual');
end;

//#REP USUARIOS
procedure Tfrmprincipal.GraficaGantt1Click(Sender: TObject);
var  hija:TfrmEnviarCorreo;
begin
application.CreateForm(Tfrmgraficas, hija);
hija.Show;
end;

//#REP LLAMADAS
procedure Tfrmprincipal.MuestraRepLlamdasTel(Rep:Integer;Mensaje:String);
var hija:TfrmRepLlamadasTel;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepLlamadasTel.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.LogdeLlamadas1Click(Sender: TObject);
begin
MuestraRepLlamdasTel(1,'Acceso al Reporte de Log de Llamadas');
end;

procedure Tfrmprincipal.ResumendeLlamadas1Click(Sender: TObject);
begin
MuestraRepLlamdasTel(2,'Acceso al Reporte de Resumen de Llamadas');
end;

procedure Tfrmprincipal.LlamadasporExtension1Click(Sender: TObject);
begin
MuestraRepLlamdasTel(3,'Acceso al Reporte de Resumen de Llamadas');
end;

procedure Tfrmprincipal.DirectoriodeExtensiones1Click(Sender: TObject);
begin
MuestraRepLlamdasTel(4,'Acceso al Directorio de Extensiones');
end;

procedure Tfrmprincipal.MuestraRepRecHum(Rep:Integer;Mensaje:String);
var hija:TfrmRepRecHumanos;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepRecHumanos.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.QuejasporUsuario1Click(Sender: TObject);
begin
MuestraRepRecHum(1,'Acceso al Reporte de Travelers por Quejas a Usuarios');
end;

procedure Tfrmprincipal.ravelersporUsuario1Click(Sender: TObject);
begin
MuestraRepRecHum(2,'Acceso al Reporte de Travelers por Usuario');
end;

procedure Tfrmprincipal.LogUsuario1Click(Sender: TObject);
begin
MuestraRepRecHum(3,'Acceso al Reporte de Log Usuarios');
end;

procedure Tfrmprincipal.NotasporUsuario1Click(Sender: TObject);
begin
MuestraRepRecHum(4,'Acceso al Reporte de Notas por Usuarios');
end;

procedure Tfrmprincipal.NotasdeBonificaciones1Click(Sender: TObject);
begin
 MuestraRepRecHum(5,'Acceso al Reporte de Notas de Bonificaciones por usuario');
end;

procedure Tfrmprincipal.SolicitudesWeb1Click(Sender: TObject);
begin
muestra_mdichild(480,685,TfrmSolicitudesWeb,'Acceso a la pantalla de Consulta de Solicitudes Web');
end;

//#REP MULTIPLE
procedure Tfrmprincipal.MuestraRepMultiple(Rep:Integer;Mensaje:String);
var hija:TfrmRepMultiples;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmRepMultiples.Create(self);
hija.Reporte :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.MultServicios1Click(Sender: TObject);
begin
MuestraRepMultiple(1,'Acceso al Reporte Multiple de Servicios');
end;

procedure Tfrmprincipal.MultInstalaciones1Click(Sender: TObject);
begin
MuestraRepMultiple(2,'Acceso al Reporte Multiple de Instalaciones');
end;

procedure Tfrmprincipal.RepCentral1Click(Sender: TObject);
begin
MuestraRepMultiple(3,'Acceso al Reporte Multiple de Central');
end;

procedure Tfrmprincipal.RepVentas1Click(Sender: TObject);
begin
MuestraRepMultiple(4,'Acceso al Reporte Multiple de Ventas');
end;

procedure Tfrmprincipal.RepCobranza2Click(Sender: TObject);
begin
MuestraRepMultiple(5,'Acceso al Reporte Multiple de Cobranza');
end;

procedure Tfrmprincipal.RMContratos1Click(Sender: TObject);
begin
MuestraRepMultiple(6,'Acceso al Reporte Multiple de Contratos');
end;

//#TRAVELERS
procedure Tfrmprincipal.ravelers2Click(Sender: TObject);
begin
 muestra_mdichild(600,1000,Tfrmtravel,'Acceso la Pantalla de Travelers');
end;

procedure Tfrmprincipal.Asuntos1Click(Sender: TObject);
begin
   muestra_mdichild(175,433,TfrmAsuntos,'Acceso la Pantalla de Asuntos');
end;

procedure Tfrmprincipal.Magnitudes1Click(Sender: TObject);
begin
   muestra_mdichild(180,435,Tfrmmagnitudes,'Acceso la Pantalla de Magnitudes');
end;

procedure Tfrmprincipal.Quejas1Click(Sender: TObject);
begin
  muestra_mdichild(220,440,TfrmQuejas,'Acceso la Pantalla de Quejas');
end;

//#RECURSOS HUMANOS
procedure Tfrmprincipal.EvaluaciondeDesempeo1Click(Sender: TObject);
begin
muestra_mdichild(375,670,TfrmEvaluacionDesempeno,'Acceso la Pantalla de Evaluacion de Desempeño');
end;

procedure Tfrmprincipal.FactoresIndividuales1Click(Sender: TObject);
begin
muestra_mdichild(170,400,TfrmFactoresIndividuales,'Acceso la Pantalla de Factores individuales');
end;

procedure Tfrmprincipal.DescripciondePuntuacion1Click(Sender: TObject);
begin
muestra_mdichild(195,475,TfrmDescripcionPuntuacion,'Acceso la Pantalla de Descripcion de Puntuacion por Factor');
end;

procedure Tfrmprincipal.Calificaciones1Click(Sender: TObject);
begin
muestra_mdichild(375,670,TfrmEvaluacionDesempeno,'Acceso la Pantalla de Evaluacion de Desempeño');
end;

//#USUARIOS
procedure Tfrmprincipal.CrearyAsignarPermisos1Click(Sender: TObject);
begin
ucprincipal.Log('Acceso la pantalla Crear y asiganr permisos',0);
ucprincipal.ShowUserManager;
end;

procedure Tfrmprincipal.AsignarDatosdeClientes1Click(Sender: TObject);
begin
muestra_mdichild(547,913,tfrmusuarios,'Entro a la pantalla de usuarios');
end;

procedure Tfrmprincipal.Derechos1Click(Sender: TObject);
begin
  muestra_mdichild(370,570,TfrmUsuariosDerechos,'Acceso a la pantalla Derechos');
end;

procedure Tfrmprincipal.Areas1Click(Sender: TObject);
begin
muestra_mdichild(350,779,tfrmareas,'Entro a la pantalla de Areas');
end;

procedure Tfrmprincipal.Puestos1Click(Sender: TObject);
begin
muestra_mdichild(310,455,tfrmpuestos,'Entro a la pantalla de Puestos');
end;

procedure Tfrmprincipal.urnos1Click(Sender: TObject);
begin
   muestra_mdichild(230,410,Tfrmturnos,'Acceso la Pantalla de Turnos');
end;

procedure Tfrmprincipal.ColoniasporUsuario1Click(Sender: TObject);
begin
muestra_mdichild(630,600,TfrmColUsuarios,'Acceso la pantalla de Colonias Vs Usuarios');
end;

procedure Tfrmprincipal.FoliosDerechos1Click(Sender: TObject);
begin
  muestra_mdichild(440,600,TfrmFoliosUsuarios,'Acceso la pantalla de Folios por Usuarios');
end;

procedure Tfrmprincipal.SectoresyTurnos1Click(Sender: TObject);
begin
muestra_mdichild(425,610,TfrmSectoresTurnos,'Acceso la pantalla de Sectores y Turnos');
end;

procedure Tfrmprincipal.UsuarioActual1Click(Sender: TObject);
begin
muestra_mdichild(210,584,TfrmUsuarioActual,'Acceso a la pantalla de Usuario Actual');
end;

procedure Tfrmprincipal.CambiarContrasea1Click(Sender: TObject);
begin
ucprincipal.Log('Acceso la pantalla Cambio de Contraseñas',0);
end;

//#UTILERIAS
procedure Tfrmprincipal.SqlMonitor1Click(Sender: TObject);
begin
muestra_mdichild(550,900,TViewer,'Acceso a SQL Monitor');
end;

procedure Tfrmprincipal.Configuraciones1Click(Sender: TObject);
begin
muestra_mdichild(286,818,Tfrmconfiguraciones,'Acceso la Pantalla De configuraciones');
end;

procedure Tfrmprincipal.EnviarCorreo1Click(Sender: TObject);
var  hija:TfrmEnviarCorreo;
begin
application.CreateForm(TfrmEnviarCorreo, hija);
hija.inicializa('',Mmdatos);
hija.Show;
end;

procedure Tfrmprincipal.EnviaPromocion1Click(Sender: TObject);
begin
muestra_mdichild(300,500,TfrmEnviaPromosion,'Acceso la pantalla Envia promosion');
end;

procedure Tfrmprincipal.MyBuilder1Click(Sender: TObject);
begin
dmaccesos.MyBuilder.ShowModal;
end;


procedure Tfrmprincipal.Acercade1Click(Sender: TObject);
begin
muestra_mdichild(400,530,tfrmaboutbox,'Entro a la pantalla de Acerca de...');
end;

procedure Tfrmprincipal.btnAgendaVendClick(Sender: TObject);
begin
agenda1click(self);
end;

procedure Tfrmprincipal.uno1Click(Sender: TObject);
begin
tile;
end;

procedure Tfrmprincipal.Cascada1Click(Sender: TObject);
begin
cascade;
end;

procedure Tfrmprincipal.Ordenadas1Click(Sender: TObject);
begin
arrangeicons;
end;

procedure Tfrmprincipal.VistaVentasExecute(Sender: TObject);
begin
if DerechosSys('Ventas Cliente') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;
muestra_mdichild(635,1028,TfrmVistaVtasCliente,'Acceso la Pantalla Vista de Ventas');
end;

procedure Tfrmprincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//indica que esta maquina esta en linea
if dmaccesos.Client.Connected = true then
  begin
  ClientHandleThread.Terminate;
  dmaccesos.Client.Disconnect;
  end;
querys('update maquinas set online=0,monitoreando=0 where ipadress='+quotedstr(ipmaq),1,sqlgeneral);
querys('update usuarios set online=0 where idusuario='+inttostr(ucprincipal.CurrentUser.UserID),1,sqlgeneral);
frmprincipal.ucprincipal.Log('Salio del sistema',0);
end;

procedure Tfrmprincipal.ucprincipalLogoff(Sender: TObject;
  IDUser: Integer);
begin //sync
//scliente.Socket.SendText('desconecto~'+frmprincipal.ucprincipal.CurrentUser.LoginName);
ucprincipal.LoginMode := lmActive;
//actualiza maquinas
querys('update maquinas set online=0,monitoreando=0 where ipadress='+quotedstr(ipmaq),1,sqlgeneral);
//actualiza el usuario
querys('update usuarios set online=0 where idusuario='+inttostr(iduser),1,sqlgeneral);

if dmaccesos.Client.Connected = true then
  dmaccesos.Client.Disconnect;
end;

procedure Tfrmprincipal.FormCreate(Sender: TObject);
var
  hMenuHandle : HMENU;
begin
//quita el boton de cerrar de la pantalla principal
   hMenuHandle := GetSystemMenu(Frmprincipal.Handle, FALSE);
   if (hMenuHandle <> 0) then
     DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
   ucprincipal.StartLogin;
   ShortTimeFormat := 'HH:MM:ss';
   RCStatus.Width := 150;
   spuser.Width := 250;
end;

procedure Tfrmprincipal.Configuracion1Click(Sender: TObject);
begin
frmprincipal.muestra_mdichild(655,895,tfrmCfgPresup,'Acceso la pantalla de configuracion de presupuestos');
end;

procedure Tfrmprincipal.Requisiciones2Click(Sender: TObject);
begin
muestra_mdichild(600,610,TfrmRequisiciones,'Acceso la pantalla de Requisiciones Internas');
end;

procedure Tfrmprincipal.CatalogoCabms1Click(Sender: TObject);
begin
  muestra_mdichild(275,610,TfrmCabms,'Acceso la pantalla de Catalogo Cabms');
end;

procedure Tfrmprincipal.btntestClick(Sender: TObject);
begin
muestra_mdichild(315,520,Tfrmtest,'Acceso la pantalla TEST');
end;

procedure Tfrmprincipal.SaldosClientesPedidos1Click(Sender: TObject);
var i,entro:integer;
begin
   with dmreportes do
   begin

      for i := 1 to 11000 do
      begin
         entro:=0;
         frmprincipal.Caption := inttostr(i);

         querys('DROP TABLE IF EXISTS TempPago12',1,sqlgeneral5);
         querys('create table TempPago12 select pc.idpago,pc.movimiento as movimiento,pc.idpedido as idpedido,p.concepto,p.saldado from PagosClientes as pc left join  pedidos as p on (p.idpedido=pc.idpedido) ' +
                'where p.estatus in(3,4) and pc.restante  > 0  and pc.movimiento in(0,1) and pc.idcliente ='+inttostr(i),1,sqlgeneral5);
         querys('DELETE TempPago12 FROM TempPago12 inner join PagosClientes ON(TempPago12.idpedido= PagosClientes.idpedido) where  TempPago12.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral5);
         querys('SELECT truncate(sum(pc.restante),2) as total from PagosClientes as pc inner join TempPago12 as p ON (p.idpago=pc.idpago) '+
                'where pc.restante > 0  and pc.idcliente ='+inttostr(i),0,sqlgeneral5);

         bpcambios('clientes', inttostr(i), 'idcliente');
         querys('UPDATE clientes SET saldo='+quotedstr(sqlgeneral5.FieldByName('total').asstring)+' WHERE idcliente='+inttostr(i),1,sqlgeneral);
         apcambios('idcliente', inttostr(i), 'clientes', 'SaldoClientesPedido');

         querys('SELECT pc.idpedido as ped,truncate(sum(pc.restante),2) as total,p.saldado as saldado from PagosClientes as pc inner join TempPago12 as p ON (p.idpago=pc.idpago) '+
                'where pc.restante > 0  and pc.idcliente ='+inttostr(i)+' group by pc.idpedido',0,sqlgeneral5);

         while not sqlgeneral5.Eof do
         begin
            if (sqlgeneral5.FieldByName('total').AsFloat < 2)  then    //por si las decimales jijiji
            begin
               querys('UPDATE pedidos SET saldado =1,Saldo=0 WHERE idpedido='+quotedstr(sqlgeneral5.FieldByName('ped').AsString),1,sqlgeneral);
            end
            else
            begin
               querys('UPDATE pedidos SET saldado = 0,Saldo='+quotedstr(sqlgeneral5.FieldByName('total').AsString)+' WHERE idpedido='+quotedstr(sqlgeneral5.FieldByName('ped').AsString),1,sqlgeneral);
            end;

            entro:=1;
            sqlgeneral5.Next;
         end;

         if(entro=0) then
            querys('UPDATE pedidos SET saldado =1,Saldo=0 WHERE estatus in(3,4,6) and idcliente='+inttostr(i),1,sqlgeneral);

         querys('DROP TABLE IF EXISTS TempPago12',1,sqlgeneral);
      end;
   end;
end;

procedure Tfrmprincipal.ConsultarManuales1Click(Sender: TObject);
begin
muestra_mdichild(400,930,TfrmBuscaManual,'Acceso la Pantalla de Consulta a Manuales');
end;

procedure Tfrmprincipal.Minuta1Click(Sender: TObject);
begin
muestra_mdichild(615,1010,TfrmMinuta,'Acceso la pantalla de Minuta');
end;

procedure Tfrmprincipal.SolicitudesaSistemas1Click(Sender: TObject);
begin
muestra_mdichild(615,1010,TfrmOrdenes,'Acceso la pantalla de Solicitudes a Sistemas');
end;

procedure Tfrmprincipal.MinutaMensual1Click(Sender: TObject);
begin
muestra_mdichild(615,1010,TfrmMinutaMensual,'Acceso la pantalla de Minuta Mensual');
end;

procedure Tfrmprincipal.MinutaCoorporativa1Click(Sender: TObject);
begin
muestra_mdichild(615,1010,TfrmMinutaGerencial,'Acceso la pantalla de Minuta Coorporativa');
end;


procedure Tfrmprincipal.btnmsnClick(Sender: TObject);
begin
muestra_mdichild(577,772,TfrmAgendaTelefonica,'Acceso la pantalla de Agenda Telefonica');
end;

procedure Tfrmprincipal.timerTimer(Sender: TObject);
var email:string;
begin
if PuestoUsuario = 'CENTRALERO' then
  exit;
if (time > strtotime('12:01:00 am')) and (time < strtotime('02:05:00 am')) then
  if GetConfiguraciones('ActualizarExe', true) = '1' then
    begin
    if AreaUsuario <> 'CENTRAL' then
      begin
      querys('Select u.email1 from usuarios u left join puestos p on p.idpuesto=u.idpuesto left join areas a '+
             'on a.idarea=u.idarea where p.nombre = "GERENTE" and a.nombre = "SISTEMAS"', 0, sqlgeneral);
      email := sqlgeneral.fieldbyname('email1').AsString;
      querys('Select '+UsuarioNombre('u')+' as nombre, p.nombre as puesto, a.nombre as area, u.email1, '+
             'j.email1 as jefeemail, '+UsuarioNombre('j')+' as jefe from usuarios u left join puestos p on '+
             'p.idpuesto=u.idpuesto left join areas a on a.idarea=u.idarea left join usuarios j '+
             'on j.idarea =u.idarea inner join puestos pj on pj.idpuesto=j.idpuesto and pj.nombre = '+
             '"GERENTE" where u.idusuario = '+inttostr(ucprincipal.CurrentUser.UserID),0,sqlgeneral);
      email := email + ',' + sqlgeneral.fieldbyname('jefeemail').AsString + ', ' +  sqlgeneral.fieldbyname('email1').AsString;

      body.Clear;
      body.Lines.Add('La persona '+sqlgeneral.fieldbyname('nombre').AsString+' del area de '+
                     sqlgeneral.fieldbyname('area').AsString+' con el puesto de '+sqlgeneral.fieldbyname('puesto').AsString+
                     ' dejo la computadora prendida el dia '+datetostr(today)+' detectado alrededor de las 10 de la noche '+
                     'por el sistema. Se les pide por favor tener cuidado de apagar la maquina al salir de trabajar, para la '+
                     'conservacion de los equipos, entre otros.'+char(#13)+char(#13)+char(#13)+'Gracias por su comprension'+
                     char(#13)+'Despartamento de Sistemas');
     origensspainterno := GetConfiguraciones('UserEmailinterno', true);
     send_email(origensspainterno,origensspainterno,email,sqlgeneral.fieldbyname('nombre').AsString+' dejo maquina encendida',mmdatos, body,1);
     end;
    Application.Terminate;
    end;
end;

procedure Tfrmprincipal.BolNoImp1Click(Sender: TObject);
begin
   muestra_mdichild(193,334,TfrmBolNoImp,'Acceso la pantalla de Boletas ya impresas');
end;

procedure Tfrmprincipal.morososClick(Sender: TObject);
begin
    saldosmorosos;
end;

procedure Tfrmprincipal.btnagendaClick(Sender: TObject);
begin
agenda1click(self);
end;

procedure Tfrmprincipal.RzBitBtn2Click(Sender: TObject);
begin
Logout1.OnClick(self);
end;

procedure Tfrmprincipal.RzBitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure Tfrmprincipal.Caja1Click(Sender: TObject);
begin
muestra_mdichild(295,500,TfrmRepCaja,'Acceso al Reporte de Caja');
end;

procedure Tfrmprincipal.LogFE1Click(Sender: TObject);
begin
 MuestraRepFE(1,'Acceso al reporte de Log de Facturacion Electronica');
end;

procedure Tfrmprincipal.ConteodePipes1Click(Sender: TObject);
begin
MuestraRepFE(2,'Acceso al reporte de Log de Facturacion Electronica');

end;

procedure Tfrmprincipal.MuestraRepFE(Rep:Integer;Mensaje:String);
var hija:TfrmFELog;
begin
ucprincipal.Log(Mensaje, 0);
hija:=TfrmFELog.Create(self);
hija.Rep :=Rep;
hija.Inicializa;
hija.Show;
end;

procedure Tfrmprincipal.ConexionSQL1Click(Sender: TObject);
begin
Launcher1.StartDir := ExtractFilePath(Application.ExeName);
Launcher1.FileName := 'ConexionADO.exe';
Launcher1.Launch;
end;

procedure Tfrmprincipal.BoletasMensualesElectronicas1Click(
  Sender: TObject);
begin
  muestra_mdichild(540,800,Tfrmboletas_mensualesElectronicas,'Acceso la Pantalla de Boletas Mensuales Electronicas');
end;

procedure Tfrmprincipal.FacturacionenLotesPersonalizada1Click(
  Sender: TObject);
begin
  muestra_mdichild(492,761,TfrmFacturacionLotesFECus,'Acceso la Pantalla Facturacion Electronica por Lotes Personalizada');
end;

End.


