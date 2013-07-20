unit about;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, RzButton, RzLabel, SysUtils, RzBckgnd;

type
  TfrmAboutBox = class(TForm)
    imgLogo: TImage;
    lblCopyright: TLabel;
    Version: TLabel;
    lblComments: TLabel;
    lblpname: TLabel;
    Shape1: TShape;
    lblAdvertencia: TLabel;
    lblCopyright2: TLabel;
    lblipserver: TLabel;
    lblMysqlServer: TLabel;
    lblso: TLabel;
    RzBitBtn1: TRzBitBtn;
    Image1: TImage;
    lbldb: TLabel;
    ldate: TRzLabel;
    RzBackground1: TRzBackground;
    lbsql: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAboutBox: TfrmAboutBox;

implementation

uses Uprincipal, Udm, Urecursos, Udmrep;

{$R *.dfm}

procedure TfrmAboutBox.FormCreate(Sender: TObject);
begin
lblMysqlServer.Caption := 'Servidor MySql: '+frmprincipal.mysql_ver;
lblipserver.Caption := 'Ip Servidor: '+ dmaccesos.conexion.server + '     Base de Datos: '+dmaccesos.conexion.Database;
lbldb.Caption := '';
lblso.caption := 'Sistema Operativo: '+ quewindows;
  lblpname.Caption := 'Administrador' + chr(13) + 'Para El Control'+ chr(13) +'De Sistemas de Alarmas';
  lblAdvertencia.Caption:= 'Advertencia:';
  ldate.Caption :=  'Ultima Modificacion: '+datetostr(FileDateToDateTime(FileAge(application.ExeName)));

  lbsql.Caption := 'Servidor' + dmreportes.IniFile.ReadString('CONEXION', 'Server', '') +
                   '  Base de Datos ' + dmreportes.IniFile.ReadString('CONEXION', 'Data Base', '');
end;

procedure TfrmAboutBox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfrmAboutBox.RzBitBtn1Click(Sender: TObject);
begin
close;
End;

end.

