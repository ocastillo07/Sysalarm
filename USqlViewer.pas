//2008/12/29 dalyla splitter y enter
unit USqlViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, ComCtrls, RzEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzSplit, MemDS, DBAccess, MyAccess, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, ToolWin, ImgList, dxPSCore,
  dxPScxGridLnk;

type
  TViewer = class(TForm)
    DSquery: TDataSource;
    sqlquery: TMyQuery;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    ilMain: TImageList;
    Splitter: TRzSplitter;
    ToolBar1: TToolBar;
    tbtnPageSetup: TToolButton;
    tbtnPreview: TToolButton;
    tbtnPrint: TToolButton;
    tbtnDesigner: TToolButton;
    ToolButton1: TToolButton;
    tbtnFullCollapse: TToolButton;
    tbtnFullExpand: TToolButton;
    memo: TRzMemo;
    pnlmain: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    btnsalir: TRzBitBtn;
    btnejecutar: TRzBitBtn;
    btnCloseQuery: TRzBitBtn;
    rejilla: TcxGrid;
    vista1: TcxGridDBTableView;
    nivel1: TcxGridLevel;
    procedure btnsalirClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure sqlqueryAfterOpen(DataSet: TDataSet);
    procedure sqlqueryAfterClose(DataSet: TDataSet);
    procedure btnejecutarClick(Sender: TObject);
    procedure tbtnPageSetupClick(Sender: TObject);
    procedure tbtnPreviewClick(Sender: TObject);
    procedure tbtnPrintClick(Sender: TObject);
    procedure tbtnDesignerClick(Sender: TObject);
    procedure tbtnFullCollapseClick(Sender: TObject);
    procedure tbtnFullExpandClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Viewer: TViewer;

implementation

uses Udm;

{$R *.dfm}

procedure TViewer.btnsalirClick(Sender: TObject);
begin
close
end;

procedure TViewer.RzBitBtn1Click(Sender: TObject);
begin
memo.text:='';
end;

procedure TViewer.sqlqueryAfterOpen(DataSet: TDataSet);
begin
vista1.DataController.CreateAllItems;
end;

procedure TViewer.sqlqueryAfterClose(DataSet: TDataSet);
begin
vista1.ClearItems;
end;

procedure TViewer.btnejecutarClick(Sender: TObject);
begin
try
  dmaccesos.sqlmonitor.Active := false;
  sqlquery.Close;
  sqlquery.SQL.Clear;
  if memo.SelText <> '' then
    sqlquery.SQL.Text:=memo.SelText
  else
    sqlquery.SQL.Text:=memo.Text;
sqlquery.Open;
dmaccesos.sqlmonitor.Active := true;
except
application.MessageBox('Error al intentar ejecutar la query','Error',mb_iconwarning);
end;
end;

procedure TViewer.tbtnPageSetupClick(Sender: TObject);
begin
 dxComponentPrinter.PageSetup(nil);
end;

procedure TViewer.tbtnPreviewClick(Sender: TObject);
begin
dxComponentPrinter.Preview(True,nil);
end;

procedure TViewer.tbtnPrintClick(Sender: TObject);
begin
  dxComponentPrinter.Print(True,nil,nil);
end;

procedure TViewer.tbtnDesignerClick(Sender: TObject);
begin
dxComponentPrinter.DesignReport(nil);
end;

procedure TViewer.tbtnFullCollapseClick(Sender: TObject);
begin
vista1.DataController.Groups.FullCollapse;
end;

procedure TViewer.tbtnFullExpandClick(Sender: TObject);
begin
vista1.DataController.Groups.FullExpand;
end;

procedure TViewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmaccesos.sqlmonitor.Active := false;
action := cafree;
end;

procedure TViewer.FormShow(Sender: TObject);
begin
dmaccesos.sqlmonitor.Active := true;
end;

procedure TViewer.btnCloseQueryClick(Sender: TObject);
begin
sqlquery.Close;
end;

end.
