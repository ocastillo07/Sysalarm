unit Utipo_servicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt, RzDBCmbo,
  RzRadChk, RzDBChk;

type
  Tfrmtipo_servicios = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DStipo_servicios: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tbltipo_oportunidad: TMyTable;
    tbltipo_oportunidadidtipo_oportunidad: TIntegerField;
    tbltipo_oportunidadnombre: TStringField;
    tbltipo_oportunidadusuario: TStringField;
    tbltipo_oportunidadfecha: TStringField;
    tbltipo_oportunidadhora: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    cbolinea: TRzDBLookupComboBox;
    RzLabel2: TRzLabel;
    tbllineas: TMyTable;
    DSlinea: TDataSource;
    tbltipo_oportunidadidlinea: TIntegerField;
    lbufh: TRzLabel;
    RzLabel3: TRzLabel;
    cbunidad: TRzDBLookupComboBox;
    tblunidad: TMyTable;
    dsunidad: TDataSource;
    tbltipo_oportunidadidUnidadNegocio: TIntegerField;
    tbltipo_oportunidadModificaCuenta: TIntegerField;
    tbltipo_oportunidadestatusCombo: TBooleanField;
    RzDBCheckBox1: TRzDBCheckBox;
    RzDBCheckBox3: TRzDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tbltipo_oportunidadBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure tbltipo_oportunidadAfterEdit(DataSet: TDataSet);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure tbltipo_oportunidadAfterOpen(DataSet: TDataSet);
    procedure tbltipo_oportunidadAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  procedure querys(const query:string;const actualizacion:integer;Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmtipo_servicios: Tfrmtipo_servicios;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure tfrmtipo_servicios.buscarlocate;
begin

tbltipo_oportunidad.Active:=true;
if tbltipo_oportunidad.Locate('idtipo_oportunidad',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(TBLtipo_oportunidad);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Tipo de Oportunidad no Existe','Información',mb_ok+mb_iconinformation);
    tbltipo_oportunidad.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;



end;



procedure tfrmtipo_servicios.querys(const query:string;const actualizacion:integer;Sender: TObject);
begin
with sqlgeneral do
   begin
      //trae todos los nombres de la tabla especificada
      close;
      sql.Clear;
      sql.Add(query);
      if actualizacion = 0 then
        open
      else
        execute;
    end;
end;


procedure Tfrmtipo_servicios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmtipo_servicios.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    tbllineas.Active := true;
    edclave.Enabled:=false;
   //pone la tabla de tipo_oportunidad en modo de insercion
   tbltipo_oportunidad.Active:=true;
   tbltipo_oportunidad.Insert;
   //trae el maximo idtipo_oportunidad + 1
    querys('select max(idtipo_oportunidad) as idtipo_oportunidad from tipo_oportunidad',0,self);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   cbolinea.Enabled := true;
   cbunidad.Enabled := true;
   ednombre.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from tipo_oportunidad where idtipo_oportunidad<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta a un Tipo Oportunidad';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     cbolinea.Enabled := false;
     cbunidad.Enabled := false;
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta al Tipo de Oportunidad'+ednombre.text,1);
       //trae el maximo idtipo_oportunidad + 1
     querys('select max(idtipo_oportunidad) as idtipo_oportunidad from tipo_oportunidad',0,self);
        edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tbltipo_oportunidad.Post;
     tbltipo_oportunidad.Active:=false;
    //actualiza los datos de hora,fecha de creacion y usuario
    querys('update tipo_oportunidad  set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idtipo_oportunidad='+edclave.Text,1,self);
    //btnbuscar.Enabled:=true;
    ednombre.Enabled:=false;
    edclave.Enabled:=true;
    edclave.Text:='';
    edclave.SetFocus;
    navegador.Enabled:=TRUE;
   end;
end;

procedure Tfrmtipo_servicios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idtipo_oportunidad,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From tipo_oportunidad order by idtipo_oportunidad';
      frmbusquedas.campo_retorno:='idtipo_oportunidad';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='tipo_oportunidad';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbltipo_oportunidad.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;
end;

procedure Tfrmtipo_servicios.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltipo_oportunidad.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tbltipo_oportunidad.Locate('idtipo_oportunidad',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Tipo de Oportunidad no Existe','Información',mb_ok+mb_iconinformation);
    tbltipo_oportunidad.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmtipo_servicios.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tbltipo_oportunidad.Cancel;
     tbltipo_oportunidad.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Tipo de Oportunidad Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Tipo de Oportunidad';
          btnalta.ImageIndex:=5;

        end;
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
       cbolinea.Enabled := false;
       cbunidad.Enabled := false;
 end
else
close;
end;

procedure Tfrmtipo_servicios.btnmodificarClick(Sender: TObject);
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
     cbolinea.Enabled := true;
     cbunidad.Enabled := true;
     edclave.Enabled:=false;
     tbllineas.Active := true;
     tbltipo_oportunidad.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from tipo_oportunidad where idtipo_oportunidad<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Tipo de Oportunidad Actual';
     btnmodificar.ImageIndex:=2;
     cbolinea.Enabled := false;
     cbunidad.Enabled := false;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Tipo de Oportunidad '+tbltipo_oportunidadnombre.AsString,2);
     tbltipo_oportunidad.Post;
     tbltipo_oportunidad.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmtipo_servicios.tbltipo_oportunidadBeforePost(DataSet: TDataSet);
begin
tbltipo_oportunidadidtipo_oportunidad.AsString:=edclave.Text;
end;

procedure Tfrmtipo_servicios.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el tipo de oportunidad no este siendo usado en la tabla de agenda vendedores
querys('select agenda_vendedores.idoportunidad as Id,oportunidades.nombre as Nombre,oportunidades.apaterno as Apaterno,oportunidades.amaterno as Amaterno,oportunidades.rsocial  from agenda_vendedores inner join oportunidades on '+
       ' oportunidades.idoportunidad=agenda_vendedores.idoportunidad where agenda_vendedores.idtipo_oportunidad='+edclave.Text,0,self);
if sqlgeneral.RecordCount > 0 then
 application.MessageBox('Este Tipo de Oportunidad esta relacionada con un(os) Evento(s) de Vendedores,primero debe de eliminar ese relacion para borrar la area','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas Seguro que deseas borrar este Tipo de Oportunidad?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Tipo de Oportunidad '+tbltipo_oportunidadnombre.asstring,3);
      tbltipo_oportunidad.Delete;
      application.MessageBox('Eliminacion del Tipo de Oportunidad Exitosa','Información',mb_ok);
      tbltipo_oportunidad.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltipo_oportunidad.Active:=false;
      edclave.Text:='';
      edclave.SetFocus;
   end;

if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmtipo_servicios.tbltipo_oportunidadAfterEdit(
  DataSet: TDataSet);
begin
if tbltipo_oportunidad.State = dsedit then
    navegador.Enabled:=false
  else
    navegador.Enabled:=true;
end;

procedure Tfrmtipo_servicios.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltipo_oportunidad.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tbltipo_oportunidad.Locate('idtipo_oportunidad',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Tipo de Oportunidad no Existe','Información',mb_ok+mb_iconinformation);
    tbltipo_oportunidad.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmtipo_servicios.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
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

procedure Tfrmtipo_servicios.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmtipo_servicios.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbltipo_oportunidad.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmtipo_servicios.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmtipo_servicios.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=inttostr(TBLtipo_oportunidadidtipo_oportunidad.AsInteger);
lbufh.Caption := UFH(TBLtipo_oportunidad);
end;

procedure Tfrmtipo_servicios.tbltipo_oportunidadAfterOpen(
  DataSet: TDataSet);
begin
tbllineas.Active := true;
tblunidad.Active := true;
end;

procedure Tfrmtipo_servicios.tbltipo_oportunidadAfterClose(
  DataSet: TDataSet);
begin
tbllineas.Active := false;
tblunidad.Active := false;
end;

end.                                     
