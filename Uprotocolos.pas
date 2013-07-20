unit Uprotocolos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzButton, ExtCtrls, DBCtrls,
  RzDBNav, StdCtrls, Mask, RzEdit, RzDBEdit, RzDBBnEd, RzLabel, RzBtnEdt;

type
  TfrmProtocolos = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    tblprotocolos: TMyTable;
    sqlgeneral: TMyQuery;
    DSprotocolos: TDataSource;
    RzLabel3: TRzLabel;
    tblprotocolosidprotocolo: TIntegerField;
    tblprotocolosprotocolo: TStringField;
    tblprotocolosdescripcion: TMemoField;
    edclave: TRzButtonEdit;
    eddescripcion: TRzDBMemo;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure tblprotocolosBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProtocolos: TfrmProtocolos;

implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas;

{$R *.dfm}

procedure TfrmProtocolos.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure TfrmProtocolos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
    with frmbusquedas do
      begin
      query:='Select idprotocolo, protocolo, descripcion, usuario as Usuario,fecha as Fecha,hora as Hora From protocolos order by idprotocolo';
      campo_retorno:='idprotocolo';
      campo_busqueda:='protocolo';
      tblorigen := 'protocolos';
      lbldesc.Caption:='Busqueda por Protocolo:';
      ShowModal;
      if resultado <> '' then
            begin
             tblprotocolos.Active:=true;
             edclave.Text:=resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
       end;
    end;
end;

procedure TfrmProtocolos.buscarlocate;
begin
tblprotocolos.Active:=true;
if tblprotocolos.Locate('idprotocolo',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Protocolo no Existe','Información',mb_ok+mb_iconinformation);
    tblprotocolos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
procedure TfrmProtocolos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo + 1
    querys('select max(idprotocolo) from protocolos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    edclave.Enabled:=false;
    //pone la tabla de protocolos en modo de insercion
    tblprotocolos.Active:=true;
    tblprotocolos.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    ednombre.Enabled:=true;
    eddescripcion.Enabled:=true;
    ednombre.SetFocus;
    navegador.Enabled:=false;
  end
 else
    begin
    if ExisteNombre(ednombre,'select protocolo from protocolos where idprotocolo<>'+edclave.Text+' and protocolo='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
      exit;
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta un Protocolo';
      btncancelar.Caption:='&Cerrar';
      btncancelar.Hint:='Cerrar esta Ventana';
      btnalta.ImageIndex:=5;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      frmprincipal.ucprincipal.Log('Dio de Alta a un Protocolo '+ednombre.text,1);
      //guarda los datos
      tblprotocolos.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update protocolos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idprotocolo='+edclave.Text,1,sqlgeneral);

      tblprotocolos.Active:=false;
      ednombre.Enabled:=false;
      eddescripcion.Enabled:=false;
      edclave.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
   end;
end;

procedure TfrmProtocolos.btnborrarClick(Sender: TObject);
begin
querys('select idprotocolo from clientes where idprotocolo='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Protocolo esta siendo usado por un Cliente y no podra ser eliminado hasta que se borre o haga referencia a otro!','Cuidado',mb_ok+mb_iconinformation)
else
  begin
  querys('select idprotocolo from alarmas_tipos where idprotocolo='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
     application.MessageBox('Este Protocolo esta siendo usado por un Tipo de Alarma y no podra ser eliminado hasta que se borre o haga referencia a otro!','Cuidado',mb_ok+mb_iconinformation)
  else
    if application.MessageBox('Estas Seguro que deseas borrar este Protocolo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      begin
      frmprincipal.ucprincipal.Log('Elimino el Protocolos'+tblprotocolosprotocolo.asstring,3);
      tblprotocolos.Delete;
      application.MessageBox('Eliminacion del Protocolo Exitosa','Información',mb_ok);
      tblprotocolos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblprotocolos.Active:=false;
      edclave.text:='';
      edclave.SetFocus;
      end;
  end;
end;

procedure TfrmProtocolos.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     eddescripcion.Enabled:=true;
     edclave.Enabled:=false;
     tblprotocolos.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select protocolo from protocolos where idprotocolo<>'+edclave.Text+' and protocolo='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Protocolo actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     eddescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito Protocolo '+tblprotocolosprotocolo.AsString,2);
     //Guarda los cambios
     tblprotocolos.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update protocolos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idprotocolo='+edclave.Text,1,sqlgeneral);
     tblprotocolos.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmProtocolos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblprotocolos.Cancel;
     tblprotocolos.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Protocolo Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Protocolo';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
       eddescripcion.Enabled:=false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmProtocolos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DSprotocolos.dataset.fieldbyname('idprotocolo').AsString;
end;

procedure TfrmProtocolos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblprotocolos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
end;
end;

procedure TfrmProtocolos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmProtocolos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmProtocolos.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmProtocolos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if key='.' then
 key:=#0;
 key:=ValidaNumeros(key, false);
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
   end;

   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure TfrmProtocolos.tblprotocolosBeforePost(DataSet: TDataSet);
begin
tblprotocolosidprotocolo.AsString:=edclave.Text;
end;

procedure TfrmProtocolos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
release;
end;

end.
