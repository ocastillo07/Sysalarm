unit Uestatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, RzPanel, RzRadGrp, RzDBRGrp, DBCtrls,
  RzDBNav, RzBtnEdt;

type
  Tfrmstatus_eventos = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSstatus: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblstatus: TMyTable;
    tblstatusidestatus: TIntegerField;
    tblstatusnombre: TStringField;
    rgfinaliza: TRzDBRadioGroup;
    tblstatusfinaliza: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblstatusBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure tblstatusAfterScroll(DataSet: TDataSet);
    procedure tblstatusAfterEdit(DataSet: TDataSet);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblstatusAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  procedure querys(const query:string;const actualizacion:integer;Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmstatus_eventos: Tfrmstatus_eventos;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, about, Urelacionborrar;

{$R *.dfm}

procedure tfrmstatus_eventos.querys(const query:string;const actualizacion:integer;Sender: TObject);
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


procedure Tfrmstatus_eventos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmstatus_eventos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin

    edclave.Enabled:=false;
   //pone la tabla de estatus en modo de insercion
   tblstatus.Active:=true;
   tblstatus.Insert;
    //trae el maximo idstatus + 1
    querys('select max(idestatus) as idestatus from estatus_eventos',0,self);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   rgfinaliza.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from estatus_eventos where idestatus<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Estatus';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta al Estatus Eventos'+ednombre.text,1);
      //trae el maximo idstatus + 1
    querys('select max(idestatus) as idestatus from estatus_eventos',0,self);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblstatus.Post;
       //actualiza los datos de hora,fecha de creacion y usuario
      querys('update estatus_eventos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idestatus='+edclave.Text,1,self);
     edclave.Enabled:=true;
     ednombre.Enabled:=false;
     rgfinaliza.Enabled:=false;
     tblstatus.Active:=false;
     edclave.Text:='';
     //btnbuscar.Enabled:=true;
     edclave.SetFocus;
     navegador.Enabled:=TRUE;
   end;
end;

procedure Tfrmstatus_eventos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idestatus,nombre as Nombre,finaliza as Finaliza,usuario as Usuario,fecha as Fecha,hora as Hora From estatus_eventos order by idestatus';
      frmbusquedas.campo_retorno:='idestatus';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='estatus_eventos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblstatus.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             edclave.OnButtonClick(self);
            end;
    end;
end;

procedure Tfrmstatus_eventos.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblstatus.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblstatus.Locate('idestatus',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese estatus no Existe','Información',mb_ok+mb_iconinformation);
    tblstatus.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmstatus_eventos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblstatus.Cancel;
     tblstatus.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del estatus Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un estatus';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       rgfinaliza.Enabled:=false; 
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.Text:='';
       edclave.SetFocus;
 end
else
close;
end;

procedure Tfrmstatus_eventos.btnmodificarClick(Sender: TObject);
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
     rgfinaliza.Enabled:=true;
     edclave.Enabled:=false;
     tblstatus.Edit;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from estatus_eventos where idestatus<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del estatus Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     rgfinaliza.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el estatus '+tblstatusnombre.AsString,2);
     tblstatus.Post;
     tblstatus.Active:=true;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     ednombre.text:='';
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmstatus_eventos.tblstatusBeforePost(DataSet: TDataSet);
begin
tblstatusidestatus.AsString:=edclave.Text;
end;

procedure Tfrmstatus_eventos.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el estatus no este siendo usado en la tabla de prospectos
querys('SELECT agenda_vendedores.idevento AS IdEvento,agenda_vendedores.idoportunidad AS IdOportunidad FROM agenda_vendedores INNER JOIN estatus_eventos ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE estatus_eventos.idestatus ='+edclave.Text,0,self);
if sqlgeneral.RecordCount > 0 then
 application.MessageBox('Este Estatus esta relacionado con un(os) Evento(s) de Vendedores,primero debe de eliminar ese relacion para borrar el Estatus','Operacion No Realizada!',mb_iconwarning)
else
  if application.MessageBox('Estas Seguro que deseas borrar este estatus?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el estatus '+tblstatusnombre.asstring,3);
      tblstatus.Delete;
      application.MessageBox('Eliminacion del estatus Exitosa','Información',mb_ok);
      tblstatus.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblstatus.Active:=false;
      //btnbuscar.Enabled:=true;
      edclave.Enabled:=true;
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

procedure Tfrmstatus_eventos.tblstatusAfterScroll(DataSet: TDataSet);
begin
edclave.Text:=inttostr(TBLstatusidestatus.AsInteger);
end;

procedure Tfrmstatus_eventos.tblstatusAfterEdit(DataSet: TDataSet);
begin

if tblstatus.State = dsedit then

    navegador.Enabled:=false
  else
    navegador.Enabled:=true;

end;

procedure Tfrmstatus_eventos.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     edclave.OnButtonClick(self);
   end;
   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure Tfrmstatus_eventos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblstatus.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblstatus.Locate('idestatus',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese estatus no Existe','Información',mb_ok+mb_iconinformation);
    tblstatus.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

end;

procedure Tfrmstatus_eventos.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     rgfinaliza.SetFocus;
  end;
end;

procedure Tfrmstatus_eventos.edclaveChange(Sender: TObject);
begin
 if edclave.Text = '' then
tblstatus.Active:=false;

end;

procedure Tfrmstatus_eventos.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmstatus_eventos.tblstatusAfterOpen(DataSet: TDataSet);
begin
rgfinaliza.Enabled := false;
end;

end.
