//2008/02/28 dalyla zona horaria ok
unit Uareas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, DBCtrls, UCBase, ExtCtrls, RzDBNav, ComCtrls,
  ToolWin, RzBtnEdt, RzCmboBx;

type
  Tfrmareas = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSareas: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblareas: TMyTable;
    RzLabel2: TRzLabel;
    tblareasidarea: TIntegerField;
    tblareasnombre: TStringField;
    tblareasdescripcion: TMemoField;
    navegador: TRzDBNavigator;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    redescripcion: TRzDBRichEdit;
    edclave: TRzButtonEdit;
    tblareasfecha: TStringField;
    tblareashora: TStringField;
    tblareasusuario: TStringField;
    RzLabel3: TRzLabel;
    tblareasEmailTravel: TMemoField;
    edemail: TRzDBMemo;
    cbareadepende: TRzComboBox;
    RzLabel4: TRzLabel;
    tblareasareadepende: TIntegerField;
    tblareasestatus: TBooleanField;
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
    procedure tblareasBeforeOpen(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure redescripcionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure redescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edemailKeyPress(Sender: TObject; var Key: Char);
    procedure tblareasAfterPost(DataSet: TDataSet);
    procedure tblareasBeforePost(DataSet: TDataSet);
  private
    procedure buscarlocate;
    procedure habilitar(hab:boolean);
    procedure traeardatos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmareas: Tfrmareas;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmareas.buscarlocate;
begin
tblareas.Active:=true;
if tblareas.Locate('idarea',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    traeardatos;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Área no Existe','Información',mb_ok+mb_iconinformation);
    tblareas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;


procedure Tfrmareas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmareas.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idarea + 1
    querys('select max(idarea) as idarea from areas',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      edclave.Enabled:=false;
   //pone la tabla de areas en modo de insercion
   tblareas.Active:=true;
   tblareas.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edclave.Enabled:=false;
   habilitar(true);
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from areas where idarea<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     edclave.Enabled:=true;
     habilitar(false);
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Area';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta el Area '+ednombre.text,1);
      //trae el maximo idarea
    querys('select max(idarea) as idarea from areas',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    tblareasidarea.AsString:=edclave.Text;
    tblareasusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
    tblareasfecha.AsString:=datetostr(FechaServidor);
    tblareashora.AsString:=timetostr(HoraServidor);
     //guarda los datos
     tblareas.Post;
     tblareas.Active:=false;
     edclave.Text:='';
     edclave.SetFocus;

   end;
end;

procedure Tfrmareas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idarea as idarea,nombre as Nombre,descripcion as Descripcion,usuario as Usuario,hora as Hora,fecha as Fecha From areas order by idarea';
      frmbusquedas.campo_retorno:='idarea';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'areas';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblareas.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             //edclave.OnButtonClick(self);
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmareas.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblareas.Active:=true;
if tblareas.Locate('idarea',edclave.Text,[]) then
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
    application.MessageBox('Esa Area no Existe','Información',mb_ok+mb_iconinformation);
    tblareas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmareas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblareas.Cancel;
     tblareas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
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
       lbufh.Caption := '';  
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       habilitar(false);
       edclave.SetFocus;
 end
else
close;
end;

procedure Tfrmareas.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     edclave.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     habilitar(true);
     edclave.Enabled:=false;
     tblareas.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from areas where idarea<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Area Actual';
     btnmodificar.ImageIndex:=2;
     habilitar(false);
     btnalta.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Area '+tblareasnombre.AsString,2);
     tblareas.Post;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     navegador.Enabled := true;
     end;
end;

procedure Tfrmareas.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
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
  if application.MessageBox('Estas seguro que deseas borrar esta Area?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Area '+tblareasnombre.asstring,3);
      tblareas.Delete;
      application.MessageBox('Eliminacion del Area Exitosa','Información',mb_ok);
      tblareas.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblareas.Active:=false;

   end;
 end;

if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmareas.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     edemail.SetFocus;
  end;
end;

procedure Tfrmareas.tblareasBeforeOpen(DataSet: TDataSet);
begin
if dsareas.DataSet.State=dsinsert then
   navegador.Enabled:=false;
end;

procedure Tfrmareas.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=dsareas.dataset.fieldbyname('idarea').AsString;
traeardatos;
end;

procedure Tfrmareas.redescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmareas.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := redescripcion.Font;
  if fuentes.Execute then
   begin
      redescripcion.SelAttributes.Size:=fuentes.Font.Size;
      redescripcion.SelAttributes.color:=fuentes.Font.color;
      redescripcion.SelAttributes.style:=fuentes.Font.style;
    end;
end;

procedure Tfrmareas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose := CerrarPantalla(tblareas,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmareas.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmareas.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmareas.redescripcionKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) and (ednombre.Text<>'') then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmareas.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then  begin
   tblareas.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmareas.FormShow(Sender: TObject);
begin
edclave.SetFocus;
CargaComboConItem('Select idarea, nombre from areas order by idarea asc', 'nombre', 'idarea', 'NINGUNA', cbareadepende);
end;

procedure Tfrmareas.edemailKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edemail.Text<>'') then
  begin
     key:=#0;
     redescripcion.SetFocus;
  end;
end;

procedure Tfrmareas.tblareasAfterPost(DataSet: TDataSet);
  var zh:string;
begin
querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
zh := sqlgeneral.FieldByName('valor').Asstring;
querys('update areas set fecha=cast(adddate(now(), interval '+zh+' hour) as date), hora=cast(adddate(now(), interval '+zh+' hour) as time),usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idarea='+quotedstr(edclave.Text),1,sqlgeneral);
end;

procedure Tfrmareas.tblareasBeforePost(DataSet: TDataSet);
begin
if (querys('select idarea from areas where nombre = "'+cbareadepende.Text+'"', 0, sqlgeneral) > 0 ) then
  tblareasareadepende.AsInteger := sqlgeneral.fieldbyname('idarea').AsInteger
else
  tblareasareadepende.AsInteger := 0;
end;

procedure Tfrmareas.habilitar(hab:boolean);
begin
  ednombre.Enabled := hab;
  edemail.Enabled := hab;
  redescripcion.Enabled := hab;
  cbareadepende.Enabled := hab;
end;

procedure Tfrmareas.traeardatos;
begin
lbufh.Caption := UFH(tblareas);

cbareadepende.ItemIndex := 0;
if tblareasareadepende.AsString <> '' then
  if(querys('select nombre from areas where idarea='+tblareasareadepende.AsString, 0, sqlgeneral) > 0) then
      cbareadepende.Text := sqlgeneral.fieldbyname('nombre').AsString;

end;

end.
