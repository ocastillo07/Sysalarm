unit Urelacionborrar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzStatus, RzButton, Grids, DBGrids, DB, MemDS, DBAccess,
  MyAccess, StdCtrls, RzLabel;

type
  TfrmRelacionBorrar = class(TForm)
    dsrelacionados: TDataSource;
    dbrejilla: TDBGrid;
    RzBitBtn1: TRzBitBtn;
    lblcantidad: TRzLabel;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  constructor inicializa(query:TMyQuery);
  end;

var
  frmRelacionBorrar: TfrmRelacionBorrar;

implementation

uses Udm;

{$R *.dfm}

constructor tfrmrelacionborrar.inicializa(query:TMyQuery);
var i:integer;
begin
dsrelacionados.DataSet:=query;
lblcantidad.Caption:='Registros Encontrados:'+inttostr(query.RecordCount);
dbrejilla.Columns[0].Width:=50;
for i:=1 to dbrejilla.Columns.Count-1 do
dbrejilla.Columns[i].Width:=100;
end;

procedure TfrmRelacionBorrar.RzBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TfrmRelacionBorrar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmRelacionBorrar.FormShow(Sender: TObject);
begin
dbrejilla.SetFocus;
end;

end.
