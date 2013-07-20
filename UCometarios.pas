//2008/02/28 dalyla zona horaria ok
unit UCometarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, DBCtrls, RzDBNav, RzDBEdit, StdCtrls,
  RzLabel, Mask, RzEdit, RzBtnEdt, ComCtrls, DB, MemDS, DBAccess, MyAccess;

type
  Tfrmcomentarios = class(TForm)
    edclave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btneditar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    dscomentarios: TDataSource;
    tblcomentarios: TMyTable;
    mmdescripcion: TRzDBRichEdit;
    sql: TMyQuery;
    tblcomentariosclave: TStringField;
    tblcomentarioscomentario: TStringField;
    tblcomentariosusuario: TStringField;
    tblcomentariosfecha: TStringField;
    tblcomentarioshora: TStringField;
    lbufh: TRzLabel;
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure localizar;
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure tblcomentariosBeforePost(DataSet: TDataSet);
    procedure btneditarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcomentarios: Tfrmcomentarios;

implementation

uses Urecursos, Udm, Math, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure Tfrmcomentarios.localizar;
begin
tblcomentarios.Active:=true;
  if tblcomentarios.Locate('clave',UpperCase(edclave.Text),[]) then
  begin
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    btneditar.Enabled:=true;
    btncancelar.Enabled:=true;
    lbufh.Caption := UFH(tblcomentarios);
  end
  else
  begin
    btnborrar.Enabled:=false;
    btneditar.Enabled:=false;
    tblcomentarios.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end; //if else

end;            //localizar

procedure Tfrmcomentarios.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then  begin

   tblcomentarios.Active:=false;
   btnborrar.Enabled:=false;
   btneditar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmcomentarios.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmcomentarios.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
//key:=ValidaNumeros(key,true);
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        localizar
     else
        edclave.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;


end;

procedure Tfrmcomentarios.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcomentarios.Cancel;
     tblcomentarios.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btneditar.Enabled then
        begin
         btneditar.Caption:='&Editar';
         btneditar.hint:='Editar el Comentario Actual';
         btneditar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Comentario';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btneditar.Enabled:=false;
       edclave.SetFocus;
       mmdescripcion.ReadOnly:=true;
 end
else
release;
end;

procedure Tfrmcomentarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmcomentarios.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   edclave.text:= tblcomentarios.FieldByName('clave').AsString;
   lbufh.Caption := UFH(tblcomentarios);
end;

procedure Tfrmcomentarios.btnaltaClick(Sender: TObject);
begin
  if btnalta.Caption='&Alta' then
  begin
    edclave.SetFocus;
    tblcomentarios.Active:=true;
    tblcomentarios.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.ImageIndex:=1;
    btnalta.Hint:='Guardar los datos de la alta';
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la alta';
    btnborrar.Enabled:=false;
    btneditar.Enabled:=false;
    mmdescripcion.ReadOnly:=false;
    navegador.Enabled:=false;
    lbufh.Caption := '';
  end
  else
  begin
    sql.Close;
    sql.SQL.Clear;
    sql.sql.Add('select clave from comentarios where clave="'+UpperCase(edclave.Text)+'"');
    sql.Open;
    if sql.RecordCount>0 then
    begin
    Application.MessageBox('Ya existe esa clave favor de dar otra nueva','Aviso',MB_ICONINFORMATION);
    exit;
    end
    else
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de alta un nuevo Comentario';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btneditar.enabled:=false;
    edclave.Text:=UpperCase(edclave.Text);
    tblcomentarios.Post;
    //actualiza los datos de hora,fecha de creacion y usuario
    querys('update comentarios set usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" where clave='+'"'+UpperCase(edclave.Text)+'"',1,sql);
    tblcomentarios.Active:=false;
    edclave.Enabled:=true;
    edclave.Text:='';
    edclave.SetFocus;
    navegador.Enabled:=true;
    mmdescripcion.ReadOnly:=true;
    end;
  end;
end;



procedure Tfrmcomentarios.tblcomentariosBeforePost(DataSet: TDataSet);
begin
tblcomentariosclave.AsString:=edclave.Text;
end;

procedure Tfrmcomentarios.btneditarClick(Sender: TObject);
begin
if btneditar.Caption = '&Editar' then
   begin
     btneditar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btneditar.hint:='Guarda los Cambios Realizados';
     btneditar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     mmdescripcion.readonly:=false;
     edclave.Enabled:=false;
     tblcomentarios.Edit;
     navegador.Enabled:=false;
     mmdescripcion.setfocus;
   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btneditar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btneditar.hint:='Editar los datos del Comentario actual';
     btneditar.ImageIndex:=2;
     mmdescripcion.ReadOnly:=true;
     navegador.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btneditar.Enabled:=false;
     tblcomentarios.Post;
     querys('update comentarios set usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" where clave='+'"'+UpperCase(edclave.Text)+'"',1,sql);
     tblcomentarios.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmcomentarios.btnborrarClick(Sender: TObject);
begin
  if application.MessageBox('Estas Seguro que deseas borrar este Comentario?','Confirmación',mb_yesno) = idyes then
  begin
   tblcomentarios.Delete;
   application.MessageBox('Eliminacion del Comentario Exitoso','Información',mb_ok);
   tblcomentarios.Active:=false;
   btnborrar.Enabled:=false;
   btneditar.Enabled:=false;
   tblcomentarios.Active:=false;
   edclave.text:='';
   edclave.SetFocus;
  end;
end;

procedure Tfrmcomentarios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select clave,comentario,usuario as Usuario,fecha as Fecha,hora as Hora From comentarios order by clave';
        campo_retorno:='clave';
        campo_busqueda:='clave';
        tblorigen := 'comentarios';
        lbldesc.Caption:='Busqueda por Clave:';
        ShowModal;
        if resultado <> '' then
           begin
           tblcomentarios.Active:=true;
           edclave.Text:=resultado;
           localizar;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

end.


