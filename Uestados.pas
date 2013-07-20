unit Uestados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RzDBEdit, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt,
  ExtCtrls, DBCtrls, RzDBNav, RzButton, MyAccess, MemDS, DBAccess;

type
  Tfrmestados = class(TForm)
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    clave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    nombre: TRzDBEdit;
    DSestados: TDataSource;
    tblestados: TMyTable;
    sqlgeneral: TMyQuery;
    tblestadosidestado: TIntegerField;
    tblestadosnombre: TStringField;
    tblestadosusuario: TStringField;
    tblestadosfecha: TStringField;
    tblestadoshora: TStringField;
    lbufh: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure buscarlocate;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure tblestadosBeforePost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure claveButtonClick(Sender: TObject);
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure nombreKeyPress(Sender: TObject; var Key: Char);
    procedure claveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmestados: Tfrmestados;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos;

{$R *.dfm}

procedure Tfrmestados.btnaltaClick(Sender: TObject);
begin
  if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo + 1
    querys('select max(idestado) from estados',0,sqlgeneral);
    clave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    clave.Enabled:=false;
    //pone la tabla de Estados en modo de insercion
    tblestados.Active:=true;
    tblestados.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    nombre.Enabled:=true;
    nombre.SetFocus;
    navegador.Enabled:=false;
    lbufh.Caption := '';
  end
 else
    begin
    if ExisteNombre(nombre,'select nombre from estados where idestado<>'+clave.Text+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
      exit;
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta un Estado';
      btncancelar.Caption:='&Cerrar';
      btncancelar.Hint:='Cerrar esta Ventana';
      btnalta.ImageIndex:=5;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      frmprincipal.ucprincipal.Log('Dio de Alta a un Estado '+nombre.text,1);
      //guarda los datos
      tblestados.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update estados set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idestado='+clave.Text,1,sqlgeneral);
      tblestados.Active:=false;
      nombre.Enabled:=false;
      clave.Enabled:=true;
      clave.Text:='';
      clave.SetFocus;
   end;
end;

procedure Tfrmestados.btnborrarClick(Sender: TObject);
begin
//busca que el tipo no este siendo usado en la tabla de colonias
querys('select idestado from colonias where idestado='+clave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Estado esta siendo usado por una Colonia y no podra ser eliminado hasta que se borre la Colonia o haga referencia a otra Colonia!','Cuidado',mb_ok+mb_iconinformation)
else
  begin
    //busca que el tipo no este siendo usado en la tabla de municipios
   querys('select idestado from municipios where idestado='+clave.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Estado esta siendo usado por un Municipio y no podra ser eliminado hasta que se borre el Municipio o haga referencia a otro Municipio!','Cuidado',mb_ok+mb_iconinformation)
     else
      if application.MessageBox('Estas Seguro que deseas borrar este Estado?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino el Estado'+tblestadosnombre.asstring,3);
        tblestados.Delete;
        application.MessageBox('Eliminacion del Estado Exitosa','Información',mb_ok);
        tblestados.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblestados.Active:=false;
        clave.text:='';
        clave.SetFocus;
        end;
   end;
end;

procedure Tfrmestados.btnmodificarClick(Sender: TObject);
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
     tblestados.Edit;
     navegador.Enabled:=false;
     nombre.setfocus;
   end
else
  begin
    if ExisteNombre(nombre,'select nombre from estados where idestado<>'+clave.Text+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Estado actual';
     btnmodificar.ImageIndex:=2;
     nombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito Estado '+tblestadosnombre.AsString,2);
     //Guarda los cambios
     tblestados.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update estados set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idestado='+clave.Text,1,sqlgeneral);
     tblestados.Active:=false;
     clave.Enabled:=true;
     clave.Text:='';
     clave.SetFocus;
     end;
end;

procedure Tfrmestados.btncancelarClick(Sender: TObject);
begin
 if btncancelar.Caption='&Cancelar' then begin
     tblestados.Cancel;
     tblestados.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Estado Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Estado';
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

procedure Tfrmestados.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
 clave.text:=DSestados.dataset.fieldbyname('idestado').AsString;
 lbufh.Caption := UFH(tblestados);
end;

procedure Tfrmestados.buscarlocate;
begin
tblestados.Active:=true;
if tblestados.Locate('idestado',clave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblestados);

   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Estado no Existe','Información',mb_ok+mb_iconinformation);
    tblestados.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;


procedure TfrmEstados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmestados.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idestado,nombre,usuario as Usuario,fecha as Fecha,hora as Hora From estados order by idestado';
      frmbusquedas.campo_retorno:='idestado';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen := 'estados';
      frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblestados.Active:=true;
             clave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmestados.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;

if clave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblestados.Active:=true;
if tblestados.Locate('idestados',clave.Text,[]) then
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
    application.MessageBox('Ese Estado no Existe','Información',mb_ok+mb_iconinformation);
    tblestados.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;
end;

procedure Tfrmestados.tblestadosBeforePost(DataSet: TDataSet);
begin
tblestadosidestado.AsString:=clave.Text;
end;

procedure Tfrmestados.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblestados,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmestados.claveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmestados.claveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmestados.nombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(nombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmestados.claveChange(Sender: TObject);
begin
if clave.Text = '' then begin
   tblestados.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmestados.FormShow(Sender: TObject);
begin
clave.SetFocus;
end;

end.

