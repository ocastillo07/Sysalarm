//2008/02/28 dalyla zona horaria ok
unit Uautentificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton;

type
  Tfrmautentificacion = class(TForm)
    grupoa: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edusuario: TEdit;
    edpassword: TEdit;
    btnverificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    procedure btnverificarClick(Sender: TObject);
    procedure edusuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edpasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edusuarioChange(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmautentificacion: Tfrmautentificacion;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}


procedure Tfrmautentificacion.btnverificarClick(Sender: TObject);
begin
if frmprincipal.ucprincipal.VerificaLogin(edusuario.Text,edpassword.Text)=FALSE then begin
   application.MessageBox(pchar('El usuario '+edusuario.Text+' no existe o no tiene los suficientes privilegios para realizar esta operacion'),'Aviso',mb_iconinformation);
   edusuario.SetFocus;
end;
//begin
//btnverificar.ModalResult:=mrok;
//end;
end;

procedure Tfrmautentificacion.edusuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edusuario.Text<>'') then begin
key:=#0;
edpassword.SetFocus;
end;
end;

procedure Tfrmautentificacion.edpasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edpassword.Text<>'') then begin
key:=#0;
if frmprincipal.ucprincipal.VerificaLogin(edusuario.Text,edpassword.Text)=FALSE then begin
   application.MessageBox(pchar('El usuario '+edusuario.Text+' no existe o no tiene los suficientes privilegios para realizar esta operacion'),'Aviso',mb_iconinformation);
  // btnverificar.ModalResult:=mrnone;
   edusuario.SetFocus;
end
else
btnverificar.Click;
end;
end;

procedure Tfrmautentificacion.FormShow(Sender: TObject);
begin
edusuario.SetFocus;
edusuario.Text:='';
edpassword.Text:='';
//btnverificar.ModalResult:=mrnone;
end;

procedure Tfrmautentificacion.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 27 then
   btncancelar.Click;
end;

procedure Tfrmautentificacion.edusuarioChange(Sender: TObject);
begin
btnverificar.Enabled:=(length(edusuario.Text)>0)and(length(edpassword.Text)>0);
end;

procedure Tfrmautentificacion.btncancelarClick(Sender: TObject);
begin
close;
end;

end.
