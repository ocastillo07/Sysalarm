unit UTiposNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, DBCtrls, UCBase, ExtCtrls, RzDBNav, ComCtrls,
  ToolWin, RzBtnEdt;

type
  TfrmTiposNotas = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSTiposNotas: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblTiposNotas: TMyTable;
    RzLabel2: TRzLabel;
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
    tblTiposNotasidtiponota: TIntegerField;
    tblTiposNotasnombre: TStringField;
    tblTiposNotasdescripcion: TMemoField;
    tblTiposNotasusuario: TStringField;
    tblTiposNotasfecha: TStringField;
    tblTiposNotashora: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure tblTiposNotasBeforeOpen(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure redescripcionEnter(Sender: TObject);
    procedure redescripcionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure redescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTiposNotas: TfrmTiposNotas;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos;

{$R *.dfm}

procedure TfrmTiposNotas.buscarlocate;
begin
tbltiposnotas.Active:=true;
if tbltiposnotas.Locate('idtiponota',edclave.Text,[]) then
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
    application.MessageBox('Ese Tipo de Nota no Existe','Información',mb_ok+mb_iconinformation);
    tbltiposnotas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;// idarea

end;


procedure TfrmTiposNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmTiposNotas.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idtiponota + 1
    querys('select max(idtiponota) as tipo from TiposNotas',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      edclave.Enabled:=false;
   //pone la tabla de tiposnotas en modo de insercion
   tbltiposnotas.Active:=true;
   tbltiposnotas.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   edclave.Enabled:=false;
   ednombre.Enabled:=true;
   redescripcion.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from TiposNotas where idtiponota<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     ednombre.Enabled:=false;
     redescripcion.Enabled:=false;
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
     frmprincipal.ucprincipal.Log('Dio de Alta el Tipo de Nota '+ednombre.text,1);
      //trae el maximo idtiposnotas + 1
    querys('select max(idtiponota) as tipo from TiposNotas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    tbltiposnotasidtiponota.AsString:=edclave.Text;
    tbltiposnotasusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
    tbltiposnotasfecha.Asstring:=datetostr(FechaServidor);
    tbltiposnotashora.Asstring:=timetostr(HoraServidor);
     //guarda los datos
     tbltiposnotas.Post;
     tbltiposnotas.Active:=false;
     edclave.Text:='';
     edclave.SetFocus;

   end;
end;

procedure TfrmTiposNotas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idtiponota,nombre as Nombre,usuario as Usuario,hora as Hora,fecha as Fecha From TiposNotas order by idtiponota';
      frmbusquedas.campo_retorno:='idtiponota';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'TiposNotas';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbltiposnotas.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             //edclave.OnButtonClick(self);
             navegador.Enabled:=true;
            end;
    end;
end;

procedure TfrmTiposNotas.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbltiposnotas.Active:=true;
if tbltiposnotas.Locate('idarea',edclave.Text,[]) then
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
    application.MessageBox('Ese Tipo de Nota no Existe','Información',mb_ok+mb_iconinformation);
    tbltiposnotas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure TfrmTiposNotas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tbltiposnotas.Cancel;
     tbltiposnotas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Tipo de Nota Actual';
         btnmodificar.ImageIndex:=2;
         edclave.Text:='';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Tipo de Nota';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
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

procedure TfrmTiposNotas.btnmodificarClick(Sender: TObject);
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
     ednombre.Enabled:=true;
     edclave.Enabled:=false;
     redescripcion.Enabled:=true;
     tbltiposnotas.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from TiposNotas where idtiponota<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Tipo de Nota Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     redescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Tipo de Nota '+tbltiposnotasnombre.AsString,2);
     tbltiposnotas.Post;
     edclave.Enabled:=true;
     edclave.Enabled:=true;
     tbltiposnotas.Active:=false;
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     end;
end;

procedure TfrmTiposNotas.btnborrarClick(Sender: TObject);
//var band:integer;
begin
{band:=0;
//busca que el area no este siendo usado en la tabla de usuarios
querys('select idarea from usuarios where idarea='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   band:=1
else
 begin
  querys('select idarea from puestos where idarea='+edclave.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
      band:=1
  end;

if band = 1 then
   application.MessageBox('Esta Area esta siendo usado por un Usuario o por un Puesto y no podra ser eliminado!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas seguro que deseas borrar esta Area?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Area '+tbltiposnotasnombre.asstring,3);
      tbltiposnotas.Delete;
      application.MessageBox('Eliminacion del Area Exitosa','Información',mb_ok);
      tbltiposnotas.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltiposnotas.Active:=false;
   end;
   edclave.Text:='';
   edclave.SetFocus; }
end;

procedure TfrmTiposNotas.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     redescripcion.SetFocus;
  end;
end;

procedure TfrmTiposNotas.tblTiposNotasBeforeOpen(DataSet: TDataSet);
begin
if dstiposnotas.DataSet.State=dsinsert then
   navegador.Enabled:=false;
end;

procedure TfrmTiposNotas.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=dstiposnotas.dataset.fieldbyname('idtiponota').AsString;
end;

procedure TfrmTiposNotas.redescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmTiposNotas.redescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmTiposNotas.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := redescripcion.Font;
  if fuentes.Execute then
   begin
      redescripcion.SelAttributes.Size:=fuentes.Font.Size;
      redescripcion.SelAttributes.color:=fuentes.Font.color;
      redescripcion.SelAttributes.style:=fuentes.Font.style;
    end;
 end;

procedure TfrmTiposNotas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tbltiposnotas,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmTiposNotas.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmTiposNotas.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmTiposNotas.redescripcionKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) and (ednombre.Text<>'') then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmTiposNotas.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then  begin
   tbltiposnotas.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
end;
end;

procedure TfrmTiposNotas.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

end.
