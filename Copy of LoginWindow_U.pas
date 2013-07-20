{///////////////////////////////////////////////////////////////////////////////
Ultima modificacion Dalila Robledo

2007/10/23 Dalila - Mostrar boton configuracion con F9
}///////////////////////////////////////////////////////////////////////////////
unit LoginWindow_U;

interface

uses
{$IFDEF Ver150}
  Variants,
{$ENDIF}
{$IFDEF Ver140}
  Variants,
{$ENDIF}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, math, UCXPMenu, UCXPStyle, RzLaunch, RzButton,
  RzLabel, ActnList;

type
  TLoginWindow = class(TForm)
    PTop: TPanel;
    ImgTop: TImage;
    PLeft: TPanel;
    imgLeft: TImage;
    PBottom: TPanel;
    ImgBottom: TImage;
    Panel1: TPanel;
    PLogin: TPanel;
    LbUsuario: TLabel;
    LbSenha: TLabel;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    btOK: TBitBtn;
    BtCancela: TBitBtn;
    lbEsqueci: TLabel;
    UCXPStyle: TUCXPStyle;
    btnconfig: TRzBitBtn;
    Lanzador: TRzLauncher;
    lblconexion: TRzLabel;
    lblbd: TRzLabel;
    ActionList1: TActionList;
    AMostrar: TAction;
    btnCuliacan: TRzBitBtn;
    btnMexicali: TRzBitBtn;
    Action1: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditUsuarioChange(Sender: TObject);
    procedure EditUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EditUsuarioEnter(Sender: TObject);
    procedure EditUsuarioExit(Sender: TObject);
    procedure EditSenhaEnter(Sender: TObject);
    procedure EditSenhaExit(Sender: TObject);
    procedure btnconfigClick(Sender: TObject);
    procedure AMostrarExecute(Sender: TObject);
    procedure btnCuliacanClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure btnMexicaliClick(Sender: TObject);
  private

  end;

var
  LoginWindow: TLoginWindow;

implementation
uses UCBase, Uprincipal, Udm;
{$R *.dfm}
function GetLocalComputerName: string;              //BGM
var                                                 //BGM
  Count: DWORD;                                     //BGM
  Buffer: string;                                   //BGM
begin                                               //BGM
  Count := MAX_COMPUTERNAME_LENGTH + 1;             //BGM
  SetLength(Buffer, Count);                         //BGM
  if GetComputerName(PChar(Buffer), Count) then     //BGM
    SetLength(Buffer, StrLen(PChar(Buffer)))        //BGM
  else                                              //BGM
    Buffer := '';                                   //BGM
  Result := Buffer;                                 //BGM
end;                                                //BGM

function GetLocalUserName: string;
var
  Count: DWORD;
  Buffer: string;
begin
  Count := 254;
  SetLength(Buffer, Count);
  if GetUserName(PChar(Buffer), Count) then
    SetLength(Buffer, StrLen(PChar(Buffer)))
  else
    Buffer := '';
  Result := Buffer;
end;

procedure TLoginWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //frmprincipal.scliente.Active:=true;
  //frmprincipal.SCliente.Socket.SendText('login~'+lowercase(frmprincipal.ucprincipal.CurrentUser.LoginName));  
  action := caFree;
end;

procedure TLoginWindow.BtCancelaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TLoginWindow.FormShow(Sender: TObject);
var
  x , y, w, h : Integer;
//  memo: tmemo;
begin
      
  //Agregado por Dalila
    with dmaccesos do
    begin
    conexion.Server   := IniFile.ReadString('CONEXION', 'ipadd', '');
    conexion.Database := IniFile.ReadString('CONEXION', 'bd', '');
    conexion.Username := IniFile.ReadString('CONEXION', 'usuario', '');
    conexion.Password := IniFile.ReadString('CONEXION', 'pass', '');
    end;
  //

  w := Max(ImgTop.Width, ImgLeft.Width+PLogin.Width);
  w := Max(w, ImgBottom.Width);
  h := Max(ImgLeft.Height + ImgTop.Height + ImgBottom.Height , ImgTop.Height + PLogin.Height + ImgBottom.Height);

  Width := w;
  Height := h+28;

  // Topo
  PTop.Height := ImgTop.Height;
  ImgTop.AutoSize := False;
  ImgTop.Align := alClient;
  ImgTop.Center := True;

  //Centro
  PLeft.Width := ImgLeft.Width;
  ImgLeft.AutoSize := False;
  ImgLeft.Align := alClient;
  ImgLeft.Center := True;

  //Bottom
  PBottom.Height := ImgBottom.Height;
  ImgBottom.AutoSize := False;
  ImgBottom.Align := alClient;
  ImgBottom.Center := True;

  PTop.visible := ImgTop.Picture <> nil;
  PLeft.visible :=  ImgLeft.Picture <> nil;
  PBottom.Visible := ImgBottom.Picture <> nil;

  x := (Screen.Width div 2) - (Width div 2);
  y := (Screen.Height div 2) - (Height div 2);
  top := y;
  Left := x;
  if TUserControl(Owner).Login.GetLoginName = lnUserName then EditUsuario.Text := GetLocalUserName;
  if TUserControl(Owner).Login.GetLoginName = lnMachineName then EditUsuario.Text := GetLocalComputerName;
  if TUserControl(Owner).Login.GetLoginName <> lnNone then EditSenha.SetFocus;
//  EditUsuario.Text := GetLocalComputerName;   //BGM
//  EditSenha.SetFocus;
{
memo := tmemo.Create(nil);
memo.Visible := false;
memo.Parent := pbottom;
memo.Clear;
memo.Lines.LoadFromFile(uprincipal.my_path+'msdat.dll');
lblconexion.Caption:='Servidor '+memo.Lines[0];
lblbd.Caption := 'Base de Datos '+memo.Lines[1];}
lblconexion.Caption:= 'Servidor: '+DMAccesos.IniFile.ReadString('CONEXION', 'ipadd', '');
lblbd.Caption      := 'Base de Datos: '+DMAccesos.IniFile.ReadString('CONEXION', 'bd', '');

end;

procedure TLoginWindow.EditUsuarioChange(Sender: TObject);
begin
  lbEsqueci.Enabled :=  length(EditUsuario.Text) > 0;
  if (editusuario.Text<>'')and(editsenha.Text<>'') then
     btok.Enabled:=true
  else
    btok.Enabled:=false;
end;

procedure TLoginWindow.EditUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) and (editusuario.Text<>'') then begin
   key:=#0;
   editsenha.SetFocus;
   end;
end;

procedure TLoginWindow.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
if (btok.Enabled)and(key=#13) then begin
   key:=#0;
   btok.Click;
end;
end;

procedure TLoginWindow.EditUsuarioEnter(Sender: TObject);
begin
editusuario.Color:=clInactiveCaptionText;
end;

procedure TLoginWindow.EditUsuarioExit(Sender: TObject);
begin
editusuario.Color:=clwhite;
end;

procedure TLoginWindow.EditSenhaEnter(Sender: TObject);
begin
editsenha.Color:=clInactiveCaptionText;
end;

procedure TLoginWindow.EditSenhaExit(Sender: TObject);
begin
editsenha.Color:=clwhite;
end;

procedure TLoginWindow.btnconfigClick(Sender: TObject);
begin
 DMAccesos.IniFile.IniFile := 'conexion.ini';
 lanzador.StartDir:=ExtractFilePath(Application.ExeName);
 lanzador.FileName:='configuraciones.exe';
 lanzador.Launch;
 frmprincipal.OnActivate(self);
 self.OnShow(self);
end;

procedure TLoginWindow.AMostrarExecute(Sender: TObject);
begin
btnconfig.Visible := true;
btnCuliacan.Visible := false;
btnMexicali.Visible := false;
end;

procedure TLoginWindow.btnCuliacanClick(Sender: TObject);
begin
DMAccesos.IniFile.IniFile := 'conexion2.ini';
FormShow(self);
end;

procedure TLoginWindow.Action1Execute(Sender: TObject);
begin
btnCuliacan.Visible := true;
btnMexicali.Visible := true;
end;

procedure TLoginWindow.btnMexicaliClick(Sender: TObject);
begin
DMAccesos.IniFile.IniFile := 'conexion1.ini';
FormShow(self);
end;

end.
