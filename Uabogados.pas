//2008/02/28 dalyla zona horaria ok
unit Uabogados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UCBase, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt,
  StdCtrls, ComCtrls, DBCtrls, RzDBEdit, ToolWin, ExtCtrls, RzDBNav, Mask,
  RzButton, RzLabel;

type
  Tfrmabogados = class(TForm)
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    mmdescripcion: TRzDBRichEdit;
    edclave: TRzButtonEdit;
    DSabogados: TDataSource;
    sqlgeneral: TMyQuery;
    tblabogados: TMyTable;
    FontDialog1: TFontDialog;
    tblabogadosidabogado: TIntegerField;
    tblabogadosnombre: TStringField;
    tblabogadosapaterno: TStringField;
    tblabogadosamaterno: TStringField;
    tblabogadosdescripcion: TMemoField;
    tblabogadosusuario: TStringField;
    tblabogadosfecha: TStringField;
    tblabogadoshora: TStringField;
    tblabogadosidtel: TIntegerField;
    edpaterno: TRzDBEdit;
    edmaterno: TRzDBEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    btntelefono: TRzBitBtn;
    lbufh: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure buscarlocate;
    procedure btntelefonoClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure tblabogadosAfterPost(DataSet: TDataSet);
  private
    procedure traedatos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmabogados: Tfrmabogados;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas, Utel;

{$R *.dfm}

procedure Tfrmabogados.buscarlocate;
begin
tblabogados.Active:=true;

if tblabogados.Locate('idabogado',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    traedatos;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Abogado no Existe','Información',mb_ok+mb_iconinformation);
    tblabogados.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;// idarea

end;

procedure Tfrmabogados.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idabogado + 1
    querys('select max(idabogado)+1 as idabogado from abogados',0,sqlgeneral);
   if sqlgeneral.FieldByName('idabogado').AsString = '' then
      edclave.Text:='1'
    else
      edclave.Text:=sqlgeneral.Fields.Fields[0].AsString;
      edclave.Enabled:=false;
   //pone la tabla de areas en modo de insercion
   tblabogados.Active:=true;
   tblabogados.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edclave.Enabled:=false;
   ednombre.Enabled:=true;
   edpaterno.Enabled:=true;
   edmaterno.Enabled:=true;
   mmdescripcion.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if (ednombre.Text <> '') then begin
   if (edpaterno.Text <> '') then begin
   if (edmaterno.Text <> '') then begin
     ednombre.Enabled:=false;
     edpaterno.Enabled:=false;
     edmaterno.Enabled:=false;
     mmdescripcion.Enabled:=false;
     //btnbuscar.Enabled:=true;
     edclave.Enabled:=true;
     edclave.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Area';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta el abogado '+ednombre.text,1);
      //trae el maximo idarea + 1
     querys('select max(idabogado) as idabogado from abogados',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].asinteger + 1);

     tblabogadosidabogado.AsString:=edclave.Text;
     //guarda los datos
     tblabogados.Post;
     if application.MessageBox('Desea asignarle telefonos a este abogado?','Pregunta',mb_iconquestion+mb_yesno) = idyes then
        begin
            self.btntelefonoClick(self);
        end;

     //actualiza los datos de hora,fecha de creacion y usuario
 
     tblabogados.Active:=false;
     edclave.Text:='';
     edclave.SetFocus;
     end else begin
     application.MessageBox('Necesita capturar el apellido materno','Información',mb_ok+mb_iconinformation);
     edmaterno.SetFocus;
     end;
     end else begin
     application.MessageBox('Necesita capturar el apellido paterno','Información',mb_ok+mb_iconinformation);
     edpaterno.SetFocus;
     end;
     end else begin
     application.MessageBox('Necesita capturar el nombre','Información',mb_ok+mb_iconinformation);
     ednombre.SetFocus;
     end;



   end;

end;

procedure Tfrmabogados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmabogados.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblabogados,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmabogados.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idabogado,nombre as Nombre,apaterno as APaterno,amaterno as AMaterno,usuario as Usuario,hora as Hora,fecha as Fecha From abogados order by idabogado';
      frmbusquedas.campo_retorno:='idabogado';
      frmbusquedas.tblorigen := 'abogados';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblabogados.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             //edclave.OnButtonClick(self);
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmabogados.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmabogados.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmabogados.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then  begin

   tblabogados.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmabogados.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
//     edclave.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;

end;

procedure Tfrmabogados.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btntelefono.Visible:=true;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     //btnbuscar.Enabled:=false;
     edclave.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     ednombre.Enabled:=true;
     edpaterno.Enabled:=true;
     edmaterno.Enabled:=true;
     edclave.Enabled:=false;
     mmdescripcion.Enabled:=true;
     tblabogados.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
     if ExisteNombre(ednombre,'select nombre from abogados where idabogado<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btntelefono.Visible:=false;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Abogado Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     edpaterno.Enabled:=false;
     edmaterno.Enabled:=false;
     mmdescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Abogado '+tblabogadosidabogado.AsString,2);
     tblabogados.Post;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Enabled:=true;
     tblabogados.Active:=false;
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     end;

end;

procedure Tfrmabogados.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblabogados.Cancel;
     tblabogados.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btntelefono.Visible:=false;
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Abogado Actual';
         btnmodificar.ImageIndex:=2;
         edclave.Text:='';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Abogado';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
       edpaterno.Enabled:=false;
       edmaterno.Enabled:=false;
       edclave.Enabled:=true;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
close;

end;

procedure Tfrmabogados.btntelefonoClick(Sender: TObject);
begin
frmtel.inicializa(strtoint(edclave.text),tblabogadosidtel.AsInteger,0,'abogados','idabogado', false);
frmtel.showmodal;

end;

procedure Tfrmabogados.btnborrarClick(Sender: TObject);
begin
if application.MessageBox('Estas seguro que deseas borrar este Abogado?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      querys('delete from telefonos where idtel='+quotedstr(tblabogadosidtel.AsString),1,sqlgeneral);
      frmprincipal.ucprincipal.Log('Elimino el abogado '+tblabogadosidabogado.asstring,3);
      tblabogados.Delete;
      application.MessageBox('Eliminación del Abogado Exitosa','Información',mb_ok);
      tblabogados.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblabogados.Active:=false;
      edclave.Text:='';

   end;
 edclave.SetFocus;
end;

procedure Tfrmabogados.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmabogados.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=dsabogados.dataset.fieldbyname('idabogado').AsString;
traedatos;
end;

procedure Tfrmabogados.tblabogadosAfterPost(DataSet: TDataSet);
  var zh:string;
begin
querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
zh := sqlgeneral.FieldByName('valor').Asstring;
querys('update abogados set fecha=cast(adddate(now(), interval '+zh+' hour) as date), hora=cast(adddate(now(), interval '+zh+' hour) as time),usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idabogado='+quotedstr(edclave.Text),1,sqlgeneral);
end;

procedure Tfrmabogados.traedatos;
begin
lbufh.Caption := UFH(tblabogados);
end;

end.
