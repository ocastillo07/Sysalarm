unit Utipos_actividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt;

type
  Tfrmtipos_actividades = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DStipos_actividades: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tbltipos_actividades: TMyTable;
    tbltipos_actividadesidtipo_actividad: TIntegerField;
    tbltipos_actividadesnombre: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    lbufh: TRzLabel;
    tbltipos_actividadesusuario: TStringField;
    tbltipos_actividadeshora: TStringField;
    tbltipos_actividadesfecha: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tbltipos_actividadesBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtipos_actividades: Tfrmtipos_actividades;

implementation

uses Udm, Ubusquedas, Uprincipal, Urelacionborrar, Urecursos;

{$R *.dfm}

procedure Tfrmtipos_actividades.buscarlocate;
begin

tbltipos_actividades.Active:=true;
if tbltipos_actividades.Locate('idtipo_actividad',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(tbltipos_actividades);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo de actividad no Existe','Información',mb_ok+mb_iconinformation);
    tbltipos_actividades.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;


end;

procedure Tfrmtipos_actividades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmtipos_actividades.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin

    edclave.Enabled:=false;
   //pone la tabla de estatus en modo de insercion
   tbltipos_actividades.Active:=true;
   tbltipos_actividades.Insert;
       //trae el maximo idtipo_actividad + 1
    querys('select max(idtipo_actividad)+1 as idtipo_actividad from tipos_actividades',0,sqlgeneral);
     if sqlgeneral.FieldByName('idtipo_actividad').AsString = '' then
      edclave.Text:='1'
    else
    edclave.Text:=sqlgeneral.Fields.Fields[0].AsString;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Tipo de Actividad';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta al tipo de actividad '+ednombre.text,1);
        //trae el maximo idtipo_actividad + 1
    querys('select max(idtipo_actividad)+1 as idtipo_actividad from tipos_actividades',0,sqlgeneral);
    if sqlgeneral.FieldByName('idtipo_actividad').AsString = '' then
      edclave.Text:='1'
    else
      edclave.Text:=sqlgeneral.Fields.Fields[0].AsString;
     //guarda los datos
     tbltipos_actividades.Post;
     tbltipos_actividades.Active:=false;
     //btnbuscar.Enabled:=true;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     navegador.Enabled:=true;
   end;
end;

procedure Tfrmtipos_actividades.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idtipo_actividad,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From tipos_actividades order by nombre';
      frmbusquedas.campo_retorno:='idtipo_actividad';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='tipos_actividades';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbltipos_actividades.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;
end;

procedure Tfrmtipos_actividades.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltipos_actividades.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tbltipos_actividades.Locate('idtipo_actividad',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo de actividad no Existe','Información',mb_ok+mb_iconinformation);
    tbltipos_actividades.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmtipos_actividades.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tbltipos_actividades.Cancel;
     tbltipos_actividades.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del tipo de actividad Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un tipo de actividad';
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
       navegador.Enabled:=false;
 end
else
close;
end;

procedure Tfrmtipos_actividades.btnmodificarClick(Sender: TObject);
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
     edclave.Enabled:=false;
     tbltipos_actividades.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del tipo de actividad Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el tipo de actividad= '+tbltipos_actividadesnombre.AsString,2);
     tbltipos_actividades.Post;
     tbltipos_actividades.Active:=true;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     ednombre.text:='';
     edclave.Text:='';
     edclave.SetFocus;
     navegador.Enabled:=true;
     end;
end;

procedure Tfrmtipos_actividades.tbltipos_actividadesBeforePost(DataSet: TDataSet);
begin
///tbltipos_actividadesidtipo_oportunidad.AsString:=edclave.Text;
 tbltipos_actividadesidtipo_actividad.AsString:=edclave.Text;
 tbltipos_actividadesusuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
 tbltipos_actividadesfecha.AsDateTime := date();
 tbltipos_actividadeshora.AsString := timetostr(now());
end;

procedure Tfrmtipos_actividades.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca la activadad no este siendo usado en la tabla de actividades_vendedores
querys('SELECT agenda_vendedores.idevento as IdEvento,agenda_vendedores.idoportunidad as IdOportunidad,estatus_eventos.nombre AS Estatus FROM actividades_vendedores INNER JOIN tipos_actividades ON (actividades_vendedores.idtipo_actividad = '+
       ' tipos_actividades.idtipo_actividad) INNER JOIN agenda_vendedores ON (actividades_vendedores.idevento = agenda_vendedores.idevento) INNER JOIN   estatus_eventos ON (estatus_eventos.idestatus = agenda_vendedores.idestatus) WHERE '+
       ' tipos_actividades.idtipo_actividad = '+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 application.MessageBox('Este Tipo de Actidad esta relacionada con un(os) Evento(s) de la Agenda de Vendedores,primero debe de eliminar ese relacion para borrar el Tipo de Actividad','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas Seguro que deseas borrar este tipo de actividad?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el tipo de actividad '+tbltipos_actividadesnombre.asstring,3);
      tbltipos_actividades.Delete;
      application.MessageBox('Eliminacion del tipo de actividad Exitosa','Información',mb_ok);
      tbltipos_actividades.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltipos_actividades.Active:=false;
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

procedure Tfrmtipos_actividades.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmtipos_actividades.edclaveKeyPress(Sender: TObject;
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

procedure Tfrmtipos_actividades.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmtipos_actividades.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbltipos_actividades.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmtipos_actividades.FormShow(Sender: TObject);
begin
edclave.setfocus;
end;

procedure Tfrmtipos_actividades.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=inttostr(TBLtipos_actividadesidtipo_actividad.AsInteger);
lbufh.Caption := UFH(tbltipos_actividades);
end;

end.
