{///////////////////////////////////////////////////////////////////////////////
2009/04/02 dalyla correcion en edicion
2009/02/05 dalyla enabled en el alta y edicion
}///////////////////////////////////////////////////////////////////////////////
unit UEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLstBox, ExtCtrls, RzPanel, Mask, RzEdit,
  RzLabel, ActnList, DB, DBAccess, MyAccess;

type
  Tfrmempresas = class(TForm)
    pfondo: TRzPanel;
    lista: TRzListBox;
    btnok: TRzBitBtn;
    btncerrar: TRzBitBtn;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btneditar: TRzBitBtn;
    rgconfiguracion: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edserver: TRzEdit;
    edbd: TRzEdit;
    edusuario: TRzEdit;
    edpass: TRzEdit;
    edrepass: TRzEdit;
    ActionList1: TActionList;
    Action1: TAction;
    RzLabel6: TRzLabel;
    edconexion: TRzEdit;
    btncancelar: TRzBitBtn;
    btnProbar: TRzBitBtn;
    conexion: TMyConnection;
    RzLabel7: TRzLabel;
    edpuerto: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure listaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnokClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure btnProbarClick(Sender: TObject);
  private
    procedure limpiar;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmempresas: Tfrmempresas;
  empresa:string;

implementation

uses Urecursos, Udmrep, Udm, LoginWindow_U;

{$R *.dfm}

procedure Tfrmempresas.FormShow(Sender: TObject);
var servers:string; s:TStringList; i:integer;
begin
pfondo.Height := 145;
  with dmaccesos do
  begin
    s := TStringList.Create;
    servers := IniFile.ReadString('CONEXIONES', 'Servers', '');
    DividirCadenaPorDelimitador_Split(#44, servers, s);
    for i:= 0 to s.Count-1 do
      begin
      lista.Add(s.Strings[i]);
      end;
  end;
end;

procedure Tfrmempresas.listaClick(Sender: TObject);
begin
with dmaccesos do
  begin
  empresa:=lista.SelectedItem;
  edconexion.Text := lista.SelectedItem;
  edServer.text   := IniFile.ReadString('CONEXION_'+empresa, 'ipadd', '');
  edbd.text := IniFile.ReadString('CONEXION_'+empresa, 'bd', '');
  edusuario.Text := IniFile.ReadString('CONEXION_'+empresa, 'usuario', '');
  edpass.text := IniFile.ReadString('CONEXION_'+empresa, 'pass', '');
  edrepass.Text := IniFile.ReadString('CONEXION_'+empresa, 'repass', '');
  edpuerto.Text := IniFile.ReadString('CONEXION_'+empresa, 'puerto', '');
  end;
end;

procedure Tfrmempresas.btncerrarClick(Sender: TObject);
begin
  close;
end;

procedure Tfrmempresas.btnokClick(Sender: TObject);
begin
with dmaccesos do
    begin
    IniFile.WriteString('CONEXION', 'ipadd', IniFile.ReadString('CONEXION_'+lista.Items.Strings[lista.itemindex], 'ipadd', ''));
    IniFile.WriteString('CONEXION', 'bd', IniFile.ReadString('CONEXION_'+lista.Items.Strings[lista.itemindex], 'bd', ''));
    IniFile.WriteString('CONEXION', 'usuario', IniFile.ReadString('CONEXION_'+lista.Items.Strings[lista.itemindex], 'usuario', ''));
    IniFile.WriteString('CONEXION', 'pass', IniFile.ReadString('CONEXION_'+lista.Items.Strings[lista.itemindex], 'pass', ''));
    IniFile.WriteString('CONEXION', 'repass', IniFile.ReadString('CONEXION_'+lista.Items.Strings[lista.itemindex], 'repass', ''));
    IniFile.WriteString('CONEXION', 'puerto', IniFile.ReadString('CONEXION_'+lista.Items.Strings[lista.itemindex], 'puerto', ''));
    end;
  close;
end;

procedure Tfrmempresas.Action1Execute(Sender: TObject);
begin
rgconfiguracion.Visible := true;
pfondo.Height := 360;
end;

procedure Tfrmempresas.limpiar;
begin
edserver.text := '';
edbd.text := '';
edusuario.text := '';
edpass.text := '';
edrepass.text := '';
edpuerto.text := '';
end;

procedure Tfrmempresas.btnaltaClick(Sender: TObject);
var servers:string;
begin
if btnalta.Caption = 'A&lta' then
  begin
  limpiar;
  habilita(true);
  edconexion.SetFocus;
  btnalta.Caption := '&Guardar';
  btneditar.enabled := false;
  btnborrar.enabled := false;
  end
else
  begin
  if edpass.Text <> edrepass.Text then
    begin
    application.MessageBox('El password y la confirmacion de password no coinciden', 'Atencion', MB_ICONINFORMATION);
    edpass.text := '';
    edrepass.text := '';
    edpass.SetFocus;
    exit;
    end;

  if not (edconexion.Text <> '') and (edserver.Text <> '') and (edbd.Text <> '') and (edusuario.Text <> '') and (edpass.Text <> '') and (edrepass.Text <> '')  then
    begin
    application.MessageBox('Faltan Datos', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;

  with dmaccesos do
    begin
    servers := IniFile.ReadString('CONEXIONES', 'Servers', '');
    IniFile.WriteString('CONEXIONES', 'Servers', servers + ',' + edconexion.text  );
    IniFile.WriteString('CONEXION_' + edconexion.text, 'ipadd', edserver.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'bd', edbd.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'usuario', edusuario.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'pass', edpass.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'repass', edrepass.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'puerto', edpuerto.text);
    lista.Add(edconexion.text);
    btnalta.Caption := 'A&lta';
    btneditar.enabled := true;
    btnborrar.enabled := true;
    habilita(false);
    end;
  end;
end;

procedure Tfrmempresas.btncancelarClick(Sender: TObject);
begin
limpiar;
habilita(false);
rgconfiguracion.Visible := false;
pfondo.Height := 145;
end;

procedure Tfrmempresas.btnborrarClick(Sender: TObject);
var i, b:integer;  cad:string;
begin
b:= -1;
with dmaccesos do
  begin
  for i := 0 to lista.Count-1 do
    begin
    if lista.Items.Strings[i] = empresa then
      begin
      b := i;
      IniFile.EraseSection('CONEXION_'+empresa);
      end
    else
      cad := cad +lista.Items.Strings[i] + ',';
    end;
  lista.Delete(b);
  Delete(cad, length(cad), 1);
  IniFile.WriteString('CONEXIONES', 'Servers', cad );
  end;
end;

procedure Tfrmempresas.btneditarClick(Sender: TObject);
begin
if btneditar.Caption = '&Editar' then
  begin               
  btneditar.Caption := '&Guardar';
  btnalta.enabled := false;
  btnborrar.enabled := false;
  habilita(true);
  edconexion.SetFocus;
  end
else
  begin
  if edpass.Text <> edrepass.Text then
    begin
    application.MessageBox('El password y la confirmacion de password no coinciden', 'Atencion', MB_ICONINFORMATION);
    edpass.text := '';
    edrepass.text := '';
    edpass.SetFocus;
    exit;
    end;

  if not (edconexion.Text <> '') and (edserver.Text <> '') and (edbd.Text <> '') and (edusuario.Text <> '') and (edpass.Text <> '') and (edrepass.Text <> '')  then
    begin
    application.MessageBox('Faltan Datos', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;

  with dmaccesos do
    begin
    IniFile.WriteString('CONEXION_' + edconexion.text, 'ipadd', edserver.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'bd', edbd.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'usuario', edusuario.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'pass', edpass.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'repass', edrepass.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'repass', edrepass.text);
    IniFile.WriteString('CONEXION_' + edconexion.text, 'puerto', edpuerto.text);
    btneditar.Caption := '&Editar';
    btnalta.enabled := true;
    btnborrar.enabled := true;
    habilita(false);
    end;
  end;

end;

procedure Tfrmempresas.btnProbarClick(Sender: TObject);
begin
  try
  conexion.Server := edserver.text;
  conexion.Database := edbd.Text;
  conexion.Username := edusuario.Text;
  conexion.Password := edpass.Text;
  conexion.Port := strtoint(edpuerto.Text);
  conexion.Connect;
  application.MessageBox('Conexion Satistactoria', 'Atencion', MB_ICONINFORMATION);
  except
  application.MessageBox('No se conecto a la Base de Datos', 'Atencion', MB_ICONERROR);
  end;
end;

procedure Tfrmempresas.habilita(hab:boolean);
begin
edconexion.Enabled := hab;
edserver.Enabled := hab;
edbd.Enabled := hab;
edusuario.Enabled := hab;
edpass.Enabled := hab;
edrepass.Enabled := hab;
edpuerto.Enabled := hab;
end;

End.
