{-------------------------------------------------------------------------------
2008/12/29 dalyla sqlviewer en mdichild
2008/01/21 dalylaponente tcp client
--------------------- com------------------------------------------------------}
unit Udm;

interface

uses
  SysUtils, Classes,MyBuilderClient, DASQLMonitor, MySQLMonitor, RzCommon,
  DB, MemDS, DBAccess, MyAccess, ImgList, LoginWindow_U, Dialogs, StrUtils,
  Controls, UCBase, RpDefine, RpRave, RpCon, RpConDS, RpBase, RpSystem,
  LMDCustomComponent, LMDIniCtrl, cxStyles, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, Variants, Forms, windows;
   {ZAbstractRODataset, ZAbstractDataset,   ZDataset,}
type
  TDMAccesos = class(TDataModule)
    conexion: TMyConnection;
    ilopciones: TImageList;
    sqlgeneral: TMyQuery;
    iledicion: TImageList;
    frmctr: TRzFrameController;
    sqlmonitor: TMySQLMonitor;
    MyBuilder: TMyBuilder;
    IBarraHerramientas: TImageList;
    IniFile: TLMDIniCtrl;
    cxStyleRepository1: TcxStyleRepository;
    normal: TcxStyle;
    dentro: TcxStyle;
    Client: TIdTCPClient;
    procedure sqlmonitorSQL(Sender: TObject; Text: String;
      Flag: TDATraceFlag);
    procedure conexionAfterConnect(Sender: TObject);
    procedure conexionError(Sender: TObject; E: EDAError;
      var Fail: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAccesos: TDMAccesos;

implementation

uses Uprincipal, USqlViewer, Urecursos;

{$R *.dfm}

procedure TDMAccesos.sqlmonitorSQL(Sender: TObject; Text: String;
  Flag: TDATraceFlag);
var i:integer;
begin
for i:=0 to screen.FormCount - 1 do
if screen.Forms[i].Name = 'Viewer' then
  begin
    if (screen.Forms[i] as TViewer).Showing then
      begin
      (screen.Forms[i] as TViewer).memo.Text := (screen.Forms[i] as TViewer).memo.Text+text;
      (screen.Forms[i] as TViewer).memo.Lines.Add('');
      (screen.Forms[i] as TViewer).memo.Lines.Add('');
      end;
  end;
end;

procedure TDMAccesos.conexionAfterConnect(Sender: TObject);
begin
try       
//LoginWindow.lblconexion.Caption := 'Conectado a:'+conexion.Server;
// Application.MessageBox('Cierre las ventanas y vuelva a Intentar', 'Conexion Satisfactoria', MB_ICONHAND);
except
self.Tag:=1;
end;
end;

procedure TDMAccesos.conexionError(Sender:TObject; E:EDAError; var Fail:Boolean);
begin
if conexion.Connected = false then
   begin
   if Application.MessageBox(pchar('Se perdio la conexion a la Base de Datos. '+#13+'Desea volver a reintentar?'), 'Conexion', MB_ICONEXCLAMATION+MB_RETRYCANCEL) = idretry then
  //   begin
     conexion.Connect;
     {if conexion.Connected = true then
       begin
       //querys('Select curtime()', 0, sqlgeneral);
       Application.MessageBox('Cierre las ventanas y vuelva a Intentar', 'Conexion Satisfactoria', MB_ICONHAND);
       end;}
   {  end
   else
     Application.MessageBox('Cierre el sistema y vuelva a intentar o consulte al Administrador del Sistema', 'Desconexion a Base de Datos', MB_ICONHAND);
    }
   end;
//   raise e;
end;

procedure TDMAccesos.DataModuleCreate(Sender: TObject);
begin
conexion.Connected := false;
end;

end.
