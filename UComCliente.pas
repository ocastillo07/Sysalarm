{///////////////////////////////////////////////////////////////////////////////
Creado por Dalila
}///////////////////////////////////////////////////////////////////////////////
unit UComCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TfrmComCliente = class(TForm)
    Client: TIdTCPClient;
    sqlgeneral: TMyQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
   {
 TClientHandleThread = class(TThread)
                       private
                         CB: TCommBlock;
                         procedure HandleInput;
                       protected
                         procedure Execute; override;
                       end;         }

var
  frmComCliente: TfrmComCliente;
//  ClientHandleThread: TClientHandleThread;   // variable (type see above)

implementation

uses Udm;

{$R *.dfm}
            {
procedure TClientHandleThread.HandleInput;
var telefono:string;
begin
  if CB.Command = 'MESSAGE' then
    begin

    //cb.msg '9Comunicando Telefono: *'+telefono+' A Extension:'+Extension;
    if AnsiLeftStr (cb.msg, 1) = 9 then
      begin
      telefono := Delete(cb.msg, 0, 23);
      telefono := telefono + AnsiLeftStr (cb.msg, ansipos('*', cb.msg));
      querys('Select idtel, procedencia from telefonos where telefono like "%'+AnsiReplaceText(telefono,'-','')+'%"');
      MessageDlg ('"Server" sends you this message:'+#13+CB.Msg, mtInformation, [mbOk], 0);
      end;
    ClientFrmMain.IncomingMessages.Lines.Add (CB.MyUserName + ': ' + CB.Msg);
    end
  else
  if CB.Command = 'DIALOG' then
    //MessageDlg ('"'+CB.MyUserName+'" sends you this message:'+#13+CB.Msg, mtInformation, [mbOk], 0)
    MessageDlg ('"Server" sends you this message:'+#13+CB.Msg, mtInformation, [mbOk], 0)
  else  // unknown command
    MessageDlg('Unknown command "'+CB.Command+'" containing this message:'+#13+CB.Msg, mtError, [mbOk], 0);
end;

procedure TClientHandleThread.Execute;
begin
  while not Terminated do
  begin
    if not ClientFrmMain.Client.Connected then
      Terminate
    else
    try
      ClientFrmMain.Client.ReadBuffer(CB, SizeOf (CB));
      Synchronize(HandleInput);
    except
    end;
  end;
end;

{
procedure TClientFrmMain.CBClientActiveClick(Sender: TObject);
begin
  if CBClientActive.Checked then
  begin
    try
      Client.Connect(10000);  // in Indy < 8.1 leave the parameter away

      ClientHandleThread := TClientHandleThread.Create(True);
      ClientHandleThread.FreeOnTerminate:=True;
      ClientHandleThread.Resume;
    except
      on E: Exception do MessageDlg ('Error while connecting:'+#13+E.Message, mtError, [mbOk], 0);
    end;
  end
  else
  begin
    ClientHandleThread.Terminate;
    Client.Disconnect;
  end;

  ButtonSend.Enabled := Client.Connected;
  CBClientActive.Checked := Client.Connected;
end;
}

procedure TfrmComCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

End.
