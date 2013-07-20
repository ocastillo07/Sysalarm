unit UEnviaPromosion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzButton, StdCtrls, RzLstBox,
  RzLabel, Mask, RzEdit, RzShellDialogs;

type
  TfrmEnviaPromosion = class(TForm)
    btnenviar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    lcorreos: TRzListBox;
    mBody: TMemo;
    madjuntos: TMemo;
    edasunto: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    btnadjuntar: TRzBitBtn;
    ODadjuntos: TRzOpenDialog;
    procedure btnenviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure btnadjuntarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaPromosion: TfrmEnviaPromosion;

implementation

uses Urecursos, Udm;

{$R *.dfm}

procedure TfrmEnviaPromosion.btnenviarClick(Sender: TObject);
var origen, asunto : string; i:integer;
begin
querys('Select valor from configuraciones where concepto = "UserEmail"', 0, dmaccesos.sqlgeneral);
origen := dmaccesos.sqlgeneral.fieldbyname('valor').AsString;
asunto := edasunto.text;
for i:=0 to lcorreos.Items.Count-1 do
  begin
  send_email(origen,origen,lcorreos.Items.Strings[i],asunto,madjuntos,mbody,0);
  lcorreos.ItemIndex := i;
  end;
application.messagebox('Termino de enviar Promosion', 'Aviso',mb_iconinformation);
end;

procedure TfrmEnviaPromosion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmEnviaPromosion.RzBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TfrmEnviaPromosion.btnadjuntarClick(Sender: TObject);
begin
if ODadjuntos.Execute then
  madjuntos.Lines.Add(ODAdjuntos.FileName);
end;

end.
