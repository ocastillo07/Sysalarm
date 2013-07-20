unit umagnitudes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt, RzButton, ExtCtrls,
  DBCtrls, RzDBNav, DB, MyAccess, MemDS, DBAccess, RzDBEdit;

type
  Tfrmmagnitudes = class(TForm)
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    edclave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    sqlgeneral: TMyQuery;
    tblmagnitudes: TMyTable;
    DSmagnitudes: TDataSource;
    ednombre: TRzDBEdit;
    eddescripcion: TRzDBEdit;
    tblmagnitudesidmagnitud: TIntegerField;
    tblmagnitudesnombre: TStringField;
    tblmagnitudesdescripcion: TStringField;
    tblmagnitudesusuario: TStringField;
    tblmagnitudesfecha: TStringField;
    tblmagnitudeshora: TStringField;
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure tblmagnitudesBeforePost(DataSet: TDataSet);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sqlgeneralBeforePost(DataSet: TDataSet);
  private
    procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmagnitudes: Tfrmmagnitudes;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure Tfrmmagnitudes.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblmagnitudes.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
end;

procedure Tfrmmagnitudes.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmmagnitudes.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmagnitudes.buscarlocate;
begin
tblmagnitudes.Active:=true;
if tblmagnitudes.Locate('idmagnitud',edclave.Text,[]) then
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
    application.MessageBox('Esa Magnitud no Existe','Información',mb_ok+mb_iconinformation);
    tblmagnitudes.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure Tfrmmagnitudes.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  edclave.text:=DSmagnitudes.dataset.fieldbyname('idmagnitud').AsString;
end;

procedure Tfrmmagnitudes.tblmagnitudesBeforePost(DataSet: TDataSet);
begin
tblmagnitudesidmagnitud.AsString:=edclave.Text;
end;

procedure Tfrmmagnitudes.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmmagnitudes.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(eddescripcion.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmmagnitudes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idmagnitud,nombre,descripcion, usuario as Usuario,fecha as Fecha,hora as Hora From magnitudes order by idmagnitud';
        campo_retorno:='idmagnitud';
        campo_busqueda:='nombre';
        tblorigen := 'magnitudes';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblmagnitudes.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure Tfrmmagnitudes.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idmagnitud)from magnitudes',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblmagnitudes.Active:=true;
    tblmagnitudes.Insert;
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
      if ExisteNombre(ednombre,'select nombre from magnitudes where idmagnitud<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Magnitud';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Magnitud '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idmagnitud)+1 from magnitudes',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger);
     //guarda los datos
     tblmagnitudes.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update magnitudes set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmagnitud='+edclave.Text,1,sqlgeneral);
     tblmagnitudes.Active:=false;
     ednombre.Enabled:=false;
     eddescripcion.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure Tfrmmagnitudes.btnborrarClick(Sender: TObject);
begin
  //valida que no se use en la tabla de travel
  querys('select idmagnitud from travel where idmagnitud='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta Magnitud esta siendo usado por un Travel y no podra ser eliminada hasta que se borre el Travel o haga referencia a otra Magnitud!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esta Magnitud?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la Magnitud '+tblmagnitudesnombre.asstring,3);
        tblmagnitudes.Delete;
        application.MessageBox('Eliminacion de la Magnitud Exitosa','Información',mb_ok);
        tblmagnitudes.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblmagnitudes.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure Tfrmmagnitudes.btnmodificarClick(Sender: TObject);
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
     tblmagnitudes.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from magnitudes where idmagnitud<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Magnitud actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     eddescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Magnitud '+tblmagnitudesnombre.AsString,2);
     tblmagnitudes.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update magnitudes set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmagnitud='+edclave.Text,1,sqlgeneral);
     tblmagnitudes.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmmagnitudes.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblmagnitudes.Cancel;
     tblmagnitudes.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Magnitud Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Magnitud';
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

procedure Tfrmmagnitudes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmmagnitudes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblmagnitudes,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmmagnitudes.sqlgeneralBeforePost(DataSet: TDataSet);
begin
tblmagnitudesidmagnitud.AsString:=edclave.Text;
end;

end.
