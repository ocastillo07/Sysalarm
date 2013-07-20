unit Umodems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt, ExtCtrls,
  DBCtrls, RzDBNav, RzCmboBx, RzDBEdit, RzRadChk, RzDBChk, nrcommbox, DB,
  MemDS, DBAccess, MyAccess, RzPanel, RzRadGrp, RzDBRGrp, nrclasses,
  nrcomm, nrcommtapi;

type
  Tfrmmodems = class(TForm)
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    edip: TRzDBEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    tblcom_users: TMyTable;
    DScom_users: TDataSource;
    telnormal: TnrDeviceBox;
    basecelular: TnrDeviceBox;
    nrCommTAPI1: TnrCommTAPI;
    nrCommTAPI2: TnrCommTAPI;
    rgtypecall: TRzRadioGroup;
    tblcom_usersidmaq: TIntegerField;
    tblcom_userspcname: TStringField;
    tblcom_usersipadress: TStringField;
    tblcom_usersonline: TSmallintField;
    tblcom_usersmonitorea: TSmallintField;
    tblcom_usersmonitoreando: TSmallintField;
    tblcom_usersidimpresora: TIntegerField;
    tblcom_usershora: TTimeField;
    tblcom_usersfecha: TDateField;
    tblcom_userscom1: TStringField;
    tblcom_userscom2: TStringField;
    tblcom_usersusuario: TStringField;
    tblcom_usersTipoLinea: TIntegerField;
    tblcom_usersEnviaCorreo: TSmallintField;
    rbenviar: TRzCheckBox;
    lbufh: TRzLabel;
    procedure edclaveButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edclaveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure telnormalKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure buscarlocate;
  end;

var
  frmmodems: Tfrmmodems;

implementation

uses Urecursos, Uprincipal, Udm, Ubusquedas, Udmrep;

{$R *.dfm}

procedure Tfrmmodems.buscarlocate;
begin
//nrCommTAPI1.Active := true;
tblcom_users.Active:=true;
if tblcom_users.Locate('idmaq',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    telnormal.ItemIndex:=telnormal.Items.IndexOf(tblcom_users.FieldByName('com1').AsString);
    basecelular.ItemIndex:=basecelular.Items.IndexOf(tblcom_users.FieldByName('com2').AsString);
    rgtypecall.ItemIndex := tblcom_usersTipoLinea.AsInteger;
    lbufh.Caption := UFH(tblcom_users);
    if tblcom_usersEnviaCorreo.Asvariant = 1 then
      rbEnviar.Checked := true
    else
      rbEnviar.Checked := false;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa id no existe','Información',mb_ok+mb_iconinformation);
    tblcom_users.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;


procedure Tfrmmodems.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmmodems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmmodems.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblcom_users,btncancelar,btnalta,btnmodificar)
end;

procedure Tfrmmodems.FormShow(Sender: TObject);
begin
//nrCommTAPI1.Active := False;
telnormal.ItemIndex := -1;
basecelular.ItemIndex := -1;
edclave.SetFocus;
end;

procedure Tfrmmodems.edclaveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      id,
  com,
  ip,
  name,
  typecall,
  monitoreo,
  online,
  com1,
  com2,

      frmbusquedas.query:='Select id,com,ip,name as Nombre,typecall,monitoreo,online,com1,com2 From com_users order by id';
      frmbusquedas.campo_retorno:='id';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'com_users';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblcom_users.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             //edclave.OnButtonClick(self);
             navegador.Enabled:=true;
            end;
    end;
 }
end;

procedure Tfrmmodems.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
//   nrCommTAPI1.Active := True;
    //trae el maximo idarea + 1
    querys('select max(idmaq) as id from maquinas',0,frmprincipal.SqlGeneral);
      edclave.Text:=inttostr(frmprincipal.sqlgeneral.Fields.Fields[0].Asinteger+1);
      edclave.Enabled:=false;
   //pone la tabla de areas en modo de insercion
   tblcom_users.Active:=true;
   tblcom_users.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edclave.Enabled:=false;
   ednombre.Enabled:=true;
   telnormal.Enabled := true;
     basecelular.Enabled := true;
     rgtypecall.Enabled := true;
     rbEnviar.Enabled := true;
     edip.Enabled := true;
     lbufh.Caption := '';

   telnormal.SetFocus;
   navegador.Enabled:=false;
   end
   else
   begin
   if ExisteNombre(ednombre,'select pcname from maquinas where pcname <>'+quotedstr(ednombre.Text)+' and ipadress='+quotedstr(edip.Text),dmreportes.sqlgeneral) = 1 then
       exit;
     ednombre.Enabled:=false;
     edclave.Enabled:=true;
     telnormal.Enabled := false;
     basecelular.Enabled := false;
     rgtypecall.Enabled := false;
     rbEnviar.Enabled := false;
     edip.Enabled := false; 
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Máquina';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta la maquina '+ednombre.text,1);
      //trae el maximo idarea
    querys('select max(idmaq) as id from maquinas',0,dmreportes.sqlgeneral);
      edclave.Text:=inttostr(dmreportes.sqlgeneral.Fields.Fields[0].Asinteger+1);
    tblcom_users.fieldbyname('usuario').AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
    tblcom_users.fieldbyname('fecha').AsString:=datetostr(FechaServidor);
    tblcom_users.fieldbyname('hora').AsString:=timetostr(HoraServidor);
    tblcom_users.fieldbyname('com1').AsString:= telnormal.Items.Strings[telnormal.itemindex];
    tblcom_users.fieldbyname('com2').AsString:=basecelular.Items.Strings[basecelular.itemindex];
    if  rbEnviar.Checked = true then
       tblcom_usersEnviaCorreo.Asvariant := 1
    else
      tblcom_usersEnviaCorreo.Asvariant := 0;
     //guarda los datos
     tblcom_users.Post;
     // tblcom_users.Active:=false;
    // edclave.Text:='';
//    nrCommTAPI1.Active := False;
     edclave.SetFocus;

   end;

end;

procedure Tfrmmodems.btnborrarClick(Sender: TObject);
//var hija:tfrmrelacionborrar;
begin
{
//busca que el area no este siendo usado en la tabla de usuarios
querys('select usuarios.idusuario as Id,usuarios.nombre as Nombre,usuarios.apaterno as Apaterno,usuarios.amaterno as Amaterno from usuarios inner join areas on areas.idarea = usuarios.idusuario where usuarios.idarea='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Esta area esta relacionada con un(os) Usuario(s),primero debe de eliminar esa relacion para borrar la Area!','Operacion No Realizada',mb_iconwarning)
else
 begin
//verifica que no esxista la area en la tabla de puestos
  querys('select puestos.idpuesto as Id,puestos.nombre as Nombre from puestos inner join areas on areas.idarea=puestos.idarea where puestos.idarea='+edclave.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
      application.MessageBox('Esta area esta relacionada con un(os) Puestos,primero debe de eliminar ese relacion para borrar el area','Operacion No Realizada',mb_iconwarning)
  else
  }
  if application.MessageBox('Estas seguro que deseas borrar esta Configuración?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino de com_user : '+tblcom_users.fieldbyname('name').asstring,3);
      tblcom_users.Delete;
      application.MessageBox('Eliminación del Exitosa','Información',mb_ok);
      tblcom_users.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblcom_users.Active:=false;
      //cbocom.Text:='';

   end;


end;

procedure Tfrmmodems.btnmodificarClick(Sender: TObject);
begin

if btnmodificar.Caption = '&Editar' then
   begin
//     nrCommTAPI1.Active := True;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     edclave.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     edclave.Enabled:=false;
     telnormal.Enabled := true;
     basecelular.Enabled := true;
     rgtypecall.Enabled := true;
     rbEnviar.Enabled := true;
   //  edip.Enabled := true;
     tblcom_users.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
 //    if ExisteNombre(ednombre,'select pcname from maquinas where pcname <>'+quotedstr(ednombre.Text)+' and ip='+quotedstr(edip.Text),dmon.sqlgeneral) = 1 then
  //      exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de configuración de la máquina Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     telnormal.Enabled := false;
     basecelular.Enabled := false;
     rgtypecall.Enabled := false;
     rbEnviar.Enabled := false;
     edip.Enabled := false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     tblcom_usersTipoLinea.AsInteger := rgtypecall.ItemIndex;
     tblcom_users.fieldbyname('usuario').AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
     tblcom_users.fieldbyname('fecha').AsString:=datetostr(FechaServidor);
     tblcom_users.fieldbyname('hora').AsString:=timetostr(HoraServidor);
     tblcom_users.fieldbyname('com1').AsString:= telnormal.Items.Strings[telnormal.itemindex];
     tblcom_users.fieldbyname('com2').AsString:=basecelular.Items.Strings[basecelular.itemindex];
     if  rbEnviar.Checked = true then
       tblcom_usersEnviaCorreo.Asvariant := 1
    else
      tblcom_usersEnviaCorreo.Asvariant := 0;
     tblcom_users.Post;
     frmprincipal.ucprincipal.Log('Editó en maquinas '+tblcom_users.fieldbyname('pcname').AsString,2);
     edclave.Text:='';
     edclave.Enabled:=true;
     tblcom_users.Active:=false;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
//     nrCommTAPI1.Active := False;
  end;
 
end;

procedure Tfrmmodems.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcom_users.Cancel;
     tblcom_users.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Area Actual';
         btnmodificar.ImageIndex:=2;
         edclave.Text:='';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Area';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
       telnormal.Enabled := false;
       basecelular.Enabled := false;
       rgtypecall.Enabled := false;
       rbEnviar.Enabled := false;
       edip.Enabled := false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
close;

end;

procedure Tfrmmodems.telnormalKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
  end;
end;

procedure Tfrmmodems.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idmaq,ipadress,pcname,com1,com2,TipoLinea,usuario as Usuario,hora as Hora,fecha as Fecha From maquinas order by ipadress';
      frmbusquedas.campo_retorno:='idmaq';
      frmbusquedas.campo_busqueda:='pcname';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'maquinas';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblcom_users.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmmodems.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
telnormal.ItemIndex := telnormal.Items.IndexOf(tblcom_users.FieldByName('com1').AsString);
basecelular.ItemIndex := basecelular.Items.IndexOf(tblcom_users.FieldByName('com2').AsString);
edclave.text := tblcom_users.fieldbyname('idmaq').AsString;
lbufh.Caption := UFH(tblcom_users);
rgtypecall.ItemIndex := tblcom_usersTipoLinea.AsInteger;
   if tblcom_usersEnviaCorreo.Asvariant = 1 then
      rbEnviar.Checked := true
    else
      rbEnviar.Checked := false;
end;

procedure Tfrmmodems.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmodems.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
    tblcom_users.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    telnormal.ItemIndex := -1;
    basecelular.ItemIndex := -1;
    rgtypecall.ItemIndex := -1;
    rbEnviar.checked := false;
    lbufh.Caption := '';
  end;
end;

end.
