{///////////////////////////////////////////////////////////////////////////////
2009/06/05 dalyla configuracion de foliosFE
2009/01/22 dalyla folios editar por separado
--------------------------------------------------------------------------------
2008/07/11 dalyla sincronizacion
2008/02/19 dalyla ciudad estado
2008/01/21 dalyla host de conmutador
--------------------------------------------------------------------------------
2007/12/19 dalyla log de configuraciones
2007/12/12 dalyla IVA e IVA2
2007/11/06 DALILA   Agregue el Cancelar ;
}///////////////////////////////////////////////////////////////////////////////
unit Uconfiguraciones;

interface
                                 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit,
  DB, MemDS, DBAccess, MyAccess, RzTabs, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxMemo, RzButton, RzRadChk;

type
  Tfrmconfiguraciones = class(TForm)
    sqlfolios: TMyQuery;
    sqlfoliosidremicion: TIntegerField;
    sqlfoliosFacturaP: TIntegerField;
    sqlfoliosFacturaD: TIntegerField;
    sqlfoliosFacturaC: TIntegerField;
    sqlfoliosFolioRecibo: TIntegerField;
    dsFolios: TDataSource;
    pcconfiguraciones: TRzPageControl;
    tsempresa: TRzTabSheet;
    tsfolios: TRzTabSheet;
    RzLabel5: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel6: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzLabel7: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzLabel8: TRzLabel;
    RzDBEdit4: TRzDBEdit;
    RzLabel9: TRzLabel;
    RzDBEdit5: TRzDBEdit;
    RzLabel10: TRzLabel;
    RzDBEdit6: TRzDBEdit;
    RzLabel11: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    RzLabel12: TRzLabel;
    RzDBEdit8: TRzDBEdit;
    dsEmpresa: TDataSource;
    sqlEmpresa: TMyQuery;
    sqlEmpresaidempresa: TIntegerField;
    sqlEmpresanombre: TStringField;
    sqlEmpresadireccion: TStringField;
    sqlEmpresatelefono: TStringField;
    sqlEmpresaciudad: TStringField;
    sqlEmpresaestado: TStringField;
    sqlEmpresarfc: TStringField;
    sqlEmpresaInteresMoratorio: TFloatField;
    sqlEmpresaCtaBanco: TStringField;
    tsotros: TRzTabSheet;
    Ovista: TcxGridDBTableView;
    Onivel: TcxGridLevel;
    cxotros: TcxGrid;
    sqlOtros: TMyQuery;
    dsotros: TDataSource;
    cxconcepto: TcxGridDBColumn;
    cxvalor: TcxGridDBColumn;
    cxcontenido: TcxGridDBColumn;
    btneditar: TRzBitBtn;
    btnsalir: TRzBitBtn;
    sqlfoliosFolioNC: TIntegerField;
    tsmaquinas: TRzTabSheet;
    sqlmaquinas: TMyQuery;
    dsmaquinas: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    sqlmaquinasidmaq: TIntegerField;
    sqlmaquinasipadress: TStringField;
    sqlmaquinaspcname: TStringField;
    sqlmaquinasonline: TSmallintField;
    sqlmaquinasmonitorea: TSmallintField;
    sqlmaquinasmonitoreando: TSmallintField;
    cxmaqmaq: TcxGridDBColumn;
    cxipadress: TcxGridDBColumn;
    cxpcname: TcxGridDBColumn;
    cxonline: TcxGridDBColumn;
    cxMonitorea: TcxGridDBColumn;
    cxmonitoreando: TcxGridDBColumn;
    TSCorreos: TRzTabSheet;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    edPop3ServerName: TRzEdit;
    edPop3ServerPort: TRzEdit;
    edPop3ServerUser: TRzEdit;
    edPop3serverPassword: TRzEdit;
    edSmtpserverName: TRzEdit;
    edSmtpServerPort: TRzEdit;
    edSmtpserverUser: TRzEdit;
    edSmtpServerPassword: TRzEdit;
    edUserMail: TRzEdit;
    edUserMailInterno: TRzEdit;
    edSmtpServerNameInterno: TRzEdit;
    TSCantidades: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    RzLabel27: TRzLabel;
    ediva2: TRzNumericEdit;
    ediva1: TRzNumericEdit;
    tsVarios: TRzTabSheet;
    RzLabel28: TRzLabel;
    edhostcom: TRzEdit;
    edciudad: TRzEdit;
    edestado: TRzEdit;
    ckciudad: TRzCheckBox;
    ckestado: TRzCheckBox;
    tsSincronizacion: TRzTabSheet;
    RzLabel29: TRzLabel;
    edipserver: TRzEdit;
    ediplocalhost: TRzEdit;
    edbd: TRzEdit;
    edbduser: TRzEdit;
    edbdpass: TRzEdit;
    edbdconf: TRzEdit;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    edtc: TRzEdit;
    ckTipoCambio: TRzCheckBox;
    ckivadefault: TRzCheckBox;
    ckivasecundario: TRzCheckBox;
    ckremision: TRzCheckBox;
    ckfacturap: TRzCheckBox;
    ckfacturad: TRzCheckBox;
    ckfacturac: TRzCheckBox;
    cknc: TRzCheckBox;
    edremision: TRzEdit;
    edfacturap: TRzEdit;
    edfacturad: TRzEdit;
    edfacturac: TRzEdit;
    ednc: TRzEdit;
    tsfoliosfe: TRzTabSheet;
    ckimpcaja: TRzCheckBox;
    ckimplotes: TRzCheckBox;
    ckimpfe: TRzCheckBox;
    edimpcaja: TRzEdit;
    edimplotes: TRzEdit;
    edimpsectores: TRzEdit;
    RzLabel1: TRzLabel;
    gfoliosfe: TcxGrid;
    vfoliosfe: TcxGridDBTableView;
    colletra: TcxGridDBColumn;
    colproc: TcxGridDBColumn;
    colfolio: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    sqlFoliosFE: TMyQuery;
    dsFoliosFE: TDataSource;
    sqlFoliosFEidfolio: TIntegerField;
    sqlFoliosFEletras: TStringField;
    sqlFoliosFEprocedencia: TStringField;
    sqlFoliosFEidproc: TIntegerField;
    sqlFoliosFEfolio: TIntegerField;
    sqlFoliosFEusuario: TStringField;
    sqlFoliosFEfecha: TDateField;
    sqlFoliosFEhora: TTimeField;
    colano: TcxGridDBColumn;
    colversion: TcxGridDBColumn;
    colnum: TcxGridDBColumn;
    sqlFoliosFEVersionFE: TStringField;
    sqlFoliosFEAnoAprobacion: TStringField;
    sqlFoliosFENumAprobacion: TStringField;
    RzLabel2: TRzLabel;
    RzDBEdit9: TRzDBEdit;
    RzLabel3: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzDBEdit11: TRzDBEdit;
    RzLabel13: TRzLabel;
    RzDBEdit12: TRzDBEdit;
    RzLabel18: TRzLabel;
    RzDBEdit13: TRzDBEdit;
    RzLabel23: TRzLabel;
    RzDBEdit14: TRzDBEdit;
    sqlEmpresaCalle: TStringField;
    sqlEmpresaNumero: TStringField;
    sqlEmpresaColonia: TStringField;
    sqlEmpresaCP: TStringField;
    sqlEmpresareferencia: TStringField;
    sqlEmpresanumint: TStringField;
    sqlEmpresaClaveUsuarioBuroCreditoPM: TStringField;
    sqlEmpresaVersionBuroCredito: TStringField;
    sqlEmpresaClaveUsuarioBuroCredito: TStringField;
    sqlEmpresaNombreUsuarioBuroCredito: TStringField;
    tsBoletas: TRzTabSheet;
    mleyendainf: TMemo;
    RzLabel35: TRzLabel;
    procedure btnsalirClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcconfiguracionesChange(Sender: TObject);
    procedure pcconfiguracionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlFoliosFEBeforePost(DataSet: TDataSet);
    procedure sqlFoliosFEAfterPost(DataSet: TDataSet);
  private
    procedure HabilitaTab(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconfiguraciones: Tfrmconfiguraciones;

implementation

uses Udm, UCfgPresupuestos, Uprincipal, Urecursos;

{$R *.dfm}

procedure Tfrmconfiguraciones.btnsalirClick(Sender: TObject);
begin
if btneditar.Caption = '&Guardar' then
  begin
  {if application.MessageBox('Se encuentra editando, desea guardar los cambios?','Confirmacion',mb_iconquestion+mb_yesno) = idyes then
   btneditar.Click;}
  if tsempresa.Showing = true then
    begin
    sqlempresa.Cancel;
    tsempresa.Enabled := false;
    end;

  if tsotros.Showing = true then
    begin
    sqlotros.Cancel;
    tsotros.Enabled := false;
    end;

  if tsfolios.Showing = true then
    begin
    //sqlfolios.Cancel;
    tsfolios.Enabled := false;
    end;

  if tsmaquinas.Showing = true then
    begin
    sqlmaquinas.Cancel;
    tsmaquinas.Enabled := false;
    end;

  if tscorreos.Showing = true then
    begin
    tscorreos.enabled := false;
    end;

  if tscantidades.Showing = true then
    begin
    tscantidades.Enabled := false;
    ckTipoCambio.Checked := false;
    ckivasecundario.Checked := false;
    ckivadefault.Checked := false;
    end;

  if tsvarios.Showing = true then
    begin
    tsvarios.Enabled := false;
    ckestado.Checked := false;
    ckciudad.Checked := false;
    end;

  if tsSincronizacion.Showing = true then
    begin
    tsSincronizacion.Enabled := false;
    end;

  if tsfoliosfe.Showing = true then
    begin
    tsfoliosfe.Enabled := false;
    end;

  HabilitaTab(true);

  btneditar.Caption := '&Editar';
  btnsalir.Caption := '&Salir';
  end
else
  close;
end;

procedure Tfrmconfiguraciones.btneditarClick(Sender: TObject);
begin
if btneditar.Caption = '&Editar' then
 begin
  HabilitaTab(false);
  //EMPRESA
  if tsempresa.Showing = true then
    begin
    if DerechosSys('Modificar Datos Empresa') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    sqlempresa.Edit;
    tsempresa.TabEnabled := true;
    tsempresa.Enabled := true;
    end;

  //OTROS
  if tsotros.Showing = true then
    begin
    if DerechosSys('Modificar Otros en Configuraicones') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    sqlotros.Edit;
    tsotros.TabEnabled := true;
    tsotros.Enabled := true;
    end;

  //FOLIOS
  if tsfolios.Showing = true then
    begin
    if DerechosSys('Modificar Folios') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    //sqlfolios.Edit;
    tsfolios.TabEnabled := true;
    tsfolios.Enabled := true;
    end;

  //MAQUINAS
  if tsmaquinas.Showing = true then
    begin
    if DerechosSys('Modificar Maquinas') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    sqlmaquinas.Edit;
    tsmaquinas.TabEnabled := true;
    tsmaquinas.Enabled := true;
    end;

  //CORREOS
  if tscorreos.Showing = true then
    begin
    if DerechosSys('Modificar Datos Correo') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    tscorreos.enabled := true;
    tscorreos.TabEnabled := true;
    end;

  //CANTIDADES O FISCAL
  if tscantidades.Showing = true then
    begin
    if DerechosSys('Modificar Datos Fiscales') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    tscantidades.enabled := true;
    tscantidades.TabEnabled := true;
    end;

  //VARIOS
  if tsvarios.Showing = true then
    begin
    if DerechosSys('Modificar Varios en Configuarciones') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    tsvarios.enabled := true;
    tsvarios.tabenabled := true;
    end;

  //SINCRONIZACION
  if tsSincronizacion.Showing = true then
    begin
    if DerechosSys('Modificar Datos Sincronizacion') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    tsSincronizacion.enabled := true;
    tsSincronizacion.tabenabled := true;
    end;

  //FACTURACION ELECTRONICA
  if tsfoliosfe.Showing = true then
    begin
    if DerechosSys('Modificar Folios FE') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    //sqlfoliosfe.Edit;
    tsfoliosfe.enabled := true;
    tsfoliosfe.tabenabled := true;
    end;

  //BOLETAS
  if tsBoletas.Showing = true then
    begin
    if DerechosSys('Modificar Boletas') = false then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar', 'Atencion', MB_ICONINFORMATION);
      HabilitaTab(true);
      exit;
      end;
    tsBoletas.enabled := true;
    tsBoletas.tabenabled := true;
    end;
 btneditar.Caption := '&Guardar';
 btnsalir.Caption := '&Cancelar';

 frmprincipal.ucprincipal.Log('Dio click en el boton editar de Configuraciones',0);
 end
else
 begin
 if sqlempresa.State = dsedit then
    begin
    sqlempresa.post;
    tsempresa.Enabled := false;
    frmprincipal.ucprincipal.Log('Edito el Empresa en Configuraciones',2);
    end;

  if sqlotros.State = dsedit then
    begin
    sqlotros.post;
    tsotros.Enabled := false;
    frmprincipal.ucprincipal.Log('Edito el Otros en Configuraciones',2);
    end;

  if tsfolios.Showing = true then
    begin
    //sqlfolios.post;
    if ckremision.Checked then
      begin
      querys('Update folios set idremicion = "'+edremision.Text+'"', 1, sqlfolios);
      frmprincipal.ucprincipal.Log('Edito el Folio de Remision',2);
      ckremision.Checked := false;
      end;

    if ckfacturap.Checked then
      begin
      querys('Update folios set FacturaP = "'+edfacturap.Text+'"', 1, sqlfolios);
      frmprincipal.ucprincipal.Log('Edito el Folio de FacturaP',2);
      ckfacturap.Checked := false;
      end;

    if ckfacturad.Checked then
      begin
      querys('Update folios set FacturaD = "'+edfacturad.Text+'"', 1, sqlfolios);
      frmprincipal.ucprincipal.Log('Edito el Folio de FacturaD',2);
      ckfacturad.Checked := false;
      end;

    if ckfacturac.Checked then
      begin
      querys('Update folios set FacturaC = "'+edfacturac.Text+'"', 1, sqlfolios);
      frmprincipal.ucprincipal.Log('Edito el Folio de FacturaC',2);
      ckfacturac.Checked := false;
      end;

    if cknc.Checked then
      begin
      querys('Update folios set FolioNC = "'+ednc.Text+'"', 1, sqlfolios);
      frmprincipal.ucprincipal.Log('Edito el Folio de Nota de Credito',2);
      cknc.Checked := false;
      end;
    tsfolios.Enabled := false;

    end;

  if (sqlmaquinas.State = dsedit) or (sqlmaquinas.State = dsinsert) then
    begin
    sqlmaquinas.Post;
    tsmaquinas.Enabled := false;
    frmprincipal.ucprincipal.Log('Edito el Maquinas en Configuraciones',2);
    end;

  if tscorreos.Showing = true then
    begin
    querys('Update configuraciones set valor = "'+edPop3ServerName.Text+'" where concepto = "Pop3ServerName"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edPop3ServerPort.Text+'" where concepto = "Pop3ServerPort"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edPop3ServerUser.Text+'" where concepto = "Pop3ServerUser"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edPop3serverPassword.Text+'" where concepto = "Pop3ServerPassword"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edSmtpserverName.Text+'" where concepto = "SmtpServerName"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edSmtpServerPort.Text+'" where concepto = "SmtpServerPort"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edSmtpserverUser.Text+'" where concepto = "SmtpServerUser"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edSmtpServerPassword.Text+'" where concepto = "SmtpServerPassword"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edUserMail.Text+'" where concepto = "UserEmail"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edUserMailInterno.Text+'" where concepto = "UserEmailInterno"', 1, dmaccesos.sqlgeneral);
    querys('Update configuraciones set valor = "'+edSmtpServerNameInterno.Text+'" where concepto = "SmptServerNameInterno"', 1, dmaccesos.sqlgeneral);
    tscorreos.Enabled := false;
    frmprincipal.ucprincipal.Log('Edito los correos en Configuraciones',2);
    end;

  if tscantidades.Showing = true then
    begin
    if ckivadefault.Checked then
      begin
      querys('Update configuraciones set valor = "'+ediva1.Text+'" where concepto = "IVA"', 1, dmaccesos.sqlgeneral);
      frmprincipal.ucprincipal.Log('Edito el IVA Default a '+ediva1.Text,2);
      ckivadefault.Checked := false;
      end;

    if ckivasecundario.Checked then
      begin
      querys('Update configuraciones set valor = "'+ediva2.Text+'" where concepto = "IVA2"', 1, dmaccesos.sqlgeneral);
      frmprincipal.ucprincipal.Log('Edito el IVA Secundario a '+ediva2.Text,2);
      ckivasecundario.Checked := false;
      end;

    if ckTipoCambio.Checked then
      begin
      querys('Update configuraciones set valor = "'+edtc.Text+'" where concepto = "TipoCambio"', 1, dmaccesos.sqlgeneral);
      frmprincipal.ucprincipal.Log('Edito el Tipo de Cambio Default a '+edtc.Text,2);
      ckTipoCambio.Checked := false;
      end;
    tscantidades.Enabled := false;
    end;

  if tsvarios.Showing = true then
    begin
    dmaccesos.IniFile.WriteString('CONMUTADOR', 'Server', edhostcom.Text);
    if ckciudad.Checked = true then
      querys('Update configuraciones set valor = "'+edciudad.Text+'" where concepto = "ciudad"', 1, dmaccesos.sqlgeneral);
    if ckestado.Checked = true then
      querys('Update configuraciones set valor = "'+edestado.Text+'" where concepto = "estado"', 1, dmaccesos.sqlgeneral);
    frmprincipal.ucprincipal.Log('Edito los datos de Conmutador en Configuraciones',2);
    ckciudad.Checked := false;
    ckestado.Checked := false;
    tsvarios.enabled := false;
    end;

  if tsSincronizacion.Showing = true then
    begin
    if edbdpass.Text <> edbdconf.Text then
      begin
      Application.MessageBox('El password y la confirmacion no coinciden', 'Atencion', MB_ICONINFORMATION);
      edbdpass.SetFocus;
      exit;
      end;
    querys('Update configuraciones set valor = "'+edipserver.Text+'" where concepto = "IpServer"', 1, dmaccesos.sqlgeneral);
    DMAccesos.IniFile.WriteString('CONEXION_LOCAL', 'ipadd', ediplocalhost.Text);
    DMAccesos.IniFile.WriteString('CONEXION_LOCAL', 'bd', edbd.Text);
    DMAccesos.IniFile.WriteString('CONEXION_LOCAL', 'usuario', edbduser.Text);
    DMAccesos.IniFile.WriteString('CONEXION_LOCAL', 'pass', edbdpass.Text);
    DMAccesos.IniFile.WriteString('CONEXION_LOCAL', 'repass',edbdconf.Text );

    frmprincipal.ucprincipal.Log('Edito los datos de Sincronizacion en Configuraciones',2);
    tsSincronizacion.enabled := false;
    end;

  if tsfoliosfe.Showing = true then
    begin
    if ckimpcaja.Checked then
      begin
      querys('update configuraciones set valor = "'+edimpcaja.Text+'" where concepto = "ImpresoraCajaFE"', 1, DMAccesos.sqlgeneral);
      frmprincipal.ucprincipal.Log('Edito la impresora de CajaFE',2);
      ckimpcaja.Checked := false;
      end;
    if ckimplotes.Checked then
      begin
      querys('update configuraciones set valor = "'+edimplotes.Text+'" where concepto = "ImpresoraLotesFE"', 1, DMAccesos.sqlgeneral);
      frmprincipal.ucprincipal.Log('Edito la impresora de LotesFE',2);
      ckimplotes.Checked := false;
      end;
    if ckimpfe.Checked then
      begin
      querys('update configuraciones set valor = "'+edimpsectores.Text+'" where concepto = "ImpresoraFE"', 1, DMAccesos.sqlgeneral);
      frmprincipal.ucprincipal.Log('Edito la impresora de SectoresFE',2);
      ckimpfe.Checked := false;
      end;
   // sqlFoliosFE.Post;
   // if sqlFoliosFE.RowsAffected > 1 then
      //frmprincipal.ucprincipal.Log('Edito los Folios FE',2);
    tsfoliosfe.enabled := false;
    end;

  if tsBoletas.Showing = true then
  begin
    querys('Update configuraciones set valormemo = "'+mleyendainf.Text+'" where concepto = "BoletasTextoInferior"', 1, dmaccesos.sqlgeneral);
    tsBoletas.Enabled := false;
  end;
  HabilitaTab(true);
  pcconfiguraciones.OnClick(self);
  btneditar.Caption := '&Editar';
  btnsalir.Caption := '&Salir';
  //frmprincipal.ucprincipal.Log('Edito configuraciones',0);
  end;
end;

procedure Tfrmconfiguraciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action :=  cafree;
end;

procedure Tfrmconfiguraciones.pcconfiguracionesChange(Sender: TObject);
begin
if btneditar.Caption = '&Editar' then
 begin
  sqlotros.Active := true;
  sqlempresa.Active := true;
  sqlfoliosFE.Active := true;
  sqlmaquinas.Active := true;
  sqlmaquinas.Refresh;
  sqlotros.Refresh;
  sqlempresa.Refresh;
  sqlfoliosFE.Refresh;
 end;
end;

procedure Tfrmconfiguraciones.pcconfiguracionesClick(Sender: TObject);
begin
  if tsempresa.Showing = true then
    begin
    sqlempresa.open;
    end;

  if tsotros.Showing = true then
    begin
    sqlotros.Open;
    end;

  if tsfolios.Showing = true then
    begin
    with dmaccesos do
      begin
      querys('select * from folios', 0, sqlgeneral);
      edremision.text := sqlgeneral.fieldbyname('idremicion').AsString;
      edfacturap.text := sqlgeneral.fieldbyname('FacturaP').AsString;
      edfacturad.text := sqlgeneral.fieldbyname('FacturaD').AsString;
      edfacturac.text := sqlgeneral.fieldbyname('FacturaC').AsString;
      ednc.text := sqlgeneral.fieldbyname('FolioNC').AsString;
      end;
    end;

  if tsmaquinas.Showing = true then
    begin
    sqlmaquinas.Open;
    end;

  if tscorreos.Showing = true then
    begin
    with dmaccesos do
      begin
      querys('Select * from configuraciones',0, sqlgeneral);
      sqlgeneral.First;
      while not sqlgeneral.Eof = true do
        begin
        if  sqlgeneral.fieldbyname('concepto').AsString = 'Pop3ServerName' then
          edPop3ServerName.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'Pop3ServerPort' then
          edPop3ServerPort.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'Pop3ServerUser' then
          edPop3ServerUser.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'Pop3ServerPassword' then
          edPop3serverPassword.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'SmtpServerName' then
          edSmtpserverName.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'SmtpServerPort' then
          edSmtpServerPort.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'SmtpServerUser' then
          edSmtpserverUser.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'SmtpServerPassword' then
          edSmtpServerPassword.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'UserEmail' then
          edUserMail.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'UserEmailInterno' then
          edUserMailInterno.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'SmptServerNameInterno' then
          edSmtpServerNameInterno.Text := sqlgeneral.fieldbyname('valor').AsString;
        dmaccesos.sqlgeneral.Next;
        end;
      end;
    end;

  if tscantidades.Showing = true then
    begin
    with dmaccesos do
      begin
      querys('Select * from configuraciones where concepto in("IVA", "IVA2","TipoCambio")',0, sqlgeneral);
      sqlgeneral.First;
        while not sqlgeneral.Eof = true do
        begin
        if  sqlgeneral.fieldbyname('concepto').AsString = 'IVA' then
          ediva1.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'IVA2' then
          ediva2.Text := sqlgeneral.fieldbyname('valor').AsString;

        if  sqlgeneral.fieldbyname('concepto').AsString = 'TipoCambio' then
          edtc.Text := sqlgeneral.fieldbyname('valor').AsString;
        dmaccesos.sqlgeneral.Next;
        end;
      end;
    end;

    if tsvarios.Showing = true then
      begin
      edhostcom.Text := dmaccesos.IniFile.ReadString('CONMUTADOR', 'Server', '');
      querys('Select max(estado) as estado, max(ciudad) as ciudad from (Select if(concepto="estado", valor, "") as estado, '+
             'if(concepto="ciudad", valor, "") as ciudad from configuraciones where concepto in("ciudad", "estado")) as t', 0, dmaccesos.sqlgeneral);
      edciudad.text := dmaccesos.sqlgeneral.fieldbyname('ciudad').AsString;
      edestado.Text := dmaccesos.sqlgeneral.fieldbyname('estado').AsString;
      end;

    if tsSincronizacion.Showing = true then
      begin
      edipserver.Text := GetConfiguraciones('IpServer', true);
      ediplocalhost.Text := DMAccesos.IniFile.ReadString('CONEXION_LOCAL', 'ipadd', '');
      edbd.Text:= DMAccesos.IniFile.ReadString('CONEXION_LOCAL', 'bd', '');
      edbduser.Text := DMAccesos.IniFile.ReadString('CONEXION_LOCAL', 'usuario', '');
      edbdpass.Text := DMAccesos.IniFile.ReadString('CONEXION_LOCAL', 'pass', '');
      edbdconf.Text := DMAccesos.IniFile.ReadString('CONEXION_LOCAL', 'repass', '');
      end;

    if tsfoliosfe.Showing = true then
    begin
    sqlFoliosFE.Open;
    edimpcaja.text := GetConfiguraciones('ImpresoraCajaFE', true);
    edimplotes.text := GetConfiguraciones('ImpresoraLotesFE', true);
    edimpsectores.text := GetConfiguraciones('ImpresoraFE', true);
    end;

    if tsBoletas.Showing = true then
    begin
      if querys('Select ValorMemo from configuraciones where concepto in("BoletasTextoInferior")',0, dmaccesos.sqlgeneral) > 0 then
      begin
        mleyendainf.Text := dmaccesos.sqlgeneral.fieldbyname('ValorMemo').AsString;
      end;
    end;
end;

procedure Tfrmconfiguraciones.FormShow(Sender: TObject);
begin
pcconfiguraciones.TabIndex := 0;
sqlempresa.open;
end;

procedure Tfrmconfiguraciones.HabilitaTab(hab:boolean);
begin
  tsempresa.TabEnabled := hab;
  tsotros.TabEnabled := hab;
  tsfolios.TabEnabled := hab;
  tsmaquinas.TabEnabled := hab;
  tscorreos.TabEnabled := hab;
  tscantidades.TabEnabled := hab;
  tsvarios.TabEnabled := hab;
  tsSincronizacion.TabEnabled := hab;
  tsfoliosfe.TabEnabled := hab;
  tsBoletas.TabEnabled := hab;

end;

procedure Tfrmconfiguraciones.sqlFoliosFEBeforePost(DataSet: TDataSet);
begin
sqlFoliosFEusuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
sqlFoliosFEfecha.AsString := datetostr(date);
sqlFoliosFEhora.AsString := FormatDateTime('HH:mm:ss', time);
end;

procedure Tfrmconfiguraciones.sqlFoliosFEAfterPost(DataSet: TDataSet);
begin
frmprincipal.ucprincipal.Log('Edito los Folios FE',2);
end;

end.

