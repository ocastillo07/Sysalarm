unit UFormaPagoPre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzButton,
  RzDBEdit, Mask, RzEdit, RzBtnEdt, MyAccess, MemDS, DBAccess;

type
  TfrmFormasPagoPre = class(TForm)
    sqlgeneral: TMyQuery;
    tblformas: TMyTable;
    DSFormas: TDataSource;
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    edporcentaje: TRzDBEdit;
    edparcialidad: TRzDBEdit;
    btnalta: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    tblformasidopcion: TIntegerField;
    tblformasnombre: TStringField;
    tblformasporcentaje: TFloatField;
    tblformasparcialidades: TSmallintField;
    tblformasusuario: TStringField;
    tblformasfecha: TStringField;
    tblformashora: TStringField;
    RzLabel5: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edporcentajeKeyPress(Sender: TObject; var Key: Char);
    procedure edparcialidadKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblformasBeforePost(DataSet: TDataSet);
    procedure edporcentajeExit(Sender: TObject);
    procedure edparcialidadExit(Sender: TObject);
  private
    procedure habilita(hab:boolean);
    procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormasPagoPre: TfrmFormasPagoPre;

implementation

uses Urecursos, Ubusquedas, Uprincipal, Udm;

{$R *.dfm}

procedure TfrmFormasPagoPre.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure TfrmFormasPagoPre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmFormasPagoPre.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblformas,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmFormasPagoPre.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idopcion,nombre, porcentaje, parcialidades, usuario as Usuario,fecha as Fecha,hora as Hora From FormasPagoPre order by idopcion';
        campo_retorno:='idopcion';
        campo_busqueda:='nombre';
        tblorigen := 'FormasPagoPre';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblformas.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmFormasPagoPre.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmFormasPagoPre.edclaveChange(Sender: TObject);
begin
 if edclave.Text = '' then begin
    tblformas.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmFormasPagoPre.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmFormasPagoPre.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmFormasPagoPre.edporcentajeKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if (key=#13)and(edporcentaje.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmFormasPagoPre.edparcialidadKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,true);
if (key=#13)and(edparcialidad.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmFormasPagoPre.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DSFormas.dataset.fieldbyname('idopcion').AsString;
end;

procedure TfrmFormasPagoPre.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idopcion)from FormasPagoPre',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblformas.Active:=true;
    tblformas.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from FormasPagoPre where idopcion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Forma de Pago para Presupuestos';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Forma de Pago para Presupuestos'+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idopcion) from FormasPagoPre',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblformas.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update FormasPagoPre set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idopcion='+edclave.Text,1,sqlgeneral);
     tblformas.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmFormasPagoPre.btnborrarClick(Sender: TObject);
begin
//valida que no se use en la tabla de travel
  querys('select idopcion from presupuestos2 where idopcion='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta Forma de Pago para Presupuestos esta siendo usado por un Presupuesto y no podra ser eliminada hasta que se borre el Presupuesto o haga referencia a otra Forma de Pago para Presupuestos!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esta Forma de Pago para Presupuestos?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la Forma de Pago para Presupuestos '+tblformasnombre.asstring,3);
        tblformas.Delete;
        application.MessageBox('Eliminacion de la Forma de Pago para Presupuestos Exitosa','Información',mb_ok);
        tblformas.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblformas.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmFormasPagoPre.btnmodificarClick(Sender: TObject);
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
     habilita(true);
     edclave.Enabled:=false;
     tblformas.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from FormasPagoPre where idopcion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Forma de Pago para Presupuestos actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Forma de Pago para Presupuestos '+tblformasnombre.AsString,2);
     tblformas.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update FormasPagoPre set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idopcion='+edclave.Text,1,sqlgeneral);
     tblformas.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmFormasPagoPre.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblformas.Cancel;
     tblformas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Forma de Pago para Presupuestos Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Forma de Pago para Presupuestos';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       habilita(false);
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmFormasPagoPre.buscarlocate;
begin
tblformas.Active:=true;
if tblformas.Locate('idopcion',edclave.Text,[]) then
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
    application.MessageBox('Esa Forma de Pago para Presupuestos no Existe','Información',mb_ok+mb_iconinformation);
    tblformas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmFormasPagoPre.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
edporcentaje.Enabled := hab;
edparcialidad.Enabled := hab;
end;

procedure TfrmFormasPagoPre.tblformasBeforePost(DataSet: TDataSet);
begin
tblformasidopcion.AsString:=edclave.Text;
end;

procedure TfrmFormasPagoPre.edporcentajeExit(Sender: TObject);
begin
if (strtoint(edporcentaje.Text) > 100) or (strtoint(edporcentaje.Text) < -100) then
 edporcentaje.Text := '0';
end;

procedure TfrmFormasPagoPre.edparcialidadExit(Sender: TObject);
begin
if strtoint(edparcialidad.Text) > 9 then
 edparcialidad.Text := '9';
end;

end.
