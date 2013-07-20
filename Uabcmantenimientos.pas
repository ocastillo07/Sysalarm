//2008/02/28 dalyla zona horaria ok
unit Uabcmantenimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCheckBox, cxLabel, cxControls, cxContainer, cxEdit, cxGroupBox,
  StdCtrls, RzCmboBx, RzLabel, RzDBEdit, Mask, RzEdit, RzBtnEdt, ExtCtrls,
  DBCtrls, RzDBNav, DB, MyAccess, MemDS, DBAccess, ComCtrls, RzDTP,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtCombo, LMDCalendarComboBox;

type
  Tfrmabcmantenimientos = class(TForm)
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    cbtipo: TRzComboBox;
    gbdatosm: TcxGroupBox;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel14: TcxLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    sqlgeneral: TMyQuery;
    tblmantenimientos: TMyTable;
    DSmantenimientos: TDataSource;
    tblmantenimientosidmantenimiento: TIntegerField;
    tblmantenimientosnombre: TStringField;
    tblmantenimientostipo: TSmallintField;
    tblmantenimientosf1: TDateField;
    tblmantenimientosf2: TDateField;
    tblmantenimientosf3: TDateField;
    tblmantenimientosf4: TDateField;
    tblmantenimientosusuario: TStringField;
    tblmantenimientosfecha: TStringField;
    tblmantenimientoshora: TStringField;
    dbdprimera: TRzDateTimePicker;
    dbdsegunda: TRzDateTimePicker;
    dbdtercera: TRzDateTimePicker;
    dbdcuarta: TRzDateTimePicker;
    lbufh: TRzLabel;
    procedure cbtipoKeyPress(Sender: TObject; var Key: Char);
    procedure cbtipoSelect(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure tblmantenimientosBeforePost(DataSet: TDataSet);
    procedure cbtipoNotInList(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbtipoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbdprimeraKeyPress(Sender: TObject; var Key: Char);
    procedure dbdsegundaKeyPress(Sender: TObject; var Key: Char);
    procedure dbdterceraKeyPress(Sender: TObject; var Key: Char);
    procedure dbdcuartaKeyPress(Sender: TObject; var Key: Char);
    procedure tblmantenimientosAfterPost(DataSet: TDataSet);
  private
   { procedure deshabilita_fechas_cajas(Sender: TObject);
    procedure habilita_fechas_cajas(Sender: TObject);}
    procedure Limpia;
    procedure buscarlocate;
    procedure TraeMantenimiento(idmant:string);
    procedure visualiza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmabcmantenimientos: Tfrmabcmantenimientos;
  r1,r2,r3,r4,my_path:string;
implementation

uses Uprincipal, Udm, Urecursos, Ubusquedas;

{$R *.dfm}

procedure Tfrmabcmantenimientos.cbtipoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
    begin
    key:=#0;
    visualiza;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tfrmabcmantenimientos.cbtipoSelect(Sender: TObject);
begin
//deshabilita_fechas_cajas(self);
//habilita_fechas_cajas(self);
//dbdprimera.OnChange(self);
visualiza;
end;
 {
procedure tfrmabcmantenimientos.deshabilita_fechas_cajas(Sender: TObject);
begin
dbdprimera.Enabled:=false;
dbdsegunda.Enabled:=false;
dbdtercera.Enabled:=false;
dbdcuarta.Enabled:=false;
end;

procedure tfrmabcmantenimientos.habilita_fechas_cajas(Sender: TObject);
begin
//con este procedimiento dependiendo de que tipo de mantenimiento se halla seleccionado en el combo de tipos de mantenimientos
//se halla seleccionado se habilitan los campos de fecha y checkboxes
if (cbtipo.ItemIndex=0)or(cbtipo.ItemIndex=1)or(cbtipo.ItemIndex=2) then
 begin
   dbdprimera.Enabled:=true;
   dbdsegunda.visible := false;
   dbdtercera.visible := false;
   dbdcuarta.visible := false;
 end;

if (cbtipo.ItemIndex=1)or(cbtipo.ItemIndex=2) then
  begin
    dbdsegunda.Enabled:=true;
    dbdtercera.visible := false;
    dbdcuarta.visible := false;
  end;
if cbtipo.ItemIndex=2 then
   begin
   dbdtercera.Enabled:=true;
   dbdcuarta.Enabled:=true;
   dbdtercera.visible := true;
   dbdcuarta.visible := true;
   end;
end;           }

procedure Tfrmabcmantenimientos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmabcmantenimientos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblmantenimientos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   cbtipo.Text := '';
   dbdprimera.Date:=FechaServidor;
   dbdsegunda.Date:=FechaServidor;
   dbdtercera.Date:=FechaServidor;
   dbdcuarta.Date:=FechaServidor;
   lbufh.Caption := '';
end;
end;

procedure Tfrmabcmantenimientos.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmabcmantenimientos.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,true);
if (key = #13) then
  begin
  key:=#0;
  if edclave.Text <> '' then
    begin
    TraeMantenimiento(edclave.text);
    buscarlocate;
    end
  else
    edclave.OnButtonClick(self);
  end;
  if key = #27 then
    begin
    key:=#0;
    edclave.Text:='';
    end;
end;

procedure Tfrmabcmantenimientos.tblmantenimientosBeforePost(
  DataSet: TDataSet);
begin
    tblmantenimientosidmantenimiento.AsString:=edclave.Text;
    tblmantenimientostipo.AsInteger := cbtipo.ItemIndex;
    tblmantenimientosf1.AsDateTime := dbdprimera.Date;
    if dbdsegunda.Visible then
      tblmantenimientosf2.AsDateTime := dbdsegunda.Date;
    if dbdtercera.Visible then
      tblmantenimientosf3.AsDateTime := dbdtercera.Date;
    if dbdcuarta.Visible then
      tblmantenimientosf4.AsDateTime := dbdcuarta.Date;
end;

procedure Tfrmabcmantenimientos.cbtipoNotInList(Sender: TObject);
begin
cbtipo.ItemIndex := -1;
end;


procedure tfrmabcmantenimientos.Limpia;
begin
 edClave.clear;
 edNombre.Clear;
 cbTipo.Text := '';

end;

procedure tfrmabcmantenimientos.TraeMantenimiento(idmant:string);
begin
  limpia;
  edclave.Text := idmant;
  querys('select * from mantenimientos where idmantenimiento='+idmant,0,sqlgeneral);
  lbufh.Caption := UFH(tblmantenimientos);
  if sqlgeneral.RecordCount > 0 then
   begin
    edNombre.Text := sqlgeneral.fieldbyname('nombre').AsString;
    cbtipo.itemindex := sqlgeneral.fieldbyname('tipo').AsInteger;
    cbtipo.text := cbtipo.Items.Strings[cbtipo.itemindex];
    dbdprimera.Date := sqlgeneral.fieldbyname('f1').AsDateTime ;
    if sqlgeneral.fieldbyname('f2').Asstring <> '' then
     dbdsegunda.Date := sqlgeneral.fieldbyname('f2').AsDateTime;
    if sqlgeneral.fieldbyname('f3').Asstring <> '' then
     dbdtercera.Date := sqlgeneral.fieldbyname('f3').AsDateTime;
    if sqlgeneral.fieldbyname('f4').Asstring <> '' then
     dbdcuarta.Date := sqlgeneral.fieldbyname('f4').AsDateTime;
   end
  else
   application.MessageBox('Ese numero de mantenimiento no existe','Aviso',mb_iconinformation);
end;

procedure Tfrmabcmantenimientos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmabcmantenimientos.buscarlocate;
begin
tblmantenimientos.Active:=true;
if tblmantenimientos.Locate('idmantenimiento',edclave.Text,[]) then
    begin
    cbtipo.ItemIndex := tblmantenimientostipo.AsInteger;
    dbdprimera.Date := tblmantenimientosf1.AsDateTime;
    if tblmantenimientosf2.AsDateTime <> 0 then
     dbdsegunda.Date := tblmantenimientosf2.AsDateTime;

    if tblmantenimientosf3.AsDateTime <> 0 then
      dbdtercera.Date := tblmantenimientosf3.AsDateTime;

    if tblmantenimientosf4.AsDateTime <> 0 then
      dbdcuarta.Date := tblmantenimientosf4.AsDateTime;

    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    cbtipo.onchange(self);
    navegador.Enabled:=true;

    lbufh.Caption := 'Modificado por '+tblmantenimientosusuario.AsString+' el '+tblmantenimientosfecha.AsString+' '+tblmantenimientoshora.AsString;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Mantenimiento no Existe','Información',mb_ok+mb_iconinformation);
    tblmantenimientos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
   end;
end;

procedure Tfrmabcmantenimientos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblmantenimientos.Cancel;
     tblmantenimientos.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Mantenimiento Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Mantenimiento';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       lbufh.Caption := '';
       cbtipo.Text := '';
       cbtipo.ItemIndex := -1;
       ednombre.Enabled:=false;
       cbtipo.Enabled := false;
       gbdatosm.Enabled := false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       visualiza;
       edclave.SetFocus;
 end
else
release;
end;

procedure Tfrmabcmantenimientos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idmantenimiento)from mantenimientos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblmantenimientos.Active:=true;
    tblmantenimientos.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    ednombre.Enabled:=true;
    cbtipo.Text := '';
    lbufh.Caption := '';
    cbtipo.Enabled := true;
    visualiza;
    gbdatosm.Enabled := true;
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
    if ExisteNombre(ednombre,'select nombre from mantenimientos where idmantenimiento<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
      exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Mantenimiento';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta el Mantenimiento'+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idmantenimiento) as id from mantenimientos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    //guarda los datos
    tblmantenimientos.Post;
    tblmantenimientos.Active:=false;
    ednombre.Enabled:=false;
    cbtipo.Enabled := false;
    gbdatosm.Enabled := false;
    edclave.Enabled:=true;
    edclave.Text:='';
    edclave.SetFocus;
    cbtipo.ItemIndex := -1;
    visualiza;
   end;
end;

procedure Tfrmabcmantenimientos.btnborrarClick(Sender: TObject);
begin
//valida que no se use en otra tabla
  querys('select idmantenimiento from DetMantenimientos where idmantenimiento='+quotedstr(edclave.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Este Mantenimiento esta siendo usado por un Detalle de Mantenimiento y no podra ser eliminada hasta que se borre el Detalle de Mantenimiento o haga referencia a otro Mantenimiento!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
      if application.MessageBox('Estas Seguro que deseas borrar este Mantenimiento?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino el Mantenimiento '+tblmantenimientosnombre.asstring,3);
        tblmantenimientos.Delete;
        application.MessageBox('Eliminacion del Mantenimiento Exitoso','Información',mb_ok);
        tblmantenimientos.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblmantenimientos.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure Tfrmabcmantenimientos.btnmodificarClick(Sender: TObject);
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
     cbtipo.Enabled := true;
     gbdatosm.Enabled := true;
     edclave.Enabled:=false;
     tblmantenimientos.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from mantenimientos where idmantenimiento<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Mantenimiento actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     cbtipo.Enabled := false;
     gbdatosm.Enabled := false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el Mantenimiento '+tblmantenimientosnombre.AsString,2);
     tblmantenimientos.Post;
     tblmantenimientos.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmabcmantenimientos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  edclave.text:=DSmantenimientos.dataset.fieldbyname('idmantenimiento').AsString;
  cbtipo.ItemIndex := tblmantenimientostipo.AsInteger;
  dbdprimera.Date := tblmantenimientosf1.AsDateTime;
  dbdsegunda.Date := tblmantenimientosf2.AsDateTime;
  dbdtercera.Date := tblmantenimientosf3.AsDateTime;
  dbdcuarta.Date := tblmantenimientosf4.AsDateTime;
  lbufh.Caption := UFH(tblmantenimientos);
  case cbtipo.ItemIndex of
    0: begin
       dbdsegunda.visible := false;
       dbdtercera.visible := false;
       dbdcuarta.visible := false;
       end;

    1: begin
       dbdsegunda.visible := true;
       dbdtercera.visible := false;
       dbdcuarta.visible := false;
       end;

    2: begin
       dbdsegunda.visible := true;
       dbdtercera.visible := true;
       dbdcuarta.visible := true;
       end;
    end; //case}
end;

procedure Tfrmabcmantenimientos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 frmbusquedas.query:='select idmantenimiento,nombre,if(tipo=0,''Anual'',if(tipo=1,''Semestral'',''Trimestral'')) as Tipo,f1,f2,f3,f4,usuario,fecha,hora from mantenimientos order by idmantenimiento';
 frmbusquedas.campo_busqueda:='nombre';
 frmbusquedas.campo_retorno:='idmantenimiento';
 frmbusquedas.tabla:='';
 frmbusquedas.tblorigen := 'mantenimientos';
 frmbusquedas.ShowModal;
 if frmbusquedas.resultado <> '' then
  begin
    tblmantenimientos.Active := true;
    TraeMantenimiento(frmbusquedas.resultado);
    buscarlocate;
    navegador.Enabled:=true;
  end;
end;

procedure Tfrmabcmantenimientos.cbtipoChange(Sender: TObject);
begin
visualiza;
end;

procedure Tfrmabcmantenimientos.FormShow(Sender: TObject);
begin
edclave.setfocus;
dbdprimera.Date := FechaServidor;
dbdsegunda.Date := FechaServidor;
dbdtercera.Date := FechaServidor;
dbdcuarta.Date := FechaServidor;
visualiza;
end;
procedure Tfrmabcmantenimientos.dbdprimeraKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
    begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tfrmabcmantenimientos.dbdsegundaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
    begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tfrmabcmantenimientos.dbdterceraKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
    begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tfrmabcmantenimientos.dbdcuartaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
    begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Tfrmabcmantenimientos.visualiza;
begin
  case cbtipo.ItemIndex of
   -1: begin
       dbdprimera.Visible := false;
       dbdsegunda.Visible:= false;
       dbdtercera.Visible:= false;
       dbdcuarta.Visible:= false;
       end;

    0: begin
       dbdprimera.Visible := true;
       dbdsegunda.Visible:= false;
       dbdtercera.Visible:= false;
       dbdcuarta.Visible:= false;
       end;

    1: begin
       dbdprimera.Visible := true;
       dbdsegunda.Visible := true;
       dbdtercera.Visible := false;
       dbdcuarta.Visible := false;
       end;

    2: begin
       dbdprimera.Visible := true;
       dbdsegunda.Visible := true;
       dbdtercera.Visible := true;
       dbdcuarta.Visible := true;
       end;
    end; //case
end;

procedure Tfrmabcmantenimientos.tblmantenimientosAfterPost(
  DataSet: TDataSet);
  var zh:string;
begin
     querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
     zh := sqlgeneral.FieldByName('valor').Asstring;
  //actualiza los datos de hora,fecha de creacion y usuario
    querys('update mantenimientos set fecha=cast(adddate(now(), interval '+zh+' hour) as date), hora=cast(adddate(now(), interval '+zh+' hour) as time), usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmantenimiento='+edclave.Text,1,sqlgeneral);
    
end;

end.
