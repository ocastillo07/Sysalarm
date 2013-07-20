unit Umotivo_cancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt, ExtCtrls,
  DBCtrls, RzDBNav, StdCtrls, Mask, RzDBEdit, RzButton, RzLabel;

type
  Tfrmmotivos_cancel = class(TForm)
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    DSmotivos: TDataSource;
    sqlgeneral: TMyQuery;
    tblmotivos: TMyTable;
    tblmotivosidmotivo: TIntegerField;
    tblmotivosnombre: TStringField;
    tblmotivosusuario: TStringField;
    tblmotivosfecha: TStringField;
    tblmotivoshora: TStringField;
    lbufh: TRzLabel;
    procedure buscarlocate;
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;

      Shift: TShiftState);
    procedure tblmotivosBeforePost(DataSet: TDataSet);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmotivos_cancel: Tfrmmotivos_cancel;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure Tfrmmotivos_cancel.buscarlocate;
begin

tblmotivos.Active:=true;
if tblmotivos.Locate('idmotivo',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblmotivos);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Motivo no Existe','Información',mb_ok+mb_iconinformation);
    tblmotivos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;


end;



procedure Tfrmmotivos_cancel.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DSmotivos.dataset.fieldbyname('idmotivo').AsString;
lbufh.Caption := UFH(tblmotivos);
end;

procedure Tfrmmotivos_cancel.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
   //trae el maximo idlinea + 1
   querys('select max(idmotivo) from MotCancel',0,sqlgeneral);
   edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled:=false;
   //pone la tabla de motivos de cancelacion en modo de insercion
   tblmotivos.Active:=true;
   tblmotivos.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from MotCancel where idmotivo<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un motivo';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta el motivo '+ednombre.text,1);
     //trae el maximo idlinea + 1
     querys('select max(idmotivo) from MotCancel',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      //guarda los datos
      tblmotivos.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update MotCancel set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmotivo='+edclave.Text,1,sqlgeneral);
      tblmotivos.Active:=false;
      ednombre.Enabled:=false;
      edclave.Enabled:=true;
      //btnbuscar.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
   end;
end;

procedure Tfrmmotivos_cancel.btnborrarClick(Sender: TObject);
begin

  if application.MessageBox('Estas Seguro que deseas borrar este Motivo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el motivo '+tblmotivosnombre.asstring,3);
      tblmotivos.Delete;
      application.MessageBox('Eliminacion Exitosa del motivo ','Información',mb_ok);
      tblmotivos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblmotivos.Active:=false;
      edclave.text:='';
      edclave.SetFocus;
   end;
end;

procedure Tfrmmotivos_cancel.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     //btnbuscar.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     edclave.Enabled:=false;
     tblmotivos.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
   if ExisteNombre(ednombre,'select nombre from MotCancel where idmotivo<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del motivo actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el motivo '+tblmotivosnombre.AsString,2);
     tblmotivos.Post;
     tblmotivos.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmmotivos_cancel.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblmotivos.Cancel;
     tblmotivos.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del motivo actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Motivo';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;

end;

procedure Tfrmmotivos_cancel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmmotivos_cancel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblmotivos,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmmotivos_cancel.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idmotivo,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From MotCancel order by idmotivo';
      frmbusquedas.campo_retorno:='idmotivo';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tblorigen := 'MotCancel';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblmotivos.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmmotivos_cancel.tblmotivosBeforePost(DataSet: TDataSet);
begin
tblmotivosidmotivo.AsString:=edclave.Text;
end;

procedure Tfrmmotivos_cancel.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmmotivos_cancel.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblmotivos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmmotivos_cancel.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
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

procedure Tfrmmotivos_cancel.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmmotivos_cancel.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

end.
