unit Ucomentarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, DBCtrls, RzDBNav, StdCtrls, RzLabel,
  RzDBEdit, Mask, RzEdit, RzBtnEdt, DB, MyAccess, MemDS, DBAccess;

type
  Tfrmcomentarios = class(TForm)
    edclave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    DScoment: TDataSource;
    tblcoment: TMyTable;
    sqlgeneral: TMyQuery;
    tblcomentclave: TStringField;
    tblcomentcomentario: TStringField;
    ednombre: TRzDBMemo;
    procedure FormShow(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure tblcomentBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnmodificarClick(Sender: TObject);
    procedure buscarlocate;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcomentarios: Tfrmcomentarios;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure Tfrmcomentarios.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmcomentarios.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmcomentarios.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
    begin
    if btnalta.Caption <> '&Guardar' then
      begin
      tblcoment.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      end;
    end;
end;

procedure Tfrmcomentarios.edclaveKeyPress(Sender: TObject; var Key: Char);
begin

if key='.' then
 key:=#0;
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


procedure Tfrmcomentarios.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DScoment.dataset.fieldbyname('clave').AsString;
end;

procedure Tfrmcomentarios.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    edclave.Enabled:=true;
    edclave.Text :='';
    edclave.setfocus;
    //pone la tabla en modo de insercion
    tblcoment.Active:=true;
    tblcoment.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    ednombre.Enabled:=true;
    navegador.Enabled:=false;
    end
  else
    begin
    querys('Select * from comentarios where clave='+quotedstr(edclave.text), 0, sqlgeneral);
    if sqlgeneral.RecordCount >0 then
      begin
      application.MessageBox('La Clave del Comentario ya existe y no se permiten duplicados', 'Aviso', MB_ICONINFORMATION);
      edclave.text:='';
      edclave.SetFocus;
      exit;
      end
    else
      querys('Select * from comentarios where comentario='+quotedstr(ednombre.text), 0, sqlgeneral);
      if sqlgeneral.RecordCount >0 then
         begin
         application.MessageBox('El Comentario ya existe y no se permiten duplicados', 'Aviso', MB_ICONINFORMATION);
         ednombre.text:='';
         ednombre.setfocus;
         exit;
         end
      else
        begin
        btnalta.Caption:='&Alta';
        btnalta.Hint:='Dar de Alta un Comentario';
        btncancelar.Caption:='&Cerrar';
        btncancelar.Hint:='Cerrar esta Ventana';
        btnalta.ImageIndex:=5;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        frmprincipal.ucprincipal.Log('Dio de Alta un Comentario '+ednombre.text,1);
         //guarda los datos
         tblcoment.Post;
        //actualiza los datos de hora,fecha de creacion y usuario
        querys('update comentarios set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where clave='+quotedstr(edclave.Text),1,sqlgeneral);
        tblcoment.Active:=false;
        ednombre.Enabled:=false;
        edclave.Text:='';
        edclave.SetFocus;
         end;
        end;
      end;


procedure Tfrmcomentarios.tblcomentBeforePost(DataSet: TDataSet);
begin
//uppercase(ednombre.text);
tblcomentcomentario.AsString:=uppercase(tblcomentcomentario.AsString);
tblcomentclave.AsString:=edclave.Text;
end;

procedure Tfrmcomentarios.btnborrarClick(Sender: TObject);
begin
  if application.MessageBox('Estas Seguro que deseas borrar este Comentario?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
    frmprincipal.ucprincipal.Log('Elimino el Comentario '+tblcomentcomentario.asstring,3);
    tblcoment.Delete;
    application.MessageBox('Eliminacion del Comentario Exitosa','Información',mb_ok);
    tblcoment.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    tblcoment.Active:=false;
    edclave.text:='';
    edclave.SetFocus;
    end;
end;

procedure Tfrmcomentarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblcoment,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmcomentarios.btnmodificarClick(Sender: TObject);
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
     edclave.Enabled:=false;
     tblcoment.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    begin
      querys('Select * from comentarios where comentario='+quotedstr(ednombre.text), 0, sqlgeneral);
      if sqlgeneral.RecordCount >0 then
         begin
         application.MessageBox('El Comentario ya existe y no se permiten duplicados', 'Aviso', MB_ICONINFORMATION);
         ednombre.text:='';
         ednombre.setfocus;
         exit;
         end
      else
        begin
        btncancelar.Caption:='&Cerrar';
        btnmodificar.Caption:='&Editar';
        btncancelar.Hint:='Cerrar esta Pantalla';
        btnmodificar.hint:='Editar los datos del Comentario actual';
        btnmodificar.ImageIndex:=2;
        ednombre.Enabled:=false;
        btnalta.Enabled:=true;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        frmprincipal.ucprincipal.Log('Edito el Comentario '+tblcomentcomentario.AsString,2);
        tblcoment.Post;
        //actualiza los datos de hora,fecha de creacion y usuario
        querys('update comentarios set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where clave='+quotedstr(edclave.Text),1,sqlgeneral);
        tblcoment.Active:=false;
        edclave.Enabled:=true;
        edclave.Text:='';
        edclave.SetFocus;
         end;
      end;
    end;
end;

procedure Tfrmcomentarios.buscarlocate;
begin
tblcoment.Active:=true;
if tblcoment.Locate('clave',edclave.Text,[]) then
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
    application.MessageBox('Ese Comentarios no Existe','Información',mb_ok+mb_iconinformation);
    tblcoment.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure Tfrmcomentarios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
    with frmbusquedas do
      begin
      query:='Select clave, comentario as Comentario, usuario as Usuario, fecha as Fecha,hora as Hora From comentarios order by clave';
      campo_retorno:='clave';
      campo_busqueda:='comentario';
      tblorigen := 'comentarios';
      lbldesc.Caption:='Busqueda por Nombre:';
      ShowModal;
      if resultado <> '' then
        begin
        tblcoment.Active:=true;
        edclave.Text:=resultado;
        buscarlocate;
        navegador.Enabled:=true;
        end;
      end;
    end;
end;

procedure Tfrmcomentarios.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  tblcoment.Cancel;
  tblcoment.Active:=false;
  navegador.Enabled:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del Comentario Actual';
    btnmodificar.ImageIndex:=2;
    end;
  if btnalta.Enabled then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Comentario';
    btnalta.ImageIndex:=5;
    end;
  edclave.Text:='';
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

procedure Tfrmcomentarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

end.
