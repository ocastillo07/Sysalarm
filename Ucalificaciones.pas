unit Ucalificaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, DBCtrls, RzDBNav, RzDBEdit, StdCtrls, Mask,
  RzEdit, RzBtnEdt, RzLabel, DB, MyAccess, MemDS, DBAccess;

type
  TfrmCalificacion = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    edpuntuacion: TRzDBEdit;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    tblcalificacion: TMyTable;
    DSCalificaciones: TDataSource;
    tblcalificacionidcalificacion: TIntegerField;
    tblcalificacionnombre: TStringField;
    tblcalificacionpuntuacion: TIntegerField;
    tblcalificacionusuario: TStringField;
    tblcalificacionfecha: TStringField;
    tblcalificacionhora: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edpuntuacionKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblcalificacionBeforePost(DataSet: TDataSet);
  private
  procedure habilita(hab:boolean);
  procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalificacion: TfrmCalificacion;

implementation

uses Urecursos, Uprincipal, Ubusquedas, Udm;

{$R *.dfm}

procedure TfrmCalificacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     action:=cafree;
end;

procedure TfrmCalificacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblcalificacion,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmCalificacion.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idcalificacion, nombre, usuario as Usuario,fecha as Fecha,hora as Hora From Calificacion order by idcalificacion';
        campo_retorno:='idcalificacion';
        campo_busqueda:='nombre';
        tblorigen := 'Calificacion';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblcalificacion.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmCalificacion.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure TfrmCalificacion.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmCalificacion.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblcalificacion.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmCalificacion.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmCalificacion.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:= DSCalificaciones.dataset.fieldbyname('idcalificacion').AsString;
end;

procedure TfrmCalificacion.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCalificacion.edpuntuacionKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if (key=#13)and(edpuntuacion.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCalificacion.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idcalificacion) from Calificacion',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblcalificacion.Active:=true;
    tblcalificacion.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from Calificacion where idcalificacion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Calificacion';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Calificacion '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idcalificacion) from Calificacion',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger +1 );
     //guarda los datos
     tblcalificacion.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update Calificacion set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcalificacion='+edclave.Text,1,sqlgeneral);
     tblcalificacion.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmCalificacion.btnborrarClick(Sender: TObject);
begin
//valida que no se use en la tabla de travel
  querys('select idcalificacion from DescPuntxFactor where idcalificacion='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esa Calificacion esta siendo usado por una Descripcion de Puntuacion por Factor y no podra ser eliminada hasta que se borre la descripcion o haga referencia a otro Factor Individual!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esa Calificacion?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la Calificacion '+tblcalificacionnombre.asstring,3);
        tblcalificacion.Delete;
        application.MessageBox('Eliminacion de la Calificacion Exitosa','Información',mb_ok);
        tblcalificacion.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblcalificacion.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmCalificacion.btnmodificarClick(Sender: TObject);
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
     habilita(true);
     edclave.Enabled:=false;
     tblcalificacion.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from Calificacion where idcalificacion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Calificacion';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Calificacion '+tblcalificacionnombre.AsString,2);
     tblcalificacion.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update Calificacion set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcalificacion='+edclave.Text,1,sqlgeneral);
     tblcalificacion.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmCalificacion.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcalificacion.Cancel;
     tblcalificacion.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Calificacion Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Calificacion';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       habilita(false);
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmCalificacion.tblcalificacionBeforePost(DataSet: TDataSet);
begin
tblcalificacionidcalificacion.AsString:=edclave.Text;
end;

procedure TfrmCalificacion.buscarlocate;
begin
tblcalificacion.Active:=true;
if tblcalificacion.Locate('idcalificacion',edclave.Text,[]) then
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
    application.MessageBox('Esa Calificacion no Existe','Información',mb_ok+mb_iconinformation);
    tblcalificacion.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmCalificacion.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
edpuntuacion.Enabled := hab;
end;

End.
