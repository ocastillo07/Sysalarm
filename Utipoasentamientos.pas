unit Utipoasentamientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit, RzBtnEdt, DBCtrls,
  RzDBNav, RzLabel, DBAccess, MyAccess, MemDS, RzButton, RzDBEdit;

type
  Tfrmtipoasenta = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    clave: TRzButtonEdit; 
    DStipoasenta: TDataSource;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    nombre: TRzDBEdit;
    sqlgeneral: TMyQuery;
    tbltipoasenta: TMyTable;
    tbltipoasentaidtipoasenta: TIntegerField;
    tbltipoasentanombre: TStringField;
    tbltipoasentausuario: TStringField;
    tbltipoasentafecha: TStringField;
    tbltipoasentahora: TStringField;
    lbufh: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnborrarClick(Sender: TObject);
    procedure claveChange(Sender: TObject);
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure nombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure claveButtonClick(Sender: TObject);
    procedure buscarlocate;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnbuscarClick(Sender: TObject);
    procedure tbltipoasentaBeforePost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtipoasenta: Tfrmtipoasenta;

implementation

uses Urecursos, Ubusquedas, Uprincipal, Udm;

{$R *.dfm}

procedure Tfrmtipoasenta.btnaltaClick(Sender: TObject);

begin
  if btnalta.caption = '&Alta' then
  begin
   clave.enabled:=true;
   clave.setfocus;
   //pone la tabla de Tipo de Asentamientos en modo de insercion
   tbltipoasenta.Active:=true;
   tbltipoasenta.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   nombre.Enabled:=true;
   clave.Enabled:=true;
   clave.text:='';
   lbufh.Caption := '';
   clave.SetFocus;   
   navegador.Enabled:=false;
   end
else
   begin
  if ExisteNombre(nombre,'select nombre from tipoasentamientos where idtipoasenta<>'+clave.Text+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
     exit;
  querys('Select * from tipoasentamientos where idtipoasenta ='+quotedstr(clave.text), 0, dmaccesos.sqlgeneral);
  if dmaccesos.sqlgeneral.RecordCount > 0 then
    exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Tipo de Asentamiento';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta el Tipo de Asentamiento '+nombre.text,1);
     //trae el maximo idtipo + 1
     tbltipoasenta.FieldByName('idtipoasenta').AsString:=clave.Text;
     //guarda los datos
     tbltipoasenta.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update tipoasentamientos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idtipoasenta='+clave.Text,1,sqlgeneral);
     tbltipoasenta.Active:=false;
     nombre.Enabled:=false;
     clave.Enabled:=true;
     clave.Text:='';
     clave.SetFocus;
   end;
end;

procedure Tfrmtipoasenta.btnmodificarClick(Sender: TObject);
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
     nombre.Enabled:=true;
     clave.Enabled:=false;
     tbltipoasenta.Edit;
     navegador.Enabled:=false;
     nombre.setfocus;
   end
else
  begin
    if ExisteNombre(nombre,'select nombre from tipoasentamientos where idtipoasenta<>'+clave.Text+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
       exit;
    btncancelar.Caption:='&Cerrar';
    btnmodificar.Caption:='&Editar';
    btncancelar.Hint:='Cerrar esta Pantalla';
    btnmodificar.hint:='Editar los datos del tipo de asentamiento actual';
    btnmodificar.ImageIndex:=2;
    nombre.Enabled:=false;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Edito el tipo de asentamiento '+tbltipoasentanombre.AsString,2);
    tbltipoasenta.Post;
    //actualiza los datos de hora,fecha de creacion y usuario
    querys('update tipoasentamientos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idtipoasenta='+clave.Text,1,sqlgeneral);
    tbltipoasenta.Active:=false;
    clave.Enabled:=true;
    nombre.Text:='';
  end;
end;

procedure Tfrmtipoasenta.btnborrarClick(Sender: TObject);
  begin
  //busca que el tipo no este siendo usado en la tabla de colonias
  querys('select idtipoasenta from colonias where idtipoasenta='+clave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Este Tipo de Asentamiento esta siendo usado por una colonia y no podra ser eliminado hasta que se borre la colonia o haga referencia a otro Tipo de Asentamiento!','Cuidado',mb_ok+mb_iconinformation)
  else
    if application.MessageBox('Estas Seguro que deseas borrar este Tipo de Asentamiento?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
      frmprincipal.ucprincipal.Log('Elimino el Tipo de Asentamiento '+tbltipoasentanombre.asstring,3);
      tbltipoasenta.Delete;
      application.MessageBox('Eliminacion del tipo de Asentamiento ha sido Exitosa','Información',mb_ok);
      tbltipoasenta.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltipoasenta.Active:=false;
      clave.text:='';
      clave.SetFocus;
    end;
end;

procedure Tfrmtipoasenta.btncancelarClick(Sender: TObject);
begin
  if btncancelar.Caption='&Cancelar' then begin
    tbltipoasenta.Cancel;
    tbltipoasenta.Active:=false;
    navegador.Enabled:=false;
    btncancelar.Hint:='Cerrar esta Pantalla';
    btncancelar.Caption:='&Cerrar';
    lbufh.Caption := '';
    if btnmodificar.Enabled then
       begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Colonia Actual';
         btnmodificar.ImageIndex:=2;
       end;
    if btnalta.Enabled then
       begin
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta una Colonia';
         btnalta.ImageIndex:=5;
         clave.Text:='';
       end;
       nombre.Enabled:=false;
       clave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       clave.SetFocus;
  end
else
  release;
end;

procedure Tfrmtipoasenta.claveChange(Sender: TObject);
begin
  if clave.Text = '' then begin
    //  tbltipoasenta.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    nombre.text:='';
    lbufh.Caption := '';
  end;
end;

procedure Tfrmtipoasenta.claveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmtipoasenta.claveKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,true);
if (key = #13) then
   begin
     key:=#0;
     if clave.Text <> '' then
        buscarlocate
     else
        clave.OnButtonClick(self);
   end;

   if key = #27 then
     begin
      key:=#0;
     clave.Text:='';
  end;
end;

procedure Tfrmtipoasenta.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;

if clave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltipoasenta.Active:=true;
if tbltipoasenta.Locate('idtipoasenta',clave.Text,[]) then
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
    application.MessageBox('Ese tipo de asentamiento no Existe','Información',mb_ok+mb_iconinformation);
    tbltipoasenta.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;
end;

procedure Tfrmtipoasenta.nombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(nombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmtipoasenta.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
    clave.text:=DStipoasenta.dataset.fieldbyname('idtipoasenta').AsString;
    lbufh.Caption := UFH(tbltipoasenta);
end;

procedure Tfrmtipoasenta.buscarlocate;
begin
tbltipoasenta.Active:=true;
if tbltipoasenta.Locate('idtipoasenta',clave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tbltipoasenta);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Tipo de Asentamiento no Existe','Información',mb_ok+mb_iconinformation);
    tbltipoasenta.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;

procedure Tfrmtipoasenta.FormShow(Sender: TObject);
begin
clave.SetFocus;
end;

procedure Tfrmtipoasenta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmtipoasenta.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tbltipoasenta,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmtipoasenta.tbltipoasentaBeforePost(DataSet: TDataSet);
begin
tbltipoasentaidtipoasenta.AsString:=clave.Text;
end;

procedure Tfrmtipoasenta.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin

      frmbusquedas.query:='Select idtipoasenta,nombre,usuario as Usuario,fecha as Fecha,hora as Hora From tipoasentamientos order by idtipoasenta';
      frmbusquedas.campo_retorno:='idtipoasenta';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen := 'tipoasentamientos';
      frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
      frmbusquedas.ShowModal;
      if (frmbusquedas.resultado <> '') and (btnalta.Caption <> '&Guardar' )then
        begin
          tbltipoasenta.Active:=true;
          clave.Text:=frmbusquedas.resultado;
          buscarlocate;
          navegador.Enabled:=true;
        end;

    end;
end;

end.


