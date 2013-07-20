{///////////////////////////////////////////////////////////////////////////////
MODIFICACIONES
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
2009/06/12 quitar si desgloza o no, debe de desglozar clientes fact
2009/05/26 dalyla conexion para MSSQL
2008/04/03 dalyla left join de clientesfact idcontatco=idcontacto y no contador
2007/09/28 dalyla INICIALIZAR VAR temp en CALCULO DE SQLCLIENTES  ON BOF
}///////////////////////////////////////////////////////////////////////////////
unit Udmrep;
                           
interface

uses
  SysUtils,dadbbde,dialogs,raide,daide, Classes, DB, MemDS, DBAccess, MyAccess,
  RpRave, RpDefine, RpCon, RpConDS, RpBase, RpSystem, NLetra, ppDsgnDB, ppDB,
  ppDBPipe, ppFormWrapper, ppRptExp, ppEndUsr, ppModule, raCodMod, ppBands,
  ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppRichTx,
  ppCtrls, ppVar, ppPrnabl, ppMemo, ppParameter, VirtualTable, ppSubRpt,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog, LMDTextEditDlg,
  RpFiler, RpRender, RpRenderPDF, windows,forms, daDataModule, myChkBox,
  Graphics, jpeg, TXComp, ppBarCod, ppRegion, DBXpress, FMTBcd, SqlExpr,
  ADODB, LMDIniCtrl, RxGIF;

type
  TDMREPORTES = class(TDataModule)
    RVQREP2: TRvDataSetConnection;
    RVQREP: TRvDataSetConnection;
    RVP: TRvProject;
    sqlgeneral2: TMyQuery;
    sqlgeneral: TMyQuery;
    RvSystem1: TRvSystem;
    RVQCATALOGOS: TRvDataSetConnection;
    RVQOPORTUNIDADES: TRvDataSetConnection;
    sqlgeneral3: TMyQuery;
    RVDEVCOMPRAS: TRvDataSetConnection;
    RvSystem2: TRvSystem;
    RVQtend_vend: TRvDataSetConnection;
    RVQestado_cuenta: TRvDataSetConnection;
    RVQSectorVencidoDet: TRvDataSetConnection;
    RVQTarjetaTelefonos: TRvDataSetConnection;
    RVQTarjetaContactos: TRvDataSetConnection;
    sqlclientes: TMyQuery;
    RVQTarjetaCliente: TRvDataSetConnection;
    RVQpagosxlinea: TRvDataSetConnection;
    RVDpagosxlinea2: TRvDataSetConnection;
    RVQcancelados: TRvDataSetConnection;
    RVQcancelados2: TRvDataSetConnection;
    RVQPedidosPendientes: TRvDataSetConnection;
    dsFolder: TDataSource;
    dsItem: TDataSource;
    ppReport: TppReport;
    ppDesigner1: TppDesigner;
    ppReportExplorer1: TppReportExplorer;
    TblFolder: TMyTable;
    TblItem: TMyTable;
    ppFolder: TppDBPipeline;
    ppItem: TppDBPipeline;
    dsTable: TDataSource;
    tbltable: TMyTable;
    ppTable: TppDBPipeline;
    DSField: TDataSource;
    tblField: TMyTable;
    ppField: TppDBPipeline;
    DSJoin: TDataSource;
    tblJoin: TMyTable;
    ppJoin: TppDBPipeline;
    ppDataDictionary1: TppDataDictionary;
    RVQantiguedadxlineas: TRvDataSetConnection;
    ppsqlgeneral: TppDBPipeline;
    ppsqlgeneral2: TppDBPipeline;
    DSsqlgeneral2: TDataSource;
    DssqlGeneral: TDataSource;
    RVQTarjetaCliente1: TRvDataSetConnection;
    sqlclientesidpago: TIntegerField;
    sqlclientesidfactura: TStringField;
    sqlclientesidremicion: TIntegerField;
    sqlclientesidpedido: TIntegerField;
    sqlclientesidpago_afecta: TIntegerField;
    sqlclientesFechaAlta: TDateField;
    sqlclientescargo: TFloatField;
    sqlclientesabono: TFloatField;
    sqlclientesrestante: TFloatField;
    sqlclientesnotas: TMemoField;
    sqlclientesTipoPago: TStringField;
    sqlclientesmovimiento: TIntegerField;
    sqlclientesFechaVence: TDateField;
    sqlclientesidcliente: TIntegerField;
    sqlclientescalculado: TFloatField;
    DSclientes: TDataSource;
    RVQPedidosPendientes2: TRvDataSetConnection;
    RVQPedidosPendientes3: TRvDataSetConnection;
    RVQinventariosxfecha: TRvDataSetConnection;
    DS1: TDataSource;
    DS2: TDataSource;
    DS3: TDataSource;
    rddsclientesfactura: TRvDataSetConnection;
    sqlClientesFact: TMyQuery;
    RVQFacturaRejilla: TRvDataSetConnection;
    ConceptoBoleta: TLMDTextEditDlg;
    DS4: TDataSource;
    sqlgeneral4: TMyQuery;
    sqlgeneral6: TMyQuery;
    sqlgeneral5: TMyQuery;
    sqlgeneral7: TMyQuery;
    DS5: TDataSource;
    sqlgeneral8: TMyQuery;
    PrinterDlg: TPrintDialog;
    RVQServicios: TRvDataSetConnection;
    RVconcentrado_alarmas: TRvDataSetConnection;
    RVconcentrado_alarmas2: TRvDataSetConnection;
    RVQOrdenesPendientes: TRvDataSetConnection;
    RVQOrdenesAtrasadas: TRvDataSetConnection;
    SqlTelefonosMarcar: TMyQuery;
    RvRenderPDF1: TRvRenderPDF;
    sqlgeneral1: TMyQuery;
    rvclie: TRvDataSetConnection;
    rvcol: TRvDataSetConnection;
    rvtrafic: TRvDataSetConnection;
    rvopnclo: TRvDataSetConnection;
    DSsqlgeneral3: TDataSource;
    DSsqlgeneral4: TDataSource;
    ppsqlgeneral3: TppDBPipeline;
    ppsqlgeneral4: TppDBPipeline;
    SqlDetalle: TMyQuery;
    ppEmpresa: TppDBPipeline;
    DSempresa: TDataSource;
    sqlDatosEmpresa: TMyQuery;
    sqlDatosEmpresanombre: TStringField;
    sqlDatosEmpresadireccion: TStringField;
    sqlDatosEmpresarfctel: TStringField;
    RvNDRWriter1: TRvNDRWriter;
    sqlSinAtender: TMyQuery;
    sqlEnAtencion: TMyQuery;
    sqlEnEspera: TMyQuery;
    sqlfolios: TMyQuery;
    RVDSskalarmas: TRvDataSetConnection;
    RVDSDetalle: TRvDataSetConnection;
    RVDSCliente: TRvDataSetConnection;
    RVDSEmpresa: TRvDataSetConnection;
    RVPresupDet: TRvDataSetConnection;
    RVPresupHead: TRvDataSetConnection;
    RVPresupPar: TRvDataSetConnection;
    RVPresupTot: TRvDataSetConnection;
    RVAuditoriaAntXLinea: TRvDataSetConnection;
    RVDSTrafNotas: TRvDataSetConnection;
    ExtraOptions1: TExtraOptions;
    ppParameterList1: TppParameterList;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppLabel11: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel81: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel45: TppLabel;
    ppDBText38: TppDBText;
    ppLabel46: TppLabel;
    ppDBText39: TppDBText;
    ppLine4: TppLine;
    ppLabel43: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppLabel44: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLine5: TppLine;
    ppLabel80: TppLabel;
    ppLabel79: TppLabel;
    ppLabel83: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText41: TppDBText;
    ppDBText40: TppDBText;
    ppDBText77: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    raCodeModule2: TraCodeModule;
    raCodeModule1: TraCodeModule;
    DSsqlgeneral5: TDataSource;
    ppsqlgeneral5: TppDBPipeline;
    sqlDatosEmpresarfc: TStringField;
    sqlDatosEmpresaciudad: TStringField;
    sqlDatosEmpresaestado: TStringField;
    sqlDatosEmpresaCalle: TStringField;
    sqlDatosEmpresaNumero: TStringField;
    sqlDatosEmpresaColonia: TStringField;
    sqlDatosEmpresaCP: TStringField;
    sqlDatosEmpresatelefono: TStringField;
    ppParameterList2: TppParameterList;
    ppReport2: TppReport;
    ppTitleBand4: TppTitleBand;
    ppLabel82: TppLabel;
    ppLabel84: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppMemo1: TppMemo;
    ppImage1: TppImage;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel97: TppLabel;
    ppLine8: TppLine;
    ppLabel98: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel99: TppLabel;
    ppLine20: TppLine;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLabel108: TppLabel;
    ppLine28: TppLine;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppDetailBand4: TppDetailBand;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppMemo2: TppMemo;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppMemo3: TppMemo;
    ppLabel119: TppLabel;
    ppLine39: TppLine;
    ppMemo4: TppMemo;
    ppMemo5: TppMemo;
    myCheckBox1: TmyCheckBox;
    myCheckBox5: TmyCheckBox;
    myCheckBox2: TmyCheckBox;
    myCheckBox3: TmyCheckBox;
    raCodeModule4: TraCodeModule;
    dsFE: TDataSource;
    ppFE: TppDBPipeline;
    conexionFE: TADOConnection;
    sqlFE: TADOQuery;
    IniFile: TLMDIniCtrl;
    sqlADO1: TADOQuery;
    ppsqlgeneral6: TppDBPipeline;
    DSsqlgeneral6: TDataSource;
    sqlDatosEmpresanumint: TStringField;
    sqlDatosEmpresareferencia: TStringField;
    ppParameterList3: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDetailBand5: TppDetailBand;
    ppDBText78: TppDBText;
    ppLabel120: TppLabel;
    ppDBText79: TppDBText;
    ppLabel121: TppLabel;
    ppDBText80: TppDBText;
    ppLabel122: TppLabel;
    ppDBText81: TppDBText;
    ppLabel123: TppLabel;
    ppDBText82: TppDBText;
    ppLabel124: TppLabel;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppLabel127: TppLabel;
    ppDBText86: TppDBText;
    ppLabel128: TppLabel;
    ppDBText87: TppDBText;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppDBText88: TppDBText;
    ppLabel131: TppLabel;
    ppDBText89: TppDBText;
    ppLabel125: TppLabel;
    ppDBText90: TppDBText;
    ppLabel126: TppLabel;
    ppLabel133: TppLabel;
    ppDBText94: TppDBText;
    ppLabel134: TppLabel;
    ppDBText95: TppDBText;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDBText96: TppDBText;
    procedure sqlclientesCalcFields(DataSet: TDataSet);
    procedure sqlclientesAfterClose(DataSet: TDataSet);
    procedure sqlclientesAfterOpen(DataSet: TDataSet);
    procedure sqlgeneralAfterOpen(DataSet: TDataSet);
    procedure sqlgeneralAfterClose(DataSet: TDataSet);
    procedure sqlgeneralAfterPost(DataSet: TDataSet);
    procedure uarios(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure conexionFEBeforeConnect(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    temp:double;
    ban:integer;
    sqlCuentasOpenClose:TMyQuery;
  end;

var
  DMREPORTES: TDMREPORTES;

implementation

uses Udm, Umoduloreportes, Urepdetalle, Urecursos, Umonitoreo;

{$R *.dfm}

procedure TDMREPORTES.sqlclientesCalcFields(DataSet: TDataSet);
begin
if sqlclientes.Bof = true then
  temp := 0;
temp:=temp + sqlclientescargo.AsFloat;
temp:=temp - sqlclientesabono.AsFloat;
sqlclientescalculado.AsFloat:=temp;
end;

procedure TDMREPORTES.sqlclientesAfterClose(DataSet: TDataSet);
begin
temp:=0;
end;

procedure TDMREPORTES.sqlclientesAfterOpen(DataSet: TDataSet);
begin
temp:=0;
end;

procedure TDMREPORTES.sqlgeneralAfterOpen(DataSet: TDataSet);
var i:integer;
begin
for i:=0 to screen.FormCount - 1 do
if screen.Forms[i].Name = 'frmmoduloreportes' then
  begin
    if (screen.Forms[i] as Tfrmmoduloreportes).GRgeneral.Showing then
      (screen.Forms[i] as Tfrmmoduloreportes).GRView.DataController.CreateAllItems;
  end;
end;

procedure TDMREPORTES.sqlgeneralAfterClose(DataSet: TDataSet);
var i:integer;
begin
for i:=0 to screen.FormCount - 1 do
if screen.Forms[i].Name = 'frmmoduloreportes' then
  begin
    if (screen.Forms[i] as Tfrmmoduloreportes).GRgeneral.Showing then
      (screen.Forms[i] as Tfrmmoduloreportes).GRView.ClearItems;
  end;
end;


procedure TDMREPORTES.sqlgeneralAfterPost(DataSet: TDataSet);
var i:integer;
begin
for i:=0 to screen.FormCount - 1 do
  if screen.Forms[i].Name = 'frmmoduloreportes' then
     begin
     if ((screen.Forms[i] as Tfrmmoduloreportes).GRgeneral.Showing) and ((screen.Forms[i] as Tfrmmoduloreportes).TabCentral2.ActivePageIndex = 8) then
       begin
       if (screen.Forms[i] as Tfrmmoduloreportes).GRview.Columns[(screen.Forms[i] as Tfrmmoduloreportes).GRview.Controller.FocusedColumnIndex].Caption = 'comentarios' then
          begin
          if dmreportes.DssqlGeneral.DataSet.FieldByName('comentarios').AsString <> '' then
          querys('Update sk_alarmas set comentarios='+quotedstr(dmreportes.DssqlGeneral.DataSet.FieldByName('comentarios').AsString)+
                 ' where id='+quotedstr(dmreportes.DssqlGeneral.DataSet.FieldByName('alarma').AsString), 1, dmreportes.sqlgeneral6);
          end;
      end;
   end;
end;

procedure TDMREPORTES.uarios(Sender: TObject);
begin
sqlCuentasOpenClose := tmyquery.Create(self);
sqlCuentasOpenClose.Connection := dmaccesos.conexion;
end;

procedure TDMREPORTES.DataModuleDestroy(Sender: TObject);
begin
LiberarMemoria;
end;

procedure TDMREPORTES.conexionFEBeforeConnect(Sender: TObject);
var ip, bd, usuario, password:string;
begin

   ip := IniFile.ReadString('CONEXION', 'Server', '');
   bd := IniFile.ReadString('CONEXION', 'Data Base', '');
   usuario := IniFile.ReadString('CONEXION', 'User', '');
   password := IniFile.ReadString('CONEXION', 'Password', '');

   dmreportes.conexionFE.ConnectionString := 'Provider=SQLNCLI.1;Password='+password+
                               ';Persist Security Info=True;User ID='+usuario+
                               ';Initial Catalog='+bd+';Data Source='+ip;         
end;

end.


