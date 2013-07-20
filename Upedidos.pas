{///////////////////////////////////////////////////////////////////////////////
2012/07/17 dalyla Parametro de impresion o no en FE
2012/07/13 dalyla agregar cuenta bancaria como comentario
2012/07/06 dalyla se agrego boton FE Transferencia abono en 0
2012/06/01 dalyla facturar con el folio que se desee, 10 sectores
2012/04/05 dalyla se corrigio lo anterior usando el itemindex on el exit de un
2012/03/30 dalyla se modifico para editar la unid neg despues de pedido sin
                  modificar lo demas como instalaciones ni conceptos y demas
--------------------------------------------------------------------------------
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
--------------------------------------------------------------------------------
2010/25/25 Oscar en terminafacturar faltaba un if despues de la pant. remifact
2010/02/04 dalyla Corregir no poner dolares en factura electronica de pesos
--------------------------------------------------------------------------------
2009/06/13 dalyla facturar en dolares
2009/06/09 dalyla arreglar que no pueda facturar elect por configuracion
2009/06/05 dalyla se agrego al proyecto original
2009/05/11 dalyla poder facturar desde la alta (se agrego remision)
2009-04-01 Oscar modificacion botonfacturar derecho para cajera para el cierre
2009/03/11 dalyla guardar hrs instalacion en det pedido
2009/01/27 Oscar Validaproducto rentacom
2009/01/19 Oscar Regresar a pedidos quietar derechos
2009/01/15 Oscar update para el campo anualidad, despues del post btnalta
2009/01/14 Oscar actualiza cosoto con compartidos y anualies onexit cbounidad
2009/01/09 dalyla no actualizar costo hora en configuraciones
2009/01/06 dalyla monitoreo anual y compartido
--------------------------------------------------------------------------------
2008/12/15 dalyla boletas 2009
2008/10/27 Oscar correccion en el boton facturar
2008/10/10 dalyla inventariable
2008/09/01 dalyla busqueda solo este año y el anterior
2008/08/12 dalyla derechos sys Regresar a Pedido
2008/07/24 Cambios sincronizacion
2008/07/23 dalyla derechos sys todas las unidades de negocio
2008/07/23 dalyla derechos capturar precios
2008/07/22 dalyla derechos por factura y remisionar
2008/07/10 dalyla suario fecha hora en insert detpedido
2008/07/09 dalyla inserta articulo en trae presupuesto
2008/06/25 dalyla cambios por inventario
2008/06/04 dalyla pedidos cambios de backorder
2008/05/27 dalila valida existencias para el back order e insertar articulos
2008/05/20 dalyla unidad de negocio poder cambiar si el caso de instalacion es igual
2008/05/08 dalyla Que no puedan editar despues de remisionar.
2008/04/08 dalyla Puedan Cancelar Facturas pero no remisiones sin factura
2008/03/27 dalyla no facturar sin remision
2008/02/28 dalyla zona horaria ok
2008/02/07 dalyla no habilitar el gbotros si no esta en pedido
2008/01/07 Dalila tc en traeperesupuesto
________________________________________________________________________________
2007/12/18 NACHO AGREGUE EL PROCEDURE BONIFICACION PARA LOS PED CON UN NEG CORTESIA
2007/12/14 Dalila
2007/12/13 Dalila Modifica articulo paquete = 0
2007/12/12 Dalila Combo IVA sql rejillas kite el iva del articulo
2007/12/10 Dalila impresion de factura actualice el numtolet
2007/12/06 Dalila Movimiento de inventario en remi/fact/regped
2007/12/05 Dalila Correccion de inserta cardex en add articulo
2007/12/04 Oscar Calcula totales
2007/11/27 Dalila Agregue pasar articulos a instalacion en remision
2007/11/26 dalyla Agregue el before post para ke se grabe el master al R/F
26/NOV/07 OSCAR VALIDACIONES EN LAS UNIDADES DE NEGOCIO CONTRA TIPO_OPORTUNIDAD
22/NOV/07 OSCAR VALIDACIONES EN TRAEPRESUPUESTO PARA CONEXIONES Y ENLACES
2007/11/09 Dalila  No capturar paquetes, jajaja que cruel (Validar producto)
2007/11/07 Oscar   Calculo Totales
2007/10/03 Dalila  Procedure ComisionesVend;   2007/10/06   lo quite
}///////////////////////////////////////////////////////////////////////////////
unit Upedidos;

interface

uses
  Windows, Messages,strutils, DateUtils, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, RzCmboBx, Mask, RzEdit, RzBtnEdt, RzLabel, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  MemDS, DBAccess, MyAccess, RzButton, RzDBEdit, RzTabs, ExtCtrls, RzPanel,
  RzRadGrp, DBCtrls, RzRadChk, RzDBChk, ComCtrls, RzDTP, RzDBDTP, RzDBRGrp,
  ToolWin, Grids, DBGrids, RpDefine, RpCon, RpConDS, cxCurrencyEdit,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog,
  LMDCustomCheckListDlg, LMDCheckListDlg, UCBase;

type
  Tfrmpedidos = class(TForm)
    PCpedidos: TRzPageControl;
    TSpedido: TRzTabSheet;
    gbotros: TGroupBox;
    RzLabel4: TRzLabel;
    Edcve_vend: TRzEdit;
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
    edsector: TRzDBEdit;
    sqlclientes: TMyQuery;
    dsclientes: TDataSource;
    edcuenta: TRzDBEdit;
    RzLabel47: TRzLabel;
    edrsocial: TRzDBEdit;
    edcontrol: TRzDBEdit;
    RzLabel8: TRzLabel;
    SqlGeneral: TMyQuery;
    GBpresupuestos: TGroupBox;
    edpresupuesto: TRzButtonEdit;
    RzLabel3: TRzLabel;
    edFechaCierre: TRzDateTimeEdit;
    RzLabel1: TRzLabel;
    edFechaCreacion: TRzEdit;
    RzLabel29: TRzLabel;
    edNumPedido: TRzButtonEdit;
    RzLabel11: TRzLabel;
    sqltemp: TMyQuery;
    RzLabel16: TRzLabel;
    TSfacturacion: TRzTabSheet;
    PNLfacturacion: TRzPanel;
    btnparcializar: TRzBitBtn;
    btnImpFact: TRzBitBtn;
    btnremisionar: TRzBitBtn;
    sqlrejillaedit: TMyQuery;
    Sqlrejillaalta: TMyQuery;
    dsrejilla: TDataSource;
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
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    paquete: TcxGridDBColumn;
    tiempo: TcxGridDBColumn;
    precio: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    Panel2: TPanel;
    lblayuda: TLabel;
    btnalta: TRzBitBtn;
    lblcategoria: TRzLabel;
    edcategoria: TRzDBEdit;
    RzLabel39: TRzLabel;
    edTCP: TRzEdit;
    RzLabel40: TRzLabel;
    RzLabel41: TRzLabel;
    edCHP: TRzEdit;
    gbtotales: TGroupBox;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    edTotMat: TRzNumericEdit;
    edTotHrs: TRzNumericEdit;
    edCostoHrs: TRzNumericEdit;
    edHoras: TRzNumericEdit;
    edDescuento: TRzNumericEdit;
    ediva: TRzNumericEdit;
    edTotDlls: TRzNumericEdit;
    edTotMn: TRzNumericEdit;
    btnrecalcular: TRzBitBtn;
    RzLabel45: TRzLabel;
    edGiro: TRzDBEdit;
    edcvecte: TRzButtonEdit;
    bckord: TLMDCheckListDlg;
    conexionp: TMyConnection;
    cboestatus: TRzComboBox;
    BorrarPed: TLMDCheckListDlg;
    gbremicion: TRzGroupBox;
    lblidremicion: TRzLabel;
    lblFechaAltaRem: TRzLabel;
    lblHoraAltaRem: TRzLabel;
    lblUsuarioAltaRem: TRzLabel;
    lblFechaBajaRem: TRzLabel;
    lblHoraBajaRem: TRzLabel;
    lblUsuarioBajaRem: TRzLabel;
    edFechaVencimiento: TRzDateTimeEdit;
    RzLabel28: TRzLabel;
    cbonom_vend: TRzComboBox;
    cbonom_TOportunidad: TRzComboBox;
    RzLabel2: TRzLabel;
    cbonom_origen: TRzComboBox;
    RzLabel5: TRzLabel;
    ednum_origen: TRzNumericEdit;
    edTipoOportunidad: TRzNumericEdit;
    cboFormaPago: TRzComboBox;
    RzLabel7: TRzLabel;
    gbFacturacion: TRzGroupBox;
    lblidFactura: TRzLabel;
    lblFechaAltaFac: TRzLabel;
    lblHoraAltaFac: TRzLabel;
    lblUsuarioAltaFac: TRzLabel;
    lblFechaBajaFac: TRzLabel;
    lblHoraBajaFac: TRzLabel;
    lblUsuarioBajaFac: TRzLabel;
    btnfacturar: TRzBitBtn;
    edAnticipo: TRzEdit;
    cboNomAutorizo: TRzComboBox;
    edCveAutorizo: TRzEdit;
    lblAutorizo: TRzLabel;
    sqlpedidos: TMyQuery;
    edCantidad: TRzEdit;
    RzLabel26: TRzLabel;
    lblTotArts: TRzLabel;
    cxmoneda: TcxGridDBColumn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    edsaldo: TRzEdit;
    RzLabel31: TRzLabel;
    REConcepto: TRzRichEdit;
    RzLabel6: TRzLabel;
    edvtasxcta: TRzButtonEdit;
    btnregresar: TRzBitBtn;
    RENotaInst: TRzRichEdit;
    RzLabel10: TRzLabel;
    RzLabel38: TRzLabel;
    edinstalacion: TRzEdit;
    ckinstpend: TRzCheckBox;
    edTotHrsCom: TRzNumericEdit;
    cbiva: TRzComboBox;
    btnImpPed: TRzBitBtn;
    btnFE: TRzBitBtn;
    btnimpdlls: TRzBitBtn;
    btnfedlls: TRzBitBtn;
    lbufh: TRzLabel;
    btntxt: TRzBitBtn;
    btnFactTraspaso: TRzBitBtn;
    RzLabel25: TRzLabel;
    cbtipopago: TRzComboBox;
    edctabancaria: TRzEdit;
    RzLabel27: TRzLabel;
    rgtransferencia: TRzGroupBox;
    lbctaban: TRzLabel;
    rgformapago: TRzGroupBox;
    RzLabel37: TRzLabel;
    cbformapago: TRzComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure edpresupuestoButtonClick(Sender: TObject);
    procedure edpresupuestoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edcompaniaKeyPress(Sender: TObject; var Key: Char);
    procedure edNumPedidoButtonClick(Sender: TObject);
    procedure edNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnremisionarClick(Sender: TObject);
    procedure sqlrejillaTempAfterOpen(DataSet: TDataSet);
    procedure btnparcializarClick(Sender: TObject);
    procedure edNumPedidoChange(Sender: TObject);
    procedure btnImpFactClick(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadChange(Sender: TObject);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarClick(Sender: TObject);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure btnrecalcularClick(Sender: TObject);
    procedure edpresupuestoChange(Sender: TObject);
    procedure edcvecteKeyPress(Sender: TObject; var Key: Char);
    procedure edcvecteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edcvecteChange(Sender: TObject);
    procedure DescPPExit(Sender: TObject);
    procedure edAnticipoExit(Sender: TObject);
    procedure SqlrejillaaltaAfterOpen(DataSet: TDataSet);
    procedure sqlrejillaeditAfterOpen(DataSet: TDataSet);
    procedure edCHPChange(Sender: TObject);
    procedure DescPromChange(Sender: TObject);
    procedure DescPromExit(Sender: TObject);
    procedure DescPromKeyPress(Sender: TObject; var Key: Char);
    procedure DescPPChange(Sender: TObject);
    procedure DescPPKeyPress(Sender: TObject; var Key: Char);
    procedure edAnticipoChange(Sender: TObject);
    procedure edAnticipoKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edcvecteButtonClick(Sender: TObject);
    procedure edTipoNegButtonClick(Sender: TObject);
    procedure edTipoNegKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_vendClick(Sender: TObject);
    procedure Edcve_vendKeyPress(Sender: TObject; var Key: Char);
    procedure ednum_origenKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_origenClick(Sender: TObject);
    procedure cbonom_origenChange(Sender: TObject);
    procedure ednum_origenChange(Sender: TObject);
    procedure Edcve_vendChange(Sender: TObject);
    procedure cbonom_vendChange(Sender: TObject);
    procedure edTipoOportunidadChange(Sender: TObject);
    procedure edTipoOportunidadKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_TOportunidadClick(Sender: TObject);
    procedure cbonom_vendKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_origenKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_TOportunidadKeyPress(Sender: TObject; var Key: Char);
    procedure edTCPKeyPress(Sender: TObject; var Key: Char);
    procedure edTCPExit(Sender: TObject);
    procedure edCHPKeyPress(Sender: TObject; var Key: Char);
    procedure edCHPExit(Sender: TObject);
    procedure btnfacturarClick(Sender: TObject);
    procedure TSpedidoClick(Sender: TObject);
    procedure PCpedidosChange(Sender: TObject);
    procedure edTipoNegExit(Sender: TObject);
    procedure edcvecteExit(Sender: TObject);
    procedure cboLineaNotInList(Sender: TObject);
    procedure cboLineaKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_vendNotInList(Sender: TObject);
    procedure cbonom_TOportunidadNotInList(Sender: TObject);
    procedure cbonom_origenNotInList(Sender: TObject);
    procedure edCveAutorizoChange(Sender: TObject);
    procedure edCveAutorizoKeyPress(Sender: TObject; var Key: Char);
    procedure cboNomAutorizoChange(Sender: TObject);
    procedure cboNomAutorizoClick(Sender: TObject);
    procedure cboNomAutorizoKeyPress(Sender: TObject; var Key: Char);
    procedure cboNomAutorizoNotInList(Sender: TObject);
    procedure EdPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure EdPrecioExit(Sender: TObject);
    procedure SqlrejillaaltaAfterPost(DataSet: TDataSet);
    procedure sqlrejillaeditAfterPost(DataSet: TDataSet);
    procedure cboLineaClick(Sender: TObject);
    procedure CboUtilidadNotInList(Sender: TObject);
    procedure edvtasxctaKeyPress(Sender: TObject; var Key: Char);
    procedure edvtasxctaButtonClick(Sender: TObject);
    procedure edFechaVencimientoClick(Sender: TObject);
    procedure edFechaVencimientoChange(Sender: TObject);
    procedure btnregresarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbonom_TOportunidadChange(Sender: TObject);
    procedure sqlpedidosBeforePost(DataSet: TDataSet);
    procedure cbivaExit(Sender: TObject);
    procedure cbonom_TOportunidadExit(Sender: TObject);
    procedure btnImpPedClick(Sender: TObject);
    procedure btnFEClick(Sender: TObject);
    procedure btnimpdllsClick(Sender: TObject);
    procedure btnfedllsClick(Sender: TObject);
    procedure btntxtClick(Sender: TObject);
    procedure btnFactTraspasoClick(Sender: TObject);
  private
    fact, tipo, letra, monfe:string;
    procedure LimpiaTotales;
    procedure limpia;
    procedure CalculaTotales(query:tMyQuery);
    procedure btnAremisionClick(Sender: TObject);
    procedure GeneraFE;
    procedure TerminaFacturar;
    procedure RemisionAntesFactura;
    procedure AgregarMovTraspaso;
    procedure HabilitarBotonesFE(hab:boolean);

    function ValidaFacturar:boolean;
    function AsignaFolio:boolean;
    { Private declarations }
  public

    PrecioHora:double;
    tecla:char;
    num,requisicion,opcion:integer;
    concepto,utilidad,tipooportunidad:string;
    constructor inicializa(pedido : string);

    function TraePresupuesto(idpresupuesto:string):integer;
    function ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
    function ValidaProducto(CodCve:string):integer;
    function ValidaExistenciasPaquete(codigo:string;cantidad:integer):integer;
    function ValidarCliente_RemisionarFacturar:integer;
    function ValidarCliente_DatosFacturacion:integer;

    procedure VendeConBackOrder(art:string;cant,pzs:integer);
    procedure InsertaArticulosPaquete(tabla,campo,valor,cod_paquete:string;query:tmyquery;cantidad:integer);
    procedure TraePedido(idpedido:integer);
    procedure LimpiaDatArt;
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor,cod_cve:string;cantidad,requisicion,idCardexArt:integer);
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure BorraArticulos(tabla,campo,valor,cod_cve,id:string);
    procedure EliminaPedido;
    procedure VendeSinExistencias(cod_cve:string;cant,pzs:integer);
    procedure MuestraRemiciones(idpedido:string);
    procedure CargaCombo(sql,tabla:string;combo:TRzComboBox);
    procedure VerificarDatosOportunidad;
    procedure bonificacion(mes:string);
    procedure CargaUnidadNegocio;
    { Public declarations }
  end;

var
  frmpedidos: Tfrmpedidos;
  tecla:char;
implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas, Uparcializacion, Udmrep, UBuscaArt,
     Uautentificacion, URemiFac, Uasig_eve_vend, UPresupuesto2, Uprospectos,
     Umesesremision, Ubonificaciones;

{$R *.dfm}
//para el codigo de barras de las boletas se saca cuenta + idpedido +  cargo + relleno para que sean 10 caracteres
constructor tfrmpedidos.inicializa(pedido : string);
begin
chtecla:=#13;
edNumPedido.Text := pedido;
edNumPedido.OnKeyPress(self,chtecla);
end;


function tfrmpedidos.ValidarCliente_DatosFacturacion:integer;
begin
   if sqlclientes.FieldByName('idfact').AsInteger = 0 then
     begin
	      application.MessageBox(pchar('No podra Remisionar/Facturar, hasta no dar de alta los datos de facturacion del cliente #'+sqlclientes.FieldByName('idcliente').Asstring),'Aviso',mb_iconinformation);
        result := 1;
     end
     else
       result := 0;
end;

function tfrmpedidos.ValidarCliente_RemisionarFacturar:integer;
begin
if (sqlclientes.FieldByName('TipoCont').AsString = 'CAN') OR (sqlclientes.FieldByName('estatus').AsString = '2') then
  begin
  if(sqlclientes.FieldByName('TipoCont').AsString = 'CAN') then
    Application.MessageBox('El contrato de la cuenta esta cancelado, no se permite Remisionar/Facturar!','Atención',MB_ICONEXCLAMATION);

  if(sqlclientes.FieldByName('estatus').AsString ='2') then
    Application.MessageBox('El estatus de esta cuenta esta en Revisión , por tal no se permite Remisionar/Facturar!','Atención',MB_ICONEXCLAMATION);

  result := 1;
  end
else
  result := 0;
end;

procedure Tfrmpedidos.VerificarDatosOportunidad;
begin
with dmreportes do
 begin

    querys('Select  if(O.rsocial is NULL or O.rsocial="", if(O.apaterno is NULL or O.apaterno="", O.nombre, if(O.amaterno is NULL or O.amaterno="", '+
           'concat(O.nombre, " ", O.apaterno), concat(O.nombre, " ", O.apaterno, " ", O.amaterno))), O.rsocial) as nombre, dir,entre,numero,col.nombre as colonia,O.idtel '+
           ' from oportunidades as O inner join agenda_vendedores as av on(av.idoportunidad = O.idoportunidad) inner join tipo_oportunidad as tp on(tp.idtipo_oportunidad= av.idtipo_oportunidad) left join colonias as col on (col.idcol=O.idcol) where cuenta = '+ edcuenta.Text +' and ModificarDatos=1 and O.estatus = ''CLIENTE'' and tp.ModificaCuenta = 1 order by O.idoportunidad desc ',0,sqlgeneral3);
    if(sqlgeneral3.RecordCount > 0) then
      begin
            RENotaInst.Lines.Add('**************NUEVA UBICACION**************');
//            if(sqlgeneral3.FieldByName('nombre').AsString <> '') then
//               RENotaInst.Lines.Add('Nombre :'+sqlgeneral3.FieldByName('nombre').AsString);
            if(sqlgeneral3.FieldByName('dir').AsString <> '') then
               RENotaInst.Lines.Add('Dirección :'+sqlgeneral3.FieldByName('dir').AsString+ '#'+sqlgeneral3.FieldByName('numero').AsString+', Col.'+sqlgeneral3.FieldByName('colonia').AsString);
            if(sqlgeneral3.FieldByName('entre').AsString <> '') then
                RENotaInst.Lines.Add('Referencia :'+sqlgeneral3.FieldByName('entre').AsString);

            if(sqlgeneral3.FieldByName('idtel').AsString <> '') then
              begin
                   querys('Select telefono,tipo_tel from telefonos where idtel='+sqlgeneral3.FieldByName('idtel').AsString,0,sqlgeneral4);
                   while not sqlgeneral4.Eof do
                     begin
                           RENotaInst.Lines.Add(sqlgeneral4.FieldByName('tipo_tel').AsString +' : '+sqlgeneral4.FieldByName('telefono').AsString);
                           sqlgeneral4.Next;
                     end;

              end;

      end;

 end;

end;

procedure tfrmpedidos.MuestraRemiciones(idpedido:string);
begin //si tipo = 0 remicion y tipo = 1 factura
//trae los datos de remiciones
querys('select * from RemiFact where idpedido='+idpedido+' and idremicion<>0' ,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
   lblidremicion.Font.Size :=8;
   lblidremicion.Font.Color:=clblack;
   lblidremicion.Caption:='Remision: '+sqlgeneral.fieldbyname('idremicion').AsString;
   lblFechaAltaRem.Caption:='Fecha Remision: '+sqlgeneral.fieldbyname('FechaAlta').AsString;
   lblFechaBajaRem.Caption:='Fecha Cancelacion Remision: '+sqlgeneral.fieldbyname('FechaBaja').AsString;
   lblHoraAltaRem.Caption:='Hora Remicion: '+sqlgeneral.fieldbyname('HoraAlta').AsString;
   lblHoraBajaRem.Caption:='Hora Cancelacion Remision: '+sqlgeneral.fieldbyname('HoraBaja').AsString;
   lblUsuarioAltaRem.Caption:='Usuario Remision: '+sqlgeneral.fieldbyname('UsuarioAlta').AsString;
   lblUsuarioBajaRem.Caption:='Usuario Cancelacion Remision: '+sqlgeneral.fieldbyname('UsuarioBaja').AsString;
   lblFechaBajaRem.Visible := true;
 end
else
 begin
  lblFechaAltaRem.Caption:='';
  lblFechaBajaRem.Caption:='';
  lblFechaBajaRem.Visible := false;
  lblHoraAltaRem.Caption:='';
  lblHoraBajaRem.Caption:='';
  lblUsuarioAltaRem.Caption:='';
  lblUsuarioBajaRem.Caption:='';
  lblidremicion.Font.Color:=clred;
  lblidremicion.Font.Size := 20;
  lblidremicion.Caption:='No se ha Remicionado este pedido';
 end;
//trae los datos de facturas
querys('select * from RemiFact where idpedido='+idpedido+' and idfactura<>''0''',0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
   lblidfactura.Font.Color:=clblack;
   lblidfactura.Font.Size:= 8;
   lblidfactura.Caption:='Factura: '+sqlgeneral.fieldbyname('idfactura').AsString;
   lblFechaAltaFac.Caption:='Fecha Facturacion: '+sqlgeneral.fieldbyname('FechaAlta').AsString;
   lblFechaBajaFac.Caption:='Fecha Cancelacion Factura: '+sqlgeneral.fieldbyname('FechaBaja').AsString;
   lblHoraAltaFac.Caption:='Hora Facturacion: '+sqlgeneral.fieldbyname('HoraAlta').AsString;
   lblHoraBajaFac.Caption:='Hora Cancelacion Factura: '+sqlgeneral.fieldbyname('HoraBaja').AsString;
   lblUsuarioAltaFac.Caption:='Usuario Facturacion: '+sqlgeneral.fieldbyname('UsuarioAlta').AsString;
   lblUsuarioBajaFac.Caption:='Usuario Cancelacion Factura: '+sqlgeneral.fieldbyname('UsuarioBaja').AsString;
   tipo :=sqlgeneral.fieldbyname('tipo').AsString;
   lblHoraBajaFac.Visible := true;
   btnImpFact.Enabled := true;
 end
else
 begin
  lblFechaAltaFac.Caption:='';
  lblFechaBajaFac.Caption:='';
  lblHoraAltaFac.Caption:='';
  lblHoraBajaFac.Caption:='';
  lblHoraBajaFac.Visible := false;
  lblUsuarioAltaFac.Caption:='';
  lblUsuarioBajaFac.Caption:='';
  lblidfactura.Font.Color:=clred;
  lblidfactura.Font.Size:= 20;
  lblidfactura.Caption:='No se ha Facturado este pedido';
  btnImpFact.Enabled := false;
 end;

 if edctabancaria.Text = '' then
 begin
 if querys('select ctaban, tipopago from PagosClientes where idpedido = '+edNumPedido.Text+' '+
    'and movimiento not in (0,3) ', 0, sqlgeneral) > 0 then
    begin
    edctabancaria.Text := sqlgeneral.fieldbyname('ctaban').asstring;
    if querys('SELECT concat("(", iniciales, ")", nombre) as nom, iniciales FROM TiposPagos '+
             'where tipo in (1,2) and iniciales = "'+sqlgeneral.fieldbyname('tipopago').asstring+'" ORDER BY idTipoPago asc', 0, sqlgeneral) > 0 then
      cbtipopago.Text :=  sqlgeneral.fieldbyname('nom').asstring;
    end;
    if querys('SELECT d.TipoCargo, d.ctaban, concat("Tipo Cargo: ", d.TipoCargo, ", Cta. Ban.: ", d.ctaban) '+
              'as descripcion from DetClientes d where idcliente = '+edcvecte.text, 0, sqlgeneral) > 0 then
      lbctaban.Caption := sqlgeneral.fieldbyname('descripcion').asstring
    else
      lbctaban.Caption := '';
 end;
end;

procedure tfrmpedidos.VendeSinExistencias(cod_cve:string;cant,pzs:integer);
begin

end;

{procedure tfrmpedidos.RegresaExistencias(cod_cve:string);
var temp:string;
begin
if cod_cve = '' then
 begin
   //trae las requisiciones
   querys('select requisiciones.*,TipoMov.nombre from requisiciones inner join TipoMov on requisiciones.idmovi = TipoMov.idmovi where requisiciones.idmaq='+frmprincipal.idmaq,0,frmprincipal.SqlGeneral);
    while not frmprincipal.sqlgeneral.Eof do
      begin
       if frmprincipal.SqlGeneral.FieldByName('nombre').AsString = 'PEDIDOS' then
        //actualiza el backorder del articulo al que se le genero la requisicion en piezas
        querys('update articulos set backorder=backorder-'+frmprincipal.sqlgeneral.fieldbyname('cantidad').AsString+' where cod_cve='+quotedstr(frmprincipal.sqlgeneral.fieldbyname('cod_cve').AsString)+' and paquete=0',1,sqltemp)
       else
        begin
         //actualiza el backorder del articulo al que se le genero la requisicion en piezas
         querys('update articulos set apartado:=apartado-'+frmprincipal.sqlgeneral.fieldbyname('cantidad').AsString+' where cod_cve='+quotedstr(frmprincipal.sqlgeneral.fieldbyname('cod_cve').AsString)+' and paquete=0',1,sqltemp);
         //trae el indice del concepto VTA/SIN/EXIST para insertar la cancelacion de los articulos
         querys('select idmovi from TipoMov where nombre='+quotedstr('VTA/SIN/EXIST'),0,sqlgeneral);
         temp:=sqlgeneral.Fields.Fields[0].AsString;
         //trae los registros que se insertaron en el cardex
         if btnalta.Enabled then
          querys('select idCardexArt from DetPedidoTemp where idrequisicion='+frmprincipal.SqlGeneral.FieldByName('idrequisicion').AsString,0,sqltemp)
         else
           querys('select idCardexArt from DetPedido where idrequisicion='+frmprincipal.SqlGeneral.FieldByName('idrequisicion').AsString,0,sqltemp);
         querys('insert into CardexArt(cod_cve,idmovi,movimiento,FechaMov,iddoc,cant,usuario,HoraMov) SELECT cod_cve,idmovi,''S'','+quotedstr(datetostr(FechaServidor))+',iddoc,cant,usuario,'+quotedstr(timetostr(HoraServidor))+' FROM CardexArt WHERE idCardexArt ='+sqltemp.fieldbyname('idCardexArt').AsString,1,sqltemp);
        end;
        //elimina la requisicion generada
        querys('delete from requisiciones where idrequisicion='+frmprincipal.SqlGeneral.FieldByName('idrequisicion').AsString,1,sqltemp);
       frmprincipal.sqlgeneral.Next;
      end;

dsrejilla.DataSet.First;
while not dsrejilla.DataSet.Eof do
 begin
  if dsrejilla.DataSet.FieldByName('idCardexArt').Asinteger = 0 then
   begin
   if dsrejilla.dataset.fieldbyname('piezas').AsInteger>0 then
      //pone lo que tiene en apartados en existencias                                                                                                                                                                  //frmprincipal.sqlgeneral.fieldbyname('cod_cve').AsString
      querys('update articulos set apartado=apartado-'+dsrejilla.DataSet.Fieldbyname('piezas').AsString+',existencia=existencia+'+dsrejilla.DataSet.Fieldbyname('piezas').AsString+' where cod_cve='+quotedstr(dsrejilla.DataSet.Fieldbyname('cod_cve').AsString)+' and paquete=0',1,sqltemp)
     else
      //pone lo que tiene en apartados en existencias                                                                                                                                                                                      //dsrejilla.DataSet.Fieldbyname('cod_cve').AsString
      querys('update articulos set apartado=apartado-('+dsrejilla.DataSet.Fieldbyname('cant').AsString+'*piezasxunidad),existencia=existencia+('+dsrejilla.DataSet.Fieldbyname('cant').AsString+'*piezasxunidad) where cod_cve='+quotedstr(dsrejilla.DataSet.Fieldbyname('cod_cve').AsString)+' and paquete=0',1,sqltemp);
   end;
    dsrejilla.DataSet.next;
 end;
end
else
 begin
   //verifica si se crearon requisiciones por este pedido
   querys('select requisiciones.*,TipoMov.nombre from requisiciones inner join TipoMov on requisiciones.idmovi = TipoMov.idmovi where requisiciones.idrequisicion='+dsrejilla.DataSet.fieldbyname('idrequisicion').AsString,0,frmprincipal.SqlGeneral);
   if frmprincipal.sqlgeneral.RecordCount > 0 then
    begin
   //  if (frmprincipal.sqlgeneral.FieldByName('piezas').AsInteger = 1) and (frmprincipal.sqlgeneral.FieldByName('nombre').AsString='PEDIDOS')  then
   if frmprincipal.sqlgeneral.FieldByName('nombre').AsString='PEDIDOS' then
       querys('update articulos set backorder=backorder-'+frmprincipal.sqlgeneral.fieldbyname('cantidad').AsString+' where cod_cve='+quotedstr(frmprincipal.sqlgeneral.fieldbyname('cod_cve').AsString)+' and paquete=0',1,sqltemp)
      else
      begin
       querys('update articulos set apartado=apartado-'+frmprincipal.sqlgeneral.fieldbyname('cantidad').AsString+' where cod_cve='+quotedstr(frmprincipal.sqlgeneral.fieldbyname('cod_cve').AsString)+' and paquete=0',1,sqltemp);
       querys('insert into CardexArt (cod_cve,idmovi,movimiento,FechaMov,iddoc,cant,usuario,HoraMov) SELECT cod_cve,idmovi,''S'',FechaMov,iddoc,cant,usuario,HoraMov FROM CardexArt WHERE idCardexArt ='+dsrejilla.dataset.fieldbyname('idCardexArt').asstring,1,sqltemp);
      end;
       querys('delete from requisiciones where idrequisicion='+frmprincipal.sqlgeneral.fieldbyname('idrequisicion').AsString,1,sqltemp);
    end
  else  //si se pudo vender sin backorder
       querys('update articulos set apartado=apartado-(('+inttostr(dsrejilla.DataSet.Fieldbyname('cant').Asinteger)+'*piezasxunidad)+'+inttostr(dsrejilla.DataSet.Fieldbyname('piezas').asinteger)+'),existencia=existencia+('+dsrejilla.DataSet.Fieldbyname('cant').AsString+'*piezasxunidad)+'+dsrejilla.DataSet.Fieldbyname('piezas').AsString+' where cod_cve='+quotedstr(cod_cve)+' and paquete=0',1,sqltemp)
 end;
end;}

{procedure tfrmpedidos.LockArt(cod_cve:string);
begin
//verifica que no exista ese articulo
querys('select cod_cve from LockedArt where cod_cve='+quotedstr(cod_cve),0,dmaccesos.SqlGeneral);
if dmaccesos.SqlGeneral.RecordCount = 0 then
 querys('insert into LockedArt(cod_cve,iplocked,userlocked) values ('+quotedstr(cod_cve)+','+quotedstr(frmprincipal.tcpclient.LocalHostAddr)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,frmprincipal.SqlGeneral);
end;}

{procedure tfrmpedidos.UnLockArt(cod_cve:string;todos:boolean);
begin
if todos = false then
querys('delete from LockedArt where cod_cve='+quotedstr(cod_cve),1,frmprincipal.SqlGeneral)
else
    querys('delete from LockedArt where iplocked='+quotedstr(frmprincipal.tcpclient.LocalHostAddr),1,frmprincipal.SqlGeneral);
end;}

procedure tfrmpedidos.BorraArticulos(tabla,campo,valor,cod_cve,id:string);
begin
//querys('select cod_cve from art_compuestos where cod_paq='+quotedstr(cod_cve),0,sqlgeneral);
querys('select cod_cve,id from '+tabla+' where paquete='+quotedstr(cod_cve),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   begin
     sqlgeneral.First;
     while not sqlgeneral.Eof do
         begin
            querys('delete from '+tabla+' where '+campo+' = '+valor + ' and id='+quotedstr(sqlgeneral.fieldbyname('id').AsString),1,frmprincipal.SqlGeneral);
           // if dsrejilla.DataSet.FieldByName('util').AsString <> '' then
            dsrejilla.DataSet.Locate('id',sqlgeneral.fieldbyname('id').AsString,[]);
            if(tabla <> 'DetPedidoTemp') then
               RegresaExistencias(edNumPedido.Text,sqlgeneral.fieldbyname('cod_cve').AsString,true,dsrejilla)
            else
               RegresaExistencias(edNumPedido.Text,sqlgeneral.fieldbyname('cod_cve').AsString,false,dsrejilla);

           // UnLockArt(sqlgeneral.fieldbyname('cod_cve').AsString,false);
            sqlgeneral.Next;
         end;
      querys('delete from '+tabla+' where '+campo+' = '+valor + ' and cod_cve='+quotedstr(cod_cve),1,frmprincipal.SqlGeneral);
//      UnLockArt(cod_cve,false);
   end
else
  begin
  //valida que solo halla un articulo para poderlo borrar de LockedArt
  //querys('select * from '+tabla+' where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
  //if sqlgeneral.RecordCount = 1 then
  // UnLockArt(cod_cve,false);
   if(tabla <> 'DetPedidoTemp') then
    RegresaExistencias(edNumPedido.Text,dsrejilla.DataSet.FieldValues['cod_cve'],false,dsrejilla)
   else
    RegresaExistencias(edNumPedido.Text,dsrejilla.DataSet.FieldValues['cod_cve'],true,dsrejilla);
   querys('delete from '+tabla+' where id='+id+' and (paquete is null or paquete ='''' or paquete = 0)',1,sqlgeneral);
 end;
  // querys('delete from '+tabla+' where '+campo+' = '+valor + ' and cod_cve='+quotedstr(cod_cve)+ ' and id='+id,1,frmprincipal.SqlGeneral);
   //querys('delete from '+tabla+' where '+campo+' = '+valor + ' and cod_cve='+quotedstr(sqlgeneral.fieldbyname('cod_cve').AsString) + ' and utilidad = ''''',1,frmprincipal.SqlGeneral);

end;

//removida a recursos el 14 de febrero 2006
{function tfrmpedidos.BuscaCliente:integer;
begin
       frmbusquedas.query:='Select idcliente,if(nombre<>'''' and apaterno<>'''' and amaterno<>'''',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
                           ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes order by idcliente';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             edcvecte.Text:=frmbusquedas.resultado;
             sqlclientes.close;
             sqlclientes.params.items[0].value:=strtoint(frmbusquedas.resultado);
             sqlclientes.open;
             edcvecte.SetFocus;
             result:=1;
            end
       else
         result:=0;
end;}

{procedure tfrmpedidos.CalculaTotales(query:tMyQuery);
var subtotal,descuento,iva,hrs, hrscom:double;
begin
if query.RecordCount = 0 then
   begin
    btnrecalcular.Enabled:=false;
    rejilla.Enabled:=false;
    edTotMat.Text:='0';
    edTotHrs.Text:='0';
    edTotHrsCom.Text:='0';
    edHoras.Text:='0';
    edDescuento.Text:='0';
    edIva.Text:='0';
    edTotDlls.Text:='0';
    edTotMn.Text:='0';
    edanticipo.Text:='0';
    edSaldo.Text:='0';
   end
else
  begin
  subtotal:=0;
  hrs:=0;
  hrscom:=0;
  iva:=0;
  descuento:=0;
     if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
        begin
         rejilla.Enabled:=true;
         btnrecalcular.Enabled:=true;
        end
     else
       begin
        rejilla.Enabled:=false;
        btnrecalcular.Enabled:=false;
       end;

  query.First;
  while not query.Eof do
  begin
  // if query.FieldValues['precio'] > 0 then
   //   begin
       if (query.FieldValues['cant'] > 0) or (query.FieldValues['cant'] < 0) then
       begin
           if query.FieldValues['moneda'] = 'PESOS' then
           begin
              if copy(trim(query.FieldValues['cod_cve']),1,4)<>'DESCUENTO E' then  //si hay un descuento ESPECIAL
              begin
                subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']);
                iva:=iva+((query.FieldValues['precio']*query.FieldValues['iva'])*query.FieldValues['cant']);
                if query.FieldValues['aplica_desc'] then
                  descuento:=descuento+((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant']);
              end
              else
                descuento:=descuento+query.FieldValues['precio'];
           end
           else
           ///////dolares//////////
           begin
              if (copy(trim(query.FieldValues['cod_cve']),1,4)<>'DESC') or (query.FieldValues['cod_cve']='DESCUENTO E') or
                 (query.FieldValues['cod_cve']='DESC CC') or (query.FieldValues['cod_cve']='DESC CT') then   //si hay un descuento
              begin
                subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']*strtofloat(edtcp.Text));
                iva:=iva+(((query.FieldValues['precio']*query.FieldValues['iva'])*query.FieldValues['cant'])*strtofloat(edtcp.Text));
                if query.FieldValues['aplica_desc'] then
                  descuento:=descuento+(((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant'])*strtofloat(edtcp.Text));
              end
              else
                edDescuento.Text:=query.FieldValues['descuento'];
           end;
       end
       else  //si cantidad es 0
       begin
          if query.FieldValues['moneda'] = 'PESOS' then
          begin
            subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad']));
            iva:=iva+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['iva'])*query.FieldValues['piezas']);
            if query.FieldValues['aplica_desc'] then
              descuento:=descuento+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas']);
          end
          else
          begin
            subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*strtofloat(edtcp.Text));
            iva:=iva+((((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['iva'])*query.FieldValues['piezas'])*strtofloat(edtcp.Text));
            if query.FieldValues['aplica_desc'] then
             descuento:=descuento+((((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas'])*strtofloat(edtcp.Text));
          end;
       end;
           hrs:=hrs+query.FieldValues['tinstalacion'];
           hrscom:=hrscom+query.FieldValues['tinstalacioncom'];
           query.Next;
  end;

   edTotMat.Text:=Format('%8.2f',[subtotal+((descuento)*strtofloat(edTCP.Text))]);
   // if btnalta.caption = '&Guardar' then
   //   edTotHrs.Text:=Format('%8.2f',[hrs])
//    else
  //    if (edTotHrs.Text = '') or (edTotHrs.Text = '0')then
   edTotHrs.Text:=Format('%8.2f',[hrs]);
   edTotHrsCom.Text:=Format('%8.2f',[hrscom]);
   edCostoHrs.Text:=Format('%8.2f',[strtofloat(edCostoHrs.Text)]);
   edHoras.Text:=Format('%8.2f',[strtofloat(edTotHrs.Text)*strtofloat(edCostoHrs.Text)*strtofloat(edtcp.text)]);
   eddescuento.Text:=Format('%8.2f',[strtofloat(eddescuento.Text)*strtofloat(edTotMat.Text)]);
   edTotMat.Text:=Format('%8.2f',[strtofloat(edTotMat.Text)-strtofloat(edDescuento.Text)]);
   ediva.Text := format('%8.2f',[strtofloat(edTotMat.Text)*GetIVA]);
   edTotDlls.Text := Format('%8.2f',[(strtofloat(edTotMat.Text)+strtofloat(ediva.Text))/strtofloat(edtcp.Text)]);
   edTotmn.Text:=Format('%8.2f',[strtofloat(edTotMat.Text)+strtofloat(ediva.Text)]);
    //edTotDlls.Text:=Format('%8f',[strtofloat(SubTot3.Text)+strtofloat(ediva.Text)]);
    //edTotmn.Text:=Format('%8f',[(strtofloat(edTotDlls.Text)*strtofloat(edTCP.Text))-((strtofloat(eddescuento.text)/100)*(strtofloat(edTotDlls.Text)*strtofloat(edTCP.Text)))]);
   edSaldo.Text:=Format('%8.2f',[strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text)]);
  end;
end;    }

procedure tfrmpedidos.CalculaTotales(query:tMyQuery);
var subtotal,descuento,iva,hrs, hrscom:double;
begin
if query.RecordCount = 0 then
   begin
    btnrecalcular.Enabled:=false;
    rejilla.Enabled:=false;
    edTotMat.Text:='0';
    edTotHrs.Text:='0';
    edTotHrsCom.Text:='0';
    edHoras.Text:='0';
    edDescuento.Text:='0';
    edIva.Text:='0';
    edTotDlls.Text:='0';
    edTotMn.Text:='0';
    edanticipo.Text:='0';
    edSaldo.Text:='0';
   end
else
  begin
  subtotal:=0;
  hrs:=0;
  hrscom:=0;
  iva:=0;
  descuento:=0;
     if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
        begin
         rejilla.Enabled:=true;
         btnrecalcular.Enabled:=true;
        end
     else
       begin
        rejilla.Enabled:=false;
        btnrecalcular.Enabled:=false;
       end;

  query.First;
  while not query.Eof do
   begin
  // if query.FieldValues['precio'] > 0 then
   //   begin
       if (query.FieldValues['cant'] > 0) or (query.FieldValues['cant'] < 0) then
          begin
           if query.FieldValues['moneda'] = 'PESOS' then
             begin
              subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']);
              iva:=iva+((query.FieldValues['precio']*strtofloat(cbiva.text))*query.FieldValues['cant']);
              if query.FieldValues['aplica_desc'] then
               descuento:=descuento+((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant']);
             end
           else
            begin
              subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']*strtofloat(edtcp.Text));
              iva:=iva+(((query.FieldValues['precio']*strtofloat(cbiva.text))*query.FieldValues['cant'])*strtofloat(edtcp.Text));
              if query.FieldValues['aplica_desc'] then
               descuento:=descuento+(((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant'])*strtofloat(edtcp.Text));
            end;
          end
       else
         begin
          if query.FieldValues['moneda'] = 'PESOS' then
           begin
            subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad']));
            iva:=iva+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*strtofloat(cbiva.text))*query.FieldValues['piezas']);
            if query.FieldValues['aplica_desc'] then
              descuento:=descuento+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas']);
           end
          else
           begin
            subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*strtofloat(edtcp.Text));
            iva:=iva+((((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*strtofloat(cbiva.text))*query.FieldValues['piezas'])*strtofloat(edtcp.Text));
            if query.FieldValues['aplica_desc'] then
             descuento:=descuento+((((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas'])*strtofloat(edtcp.Text));
          end;
         end;
           hrs:=hrs+query.FieldValues['tinstalacion'];
           hrscom:=hrscom+query.FieldValues['tinstalacioncom'];
           query.Next;
       end;

    edTotMat.Text:=Format('%8.2f',[subtotal]);
    edTotHrs.Text:=Format('%8.2f',[hrs]);
    edTotHrsCom.Text:=Format('%8.2f',[hrscom]);
    edCostoHrs.Text:=Format('%8.2f',[strtofloat(edCostoHrs.Text)]);
    edHoras.Text:=Format('%8.2f',[strtofloat(edTotHrs.Text)*strtofloat(edCostoHrs.Text)*strtofloat(edtcp.text)]);
    ediva.Text := format('%8.2f',[iva]); //format('%8.2f',[strtofloat(edTotMat.Text)*GetIVA]);
    eddescuento.Text:=Format('%8.2f',[descuento]);
    edTotDlls.Text := Format('%8.2f',[((strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text))/strtofloat(edtcp.Text)]);
    edTotmn.Text:=Format('%8.2f',[(strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text)]);
    edSaldo.Text:=Format('%8.2f',[strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text)]);
  end;
end;


procedure tfrmpedidos.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
if (dsrejilla.DataSet.RecordCount > 0) and ((dsrejilla.DataSet.FieldByName('paquete').AsString = '0') or (dsrejilla.DataSet.FieldByName('paquete').AsString = '')) then
  begin
    gbarticulo.Enabled := true;
//    UnLockArt(dsrejilla.DataSet.FieldValues['cod_cve'],false);
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
      //elimina el registro del articulo
    if(tabla <> 'DetPedidoTemp') then
      RegresaExistencias(edNumPedido.Text,dsrejilla.DataSet.fieldbyname('cod_cve').AsString,false,dsrejilla)
    else
      RegresaExistencias(edNumPedido.Text,dsrejilla.DataSet.fieldbyname('cod_cve').AsString,true,dsrejilla);
      
    querys('delete from '+tabla+' where '+campo+'='+valor+' and id='+dsrejilla.DataSet.fieldbyname('id').AsString+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' or paquete='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
    //refresca la rejilla de datos
     query.Close;
     query.ParamByName(campo).AsInteger:=strtoint(valor);
     query.Open;
     dsrejilla.DataSet:=query;
     btnagregar.Enabled:=true;
     edcodigo.Enabled:=false;
     edcantidad.Enabled:=true;
     edTInsta.Enabled:=true;
     edcantidad.SetFocus;
  end;
end;

function tfrmpedidos.ValidaProducto(CodCve:string):integer;
begin
//aqui busca el articulo por codigo de barras o por clave
if querys('select cod_cve,nombre,precio'+lowercase(CboUtilidad.Text)+' as precio,desc_esp,tinstalacion,piezasxunidad,existencia,aplica_desc, '+
       ' nom_envase,nom_piezas,servicio,paquete,idlinea, status from articulos where cod_cve="'+CodCve+'" or cod_barras="'+CodCve+'" ',0,SqlGeneral) = 0 then
  begin
  application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
  edcodigo.SelectAll;
  SqlGeneral.Close;
  edcantidad.Text:='1';
  edcodigo.Text:='';
  chkpiezas.Checked:=false;
  result:=0;
  end
else
  begin
  if sqlgeneral.fieldbyname('paquete').asstring = '1' then
    begin
    application.MessageBox('No puede capturar paquetes!','Aviso',mb_iconinformation);
    edcodigo.SelectAll;
    SqlGeneral.Close;
    edcantidad.Text:='1';
    edcodigo.Text:='';
    chkpiezas.Checked:=false;
    result:=0;
    exit;
    end;
    
  if sqlgeneral.fieldbyname('status').asstring = '1' then
    begin
    querys('select iplocked,userlocked from LockedArt where cod_cve='+quotedstr(codCve),0,dmaccesos.sqlgeneral);
    if (dmaccesos.sqlgeneral.RecordCount = 0) or ((dmaccesos.sqlgeneral.RecordCount > 0) and (dmaccesos.sqlgeneral.FieldByName('iplocked').Asstring = frmprincipal.TcpClient.LocalHostAddr)) then
      begin
      if sqlgeneral.FieldByName('idlinea').AsInteger <> 0 then
        begin
        //if edcodigo.Text = 'MONITOREO' then
        //#boletas 2009
        if (edcodigo.Text = 'MONITOREO') or AnsiContainsStr(edcodigo.Text, 'MON') then
        begin
          if querys('select compartido from clientes c left join contratos con on c.TipoCont=con.tipocont where idcliente ='+edcuenta.text+' and compartido = 1', 0, sqltemp) > 0 then
          begin
            if frmmesesremision.chAnualidad.Checked then
              querys('Select round(sum(costoAnual)/12,2) as CostoMensual from (  select com.idcliente as Cliente, cat.CostoMensual, costoAnual '+
                     'from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom left join categorias cat on c.idcategoria=cat.idcategoria '+
                     'where com.idcliente='+edcuenta.text+' union all select c.idcliente as Cliente, cat.CostoMensual, costoAnual from  clientes c '+
                     'left join categorias cat on c.idcategoria=cat.idcategoria where c.idcliente= '+edcuenta.text+' ) as d',0,sqltemp)
            else
              querys('Select round(sum(CostoMensual),2) as CostoMensual from ( select com.idcliente as Cliente, cat.CostoMensual, costoAnual '+
                     'from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom left join categorias cat on c.idcategoria=cat.idcategoria '+
                     'where com.idcliente='+edcuenta.text+' union all select c.idcliente as Cliente, cat.CostoMensual, costoAnual from  clientes c '+
                     'left join categorias cat on c.idcategoria=cat.idcategoria where c.idcliente='+edcuenta.text+' ) as d', 0, sqltemp);
          end
          else
          begin
            if frmmesesremision.chAnualidad.Checked then
              querys('select round(CostoAnual/12,2) as CostoMensual from categorias where nombre = ' + quotedstr(edcategoria.Text),0,sqltemp)
            else
              querys('select CostoMensual from categorias where nombre = ' + quotedstr(edcategoria.Text),0,sqltemp);
          end;
          edPrecio.Text := sqltemp.fieldbyname('CostoMensual').AsString;
        end
        else
          if AnsiContainsStr(edcodigo.Text, 'RENTACOM') then
          begin
            edprecio.Text:=GetConfiguraciones('RentaComunicador',true)
          end
          else
            edPrecio.Text:=SqlGeneral.fieldbyname('precio').AsString;
            
        querys('select PrecioCapturable,servicio,inventariable,existencia from articulos where cod_cve='+quotedstr(CodCve),0,sqltemp);
        if (sqltemp.FieldByName('PrecioCapturable').AsInteger = 1) or (sqltemp.FieldByName('servicio').AsInteger = 1) then
          edprecio.Enabled := true;
        //pregunta por las existencias para indicarle al usuario de color verde en la captura que es negativo en caso de ser asi
        if (sqltemp.FieldByName('existencia').AsInteger <= 0) and (sqltemp.FieldByName('inventariable').AsInteger = 1) then
          begin
          gbarticulo.Color := clMoneyGreen;
          gbarticulo.Hint := 'Articulo con Existencias Negativas';
          end
        else
          begin
          gbarticulo.Color := clwhite;
          gbarticulo.Hint := '';
          end;
        //pregunta si se va a poder ValidaProducto en piezas
        edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
        if SqlGeneral.FieldByName('aplica_desc').Asstring = 'True' then
          edDesc.Text:=SqlGeneral.fieldbyname('desc_esp').Asstring;
        edTInsta.Text:=SqlGeneral.fieldbyname('tinstalacion').AsString;
        result:=1;
        end
      else
        begin
        application.MessageBox('No podra agregar este articulo a su pedido ya que no tiene LINEA','Aviso',mb_iconinformation);
        edcodigo.Text := '';
        result := 0;
        end;
      end
    else
      begin
      application.MessageBox(pchar('Este articulo ha sido bloqueado por el usuario: '+dmaccesos.sqlgeneral.FieldByName('userlocked').Asstring+' y no podra agregarlo hasta que se desbloquee!'),'Aviso',mb_iconinformation);
      result:=0;
      end;
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

procedure tfrmpedidos.InsertaArticulo(query:tMyQuery;tabla,campo,valor,cod_cve:string;cantidad,requisicion,idCardexArt:integer);
var descu,costo,tc, hrsins, hrsvta:string;
pzsxunidad,cant,piezas, cant2:integer;
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
 querys('select a.inventariable,a.piezasxunidad,a.PrecioCapturable,a.servicio,a.moneda,u.PrecioCapturable as pc, '+
        'tinstalacionCom as hrsins, tinstalacion as hrsvta '+
        'from articulos a,usuarios u where cod_cve='+quotedstr(cod_cve)+' and u.idusuario='+
        inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
 pzsxunidad := sqlgeneral.fieldbyname('piezasxunidad').AsInteger;
 hrsins :=  sqlgeneral.fieldbyname('hrsins').asstring;
 hrsvta :=  sqlgeneral.fieldbyname('hrsvta').asstring;

 //esto es por si son pesos se ocupa que el tc sea 1
 if sqlgeneral.fieldbyname('moneda').asstring = 'P' then
  tc := '1'
 else
  tc := edTCP.text;

// if sqlgeneral.fieldbyname('inventariable').asinteger = 1 then
  //bloquea el articulo para que nadie mas lo pueda modificar
//  LockArt(cod_cve);

if ((sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 0) and (sqlgeneral.FieldByName('pc').AsInteger = 0)) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
 begin
  //trae el costo del articulo en base al tipo de precio
  querys('select precio'+CboUtilidad.Text+' as costo from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
  costo := sqlgeneral.fieldbyname('costo').AsString;
 end
else
  begin
  if edPrecio.Text = '' then
    begin
    querys('select precio'+CboUtilidad.Text+' as costo from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
    costo := sqlgeneral.fieldbyname('costo').AsString;
    end
  else

    costo := edPrecio.Text;
  end;

//inserta los datos del articulo en DetPresupuesto
{querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+',idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora, estatus) values ('+
       floattostr(cant)+','+floattostr(piezas)+','+quotedstr(cod_cve)+','+quotedstr(CboUtilidad.Text)+','+valor+','+inttostr(requisicion)+','+inttostr(idCardexArt)+','+costo+','+tc+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+', 1)',1,SqlGeneral);}
querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+',idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora, estatus, hrsins, hrsvta) values ('+
       floattostr(cant)+','+floattostr(piezas)+','+quotedstr(cod_cve)+','+quotedstr(CboUtilidad.Text)+','+valor+','+
       inttostr(requisicion)+','+inttostr(idCardexArt)+','+costo+','+tc+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
       ','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+', 1, '+hrsins+', '+hrsvta+')',1,SqlGeneral);
querys('delete from '+tabla+' where cant<=0 and piezas<=0',1,sqlgeneral);
cant2 := ValidaExistencias(cod_cve, cant, chkpiezas.Checked);
{ 0 significa que puede vender bien
< 0 es que ya no hay existencias
> 0 no puede vender por completo la mercancia }
if cant2 = 0 then {descomentado dalila}
  querys('update articulos set apartado=apartado+'+inttostr((cant*pzsxunidad)+piezas)+', existencia = existencia-'+inttostr((cant*pzsxunidad)+piezas)+' where cod_cve="'+cod_cve+'"  and inventariable = 1',1,sqlgeneral)
else
  querys('update articulos set apartado=apartado+'+inttostr((cant*pzsxunidad)+piezas)+', existencia = 0 where cod_cve="'+cod_cve+'"  and inventariable = 1',1,sqlgeneral);
 { begin
  if cant2 > 0 then
    querys('update articulos set backorder=backorder+'+inttostr((cant2*pzsxunidad)+piezas)+',existencia=existencia-'+inttostr(((cant-cant2)*pzsxunidad)+piezas)+' where cod_cve="'+cod_cve+'"',1,sqlgeneral)
  else
    begin
    //cant2 := cant2*-1;
    querys('update articulos set backorder=backorder+'+inttostr((cant*pzsxunidad)+piezas)+' where cod_cve="'+cod_cve+'"',1,sqlgeneral);
    end;
  end;}

//refresca la rejilla de datos
query.Close;
query.ParamByName(campo).AsInteger:=strtoint(valor);
query.Open;
end;

procedure tfrmpedidos.InsertaArticulosPaquete(tabla,campo,valor,cod_paquete:string;query:tmyquery;cantidad:integer);
var pzsXunidad,cant,pzs: integer;    //idcardexart
cod_cve, hrsins, hrsvta:string;
begin
querys('delete from '+tabla+' where '+campo+' = '+valor+' and (cod_cve='+quotedstr(cod_paquete)+' or paquete='+quotedstr(cod_paquete)+')',1,sqlgeneral);
if cantidad > 0 then
 begin
  //trae el indice del concepto VENTAS para insertar la venta del articulo
  //COMENTADO porque no se usa
  {querys('select idmovi from TipoMov where nombre='+quotedstr('VENTAS'),0,sqlgeneral);
  idcardexart:=sqlgeneral.Fields.Fields[0].Asinteger;}
  InsertaArticulo(query,tabla,campo,valor,cod_paquete,cantidad,0,0);
  //querys('select articulos.piezasxunidad,art_compuestos.cod_cve,art_compuestos.cant,art_compuestos.piezas from art_compuestos inner join articulos on art_compuestos.cod_cve = articulos.cod_cve where art_compuestos.cod_paq='+quotedstr(cod_paquete),0,sqlgeneral);
  querys('select articulos.piezasxunidad,art_compuestos.cod_cve,art_compuestos.cant,art_compuestos.piezas, hrsins, hrsvta from art_compuestos inner join articulos on art_compuestos.cod_cve = articulos.cod_cve where art_compuestos.cod_paq='+quotedstr(cod_paquete),0,sqlgeneral);
  sqlgeneral.First;
  while not sqlgeneral.Eof do
   begin
    pzsxunidad:=sqlgeneral.fieldbyname('piezasxunidad').AsInteger;
    cant:=sqlgeneral.fieldbyname('cant').AsInteger;
    pzs:=sqlgeneral.fieldbyname('piezas').AsInteger;
    cod_cve:=sqlgeneral.fieldbyname('cod_cve').Asstring;
    hrsins:=sqlgeneral.fieldbyname('hrsins').Asstring;
    hrsvta:=sqlgeneral.fieldbyname('hrsvta').Asstring;
//    LockArt(cod_cve);

    //trae el indice del concepto VENTAS para insertar la venta del articulo
    //COMENTADO  porque no se usa por dalyla
    {querys('select idmovi from TipoMov where nombre='+quotedstr('VENTAS'),0,sqltemp);
    idcardexart:=sqltemp.Fields.Fields[0].Asinteger;}

    //inserta los datos del articulo en DetPedido
    //querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+',paquete,idrequisicion) values ('+inttostr(cant*cantidad)+','+inttostr(pzs*cantidad)+','+quotedstr(cod_cve)+','' '','+valor+','+quotedstr(cod_paquete)+',0)',1,sqltemp);
    querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+',paquete,idrequisicion, hrsins, hrsvta) values ('+
            inttostr(cant*cantidad)+','+inttostr(pzs*cantidad)+','+quotedstr(cod_cve)+','' '','+valor+','+quotedstr(cod_paquete)+
            ',0, '+hrsins+', '+hrsvta+')',1,sqltemp);
    querys('update articulos set apartado=apartado+'+inttostr((cant*pzsxunidad)+pzs)+',existencia=existencia-'+inttostr((cant*pzsxunidad)+pzs)+' where cod_cve='+quotedstr(cod_cve)+'  and inventariable = 1',1,sqltemp);
    sqlgeneral.Next;
   end;
query.Close;
query.ParamByName(campo).AsString:=valor;
query.Open;
dsrejilla.DataSet:=query;
end;
end;


procedure tfrmpedidos.LimpiaDatArt;
begin
     //limpia los campos
     gbarticulo.Color := clwhite;
     gbarticulo.Hint := '';
     btnagregar.Enabled:=false;
     edcantidad.Text:='1';
     edcantidad.Enabled:=false;
     edTInsta.Enabled:=false;
     chkpiezas.Checked:=false;
     chkpiezas.Enabled:=false;
     CboUtilidad.Text:=utilidad;
     Cboutilidad.Enabled:=false;
     edtinsta.Text:='';
     edDesc.Text:='';
     edprecio.Text:='0';
     edprecio.Enabled := false;
     edDescripcion.Text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
end;

function tfrmpedidos.ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
var
c,p,pxu,ex,dif:integer;     //  unidades,
begin
result := 0;
//los resultados de esta funcion son los siguientes
{ 0 significa que puede vender bien
< 0 es que ya no hay existencias
> 0 no puede vender por completo la mercancia }
p:=0; c:=0; //ex:=0;pxu:=0;unidades:=0;
if piezas then
  p:=cantidad
else
  c:=cantidad;

//unidades:=cantidad;
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve, existencia, servicio, inventariable, '+
       'paquete, piezasxunidad from articulos where cod_cve= "'+CodCve+ '" or cod_barras="'+CodCve+'"',0,SqlGeneral);

if SqlGeneral.FieldByName('inventariable').AsInteger = 0 then
  exit;
//Si no es servicio ni paquete
if (SqlGeneral.FieldByName('servicio').AsInteger = 0) and (SqlGeneral.FieldByName('paquete').AsInteger = 0) then
  begin
  ex := SqlGeneral.FieldByName('existencia').AsInteger;
  pxu:= SqlGeneral.FieldByName('piezasxunidad').AsInteger;

  if ex <> 0 then
    begin
    if piezas then
      begin
      if SqlGeneral.FieldByName('piezasxunidad').AsInteger = 1 then
        begin
        btnagregar.Tag := 1 ;
        result := ex - p ;
        exit;
        end;
      end;
    {else
      unidades:=unidades*pxu;}

  dif := ( ex - p - ( c * pxu ) );
  if dif < 0 then
    begin

    {if piezas then
      result := cantidad
    else
      result := dif;}

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
  end;
end;

procedure tfrmpedidos.TraePedido(idpedido:integer);
var
  i : integer;
  sqltemp1 : tmyquery;
begin
edTotHrs.Text := '';
edTotHrscom.Text := '';
sqltemp1 := tmyquery.Create(self);
sqltemp1.Connection := dmaccesos.conexion;
//trae los datos del pedido
sqlgeneral.Close;
sqlgeneral.SQL.Clear;
sqlgeneral.SQL.Add('SELECT p.idinstal,u.nombre,u.apaterno,u.amaterno,o.nombre AS origen,un.nombre AS UN,p.idpedido,p.idpresupuesto,p.idoportunidad,p.idcliente,p.idvendedor,p.NotaInst, '+
                   ' un.idUnidadNegocio,p.idorigen,p.FechaCreacion,p.FechaCierre,p.observaciones,p.DescProm,p.DescPP,p.usuario,p.fecha,p.hora,p.TipoCambio,p.TotMat, '+
                   ' p.TotHrs,p.TotHrsCom,p.CostoHrs,p.MontoHrs,'+
                   'p.SubTotal,p.Descuento,p.Iva, p.pIVA, p.TotDlls,p.TotMn,p.Anticipo,p.Saldo,p.paquete,p.FormaPago, '+
                   ' p.autorizo,p.estatus,p.concepto,p.FechaRemision,p.FechaVencimiento,p.idPedidoHijo,'+
                   'instpend FROM pedidos as p LEFT JOIN usuarios as u ON (p.idvendedor = u.idusuario)'+
                   ' LEFT JOIN origen as o ON (p.idorigen = o.idorigen) LEFT join UnidadNegocio as un on p.idUnidadNegocio = un.idUnidadNegocio where p.idpedido='+edNumPedido.Text);
sqlgeneral.Open;

if (sqlgeneral.fieldbyname('TotHrs').AsFloat > 0 ) then
    edTotHrs.Text := sqlgeneral.fieldbyname('TotHrs').AsString;
if (sqlgeneral.fieldbyname('TotHrsCom').AsFloat > 0 ) then
  edTotHrs.Text := sqlgeneral.fieldbyname('TotHrsCom').AsString;

edinstalacion.Text := sqlgeneral.fieldbyname('idinstal').AsString;
edfechacreacion.Text := sqlgeneral.fieldbyname('FechaCreacion').AsString;
edcvecte.Text := sqlgeneral.fieldbyname('idcliente').AsString;
edpresupuesto.Text := sqlgeneral.fieldbyname('idpresupuesto').Asstring;
REConcepto.Text := sqlgeneral.fieldbyname('concepto').Asstring;
RENotaInst.Text := sqlgeneral.fieldbyname('NotaInst').AsString;
edTCP.Text := sqlgeneral.fieldbyname('TipoCambio').Asstring;
cbiva.text := sqlgeneral.fieldbyname('pIVA').Asstring;
edCHP.Text := sqlgeneral.fieldbyname('CostoHrs').Asstring;
edanticipo.Text := sqlgeneral.fieldbyname('Anticipo').AsString;
cboestatus.ItemIndex:=sqlgeneral.FieldByName('estatus').AsInteger;
cboestatus.Text:=cboestatus.Items.Strings[cboestatus.itemindex];
if cboestatus.ItemIndex = 0 then
 btnborrar.enabled := true
else
 btnborrar.Enabled := false;

edFechaVencimiento.Date:=sqlgeneral.FieldByName('FechaVencimiento').AsDateTime;
edcve_vend.Text:=sqlgeneral.FieldByName('idvendedor').Asstring;
cbonom_vend.Text:=sqlgeneral.FieldByName('nombre').Asstring + ' ' + sqlgeneral.FieldByName('apaterno').Asstring + ' ' + sqlgeneral.FieldByName('amaterno').Asstring;
edTipoOportunidad.Text:=sqlgeneral.FieldByName('idUnidadNegocio').Asstring;
cbonom_TOportunidad.Text:=sqlgeneral.FieldByName('UN').Asstring;
ednum_origen.Text:=sqlgeneral.FieldByName('idorigen').Asstring;
edCveAutorizo.Text := sqlgeneral.FieldByName('autorizo').Asstring;

lbufh.Caption := UFH(sqlgeneral);

if edCveAutorizo.Text <> '' then
 begin
  querys('select concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) as nombre from usuarios where idusuario ='+edCveAutorizo.Text,0,sqltemp);
  cboNomAutorizo.Text := sqltemp.fieldbyname('nombre').AsString;
 end;
cbonom_origen.Text:=sqlgeneral.FieldByName('origen').Asstring;
for i := 0 to cboformapago.Items.Count - 1 do
 if cboformapago.Items.Strings[i][2] + cboformapago.Items.Strings[i][3] = sqlgeneral.fieldbyname('FormaPago').Asstring then
   begin
    cboFormaPago.text := cboformapago.Items.Strings[i];
    break;
   end;
TSfacturacion.TabVisible:=true;
TSfacturacion.TabEnabled:=true;
//verifica si ya se remiciono
//querys('select * from RemiFact where idpedido='+edNumPedido.Text+' and idremicion<>0',0,sqlgeneral);
//if sqlgeneral.RecordCount > 0 then
// begin
//  MuestraRemiciones(edNumPedido.Text);
// end;

//trae los datos del cliente
sqlclientes.Close;
sqlclientes.ParamByName('idcliente').AsInteger:=sqlgeneral.fieldbyname('idcliente').AsInteger;
sqlclientes.Open;

  chtecla := #13;
  if edcve_vend.Text = '' then
   begin
    //trae el vendedor casa para asignarselo al idvendedor y al autorizo
    querys('select idusuario,nombre from usuarios where nombre = '+quotedstr('CASA'),0,sqltemp1);
    if sqlclientes.FieldByName('idvendedor').AsInteger = 0 then
      begin
       edcve_vend.Text := sqltemp1.fieldbyname('idusuario').AsString;
       cbonom_vend.Text := sqltemp1.fieldbyname('nombre').AsString;
      end
    else
     begin
       edcve_vend.Text := sqlclientes.FieldByName('idvendedor').Asstring;
       //trae el nombre del usuario
       querys('select concat(nombre,'' '',apaterno,'' '',amaterno) as nombre from usuarios where idusuario='+ sqlclientes.FieldByName('idvendedor').Asstring,0,sqltemp);
     end;
   end;

   if edCveAutorizo.Text = '0' then
   begin
      try
         querys('SELECT concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' '')) AS Nombre,u.idusuario as idu FROM usuarios  as u INNER JOIN UCTabUsers as uc ON(uc.UCIdUser = u.idusuario) WHERE  uc.UCUserName = '+quotedstr(frmprincipal.ucprincipal.CurrentUser.username),0,Sqltemp);

         // edcveautorizo.Text :=sqlgeneral.fieldbyname('idu').AsString;
          edcveautorizo.Text := sqltemp.fieldbyname('idu').AsString;
          cboNomAutorizo.Text := sqltemp.fieldbyname('Nombre').AsString;
      except
        edCveAutorizo.Text:='0';
      end;
   end;
//else
 // begin
   //trae el nombre del usuario
  // querys('select concat(nombre,'' '',apaterno,'' '',amaterno) as nombre from usuarios where idusuario='+edCveAutorizo.Text,0,sqltemp);
   //cboNomAutorizo.Text:=sqltemp.Fields.Fields[0].AsString;
  //end;

case cboestatus.Itemindex of
0: begin  btnmodificar.Enabled:=true; btnregresar.Visible := false; end;
1: begin  btnmodificar.Enabled:=false; application.MessageBox('Este Pedido Ha sido Cancelado','Aviso',mb_iconinformation); end;
2: begin  btnmodificar.Enabled:=true; btnregresar.Visible := false; end;
3: begin  btnregresar.Visible := true; btnmodificar.Enabled:=true; end;
4: begin  btnmodificar.Enabled:=true; btnregresar.Visible := false; end;
5: begin  btnmodificar.Enabled:=false; application.MessageBox('Este Pedido es saldado por alguna cortesia o bonificacion etc..., no se permite modificarlo','Aviso',mb_iconinformation); end;
6: begin  btnmodificar.Enabled:=true; btnregresar.Visible := false; end; // pedido facturado anualidades y ventas con mas de 1 monitoreo.
end;
  sqlrejillaedit.Close;
  sqlrejillaedit.ParamByName('idpedido').asinteger:=strtoint(edNumPedido.Text);
  sqlrejillaedit.Open;
  dsrejilla.DataSet:=sqlrejillaedit;
end;

procedure tfrmpedidos.limpia;
begin
    REConcepto.Clear;
    RENotaInst.Clear;
    btnremisionar.Tag:=0;
    btnfacturar.Tag := 0;
    pcpedidos.TabIndex:=0;
    lbufh.Caption := '';
    if btnalta.Caption='&Alta' then
    begin
      edNumPedido.Enabled:=true;
      edNumPedido.Text:='';
      edNumPedido.SetFocus;
    end;
    gbotros.Enabled:=false;
  //  cboLinea.ItemIndex := -1;
    cboformapago.ItemIndex := 0;
    edTipoOportunidad.Text:='';
    cboNom_Toportunidad.Text:='';
    ednum_origen.Text:='';
    cbonom_origen.Text:='';
    TSfacturacion.TabVisible:=false;
    TSfacturacion.TabEnabled:=false;
    edTCP.Clear;
    edCHP.Clear;
    edFechaCreacion.Clear;
    edFechaCierre.Clear;
    edFechaVencimiento.Clear;
    edPresupuesto.Clear;
    edcve_vend.Clear;
    edCveAutorizo.Clear;
    edcvecte.Clear;
    cbonom_vend.text:='';
    edpresupuesto.Enabled:=false;
   // cboLinea.Enabled:=false;
    edFechaVencimiento.Enabled:=false;
    sqlpedidos.Close;
    sqlclientes.Close;
    sqlrejillaEdit.Close;
    sqlrejillaAlta.Close;
    cboestatus.Text:='';
   // edfechainstalacion.Date:=date;
  //  edfechainstalacion.Text:=datetostr(date);
    edcvecte.Enabled:=false;
    LimpiaTotales;
    cboNomAutorizo.Text:='';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    edinstalacion.text:='0';
end;

procedure tfrmpedidos.VendeConBackOrder(art:string;cant,pzs:integer);
  var unipzs,dif,existencias,pzsxunidad,id:integer;  idrequi,idmovi:string;
begin
try
 id := sqltemp.fieldbyname('id').Asinteger;
except
 id := 0;
end;

if pzs > 0 then
  unipzs := 1
else
  unipzs := 0;

querys('select apartado,ordenados,existencia,piezasxunidad,backorder, inventariable from articulos where cod_cve='+quotedstr(art),0,sqlgeneral);
existencias := sqlgeneral.fieldbyname('existencia').AsInteger;
pzsxunidad := sqlgeneral.fieldbyname('piezasXunidad').AsInteger;
dif := existencias - ((cant*pzsxunidad) + pzs);
if sqlgeneral.fieldbyname('inventariable').AsInteger = 0 then
  exit;
if dif < 0 then   //if application.MessageBox(pchar('El articulo con clave '+art+' cuenta con '+inttostr(existencias div pzsxunidad)+' Unidades, '+inttostr(existencias mod pzsxunidad)+' Piezas, '+sqlgeneral.fieldbyname('backorder').Asstring+' en BackOrder y usted esta pidiendo '+inttostr(cant)+' Unidades y '+inttostr(pzs)+' Piezas, desea crear BackOrder?'),'Aviso',mb_yesno)=idyes then
  begin
  ReNotaInst.Text := ReNotaInst.Text + ' Vendio con BackOrder el articulo:'+art;
  querys('select max(idrequisicion) from requisiciones',0,sqlgeneral);
  idrequi:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);

  //Trae el idmovi de TipoMov
  querys('select idmovi from TipoMov where nombre = "PEDIDOS"',0,sqlgeneral);
  idmovi := inttostr(sqlgeneral.Fields.Fields[0].Asinteger);

  if existencias = 0 then
    begin
    //inserta en la tabla de requisiciones
    querys('insert into requisiciones (idrequisicion,fecha,hora,usuario,cod_cve,cantidad,idmovi,idmaq,piezas) values ('+
           idrequi+',"'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'","'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
           '","'+art+'",'+inttostr(((cant*pzsxunidad)+pzs)-existencias)+','+idmovi+','+frmprincipal.idmaq+','+floattostr(unipzs)+')',1,sqlgeneral);
    querys('update articulos set backorder=backorder+'+inttostr((cant*pzsxunidad)+pzs)+' where cod_cve='+quotedstr(art)+' and inventariable = 1',1,sqlgeneral);
     // try
        querys('delete from DetPedidoTemp where id='+inttostr(id),1,sqlgeneral);
        {//exit;
      except
        //exit;
      end;}
    end
  else
    begin
    //modificado dalila
    //querys('update articulos set existencia=0, backorder=backorder+('+inttostr(abs(((cant*pzsxunidad)+pzs)-existencias))+') where cod_cve='+quotedstr(art),1,sqlgeneral);
    querys('update articulos set existencia=0, backorder=backorder+('+inttostr(abs(dif))+') where cod_cve='+quotedstr(art)+' and inventariable = 1',1,sqlgeneral);
    //querys('update articulos set existencia=0, apartado=apartado+'+inttostr(existencias)+', backorder=backorder+('+inttostr(abs(((cant*pzsxunidad)+pzs)-existencias))+') where cod_cve='+quotedstr(art),1,sqlgeneral);
    //inserta en la tabla de requisiciones
    querys('insert into requisiciones (idrequisicion,fecha,hora,usuario,cod_cve,cantidad,idmaq,idmovi,piezas) values ('+
           idrequi+',"'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'","'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
           '",'+quotedstr(art)+','+inttostr(((cant*pzsxunidad)+pzs)-existencias)+','+frmprincipal.idmaq+','+idmovi+','+floattostr(unipzs)+')',1,sqlgeneral);
    //actualiza el articulo actual de DetPedidoTemp pone la cantidad que tenemos en existencia
    if id <> 0 then
      begin
      if cant>0 then
        querys('update DetPedidoTemp set cant='+inttostr(existencias div pzsxunidad)+',surtido=1 where id='+inttostr(id),1,sqlgeneral)
       else
        querys('update DetPedidoTemp set piezas='+inttostr(existencias)+',surtido=1 where id='+inttostr(id),1,sqlgeneral)
      end;
    end;
  end;
  querys('select idmovi from TipoMov where nombre = "VTA/SIN/EXIST"',0,sqlgeneral);
        idmovi:=sqlgeneral.Fields.Fields[0].AsString;
        querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) values ("'+
               edcodigo.Text+'","E",'+idmovi+',"'+datetostr(date)+'",'+ednumpedido.Text+','+
               inttostr(abs(dif))+',0, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+
               FormatDateTime('HH:mm:ss',Time)+'", "Backorder por venta sin existencia")',1,sqlgeneral);
end;


function tfrmpedidos.TraePresupuesto(idpresupuesto:string):integer;
var estatus,art,nomart,precio, hrsins, hrsvta:string;   //  ,top
cant,pzs,valor,pzsxunidad,temp,unipzs,idCardexArt,idrequi:integer; //band,paquete, idmovi,
monto,porcentaje : double;
chrr:Char;
begin
pzs:=0;
//0=No surtido, 1=Surtido Completo, 2=Surtido incompleto con backorder, 3=cancelado
if btnalta.Caption = '&Alta' then
estatus:='1'
else
estatus:='0';
querys('SELECT o.idoportunidad, concat(u.nombre," ",u.apaterno," ",u.amaterno) AS Vendedor, p.idvendedor, '+
       'p.TipoCambio, p.CostoXHrs, p.FechaCreacion, if(o.cuenta = 0  or o.cuenta is null, clientes.idcliente, '+
       'o.cuenta) AS cuenta, agenda_vendedores.idtipo_oportunidad, tipo_oportunidad.nombre as Toportunidad, '+
       'o.idorigen, origen.nombre AS origen, p.PresupDefault, p.idopcion FROM presupuestos2 '+
       'as p Left JOIN usuarios as u ON (p.idvendedor = u.idusuario) LEFT JOIN oportunidades as o ON '+
       '(p.idoportunidad = o.idoportunidad) '+
       'LEFT  JOIN agenda_vendedores ON  (o.idoportunidad = agenda_vendedores.idoportunidad) LEFT JOIN '+
       'tipo_oportunidad ON (agenda_vendedores.idtipo_oportunidad = tipo_oportunidad.idtipo_oportunidad) '+
       'left JOIN origen ON (o.idorigen = origen.idorigen) LEFT JOIN clientes ON (p.idcliente=clientes.idcliente) '+
       'WHERE p.estatus='+estatus+' and p.idpresupuesto= '+idpresupuesto,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  if sqlgeneral.fieldbyname('cuenta').AsInteger = 0 then //significa que no se ha cerrado el evento
  begin
    application.MessageBox(pchar('Este presupuesto es de la oportunidad #'+sqlgeneral.fieldbyname('idoportunidad').AsString+
    ' que aun su estatus no es cerrada, debe cerrarla en la pantalla agenda del vendedor para poder continuar con este pedido!'),'Aviso',mb_iconinformation);
    limpia;
    edpresupuesto.Enabled:=true;
    edcvecte.Enabled:=true;
    edpresupuesto.SetFocus;
    result:=0;
    exit;
  end;
  if (sqlgeneral.fieldbyname('PresupDefault').AsInteger = -1) or (sqlgeneral.fieldbyname('idopcion').AsInteger = -1) then
  begin
    application.MessageBox('No ha definido el presupuesto que pasara a pedido, definalo en la pantalla de presupuestos','Aviso',mb_iconinformation+mb_ok);
    limpia;
    edpresupuesto.Enabled:=true;
    edcvecte.Enabled:=true;
    edpresupuesto.SetFocus;
    result:=0;
    exit;
  end;

  //aqui significa que ya se le ha dado un estatus de finalizado al evento
  edcve_vend.Text := sqlgeneral.fieldbyname('idvendedor').AsString;
  cbonom_vend.Text := sqlgeneral.fieldbyname('vendedor').AsString;
  querys('select idUnidadNegocio from tipo_oportunidad where idtipo_oportunidad='+sqlgeneral.fieldbyname('idtipo_oportunidad').AsString,0,dmreportes.sqlgeneral);
  edTipoOportunidad.Text:=dmreportes.sqlgeneral.fieldbyname('idUnidadNegocio').AsString;
  chrr:=#13;
  edTipoOportunidad.OnKeyPress(self,chrr);
  cbonom_TOportunidad.OnClick(self);
  ednum_origen.Text := sqlgeneral.fieldbyname('idorigen').AsString;
  cbonom_origen.Text := sqlgeneral.fieldbyname('origen').AsString;
  edcostohrs.Text := sqlgeneral.fieldbyname('CostoXHrs').AsString;
  edCHP.Text := sqlgeneral.fieldbyname('CostoXHrs').AsString;

  //muestrea los datos del cliente
  sqlclientes.Close;
  sqlclientes.ParamByName('idcliente').AsInteger:=sqlgeneral.fieldbyname('cuenta').AsInteger;
  sqlclientes.Open;
  //verifica que el giro del cliente tenga el costo anual y el mensual tecleado
  querys('select CostoAnual,CostoMensual from categorias where nombre='+quotedstr(sqlclientes.Fieldbyname('Categoria').AsString),1,sqlgeneral);
  if sqlgeneral.FieldByName('CostoAnual').AsString = '' then
    begin
    application.MessageBox(pchar('La Categoria '+sqlclientes.Fieldbyname('Categoria').AsString+' no tiene especificado el Costo Anual de monitoreo, definalo y vuelva a intentar'),'Cuidado',mb_iconwarning);
    result :=0;
    exit;
    end;
  if sqlgeneral.FieldByName('CostoMensual').AsString = '' then
    begin
    application.MessageBox(pchar('La Categoria '+sqlclientes.Fieldbyname('Categoria').AsString+' no tiene especificado el Costo Mensual de monitoreo, definalo y vuelva a intentar'),'Cuidado',mb_iconwarning);
    result :=0;
    exit;
    end;
  if sqlclientes.fieldbyname('precio').AsString = '' then
    begin
    //application.MessageBox('Este cliente no tiene definido el precio, favor de entrar a la pantalla de clientes y asignarle un precio, en este momento y para esta venta se le asignara el precio A','Cuidado',mb_iconwarning);
    precio := 'articulos.precioa';
    end
  else
    precio :='articulos.precio'+lowercase(sqlclientes.fieldbyname('precio').AsString);

  //para cuando estan editando
  if (btnalta.Caption='&Alta')and(btnmodificar.caption='&Editar') then
    begin
    sqlrejillaedit.Close;
    sqlrejillaedit.ParamByName('idpedido').asinteger:=strtoint(edNumpedido.Text);
    sqlrejillaedit.Open;
    dsrejilla.DataSet:=sqlrejillaedit;
    CalculaTotales(sqlrejillaedit);
    end;

  if btnalta.Caption='&Guardar' then
    begin
    {querys('delete from DetPedidoTemp where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
    querys('insert into DetPedidoTemp(idmaq,cant,cod_cve,surtido,costo,tc) select '+frmprincipal.idmaq+', '+
           'sum(cant),d.cod_cve,0,round(d.costo,2), if(a.moneda ="P", 1, '+edTCP.Text+') as tc '+
           'from DetPresupuestos2 as d inner join presupuestos2 as p on d.idpresupuesto=p.idpresupuesto '+
           'inner join articulos as a on a.cod_cve=d.cod_cve where p.idpresupuesto='+edpresupuesto.Text+
           ' and d.idopcion=p.PresupDefault group by cod_cve order by cant',1,sqlgeneral);}

    //trae los articulos del presupuesto para validar que halla existencias de no ser asi se ajustara
    //querys('select * from DetPedidoTemp where idmaq='+frmprincipal.idmaq,0,sqltemp);
    querys('select '+frmprincipal.idmaq+', '+
           'sum(cant) as cant, d.cod_cve, 0 as surtido, round(d.costo,2) as costo , if(a.moneda ="P", 1, '+edTCP.Text+') as tc '+
           'from DetPresupuestos2 as d inner join presupuestos2 as p on d.idpresupuesto=p.idpresupuesto '+
           'inner join articulos as a on a.cod_cve=d.cod_cve where p.idpresupuesto='+edpresupuesto.Text+
           ' and d.idopcion=p.PresupDefault group by cod_cve order by cant',0,sqltemp);
    sqltemp.First;
    while not sqltemp.Eof do
      begin
      btnagregar.Tag:=0;
      cant:=sqltemp.fieldbyname('cant').Asinteger;
      art:=sqltemp.fieldbyname('cod_cve').AsString;
      edprecio.text :=sqltemp.fieldbyname('costo').AsString;
      //querys('select piezasxunidad,nombre,inventariable from articulos where cod_cve='+quotedstr(art),0,sqlgeneral);
      querys('select piezasxunidad,nombre,inventariable, tinstalacion, tinstalacionCom from articulos where cod_cve='+quotedstr(art),0,sqlgeneral);
      hrsins := sqlgeneral.fieldbyname('tinstalacion').asstring;
      hrsvta := sqlgeneral.fieldbyname('tinstalacionCom').asstring;
      pzsxunidad:=sqlgeneral.fieldbyname('piezasxunidad').asinteger;
      nomart := sqlgeneral.fieldbyname('nombre').asstring;

      if sqlgeneral.fieldbyname('inventariable').asinteger = 1 then
        begin
        valor:=ValidaExistencias(art,cant,false);
        unipzs:=0;
        chkpiezas.Checked:=false;
        temp:=0;
        if valor <> 0 then
          begin
          if temp = 0 then  //MOVIDO dalila
            VendeConBackOrder(art,cant,pzs);

          InsertaArticulo(sqlrejillaalta,'DetPedidoTemp','idmaq',frmprincipal.idmaq,art,cant,idrequi,idCardexArt);

          querys('insert into CardexArt(cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,piezas,usuario,HoraMov, descripcion) values ("'+
                 edcodigo.Text+'", "S",14,"'+datetostr(date)+'", '+ednumpedido.Text+','+inttostr(cant)+','+inttostr(pzs)+
                 ',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+FormatDateTime('HH:mm:ss',Time)+
                 '", "Apartado por Venta")',1,sqlgeneral);
          end
        else
          InsertaArticulo(sqlrejillaalta,'DetPedidoTemp','idmaq',frmprincipal.idmaq,art,cant,idrequi,idCardexArt);
        end
      else
        InsertaArticulo(sqlrejillaalta,'DetPedidoTemp','idmaq',frmprincipal.idmaq,art,cant,idrequi,idCardexArt);
      edprecio.text := '';
      sqltemp.Next;
      end; //del while que recorre los articulos
    //para insertar los cargos descuentos o financiamientos del presupuesto
    querys('select sum(dp.cant*dp.tiempo) as Mo,sum(dp.cant*dp.tiempo*p.CostoXHrs) as TotMo from DetPresupuestos2 as dp inner join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto where dp.idpresupuesto='+edpresupuesto.Text+' and  dp.idopcion='+inttostr(opcion)+' group by dp.idpresupuesto',0,sqltemp);
    //para los cargos
    if (copy(tipooportunidad,1,8)<>'CONEXION') and (tipooportunidad<>'ENLACE') and (tipooportunidad<>'RECONEXION') then
      begin
      if sqltemp.FieldByName('TotMo').AsFloat <> 0 then //sync
        {querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant, usuario, fecha, hora) values ('+
               frmprincipal.idmaq+',"CARGOS",'+format('%8.2f',[sqltemp.FieldByName('TotMo').AsFloat])+','+edtcp.Text+',1, "'+
               frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'")',1,sqlgeneral);}
        querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant, usuario, fecha, hora, hrsins, hrsvta) values ('+
               frmprincipal.idmaq+',"CARGOS",'+format('%8.2f',[sqltemp.FieldByName('TotMo').AsFloat])+','+edtcp.Text+',1, "'+
               frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'", "'+
               hrsins+'", "'+hrsvta+'")',1,sqlgeneral);
      end;
    {else
    begin
       if edgiro.Text='COMERCIAL' then
       begin
         querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant) values ('+frmprincipal.idmaq+','+
         quotedstr('CARGOS COMERCIAL')+',27.27'+',0'+',1)',1,sqlgeneral);
       end;
    end;}
    //para el decuento o el financiamiento
    //querys('select sum((d.cant*d.costo)+(d.cant*d.tiempo*e.CostoXHrs)) as Total from DetPresupuestos2 as d inner join presupuestos2 as e on d.idpresupuesto = e.idpresupuesto where e.idpresupuesto = '+edpresupuesto.Text+' and d.idopcion<e.PresupDefault',0,sqlgeneral);
    //monto := sqlgeneral.fieldbyname('Total').AsFloat;
    querys('select sum((dp.cant*dp.tiempo*p.CostoXHrs)+(dp.cant*dp.costo)) as Total,FormasPagoPre.porcentaje from DetPresupuestos2  as dp inner join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto inner join FormasPagoPre on FormasPagoPre.idopcion = '+
           ' p.idopcion where dp.idpresupuesto='+edpresupuesto.Text+' and dp.idopcion=p.PresupDefault group by dp.idpresupuesto',0,sqlgeneral);
    monto :=  sqlgeneral.fieldbyname('Total').AsFloat;
    porcentaje := sqlgeneral.fieldbyname('porcentaje').AsFloat;
    monto := monto * (porcentaje/100);
    {if porcentaje > 0 then //descuento    //sync u f hora
      querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant, usuario, fecha, hora) values ('+frmprincipal.idmaq+','+quotedstr('DESCUENTO PP')+','+format('%8.2f',[(-1)*monto])+','+edtcp.Text+',1,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'")',1,sqlgeneral)
    else
      if porcentaje < 0 then
        querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant, usuario, fecha, hora) values ('+frmprincipal.idmaq+','+quotedstr('FINAN')+','+format('%8.2f',[(-1)*monto])+','+edtcp.Text+',1, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'")',1,sqlgeneral);}
    if porcentaje > 0 then //descuento    //sync u f hora
      querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant, usuario, fecha, hora, hrsins, hrsvta) values ('+
              frmprincipal.idmaq+','+quotedstr('DESCUENTO PP')+','+format('%8.2f',[(-1)*monto])+','+edtcp.Text+',1,"'+
              frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'", "'+
               hrsins+'", "'+hrsvta+'")',1,sqlgeneral)
    else
      if porcentaje < 0 then
        querys('insert into DetPedidoTemp (idmaq,cod_cve,costo,tc,cant, usuario, fecha, hora, hrsins, hrsvta) values ('+
               frmprincipal.idmaq+','+quotedstr('FINAN')+','+format('%8.2f',[(-1)*monto])+','+edtcp.Text+',1, "'+
               frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'", "'+
               hrsins+'", "'+hrsvta+'")',1,sqlgeneral);
    end;//guardar
  //Quien Autorizo
  querys('Select UCIdUser from UCTabUsers where UCLogin ="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"', 0, sqlgeneral);
  edCveAutorizo.Text := SqlGeneral.FieldByName('UCIdUser').asstring;
  chrr:=#13;
  edCveAutorizo.OnKeyPress(Self, chrr);
  //carga los detalles en la rejilla
  sqlrejillaalta.Close;
  sqlrejillaalta.ParamByName('idmaq').asstring:=frmprincipal.idmaq;
  sqlrejillaalta.Open;
  dsrejilla.DataSet:=sqlrejillaalta;
  CalculaTotales(sqlrejillaalta);
  gbarticulo.Enabled:=true;
  edcodigo.SetFocus;
  TSfacturacion.TabVisible:=true;
  result:=1;
  end
else
  begin
  application.MessageBox('Ese numero de cotizacion no existe o ya se le realizo pedido, verifique he intente de nuevo.','Aviso');
  edpresupuesto.Text:='';
  sqlclientes.Close;
  LimpiaTotales;
  TSfacturacion.TabVisible:=false;
  result:=0;
  end;
end;

procedure tfrmpedidos.LimpiaTotales;
begin
edTotMat.Text:='0';
edTotHrs.Text:='0';
edTotHrsCom.Text:='0';
edCostoHrs.Text:='0';
edHoras.Text:='0';
edDescuento.Text:='0';
edIva.Text:='0';
edTotdlls.Text:='0';
edTotMn.Text:='0';
edAnticipo.Text:='0';
edSaldo.Text:='0';
//DescPP.text:='0';
end;

procedure Tfrmpedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//UnLockArt('',true);
conexionp.Disconnect;
action:=cafree;
end;

procedure Tfrmpedidos.bonificacion(mes:string);
begin
   querys('select * from bonificaciones where idcliente='+edcvecte.Text+' and mes="'+UpperCase(mes)+'" and ano='+inttostr(frmmesesremision.anio),0,DMREPORTES.sqlgeneral);
   if DMREPORTES.sqlgeneral.RecordCount > 0 then
      application.MessageBox(pchar('Ya existe la bonificacion de: '+mes+' '+inttostr(frmmesesremision.anio)),'Aviso',mb_iconinformation)
   else
   begin
      querys('insert into bonificaciones(idcliente,mes,ano,usuario,fecha,hora,NumMes) values ('+edcvecte.Text+',"'+UpperCase(mes)+'",'+inttostr(frmmesesremision.anio)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+','+inttostr(idmes(mes))+')',1,DMREPORTES.sqlgeneral);
   end;
end;

procedure Tfrmpedidos.btnaltaClick(Sender: TObject);
//var NumPed,idlinea:integer;      ,m   NumPedAnt,
//tc : double;
begin
//idlinea:=0;
//campo estatus de los detalles descripcion
//0=no surtido 1=surtido 2=cancelado
   if btnalta.Caption='&Alta' then
   begin
      limpia;
       //LIMPIA LA TABLA DE DETPEDIDOSTEMP
      querys('delete from DetPedidoTemp where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
      gbtotales.Enabled:=true;
      
      gbotros.Enabled:=true;
      edTipoOportunidad.Enabled := true;
      cbonom_TOportunidad.Enabled := true;
      edvtasxcta.Enabled := false;
      edvtasxcta.Clear;
      //trae el maximo idpedido + 1
      querys('select max(idpedido) as idpedido from pedidos',0,sqlgeneral);
      edNumPedido.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      edNumPedido.Enabled:=false;
      CargaUnidadNegocio;
      edFechaCreacion.Text:=datetostr(date);
      cboestatus.ItemIndex:=0;
      EDtcp.Enabled:=true;
      EDchp.Enabled:=true;
      btnalta.Caption:='&Guardar';
      btnalta.Hint:='Guardar los datos de la alta';
      btnalta.ImageIndex:=1;
      btncancelar.Caption:='&Cancelar';
      btncancelar.Hint:='Cancelar la Alta';
      pnlfacturacion.Enabled:=true;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      edpresupuesto.Enabled:=true;
      reconcepto.Enabled := true;
      RENotaInst.Enabled := true;
      edcvecte.Enabled:=true;
      edanticipo.Enabled := true;
      cbiva.Enabled := true;
      cbiva.text := floattostr(getiva);
      //trae el tipo de combio y el precio por hora
      querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
      edTCP.Text:=format('%8.2f',[sqlgeneral.Fields.Fields[0].AsFloat]);
      //trae el costo de la hora por instalacion
      querys('select valor from configuraciones where concepto='+quotedstr('CostoHora'),0,SqlGeneral);
      edCHP.Text:=sqlgeneral.Fields.Fields[0].asstring;
      PrecioHora:=sqlgeneral.fields.fields[0].asfloat;
      querys('select * from pedidos limit 1,1',0,sqlpedidos);
      sqlpedidos.Insert;
      edcvecte.SetFocus;
      dsrejilla.DataSet := sqlrejillaalta;
      lbufh.Caption := '';
   end
   else    // ************** //GUARDAR \\ ************** \\
   begin
      if sqlclientes.RecordCount <> 0 then
      begin
         if (edcve_vend.Text = '') or (cbonom_vend.Text = '') then
         begin
            application.MessageBox('Debe de seleccionar un vendedor!','Aviso',mb_iconwarning);
            cbonom_vend.DroppedDown := true;
            exit;
         end;
         if (ednum_origen.Text = '') or (cbonom_origen.Text = '') then
          begin
            application.MessageBox('Debe de seleccionar el Origen!','Aviso',mb_iconwarning);
            cbonom_origen.DroppedDown := true;
            exit;
          end;

         if cbonom_TOportunidad.Text = '' then
         begin
            application.MessageBox('Debe de seleccionar la Unidad de Negocio!','Aviso',mb_iconwarning);
            cbonom_TOportunidad.AutoDropDown := true;
            exit;
         end;
         if cboFormaPago.Text = '' then
         begin
            application.MessageBox('Debe de seleccionar un Tipo de Pago!','Aviso',mb_iconwarning);
            cboFormaPago.AutoDropDown := true;
            exit;
         end;

         if reconcepto.Text = '' then
         begin
            application.MessageBox('Debe indicar el concepto de este pedido!','Aviso',mb_iconwarning);
            reconcepto.SetFocus;
            exit;
         end;

      
//*******************************************************************************************\\
//******** -----------> CREA BONIFICACIONES EN CASO DE SER UNA CORTESIA <----------- ********\\

         if cbonom_TOportunidad.Text = 'CORTESIA' then
         begin
            //verifica si y aexiste una bonificacion de ese mes y año
            if frmmesesremision.m1=1 then bonificacion('Enero');
            if frmmesesremision.m2=1 then bonificacion('Febrero');
            if frmmesesremision.m3=1 then bonificacion('Marzo');
            if frmmesesremision.m4=1 then bonificacion('Abril');
            if frmmesesremision.m5=1 then bonificacion('Mayo');
            if frmmesesremision.m6=1 then bonificacion('Junio');
            if frmmesesremision.m7=1 then bonificacion('Julio');
            if frmmesesremision.m8=1 then bonificacion('Agosto');
            if frmmesesremision.m9=1 then bonificacion('Septiembre');
            if frmmesesremision.m10=1 then bonificacion('Octubre');
            if frmmesesremision.m11=1 then bonificacion('Noviembre');
            if frmmesesremision.m12=1 then bonificacion('Diciembre');
         end;

//******** -----------> +++++++++++++++++++++++++++++++++++++++++++++++ <----------- ********\\
//*******************************************************************************************\\

         gbtotales.Enabled:=false;
         reconcepto.Enabled := false;
         RENotaInst.Enabled := false;
         edvtasxcta.Enabled := true;
         EDtcp.Enabled:=false;
         EDchp.Enabled:=false;
         //btnborrar.Enabled:=true;
         btnmodificar.Enabled:=true;
         pnlfacturacion.Enabled:=false;
         lblTotArts.Caption := '';
         //NumPedAnt:=strtoint(ednumpedido.Text);
         //trae el ultimo numero de  pedido
         querys('select max(idpedido) from pedidos',0,SqlGeneral);
         edNumpedido.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
         //NumPed:=sqlgeneral.Fields.Fields[0].Asinteger+1;
         //actualiza idpedido de la tabla DetPedidoTemp de la maquina actual
         querys('update DetPedidoTemp set idpedido='+ednumpedido.Text+' where idmaq='+frmprincipal.idmaq,1,sqlgeneral);

         if edcve_vend.text<>'' then
            sqlpedidos.fieldbyname('idvendedor').Asstring:=edcve_vend.Text
         else
            sqlpedidos.fieldbyname('idvendedor').Asstring:=inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
         //trae el idlinea de la tabla de lineas en base al nombre
         //querys('select idlinea from lineas where nombre = '+quotedstr(cbolinea.Text),0,sqlgeneral);
         // idlinea:=sqlgeneral.fieldbyname('idlinea').AsInteger;
         // sqlpedidos.fieldbyname('idlinea').Asinteger:=idlinea;
         //esta es cuando este pedido es continuacion de otro
         if cbonom_TOportunidad.Text = 'OTROS' then
         begin
            application.MessageBox('Este Pedido es continuacion de otro favor de indicar de cual en la siguiente ventana','Pregunta',mb_iconinformation);
            frmbusquedas.query:='SELECT pedidos.idpedido,if ((clientes.nombre = ''''  or clientes.nombre is null) and (clientes.apaterno=''''  or clientes.apaterno is null) and (clientes.amaterno=''''  or clientes.amaterno is null), clientes.rsocial ' +
                    ',concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as Cliente,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                    ',''Facturado'')))) as Estatus,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)';
            frmbusquedas.campo_retorno:='idpedido';
            frmbusquedas.tabla:='';
            repeat
               frmbusquedas.ShowModal;
            until frmbusquedas.resultado <> '';
               sqlpedidos.FieldByName('idPedidoPadre').Asstring :=frmbusquedas.resultado;
         end;

         sqlpedidos.Post;

         if frmmesesremision.chAnualidad.Checked=true then
            querys('update pedidos set anualidad='+frmmesesremision.edano.Text+' where idpedido='+edNumPedido.text,1,sqlgeneral);

         //ejecuta el cuadro de dialogo para ver que desea hacer
         frmprincipal.ucprincipal.Log('Dio de Alta el pedido '+edNumPedido.text,1);
         //saca los datos de DetPedidoTemp para insertarlo en DetPedido
         {querys('insert into DetPedido(cant,piezas,cod_cve,utilidad,idpedido,paquete,surtido,idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora) select cant,piezas,cod_cve,utilidad,idpedido,paquete,surtido,idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora '+
           ' from DetPedidoTemp where idmaq = '+frmprincipal.idmaq,1,SqlGeneral);}
         querys('insert into DetPedido(cant,piezas,cod_cve,utilidad,idpedido,paquete,surtido,idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora, hrsins, hrsvta) '+
                'select cant,piezas,cod_cve,utilidad,idpedido,paquete,surtido,idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora, hrsins, hrsvta '+
           ' from DetPedidoTemp where idmaq = '+frmprincipal.idmaq,1,SqlGeneral);
         //trae los articulos utilizados en este pedido
         querys('select distinct cod_cve from DetPedidoTemp where idmaq='+frmprincipal.idmaq,0,sqlgeneral);
         //  UnLockArt('',true);
         //Borra de la tabla DetPedidoTemp
         querys('delete from DetPedidoTemp where idmaq = '+frmprincipal.idmaq,1,SqlGeneral);
         querys('update requisiciones set iddoc='+ednumpedido.Text+',idmaq=-1 where idmaq='+frmprincipal.idmaq,1,sqlgeneral);

         application.MessageBox(pchar('Se Guardo con el pedido #'+ednumpedido.text),'Aviso',mb_iconinformation);
         querys('Select p.idpuesto From UCTabUsers AS tu Inner Join usuarios AS u'+
         ' ON tu.UCIdUser=u.idusuario Inner Join puestos as p ON u.idpuesto=p.idpuesto Where tu.UCUsername="'+
         frmprincipal.ucprincipal.CurrentUser.Username+'"',0,dmreportes.sqlgeneral);
         if dmreportes.sqlgeneral.FieldByName('idpuesto').AsString<>'1' then
         begin
            BorrarPed.CaptionTitle := 'Que desea hacer?';
            BorrarPed.Prompt := 'Operación a Realizar:';
            BorrarPed.Items.Clear;
            BorrarPed.Items.Add('Pedido');
            BorrarPed.Items.Add('Remisionar');
            BorrarPed.Items.Add('Facturar');
            BorrarPed.Items.Add('Facturar Electronicamente');

            if BorrarPed.Execute then
            begin
              if BorrarPed.Value = 1 then
                  btnremisionar.Click;

               if BorrarPed.Value = 2 then
                  begin
                  btnremisionar.Click;
                  btnfacturar.Click;
                  end;

               if BorrarPed.Value = 3 then
                  begin
                  btnremisionar.Click;
                  btnFE.Click;
                  end;
            end;
         end;
         if edpresupuesto.Text <> '' then
            //actualiza el campo status de la tabla de presupuestos a 1 para indicar que ya tiene un pedido
            querys('update presupuestos2 set estatus=1 where idpresupuesto='+edpresupuesto.Text,1,sqlgeneral);
            //actualiza los datos de hora,fecha de creacion y usuario
         querys('update pedidos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idpedido='+ edNumPedido.Text,1,sqlgeneral);
         limpia;
         LimpiaDatArt;
         LimpiaTotales;
         edNumPedido.Clear;
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta un Area';
         btncancelar.Caption:='&Cerrar';
         btncancelar.Hint:='Cerrar esta Ventana';
         btnalta.ImageIndex:=5;
         edNumPedido.Enabled:=true;
         edvtasxcta.SetFocus;
   end
   else
   begin
      application.MessageBox('No se Guardo ningun dato!!!','Aviso',mb_iconinformation);
      self.onshow(self);
      limpia;
      btnalta.Caption:='&Alta';
   end;
  end;
end;

procedure Tfrmpedidos.edpresupuestoButtonClick(Sender: TObject);
begin
{frmbusquedas.query:='SELECT presupuestos2.idpresupuesto,if(oportunidades.rsocial='''',concat(ifnull(oportunidades.nombre,''''),'' '',ifnull(oportunidades.apaterno,''''),'' '',ifnull(oportunidades.amaterno,'''')),oportunidades.rsocial) as Cliente, '+
                    'concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Vendedor,oportunidades.idoportunidad, presupuestos2.fecha,presupuestos2.hora FROM presupuestos2 left JOIN oportunidades ' +
                    'ON (presupuestos2.idoportunidad = oportunidades.idoportunidad) left JOIN usuarios ON (presupuestos2.idvendedor = usuarios.idusuario) left join clientes on presupuestos2.idcliente=clientes.idcliente where presupuestos2.estatus=0';}
frmbusquedas.query:='SELECT presupuestos2.idpresupuesto,presupuestos2.idoportunidad,clientes.idcliente,if(oportunidades.idoportunidad<>0,if(oportunidades.rsocial='''',concat(ifnull(oportunidades.nombre,''''),'' '',ifnull(oportunidades.apaterno,''''),'' '','+
                    'ifnull(oportunidades.amaterno,'''')),oportunidades.rsocial),if(clientes.rsocial='''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial)) as Cliente,'+
                    'concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Vendedor, presupuestos2.fecha,presupuestos2.hora FROM presupuestos2 left JOIN oportunidades ON (presupuestos2.idoportunidad = '+
                    ' oportunidades.idoportunidad) left JOIN usuarios ON (presupuestos2.idvendedor = usuarios.idusuario) left join clientes on presupuestos2.idcliente=clientes.idcliente';
frmbusquedas.campo_busqueda:='idpresupuesto';
frmbusquedas.campo_retorno:='idpresupuesto';
frmbusquedas.tabla:='';
frmbusquedas.tblorigen := 'presupuestos2';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  tecla:=#13;
  edpresupuesto.Text:=frmbusquedas.resultado;
  if application.MessageBox('Una vez seleccionado un presupuesto no podra cambiarlo, Esta seguro que desea cargar este presupuesto?','Pregunta',mb_yesno)=idyes then
   if TraePresupuesto(frmbusquedas.resultado) = 1 then
    begin
     edPresupuesto.Enabled:=false;
     gbotros.Enabled:=true;
    end;
   end;
end;

procedure Tfrmpedidos.edpresupuestoKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto(ednumpedido.Text+'.',key);
if (key = #13) and (edpresupuesto.Text <> '' ) then
   begin
     key:=#0;
      if application.MessageBox('Una vez seleccionado un presupuesto no podra cambiarlo, Esta seguro que desea cargar este presupuesto?','Pregunta',mb_yesno)=idyes then
       if TraePresupuesto(edpresupuesto.Text) = 1 then
        begin
         edpresupuesto.Enabled:=false;
       edcve_vend.setfocus;
         gbotros.Enabled:=true;
        end;
    end;

if (key = #13) and (edpresupuesto.Text = '') then
   begin
     key:=#0;
     edpresupuesto.OnButtonClick(self);
   end;
end;

procedure Tfrmpedidos.CargaCombo(sql,tabla:string;combo : TRzComboBox);
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
end;

procedure Tfrmpedidos.FormShow(Sender: TObject);
begin
monfe := 'P';
shortdateformat:='yyyy/mm/dd';
//carga los vendedores                                                                                                                                                                                                                             puestos.nombre = '+quotedstr('VENDEDOR')+' AND
CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
           ' WHERE  usuarios.estatus = 1 order by usuarios.nombre','Vendedores',cboNom_Vend);
//carga los origenes
CargaCombo('select nombre from origen order by nombre','Origenes',cboNom_origen);
//carga los usuarios que pueden autorizar                                                                                                                                                                                                           (puestos.nombre = '+quotedstr('VENDEDOR')+' AND
CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
           ' WHERE usuarios.estatus = 1 order by usuarios.nombre','Autorizadores de Pedidos',cbonomAutorizo);
CargaCombo2('SELECT valor, concepto from configuraciones where concepto in ("IVA", "IVA2") order by concepto','valor', 'concepto',cbiva);
CargaCombo2('SELECT concat("(", iniciales, ")", nombre) as nom, aplicaDescuento, iniciales FROM TiposPagos '+
            'where tipo in (1,2) ORDER BY idTipoPago asc','nom', 'iniciales', cbtipopago);

cbiva.AddItemValue('0', '0');
cbiva.AddItemValue('0.10', '10');
cbiva.AddItemValue('0.15', '15');
//carga las lineas
//CargaCombo('select nombre from lineas order by nombre','Linea',cboLinea);

//Carga las Unidades de Negocio
CargaUnidadNegocio;
{
querys('select UnidadNegocio from puestos as p left join areas as a on a.idarea=p.idarea where p.nombre="'+frmprincipal.PuestoUsuario+'" and a.nombre = "'+frmprincipal.AreaUsuario+'"', 0, sqlgeneral);
if sqlgeneral.FieldByName('UnidadNegocio').Asstring <> '' then
  begin
  if sqlgeneral.FieldByName('UnidadNegocio').Asstring = '0' then
    begin
    cargaCombo('select nombre from UnidadNegocio','Unidades de Negocio',cbonom_TOportunidad);
    edTipoOportunidad.Enabled := true;
    end
  else
    begin
    cargaCombo('select nombre from UnidadNegocio where idunidadnegocio in('+sqlgeneral.FieldByName('UnidadNegocio').Asstring+')','Unidades de Negocio',cbonom_TOportunidad);
    edTipoOportunidad.Enabled := false;
    end;
  end;
 }

{querys('select TodasUNPedidos from usuarios as u left join UCTabUsers as ut on(u.idusuario=ut.UCIdUser) where  UCLogin='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName), 0, sqlgeneral);
if sqlgeneral.FieldByName('TodasUNPedidos').asboolean = true then
 begin
  cargaCombo('select nombre from UnidadNegocio','Unidades de Negocio',cbonom_TOportunidad);
  edTipoOportunidad.Enabled := true;
 end
else
 begin
 cargaCombo('select nombre from UnidadNegocio where UNpedido=1','Unidades de Negocio',cbonom_TOportunidad);
 edTipoOportunidad.Enabled := false;
 end;}
requisicion:=0;
pcpedidos.TabIndex:=0;
     ednumpedido.Enabled:=true;
     btnalta.Enabled:=true;
     btncancelar.Enabled:=true;
//verifica que existan pedidos
{querys('select * from pedidos',0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   begin
     ednumpedido.Enabled:=true;
     btnalta.Enabled:=true;
     btncancelar.Enabled:=true;
   end
else
  begin
    edpresupuesto.Enabled:=false;
    ednumpedido.Enabled:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
sqlgeneral.close;}
TSfacturacion.TabVisible:=false;
if ednumpedido.enabled then
   ednumpedido.SetFocus;
end;

procedure Tfrmpedidos.btncancelarClick(Sender: TObject);
var i:integer;       //  temp:string;
begin
   if btncancelar.Caption='&Cancelar' then
   begin
      btncancelar.Hint:='Cerrar esta Pantalla';
      btncancelar.Caption:='&Cerrar';
      edvtasxcta.Enabled := true;
      edvtasxcta.Clear;
      edanticipo.Enabled := false;
      pnlfacturacion.Enabled:=false;
      edfechavencimiento.Enabled := false;
      reconcepto.Enabled := false;
      RENotaInst.Enabled := false;
      gbarticulo.Enabled:=false;
      lblTotArts.Caption := '';
      lbufh.Caption := '';
      ckinstpend.Checked := false;
     if btnmodificar.Enabled then
     begin
         //trae los articulos utilizados en este pedido
         querys('select distinct cod_cve from DetPedido',0,sqlgeneral);
         //UnLockArt('',true);
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del pedido actual';
         btnmodificar.ImageIndex:=2;
     end;

     if btnalta.Enabled then
     begin
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Crear un Pedido';
         btnalta.ImageIndex:=5;
         try
           //dsrejilla.DataSet.fieldbyname('cod_cve').AsString,true
          Sqlrejillaalta.First;
          while not Sqlrejillaalta.Eof do
               begin
                     RegresaExistencias(edNumPedido.Text,Sqlrejillaalta.fieldbyname('cod_cve').AsString,true,dsrejilla);
                     sqlrejillaalta.Next;
               end;

         except
            EDtcp.Enabled:=false;
         end;
         // UnLockArt('',true);
         //trae el indice del concepto DEV/VTA/SIN/EXIST para insertar la cancelacion de los articulos
         {querys('select idmovi from TipoMov where nombre='+quotedstr('DEV/VTA/SIN/EXIST'),0,sqlgeneral);
         temp:=sqlgeneral.Fields.Fields[0].AsString;
         //trae los registros que se insertaron en el cardex
         {   querys('SELECT CardexArt.cod_cve,CardexArt.movimiento,CardexArt.idmovi,CardexArt.FechaMov,CardexArt.iddoc,CardexArt.cant,CardexArt.costo,CardexArt.usuario,CardexArt.HoraMov,CardexArt.IdCardexArt FROM DetPedidoTemp INNER JOIN '+
             'CardexArt ON (DetPedidoTemp.IdCardexArt = CardexArt.IdCardexArt) WHERE DetPedidoTemp.idmaq ='+frmprincipal.idmaq,0,sqltemp);
         sqltemp.First;
         while not sqltemp.Eof do
         begin
         querys('insert into CardexArt (cod_cve,idmovi,movimiento,FechaMov,iddoc,cant,usuario,HoraMov) values ('+quotedstr(sqltemp.fieldbyname('cod_cve').AsString)+','+temp+',''S'','+quotedstr(datetostr(FechaServidor))+','+ednumpedido.text+','+sqltemp.fieldbyname('cant').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(timetostr(HoraServidor))+')',1,sqlgeneral);
         sqltemp.Next;
         end; }
         //limpia la tabla de DetPedidoTemp
         querys('delete from DetPedidoTemp where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
         //elimina las requisiciones hechas por este pedido
         querys('delete from requisiciones where idorden=0 and idmaq='+frmprincipal.idmaq,1,sqlgeneral);
         EDtcp.Enabled:=false;
         EDchp.Enabled:=false;
     end;

      {  if btnremisionar.Tag=1 then
          begin
        //actualiza la tabla de pedidos el campo remisionado a 1
         querys('update pedidos set remisionado=1 where idpedido='+ednumpedido.Text,1,sqlgeneral);
          //busca el maximo numero de remision mas 1
         querys('select max(idremision) as id from pedidos',0,sqlgeneral);
         if sqlgeneral.RecordCount > 0 then
           querys('update pedidos set idremision='+inttostr(sqlgeneral.Fields.Fields[0].AsInteger+1),1,sqlgeneral);
        end;}
     LimpiaDatArt;
     limpia;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edvtasxcta.SetFocus;
     self.OnShow(self);
   end
   else
   begin
      if BuscaForma(Tfrmprospectos.ClassName)=1 then
      begin
         for i:=0 to screen.FormCount-1 do
         begin
            if screen.Forms[i].Name='frmprospectos' then
            begin
               screen.Forms[i].Release;
               exit;
            end;
         end;
      end;
      if BuscaForma(Tfrmasig_even_vend.ClassName)=1 then
      begin
         for i:=0 to screen.FormCount-1 do
         begin
            if screen.Forms[i].Name='frmasig_even_vend' then
            begin
               screen.Forms[i].Release;
               exit;
            end;
         end;
      end;
      if BuscaForma(Tfrmpresupuestos2.ClassName)=1 then
      begin
         for i:=0 to screen.FormCount-1 do
         begin
            if screen.Forms[i].Name='frmpresupuestos2' then
            begin
               screen.Forms[i].Release;
               exit;
            end;
         end;
      end
      else
         Release;
   end;
end;

procedure Tfrmpedidos.edcompaniaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmpedidos.edNumPedidoButtonClick(Sender: TObject);
begin
 frmbusquedas.query:='SELECT p.idpedido,'+ClienteNombre('c')+' as cliente, case p.estatus when 0 then "Pedido" '+
                     'when 1 then  "Cancelado" when 2 then "BackOrder" when 3 then "Remisionado" when 4 then "Facturado" '+
                     'when 5 then "Remisionado2" end as Estatus,p.TotMn, p.FechaCreacion, p.usuario, p.fecha, p.hora '+
                     'FROM pedidos p left JOIN clientes c ON p.idcliente = c.idcliente '+
                     'where year(p.FechaCreacion) between (year(curdate()) - 1) and year(curdate()) order by idpedido desc';
 frmbusquedas.campo_busqueda:='idpedido';
 frmbusquedas.campo_retorno:='idpedido';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'pedidos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
              tecla:=#13;
              edNumPedido.Text:=frmbusquedas.resultado;
              edNumPedido.OnKeyPress(self,tecla);
            end;
end;

procedure Tfrmpedidos.edNumPedidoKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto(ednumpedido.Text+'.',key);

if (key = #13) and (edNumPedido.Text <> '') then
   begin
    key:= #0;
    querys('select idpedido from pedidos where idpedido='+edNumPedido.Text,0,SqlGeneral);
    if SqlGeneral.RecordCount > 0 then
     begin
      TraePedido(strtoint(edNumPedido.Text));
      MuestraRemiciones(edNumPedido.Text);
      dsrejilla.DataSet := sqlrejillaedit;
     end
    else
       begin
        application.MessageBox('El numero de pedido tecleado no existe','Aviso',mb_iconinformation);
        limpia;
       end;
   end;

if (key=#13)and(edNumPedido.Text='') then
    edNumpedido.OnButtonClick(self);

if key = #27 then
   begin
   limpia;
   key:=#0;
   end;
end;

procedure Tfrmpedidos.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
 begin
  edvtasxcta.Enabled := false;
  edvtasxcta.Clear;
  edanticipo.Enabled:=false;
  edanticipo.Enabled := true;
  reconcepto.Enabled := true;

  //#boletas 2009
  {if (cbonom_TOportunidad.Text <> 'MONITOREO') then
   reconcepto.Enabled := true;}

  RENotaInst.Enabled := true;
  gbtotales.Enabled:=true;
  gbotros.Enabled:=true;

  btnrecalcular.Enabled:=true;
  edTCP.Enabled:=true;
  edCHP.Enabled:=true;
  rejilla.Enabled:=true;
  edNumPedido.Enabled:=false;
  edsaldo.Enabled := false;
  frmprincipal.ucprincipal.Log('Dio click en el boton editar de Pedidos',0);
  btnmodificar.Caption:='&Guardar';
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Edición';
  btnmodificar.hint:='Guarda los Cambios Realizados';
  btnmodificar.ImageIndex:=1;
  btnalta.Enabled:=false;
  btnborrar.Enabled:=false;
  edFechaCierre.Enabled:=true;
  pnlfacturacion.Enabled:=true;
  if DerechosSys('Modificar Fecha de Vencimiento Pedidos') then
      edfechavencimiento.Enabled := true;
  if uppercase(cboestatus.text) = 'PEDIDO' then
    cbiva.Enabled := true
  else
    begin
    //gbotros.Enabled := false;
    gbotros.Enabled := true;

    if uppercase(cboestatus.text) = 'REMISIONADO' then
      begin
      edTipoOportunidad.Enabled := true;
      cbonom_TOportunidad.Enabled := true;
      end;

    if DerechosSys('Modificar Unidad de Negocio despues de pedido') then
      begin
      edTipoOportunidad.Enabled := true;
      cbonom_TOportunidad.Enabled := true;
      end
    else
      begin
      edTipoOportunidad.Enabled := false;
      cbonom_TOportunidad.Enabled := false;
      end;

    end;


  btnremisionar.Enabled := false;
  btntxt.Enabled := false;
  HabilitarBotonesFE(false);
  //btnfacturar.Enabled := false;
  //btnFE.Enabled := false;
  //btnfedlls.Enabled := false;
  //btnFactTraspaso.Enabled := false;
  //rgtransferencia.Enabled := false;
  btnparcializar.Enabled := false;

    //verifica si ya se remiciono
    querys('select * from RemiFact where idremicion <> 0 and idpedido='+edNumPedido.Text,0,sqlgeneral);
    if sqlgeneral.FieldByName('idremicion').AsInteger > 0 then
     begin
      btnremisionar.Enabled := false;
      //verifica si esta saldada la venta
      querys('select saldado from pedidos where idpedido = '+edNumPedido.Text,0,sqlgeneral);
      if sqlgeneral.FieldByName('saldado').AsInteger = 0 then
        btnparcializar.Enabled := true;
     end
    else
     btnremisionar.Enabled := true;

      //verifica si ya se facturo
      querys('select * from RemiFact where idfactura <> ''0'' and idpedido='+edNumPedido.Text,0,sqltemp);
      if sqltemp.RecordCount > 0 then
       begin
        {btnfacturar.Enabled := false;
        btnFE.Enabled := false;
        btnfedlls.Enabled := false;
        btnFactTraspaso.Enabled := false;
        rgtransferencia.Enabled := false; }
        HabilitarBotonesFE(false);
        btnremisionar.Enabled := false;
        btnparcializar.Enabled := true;
        btntxt.Enabled := true;
       end
      else
         begin
        {btnfacturar.Enabled := true;
        btnFE.Enabled := true;
        btnfedlls.Enabled := true;
        btnFactTraspaso.Enabled := true;
        rgtransferencia.Enabled := true; }
        HabilitarBotonesFE(true);
        btntxt.Enabled := false;
        end;


        
   //verifica si se va a imprimir una factura por parcializacion
   querys('select FactParcialidad from RemiFact where idpedido = ' + edNumPedido.Text,0,sqlgeneral);
   if sqlgeneral.FieldByName('FactParcialidad').AsInteger = 1 then
    begin
     {btnfacturar.Enabled := false;
     btnFE.Enabled := false;
     btnfedlls.Enabled := false;
     btnFactTraspaso.Enabled := false;
     rgtransferencia.Enabled := false; }
     btnImpFact.Enabled := false;
     HabilitarBotonesFE(false);
    end;


   //verifica si este usuario tiene derecho de facturar
   //querys('select if(FacturaP = ''0'' and FacturaD = ''0'' and FacturaC = ''0'',''0'',''1'') as factura from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
   //if sqlgeneral.FieldByName('factura').AsString = '0' then
   if ( DerechosSys('Facturar en Caja') = false ) and ( DerechosSys('Facturar en Domicilio') = false ) and ( DerechosSys('Facturar en Pedidos') = false ) then
     btnfacturar.Enabled := false;

  if (sqltemp.RecordCount > 0) then
     begin
      MuestraRemiciones(edNumPedido.Text);
      TSfacturacion.TabVisible:=true;
      tsfacturacion.TabEnabled:=true;
      gbarticulo.Enabled:=false;
      gbcliente.enabled:=false;
    end;
MuestraRemiciones(edNumPedido.Text);

   dsrejilla.DataSet := SqlRejillaEdit;
if (dsrejilla.DataSet.RecordCount = 28) and (btnmodificar.Caption = '&Guardar') then
 begin
  application.MessageBox('Ya se ha llegado al limite de 28 de articulos por pedido y no podra agregar mas','Aviso',mb_iconinformation);
  gbarticulo.Enabled := false;
 end
else
 if cboestatus.ItemIndex = 0 then
  gbarticulo.Enabled := true;
  //Pone en edicion
  querys('select * from pedidos where idpedido='+edNumPedido.Text,0,sqlpedidos);
  SqlPedidos.Edit;

  PCpedidos.setfocus;
 end
else     //----> GUARDAR <----\\
 begin
  // if btnimpfact.Enabled then
   // begin
     if (edcve_vend.Text = '') or (cbonom_vend.Text = '') then
      begin
      pcpedidos.TabIndex:=0;
       application.MessageBox('Debe de seleccionar un vendedor!','Aviso',mb_iconwarning);
       cbonom_vend.DroppedDown := true;
       exit;
      end;
    if (edtipooportunidad.Text = '') or (cbonom_TOportunidad.Text = '') then
      begin
      pcpedidos.TabIndex:=0;
       application.MessageBox('Debe de seleccionar Unidad de Negocio!','Aviso',mb_iconwarning);
       cbonom_TOportunidad.DroppedDown := true;
       exit;
      end;
{  if (ednum_origen.Text = '') or (cbonom_origen.Text = '') then
      begin
      pcpedidos.TabIndex:=0;
       application.MessageBox('Debe de seleccionar el Origen!','Aviso',mb_iconwarning);
       cbonom_origen.DroppedDown := true;
       exit;
      end;}
      
  if cboFormaPago.Text = '' then
   begin
   pcpedidos.TabIndex:=0;
   application.MessageBox('Debe de seleccionar un Tipo de Pago!','Aviso',mb_iconwarning);
   cboFormaPago.AutoDropDown := true;
   exit;
   end;
   if cboNomAutorizo.Text = '' then
    begin
    pcpedidos.TabIndex:=0;
    application.MessageBox('Debe de seleccionar un quien autorizo este pedido!','Aviso',mb_iconwarning);
    cboNomautorizo.AutoDropDown := true;
    exit;
   end;

   if lowercase(cboestatus.text) = 'remisionado' then
   if querys('Select instalacion as inst, p.idunidadnegocio as un from pedidos p left join UnidadNegocio u on '+
              'u.idunidadnegocio=p.idunidadnegocio where idpedido ='+ednumpedido.Text, 0, sqlgeneral) > 0 then
      begin
      if sqlgeneral.FieldByName('un').AsString <> edTipoOportunidad.Text then
        begin
        if querys('Select instalacion as inst from UnidadNegocio where idunidadnegocio ='+edTipoOportunidad.Text+
                  ' and instalacion = '+sqlgeneral.FieldByName('inst').AsString, 0, sqlgeneral) = 0 then
          if sqlgeneral.FieldByName('inst').AsString = '1' then
            begin
            application.MessageBox(pchar('La Nueva Unidad de Negocio requiere instalacion, '+#13+'Cambie la Unidad De Negocio para continuar.'), 'Aviso', MB_ICONINFORMATION);
            exit;
            {if application.MessageBox('La Nueva Unidad de Negocio requiere instalacion desea generarla?', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
              begin
              GeneraInstalacion;
              frmprincipal.ucprincipal.Log('Cambio la Unidad de Negocio del pedido '+ednumpedido.Text, 2);
              end
            else
              begin
              application.MessageBox('Cambie la Unidad De Negocio para continuar.', 'Aviso', MB_ICONINFORMATION);
              exit;
              end;}
            end
          else
            begin
            application.MessageBox(pchar('La Anterior Unidad de Negocio tiene instalacion, '+#13+'Cambie la Unidad De Negocio para continuar.'), 'Aviso', MB_ICONINFORMATION);
            exit;
            {if application.MessageBox('La Nueva Unidad de Negocio requiere cancelar la instalacion desea cancelarla?', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
              begin
              frmprincipal.ucprincipal.Log('Cambio la Unidad de Negocio del pedido '+ednumpedido.Text, 2);
              querys('Update instalaciones set estatus = 4, usuario="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha="'+
                     datetostr(date)+'", hora = "'+timetostr(time)+'" where idinstalacion = '+edinstalacion.text+' and idpedido ='+ednumpedido.Text, 1, sqlgeneral);
              frmprincipal.ucprincipal.Log('Cancelo la instalacion '+edinstalacion.text, 2);
              end
            else
              begin
              application.MessageBox('Cambie la Unidad De Negocio para continuar.', 'Aviso', MB_ICONINFORMATION);
              exit;
              end;}
            end;
          frmprincipal.ucprincipal.Log('Cambio la Unidad de Negocio del pedido '+ednumpedido.Text, 2);
        end
      end;

  edvtasxcta.Enabled := true;
  lblTotArts.Caption := '';
  reconcepto.Enabled := false;
  RENotaInst.Enabled := false;
  gbotros.Enabled:=false;
  edFechaVencimiento.Enabled:=false;
  btnrecalcular.Enabled:=false;
  edpresupuesto.Enabled:=false;
  pnlfacturacion.Enabled:=false;
  gbtotales.Enabled:=false;
  edFechaCierre.Enabled:=false;
  edanticipo.Enabled := false;
  //cboautorizo.Enabled:=false;
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Pedido Actual';
  btnmodificar.ImageIndex:=2;
  btnalta.Enabled:=true;
//  btnborrar.Enabled:=true;
  edNumPedido.Enabled:=true;
  frmprincipal.ucprincipal.Log('Edito el Pedido #'+edNumPedido.Text,2);
//  querys('select * from pedidos where idpedido='+edNumPedido.Text,0,sqlpedidos);
 // SqlPedidos.Edit;
      //trae el idlinea de la tabla de lineas en base al nombre
//    querys('select idlinea from lineas where nombre = '+quotedstr(cbolinea.Text),0,sqlgeneral);
 //   idlinea:=sqlgeneral.fieldbyname('idlinea').AsInteger;
  //  sqlpedidos.fieldbyname('idlinea').Asinteger:=idlinea;
     if cbonom_TOportunidad.Text = 'EQUIPO2' then
      begin
       application.MessageBox('Este Pedido es continuacion de otro favor de indicar de cual en la siguiente ventana','Pregunta',mb_iconinformation);
       frmbusquedas.query:='SELECT pedidos.idpedido,if ((clientes.nombre = ''''  or clientes.nombre is null) and (clientes.apaterno=''''  or clientes.apaterno is null) and (clientes.amaterno=''''  or clientes.amaterno is null), clientes.rsocial ' +
                     ',concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as Cliente,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                     ',''Facturado'')))) as Estatus,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)';
       frmbusquedas.campo_retorno:='idpedido';
       frmbusquedas.tabla:='';
       repeat
        frmbusquedas.ShowModal;
       until frmbusquedas.resultado <> '';
       sqlpedidos.FieldByName('idPedidoPadre').Asstring :=frmbusquedas.resultado;
      end;
      //verifica que se halla hecho la remicion o facturacion
      querys('select * from PagosClientes where idpedido='+edNumPedido.Text+' and movimiento=0',0,sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
       //actualiza la fecha vencimiento en base a la nueva
       querys('update PagosClientes set FechaVence = '+quotedstr(edFechaVencimiento.Text)+' where movimiento = 0 and idpedido='+edNumPedido.Text,1,sqlgeneral);
     {sqlpedidos.FieldByName('idpresupuesto').Asstring:=edpresupuesto.Text;
     sqlpedidos.FieldByName('idpedido').Asstring:=edNumPedido.Text;
     //sqlpedidos.FieldByName('FechaCreacion').AsDateTime:=strtodate(edfechacreacion.text);
     if edfechavencimiento.text <> '' then
     sqlpedidos.FieldByName('FechaVencimiento').AsDateTime:=strtodate(edfechavencimiento.text);
     sqlpedidos.fieldbyname('concepto').Asstring:=REConcepto.Text;
     sqlpedidos.fieldbyname('NotaInst').Asstring:=RENotaInst.Text;
     sqlpedidos.fieldbyname('usuario').Asstring:=frmprincipal.ucprincipal.CurrentUser.Username;
     sqlpedidos.fieldbyname('fecha').Asstring:=datetostr(FechaServidor);
     sqlpedidos.fieldbyname('hora').Asstring:=timetostr(HoraServidor);
     sqlpedidos.fieldbyname('DescProm').Asstring:=eddescuento.Text;
//     sqlpedidos.fieldbyname('DescPP').Asstring:=DescPP.Text;
     sqlpedidos.fieldbyname('TipoCambio').Asstring:=edTCP.Text;
     sqlpedidos.fieldbyname('TotMat').Asstring:=edTotMat.Text;
     sqlpedidos.fieldbyname('TotHrs').Asstring:=edTotHrs.Text;
     sqlpedidos.fieldbyname('TotHrsCom').Asstring:=edTotHrsCom.Text;
     sqlpedidos.fieldbyname('CostoHrs').Asstring:=edCHP.Text;
     sqlpedidos.fieldbyname('MontoHrs').Asstring:=edHoras.Text;
//     sqlpedidos.fieldbyname('Financiamientos').Asstring:=edFinanciamiento.Text;
//     sqlpedidos.fieldbyname('central').Asstring:=edcentral.Text;
     sqlpedidos.fieldbyname('SubTotal').Asstring:=edtotmat.Text;
     sqlpedidos.fieldbyname('descuento').Asstring:=eddescuento.Text;
     sqlpedidos.fieldbyname('Iva').Asstring:=ediva.Text;
     sqlpedidos.fieldbyname('TotDlls').Asstring:=edTotDlls.Text;
     sqlpedidos.fieldbyname('TotMn').Asstring:=edTotMn.Text;
     sqlpedidos.fieldbyname('Anticipo').Asstring:=edanticipo.Text;
     sqlpedidos.fieldbyname('Saldo').Asstring:=edsaldo.Text;
     //sqlpedidos.FieldByName('idTipoOportunidad').AsString := edTipoOportunidad.Text;
     sqlpedidos.FieldByName('idUnidadNegocio').AsString := edTipoOportunidad.Text;
     sqlpedidos.FieldByName('idorigen').asstring := ednum_origen.Text;
     sqlpedidos.FieldByName('autorizo').asinteger := strtoint(edCveAutorizo.Text);
    // sqlpedidos.FieldByName('FormaPago').asstring := cboFormaPago.text[2] + cboformapago.Text[3];
     if edcve_vend.text<>'' then
        sqlpedidos.fieldbyname('idvendedor').Asstring:=edcve_vend.Text
     else
     sqlpedidos.fieldbyname('idvendedor').Asstring:=inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
     sqlpedidos.fieldbyname('idcliente').Asstring:=edcuenta.Text;
     sqlpedidos.FieldByName('estatus').Asinteger:=cboestatus.ItemIndex;
     sqlpedidos.FieldByName('TipoCambio').AsFloat:=strtofloat(edTCP.Text);}
   //Guarda los datos
   Sqlpedidos.Post;
  //trae los articulos utilizados en este pedido
  querys('select distinct cod_cve from DetPedido',0,sqlgeneral);
//  UnLockArt('',true);
  //verifica si se crearon requisiciones por este pedido
  {comentado dalila
  querys('select requisiciones.* from requisiciones inner join TipoMov on requisiciones.idmovi=TipoMov.idmovi  where TipoMov.nombre='+quotedstr('PEDIDOS')+' and iddoc='+inttostr(strtoint(edNumPedido.Text)+1),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    //inserta en el encabezado del pedido
    querys('insert into pedidos (idpedido,idpresupuesto,idUnidadNegocio,idcliente,idvendedor,FechaCreacion,usuario,fecha,hora,TipoCambio,concepto,autorizo) SELECT '+inttostr(strtoint(edNumPedido.Text)+1)+',pedidos.idpresupuesto '+
           ' ,pedidos.idUnidadNegocio,pedidos.idcliente,pedidos.idvendedor,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora, pedidos.TipoCambio, pedidos.concepto,pedidos.reviso '+
           ' FROM pedidos where idpedido='+edNumPedido.Text,1,sqlgeneral);
   querys('insert into DetPedido(idpedido,cant,piezas,cod_cve,utilidad,surtido,costo,tc) select '+inttostr(strtoint(edNumPedido.Text)+1)+',if (requisiciones.piezas=0,requisiciones.cantidad/articulos.piezasxunidad,0) as cant, '+
          ' if (requisiciones.piezas=1,0,requisiciones.cantidad) as piezas,requisiciones.cod_cve,'+quotedstr(cboutilidad.Text)+','+edCveautorizo.Text+',costo,tc from requisiciones inner join articulos on requisiciones.cod_cve=articulos.cod_cve inner '+
          ' join TipoMov on requisiciones.idmovi=TipoMov.idmovi where TipoMov.nombre='+quotedstr('PEDIDOS')+' and requisiciones.iddoc='+inttostr(strtoint(edNumPedido.Text)+1),1,sqlgeneral);//recien agregado inttostr(strtoint(
   end;}
     btnmodificar.Enabled:=false;
     btnborrar.Enabled:=false;
     limpia;
  end;
end;

procedure tfrmpedidos.EliminaPedido;
begin
   //elimina el pedido de la tabla de pedidos
   if application.MessageBox('Estas Seguro que deseas eliminar este pedido?','Cuidado',mb_yesno+mb_iconwarning) = idyes then
    begin
         if(cboestatus.Text <> 'Cancelado') then
            RegresaExistencias(edNumPedido.Text,'',true,dsrejilla);
            
     //actualiza el campo status de la tabla de presupuestos a 1 para indicar que ya tiene un pedido
     querys('update presupuestos set estatus=0 where idpresupuesto='+edpresupuesto.Text,1,sqlgeneral);
     //trae el cargo hecho al cliente
     querys('Select estatus From pedidos Where idpedido='+edNumPedido.Text,1,sqlgeneral);
     if sqlgeneral.FieldByName('estatus').AsString <> '1' then
        begin
          querys('select truncate(sum(restante),2) as total from PagosClientes where idpedido = '+edNumPedido.Text+' and movimiento in(0,1,4) ',0,sqlgeneral);
          //actualiza el saldo del cliente
          if sqlgeneral.fieldbyname('total').AsString <> '' then
            begin
            bpcambios('clientes', edcuenta.Text, 'idcliente');
            querys('update clientes set saldo = saldo-'+sqlgeneral.fieldbyname('total').AsString+' where idcliente='+edcuenta.Text,1,sqlgeneral);
            apcambios('idcliente', edcuenta.Text, 'clientes', 'EliminaPedido');
            end;
        end;
    //borra registros en PagosClientes
     querys('delete from PagosClientes where idpedido = '+edNumPedido.Text,1,sqlgeneral);
     //borra registros de RemiFact
     querys('delete from RemiFact where idpedido='+edNumPedido.Text,1,sqlgeneral);
     //borra de instalaciones
     querys('delete from instalaciones where idpedido='+edNumPedido.Text,1,sqlgeneral);
     //borra detalles de pedidos
     querys('delete from DetPedido where idpedido='+edNumPedido.Text,1,sqlgeneral);
     //borra encabezado de pedidos
     querys('delete from pedidos where idpedido='+edNumPedido.Text,1,SqlGeneral);
     frmprincipal.ucprincipal.Log('Elimino el pedido #'+edNumPedido.Text,3);
     application.MessageBox('Pedido Eliminado','Aviso',mb_iconInformation);
     self.OnShow(nil);
     limpia;
    end;
end;

procedure Tfrmpedidos.btnborrarClick(Sender: TObject);
begin
//si tiene anticipos o esta facturada no se podra eliminar
if (edTipoOportunidad.Text = '4') then
if not DerechosSys('Borrar pedidos de monitoreo') then
//if not (((frmprincipal.AreaUsuario = 'COBRANZA') and (frmprincipal.PuestoUsuario = 'GERENTE')) OR (frmprincipal.AreaUsuario = 'SISTEMAS')) then
  begin
  if (uppercase(cboestatus.Text) = 'REMISIONADO') or (uppercase(cboestatus.Text) ='PEDIDO') then
    begin
    Application.MessageBox('Usted no tiene derechos para borrar o cancelar pedidos', 'Atencion', MB_ICONEXCLAMATION);
    exit;
    end;
  end;

querys('select * from PagosClientes where idpedido='+ednumpedido.Text+' and TipoPago='+quotedstr('AT')+' and movimiento<>3',0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  application.MessageBox('No podra eliminar esta venta por que tiene anticipos aplicados','Aviso',mb_iconinformation);
  exit;
 end
else
 begin
  if cboestatus.Text = 'Facturado' then
   begin
    application.MessageBox('No podra eliminar esta venta por que esta facturada, solo podra cancelarla','Aviso',mb_iconinformation);
     exit;
   end;
  end;

if btnmodificar.Enabled = false then
 EliminaPedido
else
 begin
  BorrarPed.CaptionTitle := 'Cancelar/Borrar Pedidos';
  BorrarPed.Prompt := 'Que Desea Hacer?';
  BorrarPed.Items.Clear;
  BorrarPed.Items.Add('Cancelar Pedido');
  BorrarPed.Items.Add('Borrar Pedido');
  if BorrarPed.Execute then
   if BorrarPed.Value = 1 then
    EliminaPedido
   else
    begin
     try
      dmaccesos.conexion.StartTransaction;
      //Actualiza el campo estatus y lo pone
      querys('Select estatus From pedidos Where idpedido='+edNumPedido.Text,1,sqlgeneral);
      if sqlgeneral.FieldByName('estatus').AsString <> '1' then
        begin
            //trae el cargo hecho al cliente
            querys('select truncate(sum(restante),2) as total from PagosClientes where idpedido = '+edNumPedido.Text+' and movimiento in(0,1,4)',0,sqlgeneral);
            //actualiza el saldo del cliente
            if sqlgeneral.fieldbyname('total').AsString <> '' then
              begin
              bpcambios('clientes', edcuenta.Text, 'idcliente');
              querys('update clientes set saldo = truncate(saldo-'+sqlgeneral.fieldbyname('total').AsString+',2) where idcliente='+edcuenta.Text,1,sqlgeneral);
              apcambios('idcliente', edcuenta.Text, 'clientes', 'frmpedidos');
              end;
         end;
      querys('update pedidos set estatus=1,Saldo=0 where idpedido='+edNumPedido.Text,1,sqlgeneral);
      if uppercase(cboestatus.Text) = 'PEDIDO' then
        RegresaExistencias(edNumPedido.Text,'',true,dsrejilla)
      else
        RegresaExistencias(edNumPedido.Text,'',false,dsrejilla);
      frmprincipal.ucprincipal.Log('Cancelo el pedido #'+edNumPedido.Text,3);
      cboestatus.ItemIndex:=1;
      btnmodificar.Enabled:=false;
      dmaccesos.conexion.Commit;
      application.MessageBox('Pedido Cancelado','Aviso',mb_iconInformation);
     except
      dmaccesos.conexion.Rollback;
      application.MessageBox('Ocurrio un Error en el proceso consulte a su administrador','Aviso',mb_iconwarning);
     end;
   end;
  end;
end;

function Tfrmpedidos.ValidaExistenciasPaquete(codigo:string;cantidad:integer):integer;
var valor:integer;
begin
btnagregar.Tag:=0;
querys('select * from art_compuestos where cod_paq='+quotedstr(codigo),0,frmprincipal.Sqlgeneral);
frmprincipal.Sqlgeneral.First;
while not frmprincipal.Sqlgeneral.Eof do
     begin
        if frmprincipal.Sqlgeneral.FieldByName('cant').AsInteger > 0 then
           valor:=ValidaExistencias(frmprincipal.Sqlgeneral.FieldByName('cod_cve').Asstring,frmprincipal.Sqlgeneral.FieldByName('cant').AsInteger*cantidad,false)
        else
           valor:=ValidaExistencias(frmprincipal.Sqlgeneral.FieldByName('cod_cve').Asstring,frmprincipal.Sqlgeneral.FieldByName('piezas').AsInteger*cantidad,true);

     if (valor < 0) or (valor>0) then
      begin
       application.MessageBox(pchar('El articulo #'+frmprincipal.Sqlgeneral.FieldByName('cod_cve').Asstring+' del paquete #'+codigo+' no tiene la suficiente existencia para ser surtido y se cancelara la venta de este paquete!'),'Aviso',mb_iconinformation);
       break;
      end;

    if btnagregar.Tag=1 then
       begin application.MessageBox('Este articulo no se puede vender en piezas!','Aviso',mb_iconinformation); chkpiezas.Checked := false; end;

   { if (valor < 0) or (valor>0) then
    begin result:=valor; break; end
     else                          }
          frmprincipal.Sqlgeneral.Next;
     end;


if frmprincipal.Sqlgeneral.Eof then
   result:=0
else
  result:=1;
end;

procedure Tfrmpedidos.btnremisionarClick(Sender: TObject);
var pzsxunidad,pzs,cant,parc,idmovi,idremicion:integer;
    tot:double;    //   total,tc,ant,
     cod_cve,idinst,CodigoInstalador:string;
begin
  idremicion := 0;
  {if Derechos('Remisionar') = False then
  begin
  application.MessageBox('Usted no tiene derechos para Remisionar','Aviso',MB_ICONEXCLAMATION);
  exit;
  end;}

  if DerechosSys('Remisionar') <> true then
  begin
    application.MessageBox('Usted no tiene derechos para Remisionar','Aviso', MB_ICONINFORMATION);
    exit;
  end;

  if ValidarCliente_RemisionarFacturar = 1 then
    exit;
  if ValidarCliente_DatosFacturacion = 1 then
    exit;
  if dsrejilla.DataSet.RecordCount = 0 then
  begin
    application.MessageBox('No se encontro ningun articulo en este pedido y no podra remicionarlo hasta no tener minimo 1 articulo','Aviso',mb_iconinformation);
    exit;
  end;

  //MODIFICACION\\
  //InstPendiente;
  //endMODIFICACION\\

  idinst:=edinstalacion.text;
  try
    if sqlpedidos.State = dsEdit then
      sqlpedidos.Post;
      //dmaccesos.conexion.StartTransaction;

    //trae los articulos a remicionar
    querys('SELECT DetPedido.cant,DetPedido.piezas,DetPedido.cod_cve,articulos.piezasxunidad,articulos.paquete,articulos.servicio, articulos.costo FROM DetPedido INNER JOIN articulos ON (DetPedido.cod_cve = articulos.cod_cve) WHERE DetPedido.idpedido = '+ednumpedido.Text,0,sqlgeneral);
    sqlgeneral.First;
    while not sqlgeneral.Eof do
    begin
      pzsxunidad:=sqlgeneral.FieldByName('piezasxunidad').AsInteger;
      pzs:=sqlgeneral.FieldByName('piezas').AsInteger;
      cant:=sqlgeneral.FieldByName('cant').AsInteger;
      cod_cve:=sqlgeneral.FieldByName('cod_cve').Asstring;
      if (sqlgeneral.FieldByName('paquete').AsInteger = 0) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
      begin
        //trae el idmovi donde el nombre sea = pedido
        querys('select idmovi from TipoMov where nombre='+Quotedstr('PEDIDOS'),0,sqltemp);
        idmovi:=sqltemp.fieldbyname('idmovi').AsInteger;
        //resta lo que se aparto de este articulo de la columna apartado
        querys('update articulos set apartado=apartado-('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve)+' and inventariable = 1',1,sqltemp);

        ////lo que se aparto se pasa a instalacion
        if querys('select instalacion from UnidadNegocio where nombre="'+cbonom_TOportunidad.Text+'" and instalacion = 1',0,sqltemp) > 0 then
        begin
          querys('update articulos set instalacion=instalacion+('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve)+' and inventariable = 1',1,sqltemp);
          //actualiza los detalles del pedido diciendo que y ase surtio el art
          querys('update DetPedido set surtido=1, estatus = 2 where idpedido='+edNumPedido.Text,1,sqltemp);
        end
        else
          //actualiza los detalles del pedido diciendo que y ase surtio el art
          querys('update DetPedido set surtido=1, estatus = 3 where idpedido='+edNumPedido.Text,1,sqltemp);

        //Registra la salida del articulo en CardexArt
        querys('insert into CardexArt(cod_cve,idmovi,movimiento,FechaMov,iddoc,cant,piezas,usuario,HoraMov,descripcion) values ("'+
              cod_cve+'",'+inttostr(idmovi)+',"S","'+datetostr(date)+'",'+edNumPedido.Text+','+inttostr(cant)+','+inttostr(pzs)+
              ',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+FormatDateTime('HH:mm:ss',Time)+'", "Salida por Remision")',1,sqltemp);

        //actualiza el campo ultima venta del articulo
        querys('update articulos set ultima_venta='+quotedstr(datetostr(date))+' where cod_cve='+quotedstr(cod_cve)+' and inventariable = 1',1,sqltemp);
      end;
      sqlgeneral.Next;
    end;
    { total := strtofloat(edTotDlls.Text);
    tc := strtofloat(edtcp.Text);
    ant := strtofloat(edanticipo.Text);}
    //  tot := strtofloat(edTotDlls.Text);
    //  tot := (tc*tot)-ant;

    tot :=strtofloat(edsaldo.text);
    //actualiza el campo ultima compra del cliente al igual que su saldo
    bpcambios('clientes', edcuenta.Text, 'idcliente');
    querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',saldo=saldo+'+floattostr(tot)+',TotComprado=TotComprado + '+edtotmn.Text+' where idcliente='+edcuenta.Text,1,sqltemp);
    apcambios('idcliente', edcuenta.Text, 'clientes', 'frmpedidos');
    //trae el maximo numero de remicion
    querys('select idremicion from folios',0,sqltemp);
    idremicion:=sqltemp.fieldbyname('idremicion').AsInteger+1;
    Application.CreateForm(TfrmRemiFac, frmRemiFac);
    //#cfd
    frmremifac.inicializa(true,false,strtoint(edNumPedido.Text),inttostr(idremicion), 'N');
    //frmremifac.inicializa(true,false,strtoint(edNumPedido.Text),inttostr(idremicion));
    frmremifac.ShowModal;

    //si no termino en remifact
    if(frmRemiFac.Tag=2)then
    begin
      sqlpedidos.edit;
      exit;
    end;

    querys('select FechaVencimiento from pedidos where idpedido='+edNumPedido.Text,0,sqlgeneral);
    edFechaVencimiento.Text := sqlgeneral.Fields.Fields[0].AsString;
    if (strtofloat(edanticipo.Text) > 0) then
    begin
      if strtofloat(edanticipo.Text)=strtofloat(edTotMn.Text) then
      begin
         querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,abono,TipoPago,FechaVence,usuario,fecha,hora,restante) values (0,'+edcuenta.Text+','+edNumPedido.Text+','+inttostr(idremicion)+','+quotedstr(datetostr(FechaServidor))+','+edTotMn.Text+','+edAnticipo.Text+','+quotedstr('AT')+','+quotedstr(edFechaVencimiento.Text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+Format('%8.2f',[tot])+')',1,sqltemp);
         querys('update pedidos set saldado=1,FechaLiquidacion='+quotedstr(datetostr(FechaServidor))+',saldo=0 where idpedido='+ednumpedido.Text,1,sqlgeneral);
      end
      else
      begin                                                                                                                                                                                                                                                                                          //cboFormaPago.Text[2]+cboFormaPago.Text[3]
        //querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,abono,TipoPago,FechaVence,usuario,fecha,hora,restante) values (0,'+edcuenta.Text+','+edNumPedido.Text+','+inttostr(idremicion)+','+quotedstr(datetostr(FechaServidor))+','+edTotMn.Text+','+edAnticipo.Text+','+quotedstr('AT')+','+quotedstr(edFechaVencimiento.Text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+Format('%8f',[tot])+')',1,sqltemp);
        querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,abono,TipoPago,FechaVence,usuario,fecha,hora,restante) values (0,'+edcuenta.Text+','+edNumPedido.Text+','+inttostr(idremicion)+','+quotedstr(datetostr(FechaServidor))+','+edTotMn.Text+','+edAnticipo.Text+','+quotedstr('AT')+','+quotedstr(edFechaVencimiento.Text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+floattostr(tot)+')',1,sqltemp);
        querys('update pedidos set saldado=0,saldo='+floattostr(tot)+' where idpedido='+ednumpedido.Text,1,sqlgeneral);
      end;
    end
    else
    begin
      querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,usuario,fecha,hora,restante) values (0,'+edcuenta.Text+','+edNumPedido.Text+','+inttostr(idremicion)+','+quotedstr(datetostr(FechaServidor))+','+edTotMn.Text+','+quotedstr(edFechaVencimiento.Text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+Format('%8.2f',[tot])+')',1,sqltemp);
      querys('update pedidos set saldado=0, saldo='+floattostr(tot)+' where idpedido='+ednumpedido.Text,1,sqlgeneral);
    end;

    //  **  INSTALACION  ** \\

    //verifica que el pedido no este en instalaciones ya
    querys('select idpedido from instalaciones where idpedido='+edNumPedido.Text,0,sqlgeneral);
    if sqlgeneral.fieldbyname('idpedido').asstring = '' then
    begin
      CodigoInstalador := '';
      // if edinstalacion.text = '0' then begin
      //verifica que este pedido ocupe instalacion
      querys('select instalacion from UnidadNegocio where nombre='+quotedstr(cbonom_TOportunidad.Text),0,sqlgeneral);
      if sqlgeneral.FieldByName('instalacion').AsInteger = 1 then
      begin
        //inserta en la tabla de instalaciones el idpedido

        querys('select Instalador from usuarios where idusuario = '+quotedstr(Edcve_vend.Text),0,sqlgeneral);
        if sqlgeneral.FieldByName('Instalador').AsString = '' then
        begin
          querys('select codigo,DefaultUsr from usuarios as u LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto)  WHERE a.nombre=''INSTALACIONES'' and p.nombre = ''INSTALADOR'' and idsector = '+quotedstr(edsector.Text),0,sqlgeneral);
          while not sqlgeneral.Eof do
          begin
            CodigoInstalador :=  sqlgeneral.FieldByName('codigo').AsString;
            if ((sqlgeneral.FieldByName('DefaultUsr').AsString = 'True') or (sqlgeneral.FieldByName('DefaultUsr').AsString = '1')) then
              sqlgeneral.Last
            else
              sqlgeneral.Next;
          end;
          querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+edNumPedido.Text+','+quotedstr(CodigoInstalador)+',0, '+quotedstr(edcvecte.text)+')',1,sqlgeneral)
        end
        else
        begin
            querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+edNumPedido.Text+','+quotedstr(sqlgeneral.FieldByName('Instalador').AsString)+',0, '+quotedstr(edcvecte.text)+')',1,sqlgeneral);
        end;
        querys('select idinstalacion as ultimo from instalaciones where idpedido='+edNumPedido.Text,0,sqlgeneral);
        idinst:=sqlgeneral.fieldbyname('ultimo').asstring;
        edinstalacion.Text:=idinst;
        {
        //MODIFICACION\\
        if (instpend = true) and (edinstalacion.Text <> '') then
        begin
        querys('Update pedidos set instpend = 1 where idpedido='+edNumPedido.Text, 1, sqlgeneral);
        querys('Update instalaciones set estatus = 2 where idinstalacion='+edinstalacion.Text, 1, sqlgeneral);
        end;
        //endMODIFICACION\\
        }
      end;
    end;
    // querys('insert into instalaciones (idpedido) values ('+edNumPedido.Text+')',1,sqlgeneral);
    cboestatus.Text:='Remicionado';
    gbotros.Enabled := false;
    cboestatus.ItemIndex := 3;
    cbiva.enabled:= false;
    //actualiza el id remicion de la tabla de folios
    querys('update folios set idremicion='+inttostr(idremicion),1,sqltemp);
    //actualiza el estatus
    querys('Update pedidos set estatus=3,idinstal='+quotedstr(idinst)+',FechaCierre='+quotedstr(datetostr(FechaServidor))+' where idpedido='+edNumPedido.Text,1,sqlgeneral);
    MuestraRemiciones(edNumPedido.Text);
    {  if frmprincipal.ucprincipal.CurrentUser.LoginName = 'dalyla' then
    ComisionesVend;}
    btnremisionar.Enabled:=false;
    gbarticulo.Enabled := false;
    gbotros.Enabled :=false;
    rejilla.enabled := false;
    btnparcializar.Enabled := true;
    if (idinst <> '0') then
      application.MessageBox(pchar('El numero de instalación es : '+idinst+''),'Informacion',mb_IconInformation);

    //valida cuando el pedido viene de un presupuesto y hay uno o mas pagos
    if (edpresupuesto.Text <> '0') and (edpresupuesto.Text <> '') then
      //trae el numero de parcialidades en base a la forma de pago
      if querys('SELECT FormasPagoPre.parcialidades FROM presupuestos2 left JOIN FormasPagoPre ON (presupuestos2.idopcion = FormasPagoPre.idopcion) WHERE presupuestos2.idpresupuesto ='+edpresupuesto.Text,0,sqlgeneral) > 0 then
        if sqlgeneral.Fieldbyname('parcialidades').AsInteger <> 0 then
        begin
          parc := sqlgeneral.Fieldbyname('parcialidades').AsInteger;
          //trae el saldo del pedido
          querys('select ifnull((sum(ifnull(cargo,0))-sum(ifnull(abono,0))),0) as restante from PagosClientes where idpedido= '+edNumPedido.Text+' and movimiento <> 3',0,sqlgeneral);
          Parcializa(sqlgeneral.fieldbyname('restante').Asfloat,strtofloat(edtcp.Text),FechaServidor,strtoint(ednumpedido.text),parc,strtoint(edcuenta.Text),'M');
          application.MessageBox('Pedido Remicionado','Aviso',mb_iconinformation);
        end;
  except
    //  dmaccesos.conexion.Rollback;
    application.MessageBox('Ocurrio un error al intentar grabar los datos','Aviso',mb_iconwarning);
  end;

  if btnmodificar.Caption = '&Guardar' then
  begin
     if reconcepto.Text = '' then
     begin
        if cbonom_TOportunidad.Text='MONITOREO' then
           dmreportes.ConceptoBoleta.Text:='MONITOREO CORREPONDIENTE A'
        else
          dmreportes.ConceptoBoleta.Text:='';
        dmreportes.ConceptoBoleta.Execute;
        querys('update pedidos set concepto ='+quotedstr(dmreportes.ConceptoBoleta.Text)+' where idpedido='+quotedstr(edNumPedido.Text),1,sqlgeneral);
     end;
     frmprincipal.ucprincipal.Log('Genero la Remicion '+inttostr(idremicion)+' al Pedido '+edNumPedido.Text,2);
      querys('select * from pedidos where idpedido = ' + edNumPedido.Text,0,sqlpedidos);
    sqlpedidos.edit;
  end;
end;

procedure Tfrmpedidos.sqlrejillaTempAfterOpen(DataSet: TDataSet);
begin
     if (dataset.RecordCount > 0) and (sqlpedidos.FieldByName('estatus').AsInteger=0) then
        btnremisionar.Enabled:=true
     else
        btnremisionar.Enabled:=false;
end;

procedure Tfrmpedidos.btnparcializarClick(Sender: TObject);
var hija:Tfrmparcializacion;
begin
if (cbonom_TOportunidad.Text <> '') and (edTipoOportunidad.Text <> '') then
 begin
  querys('select parcializar from UnidadNegocio where idUnidadNegocio = '+edtipooportunidad.Text,0,sqlgeneral);
  if sqlgeneral.FieldByName('parcializar').AsInteger = 1 then
   begin
    querys('select ifnull((sum(ifnull(cargo,0))-sum(ifnull(abono,0))),0) as restante from PagosClientes where idpedido= '+edNumPedido.Text+' and movimiento not in( 3,6)',0,sqlgeneral);
    hija:=Tfrmparcializacion.Create(self);
    hija.inicializa(strtoint(ednumpedido.Text),strtoint(edcuenta.Text),strtofloat(edTotMn.Text),sqlgeneral.fieldbyname('restante').Asfloat,strtofloat(edTCP.Text));
    hija.Left:=round((screen.Width - hija.Width) div 2);  {Left/Posicion X}
    hija.Top:=round((screen.Height - hija.Height) div 2);  {Left/Posicion X}
    hija.Show;
    //verifica si se va a imprimir una factura por parcializacion
    querys('select FactParcialidad from RemiFact where idpedido = ' + edNumPedido.Text,0,sqlgeneral);
    if sqlgeneral.FieldByName('FactParcialidad').AsInteger = 1 then
     begin
      {btnfacturar.Enabled := false;
      btnFE.Enabled := false;
      btnfedlls.Enabled := false;
      btnFactTraspaso.Enabled := false;
      rgtransferencia.Enabled := false;}
      btnImpFact.Enabled := false;
      HabilitarBotonesFE(false);
     end;
   end
  else
    application.MessageBox('Este pedido tienen una Unidad de Negocio donde no se puede parcializar','Aviso',mb_iconinformation)
 end
else
  application.MessageBox('No ha especificado la Unidad de Negocio de este pedido debe especificarla para poder continuar','Aviso',mb_iconinformation);
end;

procedure Tfrmpedidos.edNumPedidoChange(Sender: TObject);
begin
if ednumpedido.Text = '' then
   limpia;
end;

procedure Tfrmpedidos.btnImpFactClick(Sender: TObject);
var
  year,dia,mes:word;
  dec,idfact, cad : string;     //   , cad2  deducible,
begin
if tipo <> 'N' then
  begin
  application.MessageBox('Esta factura no se puede imprimir en este sistema','Aviso',mb_iconinformation);
  exit;
  end;

decodedate(strtodate(edFechaCreacion.Text),year,mes,dia);

if REconcepto.Text = '' then
 begin
  application.MessageBox('Debe de especificar el concepto','Aviso',mb_iconinformation);
  exit;
 end
else
 begin
 with dmreportes do begin
querys('select round(TotMn,2) as total from pedidos where idpedido = '+edNumPedido.Text,0,sqlgeneral);
cad:=sqlgeneral.fieldbyname('total').asstring;
Delete(cad, AnsiPos('.', cad), length(cad));

//NumToLetras.Numero := strtoint(cad);

 dec := midstr(edsaldo.text,posex('.',edTotMn.Text)+1,length(edTotMn.Text));
 //trae el numero de factura
 querys('select idfactura from RemiFact where idpedido = '+edNumPedido.Text+' and idfactura <> ''0''',0,sqlgeneral);
 idfact := sqlgeneral.fieldbyname('idfactura').AsString;

// idfact := sqlgeneral.fieldbyname('idfactura').AsString;
 sqlclientesfact.Close;
 sqlclientesfact.ParamByName('dia').Value := dia;
 sqlclientesfact.ParamByName('mes').Value := meses[mes];
 sqlclientesfact.ParamByName('ano').Value := year;
 sqlclientesfact.ParamByName('ped').Value := strtoint(edNumPedido.Text);
 sqlclientesfact.ParamByName('idcliente').Value := edcuenta.Text;
// sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
 sqlclientesfact.ParamByName('cant').Value := 'PESOS';
 sqlclientesfact.ParamByName('Fact').Value :=lblidfactura.Caption;
 sqlclientesfact.Open;

 querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+edNumPedido.Text+' '+
        'order by dp.id',0,sqlgeneral2);
                          
 rvp.Engine := rvsystem1;
 rvp.ProjectFile := GetConfiguraciones('PathSysalarmServer', true) + 'Reportes_sysalarm.rav';
 if idfact[1] = 'D' then
  RVP.ExecuteReport('FacturasCD')
 else
  if idfact[1] = 'C' then
   RVP.ExecuteReport('Factura')
  else
    RVP.ExecuteReport('FacturasMX');
 end;
end;
dmreportes.RVP.Close;
end;

procedure Tfrmpedidos.edcodigoButtonClick(Sender: TObject);
begin

frmbuscaart.ShowModal;
     if frmbuscaart.cod_cve <> '' then
        begin
         edcodigo.Text:=frmbuscaart.cod_cve;
    if ValidaProducto(edcodigo.text) = 1 then
       begin
         edcantidad.Enabled := true;
          //trae el campo PrecioCapturable
          querys('select PrecioCapturable,existencia from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
          if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
           begin
            edprecio.Enabled := true;
            edPrecio.SetFocus;
           end
          else
           begin
            { querys('select PrecioCapturable from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
             if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then}
             if DerechosSys('Captura precios') = true then
              begin
               edprecio.Enabled := true;
               edPrecio.SetFocus;
              end
             else
              edcantidad.SetFocus;
            btnagregar.Enabled:=true;
           end;
          chkpiezas.Enabled:=true;
          edcodigo.Enabled:=false;
       end
    else
       begin
         edcodigo.Text:='';
         edcodigo.SetFocus;
       end;
        end;
end;

procedure Tfrmpedidos.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
  edcantidad.Text:='1';
end;

procedure Tfrmpedidos.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#27) then
 begin
  key:=#0;
  LimpiaDatArt;
 end;

if (key=#13)and(edcodigo.text<>'') then
 begin //if 1
     key:=#0;
     if ValidaProducto(edcodigo.Text) = 1 then
        begin
          edcantidad.Enabled:=true;
          edTInsta.Enabled:=true;
          //trae el campo PrecioCapturable
          querys('select PrecioCapturable,existencia from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
          if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
           begin
            edprecio.Enabled := true;
            edPrecio.SetFocus;
           end
          else
           begin
             {querys('select PrecioCapturable from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
             if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then}
             if DerechosSys('Captura precios') = true then
              begin
               edprecio.Enabled := true;
               edPrecio.SetFocus;
              end
             else
              edcantidad.SetFocus;
            btnagregar.Enabled:=true;
           end;
     end;
  end;

if (key = #13) and (edcodigo.Text = '') then
   begin
     key:=#0;
    edcodigo.OnButtonClick(self);
   end;
end;

procedure Tfrmpedidos.edcantidadChange(Sender: TObject);
begin
if edcantidad.Text = ''  then
  btnagregar.Enabled:=false
else
  btnagregar.Enabled:=true;
end;

procedure Tfrmpedidos.edcantidadKeyPress(Sender: TObject; var Key: Char);
begin
if (key<>'p') and (key<>'P') and (key<>#13) and (key <> #27) then
  key := ValidaNumeros(key,true);

querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(edcodigo.Text),0,sqlgeneral);

//if edCodigo.Text = 'CARGOS' then
if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
 begin
  key := ValidaPunto(edCodigo.Text,key);
 end;

if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
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
        application.MessageBox('Este Articulo no se puede vender en piezas','Aviso',mb_iconinformation);
      end;
     key:=#0;
   end;

if key = #27 then
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;

end;

procedure Tfrmpedidos.btnagregarClick(Sender: TObject);
var cant,pzs,pzsxunidad,temp,valor,idcardexart,idrequi,unipzs:integer;
servicio, inventariable : boolean;
begin
inventariable := false;
if edcodigo.Text <> '' then
  begin
  cant:=0;pzs:=0;temp:=0;idcardexart:=0;servicio := false; idrequi := 0;
  //querys('select articulos.*,usuarios.PrecioCapturable as pc from articulos,usuarios where cod_cve='+quotedstr(edcodigo.Text)+' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
  querys('select * from articulos where cod_cve='+quotedstr(edcodigo.Text),0,sqlgeneral);
  pzsxunidad:=sqlgeneral.fieldbyname('piezasxunidad').AsInteger;

  {if (sqlgeneral.fieldbyname('PrecioCapturable').AsInteger = 1) or (sqlgeneral.fieldbyname('pc').AsInteger = 1) then
    capturable :=true;}//no se usa -_-

  if sqlgeneral.FieldByName('servicio').AsInteger = 1 then
    servicio := true;
  if sqlgeneral.FieldByName('inventariable').AsInteger = 1 then
    inventariable := true;

  //PAQUETE
  querys('select * from articulos where cod_cve='+quotedstr(edcodigo.Text)+ ' and paquete=1',0,SqlGeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    if ValidaExistenciasPaquete(edcodigo.Text,strtoint(edcantidad.Text)) = 0 then
      begin
      if btnalta.enabled then
        InsertaArticulosPaquete('DetPedidoTemp','idmaq',frmprincipal.idmaq,edcodigo.Text,sqlrejillaalta,strtoint(edcantidad.Text))
      else
        InsertaArticulosPaquete('DetPedido','idpedido',ednumpedido.Text,edcodigo.Text,sqlrejillaedit,strtoint(edcantidad.Text));
      LimpiaDatArt;
      end
    else
      application.MessageBox('No se cuenta con todos los componentes de este paquete y no podra venderlo','Aviso',mb_iconinformation);
    end
  else
    begin  //NO PAQUETE
    valor := 0;
    //comentado por angel para dejar que vendan sin existencias
    if servicio then
      valor := 0
    else
      valor := ValidaExistencias(edcodigo.Text,strtoint(edcantidad.text),chkpiezas.Checked);{}

    if chkpiezas.Checked then
      begin
      pzs:=strtoint(edcantidad.text);
      unipzs:=1;
      end
    else
      begin
      cant:=strtoint(edcantidad.text);
      unipzs:=0;
      end;

    if valor <> 0  then
      begin
      if servicio = false then
        begin
        //Trae el idmovi de TipoMov
        {querys('select idmovi from TipoMov where nombre = "VTA/SIN/EXIST"',0,sqlgeneral);
        idmovi:=sqlgeneral.Fields.Fields[0].Asinteger;
        querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) values ("'+
               edcodigo.Text+'","E",'+inttostr(idmovi)+',"'+datetostr(date)+'",'+ednumpedido.Text+','+
               inttostr(pzs+(cant * pzsxunidad))+',0, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+
               FormatDateTime('HH:mm:ss',Time)+'", "Backorder por ")',1,sqlgeneral); }

       {comentado por dalila
       querys('select max(idajuste) as id from AjusteInv',0,sqlgeneral);
        idajuste := inttostr(sqlgeneral.fieldbyname('id').Asinteger + 1);
        querys('select idconcepto_es from ConceptoES where nombre = '+quotedstr('ENTRADAS/PEDIDO'),0,sqlgeneral);
        idconcepto_es := sqlgeneral.fieldbyname('idconcepto_es').Asstring;
        querys('insert into AjusteInv (idajuste,idconcepto_es,FechaAlta,HoraAlta,TotalProductos,observaciones,movimiento,usuario,fecha,hora) values ('+idajuste+','+idconcepto_es+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+',1,'+quotedstr('Otra Entrada por venta sin existencia del pedido #'+edNumPedido.Text)+','+'''E'''+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+',CURDATE(),CURTIME())',1,sqlgeneral);
        querys('insert into DetAjusteInv (idajuste,cod_cve,cant_ord,costo,usuario,fecha,hora) values ('+idajuste+','+quotedstr(edcodigo.Text)+','+inttostr(pzs+(cant * pzsxunidad))+','+floattostr(costo/pzsxunidad)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+',CURDATE(),CURTIME())',1,sqlgeneral);
       } end;
      //trae el idCardexArt que se asigo a este movimiento
      {querys('select idCardexArt from CardexArt where cod_cve='+quotedstr(edcodigo.Text)+' and iddoc='+ednumpedido.Text+' and idmovi='+inttostr(idmovi),0,sqlgeneral);
      idCardexArt:=sqlgeneral.FieldValues['idCardexArt'];}
      {//trae el maximo  numero de requisicion
      querys('select max(idrequisicion) from requisiciones',0,sqlgeneral);
      idrequi:=sqlgeneral.Fields.Fields[0].Asinteger+1;
      querys('insert into requisiciones (idrequisicion,fecha,hora,usuario,cod_cve,cantidad,idmovi,idmaq,piezas) values ('+inttostr(idrequi)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(inttostr(frmprincipal.ucprincipal.CurrentUser.UserID))+','+quotedstr(edcodigo.Text)+','+inttostr((cant*pzsxunidad)+pzs)+','+inttostr(idmovi)+','+frmprincipal.idmaq+','+floattostr(unipzs)+')',1,sqlgeneral);}

      if (valor < 0) and (pzsxunidad>1) and ((cant div pzsxunidad)=0) and (temp=0) then//MOVIDO dalila
        begin
        pzs:=abs(valor);  chkpiezas.Checked:=true;   //  cant:=0;
        end;

      if temp = 0 then  //MOVIDO dalila
        VendeConBackOrder(edcodigo.Text,cant,pzs);

      if btnalta.Enabled then
        InsertaArticulo(sqlrejillaalta,'DetPedidoTemp','idmaq',frmprincipal.idmaq,edcodigo.Text,strtoint(edcantidad.Text),idrequi,idCardexArt)
      else
        InsertaArticulo(sqlrejillaedit,'DetPedido','idpedido',ednumpedido.Text,edcodigo.Text,strtoint(edcantidad.Text),idrequi,idCardexArt);

      querys('insert into CardexArt(cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,piezas,usuario,HoraMov, descripcion) values ("'+
             edcodigo.Text+'", "S",14,"'+datetostr(date)+'", '+ednumpedido.Text+','+inttostr(cant)+','+inttostr(pzs)+
             ',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+FormatDateTime('HH:mm:ss',Time)+
             '", "Apartado por Venta")',1,sqlgeneral);
        //end;

      {
      if (valor < 0) and (pzsxunidad>1) and ((cant div pzsxunidad)=0) and (temp=0) then
        begin
        pzs:=abs(valor); cant:=0; chkpiezas.Checked:=true;
        end;

      if temp = 0 then  //MOVIDO dalila
        VendeConBackOrder(edcodigo.Text,cant,pzs);}
      end                                 //sqlgeneral.Fields.Fields[0].AsInteger+   sqlgeneral.Fields.Fields[1].AsInteger+
    else
      begin
      if (inventariable=true) and (servicio=false) then
        begin
        //actualiza las existencias                                                                                                         //sqlgeneral.Fields.Fields[0].asinteger
        //querys('update articulos set existencia=existencia-'+inttostr(pzs+(cant * pzsxunidad))+',apartado=apartado+'+inttostr(pzs+(cant * pzsxunidad))+' where cod_cve='+quotedstr(edcodigo.Text),1,sqlgeneral);
        //trae el indice del concepto VENTAS para insertar la cancelacion de los articulos
        querys('select idmovi from TipoMov where nombre="VENTAS"',0,sqlgeneral);
        idcardexart:=sqlgeneral.Fields.Fields[0].Asinteger;
        end;

      if (servicio = false) then
        begin
        //inserta en el cardex la salida
        querys('select costo from articulos where cod_cve="'+edcodigo.text+'"',0,dmreportes.sqlgeneral7);                                                                                                                                                                                                   //inttostr(pzs+(cant * pzsxunidad))

        querys('insert into CardexArt(cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,piezas,usuario,HoraMov, descripcion) values ("'+
             edcodigo.Text+'", "S",'+inttostr(idcardexart)+',"'+datetostr(date)+'",'+
             ednumpedido.Text+','+inttostr(cant)+','+inttostr(pzs)+',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
             '","'+FormatDateTime('HH:mm:ss',Time)+'", "Apartado por Venta")',1,sqlgeneral);
        end;

      if btnalta.Enabled then
        InsertaArticulo(sqlrejillaalta,'DetPedidoTemp','idmaq',frmprincipal.idmaq,edcodigo.Text,strtoint(edcantidad.Text),0,0)
      else
        InsertaArticulo(sqlrejillaedit,'DetPedido','idpedido',ednumpedido.Text,edcodigo.Text,strtoint(edcantidad.Text),0,0);
      end;
    end;
    LimpiaDatArt;
    btnagregar.enabled:=false;
    edcodigo.enabled:=true;
    edcodigo.setfocus;

    if dsrejilla.DataSet.RecordCount = 28 then
      begin
      application.MessageBox('Ya se ha llegado al limite (28) de articulos por factura y no podra agregar mas','Aviso',mb_iconinformation);
      gbarticulo.Enabled := false;
      end
    else
      if cboestatus.ItemIndex = 0 then
        gbarticulo.Enabled := true;
    end
  else
    btnagregar.Enabled:=false;

if cboestatus.ItemIndex = 3 then
  gbarticulo.Enabled := false;
end;

procedure Tfrmpedidos.RejillaDBTableView1DblClick(Sender: TObject);
begin
if (cboestatus.Text <> 'Remisionado') and (cboestatus.Text <> 'Facturado')or(dsrejilla.DataSet.FieldByName('nombre').AsString='MONITOREO') then
 begin
 if btnalta.Enabled then
   ModificaArticulo(SqlRejillaAlta,'DetPedidoTemp','idmaq',frmprincipal.idmaq);
 if btnmodificar.Enabled then
   ModificaArticulo(SqlRejillaEdit,'DetPedido','idpedido',edNumPedido.Text);
 end;
end;

procedure Tfrmpedidos.btnrecalcularClick(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   CalculaTotales(SqlRejillaAlta);
if btnmodificar.caption = '&Guardar' then
   CalculaTotales(SqlRejillaEdit);
end;

procedure Tfrmpedidos.edpresupuestoChange(Sender: TObject);
begin
if btnalta.Caption = '&Guardar' then begin
 if edpresupuesto.Text='' then
  begin
  // limpia;
   LimpiaDatArt;
   LimpiaTotales;
   edcvecte.Enabled:=true;
   edpresupuesto.Enabled:=true;
   gbarticulo.Enabled:=false;
  end
 else
  begin
   edcvecte.Enabled:=false;
   edcvecte.Text:='';
  end;
end;
end;

procedure Tfrmpedidos.edcvecteKeyPress(Sender: TObject; var Key: Char);
 var sqltemp1 : tmyquery;
begin

sqltemp1 := tmyquery.Create(self);
sqltemp1.Connection := dmaccesos.conexion;
key:=validanumeros(key,false);
key:=validapunto(edcvecte.Text+'.',key);
  if key=#13 then begin
     key:=#0;

      if edcvecte.Text <> '' then
        begin
         EstatusCliente(edcvecte.Text,dmreportes.sqlgeneral8);
         sqlclientes.Close;
         sqlclientes.Params.Items[0].Value:=strtoint(edcvecte.Text);
         sqlclientes.Open;
         if sqlclientes.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
             edcvecte.SetFocus;
           end
         else
           begin

           VerificarDatosOportunidad;
           if edGiro.Text = '' then
            begin
              application.MessageBox('Ha este cliente no se le ha especificado el giro y no podra venderle hasta no especificar su giro lo puede hacer en la pantalla de clientes','Aviso',mb_iconinformation);
              sqlclientes.Close;
            end
           else
            begin
             if cboestatus.ItemIndex = 0 then
              gbarticulo.Enabled:=true;
              btnagregar.Enabled:=false;
              gbotros.enabled := true;
              edcve_vend.SetFocus;
              chtecla := #13;
              //trae el vendedor casa para asignarselo al idvendedor y al autorizo
              querys('select idusuario,nombre from usuarios where nombre = '+quotedstr('CASA'),0,sqltemp1);
              if sqlclientes.FieldByName('idvendedor').AsInteger = 0 then
               begin
                edcve_vend.Text := sqltemp1.fieldbyname('idusuario').AsString;
                cbonom_vend.Text := sqltemp1.fieldbyname('nombre').AsString;
                edcveautorizo.Text := sqltemp1.fieldbyname('idusuario').AsString;
                cboNomAutorizo.Text := sqltemp1.fieldbyname('nombre').AsString;
               end
              else
               begin
                edcve_vend.Text := sqlclientes.FieldByName('idvendedor').Asstring;
                edcveautorizo.Text := sqlclientes.FieldByName('idvendedor').Asstring;
                edcve_vend.OnKeyPress(self,chtecla);
                chtecla := #13;
                edcveautorizo.OnKeyPress(self,chtecla);
              end;
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

procedure Tfrmpedidos.edcvecteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var r : integer;
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
 begin
  r := BuscaCliente(sqlclientes);
  if r <> 0 then
    edcvecte.Text := inttostr(r);
 end;
end;

procedure Tfrmpedidos.edcvecteChange(Sender: TObject);
begin
if btnalta.Caption = '&Guardar' then
 begin
  if edcvecte.Text = '' then
   begin
    sqlclientes.Close;
    edpresupuesto.Enabled:=true;
    gbarticulo.Enabled:=false;
   end
  else
   begin
    edpresupuesto.Enabled:=false;
    edpresupuesto.Text:='';
   end;
 end;
end;
{
procedure Tfrmpedidos.edCentralExit(Sender: TObject);
begin
//edcentral.Text:=floattostr(QuitaCaracteres(edcentral.Text,','));
btnrecalcular.Click;
end;}

procedure Tfrmpedidos.DescPPExit(Sender: TObject);
begin
{if DescPP.Text <> '' then
   begin
    DescPP.Text:=trim(Format('%8.2f',[strtofloat(DescPP.Text)]));
      btnrecalcular.Click;
   end;}
end;

procedure Tfrmpedidos.edAnticipoExit(Sender: TObject);
begin
if strtofloat(edanticipo.Text)>strtofloat(edTotMn.Text) then
 begin
   application.MessageBox('El anticipo no puede ser mayor que el total','Aviso',mb_iconinformation);
   edanticipo.Text:=edTotMn.Text;
 end;

if edanticipo.Text <> '' then
   begin
   edanticipo.Text:=trim(Format('%8.2f',[strtofloat(edanticipo.Text)]));
   btnrecalcular.Click;
   end;
end;

procedure Tfrmpedidos.SqlrejillaaltaAfterOpen(DataSet: TDataSet);
begin
CalculaTotales(SqlRejillaAlta);
lbltotArts.Caption :='Total de Articulos ' + inttostr(dataset.RecordCount);
end;

procedure Tfrmpedidos.sqlrejillaeditAfterOpen(DataSet: TDataSet);
begin
CalculaTotales(SqlRejillaedit);
lbltotArts.Caption := 'Total de Articulos '+ inttostr(dataset.RecordCount);
end;

procedure Tfrmpedidos.edCHPChange(Sender: TObject);
begin
edCostoHrs.Text:=edchp.Text;
end;

{procedure Tfrmpedidos.edCentralKeyPress(Sender: TObject; var Key: Char);
begin
{key:=ValidaNumeros(key,false);
key:=ValidaPunto(edCentral.Text,key);
if (key=#13) and (edCentral.Text<>'') then
 begin
  key:=#0;
  DescProm.SetFocus;
 end;
end; 

procedure Tfrmpedidos.edCentralChange(Sender: TObject);
begin
{ try
  edcentral.text:=floattostr(QuitaCaracteres(edcentral.Text,','));
 except
  edcentral.Text:='';
 end;
end;}

procedure Tfrmpedidos.DescPromChange(Sender: TObject);
begin
{try
strtofloat(DescPP.text);
except
DescPP.Text:='';
end;            }
end;

procedure Tfrmpedidos.DescPromExit(Sender: TObject);
begin
{if DescPP.Text <> '' then
   begin
    DescPP.Text:=trim(Format('%8.2f',[strtofloat(DescPP.Text)]));
    btnrecalcular.Click;
   end;}
end;

procedure Tfrmpedidos.DescPromKeyPress(Sender: TObject; var Key: Char);
begin
{key:=ValidaNumeros(key,false);
key:=ValidaPunto(DescPP.Text,key);
if (key=#13) and (eddescuento.Text<>'') then
 begin
  key:=#0;
  edfinanciamiento.SetFocus;
 end;}
end;

procedure Tfrmpedidos.DescPPChange(Sender: TObject);
begin
{try
strtofloat(DescPP.text);
except
 DescPP.Text:='';
end;}
end;

procedure Tfrmpedidos.DescPPKeyPress(Sender: TObject; var Key: Char);
begin
{key:=ValidaNumeros(key,false);
key:=ValidaPunto(DescPP.Text,key);
if (key=#13) and (eddescuento.Text<>'') then
 begin
  key:=#0;
  edfinanciamiento.SetFocus;
 end;}
end;
{
procedure Tfrmpedidos.edFinanciamientoKeyPress(Sender: TObject;
  var Key: Char);
begin
{key:=ValidaNumeros(key,false);
key:=ValidaPunto(edfinanciamiento.Text,key);
if (key=#13) and (edfinanciamiento.Text<>'') then
 begin
  key:=#0;
  edanticipo.SetFocus;
 end;
end;

procedure Tfrmpedidos.edFinanciamientoChange(Sender: TObject);
begin
{ try
  eddescuento.Text:='0.00';
  eddescuento.Enabled:=false;
  strtofloat(edfinanciamiento.text);
 except
  edfinanciamiento.Text:='';
end;
if edfinanciamiento.Text='' then
 DescPP.Enabled:=true;
end;

procedure Tfrmpedidos.edFinanciamientoExit(Sender: TObject);
begin
{if edfinanciamiento.Text <> '' then
 edfinanciamiento.Text:=trim(Format('%8.2f',[strtofloat(edfinanciamiento.Text)]));
end;  }

procedure Tfrmpedidos.edAnticipoChange(Sender: TObject);
begin
{ try
  edanticipo.Text:=floattostr( QuitaCaracteres(edanticipo.Text,','));
 except
  edanticipo.Text:='';
 end;}
end;

procedure Tfrmpedidos.edAnticipoKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
//key:=ValidaPunto(edanticipo.Text,key);
end;

procedure Tfrmpedidos.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (cboestatus.Text <> 'Remisionado') and (cboestatus.Text <> 'Facturado') then
 begin
 if (key = 46) and (btnalta.Caption='&Guardar') then
  begin
      dsrejilla.DataSet:=sqlrejillaalta;
       //elimina las requisiciones hechas por este pedido
     querys('delete from requisiciones where idorden=0 and iddoc='+dsrejilla.DataSet.fieldbyname('idrequisicion').AsString ,1,sqlgeneral);
     BorraArticulos('DetPedidoTemp','idmaq',frmprincipal.idmaq,dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['id']);
     sqlrejillaalta.Close;
     sqlrejillaalta.ParamByName('idmaq').AsInteger:=strtoint(frmprincipal.idmaq);
//     sqlrejillaalta.ParamByName('iva').Asfloat:=strtofloat(cbiva.text);
     sqlrejillaalta.Open;
  end;

if (key = 46) and (btnmodificar.Caption='&Guardar') then
  begin
     dsrejilla.DataSet:=sqlrejillaedit;
     //elimina las requisiciones hechas por este pedido
     querys('delete from requisiciones where idorden=0 and iddoc='+dsrejilla.DataSet.fieldbyname('idrequisicion').AsString,1,sqlgeneral);
     BorraArticulos('DetPedido','idpedido',ednumpedido.Text,dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['id']);
    //refresca la rejilla de datos
     sqlrejillaedit.Close;
     sqlrejillaedit.ParamByName('idpedido').AsInteger:=strtoint(ednumpedido.Text);
     sqlrejillaedit.Open;
  end;
 end;
end;

procedure Tfrmpedidos.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
  begin
{query:=tmyquery.Create(self);
//determina si es paquete o no
querys('select if(paquete=1,''true'',''false'') as paquete from articulos where cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),0,sqlgeneral);
paquete:=strtobool(sqlgeneral.Fields.Fields[0].AsString);
//determina si estamos dando de altao editando
if btnalta.Enabled then
   begin tabla:='DetPedidoTemp';campo:='idmaq';valor:=frmprincipal.idmaq; dsrejilla.DataSet:=sqlrejillaalta; query:=sqlrejillaalta; end
else
  begin tabla:='DetPedido';campo:='idpedido';valor:=ednumpedido.Text; dsrejilla.DataSet:=sqlrejillaedit; query:=sqlrejillaedit; end;
if dsrejilla.DataSet.FieldValues['piezas'] > 0 then
   piezas:=true
else
   piezas:=false;
 //COMENTADO PARA NO HACER TANTOS MOVIMIENTOS
if (rejilla.Enabled) and (key='+') then
    begin
         if paquete then begin
            ValidaExistenciasPaquete(dsrejilla.DataSet.FieldValues['cod_cve'],1);
            InsertaArticulosPaquete(tabla,campo,valor,dsrejilla.DataSet.FieldValues['cod_cve'],query,dsrejilla.DataSet.FieldValues['cant']+1);
          end
         else
           begin
                val:=Validaexistencias(dsrejilla.DataSet.FieldValues['cod_cve'],1,false);
                if dsrejilla.DataSet.FieldValues['cant'] <> '0' then
                  querys('update '+tabla+' set cant=cant+1 where id='+dsrejilla.DataSet.fieldbyname('id').AsString,1,sqlgeneral)
                 else
             querys('update '+tabla+' set piezas=piezas+1 where id='+dsrejilla.DataSet.fieldbyname('id').AsString,1,sqlgeneral);

          if (val>0)or(val<0) then
             application.MessageBox('Le Informo que lo que esta pidiendo no lo tiene en existencias!','Aviso',mb_iconinformation);
      end;

    {      if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and (dsrejilla.DataSet.FieldValues['utilidad']<>'') then
         if (ValidaExistenciasPaquete(dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['cant']+1) = 0) and (paquete) then
            InsertaArticulosPaquete(tabla,campo,valor,dsrejilla.DataSet.FieldValues['cod_cve'],query,dsrejilla.DataSet.FieldValues['cant']+1)
         else
          if (Validaexistencias(dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['cant']+1,false) >= 0) and (paquete=false) then
             querys('update '+tabla+' set cant=cant+1 where id='+dsrejilla.DataSet.fieldbyname('id').AsString,1,sqlgeneral);
        if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') then
            if Validaexistencias(dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['piezas']+1,false) >= 0 then
               querys('update '+tabla+' set piezas=piezas+1 where id='+dsrejilla.DataSet.fieldbyname('id').AsString,1,sqlgeneral);}
//      end;

//COMENTADO PARA NO HACER TANTOS MOVIMIENTOS
{if (rejilla.Enabled) and (key='-') then
    begin
      if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and (dsrejilla.DataSet.FieldValues['utilidad']<>'') then
        if paquete then
            InsertaArticulosPaquete(tabla,campo,valor,dsrejilla.DataSet.FieldValues['cod_cve'],query,dsrejilla.DataSet.FieldValues['cant']-1)
         else
          if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and (paquete=false) and (dsrejilla.DataSet.FieldValues['cant']>1) then
             querys('update '+tabla+' set cant=cant-1 where id='+dsrejilla.DataSet.Fieldbyname('id').AsString,1,sqlgeneral);
          if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') and (paquete=false) and (dsrejilla.DataSet.FieldValues['piezas']>1) then
              querys('update '+tabla+' set piezas=piezas-1 where id='+dsrejilla.DataSet.Fieldbyname('id').AsString,1,sqlgeneral);
          end;

  query.Close;
  query.ParamByName(campo).AsInteger:=strtoint(valor);
  query.Open; }

end;

procedure Tfrmpedidos.edcodigoChange(Sender: TObject);
begin
if edcodigo.Text = '' then
LimpiaDatArt;
end;

procedure Tfrmpedidos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  var mensaje:string;
  resultado:integer;
begin
if btnmodificar.Caption = '&Guardar' then
   mensaje:='Se encuentra editando un registro, deseas guardar los cambios?';
if btnalta.Caption = '&Guardar' then
   mensaje:='Se encuentra agregando un registro, deseas guardar la alta?';

if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar')  then
   begin
     resultado:=application.MessageBox(pchar(mensaje),'Cuidado',mb_yesnocancel);
     if resultado = 7 then //respuesta no
       begin
         btncancelar.Click;
         btncancelar.Click;
         canclose:=true;
       end
         else
           if resultado = 6 then  //respuesta si
              begin
                if sqlpedidos.State = dsedit then
                   btnmodificar.Click
                else
                   btnalta.Click;
                   btncancelar.Click;
                 canclose:=true;
              end
           else
            canclose:=false;
   end;
if (btnalta.Caption <> '&Guardar') and (btnmodificar.Caption <> '&Guardar') then
   canclose:=true;
end;

procedure Tfrmpedidos.edcvecteButtonClick(Sender: TObject);
var r : integer;
sqltemp1 : tmyquery;
begin
sqltemp1:=tmyquery.Create(self);
sqltemp1.Connection := dmaccesos.conexion;
r :=BuscaCliente(sqlclientes);

if (r <> 0) and (btnalta.Caption='&Guardar') then
begin
 chtecla := #13;
 VerificarDatosOportunidad;
  //trae el vendedor casa para asignarselo al idvendedor y al autorizo
  querys('select idusuario,nombre from usuarios where nombre = '+quotedstr('CASA'),0,sqltemp1);
  if sqlclientes.FieldByName('idvendedor').AsInteger = 0 then
    begin
     edcve_vend.Text := sqltemp1.fieldbyname('idusuario').AsString;
     cbonom_vend.Text := sqltemp1.fieldbyname('nombre').AsString;
     edcveautorizo.Text := sqltemp1.fieldbyname('idusuario').AsString;
     cboNomAutorizo.Text := sqltemp1.fieldbyname('nombre').AsString;
   end
  else
   begin
     edcve_vend.Text := sqlclientes.FieldByName('idvendedor').Asstring;
     edcveautorizo.Text := sqlclientes.FieldByName('idvendedor').Asstring;
     edcve_vend.OnKeyPress(self,chtecla);
     edcveautorizo.OnKeyPress(self,chtecla);
   end;

edcvecte.Text := inttostr(r);
 EstatusCliente(edcvecte.Text,dmreportes.sqlgeneral8);
 if cboestatus.ItemIndex = 0 then
gbarticulo.Enabled:=true;
btnagregar.Enabled:=false;
gbotros.Enabled:=true;
Edcve_vend.SetFocus;
end;
end;

procedure Tfrmpedidos.edTipoNegButtonClick(Sender: TObject);
begin
 { frmbusquedas.query:='Select idtipo_oportunidad as Id,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From tipo_oportunidad order by idtipo_oportunidad';
  frmbusquedas.campo_retorno:='id';
  frmbusquedas.campo_busqueda:='nombre';
  frmbusquedas.ShowModal;
  if frmbusquedas.resultado <> '' then
   begin
     edTipoNeg.Text:=frmbusquedas.resultado;
    // edTipoNeg.Hint := frmbusquedas.sqlbuscar.fieldbyname('nombre').AsString;
   end; }

end;

procedure Tfrmpedidos.edTipoNegKeyPress(Sender: TObject; var Key: Char);
begin
{key:=validanumeros(key);
key:=validapunto(ednumpedido.Text+'.',key);
if (key = #13) and (edTipoNeg.Text = '') then
   begin
     key:=#0;
     edTipoNeg.OnButtonClick(self);
   end;

if (key=#13) and (edTipoNeg.Text<>'') then
 begin
  key:=#0;
  //busca el tipo de negocio tecleado
  querys('select nombre from tipo_oportunidad where idtipo_oportunidad='+edTipoNeg.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox('El Tipo de negocio tecleado no existe verifiquelo he intente de nuevo!','Aviso',mb_iconinformation);
    edTipoNeg.Text:='';
   end;
 end;}
end;

procedure Tfrmpedidos.cbonom_vendClick(Sender: TObject);
begin
//if edcve_vend.Text = '' then
//begin                                                                                                             (puestos.nombre = '+quotedstr('VENDEDOR')+' AND
querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  (usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) ='+quotedstr(cbonom_vend.Text)+')',0,SqlGeneral);
edcve_vend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
//end;
end;

procedure Tfrmpedidos.Edcve_vendKeyPress(Sender: TObject; var Key: Char);
begin
if (edcve_vend.Text<>'')and(key=#13) then
   begin
    try
     strtoint(EdCve_Vend.Text);
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                        //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
     querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
            ' WHERE  usuarios.estatus = 1 and  usuarios.idusuario='+EdCve_Vend.Text,0,SqlGeneral);
    except
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                       //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
     querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  usuarios.estatus = 1 and usuarios.codigo='+quotedstr(EdCve_Vend.Text),0,SqlGeneral);
    end;
     key:=#0;
   if SqlGeneral.RecordCount > 0 then
    begin
     CboNom_Vend.Text := SqlGeneral.fieldbyname('nombre').AsString;
     edcve_vend.Text :=SqlGeneral.fieldbyname('idusuario').AsString;
     CboNom_Vend.SetFocus;
    end
   else
    begin
     if application.MessageBox('Esa Clave de Vendedor no se encontro o esta inactiva deseas buscar otro?','Error',mb_yesno+mb_iconInformation) = idyes then begin
      frmbusquedas.query:='Select u.idusuario,u.codigo,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Nombre,u.idsector as Sector, '+
                          'a.nombre as Area,p.nombre as Puesto From usuarios as u LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE u.estatus = 1 order by u.codigo';
      frmbusquedas.campo_retorno:='codigo';
      frmbusquedas.campo_busqueda:='codigo';
      frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.ShowModal;

      if frmbusquedas.resultado <> '' then
       begin
              edcve_vend.Text := frmbusquedas.resultado;
              tecla:=#13;
              edcve_vend.OnKeyPress(self,tecla);
       end;
     end else begin
     edcve_vend.Text:='';
     end;
    end;
   end;

if key = #13 then
begin
 key := #0;
 cbonom_vend.SetFocus;
end;
end;

procedure Tfrmpedidos.ednum_origenKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednum_origen.Text<>'') then
   begin
      cbonom_origen.Text:='';
      querys('select idorigen,nombre from origen where idorigen='+ednum_origen.Text,0,sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
       begin
        cbonom_origen.Text:=sqlgeneral.fieldbyname('nombre').AsString;
        cbonom_origen.SetFocus;
       end
      else
       begin
        application.MessageBox('Ese numero de origen no existe intente con otro','Aviso',mb_iconinformation);
        ednum_origen.Text:='';
       end;
     key:=#0;
   end;
end;

procedure Tfrmpedidos.cbonom_origenClick(Sender: TObject);
begin
//trae el indice del origen
querys('select idorigen from origen where nombre='+quotedstr(cbonom_origen.Text),0,sqlgeneral);
ednum_origen.Text:=sqlgeneral.fieldbyname('idorigen').AsString;
end;

procedure Tfrmpedidos.cbonom_origenChange(Sender: TObject);
begin
if cbonom_origen.Text = '' then
ednum_origen.Text:='';
end;

procedure Tfrmpedidos.ednum_origenChange(Sender: TObject);
begin
if ednum_origen.Text = '' then
 cbonom_origen.Text:='';
end;

procedure Tfrmpedidos.Edcve_vendChange(Sender: TObject);
begin
if edcve_vend.Text = '' then
cbonom_vend.Text:='';
end;

procedure Tfrmpedidos.cbonom_vendChange(Sender: TObject);
begin
if cbonom_vend.Text = '' then
 edcve_vend.Text:='';
end;

procedure Tfrmpedidos.edTipoOportunidadChange(Sender: TObject);
begin
if edTipoOportunidad.Text = '' then
 cbonom_TOportunidad.Text:='';
end;

procedure Tfrmpedidos.edTipoOportunidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edTipoOportunidad.Text<>'') then
   begin
      cbonom_TOportunidad.Text:='';
        querys('select nombre from UnidadNegocio where idUnidadNegocio='+edTipoOportunidad.Text,0,dmreportes.sqlgeneral);
      if dmreportes.sqlgeneral.RecordCount > 0 then
       begin
         cbonom_TOportunidad.Text:=dmreportes.sqlgeneral.fieldbyname('nombre').AsString;
         cbonom_TOportunidad.Setfocus;
       end
      else
       begin
        application.MessageBox('Ese numero de Unidad de Negocio no existe intente con otro','Aviso',mb_iconinformation);
        edTipoOportunidad.Text:='';
       end;
     key:=#0;
   end;
end;

procedure Tfrmpedidos.cbonom_TOportunidadClick(Sender: TObject);
begin
{
//trae el id del tipo de oportunidad
querys('select idUnidadNegocio,Descripcion from UnidadNegocio where nombre='+quotedstr(cbonom_TOportunidad.Text),0,dmreportes.sqlgeneral);
        edTipoOportunidad.Text:=dmreportes.sqlgeneral.fieldbyname('idUnidadNegocio').AsString;
        reconcepto.Text := dmreportes.sqlgeneral.fieldbyname('Descripcion').AsString;
}

{
if cbonom_TOportunidad.Text='MONITOREO' then
 reconcepto.Text:='MONITOREO CORREPONDIENTE A '
else
 reconcepto.Text:='';
}

end;

procedure Tfrmpedidos.cbonom_vendKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
 key := #0;
 SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmpedidos.cbonom_origenKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  edCveAutorizo.SetFocus;
 end;
end;

procedure Tfrmpedidos.cbonom_TOportunidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
 key := #0;
SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
//edcodigo.SetFocus;
end;
end;

procedure Tfrmpedidos.edTCPKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
if key = #13 then
 begin
  key := #0;
  edchp.SetFocus;
 end;
end;

procedure Tfrmpedidos.edTCPExit(Sender: TObject);
begin
if edTCP.Text = '' then
 begin
  application.MessageBox('Debe de especificar el Tipo de Cambio','Cuidado',mb_iconwarning);
  edTCP.SetFocus;
 end
else
 begin
  if dsrejilla.DataSet.RecordCount > 0 then
   application.MessageBox('Recuerde recalcular sus totales en el boton de la parte inferior que tiene la leyenda (Recalcular Totales)','Aviso',mb_iconwarning);
  //actualiza el tipo de cambio
  //querys('update configuraciones set valor = '+Format('%8.2f',[strtofloat(edTCP.Text)])+' where concepto='+quotedstr('TipoCambio'),1,sqlgeneral);
  if btnalta.Caption = '&Guardar' then
   querys('update DetPedidoTemp,articulos set tc = '+edtcp.Text+' where DetPedidoTemp.cod_cve = articulos.cod_cve and articulos.moneda = ''D'' and  idmaq='+frmprincipal.idmaq+' ',1,sqlgeneral);
  if btnmodificar.Caption = '&Guardar' then
   querys('update DetPedido,articulos set tc = '+edtcp.Text+' where DetPedido.cod_cve = articulos.cod_cve and articulos.moneda = ''D'' and  idpedido='+edNumPedido.Text,1,sqlgeneral);
 end;
end;

procedure Tfrmpedidos.edCHPKeyPress(Sender: TObject; var Key: Char);
begin
key:=validanumeros(key,false);
end;

procedure Tfrmpedidos.edCHPExit(Sender: TObject);
begin
if edCHP.Text = '' then
 begin
  application.MessageBox('Debe de espeficicar el Costo por Hora','Cuidado',mb_iconwarning);
  edCHP.SetFocus;
 end
else
 begin
  if dsrejilla.DataSet.RecordCount > 0 then
   application.MessageBox('Recuerde recalcular sus totales en el boton de la parte inferior que tiene la leyenda (Recalcular Totales)','Aviso',mb_iconwarning);
    //actualiza el tipo de cambio
  //querys('update configuraciones set valor = '+edCHP.Text+' where concepto='+quotedstr('CostoHora'),1,sqlgeneral);
 end;
end;

procedure Tfrmpedidos.btnfacturarClick(Sender: TObject);
  var   idfactura : string;
begin
//#cfd
if ValidaFacturar = false then
      exit;
   try
    tipo := 'N';
      if AsignaFolio = false then
         exit;
      if idfactura = '0' then
        exit;    

       RemisionAntesFactura;

      TerminaFacturar;
   except
      dmaccesos.conexion.Rollback;
      application.MessageBox('Ocurrio un error al intentar grabar los datos, consulte con su Administrador del Sistema','Aviso',mb_iconwarning);
   end;

end;

procedure Tfrmpedidos.TSpedidoClick(Sender: TObject);
begin
panel2.Parent:= tspedido;
end;

procedure Tfrmpedidos.PCpedidosChange(Sender: TObject);
begin
if tsfacturacion.Showing then
 begin
   panel2.Parent:= tsfacturacion;
   lblayuda.Visible := false;
   lblTotarts.Visible := false;
 end;

if tspedido.Showing then
 begin
  panel2.Parent:=tspedido;
  lblayuda.Visible := true;
  lblTotarts.Visible := true;
 end;
 
end;

procedure Tfrmpedidos.edTipoNegExit(Sender: TObject);
begin
//tecla:=#13;
//edTipoNeg.OnKeyPress(self,tecla);
end;

procedure Tfrmpedidos.edcvecteExit(Sender: TObject);
begin
if edcvecte.Text <> '' then
 begin
  //verifica que lo que se halla tecleado en cve_cte sea valido
  querys('select idcliente from clientes where idcliente='+edcvecte.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox(pchar('Ese cliente #'+edcvecte.text+' no existe'),'Aviso',mb_iconinformation);
    edcvecte.Text := '';
    edcvecte.SetFocus;
   end
  else
   begin
     //trae los datos del cliente
     sqlclientes.close;
     sqlclientes.params.items[0].value:=strtoint(edcvecte.Text);
     sqlclientes.open;
    if cboestatus.ItemIndex = 0 then
     gbarticulo.Enabled:=true;
     btnagregar.Enabled:=false;
    Edcve_vend.setfocus;
   end;
 end;
end;

procedure Tfrmpedidos.cboLineaNotInList(Sender: TObject);
begin
{cboLinea.ItemIndex := 0;
cbonom_toportunidad.Clear;
//Carga los tipos de Oportunidad
CargaCombo('select tipo_oportunidad.nombre from tipo_oportunidad inner join lineas on lineas.idlinea = tipo_oportunidad.idlinea where lineas.nombre = '+quotedstr(cboLinea.Text)+' order by tipo_oportunidad.nombre','Tipos de Oportunidad',cbonom_TOportunidad);}
end;

procedure Tfrmpedidos.cboLineaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  Edcve_vend.Setfocus;
 end;
end;

procedure Tfrmpedidos.cbonom_vendNotInList(Sender: TObject);
begin
//edcve_vend.Clear;
//cbonom_vend.Text := '';
end;

procedure Tfrmpedidos.cbonom_TOportunidadNotInList(Sender: TObject);
begin
edTipoOportunidad.Clear;
cbonom_toportunidad.Text := '';
end;

procedure Tfrmpedidos.cbonom_origenNotInList(Sender: TObject);
begin
ednum_origen.Clear;
cbonom_origen.Text := '';
end;

procedure Tfrmpedidos.edCveAutorizoChange(Sender: TObject);
begin
if edCveAutorizo.Text = '' then
cboNomAutorizo.Text:='';
end;

procedure Tfrmpedidos.edCveAutorizoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (edCveAutorizo.Text<>'')and(key=#13) then
   begin
   try
   //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre                                                                                                                                                  puestos.nombre = '+quotedstr('VENDEDOR')+' AND
    querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
           ' WHERE usuarios.estatus = 1 and  usuarios.idusuario='+edCveAutorizo.Text,0,SqlGeneral);
   except
    //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre                                                                                                                                                  puestos.nombre = '+quotedstr('VENDEDOR')+' AND
    querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  usuarios.estatus = 1 and usuarios.codigo='+quotedstr(edCveAutorizo.Text),0,SqlGeneral);
   end;
    key:=#0;
   if SqlGeneral.RecordCount > 0 then
    begin
     CboNomAutorizo.Text := SqlGeneral.fieldbyname('nombre').AsString;
     edcveautorizo.Text := SqlGeneral.fieldbyname('idusuario').AsString;
     //CboNomAutorizo.SetFocus;
           if cbonom_TOportunidad.text = '' then
              cbonom_TOportunidad.setfocus
           else
            if gbarticulo.enabled = true then
              edcodigo.setfocus;

    end
   else
    begin
     application.MessageBox('Esa Clave de Usuario no Existe o no esta activo, verifiquelo y vuelva a intentarlo!','Error',mb_ok+mb_iconwarning);
     edcveautorizo.Text:='';
    end;
   end;

if key = #13 then
begin
 key := #0;
 //cbonomAutorizo.SetFocus;
 cbonom_TOportunidad.setfocus;

end;
end;

procedure Tfrmpedidos.cboNomAutorizoChange(Sender: TObject);
begin
if cboNomAutorizo.Text = '' then
 edcveAutorizo.Text:='';
end;

procedure Tfrmpedidos.cboNomAutorizoClick(Sender: TObject);
begin                                                                                                                //puestos.nombre = ''VENDEDOR'' AND
querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull'+
       '(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) ='+quotedstr(cboNomAutorizo.Text)+' order by usuarios.nombre',0,SqlGeneral);
edcveAutorizo.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
end;

procedure Tfrmpedidos.cboNomAutorizoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
 key := #0;
 edCodigo.setfocus;
end;
end;

procedure Tfrmpedidos.cboNomAutorizoNotInList(Sender: TObject);
begin
//edcveAutorizo.Clear;
//cbonomAutorizo.Text := '';
end;

procedure Tfrmpedidos.EdPrecioKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #27 then
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;

  key := ValidaNumeros(key,false);
  key := ValidaPunto(EdPrecio.Text,key);

if (key = #13) and (edPrecio.Text <> '') then
 begin
  key := #0;
  edCantidad.SetFocus;
 end;

end;

procedure Tfrmpedidos.EdPrecioExit(Sender: TObject);
begin
if (strtofloat(edprecio.Text) <= 0) and (edcodigo.text = 'CARGOS') then
 begin
  application.MessageBox('El precio del articulo no puede ser Menor o Igual a 0','Cuidado',mb_iconwarning);
  edPrecio.Text := '1';
 end;
end;

procedure Tfrmpedidos.SqlrejillaaltaAfterPost(DataSet: TDataSet);
begin
if dataset.RecordCount = 28 then
 begin
  application.MessageBox('Ya se ha llegado al limite de 28 articulos por pedido y no podra agregar mas','Aviso',mb_iconinformation);
  gbarticulo.Enabled := false;
 end
else
  if cboestatus.ItemIndex = 0 then
   gbarticulo.Enabled := true;
end;

procedure Tfrmpedidos.sqlrejillaeditAfterPost(DataSet: TDataSet);
begin
if dataset.RecordCount = 28 then
 begin
  application.MessageBox('Ya se ha llegado al limite de 28 articulos por pedido y no podra agregar mas','Aviso',mb_iconinformation);
  gbarticulo.Enabled := false;
 end
else
 if cboestatus.ItemIndex = 0 then
  gbarticulo.Enabled := true;
end;

procedure Tfrmpedidos.cboLineaClick(Sender: TObject);
begin
//Carga los tipos de Oportunidad
//CargaCombo('select tipo_oportunidad.nombre from tipo_oportunidad inner join lineas on lineas.idlinea = tipo_oportunidad.idlinea where lineas.nombre = '+quotedstr(cboLinea.Text)+' order by tipo_oportunidad.nombre','Tipos de Oportunidad',cbonom_TOportunidad);
end;

procedure Tfrmpedidos.CboUtilidadNotInList(Sender: TObject);
begin
CboUtilidad.ItemIndex := 0;
end;

procedure Tfrmpedidos.edvtasxctaKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key,false);
key := ValidaPunto(edvtasxcta.Text,key);
if (key = #13) and (edvtasxcta.Text <> '') then
 begin
  sqlclientes.Close;
  sqlclientes.Params.Items[0].Value:=strtoint(edvtasxcta.Text);
  sqlclientes.Open;
  if sqlclientes.RecordCount=0 then
   begin
    application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
    edvtasxcta.Text:='';
   end
  else
   begin
    frmbusquedas.query:='select idpedido,FechaCreacion,TotMn ,if(estatus =0,''PED'',if(estatus =1,''CAN'',if(estatus =2 ,''BACK'',if (estatus =3 ,''REM'',if (estatus =4 ,''FAC'',''''))))) as Estado, FechaVencimiento,CodVendedor,concepto, '+
                       'if (saldado=1,''SI'',''NO'') AS saldado,idUnidadNegocio,Saldo from pedidos where idcliente='+edvtasxcta.Text+' order by idpedido desc';
     querys('select idpedido from pedidos where idcliente='+edvtasxcta.Text+' order by idpedido desc',0,sqlgeneral);
     frmbusquedas.maxrow := sqlgeneral.RecordCount;
     frmbusquedas.campo_retorno:='idpedido';
     frmbusquedas.campo_busqueda:='idpedido';
     frmbusquedas.tabla:='';
     frmbusquedas.tblorigen := 'pedidos';
     frmbusquedas.ShowModal;
     if frmbusquedas.resultado <> '' then
      begin
        chtecla := #13;
        edNumPedido.Text := frmbusquedas.resultado;
        edNumPedido.OnKeyPress(self,chtecla);
      end;
    end;
   end;
end;

procedure Tfrmpedidos.edvtasxctaButtonClick(Sender: TObject);
var r : integer;
begin
r :=BuscaCliente(sqlclientes);
if (r <> 0)  then
begin
edvtasxcta.Text := inttostr(r);
chtecla := #13;
edvtasxcta.OnKeyPress(self,chtecla);
end;
end;

procedure Tfrmpedidos.edFechaVencimientoClick(Sender: TObject);
begin
//showmessage('OnClick');
end;

procedure Tfrmpedidos.edFechaVencimientoChange(Sender: TObject);
begin
//showmessage('OnChange');
end;

procedure Tfrmpedidos.btnregresarClick(Sender: TObject);
var fechaRemi:string;
begin
  if DerechosSys('Regresar a Pedido') = false then
  begin
    Application.MessageBox('Usted no tiene derechos para borrar o cancelar pedidos', 'Atencion', MB_ICONEXCLAMATION);
    exit;
  end;

if Application.MessageBox('Estas seguro de Regresar a Pedido?', 'Atencion', MB_ICONEXCLAMATION+mb_yesno) <> idyes then
  exit;


  fechaRemi :=  Copy(lblFechaAltaRem.Caption,16,11);
  if(strtodatetime(fechaRemi) < frmprincipal._fechaCierreMes ) then
  begin
    //if(frmprincipal._ModificarCierre = false) then
    if DerechosSys('Modifica Cierre') = false then
    begin
      application.MessageBox('El pedido es de un cierre anterior solo un administrador puede realizar esta operación!','Aviso',mb_iconinformation);
      exit;
    end;
  end;

  //buscar si tiene pagos realizados
  querys('select sum(abono) from PagosClientes where idpedido ='+edNumPedido.Text+' and movimiento in(0,2,10) ',0,sqlgeneral);
  if(sqlgeneral.Fields.Fields[0].asfloat = 0 ) then
  begin
    RegresarAPedido(edNumPedido.Text,edcuenta.Text);
    RegresaExistencias(edNumPedido.Text,'',false,dsrejilla);
    MuestraRemiciones(edNumPedido.Text);
    btnremisionar.Enabled := true;
    btnregresar.visible := false;
    gbarticulo.Enabled := true;
    cbiva.Enabled := true;
    application.MessageBox('El pedido ha sido regresado a el estatus de pedido y podra Agregar,Modificar o Eliminar Articulos','Aviso',mb_iconinformation);
    cboestatus.ItemIndex :=  0;
  end
  else
    application.MessageBox(pchar('Este pedido tiene '+CurrToStrF(sqlgeneral.Fields.Fields[0].asfloat,ffCurrency, 2)+' como abono, primero cancele los pagos para regresar a pedido esta remisión'),'Aviso',mb_iconinformation);

//***********************************************************\\
//  CODIGO ANTERIOR, CUALQUIER PROBLEMA QUITAR LO COMENTADO  \\
//                   Y BORRAR LO DEMAS                       \\
//***********************************************************\\

{fechaRemi :=  Copy(lblFechaAltaRem.Caption,16,11);
if(strtodatetime(fechaRemi) < frmprincipal._fechaCierreMes ) then
 begin
   if(frmprincipal._ModificarCierre = false) then
      begin
         application.MessageBox('El pedido es de un cierre anterior solo un administrador puede realizar esta operación!','Aviso',mb_iconinformation);
         exit;
      end;
 end;

//buscar si tiene pagos realizados
querys('select sum(abono) from PagosClientes where idpedido ='+edNumPedido.Text+' and movimiento in(0,2,10) ',0,sqlgeneral);
if(sqlgeneral.Fields.Fields[0].asfloat = 0 ) then
 begin
//elimina de RemiFact
querys('delete from RemiFact where idpedido='+edNumPedido.Text,1,sqlgeneral);
//trae el cargo hecho al cliente
querys('select restante from PagosClientes where idpedido = '+edNumPedido.Text+' and movimiento = 0',0,sqlgeneral);
//actualiza el saldo del cliente
querys('update clientes set saldo = saldo-'+sqlgeneral.fieldbyname('restante').AsString+' where idcliente='+edcuenta.Text,1,sqlgeneral);
//elimina los cargos de PagosClientes
querys('delete from PagosClientes where idpedido='+edNumPedido.Text,1,sqlgeneral);
cboestatus.ItemIndex := 0;
//actualiza el estatus del cliente
querys('update pedidos set estatus=0,Saldo=0 where idpedido='+edNumPedido.Text,1,sqlgeneral);
RegresaExistencias(edNumPedido.Text,'',false,dsrejilla);
MuestraRemiciones(edNumPedido.Text);
btnremisionar.Enabled := true;
btnregresar.visible := false;
gbarticulo.Enabled := true;
cbiva.Enabled := true;
application.MessageBox('El pedido ha sido regresado a el estatus de pedido y podra Agregar,Modificar o Eliminar Articulos','Aviso',mb_iconinformation);

 end else
   application.MessageBox(pchar('Este pedido tiene '+CurrToStrF(sqlgeneral.Fields.Fields[0].asfloat,ffCurrency, 2)+' como abono, primero cancele los pagos para regresar a pedido esta remisión'),'Aviso',mb_iconinformation);
}
end;

procedure Tfrmpedidos.FormActivate(Sender: TObject);
begin
self.WindowState:=wsMaximized;
end;

procedure Tfrmpedidos.cbonom_TOportunidadChange(Sender: TObject);
begin
if cbonom_toportunidad.Text = '' then
 begin
  edTipoOportunidad.Text := '';
  reconcepto.Text := '';
 end;
end;

{procedure Tfrmpedidos.InstPendiente;
begin
querys('select instalacion from pedidos as p left join UnidadNegocio as u on u.idunidadnegocio=p.idunidadnegocio where idpedido = '+edNumpedido.text+' and instalacion = 1', 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  if application.MessageBox('¿Dejar Instalacion Pendiente por pago de Anticipo?', 'ATENCION', MB_ICONINFORMATION+MB_YESNO) = idyes then
    begin
    instpend := true;
    querys('Update pedidos set instpend = 1 where idpedido = '+edNumpedido.text, 1, sqlgeneral);
    end
  else
    instpend := false;
end;}
{
procedure Tfrmpedidos.ComisionesVend;
  var idpago:string;
begin
querys('Select idpago from PagosClientes where idpedido='+edNumPedido.Text+' and movimiento = 0', 0, sqlgeneral);
idpago:=sqlgeneral.fieldbyname('idpago').AsString;
if cboestatus.Text = 'FACTURADO' then
  begin
  if querys('select idremicion from RemiFact where idpedido='+edNumpedido.Text+' and idremicion<>0',0,sqlgeneral) > 0 then
    exit;
  end;
//    'and  comisiones = 1'
if querys('Select cantidad from UnidadNegocio as u Left join Comisiones as c on u.nombre=c.UnidadNegocio '+
          'where u.nombre='+edTipoOportunidad.text+' and instalacion =1 ', 0, sqlgeneral) > 0 then
  querys('Insert into ComisionesKardex (idusuario, idpedido, idpago, cargo, abono, restante,  '+
         'mes, nota, idunidadnegocio, movimiento, TotalComision, usuario, fecha, hora) values ('+Edcve_vend.Text+', '+edNumPedido.Text+', '+idpago+', '+
         edanticipo.text+', '+edtotmn.Text+', ('+edanticipo.text+'-'+edtotmn.Text+'), month("'+datetostr(date)+'"), "CARGO POR PEDIDO '+
         UpperCase(cboestatus.Text)+'", '+edTipoOportunidad.text+', 0, '+sqlgeneral.fieldbyname('cantidad').AsString+', "'+
         frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);
end;
 }
procedure Tfrmpedidos.sqlpedidosBeforePost(DataSet: TDataSet);
begin

sqlpedidos.FieldByName('idpedido').Asstring:=edNumPedido.Text;
sqlpedidos.FieldByName('idpresupuesto').Asstring:=edpresupuesto.Text;
sqlpedidos.fieldbyname('concepto').Asstring:=REConcepto.Text;
sqlpedidos.fieldbyname('NotaInst').Asstring:=RENotaInst.Text;
sqlpedidos.fieldbyname('usuario').Asstring:=frmprincipal.ucprincipal.CurrentUser.Username;
sqlpedidos.fieldbyname('fecha').Asstring:=datetostr(FechaServidor);
sqlpedidos.fieldbyname('hora').Asstring:=timetostr(HoraServidor);
sqlpedidos.fieldbyname('DescProm').Asstring:=eddescuento.Text;
sqlpedidos.FieldByName('TipoCambio').AsFloat:=strtofloat(edTCP.Text);
sqlpedidos.fieldbyname('TotMat').Asstring:=edTotMat.Text;
sqlpedidos.fieldbyname('TotHrs').Asstring:=edTotHrs.Text;
sqlpedidos.fieldbyname('TotHrsCom').Asstring:=edTotHrsCom.Text;
sqlpedidos.fieldbyname('CostoHrs').Asstring:=edCHP.Text;
sqlpedidos.fieldbyname('MontoHrs').Asstring:=edHoras.Text;
sqlpedidos.fieldbyname('SubTotal').Asstring:=edTotMat.Text;
sqlpedidos.fieldbyname('descuento').Asstring:=eddescuento.Text;
sqlpedidos.fieldbyname('Iva').Asstring:=ediva.Text;
sqlpedidos.fieldbyname('pIVA').Asstring:=cbiva.Text;
sqlpedidos.fieldbyname('TotDlls').Asstring:=edTotDlls.Text;
sqlpedidos.fieldbyname('TotMn').Asstring:=edTotMn.Text;
sqlpedidos.fieldbyname('Anticipo').Asstring:=edanticipo.Text;
sqlpedidos.fieldbyname('Saldo').Asstring:=floattostr(strtofloat(edTotMn.Text)-strtofloat(edsaldo.Text));
sqlpedidos.FieldByName('idUnidadNegocio').AsString := edTipoOportunidad.Text;
sqlpedidos.FieldByName('idorigen').asstring := ednum_origen.Text;
if(Length(edCveAutorizo.Text) > 0 ) then sqlpedidos.FieldByName('autorizo').asinteger := strtoint(edCveAutorizo.Text) else sqlpedidos.FieldByName('autorizo').asinteger := 0;
sqlpedidos.fieldbyname('idcliente').Asstring:=edcuenta.Text;
sqlpedidos.FieldByName('estatus').Asinteger:=cboestatus.ItemIndex;
if edcve_vend.text<>'' then
  sqlpedidos.fieldbyname('idvendedor').Asstring:=edcve_vend.Text
else
  sqlpedidos.fieldbyname('idvendedor').Asstring:=inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);


if sqlpedidos.State = dsinsert then
  begin
  sqlpedidos.FieldByName('FechaCreacion').AsDateTime:=strtodate(edfechacreacion.text);
  sqlpedidos.fieldbyname('Saldo').Asstring:=floattostr(strtofloat(edTotMn.Text)-strtofloat(edsaldo.Text));
  end;

if sqlpedidos.State = dsedit then
  if edfechavencimiento.text <> '' then
    sqlpedidos.FieldByName('FechaVencimiento').AsDateTime:=strtodate(edfechavencimiento.text);

//#boletas 2009
if cbonom_TOportunidad.Text = 'MONITOREO' then
  sqlpedidos.FieldByName('observaciones').AsString := frmmesesremision.anualidad;
end;

procedure Tfrmpedidos.cbivaExit(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   begin
   CalculaTotales(SqlRejillaAlta);
   end;
if btnmodificar.caption = '&Guardar' then
   begin
   CalculaTotales(SqlRejillaEdit);
   end;
end;

procedure Tfrmpedidos.cbonom_TOportunidadExit(Sender: TObject);
var i:integer;// key:char;
begin

    querys('select idUnidadNegocio,Descripcion from UnidadNegocio where nombre='+quotedstr(cbonom_TOportunidad.Text),0,dmreportes.sqlgeneral);
   edTipoOportunidad.Text:=dmreportes.sqlgeneral.fieldbyname('idUnidadNegocio').AsString;

   if cboestatus.ItemIndex > 1 THEN
     exit;
     
   reconcepto.Text := dmreportes.sqlgeneral.fieldbyname('Descripcion').AsString;
   concepto:= reconcepto.Text;
   if cbonom_TOportunidad.Text='REUBICACION' then
   begin
      querys('select concat(o.dir," NO. ",o.numero," COLONIA ",c.nombre," CP. ",o.cp) as direccion from oportunidades o left join presupuestos2 p '+
      ' on o.idoportunidad=p.idoportunidad left join colonias c on o.idcol=c.idcol where idpresupuesto='+edpresupuesto.text,0,dmreportes.sqlgeneral);
      RENotaInst.Lines.Add('********   NUEVA DIRECCION   ********');
      RENotaInst.Lines.Add('******** '+dmreportes.sqlgeneral.fieldbyname('direccion').AsString+' ********');
   end;

   if (cbonom_TOportunidad.Text = 'MONITOREO') or (cbonom_TOportunidad.Text = 'CORTESIA') then
   begin
      //reconcepto.Enabled:= false;
      frmmesesremision.inicializa;
      frmmesesremision.ShowModal;
      reconcepto.Text := concepto + ' ' + frmmesesremision.meses;

   //#boletas 2009
      for i:=1 to 12 do
      begin
        if frmmesesremision.mesesmon[i] = 1 then
        begin
          if i > 9 then
            edcodigo.Text := 'MON'+inttostr(i)+RightStr(frmmesesremision.edano.Text,2)
          else
            edcodigo.Text := 'MON0'+inttostr(i)+RightStr(frmmesesremision.edano.Text,2);
          edcantidad.text := '1';
          //key := #13;
          //edcodigo.OnKeyPress(self, key);
          //si tiene cuentas compartidas
          if querys('select compartido from clientes c left join contratos con on c.TipoCont=con.tipocont '+
          ' where idcliente ='+edcuenta.text+' and compartido = 1', 0, sqltemp) > 0 then
          begin
            if frmmesesremision.chAnualidad.Checked then
            begin
              querys('Select round(sum(costoAnual),2) as CostoMensual from (select com.idcliente as Cliente,cat.CostoMensual,costoAnual '+
                     'from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom '+
                     'left join categorias cat on c.idcategoria=cat.idcategoria '+
                     'where com.idcliente='+edcuenta.text+' union all select c.idcliente as Cliente, cat.CostoMensual, costoAnual '+
                     ' from  clientes c left join categorias cat on c.idcategoria=cat.idcategoria where c.idcliente= '+
                     edcuenta.text+' ) as d',0,sqltemp);
              edPrecio.Text := format('%8.2f',[sqltemp.fieldbyname('CostoMensual').AsFloat/12]);
              if i=12 then
              begin
                edprecio.text:=Format('%8.2f',[strtofloat(edprecio.Text)+(sqltemp.fieldbyname('CostoMensual').AsFloat-(strtofloat(edprecio.text)*12))]);
              end;
            end
            else
            begin
              querys('Select round(sum(CostoMensual),2) as CostoMensual from (select com.idcliente as Cliente,cat.CostoMensual,costoAnual '+
                     'from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom left join categorias cat on c.idcategoria=cat.idcategoria '+
                     'where com.idcliente='+edcuenta.text+' union all select c.idcliente as Cliente, cat.CostoMensual, costoAnual from  clientes c '+
                     'left join categorias cat on c.idcategoria=cat.idcategoria where c.idcliente='+edcuenta.text+' ) as d', 0, sqltemp);
              edPrecio.Text := sqltemp.fieldbyname('CostoMensual').AsString;
            end;
          end
          else
          // no tiene compartidas
          begin
            if frmmesesremision.chAnualidad.Checked then
            begin
              querys('select round(CostoAnual,2) as CostoMensual from categorias where nombre = ' + quotedstr(edcategoria.Text),0,sqltemp);
              edPrecio.Text := format('%8.2f',[sqltemp.fieldbyname('CostoMensual').AsFloat/12]);
              if i=12 then
              begin
                edprecio.text:=Format('%8.2f',[strtofloat(edprecio.Text)+(sqltemp.fieldbyname('CostoMensual').AsFloat-(strtofloat(edprecio.text)*12))]);
              end;
            end
            else
            begin
              querys('select CostoMensual from categorias where nombre = ' + quotedstr(edcategoria.Text),0,sqltemp);
              edPrecio.Text := sqltemp.fieldbyname('CostoMensual').AsString;
            end;
          end;

          btnagregar.OnClick(self);
        end;
      end;
   ///////////////
   end;
end;
{
procedure Tfrmpedidos.GeneraInstalacion;
begin
           {
//  **  INSTALACION  ** \\

   //verifica que el pedido no este en instalaciones ya
   querys('select idpedido from instalaciones where idpedido='+edNumPedido.Text,0,sqlgeneral);
   if sqlgeneral.fieldbyname('idpedido').asstring = '' then
    begin
     CodigoInstalador := '';
    // if edinstalacion.text = '0' then begin
     //verifica que este pedido ocupe instalacion
     querys('select instalacion from UnidadNegocio where nombre='+quotedstr(cbonom_TOportunidad.Text),0,sqlgeneral);
     if sqlgeneral.FieldByName('instalacion').AsInteger = 1 then
      begin
       //inserta en la tabla de instalaciones el idpedido

       querys('select Instalador from usuarios where idusuario = '+quotedstr(Edcve_vend.Text),0,sqlgeneral);
       if sqlgeneral.FieldByName('Instalador').AsString = '' then
         begin
                querys('select codigo,DefaultUsr from usuarios as u LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto)  WHERE a.nombre=''INSTALACIONES'' and p.nombre = ''INSTALADOR'' and idsector = '+quotedstr(RzDBEdit3.Text),0,sqlgeneral);
                while not sqlgeneral.Eof do
                  begin

                    CodigoInstalador :=  sqlgeneral.FieldByName('codigo').AsString;
                    if ((sqlgeneral.FieldByName('DefaultUsr').AsString = 'True') or (sqlgeneral.FieldByName('DefaultUsr').AsString = '1')) then
                        sqlgeneral.Last
                    else
                        sqlgeneral.Next;

                  end;
                      querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+edNumPedido.Text+','+quotedstr(CodigoInstalador)+',0, '+quotedstr(edcvecte.text)+')',1,sqlgeneral)

         end else
           begin
              querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+edNumPedido.Text+','+quotedstr(sqlgeneral.FieldByName('Instalador').AsString)+',0, '+quotedstr(edcvecte.text)+')',1,sqlgeneral);
           end;

       querys('select idinstalacion as ultimo from instalaciones where idpedido='+edNumPedido.Text,0,sqlgeneral);
       idinst:=sqlgeneral.fieldbyname('ultimo').asstring;
       edinstalacion.Text:=idinst;

      end;
    end;

////////////////////////////////////////////////////////////////////////////////
   //verifica que el pedido no este en instalaciones ya
   querys('select idpedido from instalaciones where idpedido='+edNumPedido.Text,0,sqlgeneral);
   if sqlgeneral.fieldbyname('idpedido').asstring = '' then
    begin
   //verifica que este pedido ocupe instalacion
     querys('select instalacion from UnidadNegocio where nombre='+quotedstr(cbonom_TOportunidad.Text),0,sqlgeneral);
     if sqlgeneral.FieldByName('instalacion').AsInteger = 1 then
      begin
       //inserta en la tabla de instalaciones el id pedido
       querys('select codigo from usuarios where nombre = ''SIN INSTALADOR'' ',0,sqlgeneral);
       querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+edNumPedido.Text+','+quotedstr(sqlgeneral.fieldbyname('codigo').asstring)+',0, '+quotedstr(edcvecte.text)+')',1,sqlgeneral);
       querys('select idinstalacion as ultimo from instalaciones where idpedido='+edNumPedido.Text,0,sqlgeneral);
       idinst:=sqlgeneral.fieldbyname('ultimo').asstring;
       edinstalacion.Text:=idinst;
       querys('Update pedidos set idinstal='+quotedstr(idinst)+' where idpedido='+edNumPedido.Text,1,sqlgeneral);
        {
       //MODIFICACION\\
       if (instpend = true) and (edinstalacion.Text <> '') then
         begin
         querys('Update pedidos set instpend = 1 where idpedido='+edNumPedido.Text, 1, sqlgeneral);
         querys('Update instalaciones set estatus = 2 where idinstalacion='+edinstalacion.Text, 1, sqlgeneral);
         end;
       //endMODIFICACION\\
       }
    {  end;

    end;
end;
end;   }

procedure Tfrmpedidos.btnImpPedClick(Sender: TObject);
begin
querys('select max(tcasa) as tcasa, max(talarma) as talarma, max(toficina) as toficina, '+
       'max(tcelular) as tcelular, max(tnextel) as tnextel, max(tnextelradio) as tnextelradio '+
       'from (select c.idcliente, if(t.tipo_tel = "CONVENCIONAL", t.telefono, "") as tcasa, '+
       'if(t.tipo_tel = "ALARMA", t.telefono, "") as talarma, if(t.tipo_tel = "OFICINA", t.telefono, '+
       '"") as toficina, if(t.tipo_tel = "CELULAR", t.telefono, "") as tcelular, if(t.tipo_tel = '+
       '"NEXTEL", t.telefono, "") as tnextel, if(t.tipo_tel = "NEXTEL RADIO", t.telefono, "") as '+
       'tnextelradio from telefonos as t left join clientes as c on c.idtel=t.idtel where '+
       'c.idcliente = 4815) as t group by idcliente', 0, sqlgeneral);

querys('Select c.idcliente, c.nombre, c.st_date, col.nombre as colonia,c.dir, c.refs, c.ciudad, col.cp, '+
       '"'+sqlgeneral.fieldbyname('tcasa').asstring+'" as tcasa, "'+sqlgeneral.fieldbyname('talarma').asstring+'" as talarma, '+
       '"'+sqlgeneral.fieldbyname('toficina').asstring+'" as toficina, "'+sqlgeneral.fieldbyname('tcelular').asstring+'" as tcelular, '+
       '"'+sqlgeneral.fieldbyname('tnextel').asstring+'" as tnextel, "'+sqlgeneral.fieldbyname('tnextelradio').asstring+'" as tnextelradio, '+
       'email, cf.nombrecres, cf.dircres,  colcres, rfccres,cdcres, cpcres, Subtotal, IVA, TotMN, TotDlls, '+
       'TipoCambio, p.FechaCreacion, r.nombre as responsable, r.cargo as respcargo, u.nombre as vendedor '+
       'from pedidos as p left join clientes as c on p.idcliente=c.idcliente left join ClientesFact as cf '+
       'on cf.idfact=c.idfact left join colonias as col on col.idcol=c.idcol left join contactos as r '+
       'on r.idcontacto=c.idcontacto left join usuarios as u on u.idusuario=p.idvendedor where p.idpedido = "'+
       ednumpedido.text+'" group by c.idcliente', 0, dmreportes.sqlgeneral2);

querys('select d.cant,a.nombre,d.cod_cve,(a.tinstalacion*d.cant) as tinstalacion, (a.tinstalacion*d.cant*c.valor) as ManoObra, '+
       '(d.costo*d.tc) as precio, (if (a.aplica_desc = 1,(((d.costo-(d.costo*a.desc_esp/100)) + ((d.costo- (d.costo*a.desc_esp/100))* '+
       'a.iva/100))*d.cant) + ((((d.costo/a.piezasxunidad)-((d.costo/a.piezasxunidad)*a.desc_esp/100)) +(((d.costo/a.piezasxunidad) '+
       '-((d.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))*d.piezas), ((d.costo+(d.costo*a.iva/100))*d.cant) + (((d.costo/a.piezasxunidad)+ '+
       '((d.costo/a.piezasxunidad)*a.iva/100))*d.piezas))*d.tc) as Total from DetPedido as d inner join articulos as a on d.cod_cve = a.cod_cve '+
       'join configuraciones as c on c.concepto = "costohora" where d.idpedido="'+ednumpedido.text+'" order by d.id', 0, dmreportes.sqlgeneral);

operacionreporte('Pedido', '', 'IMP', 1);

end;

procedure Tfrmpedidos.CargaUnidadNegocio;
begin
if DerechosSys('Todas las Unidades de Negocio') = true then
  begin
  cargaCombo('select nombre from UnidadNegocio','Unidades de Negocio',cbonom_TOportunidad);
  edTipoOportunidad.Enabled := true;
  end
else
  begin
  querys('select UnidadNegocio from puestos as p left join areas as a on a.idarea=p.idarea where p.nombre="'+frmprincipal.PuestoUsuario+'" and a.nombre = "'+frmprincipal.AreaUsuario+'"', 0, sqlgeneral);
  if sqlgeneral.FieldByName('UnidadNegocio').Asstring <> '' then
    begin
    if sqlgeneral.FieldByName('UnidadNegocio').Asstring = '0' then
      begin
      cargaCombo('select nombre from UnidadNegocio','Unidades de Negocio',cbonom_TOportunidad);
      edTipoOportunidad.Enabled := true;
      end
    else
      begin
      cargaCombo('select nombre from UnidadNegocio where idunidadnegocio in('+sqlgeneral.FieldByName('UnidadNegocio').Asstring+')','Unidades de Negocio',cbonom_TOportunidad);
      edTipoOportunidad.Enabled := false;
      end;
    end;
  end;
end;

procedure Tfrmpedidos.btnFEClick(Sender: TObject);
var idfactura:string;
begin
  if GetConfiguraciones('Activar Factura Electronica', true) <> '1' then
  begin
    application.MessageBox('No se puede Facturar Electronicamente!','Aviso',MB_ICONEXCLAMATION);
    exit;
  end;

  if ValidaFacturar = false then
      exit;

  try
    btnparcializar.Tag := 0;
    tipo := 'E';
    if AsignaFolio = false then
      exit;
    if idfactura = '0' then
      exit;

    RemisionAntesFactura;
    TerminaFacturar;
    GeneraFE;
  except
      dmaccesos.conexion.Rollback;
      application.MessageBox('Ocurrio un error al intentar grabar los datos, consulte con su Administrador del Sistema','Aviso',mb_iconwarning);
  end;
end;

//#cfd
procedure Tfrmpedidos.RemisionAntesFactura;
 var pzsxunidad,pzs,cant,idmovi:integer;
      remicionado : boolean;
      cod_cve,idremicion : string;
begin
querys('select idremicion from RemiFact where idpedido='+edNumpedido.Text+' and idremicion<>0',0,sqlgeneral);
      dmaccesos.conexion.StartTransaction;
      if sqlgeneral.RecordCount > 0 then
      begin
         idremicion := sqlgeneral.fieldbyname('idremicion').asstring;
         remicionado := true;
      end
      else
      begin
         idremicion:='0';
         remicionado := false;
      end;
      if remicionado = false then
      begin
        //trae los articulos a remisionar
         querys('SELECT DetPedido.cant,DetPedido.piezas,DetPedido.cod_cve,articulos.piezasxunidad,articulos.paquete,articulos.servicio FROM DetPedido INNER JOIN articulos ON (DetPedido.cod_cve = articulos.cod_cve) WHERE DetPedido.idpedido = '+ednumpedido.Text,0,sqlgeneral);
         sqlgeneral.First;
         while not sqlgeneral.Eof do
         begin
            pzsxunidad:=sqlgeneral.FieldByName('piezasxunidad').AsInteger;
            pzs:= sqlgeneral.FieldByName('piezas').AsInteger;
            cant:=sqlgeneral.FieldByName('cant').AsInteger;
            cod_cve:=sqlgeneral.FieldByName('cod_cve').Asstring;
            if (sqlgeneral.FieldByName('paquete').AsInteger = 0) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
            begin
               //trae el idmovi donde el nombre sea = pedido
               querys('select idmovi from TipoMov where nombre='+Quotedstr('PEDIDOS'),0,sqltemp);
               idmovi:=sqltemp.fieldbyname('idmovi').AsInteger;
               //resta lo que se aparto de este articulo de la columna apartado
               querys('update articulos set apartado=apartado-('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve),1,sqltemp);
               ////lo que se aparto se pasa a instalacion
               if querys('select instalacion from UnidadNegocio where nombre="'+cbonom_TOportunidad.Text+'" and instalacion = 1',0,sqlgeneral) > 0 then
               begin
                 querys('update articulos set instalacion=instalacion+('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve),1,sqltemp);
                 //actualiza los detalles del pedido diciendo que y ase surtio el art
                 querys('update DetPedido set surtido=1, estatus=2 where idpedido='+edNumPedido.Text,1,sqltemp);
              end
              else
                 //actualiza los detalles del pedido diciendo que y ase surtio el art
                 querys('update DetPedido set surtido=1, estatus=3 where idpedido='+edNumPedido.Text,1,sqltemp);
                  //Registra la salida del articulo en CardexArt
              querys('insert into CardexArt(cod_cve,idmovi,movimiento,FechaMov,iddoc,cant,piezas,usuario,HoraMov, descripcion) values ("'+
              cod_cve+'",'+inttostr(idmovi)+', "S","'+datetostr(date)+'",'+edNumPedido.Text+','+inttostr(cant)+','+inttostr(pzs)+',"'+
              frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+timetostr(time)+'", "Salida por Facturacion")',1,sqltemp);
              //actualiza el campo ultima venta del articulo
              querys('update articulos set ultima_venta='+quotedstr(datetostr(date))+' where cod_cve='+quotedstr(cod_cve),1,sqltemp);
            end;
            sqlgeneral.Next;
         end;
      end;
end;

//#cfd
procedure Tfrmpedidos.TerminaFacturar;
 var  remicionado : boolean;
      idfactura,idinst, numero : string;
      tot:double;
begin
      remicionado := true;
      tot :=strtofloat(edsaldo.text);
      //actualiza el campo ultima compra del cliente al igual que su saldo
      bpcambios('clientes', edcuenta.Text, 'idcliente');
      querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',saldo=saldo+'+floattostr(tot)+',TotComprado=TotComprado+'+edTotMn.Text+' where idcliente='+edcuenta.Text,1,sqltemp);
      apcambios('idcliente', edcuenta.Text, 'clientes', 'frmpedidos');
      //oscar traer el ultimo folio de factura
      if tipo = 'N' then
        begin
        querys('select '+fact+' from folios ',0,dmreportes.sqlgeneral);
        numero := inttostr(dmreportes.sqlgeneral.fieldbyname(fact).AsInteger+1);
        idfactura:=fact[8]+numero;
        end
      else
        begin
        querys('select folio from FoliosFE where letras = "'+letra+'"',0,sqltemp);
        numero := inttostr(sqltemp.fieldbyname('folio').AsInteger+1);
        idfactura := letra +  numero;
        end;
      if  btnparcializar.Tag = 0 then
      begin
         Application.CreateForm(TfrmRemiFac, frmRemiFac);
         frmremifac.inicializa(false, remicionado, strtoint(edNumPedido.Text),idfactura, tipo);
         frmremifac.ShowModal;
      end;
      //solo si termino con remifact
      if(frmRemiFac.Tag<>2)then
      begin
        querys('select FechaVencimiento from pedidos where idpedido='+edNumPedido.Text,0,sqlgeneral);
        edFechaVencimiento.Text := sqlgeneral.Fields.Fields[0].AsString;
        cboestatus.ItemIndex := cboestatus.Items.IndexOf('Facturado');
        gbotros.Enabled := false;
        //actualiza el estatus
        cbiva.enabled:= false;
        querys('select sum(restante) as saldo from PagosClientes where idpedido='+quotedstr(edNumPedido.Text)+' and movimiento in(0,1,4,10) ',0,sqltemp);
        querys('Update pedidos set estatus=4,saldo='+quotedstr(sqltemp.fieldbyname('saldo').AsString)+',FechaCierre='+quotedstr(datetostr(FechaServidor))+'  where idpedido='+edNumPedido.Text,1,sqlgeneral);

        if tipo = 'N' then
        begin
          delete(idfactura,1,1);
          querys('update folios set '+fact+'='+numero,1,sqltemp);
        end
        else
          querys('update FoliosFE set folio='+numero+', usuario="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", '+
               'fecha = "'+datetostr(date)+'", hora="'+FormatDateTime('HH:mm:ss', time)+'" where letras="'+letra+'"',1,sqltemp);

        dmaccesos.conexion.Commit;
        MuestraRemiciones(edNumPedido.Text);
        btnremisionar.Enabled:=false;
        {btnfacturar.Enabled:=false;
        btnFE.Enabled := false;
        btnfedlls.Enabled := false;
        btnFactTraspaso.Enabled := false;
        rgtransferencia.Enabled := false; }
        HabilitarBotonesFE(false);
        btnparcializar.Enabled := true;
        querys('Select idinstal from pedidos where idpedido='+ednumpedido.text, 0, sqltemp);
        idinst := sqltemp.fieldbyname('idinstal').asstring;
        if idinst <> '0' then
         application.MessageBox(pchar('El numero de instalación es : '+idinst+''),'Informacion',mb_IconInformation);

        if tipo = 'N' then
          if application.MessageBox('Pedido Facturado, Desea Imprimir la Factura?','Aviso',mb_iconquestion+mb_yesno) = idyes then
           btnimpfact.Click;

        frmprincipal.ucprincipal.Log('Genero la Factura '+idfactura+' al Pedido '+edNumPedido.Text,2);
        querys('select * from pedidos where idpedido = ' + edNumPedido.Text,0,sqlpedidos);
      end;
       sqlpedidos.Edit;
end;

//#cfe
procedure Tfrmpedidos.GeneraFE;
var path, idfactura, serie, folio:string;  imprimir:boolean;
begin
querys('Select idfactura from pedidos where idpedido='+ednumpedido.text, 0, sqlgeneral);
idfactura := sqlgeneral.fieldbyname('idfactura').AsString;

//revisar si es factura por sector
SeparaSerieFolio(idfactura, Serie, Folio);
querys('SELECT procedencia from FoliosFE where letras = "'+serie+'"', 0, sqlgeneral);
if sqlgeneral.FieldByName('procedencia').AsString = 'SECTOR' then
  begin
  if Application.MessageBox('Desea mandar a impresion la factura?', 'Pregunta', MB_ICONQUESTION+MB_YESNO) = idyes then
    imprimir := true
  else
    imprimir := false;
  end
else
  imprimir := true;

if monfe = 'P' then
  FacturaElectronica(edcvecte.text, ednumpedido.text, cbformapago.Text, '1', 'FA', true, true, imprimir)
else
  FacturaElectronicaDlls(edcvecte.text, ednumpedido.text, cbformapago.Text, '1', 'FA', true, false, imprimir);


path := Getconfiguraciones('FEPathEntrada', true)+uppercase(idfactura)+'-'+edcvecte.text+'-'+ednumpedido.text+'.tx1';
path := AnsiReplaceStr(path, 'Entrada', 'Procesados');
end;

procedure Tfrmpedidos.btnAremisionClick(Sender: TObject);
begin
RegresarARemision(edNumPedido.Text, edcuenta.Text);
end;

//#cfd
function Tfrmpedidos.ValidaFacturar:boolean;
begin
result := false;


if edcvecte.Text = '10000' then
  begin
  application.MessageBox('No se puede facturar a esta cuenta!','Aviso',MB_ICONEXCLAMATION);
  exit;
  end;

if ValidarCliente_RemisionarFacturar = 1 then
   exit;

if ValidarCliente_DatosFacturacion = 1 then
   exit;

if dsrejilla.DataSet.RecordCount = 0 then
  begin
  application.MessageBox('No se encontro ningun articulo en este pedido y no podra facturarlo hasta no tener minimo 1','Aviso',mb_iconinformation);
  exit;
  end;

querys('Select idremicion from RemiFact where idpedido ='+ednumpedido.Text, 0, sqlgeneral);
if sqlgeneral.FieldByName('idremicion').AsString = '' then
  begin
  application.MessageBox('Debe Remisionar primero','Atencion',mb_iconinformation);
  exit;
  end;
result := true;
end;

//#cfd
function Tfrmpedidos.AsignaFolio:boolean;
var i, cont:integer; idfactura, idusuario, itm : string;
begin
result := false;
cont := 0;
idfactura := '0';
  if Tipo = 'N' then
  begin
    if sqlpedidos.State = dsedit then
      sqlpedidos.Post;

    //verifica de que tipo de facturas puede elaborar este usuario
    BorrarPed.Items.Clear;
    if DerechosSys('Facturar en Pedidos') = true then
    begin
      inc(cont);
      fact := 'FacturaP';
      BorrarPed.Items.Add('FacturaP');
    end;

    if DerechosSys('Facturar en Domicilio') = true then
    begin
      inc(cont);
      fact := 'FacturaD';
      BorrarPed.Items.Add('FacturaD');
    end;

    if DerechosSys('Facturar en Caja') = true then
    begin
      inc(cont);
      fact := 'FacturaC';
      BorrarPed.Items.Add('FacturaC');
    end;

    if cont > 1 then
    begin
       BorrarPed.CaptionTitle := 'Seleccion de Tipo de Folio';
       BorrarPed.Prompt := 'Cual Folio desea utilizar?';
       repeat
          if BorrarPed.Execute then
          begin
             fact := BorrarPed.Items.Strings[borrarped.value];
             letra := fact;
             result := true;
          end
          else
          begin
             application.MessageBox(pchar('Cancelo la facturacion del pedido #'+edNumPedido.text),'Aviso',mb_iconinformation);
             btnparcializar.Tag := 1;
             exit;
          end;
       until application.MessageBox('Esta seguro de lo que selecciono?','Pregunta',mb_yesno+mb_iconquestion) = idyes;
    end
    else
    begin
       if cont = 0 then
       begin
          application.messagebox('Usted NO tiene Derechos para Facturar', 'Atencion', MB_ICONSTOP);
          exit;
       end
       else
       begin
         //trae el maximo numero de factura
         letra := fact;
         result := true;
       end;
    end;
  end
  else //Tipo E Electronica
  begin
    if sqlpedidos.State = dsedit then
      sqlpedidos.Post;

    //verifica de que tipo de facturas puede elaborar este usuario

      { if querys('select u.idsector as id, letras, folio, f.procedencia From UsuarioSector u Left join FoliosFE f on f.idproc=u.idsector '+
         'and f.procedencia = "SECTOR" where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
         '  and folio is not null union '+
         'select p.idpuesto, letras, folio, f.procedencia From FoliosFE f inner join puestos p on f.idproc=p.idpuesto and '+
         'f.procedencia = "PUESTO" Left join areas a on a.idarea = p.idarea where p.nombre = "'+frmprincipal.PuestoUsuario+
         '" and a.nombre = "'+frmprincipal.AreaUsuario+'"  and folio is not null ', 0, sqlgeneral) = 0 then       }

    idusuario :=  inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
    if querys('select DISTINCT id, letras, folio, procedencia FROM ( select u.idsector as id, f.letras, f.folio, f.procedencia '+
              'From UsuarioSector u Left join FoliosFE f on f.idproc=u.idsector and f.procedencia = "SECTOR" '+
              'where idusuario = '+idusuario+' and folio is not null and letras in ('+
              'select letras from FoliosUsuarios where idusuario= '+ idusuario+ ') '+
              'UNION '+
              'select p.idpuesto, f.letras, f.folio, f.procedencia From FoliosFE f '+
              'inner join puestos p on f.idproc=p.idpuesto and f.procedencia = "PUESTO" '+
              'Left join areas a on a.idarea = p.idarea where p.nombre = "'+frmprincipal.PuestoUsuario+'" '+
              'and a.nombre = "'+frmprincipal.AreaUsuario+'" and folio is not null '+
              'UNION '+
              'select fu.idusuario as id, f.letras, f.folio, f.procedencia from FoliosUsuarios fu '+
              'left join FoliosFE f on fu.letras=f.letras where fu.idusuario = '+idusuario+' '+
              'and f.procedencia = "SECTOR" and f.letras not in  ( '+
              '	select f.letras 	From UsuarioSector u Left join FoliosFE f on f.idproc=u.idsector '+
              ' and f.procedencia = "SECTOR" where idusuario = '+idusuario+' '+
              '	and folio is not null ) ) as f', 0, sqlgeneral) = 0 then
    begin
      Application.MessageBox('Usted no tiene derechos para facturar electronicamente', 'Atencion', MB_ICONINFORMATION);
      exit;
    end;

    BorrarPed.Items.Clear;
    BorrarPed.ImageIndex := -1;
    sqlgeneral.First;
    i:=-1;
    while not sqlgeneral.Eof do
    begin
      letra :=  sqlgeneral.fieldbyname('letras').AsString;

      if (edsector.Text = sqlgeneral.fieldbyname('id').AsString) and (sqlgeneral.fieldbyname('procedencia').AsString = 'SECTOR') then
        i := BorrarPed.Items.Count;

      BorrarPed.ImageIndex := BorrarPed.Items.Count;
      BorrarPed.Items.Add('Factura Electronica '+letra);
      inc(cont);

        { end;
        if (sqlgeneral.fieldbyname('procedencia').AsString <> 'SECTOR') then
          begin
          BorrarPed.ImageIndex := BorrarPed.Items.Count;
          BorrarPed.Items.Add('Factura Electronica '+letra);
          inc(cont);
        end; }

      sqlgeneral.Next;
    end;

    if cont > 1 then
    begin
      if i > 0 then
        borrarped.DefaultValue := i;

      // borrarped.ListBoxItemIndex := i;

      BorrarPed.CaptionTitle := 'Seleccion de Tipo de Folio';
      BorrarPed.Prompt := 'Cual Folio desea utilizar?';
      repeat
        if BorrarPed.Execute then
        begin
          fact := MidStr(BorrarPed.Items.Strings[borrarped.value], 21, length(BorrarPed.Items.Strings[borrarped.value]));
          letra := fact;
          result := true;
        end
        else
        begin
          application.MessageBox(pchar('Cancelo la facturacion del pedido #'+edNumPedido.text),'Aviso',mb_iconinformation);
          btnparcializar.Tag := 1;
          exit;
        end;
      until application.MessageBox('Esta seguro de lo que selecciono?','Pregunta',mb_yesno+mb_iconquestion) = idyes;
    end
    else
    begin
      if cont = 0 then
      begin
        application.messagebox('Usted NO tiene Derechos para Facturar', 'Atencion', MB_ICONSTOP);
        exit;
      end
      else
      begin
        if BorrarPed.Items.Count = 1 then
          fact := MidStr(BorrarPed.Items.Strings[0], 21, length(BorrarPed.Items.Strings[0]))
        else
          fact := MidStr(BorrarPed.Items.Strings[borrarped.value], 21, length(BorrarPed.Items.Strings[borrarped.value]));
        letra := fact;
        result := true;
      end;
    end;
  end;
end;

procedure Tfrmpedidos.btnimpdllsClick(Sender: TObject);
var
  year,dia,mes:word;
  dec,idfact, cad, qry : string;
begin
if tipo <> 'N' then
  begin
  application.MessageBox('Esta factura no se puede imprimir en este sistema','Aviso',mb_iconinformation);
  exit;
  end;

if sqlrejillaedit.Locate('Moneda', 'PESOS', []) then
  begin
  application.MessageBox('Esta factura contiene articulos en pesos no se puede imprimir en dolares','Aviso',mb_iconinformation);
  exit;
  end;

decodedate(strtodate(edFechaCreacion.Text),year,mes,dia);

if REconcepto.Text = '' then
 begin
  application.MessageBox('Debe de especificar el concepto','Aviso',mb_iconinformation);
  exit;
 end
else
 begin
 with dmreportes do begin
querys('select round(TotDlls,2) as total from pedidos where idpedido = '+edNumPedido.Text,0,sqlgeneral);
cad:=sqlgeneral.fieldbyname('total').asstring;
Delete(cad, AnsiPos('.', cad), length(cad));

//NumToLetras.Numero := strtoint(cad);

 dec := midstr(edTotdlls.text,posex('.',edTotdlls.Text)+1,length(edTotdlls.Text));
 //trae el numero de factura
 querys('select idfactura from RemiFact where idpedido = '+edNumPedido.Text+' and idfactura <> ''0''',0,sqlgeneral);
 idfact := sqlgeneral.fieldbyname('idfactura').AsString;

// idfact := sqlgeneral.fieldbyname('idfactura').AsString;
 qry := sqlclientesfact.SQL.Text;
 sqlclientesfact.Close;
 sqlclientesfact.SQL.Clear;
 sqlclientesfact.SQL.Add('SELECT clientes.idcliente, ClientesFact.NombreCres  AS Cliente, concat(ifnull(ClientesFact.DirCres," "),", Col. ", '+
        'ifnull(ClientesFact.ColCres, " ")) as dir, concat(ifnull( ClientesFact.CdCres," " )," ", '+
        'ifnull(ClientesFact.EstadoCres," "),"               C.P.",ClientesFact.CPCres)  AS ciudad, ClientesFact.RFCCres as rfc, '+
        ' "" AS Responsable, contactos.cargo, giros.nombre AS Giro, ClientesFact.telefono, sectores.nombre AS Movil, '+
        'pedidos.FechaFactura as fecha,pedidos.idpedido,pedidos.idvendedor,pedidos.concepto,:dia as Dia,:mes as Mes,:ano as Ano, '+
        'round((pedidos.Subtotal - pedidos.Descuento)/pedidos.TipoCambio,2) as SubTotal, (pedidos.Iva/pedidos.TipoCambio) as Iva, pedidos.TotDlls as Total, '+
        'pedidos.autorizo, DatosEmpresa.ciudad,DatosEmpresa.estado,DatosEmpresa.InteresMoratorio,:cant as CantLetra,:fact as Factura,'+
        'usuarios.codigo,clientes.deducible as deducible '+
        'FROM clientes LEFT OUTER JOIN ClientesFact ON (clientes.idfact = ClientesFact.idfact) left JOIN contactos ON '+
        '(clientes.idcontacto = contactos.idcontacto) LEFT OUTER JOIN giros ON (clientes.idgiro = giros.idgiro) '+
        'LEFT OUTER JOIN sectores ON (clientes.sector = sectores.idsector),DatosEmpresa,pedidos left join usuarios on '+
        'usuarios.idusuario = pedidos.idvendedor WHERE clientes.idcliente = :idcliente and pedidos.idpedido = :ped');


 sqlclientesfact.ParamByName('dia').Value := dia;
 sqlclientesfact.ParamByName('mes').Value := meses[mes];
 sqlclientesfact.ParamByName('ano').Value := year;
 sqlclientesfact.ParamByName('ped').Value := strtoint(edNumPedido.Text);
 sqlclientesfact.ParamByName('idcliente').Value := edcuenta.Text;
 //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(NumToLetras.Letras) + ' DOLARES ' + dec + '/100)';
 sqlclientesfact.ParamByName('cant').Value := ' DOLARES ';
 sqlclientesfact.ParamByName('Fact').Value :=lblidfactura.Caption;
 sqlclientesfact.Open;

 querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+edNumPedido.Text+' '+
        'order by dp.id',0,sqlgeneral2);

 rvp.Engine := rvsystem1;
 rvp.ProjectFile := GetConfiguraciones('PathSysalarmServer', true)+ 'Reportes_sysalarm.rav';
 if idfact[1] = 'D' then
  RVP.ExecuteReport('FacturasCD')
 else
  if idfact[1] = 'C' then
   RVP.ExecuteReport('Factura')
  else
    RVP.ExecuteReport('FacturasMX');
  sqlclientesfact.SQL.Text := qry;
 end;
end;
dmreportes.RVP.Close;

end;

procedure Tfrmpedidos.btnfedllsClick(Sender: TObject);
begin
if sqlrejillaedit.Locate('Moneda', 'PESOS', []) then
  begin
  application.MessageBox('Esta factura contiene articulos en pesos no se puede imprimir en dolares','Aviso',mb_iconinformation);
  exit;
  end;
monfe := 'D';
btnFE.OnClick(self);
monfe := 'P';
end;

procedure Tfrmpedidos.btntxtClick(Sender: TObject);
var memo:tmemo;  idfactura, filename :string;
begin
  querys('select idfactura from RemiFact where idpedido='+edNumPedido.text+' and idfactura<>"0"', 0, sqlgeneral);
  idfactura := sqlgeneral.fieldbyname('idfactura').AsString;
  filename := idfactura+'-'+edcvecte.Text+'-'+edNumPedido.text+'.txt';

  memo := tmemo.Create(self);
  memo.Parent := self;
  memo.visible := false;
  memo.Lines.Add( FacturaElectronica(edcvecte.Text, edNumPedido.text, cbformapago.Text, '1', 'FA', false));
  memo.Lines.SaveToFile(filename);
  memo.free;

  frmprincipal.lanzador.FileName := filename;
  frmprincipal.lanzador.Launch;
end;

procedure Tfrmpedidos.btnFactTraspasoClick(Sender: TObject);
var idfactura:string;
begin
if GetConfiguraciones('Activar Factura Electronica', true) <> '1' then
  begin
  application.MessageBox('No se puede Facturar Electronicamente!','Aviso',MB_ICONEXCLAMATION);
  exit;
  end;

if ValidaFacturar = false then
      exit;
  try
btnparcializar.Tag := 0;
tipo := 'E';
if AsignaFolio = false then
         exit;
if idfactura = '0' then
  exit;

RemisionAntesFactura;

TerminaFacturar;
AgregarMovTraspaso;
GeneraFE;
    except
      dmaccesos.conexion.Rollback;
      application.MessageBox('Ocurrio un error al intentar grabar los datos, consulte con su Administrador del Sistema','Aviso',mb_iconwarning);
   end;
end;

procedure Tfrmpedidos.AgregarMovTraspaso;
var idpago, idremision, idfactura, tipopago:string;
begin
querys('select idpago, idremicion, idfactura  from PagosClientes where idpedido='+edNumPedido.Text+' and movimiento=0', 0, sqlgeneral);
idpago := sqlgeneral.fieldbyname('idpago').asstring;
idremision := sqlgeneral.fieldbyname('idremicion').asstring;
idfactura := sqlgeneral.fieldbyname('idfactura').asstring;

if querys('SELECT concat("(", iniciales, ")", nombre) as nom, iniciales FROM TiposPagos '+
         'where tipo in (1,2) having nom = "'+cbtipopago.Text+'" ORDER BY idTipoPago asc', 0, sqlgeneral) > 0 then
  tipopago := sqlgeneral.fieldbyname('iniciales').asstring
else
  tipopago := 'PP'; //No identificado en Edix, Pendiente de pago

querys('INSERT INTO PagosClientes (moneda, cheque, TipoPago2, TipoPago, ctaban, TipoCambio, idpago_afecta, idcliente, '+
       'idpedido, abono, idfactura, idremicion, movimiento, usuario, FechaVence, fecha, hora, FechaAlta, TipoCobro, notas) '+
       'values("P", "", "", "'+tipopago+'", "'+edctabancaria.text+'", '+GetConfiguraciones('tipocambio',true)+', '+idpago+', '+edcvecte.Text+', '+
       ''+edNumPedido.Text +', 0, "'+idfactura+'", '+ idremision+', 12, "'+frmprincipal.ucprincipal.CurrentUser.loginname+'", CURDATE(),'+
       'CURDATE(), CURTIME(), CURDATE(), 0, "'+'ABONO POR FACTURACION PARA TRASPASO" )',1,dmreportes.sqlgeneral3);

end;

procedure Tfrmpedidos.HabilitarBotonesFE(hab:boolean);
begin
  btnfacturar.Enabled := hab;
  btnFE.Enabled := hab;
  btnfedlls.Enabled := hab;
  btnFactTraspaso.Enabled := hab;
  rgtransferencia.Enabled := hab;
  rgformapago.Enabled := hab;
end;

End.

