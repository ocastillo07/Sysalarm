unit UNoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, RzLabel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, MemDS, DBAccess,
  MyAccess,  ComCtrls, RzButton;

type                                     {  wwrcdpnl,}
  TfrmNoClientes = class(TForm)
    dsNoClientes: TDataSource;
    sqlNoClientes: TMyQuery;
    VNoClientes: TcxGridDBTableView;
    LNoClientes: TcxGridLevel;
    GNoClientes: TcxGrid;
    CxCuenta: TcxGridDBColumn;
    cxnombre: TcxGridDBColumn;
    cxdir: TcxGridDBColumn;
    cxcp: TcxGridDBColumn;
    CxGiro: TcxGridDBColumn;
    CxSector: TcxGridDBColumn;
    sqlgeneral: TMyQuery;
    btnSalir: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNoClientes: TfrmNoClientes;

implementation

uses Udm, Urecursos;

{$R *.dfm}

procedure TfrmNoClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmNoClientes.FormShow(Sender: TObject);
begin
sqlnoclientes.Close;
sqlnoclientes.open;
if sqlnoclientes.RecordCount = 0 then
 begin
  application.MessageBox('No existe ningun No cliente','Aviso',mb_iconinformation);
  close;
 end;
end;

procedure TfrmNoClientes.BtnSalirClick(Sender: TObject);
begin
close;
end;

end.
