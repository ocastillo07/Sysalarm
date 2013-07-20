{///////////////////////////////////////////////////////////////////////////////
2011/06/23 dalyla Cambio de precio por procedencia
2009/03/11 dalyla calculo por bd en dptos
--------------------------------------------------------------------------------
2008/08/12 dalyla calcula costo chino
2008/07/23 dalyla derechossys modificar costos
2008/05/27 dalyla articulos.status a integer
2008/05/17 edwin campo costopromedio, se quito campo ultimocosto.
2008/02/28 dalyla zona horaria ok
2007/12/19 Dalila Codigo barra limite
2007/12/18 Dalila Codigo sustituto
2007/12/17 Oscar boton para validar derecho de modificar costo
2007/12/03 Dalila Quite mensaje del descuento
2007/12/03 Dalila Calculo de piezas por unidad div by zero
}///////////////////////////////////////////////////////////////////////////////
unit Uarticulos;

interface

uses
  Windows, Messages, SysUtils,strutils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, RzTabs, RzButton, StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit,
  ExtCtrls, RzPanel, DB, MemDS, DBAccess, MyAccess, DBCtrls, RzDBCmbo,
  RzDBBnEd, Buttons, RzRadGrp, RzDBRGrp, ComCtrls, RzDBNav, RzRadChk,
  RzDBChk, RzBtnEdt, RzSpnEdt, ToolWin, RzCmboBx, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDCustomCheckListDlg, LMDCheckListDlg;

type
  Tfrmarticulos = class(TForm)
    tblarticulos: TMyTable;
    dsarticulos: TDataSource;
    tblfamilias: TMyTable;
    dsfamilias: TDataSource;
    tbldeptos: TMyTable;
    dsdeptos: TDataSource;
    tblsecciones: TMyTable;
    dssecciones: TDataSource;
    tblSectoresArt: TMyTable;
    dsSectoresArt: TDataSource;
    navegador: TRzDBNavigator;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnalta: TRzBitBtn;
    sqlgeneral: TMyQuery;
    btnbuscar: TRzBitBtn;
    gbprincipales: TGroupBox;
    cbofamilia: TRzDBLookupComboBox;
    edclave: TRzDBEdit;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    cbodepto: TRzDBLookupComboBox;
    RzLabel5: TRzLabel;
    edcbarras: TRzDBEdit;
    RzLabel3: TRzLabel;
    gbprocedencia: TRzDBRadioGroup;
    ednombre: TRzDBEdit;
    RzLabel4: TRzLabel;
    edUltVenta: TRzDBDateTimeEdit;
    RzLabel18: TRzLabel;
    edUltCompra: TRzDBDateTimeEdit;
    RzLabel31: TRzLabel;
    edalta: TRzDBDateTimeEdit;
    RzLabel30: TRzLabel;
    gblocalizacion: TGroupBox;
    cbosector: TRzDBLookupComboBox;
    RzLabel6: TRzLabel;
    cboseccion: TRzDBLookupComboBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    mmreferencias: TRzDBRichEdit;
    gbUnidadesMedidas: TGroupBox;
    RzLabel11: TRzLabel;
    edNomEnvase: TRzDBEdit;
    edNomPiezas: TRzDBEdit;
    RzLabel13: TRzLabel;
    edUnidadesCaja: TRzDBEdit;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    edPiezasEnvase: TRzDBEdit;
    gbfinancieros: TGroupBox;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel24: TRzLabel;
    eddscto: TRzDBNumericEdit;
    RzLabel25: TRzLabel;
    edPrecioDscto: TRzDBNumericEdit;
    gbinventario: TGroupBox;
    RzLabel26: TRzLabel;
    edmaximo: TRzDBEdit;
    RzLabel27: TRzLabel;
    edminimo: TRzDBEdit;
    gbexistencias: TGroupBox;
    edPiezasExistencia: TRzLabel;
    Unidades: TRzLabel;
    RzLabel34: TRzLabel;
    edPrecioDsctoIva: TRzNumericEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    FontDialog1: TFontDialog;
    edmodelo: TRzDBEdit;
    RzLabel36: TRzLabel;
    btndetalles: TRzBitBtn;
    RzLabel35: TRzLabel;
    spincant_c: TRzSpinEdit;
    cbotiempo_c: TRzComboBox;
    RzLabel37: TRzLabel;
    spincant_p: TRzSpinEdit;
    cbotiempo_p: TRzComboBox;
    RzLabel38: TRzLabel;
    cbotiempo_f: TRzComboBox;
    spincant_f: TRzSpinEdit;
    RzLabel39: TRzLabel;
    tblfamiliasidfamilia: TIntegerField;
    tblfamiliasnombre: TStringField;
    tblfamiliasusuario: TStringField;
    tblfamiliasfecha: TStringField;
    tblfamiliashora: TStringField;
    chkaplicadesc: TRzCheckBox;
    edpiezas: TRzEdit;
    edunidades: TRzEdit;
    cbolinea: TRzDBLookupComboBox;
    RzLabel40: TRzLabel;
    dslineas: TDataSource;
    tbllineas: TMyTable;
    chkinventariable: TRzCheckBox;
    RzLabel42: TRzLabel;
    rgmoneda: TRzDBComboBox;
    tblSectoresArtidSectorArt: TIntegerField;
    tblSectoresArtnombre: TStringField;
    tblSectoresArtdescripcion: TMemoField;
    tblSectoresArtusuario: TStringField;
    tblSectoresArtfecha: TStringField;
    tblSectoresArthora: TStringField;
    Dialogo: TLMDCheckListDlg;
    ediva: TRzDBNumericEdit;
    edtinstalacion: TRzDBNumericEdit;
    gbutilidades: TGroupBox;
    RzLabel12: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel29: TRzLabel;
    edutild: TRzDBNumericEdit;
    edutilc: TRzDBNumericEdit;
    edutilb: TRzDBNumericEdit;
    edutila: TRzDBNumericEdit;
    preciod: TRzDBNumericEdit;
    precioc: TRzDBNumericEdit;
    preciob: TRzDBNumericEdit;
    precioa: TRzDBNumericEdit;
    edPrecioConIvab: TRzNumericEdit;
    edPrecioConIvac: TRzNumericEdit;
    edPrecioConIvad: TRzNumericEdit;
    edPrecioConIvaa: TRzNumericEdit;
    chkprecio: TRzDBCheckBox;
    edcosto: TRzDBEdit;
    edCveArt: TRzButtonEdit;
    RzLabel41: TRzLabel;
    tblarticuloscod_cve: TStringField;
    tblarticuloscod_barras: TStringField;
    tblarticulosnombre: TStringField;
    tblarticulosexistencia: TIntegerField;
    tblarticulosordenados: TIntegerField;
    tblarticulosbackorder: TIntegerField;
    tblarticulosapartado: TIntegerField;
    tblarticulospiezasxunidad: TIntegerField;
    tblarticulosunidades_caja: TIntegerField;
    tblarticulosnacional: TStringField;
    tblarticulosidfamilia: TIntegerField;
    tblarticulosiddpto: TIntegerField;
    tblarticulosiva: TFloatField;
    tblarticuloscosto: TFloatField;
    tblarticulosutila: TFloatField;
    tblarticulosutilb: TFloatField;
    tblarticulosutilc: TFloatField;
    tblarticulosutild: TFloatField;
    tblarticulosprecioa: TFloatField;
    tblarticulospreciob: TFloatField;
    tblarticulosprecioc: TFloatField;
    tblarticulospreciod: TFloatField;
    tblarticulosdesc_esp: TFloatField;
    tblarticulosaplica_desc: TSmallintField;
    tblarticulosminimo: TIntegerField;
    tblarticulosmaximo: TIntegerField;
    tblarticuloslocalizacion: TStringField;
    tblarticulosidSectorArt: TIntegerField;
    tblarticulosidseccion: TIntegerField;
    tblarticulosnom_envase: TStringField;
    tblarticulosnom_piezas: TStringField;
    tblarticulosultima_compra: TDateField;
    tblarticulosultima_venta: TDateField;
    tblarticulosusuario: TStringField;
    tblarticulosfecha: TDateField;
    tblarticuloshora: TStringField;
    tblarticulosprecio_desc: TFloatField;
    tblarticulosmodelo: TStringField;
    tblarticulosgarantia_cliente: TStringField;
    tblarticulosgarantia_proveedor: TStringField;
    tblarticulosgarantia_fabricante: TStringField;
    tblarticulostinstalacion: TFloatField;
    tblarticulosservicio: TSmallintField;
    tblarticulospaquete: TSmallintField;
    tblarticulosdescripcion: TMemoField;
    tblarticulosidlinea: TIntegerField;
    tblarticulosinventariable: TSmallintField;
    tblarticulosmoneda: TStringField;
    tblarticulosPrecioCapturable: TSmallintField;
    RzLabel43: TRzLabel;
    cboProveedor: TRzDBLookupComboBox;
    dsProveedor: TDataSource;
    sqlProveedor: TMyQuery;
    sqlProveedoridprov: TIntegerField;
    sqlProveedorNombreCompleto: TStringField;
    tblarticulosidProveedor: TIntegerField;
    lblprotocolos: TRzLabel;
    cboprotocolos: TRzComboBox;
    tblarticulosidprotocolo: TIntegerField;
    RzDBCheckBox2: TRzDBCheckBox;
    tblarticuloseszona: TSmallintField;
    RzLabel44: TRzLabel;
    edtinstalacioncom: TRzDBNumericEdit;
    tblarticulostinstalacionCom: TFloatField;
    edclaveprov: TRzDBEdit;
    tblarticuloscod_prov: TStringField;
    RzLabel45: TRzLabel;
    gbsugeridos: TGroupBox;
    RzLabel46: TRzLabel;
    RzLabel47: TRzLabel;
    edmaximo_sugerido: TRzDBEdit;
    edminimo_sugerido: TRzDBEdit;
    tblarticulosinstalacion: TIntegerField;
    tblarticulosminimo_sugerido: TIntegerField;
    tblarticulosmaximo_sugerido: TIntegerField;
    btnetiquetas: TRzBitBtn;
    btnvalidacosto: TRzBitBtn;
    edcodsustituto: TRzDBEdit;
    RzLabel48: TRzLabel;
    tblarticuloscod_sustituto: TStringField;
    tblarticulosCostoPromedio: TFloatField;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzLabel49: TRzLabel;
    RzLabel50: TRzLabel;
    cbestatus: TRzDBComboBox;
    tblarticulosstatus: TIntegerField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edclaveButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure btnetiquetasClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure cbofamiliaClick(Sender: TObject);
    procedure edclaveExit(Sender: TObject);
    procedure edcbarrasKeyPress(Sender: TObject; var Key: Char);
    procedure cbosectorClick(Sender: TObject);
    procedure cboseccionClick(Sender: TObject);
    procedure edutilaExit(Sender: TObject);
    procedure edivaEnter(Sender: TObject);
    procedure edivaKeyPress(Sender: TObject; var Key: Char);
    procedure edutilbExit(Sender: TObject);
    procedure edutilcExit(Sender: TObject);
    procedure edutildExit(Sender: TObject);
    procedure edutilaKeyPress(Sender: TObject; var Key: Char);
    procedure edutilbKeyPress(Sender: TObject; var Key: Char);
    procedure edutilcKeyPress(Sender: TObject; var Key: Char);
    procedure edutildKeyPress(Sender: TObject; var Key: Char);
    procedure eddsctoExit(Sender: TObject);
    procedure eddsctoKeyPress(Sender: TObject; var Key: Char);
    procedure btnmodificarClick(Sender: TObject);
    procedure edmaximoExit(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnborrarClick(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure mmreferenciasEnter(Sender: TObject);
    procedure mmreferenciasExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btndetallesClick(Sender: TObject);
    procedure cbotiempo_cChange(Sender: TObject);
    procedure cbotiempo_pChange(Sender: TObject);
    procedure tblarticulosAfterScroll(DataSet: TDataSet);
    procedure cbotiempo_fChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtinstalacionKeyPress(Sender: TObject; var Key: Char);
    procedure tblarticulosBeforePost(DataSet: TDataSet);
    procedure cbodeptoExit(Sender: TObject);
    procedure tblarticulosAfterInsert(DataSet: TDataSet);
    procedure gbprocedenciaEnter(Sender: TObject);
    procedure edaltaEnter(Sender: TObject);
    procedure rgmonedaEnter(Sender: TObject);
    procedure edminimoKeyPress(Sender: TObject; var Key: Char);
    procedure cbosectorEnter(Sender: TObject);
    procedure cboseccionEnter(Sender: TObject);
    procedure cboseccionExit(Sender: TObject);
    procedure edcostoEnter(Sender: TObject);
    procedure edcostoKeyPress(Sender: TObject; var Key: Char);
    procedure edcostoExit(Sender: TObject);
    procedure edCveArtButtonClick(Sender: TObject);
    procedure edCveArtKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cbodeptoClick(Sender: TObject);
    procedure cboprotocolosSelect(Sender: TObject);
    procedure precioaExit(Sender: TObject);
    procedure precioaKeyPress(Sender: TObject; var Key: Char);
    procedure preciobKeyPress(Sender: TObject; var Key: Char);
    procedure preciocKeyPress(Sender: TObject; var Key: Char);
    procedure preciodKeyPress(Sender: TObject; var Key: Char);
    procedure preciobExit(Sender: TObject);
    procedure preciocExit(Sender: TObject);
    procedure preciodExit(Sender: TObject);
    procedure edtinstalacioncomKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveprovKeyPress(Sender: TObject; var Key: Char);
    procedure edCveArtChange(Sender: TObject);
    procedure btnvalidacostoClick(Sender: TObject);
    procedure edcostoChange(Sender: TObject);
    procedure precioaChange(Sender: TObject);
  private
    { Private declarations }
    codigo:word;
    cos, costo,iva:double;
    NuevoCosto, NuevoPrecio, Servicio,PrecioCapturable:boolean;
    function conversion(valor,indice,indice2:Integer):Integer;
    procedure habilita_grupos;
    procedure deshabilita_grupos;
    procedure CalculaIva;
    procedure limpia;
    procedure garantia;
    procedure separar;
  public
    { Public declarations }
    function CalculaCosto(costo:double; cod_cve, depto, linea:string):double;
  end;

var
  frmarticulos: Tfrmarticulos;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Udet_art, Urelacionborrar,
  Udmrep, Uautentificacion, UBuscaArt;

{$R *.dfm}



procedure tfrmarticulos.limpia;
begin
edPrecioConIvaa.Clear;
edPrecioConIvab.Clear;
edPrecioConIvac.Clear;
edPrecioConIvad.Clear;
edPrecioDsctoIva.Clear;
cboprotocolos.Visible := false;
lblprotocolos.Visible := false;
btnetiquetas.Enabled := false;
lbufh.Caption := '';
end;

function tfrmarticulos.conversion(valor,indice,indice2:Integer):integer;
begin
result := 0;
case indice of
    1: begin
        if indice2 = 2 then
        Result:=valor*7//ninguno
        else
        if indice2 = 3 then
        Result:=valor*30//ninguno
        end;
    2: Result:=valor*4;//dias
    3: Result:=valor*12;//semanas
    //4: Result:=valor*365;//meses}
 end;
end;

procedure tfrmarticulos.garantia;
begin
spincant_c.Value:=1;
spincant_p.Value:=1;
spincant_f.Value:=1;
cbotiempo_c.ItemIndex:=0;
cbotiempo_P.ItemIndex:=0;
cbotiempo_F.ItemIndex:=0;
end;

procedure tfrmarticulos.CalculaIva;
begin
costo:=QuitaCaracteres(edcosto.Text,'$');
iva:=QuitaCaracteres(ediva.Text,'%');

if edutila.Text<> '' then
   edutila.OnExit(self);
if edutilb.Text<> '' then
   edutilb.OnExit(self);
if edutilc.Text<> '' then
   edutilc.OnExit(self);
if edutild.Text<> '' then
   edutild.OnExit(self);
if eddscto.Text <> '' then
   eddscto.OnExit(self);
end;



procedure tfrmarticulos.habilita_grupos;
begin
   cbofamilia.Enabled:=true;
   edmodelo.Enabled:=true;
   cbodepto.Enabled:=true;
   spincant_f.Enabled:=true;
   cbotiempo_f.Enabled:=true;
   spincant_p.Enabled:=true;
   cbotiempo_p.Enabled:=true;
   spincant_c.Enabled:=true;
   cbotiempo_c.Enabled:=true;
   gbprincipales.Enabled:=true;
   gblocalizacion.Enabled:=true;
   gbunidadesmedidas.enabled:=true;
   gbfinancieros.Enabled:=true;
   gbinventario.Enabled:=true;
   gbsugeridos.enabled:=true;
end;


procedure tfrmarticulos.deshabilita_grupos;
begin
   gbprincipales.Enabled:=false;
   gblocalizacion.Enabled:=false;
   gbunidadesmedidas.enabled:=false;
   gbfinancieros.Enabled:=false;
   gbinventario.Enabled:=false;
   gbsugeridos.enabled:=false;
end;


{procedure tfrmarticulos.querys(const query:string;const actualizacion:integer);
begin
with sqlgeneral do
   begin
      //trae todos los nombres de la tabla especificada
      close;
      sql.Clear;
      sql.Add(query);
      if actualizacion = 0 then
        open
      else
        execute;
    end;
end;}


procedure Tfrmarticulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmarticulos.edclaveButtonClick(Sender: TObject);
begin
codigo:=66;
formkeyup(self,codigo,[ssCtrl])
end;

procedure tfrmarticulos.separar;
var temp,tt,tn:string;
begin
btnetiquetas.Enabled := true;
          if tblarticulos.fieldbyname('garantia_fabricante').AsString <> '' then
             begin
                temp:=tblarticulos.fieldbyname('garantia_fabricante').Value;
                tt:=ansirightstr(temp,length(temp)-posex(' ',temp));
                tn:=ansileftstr(temp,posex(' ',temp)-1);
                spincant_f.Text:=tn;
                cbotiempo_f.Text:=tt;
             end;

            if tblarticulos.fieldbyname('garantia_proveedor').AsString <> '' then
               begin
                 temp:=tblarticulos.fieldbyname('garantia_proveedor').Value;
                 tt:=ansirightstr(temp,length(temp)-posex(' ',temp));
                 tn:=ansileftstr(temp,posex(' ',temp)-1);
                 spincant_p.Text:=tn;
                 cbotiempo_p.Text:=tt;
            end;

          if tblarticulos.fieldbyname('garantia_cliente').AsString <> '' then
            begin
             temp:=tblarticulos.fieldbyname('garantia_cliente').Value;
             tt:=ansirightstr(temp,length(temp)-posex(' ',temp));
             tn:=ansileftstr(temp,posex(' ',temp)-1);
             spincant_c.Text:=tn;
             cbotiempo_c.Text:=tt;
            end;
end;

procedure Tfrmarticulos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) and (gbprincipales.Enabled=false) then
    begin
      frmbusquedas.query:='SELECT a.cod_cve as Cod_Cve,a.cod_barras as Cod_Barras,a.nombre as Nombre,d.nombre AS Depto,a.usuario as Usuario,a.fecha as Fecha,a.hora as Hora FROM articulos as a LEFT JOIN dptos as d ON (a.iddpto = d.iddpto) ORDER BY a.cod_cve';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.campo_retorno:='cod_cve';
      frmbusquedas.tabla:='Articulos';
      frmbusquedas.tblorigen := 'articulos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblarticulos.Active:=true;
             tblarticulos.Locate('cod_cve',frmbusquedas.resultado,[]);
             CalculaIva;
             navegador.Enabled:=true;
             btnalta.Enabled:=true;
             btnmodificar.Enabled:=true;
             btnborrar.Enabled:=true;
             separar;
           end;
    end;
end;

procedure Tfrmarticulos.edclaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var codigo:word;
begin
codigo:=66;
if edclave.Text='0' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblarticulos.Active:=true;
if tblarticulos.Locate('cod_cve',edclave.Text,[]) then
   begin
  //  trae_datos(self);
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Articulo no Existe','Información',mb_ok+mb_iconinformation);
    tblarticulos.Active:=false;
  //  limpia_combos(self);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmarticulos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
 begin
  limpia;
  navegador.Enabled:=false;
  //pone la tabla de articulos en modo de insercion
  tblarticulos.Active:=true;
  tblarticulos.insert;
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edcosto.Text := '0.00';
  habilita_grupos;
  lbufh.Caption := '';
  dialogo.CaptionTitle := 'Alta de Articulos';
  dialogo.Prompt := 'Que es lo que se Capturara:';
  dialogo.Items.Clear;
  dialogo.Items.Add('Articulo');
  dialogo.Items.Add('Servicio');
  dialogo.Items.Add('Descuentos, Cargos, Otros (Precio Capturable)');
  if dialogo.Execute then
   begin
  case dialogo.Value of
    0: begin
        Servicio:=false;
        PrecioCapturable := true;
       end;
    1: begin
        Servicio:=true;
        PrecioCapturable := false;
        cbofamilia.Enabled:=false;
        edmodelo.Enabled:=false;
        cbodepto.Enabled:=false;
        spincant_f.Enabled:=false;
        cbotiempo_f.Enabled:=false;
        spincant_p.Enabled:=false;
        cbotiempo_p.Enabled:=false;
        spincant_c.Enabled:=false;
        cbotiempo_c.Enabled:=false;
        gbinventario.Enabled:=false;
        gbsugeridos.enabled:=false;
        gbUnidadesmedidas.Enabled:=false;
        gblocalizacion.Enabled:=false;
        gbexistencias.Enabled:=false;
        edUnidadesCaja.Text := '1';
        edPiezasEnvase.Text := '1';
      end;
    2: begin
        Servicio:=false;
        PrecioCapturable := true;
        cbofamilia.Enabled:=false;
        edmodelo.Enabled:=false;
        cbodepto.Enabled:=false;
        spincant_f.Enabled:=false;
        cbotiempo_f.Enabled:=false;
        spincant_p.Enabled:=false;
        cbotiempo_p.Enabled:=false;
        spincant_c.Enabled:=false;
        cbotiempo_c.Enabled:=false;
        gbinventario.Enabled:=false;
        gbsugeridos.enabled:=false;
        gbUnidadesmedidas.Enabled:=false;
        gblocalizacion.Enabled:=false;
        gbexistencias.Enabled:=false;
        edUnidadesCaja.Text := '1';
        edPiezasEnvase.Text := '1';
      end;
  end;
  end
 else
  begin
   application.MessageBox('alta abortada por el usuario','Aviso',mb_iconinformation);
   btncancelar.Click;
   exit;
  end;
   edalta.Date:=date;
   edalta.Text:=datetostr(date);
   edclave.Enabled:=true;
   edclave.SetFocus;
 end
else
 begin
 if cbolinea.Text = '' then
  begin
    application.MessageBox('Debe de Capturar la linea a la que pretenece este articulo','Aviso',mb_iconinformation);
    cbolinea.DropDown;
    exit;
  end;
  if rgmoneda.Text = '' then
  begin
    application.MessageBox('Debe de Capturar la moneda con la que se vendera este articulo','Aviso',mb_iconinformation);
    rgmoneda.DroppedDown;
    exit;
  end;

  if querys('Select cod_cve from articulos where cod_cve <> "'+edclave.text+'" and cod_barras  <> "" and cod_barras = "'+edcbarras.text+'"', 0, sqlgeneral) > 0 then
  begin
    application.MessageBox('El Codigo de Barras ya existe, modifique lo para guardar','Atencion',mb_iconinformation);
    edcbarras.SetFocus;
    exit;
  end;

  deshabilita_grupos;
  navegador.Enabled:=true;
  btnalta.Caption:='&Alta';
  btnalta.Hint:='Dar de Alta a un Articulo';
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar esta Ventana';
  btnalta.ImageIndex:=5;
  btnborrar.Enabled:=true;
  btnmodificar.Enabled:=true;
  gbprincipales.Enabled:=false;
  frmprincipal.ucprincipal.Log('Dio de Alta el Articulo '+ednombre.text,1);
  tblarticulos.FieldByName('garantia_cliente').AsString:=spincant_c.Text+' '+cbotiempo_c.Text;
  tblarticulos.FieldByName('garantia_proveedor').AsString:=spincant_p.Text+' '+cbotiempo_p.Text;
  tblarticulos.FieldByName('garantia_fabricante').AsString:=spincant_f.Text+' '+cbotiempo_f.Text;
  tblarticulos.FieldByName('idprotocolo').Asinteger := cboprotocolos.Tag;
  tblarticulos.Post;
  Servicio:=false;
  PrecioCapturable := false;
  garantia;
  shortdateformat:='yyyy/mm/dd';
  //actualiza los datos de hora,fecha de creacion y usuario
  querys('update articulos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where cod_cve='+quotedstr(edclave.Text),1,sqlgeneral);
 end;
end;

procedure Tfrmarticulos.btnbuscarClick(Sender: TObject);
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure Tfrmarticulos.btnetiquetasClick(Sender: TObject);
var cad:string; i:integer;
begin
querys('Drop table if exists tmpEtiquetas'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpEtiquetas'+frmprincipal.idmaq+' (cod_barras varchar(30))', 1, sqlgeneral);
cad := '';
for i:=1 to 80 do
  begin
  cad := cad+'("'+edcbarras.text+'"), ';
  end;
Delete(cad, length(cad)-1, length(cad));
querys('Insert into tmpEtiquetas'+frmprincipal.idmaq+' (cod_barras) values '+cad, 1, sqlgeneral);
                 
querys('Select cod_barras from tmpEtiquetas'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
OperacionReporte('CodBarArticulo', 'Codigo de Barras de Articulo', 'IMP',1);
querys('Drop table if exists tmpEtiquetas'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure Tfrmarticulos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  Deshabilita_Grupos;
  btndetalles.Visible:=false;
  limpia;
  if btnalta.Caption='&Guardar' then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Articulo';
    btnalta.ImageIndex:=5;
    end;
  tblarticulos.Cancel;
  tblarticulos.Active:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del Articulo Actual';
    btnmodificar.ImageIndex:=2;
    end;
  gbprincipales.Enabled:=false;
  btnbuscar.Enabled:=true;
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  end
else
  close;
end;

procedure Tfrmarticulos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edclave.Text<>'') then
begin
key:=#0;
SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmarticulos.cbofamiliaClick(Sender: TObject);
begin
//edmodelo.SetFocus;
end;

procedure Tfrmarticulos.edclaveExit(Sender: TObject);
var mensaje:pchar;
begin
if btnalta.Caption='&Guardar' then
  begin
   if edclave.Text<>'' then
      begin
    //busca si ya existe ese codigo clave de articulo en la tabla de articulos
    querys('select * from articulos where cod_cve='+quotedstr(edclave.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
       begin
        mensaje:='El codigo tecleado ya esta siendo usado por otro producto, favor de introducir uno diferente!';
        application.MessageBox(mensaje,'Aviso',mb_iconwarning);
        edclave.Clear;
        edclave.SetFocus;
       end
    end
  end;
end;

procedure Tfrmarticulos.edcbarrasKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmarticulos.cbosectorClick(Sender: TObject);
begin
cboseccion.SetFocus;
end;

procedure Tfrmarticulos.cboseccionClick(Sender: TObject);
begin
mmreferencias.SetFocus;
end;

procedure Tfrmarticulos.edutilaExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutila.Text,'%');
eddscto.Enabled:=true;
a:=(costo*(a/100))+costo;
precioa.text:=Format('%8.2f',[a]);
edPrecioconIvaa.Text:=Format('%8.2f',[(a*(strtofloat(ediva.text)/100))+a]);
end;

procedure Tfrmarticulos.edivaEnter(Sender: TObject);
begin
ediva.SelectAll;
end;

procedure Tfrmarticulos.edivaKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key,false);
key := ValidaPunto(edcosto.Text,key);
if key = #13 then
  begin
    key:=#0;
    edtinstalacion.SetFocus;
  end;
end;

procedure Tfrmarticulos.edutilbExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutilb.Text,'%');
a:=(costo*(a/100))+costo;
preciob.text:=Format('%8.2f',[a]);
edPrecioconIvab.Text:=Format('%8.2f',[(a*(strtofloat(ediva.text)/100))+a]);
end;

procedure Tfrmarticulos.edutilcExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutilc.Text,'%');
a:=(costo*(a/100))+costo;
precioc.text:=Format('%8.2f',[a]);
edPrecioconIvac.Text:=Format('%8.2f',[(a*(strtofloat(ediva.text)/100))+a]);

end;

procedure Tfrmarticulos.edutildExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutild.Text,'%');
a:=(costo*(a/100))+costo;
preciod.text:=Format('%8.2f',[a]);
edPrecioconIvad.Text:=Format('%8.2f',[(a*(strtofloat(ediva.text)/100))+a]);
end;

procedure Tfrmarticulos.edutilaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutilb.enabled:=true;
    edutilb.SetFocus;
  end;
end;

procedure Tfrmarticulos.edutilbKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutilc.enabled:=true;
    edutilc.SetFocus;
  end;

end;

procedure Tfrmarticulos.edutilcKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutild.enabled:=true;
    edutild.SetFocus;
  end;

end;

procedure Tfrmarticulos.edutildKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    eddscto.enabled:=true;
    eddscto.SetFocus;
  end;

end;

procedure Tfrmarticulos.eddsctoExit(Sender: TObject);
var a,b,pra,temp:double;
begin
if servicio = false then
   begin
    pra:=QuitaCaracteres (precioa.Text,'$');
    a:=QuitaCaracteres(eddscto.Text,'%');
    b:=QuitaCaracteres(edcosto.Text,'$');
    a:=pra-(pra*(a/100));
    edPrecioDscto.text:=floattostr(a);
    edPrecioDsctoIva.Text:=floattostr(a+(a*(iva/100)));
    temp:=b-a;

    if a < b then begin
      showmessage('Con ese descuento vas a tener una perdida en el articulo de: $'+ floattostr(temp) );
      {if (tblarticulos.State = dsinsert) or (tblarticulos.State = dsedit) then
         begin
          eddscto.SetFocus;
          tblarticulosdesc_esp.AsFloat:=0;
         end;}
    end;
end;
end;

procedure Tfrmarticulos.eddsctoKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13)and(edmaximo.Enabled) then
  begin
    key:=#0;
    edmaximo.SetFocus;
  end;
end;

procedure Tfrmarticulos.btnmodificarClick(Sender: TObject);
begin
   if btnmodificar.Caption = '&Editar' then
   begin
      if tblarticulosservicio.AsInteger = 0 then
         btndetalles.Visible:=true;
      frmprincipal.ucprincipal.Log('Dio click en el boton editar de Articulos',0);
      btnmodificar.Caption:='&Guardar';
      btncancelar.Caption:='&Cancelar';
      btncancelar.Hint:='Cancelar la Edición';
      btnmodificar.hint:='Guarda los Cambios Realizados';
      btnmodificar.ImageIndex:=1;
      navegador.Enabled:=false;
      btnbuscar.Enabled:=false;
      btnalta.Enabled:=false;
      btnborrar.Enabled:=false;
      habilita_grupos;
      edclave.Enabled:=false;
      gbfinancieros.enabled := true;
      tblarticulos.Edit;
      edcosto.Enabled:=false;
      if tblarticulosservicio.AsInteger = 1 then
      begin
         cbofamilia.Enabled:=false;
         edmodelo.Enabled:=false;
         cbodepto.Enabled:=false;
         spincant_f.Enabled:=false;
         cbotiempo_f.Enabled:=false;
         spincant_p.Enabled:=false;
         cbotiempo_p.Enabled:=false;
         spincant_c.Enabled:=false;
         cbotiempo_c.Enabled:=false;
         gbinventario.Enabled:=false;
         gbsugeridos.enabled:=false;
         gbUnidadesmedidas.Enabled:=false;
         gblocalizacion.Enabled:=false;
         gbexistencias.Enabled:=false;
      end;
   end
   else
   begin
      if cbolinea.Text = '' then
      begin
         application.MessageBox('Debe de Capturar la linea a la que pretenece este articulo','Aviso',mb_iconinformation);
         cbolinea.DropDown;
         exit;
      end;
      if rgmoneda.Text = '' then
      begin
         application.MessageBox('Debe de Capturar la moneda con la que se vendera este articulo','Aviso',mb_iconinformation);
         exit;
      end;
      if querys('Select cod_cve from articulos where cod_cve <> "'+edclave.text+'" and cod_barras  <> "" and cod_barras = "'+edcbarras.text+'"', 0, sqlgeneral) > 0 then
      begin
      application.MessageBox('El Codigo de Barras ya existe, modifique lo para guardar','Atencion',mb_iconinformation);
      edcbarras.SetFocus;
      exit;
      end;
      btndetalles.Visible:=false;
      deshabilita_grupos;
      navegador.Enabled:=true;
      btncancelar.Caption:='&Cerrar';
      btnmodificar.Caption:='&Editar';
      btnmodificar.hint:='Editar los datos del Proveedor Actual';
      btnmodificar.ImageIndex:=2;
      btnalta.Enabled:=true;
      btnborrar.Enabled:=true;
      frmprincipal.ucprincipal.Log('Edito el Articulo'+tblarticulosnombre.AsString,2);
      tblarticulos.fieldbyname('garantia_fabricante').AsString:=spincant_f.Text+' '+cbotiempo_f.Text;
      tblarticulos.fieldbyname('garantia_proveedor').AsString:=spincant_p.Text+' '+cbotiempo_p.Text;
      tblarticulos.fieldbyname('garantia_cliente').AsString:=spincant_c.Text+' '+cbotiempo_c.Text;
      tblarticulos.FieldByName('idprotocolo').Asinteger := cboprotocolos.Tag;
      tblarticulos.Post;
      querys('update articulos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where cod_cve='+quotedstr(edclave.Text),1,sqlgeneral);
      // separar(Self);
      limpia;
      garantia;
      btnbuscar.Enabled:=true;
      btnmodificar.Enabled:=false;
      btnborrar.Enabled:=false;
      tblarticulos.Active:=false;
      edcveart.SetFocus;
      chkinventariable.Checked := false;
   end;
end;

procedure Tfrmarticulos.edmaximoExit(Sender: TObject);
begin
if (edmaximo.Text <> '') and (edminimo.Text <> '') then
  begin
    if strtoint(edminimo.Text) > strtoint(edmaximo.Text) then
       begin
         edminimo.Text:=edmaximo.Text;
         tblarticulosminimo.AsFloat:=strtofloat(edmaximo.text);
         application.MessageBox('El minimo no puede ser mayor que el maximo!','Aviso',mb_iconwarning);
       end;
  end;
end;

procedure Tfrmarticulos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
CalculaIva;
edcveart.text := edclave.text;
lbufh.Caption := UFH(tblarticulos);
end;

procedure Tfrmarticulos.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
querys('select cod_cve as Cod_Cve,idcompra as IdOrden  from DetCompras where cod_cve='+quotedstr(tblarticuloscod_cve.AsString),1,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Articulo esta siendo usado por una compra y no podra ser eliminado hasta que se borre la compra!','Cuidado',mb_ok+mb_iconinformation)
else
querys('select cod_cve as Cod_Cve,idorden as IdOrden from DetOrden where cod_cve='+quotedstr(tblarticuloscod_cve.AsString),1,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Articulo esta siendo usado por una orden y no podra ser eliminado hasta que se borre la orden!','Cuidado',mb_ok+mb_iconinformation)
else
querys('select cod_cve as Cod_Cve,idpedido as IdPedido from DetPedido where cod_cve='+quotedstr(tblarticuloscod_cve.AsString),1,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Articulo esta siendo usado por un Presuesto o Pedido y no podra ser eliminado hasta que se borre el presupuesto!','Cuidado',mb_ok+mb_iconinformation)
else begin
if application.MessageBox('Estas Seguro que deseas borrar este Articulo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      querys('delete from detalle_art where cod_cve='+quotedstr(tblarticuloscod_cve.AsString),1,sqlgeneral);
      tblarticulos.Delete;
      garantia;
      limpia;
      //verifica la existencia de mas articulos
      querys('select cod_cve from articulos',0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
         begin
           btnmodificar.Enabled:=false;
           btnborrar.Enabled:=false;
           tblarticulos.Active:=false;
         end;
           sqlgeneral.close;
  end;
end;
if sqlgeneral.RecordCount > 0 then
begin
   hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

end;

procedure Tfrmarticulos.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmreferencias.Font;
  if FontDialog1.Execute then
    mmreferencias.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmarticulos.mmreferenciasEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmarticulos.mmreferenciasExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmarticulos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:integer;
begin
for i:=0 to screen.FormCount-1 do
    if screen.Forms[i].Name='frmdet_art' then
       begin
         canclose:=false;
         break;
       end;
       
if i = screen.FormCount then
canclose:=CerrarPantalla(tblarticulos,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmarticulos.btndetallesClick(Sender: TObject);
var hija:tfrmdet_art;
begin
hija:=tfrmdet_art.Create(self);
hija.inicializa(edclave.Text);
hija.Show;
end;


procedure Tfrmarticulos.cbotiempo_cChange(Sender: TObject);
var
temp:integer;
begin

if ((cbotiempo_p.ItemIndex) >= (cbotiempo_c.ItemIndex))  then begin
   if ((cbotiempo_p.ItemIndex) = (cbotiempo_c.ItemIndex)) then begin
      if ((spincant_p.IntValue) >= (spincant_c.IntValue)) then begin

    end else begin

      showmessage('NO PUEDE SER MAYOR LA GARANTIA AL CLIENTE QUE LA DEL PROVEEDOR');
      spincant_c.Text:=spincant_p.Text;
      cbotiempo_c.ItemIndex:=cbotiempo_p.ItemIndex;

    end; //if segundo

   end else begin

      //convierte el tipo de dato al del proveedor
      temp:=conversion(spincant_p.IntValue,cbotiempo_c.ItemIndex,cbotiempo_p.ItemIndex);

         if temp < spincant_c.IntValue then begin
            showmessage('NO PUEDE SER MAYOR LA GARANTIA AL CLIENTE QUE LA DEL PROVEEDOR');
            spincant_c.Text:=spincant_p.Text;
            cbotiempo_c.ItemIndex:=cbotiempo_p.ItemIndex;
         end;

   end;
end else begin

showmessage('NO PUEDE SER MAYOR LA GARANTIA AL CLIENTE QUE LA DEL PROVEEDOR');
spincant_c.Text:=spincant_p.Text;
cbotiempo_c.ItemIndex:=cbotiempo_p.ItemIndex;

end;//if primero


end;

procedure Tfrmarticulos.cbotiempo_pChange(Sender: TObject);
var
temp:integer;
begin
//no sea mayor el cliente que el proveedor, niel proveedor que el fabricante
if ((cbotiempo_F.ItemIndex) >= (cbotiempo_p.ItemIndex)) and  ((cbotiempo_p.ItemIndex) >= (cbotiempo_c.ItemIndex)) then begin
   if ((cbotiempo_F.ItemIndex) = (cbotiempo_p.ItemIndex)) then begin
      if ((spincant_F.IntValue) >= (spincant_P.IntValue)) then begin

    end else begin

      showmessage('NO PUEDE SER MAYOR LA GARANTIA DEL PROVEEDOR QUE LA DEL FABRICANTE');
      spincant_p.Text:=spincant_f.Text;
      cbotiempo_p.ItemIndex:=cbotiempo_f.ItemIndex;

    end; //if segundo
    end else begin
      //convierte el tipo de dato al del proveedor
      temp:=conversion(spincant_F.IntValue,cbotiempo_P.ItemIndex,cbotiempo_f.ItemIndex);

         if temp < spincant_p.IntValue then begin
            showmessage('NO PUEDE SER MAYOR LA GARANTIA DEL PROVEEDOR QUE LA DEL FABRICANTE');
            spincant_p.Text:=spincant_f.Text;
            cbotiempo_p.ItemIndex:=cbotiempo_f.ItemIndex;
        end;
//    end;
   end;
end else begin
showmessage('NO PUEDE SER MAYOR LA GARANTIA DEL PROVEEDOR QUE LA DEL FABRICANTE');
spincant_p.Text:=spincant_f.Text;
cbotiempo_p.ItemIndex:=cbotiempo_f.ItemIndex;
end;//if primero
end;

procedure Tfrmarticulos.tblarticulosAfterScroll(DataSet: TDataSet);
begin
garantia;//LIMPIA LOS CAMPOS DE GARANTIA
IF (Tblarticulos.State <> dsinsert) and (tblarticulos.RecordCount > 0) then
begin
separar;
chkinventariable.Checked:=strtobool(tblarticulos.FieldByName('inventariable').Asstring);
chkaplicadesc.Checked:=strtobool(tblarticulos.FieldByName('aplica_desc').Asstring);
if tblarticulos.FieldValues['piezasxunidad'] <> 0 then
  begin
  edunidades.text:=inttostr(tblarticulos.FieldValues['existencia'] div tblarticulos.FieldValues['piezasxunidad']);
  edpiezas.Text:=inttostr(tblarticulos.FieldValues['existencia'] mod tblarticulos.FieldValues['piezasxunidad']);
  end;
querys('select protocolo,idprotocolo from protocolos where idprotocolo='+tblarticulos.fieldbyname('idprotocolo').AsString,0,sqlgeneral);
cboprotocolos.Tag := sqlgeneral.fieldbyname('idprotocolo').AsInteger;
cboprotocolos.Text := sqlgeneral.fieldbyname('protocolo').Asstring;
if cboprotocolos.Text <> '' then
 begin
  cboprotocolos.Visible := true;
  lblprotocolos.Visible := true;
 end
else
 begin
  cboprotocolos.Visible := false;
  lblprotocolos.Visible := false;
 end;
end;
end;

procedure Tfrmarticulos.cbotiempo_fChange(Sender: TObject);
begin
if ((cbotiempo_F.ItemIndex) < (cbotiempo_p.ItemIndex)) then begin
showmessage('NO PUEDE SER MENOR LA GARANTIA DEL FABRICANTE QUE LA DEL PROVEEDOR');
spincant_f.Text:=spincant_p.Text;
cbotiempo_f.ItemIndex:=cbotiempo_p.ItemIndex;
end;
end;

procedure Tfrmarticulos.FormActivate(Sender: TObject);
begin
    tblsecciones.Active:=true;
    tblSectoresArt.Active:=true;
    tblfamilias.Active:=true;
    tbldeptos.Active:=true;
    tbllineas.Active:=true;
    sqlProveedor.Active := true;
    PrecioCapturable := false;
    Servicio := false;
    sqlproveedor.Active := true;
end;

procedure Tfrmarticulos.edtinstalacionKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key,false);
key := ValidaPunto(edtinstalacion.Text,key);
if key = #13 then
  begin
    key:=#0;
    edtinstalacioncom.setfocus;
//    precioa.SetFocus;
  end;
end;

procedure Tfrmarticulos.tblarticulosBeforePost(DataSet: TDataSet);
begin
       if chkAplicaDesc.Checked then
           tblarticulos.FieldByName('aplica_desc').Asinteger:=1
       else
           tblarticulos.FieldByName('aplica_desc').Asinteger:=0;

       if chkinventariable.Checked then
          tblarticulos.FieldByName('inventariable').Asinteger:=1
       else
          tblarticulos.FieldByName('inventariable').Asinteger:=0;
if btnalta.Caption = '&Guardar' then
 begin
  if Servicio then
   tblarticulos.FieldByName('servicio').AsInteger:=1
  else
   tblarticulos.FieldByName('servicio').AsInteger:=0;
  if PrecioCapturable then
   tblarticulos.FieldByName('PrecioCapturable').AsInteger:=1
  else
   tblarticulos.FieldByName('PrecioCapturable').AsInteger:=0;
 end;

if NuevoCosto then
  frmprincipal.ucprincipal.Log('Modifico el costo del Articulo '+ednombre.text+' a $'+edcosto.text,1);
if NuevoPrecio then
  frmprincipal.ucprincipal.Log('Modifico el precioa del Articulo '+ednombre.text+' a $'+precioa.text,1);

end;

procedure Tfrmarticulos.cbodeptoExit(Sender: TObject);
begin
gbprocedencia.SetFocus;
gbprocedencia.ItemIndex:=1;
end;

procedure Tfrmarticulos.tblarticulosAfterInsert(DataSet: TDataSet);
begin
if chkinventariable.Checked then
   chkinventariable.Checked:=false;
end;

procedure Tfrmarticulos.gbprocedenciaEnter(Sender: TObject);
begin        
//if key=#13 then
//edalta.SetFocus;
end;

procedure Tfrmarticulos.edaltaEnter(Sender: TObject);
begin
edalta.Date:=NOW;
end;

procedure Tfrmarticulos.rgmonedaEnter(Sender: TObject);
begin
rgmoneda.itemindex:=0;
end;

procedure Tfrmarticulos.edminimoKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
 if btnalta.Enabled then
    btnalta.SetFocus
 else
    if btnmodificar.Enabled then
        btnmodificar.SetFocus
    else
        btncancelar.SetFocus;


end;
end;

procedure Tfrmarticulos.cbosectorEnter(Sender: TObject);
begin
cbosector.DropDown;
end;

procedure Tfrmarticulos.cboseccionEnter(Sender: TObject);
begin
cboseccion.DropDown;
end;

procedure Tfrmarticulos.cboseccionExit(Sender: TObject);
begin
chkinventariable.setfocus;
end;

procedure Tfrmarticulos.edcostoEnter(Sender: TObject);
begin
edcosto.selectall;
end;

procedure Tfrmarticulos.edcostoKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key,false);
key := ValidaPunto(edcosto.Text,key);
if key = #13 then
  begin                                           
  key:=#0;

  ediva.SetFocus;
  end;
end;

procedure Tfrmarticulos.edcostoExit(Sender: TObject);
begin
   if (edcosto.Text='') or (edcosto.text=' ') then
    edcosto.text:='0';
   if (btnmodificar.Caption='&Guardar') OR (btnalta.Caption='&Guardar') then
   begin
   precioa.Tag := 1;
   precioa.text := Format('%8.2f',[CalculaCosto(strtofloat(edcosto.text), edclave.text, cbodepto.text, cbolinea.text)]);
   precioa.Tag := 0;
   precioa.OnExit(self);
   end
   else
   begin
      costo:=QuitaCaracteres(edcosto.Text,'$');
      iva:=QuitaCaracteres(ediva.Text,'%');
      if costo > 0 then
      begin
         gbutilidades.Enabled:=true;
         chkAplicaDesc.Enabled:=true;
      end
      else
      begin
         gbutilidades.Enabled:=false;
         chkAplicaDesc.Enabled:=false;
      end;
   end;
end;

procedure Tfrmarticulos.edCveArtButtonClick(Sender: TObject);
begin
frmbuscaart.ShowModal;
if frmbuscaart.cod_cve <> '' then
  begin
  tblarticulos.Active:=true;
  edcveart.text := frmbuscaart.cod_cve;
  tblarticulos.Locate('cod_cve',frmbuscaart.cod_cve,[]);
  cbodepto.OnClick(self);
  CalculaIva;
  navegador.Enabled:=true;
  btnalta.Enabled:=true;
  btnmodificar.Enabled:=true;
  btnborrar.Enabled:=true;
  separar;
  end;
{with frmbusquedas do
 begin
  query:='SELECT a.cod_cve as Cod_Cve,a.cod_barras as Cod_Barras,a.nombre as Nombre,a.costo,a.precioa,a.existencia,a.backorder,a.apartado,d.nombre AS Depto,a.usuario as Usuario,a.fecha as Fecha,a.hora as Hora FROM articulos as a LEFT JOIN '+
         ' dptos as d ON (a.iddpto = d.iddpto) ORDER BY a.cod_cve';
  campo_busqueda:='nombre';
  campo_retorno:='cod_cve';
  tabla:='Articulos';
  tblorigen := 'articulos';
  ShowModal;
  if resultado <> '' then
    begin
    tblarticulos.Active:=true;
    edcveart.text := resultado;
    tblarticulos.Locate('cod_cve',resultado,[]);
    cbodepto.OnClick(self);
    CalculaIva;
    navegador.Enabled:=true;
    btnalta.Enabled:=true;
    btnmodificar.Enabled:=true;
    btnborrar.Enabled:=true;
    separar;
    end;
  end;}
end;

procedure Tfrmarticulos.edCveArtKeyPress(Sender: TObject; var Key: Char);
begin
if (edCveArt.Text = '') and (key = #13) then
 begin
  key := #0;
  edCveArt.OnButtonClick(self);
  exit;
 end;

if (edCveArt.Text <> '') and (key = #13) then
 begin
  //aqui busca el articulo por codigo de barras o por clave
  querys('select cod_cve From articulos where cod_cve='+quotedstr(edCveArt.text)+ ' or cod_barras='+quotedstr(edCveArt.Text),0,SqlGeneral);
  if SqlGeneral.RecordCount = 0 then
   begin
    application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
    edCveArt.SelectAll;
    SqlGeneral.Close;
   end
  else
   begin
    tblarticulos.Active:=true;
    tblarticulos.Locate('cod_cve',edCveArt.Text,[]);
      //CalculaIva;
      navegador.Enabled:=true;
      btnalta.Enabled:=true;
      btnmodificar.Enabled:=true;
      btnborrar.Enabled:=true;
      lbufh.Caption := UFH(tblarticulos);
      separar;
    end;
  end;
end;

procedure Tfrmarticulos.FormShow(Sender: TObject);
begin
cargacombo('select protocolo as Nombre from protocolos order by protocolo','protocolos',cboprotocolos);
end;

procedure Tfrmarticulos.cbodeptoClick(Sender: TObject);
begin
if cbodepto.Text = 'CONTROLES' then
 begin
  cboprotocolos.Visible := true;
  lblprotocolos.Visible := true;
 end
else
 begin
  cboprotocolos.Visible := false;
  lblprotocolos.Visible := false;
 end;
end;

procedure Tfrmarticulos.cboprotocolosSelect(Sender: TObject);
begin
if cboprotocolos.text <> '' then
  begin
  querys('select idprotocolo from protocolos where protocolo='+quotedstr(cboprotocolos.Text),0,sqlgeneral);
  cboprotocolos.Tag := sqlgeneral.fieldbyname('idprotocolo').asinteger;
  end;
end;

procedure Tfrmarticulos.precioaExit(Sender: TObject);
begin
edutila.text := Format('%8.2f',[((quitacaracteres(precioa.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
edPrecioconIvaa.Text:=Format('%8.2f',[(quitacaracteres(precioa.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(precioa.text)]);
end;

procedure Tfrmarticulos.preciobExit(Sender: TObject);
begin
edutilb.text := Format('%8.2f',[((quitacaracteres(preciob.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
//edutilb.text:=Format('%8.2f',[strtofloat(preciob.text)/strtofloat(edcosto.text)]);
edPrecioconIvab.Text:=Format('%8.2f',[(quitacaracteres(preciob.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(preciob.text)]);
end;

procedure Tfrmarticulos.preciocExit(Sender: TObject);
begin
edutilc.text := Format('%8.2f',[((quitacaracteres(precioc.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
//edutilc.text:=Format('%8.2f',[strtofloat(precioc.text)/strtofloat(edcosto.text)]);
edPrecioconIvac.Text:=Format('%8.2f',[(quitacaracteres(precioc.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(precioc.text)]);
end;

procedure Tfrmarticulos.preciodExit(Sender: TObject);
begin
edutild.text := Format('%8.2f',[((quitacaracteres(preciod.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
//edutild.text:=Format('%8.2f',[strtofloat(preciod.text)/strtofloat(edcosto.text)]);
edPrecioconIvad.Text:=Format('%8.2f',[(quitacaracteres(preciod.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(preciod.text)]);
end;

procedure Tfrmarticulos.precioaKeyPress(Sender: TObject; var Key: Char);
begin
precioa.tag :=1;
if key = #13 then
  begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    //eddscto.SetFocus;
    //preciob.SetFocus;
  end;
end;

procedure Tfrmarticulos.preciobKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    precioc.SetFocus;
  end;
end;

procedure Tfrmarticulos.preciocKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    preciod.SetFocus;
  end;
end;

procedure Tfrmarticulos.preciodKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    eddscto.SetFocus;
  end;
end;

procedure Tfrmarticulos.edtinstalacioncomKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key,false);
//key := ValidaPunto(edtinstalacioncom.Text,key);
if key = #13 then
  begin
    key:=#0;
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmarticulos.edclaveprovKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edclaveprov.Text<>'') then
begin
key:=#0;
SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmarticulos.edCveArtChange(Sender: TObject);
begin
if (edcveArt.text = '') and (btncancelar.caption <> '&Cancelar') then
  limpia;
end;

procedure Tfrmarticulos.btnvalidacostoClick(Sender: TObject);
begin
   if frmautentificacion.ShowModal = mrok then
   begin
      {querys('select modificacosto from usuarios as u left join UCTabUsers as uc on u.idusuario=uc.UCIdUser'+
         ' where uc.UCLogin="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"',0,sqlgeneral);
      if sqlgeneral.FieldByName('modificacosto').AsBoolean=true then}
   if DerechosSys('Modifica Costo') = true then
      begin
         edcosto.Enabled:=true;
      end;
   end;
end;

procedure Tfrmarticulos.edcostoChange(Sender: TObject);
begin
if btnmodificar.Caption = '&Guardar' then
  NuevoCosto := true;
  {frmprincipal.ucprincipal.Log('Modifico el costo del Articulo '+ednombre.text,1);
   querys('update articulos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where cod_cve='+quotedstr(edclave.Text),1,sqlgeneral);}
end;

procedure Tfrmarticulos.precioaChange(Sender: TObject);
var  ban:integer;
begin
 if (gbprocedencia.ItemIndex = 2) and (precioa.Tag = 1) and (tblarticulos.State = dsEdit) then
    begin
    if application.MessageBox('Deseas capturar el precio de acuerdo a otro costo?', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
      begin
      repeat
        try
        cos := strtofloat(InputBox('Captura el costo',pchar('El articulo tecleado es Chino'+char(#13)+
               'Escriba el costo con el que se calculara el precio'), '0'));
        ban := 1;
        except
        ban := 0;
        end;
      until ban = 1;
      precioa.Tag := 0;
      precioa.Text := Format('%8.2f',[CalculaCosto(cos, edclave.text, cbodepto.text, cbolinea.Text)]);
      end;
    end;
if btnmodificar.Caption = '&Guardar' then
  NuevoPrecio := true;

   {frmprincipal.ucprincipal.Log('Modifico el precio del Articulo '+ednombre.text,1);
   querys('update articulos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where cod_cve='+quotedstr(edclave.Text),1,sqlgeneral);}
end;

function Tfrmarticulos.CalculaCosto(costo:double; cod_cve, depto, linea:string):double;
begin
querys('select factor from dptos where iddpto = "'+inttostr(cbodepto.ListFieldIndex)+'"', 0, sqlgeneral);
if linea = 'EQUIPO' then
  begin
    result := strtofloat(Format('%8.0f',[(costo*sqlgeneral.fieldbyname('factor').asfloat)/strtofloat(getconfiguraciones('dividendoDpto', true))]));
  {if depto = 'CCTV' then
    result := strtofloat(Format('%8.0f',[(costo*1.45)/0.9]))
  else
    result := strtofloat(Format('%8.0f',[(costo*2)/0.9]));}
  end
else
  result := costo;
end;

End.



