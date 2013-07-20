unit Umunicipios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, RzDBNav, RzButton, DB, RzEdit, RzBtnEdt,
  StdCtrls, Mask, RzDBEdit, RzLabel, MyAccess, MemDS, DBAccess;

type
  Tfrmmunicipios = class(TForm)
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    sqlgeneral: TMyQuery;
    DSmunicipios: TDataSource;
    tblmunicipios: TMyTable;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    nombre: TRzDBEdit;
    clave: TRzButtonEdit;
    claveestado: TRzButtonEdit;
    tblmunicipiosidmnp: TIntegerField;
    tblmunicipiosnombre: TStringField;
    tblmunicipiosidestado: TIntegerField;
    tblmunicipiosusuario: TStringField;
    tblmunicipioshora: TStringField;
    tblmunicipiosfecha: TStringField;
    tblestados: TMyTable;
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
    procedure buscarlocate;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblMunicipiosBeforePost(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure claveChange(Sender: TObject);
    procedure claveButtonClick(Sender: TObject);
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure nombreKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure claveestadoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure claveestadoButtonClick(Sender: TObject);
    procedure claveestadoChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmunicipios: Tfrmmunicipios;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure Tfrmmunicipios.btnaltaClick(Sender: TObject);
begin
   if btnalta.Caption='&Alta' then
     begin
     //trae el idtipo BC
     if claveestado.text = '' then
        claveestado.Text := '2';
     //selecciona el max idmunicipio del estado si el estado no tiene municipios se valida la diferencia
     querys('select max(idmnp) from municipios where idestado='+claveestado.text,0,sqlgeneral);
     if sqlgeneral.Fields.Fields[0].Asinteger <> 0  then
        clave.Text:=inttostr((strtoint(claveestado.Text) * 1000 ) + ((sqlgeneral.Fields.Fields[0].Asinteger+1)-(strtoint(claveestado.Text) * 1000)))
     else
        clave.text:=inttostr((strtoint(claveestado.Text) * 1000)+ sqlgeneral.Fields.Fields[0].Asinteger +1);
     lbufh.Caption := '';
     clave.Enabled:=false;
     //pone la tabla de Municipios en modo de insercion
     tblmunicipios.Active:=true;
     tblmunicipios.Insert;
     btnalta.Caption:='&Guardar';
     btnalta.Hint:='Guardar los datos de la alta';
     btnalta.ImageIndex:=1;
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Alta';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     nombre.Enabled:=true;
     claveestado.Enabled:=true;
     nombre.SetFocus;
     navegador.Enabled:=false;
     end
   else
     begin
     // Valida la existencia del nombre
     if ExisteNombre(nombre,'select nombre from municipios where idmnp<>'+clave.Text+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
        exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Municipio';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta el Municipio '+nombre.text,1);
     //Trae el max municipio
     querys('select max(idmnp) from municipios where idestado='+claveestado.text,0,sqlgeneral);
     if sqlgeneral.Fields.Fields[0].Asinteger <> 0  then
        clave.Text:=inttostr((strtoint(claveestado.Text) * 1000 ) + ((sqlgeneral.Fields.Fields[0].Asinteger+1)-(strtoint(claveestado.Text) * 1000)))
     else
        clave.text:=inttostr((strtoint(claveestado.Text) * 1000)+ sqlgeneral.Fields.Fields[0].Asinteger + 1);

     tblmunicipiosidestado.AsString:=claveestado.Text;
     //guarda los datos
     tblmunicipios.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update municipios set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmnp='+clave.Text,1,sqlgeneral);
     tblmunicipios.Active:=false;
     nombre.Enabled:=false;
     claveestado.Enabled:=false;
     clave.Enabled:=true;
     clave.Text:='';
     clave.SetFocus;
     claveestado.text:='';
   end;
end;

procedure Tfrmmunicipios.btnborrarClick(Sender: TObject);
begin
//busca que el tipo no este siendo usado en la tabla de colonias
querys('select idmnp from colonias where idmnp='+clave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Municipio esta siendo usado por una colonia y no podra ser eliminado hasta que se borre la Colonia o haga referencia a otra Colonia!','Cuidado',mb_ok+mb_iconinformation)
else
   begin
   if application.MessageBox('Estas Seguro que deseas borrar este Municipio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      begin
      frmprincipal.ucprincipal.Log('Elimino el Municipio '+tblmunicipiosnombre.asstring,3);
      tblmunicipios.Delete;
      application.MessageBox('Eliminacion del Municipio Exitosa','Información',mb_ok);
      tblmunicipios.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblmunicipios.Active:=false;
      clave.text:='';
      clave.SetFocus;
      claveestado.Enabled :=false;
      claveestado.text:='';
      end;
   end;
end;

procedure Tfrmmunicipios.btnmodificarClick(Sender: TObject);
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
     claveestado.Enabled:=true;
     clave.Enabled:=false;
     tblmunicipios.Edit;
     navegador.Enabled:=false;
     nombre.setfocus;
   end
else
  begin
    if ExisteNombre(nombre,'select nombre from municipios where idmnp<>'+clave.Text+' and nombre='+quotedstr(nombre.Text),sqlgeneral) = 1 then
       exit;
    btncancelar.Caption:='&Cerrar';
    btnmodificar.Caption:='&Editar';
    btncancelar.Hint:='Cerrar esta Pantalla';
    btnmodificar.hint:='Editar los datos del Municipio actual';
    btnmodificar.ImageIndex:=2;
    nombre.Enabled:=false;
    claveestado.Enabled:=false;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Edito el Municipio '+tblmunicipiosnombre.AsString,2);
    //Guarda los cambios
    tblmunicipios.Post;
    //actualiza los datos de hora,fecha de creacion y usuario
    querys('update municipios set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmnp='+clave.Text,1,sqlgeneral);
    tblmunicipios.Active:=false;
    clave.Enabled:=true;
    clave.Text:='';
    clave.SetFocus;
  end;
end;

procedure Tfrmmunicipios.btncancelarClick(Sender: TObject);
begin
 if btncancelar.Caption='&Cancelar' then begin
    tblmunicipios.Cancel;
    tblmunicipios.Active:=false;
    navegador.Enabled:=false;
    btncancelar.Hint:='Cerrar esta Pantalla';
    btncancelar.Caption:='&Cerrar';
    lbufh.Caption := '';
    if btnmodificar.Enabled then
       begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Municipio Actual';
         btnmodificar.ImageIndex:=2;
       end;
    if btnalta.Enabled then
       begin
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta un Municipio';
         btnalta.ImageIndex:=5;
       end;
    clave.Text:='';
    claveestado.Text :='';
    nombre.Enabled:=false;
    claveestado.Enabled:=false;
    clave.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    clave.SetFocus;
 end
else
  release;
end;

procedure TfrmMunicipios.buscarlocate;
begin
tblmunicipios.Active:=true;
if tblmunicipios.Locate('idmnp',clave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    claveestado.Text := tblmunicipios.Fields[2].AsString;
    lbufh.Caption := UFH(tblmunicipios);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Municipio no Existe','Información',mb_ok+mb_iconinformation);
    tblmunicipios.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;

procedure TfrmMunicipios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmMunicipios.tblMunicipiosBeforePost(DataSet: TDataSet);
begin
tblmunicipiosidmnp.AsString:=clave.Text;
tblmunicipiosidestado.AsString:=claveestado.Text;
end;

procedure Tfrmmunicipios.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
clave.text:=DSmunicipios.dataset.fieldbyname('idmnp').AsString;
claveestado.Text := tblmunicipios.Fields[2].AsString;
lbufh.Caption := UFH(tblmunicipios);
end;

procedure Tfrmmunicipios.claveChange(Sender: TObject);
begin
 if clave.Text = '' then begin
   tblmunicipios.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure TfrmMunicipios.claveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmMunicipios.claveKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
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

procedure TfrmMunicipios.nombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(nombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMunicipios.FormShow(Sender: TObject);
begin
clave.SetFocus;
end;

procedure Tfrmmunicipios.claveestadoKeyPress(Sender: TObject; var Key: Char);
begin
  key:=ValidaNumeros(key,true);
  if (key=#13)and(claveestado.Text<>'') then
    begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TfrmMunicipios.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblmunicipios,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmMunicipios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idmnp,nombre,idestado as idestado,usuario as Usuario,fecha as Fecha,hora as Hora From municipios order by idmnp';
      frmbusquedas.campo_retorno:='idmnp';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen := 'municipios';
      frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
         begin
           tblmunicipios.Active:=true;
           clave.Text:=frmbusquedas.resultado;
           buscarlocate;
           navegador.Enabled:=true;
         end;
    end;
end;

procedure Tfrmmunicipios.claveestadobuttonclick(Sender: TObject);
begin
  //Trae la forma de busqueda de estado
  frmbusquedas.query:='Select idestado,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From estados order by idestado';
  frmbusquedas.campo_retorno:='idestado';
  frmbusquedas.campo_busqueda:='nombre';
  frmbusquedas.tblorigen := 'estados';
  frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
  frmbusquedas.ShowModal;
  if frmbusquedas.resultado <> '' then
     begin
     tblestados.Active:=true;
     claveestado.Text:=frmbusquedas.resultado;
     //trae el maximo idtipo y valida los valores de millar
     querys('select max(idmnp)+1 from municipios where idestado='+claveestado.text,0,sqlgeneral);
     if  sqlgeneral.Fields.Fields[0].Asinteger <> 0  then
        clave.Text:=inttostr((strtoint(claveestado.Text) * 1000 ) + ((sqlgeneral.Fields.Fields[0].Asinteger)-(strtoint(claveestado.Text) * 1000)))
     else
        clave.text:=inttostr((strtoint(claveestado.Text) * 1000)+ sqlgeneral.Fields.Fields[0].Asinteger + 1);
     clave.Enabled:=true;
     navegador.Enabled:=true;
     end;
end;

procedure Tfrmmunicipios.claveestadoChange(Sender: TObject);
begin
  if claveestado.Text = '' then begin
   tblmunicipios.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   end;
end;

end.
