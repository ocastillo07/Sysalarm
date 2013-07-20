//2008/02/28 dalyla zona horaria ok
unit Uturnos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, RzCmboBx, RzDBCmbo, DBCtrls, ComCtrls, ToolWin,
  ExtCtrls, RzDBNav, RzBtnEdt, MyAccess, RzDTP, RzDBDTP;

type
  Tfrmturnos = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSturnos: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblturnos: TMyTable;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    lblgiro: TRzLabel;
    cboarea: TRzComboBox;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    tblturnosidturno: TIntegerField;
    tblturnosnombre: TStringField;
    tblturnosHoraInicio: TTimeField;
    tblturnosHoraFin: TTimeField;
    tblturnosidarea: TIntegerField;
    dtpinicio: TRzDBDateTimePicker;
    dtpfin: TRzDBDateTimePicker;
    tblturnosusuario: TStringField;
    tblturnoshora: TStringField;
    tblturnosfecha: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure tblturnosAfterOpen(DataSet: TDataSet);
    procedure tblturnosAfterClose(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure redescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure cboareaNotInList(Sender: TObject);
  private
    { Private declarations }
   //procedure carga_combo(const combo:trzcombobox;Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmturnos: Tfrmturnos;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmturnos.buscarlocate;
begin
tblturnos.Active:=true;
if tblturnos.Locate('idturno',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(tblturnos);
    if tblturnosidarea.AsString <> '' then
      begin
       querys('select nombre from areas where idarea='+tblturnosidarea.AsString,0,sqlgeneral);
       cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
      end
     else
       cboarea.Text:='';
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Area no Existe','Información',mb_ok+mb_iconinformation);
    tblturnos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;


end;


procedure Tfrmturnos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;
 {
procedure tfrmturnos.carga_combo(const combo:trzcombobox;Sender :TObject);
begin
      combo.Clear;
      //asigna todos los nombre a el combo pedido
      sqlgeneral.first;
       while not sqlgeneral.eof do
          begin
           combo.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
           sqlgeneral.next;
          end;
end;  }

procedure Tfrmturnos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    navegador.Enabled:=false;
    //trae el maximo idturno + 1
    querys('select max(idturno) as turno from turnos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    lbufh.Caption := '';
   CargaCombo('select nombre from areas order by nombre','Areas capturadas',cboarea);
   //pone la tabla de turnos en modo de insercion
   tblturnos.Active:=true;
   tblturnos.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   dtpinicio.Time := HoraServidor;
   dtpfin.Time := HoraServidor;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edclave.Enabled:=false;
   ednombre.Enabled:=true;
   cboarea.Enabled:=true;
   dtpinicio.Enabled:=true;
   dtpfin.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   end
   else
   begin
     //btnbuscar.Enabled:=true;
     if cboarea.Text = '' then
       begin
        application.MessageBox('Debe de especificar a que Area pertenece este Turno, para poder guardar!','Aviso',mb_iconinformation);
        exit;
       end;
       
     if ExisteNombre(ednombre,'select nombre from turnos where idturno<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     dtpinicio.Enabled:=false;
     dtpfin.Enabled:=false;
     edclave.Enabled:=true;
     ednombre.Enabled:=false;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Turno';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de alta el Turno '+ednombre.text,1);

      //querys que me trae el numero del giro dependiendo del nombre
      querys('select idarea from areas where nombre='+quotedstr(cboarea.Text),0,sqlgeneral);
      tblturnos.FieldByName('idarea').Value:=sqlgeneral.Fields.Fields[0].AsInteger;
      //trae el maximo idturno + 1
      querys('select max(idturno) as idturno from turnos',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     tblturnosidturno.value:=strtoint(edclave.text);
     tblturnosusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
     tblturnosfecha.AsString:=datetostr(FechaServidor);
     tblturnoshora.AsString:=timetostr(HoraServidor);
     //guarda los datos
     tblturnos.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
 //     querys('update turnos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idturno='+edclave.Text,1,sqlgeneral);
     tblturnos.Active:=false;
     edclave.Text:='';
     ednombre.Enabled:=false;
     cboarea.Enabled:=false;
     cboarea.Text:='';
     edclave.SetFocus;
   end;
end;

procedure Tfrmturnos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='SELECT turnos.idturno,turnos.nombre as Nombre,turnos.HoraInicio,turnos.HoraFin,areas.nombre as Area,turnos.usuario as Usuario,turnos.fecha as Fecha,turnos.hora as Hora FROM turnos INNER JOIN areas ON ' +
                          ' (areas.idarea = turnos.idarea) order by turnos.nombre';
      frmbusquedas.campo_retorno:='idturno';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='turnos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblturnos.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmturnos.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblturnos.Active:=true;
if tblturnos.Locate('idturno',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    if tblturnosidarea.AsString <> '' then
      begin
       querys('select nombre from areas where idarea='+tblturnosidarea.AsString,0,sqlgeneral);
       cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
      end
     else
       cboarea.Text:='';
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa categoria no Existe','Información',mb_ok+mb_iconinformation);
    tblturnos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmturnos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblturnos.Cancel;
     tblturnos.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Categoria Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Categoria';
          btnalta.ImageIndex:=5;
        end;
       dtpinicio.Enabled:=true;
       dtpfin.Enabled:=true;
       ednombre.Enabled:=false;
       cboarea.Enabled:=false;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
 end
else
close;
end;

procedure Tfrmturnos.btnmodificarClick(Sender: TObject);
var giro,zh:string;
begin
if btnmodificar.Caption = '&Editar' then
   begin

     navegador.Enabled:=false;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     edclave.Enabled:=false;
     dtpinicio.Enabled:=true;
     dtpfin.Enabled:=true;
     cboarea.Enabled:=true;
     giro:=cboarea.Text;
     //carga el combo giros con los giros de la tabla de giros
     CargaCombo('select nombre from areas order by nombre','Areas capturadas',cboarea);
     cboarea.Text:=giro;
     ednombre.setfocus;

   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from turnos where idturno<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del turno Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     dtpinicio.Enabled:=false;
     dtpfin.Enabled:=false;
     cboarea.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
     zh := sqlgeneral.FieldByName('valor').Asstring;
     frmprincipal.ucprincipal.Log('Edito el turno '+tblturnosnombre.AsString,2);
     querys('select idarea from areas where nombre='+quotedstr(cboarea.Text),0,sqlgeneral);
     ShortTimeFormat := 'HH:mm:ss';
     querys('update turnos set nombre='+quotedstr(ednombre.Text)+',idarea='+ sqlgeneral.FieldByName('idarea').Asstring+',HoraInicio="'+
            FormatDateTime('HH:mm:ss',dtpinicio.Time)+'",HoraFin="'+FormatDateTime('HH:mm:ss',dtpfin.Time)+'", usuario = "'+
            frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha=cast(adddate(now(), interval '+zh+' hour) as date), hora=cast(adddate(now(), interval '+zh+' hour) as time) where idturno='+edclave.Text,1,sqlgeneral);
     tblturnos.Active:=false;
     edclave.Enabled:=true;
     cboarea.Text:='';
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.Setfocus;
     end;
end;

procedure Tfrmturnos.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que la area no este siendo usado en la tabla de patrullaje
querys('select idpatrullaje  from patrullaje where idturno='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este Turno esta relacionado con un(os) Patrullaje(s),primero debe de eliminar esa relacion para borrar el Turno!','Operacion No Realizada',mb_iconwarning)
else
 begin
  if application.MessageBox('Estas seguro que deseas borrar este Turno?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Turno '+tblturnosnombre.asstring,3);
      tblturnos.Delete;
      application.MessageBox('Eliminacion del Turno Exitosa','Información',mb_ok);
      tblturnos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblturnos.Active:=false;
      edclave.text:='';
   end;
end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmturnos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     dtpinicio.SetFocus;
  end;
end;

procedure Tfrmturnos.tblturnosAfterOpen(DataSet: TDataSet);
begin
navegador.Enabled:=true;
end;

procedure Tfrmturnos.tblturnosAfterClose(DataSet: TDataSet);
begin
navegador.Enabled:=false;
end;

procedure Tfrmturnos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin

edclave.Text:=dsturnos.DataSet.fieldbyname('idturno').AsString;
querys('select nombre from areas where idarea='+quotedstr(tblturnosidarea.AsString),0,sqlgeneral);
cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
lbufh.Caption := UFH(tblturnos);
end;

procedure Tfrmturnos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblturnos,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmturnos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl])
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblturnos.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblturnos.Locate('idturno',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    if tblturnosidgiro.AsString <> '' then
      begin
       querys('select nombre from giros where idgiro='+tblturnosidgiro.AsString,0,sqlgeneral);
       cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
      end
     else
       cboarea.Text:='';
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa categoria no Existe','Información',mb_ok+mb_iconinformation);
    tblturnos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmturnos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);

     //edclave.OnButtonClick(self);
   end;


   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;

end;

procedure Tfrmturnos.redescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmturnos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
   begin
   cboarea.Text:='';
   tblturnos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmturnos.FormShow(Sender: TObject);
begin
edclave.setfocus;
end;

procedure Tfrmturnos.cboareaNotInList(Sender: TObject);
begin
cboarea.ItemIndex:=0;
end;

end.
