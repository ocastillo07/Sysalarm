unit Uasuntos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, ExtCtrls, DBCtrls, RzDBNav,
  RzDBEdit, Mask, RzEdit, RzBtnEdt, DB, MyAccess, MemDS, DBAccess;

type
  TfrmAsuntos = class(TForm)
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    eddescripcion: TRzDBEdit;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    tblasunto: TMyTable;
    sqlgeneral: TMyQuery;
    DSasunto: TDataSource;
    tblasuntoidasunto: TIntegerField;
    tblasuntonombre: TStringField;
    tblasuntodescripcion: TStringField;
    tblasuntousuario: TStringField;
    tblasuntofecha: TStringField;
    tblasuntohora: TStringField;
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure tblasuntoBeforePost(DataSet: TDataSet);
  private
    procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAsuntos: TfrmAsuntos;

implementation

uses Uprincipal, Urecursos, Udm, Ubusquedas;

{$R *.dfm}

procedure TfrmAsuntos.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmAsuntos.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblasunto.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmAsuntos.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmAsuntos.buscarlocate;
begin
tblasunto.Active:=true;
if tblasunto.Locate('idasunto',edclave.Text,[]) then
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
    application.MessageBox('Ese Asunto no Existe','Información',mb_ok+mb_iconinformation);
    tblasunto.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmAsuntos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblasunto.Cancel;
     tblasunto.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Asunto Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Asunto';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       ednombre.Enabled:=false;
       eddescripcion.Enabled  := false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmAsuntos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  edclave.text:=DSasunto.dataset.fieldbyname('idasunto').AsString;
end;

procedure TfrmAsuntos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idasunto)from asuntos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblasunto.Active:=true;
    tblasunto.Insert;
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
      if ExisteNombre(ednombre,'select nombre from asuntos where idasunto<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Asunto';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta el Asunto '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idasunto)+1 from asuntos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger);
     //guarda los datos
     tblasunto.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update asuntos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idasunto='+edclave.Text,1,sqlgeneral);
     tblasunto.Active:=false;
     ednombre.Enabled:=false;
     eddescripcion.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmAsuntos.btnborrarClick(Sender: TObject);
begin
  //valida que no se use en la tabla de travel
  querys('select idasunto from travel where idasunto='+quotedstr(edclave.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Este Asunto esta siendo usado por un Travel y no podra ser eliminada hasta que se borre el Travel o haga referencia a otro Asunto!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    //valida que no se use en la tabla de quejas
    querys('select idasunto from quejas where idasunto='+quotedstr(edclave.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      application.MessageBox('Este Asunto esta siendo usado por una Queja y no podra ser eliminada hasta que se borre la queja o haga referencia a otro Asunto!','Cuidado',mb_ok+mb_iconinformation)
    else
      if application.MessageBox('Estas Seguro que deseas borrar este Asunto?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino el Asunto '+tblasuntonombre.asstring,3);
        tblasunto.Delete;
        application.MessageBox('Eliminacion del Asunto Exitosa','Información',mb_ok);
        tblasunto.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblasunto.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmAsuntos.btnmodificarClick(Sender: TObject);
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
     tblasunto.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from asuntos where idasunto<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Asunto actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     eddescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el Asunto '+tblasuntonombre.AsString,2);
     tblasunto.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update asuntos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idasunto='+edclave.Text,1,sqlgeneral);
     tblasunto.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmAsuntos.FormShow(Sender: TObject);
begin
edclave.setfocus;
end;

procedure TfrmAsuntos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idasunto,nombre,descripcion, usuario as Usuario,fecha as Fecha,hora as Hora From asuntos order by idasunto';
        campo_retorno:='idasunto';
        campo_busqueda:='nombre';
        tblorigen := 'asuntos';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblasunto.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmAsuntos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmAsuntos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblasunto,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmAsuntos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmAsuntos.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(eddescripcion.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmAsuntos.tblasuntoBeforePost(DataSet: TDataSet);
begin
tblasuntoidasunto.AsString:=edclave.Text;
end;

end.

