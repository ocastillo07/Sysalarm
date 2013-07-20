//2008/09/30 dalyla monitoreabble
unit Utipo_alarmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzButton, StdCtrls, RzCmboBx,
  RzDBEdit, ExtCtrls, DBCtrls, RzDBNav, Mask, RzEdit, RzBtnEdt, RzLabel,
  RzRadChk, RzDBChk;

type
  Tfrmtipoalarmas = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    clave: TRzButtonEdit;
    navegador: TRzDBNavigator;
    nombre: TRzDBEdit;
    prioridad: TRzDBEdit;
    tipoprotocolo: TRzComboBox;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    tblTipo_Alarmas: TMyTable;
    DStipo_alarmas: TDataSource;
    qtipo: TMyQuery;
    descripcion: TRzDBMemo;
    tblTipo_Alarmasclave: TStringField;
    tblTipo_Alarmasnombre: TStringField;
    tblTipo_Alarmasprioridad: TSmallintField;
    tblTipo_Alarmascomment: TSmallintField;
    tblTipo_Alarmasmonitoreo: TSmallintField;
    tblTipo_Alarmasdescripcion: TMemoField;
    tblTipo_Alarmasidprotocolo: TIntegerField;
    tblTipo_Alarmasnombre2: TStringField;
    tblTipo_Alarmasusuario: TStringField;
    tblTipo_Alarmashora: TStringField;
    tblTipo_Alarmasfecha: TStringField;
    chkmonitoreable: TRzDBCheckBox;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure claveButtonClick(Sender: TObject);
    procedure claveChange(Sender: TObject);
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure combotipos;
    procedure buscarlocate;
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblTipo_AlarmasBeforePost(DataSet: TDataSet);
    procedure tipoprotocoloClick(Sender: TObject);
    procedure valorpro;
    procedure valorproint;
    procedure tipoprotocoloNotInList(Sender: TObject);
    procedure prioridadKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
     i: integer;
  public
    { Public declarations }
  end;

var
  frmtipoalarmas: Tfrmtipoalarmas;

implementation

uses Ubusquedas, Uprincipal, Urecursos, Udm;

{$R *.dfm}

procedure Tfrmtipoalarmas.FormShow(Sender: TObject);
begin
clave.SetFocus;
combotipos;
end;

procedure Tfrmtipoalarmas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select clave,nombre,prioridad as Prioridad, comment as Comment, monitoreo as Monitoreo, descripcion as Descripcion, idprotocolo as IDprotocolo, Usuario as Usuario,fecha as Fecha,hora as Hora From alarmas_tipos order by clave';
        campo_retorno:='clave';
        campo_busqueda:='nombre';
        tblorigen := 'alarmas_tipos';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if (resultado <> '') and (btnalta.Caption <> '&Guardar' )then
          begin
          tbltipo_alarmas.Active:=true;
          clave.Text:=resultado;
          buscarlocate;
          navegador.Enabled:=true;
          end;
        end;
    end;
end;

procedure Tfrmtipoalarmas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure Tfrmtipoalarmas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 canclose:=CerrarPantalla(tbltipo_alarmas,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmtipoalarmas.claveButtonClick(Sender: TObject);
var codigo:word;
begin
   codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmtipoalarmas.claveChange(Sender: TObject);
begin
  if clave.Text = '' then begin
   tbltipo_alarmas.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   tipoprotocolo.Text := '';
   lbufh.Caption := '';
end;
end;

procedure Tfrmtipoalarmas.claveKeyPress(Sender: TObject; var Key: Char);
begin
    if key='.' then
 key:=#0;
if (key = #13) then
   begin
     key:=#0;
     if clave.Text <> '' then
        begin
        if btnalta.Caption = '&Alta' then
           buscarlocate;
        end
     else
        clave.OnButtonClick(self);
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;

   if key = #27 then
     begin
      key:=#0;
      clave.Text:='';
      tipoprotocolo.Text := '';
  end;
end;

procedure Tfrmtipoalarmas.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  clave.text:=DStipo_alarmas.dataset.fieldbyname('clave').AsString;
  lbufh.Caption := UFH(tbltipo_alarmas);
  valorpro;
end;

procedure Tfrmtipoalarmas.valorpro;
begin
  querys('select protocolos.protocolo as protocolo from alarmas_tipos join protocolos where clave = '+quotedstr(clave.text)+' and alarmas_tipos.idprotocolo = protocolos.idprotocolo', 0, sqlgeneral);
  tipoprotocolo.Text:= sqlgeneral.FieldByName('protocolo').AsString;
end;

procedure Tfrmtipoalarmas.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
  begin
  //No trae el maximo idtipo + 1
  //pone la tabla en modo de insercion
  tbltipo_alarmas.Active:=true;
  tbltipo_alarmas.Insert;
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  nombre.Enabled:=true;
  descripcion.Enabled:=true;
  prioridad.Enabled:=true;
  tipoprotocolo.Enabled:=true;
  clave.text := '';
  lbufh.Caption := '';
  tipoprotocolo.Text := ''; 
  clave.SetFocus;
  navegador.Enabled:=false;
  end
else
  begin
  if ExisteNombre(nombre,'select nombre from alarmas_tipos where clave<>'+quotedstr(clave.Text)+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
     exit;
  querys('Select clave from alarmas_tipos where clave ='+quotedstr(clave.Text), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    application.messagebox('La clave del Tipo de Alarma ya existe', 'Aviso', MB_ICONSTOP);
    exit;
    end;
  btnalta.Caption:='&Alta';
  btnalta.Hint:='Dar de Alta un Tipo de Alarma';
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar esta Ventana';
  btnalta.ImageIndex:=5;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  frmprincipal.ucprincipal.Log('Dio de Alta un Tipo de Alarma '+nombre.text,1);
  //guarda los datos
  tbltipo_alarmas.Post;
  //actualiza los datos de hora,fecha de creacion y usuario
  querys('update alarmas_tipos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where clave='+quotedstr(clave.Text), 1, sqlgeneral);
  tbltipo_alarmas.Active:=false;
  nombre.Enabled:=false;
  descripcion.Enabled:=true;
  prioridad.Enabled:=true;
  tipoprotocolo.Enabled:=true;
  clave.Enabled:=true;
  clave.Text:='';
  clave.SetFocus;
  end;
end;

procedure tfrmtipoalarmas.combotipos;
begin
  i:=0;
  qtipo.Active := True;
  qtipo.First;
  tipoprotocolo.Clear;
  while not qtipo.Eof = true do
    begin
    tipoprotocolo.Items.Add(qtipo.fieldbyname('protocolo').AsString);
    qtipo.Next;
    end;
end;

procedure Tfrmtipoalarmas.buscarlocate;
begin
tbltipo_alarmas.Active:=true;
if tbltipo_alarmas.Locate('clave',clave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    valorpro;
    lbufh.Caption := UFH(tbltipo_alarmas);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Tipo de Alarma no Existe','Información',mb_ok+mb_iconinformation);
    tbltipo_alarmas.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;


procedure Tfrmtipoalarmas.btnborrarClick(Sender: TObject);
begin
//busca que el tipo no este siendo usado en la tabla de sk alarmas
querys('select id from sk_alarmas where tipo='+quotedstr(clave.Text), 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Tipo de Alarma esta siendo usado por una alarma y no podra ser eliminada!','Cuidado',mb_ok+mb_iconinformation)
else
  begin
  if application.MessageBox('Estas Seguro que deseas borrar este Tipo de Alarma?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Tipo de Alarma '+tbltipo_alarmasnombre.asstring, 3);
      tbltipo_alarmas.Delete;
      application.MessageBox('Eliminacion del Tipo de Alarma Exitosa','Información',mb_ok);
      tbltipo_alarmas.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltipo_alarmas.Active:=false;
      tipoprotocolo.Text := '';
      clave.text:='';
      clave.SetFocus;
     end;
   end;
end;

procedure Tfrmtipoalarmas.btnmodificarClick(Sender: TObject);
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
     descripcion.Enabled:=true;
     prioridad.Enabled:=true;
     tipoprotocolo.Enabled:=true;
     clave.Enabled:=false;
     tbltipo_alarmas.Edit;
     navegador.Enabled:=false;
     nombre.setfocus;
   end
else
  begin
    if ExisteNombre(nombre,'select nombre from alarmas_tipos where clave<>'+quotedstr(clave.Text)+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Tipo de Alarma actual';
     btnmodificar.ImageIndex:=2;
     nombre.Enabled:=false;
     descripcion.Enabled:=false;
     prioridad.Enabled:=false;
     tipoprotocolo.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito El Tipo de Alarma '+tbltipo_alarmasnombre.AsString,2);
     tbltipo_alarmas.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update alarmas_tipos set fecha='+quotedstr(datetostr(date))+', hora='+quotedstr(timetostr(time))+', usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where clave='+quotedstr(clave.Text), 1, sqlgeneral);
     tbltipo_alarmas.Active:=false;
     clave.Enabled:=true;
     clave.Text:='';
     clave.SetFocus;
     end;
end;

procedure Tfrmtipoalarmas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tbltipo_alarmas.Cancel;
     tbltipo_alarmas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Tipo de Alarma Actual';
         btnmodificar.ImageIndex:=2;
         tipoprotocolo.Text := '';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Tipo de Alarma';
          btnalta.ImageIndex:=5;
          tipoprotocolo.Text := '';
          clave.Text:='';
        end;
       nombre.Enabled:=false;
       descripcion.Enabled:=false;
       prioridad.Enabled:=false;
       tipoprotocolo.Enabled:=false;
       clave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       clave.SetFocus;
 end
else
release;
end;


procedure Tfrmtipoalarmas.tblTipo_AlarmasBeforePost(DataSet: TDataSet);
begin
  tbltipo_alarmasclave.AsString:=clave.Text;
  tblTipo_Alarmascomment.AsInteger := 1;
  if btnalta.Caption = '&Guardar' then
    tblTipo_Alarmasmonitoreo.AsInteger := 0;
  tbltipo_alarmasidprotocolo.AsInteger := i;
end;

procedure Tfrmtipoalarmas.tipoprotocoloClick(Sender: TObject);
begin
valorproint;
end;

procedure Tfrmtipoalarmas.valorproint;
begin
qtipo.First;
while not qtipo.Eof = true do
  begin
  if tipoprotocolo.Text = qtipo.FieldByName('protocolo').AsString then
    i:= qtipo.FieldByName('idprotocolo').AsInteger;
  qtipo.Next;
  end;
end;

procedure Tfrmtipoalarmas.tipoprotocoloNotInList(Sender: TObject);
begin
tipoprotocolo.itemindex := 0;
end;

procedure Tfrmtipoalarmas.prioridadKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false)
end;

end.


