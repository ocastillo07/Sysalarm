unit UMensajeCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, RzEdit, ExtCtrls, RzPanel;

type
  TfrmMensajeCliente = class(TForm)
    panel1: TRzPanel;
    panel2: TRzPanel;
    memo1: TRzMemo;
    btnguardar: TRzBitBtn;
    edt: TRzLabel;
    btnok: TRzBitBtn;
    procedure btnguardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor inicializa(const tipo,mensaje :string);
  end;

var
  frmMensajeCliente: TfrmMensajeCliente;

implementation

uses Uprincipal;

{$R *.dfm}

constructor TfrmMensajeCliente.inicializa(const tipo,mensaje :string);
begin
if tipo = '1' then
 begin
    panel1.Visible := false;
    panel2.Visible := true;
    self.AutoSize := true;
    memo1.Text := mensaje;
 end else
  begin
    panel2.Visible := false;
    panel1.Visible := true;
    if Length(mensaje) > 16 then
       edt.Font.Size := 14;
    edt.Caption := mensaje;
    
    self.AutoSize := true;
  end;
end;

procedure TfrmMensajeCliente.btnguardarClick(Sender: TObject);
begin
close;
end;

procedure TfrmMensajeCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

end.
