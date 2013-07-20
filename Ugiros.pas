unit Ugiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, DBCtrls, ComCtrls, ToolWin, ExtCtrls, RzDBNav,
  RzBtnEdt;

type
  Tfrmgiros = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSgiros: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblgiros: TMyTable;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    redescripcion: TRzDBRichEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    edclave: TRzButtonEdit;
    tblgirosidgiro: TIntegerField;
    tblgirosnombre: TStringField;
    tblgirosdescripcion: TMemoField;
    tblgirosfecha: TStringField;
    tblgiroshora: TStringField;
    tblgirosusuario: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblgirosBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure redescripcionEnter(Sender: TObject);
    procedure redescripcionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure tblgirosAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
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
  frmgiros: Tfrmgiros;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}
procedure Tfrmgiros.buscarlocate;
begin
tblgiros.Active:=true;
if tblgiros.Locate('idgiro',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(tblgiros);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Giro no Existe','Información',mb_ok+mb_iconinformation);
    tblgiros.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
end;


end;

procedure Tfrmgiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmgiros.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    navegador.Enabled:=false;
    //trae el maximo idgiro + 1
    querys('select max(idgiro) as idgiro from giros',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
   //pone la tabla de giros en modo de insercion
   tblgiros.Active:=true;
   tblgiros.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   redescripcion.Enabled:=true;
   ednombre.SetFocus;
   lbufh.Caption := '';
   end
   else
   begin
      if ExisteNombre(ednombre,'select nombre from giros where idgiro<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     edclave.Enabled:=true;
     ednombre.Enabled:=false;
     redescripcion.Enabled:=false;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Giro';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     //btnbuscar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta el Giro '+ednombre.text,1);
     //trae el maximo idgiro + 1
     querys('select max(idgiro) as idgiro from giros',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     tblgirosusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
     tblgirosfecha.AsString:=datetostr(FechaServidor);
     tblgiroshora.AsString:=timetostr(HoraServidor);
     //guarda los datos
     tblgiros.Post;
     tblgiros.Active:=false;
      //actualiza los datos de hora,fecha de creacion y usuario
     // querys('update giros set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idgiro='+edclave.Text,1,sqlgeneral);
     edclave.Text:='';
     edclave.SetFocus;

   end;
end;

procedure Tfrmgiros.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idgiro,nombre as Nombre,usuario as Usuario,hora as Hora,fecha as Fecha From giros order by idgiro';
      frmbusquedas.campo_retorno:='idgiro';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='giros';
      frmbusquedas.ShowModal;

       if frmbusquedas.resultado <> '' then
            begin
             tblgiros.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //btnbuscar.Click;
             //edclave.OnButtonClick(self);
             buscarlocate;
            end;
    end;
end;

procedure Tfrmgiros.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblgiros.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblgiros.Locate('idgiro',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Giro no Existe','Información',mb_ok+mb_iconinformation);
    tblgiros.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmgiros.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblgiros.Cancel;
     tblgiros.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Giro Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Giro';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
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

procedure Tfrmgiros.btnmodificarClick(Sender: TObject);
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
     redescripcion.Enabled:=true;
     tblgiros.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from giros where idgiro<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     redescripcion.Enabled:=false;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Giro Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     redescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Giro '+tblgirosnombre.AsString,2);
     tblgiros.Post;
     edclave.Enabled:=true;
     tblgiros.active:=false;
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     end;
end;

procedure Tfrmgiros.tblgirosBeforePost(DataSet: TDataSet);
begin
tblgirosidgiro.AsString:=edclave.Text;
tblgirosusuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
tblgirosfecha.AsDateTime := date();
tblgiroshora.AsString := timetostr(now());
end;

procedure Tfrmgiros.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que la categoria no este siendo usado en la tabla de oportunidades
querys('select idoportunidad as Id,nombre as Nombre,apaterno as Apaterno,amaterno as Amaterno,rsocial as RazonSocial from oportunidades where idgiro='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este Giro esta relacionada con un(as) Oportunidad(es),primero debe de eliminar esa relacion para borrar el Giro!','Operacion No Realizada',mb_iconwarning)
else
 begin
//busca que la categoria no este siendo usado en la tabla de clientes
querys('select idcliente as Id,nombre as Nombre,amaterno as Amaterno,apaterno as Apaterno,rsocial as RazonSocial from clientes where idgiro='+edclave.Text,0,sqlgeneral);
 if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este Giro esta relacionada con un(os) Clientes(es),primero debe de eliminar esa relacion para borrar el Giro!','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas seguro que deseas borrar este Giro?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Giro '+tblgirosnombre.asstring,3);
      tblgiros.Delete;
      application.MessageBox('Eliminacion del Giro Exitosa','Información',mb_ok);
      tblgiros.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblgiros.Active:=false;
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

procedure Tfrmgiros.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmgiros.redescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmgiros.redescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmgiros.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := redescripcion.Font;
  if fuentes.Execute then
   begin
      redescripcion.SelAttributes.Size:=fuentes.Font.Size;
      redescripcion.SelAttributes.color:=fuentes.Font.color;
      redescripcion.SelAttributes.style:=fuentes.Font.style;
    end;
end;

procedure Tfrmgiros.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.Text:=dsgiros.DataSet.fieldbyname('idgiro').AsString;
lbufh.Caption := UFH(tblgiros);
end;

procedure Tfrmgiros.tblgirosAfterOpen(DataSet: TDataSet);
begin
navegador.Enabled:=true;
end;

procedure Tfrmgiros.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblgiros,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmgiros.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmgiros.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmgiros.redescripcionKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmgiros.edclaveChange(Sender: TObject);
begin

if edclave.Text = '' then begin
  tblgiros.Active:=false;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  lbufh.Caption := '';
end;

end;

procedure Tfrmgiros.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

end.
