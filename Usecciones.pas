unit Usecciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, DBCtrls, UCBase, ExtCtrls, RzDBNav, ComCtrls,
  ToolWin, RzBtnEdt;

type
  Tfrmsecciones = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSsecciones: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblsecciones: TMyTable;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    FontDialog1: TFontDialog;
    mmdescripcion: TRzDBRichEdit;
    tblseccionesidseccion: TIntegerField;
    tblseccionesnombre: TStringField;
    tblseccionesdescripcion: TMemoField;
    edclave: TRzButtonEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    lbufh: TRzLabel;
    tblseccionesusuario: TStringField;
    tblseccionesfecha: TStringField;
    tblseccioneshora: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure tblseccionesBeforeOpen(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure mmdescripcionEnter(Sender: TObject);
    procedure mmdescripcionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure buscarlocate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsecciones: Tfrmsecciones;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmsecciones.buscarlocate;
begin
tblsecciones.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblsecciones.Locate('idseccion',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblsecciones);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Sección no Existe','Información',mb_ok+mb_iconinformation);
    tblsecciones.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;

procedure Tfrmsecciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmsecciones.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idseccion + 1
    querys('select max(idseccion) as idseccion from secciones',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      edclave.Enabled:=false;
   //pone la tabla de secciones en modo de insercion
   tblsecciones.Active:=true;
   tblsecciones.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   mmdescripcion.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from secciones where idseccion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     ednombre.Enabled:=false;
     mmdescripcion.Enabled:=false;
     //btnbuscar.Enabled:=true;
     edclave.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta una Sección';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta la Sección '+ednombre.text,1);
      //trae el maximo idseccion + 1
     querys('select max(idseccion) as idseccion from secciones',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      tblseccionesidseccion.AsString:=edclave.Text;
      //guarda los datos
      tblsecciones.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update secciones set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idseccion='+quotedstr(edclave.Text),1,sqlgeneral);
      tblsecciones.Active:=false;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure Tfrmsecciones.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idseccion,nombre as Nombre,usuario as Usuario,hora as Hora,fecha as Fecha From secciones order by idseccion';
      frmbusquedas.campo_retorno:='idseccion';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen:='secciones';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
              tblsecciones.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //edclave.OnButtonClick(self);
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmsecciones.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblsecciones.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblsecciones.Locate('idseccion',edclave.Text,[]) then
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
    application.MessageBox('Esa Sección no Existe','Información',mb_ok+mb_iconinformation);
    tblsecciones.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmsecciones.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblsecciones.Cancel;
     tblsecciones.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Sección Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Sección';
          btnalta.ImageIndex:=5;

        end;
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       mmdescripcion.Enabled:=false;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
 end
else
close;
end;

procedure Tfrmsecciones.btnmodificarClick(Sender: TObject);
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
     edclave.Enabled:=false;
     mmdescripcion.Enabled:=true;
     tblsecciones.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from secciones where idseccion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Sección Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     mmdescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito la Sección '+tblseccionesnombre.AsString,2);
     tblsecciones.Post;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     tblsecciones.Active:=false;
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     end;
end;

procedure Tfrmsecciones.btnborrarClick(Sender: TObject);
var band:integer;
hija:tfrmrelacionborrar;
begin
band:=0;
//busca que el SECCIONES no este siendo usado en la tabla de ARTICULOS
querys('select idseccion as Id,cod_cve as Codigo,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora  from articulos where idseccion='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   band:=1;

if band = 1 then
   application.MessageBox('Esta Area esta siendo usado por un Articulo y no podra ser eliminado!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas seguro que deseas borrar esta Sección?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la Sección '+tblseccionesnombre.asstring,3);
      tblsecciones.Delete;
      application.MessageBox('Eliminación de la Sección Exitosa','Información',mb_ok);
      tblsecciones.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblsecciones.Active:=false;
   end;
   edclave.Text:='';
   edclave.SetFocus;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

end;

procedure Tfrmsecciones.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);

  end;
end;

procedure Tfrmsecciones.tblseccionesBeforeOpen(DataSet: TDataSet);
begin
if dssecciones.DataSet.State=dsinsert then
   navegador.Enabled:=false;
end;

procedure Tfrmsecciones.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=dssecciones.dataset.fieldbyname('idseccion').AsString;
lbufh.Caption := UFH(tblsecciones);
end;

procedure Tfrmsecciones.mmdescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmsecciones.mmdescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmsecciones.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmdescripcion.Font;
  if FontDialog1.Execute then
    mmdescripcion.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmsecciones.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblsecciones,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmsecciones.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then begin
    key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
end;

if (key = #27) then begin
    key:=#0;
    edclave.Text:='';
end;

end;

procedure Tfrmsecciones.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblsecciones.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblsecciones.Locate('idseccion',edclave.Text,[]) then
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
    application.MessageBox('Esa Sección no Existe','Información',mb_ok+mb_iconinformation);
    tblsecciones.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmsecciones.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblsecciones.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
   end;
end;

end.
