{///////////////////////////////////////////////////////////////////////////////
2011/07/17 dalyla quitar comitas dobles en sector between "" and ""
2011//12/01 dalyla correcion a reporte de cancelados y morosos no tenia auditoria
2011/11/05 dalyla agregar reporte de cancelado y morosos en auditoria
                  y el de pagos x linea anualidad
2011/08/18 dalyla no mostrar 044 en reporte de sectores por vencer en sms
2010/09/22 Oscar modificacion en el reporte de canceladas inclui las morosas
2010/09/16 BICENTENARIO (0 o) dalyla Guardar  RepPagosXLineaDet
2010/08/17 dalyla Clientes sin actividad activos y sin bloquear
--------------------------------------------------------------------------------
2009/06/15 dalyla correccion de reprote de falsas alarmas
2009/06/08 Oscar resumen de concentrado alarmas
2009/05/22 dalyla cieere de compras
2009/05/07 Oscar Modificacion clientes resumen email
2009/03/25 dalyla quitar comentado de rep cobranza
2009/03/25 dalyla compras se desgloce siempre el iva
2009/03/24 dalyla error sql sect. vencidos
2009/02/25 dalyla reporte de zonas default
2009/02/17 Oscar Mofificacion en comisionesvendedorescasa separar equipos sin enlace
2009/01/27 Oscar modificacion a comisionesvededores
--------------------------------------------------------------------------------
2008/12/24 dalyla rep de articulos activos inventariables
2008/12/10 Oscar cbounidad modificacion de query
2008/12/04 oscar llamada y visitra en tendencia
2008/11/06 dalyla tendencia de vendedores se guarde
2008/10/27 dalyla inventario para ordenes de compra
2008/10/20 dalyla tendencia instaladores obras proceso
2008/10/01 OSCAR AGREGE EL REPORTE DE AUDITORIA REMISIONES MENSUALES
2008/09/26 dalyla busq fechas de servicios
2008/09/14 dalyla quitar prueba tecnico, instalador y circuito no armado de tiempo centraleros
2008/08/04 dalyla error en ventas agregar el total
2008/08/04 dalyla resumen en comisiones vendedores de casa
2008/08/01 dalyla fechaobra por fecha en obras en proceso comisiones 
2008/07/18 dalyla modificaciones en reportes oxxos (nombres)
2008/07/08 dalyla tendencia instaladores por com y vtas
2008/06/26 dalyla inventariable en la lista de precios interna 
2008/06/04 oscar le agrege el estatus 6 al reporte de cobros en caja
2008/05/30 dalyla backorder y apartados en inventario
2008/05/28 oscar correccion al procedure comisionesvendedorcasa fecharemision
2008/05/27 dalyla inventario por fechas no traiga articulos historicos
2008/05/14 dalyla quitar canceladas de buscar tecnicos
2008/04/30 dalyla comisiones instaladores
2008/04/24 dalyla cliente cambios
2008/04/17 dalyla obra en proceso comisiones instaladores
2008/04/14 dalyla eventos positivos
2008/04/14 dalyla contratos separar sen
2008/04/11 dalyla ventas mensuales con hrs ins com
2008/04/11 dalyla contratos sin "SEN"
2008/03/27 dalyla resumen clientes correcion en tipo alarma
2008/03/20 Dalyla Comisiones vendedor casa por pedido y no por presupuesto
2008/03/10 Oscar Clientes Resumen agrege un if para cuando son todos y quite los clientes tipocont=14
2008/02/28 dalyla zona horaria ok
2008/02/01 dalyla Falsas Alarmas agregue todos
2008/01/15 dalyla comvendedores tp.cuentanueva y tick pend por fecha sqlgeneral3
--------------------------------------------------------------------------------
2007/12/26 dalyla buskeda de tecnicos sea servicios
2007/12/24 dalila select tecnico en combo not inlist (busquedas)
2007/12/18 Dalila Comision Vendedor %cctv i.FechaFinal en vez de inicio en comisiones y tend instaladores
2007/12/17 Dalila Diario, Analitico y Error en Ventas cambie el GetIVA por el pIVA de la tabla
2007/12/10 Dalila Separar CCTV en comisiones vendedor
2007/11/26 Dalila En Cobranza/contratos agregue where tipo not in("CAN", "MOR", "LIB", "S/N")
2007/11/15 Edwin Cambio al reporte de abonos x cuenta
2007/11/14 Edwin modificacion a  reprote de cobranza
2007/11/08 DALILA group en bono patrullero ahora crea temporal
2007/11/06 DALILA Morosos por primera vez agregue la Unidad de Negocio       
}///////////////////////////////////////////////////////////////////////////////
unit Umoduloreportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, RzGroupBar, RzBckgnd, StdCtrls, RzLabel, RzButton, Mask,
  RzEdit, ExtCtrls, RzPanel, RzCmboBx, RzRadChk,strutils, DB, MemDS, DBAccess,
  MyAccess, RzRadGrp, RzBtnEdt, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid,printers, RpDefine, RpRender, RpRenderCanvas, RpRenderPrinter,
  ComCtrls, RzDTP, RzPrgres, RzSpnEdt, DateUtils, Grids, DBGrids, Mxstore, MXDB,
  TeeProcs, TeEngine, Chart, MXGRAPH, Chartfx3, OleCtrls, VCFI, Series, DbChart;

type
  Tfrmmoduloreportes = class(TForm)
    TabPrincipal: TRzPageControl;
    TabReportesGenerales: TRzTabSheet;
    TabVent: TRzTabSheet;
    TabCob: TRzTabSheet;
    TabClientes: TRzTabSheet;
    TabVent2: TRzPageControl;
    TabVent2Catalogos: TRzTabSheet;
    lbcategorias: TRzURLLabel;
    lbestatus: TRzURLLabel;
    lbfuentes: TRzURLLabel;
    lbgiros: TRzURLLabel;
    lborigenes: TRzURLLabel;
    lbtipos: TRzURLLabel;
    lbtiposact: TRzURLLabel;
    lbtiposoportu: TRzURLLabel;
    RzSeparator1: TRzSeparator;
    TabCob2: TRzPageControl;
    TabCob2Can: TRzTabSheet;
    gbperiodo: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    dfecha1: TRzDateTimeEdit;
    dfecha2: TRzDateTimeEdit;
    TabCob2SecVen: TRzTabSheet;
    gbsectores: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel5: TRzLabel;
    cbosector1: TRzComboBox;
    cbosector2: TRzComboBox;
    TabCob2Gen: TRzTabSheet;
    gblineas: TRzGroupBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    cbolineas1: TRzComboBox;
    cbolineas2: TRzComboBox;
    gbdias: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    eddias1: TRzNumericEdit;
    gbincluir: TRzGroupBox;
    ckbnormales: TRzCheckBox;
    ckbforzosos: TRzCheckBox;
    ckbabogado: TRzCheckBox;
    TabCob2Antigxlinea: TRzTabSheet;
    TabInv: TRzTabSheet;
    TabInv2: TRzPageControl;
    TabInv2Gen: TRzTabSheet;
    lbinvetarios: TRzURLLabel;
    TabInv2Inv: TRzTabSheet;
    gbmovimientos: TRzGroupBox;
    RzLabel4: TRzLabel;
    cbomovimientos: TRzComboBox;
    btnreporteador: TRzBitBtn;
    ckbbloqueados: TRzCheckBox;
    TabVent2TendVend: TRzTabSheet;
    gbPeriodoMesA: TRzGroupBox;
    RzLabel6: TRzLabel;
    RzLabel11: TRzLabel;
    cbomeses: TRzComboBox;
    cboano: TRzComboBox;
    TabEntSal: TRzTabSheet;
    TabCob2Pagosxlinea: TRzTabSheet;
    gbusuarios: TRzGroupBox;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    edusuario1: TRzButtonEdit;
    ckbtodos: TRzCheckBox;
    edusuario2: TRzButtonEdit;
    TabVent2DV: TRzTabSheet;
    TabVent2Cobros: TRzTabSheet;
    TabVent2VM: TRzTabSheet;
    TabVent2FC: TRzTabSheet;
    sqlgeneral: TMyQuery;
    gbUnaFecha: TRzGroupBox;
    dUnafecha: TRzDateTimeEdit;
    TabInst: TRzTabSheet;
    TabInst2: TRzPageControl;
    TabInst2Gen: TRzTabSheet;
    RzURLLabel1: TRzURLLabel;
    TabVent2DVentas: TRzTabSheet;
    gbRTipoReporte: TRzGroupBox;
    ckbRsimple: TRzCheckBox;
    ckbRdetallado: TRzCheckBox;
    TabVent2Comisiones: TRzTabSheet;
    gbventa: TRzGroupBox;
    RzLabel14: TRzLabel;
    RzLabel24: TRzLabel;
    edpedido1: TRzButtonEdit;
    edpedido2: TRzButtonEdit;
    gbUnidadNegocio: TRzGroupBox;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    cbounidad1: TRzComboBox;
    cbounidad2: TRzComboBox;
    eddias2: TRzNumericEdit;
    gbabogado: TRzGroupBox;
    edabogado: TRzButtonEdit;
    RzLabel27: TRzLabel;
    TabVent2AV: TRzTabSheet;
    gbusuario1: TRzGroupBox;
    edbuscarU: TRzButtonEdit;
    gbanalisisvta: TRzRadioGroup;
    TabCob2Cobranza: TRzTabSheet;
    tsVVV: TRzTabSheet;
    rgcobranza: TRzRadioGroup;
    gbcontrato: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    edbuscarcontrato: TRzButtonEdit;
    TabCentral: TRzTabSheet;
    TabInst2Comi: TRzTabSheet;
    TabCentral2: TRzPageControl;
    RzTabSheet2: TRzTabSheet;
    lbtrafico: TRzURLLabel;
    TabServicios: TRzTabSheet;
    TabServicios2: TRzPageControl;
    TabServicios2Generales: TRzTabSheet;
    TabServicios2Busquedas: TRzTabSheet;
    TabServBusq2: TRzPageControl;
    TabServBusqCuenta: TRzTabSheet;
    RzLabel45: TRzLabel;
    ptiempo2: TRzGroupBox;
    RzLabel46: TRzLabel;
    RzLabel47: TRzLabel;
    TPShasta: TRzDateTimePicker;
    TPSdesde: TRzDateTimePicker;
    TabServBusqTecnicos: TRzTabSheet;
    cbtecnico: TRzComboBox;
    TabServBusqFecha: TRzTabSheet;
    TabServBusqEstatus: TRzTabSheet;
    lbltecnico: TRzLabel;
    cbestatusf: TRzComboBox;
    lbcboestatus: TRzLabel;
    RGSerEst: TRzGroupBox;
    cbestatus: TRzComboBox;
    RzLabel56: TRzLabel;
    RzLabel57: TRzLabel;
    CBClasifS: TRzComboBox;
    RzLabel58: TRzLabel;
    RzLabel59: TRzLabel;
    CBtecnicos2: TRzComboBox;
    ChEstatus: TRzCheckBox;
    ChFecha: TRzCheckBox;
    PSestatus: TRzGroupBox;
    CBSTestatus: TRzComboBox;
    Ltotalc: TRzLabel;
    RzLabel60: TRzLabel;
    RzLabel61: TRzLabel;
    LSestatus: TRzLabel;
    RzLabel62: TRzLabel;
    LSfecha: TRzLabel;
    LStecnico: TRzLabel;
    LScuentas: TRzLabel;
    TabCentral2Nosenales: TRzTabSheet;
    RzLabel49: TRzLabel;
    TPCNoSR: TRzDateTimePicker;
    RzLabel64: TRzLabel;
    LCtotal: TRzLabel;
    RzPanel1: TRzPanel;
    btnbuscar: TRzBitBtn;
    btngenerar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    TabCentral2FalsasAlarmas: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    PCentralFechas: TRzGroupBox;
    RzLabel52: TRzLabel;
    RzLabel63: TRzLabel;
    TPChasta: TRzDateTimePicker;
    TPCdesde: TRzDateTimePicker;
    CBtipoAlarma: TRzComboBox;
    Pcantidad: TRzGroupBox;
    SEalarm: TRzSpinEdit;
    TabCentral2RetardoPatrulleros: TRzTabSheet;
    RzGroupBox9: TRzGroupBox;
    CBpatrullero: TRzComboBox;
    TabCentral2TiempoPatrulleros: TRzTabSheet;
    TabCentral2EmergenciasPorTurno: TRzTabSheet;
    TabCentral2EmergenciasPorTipo: TRzTabSheet;
    TabCentral2Concentrado: TRzTabSheet;
    PConcentrado: TRzGroupBox;
    CBcriterios: TRzComboBox;
    RzLabel65: TRzLabel;
    RzLabel66: TRzLabel;
    RzLabel67: TRzLabel;
    edCcliente: TRzButtonEdit;
    edCnombre: TRzEdit;
    edCtelefono: TRzEdit;
    neanio: TRzEdit;
    TabCentral2ActivacionesDiarias: TRzTabSheet;
    GrangoHoras: TRzGroupBox;
    TPHdesde: TRzDateTimePicker;
    TPHhasta: TRzDateTimePicker;
    RzLabel70: TRzLabel;
    gbturnos: TRzGroupBox;
    rbDiurno: TRzRadioButton;
    rbVespertino: TRzRadioButton;
    rbNocturno: TRzRadioButton;
    cbmotivos: TRzComboBox;
    RzLabel71: TRzLabel;
    rbhoras: TRzRadioButton;
    GFechTodas: TRzGroupBox;
    RBFecTodas: TRzRadioButton;
    RBFecRango: TRzRadioButton;
    edclientes: TRzButtonEdit;
    TabCentral2EmergenciasCliente: TRzTabSheet;
    tsnc: TRzTabSheet;
    RzLabel33: TRzLabel;
    cbgenerar: TRzComboBox;
    TabServicios2TendenciaTec: TRzTabSheet;
    gbTipoBusqueda: TRzRadioGroup;
    edbusqueda: TRzButtonEdit;
    lblbusqueda: TRzLabel;
    RzLabel51: TRzLabel;
    rgTipoMov: TRzRadioGroup;
    cbotipobusconcentrado: TRzComboBox;
    RzLabel53: TRzLabel;
    rgpruebasem: TRzRadioGroup;
    TabCob2CargosA: TRzTabSheet;
    gbcargos: TRzGroupBox;
    RzLabel54: TRzLabel;
    cbocargos: TRzComboBox;
    TabInst2Tende: TRzTabSheet;
    TabVent2Tend2: TRzTabSheet;
    RzGroupBox3: TRzGroupBox;
    chkmes: TRzCheckBox;
    chktotalesventas: TRzCheckBox;
    chktotalescuentas: TRzCheckBox;
    gbtiporepservicios: TRzGroupBox;
    chmesservicio: TRzCheckBox;
    chserviciosyear: TRzCheckBox;
    RzGroupBox7: TRzGroupBox;
    chordenarticulos: TRzComboBox;
    RzGroupBox10: TRzGroupBox;
    chinstalacionesmes: TRzCheckBox;
    chinstalacionano: TRzCheckBox;
    ServRep: TRzTabSheet;
    TabCentral2TraficoResumen: TRzTabSheet;
    pcadmon: TRzTabSheet;
    pcadministracion: TRzPageControl;
    admongral: TRzTabSheet;
    tstravel: TRzTabSheet;
    rcgFuente: TRzCheckGroup;
    rrgSubAsunto: TRzRadioGroup;
    rrgasuntos: TRzRadioGroup;
    rrgdepto: TRzRadioGroup;
    rrgresolucion: TRzRadioGroup;
    rrgauditado: TRzRadioGroup;
    cboestatus: TRzComboBox;
    RzLabel48: TRzLabel;
    TabServBusqProblema: TRzTabSheet;
    RzLabel55: TRzLabel;
    cboproblemaservicio: TRzComboBox;
    lbproblema: TRzLabel;
    RzLabel50: TRzLabel;
    TabVent2CA: TRzTabSheet;
    gbMesAno: TRzGroupBox;
    chmesca: TRzCheckBox;
    chanoca: TRzCheckBox;
    rgbuspor: TRzRadioGroup;
    gbanualesvtastend: TRzGroupBox;
    chvendedores: TRzCheckBox;
    chnovendedores: TRzCheckBox;
    gbcitasAno: TRzGroupBox;
    chcitasequipo: TRzCheckBox;
    chcitasampliacionano: TRzCheckBox;
    chprospectosano: TRzCheckBox;
    chaceptadasano: TRzCheckBox;
    TabCob2PagosClientes: TRzTabSheet;
    lbPedidosPendientesxInstalar: TRzURLLabel;
    chkgfolios: TRzCheckGroup;
    chbdesglosado: TRzCheckBox;
    TabCentral2MotivosRetardo: TRzTabSheet;
    tsbonos: TRzTabSheet;
    TabAdmonDesempeno: TRzTabSheet;
    RGAreas: TRzGroupBox;
    cbarea: TRzComboBox;
    RzGroupBox11: TRzGroupBox;
    cboEstatusArt: TRzComboBox;
    lbctasctrl: TRzURLLabel;
    TSCentral2Boletin: TRzTabSheet;
    DGGeneral: TDBGrid;
    TSCentral2EventosPos: TRzTabSheet;
    RGMotivo: TRzCheckGroup;
    chkSinCuentasReporte: TRzCheckBox;
    chkcelulares: TRzCheckBox;
    TabCob2Morosos: TRzTabSheet;
    TabAdmAuditoria: TRzTabSheet;
    chbTipoReporte: TRzComboBox;
    RzLabel69: TRzLabel;
    TabCompras: TRzTabSheet;
    rgproveedor: TRzGroupBox;
    cboproveedores: TRzComboBox;
    TabCentral2EnvioColonias: TRzTabSheet;
    rgEventosPositivos: TRzRadioGroup;
    rgperiodo: TRzRadioGroup;
    lbcatcol: TRzURLLabel;
    TabSinActividad: TRzTabSheet;
    chkDesAplicar: TRzCheckBox;
    chkSinEnlace: TRzCheckBox;
    RzGroupBox14: TRzGroupBox;
    edDiasVenceCargo: TRzNumericEdit;
    TabCobInsPend: TRzTabSheet;
    TabVent2ErrorVta: TRzTabSheet;
    TabCentral2ResumenPositivos: TRzTabSheet;
    rgResPos: TRzRadioGroup;
    gbano: TRzGroupBox;
    edano: TRzEdit;
    TabCobSecXVencer: TRzTabSheet;
    rgcomisionv: TRzRadioGroup;
    tsCentral2Centraleros: TRzTabSheet;
    rgRepCentraleros: TRzRadioGroup;
    larticulosActivos: TRzURLLabel;
    tslog: TRzTabSheet;
    rgusuario: TRzGroupBox;
    eduser: TRzButtonEdit;
    rgTrafImp: TRzRadioGroup;
    rgTrafCol: TRzRadioGroup;
    llistadeprecios: TRzURLLabel;
    TSCobCSI: TRzTabSheet;
    TabVent2TotMn: TRzTabSheet;
    RzURLLabel4: TRzURLLabel;
    ckCierreComisiones: TRzCheckBox;
    TabCobMarcacion: TRzTabSheet;
    cboAntXLineaTipo: TRzComboBox;
    RzLabel72: TRzLabel;
    TabVent2Monitoreo: TRzTabSheet;
    tabclientes2: TRzPageControl;
    TabClientes2Catalagos: TRzTabSheet;
    RzURLLabel9: TRzURLLabel;
    linea: TRzSeparator;
    RzURLLabel2: TRzURLLabel;
    RzURLLabel3: TRzURLLabel;
    TabClientes2EC: TRzTabSheet;
    lbcuenta: TRzLabel;
    lborden: TRzLabel;
    RzLabel15: TRzLabel;
    lnombre: TRzLabel;
    ldir: TRzLabel;
    RzLabel16: TRzLabel;
    lsector: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    edbuscar: TRzButtonEdit;
    notapago: TRzMemo;
    notaobservaciones: TRzMemo;
    nota1: TRzMemo;
    nota2: TRzMemo;
    nota3: TRzMemo;
    nota4: TRzMemo;
    TabClientes2TC: TRzTabSheet;
    gb: TRzGroupBox;
    rbventa: TRzRadioButton;
    rbfecha: TRzRadioButton;
    TabClientes2ECLote: TRzTabSheet;
    RzLabel30: TRzLabel;
    lbimprimir: TRzLabel;
    gbcolonia: TRzGroupBox;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    chkcolonias: TRzCheckBox;
    cbocolonia1: TRzComboBox;
    cbocolonia2: TRzComboBox;
    rgservicio: TRadioGroup;
    TabClientes2status: TRzTabSheet;
    LTotal: TRzLabel;
    RCount: TRzLabel;
    Pestatus: TRzGroupBox;
    RBSTactivo: TRzRadioButton;
    RBSTInactivo: TRzRadioButton;
    RBSTTodos: TRzRadioButton;
    Pimprimir: TRzGroupBox;
    RBSTDetallado: TRzRadioButton;
    RBSTNodetallado: TRzRadioButton;
    GRGeneral: TcxGrid;
    GRView: TcxGridDBTableView;
    GRLevel: TcxGridLevel;
    Pcuenta: TRzGroupBox;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    EDdesde: TRzEdit;
    EDhasta: TRzEdit;
    TabClientes2Bloq: TRzTabSheet;
    gbfechas: TRzGroupBox;
    RzLdesde: TRzLabel;
    RzLhasta: TRzLabel;
    tpdesde: TRzDateTimePicker;
    tphasta: TRzDateTimePicker;
    RzGroupBox2: TRzGroupBox;
    RBtodos: TRzRadioButton;
    RBrango: TRzRadioButton;
    RzGroupBox8: TRzGroupBox;
    RzLabel35: TRzLabel;
    RzLabel44: TRzLabel;
    edbdesde: TRzEdit;
    edbhasta: TRzEdit;
    TabClientes2RelCliCta: TRzTabSheet;
    gbRelCtaCte: TRzGroupBox;
    RzLNombre: TRzLabel;
    EDnombre: TRzEdit;
    TabClientes2Resumen: TRzTabSheet;
    RzGroupBox4: TRzGroupBox;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzLabel42: TRzLabel;
    LClientes: TRzLabel;
    RzLabel34: TRzLabel;
    CBColonia: TRzComboBox;
    CBAlarma: TRzComboBox;
    CBgiro: TRzComboBox;
    CBSector: TRzComboBox;
    CBTcuenta: TRzComboBox;
    CboCategorias: TRzComboBox;
    GRsector: TcxGrid;
    GRsectorDBTableView1: TcxGridDBTableView;
    GRsectorDBTableView1DBColumn1: TcxGridDBColumn;
    GRsectorDBTableView1DBColumn2: TcxGridDBColumn;
    GRsectorLevel1: TcxGridLevel;
    GRTAlarma: TcxGrid;
    GRTAlarmaDBTableView1: TcxGridDBTableView;
    GRTAlarmaDBTableView1DBColumn1: TcxGridDBColumn;
    GRTAlarmaDBTableView1DBColumn2: TcxGridDBColumn;
    GRTAlarmaLevel1: TcxGridLevel;
    GRgiro: TcxGrid;
    GRgiroDBTableView1: TcxGridDBTableView;
    GRgiroDBTableView1DBColumn1: TcxGridDBColumn;
    GRgiroDBTableView1DBColumn2: TcxGridDBColumn;
    GRgiroLevel1: TcxGridLevel;
    GRColonia: TcxGrid;
    GRColoniaDBTableView1: TcxGridDBTableView;
    GRColoniaDBTableView1DBColumn1: TcxGridDBColumn;
    GRColoniaDBTableView1DBColumn2: TcxGridDBColumn;
    GRColoniaLevel1: TcxGridLevel;
    RzGroupBox5: TRzGroupBox;
    RBresumen: TRzRadioButton;
    RBresumendet: TRzRadioButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxCategoria: TcxGridDBColumn;
    cxTotCat: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TabClientes2Polizas: TRzTabSheet;
    RzGroupBox6: TRzGroupBox;
    RBPolxCta: TRzRadioButton;
    RBpolTodos: TRzRadioButton;
    rgcuenta: TRzGroupBox;
    edcuentap: TRzButtonEdit;
    TSocoxxos: TRzTabSheet;
    TabClientes2SinAsignacion: TRzTabSheet;
    RzGroupBox13: TRzGroupBox;
    CBtipoAsig: TRzComboBox;
    Tabclientes2Protocolos: TRzTabSheet;
    RGProtocolos: TRzRadioGroup;
    RGOrdenarpor: TRzGroupBox;
    cbOrdCli: TRzComboBox;
    Tabclientes2Libres: TRzTabSheet;
    tabclientes2Travels: TRzTabSheet;
    tabclientes2Modificaciones: TRzTabSheet;
    RGCliCamb: TRzRadioGroup;
    tsNoUbicados: TRzTabSheet;
    Tabclientes2TipoEnvio: TRzTabSheet;
    RGTipoEnvio: TRzRadioGroup;
    TabProtDif: TRzTabSheet;
    tabclientes2Anualidades: TRzTabSheet;
    RzLabel41: TRzLabel;
    gbanos: TRzGroupBox;
    RzLabel43: TRzLabel;
    RzLabel68: TRzLabel;
    edanodesde: TRzEdit;
    edanohasta: TRzEdit;
    tabclientes2GastosMayores: TRzTabSheet;
    RzGroupBox12: TRzGroupBox;
    edcantidad: TRzEdit;
    RzURLLabel5: TRzURLLabel;
    RzURLLabel6: TRzURLLabel;
    TabCob2PagosMoni: TRzTabSheet;
    TabVent2FactSPago: TRzTabSheet;
    lbestadisticaserv: TRzURLLabel;
    lbpromediopat: TRzURLLabel;
    TabVent2ArtXper: TRzTabSheet;
    RzURLLabel7: TRzURLLabel;
    RzURLLabel8: TRzURLLabel;
    rginventario: TRzRadioGroup;
    lbartactinv: TRzURLLabel;
    lzonasdefault: TRzURLLabel;
    rgmotcancel: TRzRadioGroup;
    rgpuesto: TRzRadioGroup;
    chksms: TRzCheckBox;
    ckanualidad: TRzCheckBox;

    procedure lbcategoriasClick(Sender: TObject);
    procedure lbcategoriasMouseLeave(Sender: TObject);
    procedure lbcategoriasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbestatusClick(Sender: TObject);
    procedure lbfuentesClick(Sender: TObject);
    procedure lbgirosClick(Sender: TObject);
    procedure lborigenesClick(Sender: TObject);
    procedure lbtiposClick(Sender: TObject);
    procedure lbtiposactClick(Sender: TObject);
    procedure lbtiposoportuClick(Sender: TObject);
    procedure lbestatusMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbfuentesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbgirosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lborigenesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbtiposMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbtiposactMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbtiposoportuMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure lbestatusMouseLeave(Sender: TObject);
    procedure lbfuentesMouseLeave(Sender: TObject);
    procedure lbgirosMouseLeave(Sender: TObject);
    procedure lborigenesMouseLeave(Sender: TObject);
    procedure lbtiposMouseLeave(Sender: TObject);
    procedure lbtiposactMouseLeave(Sender: TObject);
    procedure lbtiposoportuMouseLeave(Sender: TObject);
    procedure lbinvetariosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbinvetariosMouseLeave(Sender: TObject);
    procedure lbinvetariosClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure TabCob2TabClick(Sender: TObject);
    procedure btngenerarClick(Sender: TObject);
    procedure eddias1KeyPress(Sender: TObject; var Key: Char);
    procedure cbosector2KeyPress(Sender: TObject; var Key: Char);
    procedure TabInv2TabClick(Sender: TObject);
    procedure TabPrincipalTabClick(Sender: TObject);
    procedure dfecha2KeyPress(Sender: TObject; var Key: Char);
    procedure cbolineas2KePress(Sender: TObject; var Key: Char);
    procedure eddias2KeyPress(Sender: TObject; var Key: Char);
    procedure ckbbloqueadosKeyPress(Sender: TObject; var Key: Char);
    procedure cbomovimientosKeyPress(Sender: TObject; var Key: Char);
    procedure btnreporteadorClick(Sender: TObject);
    procedure chkbcanceladosKeyPress(Sender: TObject; var Key: Char);
    procedure ckbabogadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbolineas1NotInList(Sender: TObject);
    procedure cbolineas2NotInList(Sender: TObject);
    procedure cbosector1NotInList(Sender: TObject);
    procedure cbosector2NotInList(Sender: TObject);
    procedure cbomovimientosNotInList(Sender: TObject);
    procedure TabVent2TabClick(Sender: TObject);
    procedure cboanoKeyPress(Sender: TObject; var Key: Char);
    procedure tabclientes2TabClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure nota4Exit(Sender: TObject);
    procedure edusuario1ButtonClick(Sender: TObject);
    procedure edusuario2ButtonClick(Sender: TObject);
    procedure edusuario1KeyPress(Sender: TObject; var Key: Char);
    procedure edusuario2KeyPress(Sender: TObject; var Key: Char);
    procedure dUnafechaKeyPress(Sender: TObject; var Key: Char);
    procedure TabInst2TabClick(Sender: TObject);
    procedure ckbRdetalladoKeyPress(Sender: TObject; var Key: Char);
    procedure ckbRsimpleClick(Sender: TObject);
    procedure ckbRdetalladoClick(Sender: TObject);
    procedure edpedido1KeyPress(Sender: TObject; var Key: Char);
    procedure edpedido2KeyPress(Sender: TObject; var Key: Char);
    procedure edpedido2Exit(Sender: TObject);
    procedure edpedido1ButtonClick(Sender: TObject);
    procedure edpedido2ButtonClick(Sender: TObject);
    procedure ckbabogadoClick(Sender: TObject);
    procedure edabogadoButtonClick(Sender: TObject);
    procedure cbocolonia1NotInList(Sender: TObject);
    procedure cbocolonia2NotInList(Sender: TObject);
    procedure edbuscarcontratoButtonClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure lbtraficoMouseLeave(Sender: TObject);
    procedure lbtraficoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lbtraficoClick(Sender: TObject);
    procedure edbuscarUButtonClick(Sender: TObject);
    procedure edbuscarUKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarcontratoKeyPress(Sender: TObject; var Key: Char);
    procedure EDdesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EDhastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnbuscarClick(Sender: TObject);
    procedure EDdesdeChange(Sender: TObject);
    procedure EDhastaChange(Sender: TObject);
    procedure sqlgeneralAfterClose(DataSet: TDataSet);
    procedure sqlgeneralAfterOpen(DataSet: TDataSet);
    procedure RBPolxCtaClick(Sender: TObject);
    procedure RBpolTodosClick(Sender: TObject);
    procedure EdcuentapKeyPress(Sender: TObject; var Key: Char);
    procedure CBTcuentaNotInList(Sender: TObject);
    procedure CBSectorNotInList(Sender: TObject);
    procedure CBgiroNotInList(Sender: TObject);
    procedure CBAlarmaNotInList(Sender: TObject);
    procedure CBColoniaNotInList(Sender: TObject);
    procedure edcuentapButtonClick(Sender: TObject);
    procedure tpdesdeKeyPress(Sender: TObject; var Key: Char);
    procedure tphastaKeyPress(Sender: TObject; var Key: Char);
    procedure EDnombreKeyPress(Sender: TObject; var Key: Char);
    procedure CBTcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure CBSectorKeyPress(Sender: TObject; var Key: Char);
    procedure CBgiroKeyPress(Sender: TObject; var Key: Char);
    procedure CBAlarmaKeyPress(Sender: TObject; var Key: Char);
    procedure CBColoniaKeyPress(Sender: TObject; var Key: Char);
    procedure RBresumendetKeyPress(Sender: TObject; var Key: Char);
    procedure RBresumenKeyPress(Sender: TObject; var Key: Char);
    procedure RBSTDetalladoKeyPress(Sender: TObject; var Key: Char);
    procedure RBSTNodetalladoKeyPress(Sender: TObject; var Key: Char);
    procedure RBSTTodosClick(Sender: TObject);
    procedure RBpolTodosKeyPress(Sender: TObject; var Key: Char);
    procedure RBPolxCtaKeyPress(Sender: TObject; var Key: Char);
    procedure RBtodosKeyPress(Sender: TObject; var Key: Char);
    procedure RBrangoKeyPress(Sender: TObject; var Key: Char);
    procedure TabServicios2TabClick(Sender: TObject);
    procedure edbdesdeClick(Sender: TObject);
    procedure RBSRfechasClick(Sender: TObject);
    procedure RBStodosClick(Sender: TObject);
    procedure TabServBusq2TabClick(Sender: TObject);
    procedure CBSTestatusNotInList(Sender: TObject);
    procedure RBFecTodasClick(Sender: TObject);
    procedure RBFecRangoClick(Sender: TObject);
    procedure ChEstatusClick(Sender: TObject);
    procedure ChFechaClick(Sender: TObject);
    procedure cbestatusNotInList(Sender: TObject);
    procedure CBClasifSNotInList(Sender: TObject);
    procedure CBtecnicos2NotInList(Sender: TObject);
    procedure cbestatusfNotInList(Sender: TObject);
    procedure edscuentaKeyPress(Sender: TObject; var Key: Char);
    procedure ChEstatusKeyPress(Sender: TObject; var Key: Char);
    procedure ChFechaKeyPress(Sender: TObject; var Key: Char);
    procedure cbtecnicoKeyPress(Sender: TObject; var Key: Char);
    procedure CBSTestatusKeyPress(Sender: TObject; var Key: Char);
    procedure TPSdesdeKeyPress(Sender: TObject; var Key: Char);
    procedure TPShastaKeyPress(Sender: TObject; var Key: Char);
    procedure cbestatusfKeyPress(Sender: TObject; var Key: Char);
    procedure cbestatusKeyPress(Sender: TObject; var Key: Char);
    procedure RBFecTodasKeyPress(Sender: TObject; var Key: Char);
    procedure RBFecRangoKeyPress(Sender: TObject; var Key: Char);
    procedure CBClasifSKeyPress(Sender: TObject; var Key: Char);
    procedure edclientesKeyPress(Sender: TObject; var Key: Char);
    procedure CBtecnicos2KeyPress(Sender: TObject; var Key: Char);
    procedure RBSTactivoKeyPress(Sender: TObject; var Key: Char);
    procedure RBSTInactivoKeyPress(Sender: TObject; var Key: Char);
    procedure RBSTTodosKeyPress(Sender: TObject; var Key: Char);
    procedure edscuentaChange(Sender: TObject);
    procedure TPCNoSRKeyPress(Sender: TObject; var Key: Char);
    procedure RBtodosClick(Sender: TObject);
    procedure RBrangoClick(Sender: TObject);
    procedure edbdesdeKeyPress(Sender: TObject; var Key: Char);
    procedure TabCentral2TabClick(Sender: TObject);
    procedure CBtipoAsigKeyPress(Sender: TObject; var Key: Char);
    procedure CBtipoAsigNotInList(Sender: TObject);
    procedure CBtipoAlarmaKeyPress(Sender: TObject; var Key: Char);
    procedure SEalarmKeyPress(Sender: TObject; var Key: Char);
    procedure CBpatrulleroKeyPress(Sender: TObject; var Key: Char);
    procedure CBtipoAlarmaNotInList(Sender: TObject);
    procedure edCclienteButtonClick(Sender: TObject);
    procedure neanioKeyPress(Sender: TObject; var Key: Char);
    procedure CBcriteriosKeyPress(Sender: TObject; var Key: Char);
    procedure edCclienteKeyPress(Sender: TObject; var Key: Char);
    procedure edCclienteChange(Sender: TObject);
    procedure GRViewDblClick(Sender: TObject);
    procedure rbDiurnoClick(Sender: TObject);
    procedure rbVespertinoClick(Sender: TObject);
    procedure rbNocturnoClick(Sender: TObject);
    procedure rbhorasClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edabogadoKeyPress(Sender: TObject; var Key: Char);
    procedure gbTipoBusquedaChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure edbusquedaButtonClick(Sender: TObject);
    procedure edbusquedaChange(Sender: TObject);
    procedure rgTipoMovChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure edbusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure edCnombreKeyPress(Sender: TObject; var Key: Char);
    procedure cbotipobusconcentradoNotInList(Sender: TObject);
    procedure chkmesClick(Sender: TObject);
    procedure chktotalesventasClick(Sender: TObject);
    procedure chktotalescuentasClick(Sender: TObject);
    procedure chserviciosyearClick(Sender: TObject);
    procedure chmesservicioClick(Sender: TObject);
    procedure chinstalacionesmesClick(Sender: TObject);
    procedure chinstalacionanoClick(Sender: TObject);
    procedure pcadministracionTabClick(Sender: TObject);
    procedure rrgdeptoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure rrgasuntosChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure rrgSubAsuntoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure rrgresolucionChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure cboestatusSelect(Sender: TObject);
    procedure cbtecnicoClick(Sender: TObject);
    procedure rcgFuenteChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure cbOrdCliKeyPress(Sender: TObject; var Key: Char);
    procedure rgbusporClick(Sender: TObject);
    procedure chcitasequipoClick(Sender: TObject);
    procedure chcitasampliacionanoClick(Sender: TObject);
    procedure chprospectosanoClick(Sender: TObject);
    procedure chaceptadasanoClick(Sender: TObject);
    procedure chanocaClick(Sender: TObject);
    procedure chmescaClick(Sender: TObject);
    procedure lbPedidosPendientesxInstalarMouseLeave(Sender: TObject);
    procedure lbPedidosPendientesxInstalarMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure lbPedidosPendientesxInstalarClick(Sender: TObject);
    procedure chkgfoliosChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure cbomovimientosSelect(Sender: TObject);
    procedure chbdesglosadoClick(Sender: TObject);
    procedure edpedidopendKeyPress(Sender: TObject; var Key: Char);
    procedure RzURLLabel2Click(Sender: TObject);
    procedure cbgenerarSelect(Sender: TObject);
    procedure RBSTDetalladoClick(Sender: TObject);
    procedure RBSTNodetalladoClick(Sender: TObject);
    procedure RzURLLabel3Click(Sender: TObject);
    procedure lbctasctrlClick(Sender: TObject);
    procedure lbctasctrlMouseLeave(Sender: TObject);
    procedure lbctasctrlMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cbOrdCliNotInList(Sender: TObject);
    procedure GRViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edanodesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edanohastaKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    //procedure lbinstpendClick(Sender: TObject);
    procedure lbcatcolMouseLeave(Sender: TObject);
    procedure lbcatcolMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edanoKeyPress(Sender: TObject; var Key: Char);
    procedure larticulosActivosClick(Sender: TObject);
    procedure lbcatcolClick(Sender: TObject);
    procedure llistadepreciosClick(Sender: TObject);
    procedure RzURLLabel4Click(Sender: TObject);
    procedure ckCierreComisionesClick(Sender: TObject);
    procedure cboAntXLineaTipoNotInList(Sender: TObject);
    procedure RzURLLabel5Click(Sender: TObject);
    procedure RzURLLabel6Click(Sender: TObject);
    procedure lbestadisticaservClick(Sender: TObject);
    procedure lbestadisticaservMouseLeave(Sender: TObject);
    procedure lbestadisticaservMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure lbpromediopatClick(Sender: TObject);
    procedure lbpromediopatMouseLeave(Sender: TObject);
    procedure lbpromediopatMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure RzURLLabel8Click(Sender: TObject);
    procedure lbartactinvClick(Sender: TObject);
    procedure lzonasdefaultClick(Sender: TObject);
    procedure rgpuestoClick(Sender: TObject);
    procedure chksmsClick(Sender: TObject);
   private
    { Private declarations }
    procedure ClientesNoUbicados(Reportear: integer);
    procedure Reportes;
    procedure NotasCredito;
    procedure OpenCloseOxxos;
    procedure VerifVentVend;
    procedure AjusteInventario(sender:tobject;cta,nombre:string;reporte:integer);
    procedure BuscarCuenta;
    procedure BuscarEstCuenta;
    procedure buscarsectorID;
    procedure Antiguedadxlinea;
    procedure inventarioxfecha;
    procedure actualizar(fecha1,fecha2,campo:string);
    procedure SectoresVencidos;
    procedure cargarsectores;
    //procedure cancelados;
    procedure EstadoCuenta;
    procedure TarjetaCliente;
    procedure Pagosxlinea;
    procedure BuscarUsuario(u:integer);
    procedure CargarLineas;
    procedure CobrosCaja;
    procedure FacturasCanceladas;
    procedure ComisionesInstalador;
    procedure DiarioVentas;
    procedure ComisionesVendedor;
    procedure VentasMensuales;
    procedure BuscarPedido(p:integer);
    procedure CargarUnidadNeg;
    procedure buscarUnidadID;
    procedure EstadoCuentaXLotes;
    procedure CargarColonias;
    procedure AnalisisVentas;
    procedure Cobranza;
    procedure Clistatus;
    procedure ClientesCuenta;
    procedure ClientesBloqueado;
    procedure llenacombos;
    procedure ClientesResumen;
    procedure Clientespolizas;
    procedure BuscarServicio;
    procedure combosestatus(const combo:trzcombobox;Sender :TObject);
    procedure llenatecnicos(const combo:trzcombobox;Sender :TObject);
    procedure Servicios;
    procedure buscarsenalesnorec;
    procedure SenalesNoRec;
    procedure FalsasAlarmas;
    procedure deshabilitaboton(pagina:TRzPageControl;indice:Integer;boton:TRzBitBtn);//deshabilita el btngenerar en los tabindex 0
    procedure LlenaTipoAsig;
    procedure buscarSinasignacion;
    procedure SinAsignacion;
    procedure buscarRetardoPatrullero;
    procedure RetardoPatrullero;
    procedure buscarTiempoPatrulleros;
    procedure TiempoPatrulleros;
    procedure buscarEmergenciasPorTurno;
    procedure EmergenciasPorTipo;
    procedure buscarConcentradoAlarmas;
    procedure ConcentradoAlarmas;
    procedure datosclicentral;
    procedure ActivacionesDiarias;
    procedure buscarEmergenciasCliente;
    procedure EmergenciasCliente;
    procedure buscarClienteProtocolos;
    procedure ClienteProtocolos;
    procedure CuentasLibres;
    procedure buscartendenciatec;
    procedure Tendenciatec;
    procedure TravelCliente;
    procedure CargosAutomaticos;
    procedure TendenciaTecnicos;
    procedure TendenciaVendedoresTot;
    procedure ClientesModificaciones;
    procedure ServiciosRepetidos;
    procedure TraficoResumen;
    procedure Travelers;
    procedure CitasAsignadas;
    procedure AbonosXCuenta;
    procedure PendientesXInstalarXArt;
    procedure TipoImprecionProcedure;
    procedure BuscarMotivoRetardo;
    procedure BonoPatrulleros;
    procedure BuscarDesempeno;
    procedure buscarTipoEnvio;
    procedure Boletin;
    procedure EventosPositivos(dfecha1,dfecha2:string);
    procedure OxxosAPAA(dfecha1,dfecha2, activacion:string);
    procedure ProtocolosDiferentes(tipo:integer);
    procedure morososprimeravez;
    procedure AnualidadAnterior;
    procedure GastosMayores;
    procedure compras;
    procedure EnvTrafCol;
    procedure PorAtender;
    procedure AnualCobranza;
    procedure AnualCobranzaSaldos;
    procedure ClientesSinActividad;
    procedure ComisionesVendedores;
    procedure TiemposExtras;
    procedure InstPendFact;
    procedure ErrorVentas;
    procedure ResumenPositivos;
    procedure EmergenciasPorTurno;
    procedure buscarEmergenciasPorTipo;
    procedure SectoresXVencer;
    procedure CitasAsignadasFuncion(fecha1,fecha2,origen,tipo,m:string;where:integer);
    procedure CitasAsignadasTotalesAceptadas(fecha1,fecha2,origen,tipo:string;where:integer);
    procedure CitasAsignadasInsertaRegistros(tipo,nivel,m:string);
    procedure CentralerosTickets;
    procedure Bitacora;
    procedure MovimientosCSI;
    procedure VentasDllsXOrigen;
    procedure ReporteMarcacionCobranza;
    procedure VentasFacturadas_Monitoreo;
    procedure ResistenciaFinLinea(condicion:string);
    procedure FacturasSinPago;
    procedure ComisionesVendedorCasa;
    procedure ComisionesVendedoresCasa;

  public
    { Public declarations }
     TipoImpresion, fecha,sector1,sector2,linea1,linea2,UN1,UN2,idcontacto,cadena:string;
     temp:double;
     MemoAdjuntos:TMemo;
     procedure inventarioxfecha2(f1, f2, tabla, estatus:string);
  end;

var
  frmmoduloreportes: Tfrmmoduloreportes;

implementation

uses Udmrep, Urecursos, Uprincipal, Udm, Ubusquedas, Umensaje, Ureports,
  UEnviarCorreo, Urepdetalle, ARExcelUtils, Ureportes,
  Ureporteestadisticas, WS_Infomensaje;


{$R *.dfm}

procedure Tfrmmoduloreportes.FacturasSinPago;
begin
querys('select p.TotMn, p.FechaFactura, "'+'Desde '+ dfecha1.text+ ' hasta '+dfecha2.Text +'" as periodo, p.idcliente, cf.NombreCres, '+
       'u.nombre as Unidad, p.idfactura,p.idpedido,(select sum(pc.abono) from PagosClientes  as pc  where pc.idpedido= p.idpedido) as pagos '+
       'from pedidos as p left join UnidadNegocio as u on u.idUnidadNegocio=p.idUnidadNegocio '+
       'left join clientes as c on c.idcliente = p.idcliente left join ClientesFact as cf on cf.idfact = c.idfact '+
       'where p.FechaFactura between "'+dfecha1.text+'" and "'+dfecha2.Text+'" and p.estatus in(4,6) and p.TotMn > 0 '+
       'having  pagos = 0 ',0,dmreportes.sqlgeneral2);

if dmreportes.sqlgeneral2.recordcount > 0 then
  OperacionReporte('FacturasSinPagos','Reporte de Facturas sin Pago',TipoImpresion, 1)
else
  Application.MessageBox('No hay datos en ese rango!','Atencion',MB_OK);
end;

procedure Tfrmmoduloreportes.VentasFacturadas_Monitoreo;
begin
  querys('select distinct "'+'Del '+ dfecha1.Text +' al '+ dfecha2.Text +'" as periodo, p.FechaFactura as Fecha, '+
         'sum(if(l.nombre="MONITOREO", if(dp.cant > 0,(dp.cant*dp.costo)*dp.tc,(dp.piezas*dp.costo)*dp.tc),0)) AS MONITOREO, '+
         'sum( if(l.nombre="SERVICIO", if(dp.cant > 0,(dp.cant*dp.costo)*dp.tc,(dp.piezas*dp.costo)*dp.tc),0)) AS SERVICIOS '+
         'from DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) LEFT JOIN articulos as a ON (a.cod_cve=dp.cod_cve) '+
         'LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) '+
         'WHERE p.FechaFactura between "'+dfecha1.Text+'" and "'+dfecha2.text+'" and p.estatus = 4 '+
         'AND l.nombre in("MONITOREO","SERVICIO") group by p.FechaFactura',0,dmreportes.sqlgeneral2);

  if(dmreportes.sqlgeneral2.RecordCount >0) then
     OperacionReporte('TotalesMonitoreoXDia','Reporte de Totales monitoreo x dia ('+datetostr(now)+')',TipoImpresion, 1)
  else
     Application.MessageBox('No hay datos a mostrar!','Aviso',mb_ok);
end;

procedure Tfrmmoduloreportes.ReporteMarcacionCobranza;
var periodo:string;
begin
if(edbuscarU.Text <> '') then
 begin
     periodo :=  'mc.fecha between "'+dfecha1.Text+'" and "'+dfecha2.Text+'" and u.codigo ="'+edbuscarU.Text+'" ';
     querys('Select (select distinct count(idcliente)  from MarcacionCobranza as mc LEFT JOIN usuarios as u ON(u.idusuario=mc.idusuario) where '+periodo+') as TotalClientes ,("'+'Periodo : '+dfecha1.Text+' al '+dfecha2.Text+'") as periodo ',0,dmreportes.sqlgeneral3);
     querys('select sector,mc.idcliente,contesto,SeComunico,if(contesto =1,"S","N") AS RESPONDIO,if(SeComunico=1,"S","N") AS COMUNICOCLIENTE,'+UsuarioNombre('u')+' as usuario,cf.NombreCres  from MarcacionCobranza as mc LEFT JOIN clientes as c on(c.idcliente=mc.idcliente) LEFT JOIN usuarios as u ON(u.idusuario=mc.idusuario) LEFT JOIN ClientesFact as cf on(cf.idfact = c.idfact) where '+periodo+' order by mc.fecha',0,dmreportes.sqlgeneral2);
     if(dmreportes.sqlgeneral2.RecordCount >0) then
       OperacionReporte('MarcacionCobranza','Reporte de Marcacion de Cobranza ('+datetostr(now)+')',TipoImpresion, 1)
     else
     Application.MessageBox('No hay datos a mostrar!','Aviso',mb_ok);

 end else
  begin
     Application.MessageBox('Falta el codigo del usuario','Atención',mb_ok);
     edbuscarU.SetFocus;
  end;
end;

procedure Tfrmmoduloreportes.SectoresXVencer;
var cadena,fecha1,fecha2,servicio,user,passwd,msn,telefono:string;
    resultadosms:Boolean; f,activo:Integer;
    clientessms:Array of Array of string;
begin
  Screen.Cursor := crHourglass;
  fecha1:='';
  fecha2:='';
  //elimina tablas temporales
  querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (idcliente integer(11),saldo float default 0, '+
         'condicion1 float default 0,condicion2 float default 0,condicion3 float default 0,'+
         'condicion4 float default 0,dias integer(11),tipo varchar(15),EstatusInstalacion varchar(50),nombre varchar(254), '+
         'contrato varchar(100),KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);

  //trae los nombres de los sectores
  buscarsectorID;
  fecha1:=datetostr(now+eddias1.Value);
  fecha2:=datetostr(now+eddias2.Value);
  buscarUnidadID;

  if ckbabogado.Checked = true then
  begin
    if edabogado.Text <> '' then
    begin
      cadena:='';
      cadena:=' create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta,pc.restante,pc.FechaVence FROM PagosClientes as pc '+
            ' left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) LEFT JOIN sectores as s ON (s.idsector=c.sector) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) WHERE pc.FechaVence '+
            ' BETWEEN  '+''''+fecha1+''' AND '+''''+fecha2+''' and p.estatus in(3,4,6) AND restante > 0.9 and pc.movimiento IN(0,1) '+
            ' and c.sector between '+sector1+' and '+sector2+' '+
            ' AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+'  and (c.idabogado = '+quotedstr(edabogado.Text)+')';
    end
    else
    begin
      application.MessageBox('Falta el abogado','Atención',mb_iconwarning);
      edabogado.SetFocus;
      exit;
   end;
  end
  else
  begin
    cadena:='';
    cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta,pc.restante ,pc.FechaVence FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c '+
          ' ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont)  LEFT JOIN sectores as s ON (s.idsector=c.sector) WHERE pc.FechaVence  BETWEEN  '+''''+fecha1+''' AND '+''''+fecha2+''' and p.estatus in(3,4,6) AND restante > 0.9 and pc.movimiento IN(0,1) '+
          ' and c.sector between '+sector1+' and  '+sector2+' AND p.idUnidadNegocio between '+''''+UN1+''' and '+''''+UN2+'''   '  ;

    if ckbbloqueados.Checked = false then
      cadena:=cadena+' and c.bloqueado = 0 '
    else
      cadena:=cadena+' and c.bloqueado in(0,1) ';
    if (ckbnormales.Checked) and (ckbforzosos.Checked) then  //para activos
      cadena := cadena + ' and con.estatus in (0,1)  '
    else
    begin
      if ((ckbforzosos.Checked) and (chkSinEnlace.Checked = false)) then //para inactivos
       cadena := cadena + ' and (con.estatus = 0 and not c.TipoCont = ''SEN'') '
      else
        if (ckbforzosos.Checked) then
            cadena := cadena + ' and con.estatus = 0';
        if ((ckbnormales.Checked) and (chkSinEnlace.Checked = true)) then
            cadena := cadena + ' and (con.estatus = 1 or c.TipoCont =''SEN'') and c.idabogado = 0 '
        else
            cadena := cadena + ' and con.estatus = 1 and c.idabogado = 0 ';
    end;
  end;

  if (chkSinCuentasReporte.checked = true) then
    cadena:=cadena+' and NoReporte=0';

  cadena:=cadena+' GROUP BY pc.idpago';
  querys(cadena,1,dmaccesos.sqlgeneral);
  querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
  querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);

  ///*borrar cuentas que tienen parcialidades
  with dmreportes do
  begin
    querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);
    querys(' INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+' Select t.cuenta,round(Sum(restante),2) AS saldo, if (to_days(FechaVence)-to_days("'+datetostr(date)+'") <=30, round(Sum(restante),2), 0) as condicion1, if (to_days(FechaVence)-to_days("'+datetostr(date)+'")>30 and '+
       ' to_days(FechaVence)-to_days("'+datetostr(date)+'") <=60, round(Sum(restante),2) , 0) as condicion2, if(to_days(FechaVence)-to_days("'+datetostr(date)+'") >60 and to_days(FechaVence)-to_days("'+datetostr(date)+'")<=90, round(Sum(restante),2),0) as condicion3, '+
       ' if (to_days(FechaVence)-to_days("'+datetostr(date)+'") >90, round(Sum(restante),2) , 0) as condicion4, to_days(FechaVence)-to_days("'+datetostr(date)+'") as dias,if (c.bloqueado=0,"N","B") as tipo, if (i.EstatusInst=0,"PENDI",'+
       ' if(i.EstatusInst =1,"INSTA",if(i.EstatusInst=2,"SUPER",if(i.EstatusInst=4,"UBICA",if(i.EstatusInst=5,"CUESTI",if(i.EstatusInst=7,"CANCE","")))))) AS EstatusInstalacion,  cf.NombreCres,con.nombre  '+
       ' from temporal_sectorvence0'+frmprincipal.idmaq+' as t left join clientes as c on(c.idcliente=t.cuenta) left join contratos as con on(con.TipoCont=c.TipoCont) left join instalaciones as i on(t.idpedido=i.idpedido) '+
       ' left join ClientesFact as cf on(cf.idfact=c.idfact)  group by idpago',1,sqlgeneral);
    cadena:='Del Sector '+cbosector1.Text +' al '+cbosector2.Text;
    querys('Select "'+fecha1+'" as titulo1,"'+fecha2+'" as titulo2,"Del Sector '+cbosector1.Text +' al'+ cbosector2.Text+
           '" as titulo3,''SECTORES X VENCER'' as encabezado, idcliente, contrato, dias, EstatusInstalacion,tipo, nombre, sum(saldo) as saldo, sum(condicion1) as condicion1, sum(condicion2) as condicion2,'+
           ' sum(condicion3) as condicion3, sum(condicion4) as condicion4 from temporal_sectorvence'+frmprincipal.idmaq+
           ' group by idcliente having saldo > 1 order by idcliente  asc ', 0, sqlgeneral);
    querys('Select l.nombre as linea, round(Sum(t.restante),2) AS saldo, '+
           'if (to_days(FechaVence)-to_days("'+datetostr(date)+'") <=30, round(Sum(restante),2), 0) as condicion1, '+
           'if (to_days(FechaVence)-to_days("'+datetostr(date)+'")>30 and to_days(FechaVence)-to_days("'+datetostr(date)+'") <=60, round(Sum(restante),2) , 0) as condicion2, '+
           'if(to_days(FechaVence)-to_days("'+datetostr(date)+'") >60 and to_days(FechaVence)-to_days("'+datetostr(date)+'")<=90, round(Sum(restante),2),0) as condicion3, '+
           'if (to_days(FechaVence)-to_days("'+datetostr(date)+'") >90, round(Sum(restante),2) , 0) as condicion4 '+
           'from temporal_sectorvence0'+frmprincipal.idmaq+' t left join DetPedido dp on dp.idpedido=t.idpedido '+
           'left join articulos a on a.cod_cve=dp.cod_cve left join lineas l on l.idlinea = a.idlinea '+
           'group by linea having saldo > 1 order by linea  asc', 0, sqlgeneral2);
    Screen.Cursor := crDefault;
    if sqlgeneral.FieldByName('idcliente').AsString <> '' then
    begin
      frmmensaje.Close;
      OperacionReporte('SectoresVencidos','Reportes de ',TipoImpresion, 1);
      if(chksms.Checked=true)then
      begin
        querys('select c.idcliente,replace(replace(trim(tel.telefono),"044-",""),"-","") as telefono '+
               ' from temporal_sectorvence'+frmprincipal.idmaq+' t left join clientes c on c.idcliente=t.idcliente '+
               ' left join telefonos tel on c.idtel=tel.idtel and tel.tipo_tel="CELULAR" GROUP BY idcliente',0,sqlgeneral2);
        SetLength(clientessms, 3);
        SetLength(clientessms[0], sqlgeneral2.RecordCount);
        SetLength(clientessms[1], sqlgeneral2.RecordCount);
        SetLength(clientessms[2], sqlgeneral2.RecordCount);
        servicio := GetConfiguraciones('ServicioSMS',true);
        user := GetConfiguraciones('UsuarioSMS',true);
        passwd := GetConfiguraciones('PasswordSMS',true);
        msn := GetConfiguraciones('MsnSMSxVencer',false);
        activo:= StrToInt(GetConfiguraciones('ActivoSMS',true));
        while not sqlgeneral2.EOF do
        begin
          if(sqlgeneral2.FieldByName('telefono').AsString<>'') then
          begin
            telefono := sqlgeneral2.fieldbyname('telefono').AsString;
            resultadosms := false;
            try
            if activo=1 then
              resultadosms := GetInfomensajeSoap(False, '', nil).Enviar(servicio,user,passwd,telefono,msn)
            else
              resultadosms := true;
            except
              resultadosms:=false;
            end;
            if(resultadosms)then
            begin
              clientessms[0,sqlgeneral2.RecNo-1]:='1'; //enviados
              clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
              clientessms[2,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('telefono').AsString;
            end
            else
            begin
              clientessms[0,sqlgeneral2.RecNo-1]:='2'; //fallidos
              clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
              clientessms[2,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('telefono').AsString;
            end;
          end
          else
          begin
            clientessms[0,sqlgeneral2.RecNo-1]:='3'; //Sin Telefono Celular
            clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
            clientessms[2,sqlgeneral2.RecNo-1]:='';
          end;
          sqlgeneral2.Next;
        end;
        querys('DROP TABLE IF EXISTS clientesSMS'+frmprincipal.idmaq,1, sqlgeneral2);
        querys('CREATE TABLE clientesSMS'+frmprincipal.idmaq+' (idcliente int(11) NOT NULL default "0", '+
                'tipo varchar(80) NOT NULL default "",telefono varchar(80) NOT NULL default "") ',1,sqlgeneral2); //  TYPE=MyISAM
        for f:=0 to Length(clientessms[0])-1 do
           querys('insert into clientesSMS'+frmprincipal.idmaq+'(idcliente,tipo,telefono) values ('+clientessms[1,f]+
                  ','+quotedstr(clientessms[0,f])+','+quotedstr(clientessms[2,f])+')',1,sqlgeneral2);
        querys('select cs.idcliente, '+ClienteNombre('c')+' as nombre, replace(replace(trim(cs.telefono),"044-",""),"-","") as telefono , if(tipo="1","Enviados",if(tipo="2","Fallidos","Sin Telefono Celular")) as tipo '+
               ' from clientesSMS'+frmprincipal.idmaq+' cs left join clientes c on c.idcliente=cs.idcliente order by tipo, idcliente',0,sqlgeneral2);
        OperacionReporte('ClientesSMS','',TipoImpresion,1);
        querys('drop table clientesSMS'+frmprincipal.idmaq,1,sqlgeneral2);
      end;

    end
    else
    begin
      frmmensaje.Close;
      application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);
    end;
    querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
    querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,sqlgeneral);
  end;//reportes
end;



procedure Tfrmmoduloreportes.ErrorVentas;
begin
with dmreportes do
  begin
    querys('DROP TABLE IF EXISTS TempAnaliticoError'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table TempAnaliticoError'+frmprincipal.idmaq+' SELECT distinct dp.idpedido,sum(if(dp.cant > 0,(dp.cant*dp.costo)*dp.tc,(dp.piezas*dp.costo)*dp.tc))  as BRUTO,sum(if(dp.cant > 0,((dp.cant*dp.costo)*dp.tc)*p.piva,((dp.piezas*dp.costo)*dp.tc)*p.piva)) as IVA,'+
           ' sum(if(dp.cant > 0,((dp.cant*dp.costo)*dp.tc)*(1+p.piva),((dp.piezas*dp.costo)*dp.tc)*(1+p.piva)))  as TOTAL,dp.costo AS PORCENTAJE,p.idcliente as cuenta from DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido)  '+
           ' LEFT JOIN articulos as a ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) WHERE p.FechaFactura between '+''''+dfecha1.text+''' and '+''''+dfecha2.text+'''  and p.estatus=4 group by dp.idpedido',1,sqlgeneral2);

    querys('DROP TABLE IF EXISTS TempDiarioVentasError'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table TempDiarioVentasError'+frmprincipal.idmaq+' SELECT rf.idremicion,p.idpedido,p.idfactura,p.FechaRemision as FechaCreacion,p.FechaFactura as Fecha,p.SubTotal as Importe,p.Iva,p.TotMn as Total,p.Saldo,p.idcliente as Cuenta' +
           ' FROM pedidos as p join DatosEmpresa as de LEFT JOIN RemiFact as rf ON(rf.idpedido=p.idpedido) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) INNER JOIN sectores as s on(s.nombre = c.sector) '+
           ' WHERE p.FechaFactura between '+''''+dfecha1.text+''' and '+''''+dfecha2.text+''' and p.estatus IN (4,6) GROUP BY p.idpedido ORDER BY p.FechaFactura,p.idfactura ',1,sqlgeneral2);

    querys('Create Index idpedido on TempAnaliticoError'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);
    querys('Create Index idpedido on TempDiarioVentasError'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);

    querys('Select v1.cuenta,c.sector,v1.idpedido,v2.idpedido as ped,v2.importe,v1.BRUTO,(v1.BRUTO-v2.importe) as total, v1.total as ta,v2.total as td,'+
           '(v1.total-v2.total) as totales, v2.Iva as ivad,v1.IVA as ivaa,round(v1.IVA-v2.Iva,2) as tot from TempAnaliticoError'+frmprincipal.idmaq+
           ' as v1 left join TempDiarioVentasError'+frmprincipal.idmaq+' as v2 on(v1.idpedido=v2.idpedido) left join clientes as c on(c.idcliente = v1.cuenta) '+
           'having total > 1  or tot > 1 or totales > 1 '+
           'UNION Select v1.cuenta,c.sector,v1.idpedido,v2.idpedido as ped,v2.importe,v1.BRUTO, (v2.importe-v1.BRUTO) as total, v1.total as tt,v2.total as ttt, '+
           '(v2.total-v1.total) as totales, v2.Iva as iva2,v1.IVA as iva1, round(v2.IVA-v1.Iva,2) as tot from TempAnaliticoError'+frmprincipal.idmaq+
           ' as v1 left join TempDiarioVentasError'+frmprincipal.idmaq+' as v2 on(v1.idpedido=v2.idpedido) '+
           'left join clientes as c on(c.idcliente = v1.cuenta) having total > 1  or tot > 1 or totales > 1 UNION '+
           'Select v1.cuenta,c.sector,v1.idpedido,v2.idpedido as ped,v2.importe,v1.BRUTO,(v1.BRUTO-v2.importe) as total, v1.total as tt,'+
           'v2.total as ttt, (v1.total-v2.total) as totales, v2.Iva as iva2,v1.IVA as iva1,round(v1.IVA-v2.Iva,2) as tot from TempAnaliticoError'+frmprincipal.idmaq+
           ' as v1 left join TempDiarioVentasError'+frmprincipal.idmaq+' as v2 on(v1.idpedido=v2.idpedido) left join clientes as c on(c.idcliente = v1.cuenta) '+
           'having v1.idpedido is null UNION '+
           'Select v1.cuenta,c.sector,v1.idpedido,v2.idpedido as ped,v2.importe,v1.BRUTO,(v1.BRUTO-v2.importe) as total, v1.total as tt,'+
           'v2.total as ttt, (v1.total-v2.total) as totales, v2.Iva as iva2,v1.IVA as iva1,round(v1.IVA-v2.Iva,2) as tot '+
           'from TempDiarioVentasError'+frmprincipal.idmaq+' as v2 left join TempAnaliticoError'+frmprincipal.idmaq+' as v1 on(v1.idpedido=v2.idpedido) left join clientes as c on(c.idcliente = v1.cuenta) '+
           'having v1.idpedido is null', 0, sqlgeneral2);

       //falta query busque si falta el detalle de la venta
      if  sqlgeneral2.RecordCount > 0 then
          OperacionReporte('ErrorVentas','Error en ventas',TipoImpresion, 1)
      else
          application.MessageBox('No hay datos!','Confirmación',mb_iconwarning);
      querys('DROP TABLE IF EXISTS TempAnaliticoError'+frmprincipal.idmaq,1,sqlgeneral3);
      querys('DROP TABLE IF EXISTS TempDiarioVentasError'+frmprincipal.idmaq,1,sqlgeneral3);
  end;
end;

procedure tfrmmoduloreportes.ProtocolosDiferentes(tipo:integer);
begin
querys('Select distinct clientes.idcliente,clientes.idprotocolo AS clientes,cliente_zonas.idprotocolo AS zonas From clientes Left Join cliente_zonas ON clientes.idcliente = cliente_zonas.cid where clientes.idprotocolo <> cliente_zonas.idprotocolo and '+
       'clientes.estatus=1 ',0,dmreportes.sqlgeneral);
querys('select idprotocolo,protocolo from protocolos order by idprotocolo',0,dmreportes.sqlgeneral2);
if tipo = 1 then
 OperacionReporte('ProtocolosDiferentes','Reporte de cuentas con protocolos diferentes',TipoImpresion, 1);
end;

procedure tfrmmoduloreportes.EventosPositivos(dfecha1,dfecha2:string);
begin
case rgEventosPositivos.ItemIndex of
  0: begin
     querys('DROP TABLE IF EXISTS TempEventosPos'+frmprincipal.idmaq,1,sqlgeneral);
     querys('CREATE TABLE TempEventosPos'+frmprincipal.idmaq+' (concepto varchar(100),total decimal default 0,id integer default 0)',1,sqlgeneral);
     querys('INSERT INTO TempEventosPos'+frmprincipal.idmaq+' select cs.nombre as concepto, count(*), activacion from ActivPos as ap Left join clasif_servicios as cs on cs.orden = ap.activacion and idserv = 9 where ap.fecha between "'+dfecha1+'" and "'+dfecha2+'" group by ap.activacion order by ap.activacion',1,sqlgeneral);

     querys('INSERT INTO TempEventosPos'+frmprincipal.idmaq+' SELECT ''TOTAL EVENTOS DE EMERGENCIA'' as concepto,count(*) as total,1 from ActivPos where fecha between '+quotedstr(dfecha1)+' and '+quotedstr(dfecha2)+' order by activacion',1,sqlgeneral);
     querys('INSERT INTO TempEventosPos'+frmprincipal.idmaq+' SELECT ''TIEMPO DE RESPUESTA PROMEDIO'',avg(tiempo),1 FROM  tiempo_respuesta where fecha between '+quotedstr(dfecha1)+' and '+quotedstr(dfecha2)+' ',1,sqlgeneral);
     querys('INSERT INTO TempEventosPos'+frmprincipal.idmaq+' SELECT ''FALSAS ALARMAS'',COUNT(*),1 FROM sk_alarmas left join alarmas_conclusion as ac on(ac.id=sk_alarmas.conclusion) where fecha_pc between '+quotedstr(dfecha1)+' and '+quotedstr(dfecha2)+' and ac.status =''FALSA ALARMA'' ',1,sqlgeneral);
     querys('INSERT INTO TempEventosPos'+frmprincipal.idmaq+' SELECT ''CUENTAS ACTIVAS'',COUNT(*),1 FROM clientes where estatus =1 ',1,sqlgeneral);
     querys('INSERT INTO TempEventosPos'+frmprincipal.idmaq+' SELECT ''LADRONES DETENIDOS'',sum(detenidos),1 from ActivPos where fecha between '+quotedstr(dfecha1)+' and '+quotedstr(dfecha2)+' ',1,sqlgeneral);
     querys('SELECT *,'+quotedstr('Resumen de eventos del '+dfecha1+ ' al '+ dfecha2)+' as titulo FROM TempEventosPos'+frmprincipal.idmaq+'',0,dmreportes.sqlgeneral2);
     querys('DROP TABLE IF EXISTS TempEventosPos'+frmprincipal.idmaq,1,sqlgeneral);
     OperacionReporte('EventosPositivos','Reporte de Eventos Positivos',TipoImpresion, 1);
     end;

  1: begin
     EventosPositivosOxxos(dfecha1,dfecha2);
     OperacionReporte('EventosPositivosCta', 'EventosPostivosPorCuenta', TipoImpresion, 1);
     querys('DROP TABLE IF EXISTS TmpEventosPosCta'+frmprincipal.idmaq,1,sqlgeneral);
     end;
  
  2: OxxosAPAA(dfecha1,dfecha2, '1');
  3: OxxosAPAA(dfecha1,dfecha2, '2');
  4: OxxosAPAA(dfecha1,dfecha2, '4');
  end;
end;

procedure tfrmmoduloreportes.ClientesNoUbicados(Reportear: integer);
begin
querys('select "De '+datetostr(tpcdesde.date)+' a '+datetostr(tpchasta.date)+'" as periodo, c.idcliente,con.TipoCont,con.nombre,if(cf.rsocial is null or cf.rsocial='''',concat(ifnull(cf.nombre,''''),'' '',ifnull(cf.apaterno,''''),'' '',ifnull(cf.amaterno,'''')),cf.rsocial) as Cliente,t.telefono,c.DesdeCont,c.HastaCont, '+
       'if (c.NoPatrulla = 1,"No Patrullaje","") as Patrulla from clientes as c left join contratos as con ON(con.TipoCont=c.TipoCont) left join ClientesFact as cf on c.idfact = cf.idfact left join telefonos as t on t.idtel=c.idtel where '+
       ' con.TipoCont<>"SEN" and t.Tipo_tel="ALARMA" and c.estatus=1 and (c.NotaUbicacion is null or c.NotaUbicacion="") and c.st_date between "'+datetostr(tpcdesde.date)+'" and "'+datetostr(tpchasta.date)+'" order by c.idcliente',0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
 begin
  application.MessageBox('No se encontro ningun cliente sin ubicacion en ese rango de fechas de alta','Aviso',mb_iconinformation);
  btngenerar.Enabled := false;
  exit;
 end
else
 begin
  btngenerar.Enabled := true;
  if Reportear = 1 then
   OperacionReporte('ClientesNoUbicados','Reporte de Clientes sin Ubicacion',TipoImpresion, 1);
 end;
end;

procedure Tfrmmoduloreportes.PendientesXInstalarXArt;
begin
querys('select '+ 'sum(if(dn.cant is null, dp.cant,dp.cant -dn.cant)) as cant , '+
       'dp.cod_cve as cod,i.idinstalacion,dp.idpedido,p.FechaRemision as FechaCreacion,dp.idrequisicion,if (i.FechaInicio < ''1950/01/01'', '''',i.FechaInicio) as FechaInicio,i.estatus from DetPedido as dp '+
       ' left join pedidos as  p ON(dp.idpedido=p.idpedido) left join articulos as a ON(a.cod_cve=dp.cod_cve)  left join instalaciones as i ON (i.idpedido=p.idpedido) left join UnidadNegocio as uni on(uni.idUnidadNegocio=p.idUnidadNegocio) '+
       'left join DetNotasCredito as dn on (dn.idpedido = p.idpedido and dp.cod_cve= dn.cod_cve ) '+
       ' where  p.estatus in(3,4) and i.FechaInicio is null and a.inventariable =1 and a.servicio=0 and a.paquete=0  and a.status=1 and uni.instalacion = 1 and i.estatus in (0) group by dp.cod_cve,dp.idpedido having FechaInicio is null '+
       '  order by dp.cod_cve',0,dmreportes.sqlgeneral);
TipoImprecionProcedure;
OperacionReporte('PedidosPendientesXInstalarXArticulo','Reporte de pedidos pendientes x instalar x articulo',TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.AbonosXCuenta;
begin
if(EDdesde.text <> '' ) then
 begin
      if(EDhasta.text = '') then
        EDhasta.text := EDdesde.text;

        if(Length(edano.Text)= 4 ) then
                RepAbonosXCuenta(EDdesde.text,edhasta.Text,edano.Text,TipoImpresion,false)
        else
         begin
             Application.MessageBox('El año no es correcto!','Atención',MB_OK);
             edano.SetFocus; 
         end;
 end
  else
  begin
   Application.MessageBox('Falta la cuenta a consultar!','Atención',MB_OK);
   EDdesde.SetFocus;
  end;

end;


procedure  Tfrmmoduloreportes.CitasAsignadasFuncion(fecha1,fecha2,origen,tipo,m:string;where:integer);
begin

with dmreportes do
  begin
    querys('SELECT p.idpuesto as puesto,concat(U.nombre,'' '',U.apaterno,'' '',U.amaterno,'' (Sec '',U.idsector,'')'')  as completo,count(O.idoportunidad) as t,dayofmonth(AG.fecha_creacion) AS dia FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON  '+
        '(AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as U ON (U.idusuario=AG.idvendedor) LEFT JOIN areas as a ON(U.idarea=a.idarea) LEFT JOIN puestos as p ON(p.idpuesto=U.idpuesto) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad= '+
        ' AG.idtipo_oportunidad) left join origen on(origen.idorigen=O.idorigen) WHERE U.estatus=1 AND AG.fecha_creacion between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' AND origen.nombre="'+origen+'" '+
        '   '+grupoIn[where]+' GROUP BY completo,AG.fecha_creacion',0,sqlgeneral);


 while not sqlgeneral.EOF do begin
      querys('select concepto from TendenciaVendedores where fecha ='+quotedstr(cboano.text)+' and mes ='+quotedstr(cbomeses.text)+' and concepto = '+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and  tipo="'+tipo+'" ',0,sqlgeneral3);
        if sqlgeneral3.FieldByName('concepto').AsString <> '' then
            begin
                   querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo="'+tipo+'" AND concepto='+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and mes = '+quotedstr(cbomeses.text)+' and fecha ='+quotedstr(cboano.text)  ,1,sqlgeneral2);

                    if sqlgeneral.fieldbyname('puesto').asstring='41' then
                         querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'=D'+
                         sqlgeneral.fieldbyname('dia').AsString+' + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+
                         ' WHERE tipo="'+tipo+'" AND concepto=''XCONSOLIDADONO_VENDEDORES'' and mes = '+quotedstr(cbomeses.text)+' and fecha ='+
                         quotedstr(cboano.text) ,1,sqlgeneral2)
                    else
                          querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+
                          sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+
                          ' where concepto=''XCONSOLIDADO'' and mes='+quotedstr(cbomeses.text)+' and fecha='+
                          quotedstr(cboano.text)+' and  tipo="'+tipo+'" ',1,sqlgeneral2);
            end else
              begin
              querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+
              ',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+
              quotedstr(sqlgeneral.fieldbyname('t').AsString)+',"'+tipo+'",'+
              quotedstr(sqlgeneral.fieldbyname('completo').AsString)+','+inttostr(where)+','+quotedstr(cbomeses.text)+','+quotedstr(cboano.text)+','+quotedstr(m)+',0,101 )',1,sqlgeneral2);
              querys('select concepto from TendenciaVendedores where fecha ='+quotedstr(cboano.text)+' and mes ='+quotedstr(cbomeses.text)+' and concepto = ''XCONSOLIDADONO_VENDEDORES'' and  tipo="'+tipo+'" ',0,sqlgeneral3);
              if sqlgeneral3.FieldByName('concepto').AsString <> '' then
                querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes='+quotedstr(cbomeses.text)+' and fecha='+quotedstr(cboano.text)+' and  tipo="'+tipo+'" ',1,sqlgeneral2)
              else
                querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+',"'+tipo+'",''XCONSOLIDADONO_VENDEDORES'',''1'','+quotedstr(cbomeses.text)+','+quotedstr(cboano.text)+','+quotedstr(m)+',0,101 )',1,sqlgeneral2);
              end;

        sqlgeneral.Next;
 end;
 end;
end;

procedure  Tfrmmoduloreportes.CitasAsignadasTotalesAceptadas(fecha1,fecha2,origen,tipo:string;where:integer);
begin

with dmreportes do
 begin
 querys('SELECT concat(U.nombre,'' '',U.apaterno,'' '',U.amaterno,'' (Sec '',U.idsector,'')'')  as completo,count(O.idoportunidad) as t, if (p.nombre =''VENDEDOR'' AND a.nombre =''VENTAS'',''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'') '+
        ' as concepto FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as U ON (U.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
        ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=U.idpuesto) left join areas as a on(a.idarea=U.idarea) WHERE U.estatus=1 AND AG.fecha_creacion '+
        ' between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' AND origen.nombre="'+origen+'"  '+grupoIn[where]+' and ee.nombre in(''ACEPTADA'',''CERRADA'') GROUP BY completo',0,sqlgeneral);

 while not sqlgeneral.EOF do
     begin
                 querys('UPDATE TendenciaVendedores SET aceptadas='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo="'+tipo+'" AND concepto='+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and mes = '+quotedstr(cbomeses.text)+' and fecha ='+quotedstr(cboano.text) ,1,sqlgeneral2);
                 querys('UPDATE TendenciaVendedores SET aceptadas=aceptadas + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo="'+tipo+'" AND concepto='+quotedstr(sqlgeneral.fieldbyname('concepto').AsString)+' and mes = '+quotedstr(cbomeses.text)+' and fecha ='+quotedstr(cboano.text) ,1,sqlgeneral2);
                 querys('UPDATE TendenciaVendedores SET aceptadas=aceptadas+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''PROSPECTOS'' AND concepto='+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and mes = '+quotedstr(cbomeses.text)+' and fecha ='+quotedstr(cboano.text) ,1,sqlgeneral2);
                 querys('UPDATE TendenciaVendedores SET aceptadas=aceptadas + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''PROSPECTOS'' AND concepto='+quotedstr(sqlgeneral.fieldbyname('concepto').AsString)+' and mes = '+quotedstr(cbomeses.text)+' and fecha ='+quotedstr(cboano.text) ,1,sqlgeneral2);
                 sqlgeneral.Next;
     end;

 end;
end;

procedure  Tfrmmoduloreportes.CitasAsignadasInsertaRegistros(tipo,nivel,m:string);
begin
with dmreportes do begin
querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT "'+tipo+'",concat(U.nombre,'' '',U.apaterno,'' '',U.amaterno,'' (Sec '',U.idsector,'')'') as completo,"'+nivel+'",'+quotedstr(cbomeses.text)+','+quotedstr(cboano.text)+','+quotedstr(m)+',idsector,0 FROM usuarios AS U  left join areas as a ON(a.idarea=U.idarea)  '+
       'left join puestos as p ON(p.idpuesto=U.idpuesto) where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector > 0  group by completo having  completo <> '''' ',1,sqlgeneral);

querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES("'+tipo+'",''XCONSOLIDADO'',"'+nivel+'",'+quotedstr(cbomeses.text)+','+quotedstr(cboano.text)+','+quotedstr(m)+',0,100 )',1,sqlgeneral);
querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES("'+tipo+'",''XCONSOLIDADONO_VENDEDORES'',"'+nivel+'",'+quotedstr(cbomeses.text)+','+quotedstr(cboano.text)+','+quotedstr(m)+',0,200 )',1,sqlgeneral);

end;

end;


procedure Tfrmmoduloreportes.CitasAsignadas;
var
diaf:integer;
fecha1,fecha2,mes,m,y,dia,condicion:string;
begin

fecha1 := formatdatetime('yyyy"/"mm"/"',now)+ '01';
mes := formatdatetime('mm',now);
condicion := '';
m := inttostr(cbomeses.itemindex +1);
y := cboano.text;
dia := formatdatetime('d',FechaServidor);
diaf:=DiasMes(m);

with dmreportes do
  begin
if strtoint(m) > 9 then
   mes := m
else
   mes := '0'+m;

   fecha1:=y+'/'+mes+'/'+'01';
   fecha2 := y+'/'+mes+'/'+ inttostr(diaf);

if chbdesglosado.Checked = true then
begin

//////////CITAS Equipo
 querys('SELECT concat(U.nombre,'' '',U.apaterno,'' '',U.amaterno)  as completo,O.idoportunidad,AG.fecha_creacion, origen.nombre as origen,too.nombre as TipoOportunidad,'+quotedstr('CITAS EQUIPO del mes '+cbomeses.text)+' as titulo FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON '+
        '(AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as U ON (U.idusuario=AG.idvendedor) LEFT JOIN areas as a ON(U.idarea=a.idarea) LEFT JOIN puestos as p ON(p.idpuesto=U.idpuesto) LEFT JOIN tipo_oportunidad as too '+
        ' ON(too.idtipo_oportunidad = AG.idtipo_oportunidad) left join origen on(origen.idorigen=O.idorigen) WHERE U.estatus=1 AND AG.fecha_creacion between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' AND origen.nombre=''LLAMADA'' '+
        '  AND too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') ORDER BY completo,AG.fecha_creacion ',0,sqlgeneral);

////////citas ampliacion
 querys('SELECT concat(U.nombre,'' '',U.apaterno,'' '',U.amaterno)  as completo,O.idoportunidad,AG.fecha_creacion,too.nombre as  TipoOportunidad,origen.nombre as origen,'+quotedstr('CITAS AMPLIACION del mes '+cbomeses.text)+' as titulo FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON '+
        ' (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as U ON (U.idusuario=AG.idvendedor) LEFT JOIN areas as a ON(U.idarea=a.idarea) LEFT JOIN puestos as p ON(p.idpuesto=U.idpuesto) LEFT JOIN tipo_oportunidad as too '+
        'ON(too.idtipo_oportunidad = AG.idtipo_oportunidad)  left join origen on(origen.idorigen=O.idorigen) WHERE U.estatus=1 AND AG.fecha_creacion between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' '+
        ' AND origen.nombre=''LLAMADA'' AND too.nombre  not in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') ORDER BY completo,AG.fecha_creacion',0,sqlgeneral2);


OperacionReporte('DesCitasEquipo','Reporte de citas equipo-ampliacion del mes '+cbomeses.Text,TipoImpresion, 1);

end else

 begin

if chmesca.Checked= true then
begin

//BORRAR Y INSERTAR BASE PARA EL REPORTE
querys('DELETE FROM TendenciaVendedores WHERE mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text)+' and TipoReporte=0',1,sqlgeneral);

CitasAsignadasInsertaRegistros('CITAS EQUIPO','1',m);CitasAsignadasInsertaRegistros('CITAS AMPLIAC','2',m);CitasAsignadasInsertaRegistros('CITAS ENLACE','3',m);CitasAsignadasInsertaRegistros('VISITAS EQUIPO','4',m);CitasAsignadasInsertaRegistros('VISITAS AMPLIAC','5',m);CitasAsignadasInsertaRegistros('VISITAS ENLACE','6',m);

   m := formatdatetime('m',now);
   y := formatdatetime('yyyy',now);
   CitasAsignadasFuncion(fecha1,fecha2,'LLAMADA','CITAS EQUIPO',m,1);
   CitasAsignadasFuncion(fecha1,fecha2,'LLAMADA','CITAS AMPLIAC',m,2);
      CitasAsignadasFuncion(fecha1,fecha2,'LLAMADA','CITAS ENLACE',m,3);
   CitasAsignadasFuncion(fecha1,fecha2,'VISITA','VISITAS EQUIPO',m,1);
   CitasAsignadasFuncion(fecha1,fecha2,'VISITA','VISITAS AMPLIAC',m,2);
   CitasAsignadasFuncion(fecha1,fecha2,'VISITA','VISITAS ENLACE',m,3);


  CitasAsignadasTotalesAceptadas(fecha1,fecha2,'LLAMADA','CITAS EQUIPO',1);
  CitasAsignadasTotalesAceptadas(fecha1,fecha2,'LLAMADA','CITAS AMPLIAC',2);
  CitasAsignadasTotalesAceptadas(fecha1,fecha2,'LLAMADA','CITAS ENLACE',3);
  CitasAsignadasTotalesAceptadas(fecha1,fecha2,'VISITA','VISITAS EQUIPO',1);
  CitasAsignadasTotalesAceptadas(fecha1,fecha2,'VISITA','VISITAS AMPLIAC',2);
  CitasAsignadasTotalesAceptadas(fecha1,fecha2,'VISITA','VISITAS ENLACE',3);


 querys('UPDATE TendenciaVendedores SET total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31) WHERE mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text),1,sqlgeneral2);
 if ((y=cboano.Text)  and  (m=inttostr(cbomeses.ItemIndex+1))) then
         querys('UPDATE TendenciaVendedores SET porciento=round(total/'+quotedstr(dia)+',2),tendencia=round((round(total/'+quotedstr(dia)+',2)*'+inttostr(diaf)+'),2), promAceptadas = round((aceptadas/'+quotedstr(dia)+'),2), TendenciaAceptadas = round((round(aceptadas/'+quotedstr(dia)+',2)*'+inttostr(diaf)+'),2) WHERE mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text),1,sqlgeneral2)
 else
         querys('UPDATE TendenciaVendedores SET porciento=round(total/'+inttostr(diaf)+',2),tendencia=round((round(total/'+inttostr(diaf)+',2)*'+inttostr(diaf)+'),2), promAceptadas = round((aceptadas/'+inttostr(diaf)+'),2),TendenciaAceptadas = round((round(aceptadas/'+inttostr(diaf)+',2)*'+inttostr(diaf)+'),2)  WHERE mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text),1,sqlgeneral2);

///---------------------------------------------------------------------------------------------------------------//

querys('SELECT concepto,SUM(D1),SUM(D2) ,SUM(D3) ,SUM(D4) ,SUM(D5) , SUM(D6) ,SUM(D7) ,SUM(D8) ,SUM(D9),SUM(D10) ,SUM(D11) ,SUM(D12) ,SUM(D13),SUM(D14),SUM(D15),'+
       'SUM(D16),SUM(D17),SUM(D18),SUM(D19),SUM(D20),SUM(D21),SUM(D22),SUM(D23),SUM(D24),SUM(D25),SUM(D26),'+
       'SUM(D27),SUM(D28),SUM(D29),SUM(D30),SUM(D31),SUM(total),SUM(porciento),sum(tendencia),sum(aceptadas),sum(promAceptadas),sum(TendenciaAceptadas),idsector from  TendenciaVendedores where mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text)+' '+
       ' and concepto is not null and TipoReporte=0 and idsector not in(101) and tipo in("CITAS EQUIPO","CITAS AMPLIAC","CITAS ENLACE","VISITAS EQUIPO","VISITAS AMPLIAC","VISITAS ENLACE") group by concepto',0,sqlgeneral);

while not sqlgeneral.Eof do
  begin
   querys('insert into TendenciaVendedores (concepto,  tipo ,  mes ,  fecha ,  D1 ,  D2 ,  D3 ,  D4 , D5 ,D6 ,D7 ,D8 ,D9 ,D10 ,D11 ,D12 ,D13 ,D14 ,D15 ,D16 ,D17 ,  D18 ,  D19 ,D20 ,D21 ,D22 ,D23 ,D24 ,D25 ,D26 ,D27 ,D28 ,D29 ,D30 ,D31 ,id,total ,porciento,tendencia'+
         ' ,idmes ,idsector,  TipoReporte ,  aceptadas,promAceptadas ,TendenciaAceptadas) values("'+sqlgeneral.Fields.Fields[0].AsString+'","TOTALES","'+cbomeses.text+'","'+cboano.text+'","'+sqlgeneral.Fields.Fields[1].AsString+'","'+sqlgeneral.Fields.Fields[2].AsString+'",'+
         '"'+sqlgeneral.Fields.Fields[3].AsString+'","'+sqlgeneral.Fields.Fields[4].AsString+'","'+sqlgeneral.Fields.Fields[5].AsString+'","'+sqlgeneral.Fields.Fields[6].AsString+'","'+sqlgeneral.Fields.Fields[7].AsString+'","'+sqlgeneral.Fields.Fields[8].AsString+'",'+
         ' "'+sqlgeneral.Fields.Fields[9].AsString+'","'+sqlgeneral.Fields.Fields[10].AsString+'","'+sqlgeneral.Fields.Fields[11].AsString+'","'+sqlgeneral.Fields.Fields[12].AsString+'","'+sqlgeneral.Fields.Fields[13].AsString+'","'+sqlgeneral.Fields.Fields[14].AsString+'",'+
         '"'+sqlgeneral.Fields.Fields[15].AsString+'","'+sqlgeneral.Fields.Fields[16].AsString+'","'+sqlgeneral.Fields.Fields[17].AsString+'","'+sqlgeneral.Fields.Fields[18].AsString+'","'+sqlgeneral.Fields.Fields[19].AsString+'","'+sqlgeneral.Fields.Fields[20].AsString+'",'+
         '"'+sqlgeneral.Fields.Fields[21].AsString+'","'+sqlgeneral.Fields.Fields[22].AsString+'","'+sqlgeneral.Fields.Fields[23].AsString+'","'+sqlgeneral.Fields.Fields[24].AsString+'","'+sqlgeneral.Fields.Fields[25].AsString+'","'+sqlgeneral.Fields.Fields[26].AsString+'",'+
         '"'+sqlgeneral.Fields.Fields[27].AsString+'","'+sqlgeneral.Fields.Fields[28].AsString+'","'+sqlgeneral.Fields.Fields[29].AsString+'","'+sqlgeneral.Fields.Fields[30].AsString+'","'+sqlgeneral.Fields.Fields[31].AsString+'",7,"'+sqlgeneral.Fields.Fields[32].AsString+'",'+
         '"'+sqlgeneral.Fields.Fields[33].AsString+'","'+sqlgeneral.Fields.Fields[34].AsString+'","'+m+'","'+sqlgeneral.Fields.Fields[38].AsString+'",0,"'+sqlgeneral.Fields.Fields[35].AsString+'","'+sqlgeneral.Fields.Fields[36].AsString+'",'+
         '"'+sqlgeneral.Fields.Fields[37].AsString+'")',1,sqlgeneral2);


  sqlgeneral.next;
  end;


      querys('SELECT * FROM TendenciaVendedores WHERE mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text)+' and concepto is not null and TipoReporte=0 and idsector < 101 order by idsector,concepto,id,tipo',0,sqlgeneral2);
      querys('SELECT * FROM TendenciaVendedores WHERE mes='+quotedstr(cbomeses.text)+' and fecha= '+quotedstr(cboano.text)+' and concepto is not null and TipoReporte=0 and idsector > 100 and total > 0 order by idsector,concepto,id,tipo',0,sqlgeneral);
  if sqlgeneral2.RecordCount > 0 then
   begin
        if dmreportes.sqlgeneral.RecordCount = 3 then
            querys('SELECT * FROM TendenciaVendedores WHERE mes=''NO APARECER EN REPORTE'' ',0,sqlgeneral);

             OperacionReporte('TendenciaCitasAsignadas','Reporte de citas asignadas ('+datetostr(now)+')',TipoImpresion, 1)
   end else
             application.MessageBox('No hay datos!','Confirmación',mb_iconwarning);

  querys('DROP TABLE IF EXISTS TempComisiones0'+frmprincipal.idmaq,1,sqlgeneral3);
  querys('DROP TABLE IF EXISTS TempComisiones2'+frmprincipal.idmaq,1,sqlgeneral3);

end;

 if chanoca.Checked = true then
 begin

       ///mostrar reporte 2 totales por mes.........
         querys('DROP TABLE IF EXISTS temporal_tendencia'+frmprincipal.idmaq,1,sqlgeneral);
         querys('create table temporal_tendencia'+frmprincipal.idmaq+' (m1 double default 0,m2 double default 0,m3 double default 0,m4 double default 0,m5 double default 0,m6 double default 0,m7 double default 0,m8 double default 0,m9 double default 0,m10 double default 0,m11 double default 0,m12 double default 0, '+
                ' codigo varchar(150),total double default 0,promedio double default 0,tendencia double default 0,cierres double default 0,PromCierre double default 0,TendenciaCierre double default 0,fecha varchar(50))',1,sqlgeneral2);

  if chaceptadasano.Checked = true then  // si es solo prospectos que fueron aceptadas entoncess
     begin
             if chcitasequipo.Checked = true then
               begin
                         if( chvendedores.Checked  and   chnovendedores.Checked ) then
                             begin
                                 condicion := 'Tendencia Vendedores y No Vendedores Equipos Aceptadas ';
                                 querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') order by id,concepto,mes ',0,sqlgeneral);
                             end else
                             begin

                                if chvendedores.Checked then
                                  begin
                                     condicion := 'Tendencia Vendedores Equipos - Aceptadas ';
                                     querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101   order by id,concepto,mes ',0,sqlgeneral)
                                  end else
                                   begin
                                     condicion := 'Tendencia No Vendedores Equipos - Aceptadas ';
                                     querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 order by id,concepto,mes ',0,sqlgeneral);
                                   end;
                             end;
               end else
                 begin
              if chcitasampliacionano.Checked = true then
                begin
                      if( chvendedores.Checked  and   chnovendedores.Checked ) then
                          begin

                              condicion := 'Tendencia Vendedores y No Vendedores Ampliaciones Aceptadas ';
                              querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'')  order by id,concepto,mes ',0,sqlgeneral);
                          end
                            else
                          begin


                               if chvendedores.Checked then
                                 begin
                                      condicion := 'Tendencia Vendedores Ampliaciones Aceptadas ';
                                      querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 order by id,concepto,mes ',0,sqlgeneral)
                                 end else
                                   begin
                                      condicion := 'Tendencia No Vendedores Ampliaciones Aceptadas ';
                                      querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 order by id,concepto,mes ',0,sqlgeneral);
                                   end;
                          end;
                end else
                  begin    //las aceptadas ......
                          if( chvendedores.Checked  and   chnovendedores.Checked ) then
                            begin
                               condicion := 'Tendencia No Vendedores Aceptadas ';
                               querys('select sum(aceptadas) as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') group by mes,code order by id,concepto,mes ',0,sqlgeneral);
                            end else
                              begin
                                  if chvendedores.Checked then
                                  begin
                                       condicion := 'Tendencia Vendedores Aceptadas ';
                                       querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 order by id,concepto,mes ',0,sqlgeneral)
                                   end else
                                   begin
                                      condicion := 'Tendencia No Vendedores Aceptadas ';
                                      querys('select aceptadas as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 order by id,concepto,mes ',0,sqlgeneral);
                                   end;
                              end;
                  end;
                end;
     end else
     begin    //condicion de totales citas.....
       if( chvendedores.Checked  and   chnovendedores.Checked ) then
        begin
              condicion := 'Tendencia Vendedores y No Vendedores ';

              if((chcitasequipo.Checked = true) and (chcitasampliacionano.Checked = true))  then
                begin
                       querys('select sum(total) as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') group by mes,code order by id,concepto,mes ',0,sqlgeneral);
                       querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') group by code ',0,sqlgeneral2);
                       condicion := condicion + 'Citas Equipos y Ampliaciones ';
                end else
                  begin
                      if chcitasequipo.Checked = true then begin
                          querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') order by id,concepto,mes ',0,sqlgeneral);
                          querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') group by code ',0,sqlgeneral2);

                          condicion := condicion + 'Citas Equipos ';
                      end;
                      if chcitasampliacionano.Checked = true then begin
                          querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') order by id,concepto,mes ',0,sqlgeneral);
                          querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') group by code ',0,sqlgeneral2);
                          condicion := condicion + 'Citas Ampliacion ';
                      end;
                  end;


              if chprospectosano.Checked = true then begin
                   querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''PROSPECTOS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') order by id,concepto,mes ',0,sqlgeneral);
                   querys('select sum(aceptadas) as total,fecha,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''PROSPECTOS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') group by code',0,sqlgeneral2);
                   condicion := condicion + 'Prospectos ';
              end;
        end else
          begin
            if chvendedores.Checked then begin
                        condicion := 'Tendencia Vendedores  ';

                   if((chcitasequipo.Checked = true) and (chcitasampliacionano.Checked = true))  then
                       begin
                           querys('select sum(total) as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 group by mes,code order by id,concepto,mes ',0,sqlgeneral);
                           querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 group by code  ',0,sqlgeneral2);
                           condicion := condicion + 'Citas Equipos y Ampliaciones ';
                       end else
                         begin
                          if chcitasequipo.Checked = true then begin
                               querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 order by id,concepto,mes ',0,sqlgeneral);
                               querys('select sum(aceptadas) as total,mes,fecha,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 group by code',0,sqlgeneral2);
                               condicion := condicion + 'Citas Equipos ';
                          end;
                          if chcitasampliacionano.Checked = true then begin
                               querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 order by id,concepto,mes ',0,sqlgeneral);
                               querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101  group by code',0,sqlgeneral2);
                               condicion := condicion + 'Citas Ampliacion ';
                          end;
                         end;

                       if chprospectosano.Checked = true then begin
                              querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''PROSPECTOS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 order by id,concepto,mes ',0,sqlgeneral);
                              querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''PROSPECTOS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 group by code',0,sqlgeneral2);
                              condicion := condicion + 'Prospectos ';
                       end;

             end else
              begin
                       condicion := 'Tendencia No Vendedores ';
                        if((chcitasequipo.Checked = true) and (chcitasampliacionano.Checked = true))  then
                         begin
                             querys('select sum(total) as total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199  group by mes,code order by id,concepto,mes ',0,sqlgeneral);
                             querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo in (''CITAS EQUIPO'',''CITAS AMPLIAC'') and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199  group by code  ',0,sqlgeneral2);
                             condicion := condicion + 'Citas Equipos y Ampliaciones ';
                         end else
                           begin

                                if chcitasequipo.Checked = true then begin
                                      querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 order by id,concepto,mes ',0,sqlgeneral);
                                      querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS EQUIPO'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199  group by code',0,sqlgeneral2);
                                      condicion := condicion + 'Citas Equipos ';
                                end;
                                if chcitasampliacionano.Checked = true then begin
                                      querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 order by id,concepto,mes ',0,sqlgeneral);
                                      querys('select sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''CITAS AMPLIAC'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 group by code',0,sqlgeneral2);

                                      condicion := condicion + 'Citas Ampliacion ';
                                end;
                                if chprospectosano.Checked = true then begin
                                      querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''PROSPECTOS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 order by id,concepto,mes ',0,sqlgeneral);
                                      querys('select  sum(aceptadas) as total,concepto as code from TendenciaVendedores where fecha='+quotedstr(cboano.Text)+' and tipo =''PROSPECTOS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector between 101  and 199 group by code',0,sqlgeneral2);
                                      condicion := condicion + 'Prospectos ';
                               end;
                          end;
              end;//  chvendedores.Checked
        end; // if( chvendedores.Checked  and   chnovendedores.Checked ) then

end;  //chaceptadasano
             while not sqlgeneral.eof do
                begin
                       querys('select codigo from temporal_tendencia'+frmprincipal.idmaq+' where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral5);
                       if sqlgeneral5.fieldbyname('codigo').asstring = '' then
                          begin
                               querys('insert into temporal_tendencia'+frmprincipal.idmaq+' (codigo,m'+sqlgeneral.fieldbyname('idmes').asstring+',fecha) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(sqlgeneral.fieldbyname('total').asstring)+','+quotedstr(cboano.Text)+') ',1,sqlgeneral3);
                          end else
                           begin
                               querys('update temporal_tendencia'+frmprincipal.idmaq+' set m'+sqlgeneral.fieldbyname('idmes').asstring+'=  '+sqlgeneral.fieldbyname('total').asstring+' + m'+sqlgeneral.fieldbyname('idmes').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),1,sqlgeneral3);
                            end;
                       sqlgeneral.next;
                end;

          if chaceptadasano.Checked = false then  // si es solo prospectos que fueron aceptadas entoncess
             begin
                //Mostrar Cierres
                while not sqlgeneral2.eof do
                begin
                        querys('update temporal_tendencia'+frmprincipal.idmaq+' set cierres =  '+sqlgeneral2.fieldbyname('total').asstring+'   where codigo = '+quotedstr(sqlgeneral2.fieldbyname('code').asstring),1,sqlgeneral3);
                       sqlgeneral2.next;
                end;
             end;

   querys('update temporal_tendencia'+frmprincipal.idmaq+' set total=(m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12)', 1, sqlgeneral3);
   m := formatdatetime('m',now);
   y := formatdatetime('yyyy',now);

    if (y=cboano.Text) then
         querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=truncate((total/'+''''+m+'''),2),PromCierre=truncate((cierres/'+''''+m+'''),2),tendencia=truncate(((total/'+''''+m+''')*12),2),TendenciaCierre=truncate(((cierres/'+''''+m+''')*12),2)', 1, sqlgeneral3)
    else
         querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=truncate((total/12),2),PromCierre=truncate((cierres/12),2),tendencia=total,TendenciaCierre=cierres ', 1, sqlgeneral3);

         condicion := condicion + ' del año '+cboano.Text;
         querys('select t.*,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,'+quotedstr(condicion)+' as titulo from temporal_tendencia'+frmprincipal.idmaq+' as t join DatosEmpresa as de where  fecha='+quotedstr(cboano.Text)+' order by codigo ',0,sqlgeneral);
         OperacionReporte('TendenciaVendedoresCtas','Reporte de cuentas en el año('+datetostr(now)+')',TipoImpresion, 1);
  end;//chanoca.Checked
end;
end; //dmreprotes....
end;


procedure Tfrmmoduloreportes.Travelers;
var cadena,temp :string;
j:integer;
begin
cadena:='select (to_days(current_date()) - to_days(travel.FechaRecive)) as dias, if (travel.resuelto = 1,''Si'',''No'') as Resolvio,travel.accion,travel.FechaRecive,travel.HoraRecive,travel.idtravel,travel.descripcion,areas.nombre as area, '+
        ' clientes.nombre,clientes.idcliente,if(travel.auditado=0,''No'',''Si'') as auditado,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as usuario,EstatusServicios.nombre, '+
        'asuntos.nombre as asunto,quejas.nombre as queja from travel left join clientes on clientes.idcliente = travel.idcliente left join areas on travel.iddptoa = areas.idarea left join usuarios on usuarios.idusuario = travel.idusra left '+
        ' join EstatusServicios on EstatusServicios.orden = travel.idestatus left join TipoServicios on TipoServicios.idserv = EstatusServicios.idserv  left join asuntos on asuntos.idasunto=travel.idasunto left join quejas on quejas.idqueja='+
        ' travel.idqueja where travel.FechaRecive between '+quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.Date))+' and TipoServicios.nombre = ''TRAVEL''';

if (rrgresolucion.ItemIndex <> -1) and (rrgresolucion.ItemIndex <> 2) then
 cadena := cadena + ' and (resuelto='+inttostr(rrgresolucion.ItemIndex)+')';
if (rrgauditado.ItemIndex <> -1) and (rrgauditado.ItemIndex <> 2) then
 cadena := cadena + ' and (auditado='+inttostr(rrgauditado.ItemIndex)+')';
if (cboestatus.Tag <> -1) and (cboestatus.Text <> 'TODOS') then
  cadena :=  cadena + ' and (idestatus='+inttostr(cboestatus.Tag)+')';
if rrgdepto.ItemIndex <> rrgdepto.Items.Count - 1 then
 cadena := cadena + ' and (iddptoa='+inttostr(rrgdepto.Tag)+')';
if rrgasuntos.ItemIndex <> rrgasuntos.Items.Count - 1 then
 cadena := cadena + ' and (idasunto='+inttostr(rrgasuntos.Tag)+')';
if rrgsubasunto.ItemIndex <> rrgsubasunto.Items.Count - 1 then
 cadena := cadena + ' and (travel.idqueja='+inttostr(rrgsubasunto.Tag)+')';

 if not rcgfuente.ItemChecked[rcgfuente.Items.Count - 1] then
 begin
   temp := ' and (';
  for j := 0 to rcgfuente.Items.Count - 1 do
   if rcgfuente.ItemChecked[j] then
    begin
     querys('select idorigen from origen where nombre='+quotedstr(rcgfuente.Items.Strings[j]),0,sqlgeneral);
     temp := temp + 'travel.idfuente='+sqlgeneral.fieldbyname('idorigen').AsString+' or ';
    end;
   delete(temp,length(temp)-3,length(temp));
   if temp <> ' and (' then
   cadena := cadena + temp + ')';
 end;
if cbtecnico.ItemIndex <> cbtecnico.Items.Count - 1 then
 cadena := cadena + ' and travel.idusra='+inttostr(cbtecnico.tag);
querys(cadena+' order by travel.iddptoa', 0,dmreportes.sqlgeneral);
OperacionReporte('TravelGral','Reporte de travelers',TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.ServiciosRepetidos;
var cadena : string;
begin
if cbtecnico.Text = 'TODOS' then
 cadena := ''
else
 cadena := ' and codigo2='+quotedstr(cbtecnico.Text);

  querys('DROP TABLE IF EXISTS temp_tecnicos'+frmprincipal.idmaq,1,sqlgeneral);
  querys('DROP TABLE IF EXISTS temp_rep_audit'+frmprincipal.idmaq,1,sqlgeneral);

  //pone cantidad cliente y tecnico de los servicios repetidos
  querys('create table temp_rep_audit'+frmprincipal.idmaq+' SELECT count(servicios.idcliente) AS cantidad,servicios.idcliente,usuarios.codigo2 FROM servicios INNER JOIN usuarios ON (servicios.CodTecnico = usuarios.codigo2) WHERE servicios.FechaFinUsr >='+quotedstr(datetostr(tpdesde.Date))+
         ' AND servicios.FechaFinUsr <='+quotedstr(datetostr(tphasta.Date))+cadena+' GROUP BY servicios.idcliente,usuarios.codigo2 HAVING (count(servicios.idcliente) > 1) ORDER BY servicios.idcliente',1,sqlgeneral);
  querys('create table temp_tecnicos'+frmprincipal.idmaq+' SELECT count(temp_rep_audit'+frmprincipal.idmaq+'.cantidad) AS total,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as nombre ,usuarios.codigo2,sum(temp_rep_audit'+frmprincipal.idmaq+'.cantidad-1) '+
         ' as repe FROM temp_rep_audit'+frmprincipal.idmaq+' INNER JOIN usuarios ON (temp_rep_audit'+frmprincipal.idmaq+'.codigo2=usuarios.codigo2) GROUP BY usuarios.nombre',1,sqlgeneral);
  //para el detalle de pedidos por tecnico
  querys('SELECT temp_rep_audit'+frmprincipal.idmaq+'.cantidad,temp_rep_audit'+frmprincipal.idmaq+'.idcliente,servicios.sid,servicios.FechaFinUsr,servicios.problema,servicios.trab_realizado,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as nombre,usuarios.codigo2,''Del '+datetostr(tpdesde.Date)+' Al '+datetostr(tphasta.Date)+''' as Rango FROM temp_rep_audit'+frmprincipal.idmaq+' INNER JOIN servicios ON (temp_rep_audit'+frmprincipal.idmaq+'.idcliente = servicios.idcliente) '+
         ' AND (temp_rep_audit'+frmprincipal.idmaq+'.codigo2 = servicios.CodTecnico) INNER JOIN usuarios ON (servicios.CodTecnico = usuarios.codigo2) WHERE servicios.FechaFinUsr >='+quotedstr(datetostr(tpdesde.Date))+' AND servicios.FechaFinUsr <='+quotedstr(datetostr(tphasta.Date))+
         ' order by usuarios.nombre,temp_rep_audit'+frmprincipal.idmaq+'.idcliente',0,dmreportes.sqlgeneral);
  //para el concetrado
  querys('SELECT count(servicios.sid) AS servicios,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as nombre,temp_tecnicos'+frmprincipal.idmaq+'.repe,(count(servicios.sid) -temp_tecnicos'+frmprincipal.idmaq+'.total) as diferencia,temp_tecnicos'+frmprincipal.idmaq+'.total FROM usuarios INNER JOIN servicios ON (usuarios.codigo2 = servicios.CodTecnico) INNER JOIN '+
         ' temp_tecnicos'+frmprincipal.idmaq+' ON (servicios.CodTecnico = temp_tecnicos'+frmprincipal.idmaq+'.codigo2) WHERE servicios.FechaFinUsr >='+quotedstr(datetostr(tpdesde.Date))+' AND servicios.FechaFinUsr <='+quotedstr(datetostr(tphasta.Date))+' GROUP BY usuarios.nombre',0,dmreportes.sqlgeneral2);
OperacionReporte('ServiciosRepetidos','Reporte de servicios repetidos',TipoImpresion, 1);
//primero sacamos datos para saber que ventas realizo el vendedor en el periodo hecho .. ok , despues saber cuanto fue en dolares para realizar el segundo reporte de totales.....
  querys('DROP TABLE IF EXISTS temp_tecnicos'+frmprincipal.idmaq,1,sqlgeneral);
  querys('DROP TABLE IF EXISTS temp_rep_audit'+frmprincipal.idmaq,1,sqlgeneral);
end;

procedure Tfrmmoduloreportes.TendenciaVendedoresTot;
begin
TendenciaVendedoresTotales(cbomeses.text,cboano.text, false, chkmes.checked, chktotalesventas.checked, chktotalescuentas.checked, chvendedores.checked, chnovendedores.checked, TipoImpresion);
end;

procedure Tfrmmoduloreportes.TendenciaTecnicos;
var fecha1,dia,y,mm,m,mes,fecha2:string;
diaf:integer;
begin
mm:=formatdatetime('m',FechaServidor);
y:=formatdatetime('yyyy',FechaServidor);
dia:=formatdatetime('d',FechaServidor);
m := inttostr(cbomeses.itemindex +1);
y := cboano.text;
dia := formatdatetime('d',FechaServidor);

diaf:=DiasMes(m);

with dmreportes do
  begin
  if strtoint(m) > 9 then
    mes := m
  else
    mes := '0'+m;

  fecha1:=y+'/'+mes+'/'+'01';
  fecha2 := y+'/'+mes+'/'+ inttostr(diaf);

if chinstalacionesmes.Checked = true then
  begin
  querys('delete from TendenciaInstaladores where mes= '+quotedstr(cbomeses.text)+' and fecha='+quotedstr(cboano.Text)+' ',1,sqlgeneral);


  {querys('SELECT u.codigo as code, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), sum(p.TotHrsCom)) as horas, dayofmonth(i.FechaFinal) as dia '+
         'FROM pedidos as p join usuarios as u INNER JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE i.FechaFinal between "'+fecha1+'" and "'+fecha2+'" '+
         'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) '+
         'and if(u.codigo = "",  not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, i.FechaFinal', 1, sqlgeneral);}

  querys('select code, sum(TotHrsCom) as horas, dia from ( SELECT u.codigo as code, p.TotHrsCom, dayofmonth(i.FechaFinal) '+
         'as dia FROM pedidos as p INNER JOIN instalaciones as  i ON (i.idpedido=p.idpedido) left join usuarios as u  on '+
         '(u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) '+
         'WHERE i.FechaFinal between "'+fecha1+'" and "'+fecha2+'" and p.estatus IN(3,4) and ObraEnProceso = 0 group by codigo, dia '+
         'UNION SELECT u.codigo,  ((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0, '+
         'cs2.nombre)) )/100 as apagar, dayofmonth(i.FechaFinal) as dia FROM pedidos as p INNER JOIN instalaciones as i ON '+
         '(i.idpedido=p.idpedido) left join usuarios as u  on (u.codigo=i.instalador1 and length(i.instalador1) = 3) or '+
         '(u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto LEFT JOIN '+
         'clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) LEFT '+
         'JOIN origen as ori ON (ori.idorigen=p.idorigen) INNER JOIN RemiFact as rf ON (rf.idpedido=p.idpedido) Left join '+
         'ObrasProceso as op on op.idinstalacion = i.idinstalacion left join (	select o.idstatus, cs.nombre, o.idinstalacion from '+
         'ObrasProceso as o left join clasif_servicios as cs on cs.idstatus=o.idstatus and cs.idserv = 10 where idobra in ( '+
         'Select max(idobra) as idobra from ObrasProceso as o where FechaObra between "'+fecha1+'" and "'+fecha2+'" group by '+
         'idinstalacion ) group by idinstalacion ) as cs on cs.idinstalacion = i.idinstalacion left join ( select o2.idstatus, '+
         'cs2.nombre, o2.idinstalacion from ObrasProceso as o2 left join clasif_servicios as cs2 on cs2.idstatus=o2.idstatus '+
         'and cs2.idserv = 10 where idobra in ( Select max(idobra) as idobra from ObrasProceso as o where FechaObra < "'+fecha1+'" '+
         'group by idinstalacion ) group by idinstalacion ) as cs2 on i.idinstalacion=cs2.idinstalacion left join clasif_servicios '+
         'as cs1 on cs1.idstatus=i.idstatus and cs1.idserv = 10 WHERE  p.estatus IN(3,4) and ObraEnProceso = 1 and op.FechaObra '+
         'between "'+fecha1+'" and "'+fecha2+'" group by codigo, dia ) as ins group by code, dia having dia is not null', 1, sqlgeneral);
         
  while not sqlgeneral.eof do
    begin
    querys('select mes from TendenciaInstaladores where mes= '+quotedstr(cbomeses.text)+' and fecha='+quotedstr(cboano.Text)+' and codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
    if sqlgeneral2.fieldbyname('mes').asstring = '' then
      begin
      querys('insert into TendenciaInstaladores (codigo,fecha,mes,D'+sqlgeneral.fieldbyname('dia').asstring+',idmes) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(cboano.Text)+','+quotedstr(cbomeses.text)+','+quotedstr(sqlgeneral.fieldbyname('horas').asstring)+','+quotedstr(m)+') ',1,sqlgeneral3);
      end
    else
      begin
      querys('update TendenciaInstaladores set D'+sqlgeneral.fieldbyname('dia').asstring+'=  '+sqlgeneral.fieldbyname('horas').asstring+' + D'+sqlgeneral.fieldbyname('dia').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring)+' and  fecha = '+quotedstr(cboano.Text)+' and mes = '+quotedstr(cbomeses.text),1,sqlgeneral3);
      end;
    sqlgeneral.next;
    end;

  //sacar el total de todas los servicios
  querys('update TendenciaInstaladores set total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31)', 1, sqlgeneral3);

  //sacar la tendencia por tecnico
  if ((y=cboano.Text)  and  (mm=inttostr(cbomeses.ItemIndex+1))) then
    querys('update TendenciaInstaladores set promedio=round((total/'+quotedstr(dia)+'),2), tendencia=round(((total/'+quotedstr(dia)+')*'+inttostr(diaf)+'),2)', 1, sqlgeneral3)
  else
    querys('update TendenciaInstaladores set promedio=round((total/'+inttostr(diaf)+'),2), tendencia=round(((total/'+inttostr(diaf)+')*'+inttostr(diaf)+'),2)', 1, sqlgeneral3);
  //diferencia
  querys('update TendenciaInstaladores set diferencia = 200 - tendencia', 1, sqlgeneral3);

  querys('select t.*, '+UsuarioNombre('usuarios')+' as tecnico from TendenciaInstaladores as t '+
         'left join usuarios on (usuarios.codigo=t.codigo) where mes= "'+cbomeses.text+'" and t.fecha='+quotedstr(cboano.Text)+' and usuarios.estatus = 1 group by codigo  order by t.codigo ',0,sqlgeneral);
  OperacionReporte('TendenciaInstaladores','Reporte de tendencia instaladores',TipoImpresion, 1);
  end
else
  begin
  {//mostrar reporte 2 totales por mes.........
   m := formatdatetime('m',now);
   y := formatdatetime('yyyy',now);

   querys('DROP TABLE IF EXISTS temporal_tendencia'+frmprincipal.idmaq,1,sqlgeneral);
   querys('create table temporal_tendencia'+frmprincipal.idmaq+' (m1 double default 0,m2 double default 0,m3 double default 0,m4 double default 0,m5 double default 0,m6 double default 0,m7 double default 0,m8 double default 0,m9 double default 0,m10 double default 0,m11 double default 0,m12 double default 0, '+
          ' codigo varchar(50),total double default 0,promedio double default 0,tendencia double default 0,fecha varchar(50))',1,sqlgeneral2);
   querys('select total as horas,mes,fecha,codigo as code,idmes from TendenciaInstaladores where fecha='+quotedstr(cboano.Text)+' order by codigo ',0,sqlgeneral);
   while not sqlgeneral.eof do
     begin
     querys('select codigo from temporal_tendencia'+frmprincipal.idmaq+' where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
     if sqlgeneral2.fieldbyname('codigo').asstring = '' then
       begin
       querys('insert into temporal_tendencia'+frmprincipal.idmaq+' (codigo,m'+sqlgeneral.fieldbyname('idmes').asstring+',fecha) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(sqlgeneral.fieldbyname('horas').asstring)+','+quotedstr(cboano.Text)+') ',1,sqlgeneral3);
       end
     else
       begin
       querys('update temporal_tendencia'+frmprincipal.idmaq+' set m'+sqlgeneral.fieldbyname('idmes').asstring+'=  '+sqlgeneral.fieldbyname('horas').asstring+' + m'+sqlgeneral.fieldbyname('idmes').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),1,sqlgeneral3);
       end;
     sqlgeneral.next;
     end;

  querys('update temporal_tendencia'+frmprincipal.idmaq+' set total=(m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12)', 1, sqlgeneral3);
  if ((y=cboano.Text)  and  (m=inttostr(cbomeses.ItemIndex+1))) then
    querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=round((total/'+quotedstr(m)+'),2),tendencia=round(((total/'+quotedstr(m)+')*'+inttostr(12)+'),2)', 1, sqlgeneral3)
  else
    querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=round((total/'+quotedstr(m)+'),2),tendencia=round(((total/'+quotedstr(m)+')*12),2)', 1, sqlgeneral3);

  querys('select t.*, '+UsuarioNombre('usuarios')+' as tecnico '+
        'from temporal_tendencia'+frmprincipal.idmaq+' as t left join usuarios on (usuarios.codigo=t.codigo) '+
        'group by t.codigo order by codigo ',0,sqlgeneral);
  OperacionReporte('TendenciaInstalacionesYear','Reporte de tendencia instaladores por año',TipoImpresion, 1);
  querys('DROP TABLE IF EXISTS temporal_tendencia'+frmprincipal.idmaq,1,sqlgeneral);


 ///////////////////////////////////////////////////////////////////////////////////////////////////////////   }
   //HrsCom
  {querys('select codigo, "Tendencia Instalaciones Anual Horas Instaladores" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+'),2) as promedio, round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+')*12,2) as tendencia,'+
        ''+cboano.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
        'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
        'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), sum(p.TotHrsCom)) as horas, '+
        'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
        'sum(p.TotHrsCom), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrsCom), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrsCom), 0) as m3, '+
        'if(month(i.FechaFinal) = 4, sum(p.TotHrsCom), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrsCom), 0) as m5,if(month(i.FechaFinal) = 6, '+
        'sum(p.TotHrsCom), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrsCom), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrsCom), 0) as m8, '+
        'if(month(i.FechaFinal) = 9, sum(p.TotHrsCom), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrsCom), 0) as m10,if(month(i.FechaFinal) '+
        '= 11, sum(p.TotHrsCom), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrsCom), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
        'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) = '+cboano.Text+' and month(i.FechaFinal) <= '+inttostr(cbomeses.itemindex+1)+' '+
        'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
        'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
        'group by codigo',0,sqlgeneral);}

  querys('select codigo, "Tendencia Instalaciones Anual Horas Instaladores" titulo, tecnico, sum(horas) as total, '+
         'round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+'),2) as promedio, round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+
         ')*12,2) as tendencia, '+cboano.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, '+
         'sum(m5) as m5, sum(m6) as m6, sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11, '+
         'sum(m12) as m12 from ( select codigo, sum(horas) as horas, tecnico, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, '+
         'sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10, '+
         'sum(m11) as m11,sum(m12) as m12 from ( SELECT u.codigo, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), '+
         'sum(p.TotHrsCom)) as horas, month(i.FechaFinal) as mes, month(i.FechaFinal) as m, '+UsuarioNombre('u')+' as tecnico, '+
         'if(month(i.FechaFinal) = 1, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m1, '+
         'if(month(i.FechaFinal) = 2, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m2, '+
         'if(month(i.FechaFinal) = 3, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m3, '+
         'if(month(i.FechaFinal) = 4, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m4, '+
         'if(month(i.FechaFinal) = 5, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m5, '+
         'if(month(i.FechaFinal) = 6, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m6, '+
         'if(month(i.FechaFinal) = 7, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m7, '+
         'if(month(i.FechaFinal) = 8, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m8, '+
         'if(month(i.FechaFinal) = 9, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m9, '+
         'if(month(i.FechaFinal) = 10, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m10, '+
         'if(month(i.FechaFinal) = 11, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m11, '+
         'if(month(i.FechaFinal) = 12, sum(if(instalador2 <> "", (p.TotHrsCom)/2, (p.TotHrsCom))), 0) as m12  '+
         'FROM pedidos as p INNER JOIN instalaciones as  i ON (i.idpedido=p.idpedido) left join usuarios as u  on '+
         '(u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) '+
         'WHERE year(i.FechaFinal) = '+cboano.Text+' and month(i.FechaFinal) <= '+inttostr(cbomeses.itemindex+1)+' and p.estatus IN(3,4) and ObraEnProceso = 0 '+
         'group by codigo, m ) as tmp where length(codigo) = 3 group by codigo '+
         'UNION '+
         'Select codigo, sum(m1) + sum(m2) + sum(m3) + sum(m4) + sum(m5) + sum(m6) + sum(m7) + sum(m8) + sum(m9) '+
         '+ sum(m10) + sum(m11) + sum(m12) as horas,  tecnico, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, '+
         'sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10, '+
         'sum(m11) as m11,sum(m12) as m12 from ( SELECT u.codigo, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), '+
         'sum(p.TotHrsCom)) as horas, '+UsuarioNombre('u')+' as tecnico, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m1/100) as m1, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m2/100) as m2, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m3/100) as m3, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m4/100) as m4, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m5/100) as m5, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m6/100) as m6, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m7/100) as m7, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m8/100) as m8, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m9/100) as m9, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m10/100) as m10, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m11/100) as m11, '+
         'if(instalador2 <> "" , (p.TotHrsCom/2), p.TotHrsCom) * (m12/100) as m12 '+
         'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u '+
         'on (u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and '+
         'length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto '+
         'LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) Left join ObrasProceso '+
         'as op on op.idinstalacion = i.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre - cs2 as m1 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o '+
         'Left join ( Select idinstalacion, cs.nombre from ObrasProceso o left join clasif_servicios cs on '+
         'cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as idobra from '+
         'ObrasProceso as o where  year(FechaObra) = ('+cboano.Text+'-1) and month(FechaObra) < 12 group by '+
         'idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 1 '+
         'group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra left join '+
         'clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs1 on '+
         'i.idinstalacion=cs1.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m2 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o '+
         'Left join ( Select idinstalacion, cs.nombre from ObrasProceso o left join clasif_servicios cs on '+
         'cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as idobra from '+
         'ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 2 '+
         'group by idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 2 '+
         'group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra left join '+
         'clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs2 on '+
         'i.idinstalacion=cs2.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m3 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, '+
         'cs.nombre from ObrasProceso o left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10 '+
         'where idobra in( Select max(idobra) as idobra from ObrasProceso as o where year(FechaObra) = '+
         cboano.Text+' and month(FechaObra) < 3 group by idinstalacion ) ) as o2 on o.idinstalacion = '+
         'o2.idinstalacion where month(o.FechaObra) = 3 group by idinstalacion ) as o Left join ObrasProceso op '+
         'on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs3 on i.idinstalacion=cs3.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m4 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, '+
         'cs.nombre from ObrasProceso o left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10 '+
         'where idobra in( Select max(idobra) as idobra from ObrasProceso as o where  year(FechaObra) = '+
         cboano.Text+' and month(FechaObra) < 4 group by idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion '+
         'where month(o.FechaObra) = 4 group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra '+
         'left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs4 on '+
         'i.idinstalacion=cs4.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m5 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( '+
         'Select max(idobra) as idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and '+
         'month(FechaObra) < 5 group by idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where '+
         'month(o.FechaObra) = 5 group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra '+
         'left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs5 on '+
         'i.idinstalacion=cs5.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m6 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) '+
         'as idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 6 group by '+
         'idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 6 group by idinstalacion '+
         ') as o Left join ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus '+
         'and cs.idserv = 10 ) as cs6 on i.idinstalacion=cs6.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m7 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) '+
         'as idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 7 group by '+
         'idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 7 group by idinstalacion '+
         ') as o Left join ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus = op.idstatus '+
         'and cs.idserv = 10 ) as cs7 on i.idinstalacion=cs7.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m8 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 8 group by idinstalacion '+
         ') ) as o2 on o.idinstalacion = o2.idinstalacion Where month(o.FechaObra) = 8 group by idinstalacion ) as o Left '+
         'join ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs8 on i.idinstalacion=cs8.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m9 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 9 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 9 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs9 on i.idinstalacion=cs9.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m10 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 10 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 10 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) '+
         'as cs10 on i.idinstalacion=cs10.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m11 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 11 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 11 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs11 on i.idinstalacion=cs11.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m12 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 12 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 12 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs12 on i.idinstalacion=cs12.idinstalacion '+

         'WHERE p.estatus IN(3,4) and ObraEnProceso = 1 and year(op.FechaObra) = '+cboano.Text+' and month(op.FechaObra) <= 10 '+
         'group by i.idinstalacion, codigo ) as r group by codigo ) as final group by codigo',0,sqlgeneral);

 OperacionReporte('TendenciaInstalacionesYear','Reporte de tendencia instaladores por año',TipoImpresion, 1);

  //Hrs
 {querys('select codigo, "Tendencia Instalaciones Anual Horas Ventas" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+'),2) as promedio, round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+')*12,2) as tendencia,'+
        ''+cboano.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
        'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
        'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrs)/count(u.codigo), sum(p.TotHrs)) as horas, '+
        'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
        'sum(p.TotHrs), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrs), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrs), 0) as m3, '+
        'if(month(i.FechaFinal) = 4, sum(p.TotHrs), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrs), 0) as m5,if(month(i.FechaFinal) = 6, '+
        'sum(p.TotHrs), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrs), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrs), 0) as m8, '+
        'if(month(i.FechaFinal) = 9, sum(p.TotHrs), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrs), 0) as m10,if(month(i.FechaFinal) '+
        '= 11, sum(p.TotHrs), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrs), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
        'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) = '+cboano.Text+' and month(i.FechaFinal) <= '+inttostr(cbomeses.itemindex+1)+' '+
        'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
        'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
        'group by codigo',0,sqlgeneral);}

 querys('select codigo, "Tendencia Instalaciones Anual Horas Ventas" titulo, tecnico, sum(horas) as total, '+
         'round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+'),2) as promedio, round((sum(horas)/'+inttostr(cbomeses.itemindex+1)+
         ')*12,2) as tendencia, '+cboano.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, '+
         'sum(m5) as m5, sum(m6) as m6, sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11, '+
         'sum(m12) as m12 from ( select codigo, sum(horas) as horas, tecnico, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, '+
         'sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10, '+
         'sum(m11) as m11,sum(m12) as m12 from ( SELECT u.codigo, if(u.codigo = "", sum(p.TotHrs)/count(u.codigo), '+
         'sum(p.TotHrs)) as horas, month(i.FechaFinal) as mes, month(i.FechaFinal) as m, '+UsuarioNombre('u')+' as tecnico, '+
         'if(month(i.FechaFinal) = 1, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m1, '+
         'if(month(i.FechaFinal) = 2, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m2, '+
         'if(month(i.FechaFinal) = 3, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m3, '+
         'if(month(i.FechaFinal) = 4, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m4, '+
         'if(month(i.FechaFinal) = 5, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m5, '+
         'if(month(i.FechaFinal) = 6, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m6, '+
         'if(month(i.FechaFinal) = 7, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m7, '+
         'if(month(i.FechaFinal) = 8, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m8, '+
         'if(month(i.FechaFinal) = 9, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m9, '+
         'if(month(i.FechaFinal) = 10, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m10, '+
         'if(month(i.FechaFinal) = 11, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m11, '+
         'if(month(i.FechaFinal) = 12, sum(if(instalador2 <> "", (p.TotHrs)/2, (p.TotHrs))), 0) as m12  '+
         'FROM pedidos as p INNER JOIN instalaciones as  i ON (i.idpedido=p.idpedido) left join usuarios as u on '+
         '(u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) '+
         'WHERE year(i.FechaFinal) = '+cboano.Text+' and month(i.FechaFinal) <= '+inttostr(cbomeses.itemindex+1)+' and p.estatus IN(3,4) and ObraEnProceso = 0 '+
         'group by codigo, m ) as tmp where length(codigo) = 3 group by codigo '+
         'UNION '+
         'Select codigo, sum(m1) + sum(m2) + sum(m3) + sum(m4) + sum(m5) + sum(m6) + sum(m7) + sum(m8) + sum(m9) '+
         '+ sum(m10) + sum(m11) + sum(m12) as horas,  tecnico, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, '+
         'sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10, '+
         'sum(m11) as m11,sum(m12) as m12 from ( SELECT u.codigo, if(u.codigo = "", sum(p.TotHrs)/count(u.codigo), '+
         'sum(p.TotHrs)) as horas, '+UsuarioNombre('u')+' as tecnico, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m1/100) as m1, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m2/100) as m2, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m3/100) as m3, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m4/100) as m4, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m5/100) as m5, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m6/100) as m6, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m7/100) as m7, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m8/100) as m8, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m9/100) as m9, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m10/100) as m10, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m11/100) as m11, '+
         'if(instalador2 <> "" , (p.TotHrs/2), p.TotHrs) * (m12/100) as m12 '+
         'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u '+
         'on (u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and '+
         'length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto '+
         'LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) Left join ObrasProceso '+
         'as op on op.idinstalacion = i.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre - cs2 as m1 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o '+
         'Left join ( Select idinstalacion, cs.nombre from ObrasProceso o left join clasif_servicios cs on '+
         'cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as idobra from '+
         'ObrasProceso as o where  year(FechaObra) = ('+cboano.Text+'-1) and month(FechaObra) < 12 group by '+
         'idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 1 '+
         'group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra left join '+
         'clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs1 on '+
         'i.idinstalacion=cs1.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m2 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o '+
         'Left join ( Select idinstalacion, cs.nombre from ObrasProceso o left join clasif_servicios cs on '+
         'cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as idobra from '+
         'ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 2 '+
         'group by idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 2 '+
         'group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra left join '+
         'clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs2 on '+
         'i.idinstalacion=cs2.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m3 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, '+
         'cs.nombre from ObrasProceso o left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10 '+
         'where idobra in( Select max(idobra) as idobra from ObrasProceso as o where year(FechaObra) = '+
         cboano.Text+' and month(FechaObra) < 3 group by idinstalacion ) ) as o2 on o.idinstalacion = '+
         'o2.idinstalacion where month(o.FechaObra) = 3 group by idinstalacion ) as o Left join ObrasProceso op '+
         'on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs3 on i.idinstalacion=cs3.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m4 from ( Select max(o.idobra) as idobra, '+
         'o.idinstalacion, ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, '+
         'cs.nombre from ObrasProceso o left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10 '+
         'where idobra in( Select max(idobra) as idobra from ObrasProceso as o where  year(FechaObra) = '+
         cboano.Text+' and month(FechaObra) < 4 group by idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion '+
         'where month(o.FechaObra) = 4 group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra '+
         'left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs4 on '+
         'i.idinstalacion=cs4.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m5 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( '+
         'Select max(idobra) as idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and '+
         'month(FechaObra) < 5 group by idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where '+
         'month(o.FechaObra) = 5 group by idinstalacion ) as o Left join ObrasProceso op on op.idobra=o.idobra '+
         'left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) as cs5 on '+
         'i.idinstalacion=cs5.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m6 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) '+
         'as idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 6 group by '+
         'idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 6 group by idinstalacion '+
         ') as o Left join ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus '+
         'and cs.idserv = 10 ) as cs6 on i.idinstalacion=cs6.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m7 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) '+
         'as idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 7 group by '+
         'idinstalacion ) ) as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 7 group by idinstalacion '+
         ') as o Left join ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus = op.idstatus '+
         'and cs.idserv = 10 ) as cs7 on i.idinstalacion=cs7.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m8 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 8 group by idinstalacion '+
         ') ) as o2 on o.idinstalacion = o2.idinstalacion Where month(o.FechaObra) = 8 group by idinstalacion ) as o Left '+
         'join ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs8 on i.idinstalacion=cs8.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m9 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 9 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 9 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs9 on i.idinstalacion=cs9.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m10 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 10 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 10 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 ) '+
         'as cs10 on i.idinstalacion=cs10.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m11 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 11 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 11 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs11 on i.idinstalacion=cs11.idinstalacion '+

         'left join ( Select o.idinstalacion, cs.nombre- cs2 as m12 from ( Select max(o.idobra) as idobra, o.idinstalacion, '+
         'ifnull(o2.nombre,0) as cs2 from ObrasProceso as o Left join ( Select idinstalacion, cs.nombre from ObrasProceso o '+
         'left join clasif_servicios cs on cs.idstatus=o.idstatus and cs.idserv = 10  where idobra in( Select max(idobra) as '+
         'idobra from ObrasProceso as o where  year(FechaObra) = '+cboano.Text+' and month(FechaObra) < 12 group by idinstalacion ) '+
         ') as o2 on o.idinstalacion = o2.idinstalacion where month(o.FechaObra) = 12 group by idinstalacion ) as o Left join '+
         'ObrasProceso op on op.idobra=o.idobra left join clasif_servicios cs on cs.idstatus=op.idstatus and cs.idserv = 10 '+
         ') as cs12 on i.idinstalacion=cs12.idinstalacion '+

         'WHERE p.estatus IN(3,4) and ObraEnProceso = 1 and year(op.FechaObra) = '+cboano.Text+' and month(op.FechaObra) <= 10 '+
         'group by i.idinstalacion, codigo ) as r group by codigo ) as final group by codigo',0,sqlgeneral);
 OperacionReporte('TendenciaInstalacionesYear','Reporte de tendencia instaladores por año',TipoImpresion, 1);


 end;
  end;
end;

procedure Tfrmmoduloreportes.CargosAutomaticos;
var cadena,fecha1,fecha2,FechaVence,DigitoDebitoTarjeta,DigitoDebitoClave:string;
begin
Screen.Cursor := crHourglass;
fecha1:='';
fecha2:='';
FechaVence := formatdatetime('yyyy"/"mm"/"dd',now + strtoint(edDiasVenceCargo.text));
with dmreportes do
begin
   querys('select valor,concepto from configuraciones where concepto in(''DigitoDebitoTarjeta'',''DigitoDebitoClave'') ',0,sqlgeneral);
   while not sqlgeneral.Eof do
      begin
         if(sqlgeneral.FieldByName('concepto').AsString ='DigitoDebitoTarjeta' ) then
            DigitoDebitoTarjeta := sqlgeneral.FieldByName('valor').AsString;

         if(sqlgeneral.FieldByName('concepto').AsString ='DigitoDebitoClave' ) then
            DigitoDebitoClave := sqlgeneral.FieldByName('valor').AsString;
          sqlgeneral.Next;
      end;

   querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,sqlgeneral);
   querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,sqlgeneral);
   querys('DROP TABLE IF EXISTS temporal_sectorvence100'+frmprincipal.idmaq,1,sqlgeneral);
   querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (idpedido integer(11) default 0,idcliente integer(11),saldo float default 0, NombreTarjeta varchar(100),Equipo float default 0,Servicio float default 0,desglosado float default 0,iva float default 0,'+
         ' NumTarjeta varchar(50),TipoCargo varchar(50),ConceptoTarjeta varchar(50),banco varchar(50),clave varchar(50), cvbanco varchar(5), FechaVCargo date,FechaVTarjeta date,dias integer(11),'+
         ' DigitoDebito integer(11) default 0,TarjetaDebito varchar(50),tipo varchar(15),KEY idcliente(idcliente))',1,sqlgeneral);
   buscarsectorID;                                                                                                      //,nombre varchar(70)
   buscarUnidadID;
     querys('INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+'(idcliente,NombreTarjeta,NumTarjeta,TipoCargo,ConceptoTarjeta,banco,clave,cvbanco, '+'FechaVCargo,FechaVTarjeta,DigitoDebito,TarjetaDebito)  SELECT  c.idcliente, concat(ifnull(NombreTarjeta,'' ''),'' '',ifnull(ApaternoTarjeta,'' ''),'' '', ifnull(AmaternoTarjeta," ")) '+
            'as NombreTarjeta,NumTarjeta,TipoCargo,ConceptoTarjeta,banco,dt.clave, tb.clave as cvebanco,FechaVCargo,FechaVTarjeta,if(NumTarjeta = '''' or NumTarjeta is null,'+DigitoDebitoClave+','+DigitoDebitoTarjeta+'),if(NumTarjeta = '''' or NumTarjeta is null,dt.clave,NumTarjeta) '+
            ' FROM clientes as c LEFT JOIN DetClientes as dt on (dt.idcliente=c.idcliente) LEFT JOIN sectores as s ON (s.idsector=c.sector) LEFT JOIN contratos as con ON(c.TipoCont=con.TipoCont) LEFT JOIN TiposBancos as tb on (tb.nombre=banco) '+
            'WHERE c.sector between '+sector1+' and '+sector2+'  and con.estatus=1 and dt.flcargo = 1 and dt.TipoCargo='+''''+cbocargos.Text+''' ',1,sqlgeneral);

     querys('INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+'(idcliente,NombreTarjeta,NumTarjeta,TipoCargo,ConceptoTarjeta,banco,clave,cvbanco, '+'FechaVCargo,FechaVTarjeta,DigitoDebito,TarjetaDebito)  SELECT  c.idcliente, concat(ifnull(NombreTarjeta,'' ''),'' '',ifnull(ApaternoTarjeta,'' ''),'' '', ifnull(AmaternoTarjeta," ")) '+
            'as NombreTarjeta,NumTarjeta,TipoCargo,ConceptoTarjeta,banco,dt.clave,tb.clave as cvebanco,FechaVCargo,FechaVTarjeta,if(NumTarjeta = '''' or NumTarjeta is null,'+DigitoDebitoClave+','+DigitoDebitoTarjeta+'),if(NumTarjeta = '''' or NumTarjeta is null,dt.clave,NumTarjeta) '+
            ' FROM clientes as c LEFT JOIN DetClientes as dt on (dt.idcliente=c.idcliente) LEFT JOIN sectores as s ON (s.idsector=c.sector) LEFT JOIN contratos as con ON(c.TipoCont=con.TipoCont) LEFT JOIN TiposBancos as tb on (tb.nombre=banco) '+
            'WHERE c.sector between '+sector1+' and '+sector2+'  and c.TipoCont =''SEN'' and dt.flcargo = 1 and dt.TipoCargo='+''''+cbocargos.Text+''' ',1,sqlgeneral);

     querys('create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,uni.nombre as UnidadNegocio FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) INNER JOIN temporal_sectorvence'+frmprincipal.idmaq+' as c ON(c.idcliente=pc.idcliente) LEFT JOIN UnidadNegocio as uni on(uni.idUnidadNegocio = p.idUnidadNegocio)'+
            'WHERE pc.FechaVence <= '+''''+FechaVence+''' and  p.estatus in(3,4,6) AND restante > 0.9 and pc.movimiento IN(0,1)  AND p.idUnidadNegocio between '+UN1+' and '+UN2+'  GROUP BY pc.idpago ',1,sqlgeneral);

querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);
querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);
querys('CREATE TABLE temporal_sectorvence100'+frmprincipal.idmaq+' SELECT pc.idpedido,pc.idcliente,sum(pc.restante) as saldo,t1.UnidadNegocio FROM PagosClientes as pc INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago) where pc.movimiento in(0,1,4) AND pc.restante > 1 GROUP BY pc.idcliente,t1.UnidadNegocio  ',1,sqlgeneral);

querys('Select * from temporal_sectorvence100'+frmprincipal.idmaq+' ',0,sqlgeneral);
while not sqlgeneral.Eof do
  begin
          if ((sqlgeneral.FieldByName('UnidadNegocio').AsString <> 'MONITOREO' ) and (sqlgeneral.FieldByName('UnidadNegocio').AsString <> 'INTERESES')) THEN
               querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+'  SET  Equipo = Equipo + '+sqlgeneral.FieldByName('saldo').AsString+', saldo = saldo + '+sqlgeneral.FieldByName('saldo').AsString+',desglosado = desglosado + ('+sqlgeneral.FieldByName('saldo').AsString+'/'+floattostr(1+getIVA)+'),iva = iva +(('+sqlgeneral.FieldByName('saldo').AsString+'/'+floattostr(1+getIVA)+') * '+floattostr(getIVA)+'),idpedido = '+sqlgeneral.FieldByName('idpedido').AsString+' WHERE idcliente = '+sqlgeneral.FieldByName('idcliente').AsString+'  ',1,sqlgeneral2);

          if ((sqlgeneral.FieldByName('UnidadNegocio').AsString = 'MONITOREO') or (sqlgeneral.FieldByName('UnidadNegocio').AsString='INTERESES')) THEN
               querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+'  SET  Servicio = Servicio + '+sqlgeneral.FieldByName('saldo').AsString+', saldo = saldo + '+sqlgeneral.FieldByName('saldo').AsString+',desglosado = desglosado + ('+sqlgeneral.FieldByName('saldo').AsString+'/'+floattostr(1+getIVA)+'),iva = iva +(('+sqlgeneral.FieldByName('saldo').AsString+'/'+floattostr(1+getIVA)+') * '+floattostr(getIVA)+'),idpedido ='+sqlgeneral.FieldByName('idpedido').AsString+' WHERE idcliente = '+sqlgeneral.FieldByName('idcliente').AsString+'  ',1,sqlgeneral2);
         sqlgeneral.Next;
  end;

//generar reporte
cadena := 'Del sector '+ cbosector1.text +' al '+ cbosector2.text;
 querys('select T.*,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,'+quotedstr(cadena)+' as sector,(Equipo+Servicio) as total   from temporal_sectorvence'+frmprincipal.idmaq+' AS T join DatosEmpresa as de where saldo > 2 order by idcliente',0,sqlgeneral);//'+

         Screen.Cursor := crDefault;
       if sqlgeneral.FieldByName('idcliente').AsString <> '' then begin
             frmmensaje.Close;

           if  cbocargos.text = 'DEBITO' then
               OperacionReporte('CargoAtuDebito','Reporte de cuentas con cargo aut. debito',TipoImpresion, 1);

           if  cbocargos.text = 'AMERICAN EXPRESS' then
               OperacionReporte('CargoAutAE','Reporte de cuentas con cargo aut. american express ',TipoImpresion, 1);

           if  cbocargos.text = 'CREDITO' then
               OperacionReporte('CargoAutCredito','Reporte de cuentas con cargos aut. de credito ',TipoImpresion, 1);

           if  cbocargos.text = 'CUENTA CHEQUES' then
               OperacionReporte('CargoAutCredito','Reporte de cuentas con cargo aut. cheques',TipoImpresion, 1);

       end else begin
           Screen.Cursor := crDefault;
           frmmensaje.Close;
           application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);

       end;

querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,sqlgeneral);
querys('DROP TABLE IF EXISTS temporal_sectorvence100'+frmprincipal.idmaq,1,sqlgeneral);
end;//reportes
end;

procedure Tfrmmoduloreportes.NotasCredito;
begin
  RepNotasCredito(rbstnodetallado.Checked,rbstdetallado.Checked,false,datetostr(dfecha1.Date),datetostr(dfecha2.Date),TipoImpresion);
end;


procedure Tfrmmoduloreportes.OpenCloseOxxos;
begin
Screen.Cursor := crHourglass;
querys('SELECT "Del '+datetostr(tpdesde.Date)+' al '+datetostr(tpdesde.Date)+'" as periodo, if (tipo="5" or tipo="OP" or '+
       '((tipo="400" or tipo="401") and o.zona like "___E"),"OPEN",if (o.tipo="4" or o.tipo="CL" or '+
       '((tipo="400" or tipo="401") and o.zona like "___R"),"CLOSE","Desconocida")) as valor, '+ClienteNombre('c')+
       ' as Nombre, c.idcliente as idcliente,o.fecha_pc as Fecha, o.hora_pc as Hora,o.user as Usuario,p.protocolo '+
       'FROM clientes as c LEFT JOIN open_close as o ON c.idcliente = o.idcliente left join ClientesFact as cf on '+
       'c.idfact = cf.idfact left join protocolos as p on p.idprotocolo = c.idprotocolo where (o.tipo="4" '+
       'or o.tipo = "5" or o.tipo="CL" or o.tipo="OP" or tipo = "400" or tipo="401") and (fecha_pc between "'+
       datetostr(tpdesde.Date)+'" and "'+datetostr(tpdesde.Date)+'") and if(cf.rsocial="",concat(ifnull(cf.nombre,"")," ",'+
       ' ifnull(cf.apaterno,"")," ",ifnull(cf.amaterno,"")),cf.rsocial) LIKE "%'+ednombre.Text+'%" order by o.fecha_pc,o.hora_pc ',0,dmreportes.sqlgeneral);

       frmmensaje.Close;
Screen.Cursor := crDefault;
end;

procedure Tfrmmoduloreportes.Cobranza;
var cadena,fecha1,fecha2,dia,m,y,titulo1,fechabusqueda:string;
dias,diasInicio,tipo,dias60999:integer;

begin
tipo:=0;
dias:=0;
diasInicio:=0;
dias60999:=0;
Screen.Cursor := crHourglass;
dia:=formatdatetime('d',now);
m:=formatdatetime('m',now);
y:=formatdatetime('yyyy',now);
fechabusqueda:=datetostr(now);
fecha1:='';
fecha2:='';
UN1 := '1'; UN2:= '100'; 

if  rgcobranza.ItemIndex = 7  then
  begin
  fecha1 := cboano.Text+'/'+inttostr(cbomeses.itemindex +1)+'/01';
  fecha2 := cboano.Text+'/'+inttostr(cbomeses.itemindex +1)+'/31';
  end;

//buscamos si ya hay registros en ese mes
with dmreportes do begin

if rgcobranza.ItemIndex < 5  then
begin


if rgcobranza.ItemIndex =0 then
  begin
   diasInicio := 0;
   dias:=30;
   fecha1:=datetostr(now-0);
   fecha2:=datetostr(now-9999);
   tipo:=0;
   titulo1:='COBRANZA ( 0 A 30 ) DIAS';
end;

if rgcobranza.ItemIndex =1 then
  begin
     diasInicio := 0;
     dias:=59;
     fecha1:=datetostr(now-0);
     fecha2:=datetostr(now-9999);
     tipo:=1;
     titulo1:='COBRANZA ( 0 A 59 ) DIAS';
  end;

if rgcobranza.ItemIndex =2 then
   begin
    diasInicio := 60;
    dias:=9999;

     querys('select valor from configuraciones where concepto = "DiaReporteCobranza"',1,DMREPORTES.sqlgeneral6);
     dias60999 := dmreportes.sqlgeneral6.Fields.Fields[0].AsInteger;

        if(DayOfTheMonth(now) < dias60999 ) then
          begin
            fecha1:=datetostr(now-60);
            fecha2:=datetostr(now-9999);
          end else
          begin
            fecha1:=datetostr(now-60-(DayOfTheMonth(now) - (dias60999-1)));
            fecha2:=datetostr(now-9999);

          end;
    tipo:=2;
    titulo1:='COBRANZA EXTRA-JUD ( 60 A 9999 ) DIAS';
   end;

if rgcobranza.ItemIndex =3 then
   begin
    diasInicio := 0;
    dias:=9999;
    fecha1:=datetostr(now-0);
    fecha2:=datetostr(now-9999);
    tipo:=3;
    titulo1:='ABOGADOS';
   end;


   if rgcobranza.ItemIndex =4 then
   begin
    diasInicio := 0;
    dias:=9999;
    fecha1:=datetostr(now-0);
    fecha2:=datetostr(now-9999);
    tipo:=4;
    titulo1:='COBRANZA DE 0 - 9999';
   end;

if ((tipo < 2) OR (tipo = 4 )) then begin
 querys('select '+quotedstr(titulo1)+' as titulo1,tipo,sector,concepto,fecha,mes,total,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31 from Cobranza where fecha = '+quotedstr(cboano.Text)+' and mes='+quotedstr(cbomeses.Text)+' and  tipo =''DESGLOSADO'' and clasificacion='+inttostr(tipo)+' order by tipo,sector,id asc',0,sqlgeneral2);//'+ order by tipo,sector,id
 querys('select * from Cobranza where fecha = '+quotedstr(cboano.Text)+' and mes='+quotedstr(cbomeses.Text)+' and  tipo =''CONSOLIDADO'' and clasificacion='+inttostr(tipo)+' order by id asc',0,sqlgeneral);//'+
end else begin
if ((tipo < 2) OR (tipo = 4 )) then begin
   querys('select '+quotedstr(titulo1)+' as titulo1,tipo,sector,concepto,fecha,mes,total,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31 from Cobranza where fecha = '+quotedstr(cboano.Text)+' and mes='+quotedstr(cbomeses.Text)+' and  tipo =''DESGLOSADO'' and clasificacion='+inttostr(tipo)+' and id not in(3,5)  order by tipo,sector,id asc',0,sqlgeneral2);//'+ order by tipo,sector,id
   querys('select * from Cobranza where fecha = '+quotedstr(cboano.Text)+' and mes='+quotedstr(cbomeses.Text)+' and  tipo =''CONSOLIDADO'' and clasificacion='+inttostr(tipo)+' and id not in(3,5)  order by id asc',0,sqlgeneral);//'+
  end else
    begin
         querys('select '+quotedstr(titulo1)+' as titulo1,tipo,sector,concepto,fecha,mes,total,D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31 from Cobranza where fecha = '+quotedstr(cboano.Text)+' and mes='+quotedstr(cbomeses.Text)+' and  tipo =''DESGLOSADO'' and clasificacion='+inttostr(tipo)+' order by tipo,sector,id asc',0,sqlgeneral2);//'+ order by tipo,sector,id
         querys('select * from Cobranza where fecha = '+quotedstr(cboano.Text)+' and mes='+quotedstr(cbomeses.Text)+' and  tipo =''CONSOLIDADO'' and clasificacion='+inttostr(tipo)+' order by id asc',0,sqlgeneral);//'+
    end;
end;
             Screen.Cursor := crDefault;
             frmmensaje.Close;
             OperacionReporte('CobranzaGeneral1','Reporte de cobranza ',TipoImpresion, 1);
end else
 begin
 if rgcobranza.ItemIndex = 5 then
  begin
  //reporte de contratos por sector........
 querys('DROP TABLE IF EXISTS temp_contratos0'+frmprincipal.idmaq,1,sqlgeneral);
 querys('CREATE TABLE temp_contratos0'+frmprincipal.idmaq+' (S1 INT(11) default 0,S2 INT(11) default 0,S3 INT(11) default 0,S4 INT(11) default 0,S5 INT(11) default 0,S6 INT(11) default 0,SS INT(11) default 0,contrato varchar(30),tipo varchar(3),total int(11)default 0)',1,dmaccesos.sqlgeneral);

        querys('INSERT INTO temp_contratos0'+frmprincipal.idmaq+'(contrato,tipo) select nombre,TipoCont from contratos ',1,sqlgeneral);
        querys('INSERT INTO temp_contratos0'+frmprincipal.idmaq+'(contrato,tipo) values (''SIN CONTRATO'',''S/N'') ',1,sqlgeneral);


 querys('select count(c.idcliente) as total,if (con.nombre is null,''SIN CONTRATO'',con.nombre) as nombre, '+
        'if(sector is null or sector = '''' or sector > 10 or sector = 0,''S'',sector) as sector from clientes as c left join contratos as con ON(con.TipoCont=c.TipoCont) '+
        '  group by con.nombre,sector',0,sqlgeneral);       //where sector < 6
  while not sqlgeneral.Eof do
     begin
        querys('UPDATE temp_contratos0'+frmprincipal.idmaq+' SET S'+sqlgeneral.fieldbyname('sector').AsString+'='+quotedstr(sqlgeneral.fieldbyname('total').AsString)+',total=total+'+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' WHERE  contrato='+quotedstr(sqlgeneral.fieldbyname('nombre').AsString)+' ',1,sqlgeneral2);
        sqlgeneral.Next;
     end;

 querys('select *, if(tipo =  "SEN" OR  tipo =  "MOR", "INACTIVOS", "ACTIVOS") as estatus from temp_contratos0'+frmprincipal.idmaq+' where tipo not in("CAN", "LIB", "S/N") order by estatus, tipo',0,sqlgeneral2);

     Screen.Cursor := crDefault;
     frmmensaje.Close;
     OperacionReporte('Contratos','',TipoImpresion, 1);

 querys('DROP TABLE IF EXISTS temp_contratos0'+frmprincipal.idmaq,1,sqlgeneral);
 end;
  if rgcobranza.ItemIndex  = 6 then
  begin
      RepTendenciaCobranza(TipoImpresion,true);
  end;


  if rgcobranza.ItemIndex = 7 then
     begin
      querys('DROP TABLE IF EXISTS TempCobranza'+frmprincipal.idmaq+' ',1,sqlgeneral);
      querys ('CREATE TABLE TempCobranza'+frmprincipal.idmaq+' (sector varchar(100) , mes varchar(10) default NULL,fecha varchar(10) default NULL,D1 int(11) default 0,D2 int(11) default 0,D3 int(11) default 0,D4 int(11) default 0,D5 int(11) default 0,D6 int(11) default 0,' +
              'D7 int(11) default 0,D8 int(11) default 0,D9 int(11) default 0,D10 int(11) default 0,D11 int(11) default 0,D12 int(11) default 0,D13 int(11) default 0,D14 int(11) default 0,D15 int(11) default 0,D16 int(11) default 0,D17 int(11) default 0, '+
              'D18 int(11) default 0,D19 int(11) default 0,D20 int(11) default 0,D21 int(11) default 0,D22 int(11) default 0,D23 int(11) default 0,D24 int(11) default 0,D25 int(11) default 0,D26 int(11) default 0,D27 int(11) default 0,D28 int(11) default 0,'+
              'D29 int(11) default 0,D30 int(11) default 0,D31 int(11) default 0,total int(10) default 0)  ',1,sqlgeneral);      // TYPE=MyISAM


           querys ('select count(notas.idnota) as total,'+ UsuarioNombre('u')+' as sector from notas left join clientes  as c on(c.idnota=notas.idnota) LEFT JOIN usuarios as u on(u.idusuario = notas.idusuario) where TipoNota = ''LLAMADA''  and notas.fecha between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' group by notas.idusuario ',0,sqlgeneral);
            while not sqlgeneral.Eof do
              begin
                 querys('Insert into TempCobranza'+frmprincipal.idmaq+' (sector,mes,fecha) values("'+sqlgeneral.fieldbyname('sector').AsString +'",'+quotedstr(cbomeses.Text)+','+quotedstr(cboano.Text)+' ) ',1,sqlgeneral2);
                 sqlgeneral.next;
              end;

           querys ('select count(notas.idnota) as total,'+ UsuarioNombre('u')+' as sector,extract(day from notas.fecha) as fecha from notas left join clientes  as c on(c.idnota=notas.idnota) LEFT JOIN usuarios as u on(u.idusuario = notas.idusuario) where TipoNota = ''LLAMADA''  and notas.fecha between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' group by notas.idusuario,notas.fecha ',0,sqlgeneral);
            while not sqlgeneral.Eof do
              begin

                querys('UPDATE TempCobranza'+frmprincipal.idmaq+' SET D'+sqlgeneral.fieldbyname('fecha').AsString+' ='+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' where sector = '+quotedstr(sqlgeneral.fieldbyname('sector').AsString)+' ',1,sqlgeneral2);

              sqlgeneral.Next;
            end;


           querys('UPDATE TempCobranza'+frmprincipal.idmaq+' as t  SET total =(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D18+D17+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31)  ',1,sqlgeneral2);

           //mostrar reporte
           querys('Select t.*,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from TempCobranza'+frmprincipal.idmaq+' as t join DatosEmpresa as de order by sector ',0,sqlgeneral);
           OperacionReporte('LlamadasMes','Reporte de Llamadas Cobranza',TipoImpresion, 1);
           querys('DROP TABLE IF EXISTS TempCobranza'+frmprincipal.idmaq+' ',1,sqlgeneral);
     end;//if 6


     if rgcobranza.ItemIndex = 8 then
     begin
         querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
         querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
         querys('DROP TABLE IF EXISTS temporal_sectorvenceTOTALES'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);

         querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (idcliente integer(11),nombre varchar(100),NombreAbogado varchar(100),saldo float default 0,idabogado integer default 0, idsector int(11), KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);
         querys('INSERT INTO  temporal_sectorvence'+frmprincipal.idmaq+' (idcliente,nombre,NombreAbogado,idabogado, idsector) Select idcliente,'+ClienteNombre('clientes')+' as nombre,if(a.nombre is null,"SIN ABOGADO",a.nombre),clientes.idabogado, clientes.sector from clientes left join abogados as a on (clientes.idabogado=a.idabogado) where clientes.idabogado>0',1,dmaccesos.sqlgeneral);

         cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) LEFT JOIN sectores as s ON (s.idsector=c.sector)   '+
                 'LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) WHERE p.estatus in(3,4) AND restante > 0 and pc.movimiento IN(0,1) and (c.idabogado >0)';
         cadena:=cadena+' GROUP BY pc.idpago';
         querys(cadena,1,dmaccesos.sqlgeneral);

         querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
         querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);
         querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);
         querys('CREATE TABLE temporal_sectorvenceTOTALES'+frmprincipal.idmaq+' SELECT pc.idcliente as cliente,sum(restante) as total FROM PagosClientes as pc   '+
                'INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago) GROUP BY pc.idcliente   ',1,sqlgeneral);
         querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+',temporal_sectorvenceTOTALES'+frmprincipal.idmaq+' SET saldo=total WHERE idcliente=cliente  ',1,sqlgeneral);


         //insertar una nota de cambio de abogado a 0
         querys('SELECT * FROM temporal_sectorvence'+frmprincipal.idmaq+' where saldo =0 ORDER BY idsector, NombreAbogado,idcliente ',0,sqlgeneral);

         while not sqlgeneral.Eof do
          begin
            querys('Select max(idcambio) as total from Cambios', 0, sqlgeneral2);
            querys('Insert into Cambios set idcambio='+quotedstr(inttostr(sqlgeneral2.fieldbyname('total').asinteger+1))+', idprimario='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', tabla=''clientes'' '+
                   ', anterior='+quotedstr(sqlgeneral.fieldbyname('idabogado').asstring)+',nuevo=0, usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha="'+datetostr(date)+'"'+
                   ',hora=""'+timetostr(time)+'"", campo=''idabogado'', pantalla= ''REPORTE-CONCENTRADO_COBRANZA-CUENTAS_ABOGADO'' ',1,sqlgeneral3);
            sqlgeneral.Next;
          end;

         //actualizar todos los clientes con idabogado =0 si no debe absolutamente nada.
         querys('update clientes,temporal_sectorvence'+frmprincipal.idmaq+'  set clientes.idabogado = 0   where  clientes.idcliente= temporal_sectorvence'+frmprincipal.idmaq+'.idcliente  and  temporal_sectorvence'+frmprincipal.idmaq+'.saldo =0',1,sqlgeneral);


         querys('SELECT * FROM temporal_sectorvence'+frmprincipal.idmaq+' where saldo > 0 ORDER BY idsector, NombreAbogado,idcliente ',0,sqlgeneral);
         //pasaAbogadoLuisaARamon;
         OperacionReporte('CuentasConAbogado','Reporte de Cuenta con Abogado',TipoImpresion, 1);
         querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
         querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
         querys('DROP TABLE IF EXISTS temporal_sectorvenceTOTALES'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);

     end;//if 8

     if(rgcobranza.ItemIndex = 9) then
        begin
             querys('SELECT (case 1 when clasificacion =0 then "Cobranza 0-30" when clasificacion =1 then "0-59" when clasificacion = 2 then "60-9999"  when  clasificacion = 3  then "Abogado" end) as Concepto,'+
                    'if(id = 1,"CUENTAS","SALDO") as Tipo,Cobranza.* from Cobranza where fecha = "'+cboano.Text+'" and mes="'+cbomeses.Text+'" AND tipo= "CONSOLIDADO" AND id in (1,2) AND clasificacion in (1,2,3)  ORDER BY id',0,sqlgeneral2);

             if(sqlgeneral2.RecordCount > 0) then
                     OperacionReporte('CobranzaConcDias','Reporte de Llamadas Cobranza',TipoImpresion, 1)
             else
                     Application.MessageBox('No hay datos a mostrar!','Atención',MB_OK);



        end;


end;//reportes

end;
 Screen.Cursor := crDefault;

end;

procedure Tfrmmoduloreportes.AnalisisVentas;
begin
RepAnalisisVentas(dmreportes.sqlgeneral,dmreportes.sqlgeneral2,gbanalisisvta,TipoImpresion,dfecha1.text,dfecha2.text,false);

end;


procedure Tfrmmoduloreportes.CargarColonias;
begin
cargacombo2('SELECT idcol,nombre FROM colonias order by nombre', 'nombre','idcol',cbocolonia1);
cargacombo2('SELECT idcol,nombre FROM colonias order by nombre', 'nombre','idcol',cbocolonia2);
cbocolonia1.itemindex:=0;
cbocolonia2.itemindex:=cbocolonia2.Count -1;
end;

procedure Tfrmmoduloreportes.EstadoCuentaXLotes;
var fecha1,fecha2,valor1,valor2,valor3,valor4,total,total1,total2,cobrador,sector,idcontacto,nota1,nota2,nota3,cliente:string;
//ban,ban2,
ban3:integer;
begin
//PRIMERO VAMOS A VER SI SON POR TODAS O POR UN RANGO
//ban3:=0;
with dmreportes do begin
 RVP.Engine:=dmreportes.RvSystem2;

if chkcolonias.Checked= true then
begin
    ban3:=0;
 end
    else
 begin
    ban3:=1;
end;

if ban3= 0 then
begin

 if rgservicio.ItemIndex= 0 then
         querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector as s from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON(con.TipoCont=c.TipoCont) where con.estatus =1 ORDER BY col.nombre,c.dir,cliente',0,sqlgeneral5)
     else
         if rgservicio.ItemIndex= 1 then
             querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector as s from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON(con.TipoCont=c.TipoCont) ' +
                    'where con.estatus =1 and c.NoPatrulla =0 ORDER BY col.nombre,c.dir,cliente',0,sqlgeneral5)
         else
               if rgservicio.ItemIndex= 2 then
                querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector as s  from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON (con.TipoCont=c.TipoCont) '+
                       'where con.estatus =1 and c.NoPatrulla =1 ORDER BY col.nombre,c.dir,cliente',0,sqlgeneral5);

end else begin
     if rgservicio.ItemIndex= 0 then
          querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector  as s from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON (con.TipoCont=c.TipoCont) where con.estatus =1 and col.nombre BETWEEN '+quotedstr(cbocolonia1.Text)+'  and  '+quotedstr(cbocolonia2.Text)+'  ORDER BY col.nombre,c.dir,cliente',0,sqlgeneral5)
    else
         if rgservicio.ItemIndex= 1 then
           querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector  as s from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON (con.TipoCont=c.TipoCont) where con.estatus =1 and c.NoPatrulla =0  AND '+
                  'col.nombre BETWEEN '+quotedstr(cbocolonia1.Text)+'  and  '+quotedstr(cbocolonia2.Text)+'  ORDER BY col.nombre,c.dir,cliente',0,sqlgeneral5)
         else
               if rgservicio.ItemIndex= 2 then
             querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector  as s from clientes as c left join colonias as col on(col.idcol=c.idcol) left join contratos as con ON (con.TipoCont=c.TipoCont) where con.estatus =1 and col.nombre BETWEEN '+quotedstr(cbocolonia1.Text)+'  and  '+quotedstr(cbocolonia2.Text)+' and c.NoPatrulla =1 ORDER BY col.nombre,c.dir,cliente',0,sqlgeneral5);
 end;


if sqlgeneral5.fieldbyname('cliente').AsString <> '' then begin

lbimprimir.caption:='Cuentas a Imprimir :'+inttostr(sqlgeneral5.recordcount);

while not sqlgeneral5.Eof do begin

cliente := sqlgeneral5.fieldbyname('cliente').AsString;
idcontacto:= SqlGeneral5.FieldByName('contac').AsString;
sector:=SqlGeneral5.FieldByName('s').AsString;

ban:=0;//bandera para saber cuanto debe por periodos
//ban2:=0;//bandera para saber si tiene parcialidades y
cobrador:='';
////GENERAR REPORTE
    if idcontacto <> '' then begin
          querys('SELECT  Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) AS nombre, min(idcontador)  from contactos where idcontacto='+quotedstr(idcontacto)+' and (nombre <> ''TELEFONO 1'' and  nombre <> ''TELEFONO 2''  ) group by idcontacto',0,sqlgeneral);
          idcontacto:=sqlgeneral.fieldbyname('nombre').AsString;
    end;

//buscar el usuario que tiene ese sector para la cobranza
    querys('SELECT Concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' ''))  AS cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) '+
    ' WHERE u.idsector='+quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
    if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
    cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
    else begin
    querys('SELECT Concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' '')) AS cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN UsuarioSector as us ON (us.idusuario=u.idusuario) WHERE us.idsector='+quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
    if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
    cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
    end;
    querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
    querys('CREATE TABLE temporal_estadocuenta'+frmprincipal.idmaq+' (mov integer (11),idcliente integer (11),idpedido integer (11),fechaalta date,fechavence date,total float,saldo float,cobrador varchar(50),estatus integer(11),idpago integer(11),contacto varchar(50),KEY idpedido(idpedido)) ',1,sqlgeneral);

    querys('select idpago,pc.idpedido as ped from PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4) and movimiento = 1',0,sqlgeneral2);

    querys('INSERT INTO temporal_estadocuenta'+frmprincipal.idmaq+'(mov,idcliente,saldo,idpedido,estatus,idpago) SELECT pc.movimiento,pc.idcliente,pc.restante,pc.idpedido,0,pc.idpago FROM PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4) AND pc.restante <> 0 AND pc.movimiento in(0,1) ',1,sqlgeneral);
   if sqlgeneral2.FieldByName('idpago').AsString  <> '' then begin
     while not sqlgeneral2.Eof do begin

         querys('DELETE FROM temporal_estadocuenta'+frmprincipal.idmaq+' WHERE  idpedido='+quotedstr(sqlgeneral2.FieldByName('ped').AsString)+' and mov =0 ',1,sqlgeneral3);
         sqlgeneral2.Next;
     end;                                                                                          //idpago='+quotedstr(sqlgeneral2.FieldByName('idpago').AsString)+' and
   end;

   querys('SELECT idpago,idpedido,idcliente,cargo,FechaAlta,FechaVence,if(FechaVence > "'+datetostr(date)+'",1,0) as estatus  FROM PagosClientes WHERE idcliente='+quotedstr(cliente)+' and movimiento in(0,1) order by idpedido',0,sqlgeneral);     // and saldado = 0  and (estatus=3 or estatus=4)

    while not sqlgeneral.Eof do begin

        querys('UPDATE temporal_estadocuenta'+frmprincipal.idmaq+' SET  fechaalta='+quotedstr(sqlgeneral.fieldbyname('FechaAlta').AsString)+',fechavence='+quotedstr(sqlgeneral.fieldbyname('FechaVence').AsString)+',total='+quotedstr(sqlgeneral.fieldbyname('cargo').AsString)+',estatus='+quotedstr(sqlgeneral.fieldbyname('estatus').AsString)+' '+
               'WHERE idpago='+quotedstr(sqlgeneral.fieldbyname('idpago').AsString),1,dmaccesos.sqlgeneral);
        sqlgeneral.Next;

    end;


///total
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' ''  GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
total:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
delete(total,1,1);
end else total:='0';

//total vencido
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=0 GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
total1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
delete(total1,1,1);
end else total1:='0';

//total x vencer
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=1 GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
total2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
delete(total2,1,1);
end else total2:=' 0';

///cantidad de 0 a 30
fecha1:=datetostr(now-30);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between   '+quotedstr(fecha1)+' AND "'+datetostr(date)+'" and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=1;
end else
valor1:='$ 0';

///cantidad de 31 a 60
fecha1:=datetostr(now-31);
fecha2:=datetostr(now-60);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=2;
end else
valor2:='$ 0';

///cantidad de 61 a 90
fecha1:=datetostr(now-61);
fecha2:=datetostr(now-90);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor3:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=3;
end else
valor3:='$ 0';

///cantidad mas de 90
fecha1:=datetostr(now-90);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence < '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor4:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=4;
end else
valor4:='$ 0';


        querys('SELECT cf.NombreCres AS nombre,c.idcliente,cf.CdCres as ciudad,cf.EstadoCres as estado,cf.DirCres as dir,cf.CPCres as cp,cf.ColCres as col,c.sector as sector,t.fechaalta,'+
               't.fechavence,t.total,t.saldo,'+quotedstr(idcontacto)+' as contacto,concat( ifnull(c.dir,'' ''),'','',ifnull(c.numero,'' ''),'' , COL:'',ifnull(col.nombre,'' '') ) AS DirInst , c.ciudad as CdInst, '+
               't.idpedido,p.concepto,l.nombre as negocio,t.estatus  FROM clientes AS c LEFT JOIN ClientesFact as cf on(cf.idfact=c.idfact) LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) LEFT JOIN temporal_estadocuenta'+frmprincipal.idmaq+' as t ON (t.idcliente=c.idcliente) LEFT JOIN pedidos AS p ON (p.idpedido=t.idpedido) LEFT JOIN DetPedido AS dp ON '+
               '(dp.idpedido=p.idpedido) LEFT JOIN  articulos as a ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) WHERE c.idcliente='+quotedstr(cliente)+' GROUP BY t.idpago Order by estatus',0,sqlgeneral3);


       //mostrar nota correspondiente......
       querys('SELECT concepto,ValorMemo FROM configuraciones',0,sqlgeneral);
       while not sqlgeneral.Eof do begin

           if sqlgeneral.fieldbyname('concepto').AsString='CobNotasPago' then
               nota1:=sqlgeneral.fieldbyname('ValorMemo').AsString;
           if sqlgeneral.fieldbyname('concepto').AsString='CobNotasObs' then
               nota2:=sqlgeneral.fieldbyname('ValorMemo').AsString;
           if ban = 1 then begin
           if sqlgeneral.fieldbyname('concepto').AsString='A30' then
               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
           end;
           if ban = 2 then begin
           if sqlgeneral.fieldbyname('concepto').AsString='A60' then
               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
           end;
           if ban = 3 then begin
           if sqlgeneral.fieldbyname('concepto').AsString='A90' then
               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
           end;
           if ban = 4 then begin
           if sqlgeneral.fieldbyname('concepto').AsString='M90' then
               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
           end;
              sqlgeneral.Next;

       end;

         if sqlgeneral3.fieldbyname('DirInst').AsString  <> '' then
            RVP.SetParam('titulo2',sqlgeneral3.fieldbyname('DirInst').AsString)
         else
            RVP.SetParam('titulo2','');

         if sqlgeneral3.fieldbyname('CdInst').AsString  <> '' then
            RVP.SetParam('tax',sqlgeneral3.fieldbyname('CdInst').AsString)
         else
            RVP.SetParam('tax','');


         //rvsystem2.DefaultDest:=rdprinter;
         RVP.SetParam('titulo1',cobrador);
         RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
         RVP.SetParam('total',total);
         RVP.SetParam('total1',total1);
         RVP.SetParam('total2',total2);
         RVP.SetParam('nota1',nota1);
         RVP.SetParam('nota2',nota3);
         RVP.SetParam('nota3',nota2);
         RVP.SetParam('comodin1',valor1);
         RVP.SetParam('comodin2',valor2);
         RVP.SetParam('comodin3',valor3);
         RVP.SetParam('comodin4',valor4);
        // RVP.ExecuteReport('RepEstadoCuentaC');
         OperacionReporte('RepEstadoCuentaC','Reporte de estado de cuenta',TipoImpresion, 0);

         querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
          nota1:='';
          nota2:='';
          nota3:='';

         sqlgeneral5.Next;
        end;//while
              application.MessageBox('Proceso terminado','Atencion',mb_IconInformation);
      end else begin
             application.MessageBox('No hay cuentas en ese rango','Atencion',mb_IconInformation);
      end;

RVP.Engine:=dmreportes.RvSystem1;
//rvsystem2.DefaultDest:=rdpreview;
   end;//with
end;

procedure Tfrmmoduloreportes.buscarUnidadID;
begin
   UN1:=cbounidad1.Value;
   UN2:=cbounidad2.Value;
end;

procedure Tfrmmoduloreportes.CargarUnidadNeg;
begin
cargacombo2('SELECT idunidadnegocio, nombre FROM UnidadNegocio order by idUnidadNegocio', 'nombre','idunidadnegocio', cbounidad1);
cargacombo2('SELECT idunidadnegocio, nombre FROM UnidadNegocio order by idUnidadNegocio', 'nombre','idunidadnegocio', cbounidad2);
cbounidad1.itemindex:=0;
cbounidad2.itemindex:=cbounidad2.count -1;
end;

procedure Tfrmmoduloreportes.BuscarPedido(p:integer);
begin
  //BUSCAR POR CATALOGO//
 frmbusquedas.query:='SELECT pedidos.idpedido,ifnull(clientes.rsocial,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' ''))) as Cliente,'+
                     'if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                     ',''Facturado'')))) as Estatus,pedidos.FechaRemision,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente)';
      frmbusquedas.campo_retorno:='idpedido';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'pedidos';
      frmbusquedas.ShowModal;

        if frmbusquedas.resultado <> '' then
            begin
                if p = 1 then
                   edpedido1.Text:=frmbusquedas.resultado
                else
                   edpedido2.Text:=frmbusquedas.resultado;
            end;
end;


procedure Tfrmmoduloreportes.VentasMensuales;
begin
Screen.Cursor := crHourglass;
with dmreportes do
 begin
    RepVentasMensuales(sqlgeneral,sqlgeneral2,sqlgeneral3,dfecha1.text,dfecha2.text,TipoImpresion,cbordcli.Text,false);
 end;
end;

procedure Tfrmmoduloreportes.ComisionesVendedor;
  var tipo,total,venta,c:string;
  tc : double;
  cant : integer;
begin

   tc := 0;
   cant := 0;
   total := '';
   Screen.Cursor := crHourglass;
   with dmreportes do
   begin
      venta:='';
      //primero sacamos datos para saber que ventas realizo el vendedor en el periodo hecho .. ok ,
      // despues saber cuanto fue en dolares para realizar el segundo reporte de totales.....
      querys('DROP TABLE IF EXISTS TempComisiones0'+frmprincipal.idmaq,1,sqlgeneral3);
      querys('DROP TABLE IF EXISTS TempComisiones2'+frmprincipal.idmaq,1,sqlgeneral3);
      //Cambie el totaldlls por totalmn/tc no se porque salia algo mal antes
      querys('CREATE TABLE TempComisiones0'+frmprincipal.idmaq+' SELECT  distinct p.idinstal,sum(if (tp.comisiones =1, if (dp.cant > 0, '+
             ' (dp.cant * dp.costo)*dp.tc,(dp.piezas*dp.costo)*dp.tc),0) )as SUMA,sum(if (tp.comisiones =1,if (dp.cant > 0, '+
             ' ((dp.cant * dp.costo)*dp.tc)*'+floattostr(getIVA)+',((dp.piezas*dp.costo)*dp.tc)*'+floattostr(getIVA)+'),0)) as IVA,'+
             ' sum(if (tp.comisiones =1,if (dp.cant > 0, ((dp.cant * dp.costo)*dp.tc)*'+floattostr(1+getIVA)+',((dp.piezas*dp.costo)*dp.tc)*'+
             floattostr(1+getIVA)+'),0)) as Total, sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls, ' +
             ' sum(if (dp.cant > 0,if( (dp.cant * dp.costo)  < 0,dp.cant * dp.costo,0),if( (dp.piezas*dp.costo) < 0,(dp.piezas*dp.costo),0)))as Descuento,'+
             ' if (tp.comisiones = 1,p.TipoCambio,0) as TipoCambio ,p.idpedido as Venta,p.FechaRemision as Fecha, '+
             ' left(ori.nombre,4) as Origen,p.idcliente as Cuenta,u.codigo,c.NombreCres as Cliente,'+
             ' if(cl.tipocont="SEN","SEN",concat(left(tp.nombre,4),right(tp.nombre,1))) as Oport,'+
             ' concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',  '+
             'if (u.amaterno is null,'' '',u.amaterno)) as Vendedor '+
             ' FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dp.cod_cve) '+
             ' LEFT JOIN clientes as cl ON (p.idcliente=cl.idcliente)  '+
             ' LEFT JOIN ClientesFact as c ON (c.idfact=cl.idfact) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
             ' LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio)  '+
             ' WHERE p.FechaRemision between '+quotedstr(dfecha1.text)+' and '+quotedstr(dfecha2.text)+' and p.estatus in(3,4) '+
             ' and left(tp.nombre,4) <> "CCTV" and tp.instalacion =1 and u.codigo='+quotedstr(edbuscarU.Text)+' and a.idlinea = 4  '+
             ' GROUP BY dp.idpedido',1,sqlgeneral2);

      //////////////////////////notas de credito.......
      querys('create table TempComisiones2'+frmprincipal.idmaq+' select distinct p.idpedido,nc.TipoCambio,sum(if (tp.comisiones =1, '+
             'if (dnc.cant > 0, (dnc.cant * dnc.costo),(dnc.piezas*dnc.costo)),0) )as SUMA,sum(if (tp.comisiones =1, if (dnc.cant > 0, '+
             '((dnc.cant * dnc.costo)*nc.TipoCambio)*'+floattostr(getIVA)+', ((dnc.piezas*dnc.costo)*nc.TipoCambio))*'+
             floattostr(getIVA)+',0) )as IVA,sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,'+
             '(dnc.cant * dnc.costo)),if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio,  '+
             ' (dnc.piezas*dnc.costo))),0) ) as ToTDlls '+
             ' from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) '+
             ' LEFT JOIN  RemiFact as rf ON (rf.idfactura=nc.idfactura)  left join pedidos as p ON(p.idpedido=rf.idpedido)   '+
             ' LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
             ' LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaRemision between '+quotedstr(dfecha1.text)+' and '+
             ' '+quotedstr(dfecha2.text)+' and tp.instalacion =1 and u.codigo='+quotedstr(edbuscarU.Text)+' and a.idlinea = 4  '+
             ' GROUP BY dnc.idpedido ',1,sqlgeneral2);

      ///sacar el tipo de cambio
      querys('select t1.idinstal,if(t2.SUMA IS NULL,t1.SUMA,(t1.SUMA-t2.SUMA)) AS SUMA, if(t2.IVA IS NULL,t1.IVA,(t1.IVA-t2.IVA)) AS IVA,'+
             't1.Total,if (t2.TotDlls IS NULL,t1.ToTDlls,(t1.ToTDlls-t2.ToTDlls)) AS TotDlls,t1.Descuento,t1.Venta,t1.Fecha,t1.Origen, '+
             't1.TipoCambio as TipoCambio,t1.Cuenta,t1.codigo,t1.Cliente,t1.Oport,t1.Vendedor FROM TempComisiones0'+frmprincipal.idmaq+
             ' AS t1 LEFT JOIN TempComisiones2'+frmprincipal.idmaq+' as t2 ON(t1.Venta=t2.idpedido)',0,sqlgeneral2);
      if sqlgeneral2.FieldByName('Cliente').AsString <> '' then
      begin
         while not sqlgeneral2.Eof do
         begin
            if (sqlgeneral2.FieldByName('TipoCambio').AsFloat > 1)  then
            begin
               cant := cant +1;
               tc := tc + sqlgeneral2.FieldByName('TipoCambio').AsFloat;
            end;
            sqlgeneral2.Next;
         end;
         if (tc <> 0) and (cant <> 0) then
            tc := strtofloat(format('%8.3f',[tc/cant]));
         tipo:=floattostr(tc);
         //sumar los dolarees
         querys('select sum(if (t2.TotDlls IS NULL,t1.ToTDlls,(t1.ToTDlls-t2.ToTDlls))) AS TotDlls FROM TempComisiones0'+frmprincipal.idmaq+
                ' AS t1 LEFT JOIN TempComisiones2'+frmprincipal.idmaq+' as t2 ON(t1.Venta=t2.idpedido) ',0,sqlgeneral2);
         total := sqlgeneral2.fieldbyname('TotDlls').AsString;
         querys('DROP TABLE IF EXISTS TempComisiones'+frmprincipal.idmaq,1,sqlgeneral3);
         querys('CREATE TABLE TempComisiones'+frmprincipal.idmaq+' (nombre varchar(100),cantidad varchar(50) default 0,total float default 0,id int(11) NOT NULL ) ',1,sqlgeneral3);
         ///////////////////CUENTAS NUEVAS.......
         querys('SELECT  distinct count(tp.nombre) as total,tp.nombre as nom,con.estatus,u.codigo as code '+
                ' FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente)  '+
                ' LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) '+
                ' WHERE  p.FechaRemision between '+quotedstr(dfecha1.text)+' and '+quotedstr(dfecha2.text)+
                ' and p.estatus in(3,4) and tp.instalacion =1 and tp.CuentaNueva = 1 and con.estatus=1 '+
                ' group by u.codigo  order by total desc ',0,sqlgeneral);
         if sqlgeneral.FieldByName('code').AsString = edbuscarU.Text then
         begin
            querys('SELECT * FROM Comisiones where UnidadNegocio = ''BONO MAS CUENTAS'' ',0,sqlgeneral3);
            querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values (''BONO MAS CUENTAS'','+
                   quotedstr(sqlgeneral.fieldbyname('total').AsString)+','+quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString)+',100 ) ',1,sqlgeneral6)
         end;
         sqlgeneral.First;
         while not sqlgeneral.Eof do
         begin
            if sqlgeneral.FieldByName('code').AsString = edbuscarU.Text then
            begin
               querys('SELECT * FROM Comisiones where '+quotedstr(sqlgeneral.fieldbyname('total').AsString)+'  between de and a AND UnidadNegocio = ''CUENTAS'' ',0,sqlgeneral3);
               if sqlgeneral3.fieldbyname('idcomision').AsString <> '' then
                  querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values (''CUENTAS NUEVAS'','+
                  quotedstr(sqlgeneral.fieldbyname('total').AsString)+','+quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString)+',7 ) ',1,sqlgeneral6)
               else
                  querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values (''CUENTAS NUEVAS'','+
                  quotedstr(sqlgeneral.fieldbyname('total').AsString)+',''0'',7 ) ',1,sqlgeneral6);
               sqlgeneral.Last;
            end;
            sqlgeneral.Next;
         end;
         ////////////////////////////BONO////////////////////////////////
         querys('select * from Comisiones where '+quotedstr(total)+'  between de and a AND UnidadNegocio = ''BONO'' ',0,sqlgeneral3);
         if sqlgeneral3.fieldbyname('idcomision').AsString <> '' then
            querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values (''BONO MAS (5000 dlls)'','''','+
            quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString)+',9 ) ',1,sqlgeneral6)
         else
            querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values (''BONO MAS (5000 dlls)'','''',''0'',9 ) ',1,sqlgeneral6);
         //CCTV
         querys('DROP TABLE IF EXISTS tmpComVend7'+frmprincipal.idmaq,1,sqlgeneral3);
         querys('create table tmpComVend7'+frmprincipal.idmaq+' SELECT distinct p.idinstal, p.idpedido as Venta,p.FechaRemision as Fecha, '+
                ' sum(if (tp.comisiones =1, if (dp.cant > 0, (dp.cant * dp.costo)*dp.tc,(dp.piezas*dp.costo)*dp.tc),0) )as SUMA,'+
                ' sum(if (tp.comisiones =1,if(dp.cant>0, ((dp.cant * dp.costo)*dp.tc)*'+floattostr(getIVA)+',((dp.piezas*dp.costo)*dp.tc)*'+
                floattostr(getIVA)+'),'+'0)) as IVA,sum(if (tp.comisiones =1,if (dp.cant > 0, ((dp.cant * dp.costo)*dp.tc)*'+
                floattostr(1+getIVA)+',((dp.piezas*dp.costo)*dp.tc)*'+floattostr(1+getIVA)+'),0)) as Total, '+
                ' sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls, '+
                ' sum(if (dp.cant > 0,if( (dp.cant * dp.costo)< 0,dp.cant * dp.costo,0),if((dp.piezas*dp.costo)<0,(dp.piezas*dp.costo),0)))as Descuento,'+
                ' if (tp.comisiones = 1,p.TipoCambio,0) as TipoCambio, u.codigo, '+UsuarioNombre('u')+' as vendedor, left(tp.nombre,4) as Oport, '+
                ClienteNombre('c')+' as Cliente, left(ori.nombre,4) as Origen, p.idcliente as Cuenta '+
                ' FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) '+
                ' LEFT JOIN articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
                ' LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
                ' left join clientes as c on c.idcliente=p.idcliente LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) '+
                ' WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and p.estatus in(3,4) and tp.instalacion =1 and a.idlinea = 4 '+
                ' and left(tp.nombre,4) = "CCTV" and u.codigo='+quotedstr(edbuscarU.Text)+' '+
                ' GROUP BY dp.idpedido Order by oport',1,sqlgeneral3);
         querys('DROP TABLE IF EXISTS tmpComVend8'+frmprincipal.idmaq,1,sqlgeneral3);
         querys('create table tmpComVend8'+frmprincipal.idmaq+' select distinct p.idpedido, '+
                ' round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
                ' if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls '+
                ' from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
                ' ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) '+
                ' LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
                ' LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
                ' WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and tp.instalacion =1  and a.idlinea = 4  '+
                ' and left(tp.nombre,4) = "CCTV" and u.codigo='+quotedstr(edbuscarU.Text)+' GROUP BY dnc.idpedido',1,sqlgeneral3);
         if querys('select (sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls))) as cctv FROM tmpComVend7'+
                   frmprincipal.idmaq+' as t LEFT JOIN tmpComVend8'+frmprincipal.idmaq+
                   ' as t1 ON(t.venta=t1.idpedido) group by t.codigo, oport order by t.codigo, oport',0,sqlgeneral3) > 0 then
         begin
               querys('select round((('+sqlgeneral3.fieldbyname('cctv').asstring+'*cantidad)/100)*'+floattostr(tc)+',2) as cctv, '+
                      ' cantidad from Comisiones as c where c.UnidadNegocio = "CCTV" and '+sqlgeneral3.fieldbyname('cctv').asstring+
                      ' between de and a', 0, sqlgeneral3);
               querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values ("CCTV",'+
                      quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString)+','+quotedstr(sqlgeneral3.fieldbyname('cctv').AsString)+',10 ) ',1,sqlgeneral6);
               querys('INSERT INTO TempComisiones0'+frmprincipal.idmaq+' (idinstal, SUMA, IVA, Total, ToTDlls, Descuento, TipoCambio, Venta, Fecha, Origen, Cuenta, codigo, Cliente, Oport, Vendedor) '+
                      ' Select idinstal, SUMA, IVA, Total, ToTDlls, Descuento, TipoCambio, Venta, Fecha, Origen, Cuenta, codigo, Cliente, Oport, Vendedor from tmpComVend7'+frmprincipal.idmaq+'',1,sqlgeneral6);
         end;
         querys('DROP TABLE IF EXISTS tmpComVend7'+frmprincipal.idmaq,1,sqlgeneral3);
         querys('DROP TABLE IF EXISTS tmpComVend8'+frmprincipal.idmaq,1,sqlgeneral3);

        //////comision por las ventas
         querys('select * from Comisiones where '+quotedstr(total)+'  between de and a AND UnidadNegocio = ''VENTA'' ',0,sqlgeneral3);
         if sqlgeneral3.fieldbyname('idcomision').AsString <> '' then
         begin
            querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values (''EQUIPO AMPLIACION'','+
            quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString+'%')+',(('+quotedstr(total)+' * ('+quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString)+
            '/100))*'+quotedstr(tipo)+'),8 )',1,sqlgeneral);
         end;
         querys('SELECT  distinct count(tp.nombre) as canti,tp.nombre as nom FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
                'LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) LEFT JOIN UnidadNegocio as tp On   '+
                '(tp.idUnidadNegocio=p.idUnidadNegocio) WHERE p.estatus in(3,4) and p.FechaRemision between '+
                quotedstr(dfecha1.text)+' and '+quotedstr(dfecha2.text)+' and tp.instalacion =1 '+
                'and tp.nombre <> "CCTV" and u.codigo='+quotedstr(edbuscarU.Text)+' GROUP BY tp.nombre ',0,sqlgeneral);
         while not sqlgeneral.Eof do
         begin
            if sqlgeneral.fieldbyname('nom').AsString <> 'EQUIPO' then
            begin
               if sqlgeneral.fieldbyname('nom').AsString = 'CAMBIO CONTROL' then
                  c:='2';
               if sqlgeneral.fieldbyname('nom').AsString = 'ENLACES' then
                  c:='3';
               if sqlgeneral.fieldbyname('nom').AsString = 'CONEXION' then
                  c:='5';
               if sqlgeneral.fieldbyname('nom').AsString = 'RECONEXION' then
                  c:='4';
               querys('select * from Comisiones where UnidadNegocio='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' ',0,sqlgeneral3);
               if sqlgeneral3.fieldbyname('idcomision').AsString <> '' then
               begin
                  querys('INSERT INTO TempComisiones'+frmprincipal.idmaq+' (nombre,cantidad,total,id) values ('+quotedstr(sqlgeneral3.fieldbyname('UnidadNegocio').AsString)+','+quotedstr(sqlgeneral.fieldbyname('canti').AsString)+',('+quotedstr(sqlgeneral3.fieldbyname('cantidad').AsString)+'*'+quotedstr(sqlgeneral.fieldbyname('canti').AsString)+'),'+quotedstr(c)+' ) ',1,sqlgeneral6);
               end;
            end;
            sqlgeneral.Next;
         end;
         querys('select *, " De '+dfecha1.text+' a '+dfecha2.text+'" as periodo from TempComisiones'+frmprincipal.idmaq+
                ' order by id asc',0,sqlgeneral);
         querys('select '+floattostr(tc)+' as totaltc,t1.idinstal,if(t2.SUMA IS NULL,t1.SUMA,(t1.SUMA-t2.SUMA)) AS SUMA, '+
                ' if(t2.IVA IS NULL,t1.IVA,(t1.IVA-t2.IVA)) AS IVA,t1.Total,if (t2.TotDlls IS NULL,t1.ToTDlls,(t1.ToTDlls-t2.ToTDlls)) AS TotDlls,'+
                ' t1.Descuento,t1.Venta,t1.Fecha,t1.Origen,t1.TipoCambio as TipoCambio,t1.Cuenta,t1.codigo,t1.Cliente,t1.Oport,t1.Vendedor, '+
                ' if(oport = "CCTV", 1, 0) as cctv FROM TempComisiones0'+frmprincipal.idmaq+' AS t1 LEFT JOIN TempComisiones2'+
                frmprincipal.idmaq+' as t2 ON(t1.Venta=t2.idpedido)',0,sqlgeneral2);
         //ComisionesVendedorCasa;
         Screen.Cursor := crDefault;
         frmmensaje.Close;
         OperacionReporte('ComisionesVendedores','Reporte de comisiones vendedores',TipoImpresion, 1);
      end
      else
      begin
         frmmensaje.Close;
         application.MessageBox('No hay datos a mostrar','Atención',mb_IconInformation);
      end;
      Screen.Cursor := crDefault;
      querys('DROP TABLE IF EXISTS TempComisiones'+frmprincipal.idmaq,1,sqlgeneral3);
      querys('DROP TABLE IF EXISTS TempComisiones0'+frmprincipal.idmaq,1,sqlgeneral3);
      querys('DROP TABLE IF EXISTS TempComisiones2'+frmprincipal.idmaq,1,sqlgeneral3);
   end;//with
end;

procedure Tfrmmoduloreportes.DiarioVentas;
begin
buscarUnidadID;
RepDiarioVentas(dmreportes.sqlgeneral,dmreportes.sqlgeneral2,ckbRsimple,cbomovimientos,cbosector1,cbosector2,chkgfolios,TipoImpresion,UN1,UN2,dfecha1.text,dfecha2.text,false);
end;

procedure Tfrmmoduloreportes.ComisionesInstalador;
var cadena2, sinusr, conusr:string;
begin
Screen.Cursor := crHourglass;
with dmreportes do begin
querys('DROP TABLE IF EXISTS temporal_instalaciones'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
cadena:='CREATE TABLE temporal_instalaciones'+frmprincipal.idmaq+' SELECT sum(a.tinstalacioncom*dp.cant) as TiempoCable,dp.idpedido as pedido from DetPedido as dp join usuarios as u inner join pedidos as p on(p.idpedido=dp.idpedido) INNER JOIN instalaciones as  i ON (i.idpedido=p.idpedido) '+
        ' inner join articulos as a on(a.cod_cve=dp.cod_cve) where i.FechaFinal between '+quotedstr(dfecha1.text)+' and '+quotedstr(dfecha2.text)+' and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and dp.cod_cve =''CAB'' ';
sinusr:='';
conusr:='';
 if ckbtodos.Checked = false then
   begin

   if  edusuario1.Text <> 'SIN' then
     conusr :='AND u.codigo = "'+edusuario1.Text+'" '
   else
      conusr := 'and instalador1 = "" and instalador2 ="" ';
   end;

    cadena:=cadena +conusr+' GROUP BY p.idpedido ';
    querys(cadena,1,sqlgeneral2);

cadena:= 'SELECT "Del '+dfecha1.text +' al '+dfecha2.Text+'" as periodo, if(instalador2 <> "", (i.TExtra)/2, i.TExtra) as TExtra, if(instalador2 <> '+
         '"", (p.TotHrsCom + i.TExtra)/2, (p.TotHrsCom + i.TExtra)) as horas2, i.idinstalacion as Instal, p.idpedido, u.codigo,  p.idcliente, '+
         'if(u.codigo = "", "SIN INSTALADOR", '+UsuarioNombre('u')+') as Instalador, '+ClienteNombre('c')+' as Cliente, '+
         'LEFT(tp.nombre,3) as oportunidad,min(rf.FechaAlta) as FechaAlta,ori.nombre as origen,if (((i.HojaRev is null) or  (i.HojaRev =0)), "NO", '+
         '"SI") as HE, if(((i.Chklist is null) or (i.Chklist =0)),"NO","SI")as CL,if (((i.planos is null) or (i.planos =0)),"NO","SI") AS PL, '+
         'if(((i.cuestionario is null) or (i.cuestionario =0)),"NO","SI") AS CT, p.TotHrsCom as Horas, p.CostoHrs,p.TipoCambio,p.MontoHrs as MN, '+
         'i.FechaInicio,i.FechaFinal, (CASE  1 WHEN  i.EstatusInst=0 THEN "PENDIENTE" WHEN  i.EstatusInst=1 THEN "INSTALANDO" WHEN  i.EstatusInst=2 '+
         'THEN "SUPERVISION" WHEN  i.EstatusInst=3 THEN "SUPERV. C/PROB INST" WHEN  EstatusInst=4 THEN "UBICACION" WHEN i.EstatusInst=5 THEN "CUESTIONARIO" '+
         'WHEN ((i.HojaRev IS NULL) AND (Chklist IS NULL) AND (planos IS NULL)) THEN "INSTALACION" END) AS ESTADO,rf.FechaAlta as fentrega,ti.TiempoCable '+
         'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido)  '+
         'left join usuarios as u  on (u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) '+
         'LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio = p.idUnidadNegocio) LEFT JOIN origen as ori ON '+
         '(ori.idorigen=p.idorigen) INNER JOIN RemiFact as rf ON (rf.idpedido=p.idpedido) left join temporal_instalaciones'+frmprincipal.idmaq+' as ti on(ti.pedido=p.idpedido) '+
         'WHERE i.FechaFinal between "'+dfecha1.text+'" and "'+dfecha2.text+'" and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) '+
         'and ObraEnProceso = 0 ';


  cadena:=cadena +conusr+' GROUP BY p.idpedido, u.codigo '+sinusr+'ORDER BY Instalador,i.FechaInicio';

 querys(cadena,0,sqlgeneral2);


 cadena2 := 'SELECT "Del '+dfecha1.text +' al '+dfecha2.Text+'" as periodo, 0 as TExtra, if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) as horas2, '+
         'cs1.nombre as avreal, cs.nombre as pcs, if(cs2.nombre is null, 0, cs2.nombre) as pcs2, cs.nombre - if(cs2.nombre is null, 0, cs2.nombre) as '+
         'porcentaje, ((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100 as apagar, '+
         'i.idinstalacion as Instal, p.idcliente, p.idpedido, u.codigo, if(u.codigo is null, "SIN INSTALADOR",'+UsuarioNombre('u')+') as Instalador, '+
         ClienteNombre('c')+' as Cliente, LEFT(tp.nombre,3) as oportunidad, min(rf.FechaAlta) as FechaAlta, ori.nombre as origen, '+
         'if(((i.HojaRev is null) or  (i.HojaRev =0)),"NO","SI") as HE, if(((i.Chklist is null) or (i.Chklist =0)),"NO","SI") as CL, '+
         'if(((i.planos is null) or (i.planos =0)),"NO","SI") AS PL, if (((i.cuestionario is null) or (i.cuestionario =0)),"NO","SI") AS CT, '+
         'p.TotHrsCom as Horas, p.CostoHrs, p.TipoCambio,p.MontoHrs as MN, i.FechaInicio,i.FechaFinal, (CASE  1 WHEN i.EstatusInst = 0 THEN '+
         '"PENDIENTE" WHEN  i.EstatusInst=1 THEN "INSTALANDO" WHEN  i.EstatusInst=2 THEN "SUPERVISION" WHEN  i.EstatusInst=3 THEN '+
         '"SUPERV. C/PROB INST" WHEN  EstatusInst=4 THEN "UBICACION" WHEN i.EstatusInst=5 THEN "CUESTIONARIO" WHEN ((i.HojaRev IS NULL) '+
         'AND (Chklist IS NULL) AND (planos IS NULL)) THEN "INSTALACION" END) AS ESTADO, rf.FechaAlta as fentrega, ti.TiempoCable '+
         'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u  on (u.codigo=i.instalador1 '+
         'and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto '+
         'LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) left join temporal_instalaciones'+frmprincipal.idmaq+' as ti on(ti.pedido=p.idpedido) '+
         'LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) '+
         'INNER JOIN RemiFact as rf ON (rf.idpedido=p.idpedido) Left join ObrasProceso as op on op.idinstalacion = i.idinstalacion '+
         'left join (select o.idstatus, cs.nombre, o.idinstalacion from ObrasProceso as o left '+
         'join clasif_servicios as cs on cs.idstatus=o.idstatus and cs.idserv = 10 where idobra in (Select max(idobra) as idobra from ObrasProceso '+
         'as o where FechaObra between "'+dfecha1.text+'" and "'+dfecha2.text+'" group by idinstalacion) group by idinstalacion) as cs '+
         'on cs.idinstalacion = i.idinstalacion left join (select o2.idstatus, cs2.nombre, o2.idinstalacion from ObrasProceso as o2 '+
         'left join clasif_servicios as cs2 on cs2.idstatus=o2.idstatus and cs2.idserv = 10 where idobra in (Select max(idobra) as idobra '+
         'from ObrasProceso as o where FechaObra < "'+dfecha1.text+'" group by idinstalacion) group by idinstalacion ) as cs2 on '+
         'i.idinstalacion=cs2.idinstalacion left join clasif_servicios as cs1 on cs1.idstatus=i.idstatus and cs1.idserv = 10 '+
         'WHERE  p.estatus IN(3,4) and ObraEnProceso = 1 and op.FechaObra between "'+dfecha1.text+'" and "'+dfecha2.text+'" ';

    cadena2:=cadena2 +conusr+' GROUP BY p.idpedido, u.codigo '+sinusr+'ORDER BY Instalador,i.FechaInicio';

  querys(cadena2,0,sqlgeneral3);

    if sqlgeneral2.FieldByName('Cliente').AsString <> '' then begin
          Screen.Cursor := crDefault;
         frmmensaje.Close;
         OperacionReporte('ComisionesInstaladores','Reporte de comisiones intaladores',TipoImpresion, 1);


    end else begin
           Screen.Cursor := crDefault;
         application.MessageBox('No hay datos a mostrar','Atención',mb_IconInformation);
    end;
    querys('DROP TABLE IF EXISTS temporal_instalaciones'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
end;//with
end;

procedure Tfrmmoduloreportes.FacturasCanceladas;
begin
if rgmotcancel.ItemIndex = 0 then
  RepFacturasCanceladas(dmreportes.sqlgeneral2,dmreportes.sqlgeneral3,TipoImpresion,dfecha1.text,dfecha2.text,false)
else
  RepMotCancelacion(dfecha1.text,dfecha2.text);
end;

procedure  Tfrmmoduloreportes.CobrosCaja;
begin
with dmreportes do begin
cadena:='';

querys('DROP TABLE IF EXISTS TemporalCobros'+frmprincipal.idmaq,1,sqlgeneral3);

cadena:='CREATE TABLE TemporalCobros'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idcliente,pc.idpedido,pc.idfactura,'+
        ' pc.idremicion,if (tp.nombre=''EFECTIVO'',abono,cargo) as EFECTIVO,if (tp.nombre=''CHEQUE'',abono,cargo) as CHEQUE,'+
        ' if (tp.nombre=''TARJETA'',abono,cargo) as TARJETA,abono,'+
        'tb.nombre AS BANCO,recibo,FechaAlta,tp.nombre as TipoPago,c.sector,'+
        'concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '','+
        'if (u.amaterno is null,'' '',u.amaterno)) as vendedor,'+
        'if (c.bloqueado=1,''SI'',''NO'') as bloqueado,cheque as cheques '+
        ' FROM PagosClientes as pc LEFT JOIN pedidos as pe ON (pe.idpedido=pc.idpedido) '+
        ' LEFT JOIN clientes as c ON (pc.idcliente=c.idcliente) LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario)   '+
        ' LEFT JOIN TiposPagos as tp ON (tp.iniciales = pc.TipoPago) LEFT JOIN TiposBancos as tb ON (tb.iniciales = pc.TipoPago2) '+
        ' LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser)  '+
        ' WHERE pe.estatus in(3,4,6) and  pc.movimiento=2 AND  '+
        ' pc.FechaAlta between '+quotedstr(datetostr(tpdesde.date))+' '+
        ' and '+quotedstr(datetostr(tphasta.date))+' and pc.TipoCobro=1 ';
                                                                         /// LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto)      a.nombre=''VENTAS'' AND p.nombre=''CAJA'' and
      if ckbtodos.Checked = false then
         cadena:=cadena +'and u.idusuario BETWEEN '+quotedstr(edusuario1.Text)+' AND '+quotedstr(edusuario2.Text);

        //cadena:=cadena +' order by pc.idpago asc';
querys(cadena,1,sqlgeneral2);

querys('SELECT idcliente,idpedido,idfactura,idremicion,sum(EFECTIVO),sum(CHEQUE),sum(TARJETA),sum(abono),cheques,BANCO,recibo,FechaAlta,sector,bloqueado,vendedor FROM TemporalCobros'+frmprincipal.idmaq+' GROUP BY idpedido,vendedor order by vendedor,idfactura asc ',0,sqlgeneral2);
    if sqlgeneral2.FieldByName('idcliente').AsString <> '' then begin
         frmmensaje.Close;
         OperacionReporte('CobrosCaja','Reporte de cobros en caja',TipoImpresion, 1);
    end else begin
         frmmensaje.Close;
         application.MessageBox('No hay datos a mostrar','Atención',mb_IconInformation);
    end;
querys('DROP TABLE IF EXISTS TemporalCobros'+frmprincipal.idmaq,1,sqlgeneral3);
end;//with dm
end;

procedure Tfrmmoduloreportes.CargarLineas;
begin
cargacombo('SELECT nombre FROM lineas order by idlinea', 'lineas',cbolineas1);
cbolineas1.itemindex:=0;
cargacombo('SELECT nombre FROM lineas order by idlinea', 'lineas',cbolineas2);
cbolineas2.itemindex:=cbolineas2.count -1;
end;


procedure Tfrmmoduloreportes.BuscarUsuario(u:integer);
begin
  //BUSCAR POR CATALOGO//
  frmbusquedas.query:='Select u.idusuario,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Nombre,u.codigo as Codigo,u.idsector as Sector,a.nombre as Area,p.nombre as Puesto  '+
                      'From usuarios as u LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE u.estatus = 1 order by u.idusuario';
  frmbusquedas.campo_retorno:='idusuario';
  frmbusquedas.tblorigen:='usuarios';
  frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
                if u = 1 then
                   edusuario1.Text:=frmbusquedas.resultado
                else
                   edusuario2.Text:=frmbusquedas.resultado;
            end;
end;

procedure Tfrmmoduloreportes.Pagosxlinea;
begin
Screen.Cursor := crHourglass;
printer.PrinterIndex := printer.Printers.IndexOf('Microsoft Office Document Image Writer');
RepPagosXLinea(datetostr(dfecha1.date),datetostr(dfecha2.date),edusuario1.text,edusuario2.text,TipoImpresion,ckbtodos.Checked,false, ckanualidad.checked);
Screen.Cursor := crDefault;
end;

procedure Tfrmmoduloreportes.TarjetaCliente;
var //fecha,total,tel,contac
orden:string;
begin
if rbfecha.Checked = true then
  orden:='pc.FechaAlta asc'
else
  orden:='pc.idpedido asc';
RepTarjetaCliente(edbuscar.text, TipoImpresion, orden, dfecha1.date, dfecha2.date);
frmmensaje.close;

end;

procedure Tfrmmoduloreportes.EstadoCuenta;
begin
RepEstadoCuenta(edbuscar.text, TipoImpresion);
end;

procedure Tfrmmoduloreportes.BuscarEstCuenta;
begin
with dmreportes do
  begin
  querys('SELECT ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) AS nombre,c.idcliente as cuenta,c.ciudad,c.estado,c.numero as numero,'+
        'c.dir,col.cp,col.nombre as col,c.sector as sector,idcontacto FROM clientes AS c LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) WHERE c.idcliente='+quotedstr(edbuscar.Text),0,sqlgeneral);

  if SqlGeneral.FieldByName('cuenta').AsString <> '' then
    begin
    if TabPrincipal.ActivePage = TabClientes then
      begin
        case TabClientes2.TabIndex of
        1:begin
          idcontacto:= SqlGeneral.FieldByName('idcontacto').AsString;
          lnombre.Caption:=SqlGeneral.FieldByName('nombre').AsString;
          ldir.Caption:=SqlGeneral.FieldByName('dir').AsString+' '+SqlGeneral.FieldByName('numero').AsString+',COL:'+SqlGeneral.FieldByName('col').AsString;;
          lsector.Caption:=SqlGeneral.FieldByName('sector').AsString;
          end;
        end;//casse
      end;//Tabprincipal
    end
  else
    begin
    application.MessageBox('No existe esta cuenta!','Atención',mb_iconwarning);
    edbuscar.Text:='';
    edbuscar.SetFocus;
    end;//if recordcount
  end;
end;

procedure Tfrmmoduloreportes.BuscarCuenta;
begin
  with frmbusquedas do
    begin
    query:='Select idcliente,if(nombre<>'' '' and apaterno<>'' '' and amaterno<>'' '',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
           ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes order by idcliente';
    campo_retorno:='idcliente';
    campo_busqueda:='Nombre';
    tblorigen:='clientes';
    cbofiltro.ItemIndex:=1;
    cbofiltro.OnClick(self);
    ShowModal;
        if resultado <> '' then
           begin
           if (tabclientes2.ActivePageIndex =7) then
              begin
              edbuscar.Text:= resultado;
              buscarEstCuenta;
              end;
           if (TabCentral2.ActivePageIndex =7) then
              begin
              edCcliente.Text := resultado;
              datosclicentral;
              end;
           if (TabCentral2.ActivePageIndex =9) then
              begin
              edCcliente.Text := resultado;
              end;
          if tabinv2.ActivePageIndex = 2 then
             cadena := resultado;
           end;
    end;
end;


procedure Tfrmmoduloreportes.buscarsectorID;
begin
   querys('SELECT idsector FROM sectores where nombre='+quotedstr(cbosector1.Text),0,dmaccesos.sqlgeneral);
   sector1:=dmaccesos.sqlgeneral.fieldbyname('idsector').AsString;
   querys('SELECT idsector FROM sectores where nombre='+quotedstr(cbosector2.Text),0,dmaccesos.sqlgeneral);
   sector2:=dmaccesos.sqlgeneral.fieldbyname('idsector').AsString;
end;

procedure Tfrmmoduloreportes.Antiguedadxlinea;
begin
buscarUnidadID;
buscarsectorID;
RepAntiguedadSaldos(cboAntXLineaTipo.ItemIndex,dmreportes.sqlgeneral, dmreportes.sqlgeneral2,dmreportes.sqlgeneral3,ckbnormales,ckbforzosos,ckbbloqueados,ckbabogado,cbomovimientos,cbosector1,cbosector2,TipoImpresion,UN1,UN2,dfecha1.text,dfecha2.text,false,chkDesAplicar.checked,chkSinEnlace.checked);
end;

procedure Tfrmmoduloreportes.inventarioxfecha;
var cadena, cadena2, m, estatus:string;
begin
if chordenarticulos.text ='CODIGO' then
  cadena2 := cadena2 + 'codigo asc'
else
  if chordenarticulos.text ='NOMBRE' then
    cadena2 := cadena2 + 'descripcion asc'
  else
    if chordenarticulos.text ='PROVEEDOR' then
      cadena2 := cadena2 +'proveedor asc'
    else
      cadena2 := cadena2 + 'codigo asc';

  case cboEstatusArt.itemindex of
    0: estatus := 'and a.status = 1 ';
    1: estatus := 'and a.status = 0 ';
    2: estatus := 'and a.status in (0,1) ';
    end;
inventarioxfecha2(dfecha1.text,dfecha2.text, 'D', estatus);

if dfecha2.text <  datetostr(today) then
  begin
  inventarioxfecha2(dfecha2.text,datetostr(today), 'A', estatus);

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


  cadena := 'select *, "Del '+dfecha1.text+' al '+dfecha2.text+'" as fechaini from tmpInventariosD'+frmprincipal.idmaq+' order by ';
  end
else
  begin

  cadena := 'select *, "Del '+dfecha1.text+' al '+dfecha2.text+'" as fechaini from tmpInventariosD'+frmprincipal.idmaq+' order by ';
  end;

if rginventario.ItemIndex = 1 then
  begin
  m := floattostr(DaysBetween(strtodate(dfecha1.text),strtodate(dfecha2.text))/30);
  if m = '' then
    m := '1';
  cadena := 'SELECT t.codigo, t.descripcion, t.InvIni, t.COMPRA, t.AJUSTEENTRADA, t.DEVVENTAS, t.VENTAS, t.AJUSTESALIDA, '+
            't.DEVCOMPRAS, t.apartado, t.existencia, t.minimo, t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado as salidas, '+
            'if ((t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado ) - minimo < 0, 0,(t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS '+
            '+ t.apartado ) - minimo)  as Orden, (t.VENTAS + t.AJUSTESALIDA + t.DEVCOMPRAS + t.apartado) / round('+m+') as promedio, '+
            't.PendAsig, t.InvReal,"Del '+dfecha1.text+' al '+dfecha2.text+'" as fechaini FROM tmpInventariosD'+frmprincipal.idmaq+' AS t order by ';
  end;
querys(cadena+cadena2,0,dmreportes.sqlgeneral);


   if  dmreportes.sqlgeneral.RecordCount > 0 then
     begin
     frmmensaje.Close;
     if rginventario.ItemIndex = 0 then
       OperacionReporte('InventarioXfechas','Reporte de inventarios',TipoImpresion, 1)
     else
       OperacionReporte('InventarioXfechasOrden','Reporte de inventarios para Orden de Compra',TipoImpresion, 1);
     end
   else
     application.MessageBox('No hay datos de articulos!','Confirmación',mb_iconwarning);

  querys('DROP TABLE IF EXISTS temporal_inventariosD'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS temporal_inventariosA'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS tmpInventariosD'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS tmpInventariosA'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
end;

procedure Tfrmmoduloreportes.inventarioxfecha2(f1, f2, tabla, estatus:string);
var cadena:string;
begin
with dmreportes do
  begin
  querys('DROP TABLE IF EXISTS tmpInventarios'+tabla+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  cadena := 'CREATE TABLE tmpInventarios'+tabla+frmprincipal.idmaq+' SELECT cod_cve as codigo,a.nombre as descripcion, 0 as InvIni, '+
            '0 as "COMPRA", 0 as "AJUSTEENTRADA", 0 as "DEVVENTAS", 0 as "VENTAS", 0 as "AJUSTESALIDA", 0 as "DEVCOMPRAS", '+
            '(existencia/piezasxunidad) as existencia, piezasxunidad, maximo, minimo, 0 Resurtido, 0 as apartado, 0 as PendAsig, 0 as InvReal, 0 as NADA, '+
            ClienteNombre('p')+' as proveedor FROM articulos as a left join proveedores as p on p.idprov=a.idproveedor '+
            'WHERE inventariable = 1 and  (servicio = 0 and paquete = 0) '+estatus+' ';



  querys(cadena+estatus,1,sqlgeneral);

  //COMPRAS
  querys('select cod_cve as cod, sum(cant_ord) as cant from compras c left join DetCompras dc on dc.idcompra=c.idcompra '+
         'where c.FechaCompra between "'+f1+'" and "'+f2+'" group by cod_cve', 0, sqlgeneral1);
  sqlgeneral1.First;
  while not sqlgeneral1.Eof = true do
    begin
    querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set COMPRA = "'+sqlgeneral1.fieldbyname('cant').AsString+'" '+
           'where codigo = "'+sqlgeneral1.fieldbyname('cod').AsString+'"', 1, sqlgeneral2);
    sqlgeneral1.Next;
    end;

  //OTRAS ENTRADAS Y OTRAS SALIDAS
  querys('select cod_cve as cod, sum(cant_ord) as cant, ces.movimiento from AjusteInv ai left join DetAjusteInv di '+
         'on di.idajuste=ai.idajuste left join ConceptoES ces on ces.idconcepto_ES=ai.idconcepto_ES where ai.FechaAlta '+
         'between "'+f1+'" and "'+f2+'" group by cod_cve, ces.movimiento order by movimiento', 0, sqlgeneral1);
  sqlgeneral1.First;
  while not sqlgeneral1.Eof = true do
    begin
    if sqlgeneral1.fieldbyname('movimiento').AsString = 'E' then
      querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set AJUSTEENTRADA = "'+sqlgeneral1.fieldbyname('cant').AsString+'" '+
             'where codigo = "'+sqlgeneral1.fieldbyname('cod').AsString+'"', 1, sqlgeneral2)
    else
      querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set AJUSTESALIDA = "'+sqlgeneral1.fieldbyname('cant').AsString+'" '+
             'where codigo = "'+sqlgeneral1.fieldbyname('cod').AsString+'"', 1, sqlgeneral2);

    sqlgeneral1.Next;
    end;

  //VENTAS
  querys('select sum(cant) as cant, dp.cod_cve as cod from DetPedido as dp left join pedidos as p ON dp.idpedido=p.idpedido '+
         'left join articulos as a ON a.cod_cve=dp.cod_cve where p.FechaRemision between "'+f1+'" and "'+f2+'" '+
         'and p.estatus in(3,4) and a.inventariable =1 and a.servicio=0 and a.paquete=0 '+estatus+' group by dp.cod_cve', 0, sqlgeneral1);
  sqlgeneral1.First;
  while not sqlgeneral1.Eof = true do
    begin
    querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set VENTAS = "'+sqlgeneral1.fieldbyname('cant').AsString+'" '+
           'where codigo = "'+sqlgeneral1.fieldbyname('cod').AsString+'"', 1, sqlgeneral2);
    sqlgeneral1.Next;
    end;


  //DEVOLUCIONES PROVEEDORES
  querys('select cod_cve as cod, sum(cant_ord) as cant from DevCompras c left join DetDevCompras dc on dc.iddev=c.iddev where c.FechaDev '+
         'between "'+f1+'" and "'+f2+'" group by cod_cve', 0, sqlgeneral1);
  sqlgeneral1.First;
  while not sqlgeneral1.Eof = true do
    begin
    querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set DEVCOMPRAS = "'+sqlgeneral1.fieldbyname('cant').AsString+'" '+
           'where codigo = "'+sqlgeneral1.fieldbyname('cod').AsString+'"', 1, sqlgeneral2);
    sqlgeneral1.Next;
    end;


  //DEVOLUCIONES CLIENTES
  querys('select sum(cant) as cant ,dp.cod_cve as cod from DetPedido as dp left join pedidos as p ON dp.idpedido=p.idpedido left join '+
         'articulos as a ON a.cod_cve=dp.cod_cve where p.FechaRemision between "'+f1+'" and "'+f2+'" and p.estatus '+
         'in(5) and a.inventariable = 1 and a.servicio = 0 and a.paquete=0 and a.status=1 group by dp.cod_cve UNION ALL select '+
         'sum(if(dn.cant is null, dp.cant,dp.cant-dn.cant)) as cant, dp.cod_cve as cod from DetPedido as dp left join pedidos as p '+
         'ON dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve left join instalaciones as i ON i.idpedido=p.idpedido '+
         'left join UnidadNegocio as uni on uni.idUnidadNegocio=p.idUnidadNegocio inner join DetNotasCredito as dn on (dn.idpedido = p.idpedido '+
         'and dp.cod_cve= dn.cod_cve) where p.FechaRemision between "'+f1+'" and "'+f2+'" and  p.estatus in(3,4) and '+
         'i.FechaInicio is null and a.inventariable = 1 and a.servicio = 0 and a.paquete = 0 '+estatus+' and uni.instalacion = 1 and '+
         'i.estatus = 0 group by dp.cod_cve,dp.idpedido having cant > 0 order by cod', 0, sqlgeneral1);
  sqlgeneral1.First;
  while not sqlgeneral1.Eof = true do
    begin
    querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set DEVVENTAS = "'+sqlgeneral1.fieldbyname('cant').AsString+'" '+
           'where codigo = "'+sqlgeneral1.fieldbyname('cod').AsString+'"', 1, sqlgeneral2);
    sqlgeneral1.Next;
    end;


   //PENDIENTE DE ASIGNACION
   querys('select sum(cant) as cant , cod,  FechaInicio from ( '+
          'select '+
          'sum(if(dn.cant is null, if(dp.cant_salida > 0, dp.cant-dp.cant, dp.cant),dp.cant -dn.cant)) as cant , '+
          'dp.cod_cve as cod,if (i.FechaInicio < "1950/01/01", "",i.FechaInicio) as FechaInicio from DetPedido as dp '+
          ' left join pedidos as  p ON(dp.idpedido=p.idpedido) left join articulos as a ON(a.cod_cve=dp.cod_cve)  left join instalaciones as i ON (i.idpedido=p.idpedido) left join UnidadNegocio as uni on(uni.idUnidadNegocio=p.idUnidadNegocio) '+
          ' left join DetNotasCredito as dn on (dn.idpedido = p.idpedido and dp.cod_cve= dn.cod_cve ) where  p.estatus in(3,4) and i.FechaInicio is null and a.inventariable =1 '+
          ' and a.servicio=0 and a.paquete = 0 '+estatus+' and uni.instalacion = 1 and i.estatus = 0 group by dp.cod_cve,dp.idpedido having FechaInicio is null and cant > 0 '+
          ' )  as t group by cod  order by cod',0,sqlgeneral1);
   sqlgeneral1.First;
   while not sqlgeneral1.Eof do
     begin
     querys('UPDATE tmpInventarios'+tabla+frmprincipal.idmaq+' SET PendAsig = '+sqlgeneral1.FieldByName('cant').AsString+' WHERE  codigo="'+sqlgeneral1.FieldByName('cod').AsString+'"',1,sqlgeneral2);
     sqlgeneral1.Next;
     end;

   //APARTADO
   querys('select sum(cant) as cant , cod from ( '+
          'select if(dn.cant is null, dp.cant,dp.cant -dn.cant) as cant, dp.cod_cve as cod from DetPedido as dp left join pedidos as  p '+
          'ON dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve left join DetNotasCredito as dn on (dn.idpedido = '+
          'p.idpedido and dp.cod_cve= dn.cod_cve ) where p.estatus =0 and a.inventariable =1 and a.servicio=0 and a.paquete = 0 and a.status = 1 '+
          ' )  as t group by cod  order by cod',0,sqlgeneral1);
   sqlgeneral1.First;
   while not sqlgeneral1.Eof do
     begin
     querys('UPDATE tmpInventarios'+tabla+frmprincipal.idmaq+' SET apartado = '+sqlgeneral1.FieldByName('cant').AsString+' WHERE  codigo="'+sqlgeneral1.FieldByName('cod').AsString+'"',1,sqlgeneral2);
     sqlgeneral1.Next;
     end;


   querys('Update tmpInventarios'+tabla+frmprincipal.idmaq+' set Resurtido= maximo-existencia, InvReal = existencia+apartado+PendAsig', 1, sqlgeneral2);
   querys('update tmpInventarios'+tabla+frmprincipal.idmaq+' SET InvIni=(DEVCOMPRAS+AJUSTESALIDA+VENTAS+existencia+apartado)-(COMPRA+AJUSTEENTRADA+DEVVENTAS),Resurtido=maximo-existencia,InvReal=existencia+apartado+PendAsig',1,sqlgeneral2);

   querys('update tmpInventarios'+tabla+frmprincipal.idmaq+' SET InvIni = 0 where InvIni is null ',1,sqlgeneral2);   querys('update tmpInventarios'+tabla+frmprincipal.idmaq+'  SET  Resurtido = 0 where Resurtido is null ',1,sqlgeneral2);
   querys('update tmpInventarios'+tabla+frmprincipal.idmaq+' SET InvReal = 0 where InvReal is null ',1,sqlgeneral2);querys('update tmpInventarios'+tabla+frmprincipal.idmaq+' SET existencia = 0 where existencia is null ',1,sqlgeneral2);

  end;

end;



procedure Tfrmmoduloreportes.actualizar(fecha1,fecha2,campo:string);
begin
  ////no aparexcan pagos si tienen parcialidades
  if campo <> 'condicion4' then                                                             //<> 3              <> 0
      querys('SELECT sum(pc.restante) as total,pc.idcliente as cli,pc.idpedido,l.idlinea, l.nombre as linea  '+
      ' FROM PagosClientes as pc LEFT JOIN pedidos as p ON(p.idpedido=pc.idpedido) '+
      ' left join UnidadNegocio u on u.idunidadnegocio=p.idUnidadNegocio '+
      ' left join lineas l on l.idlinea=u.idlinea '+
      ' WHERE p.estatus in(3,4) and pc.movimiento in(0,1,4) AND pc.restante <> 0 '+
      'AND pc.FechaVence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+
      ' AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' GROUP BY pc.idpedido,l.idlinea',0,dmreportes.sqlgeneral2)
  else
      querys('SELECT sum(pc.restante) as total,pc.idcliente as cli,pc.idpedido,l.idlinea, l.nombre as linea  '+
      ' FROM PagosClientes as pc LEFT JOIN pedidos as p ON(p.idpedido=pc.idpedido) '+
      ' left join UnidadNegocio u on u.idunidadnegocio=p.idUnidadNegocio '+
      ' left join lineas l on l.idlinea=u.idlinea '+
      ' WHERE p.estatus in(3,4) and pc.movimiento in(0,1,4) AND pc.restante <> 0 AND pc.FechaVence < '+quotedstr(fecha1)+
      ' AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' GROUP BY pc.idpedido, l.idlinea',0,dmreportes.sqlgeneral2);
  while not dmreportes.sqlgeneral2.Eof do
  begin
     querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'=('+campo+' + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '1') then //monitoreo
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'mon=('+campo+'mon + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '2') then // intereses
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'int=('+campo+'int + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '3') then //servicio
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'ser=('+campo+'ser + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '4') then //equipo
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'eq=('+campo+'eq + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '5') then //otros
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'ot=('+campo+'ot + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     dmreportes.sqlgeneral2.Next;
  end;
end;

procedure Tfrmmoduloreportes.SectoresVencidos;
var cadena,fecha1,fecha2,servicio,user,passwd,msn,telefono:string;
    resultadosms:Boolean; f,activo:Integer;
    clientessms:Array of Array of string;
begin
  Screen.Cursor := crHourglass;
  fecha1:='';
  fecha2:='';
  //elimina tablas temporales
  querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (mov integer(11),idcliente integer(11), '+
  'saldo float default 0,condicion1 float default 0,condicion2 float default 0,condicion3 float default 0,condicion4 float default 0, '+
  //lineas
  'condicion1mon float default 0,condicion1int float default 0,condicion1ser float default 0,condicion1eq float default 0,condicion1ot float default 0,'+
  'condicion2mon float default 0,condicion2int float default 0,condicion2ser float default 0,condicion2eq float default 0,condicion2ot float default 0,'+
  'condicion3mon float default 0,condicion3int float default 0,condicion3ser float default 0,condicion3eq float default 0,condicion3ot float default 0,'+
  'condicion4mon float default 0,condicion4int float default 0,condicion4ser float default 0,condicion4eq float default 0,condicion4ot float default 0,'+
  'dias integer(11),tipo varchar(15),EstatusInstalacion varchar(50), '+
  'KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);
  //trae los nombres de los sectores
  buscarsectorID;
  fecha1:=datetostr(now-eddias1.Value);
  fecha2:=datetostr(now-9999);
  buscarUnidadID;
  if ckbabogado.Checked = true then
  begin
    if edabogado.Text <> '' then
    begin
      cadena:='';
      cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
            '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta '+
            'FROM PagosClientes as pc left join pedidos as p ON p.idpedido=pc.idpedido LEFT JOIN clientes as c '+
            'ON c.idcliente=pc.idcliente LEFT JOIN sectores as s ON s.idsector=c.sector LEFT JOIN contratos as con '+
            'ON c.TipoCont=con.TipoCont '+
            'WHERE p.estatus in(3,4,6) AND pc.FechaVence BETWEEN "'+fecha2+'" AND "'+fecha1+'" AND restante > 0.9 and pc.movimiento IN(0,1) '+
            'and c.sector between '+sector1+' and '+sector2+' '+
            'AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' and '+
            '(c.idabogado = '+quotedstr(edabogado.Text)+') ';
    end
    else
    begin
      application.MessageBox('Falta el abogado','Atención',mb_iconwarning);
      edabogado.SetFocus;
      exit;
    end;
  end
  else
  begin
    cadena:='';
    cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
          '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta '+
          'FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido)  LEFT JOIN clientes as c '+
          'ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont)  ' +
          'LEFT JOIN sectores as s ON (s.idsector=c.sector) '+
          'WHERE p.estatus in(3,4,6) AND pc.FechaVence '+
          'BETWEEN '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+'  AND restante > 0.9 and pc.movimiento IN(0,1) '+
          'and c.sector between '+sector1+' and '+sector2+' AND p.idUnidadNegocio between '+
          quotedstr(UN1)+' and '+quotedstr(UN2)+' '  ;

    if ckbbloqueados.Checked = false then
      cadena:=cadena+' and c.bloqueado = 0 '
    else
      cadena:=cadena+' and c.bloqueado in(0,1) ';
    if (ckbnormales.Checked) and (ckbforzosos.Checked) then  //para activos
      cadena := cadena + ' and con.estatus in (0,1)  '
    else
    begin
      if ckbforzosos.Checked then //para inactivos
        cadena := cadena + ' and con.estatus = 0 ';
      if ckbnormales.Checked then
        cadena := cadena + ' and con.estatus = 1 and (c.idabogado = 0)';
    end;
  end;
  if (chkSinCuentasReporte.checked = true) then
    cadena:=cadena+' and NoReporte=0';
  cadena:=cadena+' GROUP BY pc.idpago';
  querys(cadena,1,dmaccesos.sqlgeneral);
  querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
  querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);
  if((chkSinEnlace.Checked = true) and (ckbforzosos.Checked = false)) then
  begin
    cadena :='insert into temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
                '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta  '+
                'FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c '+
                'ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) LEFT JOIN '+
                'sectores as s ON (s.idsector=c.sector) '+
                'WHERE pc.FechaVence BETWEEN "'+fecha2+'" AND "'+fecha1+'" and p.estatus in(3,4) AND restante > 0.9 '+
                'and pc.movimiento IN(0,1) and c.sector between '+sector1+' and '+sector2+' AND '+
                'p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+'  and c.TipoCont ="SEN" ';
    if ckbabogado.Checked = true then
      cadena:=cadena + ' and c.idabogado = '+quotedstr(edabogado.Text);
    cadena:=cadena+' GROUP BY pc.idpago';
    querys(cadena,1,dmaccesos.sqlgeneral);
  end;

  if((chkSinEnlace.Checked = false) and (ckbforzosos.Checked = true)) then
      querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+
      ' inner join clientes as c on (c.idcliente = temporal_sectorvence0'+frmprincipal.idmaq+'.cuenta) where c.TipoCont = ''SEN'' ',1,sqlgeneral);

  ///*borrar cuentas que son mayores a (dias)
  querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+
         ' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) '+
         'where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);
  //por el puesto es el rango de dias permitido para ver en el reporte
  if rgpuesto.ItemIndex=0 then
    querys('select cuenta from temporal_sectorvence0'+frmprincipal.idmaq+
           ' where dias not between '+eddias1.text+' and '+eddias2.text,0,sqlgeneral)
  else if rgpuesto.ItemIndex=1 then //encargada de cobranza
    querys('select cuenta,max(dias) as dias,count(cuenta) as n from temporal_sectorvence0'+frmprincipal.idmaq+
           ' GROUP BY cuenta HAVING dias>60',0,sqlgeneral)
  else if rgpuesto.ItemIndex=2 then  //extrajudicial
    querys('select cuenta,max(dias) as dias,count(cuenta) as n from temporal_sectorvence0'+frmprincipal.idmaq+
           ' GROUP BY cuenta HAVING dias not between 60 and 90',0,sqlgeneral)
  else if rgpuesto.ItemIndex=3 then //abogados
    querys('select cuenta,max(dias) as dias,count(cuenta) as n from temporal_sectorvence0'+frmprincipal.idmaq+
           ' GROUP BY cuenta HAVING dias<91',0,sqlgeneral);
  //eliminar las cuentas que no entren dentro del rango
  while not sqlgeneral.Eof do
  begin
    querys('DELETE  from temporal_sectorvence0'+frmprincipal.idmaq+' where cuenta = '+
            sqlgeneral.fieldbyname('cuenta').AsString ,1,dmreportes.sqlgeneral2);
    sqlgeneral.Next;
  end;

  querys('INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+' (idcliente,dias) SELECT pc.idcliente,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias '+
         ' FROM PagosClientes as pc INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago) '+
         ' GROUP BY pc.idcliente  HAVING dias <= '+eddias2.text+' ',1,sqlgeneral);
  querys('SELECT if(i.EstatusInst=0,''PENDI'',if(i.EstatusInst=1,''INSTA'',if(i.EstatusInst=2,''SUPER'',if(i.EstatusInst=4,''UBICA'','+
         'if(i.EstatusInst=5,''CUESTI'',if(i.EstatusInst=7,''CANCE'','''')))))) AS valor,p.idcliente from instalaciones as i '+
         ' inner join pedidos as p on (p.idpedido=i.idpedido) inner join temporal_sectorvence'+frmprincipal.idmaq+' as t1 '+
         ' on(t1.idcliente=p.idcliente) where i.estatus  <> 1 having valor <>''''  ',0,sqlgeneral);
  while not sqlgeneral.Eof do
  begin
    querys('Update temporal_sectorvence'+frmprincipal.idmaq+' set EstatusInstalacion='+quotedstr(sqlgeneral.fieldbyname('valor').AsString)+
       ' where idcliente = '+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString)+'  ',1,dmreportes.sqlgeneral2);
    sqlgeneral.Next;
  end;
  if ( eddias1.Value <= 30 ) then
  begin
    if eddias1.Value <=30 then
      fecha1 := datetostr(now-eddias1.Value)
    else
      fecha1 := datetostr(now-0);
    if eddias2.Value >=30 then
      fecha2 := datetostr(now-30)
    else
      fecha2 := datetostr(now-eddias2.value);
    actualizar(fecha1,fecha2,'condicion1');
  end;
  if eddias1.Value <= 60 then
  begin
    if eddias1.Value > 31 then
    begin
      fecha1:=datetostr(now-0);
      fecha2:=datetostr(now-30);
      actualizar(fecha1,fecha2,'condicion1');
      fecha1:=datetostr(now-31)
    end
    else
      fecha1:=datetostr(now-31);
    if eddias2.Value >= 60 then
      fecha2:=datetostr(now-60)
    else
      fecha2:=datetostr(now-eddias2.Value);
    actualizar(fecha1,fecha2,'condicion2');
  end;
  if  ((eddias2.Value >= 90) or ((eddias2.Value  >=  61)  and   (eddias2.Value  <=  90 ))  ) then
  begin
    if eddias1.Value > 61 then
      fecha1:=datetostr(now-eddias1.Value)
    else
      fecha1:=datetostr(now-61);
    if eddias2.Value >= 90 then
      fecha2 := datetostr(now-90)
    else
      fecha2 := datetostr(now-eddias2.Value);
    actualizar(fecha1,fecha2,'condicion3');
  end;
  if eddias2.Value > 90 then
  begin
    fecha1:=datetostr(now-90);
    fecha2:='';
    actualizar(fecha1,fecha2,'condicion4');
  end;
  //actualizar saldo
  querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET saldo=condicion1+condicion2+condicion3+condicion4',1,dmaccesos.sqlgeneral);
  //generar reporte
  with dmreportes do
  begin
    fecha1:='Del Sector '+cbosector1.Text +' al '+cbosector2.Text +' de '+eddias1.Text+' dias a '+eddias2.Text;
    if ckbabogado.Checked = true then
    begin
      querys('Select idabogado,concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) as Abogado '+
      ' from abogados where idabogado='+quotedstr(edabogado.Text),0,sqlgeneral2);
      fecha2:='Abogado : '+sqlgeneral2.fieldbyname('Abogado').AsString;
    end
    else
      fecha2:='.';
    cadena:='Del Sector '+cbosector1.Text +' al '+cbosector2.Text;
    cadena := 'select '+quotedstr(fecha1)+' as titulo1,'+quotedstr(fecha2)+' as titulo2,'+quotedstr(cadena)+
            ' as titulo3,''SECTORES VENCIDOS'' as encabezado, t.saldo,t.idcliente,cf.NombreCres as nombre,t.condicion1,t.condicion2,'+
            't.condicion3,t.condicion4,t.dias,if (d.bloqueado=0,''N'',''B'') as tipo,con.nombre as contrato,EstatusInstalacion '+
            'from temporal_sectorvence'+frmprincipal.idmaq+' as t  LEFT JOIN clientes as d ON(d.idcliente=t.idcliente) '+
            'LEFT JOIN contratos as con ON (d.TipoCont=con.TipoCont) LEFT JOIN ClientesFact as cf ON  (d.idfact=cf.idfact) '+
            'where t.saldo > 2';
    querys(cadena,0,sqlgeneral);
    querys('select linea,round(condicion1+condicion2+condicion3+condicion4,2) as saldo, round(condicion1,2) as condicion1, round(condicion2,2) as condicion2, ' + #13#10 +
           'round(condicion3,2) as condicion3, round(condicion4,2) as condicion4' + #13#10 +
           ' from (select ''Monitoreo'' as linea, sum(condicion1mon) as condicion1, sum(condicion2mon) as condicion2, '+
           ' sum(condicion3mon) as condicion3, sum(condicion4mon) as condicion4' + #13#10 +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Intereses'' as linea, sum(condicion1int), sum(condicion2int), sum(condicion3int), sum(condicion4int)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Servicio'' as linea, sum(condicion1ser),sum(condicion2ser), sum(condicion3ser), sum(condicion4ser)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Equipo'' as linea, sum(condicion1eq), sum(condicion2eq), sum(condicion3eq), sum(condicion4eq)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Otros'' as linea, sum(condicion1ot), sum(condicion2ot), sum(condicion3ot), sum(condicion4ot)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+
           ') as t', 0, sqlgeneral2);
    Screen.Cursor := crDefault;
    if sqlgeneral.FieldByName('idcliente').AsString <> '' then
    begin
      frmmensaje.Close;
      //REPORTE DE SECTORES VENCIDOS
      OperacionReporte('SectoresVencidos','Reportes de ',TipoImpresion, 1);
      //SMS
      if(chksms.Checked=true)then
      begin
        querys('select c.idcliente,replace(replace(trim(tel.telefono),"044-",""),"-","") as telefono '+
               ' from temporal_sectorvence'+frmprincipal.idmaq+' t left join clientes c on c.idcliente=t.idcliente '+
               ' left join telefonos tel on c.idtel=tel.idtel and tel.tipo_tel="CELULAR" GROUP BY idcliente',0,sqlgeneral2);
        SetLength(clientessms, 3);
        SetLength(clientessms[0], sqlgeneral2.RecordCount);
        SetLength(clientessms[1], sqlgeneral2.RecordCount);
        SetLength(clientessms[2], sqlgeneral2.RecordCount);
        servicio := GetConfiguraciones('ServicioSMS',true);
        user := GetConfiguraciones('UsuarioSMS',true);
        passwd := GetConfiguraciones('PasswordSMS',true);
        msn := GetConfiguraciones('MsnSMSVencido',false);
        activo:= StrToInt(GetConfiguraciones('ActivoSMS',true));
        while not sqlgeneral2.EOF do
        begin
          if(sqlgeneral2.FieldByName('telefono').AsString<>'') then
          begin
            telefono := ValidarCelularSMS(sqlgeneral2.fieldbyname('telefono').AsString);
            resultadosms := false;
            try
            if activo=1 then
              resultadosms := GetInfomensajeSoap(False, '', nil).Enviar(servicio,user,passwd,telefono,msn)
            else
              resultadosms := true;
            except
              //Application.MessageBox('Falla en el Servicio de Comunets, Intentelo mas tarde','Aviso',MB_OK+MB_ICONEXCLAMATION);
              resultadosms:=false;
            end;
            if(resultadosms)then
            begin
              clientessms[0,sqlgeneral2.RecNo-1]:='1'; //enviados
              clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
              clientessms[2,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('telefono').AsString;
              //ShowMessage('Fallo al enviar SMS');
            end
            else
            begin
              clientessms[0,sqlgeneral2.RecNo-1]:='2'; //fallidos
              clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
              clientessms[2,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('telefono').AsString;
            end;
          end
          else
          begin
            clientessms[0,sqlgeneral2.RecNo-1]:='3'; //Sin Telefono Celular
            clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
            clientessms[2,sqlgeneral2.RecNo-1]:='';
          end;
          sqlgeneral2.Next;
        end;
        querys('DROP TABLE IF EXISTS clientesSMS'+frmprincipal.idmaq,1, sqlgeneral2);
        querys('CREATE TABLE clientesSMS'+frmprincipal.idmaq+' (idcliente int(11) NOT NULL default "0", '+
                'tipo varchar(80) NOT NULL default "",telefono varchar(80) NOT NULL default "") ',1,sqlgeneral2);        //  TYPE=MyISAM
        for f:=0 to Length(clientessms[0])-1 do
           querys('insert into clientesSMS'+frmprincipal.idmaq+'(idcliente,tipo,telefono) values ('+clientessms[1,f]+
                  ','+quotedstr(clientessms[0,f])+','+quotedstr(clientessms[2,f])+')',1,sqlgeneral2);
        querys('select cs.idcliente, '+ClienteNombre('c')+' as nombre, replace(replace(trim(cs.telefono),"044-",""),"-","") as telefono, if(tipo="1","Enviados",if(tipo="2","Fallidos","Sin Telefono Celular")) as tipo '+
               ' from clientesSMS'+frmprincipal.idmaq+' cs left join clientes c on c.idcliente=cs.idcliente order by tipo, idcliente',0,sqlgeneral2);
        OperacionReporte('ClientesSMS','',TipoImpresion,1);
        querys('drop table clientesSMS'+frmprincipal.idmaq,1,sqlgeneral2);
      end;
      if chkcelulares.Checked then
      begin
        querys('Select clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial = '''',concat(ifnull(clientes.nombre,''''),'' '','+
               ' ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'' '')),clientes.rsocial) as Nombre,replace(replace(trim(telefonos.telefono),"044-",""),"-","") as telefono '+
               ' From clientes Inner Join telefonos ON clientes.idtel = telefonos.idtel inner join temporal_sectorvence'+frmprincipal.idmaq+
               ' on temporal_sectorvence'+frmprincipal.idmaq+'.idcliente=clientes.idcliente Where telefonos.tipo_tel = ''CELULAR'' and '+
               ' temporal_sectorvence'+frmprincipal.idmaq+'.dias <=60',0,dmreportes.sqlgeneral4);
        OperacionReporte('CelularesClientes','Reportes de ',TipoImpresion, 1);
      end;
    end
    else
    begin
      Screen.Cursor := crDefault;
      frmmensaje.Close;
      application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);
    end;
    querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
    querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,sqlgeneral);
  end;//reportes    
end;

procedure Tfrmmoduloreportes.cargarsectores;
begin
   cargacombo('SELECT nombre FROM sectores order by idsector', 'sectores', cbosector1);
   cbosector1.ItemIndex:=0;
   cargacombo('SELECT nombre FROM sectores order by idsector', 'sectores',cbosector2);
   cbosector2.ItemIndex:=cbosector2.count-1;
end;
     {
procedure Tfrmmoduloreportes.cancelados;
begin
  if dfecha1.Date <= dfecha2.Date then
  begin
    if cbosector1.ItemIndex <= cbosector2.ItemIndex then
    begin
      querys('SELECT c.sector,c.saldo,c.idcliente,c.TipoCont,c.MemoCancelacion,c.FechaCancelacion,mc.nombre as motivo,c.idmotivo,cf.NombreCres as nombre,'+
           'con.nombre as contrato,s.nombre as SectorNombre,concat(ifnull(c.dir,''''),'' '',ifnull(c.numero,''''),'' '',ifnull(colonias.nombre,'' '')) as Dir FROM clientes as c Left Join ClientesFact as cf ON (cf.idfact=c.idfact) '+
           ' LEFT JOIN contratos as con ON (con.TipoCont=c.TipoCont) LEFT JOIN MotCancel as mc ON (mc.idmotivo=c.idmotivo) LEFT JOIN sectores as s ON (s.idsector=c.sector) left join colonias on '+
           ' colonias.idcol=c.idcol WHERE con.TipoCont in ("CAN","MOR") and c.idcliente <> 10000 and c.FechaCancelacion Between '+
           quotedstr(dfecha1.Text)+' and '+quotedstr(dfecha2.Text)+' and s.nombre Between '+quotedstr(cbosector1.Text)+' and '+
           quotedstr(cbosector2.Text)+' order by c.sector,c.idcliente asc',0,dmreportes.sqlgeneral);
      if dmreportes.sqlgeneral.RecordCount > 0 then
      begin
        querys('SELECT count(c.idmotivo) as total,mc.nombre,mc.idmotivo FROM clientes as c INNER JOIN MotCancel as mc ON (mc.idmotivo=c.idmotivo) '+
               'LEFT JOIN contratos as con ON (con.TipoCont=c.TipoCont) LEFT JOIN sectores as s ON (s.idsector=c.sector) '+
               'WHERE con.TipoCont in ("MOR","CAN") and c.FechaCancelacion Between '+quotedstr(dfecha1.Text)+' and '+quotedstr(dfecha2.Text)+
               ' and s.nombre Between '+quotedstr(cbosector1.Text)+' and '+quotedstr(cbosector2.Text)+' GROUP BY mc.idmotivo ',0,dmreportes.sqlgeneral2);
        querys('SELECT count(c.idcliente) as total,g.nombre as giro' +
               ' FROM clientes as c ' +
               ' left join giros g on c.idgiro=g.idgiro' +
               ' INNER JOIN MotCancel as mc ON (mc.idmotivo=c.idmotivo) ' +
               '  LEFT JOIN contratos as con ON (con.TipoCont=c.TipoCont) ' +
               ' LEFT JOIN sectores as s ON (s.idsector=c.sector) ' +
               ' WHERE con.TipoCont in ("CAN","MOR") and c.FechaCancelacion Between '+quotedstr(dfecha1.Text)+' and '+
               quotedstr(dfecha2.Text)+' and s.nombre Between '+quotedstr(cbosector1.Text)+' and '+
               quotedstr(cbosector2.Text)+' GROUP BY c.idgiro',0,dmreportes.sqlgeneral3);
        //generar reporte
              OperacionReporte('ClientesCancelados2','',TipoImpresion,1);
      end
      else
      begin
        frmmensaje.Close;
        application.MessageBox('No hay datos a mostrar','Atención',mb_iconwarning);
      end;
    end
    else
    begin
      application.MessageBox('El sector inicial no puede ser mayor que el sector final','Atención',mb_iconwarning);
      cbosector1.SetFocus;
    end;
  end
  else
  begin
    application.MessageBox('No puede ser mayor la fecha inicial que la fecha final','Atención',mb_iconwarning);
    dfecha1.SetFocus;
  end;
end;   }

procedure Tfrmmoduloreportes.lbcategoriasClick(Sender: TObject);
begin
querys('select (c.idcategoria) as uno,(c.nombre) as dos,(c.descripcion) as tres,(giros.nombre) as cuatro,('''') as cinco from categorias as c inner join giros on(giros.idgiro=c.idgiro) order by uno',0,dmreportes.sqlgeneral);
OperacionReporte('Categorias','Catalogo de Categorias',TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.lbcategoriasMouseLeave(Sender: TObject);
begin
lbcategorias.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbcategoriasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbcategorias.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('DROP TABLE IF EXISTS temphistoact'+frmprincipal.idmaq,1, sqlgeneral);
querys('Drop Table if Exists TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq,1,dmreportes.sqlgeneral);
querys('Drop Table if Exists tendtec'+frmprincipal.ucprincipal.CurrentUser.LoginName,1,dmreportes.sqlgeneral);
querys('DROP TABLE IF EXISTS tmpActDia'+frmprincipal.idmaq,1,sqlgeneral);
querys('Drop table if exists tmpTckPendTec'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Drop table if exists tmpAnualidad'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Drop table if exists tempColoniasTraf'+frmprincipal.idmaq,1,sqlgeneral);
querys('Drop table if exists tmpoxxo'+frmprincipal.idmaq, 1, sqlgeneral);
MemoAdjuntos.free;
action:=cafree;
end;

procedure Tfrmmoduloreportes.lbestatusClick(Sender: TObject);
begin
 with dmreportes do begin
    querys('select idestatus,nombre,finaliza from estatus_eventos order by idestatus asc',0,sqlgeneral3);

        if  sqlgeneral3.RecordCount > 0 then begin
            RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
            frmmensaje.Close;
            RVP.ExecuteReport('RepCestatus');
        end else begin
            frmmensaje.Close;
            application.MessageBox('No hay datos capturados en estatus eventos!','Confirmación',mb_iconwarning);
        end;//if
 end;//with
end;

procedure Tfrmmoduloreportes.lbfuentesClick(Sender: TObject);
begin

 with dmreportes do begin
    querys('select idfuente,nombre from fuentes order by idfuente',0,sqlgeneral3);

        if  sqlgeneral3.RecordCount > 0 then begin
            RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
            frmmensaje.Close;
            RVP.ExecuteReport('RepCfuentes');
        end else begin
            frmmensaje.Close;
            application.MessageBox('No hay datos capturados en fuentes!','Confirmación',mb_iconwarning);
        end;

 end;//with
end;

procedure Tfrmmoduloreportes.lbgirosClick(Sender: TObject);
begin

with dmreportes do begin
     querys('select idgiro,nombre,descripcion from giros order by idgiro',0,sqlgeneral3);
             if  sqlgeneral3.RecordCount > 0 then begin
                 RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
                 frmmensaje.Close;
                 RVP.ExecuteReport('RepCgiros');
             end else begin
                      frmmensaje.Close;
                      application.MessageBox('No hay datos capturados en giros!','Confirmación',mb_iconwarning);
             end;
end;
end;

procedure Tfrmmoduloreportes.lborigenesClick(Sender: TObject);
begin

with dmreportes do begin
      querys('select idorigen,nombre from origen order by idorigen',0,sqlgeneral3);
           if  sqlgeneral3.RecordCount > 0 then begin
                 RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
                 frmmensaje.Close;
                 RVP.ExecuteReport('RepCorigenes');
             end else begin
                 frmmensaje.Close;
                 application.MessageBox('No hay datos capturados en origenes!','Confirmación',mb_iconwarning);
             end;    
end;
end;

procedure Tfrmmoduloreportes.lbtiposClick(Sender: TObject);
begin

with dmreportes do begin
querys('select idtipo,nombre from tipos order by idtipo',0,sqlgeneral3);
           if  sqlgeneral3.RecordCount > 0 then begin
                 RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
                 frmmensaje.Close;
                 RVP.ExecuteReport('RepCtipos');
             end else begin
                      frmmensaje.Close;
                      application.MessageBox('No hay datos capturados en tipos!','Confirmación',mb_iconwarning) ;
             end;
end;
end;

procedure Tfrmmoduloreportes.lbtiposactClick(Sender: TObject);
begin
with dmreportes do begin
querys('select idtipo_actividad,nombre  from tipos_actividades order by idtipo_actividad asc',0,sqlgeneral3);
           if  sqlgeneral3.RecordCount > 0 then begin
                 RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
                 frmmensaje.Close;
                 RVP.ExecuteReport('RepCtipo_act');
             end else begin
                      frmmensaje.Close;
                      application.MessageBox('No hay datos capturados en tipos actividades!','Confirmación',mb_iconwarning);
             end;         
end;
end;

procedure Tfrmmoduloreportes.lbtiposoportuClick(Sender: TObject);
begin
with dmreportes do begin
querys('select idtipo_oportunidad,nombre from tipo_oportunidad order by idtipo_oportunidad',0,sqlgeneral3);
           if  sqlgeneral3.RecordCount > 0 then begin
                 RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
                 frmmensaje.Close;
                 RVP.ExecuteReport('RepCtipo_oport');
           end else begin
                      frmmensaje.Close;
                      application.MessageBox('No hay datos capturados en tipos de oportunidades!','Confirmación',mb_iconwarning);
           end;
end;
end;

procedure Tfrmmoduloreportes.lbestatusMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbestatus.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbfuentesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbfuentes.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbgirosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbgiros.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lborigenesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lborigenes.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtiposMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbtipos.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtiposactMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbtiposact.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtiposoportuMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbtiposoportu.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbestatusMouseLeave(Sender: TObject);
begin
lbestatus.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbfuentesMouseLeave(Sender: TObject);
begin
lbfuentes.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbgirosMouseLeave(Sender: TObject);
begin
lbgiros.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lborigenesMouseLeave(Sender: TObject);
begin
lborigenes.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtiposMouseLeave(Sender: TObject);
begin
lbtipos.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtiposactMouseLeave(Sender: TObject);
begin
lbtiposact.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtiposoportuMouseLeave(Sender: TObject);
begin
lbtiposoportu.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbinvetariosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbinvetarios.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbinvetariosMouseLeave(Sender: TObject);
begin
lbinvetarios.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbinvetariosClick(Sender: TObject);
begin

 with dmreportes do begin
    sqlgeneral.Close;
    sqlgeneral.SQL.Clear;
    sqlgeneral.SQL.Add('Select cod_cve,cod_barras,nombre,costo,modelo,tinstalacion,ultima_compra,ultima_venta,existencia,precioa from articulos where (paquete=0 and servicio =0) order by nombre asc');
    sqlgeneral.Open;

        if  sqlgeneral.RecordCount > 0 then begin
            fecha:=(FormatDateTime('d"/"mm"/"yyyy',now));
            RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
            dmreportes.RVP.SetParam('fechaini',fecha);
            frmmensaje.Close;
            RVP.ExecuteReport('Reporte_articulos');
        end else begin
            frmmensaje.Close;
            application.MessageBox('No hay datos capturados en articulos!','Confirmación',mb_iconwarning);
        end;
 end;
end;

procedure Tfrmmoduloreportes.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmmoduloreportes.TabCob2TabClick(Sender: TObject);
begin
deshabilitaboton(TabCob2,0,btngenerar);
case TabCob2.TabIndex of
     0: begin //Catalogos

        end;
         //cancelados y morosos
     1:begin
          linea.Parent:=TabCob2Can;
          linea.visible:=false;
          gbsectores.Parent:=TabCob2Can;
          gbsectores.Top := 24;
          gbsectores.Left := 24;
          gbperiodo.Parent:=TabCob2Can;
          gbperiodo.Top := 128;
          gbperiodo.Left := 24;
          cbosector1.SetFocus;
          dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
          dfecha2.Date:=now;
          cargarsectores;
       end;
        //sectores vencidos
     2:begin
       linea.Parent:=TabCob2SecVen;
       linea.visible:=false;
       gbsectores.Parent:=TabCob2SecVen;
       gbsectores.Top := 24;
       gbsectores.Left := 24;
       gbincluir.Parent:=TabCob2SecVen;
       gbUnidadNegocio.Parent:=TabCob2SecVen;
       cargarsectores;
       cbosector1.SetFocus;
       CargarUnidadNeg;
       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       ckbabogado.checked:=false;
       ckbnormales.checked:=true;
       ckbnormales.Caption := 'Activos';
       gbdias.Parent:=TabCob2SecVen;
       chksms.Parent:=TabCob2SecVen;
       chksms.Top:= 330;
       chksms.left:= 288;
       end;

     3:begin  //antiguedead x linea
       linea.Parent:=TabCob2Antigxlinea;
       linea.visible:=false;
       gbsectores.Parent:= TabCob2Antigxlinea;
       gbsectores.Top := 24;
       gbsectores.Left := 24;
       cargarsectores;
       gbperiodo.Parent:= TabCob2Antigxlinea;
       gbperiodo.Top := 128;
       gbperiodo.Left := 24;
       gbUnidadNegocio.Parent:=TabCob2Antigxlinea;
       gbincluir.Parent:=TabCob2Antigxlinea;
       cbosector1.SetFocus;
       CargarUnidadNeg;
       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       gbmovimientos.Parent:=TabCob2Antigxlinea;
       ckbabogado.checked:=false;
       ckbnormales.checked:=true;
       ckbnormales.Caption := 'Activos';

       end;

     4:begin  //PAGOS X LINEA
       linea.Parent:=TabCob2Pagosxlinea;
       linea.visible:=false;
       gbusuarios.Parent:= TabCob2Pagosxlinea;
       gbperiodo.Parent:= TabCob2Pagosxlinea;
       gbperiodo.Top := 135;
       gbperiodo.Left := 24;
       edusuario1.setfocus;
       CargarLineas;
       dfecha1.Date:=now;
       dfecha2.Date:=now;
       end;

     5:begin //REPORTE DE COBRANZA GENERAL
       linea.Parent:=TabCob2Cobranza;
       linea.visible:=true;
       gbPeriodoMesA.Parent:= TabCob2Cobranza;
       cboano.Text:=formatdatetime('yyyy',now);
       cbomeses.ItemIndex:=strtoint(formatdatetime('m',now))-1;
       cbomeses.setfocus;
       end;

          //Cargos Automaticos
     6:begin
       linea.Parent:=TabCob2CargosA;
       linea.visible:=false;
       gbsectores.Parent:=TabCob2CargosA;
       gbsectores.Top := 24;
       gbsectores.Left := 24;
       gbincluir.Parent:=TabCob2SecVen;
       gbUnidadNegocio.Parent:=TabCob2CargosA;
       cargarsectores;
       cbosector1.SetFocus;
       CargarUnidadNeg;
       CargaCombo('Select nombre from TiposPagos where tipo=2 order by idTipoPago asc','TiposCargo(s)',cbocargos);
       end;

     7:begin
       Pcuenta.Parent := TabCob2PagosClientes;
       gbano.Parent:= TabCob2PagosClientes;
       gbano.Left := 312;
       gbano.Top := 40;
       edano.text := inttostr(yearof(today));
       EDdesde.SetFocus;

       end;

               //Morosos por Primera Vez
     8:begin
       linea.Parent:=TabCob2Morosos;
       linea.visible:=false;
       gbsectores.Parent:=TabCob2Morosos;
       gbsectores.Top := 24;
       gbsectores.Left := 24;
       cargarsectores;
       cbosector1.SetFocus;
       end;

     9: begin
        gbfechas.Parent := TabCobInsPend;
        tpdesde.Date := strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
        tphasta.Date := Today;
        end;

     10:begin
       linea.Parent:=TabCobSecXVencer;
       linea.visible:=false;
       gbsectores.Parent:=TabCobSecXVencer;
       gbsectores.Top := 24;
       gbsectores.Left := 24;
       gbincluir.Parent:=TabCobSecXVencer;
       gbUnidadNegocio.Parent:=TabCobSecXVencer;
       cargarsectores;
       cbosector1.SetFocus;
       CargarUnidadNeg;
       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       ckbabogado.checked:=false;
       ckbnormales.checked:=true;
       ckbnormales.Caption := 'Activos';
       gbdias.Parent:=TabCobSecXVencer;
       chksms.Parent:=TabCobSecXVencer;
       end;

   11: begin
       gbfechas.Parent := TSCobCSI;
       tpdesde.Date := strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       tphasta.Date := Today;
       end;

   12: begin
       linea.Parent:=TabCobMarcacion;
       linea.visible:=false;
       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       gbusuario1.Parent:= TabCobMarcacion;
       gbperiodo.Parent:= TabCobMarcacion;
       end;

   13: begin

       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       gbperiodo.Parent:=  TabCob2PagosMoni;

        end;

end;//case
end;

procedure Tfrmmoduloreportes.AjusteInventario(sender : Tobject;cta,nombre:string;reporte:integer);
var temp:string;//,TipoReporte
begin
if cbTipoAsig.Text = '' then
 begin
  application.MessageBox('Debe indicar el tipo de concepto','Aviso',mb_iconinformation);
  cbTipoAsig.DroppedDown := true;
  exit;
 end;

if (cbTipoAsig.Text <> 'Todas las Entradas')and(cbTipoAsig.Text <> 'Todas las Salidas') then
 begin
  querys('select idconcepto_es,movimiento from ConceptoES where nombre='+quotedstr(cbtipoasig.Text),0,sqlgeneral);
  temp := ' and idconcepto_es='+sqlgeneral.fieldbyname('idconcepto_es').AsString;
 end;
if cbTipoAsig.Text = 'Todas las Entradas' then
  temp := ' and movimiento = ''E''';
if cbTipoAsig.Text = 'Todas las Salidas' then
 temp := ' and movimiento = ''S''';

if cta <> '' then
 temp := temp+' and clientes.idcliente ='+cta;
if nombre <> '' then
 temp := temp+' and (clientes.rsocial like '+quotedstr('%'+nombre+'%')+' or concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')) like '+quotedstr('%'+nombre+'%')+')';
// if
// querys('select '+quotedstr('Reporte Otras Entradas('+cbtipoasig.Text+')')+' as titulo', 0, dmreportes.sqlgeneral2);

 querys('SELECT "Reporte de Ajustes de Inventario ( '+cbtipoasig.Text+' )" as titulo, clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial='''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) as nombre,AjusteInv.observaciones,'+
       'AjusteInv.idajuste, AjusteInv.FechaAlta,DetAjusteInv.cant_ord,DetAjusteInv.cod_cve,DetAjusteInv.costo,truncate((DetAjusteInv.costo * DetAjusteInv.cant_ord),3) as Importe, '+
       ' truncate(((DetAjusteInv.costo * DetAjusteInv.cant_ord)*'+floattostr(getIVA)+'),3) as Impuesto,truncate((DetAjusteInv.costo * DetAjusteInv.cant_ord) + ((DetAjusteInv.costo * DetAjusteInv.cant_ord)*'+floattostr(getIVA)+'),3)  as Total FROM DetAjusteInv inner join AjusteInv on '+
       ' DetAjusteInv.idajuste = AjusteInv.idajuste left join clientes on clientes.idcliente = AjusteInv.idcliente where (AjusteInv.FechaAlta >='+quotedstr(datetostr(dfecha1.Date))+' and AjusteInv.FechaAlta <='+quotedstr(datetostr(dfecha2.Date))+') '+temp,0,dmreportes.sqlgeneral);
rcount.Caption := inttostr(dmreportes.sqlgeneral.RecordCount);
frmmensaje.Close;
if reporte = 1 then
 OperacionReporte('Otras Entradas','',TipoImpresion, 1);
end;

procedure tfrmmoduloreportes.VerifVentVend;
var tmp : tmyquery;
cta,cte:string;
begin
tmp := tmyquery.Create(self);
tmp.Connection := dmaccesos.conexion;
try
querys('drop table if exists VVV'+frmprincipal.idmaq,1,sqlgeneral);
//trae los datos de las ventas que tienen vendedores que no fueron asignados al cliente de la venta y crea una tabla temp
querys('create table VVV'+frmprincipal.idmaq+' select clientes.idcliente, '+ClienteNombre('clientes')+' as Cliente,clientes.idvendedor as idvendcli,pedidos.idvendedor as idvendped,pedidos.idpedido,pedidos.FechaRemision as FechaCreacion, '+
       ' ''111111111'' as VendPed,''22222222222'' as VendCta from pedidos left join clientes on pedidos.idcliente = clientes.idcliente left join usuarios on (usuarios.idusuario = pedidos.idvendedor  or usuarios.idusuario = clientes.idvendedor) '+
       ' where pedidos.FechaRemision between '+quotedstr(datetostr(dfecha1.date))+' and '+quotedstr(datetostr(dfecha2.date))+' and pedidos.estatus > 2 and pedidos.idvendedor <> clientes.idvendedor order by pedidos.FechaRemision',1,dmreportes.sqlgeneral);
querys('select idpedido,idvendcli,idvendped from VVV'+frmprincipal.idmaq,0,tmp);
tmp.first;
while not tmp.Eof do
 begin
   querys('select codigo from usuarios where idusuario='+tmp.fieldbyname('idvendcli').AsString,0,sqlgeneral);
   cta := sqlgeneral.FieldByName('codigo').AsString;
   querys('select codigo from usuarios where idusuario='+tmp.fieldbyname('idvendped').AsString,0,sqlgeneral);
   cte :=  sqlgeneral.FieldByName('codigo').AsString;
   querys('update VVV'+frmprincipal.idmaq+' set VendCta='+quotedstr(cta)+',VendPed='+quotedstr(cte)+' where idpedido='+tmp.fieldbyname('idpedido').AsString,1,sqlgeneral);
    tmp.Next;
 end;
 querys('select distinct * from VVV'+frmprincipal.idmaq+' order by VendPed, idcliente',0,dmreportes.sqlgeneral);
 querys('select idcliente, '+ClienteNombre('clientes')+' as Cliente from clientes where idvendedor = 0', 0, dmreportes.sqlgeneral2);
 frmmensaje.Close;
 OperacionReporte('VerifVentVend','',TipoImpresion, 1);
finally
frmmensaje.Close;
querys('drop table if exists VVV'+frmprincipal.idmaq,1,sqlgeneral);
end;
end;

procedure Tfrmmoduloreportes.TipoImprecionProcedure;
begin

case cbgenerar.ItemIndex of
  0: TipoImpresion := 'IMP';
  1: TipoImpresion := 'PDF'; //EMAIL
  2: TipoImpresion := 'ARC'; //PDF Y EXCEL
  3: TipoImpresion := 'IMPD'; 
  end;
end;

procedure Tfrmmoduloreportes.btngenerarClick(Sender: TObject);
begin
TipoImprecionProcedure;
Reportes;
end;

procedure Tfrmmoduloreportes.eddias1KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmmoduloreportes.cbosector2KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin

  case TabCob2.TabIndex of
                     1:dfecha1.SetFocus;
                     2,3:cbounidad1.setfocus;
  end; //case
end;
end;

procedure Tfrmmoduloreportes.TabInv2TabClick(Sender: TObject);
//var c:integer;
begin
deshabilitaboton(TabInv2,0,btngenerar);
case TabInv2.TabIndex of
     0: begin //Catalogos
        linea.Parent:=TabInv2Gen;
        end;
      //tab inventario x fechas
     1:begin
       linea.Parent:=tabInv2Inv;
       gbperiodo.Parent:=tabInv2Inv;
       gbperiodo.Top := 128;
       gbperiodo.Left := 24;
       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       dfecha1.SetFocus;
       end;
    2:begin
      btnbuscar.Enabled := true;
      rcount.parent := TabEntSal;
      ltotal.Parent := TabEntSal;
      linea.Parent:=TabEntSal;
      gbperiodo.Parent := TabEntSal;
      cbTipoAsig.Parent := TabEntSal;
      ltotal.Top := 125;
      rcount.Top := 125;
      ltotal.Left := 8;
      rcount.Left := 56;
      cbTipoAsig.Top := 40;
      cbTipoAsig.Left := 400;
      rcount.Caption :='0';
      CargaCombo('select nombre from ConceptoES where movimiento=''E'' order by nombre','Conceptos de Ajuste',cbTipoAsig);
      cbTipoAsig.Items.Add('Todas las Entradas');
      cbTipoAsig.ItemIndex := cbTipoAsig.Items.Count;
      gbperiodo.Top := 25;
      gbperiodo.Left := 2;
      dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
      dfecha2.Date := date;
      grgeneral.Parent := TabEntSal;
      grgeneral.Top := 140;
      grgeneral.Left := 5;
      end;

   3:begin   //compras
     cargacombo2('Select p.idprov, if(p.rsocial is NULL or p.rsocial="", if(p.apaterno is NULL or p.apaterno="", '+
                'p.nombre, if(p.amaterno is NULL or p.amaterno="", concat(p.nombre, " ", p.apaterno), '+
                'concat(p.nombre, " ", p.apaterno, " ", p.amaterno))), p.rsocial) as nombre from '+
                'proveedores as p order by p.idprov', 'nombre', 'idprov',cboproveedores);
     cboproveedores.Items.Insert(0, 'TODOS');
     cboproveedores.Values.Insert(0, '0');
     cboproveedores.ItemIndex := 0;
     gbfechas.parent:=  Tabcompras;
     tpdesde.date := FechaServidor;
     tphasta.date := tpdesde.date;
     end;


end;//case
end;

procedure Tfrmmoduloreportes.TabPrincipalTabClick(Sender: TObject);
begin
btngenerar.Enabled := false;
btnbuscar.Enabled := false;
case TabPrincipal.TabIndex of
                         //tab clientes
                         1:begin
                            Linea.Parent:=TabClientes2Catalagos;
                            TabClientes2.TabIndex:=0;
                           end;
                            //tab vendedores
                         2:begin
                            Linea.Parent:=TabVent2Catalogos;
                            TabVent2.TabIndex:=0;
                           end;

                         //Tab cobranza general
                         3:begin
                            Linea.Parent:=TabCob2Gen;
                            TabCob2.TabIndex:=0;
                           end;
                         //Tab invetarios generales
                         4:begin
                             Linea.Parent:=TabInv2Gen;
                             TabInv2.TabIndex:=0;
                           end;
                          //Tab Instalaciones
                         5:begin
                             //Linea.Parent:=TabInst2;
                             Tabinst2.TabIndex:=0;
                           end;
                          //Tab central generales
                         6:begin
                             Linea.Parent:=TabCentral2;
                             TabCentral2.TabIndex:=0;
                           end;
                         //Tab Servicios Generales
                         7:begin
                             Linea.Parent:=TabServicios2;
                             TabServicios2.TabIndex:=0;
                           end;
                         8:begin
                             Linea.Parent:= pcadministracion;
                             pcadministracion.TabIndex:=0;
                           end;
end;//case
end;

procedure Tfrmmoduloreportes.dfecha2KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
    if  TabPrincipal.ActivePage = TabClientes then begin
       case TabClientes2.TabIndex of
                                  2:btngenerar.SetFocus;
                                  //3:ckbnormales.setfocus;
      end;//case
   exit;
  end;

  if  TabPrincipal.ActivePage = TabCob then begin
       case TabCob2.TabIndex of
                                  1:btngenerar.SetFocus;
                                  3:ckbnormales.setfocus;
      end;//case
   exit;
  end;
  if TabPrincipal.ActivePage = TabVent then begin
     case TabVent2.TabIndex of
                                 2:cbomovimientos.SetFocus;
                                 5,6:btngenerar.SetFocus;
     end;//case
   exit;
  end;

  if TabPrincipal.ActivePage = TabInst then begin
      case TabInst2.TabIndex of
                                 1:btngenerar.SetFocus;
      end;//case
   exit;
  end;
  end;
end;

procedure Tfrmmoduloreportes.cbolineas2KePress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
      case TabCob2.TabIndex of
                             2: begin eddias1.SetFocus; exit; end;
                             3: begin dfecha1.SetFocus; exit; end;
      end;//case
  end;
end;

procedure Tfrmmoduloreportes.eddias2KeyPress(Sender: TObject;
  var Key: Char);
begin
     case TabCob2.TabIndex of
                            2:begin ckbnormales.setfocus; exit; end;
                            3:begin cbomovimientos.setfocus; exit; end;
     end;//case
end;

procedure Tfrmmoduloreportes.ckbbloqueadosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     case TabCob2.TabIndex of
                           2:begin btngenerar.setfocus; exit; end;
                           3:begin cbomovimientos.setfocus; exit; end;
     end;//case
  end;
end;

procedure Tfrmmoduloreportes.cbomovimientosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     btngenerar.SetFocus;
  end;
end;

procedure Tfrmmoduloreportes.btnreporteadorClick(Sender: TObject);
begin
dmreportes.ppReportExplorer1.Execute;
end;

procedure Tfrmmoduloreportes.chkbcanceladosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
    cbomovimientos.SetFocus
  end;
end;

procedure Tfrmmoduloreportes.ckbabogadoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin

        ckbbloqueados.SetFocus;
  end;
end;

procedure Tfrmmoduloreportes.cbolineas1NotInList(Sender: TObject);
begin
  cbolineas1.ItemIndex:=0;
end;

procedure Tfrmmoduloreportes.cbolineas2NotInList(Sender: TObject);
begin
    cbolineas2.ItemIndex:=0;
end;

procedure Tfrmmoduloreportes.cbosector1NotInList(Sender: TObject);
begin
    cbosector1.ItemIndex:=0;
end;

procedure Tfrmmoduloreportes.cbosector2NotInList(Sender: TObject);
begin
    cbosector2.ItemIndex:=0;
end;

procedure Tfrmmoduloreportes.cbomovimientosNotInList(Sender: TObject);
begin
 cbomovimientos.ItemIndex:=-1;
end;

procedure Tfrmmoduloreportes.TabVent2TabClick(Sender: TObject);
begin
deshabilitaboton(TabVent2,0,btngenerar);
case TabVent2.TabIndex of
                          1: begin //diario de ventas
                                 linea.Parent:=TabVent2DV;
                                 gbmovimientos.Parent:=TabVent2DV;
                                 gbperiodo.Parent:=TabVent2DV;
                                 gbperiodo.Top := 128;
                                 gbperiodo.Left := 24;
                                 dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                 dfecha2.Date:=now;
                                 gbRTipoReporte.Parent:=TabVent2DV;
                                 ckbRsimple.setfocus;
                                 gbUnidadNegocio.Parent:=TabVent2DV;
                                 CargarUnidadNeg;
                                 gbsectores.Parent:= TabVent2DV;
                                 gbsectores.Top := 175;
                                 gbsectores.Left := 250;
                                 cargarsectores;
                                 gbRTipoReporte.Parent:=TabVent2DV;

                             end;
                          2: begin //cobros en caja
                                 linea.Parent:=TabVent2Cobros;
                                 linea.visible:=true;
                                 gbusuarios.Parent:=TabVent2Cobros;
                                 gbfechas.Parent:=TabVent2Cobros;
                                 gbfechas.Top := 160;
                                 gbfechas.Left := 24;
                                 tpdesde.Date:=now;
                                 tphasta.Date:=now;
                                 edusuario1.SetFocus;
                             end;
                          3: begin//ventas mensuales
                                 linea.Parent:=TabVent2VM;
                                 linea.visible:=true;
                                 gbperiodo.Parent:=TabVent2VM;
                                 gbperiodo.Top := 25;
                                 gbperiodo.Left := 24;
                                 dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                 dfecha2.Date:=now;
                                 rgordenarpor.Parent := TabVent2VM;
                                 rgordenarpor.Left := 24;
                                 rgordenarpor.Top := 138;
                                 //llena el combo
                                 cbordcli.Items.Clear;
                                 cbordcli.Text := 'Fecha/Venta';
                                 cbordcli.Items.Add('Fecha/Venta');
                                 cbordcli.Items.Add('Oportunidad'); //oport
                                 cbordcli.Items.Add('Origen');
                                 cbordcli.Items.Add('Vendedor');
                                 cbordcli.Items.Add('Estatus'); //s
                             end;
                          4: begin //facturas canceladas
                                 linea.Parent:=TabVent2FC;
                                 linea.visible:=true;
                                 gbperiodo.Parent:=TabVent2FC;
                                 gbperiodo.Top := 128;
                                 gbperiodo.Left := 24;
                                 dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                 dfecha2.Date:=now;
                                 dfecha1.setfocus;

                             end;

                          5: begin //comisiones vendedores
                                 gbusuario1.Parent:=TabVent2Comisiones;
                                 //gbtipovendedor
                                 linea.Parent:=TabVent2Comisiones;
                                 linea.visible:=true;
                                 gbperiodo.Parent:=TabVent2Comisiones;
                                 gbperiodo.Top := 135;
                                 gbperiodo.Left := 24;
                                 dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                 dfecha2.Date:=now;
                                 edbuscarU.setfocus;

                             end;


                           6: begin //analisis de ventas .......

                                linea.Parent:=TabVent2AV;
                                linea.visible:=true;
                                gbperiodo.Parent:=TabVent2AV;
                                gbperiodo.Top := 135;
                                gbperiodo.Left := 24;
                                gbperiodo.Left := 24;
                                dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                dfecha2.Date:=now;
                              end;
                              
                            7: begin
                                gbperiodo.Top := 5;
                                gbperiodo.Left := 5;
                                dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                dfecha2.Date:=now;
                                gbperiodo.Parent := tsvvv;
                               end;
                            8: begin
                                 linea.Parent:=tsnc;
                                 linea.visible:=true;
                                 pimprimir.Parent := tsnc;
                                 pimprimir.Top := 18;
                                 pimprimir.Left := 6;
                                 rbstdetallado.Checked := false;
                                 rbstnodetallado.Checked := false;
                                 gbperiodo.Parent:=tsnc;
                                 gbperiodo.Top := 110;
                                 gbperiodo.Left := 6;
                                 dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                 dfecha2.Date:=now;

                             end;


                             9:begin  //tendencia vendedores

                                    linea.Parent := TabVent2Tend2;
                                    linea.visible := true;
                                    gbPeriodoMesA.Parent := TabVent2Tend2;
                                    cboano.Text := formatdatetime('yyyy',now);
                                    cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
                                    cbomeses.setfocus;
                                    gbanualesvtastend.Parent := TabVent2Tend2;


                                end;

                             10:begin
                                    linea.Parent := TabVent2Ca;
                                    linea.visible := true;
                                    gbPeriodoMesA.Parent := TabVent2CA;
                                    cboano.Text := formatdatetime('yyyy',now);
                                    cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
                                    cbomeses.setfocus;
                                    gbanualesvtastend.Parent := TabVent2CA;

                                end;


                                11:begin
                                    linea.Parent:=TabVent2ErrorVta;
                                    linea.visible:=true;
                                    gbperiodo.Parent:=TabVent2ErrorVta;
                                    gbperiodo.Top := 135;
                                    gbperiodo.Left := 24;
                                    gbperiodo.Left := 24;
                                    dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                    dfecha2.Date:=now;
                                end;

                                12: begin  
                                     gbperiodo.Parent:=TabVent2TotMn;
                                     gbperiodo.Top := 128;
                                     gbperiodo.Left := 24;
                                     dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                     dfecha2.Date:=now;
                                    end;

                                13:begin                                 
                                     gbperiodo.Parent:=TabVent2Monitoreo;
                                     gbperiodo.Top := 128;
                                     gbperiodo.Left := 24;
                                     dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                     dfecha2.Date:=now;
                                end;

                                14: begin
                                     gbperiodo.Parent:=TabVent2FactSPago;
                                     gbperiodo.Top := 128;
                                     gbperiodo.Left := 24;
                                     dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                     dfecha2.Date:=now;

                                end;

                                15: begin
                                     gbperiodo.Parent := TabVent2ArtXper;
                                     gbperiodo.Top := 128;
                                     gbperiodo.Left := 24;
                                     dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
                                     dfecha2.Date:=now;
                                     gbRTipoReporte.Parent:=TabVent2ArtXper;
                                     end;

                                end;


end;

procedure Tfrmmoduloreportes.cboanoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
    case TabVent2.TabIndex of
      1: btngenerar.SetFocus;

      9: edccliente.SetFocus;
    end;
  end;
end;

procedure Tfrmmoduloreportes.tabclientes2TabClick(Sender: TObject);
var dia, mes, ano:word;
begin
dmreportes.sqlgeneral.close;
dmreportes.sqlgeneral.SQL.Clear;
deshabilitaboton(TabClientes2,0,btngenerar);
deshabilitaboton(TabClientes2,0,btnbuscar);
case TabClientes2.TabIndex of
          1: begin //estado de cuenta.......

             linea.Parent:=TabClientes2EC;
               with dmaccesos do begin
               querys('SELECT concepto,ValorMemo FROM configuraciones',0,sqlgeneral);
                   while not sqlgeneral.Eof do begin
                       if sqlgeneral.fieldbyname('concepto').AsString='CobNotasPago' then
                           notapago.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                       if sqlgeneral.fieldbyname('concepto').AsString='CobNotasObs' then
                           notaobservaciones.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                       if sqlgeneral.fieldbyname('concepto').AsString='A30' then
                           nota1.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                       if sqlgeneral.fieldbyname('concepto').AsString='A60' then
                           nota2.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                       if sqlgeneral.fieldbyname('concepto').AsString='A90' then
                           nota3.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                       if sqlgeneral.fieldbyname('concepto').AsString='M90' then
                           nota4.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                    sqlgeneral.Next;
                   end;//sqlgeneral
               end;//if dmaccesos
              edbuscar.Parent:=TabClientes2EC;
              lbcuenta.Parent:=TabClientes2EC;
              edbuscar.text:='';
              edbuscar.SetFocus;
              btnbuscar.Enabled := false;
             end;
          2: begin    //TARJETA DEL CLIENTE
                    linea.Parent:=TabClientes2TC;
                    edbuscar.Parent:=TabClientes2TC;
                    lbcuenta.Parent:=TabClientes2TC;
                    gbperiodo.Parent:=TabClientes2TC;
                    gbperiodo.Top := 128;
                    gbperiodo.Left := 24;
                    dfecha1.Date:=strtodate('1990/01/01');
                    dfecha2.Date:=now;
                    edbuscar.text:='';
                    edbuscar.SetFocus;
                    btnbuscar.Enabled := false;
                end;

                3: begin ///estado de cuenta por lote....
                    CargarColonias;
                    gbcolonia.Parent:=TabClientes2ECLote;
                    linea.Parent:=TabClientes2ECLote;
                    btnbuscar.Enabled := false;
                end;

               4: begin ///Cliente Estatus....
                    eddesde.Text := '';
                    edhasta.Text := '';
                    GRGeneral.Parent := TabClientes2status;
                    linea.Parent:=TabClientes2status;
                    ltotal.Parent := TabClientes2status;
                    Rcount.Parent := TabClientes2status;
                    Pestatus.Parent := TabClientes2status;
                    Pimprimir.parent := TabClientes2status;
                    Pimprimir.Top  := 32;
                    Pimprimir.left := 472;
                    Rcount.Caption :='';
                    eddesde.SetFocus;
                    btngenerar.Enabled := false;
                    Pcuenta.Parent := TabClientes2status;
                end;

               5: begin ///Clientes Bloqueados....
                    linea.Parent:=TabClientes2Bloq;
                    tphasta.Date := FechaServidor;
                    GRGeneral.Parent := TabClientes2Bloq;
                    gbfechas.Parent := TabClientes2Bloq;
                    tpdesde.Date := FechaServidor;
                    tphasta.Date := FechaServidor;
                    edbdesde.Text := '';
                    edbhasta.Text := '';
                    ltotal.Parent := TabClientes2Bloq;
                    Rcount.Parent := TabClientes2Bloq;
                    Rcount.caption:='';
                    Rbtodos.SetFocus;
                    btngenerar.Enabled := false;
                end;

               6: begin ///Relacion Cuenta Cliente....
                    linea.Parent:=TabClientes2RelCliCta;
                    GRGeneral.Visible := true;
                    GRGeneral.Parent := TabClientes2RelCliCta;
                    ednombre.Text := '';
                    ednombre.SetFocus;
                    ltotal.Parent := TabClientes2RelCliCta;
                    Rcount.Parent := TabClientes2RelCliCta;
                    Rcount.caption:='';
                    btngenerar.Enabled := false;
                end;

               7: begin ///Relacion Resumen....
                    linea.Parent:=TabClientes2Resumen;
                    CBTcuenta.SetFocus;
                    sqlgeneral.Close;
                    dmreportes.sqlgeneral.Close;
                    dmreportes.sqlgeneral2.Close;
                    dmreportes.sqlgeneral3.Close;
                    dmreportes.sqlgeneral4.Close;
                    Lclientes.Caption :='';
                    llenacombos;
                    btngenerar.Enabled := false;
                end;

                8: begin ///Polizas Cliente....
                    linea.Parent:=TabClientes2Polizas;
                    ltotal.Parent := TabClientes2Polizas;
                    Rcount.Parent := TabClientes2Polizas;
                    rgcuenta.parent := TabClientes2Polizas;
                    rgcuenta.Left := 456;
                    rgcuenta.Top := 40;
                    Rcount.caption:='';
                    edcuentap.Text :='';
                    GRGeneral.Parent := TabClientes2Polizas;
                    tpdesde.Date := FechaServidor;
                    tphasta.Date := FechaServidor;
                    RBPolxCta.SetFocus;
                    btngenerar.Enabled := false;
                   end;

                9: begin //open/close oxxos
                    gbfechas.Parent := tsocoxxos;
                    gbfechas.Left := 504;
                    gbfechas.Top := 32;
                    tpdesde.Date := FechaServidor;
                    tphasta.Date := FechaServidor;
                    grgeneral.Parent := tsocoxxos;
                    ltotal.Parent := tsocoxxos;
                    rcount.Parent := tsocoxxos;
                    gbRelCtaCte.Parent := tsocoxxos;
                    Rcount.Caption :='';
                    btngenerar.Enabled := false;
                    tpdesde.SetFocus;
                   end;
               10: begin  //Sin Asignacion
                   Pestatus.Parent := TabClientes2SinAsignacion;
                   grgeneral.Parent := TabClientes2SinAsignacion;
                   ltotal.Parent := TabClientes2SinAsignacion;
                   rcount.Parent := TabClientes2SinAsignacion;
                   Rcount.Caption :='';
                   btngenerar.Enabled := false;
                   LlenaTipoAsig;
                   CBtipoAsig.SetFocus;
                   end;

               11: begin
                   grgeneral.Parent := Tabclientes2Protocolos;
                   ltotal.Parent := Tabclientes2Protocolos;
                   rcount.Parent := Tabclientes2Protocolos;
                   Rcount.Caption :='';
                   Pestatus.Parent := Tabclientes2Protocolos;
                   RGProtocolos.Items.Clear;
                   querys('Select * from protocolos', 0, sqlgeneral);
                   sqlgeneral.First;
                   while not sqlgeneral.Eof do
                     begin
                     RGProtocolos.Items.Add(sqlgeneral.fieldbyname('protocolo').asstring);
                     sqlgeneral.Next;
                     end;
                   cbOrdCli.Clear;
                   cbOrdCli.Add('Cuenta');
                   cbOrdCli.Add('Nombre');                                  
                   cbOrdCli.Add('CP y Cuenta');
                   cbOrdCli.Add('CP y Nombre');
                   cbOrdCli.Add('Estatus y Cuenta');
                   cbOrdCli.Add('Estatus y Nombre');
                   cbOrdCli.ItemIndex := 0;
                   end;
               12: //Cuentas Libres
                   begin
                   grgeneral.Parent := Tabclientes2Libres;
                   ltotal.Parent := Tabclientes2Libres;
                   rcount.Parent := Tabclientes2Libres;
                   Rcount.Caption :='';
                   GFechTodas.Parent := Tabclientes2Libres;
                   ptiempo2.Parent := Tabclientes2Libres;
                   end;

               13: begin  //travelers
                   rgcuenta.Parent := tabclientes2Travels;
                   grgeneral.Parent := tabclientes2Travels;
                   ltotal.Parent := tabclientes2Travels;
                   rcount.Parent := tabclientes2Travels;
                   rgcuenta.enabled := true;
                   Rcount.Caption :='';
                   rgcuenta.Top := 40;
                   rgcuenta.Left := 240;
                   edcuentap.SetFocus;
                   end;

               14: begin  //Modificaciones
                   rgcuenta.Parent := tabclientes2Modificaciones;
                   gbfechas.Parent := tabclientes2Modificaciones;
                   tpdesde.Date := FechaServidor;
                   tphasta.Date := tpdesde.Date;
                   grgeneral.Parent := tabclientes2Modificaciones;
                   ltotal.Parent := tabclientes2Modificaciones;
                   rcount.Parent := tabclientes2Modificaciones;
                   Rcount.Caption :='';
                   rgcuenta.Top := 16;
                   rgcuenta.Left := 450;
                   gbfechas.Left := 600;
                   gbfechas.Top := 16;
                   edcuentap.SetFocus;
                   end;
               15: begin //Bono Patrulleros
                    btnbuscar.Enabled := true;
                    btngenerar.Enabled := false;
                    tpcdesde.Date := FechaServidor;
                    tpchasta.date := FechaServidor;
                    PCentralFechas.Parent := tsNoUbicados;
                    GRGeneral.Parent := tsNoUbicados;
                    PCentralFechas.Left := 5;
                    PCentralFechas.Top := 50;
                  end;
               16: begin //Tipo envio trafico
                    btnbuscar.Enabled := true;
                    btngenerar.Enabled := false;
                    GRGeneral.Parent := Tabclientes2TipoEnvio;
                    ltotal.Parent := Tabclientes2TipoEnvio;
                    rcount.Parent := Tabclientes2TipoEnvio;
                  end;
               17: begin //protocolos diferentes
                    lbimprimir.Parent := TabProtDif;
                    lbimprimir.Caption := 'Cuentas que tienen un protocolo en clientes y otro en zonas';
                    grgeneral.Parent := TabProtDif;
                    ltotal.Parent := TabProtDif;
                    rcount.Parent := TabProtDif;
                   end;

               18: begin //Anualidad Anterior
                   gbanos.Parent :=  tabclientes2Anualidades;
                   grgeneral.Parent := tabclientes2Anualidades;
                   ltotal.Parent := tabclientes2Anualidades;
                   rcount.Parent := tabclientes2Anualidades;
                   decodedate(FechaServidor, ano, mes, dia);
                   edanodesde.Text := inttostr(ano-1);
                   edanohasta.Text := inttostr(ano);
                   end;
               19: begin //Gastos Mayores
                   grgeneral.Parent := tabclientes2GastosMayores;
                   ltotal.Parent := tabclientes2GastosMayores;
                   rcount.Parent := tabclientes2GastosMayores;
                   gbfechas.Parent := tabclientes2GastosMayores;
                   decodedate(FechaServidor, ano, mes, dia);
                   tpdesde.Date := EncodeDate(ano-1, 1, 1);
                   tphasta.Date := EncodeDate(ano-1,12,31);
                   edcantidad.text := '50000';
                   end;
             end;
end;

procedure Tfrmmoduloreportes.FormShow(Sender: TObject);
begin
 MemoAdjuntos := Tmemo.Create(self);
 MemoAdjuntos.Parent := frmprincipal;
 MemoAdjuntos.Visible := false;
 MemoAdjuntos.Font.Size := 6;
 MemoAdjuntos.Width := 700;
TabPrincipal.ActivePageDefault := TabReportesGenerales;
TabPrincipal.TabIndex := 0;

cbgenerar.Clear;
cbgenerar.add('Vista Previa');
cbgenerar.add('Email');
cbgenerar.add('Guardar');
cbgenerar.add('Imprimir');
cbgenerar.ItemIndex := 0;
TipoImprecionProcedure;
end;

procedure Tfrmmoduloreportes.edbuscarButtonClick(Sender: TObject);
begin
buscarcuenta;
end;

procedure Tfrmmoduloreportes.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then
 begin
  ldir.Caption:='';
  lnombre.Caption:='';
  lsector.Caption:='';
 end;
end;

procedure Tfrmmoduloreportes.edbuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
if (tabinv2.ActivePageIndex = 2) and (edbuscar.Text <> '') and (key = #13) then
 begin
  key := #0;
  try
   strtoint(edbuscar.Text);
   querys('select if(rsocial is null or rsocial='''',concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'''')),rsocial) as nombre from clientes where idcliente='+edbuscar.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount = 0 then
    application.MessageBox('El numero de cliente introducido no existe','Aviso',mb_iconinformation)
   else
    edbuscar.Text := sqlgeneral.fieldbyname('nombre').AsString;
  except
  end;
 end;

if (key = #13) then
   begin
     key:=#0;
     if edbuscar.Text <> '' then begin
        buscarEstCuenta;
        btngenerar.OnClick(self);
     end else
        edbuscar.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edbuscar.Text:='';
  end;
end;

procedure Tfrmmoduloreportes.nota4Exit(Sender: TObject);
begin
btngenerar.SetFocus;
end;

procedure Tfrmmoduloreportes.edusuario1ButtonClick(Sender: TObject);
begin
BuscarUsuario(1);

end;

procedure Tfrmmoduloreportes.edusuario2ButtonClick(Sender: TObject);
begin
BuscarUsuario(2);
end;

procedure Tfrmmoduloreportes.edusuario1KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edusuario1.Text = '' then

        edusuario1.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edusuario1.Text:='';
  end;
end;

procedure Tfrmmoduloreportes.edusuario2KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edusuario2.Text = '' then

        edusuario2.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edusuario2.Text:='';
  end;
end;

procedure Tfrmmoduloreportes.dUnafechaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     btngenerar.SetFocus;
  end;
end;

procedure Tfrmmoduloreportes.TabInst2TabClick(Sender: TObject);
begin
deshabilitaboton(TabInst2,0,btngenerar);
case TabInst2.TabIndex of
    0: begin
       linea.Parent:=TabInst2Comi;
       end;

    1: begin
       linea.Parent:=TabInst2Comi;
       gbusuarios.Parent:= TabInst2Comi;
       gbperiodo.Parent:= TabInst2Comi;
       gbperiodo.Top := 135;
       gbperiodo.Left := 24;
       edusuario1.setfocus;
       dfecha1.Date:=strtodate(formatdatetime('yyyy""/""mm',now)+'/01');
       dfecha2.Date:=now;
       end;

    2: begin
       gbPeriodoMesA.Parent:= TabInst2Tende;
       cboano.Text:=formatdatetime('yyyy',now);
       cbomeses.ItemIndex:=strtoint(formatdatetime('m',now))-1;
       cbomeses.setfocus;
       end;

  end;//case
end;

procedure Tfrmmoduloreportes.ckbRdetalladoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     dfecha1.SetFocus;
  end;
end;

procedure Tfrmmoduloreportes.ckbRsimpleClick(Sender: TObject);
begin
if ckbRdetallado.Checked = true then begin
      application.messagebox('Solo puede haber una opción para el reporte','Atención',mb_IconInformation);
      ckbRsimple.Checked:= false;
end;

end;

procedure Tfrmmoduloreportes.ckbRdetalladoClick(Sender: TObject);
begin
if ckbRsimple.Checked = true then begin
      application.messagebox('Solo puede haber una opción para el reporte','Atención',mb_IconInformation);
      ckbRdetallado.Checked:= false;
end;
end;

procedure Tfrmmoduloreportes.edpedido1KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edpedido1.Text = '' then
        edpedido1.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edpedido1.Text:='';
  end;
end;

procedure Tfrmmoduloreportes.edpedido2KeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edpedido1.Text = '' then

        edpedido1.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edpedido1.Text:='';
  end;
end;

procedure Tfrmmoduloreportes.edpedido2Exit(Sender: TObject);
begin
btngenerar.SetFocus;
end;

procedure Tfrmmoduloreportes.edpedido1ButtonClick(Sender: TObject);
begin
buscarpedido(1);
end;

procedure Tfrmmoduloreportes.edpedido2ButtonClick(Sender: TObject);
begin
BuscarPedido(2);
end;

procedure Tfrmmoduloreportes.ckbabogadoClick(Sender: TObject);
begin
if ckbabogado.Checked = true then begin
   gbabogado.Visible:=true;
end else begin
   gbabogado.Visible:=false;
end;
end;

procedure Tfrmmoduloreportes.edabogadoButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
  frmbusquedas.query:='Select idabogado,concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) as Abogado,nota as Notas from abogados order by idabogado';
  frmbusquedas.campo_retorno:='idabogado';
  frmbusquedas.tblorigen:='abogados';
  frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
              edabogado.text:=frmbusquedas.resultado
            end;
end;

procedure Tfrmmoduloreportes.cbocolonia1NotInList(Sender: TObject);
begin
cbocolonia1.itemindex:=0;
end;

procedure Tfrmmoduloreportes.cbocolonia2NotInList(Sender: TObject);
begin
cbocolonia2.itemindex:=0;
end;

procedure Tfrmmoduloreportes.edbuscarcontratoButtonClick(Sender: TObject);
begin
      frmbusquedas.query:='Select idcontrato as Id,TipoCont as TipoCont,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From contratos order by tipocont';
      frmbusquedas.campo_retorno:='TipoCont';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='contratos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             edbuscarcontrato.Text:=frmbusquedas.resultado;
            end;
end;

procedure Tfrmmoduloreportes.RzBitBtn1Click(Sender: TObject);
begin
if edbuscarcontrato.Text  = '' then
  querys('select c.idcliente,(''SIN CONTRATO'') as nombre,con.TipoCont,cf.NombreCres as Cliente,t.telefono,c.DesdeCont,c.HastaCont from clientes '+
         ' as c left join contratos as con ON(con.TipoCont=c.TipoCont) left join ClientesFact as cf on c.idfact = cf.idfact left join telefonos as t on (t.idtel=c.idtel and t.Tipo_tel="ALARMA") where (con.nombre is null or con.nombre = '' '') group by c.idcliente',0,dmreportes.sqlgeneral)
else
  querys('select c.idcliente,con.nombre,con.TipoCont,cf.NombreCres as Cliente,t.telefono,c.DesdeCont,c.HastaCont from '+
         ' clientes as c left join contratos as con ON(con.TipoCont=c.TipoCont) left join ClientesFact as cf on c.idfact = cf.idfact left join telefonos as t on (t.idtel=c.idtel and t.Tipo_tel="ALARMA") where con.TipoCont='+quotedstr(edbuscarcontrato.text)+' group by c.idcliente',0,dmreportes.sqlgeneral);

if(DMREPORTES.sqlgeneral.RecordCount > 0) then
        OperacionReporte('ContratosCuentas','',TipoImpresion,1)
else
       Application.MessageBox('No hay datos a mostrar','Atención!',MB_OK);
end;

procedure Tfrmmoduloreportes.lbtraficoMouseLeave(Sender: TObject);
begin
lbtrafico.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtraficoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbtrafico.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbtraficoClick(Sender: TObject);
var hija:TReports_Alarmex;
begin
           hija:=TReports_Alarmex.Create(self);
           hija.Show;
end;

procedure Tfrmmoduloreportes.edbuscarUButtonClick(Sender: TObject);
begin
      frmbusquedas.query:='Select u.idusuario,u.codigo,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Nombre,u.idsector as Sector, '+
                          'a.nombre as Area,p.nombre as Puesto From usuarios as u LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE u.estatus = 1 order by u.codigo';
      frmbusquedas.campo_retorno:='codigo';
      frmbusquedas.campo_busqueda:='codigo';
      frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.ShowModal;

      if frmbusquedas.resultado <> '' then
       begin
              edbuscarU.Text := frmbusquedas.resultado;
       end;
end;

procedure Tfrmmoduloreportes.edbuscarUKeyPress(Sender: TObject;
  var Key: Char);
begin
if ((key =#13) and (edbuscarU.text <> '')) then
   btngenerar.OnClick(self);
end;

procedure Tfrmmoduloreportes.edbuscarcontratoKeyPress(Sender: TObject;
  var Key: Char);
begin
if ((key =#13) and (edbuscarcontrato.text <> '')) then
   RzBitBtn1.OnClick(self);
end;

procedure Tfrmmoduloreportes.EDdesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if key=#13 then
  edhasta.SetFocus;
end;

procedure Tfrmmoduloreportes.EDhastaKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if key=#13 then
  begin  
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmmoduloreportes.btnbuscarClick(Sender: TObject);
begin
//dmreportes.sqlgeneral.close;
frmmensaje.Show;
frmmensaje.Update;
if  TabPrincipal.ActivePage = TabClientes then
  begin
  case TabClientes2.TabIndex of
     4: Clistatus;
     5: ClientesBloqueado;
     6: ClientesCuenta;
     7: ClientesResumen;
     8: Clientespolizas;
     9: OpenCloseOxxos;
    10: buscarSinasignacion;
    11: buscarClienteProtocolos;
    12: CuentasLibres;
    13: TravelCliente;
    14: ClientesModificaciones;
    15: ClientesNoUbicados(0);
    16: buscarTipoEnvio;
    17: ProtocolosDiferentes(0);
    18: AnualidadAnterior;
    19: GastosMayores;

    end;
   end;

if  TabPrincipal.ActivePage = TabCentral then
  begin
  case TabCentral2.TabIndex of
    1: buscarsenalesnorec;
    2: FalsasAlarmas;
    3: buscarRetardoPatrullero;
    4: buscarTiempoPatrulleros;
    5: buscarEmergenciasPorTurno;
    6: buscarEmergenciasPorTipo;
    7: buscarConcentradoAlarmas;
    8: ActivacionesDiarias;
    9: buscarEmergenciasCliente;
   10: TraficoResumen;
   11: BuscarMotivoRetardo;
   15: EnvTrafCol;
   16: ClientesSinActividad;
   18: CentralerosTickets;
   end;
  end;

if  TabPrincipal.ActivePage = TabServicios then
  begin
  case TabServicios2.TabIndex of
     1: buscarservicio;
     2: buscartendenciatec;
     3: ServiciosRepetidos;
     {4: TickPendTec;
     5: PorAtender;
     6: TiemposExtras;}
     end;
  end;

if TabPrincipal.ActivePage = TabInv then
 begin
  case TabInv2.TabIndex of
   2: if gbTipoBusqueda.ItemIndex = 0 then
       ajusteinventario(self,edbusqueda.Text,'',0)
      else
       ajusteinventario(self,'',edbusqueda.Text,0);
   end;
 end;

if  TabPrincipal.ActivePage = pcadmon then
  begin
  case pcadministracion.TabIndex of
     2: BuscarDesempeno;
     end;
  end;


frmmensaje.close;
Rcount.Caption := inttostr(dmreportes.sqlgeneral.RecordCount);
if dmreportes.DssqlGeneral.DataSet.RecordCount <> 0 then
  btngenerar.Enabled := true;
end;

procedure Tfrmmoduloreportes.EDdesdeChange(Sender: TObject);
begin
dmreportes.sqlgeneral.Active := false;
RCount.caption:='';
end;

procedure Tfrmmoduloreportes.EDhastaChange(Sender: TObject);
begin
dmreportes.sqlgeneral.Active := false;
RCount.caption:='';
end;

procedure Tfrmmoduloreportes.sqlgeneralAfterClose(DataSet: TDataSet);
begin
if TabClientes2.TabIndex <> 7 then
  GRview.ClearItems;
end;

procedure Tfrmmoduloreportes.sqlgeneralAfterOpen(DataSet: TDataSet);
begin
if TabClientes2.TabIndex <> 7 then
 GRview.DataController.CreateAllItems;
end;

procedure Tfrmmoduloreportes.Clistatus;
var cadena:string;
begin
if RBSTnoDetallado.Checked = True then
  begin
  cadena := 'select idcliente, '+
    ClienteNombre('clientes')+' as Nombre, if(clientes.numero is NULL or clientes.numero="", clientes.dir, concat(clientes.dir, " ",clientes.numero," ", '+
    'colonias.nombre)) as colonia,  clientes.cp, clientes.telefono, clientes.refs as referencia, categorias.nombre as categoria, if(clientes.estatus = 1, '+
    '"ACTIVO", if (clientes.estatus = 0, "INACTIVO", "PROSPECTO")) as estatuscliente from clientes left join colonias on (clientes.idcol= '+
    'colonias.idcol) left join categorias on (categorias.idcategoria = clientes.idcategoria) where clientes.idcliente between "'+Eddesde.Text+'" AND "'+Edhasta.text+'" ';
    if RbstActivo.Checked=TRUE then
      cadena := cadena+'AND clientes.estatus=1 ';
    if RbSTInactivo.Checked=TRUE then
      cadena := cadena+'AND clientes.estatus=0 ';
    cadena := cadena+'group by clientes.idcliente order by idcliente';
  end
else
  begin
  cadena := 'select idcliente, '+
    ClienteNombre('clientes')+' as Nombre, if(clientes.numero is NULL or clientes.numero="", clientes.dir, concat(clientes.dir, " ",clientes.numero," ",colonias.nombre)) '+
    'as colonia,  clientes.telefono, clientes.refs as referencia, '+
    'categorias.nombre as categoria, if(contactos.apaterno is NULL or contactos.apaterno="", contactos.nombre, if(contactos.amaterno is NULL or contactos.amaterno="", concat(contactos.nombre, " ", contactos.apaterno), '+
    'concat(contactos.nombre, " ", contactos.apaterno, " ", contactos.amaterno))) as contactos, if(telefonos.extencion is NULL or telefonos.extencion="", telefonos.telefono, concat(telefonos.telefono," (",telefonos.extencion, ")"))'+
    ' as telefonos, contactos.nivel, contactos.relacion, if(clientes.estatus = 1, "ACTIVO", if (clientes.estatus = 0, "INACTIVO", "PROSPECTO") ) as estatuscliente from contactos right join clientes on contactos.idcontacto = clientes.idcontacto'+
    ' left join  telefonos on (contactos.idtel = telefonos.idtel) left join colonias on '+
    '(clientes.idcol= colonias.idcol) left join categorias on (categorias.idcategoria = clientes.idcategoria) where clientes.idcliente '+
    'between "'+Eddesde.Text+'" AND "'+Edhasta.text+'"  and contactos.procedencia = "clientes" ';
    if RbstActivo.Checked=TRUE then
      cadena:=cadena+'AND clientes.estatus=1 ';
    if RbSTInactivo.Checked=TRUE then
      cadena:=cadena+'AND clientes.estatus=0 ';
    cadena:=cadena+'order by idcliente';
  end;
querys(cadena, 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.ClientesBloqueado;
var cadena:string;
begin
cadena := 'Select " De '+datetostr(tpdesde.Date)+' al '+datetostr(tphasta.Date)+'"  as periodo, idcliente, '+ClienteNombre('clientes')+' as Nombre, if(clientes.numero is NULL or clientes.numero="", clientes.dir, concat(clientes.dir, " ",clientes.numero," ",colonias.nombre)) as colonia, '+
          'clientes.telefono, clientes.refs as referencia, notabloqueo, usuarios.nombre as usuario, concat(clientes.fecha, " ", clientes.hora) as fecha, categorias.nombre as categoria, "BLOQUEADO" '+
          'as estatuscliente from clientes left join colonias on (clientes.idcol= colonias.idcol) left join categorias '+
          'on (categorias.idcategoria = clientes.idcategoria) left join usuarios on (usuarios.codigo=clientes.idusuario) where clientes.bloqueado = 1 ';
  if RBrango.Checked then
    cadena := cadena + 'and idcliente between "'+edbdesde.Text+'" and "'+edbhasta.Text+'" ';
  cadena := cadena + ' and clientes.fecha between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" ';
querys(cadena, 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.ClientesCuenta;
begin
  querys('Select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), '+
         'concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, if(clientes.numero is NULL or clientes.numero='''', clientes.dir, concat(clientes.dir, '' '',clientes.numero,'' '',colonias.nombre)) as '+
         'colonia,  clientes.telefono, clientes.refs as referencia,if(clientes.estatus=0,''Inactivo'',if(clientes.estatus=1,''Activo'',''Por Revisar'')) as Estatus '+
         'from clientes left join colonias on (clientes.idcol= colonias.idcol) where clientes.nombre like '+quotedstr('%'+ednombre.Text+'%')+' order by clientes.idcliente', 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.llenacombos;
begin
//TIPO CUENTA
With CBTcuenta do
  begin
  Clear;
  Add('TODOS');
  Add('ACTIVOS');
  Add('INACTIVOS');
//  Add('PROSPECTOS');
  ItemIndex := 0;
  end;
  with dmreportes do
  begin
//SECTOR
  cargacombo('Select idsector, nombre from sectores order by idsector','sectores',cbsector);
  CbSector.Items.Insert(0, 'TODOS');
  CBSector.ItemIndex := 0;

//categoria
  cargacombo('Select idcategoria, nombre from categorias order by idcategoria ','categorias',cbocategorias);
  cbocategorias.Items.Insert(0, 'TODOS');
  cbocategorias.ItemIndex := 0;
//giros
  cargacombo('Select idgiro,nombre from giros order by nombre ','categorias',cbgiro);
  cbgiro.Items.Insert(0, 'TODOS');
  cbgiro.ItemIndex := 0;
//ALARMA
  cargacombo('Select a.cod_cve as nombre from articulos as a left join dptos as d on d.iddpto=a.iddpto where d.nombre="CONTROLES" order by cod_cve ', 'articulos', CBAlarma);
  CBAlarma.Items.Insert(0, 'TODOS');
  CBAlarma.ItemIndex := 0;

//COLONIA
  cargacombo('Select idcol, nombre from colonias order by nombre asc','colonias',CBColonia);
  CBColonia.Items.Insert(0, 'TODOS');
  CBColonia.ItemIndex := 0;
  end;
end;

procedure Tfrmmoduloreportes.ClientesResumen;
var
   cadena,condicion, tabla:string;
begin
   cadena:='';
   condicion := '';
   tabla := 'from clientes c left join sectores s on c.sector=idsector left join categorias cat '+
            'on c.idcategoria =cat.idcategoria left join articulos a on a.cod_cve=c.alarm left join '+
            'colonias col on col.idcol=c.idcol left join giros g on g.idgiro=c.idgiro ';

   if cbtcuenta.Text = 'ACTIVOS' then
      cadena := ' and c.estatus=1';
   if cbtcuenta.Text = 'INACTIVOS' then
      cadena := ' and (c.estatus <> 1)';

   if cbsector.Text <> 'TODOS' then
      cadena := cadena + ' and s.nombre = '+quotedstr(cbsector.Text);
   if cbgiro.Text <> 'TODOS' then
      cadena := cadena + ' and g.nombre='+quotedstr(cbgiro.Text);
   if cbocategorias.Text <> 'TODOS' then
      cadena :=  cadena + ' and cat.nombre='+quotedstr(cbocategorias.Text);
   if cbalarma.Text <> 'TODOS' then
      cadena := ' and a.cod_cve ='+quotedstr(cbalarma.Text);
   if cbcolonia.Text <> 'TODOS' then
      cadena := cadena + ' and col.nombre='+quotedstr(cbcolonia.Text);

   if cadena <> '' then
   begin
      delete(cadena,1,4);
      condicion := ' where ';
   end;

   if (cbsector.Text='TODOS') and (cbgiro.Text='TODOS') and (cbocategorias.Text='TODOS') and
      (cbalarma.Text='TODOS') and (cbcolonia.Text='TODOS') then
   begin
      //sectores
      querys('Select count(idcliente) as total, Sector from ( select s.nombre as Sector,  c.idcliente from sectores s '+
             'left join clientes c on c.sector=s.idsector '+condicion+' '+cadena+' and c.TipoCont <> 14 ) as r group by '+
             'sector order by Sector asc',0,dmreportes.sqlgeneral6);
      //alarmas
      querys('Select count(idcliente) as total, Alarmas from ( select distinct  if(a.cod_cve="" or a.cod_cve is null, '+
             '" Ningun Tipo",a.cod_cve) as Alarmas, c.idcliente from clientes c left join articulos a on '+
             'a.cod_cve=c.alarm '+condicion+' '+cadena+' and c.TipoCont <> 14 order by idcliente ) as r group by Alarmas '+
             'order by Alarmas',0,dmreportes.sqlgeneral2);
      //colonias
      querys('select col.nombre as Colonias, count(idcliente) as total from clientes c left join colonias col on col.idcol=c.idcol '+
             condicion+' '+cadena+' and c.TipoCont <> 14 group by col.nombre order by col.nombre asc',0,dmreportes.sqlgeneral3);
      //giros
      querys('select g.nombre as Giro, count(idcliente) as total from clientes c left join giros g on c.idgiro =g.idgiro'+
       ' '+condicion+' '+cadena+' and c.TipoCont<>14 group by g.nombre order by g.nombre asc',0,dmreportes.sqlgeneral4);
      //categorias
      querys('select cat.nombre as Categoria, count(idcliente) as total from clientes c left join categorias cat on '+
             'c.idcategoria =cat.idcategoria '+condicion+' '+cadena+' and c.TipoCont<>14 group by cat.nombre order '+
             'by cat.nombre asc',0,dmreportes.sqlgeneral5);

      querys('Select distinct idcliente, '+ClienteNombre('c')+' as Nombre, if(c.numero is NULL or c.numero='''', c.dir, concat(c.dir, '' '',c.numero,'' '',col.nombre)) as colonia,'+
       ' c.telefono,c.email, c.refs as referencia '+tabla+condicion+' '+cadena+' and c.TipoCont<>14 order by idcliente',0,dmreportes.sqlgeneral);
   end
   else
   begin
      //sectores

      querys('select s.nombre as Sector, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.TipoCont <> 14 group by s.nombre order by s.nombre asc',0,dmreportes.sqlgeneral6);
      //alarmas
      querys('select if(a.cod_cve="", "Ningun Tipo",a.cod_cve) as Alarmas, count( a.cod_cve) as total '+tabla+condicion+' '+cadena+' and c.TipoCont <> 14 group by a.cod_cve order by a.cod_cve asc',0,dmreportes.sqlgeneral2);
      //colonias
      querys('select col.nombre as Colonias, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.TipoCont <> 14 group by col.nombre order by col.nombre asc ',0,dmreportes.sqlgeneral3);
      //giros
      querys('select g.nombre as Giro, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.TipoCont <> 14 group by g.nombre order by g.nombre asc',0,dmreportes.sqlgeneral4);
      //categorias
      querys('select cat.nombre as Categoria, count(idcliente) as total '+tabla+condicion+' '+cadena+' and c.TipoCont <> 14 group by cat.nombre order by cat.nombre asc',0,dmreportes.sqlgeneral5);

      querys('Select distinct idcliente, '+ClienteNombre('c')+' as Nombre, if(c.numero is NULL or c.numero='''', c.dir, concat(c.dir, '' '',c.numero,'' '',col.nombre)) as colonia,'+
       ' c.telefono,c.email, c.refs as referencia '+tabla+condicion+' '+cadena+' and c.TipoCont <> 14 order by idcliente',0,dmreportes.sqlgeneral);
   end;
   Lclientes.Caption := inttostr(dmreportes.sqlgeneral.RecordCount) ;
   RBresumen.SetFocus;
   btngenerar.Enabled := true;
end;


procedure Tfrmmoduloreportes.RBPolxCtaClick(Sender: TObject);
begin
edcuentap.Enabled := true;
edcuentap.Setfocus;
sqlgeneral.close;
end;

procedure Tfrmmoduloreportes.RBpolTodosClick(Sender: TObject);
begin
edcuentap.Text :='';
edcuentap.Enabled :=false;
end;

procedure Tfrmmoduloreportes.EdcuentapKeyPress(Sender: TObject;
  var Key: Char);
begin
if (tabclientes2Modificaciones.Showing = true) and (RGCliCamb.ItemIndex = 5) then
  begin end else
  key:=ValidaNumeros(key,true);
if key = #13 then
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
end;

procedure Tfrmmoduloreportes.CBTcuentaNotInList(Sender: TObject);
begin
CBTcuenta.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.CBSectorNotInList(Sender: TObject);
begin
CBSector.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.CBgiroNotInList(Sender: TObject);
begin
CBgiro.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.CBAlarmaNotInList(Sender: TObject);
begin
CBAlarma.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.CBColoniaNotInList(Sender: TObject);
begin
CBColonia.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.Clientespolizas;
begin
if RBPolxCta.Checked = true then
  begin
querys('select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), '+
       'concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, '+
       'if(poliza=1,''Si'',''No'') as Poliza, FechaPoli as Fecha_Alta, '+
       'if(EstVul=1,''Si'',''No'') as Estudio, ArtDesc, FechaPolVe as Fecha_Vence from clientes where idcliente='+edcuentap.Text+' order by idcliente', 0, dmreportes.sqlgeneral);
  end
else
  begin
  querys('select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), '+
       'concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, '+
       'if(poliza=1,''Si'',''No'') as Poliza, FechaPoli as Fecha_Alta, '+
       'if(EstVul=1,''Si'',''No'') as Estudio, ArtDesc, FechaPolVe as Fecha_Vence from clientes where poliza=1 order by idcliente', 0, dmreportes.sqlgeneral);
  end;
  GRGeneral.SetFocus;
end;

procedure Tfrmmoduloreportes.edcuentapButtonClick(Sender: TObject);
begin
if (tabclientes2Modificaciones.Showing = true) and (RGCliCamb.ItemIndex = 5) then
  begin
  with frmbusquedas do
    begin
    query:='Select UCLogin as idusuario, nombre, apaterno, amaterno from usuarios as u left join UCTabUsers as uc on uc.UCIdUser=u.idusuario where estatus = 1 order by nombre';
    campo_retorno:='idusuario';
    campo_busqueda:='nombre';
    tblorigen := 'usuarios';
    lbldesc.Caption:='Busqueda por Nombre:';
    ShowModal;
    if resultado <> '' then
      edcuentap.Text := resultado;
    end;
  end
else
  begin
  with frmbusquedas do
    begin
    query:='Select idcliente, nombre, apaterno, amaterno from clientes order by idcliente';
    campo_retorno:='idcliente';
    campo_busqueda:='nombre';
    tblorigen := 'clientes';
    lbldesc.Caption:='Busqueda por Nombre:';
    ShowModal;
    if resultado <> '' then
      begin
      if RBPolxCta.Checked then
        edcuentap.Text := resultado;
      if TabServBusq2.TabIndex = 0 then
        edclientes.Text := resultado;
      if TabServBusq2.TabIndex = 3 then
        edclientes.Text := resultado;
      end;
    end;
  end;
end;


procedure Tfrmmoduloreportes.tpdesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  tphasta.SetFocus;
end;

procedure Tfrmmoduloreportes.tphastaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.onclick(self);
end;

procedure Tfrmmoduloreportes.EDnombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.CBTcuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  cbsector.SetFocus;
end;

procedure Tfrmmoduloreportes.CBSectorKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  CBGiro.SetFocus;
end;

procedure Tfrmmoduloreportes.CBgiroKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  CBAlarma.SetFocus;
end;

procedure Tfrmmoduloreportes.CBAlarmaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  CBColonia.SetFocus;
end;

procedure Tfrmmoduloreportes.CBColoniaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBresumendetKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btngenerar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBresumenKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  btngenerar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBSTDetalladoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBSTNodetalladoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;
        
procedure Tfrmmoduloreportes.RBSTTodosClick(Sender: TObject);
begin
if Tabclientes2status.Showing = true then
  RBSTDetallado.Setfocus;
eddesde.text := '';
edhasta.text := '';
end;

procedure Tfrmmoduloreportes.RBpolTodosKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBPolxCtaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  edcuentap.SetFocus;
end;

procedure Tfrmmoduloreportes.RBtodosKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  tpdesde.SetFocus;
  end;

procedure Tfrmmoduloreportes.RBrangoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  edbdesde.SetFocus;
end;

procedure Tfrmmoduloreportes.TabServicios2TabClick(Sender: TObject);
begin
deshabilitaboton(TabServicios2,0,btnbuscar);
dmreportes.sqlgeneral.close;
dmreportes.sqlgeneral.SQL.Clear;
case TabServicios2.TabIndex of
                      1: begin
                         TabServBusq2.TabIndex := 0;
                         linea.Parent:=TabServicios2busquedas;
                         GRGeneral.Parent := TabServicios2busquedas;
                         btngenerar.Enabled := false;
                         end;
                      2: begin
                         linea.Parent := TabServicios2TendenciaTec;
                         linea.visible := true;
                         gbPeriodoMesA.Parent := TabServicios2TendenciaTec;
                         cboano.Text := formatdatetime('yyyy',now);
                         cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
                         cbomeses.setfocus;
                         btngenerar.Enabled := true;
                         btnbuscar.Enabled := false;
                         end;
                      3: begin
                         cbtecnico.Parent := ServRep;
                         lbltecnico.Parent := ServRep;
                         lbltecnico.Visible := true;
                         gbfechas.Parent := ServRep;
                         cbtecnico.Left := 90;
                         lbltecnico.Left := 25;
                         gbfechas.Left := 40;
                         gbfechas.Top := 60;
                         tpdesde.Date := FechaServidor;
                         tphasta.Date := FechaServidor;
                         CargaCombo('select codigo2 as nombre from usuarios where idpuesto =3 or idpuesto = 16 or idpuesto = 15 having nombre <>  ''''','Tecnicos',cbtecnico);
                         cbtecnico.Items.Add('TODOS');
                         cbtecnico.Text := 'TODOS';
                         btngenerar.Enabled := true;
                         btnbuscar.Enabled := false;
                         end;
                     { 4: begin //Tickets Pendientes por tecnico
                         GRGeneral.Parent := TabServicios2tckPend;
                         end;

                      5: begin //Servicios por Atender
                         GRGeneral.Parent := TabServiciosPorAtender;
                         gbfechas.Parent := TabServiciosPorAtender;
                         gbfechas.Left := 40;
                         gbfechas.Top := 60;
                         tpdesde.Date := FechaServidor;
                         tphasta.Date := FechaServidor;
                         ltotal.Parent := TabServiciosPorAtender;
                         Rcount.Parent := TabServiciosPorAtender;
                         Rcount.caption:='';
                         end;

                      6: begin
                         gbfechas.Parent := TabServicios2TE;
                         gbfechas.Left := 40;
                         gbfechas.Top := 60;
                         tpdesde.Date := FechaServidor;
                         tphasta.Date := FechaServidor;
                         GRGeneral.Parent := TabServicios2TE;
                         ltotal.Parent := TabServicios2TE;
                         Rcount.Parent := TabServicios2TE;
                         Rcount.caption:='';
                         end;    }
  end;
end;

procedure Tfrmmoduloreportes.edbdesdeClick(Sender: TObject);
begin
eddesde.text := '';
edhasta.Text := '';
end;

procedure Tfrmmoduloreportes.BuscarServicio;
var cadena, periodo:string;
begin
case TabServBusq2.TabIndex of
  0: begin    //cuenta
    with dmreportes.sqlgeneral do
      begin
      close;
      SQL.Clear;
      sql.Add('select sid as servicio, fecha_creacion as creacion, hora_creacion, FechaFinUsr as ffinal, clientes.idcliente as cuenta, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, ');
      sql.Add('if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), ');
      sql.Add('clientes.rsocial) as Nombre, problema,  codtecnico as tecnico, es.nombre, servicios.trab_realizado, servicios.comentario, reportby as reporto,cs2.nombre as clasificacion ');
      sql.Add('from servicios left join clientes on (servicios.idcliente = clientes.idcliente) left join EstatusServicios as es ON (es.orden=servicios.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) ');
      sql.Add(' left join TipoServicios as tipos on(tipos.nombre=''CLASIFICAR SERVICIO'') left join clasif_servicios as cs2 on(cs2.idserv=tipos.idserv and cs2.orden=servicios.clasif) '+
        'where clientes.idcliente='+quotedstr(edclientes.Text));

      if RBFecRango.Checked then
        sql.Add(' and fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date)));
        sql.Add(' group by sid');
      open;
      LScuentas.Caption := inttostr(RecordCount);
      end;
    end;

  1: begin    //tecnico
  if Chfecha.Checked = false then
    periodo := '"Periodo: LISTADO TOTAL"'
  else
    periodo := '" De '+datetostr(TPSdesde.Date)+' a '+datetostr(TPShasta.Date)+'"';
    with dmreportes do
      begin
      cadena := 'Select sid as servicio, fecha_creacion as creacion, FechaFinUsr as ffinal, hora_creacion, c.idcliente as cuenta, '+ClienteNombre('c')+
              ' as Nombre, problema, '+periodo+' as periodo,  '+
              'if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("16:50:46")-hour(s.hora_creacion)), '+
              'if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0)))<=24, "0-24", '+
              'if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)), '+
              'if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0))) >48, "+48", "25-48")) as horas, '+
              'if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)), '+
              ' if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0)))<=24, 1, '+
              'if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)), '+
              'if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),0))) >48, 3, 2)) as hr, '+
              'codtecnico,s.comentario,s.trab_realizado, reportby,cs2.nombre  as clasificacion, '+UsuarioNombre('u')+' as tecnombre, es.nombre as estatus from servicios s '+
              'left join clientes c on (s.idcliente = c.idcliente) left join EstatusServicios as es ON (es.orden=s.status) left join usuarios u '+
              'on(u.codigo2 = s.codtecnico) left join TipoServicios as ts ON (ts.idserv=es.idserv) '+
              'left join TipoServicios as tipos on(tipos.nombre=''CLASIFICAR SERVICIO'')  left join clasif_servicios as cs2 '+
              'on(cs2.idserv=tipos.idserv and cs2.orden=s.clasif) ';


      if cbtecnico.text <> 'SELECCIONA TECNICO' then
        begin
        if cbtecnico.text <> 'SIN TECNICO'  then
           cadena := cadena + 'where s.codtecnico = '+quotedstr(cbtecnico.Text)
        else
           cadena := cadena + 'where (s.codtecnico = '''' or s.codtecnico is null)';

        if chestatus.Checked = true then
          begin
          if CBSTestatus.Text = 'POR ATENDER' then
            cadena := cadena + ' and s.status < 4 ';  //es.finaliza = 0  and
          if CBSTestatus.Text = 'FINALIZADOS' then
            cadena := cadena + 'and es.nombre =  ''FINALIZADA'' ';
          if CBSTestatus.Text = 'CANCELADA' then
            cadena := cadena + 'and es.nombre =  ''CANCELADA''  ';
          end;

        if chfecha.Checked = true then
          begin
          if CBSTestatus.Text = 'FINALIZADOS' then
            cadena := cadena + ' and FechaFinUSr between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' '
          else
            cadena := cadena + ' and fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' ';
          end;
        end
      else
        begin

        if chestatus.Checked = true then
          begin
          cadena := cadena + 'where ';
          if CBSTestatus.Text = 'POR ATENDER' then
            cadena := cadena + ' s.status < 4 ';  //es.finaliza = 0  and
          if CBSTestatus.Text = 'FINALIZADOS' then
            cadena := cadena + ' es.nombre =  ''FINALIZADA'' ';
          if CBSTestatus.Text = 'CANCELADA' then
            cadena := cadena + 'es.nombre =  ''CANCELADA''  ';
          end;


        if ((chfecha.Checked = true)  and (chestatus.Checked = true)) then
          begin
          if(chestatus.Checked = false) then
            cadena := cadena + 'where ';

          if CBSTestatus.Text = 'FINALIZADOS' then
            cadena := cadena + ' and FechaFinUSr between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' '
          else
            cadena := cadena + ' and fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' ';
          end
        else
          begin
          if (chestatus.Checked = true) then
            cadena := cadena + 'where ';

          if (chfecha.Checked = true)  then
            begin
            if CBSTestatus.Text = 'FINALIZADOS' then
              cadena := cadena + ' FechaFinUSr between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' '
            else
               cadena := cadena + ' fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' ';            end;
          end;
        end;

      cadena := cadena + ' group by sid';
      //SQL.Add(' order by c.idcliente');
      cadena := cadena + ' order by s.codtecnico asc, hr desc, fecha_creacion desc';
      querys(cadena,0,sqlgeneral);
      LStecnico.Caption := inttostr(sqlgeneral.RecordCount);
      end;
     end;

  2: begin  //fecha
    with dmreportes.sqlgeneral do
      begin
      close;
      SQL.Clear;
      SQL.Add('Select sid as servicio, concat(fecha_creacion, '' '', hora_creacion) as creacion, concat(FechaFinUsr, '' '', HoraFinUsr) as ffinal, clientes.idcliente as cuenta, ');
      SQL.Add('if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, ');
      SQL.Add('if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, problema,  ');
      SQL.Add('codtecnico , servicios.comentario,es.nombre as estatus, servicios.trab_realizado, reportby, cs2.nombre as clasificacion, usuarios.nombre as usuario, nomop ');
      SQL.Add('from servicios left join clientes on (servicios.idcliente = clientes.idcliente) left join EstatusServicios as es ON (es.orden=servicios.status) left join TipoServicios as ts ON (ts.idserv=es.idserv)  ');
      SQL.Add('left join usuarios on(usuarios.codigo2 = servicios.codtecnico) left join TipoServicios as tipos on(tipos.nombre=''CLASIFICAR SERVICIO'')  left join clasif_servicios as cs2 on(cs2.idserv=tipos.idserv and cs2.orden=servicios.clasif) ');
      SQL.Add('where ');
      if cbestatusf.Text = 'POR ATENDER' then
        SQL.Add(' status < 4 and ');
      if cbestatusf.Text = 'FINALIZADOS' then
        SQL.Add(' status = 5 and ');
      if cbestatusf.Text = 'CANCELADA' then
        SQL.Add(' status = 4 and ');

                 if CBSTestatus.Text = 'FINALIZADOS' then
                    SQL.Add(' FechaFinUSr between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' ')
                 else
                    SQL.Add(' fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+' ');

        SQL.Add('group by sid');
      open;
      LSfecha.Caption := inttostr(RecordCount);
      end;
    end;

   3: begin    //estatus
   with dmreportes.sqlgeneral do
      begin
      close;
      SQL.Clear;
      SQL.Add('Select sid as servicio, fecha_creacion, hora_creacion, fechafinusr as fechafinal,clientes.idcliente as cuenta,if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre,'+
              ' if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre,'' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, problema,codtecnico,'+
              ' s.comentario,es.nombre,s.trab_realizado,reportby,cs2.nombre as clasificacion '+
              '  from servicios as s left join clientes on (s.idcliente = clientes.idcliente) left join EstatusServicios as es ON (es.orden=s.status) left join TipoServicios '+
              ' as ts ON (ts.idserv=es.idserv) left join TipoServicios as tipos on(tipos.nombre=''CLASIFICAR SERVICIO'')  left join clasif_servicios as cs2 on(cs2.idserv=tipos.idserv and cs2.orden=s.clasif) ');
      if cbestatus.text <> 'ABIERTOS' then
        SQL.Add('where es.finaliza =1 ')
      else
        SQL.Add('where es.finaliza =0 ');
      if RBFecTodas.Checked = false then

                if CBSTestatus.Text = 'FINALIZADOS' then
                    SQL.Add('and FechaFinUSr between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+'  ')
                 else
                    SQL.Add('and fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+'  ');

      if CBClasifS.text <> 'TODOS' then begin
         SQL.Add(' and cs2.nombre ='+quotedstr(CBClasifS.Text));
      end;
      if edclientes.Text <> '' then
        SQL.Add(' and clientes.idcliente ='+quotedstr(edclientes.text));
      if CBtecnicos2.Text <> 'TODOS' then
        SQL.Add(' and codtecnico ='+quotedstr(CBtecnicos2.text));

      
      
        SQL.Add('group by sid');
      //  SQL.Add(' having Nombre like  ''%OXXO%'' ');
      SQL.Add(' order by clasificacion asc');
    //SQL.Add(' order by clientes.idcliente asc');
      open;
      LSestatus.Caption := inttostr(RecordCount);
      end;
     end;

     4: begin
        with dmreportes.sqlgeneral do
           begin
            close;
            SQL.Clear;
            SQL.Add('Select cp.nombre as CProblema,sid as servicio, fecha_creacion, hora_creacion, fechafinusr as fechafinal,clientes.idcliente as cuenta,if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre,'+
                    ' if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre,'' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, problema,codtecnico,'+
                    ' s.comentario,es.nombre,s.trab_realizado,reportby,cs2.nombre as clasificacion from servicios as s left join clientes on (s.idcliente = clientes.idcliente) left join EstatusServicios as es ON (es.orden=s.status) '+
                    ' left join TipoServicios  as ts ON (ts.idserv=es.idserv) left join TipoServicios as tipos on(tipos.nombre=''CLASIFICAR SERVICIO'') left join clasif_servicios as cs2 on(cs2.idserv=tipos.idserv and cs2.orden=s.clasif) '+
                    '  left join TipoServicios as tp on(tp.nombre=''PROBLEMA SERVICIOS'')  inner JOIN clasif_servicios as cp on(cp.idserv=tp.idserv and  cp.orden = s.idproblema) Where');

                 if cbestatusf.Text = 'FINALIZADOS' then
                    SQL.Add('FechaFinUSr between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+'  ')
                 else
                    SQL.Add('fecha_creacion between '+quotedstr(datetostr(TPSdesde.Date))+' and '+quotedstr(datetostr(TPShasta.Date))+'  ');


              if cbestatusf.Text <> 'TODOS' then
              begin

                  if cbestatusf.Text = 'POR ATENDER' then
                      SQL.Add('and  es.finaliza = 0 ');
                  if cbestatusf.Text = 'FINALIZADOS' then
                      SQL.Add('and es.nombre =  ''FINALIZADA'' ');
                  if cbestatusf.Text = 'CANCELADA' then
                      SQL.Add('and es.nombre =  ''CANCELADA''  ');

              end;

              if cboproblemaservicio.Text <> 'TODOS' then
                     SQL.Add('and cp.nombre ='+quotedstr(cboproblemaservicio.Text)+' ');

                SQL.Add('group by sid');
                SQL.Add(' order by cp.nombre,fecha_creacion asc');
                open;
                lbproblema.Caption := inttostr(RecordCount);
        end;
        end;
  end;//case
end;

procedure Tfrmmoduloreportes.RBSRfechasClick(Sender: TObject);
begin
ptiempo2.Visible := true;
end;

procedure Tfrmmoduloreportes.RBStodosClick(Sender: TObject);
begin
ptiempo2.Visible := false;
end;

procedure Tfrmmoduloreportes.TabServBusq2TabClick(Sender: TObject);
begin
dmreportes.sqlgeneral.close;
btngenerar.Enabled := false;
TPSdesde.Date := FechaServidor;
TPShasta.Date := FechaServidor;
edclientes.Text := '';

case TabServBusq2.TabIndex of
  0: begin
     ptiempo2.Parent := TabServBusqCuenta;
     ptiempo2.Visible := false;
     ptiempo2.Left := 616;
     ptiempo2.Top := 16;
     GFechTodas.Parent := TabServBusqCuenta;
     GFechTodas.Left := 288;
     GFechTodas.Top := 16;
     edclientes.Parent := TabServBusqCuenta;
     edclientes.Left := 80;
     edclientes.Top := 32;
     RBFecTodas.Checked := true;
     edclientes.setfocus;
     LScuentas.Caption := '';
     end;

  1: begin
     ptiempo2.Parent := TabServBusqTecnicos;
     ptiempo2.Visible := false;
     ptiempo2.Left := 584;
     ptiempo2.Top := 24;
     llenatecnicos(CBtecnico, self);
     CBtecnico.Items.Insert(0, 'SIN TECNICO');
     CBtecnico.Items.Insert(0, 'SELECCIONA TECNICO');
     CBtecnico.ItemIndex := 0;
     chfecha.Checked := false;
     chestatus.Checked := false;
     cbtecnico.Parent := TabServBusqTecnicos;
     CBtecnico.SetFocus;
     combosestatus(CBSTestatus,self);
     LStecnico.Caption := '';
     TPSdesde.Date := encodedate(yearof(today), monthof(today), 1);
     TPShasta.Date := today;
     end;

  2: begin
     ptiempo2.Parent := TabServBusqFecha;
     cbestatusf.Parent := TabServBusqFecha;
     ptiempo2.Visible := true;
     ptiempo2.Left := 16;
     ptiempo2.Top := 16;
     combosestatus(cbestatusf,self);
     TPSdesde.SetFocus;
     LSfecha.Caption := '';
     lbcboestatus.Parent := TabServBusqFecha;
     end;

  3: begin
     ptiempo2.Parent := TabServBusqEstatus;
     ptiempo2.Visible := false;
     ptiempo2.Left := 128;
     ptiempo2.Top := 58;
     GFechTodas.Parent := RGSerEst;
     GFechTodas.Left := 176;
     GFechTodas.Top := 8;
     RBFecTodas.Checked := true;
     edclientes.Parent := RGSerEst;
     edclientes.Left := 576;
     edclientes.Top := 24;
     with cbestatus do
       begin
       Clear;
       add('ABIERTOS');
       add('CERRADOS');
       ItemIndex := 0;
       setfocus;
       end;
     LSestatus.caption := '';

     cargacombo('Select id, nombre from clasif_servicios where idserv=1', 'clasif_servicios', CBClasifS);
     CBClasifS.Items.Insert(0, 'TODOS');
     CBClasifS.ItemIndex := 0;

     llenatecnicos(CBtecnicos2, self);
     CBtecnicos2.Items.Insert(0, 'TODOS');
     CBtecnicos2.ItemIndex := 0;
     end;

     4:begin // reportes de servicios por clasificacion de problema......
             ptiempo2.Parent := TabServBusqProblema;
             cbestatusf.Parent := TabServBusqProblema;
             lbcboestatus.Parent := TabServBusqProblema;
             ptiempo2.Visible := true;
             ptiempo2.Left := 16;
             ptiempo2.Top := 16;
             combosestatus(cbestatusf,self);
             CargaCombo('Select cs.nombre as nombre From TipoServicios as t  INNER JOIN clasif_servicios as cs on(cs.idserv=t.idserv) where t.nombre=''PROBLEMA SERVICIOS'' order by cs.orden asc','CAUSAS PROBLEMA',cboproblemaservicio);
             cboproblemaservicio.Items.Insert(0, 'TODOS');
             cboproblemaservicio.ItemIndex := 0;

       end;

  end;
end;

procedure Tfrmmoduloreportes.CBSTestatusNotInList(Sender: TObject);
begin
  CBSTestatus.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.combosestatus(const combo:trzcombobox;Sender :TObject);
begin
with combo do
  begin
  clear;
  Add('POR ATENDER');
  Add('FINALIZADOS');
  Add('CANCELADA');
  ItemIndex := 0;
  end;
end;

procedure Tfrmmoduloreportes.RBFecTodasClick(Sender: TObject);
begin
ptiempo2.Visible := false;
end;

procedure Tfrmmoduloreportes.RBFecRangoClick(Sender: TObject);
begin
ptiempo2.Visible := true;
end;

procedure Tfrmmoduloreportes.llenatecnicos(const combo:trzcombobox;Sender :TObject);
begin
querys('select idusuario, codigo2 from usuarios where '+
        'idarea =3 '+
        'having codigo2 <>  ''''', 0, sqlgeneral);
    combo.clear;
    with sqlgeneral do
      begin
        First;
        while not EOF = true do
          begin
          combo.Add(sqlgeneral.fieldbyname('codigo2').AsString);
          next;
          end;
        Close;
        end;
end;

procedure Tfrmmoduloreportes.ChEstatusClick(Sender: TObject);
begin
if chestatus.Checked = true then
  PSestatus.Visible := true
else
  PSestatus.Visible := false;
end;

procedure Tfrmmoduloreportes.ChFechaClick(Sender: TObject);
begin
if ChFecha.Checked = true then
  ptiempo2.Visible := true
else
  ptiempo2.Visible := false;
end;

procedure Tfrmmoduloreportes.Servicios;

begin          
case TabServBusq2.TabIndex of
  0: begin
     if RBFecTodas.Checked = true then
       querys('select '+quotedstr('LISTADO TOTAL')+' as inicio, '+quotedstr('LISTADO TOTAL')+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount , de.nombre as Empresa,' +
       ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc  from DatosEmpresa as de', 0, dmreportes.sqlgeneral2)
     else
      querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount, de.nombre as Empresa,'+
       'concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc  from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     OperacionReporte('ServiciosPorCliente','',TipoImpresion, 1);
     end;

  1: begin   
     OperacionReporte('ServiciosTecnicos','',TipoImpresion, 1);
     end;

  2: begin
     if cbestatusf.Text = 'POR ATENDER' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Por Atender')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa, '+
               ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2);
     if cbestatusf.Text = 'FINALIZADOS' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Finalizados')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,' +
               ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     if cbestatusf.Text = 'CANCELADA' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Cancelados')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,' +
               ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     if cbestatusf.Text = 'TODOS' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Totales')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,'+
               'concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     OperacionReporte('ServiciosPorEstatus','',TipoImpresion, 1);
     end;

  3: begin
     if RBFecTodas.Checked = true then
       querys('select '+quotedstr('LISTADO TOTAL')+' as inicio, '+quotedstr('LISTADO TOTAL')+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa, '+
              ' concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2)
     else
      querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,'+
             'concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2);
      OperacionReporte('ServiciosPorClasificacion2','',TipoImpresion, 1);
     end;
   4:begin

     querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,'+
             'concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2);

      OperacionReporte('ServiciosPorProblema','',TipoImpresion, 1);
     end;
  end;
end;

procedure Tfrmmoduloreportes.cbestatusNotInList(Sender: TObject);
begin
cbestatus.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.CBClasifSNotInList(Sender: TObject);
begin
CBClasifS.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.CBtecnicos2NotInList(Sender: TObject);
begin
CBtecnicos2.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.cbestatusfNotInList(Sender: TObject);
begin
cbestatusf.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.edscuentaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  RBFecTodas.SetFocus;
 key:=ValidaNumeros(key,true);
end;

procedure Tfrmmoduloreportes.ChEstatusKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (chEstatus.checked = true) then
  TPSdesde.SetFocus;
end;

procedure Tfrmmoduloreportes.ChFechaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  if chestatus.Checked then
    CBSTestatus.SetFocus
  else
    TPShasta.SetFocus;
end;

procedure Tfrmmoduloreportes.cbtecnicoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  chestatus.SetFocus;
end;

procedure Tfrmmoduloreportes.CBSTestatusKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  if chfecha.Checked then
    TPSdesde.SetFocus
  else
    btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.TPSdesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  TPShasta.SetFocus;
end;

procedure Tfrmmoduloreportes.TPShastaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  case  TabServBusq2.ActivePageIndex of
    0, 1:btnbuscar.OnClick(self);
       2: cbestatusf.SetFocus;
       3: CBClasifS.SetFocus;
    end;
  end;
end;

procedure Tfrmmoduloreportes.cbestatusfKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.cbestatusKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  RBFecTodas.SetFocus;
end;

procedure Tfrmmoduloreportes.RBFecTodasKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 case  TabServBusq2.ActivePageIndex of
       0: btnbuscar.OnClick(self);
       3: CBClasifS.SetFocus;
    end;
end;

procedure Tfrmmoduloreportes.RBFecRangoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  if RBFecRango.Checked then
    TPSdesde.SetFocus
 else
    CBClasifs.SetFocus;  
end;

procedure Tfrmmoduloreportes.CBClasifSKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  edclientes.SetFocus;
end;

procedure Tfrmmoduloreportes.edclientesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  case  TabServBusq2.ActivePageIndex of
       0: RBFecTodas.SetFocus;
       3: CBtecnicos2.SetFocus;
  end;
 key:=ValidaNumeros(key,true);
end;

procedure Tfrmmoduloreportes.CBtecnicos2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBSTactivoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  RBSTDetallado.SetFocus;
end;

procedure Tfrmmoduloreportes.RBSTInactivoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  RBSTDetallado.SetFocus;
end;

procedure Tfrmmoduloreportes.RBSTTodosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (Tabclientes2status.Showing = true) then
  RBSTDetallado.SetFocus;
if TabClientes2SinAsignacion.Showing = true then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.edscuentaChange(Sender: TObject);
begin
if edclientes.Text = '' then
  sqlgeneral.Close;
end;

procedure Tfrmmoduloreportes.buscarsenalesnorec;
begin
//PRUEBA SEMANAL
if rgpruebasem.ItemIndex = 0 then
  begin
  querys('select o.idcliente, max(o.fecha_pc) as f from open_close o inner join clientes c on c.idcliente = o.idcliente '+
         'where c.estatus = 1 '+
         'and ( (o.tipo=''0'' and o.zona=''0'') or (o.tipo=''RP'' ) or (o.tipo="602")) '+
         'and o.fecha_pc between date_sub('+quotedstr(datetostr(TPCNoSR.Date))+', interval 60 day) and '+quotedstr(datetostr(TPCNoSR.date))+''+
         'group by c.idcliente', 0, sqlgeneral);

  sqlgeneral.first;
  while not sqlgeneral.eof = true do
    begin
    //bpcambios('clientes', sqlgeneral.fieldbyname('idcliente').AsString, 'idcliente');
    querys('update clientes set ultfecps='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' '+
    'where clientes.idcliente='+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString), 1, dmreportes.sqlgeneral5);
    //apcambios('idcliente', sqlgeneral.fieldbyname('idcliente').AsString, 'clientes', 'frmmoduloreportes');
    sqlgeneral.next;
    end;

  querys('DROP TABLE IF EXISTS temp_nosrec'+frmprincipal.idmaq,1,sqlgeneral);
  querys('CREATE TABLE temp_nosrec'+frmprincipal.idmaq+' select idcliente, fecha_pc, nombre, telefono, sector, '+
         'inst, ni from ( select idcliente, fecha_pc, if(@idcliente = idcliente, @c:= @c +1, @c :=0) as c, @idcliente := idcliente, '+
         'nombre, telefono, sector, inst, ni from ( select c.idcliente, c.ultfecps as fecha_pc, @c:= 0, @idcliente := 0, '+
         ''+ClienteNombre('c')+'  as Nombre, c.telefono, c.sector, i.estatus as inst, i.idinstalacion as ni '+
         'from clientes c left join instalaciones i on i.idcliente =c.idcliente '+
         'where c.estatus = 1 '+
         'and to_days(ultfecps) < (to_days("'+datetostr(TPCNoSR.Date)+'")-6) and mod(to_days("'+datetostr(TPCNoSR.Date)+
         '") - (to_days(ultfecps)) ,7)=0  '+
         'and sector between '+cbosector1.Text+' and '+cbosector2.Text+' '+
         'order by ultfecps, ni desc ) as t having c = 0 ) as t', 1, sqlgeneral);

  {
  querys('CREATE TABLE temp_nosrec'+frmprincipal.idmaq+' select c.idcliente, c.ultfecps as fecha_pc, '+
         ''+ClienteNombre('c')+' as Nombre, c.telefono, c.sector, i.estatus as inst, i.idinstalacion as ni '+
         'from clientes c left join instalaciones i on i.idcliente =c.idcliente  '+
         'where c.estatus = 1 '+
         'and to_days(ultfecps) < (to_days("'+datetostr(TPCNoSR.Date)+'")-6) and mod(to_days("'+datetostr(TPCNoSR.Date)+
         '") - (to_days(ultfecps)) ,7)=0 order by ultfecps desc', 1, sqlgeneral);
                                                                                                                
  querys('select idcliente, max(ni) as ni, count(idcliente) as t from temp_nosrec'+frmprincipal.idmaq+' group by idcliente having t > 1 order by idcliente asc', 0, sqlgeneral);
  sqlgeneral.first;
  while not sqlgeneral.eof = true do
    begin
    if sqlgeneral.fieldbyname('ni').asstring <> '' then
      querys('Delete from temp_nosrec'+frmprincipal.idmaq+' where idcliente='+sqlgeneral.fieldbyname('idcliente').asstring+' and ni <> '+sqlgeneral.fieldbyname('ni').asstring, 1, dmreportes.sqlgeneral6);
    sqlgeneral.next;
    end;    }

  querys('select * from temp_nosrec'+frmprincipal.idmaq+' where inst <> 0 or inst is null group by idcliente order by idcliente asc', 0, dmreportes.sqlgeneral);

  end;

//   ultima señal
if rgpruebasem.ItemIndex = 1 then
  begin

 querys('DROP TABLE IF EXISTS temp_ultsen'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral);

 querys('CREATE TABLE temp_ultsen'+frmprincipal.idmaq+' SELECT clientes.idcliente, max(aid) as aid FROM clientes left join alarmas on (clientes.idcliente=alarmas.idcliente) '+
        'where clientes.estatus =1 and pruebasema=1 group by clientes.idcliente', 1, dmreportes.sqlgeneral2);

 querys('SELECT c.idcliente, '+ClienteNombre('c')+' as Nombre, '+
        'c.telefono, a.fecha_pc, a.hora_pc, a.tipo, a.zona, c.sector '+
        'FROM temp_ultsen'+frmprincipal.idmaq+' t left join alarmas a on (t.aid=a.aid) '+
        'left join clientes c on (t.idcliente=c.idcliente) '+
        'right join instalaciones i on (i.idcliente=c.idcliente) '+
        'where c.estatus =1 and a.fecha_pc < date_sub('+quotedstr(datetostr(TPCNoSR.Date))+
        ', interval 7 day) and i.estatus = "0"  and c.sector between '+cbosector1.Text+' and '+cbosector2.Text+' '+
        'group by c.idcliente order by c.sector, c.idcliente', 0, dmreportes.sqlgeneral);

  querys('DROP TABLE IF EXISTS temp_ultsen'+frmprincipal.idmaq,1,sqlgeneral);
end;
       LCtotal.Caption := inttostr(dmreportes.sqlgeneral.RecordCount);
end;


procedure Tfrmmoduloreportes.SenalesNoRec;
begin
  querys('select '+quotedstr(datetostr(TPCNoSR.date))+' as inicio, '+quotedstr(inttostr(dmreportes.sqlgeneral.RecordCount))+' as rcount', 0, dmreportes.sqlgeneral2);
  OperacionReporte('CentralSNRnoDet','',TipoImpresion, 1);
  querys('DROP TABLE IF EXISTS temp_nosrec'+frmprincipal.idmaq,1,sqlgeneral);
end;

procedure Tfrmmoduloreportes.TPCNoSRKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.OnClick(self);
end;

procedure Tfrmmoduloreportes.RBtodosClick(Sender: TObject);
begin
edbdesde.Text := '';
edbdesde.Enabled := false;
edbhasta.Text := '';
edbhasta.Enabled := false;
end;

procedure Tfrmmoduloreportes.RBrangoClick(Sender: TObject);
begin
edbdesde.Text := '';
edbdesde.Enabled := true;
edbhasta.Text := '';
edbhasta.Enabled := true;
end;

procedure Tfrmmoduloreportes.edbdesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if key = #13 then
  edbhasta.SetFocus;
end;

procedure Tfrmmoduloreportes.TabCentral2TabClick(Sender: TObject);
var i:integer;
begin
dmreportes.sqlgeneral.close;
dmreportes.sqlgeneral.SQL.Clear;
btngenerar.Enabled := false;
deshabilitaboton(TabCentral2,0,btnbuscar);
case TabCentral2.TabIndex of
     1: begin      //No Señales Recibidas
        GRGeneral.Parent := TabCentral2Nosenales;
        TPCNoSR.Date := FechaServidor;
        LCtotal.Caption := '';
        TPCNoSR.SetFocus;
        gbsectores.Parent := TabCentral2Nosenales;
        gbsectores.Left := 670;
        gbsectores.Top := 16;
        cargarsectores;
        end;

     2: begin  //Falsas Alarmas
        GRGeneral.Parent := TabCentral2FalsasAlarmas;
        CargaComboConItem('Select id, status from alarmas_conclusion', 'status', 'id', 'TODOS', cbtipoalarma);
        cbtipoalarma.ItemIndex := 0;
        PCentralFechas.Parent := TabCentral2FalsasAlarmas;

        TPCdesde.Date := strtodate(formatdatetime('yyyy"/"mm',date)+'/01');
        TPChasta.Date := FechaServidor;
        CBtipoalarma.SetFocus;
        Pcantidad.Parent:= TabCentral2FalsasAlarmas;
        ltotal.Parent := TabCentral2FalsasAlarmas;
        Rcount.Parent := TabCentral2FalsasAlarmas;
        Rcount.caption:='';
        end;

     3: begin  //Retardo Patrulleros
        GRGeneral.Parent := TabCentral2RetardoPatrulleros;
        CargaCombo2('select idusuario, nombre, codigo, idpuesto from usuarios where idpuesto = 24','codigo', 'codigo', CBpatrullero);
        CBpatrullero.Items.Insert(0, 'TODOS');
        CBpatrullero.Values.Insert(0, '0');
        CBpatrullero.ItemIndex := 0;

        PCentralFechas.Parent := TabCentral2RetardoPatrulleros;
        TPCdesde.Date := strtodate(formatdatetime('yyyy"/"mm',date)+'/01');
        TPChasta.Date := FechaServidor;
        CBpatrullero.SetFocus;
        end;

     4: begin     //Tiempo Patrulleros
        GRGeneral.Parent := TabCentral2TiempoPatrulleros;
        PCentralFechas.Parent := TabCentral2TiempoPatrulleros;
        TPCdesde.Date := strtodate(formatdatetime('yyyy"/"mm',date)+'/01');
        TPChasta.Date := FechaServidor;
        Pcantidad.Parent:= TabCentral2TiempoPatrulleros;



       if(RGMotivo.Items.Count = 0) then
       begin
         querys('select cs.nombre as nombre from TipoServicios as ts left join clasif_servicios as cs ON(cs.idserv=ts.idserv) where ts.nombre="MOTIVO RETARDO"  order by cs.idstatus', 0, sqlgeneral);
         sqlgeneral.first;
        for i:=0 to sqlgeneral.RecordCount-1 do
          begin
          RGMotivo.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
          if sqlgeneral.fieldbyname('nombre').AsString = 'OTRA ZONA' then
             RGMotivo.ItemChecked[i] := false
          else
             RGMotivo.ItemChecked[i] := true;
          sqlgeneral.next;
          end;
        RGMotivo.Items.Add('SIN MOTIVO');
        TPCdesde.SetFocus;
        end;
        TPCdesde.SetFocus;

       end;

     5: begin  //Emergencias por Turno
             linea.Parent:=TabCentral2EmergenciasPorTurno;
             linea.visible:=true;
             gbPeriodoMesA.Parent:= TabCentral2EmergenciasPorTurno;
             cboano.Text:=formatdatetime('yyyy',now);
             cbomeses.ItemIndex:=strtoint(formatdatetime('m',now))-1;
             cbomeses.setfocus;
             btnbuscar.enabled := true;
             GRGeneral.Parent := TabCentral2EmergenciasPorTurno;
             //btngenerar.enabled := true;

        end;

     6: begin //Emergencias por Tipo
        PCentralFechas.Parent := TabCentral2EmergenciasPorTipo;
        TPCdesde.Date := strtodate(formatdatetime('yyyy"/"mm',date)+'/01');
        TPChasta.Date := FechaServidor;
        GRGeneral.Parent := TabCentral2EmergenciasPorTipo;
        TPCdesde.SetFocus;
        end;

     7: begin  //Concentrado de Alarmas
        neanio.Text := inttostr(YearOf(FechaServidor));
        GRGeneral.Parent := TabCentral2Concentrado;
        cargacombo2('Select * from alarmas_conclusion','status', 'id', cbcriterios);
        cbcriterios.Items.Insert(0, 'TODOS');
        cbcriterios.Values.Insert(0, '0');
        cbcriterios.ItemIndex := 0;
        cbcriterios.SetFocus;
        end;

     8: begin  //Activaciones Diarias
        GRGeneral.Parent := TabCentral2ActivacionesDiarias;
        gbUnaFecha.Parent := TabCentral2ActivacionesDiarias;
        dUnaFecha.Date := FechaServidor;
        gbUnaFecha.Left := 16;
        gbUnaFecha.Top := 16;
        cargacombo2('Select * from alarmas_conclusion','status', 'id', cbmotivos);
        cbmotivos.Items.Insert(0, 'TODOS');
        cbmotivos.Values.Insert(0, '0');        
        cbmotivos.ItemIndex := 0;
        end;

     9: begin    //Emergencias Por Cliente
        GRGeneral.Parent := TabCentral2EmergenciasCliente;
        gbPeriodoMesA.Parent := TabCentral2EmergenciasCliente;
        edCcliente.Parent := TabCentral2EmergenciasCliente;
        edCcliente.Left := 300;
        edCcliente.Top := 60;
        edCcliente.visible:= true;
        end;

    10: begin //TRafico Resumen
        GRGeneral.Parent := TabCentral2TraficoResumen;
        gbRelCtaCte.Parent := TabCentral2TraficoResumen;
        Pcuenta.Parent := TabCentral2TraficoResumen;
        PCentralFechas.Parent := TabCentral2TraficoResumen;
        gbRelCtaCte.Left := 150;
        gbRelCtaCte.Top := 30;
        Pcuenta.Left := 150;
        Pcuenta.Top := 30;
        pcuenta.Enabled := true;
        PCentralFechas.Left := 650;
        PCentralFechas.Top := 30;
        gbRelCtaCte.Visible := false;
        end;

    11: begin //Motivo Retardo
        GRGeneral.Parent := TabCentral2MotivosRetardo;
        PCentralFechas.Parent := TabCentral2MotivosRetardo;
        PCentralFechas.Left := 650;
        PCentralFechas.Top := 30;
        tpcdesde.date := now;
        tpchasta.date := now;
        end;

    12: begin //Bono Patrulleros
         btnbuscar.Enabled := false;
         btngenerar.Enabled := true;
         tpcdesde.Date := FechaServidor;
         tpchasta.date := FechaServidor;
         PCentralFechas.Parent := tsbonos;
         PCentralFechas.Left := 5;
         PCentralFechas.Top := 5;
        end;

    13: begin //Boletin
        btnbuscar.Enabled := false;
        btngenerar.enabled := true;
        PCentralFechas.Parent := TSCentral2Boletin;
        PCentralFechas.Left := 25;
        PCentralFechas.Top := 15;
        tpcdesde.Date := EncodeDate(yearof(FechaServidor),monthof(FechaServidor)-2,20);
        tpchasta.date := EncodeDate(yearof(FechaServidor),monthof(FechaServidor)-1,20);
        //GRGeneral.Parent := TSCentral2Boletin;
        end;

    14: begin //Resumen de eventos
        btnbuscar.Enabled := false;
        btngenerar.enabled := true;
        PCentralFechas.Parent := TSCentral2EventosPos;
        PCentralFechas.left := 310;
        PCentralFechas.top := 15;
        tpcdesde.Date := EncodeDate(yearof(FechaServidor),monthof(FechaServidor)-2,20);
        tpchasta.date := EncodeDate(yearof(FechaServidor),monthof(FechaServidor)-1,20);
        gbano.Parent:= TSCentral2EventosPos;
        gbano.Left := 632;
        gbano.Top := 15;
        edano.text := inttostr(yearof(today));
        end;
    15: begin
        gbfechas.parent:= TabCentral2EnvioColonias;
        tpdesde.date := FechaServidor;
        tphasta.date := tpdesde.date;
        GRGeneral.Parent := TabCentral2EnvioColonias;
        ltotal.Parent := TabCentral2EnvioColonias;
        Rcount.Parent := TabCentral2EnvioColonias;
        Rcount.caption:='';
        end;

    16: begin //Clientes sin Actividad
        gbfechas.parent:= TabSinActividad;
        tpdesde.date := Today;
        tphasta.date := tpdesde.date;
        GRGeneral.Parent := TabSinActividad;
        ltotal.Parent := TabSinActividad;
        Rcount.Parent := TabSinActividad;
        Rcount.caption:='';
        gbsectores.Parent := TabSinActividad;
        gbsectores.Left := 670;
        gbsectores.Top := 16;
        cargarsectores;
        end;

    17: begin//Resumen Positivos
        btngenerar.Enabled := True;
        btnbuscar.Enabled := false;
        gbano.Parent:= TabCentral2ResumenPositivos;
        gbano.Left := 312;
        gbano.Top := 8;
        edano.text := inttostr(yearof(today));

        end;

    18: begin//Centraleros
        btnbuscar.Enabled := true;
        gbfechas.parent:= tsCentral2Centraleros;
        tpdesde.date := EncodeDate(yearof(today), monthof(today), 1);
        tphasta.date := Today;
        GRGeneral.Parent := tsCentral2Centraleros;
        ltotal.Parent := tsCentral2Centraleros;
        Rcount.Parent := tsCentral2Centraleros;
        Rcount.caption:='';
        end;
     end;
end;

procedure Tfrmmoduloreportes.FalsasAlarmas;
var tipo: string;
begin
tipo := '';
if CBtipoAlarma.Text <> 'TODOS' then
 tipo :='alarmas_conclusion.status="'+CBtipoAlarma.text+'" and ';

querys('DROP TABLE IF EXISTS  TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq,1,sqlgeneral);
querys('CREATE TABLE TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq+'  '+
       'select idcliente,cliente,"'+CBtipoAlarma.Text+'" as alarma,  max(fecha_pc) as fecha_pc,COUNT(conclusion) as condicion from ( '+
       'SELECT distinct sk_alarmas.idcliente,sk_alarmas.cliente,conclusion, sk_alarmas.fecha_pc, sk_alarmas.id FROM sk_alarmas '+
       'INNER JOIN alarmas_conclusion ON (alarmas_conclusion.id=sk_alarmas.conclusion) WHERE '+tipo+

       ' sk_alarmas.status=3 AND sk_alarmas.fecha_pc BETWEEN "'+datetostr(TPCdesde.Date)+'" AND "'+datetostr(TPChasta.Date)+'") as t '+
       'GROUP BY idcliente order by condicion desc',1,sqlgeneral);

querys('Create Index idcliente on TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq+' (idcliente) ',1,sqlgeneral);
querys('Create Index condicion on TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq+' (condicion) ',1,sqlgeneral);

querys('SELECT "'+CBtipoAlarma.text+'" as titulo, "'+datetostr(TPCdesde.Date)+'" as f1, "'+datetostr(TPChasta.Date)+
        '" as f2, tem.*, '+
        'max(servicios.sid) as servicio, max(servicios.fecha_creacion) '+
       'as fecha_servicio FROM TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq+' as tem left join servicios on '+
       '(servicios.idcliente=tem.idcliente) '+
       'WHERE tem.condicion > '+seALARM.text+' group by tem.idcliente',0,dmreportes.sqlgeneral);

end;

procedure Tfrmmoduloreportes.deshabilitaboton(pagina:TRzPageControl;indice:Integer;boton:TRzBitBtn);
begin
with boton do
    begin
    if pagina.PageForTab(indice).Showing = true then
       Enabled := false
    else
       Enabled := true;
    end;
end;

procedure Tfrmmoduloreportes.LlenaTipoAsig;
begin
with CBtipoAsig do
  begin
  clear;
  add('SELECCIONA ASIGNACION');
  add('RFC');
  add('APELLIDO PATERNO');
  add('APELLIDO MATERNO');
  add('CURP');
  add('NUMERO');
  add('CODIGO POSTAL');
  add('REFERENCIA');
  add('PASSWORD');
  add('GIRO');
  add('CATEGORIA');
  add('TIPO ALARMA');
  add('MOVIL');
  add('TELEFONO');
  add('EMAIL');
  add('COLONIA');
  add('CIUDAD');
  ItemIndex := 0;
  end;
end;

procedure Tfrmmoduloreportes.buscarSinasignacion;
var campo:string;
//, estatus
begin
  if CBtipoAsig.Text = 'SELECCIONA ASIGNACION' then
     begin
     application.MessageBox('Selecciona un Tipo de Asignacion', 'Aviso', MB_ICONINFORMATION);
     btngenerar.Enabled := false;
     exit;
     end;
  if CBtipoAsig.Text = 'RFC' then
     campo := 'rfc';
  if CBtipoAsig.Text = 'APELLIDO PATERNO' then
     campo := 'apaterno';
  if CBtipoAsig.Text = 'APELLIDO MATERNO' then
     campo := 'amaterno';
  if CBtipoAsig.Text = 'CURP' then
     campo := 'curp';
  if CBtipoAsig.Text = 'NUMERO' then
     campo := 'numero';
  if CBtipoAsig.Text = 'CODIGO POSTAL' then
     campo := 'cp';
  if CBtipoAsig.Text = 'REFERENCIA' then
     campo := 'refs';
  if CBtipoAsig.Text = 'PASSWORD' then
     campo := 'password';
  if CBtipoAsig.Text = 'GIRO' then
     campo := 'idgiro';
  if CBtipoAsig.Text = 'CATEGORIA' then
     campo := 'idcategoria';
  if CBtipoAsig.Text = 'TIPO ALARMA' then
     campo := 'alarm';
  if CBtipoAsig.Text = 'MOVIL' then
     campo := 'sector';
  if CBtipoAsig.Text = 'TELEFONO' then
     campo := 'telefono';
  if CBtipoAsig.Text = 'EMAIL' then
     campo := 'email';
  if CBtipoAsig.Text = 'COLONIA' then
     campo := 'idcol';
  if CBtipoAsig.Text = 'CIUDAD' then
     campo := 'idmnp';

  with dmreportes.sqlgeneral do
    begin
    SQL.Clear;
    SQL.Add('select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', ');
    SQL.Add('concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, ');
    SQL.Add('if(clientes.numero is NULL or clientes.numero='''', clientes.dir, concat(clientes.dir, '' '',clientes.numero,'' '',colonias.nombre)) as colonia, clientes.telefono, colonias.cp, ');
    SQL.Add('if(clientes.estatus = 1, ''ACTIVO'', if (clientes.estatus = 0, ''INACTIVO'', ''PROSPECTO'') ) as estatuscliente from clientes left join colonias on (clientes.idcol= colonias.idcol) ');
    SQL.Add('where (clientes.'+campo+' is NULL or clientes.'+campo+'='''')');
    IF RbstActivo.Checked=TRUE THEN
       SQL.Add('AND clientes.estatus=1');
    IF RbSTInactivo.Checked=TRUE THEN
       SQL.Add('AND clientes.estatus=0');
    SQL.Add(' order by idcliente');
    Open;
    end;
end;

procedure Tfrmmoduloreportes.SinAsignacion;
begin
  querys('select '+quotedstr(inttostr(dmreportes.sqlgeneral.RecordCount))+' as rcount, '+quotedstr('LISTADO SIN ASIGNACION EN '+CBtipoAsig.text)+' as titulo', 0, dmreportes.sqlgeneral2);
   OperacionReporte('ClientesSinAsignacion','',TipoImpresion, 1);
end;


procedure Tfrmmoduloreportes.CBtipoAsigKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  RBSTActivo.SetFocus;
end;

procedure Tfrmmoduloreportes.CBtipoAsigNotInList(Sender: TObject);
begin
if TabPrincipal.ActivePage = tabinv then
 begin
  cbtipoasig.Text := 'TODOS';
  exit;
 end;
 CBtipoAsig.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.buscarRetardoPatrullero;
begin

if CBpatrullero.Text = 'TODOS' then
  begin
  querys('SELECT codigo, tiempo_respuesta.codPatrullero,usuarios.nombre AS Patrullero, idsector as movil,tiempo_respuesta.tiempo, tiempo_respuesta.hora AS Salida, '+
         'tiempo_respuesta.hora_llegada as llegada, sk_alarmas.idcliente,sk_alarmas.cliente, sk_alarmas.fecha_pc, sk_alarmas.hora_pc, motivo_retardo.nombre as retardo '+
         'FROM tiempo_respuesta INNER JOIN sk_alarmas ON (tiempo_respuesta.aid =  sk_alarmas.id) LEFT JOIN motivo_retardo ON (motivo_retardo.idmotivo=tiempo_respuesta.idmotivo) left join usuarios '+
         'on(usuarios.codigo=tiempo_respuesta.codPatrullero) WHERE sk_alarmas.fecha_pc BETWEEN '+
         quotedstr(datetostr(TPCdesde.Date))+' AND '+quotedstr(datetostr(TPChasta.Date))+' order by  Patrullero', 0, dmreportes.sqlgeneral);
  end
else
  begin
  querys('SELECT codigo, tiempo_respuesta.codPatrullero,usuarios.nombre AS Patrullero, idsector as movil,tiempo_respuesta.tiempo, tiempo_respuesta.hora AS Salida, '+
         'tiempo_respuesta.hora_llegada as llegada, sk_alarmas.idcliente,sk_alarmas.cliente, sk_alarmas.fecha_pc,  sk_alarmas.hora_pc, motivo_retardo.nombre as retardo, '+
         'codPatrullero FROM tiempo_respuesta INNER JOIN sk_alarmas ON (tiempo_respuesta.aid =  sk_alarmas.id) LEFT JOIN motivo_retardo ON (motivo_retardo.idmotivo=tiempo_respuesta.idmotivo) left join usuarios '+
         'on(usuarios.codigo=tiempo_respuesta.codPatrullero) WHERE sk_alarmas.fecha_pc '+
         'BETWEEN '+quotedstr(datetostr(TPCdesde.Date))+' AND '+quotedstr(datetostr(TPChasta.Date))+' AND tiempo_respuesta.codPatrullero='+quotedstr(CBpatrullero.Text)+
         ' order by  Patrullero',0, dmreportes.sqlgeneral);
  end;
end;

procedure Tfrmmoduloreportes.RetardoPatrullero;
begin
  querys('select '+quotedstr(datetostr(TPCdesde.Date))+' as inicio, '+quotedstr(datetostr(TPChasta.Date))+' as termino, '+quotedstr(inttostr(dmreportes.sqlgeneral.RecordCount))+' as rcount,''Reporte de asistencias patrulleros'' as titulo ', 0, dmreportes.sqlgeneral2);
  OperacionReporte('CentralRetardoPatrulleros','',TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.buscarTiempoPatrulleros;
var
cadena, filtro, t:string;
i, ban: integer;
begin
  ban :=0;

  t :=vartostr(SEalarm.value);
  if t = '0' then
    t := '-1'; //para que agarre el tiempo 0

  filtro := '';
  for i:=0 to RGMotivo.Items.Count -2 do
  begin
    if RGMotivo.ItemChecked[i] = false then
      filtro := filtro + ' and cs.nombre <>'+quotedstr(RGMotivo.Items.Strings[i]);
  end;

  if filtro <> '' then
  begin
    filtro := '( ' + RightStr(filtro, length(filtro)-4) + ')';

    if RGMotivo.ItemChecked[RGMotivo.Items.Count - 1] = true then
      filtro := ' and ( ' + filtro + ' or cs.nombre is null) '
    else
      filtro := ' and ' + filtro
  end;

  cadena := 'SELECT CodPatrullero as codPatrullero, tr.nombre AS Patrullero, idsector as movil,tr.tiempo, tr.hora AS Salida, '+
          'tr.hora_llegada as llegada, sk.idcliente,sk.cliente, sk.fecha_pc, sk.hora_pc, cs.nombre as retardo '+
          'FROM tiempo_respuesta as tr left JOIN sk_alarmas as sk ON (tr.aid =  sk.id) '+
          'LEFT JOIN clasif_servicios as cs ON (cs.orden=tr.idmotivo and cs.idserv=3) '+
          'left join usuarios as u on(u.codigo=tr.codPatrullero) '+
          'WHERE sk.fecha_pc BETWEEN "'+datetostr(TPCdesde.Date)+'" AND "'+datetostr(TPChasta.Date)+'" '+
          'and tr.tiempo > '+t+' and u.idturno in(1,2) '+ filtro +
          '  UNION  '+
          'SELECT CodPatrullero as codPatrullero, tr.nombre AS Patrullero, idsector as movil,tr.tiempo, tr.hora AS Salida, '+
          'tr.hora_llegada as llegada, sk.idcliente,sk.cliente, sk.fecha_pc, sk.hora_pc, cs.nombre as retardo '+
          'FROM tiempo_respuesta as tr left JOIN sk_alarmas as sk ON (tr.aid =  sk.id) '+
          'LEFT JOIN clasif_servicios as cs ON (cs.orden=tr.idmotivo and cs.idserv=3) '+
          'left join usuarios as u on(u.codigo=tr.codPatrullero) '+
          'left join turnos t on t.idturno=u.idturno '+
          'where cast(concat(tr.fecha, " ", tr.hora) as datetime) between cast(concat("'+datetostr(TPCdesde.Date)+'", " ", t.HoraInicio) as datetime) '+
          'and cast(concat(adddate("'+datetostr(TPChasta.Date)+'", interval 1 day), " ", t.HoraFin) as datetime)'+
          'and tr.tiempo > '+t+' and u.idturno = 3 ' + filtro + ' order by  CodPatrullero, fecha_pc, hora_pc ';

  querys(cadena, 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.TiempoPatrulleros;
begin
  with dmreportes do
  begin
  querys('select "'+datetostr(TPCdesde.Date)+'" as inicio, "'+datetostr(TPChasta.Date)+'" as termino, '+
         '"'+inttostr(dmreportes.sqlgeneral.RecordCount)+'" as rcount, "Reporte Tiempo Patrulleros" as titulo', 0, dmreportes.sqlgeneral2);
 OperacionReporte('CentralRetardoPatrulleros','',TipoImpresion, 1);
  end;
end;

procedure Tfrmmoduloreportes.CBtipoAlarmaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (Tabcentral2falsasalarmas.Showing = true) then
  TPCdesde.SetFocus;
end;

procedure Tfrmmoduloreportes.SEalarmKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  btnbuscar.onclick(self);
end;

procedure Tfrmmoduloreportes.CBpatrulleroKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  TPCdesde.SetFocus;
end;

procedure Tfrmmoduloreportes.CBtipoAlarmaNotInList(Sender: TObject);
begin
  CBtipoAlarma.text := '';
  CBtipoAlarma.ItemIndex := -1;
end;

procedure Tfrmmoduloreportes.buscarEmergenciasPorTipo;
var  fecha1, fecha2:string;
{d,m,NombreTurno:string;
z: array of integer;
mes,anno,dia,result,ano,dia1,mes1:word;
min_resp,Tprom_diario,Tporciento:double;

i,X,turne,days,moviles,total_servicios,TotalMDias,NumMes,NumTurno,
M1A,M1R,M2A,M2R,M3A,M3R,M4A,M4R,M5A,M5R,distancia,otra_zona,trafico,numero,ubicacion,
clima,otra_activacion,sobre,falla_mec,otro,total_m,total_a,int_robo,robo,detenidos,asalto,
act_retardo,asistencias,act_pos_conf,act_pos,f_usuario,f_equipo,f_alarma,p_tencico,
p_usuario,p_instalador,total,total_unidades,prom_diario,porciento,f_alarma_cliente:integer;}

begin
 fecha1 := cboano.Text +'/'+inttostr(cbomeses.ItemIndex+1)+'/01';
fecha2 := cboano.Text +'/'+inttostr(cbomeses.ItemIndex+1)+'/'+inttostr(DaysInMonth(strtoint(cboano.Text), cbomeses.ItemIndex+1));

querys('select descripcion as nombre, tipo, sum(total) as Total, sum(ActPos) as ActPos, sum(ActAccidental) as ActAccidental, sum(FallaEquipo) as FallaEquipo, '+
       'sum(FalsaAlarma) as FalsaAlarma, sum(PruebaTecnico) as PruebaTecnico, sum(PruebaUsuario) as PruebaUsuario, '+
       'sum(PruebaInstalador) as PruebaInstalador, sum(ConcluidaSistema) as ConcluidaSistema, sum(FAAtCliente) as FAAtCliente, '+
       'sum(CirNoArm) as CirNoArm from ( '+
       'SELECT descripcion, tipo, 1 as total, conclusion as c, '+
       'if(conclusion=1, 1, 0) as ActPos, if(conclusion=2, 1, 0) as ActAccidental, if(conclusion=3, 1, 0) as FallaEquipo, '+
       'if(conclusion=4, 1, 0) as FalsaAlarma, if(conclusion=5, 1, 0) as PruebaTecnico, if(conclusion=6, 1, 0) as PruebaUsuario, '+
       'if(conclusion=7, 1, 0) as PruebaInstalador, if(conclusion=8, 1, 0) as ConcluidaSistema, if(conclusion=9, 1, 0) as FAAtCliente, '+
       'if(conclusion=10, 1, 0) as CirNoArm from sk_alarmas as sk '+
       'left join alarmas_conclusion as con on sk.conclusion=con.id left join turnos t  on sk.hora_pc BETWEEN t.HoraInicio and t.HoraFin '+
       'where sk.fecha_pc BETWEEN "'+fecha1+'" and "'+fecha2+'" and t.idturno < 3 '+
       'UNION ALL '+
       'SELECT descripcion, tipo, 1 as total, conclusion as c, if(conclusion=1, 1, 0) as ActPos, if(conclusion=2, 1, 0) as ActAccidental, '+
       'if(conclusion=3, 1, 0) as FallaEquipo, if(conclusion=4, 1, 0) as FalsaAlarma, if(conclusion=5, 1, 0) as PruebaTecnico, '+
       'if(conclusion=6, 1, 0) as PruebaUsuario, if(conclusion=7, 1, 0) as PruebaInstalador, if(conclusion=8, 1, 0) as ConcluidaSistema, '+
       'if(conclusion=9, 1, 0) as FAAtCliente, if(conclusion=10, 1, 0) as CirNoArm from sk_alarmas as sk '+
       'left join alarmas_conclusion as con on sk.conclusion=con.id '+
       'left join turnos t on ((sk.hora_pc >= t.HoraInicio and sk.hora_pc <="23:59:59") or (sk.hora_pc <= t.HoraFin)) and t.idturno=3  '+
       'where sk.fecha_pc BETWEEN "'+fecha1+'" and "'+fecha2+'" and t.idturno = 3 '+
       'and not (sk.fecha_pc = "'+fecha1+'" and if(sk.hora_pc <= t.HoraFin, day(ADDDATE(sk.fecha_pc, INTERVAL -1 DAY)), day(sk.fecha_pc))  >25) '+
       'and not (sk.fecha_pc > "'+fecha2+'" and sk.hora_pc >  t.HoraFin ) '+
       ') as t group by tipo order by tipo', 0, dmreportes.sqlgeneral);

{
NumTurno:=0;
NumMes := cbomeses.itemindex +1;
TotalMDias := DiasMes(inttostr(NumMes));
TotalMDias := 30;
fecha1 := cboano.Text +'/'+inttostr(cbomeses.ItemIndex+1)+'/01';

distancia:=0; otra_zona:=0; trafico:=0; numero:=0; ubicacion:=0; clima:=0; otra_activacion:=0; sobre:=0; falla_mec:=0; otro:=0; total_m:=0; total_a:=0;
days:=1;
//turne:=0;
//i:=1;
min_resp:=0;
act_retardo:=0;
asistencias:=0;
act_pos:=0;
//act_pos_conf:=0;
f_usuario:=0;
f_equipo:=0;
f_alarma:=0;
p_tencico:=0;
p_usuario:=0;
p_instalador:=0;
total:=0;
M1A:=0;
M1R:=0;
M2A:=0;
M2R:=0;
M3A:=0;
M3R:=0;
M4A:=0;
M4R:=0;
M5A:=0;
M5R:=0;
total_unidades:=0; int_robo:=0; robo:=0; detenidos:=0;
asalto:=0; prom_diario:=0; porciento:=0; //total_servicios:=0;

     days :=100;
with dmreportes do
 begin
                 X:=TotalMDias ; //total de dias

                 X:=0;
                 turne:=0; //turn se iguala a 0

                 IF(X>0)THEN
                 begin
                 REPEAT  //repeat de day

                 fecha1 := cboano.Text +'/'+inttostr(NumMes)+'/'+inttostr(days);
                 //fecha1:=canio.Text+'/'+inttostr(cfech.ItemIndex)+'/'+inttostr(days);
                 DecodeDate(strtodate(fecha1),ano,mes,dia);
                 if(mes<10)then
                 begin m:='0'+IntToStr(mes);end else begin m:=IntToStr(mes);end;
                 if(dia<10)then
                 begin d:='0'+IntToStr(dia);end else begin d:=inttostr(dia);end;
                 fecha1:=inttostr(ano)+'/'+inttostr(NumMes)+'/'+d;
                 if(NumMes<12)then
                 begin
                 if(NumMes<12)then
                 begin
                 if(strtoint(d)<TotalMDias)then
                  fecha2:=inttostr(ano)+'/'+inttostr(NumMes)+'/'+inttostr(strtoint(d)+1)
                 else
                    if mes = mes1 then
                       fecha2:=inttostr(ano)+'/'+inttostr(NumMes+1)+'/'+'01'
                    else
                       fecha2:=inttostr(ano)+'/'+inttostr(NumMes+1)+'/'+'01';//fecha1;
                 end; //fin cfech.itemindex<12
                 end;

                 if(NumMes=12)then
                 begin
                     if (strtoint(d)=31) then
                         fecha2:=inttostr(ano+1)+'/'+'01'+'/'+'01'
                     else
                     fecha2:=inttostr(ano)+'/'+inttostr(NumMes)+'/'+inttostr(strtoint(d)+1); //end

                end; //fin cfech.itemindex=12


                  REPEAT //repeat de turne
                  sqlgeneral.close;
                  sqlgeneral.SQL.Clear;
                  sqlgeneral.SQL.Add('select aid,fecha,hora,movil,tiempo,hora_llegada,idmotivo,idsector ');
                  sqlgeneral.SQL.Add('from tiempo_respuesta left join usuarios as u on(u.codigo=tiempo_respuesta.CodPatrullero) ');
                  sqlgeneral.SQL.Add('where ');
                  if(turne=0)then//turno diurno
                  begin sqlgeneral.SQL.Add('fecha='+''''+fecha1+'''and hora between "6:00:00" AND "14:00:00"'); end;
                  if(turne=1)then//turno vespertino
                  begin sqlgeneral.SQL.Add(' fecha='+''''+fecha1+'''and hora between "14:00:01" AND "22:00:00"'); end;
                  if(turne=2)then//turno nocturno
                  begin sqlgeneral.SQL.Add(' fecha='+''''+fecha1+'''and hora>"22:00:00" or');
                        sqlgeneral.SQL.Add(' fecha ='+''''+FECHA2+'''and hora<"06:00:00"');
                        end;
                  sqlgeneral.Open;

                  sqlgeneral.First;
                  //con este ciclo saca las asistencias por movil
                  while sqlgeneral.Eof=false do
                  begin

                  if(sqlgeneral.FieldByName('aid').AsInteger>0) and (sqlgeneral.FieldByName('hora_llegada').AsString<>'') and (sqlgeneral.FieldByName('tiempo').AsFloat>0)  then
                  begin
                  if sqlgeneral.FieldByName('movil').AsString <> '' then
                  moviles:=strtoint(sqlgeneral.FieldByName('movil').AsString[7])
                  else
                  moviles:=sqlgeneral.FieldByName('idsector').asinteger;
                  min_resp:=min_resp+sqlgeneral.fieldbyname('tiempo').asfloat;
                  case moviles of
                  1: begin
                  m1a:=m1a+1;
                  inc(asistencias);
                  if sqlgeneral.FieldByName('tiempo').AsFloat > 6.0 then

                             begin m1r:=m1r+1; act_retardo:=act_retardo+1; end;
                     end;
                  2: begin
                  m2a:=m2a+1;
                  inc(asistencias);
                  if sqlgeneral.FieldByName('tiempo').AsFloat > 6.0 then

                             begin m2r:=m2r+1;  act_retardo:=act_retardo+1;end;
                     end;

                  3: begin
                  m3a:=m3a+1;
                  inc(asistencias);
                  if sqlgeneral.FieldByName('tiempo').AsFloat > 6.0 then

                             else begin m3r:=m3r+1;  act_retardo:=act_retardo+1;end;
                     end;

                  4: begin
                  m4a:=m4a+1;
                  inc(asistencias);
                  if sqlgeneral.FieldByName('tiempo').AsFloat > 6.0 then

                             begin m4r:=m4r+1;  act_retardo:=act_retardo+1;end;

                  //OTRO MOVIL EL 5
                     end;
                  5: begin
                  m5a:=m5a+1;
                  inc(asistencias);
                  if sqlgeneral.FieldByName('tiempo').AsFloat > 6.0 then

                             begin m5r:=m5r+1;  act_retardo:=act_retardo+1;end;
                      end;
                  end; // end del case moviles
                   //sacar las sumas de las causas de los retardos
                  case sqlgeneral.FieldByName('idmotivo').AsInteger  of

                     1:begin inc(distancia); inc(total_m); end;
                     2:begin inc(otra_zona); inc(total_m); end;
                     3:begin inc(trafico); inc(total_m); end;
                     4:begin inc(numero);  inc(total_m); end;
                     5:begin inc(ubicacion);  inc(total_m); end;
                     6:begin inc(clima);  inc(total_m); end;
                     7:begin inc(otra_activacion); inc(total_m); end;
                     8:begin inc(sobre); inc(total_m); end;
                     9:begin inc(falla_mec); inc(total_m); end;
                     10:begin inc(otro);  inc(total_m); end;
                  end; //end del case motivos
                  end; // end de if not null

                  sqlgeneral.Next;
                  end; // end del while
                  ////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////
                   ////// consulta para saber cuantos tick se hicieron en determinado dia de la tabla  servicios

                  sqlgeneral.Close;
                  sqlgeneral.SQL.Clear;
                  sqlgeneral.SQL.Add('select count(sid) as total_servicios,fecha_creacion,hora_creacion from servicios where');
                  if(turne=0)then
                  begin sqlgeneral.SQL.Add('fecha_creacion='+''''+fecha1+'''and hora_creacion between "6:00:00" AND "14:00:00"'); end;
                  if(turne=1)then
                  begin sqlgeneral.SQL.Add('fecha_creacion='+''''+fecha1+'''and hora_creacion between "14:00:01" AND "22:00:00"'); end;
                  if(turne=2)then
                  begin sqlgeneral.SQL.Add('fecha_creacion='+''''+fecha1+'''and hora_creacion>"22:00:00" or');
                        sqlgeneral.SQL.Add('fecha_creacion='+''''+FECHA2+'''and hora_creacion<"06:00:00"');
                        end;
                  sqlgeneral.SQL.Add('group by fecha_creacion');
                  sqlgeneral.Open;
                  if sqlgeneral.fieldbyname('total_servicios').Asstring <> '' then
                      total_servicios:=sqlgeneral.fieldbyname('total_servicios').AsInteger
                  else
                      total_servicios:=0;

                  ////////////////////////////////////////////////////////////////////////////////////
                  //busqueda de datos intento robo,detenidos

                       sqlgeneral.CLOSE;
                        sqlgeneral.SQL.Clear;
                         sqlgeneral.Sql.Add('Select count(ap.activacion) as total,sum(ap.detenidos)as sumdetenidos,fecha,hora_pc');
                          sqlgeneral.sql.add('From ActivPos as ap left join sk_alarmas as sk On(sk.id=ap.idsk )');
                           sqlgeneral.SQL.Add('WHERE ' );
                            if(turne=0)then
                             begin sqlgeneral.SQL.Add(' fecha ='+''''+FECHA1+'''AND hora_pc BETWEEN "6:00:00" AND "14:00:00"  AND ap.activacion=0'); end;
                                if(turne=1)then
                                   begin sqlgeneral.SQL.Add(' fecha ='+''''+FECHA1+'''AND hora_pc BETWEEN "14:00:01" AND "22:00:00"  AND ap.activacion=0'); end;
                                      if(turne=2)then
                                         begin sqlgeneral.SQL.Add(' (fecha ='+''''+FECHA1+''' and hora_pc >"22:00:00" AND ap.activacion=0) or ');
                                               sqlgeneral.SQL.Add(' (fecha ='+''''+FECHA2+''' and hora_pc < "06:00:00" AND ap.activacion=0)');
                               end;
                                sqlgeneral.SQL.Add(' group by fecha');

                                 sqlgeneral.Open;

                  if sqlgeneral.RecordCount>0 then begin

                  int_robo:=sqlgeneral.FieldByName('total').AsInteger;
                  detenidos:=detenidos+sqlgeneral.FieldByName('sumdetenidos').AsInteger;
                  end;

                 //busqueda de datos robo,detenidos
                      sqlgeneral.CLOSE;
                        sqlgeneral.SQL.Clear;
                         sqlgeneral.Sql.Add('Select count(ap.activacion) as total,sum(ap.detenidos)as sumdetenidos,fecha,hora_pc ');
                          sqlgeneral.sql.add('From ActivPos as ap left join sk_alarmas as sk On(sk.id=ap.idsk )');
                           sqlgeneral.SQL.Add('WHERE' );
                            if(turne=0)then
                             begin sqlgeneral.SQL.Add('fecha ='+''''+FECHA1+'''AND hora_pc BETWEEN "6:00:00" AND "14:00:00" AND ap.activacion=1'); end;
                                if(turne=1)then
                                     begin sqlgeneral.SQL.Add('fecha ='+''''+FECHA1+'''AND hora_pc BETWEEN "14:00:01" AND "22:00:00" AND ap.activacion=1'); end;
                                         if(turne=2)then
                                               begin sqlgeneral.SQL.Add('(fecha ='+''''+FECHA1+''' and hora_pc >"22:00:00" AND ap.activacion=1) or');
                                                     sqlgeneral.SQL.Add('(fecha ='+''''+FECHA2+''' and hora_pc < "06:00:00" AND ap.activacion=1)');
                               end;
                               sqlgeneral.SQL.Add(' group by fecha_pc');
                                 sqlgeneral.Open;

                  if sqlgeneral.RecordCount>0 then begin

                  robo:=sqlgeneral.FieldByName('total').AsInteger;
                  detenidos:=detenidos+sqlgeneral.FieldByName('sumdetenidos').AsInteger;
                  end;

                  ////busqueda de datos robo,detenidos
                      sqlgeneral.CLOSE;
                        sqlgeneral.SQL.Clear;
                        sqlgeneral.Sql.Add('Select count(ap.activacion) as total,sum(ap.detenidos)as sumdetenidos,fecha,hora_pc ');
                          sqlgeneral.sql.add('From ActivPos as ap left join sk_alarmas as sk On(sk.id=ap.idsk )');
                           sqlgeneral.SQL.Add('WHERE' );
                            if(turne=0)then
                             begin sqlgeneral.SQL.Add('fecha ='+''''+FECHA1+'''AND hora_pc BETWEEN "6:00:00" AND "14:00:00" AND ap.activacion=2'); end;
                                if(turne=1)then
                                   begin sqlgeneral.SQL.Add('fecha ='+''''+FECHA1+'''AND hora_pc BETWEEN "14:00:01" AND "22:00:00" AND ap.activacion=2'); end;
                                    if(turne=2)then
                                       begin sqlgeneral.SQL.Add('(fecha ='+''''+FECHA1+''' and hora_pc >"22:00:00" AND ap.activacion=2) or');
                                             sqlgeneral.SQL.Add('(fecha ='+''''+FECHA2+''' and hora_pc < "06:00:00" AND ap.activacion=2)');
                               end;
                               sqlgeneral.SQL.Add(' group by fecha ');
                                 sqlgeneral.Open;

                  if sqlgeneral.RecordCount>0 then begin

                  asalto:=sqlgeneral.FieldByName('total').AsInteger;
                  detenidos:=detenidos+sqlgeneral.FieldByName('sumdetenidos').AsInteger;
                  end;

                  ///////////////////////////////////////////////////////////////////////////////////////////

                  for I:= 1 to 9 do
                   begin
                    //query que trae las estadisticas principales como falso_usuario, falsa_alarma,.....
                       sqlgeneral.CLOSE;
                        sqlgeneral.SQL.Clear;
                         sqlgeneral.Sql.Add('Select fecha_pc,conclusion,count(tipo)as total');
                          sqlgeneral.sql.add('From sk_alarmas');
                           sqlgeneral.SQL.Add('WHERE ' );
                            if(turne=0)then
                             begin sqlgeneral.SQL.Add('conclusion='+''''+inttostr(i)+''' and fecha_pc ='+''''+FECHA1+'''AND status>2 AND hora_pc BETWEEN "6:00:00" AND "14:00:00"'); end;
                             if(turne=1)then
                              begin sqlgeneral.SQL.Add('conclusion='+''''+inttostr(i)+''' and fecha_pc ='+''''+FECHA1+'''AND status>2 AND hora_pc BETWEEN "14:00:01" AND "22:00:00"'); end;
                              if(turne=2)then
                               begin sqlgeneral.SQL.Add('fecha_pc ='+''''+FECHA1+''' and hora_pc >"22:00:00" and conclusion='+''''+inttostr(i)+''' AND status>2  or');
                                     sqlgeneral.SQL.Add('fecha_pc ='+''''+FECHA2+''' and hora_pc < "06:00:00" and conclusion='+''''+inttostr(i)+''' AND status>2');
                               end;
                                 sqlgeneral.sql.add('group by conclusion');
                                  sqlgeneral.Open;

                  if sqlgeneral.RecordCount > 0 then begin

                  if(i=1)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  act_pos:=sqlgeneral.FIELDBYNAME('total').AsInteger; total_a:=act_pos + total_a; //asistencias:=asistencias+act_pos;
                  end else begin act_pos:=0; end;
                  end;

                  if(i=2)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  f_usuario:=sqlgeneral.FIELDBYNAME('total').AsInteger; inc(total); total_a:=f_usuario + total_a;
                  end else begin f_usuario:=0; end;
                  end;

                  if(i=3)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  f_equipo:=sqlgeneral.FIELDBYNAME('total').AsInteger;inc(total);  total_a:=f_equipo + total_a;
                  end else begin f_equipo:=0; end;
                  end;

                  if(i=4)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  f_alarma:=sqlgeneral.FIELDBYNAME('total').AsInteger; total_a:=f_alarma + total_a; //asistencias:=asistencias+f_alarma;
                  end else begin f_alarma:=0; end;
                  end;

                  if(i=5)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  p_tencico:=sqlgeneral.FIELDBYNAME('total').AsInteger;  total_a:=p_tencico + total_a;
                  end else begin p_tencico:=0; end;
                  end;

                  if(i=6)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  p_usuario:=sqlgeneral.FIELDBYNAME('total').AsInteger; total_a:=p_usuario + total_a;
                  end else begin p_usuario:=0; end;
                  end;

                 if(i=7)then
                  begin
                  if(sqlgeneral.FieldByName('total').AsInteger>0)then
                  begin
                  p_instalador:=sqlgeneral.FIELDBYNAME('total').AsInteger; total_a:=p_instalador + total_a;
                  end else begin p_instalador:=0; end;
                  end;

                  if(i=9)then
                    begin
                    if(sqlgeneral.FieldByName('total').AsInteger>0)then
                      begin
                      act_pos_conf:=sqlgeneral.FIELDBYNAME('total').AsInteger;
                      total_a:=act_pos_conf + total_a;// asistencias:=asistencias+act_pos_conf;
                      end
                    else
                      begin
                      act_pos_conf:=0;
                      end;
                  end;
                  end;//if recordcount
         END; // fin de for

         if(turne=0)then
         begin NombreTurno:='DIU'; NumTurno :=1; end;
         if(turne=1)then
         begin NombreTurno:='VES'; NumTurno :=2;  end;
         if(turne=2)then
         begin NombreTurno:='NOC'; NumTurno :=3;  end;


         if(asistencias>0)and(min_resp>0) then     Tprom_diario := (min_resp/asistencias)
         else  Tprom_diario := 0;

         if (asistencias>0)and(act_retardo>0) then Tporciento := (round((act_retardo/asistencias)*100)/100)*100
         else Tporciento := 0;


         querys('insert into TotalAlarmas (NombreTurno,turno,dia,AP,FU,FE,FA,PT,PU,PI,Tact,fecha,asist,retardos,MinResp,PromDiario,porcento,M1A,M1R,M2A,M2R,M3A,M3R,M4A,M4R,M5A,M5R,DISTANCIA,OtraZona,TRAFICO,NUMERO,UBICACION,CLIMA,OtraAct,SOBRES,FallasMec,otros,total_m,'+
                ' tick,IntRobo,robo,det,asalto)' +
                'values ('+quotedstr(NombreTurno)+','+inttostr(NumTurno)+','+inttostr(days)+','+inttostr(act_pos)+','+inttostr(f_usuario)+','+inttostr(f_equipo)+','+inttostr(f_alarma)+','+inttostr(p_tencico)+','+inttostr(p_usuario)+','+inttostr(p_instalador)+','+inttostr(total_a)+','+quotedstr(fecha1)+','+inttostr(asistencias)+','+
                ' '+inttostr(act_retardo)+','+floattostr(min_resp)+','+floattostr(Tprom_diario)+','+floattostr(Tporciento)+','+inttostr(M1A)+','+inttostr(M1R)+','+inttostr(M2A)+','+inttostr(M2R)+','+inttostr(M3A)+','+inttostr(M3R)+', '+
                ''+inttostr(M4A)+','+inttostr(M4R)+','+inttostr(M5A)+','+inttostr(M5R)+','+inttostr(distancia)+','+inttostr(otra_zona)+','+inttostr(trafico)+','+inttostr(numero)+','+inttostr(ubicacion)+','+inttostr(clima)+','+inttostr(otra_activacion)+','+inttostr(sobre)+','+inttostr(falla_mec)+','+inttostr(otro)+', '+
                ''+inttostr(total_m)+','+inttostr(total_servicios)+','+inttostr(int_robo)+','+inttostr(robo)+','+inttostr(detenidos)+','+inttostr(asalto)+') ',1,sqlgeneral);

//inicializar varibles para el siguiente dia
int_robo:=0; robo:=0; detenidos:=0; total_unidades:=0; min_resp:=0; act_retardo:=0; asistencias:=0; act_pos:=0;
//act_pos_conf:=0;
f_usuario:=0;
f_equipo:=0; f_alarma:=0; p_tencico:=0; p_usuario:=0; p_instalador:=0; total:=0; asalto:=0;
M1A:=0; M1R:=0; M2A:=0; M2R:=0; M3A:=0; M3R:=0; M4A:=0; M4R:=0; M5A:=0; M5R:=0;
distancia:=0; otra_zona:=0; trafico:=0; numero:=0; ubicacion:=0; clima:=0; otra_activacion:=0; sobre:=0; falla_mec:=0; otro:=0; total_m:=0; total_a:=0;

         inc(turne);
         UNTIL turne=3; //until de turne
         turne:=0;
         inc(days);
         until days>TotalMDias ; //until  de day
        END;// end de x>0
end;


  querys('DROP TABLE IF EXISTS temphistoact'+frmprincipal.idmaq,1, sqlgeneral);

 querys('CREATE TABLE temphistoact'+frmprincipal.idmaq+' (Nombre varchar(30), Tipo varchar(2), ActPos integer(11) , ActAccidental integer(11) , FallaEquipo integer(11) , FalsaAlarma integer(11) ,'+
         ' PruebaTecnico integer(11) , PruebaUsuario integer(11) , PruebaInstalador integer(11) ,  ConcluidaSistema integer(11) , FAAtCliente integer(11) ,Total integer(11) )',1, sqlgeneral);
  querys('Select * from temphistoact'+frmprincipal.idmaq, 0, sqlgeneral);

  querys('select * from alarmas_conclusion',0 ,dmreportes.sqlgeneral2);

   SetLength(z, dmreportes.sqlgeneral2.RecordCount);

   // Se llena la tabla con la descripcion

    querys('SELECT descripcion, tipo from sk_alarmas as sk left join alarmas_conclusion as con on (sk.conclusion=con.id) '+
           'where fecha_pc between '+quotedstr(datetostr(TPCdesde.Date))+' and '+quotedstr(datetostr(TPChasta.Date))+
           'group by tipo order by tipo, descripcion ', 0, dmreportes.sqlgeneral3);

    dmreportes.sqlgeneral3.First;
    while not dmreportes.sqlgeneral3.Eof = true do
      begin
      sqlgeneral.open;
      sqlgeneral.Insert;
      sqlgeneral.FieldByName('Nombre').AsString := dmreportes.sqlgeneral3.Fieldbyname('descripcion').AsString;
      sqlgeneral.FieldByName('Tipo').AsString := dmreportes.sqlgeneral3.Fieldbyname('tipo').AsString;
      sqlgeneral.Post;
      dmreportes.sqlgeneral3.Next;
      end;

    For i := 1 to dmreportes.sqlgeneral2.RecordCount+1 do  //conclusion id
      begin
      querys('SELECT count(sk.id) as total, descripcion, tipo from sk_alarmas as sk left join alarmas_conclusion as con on (sk.conclusion=con.id) '+
            'where fecha_pc between '+quotedstr(datetostr(TPCdesde.Date))+' and '+quotedstr(datetostr(TPChasta.Date))+ 'and conclusion ='+quotedstr(inttostr(i))+
            'group by tipo order by tipo, descripcion ', 0, dmreportes.sqlgeneral3);
      sqlgeneral.Open;
      dmreportes.sqlgeneral3.First;
      while not dmreportes.sqlgeneral3.Eof = true do
        begin
        sqlgeneral.First;
        while not sqlgeneral.Eof = true do
          begin
          if (sqlgeneral.Fieldbyname('Nombre').AsString = dmreportes.sqlgeneral3.Fieldbyname('descripcion').AsString) and (sqlgeneral.Fieldbyname('Tipo').Asstring = dmreportes.sqlgeneral3.Fieldbyname('tipo').Asstring) then
            begin
            sqlgeneral.Edit;
            sqlgeneral.Fields[i+1].AsInteger := dmreportes.sqlgeneral3.Fieldbyname('total').AsInteger;
            sqlgeneral.Fieldbyname('Total').AsInteger := sqlgeneral.Fieldbyname('Total').AsInteger + dmreportes.sqlgeneral3.Fieldbyname('total').AsInteger;
            sqlgeneral.Post;
            end;
          sqlgeneral.Next;
          end;
        dmreportes.sqlgeneral3.Next;
        end;
      end;

    querys('Select  Nombre, Tipo,  ifnull(ActPos, 0) as ActPos, ifnull(ActAccidental, 0) as ActAccidental, ifnull(FallaEquipo, 0) as FallaEquipo, ifnull(FalsaAlarma, 0) as FalsaAlarma, ifnull(FAAtCliente, 0) as FAAtCliente,'+
           'ifnull(PruebaTecnico, 0) as PruebaTecnico, ifnull(PruebaUsuario, 0) as PruebaUsuario, ifnull(PruebaInstalador, 0) as PruebaInstalador, ifnull(ConcluidaSistema, 0) as ConcluidaSistema, '+
           'ifnull(Total, 0) as Total from temphistoact'+frmprincipal.idmaq,0, dmreportes.sqlgeneral);
           }
end;

procedure Tfrmmoduloreportes.buscarEmergenciasPorTurno;
var fecha1, fecha2:string;
begin
 fecha1 := cboano.Text +'/'+inttostr(cbomeses.ItemIndex+1)+'/01';
fecha2 := cboano.Text +'/'+inttostr(cbomeses.ItemIndex+1)+'/'+inttostr(DaysInMonth(strtoint(cboano.Text), cbomeses.ItemIndex+1));

querys('delete from TotalAlarmas where fecha between "'+fecha1+'" and "'+fecha2+'"', 1, sqlgeneral);
querys('Insert into TotalAlarmas (NombreTurno, turno, dia, AP, FU, FE, FA, PT, PU, PI, FC, Tact, '+
       'fecha, asist, retardos, MinResp, PromDiario, porcento, '+
       'M1A, M1R, M2A, M2R, M3A, M3R, M4A, M4R, M5A, M5R, M6A, M6R, M7A, M7R, M8A, M8R, M9A, M9R, M10A, M10R, '+
       'DISTANCIA, OtraZona, TRAFICO, NUMERO, UBICACION, CLIMA, OtraAct, SOBRES, FallasMec, otros, FueraPerim, OtroSector, '+
       'IntRobo,  Robo, Asalto, Fuego, Medica, Mercancia, det, total_m) '+

       'select NombreTurno, turno, dia, AP, FU, FE, FA, PT, PU, PI, FC, Tact, '+
       'fecha, asist, retardos, MinResp, round(MinResp/asist, 2) as PromDiario, round((retardos/asist)*100, 2) as porcento, '+
       'M1A, M1R, M2A, M2R, M3A, M3R, M4A, M4R, M5A, M5R, M6A, M6R, M7A, M7R, M8A, M8R, M9A, M9R, M10A, M10R, '+
       'DISTANCIA, OtraZona, TRAFICO, NUMERO, UBICACION, CLIMA, OtraAct, SOBRES, FallasMec, otros, FPerm, OtroSec, '+
       'IntRobo,  Robo, Asalto, Fuego, Medica, Mercancia, detenidos, retardos as total_m '+
       'from ( select NombreTurno, turno, dia, '+

       'sum(AP) as AP, sum(FU) as FU, sum(FE) as FE, sum(FA) as FA, sum(PT) as PT, '+
       'sum(PU) as PU, sum(PI) as PI, sum(FC) as FC, count(Tact) as Tact, '+
       'fecha, sum(asist) as asist, sum(retardos) as retardos, sum(MinResp) as MinResp, '+
       'sum(M1A) as M1A, sum(M2A) as M2A, sum(M3A) as M3A, sum(M4A) as M4A, sum(M5A) as M5A, '+
       'sum(M6A) as M6A, sum(M7A) as M7A, sum(M8A) as M8A, sum(M9A) as M9A, sum(M10A) as M10A, '+
       'sum(M1R) as M1R, sum(M2R) as M2R, sum(M3R) as M3R, sum(M4R) as M4R, sum(M5R) as M5R, '+
       'sum(M6R) as M6R, sum(M7R) as M7R, sum(M8R) as M8R, sum(M9R) as M9R, sum(M10R) as M10R, '+
       'sum(DISTANCIA) as DISTANCIA, sum(OtraZona) as OtraZona, sum(TRAFICO) as TRAFICO, sum(NUMERO) as NUMERO, '+
       'sum(UBICACION) as UBICACION, sum(CLIMA) as CLIMA, sum(OtraAct) as OtraAct, sum(SOBRES) as SOBRES, '+
       'sum(FallasMec) as FallasMec, sum(otros) as otros, sum(FPerm) as FPerm, sum(OtroSec) as OtroSec, '+
       'sum(IntRobo) as IntRobo, sum(Robo) as Robo, sum(Asalto) as Asalto, sum(Fuego) as Fuego, sum(Medica) as Medica, '+
       'sum(Mercancia) as Mercancia, sum(detenidos) as detenidos  from ( '+

       'Select sk.id, sk.fecha_pc as fecha, sk.hora_pc,  day(sk.fecha_pc) as dia, '+
       'ifnull(t.idturno, 3) as turno, ifnull(t.nombre, "NOCTURNO") as NombreTurno, '+
       'if(ac.sufijo = "AP", 1, 0) as AP, if(ac.sufijo = "FU", 1, 0) as FU, '+
       'if(ac.sufijo = "FE", 1, 0) as FE, if(ac.sufijo = "FA", 1, 0) as FA, '+
       'if(ac.sufijo = "PT", 1, 0) as PT, if(ac.sufijo = "PU", 1, 0) as PU, '+
       'if(ac.sufijo = "PI", 1, 0) as PI, if(ac.sufijo = "FC", 1, 0) as FC, '+
       '1 as Tact, if(tr.tiempo is not null, 1, 0) as asist, '+
       'if(ifnull(tr.tiempo, 0) > 6, 1, 0) as retardos, ifnull(tr.tiempo, 0) as MinResp, '+

       'if((tr.movil = 1 or(tr.movil is null and u.idsector = 1)) , 1, 0) as M1A, '+
       'if((tr.movil = 2 or(tr.movil is null and u.idsector = 2)) , 1, 0) as M2A, '+
       'if((tr.movil = 3 or(tr.movil is null and u.idsector = 3)) , 1, 0) as M3A, '+
       'if((tr.movil = 4 or(tr.movil is null and u.idsector = 4)) , 1, 0) as M4A, '+
       'if((tr.movil = 5 or(tr.movil is null and u.idsector = 5)) , 1, 0) as M5A, '+
       'if((tr.movil = 6 or(tr.movil is null and u.idsector = 6)) , 1, 0) as M6A, '+
       'if((tr.movil = 7 or(tr.movil is null and u.idsector = 7)) , 1, 0) as M7A, '+
       'if((tr.movil = 8 or(tr.movil is null and u.idsector = 8)) , 1, 0) as M8A, '+
       'if((tr.movil = 9 or(tr.movil is null and u.idsector = 9)) , 1, 0) as M9A, '+
       'if((tr.movil = 10 or(tr.movil is null and u.idsector = 10)) , 1, 0) as M10A, '+

       'if((tr.movil = 1 or(tr.movil is null and u.idsector = 1)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M1R, '+
       'if((tr.movil = 2 or(tr.movil is null and u.idsector = 2)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M2R, '+
       'if((tr.movil = 3 or(tr.movil is null and u.idsector = 3)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M3R, '+
       'if((tr.movil = 4 or(tr.movil is null and u.idsector = 4)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M4R, '+
       'if((tr.movil = 5 or(tr.movil is null and u.idsector = 5)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M5R, '+
       'if((tr.movil = 6 or(tr.movil is null and u.idsector = 6)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M6R, '+
       'if((tr.movil = 7 or(tr.movil is null and u.idsector = 7)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M7R, '+
       'if((tr.movil = 8 or(tr.movil is null and u.idsector = 8)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M8R, '+
       'if((tr.movil = 9 or(tr.movil is null and u.idsector = 9)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M9R, '+
       'if((tr.movil = 10 or(tr.movil is null and u.idsector = 10)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M10R, '+

       'if(tr.idmotivo =  1, 1, 0) as DISTANCIA, if(tr.idmotivo =  2, 1, 0) as OtraZona, '+
       'if(tr.idmotivo =  3, 1, 0) as TRAFICO, if(tr.idmotivo =  4, 1, 0) as NUMERO, '+
       'if(tr.idmotivo =  5, 1, 0) as UBICACION, if(tr.idmotivo =  6, 1, 0) as CLIMA, '+
       'if(tr.idmotivo =  7, 1, 0) as OtraAct, if(tr.idmotivo =  8, 1, 0) as SOBRES, '+
       'if(tr.idmotivo =  9, 1, 0) as FallasMec, if(tr.idmotivo =  10, 1, 0) as otros, '+
       'if(tr.idmotivo =  11, 1, 0) as FPerm, if(tr.idmotivo =  12, 1, 0) as OtroSec, '+

       'if(ap.activacion = 0, 1, 0) as IntRobo, if(ap.activacion = 1, 1, 0) as Robo, '+
       'if(ap.activacion = 2, 1, 0) as Asalto, if(ap.activacion = 3, 1, 0) as Fuego, '+
       'if(ap.activacion = 4, 1, 0) as Medica, if(ap.activacion = 5, 1, 0) as Mercancia, '+
       'ifnull(ap.detenidos, 0) as detenidos '+

       'from sk_alarmas sk left join turnos t  on sk.hora_pc BETWEEN t.HoraInicio and t.HoraFin '+
       'left join ActivPos ap on ap.idsk=sk.id left join alarmas_conclusion ac on ac.id=sk.conclusion '+
       'left join tiempo_respuesta tr on tr.aid=sk.id left join usuarios u on u.codigo=tr.CodPatrullero '+
       'where sk.fecha_pc BETWEEN "'+fecha1+'" and "'+fecha2+'" and sk.conclusion <> 8 '+
       'and t.idturno < 3 '+

       'UNION '+

       'Select sk.id, sk.fecha_pc as fecha, sk.hora_pc, if(sk.hora_pc <= t.HoraFin, '+
       'day(ADDDATE(sk.fecha_pc, INTERVAL -1 DAY)), day(sk.fecha_pc))  as dia, t.idturno as turno, t.nombre as NombreTurno, '+

       'if(ac.sufijo = "AP", 1, 0) as AP, if(ac.sufijo = "FU", 1, 0) as FU, '+
       'if(ac.sufijo = "FE", 1, 0) as FE, if(ac.sufijo = "FA", 1, 0) as FA, '+
       'if(ac.sufijo = "PT", 1, 0) as PT, if(ac.sufijo = "PU", 1, 0) as PU, '+
       'if(ac.sufijo = "PI", 1, 0) as PI, if(ac.sufijo = "FC", 1, 0) as FC, '+
       '1 as Tact, if(tr.tiempo is not null, 1, 0) as asist, '+
       'if(ifnull(tr.tiempo, 0) > 6, 1, 0) as retardos, ifnull(tr.tiempo, 0) as MinResp, '+

       'if((tr.movil = 1 or(tr.movil is null and u.idsector = 1)) , 1, 0) as M1A, '+
       'if((tr.movil = 2 or(tr.movil is null and u.idsector = 2)) , 1, 0) as M2A, '+
       'if((tr.movil = 3 or(tr.movil is null and u.idsector = 3)) , 1, 0) as M3A, '+
       'if((tr.movil = 4 or(tr.movil is null and u.idsector = 4)) , 1, 0) as M4A, '+
       'if((tr.movil = 5 or(tr.movil is null and u.idsector = 5)) , 1, 0) as M5A, '+
       'if((tr.movil = 6 or(tr.movil is null and u.idsector = 6)) , 1, 0) as M6A, '+
       'if((tr.movil = 7 or(tr.movil is null and u.idsector = 7)) , 1, 0) as M7A, '+
       'if((tr.movil = 8 or(tr.movil is null and u.idsector = 8)) , 1, 0) as M8A, '+
       'if((tr.movil = 9 or(tr.movil is null and u.idsector = 9)) , 1, 0) as M9A, '+
       'if((tr.movil = 10 or(tr.movil is null and u.idsector = 10)) , 1, 0) as M10A, '+

       'if((tr.movil = 1 or(tr.movil is null and u.idsector = 1)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M1R, '+
       'if((tr.movil = 2 or(tr.movil is null and u.idsector = 2)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M2R, '+
       'if((tr.movil = 3 or(tr.movil is null and u.idsector = 3)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M3R, '+
       'if((tr.movil = 4 or(tr.movil is null and u.idsector = 4)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M4R, '+
       'if((tr.movil = 5 or(tr.movil is null and u.idsector = 5)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M5R, '+
       'if((tr.movil = 6 or(tr.movil is null and u.idsector = 6)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M6R, '+
       'if((tr.movil = 7 or(tr.movil is null and u.idsector = 7)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M7R, '+
       'if((tr.movil = 8 or(tr.movil is null and u.idsector = 8)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M8R, '+
       'if((tr.movil = 9 or(tr.movil is null and u.idsector = 9)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M9R, '+
       'if((tr.movil = 10 or(tr.movil is null and u.idsector = 10)) and ifnull(tr.tiempo, 0) > 6, 1, 0) as M10R, '+

       'if(tr.idmotivo =  1, 1, 0) as DISTANCIA, if(tr.idmotivo =  2, 1, 0) as OtraZona, '+
       'if(tr.idmotivo =  3, 1, 0) as TRAFICO, if(tr.idmotivo =  4, 1, 0) as NUMERO, '+
       'if(tr.idmotivo =  5, 1, 0) as UBICACION, if(tr.idmotivo =  6, 1, 0) as CLIMA, '+
       'if(tr.idmotivo =  7, 1, 0) as OtraAct, if(tr.idmotivo =  8, 1, 0) as SOBRES, '+
       'if(tr.idmotivo =  9, 1, 0) as FallasMec, if(tr.idmotivo =  10, 1, 0) as otros, '+
       'if(tr.idmotivo =  11, 1, 0) as FPerm, if(tr.idmotivo =  12, 1, 0) as OtroSec, '+

       'if(ap.activacion = 0, 1, 0) as IntRobo, if(ap.activacion = 1, 1, 0) as Robo, '+
       'if(ap.activacion = 2, 1, 0) as Asalto, if(ap.activacion = 3, 1, 0) as Fuego, '+
       'if(ap.activacion = 4, 1, 0) as Medica, if(ap.activacion = 5, 1, 0) as Mercancia, '+
       'ifnull(ap.detenidos, 0) as detenidos '+

       'from sk_alarmas sk '+
       'left join turnos t on ((sk.hora_pc >= t.HoraInicio and sk.hora_pc <="23:59:59") or (sk.hora_pc <= t.HoraFin)) and t.idturno=3 '+
       'left join ActivPos ap on ap.idsk=sk.id left join alarmas_conclusion ac on ac.id=sk.conclusion '+
       'left join tiempo_respuesta tr on tr.aid=sk.id left join usuarios u on u.codigo=tr.CodPatrullero '+
       'where sk.fecha_pc BETWEEN "'+fecha1+'" and adddate("'+fecha2+'", interval 1 day) '+
       'and sk.conclusion <> 8 and t.idturno = 3 '+
       'and not (sk.fecha_pc = "'+fecha1+'" and if(sk.hora_pc <= t.HoraFin, day(ADDDATE(sk.fecha_pc, INTERVAL -1 DAY)), day(sk.fecha_pc))  > 25) '+
       'and not (sk.fecha_pc > "'+fecha2+'" and sk.hora_pc >  t.HoraFin ) '+
       'order by id asc  ) as t group by dia, turno ) as t ', 1, sqlgeneral);

 querys('select * from TotalAlarmas where month(fecha) = "'+inttostr(cbomeses.itemindex+1)+'" and year(fecha)="'+cboano.text+'" group by fecha, turno order by fecha, turno',0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.EmergenciasPorTipo;
begin
querys('Select '+quotedstr(datetostr(TPCdesde.Date))+' as inicio, '+quotedstr(datetostr(TPChasta.Date))+' as fin', 0, dmreportes.sqlgeneral2);
OperacionReporte('CentralEmergenciasPorTipo','',TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.EmergenciasPorTurno;
begin
 OperacionReporte('HistorialEmergenciasXTurno','',TipoImpresion, 1);
end;


procedure Tfrmmoduloreportes.buscarConcentradoAlarmas;
var //idconclusion,
cadena:string;
begin
cadena := '';
with dmreportes do
  begin

if cbcriterios.text = 'TODOS' then
  begin
  cadena :=' Select clientes.idcliente,if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
           'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, '+
           ' alarmas_conclusion.status, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, total from ConcentradoAlarmas left join alarmas_conclusion on (ConcentradoAlarmas.conclusion = alarmas_conclusion.id) '+
           ' inner join clientes on (ConcentradoAlarmas.idcliente = clientes.idcliente) where year='+quotedstr(neanio.text)+'  ';

   if cbotipobusconcentrado.Text = 'CUENTA' then
       cadena := cadena +'AND   ConcentradoAlarmas.idcliente='+quotedstr(edCnombre.Text)
   else
       cadena := cadena + ' HAVING Nombre like '+quotedstr('%'+edCnombre.Text+'%');

   querys(cadena,0,sqlgeneral);
   if sqlgeneral.fieldbyname('Nombre').asstring <> '' then
      btngenerar.enabled := true;  
  end
else
  begin
  cadena := 'Select clientes.idcliente,if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
            'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, '+
            'alarmas_conclusion.status, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, total from ConcentradoAlarmas left join alarmas_conclusion on (ConcentradoAlarmas.conclusion = alarmas_conclusion.id) '+
            'inner join clientes on (ConcentradoAlarmas.idcliente = clientes.idcliente) where year='+quotedstr(neanio.text)+' and  ConcentradoAlarmas.conclusion="'+cbcriterios.value+'"';

   if cbotipobusconcentrado.Text = 'CUENTA' then
       cadena := cadena +'AND ConcentradoAlarmas.idcliente='+quotedstr(edCnombre.Text)
   else
       cadena := cadena + ' HAVING Nombre like '+quotedstr('%'+edCnombre.Text+'%');

   querys(cadena,0,sqlgeneral);
   if sqlgeneral.fieldbyname('Nombre').asstring <> '' then
      btngenerar.enabled := true;

  end;

 end;//dmreportes.......
end;

procedure Tfrmmoduloreportes.datosclicentral;
begin
querys('Select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, telefono from clientes '+
       'where idcliente ='+quotedstr(edCcliente.text), 0, dmreportes.sqlgeneral3);

edCnombre.text := dmreportes.sqlgeneral3.fieldbyname('Nombre').AsString;
edCtelefono.Text := dmreportes.sqlgeneral3.fieldbyname('telefono').AsString;
end;

procedure Tfrmmoduloreportes.ConcentradoAlarmas;
var cadena:string;
begin
    cadena:='Select alarmas_conclusion.status, '+neanio.Text+' as year,'+
           ' sum(m1) , sum(m2), sum(m3), sum(m4), sum(m5), sum(m6), sum(m7), sum(m8), sum(m9), sum(m10), sum(m11), sum(m12),'+
           ' sum(m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12) as total '+
           ' from ConcentradoAlarmas left join alarmas_conclusion on (ConcentradoAlarmas.conclusion = alarmas_conclusion.id) '+
           ' inner join clientes on (ConcentradoAlarmas.idcliente = clientes.idcliente) '+
           ' where year='+neanio.Text;
    if cbotipobusconcentrado.Text = 'CUENTA' then
      cadena := cadena +' and clientes.idcliente='+quotedstr(edCnombre.Text)
    else
      cadena:=cadena+' and nombre like "%'+edCnombre.Text+'%" and rsocial like"%'+edCnombre.text+'%"';
    querys(cadena+' group by status having status is not null',0,dmreportes.sqlgeneral3);

       //                     ---** PATRULLEROS **---                      //

   querys('Drop table if exists tmpConPat'+frmprincipal.idmaq ,1, sqlgeneral);
   querys('Create table tmpConPat'+frmprincipal.idmaq+' (tipo varchar(15), a1 int(11) default 0, a2 int(11) default 0, a3 int(11) default 0, a4 int(11) default 0, a5 int(11) default 0, a6 int(11) '+
          'default 0, a7 int(11) default 0, a8 int(11) default 0, a9 int(11) default 0, a10 int(11) default 0, a11 int(11) default 0, a12 int(11) default 0 )' ,1, sqlgeneral);

   cadena := 'select '+ClienteNombre('clientes')+' as nombre, count(t.nombre) as asistencias, month( t.fecha) as mes from tiempo_respuesta as t left join alarmas as a on (t.aid = a.aid) left join clientes '+
             'on (a.idcliente=clientes.idcliente) where year( t.fecha)='+quotedstr(neanio.text);
   if cbotipobusconcentrado.Text = 'CUENTA' then
       cadena := cadena +' and a.idcliente='+quotedstr(edCnombre.Text)+' group by mes'
   else
       cadena := cadena + ' and '+ClienteNombre('clientes')+' like '+quotedstr('%'+edCnombre.Text+'%')+' group by mes ';
   querys(cadena, 0, sqlgeneral);

   querys('Insert into tmpConPat'+frmprincipal.idmaq+' set tipo = ''Asistencias'' ', 1, dmreportes.sqlgeneral8);
   sqlgeneral.First;
   while not sqlgeneral.eof = true do
    begin
    querys('Update tmpConPat'+frmprincipal.idmaq+' set a'+sqlgeneral.fieldbyname('mes').AsString+' = '+quotedstr(sqlgeneral.fieldbyname('asistencias').AsString), 1, dmreportes.sqlgeneral8);
    sqlgeneral.Next;
    end;
   querys('select * from tmpConPat'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral4);

   //   ---*** Concentrado Servicios   ***--//

   cadena := 'select '+ClienteNombre('clientes')+' as nombre, ConcentradoServicios.* from ConcentradoServicios left join clientes on (ConcentradoServicios.idcliente=clientes.idcliente) where year='+quotedstr(neanio.text);
      if cbotipobusconcentrado.Text = 'CUENTA' then
       cadena := cadena +' and ConcentradoServicios.idcliente='+quotedstr(edCnombre.Text)
      else
       cadena := cadena + ' HAVING nombre like '+quotedstr('%'+edCnombre.Text+'%');
   querys(cadena, 0, dmreportes.sqlgeneral2);
                                         
OperacionReporte('CentralConcentradoAlarmas','CentralConcentradoAlarmas',TipoImpresion,1);
querys('Drop table if exists tmpConPat'+frmprincipal.idmaq ,1, dmreportes.sqlgeneral8);
end;

procedure Tfrmmoduloreportes.edCclienteButtonClick(Sender: TObject);
begin
buscarcuenta;
end;

procedure Tfrmmoduloreportes.neanioKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key,true);
//edCcliente.SetFocus;
end;

procedure Tfrmmoduloreportes.CBcriteriosKeyPress(Sender: TObject;
  var Key: Char);
begin
neanio.SetFocus;
end;

procedure Tfrmmoduloreportes.edCclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  Case TabCentral2.TabIndex of
    7: begin
       if edccliente.Text <> '' then
          begin
          if edCnombre.text = '' then
            datosclicentral
          else
            btnbuscar.OnClick(self);
          end
        else
          edccliente.OnButtonClick(self);
        end;
    9: btnbuscar.OnClick(self);
   end;
  end;
end;

procedure Tfrmmoduloreportes.edCclienteChange(Sender: TObject);
begin
if edccliente.text = '' then
  begin
  dmreportes.sqlgeneral.SQL.Clear;
  edcnombre.Text := '';
  edctelefono.Text := '';
  end;
end;


procedure Tfrmmoduloreportes.ActivacionesDiarias;
var turno, cadena:string;
myYear, myMonth, myDay : word;
begin
DecodeDate(dunafecha.date, myYear, myMonth, myDay);

querys('DROP TABLE IF EXISTS tmpActDia'+frmprincipal.idmaq,1,sqlgeneral);
cadena := 'Create table tmpActDia'+frmprincipal.idmaq+' Select sk_alarmas.idcliente, sk_alarmas.id as alarma, fecha_pc, hora_pc,tiempo_respuesta.tiempo, descripcion, tipo, zona, alarmas_conclusion.status, comentarios, user, '+
          ' 0 as fa, 0 as aa , ''NO'' servicio from sk_alarmas join turnos '+
          'left join alarmas_conclusion on (alarmas_conclusion.id = sk_alarmas.conclusion) left join tiempo_respuesta on (tiempo_respuesta.aid = sk_alarmas.id ) ';

if rbnocturno.Checked = false then
  begin
  cadena := cadena + 'where fecha_pc =  '+quotedstr(datetostr(dunafecha.date));
  if cbmotivos.Text = 'TODOS' then
    cadena := cadena + ' and alarmas_conclusion.status <> ''CONCLUIDA SISTEMA''';

  if cbmotivos.Text <> 'TODOS' then
    cadena := cadena + ' and alarmas_conclusion.status ='+quotedstr(cbmotivos.Text);

  if rbHoras.Checked then
    cadena := cadena +' and hora_pc between "'+FormatDateTime('HH:mm',TPHdesde.Time)+'" and "'+FormatDateTime('HH:mm',TPHhasta.Time)+'"'
  else
    begin
    cadena := cadena +' and hora_pc between turnos.horainicio and turnos.horafin and turnos.idturno =';
    if rbdiurno.Checked then
      turno := '1';
    if rbvespertino.Checked then
      turno := '2';
      cadena := cadena + turno;
    end;
  end
else
  begin
  turno := '3';
  cadena := cadena + 'where ((fecha_pc= '+quotedstr(datetostr(dunafecha.date))+' and hora_pc > turnos.horainicio ) or (fecha_pc= adddate('+quotedstr(datetostr(dunafecha.date))+', interval 1 day) and  hora_pc < turnos.horafin)) '+
            'and turnos.idturno = 3';
  if cbmotivos.Text <> 'TODOS' then
    cadena := cadena + ' and alarmas_conclusion.status ='+quotedstr(cbmotivos.Text);
  end;

cadena := cadena + ' order by alarma';
querys(cadena, 1, sqlgeneral);
if mymonth <> 1 then
  querys('Select CA.idcliente, if(CA.conclusion =2,  (m'+inttostr(mymonth-1)+'+ m'+inttostr(mymonth)+'),''0'' ) as aa  from tmpActDia'+frmprincipal.idmaq+' as t left join ConcentradoAlarmas as CA  on CA.idcliente=t.idcliente where  CA.conclusion =2 group by idcliente order by idcliente', 0, sqlgeneral)
else
  begin
  querys('DROP TABLE IF EXISTS tmpActDia2'+frmprincipal.idmaq,1,sqlgeneral);
  querys('Create table tmpActDia2'+frmprincipal.idmaq+' Select CA.idcliente, if(CA.conclusion =2,  m12,''0'' ) as aa from tmpActDia'+frmprincipal.idmaq+' as t left join ConcentradoAlarmas as CA  on CA.idcliente=t.idcliente where  CA.conclusion =2 group by idcliente order by idcliente ', 1, sqlgeneral);
  querys('Select (t.aa+t2.aa) as aa, t2.idcliente from tmpActDia2'+frmprincipal.idmaq+' as t2 left join tmpActDia'+frmprincipal.idmaq+' as t  on (t.idcliente=t2.idcliente) where t.idcliente =t2.idcliente  group by idcliente order by idcliente', 0, sqlgeneral);
  sqlgeneral.first;
  while not sqlgeneral.Eof = true do
    begin
    querys('update tmpActDia'+frmprincipal.idmaq+' set aa = '+sqlgeneral.fieldbyname('aa').AsString+' where idcliente='+sqlgeneral.fieldbyname('idcliente').AsString, 1, dmreportes.sqlgeneral7);
    sqlgeneral.Next;
    end;
  end;

sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('Update tmpActDia'+frmprincipal.idmaq+' set aa ='+quotedstr(sqlgeneral.fieldbyname('aa').AsString)+' where idcliente ='+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString), 1, dmreportes.sqlgeneral2);
  sqlgeneral.Next;
  end;

if mymonth <> 1 then
  querys('Select CA.idcliente, if(CA.conclusion =4,  (m'+inttostr(mymonth-1)+'+ m'+inttostr(mymonth)+'),''0'' ) as fa  from tmpActDia'+frmprincipal.idmaq+' as t left join ConcentradoAlarmas as CA  on CA.idcliente=t.idcliente where  CA.conclusion =4 group by idcliente order by idcliente', 0, sqlgeneral)
else
  begin
  querys('DROP TABLE IF EXISTS tmpActDia2'+frmprincipal.idmaq,1,sqlgeneral);
  querys('Create table tmpActDia2'+frmprincipal.idmaq+' Select CA.idcliente, if(CA.conclusion =4,  m12,''0'' ) as fa from tmpActDia'+frmprincipal.idmaq+' as t left join ConcentradoAlarmas as CA  on CA.idcliente=t.idcliente where  CA.conclusion =4 group by idcliente order by idcliente ', 1, sqlgeneral);
  querys('Select (t.fa+t2.fa) as fa, t2.idcliente from tmpActDia2'+frmprincipal.idmaq+' as t2 left join tmpActDia'+frmprincipal.idmaq+' as t  on (t.idcliente=t2.idcliente) where t.idcliente =t2.idcliente  group by idcliente order by idcliente', 0, sqlgeneral);
  sqlgeneral.first;
  while not sqlgeneral.Eof = true do
    begin
    querys('update tmpActDia'+frmprincipal.idmaq+' set fa = '+sqlgeneral.fieldbyname('fa').AsString+' where idcliente='+sqlgeneral.fieldbyname('idcliente').AsString, 1, dmreportes.sqlgeneral7);
    sqlgeneral.Next;
    end;
  end;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('Update tmpActDia'+frmprincipal.idmaq+' set fa ='+quotedstr(sqlgeneral.fieldbyname('fa').AsString)+' where idcliente ='+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString), 1, dmreportes.sqlgeneral2);
  sqlgeneral.Next;
  end;

querys('select s.idcliente from servicios as s left join EstatusServicios as es ON (es.orden=s.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) inner join  clientes as c on c.idcliente = s.idcliente '+
       'where (s.status < 4  and ts.nombre=''ESTATUS SERVICIO'' ) or (s.fecha_creacion >='+quotedstr(datetostr(dunafecha.date))+') group by s.idcliente order by sid desc', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('Update tmpActDia'+frmprincipal.idmaq+' set servicio =''SI'' where idcliente ='+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString), 1, dmreportes.sqlgeneral2);
  sqlgeneral.Next;
  end;

if rbhoras.Checked = false then
  begin
  querys('select nombre, horainicio, horafin from turnos where turnos.idturno ='+quotedstr(turno),0, sqlgeneral);
  cadena := '"'+sqlgeneral.fieldbyname('nombre').asstring+'" as turno, "'+sqlgeneral.fieldbyname('horainicio').asstring+'" as horainicio, "'+sqlgeneral.fieldbyname('horafin').asstring+'" as horafin, "'+datetostr(dunafecha.date)+'" as fecha ';
  end
else
  cadena := '"RANGO DE FECHAS" as turno, "'+timetostr(TPHdesde.Time)+'" as horainicio, "'+timetostr(TPHhasta.Time)+'" as horafin, "'+datetostr(dunafecha.date)+'" as fecha ';

querys('DROP TABLE IF EXISTS tmpActDia2'+frmprincipal.idmaq,1,sqlgeneral);
querys('Select t.*, '+cadena+' from tmpActDia'+frmprincipal.idmaq+' as t order by alarma', 0, dmreportes.sqlgeneral);
querys('select status, count(alarma) as total from tmpActDia'+frmprincipal.idmaq+' group by status', 0, dmreportes.sqlgeneral2);

end;

procedure Tfrmmoduloreportes.GRViewDblClick(Sender: TObject);
var hija:Tfrmrepdetalle;
idalarm, cliente, usuario :string;
begin
 if TabCentral2.ActivePageIndex = 8 then
      begin
      querys('select nombre, idusuario, codigo from usuarios where codigo='+quotedstr(dmreportes.sqlgeneral.fieldbyname('user').asstring), 0, sqlgeneral);
      dmreportes.sqlgeneral.Active:=true;
      idalarm:=dmreportes.sqlgeneral.fieldbyname('alarma').asstring;
      cliente:=dmreportes.sqlgeneral.fieldbyname('idcliente').AsString;
      usuario:=sqlgeneral.fieldbyname('nombre').asstring;
      hija:=Tfrmrepdetalle.Create(self);
      hija.alarma(idalarm, cliente, usuario);
      hija.Height := 480;
      hija.Width := 632;
      hija.Show;
      end;
end;

procedure Tfrmmoduloreportes.rbDiurnoClick(Sender: TObject);
begin
  GrangoHoras.Enabled := false;
end;

procedure Tfrmmoduloreportes.rbVespertinoClick(Sender: TObject);
begin
  GrangoHoras.Enabled := false;
end;

procedure Tfrmmoduloreportes.rbNocturnoClick(Sender: TObject);
begin
  GrangoHoras.Enabled := false;
end;

procedure Tfrmmoduloreportes.rbhorasClick(Sender: TObject);
begin
  GrangoHoras.Enabled := true;
end;

procedure Tfrmmoduloreportes.buscarEmergenciasCliente;
var mes:string;
begin
mes:= 'm'+inttostr(cbomeses.ItemIndex+1);
querys('select alarmas_conclusion.status, ConcentradoAlarmas.'+mes+' as totalmes, ConcentradoAlarmas.total from ConcentradoAlarmas left join alarmas_conclusion on '+
       '(ConcentradoAlarmas.conclusion = alarmas_conclusion.id) where ConcentradoAlarmas.idcliente ='+quotedstr(edCcliente.Text)+' and year='+quotedstr(cboano.Text),0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.EmergenciasCliente;
begin
querys('select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, if(clientes.numero is NULL '+
       'or clientes.numero='''', clientes.dir, concat(clientes.dir, '' '',clientes.numero,'' '',colonias.nombre)) as colonia, clientes.telefono, colonias.cp from clientes left join colonias on '+
       '(clientes.idcol= colonias.idcol) where idcliente = '+quotedstr(edCcliente.text), 0, dmreportes.sqlgeneral2);
OperacionReporte('CentralEmergenciasCliente','',TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.buscarClienteProtocolos;
var
cadena, orden:string;
begin
cadena:= 'select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
         'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, if(clientes.numero is NULL '+
         'or clientes.numero='''', clientes.dir, concat(clientes.dir, '' '',clientes.numero,'' '',colonias.nombre)) as colonia, clientes.telefono, colonias.cp, alarm as Control, '+
         'if(clientes.estatus = 1, ''ACTIVO'', if (clientes.estatus = 0, ''INACTIVO'', ''PROSPECTO'')) as Estatus from clientes left join colonias on '+
         '(clientes.idcol= colonias.idcol) where idprotocolo ='+quotedstr(inttostr(RGProtocolos.ItemIndex + 1));

  IF RbstActivo.Checked=TRUE THEN
    cadena := cadena + ' AND clientes.estatus=1';
  IF RbSTInactivo.Checked=TRUE THEN
    cadena := cadena + ' AND clientes.estatus=0';

  if cbOrdCli.text = 'Nombre' then
    orden:= 'Nombre';
  if cbOrdCli.text = 'Cuenta' then
    orden:= 'idcliente';
  if cbOrdCli.text = 'CP y Cuenta' then
    orden:= 'colonias.cp, idcliente';
  if cbOrdCli.text = 'CP y Nombre' then
    orden:= 'colonias.cp, Nombre';
  if cbOrdCli.text = 'Estatus y Cuenta' then
    orden:= 'estatus, idcliente';
  if cbOrdCli.text = 'Estatus y Nombre' then
    orden:= 'estatus, Nombre';

  cadena := cadena + ' order by '+orden;

querys(cadena,0, dmreportes.sqlgeneral);

end;

procedure Tfrmmoduloreportes.ClienteProtocolos;
begin
querys('Select '+quotedstr(RGProtocolos.Items.Strings[RGProtocolos.ItemIndex])+' as protocolo', 0, dmreportes.sqlgeneral2);
OperacionReporte('ClientesProtocolos','',TipoImpresion, 1);
end;

procedure tfrmmoduloreportes.BonoPatrulleros;
var BonoP,BonoC:string;
begin
frmmensaje.Show;
frmmensaje.Update;
 //trae el bono de los patrulleros
 querys('select valor from configuraciones where concepto=''BonoPatrullero''',0,sqlgeneral);
 BonoP := sqlgeneral.fieldbyname('valor').AsString;
  //trae el bono de los patrulleros
 querys('select valor from configuraciones where concepto=''BonoCentralero''',0,sqlgeneral);
 BonoC := sqlgeneral.fieldbyname('valor').AsString;
 //Detalle de detenciones
 querys('Drop table if exists tmpbonopat'+frmprincipal.idmaq,1,dmreportes.sqlgeneral8);
 querys('create table tmpbonopat'+frmprincipal.idmaq+' SELECT concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.amaterno,''''),'' '',ifnull(usuarios.apaterno,'''')) as Centralero,c.idcliente,if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''), '' '',ifnull(c.amaterno,'''')'+
        ','' '',ifnull(c.apaterno,'''')),c.rsocial) as nombre,tiempo_respuesta.nombre as patrullero,ActivPos.idsk,ActivPos.fecha,ActivPos.detenidos,if(ActivPos.danos=1,''Si'',''No'') as Daños FROM '+
        ' ActivPos INNER JOIN sk_alarmas ON (ActivPos.idsk = sk_alarmas.id) inner join clientes as c on c.idcliente=sk_alarmas.idcliente INNER JOIN usuarios ON (sk_alarmas.user = usuarios.codigo) INNER JOIN tiempo_respuesta ON (ActivPos.idsk = '+
        ' tiempo_respuesta.aid) WHERE ActivPos.fecha BETWEEN '+quotedstr(datetostr(tpcdesde.date))+' AND '+quotedstr(datetostr(tpchasta.date))+' AND (detenidos > 0) group by sk_alarmas.id order by ActivPos.fecha',1,dmreportes.sqlgeneral8);
 querys('select * from tmpbonopat'+frmprincipal.idmaq,0,dmreportes.sqlgeneral);
 //detalle de comiciones de centraleros
 querys('SELECT distinct idsk,"Bono = Total de Asistencias x 100" as titulo, count(idsk) as c,count(idsk)*100 as valor, Centralero From tmpbonopat'+frmprincipal.idmaq+' group by Centralero order by valor',0,dmreportes.sqlgeneral2);

 //detalle de comiciones de patrulleros
 querys('SELECT "Bono = Total de Asistencias x 200" as titulo,count(idsk) as c,count(idsk)*200 as valor,patrullero From tmpbonopat'+frmprincipal.idmaq+' group by patrullero order by valor',0,dmreportes.sqlgeneral3);

frmmensaje.Close;
OperacionReporte('BonoPatrulleros','',TipoImpresion, 1);
querys('Drop table if exists tmpbonopat'+frmprincipal.idmaq,1,dmreportes.sqlgeneral8);
end;

procedure Tfrmmoduloreportes.Reportes;
begin
frmmensaje.Show;
frmmensaje.Update;
if btnbuscar.Enabled = true then
  begin
  if dmreportes.sqlgeneral.recordcount = 0 then
    begin
     btngenerar.Enabled := false;
     frmmensaje.Update;
     frmmensaje.Close;
     exit;
    end;
  end;

if  TabPrincipal.ActivePage = TabClientes then begin
case TabClientes2.TabIndex of
       1: EstadoCuenta;
       2: TarjetaCliente;
       3: EstadoCuentaXLotes;
       4: begin
          if RBSTDetallado.Checked=true then
            OperacionReporte('ClientesEstatusDet','',TipoImpresion, 1)
          else
            OperacionReporte('ClientesEstatusnoDet','',TipoImpresion, 1);
          end;
       5: OperacionReporte('ClientesBloqueados','',TipoImpresion, 1);
       6: OperacionReporte('RelacionCuentaCliente','',TipoImpresion, 1);
       7: begin
          if RBresumen.Checked then
            OperacionReporte('ClientesResumen','',TipoImpresion, 1)
          else
            begin
            //dmreportes.sqlgeneral.SQL.Text := sqlgeneral.SQL.Text;
            OperacionReporte('ClientesResumenTablas','',TipoImpresion, 1);
            end;
          end;
       8: OperacionReporte('ClientesPolizas','',TipoImpresion, 1);
       9: OperacionReporte('OpenCloseOxxo','',TipoImpresion, 1);
      10: SinAsignacion;
      11: ClienteProtocolos;
      12: OperacionReporte('ClientesCancelados','',TipoImpresion, 1);
      13: OperacionReporte('ClientesTravelers','',TipoImpresion, 1);
      14: operacionreporte('ClientesCambios', '', TipoImpresion, 1);
      15: ClientesNoUbicados(1);
      16: OperacionReporte('ClientesTipoEnvio', '', TipoImpresion, 1);
      17: ProtocolosDiferentes(1);     
      18: OperacionReporte('AnualidadAnterior', '', TipoImpresion, 1);
      19: OperacionReporte('GastosMayores', '', TipoImpresion, 1);

end;//case
frmmensaje.Update;
frmmensaje.Close;
exit;
end;//if


if  TabPrincipal.ActivePage = TabCob then begin
case TabCob2.TabIndex of
      1: CanceladosYMorosos(dfecha1.text, dfecha2.text, cbosector1.Text, cbosector2.Text, TipoImpresion, 0);
      2: SectoresVencidos;
      3: Antiguedadxlinea;
      4: Pagosxlinea;
      5: begin
         case rgperiodo.itemindex of
          0: Cobranza;
          1: AnualCobranzaSaldos;
          2: AnualCobranza;
          end;
         end;
      6: CargosAutomaticos;
      7: AbonosXCuenta;
      8: morososprimeravez;
      9: InstPendFact;
     10: SectoresXVencer;
     11: MovimientosCSI;
     12: ReporteMarcacionCobranza;
end;//case
frmmensaje.Update;
frmmensaje.Close;
exit;
end;//if

if TabPrincipal.ActivePage = TabInv then begin
case TabInv2.TabIndex of
      1: inventarioxfecha;
      2: if gbTipoBusqueda.ItemIndex = 0 then
           AjusteInventario(self,edbusqueda.Text,'',1)
         else
           AjusteInventario(self,'',edbusqueda.Text,1);
      3:compras;
end;
frmmensaje.Update;
frmmensaje.Close;
exit;
end;//if

if TabPrincipal.ActivePage = TabVent then begin
case TabVent2.TabIndex of
      1: DiarioVentas;
      2: CobrosCaja;
      3: VentasMensuales;
      4: FacturasCanceladas;
      5: begin
            if rgcomisionv.ItemIndex = 0 then
             begin
               querys('select idpuesto from usuarios where codigo = "'+edbuscarU.Text+'"',0,dmreportes.sqlgeneral);
               if dmreportes.sqlgeneral.FieldByName('idpuesto').AsInteger = 41 then
                  ComisionesVendedorCasa
               else
                  ComisionesVendedor;
             end
            else
               ComisionesVendedores;
         end;
      6: AnalisisVentas;
      7: VerifVentVend;
      8: NotasCredito;
      9: TendenciaVendedoresTot;
     10: CitasAsignadas;
     11: ErrorVentas;
     12: VentasDllsXOrigen;
     13: VentasFacturadas_Monitoreo;
     14: FacturasSinPago;
     15: begin
           if(ckbRsimple.Checked = true) then
              ReporteArticulosVendidosPorPeriodo(dfecha1.Text,dfecha2.Text,'CON',tipoimpresion)
           else
              ReporteArticulosVendidosPorPeriodo(dfecha1.Text,dfecha2.Text,'',tipoimpresion);

          end;
end;
frmmensaje.Update;
frmmensaje.Close;
exit;
end;

if TabPrincipal.ActivePage = TabInst then begin
case TabInst2.TabIndex of
           1: ComisionesInstalador;
           2: TendenciaTecnicos;
           //3:PedidosPendientes;
end;
frmmensaje.Update;
frmmensaje.Close;
exit;
end;

if  TabPrincipal.ActivePage = TabCentral then
  begin
  case TabCentral2.TabIndex of
    1: SenalesNoRec;
    2: begin                               
       OperacionReporte('CentralFalsasAlarmas','',TipoImpresion, 1); 
       querys('DROP TABLE IF EXISTS  TEMPALARMAS_CONCLUSION'+frmprincipal.idmaq,1,sqlgeneral);
       end;
    3: RetardoPatrullero;
    4: TiempoPatrulleros;
    5: EmergenciasPorTurno;
    6: EmergenciasPorTipo;
    7: ConcentradoAlarmas;
    8: OperacionReporte('CentralActivacionesDiarias','',TipoImpresion, 1);
    9: EmergenciasCliente;
   10: OperacionReporte('CentralTraficoResumen', '', TipoImpresion, 1);
   11: OperacionReporte('CentralMotivoRetardo', '', TipoImpresion, 1);
   12: BonoPatrulleros;
   13: Boletin;
   14: EventosPositivos(datetostr(TPCdesde.date),datetostr(TPChasta.date));
   15: begin
       if rgTrafCol.ItemIndex = 0 then
         OperacionReporte('EnvTrafCol', 'Trafico Enviado por Colonias', TipoImpresion, 1)
       else
         OperacionReporte('TrafNoEnv', 'Trafico no Enviado por Cuentas', TipoImpresion, 1);       
       end;
   16: OperacionReporte('CentralSinActivar', 'CentralSinActivar', TipoImpresion, 1);
   17: ResumenPositivos;
   18: begin
        case rgRepCentraleros.ItemIndex of      
        0: begin
           OperacionReporte('CentralerosPositivos', 'CentralerosPositivos', TipoImpresion, 1);
           dmreportes.sqlgeneral.Close;
           querys('Drop table if exists tmpcenttiempo'+frmprincipal.idmaq, 1, sqlgeneral);
           end;
        1: begin
           OperacionReporte('CentralerosTickets', 'CentralerosTickets', TipoImpresion, 1);
           dmreportes.sqlgeneral.Close;
           querys('Drop table if exists tmpTicketsCentraleros'+frmprincipal.idmaq, 1, sqlgeneral);
           end;
           
        2: OperacionReporte('CentralerosTicketsDet', 'CentralerosTicketsDet', TipoImpresion, 1);

        3: begin
           OperacionReporte('Central_fallaeq', 'Fallas de Equipo desde Central', TipoImpresion, 1);
           querys('Drop table if exists tmpMas2Tkt'+frmprincipal.idmaq, 1, sqlgeneral);
           end;

        4: OperacionReporte('ServiciosPatrulleroInd','',TipoImpresion,1);
        end;
       end;
    end;
  frmmensaje.Update;
  frmmensaje.Close;
  exit;
  end;

if TabPrincipal.ActivePage = TabServicios then begin
  case TabServicios2.TabIndex of
           1: Servicios;
           2: Tendenciatec;
           3: ServiciosRepetidos;
           4: begin
              OperacionReporte('ServiciosTicketsPendientes', '', TipoImpresion, 1);
              querys('Drop table if exists tmpTckPendTec'+frmprincipal.idmaq, 1, sqlgeneral);
              end;
           5: OperacionReporte('ServiciosPorAtender', 'ServiciosPorAtender', TipoImpresion, 1);
           6: OperacionReporte('ServiciosTiemposExtras', 'Tiempos Extras en Ordenes de Servicios', TipoImpresion, 1);
  end;
frmmensaje.Update;
frmmensaje.Close;
exit;
end;

if TabPrincipal.ActivePage = pcadmon then
 begin
  case pcadministracion.TabIndex of

   1: Travelers;
   2: OperacionReporte('GerenciaDesempeno', '', TipoImpresion, 1);
   3: begin
         case chbTipoReporte.ItemIndex of
            0: AuditoriaVentasMensuales(cbomeses.Text,cboano.Text,TipoImpresion);
            1: AuditoriaDiarioVentas(cbomeses.Text,cboano.Text,TipoImpresion);
            2: AuditoriaAnalisisVentas(cbomeses.Text,cboano.Text,inttostr(0),TipoImpresion);
            3: AuditoriaAnalisisVentas(cbomeses.Text,cboano.Text,inttostr(1),TipoImpresion);
            4: AuditoriaAnalisisVentas(cbomeses.Text,cboano.Text,inttostr(2),TipoImpresion);
            5: AuditoriaFacturasCanceladas(cbomeses.Text,cboano.Text,TipoImpresion);
            6: AuditoriaNotasCredito(cbomeses.Text+'-'+cboano.Text,TipoImpresion,'DETALLADO');
            7: AuditoriaNotasCredito(cbomeses.Text+'-'+cboano.Text,TipoImpresion,'SIMPLE');
            8: AuditoriaPagosXLinea(cbomeses.Text+'-'+cboano.Text,TipoImpresion,);
            9: AuditoriaAntiguedadSaldos(cbomeses.Text,cboano.Text,TipoImpresion,true);
           10: AuditoriaAntiguedadSaldos(cbomeses.Text,cboano.Text,TipoImpresion,false);
           11: RepAntiguedadSaldosConcentrado(inttostr(cbomeses.ItemIndex+1),cboano.Text,TipoImpresion);
           12: RepAntiguedadSaldosFacConcentrado(inttostr(cbomeses.ItemIndex+1),cboano.Text,TipoImpresion);
           13: remisionadoMensual(cbomeses.ItemIndex,cboano.Text,'1','9999','Todos','Todos','Todos','Todos','0','0','',TipoImpresion,3);
           14: begin
               if querys('Select mes FROM TendenciaVendedores WHERE mes = "'+cbomeses.text+'" '+
                        'AND fecha ='+cboano.text+' and fechaCierre<> "0000-00-00" limit 5', 0, sqlgeneral) = 0 then
                  application.MessageBox('No se ha realizado el cierre de este mes', 'Reportes Cierre', MB_ICONINFORMATION)
               else

               TendenciaVendedoresTotales(cbomeses.text,cboano.text, false, true, false, false, true, true, TipoImpresion);
               end;
           15 : begin RepCompras(cbomeses.text,cboano.text, '', '', false); OperacionReporte('compras', '', TipoImpresion, 1); end;
           16 : begin RepCajaMensual(inttostr(cbomeses.ItemIndex+1),cboano.Text, false);  end;
           17 : begin
                querys('Select * from RepPagosXLineaDet where upper(PeriodoReporte) = "'+cbomeses.text+'-'+cboano.text+'" '+
                      'order by anio,piva,estatus desc,idfactura', 0, dmreportes.sqlgeneral2);
                OperacionReporte('PagosPorLineaCorrespAlMes', 'Pagos Por Linea Correspondiente Al Mes', TipoImpresion, 1);
                end;
           18 : CanceladosYMorosos(inttostr(cbomeses.ItemIndex+1),cboano.text, '', '', TipoImpresion, 0, true);

         end;
      end;
    4: Bitacora;
  end;
  frmmensaje.Update;
  frmmensaje.Close;
  exit;
 end;
end;

procedure Tfrmmoduloreportes.FormActivate(Sender: TObject);
begin
self.windowstate := wsMaximized;
end;

procedure Tfrmmoduloreportes.CuentasLibres;
begin
if RBFecTodas.Checked then
  begin
  querys('select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
         'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, FechaCancelacion, ultfecps as UltPruebaSemanal '+
         'from clientes where estatus = ''0'' and TipoCont = ''CAN'' and ((ultfecps is null) or (ultfecps < date_sub("'+datetostr(date)+'", interval 12 month))) '+
         'and FechaCancelacion < "'+datetostr(date)+'" order by FechaCancelacion, idcliente asc', 0, dmreportes.sqlgeneral);
  end
else
  querys('select idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
         'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, FechaCancelacion, ultfecps as UltPruebaSemanal '+
         ' from clientes where estatus = ''0'' and TipoCont = ''CAN'' and ((ultfecps is null) or (ultfecps < date_sub("'+datetostr(date)+'", interval 12 month))) '+
         'and FechaCancelacion between '+quotedstr(datetostr(TPSdesde.date))+' and '+quotedstr(datetostr(TPShasta.date))+' order by FechaCancelacion, idcliente asc', 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.buscartendenciatec;
  var fecha1,dia,y,m,mes,fecha2:string;
  diaf:integer;
begin

m:=formatdatetime('m',FechaServidor);
y:=formatdatetime('yyyy',FechaServidor);
dia:=formatdatetime('d',FechaServidor);

m := inttostr(cbomeses.itemindex +1);
y := cboano.text;
dia := formatdatetime('d',FechaServidor);

//diaf:=DaysInMonth(FechaServidor);
diaf:=DiasMes(m);

with dmreportes do
  begin
  if strtoint(m) > 9 then
     mes := m
  else
     mes := '0'+m;

  fecha1:=y+'/'+mes+'/'+'01';
  fecha2 := y+'/'+mes+'/'+ inttostr(diaf);

  if  chserviciosyear.Checked = false then   //Por MES
    begin
    querys('delete from TendenciaServicios where mes= '+quotedstr(cbomeses.text)+' and fecha='+quotedstr(cboano.Text)+' ',1,sqlgeneral);
    querys('select  CodTecnico as code,'+quotedstr(cboano.Text)+','+quotedstr(cbomeses.text)+',count(sid) as horas,dayofmonth(FechaFinUsr) as dia FROM servicios left join EstatusServicios as es ON (es.orden=servicios.status) WHERE FechaFinUsr between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' and es.nombre =  "FINALIZADA" GROUP BY CodTecnico,FechaFinUsr ORDER BY CodTecnico',1,sqlgeneral);
    while not sqlgeneral.eof do
      begin
      querys('select mes from TendenciaServicios where mes= '+quotedstr(cbomeses.text)+' and fecha='+quotedstr(cboano.Text)+' and codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
      if sqlgeneral2.fieldbyname('mes').asstring = '' then
        querys('insert into TendenciaServicios (codigo,fecha,mes,D'+sqlgeneral.fieldbyname('dia').asstring+',idmes) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(cboano.Text)+','+quotedstr(cbomeses.text)+','+quotedstr(sqlgeneral.fieldbyname('horas').asstring)+','+quotedstr(m)+') ',1,sqlgeneral3)
      else
        querys('update TendenciaServicios set D'+sqlgeneral.fieldbyname('dia').asstring+'=  '+sqlgeneral.fieldbyname('horas').asstring+' + D'+sqlgeneral.fieldbyname('dia').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring)+' and  fecha = '+quotedstr(cboano.Text)+' and mes = '+quotedstr(cbomeses.text),1,sqlgeneral3);
      sqlgeneral.next;
      end;

    querys('Drop table if exists tmpTendTecHrs'+frmprincipal.idmaq, 1, sqlgeneral);
    querys('create table tmpTendTecHrs'+frmprincipal.idmaq+' select CodTecnico as code, count(sid) as horas, if((((((hour(HoraFinUsr)-hour(hora_inicio))*60)-30)+ '+
          '(minute(HoraFinUsr)-minute(hora_inicio)))/60)<0, 0,(((((hour(HoraFinUsr)-hour(hora_inicio))*60)-30)+ (minute(HoraFinUsr)-minute(hora_inicio)))/60) ) as te, '+
           'dayofmonth(FechaFinUsr) as dia FROM servicios left join EstatusServicios as es ON (es.orden=servicios.status) WHERE FechaFinUsr between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' and es.nombre =  "FINALIZADA" GROUP BY idcliente, CodTecnico,FechaFinUsr ORDER BY CodTecnico', 1, sqlgeneral);
    querys('select code,'+quotedstr(cboano.Text)+','+quotedstr(cbomeses.text)+', count(dia) as horas, sum(te) as te, dia  FROM tmpTendTecHrs'+frmprincipal.idmaq+' group by code', 0, sqlgeneral);
    sqlgeneral.first;
    while not sqlgeneral.eof do
      begin
      querys('select mes from TendenciaServicios where mes= '+quotedstr(cbomeses.text)+' and fecha='+quotedstr(cboano.Text)+' and codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
      if sqlgeneral2.fieldbyname('mes').asstring <> '' then
        querys('update TendenciaServicios set te=  '+floattostr(sqlgeneral.fieldbyname('te').asfloat)+' where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring)+' and  fecha = '+quotedstr(cboano.Text)+' and mes = '+quotedstr(cbomeses.text),1,sqlgeneral3);
      sqlgeneral.next;
      end;
    querys('Drop table if exists tmpTendTecHrs'+frmprincipal.idmaq, 1, sqlgeneral);

    //sacar el total de todas los servicios
    querys('update TendenciaServicios set total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31)', 1, sqlgeneral3);
    //SACAR LOS DIAS HABILES DEL MES -> QUITAR DOMINGOS//

    diaf := DiasHabilesMes(strtoint(cboano.Text), cbomeses.ItemIndex+1);
    //sacar la tendencia por tecnico
    if ((y=cboano.Text)  and  (m=inttostr(cbomeses.ItemIndex+1))) then
      querys('update TendenciaServicios set promedio=round((total/'+quotedstr(dia)+'),2),tendencia=round(((total/'+quotedstr(dia)+')*'+inttostr(diaf)+'),2)', 1, sqlgeneral3)
    else
      querys('update TendenciaServicios set promedio=round((total/'+inttostr(diaf)+'),2),tendencia=round(((total/'+inttostr(diaf)+')*'+inttostr(diaf)+'),2)', 1, sqlgeneral3);

    querys('select t.*, usuarios.nombre, de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc '+'from TendenciaServicios as t left join usuarios on (usuarios.codigo2 = t.codigo) join DatosEmpresa as de where mes= '+quotedstr(cbomeses.text)+' and t.fecha='+quotedstr(cboano.Text)+' group by codigo order by codigo ',0,sqlgeneral);
    OperacionReporte('TendenciaServicios','',TipoImpresion, 1);
    end
  else
    begin
    //mostrar reporte 2 totales por mes.........
    m := formatdatetime('m',now);
    y := formatdatetime('yyyy',now);

    querys('DROP TABLE IF EXISTS temporal_tendencia'+frmprincipal.idmaq,1,sqlgeneral);
    querys('create table temporal_tendencia'+frmprincipal.idmaq+' (m1 double default 0,m2 double default 0,m3 double default 0,m4 double default 0,m5 double default 0,m6 double default 0,m7 double default 0,m8 double default 0,m9 double default 0,m10 double default 0,m11 double default 0,m12 double default 0, '+
           ' codigo varchar(50),total double default 0,promedio double default 0,tendencia double default 0,fecha varchar(50))',1,sqlgeneral2);
    querys('select total as horas,mes,fecha,codigo as code,idmes from TendenciaServicios where fecha='+quotedstr(cboano.Text)+' order by codigo ',0,sqlgeneral);
    while not sqlgeneral.eof do
      begin
      querys('select codigo from temporal_tendencia'+frmprincipal.idmaq+' where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
      if sqlgeneral2.fieldbyname('codigo').asstring = '' then
        querys('insert into temporal_tendencia'+frmprincipal.idmaq+' (codigo,m'+sqlgeneral.fieldbyname('idmes').asstring+',fecha) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(sqlgeneral.fieldbyname('horas').asstring)+','+quotedstr(cboano.Text)+') ',1,sqlgeneral3)
      else
        querys('update temporal_tendencia'+frmprincipal.idmaq+' set m'+sqlgeneral.fieldbyname('idmes').asstring+'=  '+sqlgeneral.fieldbyname('horas').asstring+' + m'+sqlgeneral.fieldbyname('idmes').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),1,sqlgeneral3);
      sqlgeneral.next;
      end;

    querys('update temporal_tendencia'+frmprincipal.idmaq+' set total=(m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12)', 1, sqlgeneral3);
    if ((y=cboano.Text)  and  (m=inttostr(cbomeses.ItemIndex+1))) then
      querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=round((total/'+quotedstr(m)+'),2),tendencia=round(((total/'+quotedstr(m)+')*'+inttostr(12)+'),2)', 1, sqlgeneral3)
    else
      querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=round((total/'+quotedstr(m)+'),2),tendencia=round(((total/'+quotedstr(m)+')*12),2)', 1, sqlgeneral3);

    querys('select t.*, usuarios.nombre, de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from temporal_tendencia'+frmprincipal.idmaq+' as t left join usuarios on (usuarios.codigo2 = t.codigo) join DatosEmpresa as de order by codigo',0,sqlgeneral);
    OperacionReporte('TendenciaServiciosYear','',TipoImpresion, 1);
    end;
  end;
end;

procedure Tfrmmoduloreportes.Tendenciatec;
begin
buscartendenciatec;
end;

procedure Tfrmmoduloreportes.TravelCliente;
begin
querys('Select travel.idcliente, if(rsocial is NULL or rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, quejas.nombre as queja, asuntos.nombre as asunto, '+
       'magnitudes.nombre as magnitud, areas.nombre as recive, fecharecive as fecha, travel.descripcion from travel left join asuntos on (travel.idasunto = asuntos.idasunto) left join quejas on (travel.idqueja = quejas.idqueja) '+
       'left join magnitudes on (travel.idmagnitud = magnitudes.idmagnitud) left join areas on (travel.iddptorecive = areas.idarea) left join clientes on (clientes.idcliente = travel.idcliente) '+
       'where travel.idcliente ='+quotedstr(edcuentap.text),0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.edabogadoKeyPress(Sender: TObject;
  var Key: Char);
begin
if ((key =#13) and (edabogado.text <> '')) then
   btngenerar.OnClick(self);
end;

procedure Tfrmmoduloreportes.gbTipoBusquedaChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
edbusqueda.Clear;
edbusqueda.Visible := true;
lblbusqueda.Visible := true;
case newindex of
0:begin
   edbusqueda.Button.Visible := true;
   lblbusqueda.Caption := 'Introduzca el numero de cuenta';
 end;
1:begin
   edbusqueda.Button.Visible := false;
   lblbusqueda.Caption := 'Introduzca el nombre del cliente';
  end;
2:begin
   edbusqueda.Visible := false;
   lblbusqueda.Visible := false;
  end;
end;
end;

procedure Tfrmmoduloreportes.edbusquedaButtonClick(Sender: TObject);
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
 edbusqueda.Text := frmbusquedas.resultado;
end;

procedure Tfrmmoduloreportes.edbusquedaChange(Sender: TObject);
begin
if edbusqueda.Text = '' then
 dmreportes.sqlgeneral.Close;
end;

procedure Tfrmmoduloreportes.rgTipoMovChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
cbTipoAsig.Text := '';
if NewIndex = 0 then
 begin
  CargaCombo('select nombre from ConceptoES where movimiento = ''E''','Conceptos de Ajustes',cbtipoasig);
  cbtipoasig.Items.Add('Todas las Entradas');
 end
else
 begin
  CargaCombo('select nombre from ConceptoES where movimiento = ''S''','Conceptos de Ajustes',cbtipoasig);
  cbtipoasig.Items.Add('Todas las Salidas');
 end;
end;

procedure Tfrmmoduloreportes.edbusquedaKeyPress(Sender: TObject;
  var Key: Char);
begin
if gbTipoBusqueda.ItemIndex = 0 then
   key := ValidaNumeros(key,true);
end;

procedure Tfrmmoduloreportes.edCnombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 buscarConcentradoAlarmas;
end;

procedure Tfrmmoduloreportes.cbotipobusconcentradoNotInList(
  Sender: TObject);
begin
cbotipobusconcentrado.ItemIndex := 0;
end;

procedure Tfrmmoduloreportes.ClientesModificaciones;
var cadena:string;
begin
case RGCliCamb.ItemIndex of
  0: begin    //Datos Instalacion
     cadena :='Select idprimario, campo, anterior,nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+
              ClienteNombre('clientes')+' as Nombre from Cambios left join clientes on (clientes.idcliente = '+
              'Cambios.idprimario) where tabla = "clientes"'+'and (Cambios.fecha between '+
              quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.date))+') ';

     end;
  1: begin    //Datos Facturacion
     cadena := 'Select ClientesFact.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, if(clientes.rsocial is NULL or clientes.rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', '+
               'clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre '+
               'from Cambios left join ClientesFact on (ClientesFact.idfact=Cambios.idprimario) left join clientes on (clientes.idcliente=ClientesFact.idcliente) where tabla = ''ClientesFact'' and (Cambios.fecha between '+quotedstr(datetostr(tpdesde.date))+
               ' and '+quotedstr(datetostr(tphasta.date))+')';

     end;
  2: begin    //Telefonos
     cadena := 'Select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla, idcambio '+
                'from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) left join clientes  on (telefonos.idtel=clientes.idtel ) '+
                'where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and telefonos.procedencia = "clientes" ';
                if edcuentap.text <> '' then
                  cadena := cadena + ' and clientes.idcliente = '+quotedstr(edcuentap.text);
                cadena := cadena + '  group by idcambio union '+
                'Select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla, idcambio '+
                'from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) left join contactos on (telefonos.idtel=contactos.idtel) '+
                'left join clientes  on (clientes.idcontacto=contactos.idcontacto) where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+
                datetostr(tphasta.date)+'" and telefonos.procedencia = "contactos" group by idcambio ';

     end;
  3: begin   //Responsables
     cadena := 'select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre from contactos as ct left join clientes  on (ct.idcontacto=clientes.idcontacto) left join '+
               'Cambios on(Cambios.idprimario=ct.idcontador) where tabla = "contactos" and (Cambios.fecha between '+quotedstr(datetostr(tpdesde.date))+
               ' and '+quotedstr(datetostr(tphasta.date))+') ';        end;

  4: begin   //Zonas
     cadena := 'Select clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, '+
               'Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre from Cambios left join '+
               'cliente_zonas as cz on(cz.czid=Cambios.idprimario) left join clientes on (clientes.idcliente'+
               '=cz.cid) where tabla = "cliente_zonas" and (Cambios.fecha between '+quotedstr(datetostr(tpdesde.date))+
               ' and '+quotedstr(datetostr(tphasta.date))+') ';
     if edcuentap.text <> '' then
       cadena := cadena + ' and clientes.idcliente = '+quotedstr(edcuentap.text);
     cadena := cadena +'and clientes.idcliente is not null group by idcambio union Select clientes.idcliente as '+
               'idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+
               ClienteNombre('clientes')+' as Nombre from Cambios left join clientes on (clientes.idcliente='+
               'Cambios.idprimario) where tabla = "cliente_zonas" and (Cambios.fecha between '+
               quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.date))+') ';
     if edcuentap.text <> '' then
       cadena := cadena + ' and clientes.idcliente = '+quotedstr(edcuentap.text);
     cadena := cadena +'and clientes.idcliente is not null group by idcambio order by idprimario,fecha';
     end;
  5: begin
    if edcuentap.text <> '' then
     cadena :=  'Select distinct idcambio, idprimario, campo, anterior,nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join clientes on (clientes.idcliente = Cambios.idprimario) where tabla = "clientes" and  Cambios.fecha '+
                'between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+edcuentap.text+'" group by idcambio union '+

                'Select distinct idcambio, ClientesFact.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora,'+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join ClientesFact on (ClientesFact.idfact=Cambios.idprimario) left join clientes on (clientes.idcliente=ClientesFact.idcliente) '+
                'where tabla = "ClientesFact" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+edcuentap.text+'" group by idcambio union '+

                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, if(clientes.rsocial is NULL or clientes.rsocial="", '+
                'if(clientes.apaterno is NULL or clientes.apaterno="", clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno="", concat(clientes.nombre, " ", clientes.apaterno), '+
                'concat(clientes.nombre, " ", clientes.apaterno, " ", clientes.amaterno))), clientes.rsocial) as Nombre, tabla from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) '+
                'left join clientes  on (telefonos.idtel=clientes.idtel ) where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and '+
                'Cambios.usuario = "'+edcuentap.text+'" and telefonos.procedencia = "clientes" group by idcambio  having idprimario is not NULL union '+

                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, if(clientes.rsocial is NULL or clientes.rsocial="", '+
                'if(clientes.apaterno is NULL or clientes.apaterno="", clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno="", concat(clientes.nombre, " ", clientes.apaterno), '+
                'concat(clientes.nombre, " ", clientes.apaterno, " ", clientes.amaterno))), clientes.rsocial) as Nombre, tabla from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) '+
                'left join contactos on (telefonos.idtel=contactos.idtel) left join clientes  on (clientes.idcontacto=contactos.idcontacto) where tabla = "telefonos" and Cambios.fecha '+
                'between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+edcuentap.text+'"  and telefonos.procedencia = "clientes" group by idcambio '+
                'having idprimario is not NULL union '+
                
                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join telefonos on (telefonos.idtel=Cambios.idprimario) left join contactos on (telefonos.idtel=contactos.idtel) '+
                'left join clientes  on (clientes.idcontacto=contactos.idcontacto) where tabla = "telefonos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+
                datetostr(tphasta.date)+'" and Cambios.usuario = "'+edcuentap.text+'"  and telefonos.procedencia = "contactos" group by idcambio union '+

                'select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from contactos as ct left join clientes  on (ct.idcontacto=clientes.idcontacto) left join Cambios on(Cambios.idprimario=ct.idcontador) '+
                'where tabla = "contactos" and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+edcuentap.text+'" group by idcambio union '+
                'Select distinct idcambio, clientes.idcliente as idprimario, campo, anterior, nuevo, Cambios.usuario, Cambios.fecha, Cambios.hora, '+ClienteNombre('clientes')+' as Nombre, tabla '+
                'from Cambios left join cliente_zonas as cz on(cz.czid=Cambios.idprimario) left join clientes on (clientes.idcliente=cz.cid) where tabla = "cliente_zonas" '+
                'and  Cambios.fecha between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and Cambios.usuario = "'+edcuentap.text+'" group by idcambio '+
                'order by tabla, idcambio'
     else
      begin
      application.messagebox('Falta el login del usuario a buscar', 'Atencion', mb_iconinformation);
      exit;
      end;
     end;
  end;

if RGCliCamb.ItemIndex < 4 then
  begin
  if edcuentap.text <> '' then
    cadena := cadena + ' and clientes.idcliente = '+quotedstr(edcuentap.text);
if RGCliCamb.ItemIndex <> 2 then
  cadena := cadena + ' group by idcambio order by clientes.idcliente, Cambios.fecha';
  end;
querys(cadena, 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.chkmesClick(Sender: TObject);
begin
     if chkmes.Checked = true then
        begin
              chktotalesventas.Checked := false;
              chktotalescuentas.Checked := false;
              gbanualesvtastend.Enabled := false;
        end;
end;

procedure Tfrmmoduloreportes.chktotalesventasClick(Sender: TObject);
begin
     if chktotalesventas.Checked = true then
        begin
          chkmes.Checked := false;
          chktotalescuentas.Checked := false;
          gbanualesvtastend.Enabled := true;
        end;
end;

procedure Tfrmmoduloreportes.chktotalescuentasClick(Sender: TObject);
begin
     if chktotalescuentas.Checked = true then
        begin
          chkmes.Checked := false;
          chktotalesventas.Checked := false;
          gbanualesvtastend.Enabled := true;
        end;
end;

procedure Tfrmmoduloreportes.chserviciosyearClick(Sender: TObject);
begin
if chserviciosyear.Checked = true then
   chmesservicio.Checked := false;
end;

procedure Tfrmmoduloreportes.chmesservicioClick(Sender: TObject);
begin
if chmesservicio.Checked = true then
   chserviciosyear.Checked := false;
end;

procedure Tfrmmoduloreportes.chinstalacionesmesClick(Sender: TObject);
begin
 if chinstalacionesmes.Checked = true then
     chinstalacionano.Checked := false;
end;

procedure Tfrmmoduloreportes.chinstalacionanoClick(Sender: TObject);
begin
 if chinstalacionano.Checked = true then
     chinstalacionesmes.Checked := false;
end;


procedure Tfrmmoduloreportes.TraficoResumen;
var cadena:string;
begin
cadena := 'select if(clientes.rsocial is NULL or clientes.rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
         'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, if(clientes.numero is NULL or '+
         'clientes.numero='''', clientes.dir, concat(clientes.dir, '' '',clientes.numero,'' '', colonias.nombre, '' '', clientes.cp)) as colonia, clientes.telefono, clientes.refs as referencia, '+
         'categorias.nombre as categoria, alarm, sector, sk_alarmas.idcliente, alarmas_conclusion.status as conclusion, fecha_pc, hora_pc, alarmas_tipos.nombre, action, detalle from sk_alarmas '+
         'left join clientes on (clientes.idcliente=sk_alarmas.idcliente) left join alarmas_conclusion ON(sk_alarmas.conclusion=alarmas_conclusion.id) left join alarmas_detalle on (sk_alarmas.id=alarmas_detalle.aid) '+
         'left join alarmas_tipos on (alarmas_tipos.clave=sk_alarmas.tipo) left join colonias on (clientes.idcol= colonias.idcol) left join categorias on (categorias.idcategoria = clientes.idcategoria) '+
         'left join ClientesFact on (clientes.idfact=ClientesFact.idfact) where fecha_pc between '+quotedstr(datetostr(TPCdesde.Date))+' and '+quotedstr(datetostr(TPChasta.Date));

if rgbuspor.ItemIndex = 0 then //cuentas
  begin
  cadena:=cadena+' and sk_alarmas.idcliente between '+quotedstr(Eddesde.Text)+' AND '+quotedstr(Edhasta.text)+' and GrupoTrafico <> 1';
  end;

if rgbuspor.ItemIndex = 1 then // Grupos
  begin
  cadena:=cadena+' and estatus=1 and GrupoTrafico = 1 and (ClientesFact.nombre like '+quotedstr('%'+ednombre.text+'%')+' or ClientesFact.rsocial like '+quotedstr('%'+ednombre.text+'%')+' ) ';
  end;

if rgbuspor.ItemIndex = 2 then //Nombre
  begin
  cadena:=cadena+' and (ClientesFact.nombre like '+quotedstr('%'+ednombre.text+'%')+' or ClientesFact.rsocial like '+quotedstr('%'+ednombre.text+'%')+' or clientes.rsocial like '+quotedstr('%'+ednombre.text+'%')+
         ' or clientes.nombre like '+quotedstr('%'+ednombre.text+'%')+' ) and estatus=1';
  end;  
  querys(cadena, 0, dmreportes.sqlgeneral);

end;

procedure Tfrmmoduloreportes.pcadministracionTabClick(Sender: TObject);
   var  myYear, myMonth, myDay:word;
begin
deshabilitaboton(TabServicios2,0,btnbuscar);
dmreportes.sqlgeneral.close;
dmreportes.sqlgeneral.SQL.Clear;
if tabprincipal.ActivePage = pcadmon then
 begin
  case pcadministracion.TabIndex of
   1: begin
       tpdesde.Date := date;
       tphasta.Date := date;
       btnbuscar.Enabled := false;
       btngenerar.Enabled := true;
       gbfechas.Parent := tstravel;
       gbfechas.Top := 1;
       gbfechas.Left := 1;
       lbltecnico.Parent := tstravel;
       lbltecnico.Caption := 'Usuario';
       cbtecnico.Parent := tstravel;
       lbltecnico.Top := 40;
       lbltecnico.Left :=297;
       cbtecnico.Top := 57;
       cbtecnico.Left :=297;
       //carga los departamentos
       CargaGrupo('select nombre from areas order by nombre','Departamentos',rrgdepto,nil,sqlgeneral);
       rrgdepto.Items.Add('TODOS');
       //carga las fuentes
       CargaGrupo('select nombre from origen order by nombre','origen',nil,rcgfuente,sqlgeneral);
       rcgfuente.Items.Add('TODOS');
       //carga combo de estatus de travel
       CargaCombo('SELECT EstatusServicios.nombre FROM TipoServicios INNER JOIN EstatusServicios ON (TipoServicios.idserv = EstatusServicios.idserv) WHERE (TipoServicios.nombre = ''TRAVEL'') ORDER BY EstatusServicios.orden','Estatus de Travel',cboestatus);
       cboestatus.Items.Add('TODOS');
       rrgresolucion.ItemIndex := 2;
       rrgauditado.ItemIndex := 2;
       rrgdepto.ItemIndex := rrgdepto.Items.Count -1;
       rcgfuente.ItemChecked[rcgfuente.Items.Count-1]:=true;
       //carga los vendedores                                                                                                                                                                                                                             puestos.nombre = '+quotedstr('VENDEDOR')+' AND
       CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
                  ' inner join areas on areas.idarea=usuarios.idarea WHERE  usuarios.estatus = 1 order by usuarios.nombre','usuarios activos en el sistema',cbtecnico);
       cbtecnico.Items.Add('TODOS');
       cbtecnico.ItemIndex := cbtecnico.Items.Count -1;
      end;

     2: begin      //Evaluacion de Desempeño
        GRGeneral.Parent := TabAdmonDesempeno;
        gbPeriodoMesA.Parent := TabAdmonDesempeno;
        gbPeriodoMesA.Left := 20;
        gbPeriodoMesA.Top := 25;
        cbomeses.ItemIndex := MonthOfTheYear(FechaServidor)-1;
        DecodeDate(FechaServidor, myYear, myMonth, myDay);
        cboano.text := vartostr(myyear);
        cargacombo('Select nombre from areas', 'areas', cbarea);
        pimprimir.Parent := TabAdmonDesempeno;
        pimprimir.left := 300;
        pimprimir.top := 25;
        btnbuscar.enabled := true;
        end;

     3: begin
        gbPeriodoMesA.Parent := TabAdmAuditoria;
        gbPeriodoMesA.Left := 20;
        gbPeriodoMesA.Top := 25;
        cboano.Text := formatdatetime('yyyy',now);
        cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
        btngenerar.enabled := true;
        btnbuscar.enabled := false;

     end;
     4: begin
        btngenerar.enabled := true;
        btnbuscar.enabled := false;
        gbfechas.Parent:=tslog;
        tpdesde.Date:=EncodeDate(yearof(today),Monthof(today),01);
        tphasta.Date:=today;
        end;


 end;
end;
end;

procedure Tfrmmoduloreportes.rrgdeptoChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
rrgasuntos.Items.Clear;
rrgsubasunto.Items.Clear;
if newindex = (rrgdepto.Items.Count-1) then
 begin
  rrgasuntos.Enabled := false;
  rrgsubasunto.Enabled := false;
  rrgdepto.Tag := -1;
 end
else
 begin
   querys('select idarea from areas where nombre ='+quotedstr(rrgdepto.Items.Strings[newindex]),0,sqlgeneral);
   rrgdepto.Tag := sqlgeneral.fieldbyname('idarea').asinteger;
   //carga los vendedores                                                                                                                                                                                                                             puestos.nombre = '+quotedstr('VENDEDOR')+' AND
   CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
              ' inner join areas on areas.idarea=usuarios.idarea WHERE  usuarios.estatus = 1 and areas.idarea='+sqlgeneral.fieldbyname('idarea').AsString+' order by usuarios.nombre','usuarios en esta area',cbtecnico);
   cbtecnico.Items.Add('TODOS');
   cbtecnico.ItemIndex := cbtecnico.Items.Count -1;
  if CargaGrupo('SELECT distinct asuntos.nombre FROM quejas INNER JOIN asuntos ON (quejas.idasunto = asuntos.idasunto) WHERE quejas.idarea = '+inttostr(rrgdepto.Tag),'Asuntos',rrgasuntos,nil,sqlgeneral)=0 then
   rrgasuntos.enabled := false
  else
   begin
    rrgasuntos.enabled := true;
    rrgasuntos.Items.Add('TODOS');
    rrgasuntos.ItemIndex := rrgasuntos.Items.Count-1;
   end;
 end;
end;

procedure Tfrmmoduloreportes.rrgasuntosChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
if rrgasuntos.Items.Count-1 <> newindex then
 begin
  querys('select idasunto from asuntos where nombre='+quotedstr(rrgasuntos.Items.Strings[newindex]),0,sqlgeneral);
  rrgasuntos.Tag := sqlgeneral.fieldbyname('idasunto').AsInteger;
  if CargaGrupo('select nombre from quejas where idarea='+inttostr(rrgdepto.Tag)+' and idasunto='+inttostr(rrgasuntos.Tag),'quejas',rrgsubasunto,nil,sqlgeneral) = 0 then
   rrgsubasunto.Enabled := false
  else
   begin
    rrgsubasunto.Items.Add('TODOS');
    rrgsubasunto.Enabled := true;
    rrgsubasunto.ItemIndex := rrgsubasunto.Items.Count-1;
   end;
 end
else
 begin
  rrgsubasunto.Items.Clear;
  rrgsubasunto.Enabled := false;
  rrgasuntos.Tag := -1;
 end;
end;

procedure Tfrmmoduloreportes.rrgSubAsuntoChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
//trae el indice de la queja
if newindex <> rrgsubasunto.Items.Count-1 then
 begin
  querys('SELECT quejas.idqueja FROM quejas WHERE quejas.idarea = '+inttostr(rrgdepto.Tag)+' AND quejas.idasunto = '+inttostr(rrgasuntos.Tag)+' and quejas.nombre='+quotedstr(rrgsubasunto.Items.Strings[newindex]),0,sqlgeneral);
  rrgsubasunto.Tag := sqlgeneral.fieldbyname('idqueja').AsInteger;
 end
else
 rrgsubasunto.Tag:=-1;
end;

procedure Tfrmmoduloreportes.rrgresolucionChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
cboestatus.Text :='';
cboestatus.Tag := -1;
end;

procedure Tfrmmoduloreportes.cboestatusSelect(Sender: TObject);
begin
rrgresolucion.ItemIndex := -1;
querys('SELECT orden FROM TipoServicios INNER JOIN EstatusServicios ON (TipoServicios.idserv = EstatusServicios.idserv) WHERE TipoServicios.nombre = ''TRAVEL'' and EstatusServicios.nombre ='+quotedstr(cboestatus.Text),0,sqlgeneral);
cboestatus.Tag := sqlgeneral.fieldbyname('orden').AsInteger;

end;

procedure Tfrmmoduloreportes.cbtecnicoClick(Sender: TObject);
begin
querys('select idusuario from usuarios where concat(ifnull(nombre,''''),'' '',ifnull(apaterno,''''),'' '',ifnull(amaterno,'''')) = '+quotedstr(cbtecnico.Text),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 cbtecnico.Tag := sqlgeneral.fieldbyname('idusuario').AsInteger
else
 cbtecnico.Tag := -1;

end;

procedure Tfrmmoduloreportes.rcgFuenteChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
var i:integer;
begin
if (index = rcgfuente.Items.Count-1)and(newstate=cbchecked) then
   for i:=0 to rcgfuente.Items.Count-2 do
       rcgfuente.ItemChecked[i]:=false;
if (index<>rcgfuente.Items.Count-1)and(newstate=cbchecked) then
  rcgfuente.ItemChecked[rcgfuente.Items.Count-1]:=false;
end;

procedure Tfrmmoduloreportes.cbOrdCliKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
end;

procedure Tfrmmoduloreportes.rgbusporClick(Sender: TObject);
begin

if rgbuspor.ItemIndex = 0 then //cuentas
  begin
  gbRelCtaCte.Visible := false;
  Pcuenta.Visible := true;
  end;

if rgbuspor.ItemIndex = 1 then // Grupos
  begin
  gbRelCtaCte.Visible := true;
  Pcuenta.Visible := false;
  end;

if rgbuspor.ItemIndex = 2 then //Nombre
  begin
  gbRelCtaCte.Visible := true;
  Pcuenta.Visible := false;
  end;



end;

procedure Tfrmmoduloreportes.chcitasequipoClick(Sender: TObject);
begin
if chcitasequipo.Checked = true then
  begin
        chprospectosano.Checked := false;
  end;
end;

procedure Tfrmmoduloreportes.chcitasampliacionanoClick(Sender: TObject);
begin
if chcitasampliacionano.Checked = true then
  begin
        chprospectosano.Checked := false;
  end;

end;

procedure Tfrmmoduloreportes.chprospectosanoClick(Sender: TObject);
begin
if chprospectosano.Checked = true then
  begin
        chcitasequipo.Checked := false;
        chcitasampliacionano.Checked := false;
        chaceptadasano.Checked := false;
  end;
end;

procedure Tfrmmoduloreportes.chaceptadasanoClick(Sender: TObject);
begin
if chaceptadasano.Checked = true then
  begin
        chprospectosano.Checked := false;
  end;
end;

procedure Tfrmmoduloreportes.chanocaClick(Sender: TObject);
begin
if chanoca.Checked = true then
begin
   gbcitasAno.Enabled := true;
   chmesca.checked := false;
   chbdesglosado.Checked := false;
end;

end;

procedure Tfrmmoduloreportes.chmescaClick(Sender: TObject);
begin
if chmesca.Checked = true then
begin
   gbcitasAno.Enabled := false;
   chanoca.checked := false;
   chbdesglosado.Checked := false;

end;

end;

procedure Tfrmmoduloreportes.lbPedidosPendientesxInstalarMouseLeave(
  Sender: TObject);
begin
lbPedidosPendientesxInstalar.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbPedidosPendientesxInstalarMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
lbPedidosPendientesxInstalar.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbPedidosPendientesxInstalarClick(
  Sender: TObject);
begin
     PendientesXInstalarXArt;
end;

procedure Tfrmmoduloreportes.chkgfoliosChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
if (chkgfolios.ItemChecked[3]) and (index=3) and (newstate=cbChecked) then
 begin
  chkgfolios.ItemChecked[0]:=false;
  chkgfolios.ItemChecked[1]:=false;
  chkgfolios.ItemChecked[2]:=false;
 end;
 
if ((chkgfolios.ItemChecked[0])or(chkgfolios.ItemChecked[1])or(chkgfolios.ItemChecked[2]))and(chkgfolios.ItemChecked[3]) then
 chkgfolios.ItemChecked[3] :=  false;
end;

procedure Tfrmmoduloreportes.cbomovimientosSelect(Sender: TObject);
begin
if cbomovimientos.ItemIndex = 2 then
 chkgfolios.Visible := true
else
 chkgfolios.Visible := false;
end;

procedure Tfrmmoduloreportes.chbdesglosadoClick(Sender: TObject);
begin
if chbdesglosado.Checked = true then
begin
   gbcitasAno.Enabled := false;
   chmesca.checked := false;
   chanoca.Checked := false;
end;
end;

procedure Tfrmmoduloreportes.edpedidopendKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     btngenerar.OnClick(self);
  end;
end;

procedure Tfrmmoduloreportes.BuscarMotivoRetardo;
var inicio, fin : string;
begin

querys('Drop Table if exists TempMotivoRetardo'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create Table TempMotivoRetardo'+frmprincipal.idmaq+' (idmotivo int(11), motivo varchar(35), idsector int(11), diurno int(11) default 0, vespertino int(11) default 0, nocturno int(11) default 0, fecha1 date, fecha2 date)',1,sqlgeneral);
with dmreportes do
  begin
  querys('Select idsector from sectores', 0, sqlgeneral2);
  sqlgeneral2.First;
  while not sqlgeneral2.Eof = true do
    begin
    querys('Insert into TempMotivoRetardo'+frmprincipal.idmaq+' set idmotivo=''0'', motivo=''SIN MOTIVO'', idsector='+
             quotedstr(sqlgeneral2.fieldbyname('idsector').AsString)+', fecha1='+quotedstr(datetostr(TPCdesde.Date))+', fecha2='+quotedstr(datetostr(TPChasta.Date)), 1, dmreportes.sqlgeneral4);
    //querys('select * from motivo_retardo', 1, dmreportes.sqlgeneral3);
    querys('SELECT idstatus as idmotivo, nombre FROM clasif_servicios WHERE idserv = 3', 1, dmreportes.sqlgeneral3);
    dmreportes.sqlgeneral3.First;
    while not dmreportes.sqlgeneral3.Eof = true do
      begin
      querys('Insert into TempMotivoRetardo'+frmprincipal.idmaq+' set idmotivo='+quotedstr(sqlgeneral3.fieldbyname('idmotivo').AsString)+', motivo='+quotedstr(sqlgeneral3.fieldbyname('nombre').AsString)+', idsector='+
             quotedstr(sqlgeneral2.fieldbyname('idsector').AsString)+', fecha1='+quotedstr(datetostr(TPCdesde.Date))+', fecha2='+quotedstr(datetostr(TPChasta.Date)), 1, dmreportes.sqlgeneral4);
      sqlgeneral3.Next;
      end;
    sqlgeneral2.Next;
    end;

  querys('select turnos.nombre, HoraInicio, HoraFin from turnos left join areas on (areas.idarea=turnos.idarea) where areas.nombre = ''CENTRAL''', 0, sqlgeneral2);
  sqlgeneral2.First;  // turnos
  while not sqlgeneral2.Eof = true do
    begin
    if sqlgeneral2.FieldByName('nombre').AsString = 'DIURNO' then
      begin
      inicio := inttostr(hourof(sqlgeneral2.fieldbyname('HoraInicio').AsDateTime))+':'+inttostr(minuteof(sqlgeneral2.fieldbyname('HoraInicio').AsDateTime));
      fin := inttostr(hourof(sqlgeneral2.fieldbyname('HoraFin').AsDateTime))+':'+inttostr(minuteof(sqlgeneral2.fieldbyname('HoraFin').AsDateTime));

      querys('select idsector, count(id) as DIURNO, idmotivo from tiempo_respuesta as tr left join usuarios on (usuarios.codigo=tr.CodPatrullero) where tr.hora between '+
              quotedstr(inicio)+' and '+quotedstr(fin)+' and tr.fecha between '+
              quotedstr(datetostr(TPCdesde.Date))+' and '+quotedstr(datetostr(TPChasta.Date))+' and tiempo >= ''6'' group by idsector, idmotivo order by  idmotivo, idsector', 0, sqlgeneral3);
      sqlgeneral3.First;  // turnos
      while not sqlgeneral3.Eof = true do
         begin
         querys('Update TempMotivoRetardo'+frmprincipal.idmaq+' set diurno='+quotedstr(sqlgeneral3.FieldByName('DIURNO').AsString)+' where idmotivo ='+
           quotedstr(sqlgeneral3.FieldByName('idmotivo').AsString)+' and idsector='+quotedstr(sqlgeneral3.FieldByName('idsector').AsString), 1, dmreportes.sqlgeneral4);
         sqlgeneral3.Next;
         end;
     end;

     if dmreportes.sqlgeneral2.FieldByName('nombre').AsString = 'VESPERTINO' then
      begin
      inicio := inttostr(hourof(sqlgeneral2.fieldbyname('HoraInicio').AsDateTime))+':'+inttostr(minuteof(sqlgeneral2.fieldbyname('HoraInicio').AsDateTime));
      fin := inttostr(hourof(sqlgeneral2.fieldbyname('HoraFin').AsDateTime))+':'+inttostr(minuteof(sqlgeneral2.fieldbyname('HoraFin').AsDateTime));

      querys('select idsector, count(id) as VESPERTINO, idmotivo from tiempo_respuesta as tr left join usuarios on (usuarios.codigo=tr.CodPatrullero) where tr.hora between '+
              quotedstr(inicio)+' and '+quotedstr(fin)+' and tr.fecha between '+
              quotedstr(datetostr(TPCdesde.Date))+' and '+quotedstr(datetostr(TPChasta.Date))+' and tiempo >= ''6'' group by idsector, idmotivo order by  idmotivo, idsector', 0, sqlgeneral3);
      sqlgeneral3.First;  // turnos
      while not sqlgeneral3.Eof = true do
         begin
         querys('Update TempMotivoRetardo'+frmprincipal.idmaq+' set vespertino='+quotedstr(sqlgeneral3.FieldByName('VESPERTINO').AsString)+' where idmotivo ='+
           quotedstr(sqlgeneral3.FieldByName('idmotivo').AsString)+' and idsector='+quotedstr(sqlgeneral3.FieldByName('idsector').AsString), 1, dmreportes.sqlgeneral4);
         sqlgeneral3.Next;
         end;
      end;
    if dmreportes.sqlgeneral2.FieldByName('nombre').AsString = 'NOCTURNO' then
      begin
      inicio := inttostr(hourof(sqlgeneral2.fieldbyname('HoraInicio').AsDateTime))+':'+inttostr(minuteof(sqlgeneral2.fieldbyname('HoraInicio').AsDateTime));
      fin := inttostr(hourof(sqlgeneral2.fieldbyname('HoraFin').AsDateTime))+':'+inttostr(minuteof(sqlgeneral2.fieldbyname('HoraFin').AsDateTime));

      querys('select idsector, count(id) as NOCTURNO, idmotivo from tiempo_respuesta as tr left join usuarios on (usuarios.codigo=tr.CodPatrullero) where (tr.hora > '+
              quotedstr(inicio)+' or tr.hora < '+quotedstr(fin)+') and tr.fecha between '+
              quotedstr(datetostr(TPCdesde.Date))+' and '+quotedstr(datetostr(TPChasta.Date))+' and tiempo >= ''6'' group by idsector, idmotivo order by  idmotivo, idsector', 0, sqlgeneral3);
      sqlgeneral3.First;  // turnos
      while not sqlgeneral3.Eof = true do
         begin
         querys('Update TempMotivoRetardo'+frmprincipal.idmaq+' set nocturno='+quotedstr(sqlgeneral3.FieldByName('NOCTURNO').AsString)+' where idmotivo ='+
           quotedstr(sqlgeneral3.FieldByName('idmotivo').AsString)+' and idsector='+quotedstr(sqlgeneral3.FieldByName('idsector').AsString), 1, dmreportes.sqlgeneral4);
         sqlgeneral3.Next;
         end;
      end;
    sqlgeneral2.Next;
    end;

querys('Delete from TempMotivoRetardo'+frmprincipal.idmaq+' where (diurno is null and vespertino is null and nocturno is null )', 1, dmreportes.sqlgeneral2);
querys('Select * from TempMotivoRetardo'+frmprincipal.idmaq+' order by idmotivo', 0, dmreportes.sqlgeneral);
  end; //with
end;

procedure Tfrmmoduloreportes.RzURLLabel2Click(Sender: TObject);
begin
querys(' Select clientes.idcliente, if (TrafEmail=1, if(TrafEnPersona=1, ''1Envia 2'', ''2TrafEmail''),  if(TrafEnPersona=1, ''3TrafPer'',  ''4No envia'')) as envio '+
       'from clientes inner join DetClientes on (clientes.idcliente=DetClientes.idcliente) where clientes.estatus = 1 order by  envio, clientes.idcliente', 0, dmreportes.sqlgeneral);
OperacionReporte('TipoEnvioTrafico', '', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.cbgenerarSelect(Sender: TObject);
begin
TipoImprecionProcedure;
end;


Procedure Tfrmmoduloreportes.BuscarDesempeno;
begin
if RBSTNoDetallado.Checked = true then
  begin
  querys('Select E.idevaluacion, Concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno) as nombre, a.nombre as area, p.nombre as puesto, f.nombre as factor, c.nombre as calificacion, c.puntuacion as puntuacion, E.mes, E.anio '+
         'From EvaluacionRH as E Left join usuarios as u on (u.idusuario=E.idusuario) Left join areas as a on (u.idarea=a.idarea) Left join puestos as p on (u.idpuesto=p.idpuesto) Left join Calificacion as c on (c.idcalificacion=E.iddpf) '+
         'Left join Factores_Individuales as f on (f.idfactor=E.idfactor) Where E.mes = '+quotedstr(cbomeses.text)+' and E.anio ='+quotedstr(cboano.text)+' order by area, E.idevaluacion, nombre, f.idfactor',0, dmreportes.sqlgeneral);
  end
else
  begin
  querys('Select E.idevaluacion, Concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno) as nombre, a.nombre as area, p.nombre as puesto, f.nombre as factor, c.nombre as calificacion, c.puntuacion as puntuacion, E.mes, E.anio '+
         'From EvaluacionRH as E Left join usuarios as u on (u.idusuario=E.idusuario) Left join areas as a on (u.idarea=a.idarea) Left join puestos as p on (u.idpuesto=p.idpuesto) Left join Calificacion as c on (c.idcalificacion=E.iddpf) '+
         'Left join Factores_Individuales as f on (f.idfactor=E.idfactor) Where E.mes = '+quotedstr(cbomeses.text)+' and E.anio ='+quotedstr(cboano.text)+' and a.nombre='+quotedstr(cbarea.text)+' order by E.idevaluacion, nombre, f.idfactor',0, dmreportes.sqlgeneral);
  end;
end;

procedure Tfrmmoduloreportes.RBSTDetalladoClick(Sender: TObject);
begin
if  TabPrincipal.ActivePage = pcadmon then
  begin
  case pcadministracion.TabIndex of
     2: RGAreas.Visible := true;
     end;
  end;
end;

procedure Tfrmmoduloreportes.RBSTNodetalladoClick(Sender: TObject);
begin
if  TabPrincipal.ActivePage = pcadmon then
  begin
  case pcadministracion.TabIndex of
     2: RGAreas.Visible := false;
     end;
  end;
end;

procedure Tfrmmoduloreportes.buscarTipoEnvio;
var campo :string;
begin
if RGTipoEnvio.ItemIndex = 0 then
  campo := 'TrafEmail';
if RGTipoEnvio.ItemIndex = 1 then
  campo := 'TrafEnPersona';
if RGTipoEnvio.ItemIndex = 2 then
  campo := 'NoTraf';

querys('select DetClientes.idcliente, '+ClienteNombre('clientes')+' as nombre, NombreCambio, RelacionPuestoCambio, FechaContactoCambio from DetClientes left join clientes on (clientes.idcliente=DetClientes.idcliente) '+
       'where '+campo+' = 1 and clientes.estatus = 1 order by DetClientes.idcliente', 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.RzURLLabel3Click(Sender: TObject);
begin
querys('Select clientes.idcliente,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) as Nombre,telefonos.telefono,'+
       'telefonos.tipo_tel as Tipo,concat(ifnull(clientes.dir,''''),'', '',ifnull(clientes.numero,''''),'', '',ifnull(clientes.ciudad,'''')) as direccion,colonias.nombre From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact '+
       ' left join colonias on clientes.idcol = colonias.idcol left join telefonos on telefonos.idtel=clientes.idtel where clientes.estatus =1 and clientes.idcol <> 0 group by clientes.idcliente Order by colonias.nombre, clientes.dir',0,dmreportes.sqlgeneral2);
OperacionReporte('ClientesColonia', '', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.lbctasctrlClick(Sender: TObject);
begin
frmmensaje.Show;
frmmensaje.Update;
querys('select open_close.idcliente, '+ClienteNombre('clientes')+' as nombre,protocolos.protocolo from open_close left join clientes on (clientes.idcliente = open_close.idcliente)  left join protocolos on protocolos.idprotocolo = clientes.idprotocolo where (tipo = ''4'' or tipo = ''5'' '+
       ' or tipo = ''cl'' or tipo = ''op'' or tipo=''400'' or tipo=''401'') and clientes.estatus = 1 group by idcliente', 0, dmreportes.sqlgeneral);
frmmensaje.Close;
operacionreporte('CentralCuentasCtrlOPCL', '', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.lbctasctrlMouseLeave(Sender: TObject);
begin
lbctasctrl.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbctasctrlMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbctasctrl.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.cbOrdCliNotInList(Sender: TObject);
begin
cbordcli.Text := cbordcli.Items.Strings[0];
end;

procedure Tfrmmoduloreportes.Boletin;
var memin :tmemo;
begin
memin := Tmemo.Create(nil);
memin.Parent := TSCentral2Boletin;
memin.visible := false;
memin.left := 450;

querys('Drop table if exists tmpboletin'+frmprincipal.idmaq, 1, sqlgeneral);

querys('Create table tmpboletin'+frmprincipal.idmaq+' select s.id, fecha_pc, cliente, tipo, zona, ifnull(tiempo, 0) as tiempo, ifnull(detenidos, 0) as detenidos, if(detenidos>0, ''SI'', ''NO'') '+
       ' as SeVioLadron from sk_alarmas as s left join alarmas_conclusion as c  on (s.conclusion=c.id) left join tiempo_respuesta as t on (t.aid=s.id) left join ActivPos as a on (a.idsk=s.id) '+
       ' where c.status = ''ACTIVACION POSITIVA'' and s.fecha_pc between '+quotedstr(datetostr(tpCdesde.date))+' and '+quotedstr(datetostr(tpChasta.date))+' order by s.cliente', 1, sqlgeneral);
querys('alter table tmpboletin'+frmprincipal.idmaq+' add column detalle text', 1, sqlgeneral);

querys('select s.id, s.idcliente from sk_alarmas as s left join alarmas_conclusion as c  on (s.conclusion=c.id) where c.status = ''ACTIVACION POSITIVA'' '+
       'and s.fecha_pc between '+quotedstr(datetostr(tpCdesde.date))+' and '+quotedstr(datetostr(tpChasta.date))+' group by s.id order by s.cliente', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('select s.id, d.detalle from sk_alarmas as s left join alarmas_detalle as d on (s.id=d.aid) left join alarmas_conclusion as c  on (s.conclusion=c.id) where c.status = ''ACTIVACION POSITIVA'' '+
       'and s.fecha_pc between '+quotedstr(datetostr(tpCdesde.date))+' and '+quotedstr(datetostr(tpChasta.date))+' and s.id= '+quotedstr(sqlgeneral.fieldbyname('id').AsString)+
       ' order by s.cliente', 0, dmreportes.sqlgeneral2);
  dmreportes.sqlgeneral2.First;
  memin.lines.Clear;
  while not dmreportes.sqlgeneral2.eof = true do
    begin
    if dmreportes.sqlgeneral2.fieldbyname('id').AsString  = sqlgeneral.fieldbyname('id').AsString then
      memin.lines.Add(dmreportes.sqlgeneral2.fieldbyname('detalle').AsString);                        
    dmreportes.sqlgeneral2.Next;
    end;
  querys('update tmpboletin'+frmprincipal.idmaq+' set detalle='+quotedstr(memin.Text)+' where id='+quotedstr(dmreportes.sqlgeneral2.fieldbyname('id').AsString), 1, dmreportes.sqlgeneral3);
  sqlgeneral.Next;
  end;
querys('Select * from tmpboletin'+frmprincipal.idmaq+' order by cliente, id', 0, dmreportes.sqlgeneral);
OperacionReporte('BoletinTranquilidad','BoletinTranquilidad', TipoImpresion, 1);
querys('select s.id, fecha_pc, cliente, s.tipo, zona, ifnull(tiempo, 0) as tiempo, ifnull(detenidos, 0) as detenidos, if(detenidos>0, ''SI'', ''NO'')  as SeVioLadron '+
       'from sk_alarmas as s left join alarmas_conclusion as c  on (s.conclusion=c.id) left join tiempo_respuesta as t on (t.aid=s.id) left join ActivPos as a on (a.idsk=s.id) '+
       ' where c.status = ''ACTIVACION POSITIVA'' and s.fecha_pc between '+quotedstr(datetostr(tpCdesde.date))+' and '+quotedstr(datetostr(tpChasta.date))+
       ' group by s.id order by s.cliente', 0, dmreportes.sqlgeneral);
PreviewGridInExcel(DGGeneral,'Corporación Mexicalense S.A. de C.V.','Boletin Tranquilidad' ,' ');
end;

procedure Tfrmmoduloreportes.GRViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 if TabCentral2.ActivePageIndex = 8 then
    begin
    if GRview.Columns[GRview.Controller.FocusedColumnIndex].Caption = 'comentarios' then
      GRView.OptionsData.Editing := true
    else
      GRView.OptionsData.Editing := false;
    end;
end;



procedure Tfrmmoduloreportes.morososprimeravez;
begin
//para llenado de clientes morosos
querys('Insert into morosos (idcliente, idpago, idpedido) SELECT pc.idcliente, pc.idpago,pc.idpedido FROM PagosClientes as pc left '+
          'join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) LEFT JOIN '+
          'sectores as s ON (s.idsector=c.sector) LEFT JOIN contratos as con ON(c.TipoCont=con.TipoCont) WHERE '+
          'pc.FechaVence BETWEEN ''1990/01/01'' AND "'+datetostr(date)+'" and  p.estatus in(3,4) AND '+
          'restante > 0 and pc.movimiento IN(0,1)', 1, sqlgeneral);

querys('Select count(idpago) as total, idpago from morosos group by idpago having total > 1', 0, sqlgeneral);
while not sqlgeneral.Eof do
//   for i:=1 to sqlgeneral.RecordCount do
 begin
  querys('Delete from morosos where idpago='+quotedstr(sqlgeneral.fieldbyname('idpago').asstring)+' limit 1', 1, dmreportes.sqlgeneral7);
  sqlgeneral.Next;
 end;
//fin llenado de clientes morosos

//saca los clientes que solo deben un pedido

if querys('Select distinct(m.idcliente), '+ClienteNombre('clientes')+' as nombre, clientes.sector, t.telefono, max(idinstalacion) '+
          'as instalado, u.nombre as un, count(m.idpago)as total from morosos as m left join PagosClientes as pc on(pc.idpago=m.idpago) left '+
          'join pedidos as p on p.idpedido=pc.idpedido left join clientes on(clientes.idcliente=m.idcliente) left '+
          'join telefonos as t on(clientes.idtel=t.idtel) left join instalaciones as i on(i.idcliente=clientes.idcliente) '+
          'left join UnidadNegocio as u on u.idunidadnegocio=p.idunidadnegocio where pc.FechaVence between date_sub("'+datetostr(date)+'", '+
          'interval 2 month) and date_sub("'+datetostr(date)+'", interval 1 month) '+
          'and clientes.sector between '+cbosector1.text+' and '+cbosector2.text+' group by m.idcliente having instalado is not null and total = 1 order by clientes.sector, un, m.idcliente', 0, dmreportes.sqlgeneral) > 0 then
          OperacionReporte('MorososPrimeraVez','', TipoImpresion, 1)
       else
          application.messagebox('No se encontraron registros', 'Aviso', MB_ICONINFORMATION);
end;

procedure Tfrmmoduloreportes.AnualidadAnterior;
begin
querys('Drop table if exists tmpAnualidad'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpAnualidad'+frmprincipal.idmaq+' select pedidos.idcliente, '+ClienteNombre('clientes')+
       ' as nombre from pedidos left join clientes on(clientes.idcliente=pedidos.idcliente) where '+
       'concepto like ''%anual '+edanodesde.text+'%'' '+
       'and saldado = ''1'' and clientes.estatus = ''1''', 1, sqlgeneral);
querys('Select idcliente from pedidos where '+
       'concepto like ''%anual '+edanohasta.text+'%'' '+
       ' and saldado = ''1''', 0, sqlgeneral);
sqlgeneral.first;
while not sqlgeneral.eof = true do
  begin
  querys('Delete from tmpAnualidad'+frmprincipal.idmaq+' where idcliente ='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring), 1, dmreportes.sqlgeneral8);
  sqlgeneral.Next;
  end;
querys('Select * from tmpAnualidad'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.edanodesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
Key := ValidaNumeros(key, true);
end;

procedure Tfrmmoduloreportes.edanohastaKeyPress(Sender: TObject;
  var Key: Char);
begin
Key := ValidaNumeros(key, true);
end;

procedure Tfrmmoduloreportes.GastosMayores;
begin
querys('Select "Del '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+'" as periodo, p.idcliente, if(clientes.rsocial is NULL or clientes.rsocial='''', '+
       'if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is '+
       'NULL or clientes.amaterno='''', concat(clientes.nombre, '' '', clientes.apaterno), '+
       'concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) '+
       'as nombre, round(sum(SubTotal), 2) as SubTotal, round(sum(Iva), 2) as Iva, round(sum(TotMn), 2) as '+
       'TotalMn from pedidos as p left join clientes as c on(c.idcliente=p.idcliente) left join ClientesFact '+
       'as clientes on(clientes.idfact=c.idfact) left join RemiFact as rf on(rf.idpedido=p.idpedido) where '+
       'rf.FechaAlta between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" '+
       'and p.estatus in(3,4) group by c.idfact having TotalMn >='+edcantidad.text+' order by TotalMn desc', 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.edcantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, true);
end;

procedure Tfrmmoduloreportes.compras;
var cadena:string;
begin
cadena:='Select "Del '+datetostr(tpdesde.date)+' al '+datetostr(tphasta.Date)+ '" as Periodo, c.idcompra, '+
        ClienteNombre('p')+' as nombre, c.FechaCompra, c.NumFactura , c.NumPedimento,'+
        ' moneda, '+
        'round(if(moneda = "P",subtotal,subtotal*TipoCambio),4) as subtotal, '+
        'round(if(moneda = "P",c.iva,c.iva*TipoCambio),4) as iva, '+
        'round(if(moneda = "P",totalmn,total*TipoCambio),4) as total, '+
        'round(if(moneda = "P", subtotal / TipoCambio, total),4) as totaldll, '+
        'TipoCambio from compras as c left join proveedores as p '+
        'on(p.idprov=c.idprov) where c.FechaCompra between '+quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.date))+' ';

if cboproveedores.text <> 'TODOS' then
  begin
  cadena:= cadena + 'and c.idprov = '+cboproveedores.value+' ';
  end;

  cadena := cadena + ' order by p.idprov, c.FechaCompra';
  querys(cadena, 0, dmreportes.sqlgeneral);
  OperacionReporte('compras','', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.EnvTrafCol;
var traf:string;
begin
if rgTrafImp.ItemIndex = 0 then
  traf := 'ultfectraf'
else
  traf := 'ultfectrafmail';
if rgTrafCol.ItemIndex  = 0 then
  begin
  //TRAFICO ENVIADO POR COLONIAS
  querys('Drop table if exists tempColoniasTraf'+frmprincipal.idmaq,1,sqlgeneral);
  querys('Create table tempColoniasTraf'+frmprincipal.idmaq+' Select col.nombre, count(idcliente) as activos, 0 as total from '+
         'clientes as c left join colonias as col on(c.idcol=col.idcol) where c.estatus = 1 group by '+
         'col.nombre order by col.nombre, c.idcliente asc',1,sqlgeneral);
  querys('Select col.nombre, count(idcliente) as total from clientes as c left join colonias as col on(c.idcol='+
         'col.idcol) where '+traf+' between "'+datetostr(tpdesde.date)+'" and  "'+datetostr(tphasta.date)+
         '" and c.estatus = 1 group by col.nombre order by col.nombre, c.idcliente asc',0,sqlgeneral);
  sqlgeneral.first;
  while not sqlgeneral.eof = true do
    begin
    querys('update tempColoniasTraf'+frmprincipal.idmaq+' set total='+sqlgeneral.fieldbyname('total').asstring+
           ' where nombre ="'+sqlgeneral.fieldbyname('nombre').asstring+'"', 1, dmreportes.sqlgeneral8);
    sqlgeneral.next;
    end;
  querys('select * from tempColoniasTraf'+frmprincipal.idmaq+' where total <> 0',0,dmreportes.sqlgeneral);
  end
else
  begin
  //TRAFICO NO ENVIADO POR CLIENTES
  if rgTrafImp.ItemIndex = 0 then //IMPRESOS
    querys('Select c.idcliente, '+ClienteNombre('c')+' as nombre, ultfectraf as fecha, if(TrafEnPersona=1, "SI", "NO") as Traf, '+
           '"De '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+'" as periodo, "CUENTAS CON TRAFICO NO ENVIADO POR IMPRESION" as titulo '+
           'from clientes as c left join DetClientes as d on d.idcliente=c.idcliente where c.estatus =1 and ultfectraf < "'+
           datetostr(tpdesde.date)+'" order by Traf, idcliente', 0, dmreportes.sqlgeneral)
  else
    querys('Select c.idcliente, '+ClienteNombre('c')+' as nombre, ultfectrafmail as fecha, if(TrafEmail = 1, "SI", "NO") as Traf, '+
           '"De '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+'" as periodo, "CUENTAS CON TRAFICO NO ENVIADO POR EMAIL" as titulo '+
           'from clientes as c left join DetClientes as d on d.idcliente=c.idcliente where c.estatus =1 and ultfectrafmail < "'+
           datetostr(tpdesde.date)+'" order by Traf, idcliente', 0, dmreportes.sqlgeneral);
  end;

end;

procedure Tfrmmoduloreportes.PorAtender;
begin
querys('Select sid as servicio, concat(fecha_creacion, " ", hora_creacion) as creacion, '+
       'concat(FechaFinUsr, " ", HoraFinUsr) as ffinal, clientes.idcliente as cuenta, '+
       'if(rsocial is NULL or rsocial="", if(clientes.apaterno is NULL or clientes.apaterno="", '+
       'clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno="", concat(clientes.nombre, " "'+
       ', clientes.apaterno), concat(clientes.nombre, " ", clientes.apaterno, " ", clientes.amaterno))), '+
       'clientes.rsocial) as Nombre, problema, codtecnico , s.comentario,es.nombre as estatus, '+
       's.trab_realizado, reportby, cs2.nombre as clasificacion,  if(usuarios.apaterno is NULL or '+
       'usuarios.apaterno="", usuarios.nombre,if(usuarios.amaterno is NULL or usuarios.amaterno="", '+
       'concat(usuarios.nombre, " ", usuarios.apaterno),concat(usuarios.nombre, " ", usuarios.apaterno, '+
       '" ", usuarios.amaterno) )) as usuario, nomop, '+
       'if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") -to_days('+
       's.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)), if((to_days("'+datetostr(date)+'")-to_days'+
       '(s.fecha_creacion)) =1, if(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)'+
       '),0),0)))<=24, "HOY", if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'")'+
       '-to_days(s.fecha_creacion))*24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),if((to_days("'+datetostr(date)+'")-to_days('+
       's.fecha_creacion)) =1, if(("'+timetostr(time)+'">s.hora_creacion),24+(hour("'+timetostr(time)+'")-hour(s.hora_creacion)),0),'+
       '0))) >48, "48 HRS", "24 HRS")) AS 24hrs, left(nota, length(nota)-85) as nota '+
       'from servicios as s left join clientes on (s.idcliente = clientes.idcliente) left join EstatusServicios '+
       'as es ON (es.orden=s.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) left join usuarios '+
       'on(usuarios.codigo2 = s.codtecnico) left join TipoServicios as tipos on(tipos.nombre="CLASIFICAR '+
       'SERVICIO") left join clasif_servicios as cs2 on(cs2.idserv=tipos.idserv and cs2.orden=s.clasif) left '+
       'join notas as n on(n.idnota=s.idnota) where  es.finaliza = 0 and fecha_creacion between "'+
       datetostr(TPdesde.Date)+'" and "'+datetostr(TPhasta.Date)+'" group by sid order by codtecnico, fecha_creacion', 0, dmreportes.sqlgeneral);

end;

procedure Tfrmmoduloreportes.AnualCobranza;
begin
querys('Drop table if exists tmpAnualCobranza'+frmprincipal.idmaq,1,sqlgeneral);
querys('Create table tmpAnualCobranza'+frmprincipal.idmaq+
       ' Select tipo, concepto, sector, clasificacion, id, '+
       'if(mes = "enero", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS en, '+
       'if(mes = "Febrero", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS fb, '+
       'if(mes = "marzo", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS mr, '+
       'if(mes = "abril", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS ab, '+
       'if(mes = "mayo", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS my, '+
       'if(mes = "junio", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS jn, '+
       'if(mes = "julio", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS jl, '+
       'if(mes = "agosto", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS ag, '+
       'if(mes = "septiembre", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS sp, '+
       'if(mes = "octubre", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS oc, '+
       'if(mes = "noviembre", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS nv, '+
       'if(mes = "diciembre", D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) AS dc '+
       'from Cobranza where fecha = year("'+datetostr(date)+'")', 1, sqlgeneral);
querys('select tipo, concepto, sector, clasificacion, id, sum(en) as enero,  sum(fb) as febrero, sum(mr) '+
       'as marzo, sum(ab) as abril, sum(my) as mayo, sum(jn) as junio, sum(jl) as julio, sum(ag) as agosto, '+
       'sum(sp) as septiembre, sum(oc) as octubre, sum(nv) as noviembre, sum(dc) as diciembre from '+
       'tmpAnualCobranza'+frmprincipal.idmaq+' group by  sector,concepto order by tipo desc,  sector, id asc', 0, dmreportes.sqlgeneral);
OperacionReporte('AnualCobranza', 'Anual de Cobranza', TipoImpresion, 1);
querys('Drop table if exists tmpAnualCobranza'+frmprincipal.idmaq,1,sqlgeneral);
end;

procedure Tfrmmoduloreportes.AnualCobranzaSaldos;
begin
querys('Drop table if exists tmpAnualCobranzaSaldos'+frmprincipal.idmaq,1,sqlgeneral);
querys('Create table tmpAnualCobranzaSaldos'+frmprincipal.idmaq+
       ' Select tipo, concepto, sector, clasificacion, id, mes, fecha, '+
       'if(concepto =0, D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) as d030, '+
       'if(concepto =1, D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) as d059, '+
       'if(concepto =2, D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) as d6099,'+
       'if(concepto +3, D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31, 0) as abo '+
       'from Cobranza where fecha = year("'+datetostr(date)+'") and id = 2 order by fecha, tipo ', 1, sqlgeneral);
querys('select if(mes = "enero", 1,if(mes="febrero",2,if(mes="marzo",3,if(mes="abril",4,if(mes="mayo",5,'+
       'if(mes="junio",6,if(mes="julio",7,if(mes="agosto",8,if(mes="septiembre",9,if(mes="octubre",10,'+
       'if(mes="noviembre",11,12))))))))))) as nomes, tipo, sum(d030) as d030, sum( d059) as d059, '+
       'sum(d6099) as d6099, sum(abo) as abo, upper(mes) as mes, fecha from tmpAnualCobranzaSaldos'+frmprincipal.idmaq+
       ' group by tipo, mes order by tipo, nomes desc', 0, dmreportes.sqlgeneral);
OperacionReporte('ConcentradoSaldos', 'Concentrado de Saldos', TipoImpresion, 1);
querys('Drop table if exists tmpAnualCobranzaSaldos'+frmprincipal.idmaq,1,sqlgeneral);

end;

procedure Tfrmmoduloreportes.lbcatcolMouseLeave(Sender: TObject);
begin
lbcatcol.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbcatcolMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbcatcol.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.ClientesSinActividad;
begin

  querys('select "Sectores '+cbosector1.Text+' al '+cbosector2.Text+'" as titulo, a.idcliente, '+ClienteNombre('c')+' as nombre, max(fecha_pc) as fecha_pc, concat(tipo, " ", zona) as tipo, t.total '+
         'from alarmas as a left join clientes c on a.idcliente=c.idcliente left join ( Select sum(debe) as total, idcliente from ( '+
         'SELECT distinct pc.idpago, if(pc.FechaVence <=curdate(), pc.restante,0) as debe, '+
         'if(pc.movimiento= 0, if(pc2.movimiento = 1, -1,0),1) as condicion, p.idcliente from PagosClientes as pc '+
         'left join  pedidos as p on p.idpedido=pc.idpedido left join PagosClientes as pc2 on (pc2.idpedido = pc.idpedido '+
         'and pc2.movimiento = 1) where p.estatus in(3,4,6) and p.saldado = 0 and pc.movimiento in(0,1) and pc.restante > 0 '+
         'having condicion >= 0 ) as t group by idcliente ) as t on t.idcliente=c.idcliente '+
         'where fecha_pc between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" '+
         'and ((tipo = "cd" and zona = "00") or (tipo = "654" ) or (tipo = "c" and zona="1")) and c.estatus = 1 '+
         'and c.bloqueado = 0 and c.sector between '+cbosector1.Text+' and '+cbosector2.Text+' '+
         'group by a.idcliente having total is null order by a.idcliente', 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.ComisionesVendedorCasa;
begin
   querys('select v, idpedido, fechaCreacion, idinstal, sum(TotDlls) as TotDlls, idcliente,'+
          ' cliente, Opor, vendedor, sum(Descuento) as Descuento from ('+
          ' select distinct p.idvendedor as v, p.idpedido, p.FechaRemision as fechaCreacion, p.idinstal,dp.id,'+
          ' ROUND(if(top.idtipo_oportunidad not in(7,9,13,23),if(dp.tc<>1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0),2) as TotDlls, p.idcliente,'+
          ' if(((length(c.rsocial)=0) or ifnull(c.rsocial,1)),concat_ws(" ",c.nombre,c.apaterno,c.amaterno),c.rsocial) as cliente,'+
          ' if(tipocont="SEN","EQ/SEN",un.nombre) as Opor, '+
          ' u.codigo, concat_ws(" ",u.nombre,u.apaterno,u.amaterno) as vendedor, if(dp.cant > 0,if((dp.cant*dp.costo)< 0,dp.cant*dp.costo,0),'+
          ' if((dp.piezas*dp.costo)< 0,(dp.piezas*dp.costo),0)) as Descuento '+
          ' from usuarios as u left join pedidos as p on (p.idvendedor=u.idusuario) '+
          ' left join DetPedido as dp on (p.idpedido=dp.idpedido) left join articulos as a on (dp.cod_cve=a.cod_cve) '+
          ' left join clientes as c on (p.idcliente=c.idcliente) left join tipo_oportunidad as top on top.idunidadnegocio=p.idunidadnegocio '+
          ' left join UnidadNegocio as un on un.idunidadnegocio=p.idunidadnegocio '+
          ' where p.FechaRemision between "'+dfecha1.Text+'" and "'+dfecha2.Text+'" and p.idorigen in (1,2) '+
          ' and u.estatus=1 and u.codigo = "'+edbuscarU.Text+'" and a.idlinea = 4 and p.estatus in (3,4) '+
          ' and top.idtipo_oportunidad in (1,2,9,7,23,13,24,25,4,5,10,3,6) ) as t group by idpedido',0,dmreportes.sqlgeneral);

   querys('Select opor, count(idpedido) as total, 1 as tipo  from ( select idpedido,Opor  from ( '+
          ' select distinct p.idvendedor as v, p.idpedido, p.FechaRemision as fechaCreacion, p.idinstal,dp.id, '+
          ' ROUND(if(top.idtipo_oportunidad not in(7,9,13,23),if(dp.tc<>1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0),2) as TotDlls, p.idcliente, '+
          ' if(((length(c.rsocial)=0) or ifnull(c.rsocial,1)),concat_ws(" ",c.nombre,c.apaterno,c.amaterno),c.rsocial) as cliente,'+
          ' if(tipocont="SEN","EQ/SEN",un.nombre) as Opor, u.codigo, concat_ws(" ",u.nombre,u.apaterno,u.amaterno) as vendedor,'+
          ' if(dp.cant > 0,if((dp.cant*dp.costo)< 0,dp.cant*dp.costo,0),if((dp.piezas*dp.costo)< 0,(dp.piezas*dp.costo),0)) as Descuento '+
          ' from usuarios as u left join pedidos as p on (p.idvendedor=u.idusuario) '+
          ' left join DetPedido as dp on (p.idpedido=dp.idpedido) left join articulos as a on (dp.cod_cve=a.cod_cve) '+
          ' left join clientes as c on (p.idcliente=c.idcliente) left join tipo_oportunidad as top on top.idunidadnegocio=p.idunidadnegocio '+
          ' left join UnidadNegocio as un on un.idunidadnegocio=p.idunidadnegocio '+
          ' where p.FechaRemision between "'+dfecha1.Text+'" and "'+dfecha2.Text+'" and p.idorigen in (1,2) '+
          ' and u.estatus=1 and u.codigo = "'+edbuscarU.Text+'" and a.idlinea = 4 and p.estatus in (3,4) '+
          ' and top.idtipo_oportunidad in (1,2,9,7,23,13,24,25,4,5,10,3,6) ) as t group by idpedido ) as t group by opor '+
          'UNION '+
          'Select opor, sum(monitoreo) as total, 2 as tipo from ( select monitoreo,"MONITOREO"  as Opor  from ( '+
          ' select distinct if(c.estatus=1, 1, 0) as monitoreo, p.idvendedor as v, p.idpedido, p.FechaRemision as fechaCreacion, p.idinstal,dp.id, '+
          ' ROUND(if(top.idtipo_oportunidad not in(7,9,13,23),if(dp.tc<>1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0),2) as TotDlls, p.idcliente, '+
          ' if(((length(c.rsocial)=0) or ifnull(c.rsocial,1)),concat_ws(" ",c.nombre,c.apaterno,c.amaterno),c.rsocial) as cliente,'+
          ' if(tipocont="SEN","EQ/SEN",un.nombre) as Opor, u.codigo, concat_ws(" ",u.nombre,u.apaterno,u.amaterno) as vendedor,'+
          ' if(dp.cant > 0,if((dp.cant*dp.costo)< 0,dp.cant*dp.costo,0),if((dp.piezas*dp.costo)< 0,(dp.piezas*dp.costo),0)) as Descuento '+
          ' from usuarios as u left join pedidos as p on (p.idvendedor=u.idusuario) '+
          ' left join DetPedido as dp on (p.idpedido=dp.idpedido) left join articulos as a on (dp.cod_cve=a.cod_cve) '+
          ' left join clientes as c on (p.idcliente=c.idcliente) left join tipo_oportunidad as top on top.idunidadnegocio=p.idunidadnegocio '+
          ' left join UnidadNegocio as un on un.idunidadnegocio=p.idunidadnegocio '+
          ' where p.FechaRemision between "'+dfecha1.Text+'" and "'+dfecha2.Text+'" and p.idorigen in (1,2) '+
          ' and u.estatus=1 and u.codigo = "'+edbuscarU.Text+'" and a.idlinea = 4 and p.estatus in (3,4) '+
          ' and top.idtipo_oportunidad in (1,2,9,7,23,13,24,25,4,5,10,3,6) ) as t group by idpedido ) as t group by opor'+
          '',0,dmreportes.sqlgeneral2);

    OperacionReporte('ComisionesVendedoresCasa','Reporte de comisiones vendedores de casa',TipoImpresion, 1);

end;

procedure Tfrmmoduloreportes.ComisionesVendedoresCasa;
begin
   //frmmensaje.Show;
   //frmmensaje.Update;
   with DMREPORTES do
   begin
   querys('select	t1.Nombre, t1.LLAMADAEQ, ifnull(ROUND(t1.CIERRESEQ*100/t1.LLAMADAEQ),0) as CIERRESEQ, t1.LLAMADAAMP, ifnull(ROUND(t1.CIERRESAMP*100/t1.LLAMADAAMP),0) as CIERRESAMP, t1.TOTEQ, t1.TOTAMP, '+
	         't1.codigo '+
          'from '+
	         '(select u.idusuario,u.codigo, concat_ws(" ",u.nombre,u.apaterno,u.amaterno) as Nombre, '+
            'if(sum(d.llamadasEq) is null,0,sum(d.llamadasEq)) as LLAMADAEQ, '+
	    		'if(sum(d.cierresEq) is null,0,sum(d.cierresEq)) as CIERRESEQ, '+
	    		'if(sum(d.llamadasAmp) is null,0,sum(d.llamadasAmp)) as LLAMADAAMP, '+
	    		'if(sum(d.cierresAmp) is null,0,sum(d.cierresAmp)) as CIERRESAMP, '+
	    		'if(sum(d.totEq) is null,0,sum(d.totEq)) as TOTEQ, '+
	    		'if(sum(d.totAmp) is null,0,sum(d.totAmp)) as TOTAMP '+
          'from usuarios u '+
          'left join ( '+
               '(select av.idvendedor as v, count(*) as llamadasEq, 0 as llamadasAmp, 0 as totEq, 0 as totAmp, 0 as cierresEq, 0 as cierresAmp '+
		         'from usuarios as u '+
			      'left join agenda_vendedores as av on (u.idusuario = av.idvendedor) '+
			      'left join oportunidades as op on (op.idoportunidad=av.idoportunidad) '+
		         'where av.fecha_creacion between "'+dfecha1.text+'" and "'+dfecha2.text+'" and op.idorigen in (1) and u.idpuesto = 41 '+
			      'and av.idtipo_oportunidad in (1,2,9,7,23,13) and u.estatus=1 '+
		         'group by av.idvendedor,op.idorigen) '+
		    'UNION ALL '+
			      '(select av.idvendedor as v, 0 as llamadasEq, count(*) as llamadasAmp, 0 as totEq, 0 as totAmp, 0 as cierresEq, 0 as cierresAmp '+
		         'from usuarios as u '+
			      'left join agenda_vendedores as av on (u.idusuario = av.idvendedor) '+
			      'left join oportunidades as op on (op.idoportunidad=av.idoportunidad) '+
		         'where av.fecha_creacion between "'+dfecha1.text+'" and "'+dfecha2.text+'" and op.idorigen in (1) and u.idpuesto = 41 '+
			      'and av.idtipo_oportunidad in (24,25,4,5,10,3,6) and u.estatus=1 '+
		         'group by av.idvendedor,op.idorigen) '+
          'UNION ALL '+
		         '(select av.idvendedor as v,0 as llamadasEq, 0 as llamadasAmp, 0 as totEq, 0 as totAmp, count(*) as cierresEq, 0 as cierresAmp '+
			      'from usuarios as u '+
			      'left join agenda_vendedores as av on (u.idusuario = av.idvendedor) '+
			      'left join oportunidades as op on (op.idoportunidad=av.idoportunidad) '+
			      'left join presupuestos2 as pr on (pr.idoportunidad=av.idoportunidad) '+
			      'where av.fecha_creacion between "'+dfecha1.text+'" and "'+dfecha2.text+'" and op.idorigen in (1) and u.idpuesto = 41 and pr.estatus = 1 '+
			      'and av.idtipo_oportunidad in (1,2,9,7,23,13) and u.estatus=1 '+
			      'group by av.idvendedor) '+
          'UNION ALL '+
			      '(select av.idvendedor as v,0 as llamadasEq, 0 as llamadasAmp, 0 as totEq, 0 as totAmp, 0 as cierresEq, count(*) as cierresAmp '+
			      'from usuarios as u '+
			      'left join agenda_vendedores as av on (u.idusuario = av.idvendedor) '+
			      'left join oportunidades as op on (op.idoportunidad=av.idoportunidad) '+
			      'left join presupuestos2 as pr on (pr.idoportunidad=av.idoportunidad) '+
			      'where av.fecha_creacion between "'+dfecha1.text+'" and "'+dfecha2.text+'" and op.idorigen in (1) and u.idpuesto = 41 and pr.estatus = 1 '+
			      'and av.idtipo_oportunidad in (24,25,4,5,10,3,6) and u.estatus=1 '+
			      'group by av.idvendedor) '+
          'UNION ALL '+
			      '(select av.idvendedor as v,0 as llamadasEq, 0 as llamadasAmp, ROUND(sum(if(dp.tc<>1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio)),2) as totEq, '+
			      '0 as totAmp, 0 as cierresEq, 0 as cierresAmp '+
			      'from usuarios as u '+
			      'left join agenda_vendedores as av on (u.idusuario = av.idvendedor) '+
			      'left join oportunidades as op on (op.idoportunidad=av.idoportunidad) '+
			      'left join presupuestos2 as pr on (pr.idoportunidad=av.idoportunidad) '+
			      'left join pedidos as p on (pr.idpresupuesto=p.idpresupuesto) '+
			      'left join DetPedido as dp on (p.idpedido=dp.idpedido) '+
			      'left join articulos as a on (dp.cod_cve=a.cod_cve) '+
			      'where p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and op.idorigen in (1) and u.idpuesto = 41 and pr.estatus = 1 '+
			      'and av.idtipo_oportunidad in (1,2,9,7,23,13) and a.idlinea = 4 and u.estatus=1 '+
			      'group by av.idvendedor) '+
          'UNION ALL '+
			      '(select av.idvendedor as v,0 as llamadasEq, 0 as llamadasAmp, 0 as totEq, '+
			      'ROUND(sum(if(dp.tc<>1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio)),2) as totAmp, 0 as cierresEq, 0 as cierresAmp '+
			      'from usuarios as u '+
			      'left join agenda_vendedores as av on (u.idusuario = av.idvendedor) '+
			      'left join oportunidades as op on (op.idoportunidad=av.idoportunidad) '+
			      'left join presupuestos2 as pr on (pr.idoportunidad=av.idoportunidad) '+
			      'left join pedidos as p on (pr.idpresupuesto=p.idpresupuesto) '+
			      'left join DetPedido as dp on (p.idpedido=dp.idpedido) '+
			      'left join articulos as a on (dp.cod_cve=a.cod_cve) '+
			      'where p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and op.idorigen in (1) and u.idpuesto = 41 and pr.estatus = 1 '+
			      'and av.idtipo_oportunidad in (24,25,4,5,10,3,6) and a.idlinea = 4 and u.estatus=1 '+
			      'group by av.idvendedor) '+
		         ') as d on (u.idusuario=d.v) '+
          'where 	u.idarea = 1 and u.estatus = 1 and u.idpuesto = 41 '+
          'group by	u.idusuario) as t1 '+
      'order by t1.codigo',0,sqlgeneral2);
   end; //  with dmreportes
end;

procedure Tfrmmoduloreportes.ComisionesVendedores;
  var total,m:string;   tc : double;  cerrado:boolean;
begin
total := '';
with dmreportes do
  begin
  if querys('Select cerrado from ComisionesVendedores where mes = month( "'+dfecha1.text+'") and ano=year( "'+dfecha1.text+'") and cerrado = 1', 0, sqlgeneral3) > 0 then
    begin
    cerrado := True;
    if ckCierreComisiones.Checked = true then
      application.MessageBox('El cierre ya fue aplicado', 'Atencion', MB_ICONINFORMATION);
    end
  else
    cerrado := False;

  if cerrado = false then
    begin
    //CREA TABLA A LLENAR
    querys('DROP TABLE IF EXISTS TmpComFin'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('CREATE TABLE TmpComFin'+frmprincipal.idmaq+' (codigo varchar (5), nombre varchar(100), nocamb int(11) default 0, camb int(11) default 0, norecbaja int(11) default 0, recbaja int(11) default 0, '+
           'noenla int(11) default 0, enla int(11) default 0, norecu int(11) default 0, recu int(11) default 0, nocone int(11) default 0, cone int(11) default 0, noreco int(11) default 0, reco int(11) default 0, '+
           'noctasnvas int(11) default 0, ctasnvas int(11) default 0, tc decimal (10,2), '+
           'TotDlls decimal(10,2) default 0, PCom decimal(10,2) default 0, ComVtaDlls decimal(10,2) default 0, CgoAut int(11) default 0,  B5000Dlls int(11) default 0, '+
           'MasCtaNva int(11) default 0, CtaReco int(11) default 0, cctv int(11) default 0, Pcctv decimal(10,2) default 0, Totalcctv decimal(10,2) default 0, '+
           'TotalCom int(11) default 0 ) ',1,sqlgeneral3);

     querys('Insert into TmpComFin'+frmprincipal.idmaq+' (codigo, nombre) select codigo, concat(if (u.nombre is null," ",u.nombre)," ", if (u.apaterno is null," ",u.apaterno)," ", if (u.amaterno is null," ",u.amaterno)) as Vendedor '+
          'from usuarios as u where idpuesto = "1" and estatus = "1" order by codigo', 1, sqlgeneral3);

     //BUSCA LAS VENTAS
     querys('DROP TABLE IF EXISTS tmpComVend'+frmprincipal.idmaq,1,sqlgeneral3);
     querys('create table tmpComVend'+frmprincipal.idmaq+' SELECT distinct p.idinstal, p.idpedido, '+
            'sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls, '+
            'round(if(tp.comisiones = 1,p.TipoCambio,0), 2) as TipoCambio, u.codigo, if(tp.nombre = "CONEXION2", "CON2", left(tp.nombre,4)) as Oport, cm.cantidad FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN '+
           'articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) left join Comisiones as cm '+
           'on cm.UnidadNegocio=tp.nombre '+
           'WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and p.estatus in(3,4) and tp.instalacion =1 and a.idlinea = 4 '+
           'and left(tp.nombre,4) <> "CCTV" '+
           'GROUP BY dp.idpedido Order by codigo, oport',1,sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend1'+frmprincipal.idmaq,1,sqlgeneral3);


    querys('create table tmpComVend1'+frmprincipal.idmaq+' select distinct p.idpedido, round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
           'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
           'ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and tp.instalacion =1  and a.idlinea = 4 and left(tp.nombre,4) <> "CCTV" GROUP BY dnc.idpedido',1,sqlgeneral3);


     //PROMEDIO TIPO DE CAMBIO
    querys('select round(avg(t1.TipoCambio),2) as TipoCambio, "h" as h FROM tmpComVend'+frmprincipal.idmaq+' AS t1 LEFT JOIN tmpComVend1'+frmprincipal.idmaq+' as t2 ON(t1.idpedido=t2.idpedido) where t1.TotDlls > 0 group by h',0,sqlgeneral2);
    tc:= sqlgeneral2.FieldByName('TipoCambio').AsFloat;
      querys('Update TmpComFin'+frmprincipal.idmaq+' set tc='+sqlgeneral2.FieldByName('TipoCambio').Asstring,1, sqlgeneral4);

      //INSERTAR VENTAS POR COMISIONES EN EL MES
    if ckCierreComisiones.Checked = true then
    querys('Insert into ComisionesKardex (idusuario, idpedido, idunidadnegocio, '+
           'TotDlls, mes, ano, commes, '+
           'movimiento, tipocomision) select u.idusuario, t.idpedido, p.idunidadnegocio, '+
           't.ToTDlls - if(t1.ToTDlls is null, 0,t1.ToTDlls) AS TotDlls, month("'+dfecha1.text+'"), month("'+dfecha1.text+'"), '+
           'year("'+dfecha1.text+'"), 0, "VTADLLS" FROM tmpComVend'+frmprincipal.idmaq+' as t LEFT JOIN tmpComVend1'+
           frmprincipal.idmaq+'  as t1 ON(t.idpedido=t1.idpedido) LEFT JOIN usuarios as u on u.codigo=t.codigo '+
           'left join pedidos as p on t.idpedido=p.idpedido '+
           'where u.idpuesto=1 having TotDlls <> 0 '+
           'order by t.codigo, t.oport', 1, sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend2'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend2'+frmprincipal.idmaq+' select t.codigo, t.oport,if(t.oport="CAMB", count(t.oport)*cantidad, 0) as camb, if(t.oport="CAMB", count(t.oport), 0) as nocamb, if(t.oport="ENLA", count(t.oport)*cantidad, 0) as enla, '+
           'if(t.oport="ENLA", count(t.oport), 0) as noenla,  if(t.oport="RECU", count(t.oport)*cantidad, 0) as recu,  if(t.oport="RECU", count(t.oport), 0) as norecu, '+
           'if(t.oport="CONE", count(t.oport)*cantidad, 0) as cone,  '+
           'if(t.oport="CONE", count(t.oport), 0) as nocone, '+
           'if(t.oport="CON2", count(t.oport)*cantidad, 0) as con2,  '+
           'if(t.oport="CON2", count(t.oport), 0) as nocon2, '+
           'if(t.oport="RECO", count(t.oport)*cantidad, 0) as reco, if(t.oport="RECO", count(t.oport), 0) as noreco, '+ //'if(t.oport="CCTV", count(t.oport)*cantidad, 0) as cctv, if(t.oport="CCTV", count(t.oport), 0) as nocctv, '+
           'sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)) AS TotDlls FROM tmpComVend'+frmprincipal.idmaq+' as t LEFT JOIN tmpComVend1'+frmprincipal.idmaq+'  as t1 ON(t.idpedido=t1.idpedido) '+
          'group by t.codigo, t.oport order by t.codigo, t.oport',1,sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('DROP TABLE IF EXISTS tmpComVend1'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('DROP TABLE IF EXISTS tmpComVend5'+frmprincipal.idmaq,1,sqlgeneral3);

    //CONEXIONES, ENLACES, CAMBIOS, RECONEXIONES
    querys('select t.codigo, Oport, sum(nocamb) as NOCAMB, sum(noenla) as NOENLA, sum(nocone) AS NOCONE, sum(nocon2) AS NOCON2, sum(noreco) as NORECO,  '+
    'sum(camb) as CAMB, sum(enla) as ENLA, sum(cone) AS CONE, sum(con2) AS CON2, sum(reco) '+
           'as RECO,  SUM(TotDlls) as TotDlls FROM tmpComVend2'+frmprincipal.idmaq+' as t left join usuarios as u on u.codigo = t.codigo where u.estatus = "1" and idpuesto = "1" '+
           'group by t.codigo order by t.codigo, oport', 0, sqlgeneral3);

    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set nocamb="'+sqlgeneral3.fieldbyname('NOCAMB').asstring+'", camb="'+sqlgeneral3.fieldbyname('CAMB').asstring+'", '+
        'noenla="'+sqlgeneral3.fieldbyname('NOENLA').asstring+'", enla="'+sqlgeneral3.fieldbyname('ENLA').asstring+'", nocone='+sqlgeneral3.fieldbyname('NOCONE').asstring+'+'+sqlgeneral3.fieldbyname('NOCON2').asstring+
        ', cone='+sqlgeneral3.fieldbyname('CONE').asstring+'+'+sqlgeneral3.fieldbyname('CON2').asstring+', noreco="'+sqlgeneral3.fieldbyname('NORECO').asstring+'", reco="'+sqlgeneral3.fieldbyname('RECO').asstring+
        '", TotDlls=TotDlls+'+sqlgeneral3.fieldbyname('TotDlls').asstring+
        ' where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'" ',1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
    querys('DROP TABLE IF EXISTS tmpComVend2'+frmprincipal.idmaq,1,sqlgeneral3);

    //RECUPERACION DE BAJA
    querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend3'+frmprincipal.idmaq+' SELECT  distinct count(tp.nombre) as total,u.codigo '+
           'as code, tp.nombre as nom FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
           'LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont)'+
           'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN oportunidades as o '+
           'on(o.cuenta=c.idcliente) LEFT JOIN agenda_vendedores as av on av.idoportunidad = o.idoportunidad '+
           'WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and p.estatus in(3,4) and '+
           'av.fecha_cierre between "'+dfecha1.text+'" and "'+dfecha2.text+'" and (c.FechaCancelacion <> '+
           '"0000-00-00") and (c.FechaCancelacion < st_date) and tp.instalacion =1 and tp.nombre '+
           'in("CONEXION","ENLACES","RECONEXION","EQUIPO","RECUPERACION POR BAJA" ) and con.estatus=1 and '+
           'o.estatus = "CLIENTE" group by u.codigo order by total desc',1,sqlgeneral3);

    querys('Select total,  cantidad,  code as codigo from tmpComVend3'+frmprincipal.idmaq+' left join Comisiones as cm on (total between de and a) where cm.UnidadNegocio ="CUENTAS" ' , 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set norecu="'+sqlgeneral3.fieldbyname('total').asstring+
             '", recu=('+sqlgeneral3.fieldbyname('cantidad').asstring+
             ') where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
    querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);

    //CUENTAS NUEVAS
    querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend3'+frmprincipal.idmaq+' SELECT  distinct count(tp.nombre) as total,u.codigo as code, tp.nombre as nom  '+
           'FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) '+
           'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) WHERE p.FechaRemision between '+
           '"'+dfecha1.text+'" and "'+dfecha2.text+'" and p.estatus in(3,4) and tp.instalacion =1 and tp.nombre in("CONEXION","ENLACES","RECONEXION","EQUIPO","RECUPERACION POR BAJA" ) and con.estatus=1  '+
           'and tp.CuentaNueva = 1 group by u.codigo order by total desc',1,sqlgeneral3);
    querys('Select total,  cantidad,  code as codigo from tmpComVend3'+frmprincipal.idmaq+' left join Comisiones as cm on (total between de and a) where cm.UnidadNegocio ="CUENTAS" ' , 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set noctasnvas="'+sqlgeneral3.fieldbyname('total').asstring+
             '", ctasnvas=('+sqlgeneral3.fieldbyname('cantidad').asstring+
             ') where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
    querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);

    //CCTV
    querys('DROP TABLE IF EXISTS tmpComVend7'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend7'+frmprincipal.idmaq+' SELECT distinct p.idinstal, p.idpedido, round(sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)),2) as ToTDlls, '+
           'round(if(tp.comisiones = 1,p.TipoCambio,0), 2) as TipoCambio, u.codigo, left(tp.nombre,4) as Oport FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN '+
           'articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and p.estatus in(3,4) and tp.instalacion =1 and a.idlinea = 4 '+
           'and left(tp.nombre,4) = "CCTV"'+
           'GROUP BY dp.idpedido Order by codigo, oport',1,sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend8'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend8'+frmprincipal.idmaq+' select distinct p.idpedido, round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
           'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
           'ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaRemision between "'+dfecha1.text+'" and "'+dfecha2.text+'" and tp.instalacion =1  and a.idlinea = 4  '+
           'and left(tp.nombre,4) = "CCTV"'+
           'GROUP BY dnc.idpedido',1,sqlgeneral3);

    //INSERTA COMISIONES KARDEX CCTV
    if ckCierreComisiones.Checked = true then
    querys('Insert into ComisionesKardex (idusuario, idpedido, idunidadnegocio, '+
           'TotDlls, mes, ano, commes, movimiento, tipocomision) select u.idusuario, t.idpedido, p.idunidadnegocio, '+
           't.ToTDlls - if(t1.ToTDlls is null, 0,t1.ToTDlls) AS TotDlls, month("'+dfecha1.text+'"), month("'+dfecha1.text+'"), '+
           'year("'+dfecha1.text+'"), 0, "VTADLLS" FROM tmpComVend7'+frmprincipal.idmaq+' as t LEFT JOIN tmpComVend8'+
           frmprincipal.idmaq+'  as t1 ON(t.idpedido=t1.idpedido) LEFT JOIN usuarios as u on u.codigo=t.codigo '+
           'left join pedidos as p on t.idpedido=p.idpedido '+
           'where u.idpuesto=1 having TotDlls <> 0 '+
           'order by t.codigo, t.oport', 1, sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend9'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend9'+frmprincipal.idmaq+' select t.codigo, sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)) AS TotDlls, if(oport="CCTV", sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)), 0) as cctv '+
           'FROM tmpComVend7'+frmprincipal.idmaq+' as t LEFT JOIN tmpComVend8'+frmprincipal.idmaq+' as t1 ON(t.idpedido=t1.idpedido) group by t.codigo, oport order by t.codigo, oport',1,sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend7'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('DROP TABLE IF EXISTS tmpComVend8'+frmprincipal.idmaq,1,sqlgeneral3);

    querys('select codigo, cctv, cantidad, (cctv*cantidad)/100 as com from tmpComVend9'+frmprincipal.idmaq+' as t left join Comisiones as c on c.UnidadNegocio = "CCTV" where cctv between de and a', 0, sqlgeneral3);

    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set cctv='+
             sqlgeneral3.fieldbyname('cctv').asstring+', Pcctv='+sqlgeneral3.fieldbyname('cantidad').asstring+', Totalcctv='+
             sqlgeneral3.fieldbyname('com').asstring+'*'+floattostr(tc)+' where codigo ="'+
             sqlgeneral3.fieldbyname('codigo').asstring+'"',1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
    querys('DROP TABLE IF EXISTS tmpComVend9'+frmprincipal.idmaq,1,sqlgeneral3);


    //VENTA EN DLLS
    querys('Select codigo,cantidad,if(TotDlls between de and a, (TotDlls*cantidad)/100, 0) as com from TmpComFin'+
          frmprincipal.idmaq+' as t join Comisiones where UnidadNegocio = "VENTA" having com <> 0', 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set PCom='+sqlgeneral3.fieldbyname('cantidad').asstring+
             ', ComVtaDlls= round('+sqlgeneral3.fieldbyname('com').asstring+'*'+floattostr(tc)+',2) where codigo ="'+
             sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;

    //MAS DE 5000
    querys('Select codigo, if(TotDlls between de and a, cantidad, 0) as com from TmpComFin'+
          frmprincipal.idmaq+' as t join Comisiones where UnidadNegocio = "BONO" having com <> 0', 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set B5000Dlls='+sqlgeneral3.fieldbyname('com').asstring+' where codigo ="'+
             sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;

    //CARGOS AUTOMATICOS
    querys('DROP TABLE IF EXISTS tmpComVend4'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend4'+frmprincipal.idmaq+' SELECT  distinct count(tp.nombre) as total,u.codigo as code, tp.nombre as nom, cm.cantidad '+
           'FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) '+
           'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN DetClientes as dc on dc.idcliente =c.idcliente join Comisiones as cm WHERE p.FechaRemision between '+
           '"'+dfecha1.text+'" and "'+dfecha2.text+'" and p.estatus in(3,4) and  tp.instalacion =1 and tp.nombre in("CONEXION","ENLACES","RECONEXION","EQUIPO") and con.estatus=1 and cm.UnidadNegocio ="CARGOS AUTOMATICOS" '+
           'and flcargo = 1 group by u.codigo order by total desc',1,sqlgeneral3);
    querys('Select total, code as codigo, cantidad from tmpComVend4'+frmprincipal.idmaq, 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update TmpComFin'+frmprincipal.idmaq+' set CgoAut=('+sqlgeneral3.fieldbyname('total').asstring+'*'+
             sqlgeneral3.fieldbyname('cantidad').asstring+
             ') where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
    querys('DROP TABLE IF EXISTS tmpComVend4'+frmprincipal.idmaq,1,sqlgeneral3);

    //MAS CUENTAS NUEVAS
    querys('Select codigo, max(noctasnvas) as mas, 1 as d from TmpComFin'+frmprincipal.idmaq+' group by d', 0, sqlgeneral);
    m := sqlgeneral.fieldbyname('mas').asstring;
    if m <> '0' then
      begin
      querys('select round(cantidad/count(codigo),2) as total from TmpComFin'+frmprincipal.idmaq+' join Comisiones where noctasnvas='+m+' and UnidadNegocio="BONO MAS CUENTAS"', 0, sqlgeneral);
      querys('Update TmpComFin'+frmprincipal.idmaq+' set MasCtaNva=('+sqlgeneral.fieldbyname('total').asstring+') where noctasnvas ='+m, 1, sqlgeneral4);
      end;

    //Obtiene el Subtotal
    querys('Update TmpComFin'+frmprincipal.idmaq+' set TotalCom =(camb + recbaja + enla + cone + reco + ctasnvas + ComVtaDlls + CgoAut + B5000Dlls + MasCtaNva + CtaReco + Totalcctv)', 1, sqlgeneral3);

    if ckCierreComisiones.Checked = true then
      begin
      querys('Insert into ComisionesVendedores (codigo, nombre, mes, `ano`, nocamb, camb, norecbaja, recbaja, noenla, '+
             'enla, norecu, recu, nocone, cone, noreco, reco, noctasnvas, ctasnvas, tc, TotDlls, PCom, ComVtaDlls, '+
             'CgoAut, B5000Dlls, MasCtaNva, CtaReco, cctv, Pcctv, Totalcctv, TotalCom, cerrado) '+
             'Select codigo, nombre, month("'+dfecha1.text+'"), year("'+dfecha1.text+'"), nocamb, camb, norecbaja, recbaja, noenla, '+
             'enla, norecu, recu, nocone, cone, noreco, reco, noctasnvas, ctasnvas, tc, TotDlls, PCom, ComVtaDlls, '+
             'CgoAut, B5000Dlls, MasCtaNva, CtaReco, cctv, Pcctv, Totalcctv, TotalCom, 1 from TmpComFin'+frmprincipal.idmaq, 1, sqlgeneral8);

      querys('Delete from ComisionesKardex where ComisionesKardex.idusuario in(select codigo from ComisionesVendedores where PCom = 0 and mes= month("'+dfecha1.text+'") and ano=year("'+dfecha1.text+'"))  and mes= month("'+dfecha1.text+'") and ano=year("'+dfecha1.text+'")', 1, sqlgeneral7);

      querys('Insert into ComisionesKardex ( idusuario,  idpedido, idpago, idunidadnegocio, tipocomision, cargo, abono, '+
             'restante, movimiento, mes, ano, commes, TotalComision, pcom, TC, TotDlls) Select distinct  u.idusuario, k.idpedido, pc.idpago, '+
             'k.idunidadnegocio, "VTADLLS", 0, '+
             'round(if(moneda = "P", pc.abono/pc.TipoCambio, pc.abono),2) as abono, '+
             'round(if(moneda = "P", pc.abono/pc.TipoCambio, pc.abono),2)*-1 as restante, '+
             '2, month("'+dfecha2.text+'") as mes, year("'+dfecha1.text+'") as ano, c.mes, if(un.nombre="CCTV", c.Totalcctv,c.ComVtaDlls) as TotalComision, '+
             'if(un.nombre="CCTV", c.Pcctv, c.PCom) as pcom, c.TC, k.TotDlls as TotPed '+
             'from ComisionesKardex as k left join usuarios as u on k.idusuario=u.idusuario left join ComisionesVendedores as c '+
             'on u.codigo=c.codigo and k.mes=c.mes left join PagosClientes as pc on pc.idpedido=k.idpedido left join UnidadNegocio as un '+
             'on un.idunidadnegocio=k.idunidadnegocio where pc.FechaAlta between "'+
             dfecha1.text+'" and "'+dfecha2.text+'" and pc.movimiento in (2,5) group by idpago order by u.codigo, k.idpedido, idpago', 1, sqlgeneral8);
        end;
    querys('delete from TmpComFin'+frmprincipal.idmaq+' where codigo in (select codigo from usuarios where idpuesto=41)',1,dmreportes.sqlgeneral);
    querys('select *, "'+dfecha1.text+'" as f1, "'+dfecha2.text+'" as f2 from TmpComFin'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
    Screen.Cursor := crDefault;
    end
  else  // si esta cerrado
    begin
    querys('delete from ComisionesVendedores where codigo in (select codigo from usuarios where idpuesto=41)',1,dmreportes.sqlgeneral);
    querys('select *, "'+dfecha1.text+'" as f1, "'+dfecha2.text+'" as f2 from ComisionesVendedores where mes = month("'+dfecha1.text+'") and ano = year("'+dfecha1.text+'")', 0, dmreportes.sqlgeneral);
    end;
//
     //  VENDEDORES DE CASA (SUBREPORTE) <======================================
     ComisionesVendedoresCasa;

     OperacionReporte('ComisionesVendedoresTodos','Reporte de comisiones vendedores',TipoImpresion, 1);
  if (ckCierreComisiones.Checked = true) or (cerrado = true) then
    begin                                                                                                                               
    querys('Select distinct "'+meses[monthof(strtodate(dfecha1.text))]+'" as periodo, u.idusuario, '+UsuarioNombre('u')+' as nombre, '+
           'k.pcom, c.TC, k.TC as KTC, '+
           'k.commes as mes, k.idpedido, k.idpago, c.TotDlls as BaseVtaDlls, '+
           'round(c.ComVtaDlls/c.TC,2) as ComDlls, c.ComVtaDlls as ComPesos, k.TotDlls as PedidoTotDlls, '+
           'round(((k.TotDlls*k.PCom)/100)*k.TC,2) as ComXPedido, k.abono, round((k.abono/p.TotDlls)*100,2) as PedPorcPago, '+
           'round((((k.TotDlls*k.PCom)/100)*k.TC) * (k.abono/p.TotDlls),2) as ComPpago from ComisionesKardex as k left join '+
           'usuarios as u on k.idusuario=u.idusuario left join ComisionesVendedores as c on u.codigo=c.codigo and k.mes=c.mes '+
           'left join pedidos as p on p.idpedido=k.idpedido '+
           'where k.idpedido in(Select distinct idpedido from ComisionesKardex left join UnidadNegocio as u on '+
           'u.idunidadnegocio=ComisionesKardex.idunidadnegocio where mes = month("'+dfecha1.text+'") and movimiento in(2,5) and u.nombre <> "CCTV") '+
           'and k.movimiento=2 and k.mes = month("'+dfecha1.text+'") order by  u.idusuario, k.mes desc, k.idpedido asc', 0, sqlgeneral2);

    querys('Select distinct "'+meses[monthof(strtodate(dfecha1.text))]+'" as periodo, u.idusuario, '+UsuarioNombre('u')+' as nombre, k.pcom, c.TC, k.TC as KTC, k.commes as mes, k.idpedido, '+
           'k.idpago, c.cctv as BaseVtaDlls, round((c.cctv*k.Pcom)/100,2) as ComDlls, k.TotalComision as ComPesos, k.TotDlls as '+
           'PedidoTotDlls, round(((k.TotDlls*k.PCom)/100)*k.TC,2) as ComXPedido, k.abono, round((k.abono/p.TotDlls)*100,2) as PedPorcPago, '+
           'round((((k.TotDlls*k.PCom)/100)*k.TC) * (k.abono/p.TotDlls),2) as ComPago from ComisionesKardex as k left join usuarios as u on '+
           'k.idusuario=u.idusuario left join ComisionesVendedores as c on u.codigo=c.codigo and k.mes=c.mes '+
           'left join pedidos as p on p.idpedido=k.idpedido '+
           'where k.idpedido '+
           'in(Select distinct idpedido from ComisionesKardex as k left join UnidadNegocio as u on u.idunidadnegocio=k.idunidadnegocio '+
           'where mes = month("'+dfecha1.text+'") and movimiento in(2,5) and u.nombre = "CCTV") and k.movimiento=2 and k.mes = month("'+
           dfecha1.text+'") order by  u.idusuario, k.mes desc, k.idpedido asc', 0, sqlgeneral3);

    OperacionReporte('ComisionesVendedoresdDetPagos','Reporte de Comisiones Vendedores Detalle por Pagos',TipoImpresion, 1);
    end;

     querys('DROP TABLE IF EXISTS TmpComFin'+frmprincipal.idmaq,1,sqlgeneral3);

  end;
end;   // 100  500


procedure Tfrmmoduloreportes.OxxosAPAA(dfecha1,dfecha2, activacion:string);
var  m1, m2:Word;
cadena2:String;
i:Integer;
begin
OxxosAPAAFA(dfecha1,dfecha2, activacion, edano.Text);
m1 := MonthOf(strtodate(dfecha1));
m2 := MonthOf(strtodate(dfecha2));
  for i:= m1 to m2 do
    begin
    case i of
       1: begin cadena2 := cadena2+'sum(M1) as M1, ';   end;
       2: begin cadena2 := cadena2+'sum(M2) as M2, ';   end;
       3: begin cadena2 := cadena2+'sum(M3) as M3, ';   end;
       4: begin cadena2 := cadena2+'sum(M4) as M4, ';   end;
       5: begin cadena2 := cadena2+'sum(M5) as M5, ';   end;
       6: begin cadena2 := cadena2+'sum(M6) as M6, ';   end;
       7: begin cadena2 := cadena2+'sum(M7) as M7, ';   end;
       8: begin cadena2 := cadena2+'sum(M8) as M8, ';   end;
       9: begin cadena2 := cadena2+'sum(M9) as M9, ';   end;
      10: begin cadena2 := cadena2+'sum(M10) as M10, '; end;
      11: begin cadena2 := cadena2+'sum(M11) as M11, '; end;
      12: begin cadena2 := cadena2+'sum(M12) as M12, '; end;
      end;
    end;
OperacionReporte('ResAPAAFA', 'Resumen de Activaciones', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.TiemposExtras;
begin
querys('select sid, CodTecnico, concat(usuarios.nombre, " ", usuarios.apaterno, " ", usuarios.amaterno) as nombre,fecha_inicio, FechaFinUsr, hora_inicio, HoraFinUsr, '+
       'if(minute(HoraFinUsr)-minute(hora_inicio) is null, (hour(HoraFinUsr)-hour(hora_inicio))*60, (hour(HoraFinUsr)-hour(hora_inicio))*60)+(minute(HoraFinUsr)-minute(hora_inicio)) as totmins, '+
       'if(((if(minute(HoraFinUsr)-minute(hora_inicio) is null, (hour(HoraFinUsr)-hour(hora_inicio))*60, (hour(HoraFinUsr)-hour(hora_inicio))*60)+(minute(HoraFinUsr)-minute(hora_inicio)))-30)/30<=0, "0", '+
       'round(((if(minute(HoraFinUsr)-minute(hora_inicio) is null, (hour(HoraFinUsr)-hour(hora_inicio))*60, (hour(HoraFinUsr)-hour(hora_inicio))*60)+(minute(HoraFinUsr)-minute(hora_inicio)))-30)/30, 2)) as tickets '+
       'from servicios left join usuarios on (usuarios.codigo2=servicios.CodTecnico) where fecha_inicio between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" order by CodTecnico', 0, dmreportes.sqlgeneral);
end;

procedure Tfrmmoduloreportes.InstPendFact;
begin
querys('Select idpedido, idcliente, saldo, idinstal, FechaRemision as FechaCreacion, FechaVencimiento  from pedidos where instpend = 1 and FechaRemision between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'"', 0, dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount > 0 then
  OperacionReporte('InstPendFact', 'Instalaciones con Factura Pendiente de Pago', TipoImpresion, 1)
else
  application.MessageBox('No hay Registros a mostrar', 'Aviso', MB_ICONINFORMATION);
end;

procedure Tfrmmoduloreportes.ResumenPositivos;
begin
case rgrespos.ItemIndex of
  0: begin
    querys('Drop table if exists tmpPositivosCol'+frmprincipal.idmaq, 1, sqlgeneral);
    querys('Create table tmpPositivosCol'+frmprincipal.idmaq+' select col.nombre, '+
           'if(month(fecha_pc) = 1, count(id), 0) as M1, if(month(fecha_pc) = 2, count(id), 0) as M2, if(month(fecha_pc) = 3, count(id), 0) as M3, '+
           'if(month(fecha_pc) = 4, count(id), 0) as M4, if(month(fecha_pc) = 5, count(id), 0) as M5, if(month(fecha_pc) = 6, count(id), 0) as M6, '+
           'if(month(fecha_pc) = 7, count(id), 0) as M7, if(month(fecha_pc) = 8, count(id), 0) as M8, if(month(fecha_pc) = 9, count(id), 0) as M9, '+
           'if(month(fecha_pc) = 10, count(id), 0) as M10, if(month(fecha_pc) = 11, count(id), 0) as M11, if(month(fecha_pc) = 12, count(id), 0) as M12 '+
           'from  sk_alarmas as sk left join clientes as c on c.idcliente=sk.idcliente left join colonias as col on col.idcol=c.idcol where sk.fecha_pc between "'+
           datetostr(EncodeDate(strtoint(edano.text),1,1))+'" and "'+datetostr(date)+'" and sk.conclusion = 1 group by month(fecha_pc), c.idcol', 1, sqlgeneral);

    querys('select nombre, (sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) +sum(M7) +sum(M8) +sum(M9) +sum(M10) +sum(M11) +sum(M12)) as total, '+
         'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, '+
         'sum(M10) as M10, sum(M11) as M11, sum(M12) as M12 from tmpPositivosCol'+frmprincipal.idmaq+' group by nombre order by total desc', 0, dmreportes.sqlgeneral);
    OperacionReporte('ResPosColonia', 'Resumen de Positivos por Colonia', TipoImpresion, 1);

    querys('Drop table if exists tmpPositivosCol'+frmprincipal.idmaq, 1, sqlgeneral);
    end;
  1: begin
     PositivosHoras(False, edano.text);
     OperacionReporte('ResPosHora', 'Resumen de Positivos por Hora', TipoImpresion, 1);
     end;
  2: begin
     PositivosDias(False, edano.text);
     OperacionReporte('ResPosDia', 'Resumen de Positivos por Dia', TipoImpresion, 1);
     end;
  3: begin
     querys('Select cl.nombre, sum(a.total) as total, sum(a.M1) as M1, sum(a.M2) as M2, sum(a.M3) as M3, sum(a.M4) as M4, sum(a.M5) as M5, sum(a.M6) as M6, '+
            'sum(a.M7) as M7, sum(a.M8) as M8, sum(a.M9) as M9, sum(a.M10) as M10, sum(a.M11) as M11, sum(a.M12) as M12 from ActivOxxo as a '+
            'left join clientes as c on a.idcliente=c.idcliente left join colonias as cl on cl.idcol=c.idcol where conclusion = 1 '+
            'and year = '+edano.text+' group by cl.idcol order by total desc', 0, dmreportes.sqlgeneral);
     OperacionReporte('ResPosColonia', 'Resumen de Positivos por Hora', TipoImpresion, 1);
     end;

  4: begin
     PositivosHoras(True, edano.text);

     OperacionReporte('ResPosHora', 'Resumen de Positivos por Hora', TipoImpresion, 1);
     end;
  5: begin
     PositivosDias(True, edano.text);
     OperacionReporte('ResPosDia', 'Resumen de Positivos por Dia', TipoImpresion, 1);
     end;
  end;
end;

procedure Tfrmmoduloreportes.edanoKeyPress(Sender: TObject; var Key: Char);
begin
key := validanumeros(key, false);
end;

procedure Tfrmmoduloreportes.CentralerosTickets;
var tiempo :TTime; usuario,tipo, tim:string; t,i:integer;
begin
tiempo := strtotime('00:00:00');
case rgRepCentraleros.ItemIndex of
  0: begin
      querys('Drop table if exists tmpcenttiempo'+frmprincipal.idmaq, 1, sqlgeneral);
      querys('create table tmpcenttiempo'+frmprincipal.idmaq+' select '+
            'sk.idcliente as cuenta, sk.cliente as nomcliente, min(fecha) as fi,max(hora) as ht, max(fecha) as ft,min(hora) as hi, '+
            ' ad.user, if(min(fecha) <> max(fecha), addtime(timediff("24:00:00", max(hora)), min(hora)), '+
            ' timediff(max(hora), min(hora))) as dif, "00:00:00" as suma, "00:00:00" as prom,'+
            ' ac.status as tipo from sk_alarmas as sk left join alarmas_detalle as ad on ad.aid=sk.id '+
            ' left join alarmas_conclusion as ac on ac.id=sk.conclusion  where fecha_pc between "'+datetostr(tpdesde.date)+
            '" and  "'+datetostr(tphasta.date)+'"  and ad.did is not null and sk.user<>"" and ac.status<>"" '+
            'and sk.conclusion not in(5,7,10) '+
            'group by aid,tipo,user', 1, sqlgeneral);
      querys('Alter table tmpcenttiempo'+frmprincipal.idmaq+' add mins double default 0.00',1,sqlgeneral);
      i:=0;  t:=0;
      querys('Select user,tipo, dif, time_to_sec(dif) as m from tmpcenttiempo'+frmprincipal.idmaq+' order by user,tipo', 0, sqlgeneral);
      sqlgeneral.first;
      usuario := sqlgeneral.fieldbyname('user').AsString;
      tipo:=sqlgeneral.fieldbyname('tipo').asstring;
      while not sqlgeneral.Eof = true do
      begin
         if (usuario <> sqlgeneral.fieldbyname('user').AsString) or (tipo<>sqlgeneral.FieldByName('tipo').AsString) then
         begin
            querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set suma = "'+timetostr(tiempo)+'" , mins = '+inttostr(t)+' where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
            querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set prom =round(mins/'+inttostr(i)+', 2) where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
            i:=0;
            tiempo:= strtotime('00:00:00');
            t:=0
         end;
         tiempo := tiempo + strtotime(FormatDateTime('HH:nn:ss',strtotime(sqlgeneral.fieldbyname('dif').Asstring)));
         tim := timetostr(tiempo);
         t:= t+sqlgeneral.fieldbyname('m').AsInteger;
         usuario := sqlgeneral.fieldbyname('user').AsString;
         tipo:=sqlgeneral.fieldbyname('tipo').asstring;
         inc(i);
         sqlgeneral.Next;
      end;
      querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set suma = "'+timetostr(tiempo)+'", mins = '+inttostr(t)+'  where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
      querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set prom =round(mins/'+inttostr(i)+', 2) where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
      querys('select count(ft) as total,t.mins/60 as mins,t.prom/60 as prom, u.codigo as user, t.*, "Del '+datetostr(tpdesde.date)+' al '+datetostr(tphasta.date)+'" as periodo, '+UsuarioNombre('u')+' as nombre from tmpcenttiempo'+frmprincipal.idmaq+' as t '+
            'left join UCTabUsers uc on uc.UCLogin=t.user left join usuarios as u on u.idusuario=uc.UCIdUser '+
            'group by nombre,tipo order by nombre,t.tipo', 0, dmreportes.sqlgeneral);

     end;

  1: begin        //CentralerosTickets
     querys('Drop table if exists tmpTicketsCentraleros'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create table tmpTicketsCentraleros'+frmprincipal.idmaq+' select nomop as codigo, count(sid) as tickets, '+UsuarioNombre('u')+' as nombre, " De '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+
            '" as fecha, 0 as fe from servicios as s left join usuarios as u on s.nomop=u.codigo left join areas as a on a.idarea=u.idarea '+
            'where s.fecha_creacion between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and a.idarea = 4 '+
            'and s.nomop <> "" group by s.nomop order by tickets desc', 1, sqlgeneral);

     querys('select user as codigo, count(id) as fe from sk_alarmas where fecha_pc between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and conclusion = 3 group by user ', 0, sqlgeneral);
     sqlgeneral.First;
     while not sqlgeneral.Eof = true do
       begin
       querys('Update tmpTicketsCentraleros'+frmprincipal.idmaq+' set fe ='+sqlgeneral.fieldbyname('fe').AsString+' where codigo = "'+sqlgeneral.fieldbyname('codigo').AsString+'"', 1, dmreportes.sqlgeneral6);
       sqlgeneral.next;
       end;
     querys('Select *, fe-tickets as dif from tmpTicketsCentraleros'+frmprincipal.idmaq+' order by fe desc', 0, dmreportes.sqlgeneral);
     end;
  2: CentralerosTicketsDet(datetostr(tpdesde.date), datetostr(tphasta.date));

  3: masdedostickets(datetostr(tpdesde.date), datetostr(tphasta.date), 0);

  4: querys('Select al.idcliente, al.cliente, t.nombre as patrullero, al.fecha_pc '+
           'From sk_alarmas AS al Inner Join tiempo_respuesta AS t ON al.id = t.aid Where '+
           't.servicio = "1" AND al.fecha_pc Between "'+formatdatetime('yyyy""/""mm""/""dd',tpdesde.Date)+'" AND "'+formatdatetime('yyyy""/""mm""/""dd',tphasta.Date)+'" order by patrullero',0,DMREPORTES.sqlgeneral);
  end; //case
end;


procedure Tfrmmoduloreportes.larticulosActivosClick(Sender: TObject);
begin
querys('Select cod_cve, nombre, tinstalacion, tinstalacioncom, iva, costo, precioa, piezasxunidad, '+
       'existencia, ordenados, apartado, backorder, minimo, maximo, `status` From articulos '+
       'Where `status` = 1 order by cod_cve', 0, dmreportes.sqlgeneral);
OperacionReporte('ArticulosCat', 'Catalogo de Articulos', TipoImpresion, 1);

end;

procedure Tfrmmoduloreportes.Bitacora;
var fecha1, fecha2:string;
begin
fecha1:= vartostr(yearof(tpdesde.Date));
if monthof(tpdesde.Date) < 10 then
  fecha1 := fecha1+'0'+vartostr(monthof(tpdesde.Date))
else
  fecha1 := fecha1+vartostr(monthof(tpdesde.Date));

if dayof(tpdesde.Date) < 10 then
  fecha1 := fecha1+'0'+vartostr(dayof(tpdesde.Date))
else
  fecha1 := fecha1+vartostr(dayof(tpdesde.Date));

fecha2:= vartostr(yearof(tphasta.Date));
if monthof(tpdesde.Date) < 10 then
  fecha2 := fecha2+'0'+vartostr(monthof(tphasta.Date))
else
  fecha2 := fecha2+vartostr(monthof(tphasta.Date));

if dayof(tphasta.Date) < 10 then
  fecha2 := fecha2+'0'+vartostr(dayof(tphasta.Date))
else
  fecha2 := fecha2+vartostr(dayof(tphasta.Date));



if querys('Select '+UsuarioNombre('u')+' as nombre,ul.MSG,concat( left(ul.Data,4),"/",substring(ul.data,5,2),"/",substring(ul.Data,7,2)) as '+
       'fecha, if(ul.Nivel=0,"Bajo",if(ul.Nivel=1,"Normal",if(ul.Nivel=2,"Alto","Critico"))) as nivel, '+
       '"De '+ datetostr(tpdesde.Date)+' A '+datetostr(tphasta.Date)+'" as periodo '+
       'From usuarios AS u Left Join puestos AS p ON u.idpuesto = p.idpuesto Left Join areas AS a ON u.idarea = a.idarea '+
       'Left Join UCLog AS ul ON u.idusuario = ul.IdUser Left Join UCTabUsers AS ut ON ul.IdUser = ut.UCIdUser '+
       'Where ut.UCLogin = "'+eduser.text+'" AND left(ul.`Data`,8) Between "'+fecha1+'" AND "'+fecha2+'" '+
       'Order By ul.Data',0,dmreportes.sqlgeneral) > 0 then

        operacionreporte('BitacoraUsuarios','BitacoraUsuarios',TipoImpresion,1)
else
  application.messagebox('No se encontraron Datos', 'Aviso', MB_ICONINFORMATION);

end;


procedure Tfrmmoduloreportes.lbcatcolClick(Sender: TObject);
begin
frmmensaje.Show;
frmmensaje.Update;
querys('select distinct(dir) as calle, col.nombre from clientes as c left join colonias as col '+
       'on c.idcol=col.idcol order by col.nombre, dir', 0, dmreportes.sqlgeneral);
frmmensaje.Close;
OperacionReporte('Calles', 'Calles por Colonia', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.MovimientosCSI;
begin
if querys('Select c.idcliente, c.rsocial, p.idpedido, pc.idpago, pc.notas, pc.cargo, pc.abono, pc.restante, '+
       '"De '+datetostr(tpdesde.date)+' a '+datetostr(tphasta.date)+'" as periodo, pc.FechaAlta, '+
       'if(pc.movimiento =7, "DEDUCCION POR CUENTA IDENTIFICADA", "PAGO DE CUENTA IDENTIFICADA") as mov '+
       'from PagosClientes as pc left join pedidos as p on p.idpedido=pc.idpedido left join clientes as c '+
       'on c.idcliente=p.idcliente where p.FechaRemision between "'+datetostr(tpdesde.date)+'" and "'+
       datetostr(tphasta.date)+'" and pc.movimiento in(7,8) order by pc.movimiento, pc.idpago', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('MovimientosCSI', 'Movimientos de Clientes Sin Identificar', TipoImpresion, 1)
else
  application.MessageBox('No se encontraron registros', 'Atencion', MB_ICONINFORMATION);

end;


procedure Tfrmmoduloreportes.VentasDllsXOrigen;
begin
Screen.Cursor := crHourglass;
with dmreportes do
 begin
    RepVentasMensualesTotalesXOrigen(sqlgeneral,sqlgeneral2,sqlgeneral3,dfecha1.text,dfecha2.text,TipoImpresion);
 end;
end;

procedure Tfrmmoduloreportes.llistadepreciosClick(Sender: TObject);
begin
querys('Select "EQUIPO EN GENERAL" as titulo, cod_cve, cod_prov, a.nombre, precioa, tinstalacion, tinstalacionCom, costo, '+
       'd.nombre as departamento, nacional, moneda From articulos as a left join dptos as d on a.iddpto=d.iddpto where `status` = 1 and '+
       'idlinea = 4 and a.inventariable = 1 order by d.nombre, a.cod_cve', 0, dmreportes.sqlgeneral);

querys('Select ac.cod_paq, ac.cod_cve, ac.cant, if(ap.status = 1, "ACTIVO", if(ap.status=0, "INACTIVO", "PENDIENTE")) '+
       'as estatuspaq,  a.cod_prov, a.nombre, a.precioa, a.tinstalacion, a.tinstalacionCom, a.costo, ap.nombre as paqnom, '+
       'ap.precioa as prepaq, ap.tinstalacion as intpaq, ap.tinstalacionCom as intcompaq, ap.costo as costopaq, "PAQUETES" as '+
       'departamento, a.nacional, a.moneda, if(a.status = 1, "A", if(a.status=0, "I", "P")) as estatus From art_compuestos AS ac '+
       'left join articulos as a on a.cod_cve=ac.cod_cve left join articulos as ap on ap.cod_cve=ac.cod_paq where ap.status = 1 '+
       'and a.inventariable = 1 order by ac.cod_paq, estatus, cod_cve', 0, dmreportes.sqlgeneral2);

OperacionReporte('ListaPrecios', 'Lista de Precios', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.RzURLLabel4Click(Sender: TObject);
begin
querys('Select "EQUIPO CON PRECIO AL PUBLICO" as titulo, cod_cve, cod_prov, a.nombre, precioa, tinstalacion, '+
       'if(d.nombre = "CCTV", "CCTV", "EQUIPO") as departamento From articulos as a left join dptos as d on a.iddpto=d.iddpto '+
       'where `status` = 1 and idlinea = 4 and precioa > 0 order by departamento, a.nombre ', 0, dmreportes.sqlgeneral);

querys('Select ac.cod_paq, ac.cod_cve, ac.cant, if(ap.status = 1, "ACTIVO", if(ap.status=0, "INACTIVO", "PENDIENTE")) '+
       'as estatuspaq,  a.cod_prov, a.nombre, a.precioa, a.tinstalacion, ap.nombre as paqnom, '+
       'ap.precioa as prepaq, ap.tinstalacion as intpaq, "PAQUETES" as '+
       'departamento, a.nacional, a.moneda From art_compuestos AS ac '+
       'left join articulos as a on a.cod_cve=ac.cod_cve left join articulos as ap on ap.cod_cve=ac.cod_paq where ap.status = 1 '+
       'order by ac.cod_paq, nombre', 0, dmreportes.sqlgeneral2);
OperacionReporte('ListaPreciosPublico', 'Lista de Precios con Precio al Publico', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.RzURLLabel8Click(Sender: TObject);
begin
querys('Select "EQUIPO EN GENERAL" as titulo, cod_cve, cod_prov, a.nombre, round((a.costo*factor)/0.9,0) as precioa, tinstalacion, tinstalacionCom, costo, '+
       'd.nombre as departamento, nacional, moneda From articulos as a left join dptos as d on a.iddpto=d.iddpto where `status` = 1 and '+
       'idlinea = 4 and a.inventariable = 1 order by d.nombre, a.cod_cve', 0, dmreportes.sqlgeneral);

querys('Select ac.cod_paq, ac.cod_cve, ac.cant, if(ap.status = 1, "ACTIVO", if(ap.status=0, "INACTIVO", "PENDIENTE")) '+
       'as estatuspaq,  a.cod_prov, a.nombre, a.precioa, a.tinstalacion, a.tinstalacionCom, a.costo, ap.nombre as paqnom, '+
       'round((ap.costo*factor)/0.9,0) as prepaq, ap.tinstalacion as intpaq, ap.tinstalacionCom as intcompaq, ap.costo as costopaq, "PAQUETES" as '+
       'departamento, a.nacional, a.moneda, if(a.status = 1, "A", if(a.status=0, "I", "P")) as estatus From art_compuestos AS ac '+
       'left join articulos as a on a.cod_cve=ac.cod_cve left join articulos as ap on ap.cod_cve=ac.cod_paq left join dptos as d on d.iddpto=ap.iddpto  '+
       'where ap.status = 1 and a.inventariable = 1 order by ac.cod_paq, estatus, cod_cve', 0, dmreportes.sqlgeneral2);

OperacionReporte('ListaPrecios', 'Lista de Precios', TipoImpresion, 1);

end;

procedure Tfrmmoduloreportes.ckCierreComisionesClick(Sender: TObject);
begin
if (frmprincipal.PuestoUsuario <> 'GERENTE') and (ckCierreComisiones.Checked = true) then
  begin
  application.MessageBox('Usted no esta autorizado para realizar el cierre', 'Aviso', MB_ICONEXCLAMATION);
  ckCierreComisiones.Checked := False;
  end;
end;

procedure Tfrmmoduloreportes.cboAntXLineaTipoNotInList(Sender: TObject);
begin
cboAntXLineaTipo.ItemIndex := 0;
end;


procedure Tfrmmoduloreportes.ResistenciaFinLinea(condicion:string);
var titulo:string;
begin

querys('select VW_AGENDACLIENTES.*,FinLinea from VW_AGENDACLIENTES left join clientes as c on(c.idcliente =VW_AGENDACLIENTES.id) where FinLinea='+condicion,0,dmreportes.sqlgeneral2);
if(condicion ='1' ) then
        titulo := 'CON'
else
        titulo := 'SIN';

querys('Select "Reporte de cuentas '+titulo+' Resistencia Fin de Linea." as Titulo',0,dmreportes.sqlgeneral3);


end;


procedure Tfrmmoduloreportes.RzURLLabel5Click(Sender: TObject);
begin
ResistenciaFinLinea('1');
 if(dmreportes.sqlgeneral2.RecordCount > 0) then
     OperacionReporte('RepCuentasFinLinea', 'Clientes Resistencia Fin de Linea', TipoImpresion, 1)
 else
     application.MessageBox('No hay datos a mostrar', 'Aviso', MB_ICONEXCLAMATION);
end;

procedure Tfrmmoduloreportes.RzURLLabel6Click(Sender: TObject);
begin
  ResistenciaFinLinea('0');
 if(dmreportes.sqlgeneral2.RecordCount > 0) then
     OperacionReporte('RepCuentasFinLinea', 'Clientes Resistencia Fin de Linea', TipoImpresion, 1)
 else
     application.MessageBox('No hay datos a mostrar', 'Aviso', MB_ICONEXCLAMATION);
end;

procedure Tfrmmoduloreportes.lbestadisticaservClick(Sender: TObject);
var
   hija:tform; i:integer;
begin
   if BuscaForma(Tfrmreporteestadisticas.ClassName)=1 then
   begin
      for i:=0 to screen.FormCount-1 do
      begin
         if screen.Forms[i].Name='frmreporteestadisticas' then
         begin
            screen.Forms[i].show;
            exit;
         end;
      end;
   end
   else
   begin
      hija:=Tfrmreporteestadisticas.Create(nil);
      hija.Height:=188;
      hija.Width:=297;
      hija.Left := 220;
      hija.Top := 220;
      hija.Show;
   end;
end;
procedure Tfrmmoduloreportes.lbestadisticaservMouseLeave(Sender: TObject);
begin
        lbestadisticaserv.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbestadisticaservMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     lbestadisticaserv.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbpromediopatClick(Sender: TObject);
function FDOM(Date: TDateTime): TDateTime;
  var
    Year, Month, Day: Word;
 begin
    DecodeDate(Date, Year, Month, Day);
    Result := EncodeDate(Year, Month, 1);
 end;

 function LDOM(Date: TDateTime): TDateTime;
  var
    Year, Month, Day: Word;
 begin
    DecodeDate(Date, Year, Month, Day);
    if Month < 12 then
      inc(Month)
    else
    begin
      Month := 1;
      inc(Year)
    end;
    Result := EncodeDate(Year, Month, 1) - 1;
 end;
var primeromes,finmes:TDateTime; dia,wks,contador:integer; cadena:string;
begin
   cadena:='';
   contador:=0;
   primeromes:=FDOM(Now);
   finmes:=LDOM(Now);
   repeat
      // si dia=2 es Lunes
      dia:=DayOfWeek(primeromes);
      if dia<>2 then
      begin
         primeromes:=primeromes+1;
         if dia<>1 then
            inc(contador);
      end;
   until dia=2;
   if contador>3 then
   begin
      primeromes:=FDOM(Now);
      repeat
         dia:=DayOfWeek(primeromes);
         if dia<>2 then
            primeromes:=primeromes-1;
      until dia=2;
   end;
   contador:=0;
   //definir el ultimo dia del mes
   repeat
      dia:=DayOfWeek(finmes);
      if dia<>1 then
      begin
         finmes:=finmes-1;
         inc(contador);
      end;
   until dia=1;
   if contador>2 then
   begin
      finmes:=LDOM(Now);
      repeat
         dia:=DayOfWeek(finmes);
         if dia<>1 then
            finmes:=finmes+1;
      until dia=1;
   end;
   wks:=round(WeekSpan(primeromes,finmes));
   with dmreportes do
   begin
      if wks=4 then
      begin
         {cadena:='select t1.nombre,t1.promedio as p1, if (t2.promedio is null, "0",t2.promedio) as p2,if(t3.promedio is null,"0",t3.promedio) as p3, if(t4.promedio is null, "0", t4.promedio) as p4,'+
             ' t1.turno,t1.periodo as per1, if( t2.periodo is null , "del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'",t2.periodo) as per2, if( t3.periodo is null , '+
             ' "del '+inttostr(DayOf(primeromes+14))+' al '+inttostr(DayOf(primeromes+14))+'",t3.periodo) as per3,if( t4.periodo is null , "del '+inttostr(DayOf(primeromes+21))+' al '+inttostr(DayOf(finmes))+'",t4.periodo) as per4, monthname("'+datetostr(date)+'") as mes'+
             ' from'+
             ' (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes))+' al '+inttostr(DayOf(primeromes+6))+'" as periodo,t.idturno'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes)+'" and date_add("'+datetostr(primeromes)+'", INTERVAL 6 DAY) and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t1 left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'" as periodo'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+7)+'" and date_add("'+datetostr(primeromes+7)+'", INTERVAL 6 DAY)  and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t2 on t1.nombre=t2.nombre left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes+14))+' al '+inttostr(DayOf(primeromes+20))+'" as periodo'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+14)+'" and date_add("'+datetostr(primeromes+14)+'", INTERVAL 6 DAY)  and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t3 on t1.nombre=t3.nombre left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes)+21)+' al '+inttostr(DayOf(finmes))+'" as periodo'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+21)+'" and "'+datetostr(finmes)+'" and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t4 on t1.nombre=t4.nombre order by idturno,nombre';            }

      cadena := 'select t1.nombre,t1.promedio as p1, if (t2.promedio is null, "0",t2.promedio) as p2, '+
                'if(t3.promedio is null,"0",t3.promedio) as p3, if(t4.promedio is null, "0", t4.promedio) as p4, '+
                't1.turno, t1.periodo as per1, '+
                'if( t2.periodo is null , "Del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'",t2.periodo) as per2, '+
                'if( t3.periodo is null , "Del '+inttostr(DayOf(primeromes+14))+' al '+inttostr(DayOf(primeromes+20))+'",t3.periodo) as per3, '+
                'if( t4.periodo is null , "del '+inttostr(DayOf(primeromes+21))+' al '+inttostr(DayOf(finmes))+'",t4.periodo) as per4, '+
                'monthname("'+datetostr(primeromes)+'") as mes from ( '+

                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes))+' al '+inttostr(DayOf(primeromes+6))+'" as periodo, t.idturno '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes)+'" and date_add("'+datetostr(primeromes)+'", INTERVAL 6 DAY) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno in(1,2) group by tr.nombre '+
                '  UNION  '+
                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes))+' al '+inttostr(DayOf(primeromes+6))+'" as periodo, t.idturno '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes)+'" and date_add("'+datetostr(primeromes)+'", INTERVAL 7 DAY) '+
                'and (tr.hora >= t.HoraInicio or tr.hora <= t.HoraFin) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno = 3 group by tr.nombre '+
                ') as t1 left join ( '+

                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'" as periodo '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes+7)+'" and date_add("'+datetostr(primeromes+7)+'", INTERVAL 6 DAY) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno in(1,2) group by tr.nombre '+
                '  UNION  '+
                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'" as periodo '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes+7)+'" and date_add("'+datetostr(primeromes+7)+'", INTERVAL 7 DAY) '+
                'and (tr.hora >= t.HoraInicio or tr.hora <= t.HoraFin) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno = 3 group by tr.nombre '+
                ') as t2 on t1.nombre=t2.nombre left join ( '+

                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes)+14)+' al '+inttostr(DayOf(primeromes+20))+'" as periodo '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes+14)+'" and date_add("'+datetostr(primeromes+14)+'", INTERVAL 6 DAY) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno in(1,2) group by tr.nombre '+
                '  UNION  '+
                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes+14))+' al '+inttostr(DayOf(primeromes+20))+'" as periodo '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes+14)+'" and date_add("'+datetostr(primeromes+14)+'", INTERVAL 7 DAY) '+
                'and (tr.hora >= t.HoraInicio or tr.hora <= t.HoraFin) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno = 3 group by tr.nombre '+
                ') as t3 on t1.nombre=t3.nombre left join ( '+

                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes)+21)+' al '+inttostr(DayOf(finmes))+'" as periodo '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes+21)+'" and "'+datetostr(finmes)+'" '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno in(1,2) group by tr.nombre '+
                '  UNION  '+
                'select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, '+
                '"Del '+inttostr(DayOf(primeromes)+21)+' al '+inttostr(DayOf(finmes))+'" as periodo '+
                'from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno '+
                'where tr.fecha between "'+datetostr(primeromes+21)+'" and date_add("'+datetostr(finmes)+'", INTERVAL 1 DAY)  '+
                'and (tr.hora >= t.HoraInicio or tr.hora <= t.HoraFin) '+
                'and tr.idmotivo<>2 and tr.tiempo>0 and t.idturno = 3 group by tr.nombre '+
                ') as t4 on t1.nombre=t4.nombre order by idturno,nombre ';
         querys(cadena,0,sqlgeneral);
         OperacionReporte('TiempoPatrulleros','',TipoImpresion,1);
      end;
      if wks=5 then
      begin
         cadena:='select t1.nombre,t1.promedio as p1, if (t2.promedio is null, "0",t2.promedio) as p2,if(t3.promedio is null,"0",t3.promedio) as p3, if(t4.promedio is null, "0", t4.promedio) as p4,if(t5.promedio is null, "0", t5.promedio) as p5,'+
             ' t1.turno,t1.periodo as per1, if( t2.periodo is null , "del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'",t2.periodo) as per2, if( t3.periodo is null , '+
             ' "del '+inttostr(DayOf(primeromes+14))+' al '+inttostr(DayOf(primeromes+20))+'",t3.periodo) as per3,if( t4.periodo is null , "del '+inttostr(DayOf(primeromes+21))+' al '+inttostr(DayOf(primeromes+27))+'",t4.periodo) as per4,'+
             ' if(t5.periodo is null , "del '+inttostr(DayOf(primeromes+28))+' al '+inttostr(DayOf(finmes))+'",t5.periodo) as per5, monthname("'+datetostr(date)+'") as mes'+
             ' from'+
             ' (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes))+' al '+inttostr(DayOf(primeromes+6))+'" as periodo,t.idturno'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes)+'" and date_add("'+datetostr(primeromes)+'", INTERVAL 6 DAY) and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t1 left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes+7))+' al '+inttostr(DayOf(primeromes+13))+'" as periodo'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+7)+'" and date_add("'+datetostr(primeromes+7)+'", INTERVAL 6 DAY)  and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t2 on t1.nombre=t2.nombre left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes+14))+' al '+inttostr(DayOf(primeromes+20))+'" as periodo'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+14)+'" and date_add("'+datetostr(primeromes+14)+'", INTERVAL 6 DAY)  and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t3 on t1.nombre=t3.nombre left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes)+21)+' al '+inttostr(DayOf(primeromes+27))+'" as periodo'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+21)+'" and date_add("'+datetostr(primeromes+21)+'", INTERVAL 6 DAY)  and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t4 on t1.nombre=t4.nombre left join (select tr.nombre,round(sum(tr.tiempo)/count(tr.tiempo),2) as promedio,t.nombre as turno, "del '+inttostr(DayOf(primeromes+28))+' al '+inttostr(DayOf(finmes))+'" as periodo,t.idturno'+
             ' from tiempo_respuesta tr left join usuarios u on u.codigo=CodPatrullero left join turnos t on u.idturno=t.idturno'+
             ' where tr.fecha between "'+datetostr(primeromes+28)+'" and "'+datetostr(finmes)+'" and tr.idmotivo<>2 and tr.tiempo>0'+
             ' group by tr.nombre) as t5 on t1.nombre=t5.nombre order by t1.idturno,nombre';
         querys(cadena,0,sqlgeneral);
         operacionreporte('TiempoPatrulleros_1',' ',TipoImpresion,1);
      end;
   end;

end;

procedure Tfrmmoduloreportes.lbpromediopatMouseLeave(Sender: TObject);
begin
lbpromediopat.Font.Style:=[fsUnderline];
end;

procedure Tfrmmoduloreportes.lbpromediopatMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
lbpromediopat.Font.Style:=[fsBold, fsUnderline];
end;

procedure Tfrmmoduloreportes.lbartactinvClick(Sender: TObject);
begin
querys('Select cod_cve, nombre, tinstalacion, tinstalacioncom, iva, costo, precioa, piezasxunidad, '+
       'existencia, ordenados, apartado, backorder, minimo, maximo, `status` From articulos '+
       'Where `status` = 1 and inventariable = 1 order by cod_cve', 0, dmreportes.sqlgeneral);
OperacionReporte('ArticulosCat', 'Catalogo de Articulos', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.lzonasdefaultClick(Sender: TObject);
begin
querys('SELECT zd.atid, zd.znum, at.nombre, p.protocolo as protocolo FROM zonas_default AS zd Left Join '+
       'alarmas_tipos AS at ON zd.atid = at.clave Left join protocolos p on p.idprotocolo=zd.idprotocolo '+
       'order by p.idprotocolo, zd.atid', 0, dmreportes.sqlgeneral);
OperacionReporte('ZonasDefault', 'Zonas Default', TipoImpresion, 1);
end;

procedure Tfrmmoduloreportes.rgpuestoClick(Sender: TObject);
begin
  if rgpuesto.ItemIndex=0 then
  begin
    eddias1.Text:='0';
    eddias2.Text:='999';
  end
  else if rgpuesto.ItemIndex=1 then
  begin
    eddias1.Text:='0';
    eddias2.Text:='60';
  end
  else if rgpuesto.ItemIndex=2 then
  begin
    eddias1.Text:='0';
    eddias2.Text:='90';
  end
  else if rgpuesto.ItemIndex=3 then
  begin
    eddias1.Text:='0';
    eddias2.Text:='999';
  end
end;

procedure Tfrmmoduloreportes.chksmsClick(Sender: TObject);
begin
  if DerechosSys('Enviar SMS')=false then
  begin
    chksms.Checked:=false;
    application.MessageBox('No tienes derechos para enviar SMS','Aviso',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

End.



