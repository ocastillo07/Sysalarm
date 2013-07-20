unit Usectores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, DBCtrls, UCBase, ExtCtrls, RzDBNav, ComCtrls,
  ToolWin, RzBtnEdt;

type
  Tfrmsectores = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSsectores: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblsectores: TMyTable;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    FontDialog1: TFontDialog;
    mmdescripcion: TRzDBRichEdit;
    edclave: TRzButtonEdit;
    tblsectoresidSectorArt: TIntegerField;
    tblsectoresnombre: TStringField;
    tblsectoresdescripcion: TMemoField;
    tblsectoresusuario: TStringField;
    tblsectoresfecha: TStringField;
    tblsectoreshora: TStringField;
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
    procedure tblsectoresBeforeOpen(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure mmdescripcionEnter(Sender: TObject);
    procedure mmdescripcionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure mmdescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure buscarlocate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsectores: Tfrmsectores;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmsectores.buscarlocate;
begin

tblsectores.Active:=true;
if tblsectores.Locate('idSectorArt',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblsectores);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Sector no Existe','Información',mb_ok+mb_iconinformation);
    tblsectores.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;

procedure Tfrmsectores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmsectores.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idSectorArt + 1
    querys('select max(idSectorArt) as idsector from SectoresArt',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      edclave.Enabled:=false;
   //pone la tabla de sectores en modo de insercion
   tblsectores.Active:=true;
   tblsectores.Insert;
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
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from sectores where idsector<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     ednombre.Enabled:=false;
     mmdescripcion.Enabled:=false;
     //btnbuscar.Enabled:=true;
     edclave.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Sector';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta el Sector de Articulos '+ednombre.text,1);
      //trae el maximo idsector + 1
     querys('select max(idSectorArt)+1 as idsector from SectoresArt',0,sqlgeneral);
      if sqlgeneral.FieldByName('idsector').AsString = '' then
         edclave.Text:='1'
      else
         edclave.Text:=sqlgeneral.Fields.Fields[0].AsString;

    tblsectoresidSectorArt.AsString:=edclave.Text;
     //guarda los datos
     tblsectores.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update SectoresArt set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idSectorArt='+quotedstr(edclave.Text),1,sqlgeneral);
      tblsectores.Active:=false;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure Tfrmsectores.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idSectorArt,nombre as Nombre,usuario as Usuario,hora as Hora,fecha as Fecha From SectoresArt order by idSectorArt';
      frmbusquedas.campo_retorno:='idSectorArt';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tblorigen:='SectoresArt';
      frmbusquedas.tabla:='';
      //frmbusquedas.ShowModal;
      //frmbusquedas.lbldesc.Caption:='Buscar por Nombre';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblsectores.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmsectores.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblsectores.Active:=true;
//tblprospectos.Filter:='nombre='+quotedstr('kljytefd08473-345');
//tblprospectos.Filtered:=true;
if tblsectores.Locate('idSectorArt',edclave.Text,[]) then
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
    application.MessageBox('Ese Sector no Existe','Información',mb_ok+mb_iconinformation);
    tblsectores.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmsectores.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblsectores.Cancel;
     tblsectores.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Sector Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Sector';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       mmdescripcion.Enabled:=false;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
close;
end;

procedure Tfrmsectores.btnmodificarClick(Sender: TObject);
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
     edclave.Enabled:=false;
     mmdescripcion.Enabled:=true;
     tblsectores.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from sectores where idsector<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Sector Actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     mmdescripcion.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Sector de Articulos '+tblsectoresnombre.AsString,2);
     tblsectores.Post;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     tblsectores.Active:=false;
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     end;
end;

procedure Tfrmsectores.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el SECTORES no este siendo usado en la tabla de ARTICULOS
querys('select idSectorArt as Id,cod_cve as Cod_cve,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora from articulos where idSectorArt='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Sector esta siendo usado por un Articulo y no podra ser eliminado!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas seguro que deseas borrar esta Sector?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Sector de Articulos'+tblsectoresnombre.asstring,3);
      tblsectores.Delete;
      application.MessageBox('Eliminación del Sector Exitosa','Información',mb_ok);
      tblsectores.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblsectores.Active:=false;
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

procedure Tfrmsectores.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     mmdescripcion.SetFocus;
  end;
end;

procedure Tfrmsectores.tblsectoresBeforeOpen(DataSet: TDataSet);
begin
if dssectores.DataSet.State=dsinsert then
   navegador.Enabled:=false;
end;

procedure Tfrmsectores.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=dssectores.dataset.fieldbyname('idSectorArt').AsString;
lbufh.Caption := UFH(tblsectores);
end;

procedure Tfrmsectores.mmdescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmsectores.mmdescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmsectores.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmdescripcion.Font;
  if FontDialog1.Execute then
    mmdescripcion.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmsectores.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblsectores,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmsectores.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmsectores.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmsectores.mmdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmsectores.edclaveChange(Sender: TObject);
begin
   if edclave.Text = '' then begin
   tblsectores.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
   end;
end;

end.
