unit Umoviles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt, StdCtrls,
  ComCtrls, DBCtrls, RzDBEdit, ToolWin, ExtCtrls, RzDBNav, Mask, RzButton,
  RzLabel;

type
  Tfrmmoviles = class(TForm)
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
    DSsectores: TDataSource;
    sqlgeneral: TMyQuery;
    tblSectores: TMyTable;
    FontDialog1: TFontDialog;
    tblSectoresidsector: TIntegerField;
    tblSectoresnombre: TStringField;
    tblSectoresdescripcion: TMemoField;
    tblSectoresusuario: TStringField;
    tblSectoresfecha: TStringField;
    tblSectoreshora: TStringField;
    lbufh: TRzLabel;
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblSectoresBeforeOpen(DataSet: TDataSet);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure mmdescripcionEnter(Sender: TObject);
    procedure mmdescripcionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure mmdescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure buscarlocate;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmoviles: Tfrmmoviles;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}
procedure Tfrmmoviles.buscarlocate;
begin
tblsectores.Active:=true;

if tblsectores.Locate('idsector',edclave.Text,[]) then
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
    application.MessageBox('Es Sector no Existe','Información',mb_ok+mb_iconinformation);
    tblsectores.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;// idarea


end;

procedure Tfrmmoviles.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else begin
tblsectores.Active:=true;

if tblsectores.Locate('idsector',edclave.Text,[]) then
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
    application.MessageBox('Es Sector no Existe','Información',mb_ok+mb_iconinformation);
    tblsectores.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;// idarea
end;//edclave.text}


end;

procedure Tfrmmoviles.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblsectores.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
   end;
end;

procedure Tfrmmoviles.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmmoviles.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=dssectores.dataset.fieldbyname('idsector').AsString;
lbufh.Caption := UFH(tblsectores);
end;

procedure Tfrmmoviles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmmoviles.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblsectores,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmmoviles.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idsector ,nombre as Nombre,descripcion as Descripción,usuario,fecha,hora From sectores order by idsector';
      frmbusquedas.campo_retorno:='idsector';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'sectores';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblsectores.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //btnbuscar.Click;
             //edclave.OnButtonClick(self);
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmmoviles.tblSectoresBeforeOpen(DataSet: TDataSet);
begin
if dssectores.DataSet.State=dsinsert then
   navegador.Enabled:=false;
end;

procedure Tfrmmoviles.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     mmdescripcion.SetFocus;
  end;
end;

procedure Tfrmmoviles.mmdescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmmoviles.mmdescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmmoviles.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := mmdescripcion.Font;
  if FontDialog1.Execute then
    mmdescripcion.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmmoviles.btnborrarClick(Sender: TObject);
var band:integer;
hija:tfrmrelacionborrar;
begin
band:=0;
//valida que no se este usando este sector en la tabla de col_sector
querys('select  colonias.idcol as IdCol,colonias.nombre as Colonia from colonias inner join col_sector on colonias.idcol = col_sector.idcol where col_sector.idsector='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este sector esta relacionado con una(s) colonia,primero debe de eliminar esa relacion para borrar el sector','Operacion No Realizada',mb_iconwarning)
else
 begin
 //valida que no se este usando este sector en la tabla de usuarios
querys('select idsector from usuarios where idsector='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este sector esta relacionado con un(os) usuario,primero debe de eliminar ese relacion para borrar el sector','Operacion No Realizada',mb_iconwarning)
else
begin
 //valida que no se este usando este sector en la tabla de usuarios
querys('select oportunidades.idoportunidad,col_sector.idsector from oportunidades inner join colonias on oportunidades.idcol = colonias.idcol inner join col_sector on colonias.idcol = col_sector.idcol where col_sector.idsector='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Este sector esta relacionado con una(s) Oportunidad,primero debe de eliminar ese relacion para borrar el sector','Operacion No Realizada',mb_iconwarning)
else
if application.MessageBox('Estas seguro que deseas borrar este Sector ?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Sector '+tblsectoresnombre.asstring,3);
      tblsectores.Delete;
      application.MessageBox('Eliminación del Sector Exitosa','Información',mb_ok);
      tblsectores.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblsectores.Active:=false;
   end;
end;
end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

{



//busca que el area no este siendo usado en la tabla de usuarios
querys('select movil from usuarios where movil='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   band:=1;

if band = 1 then
   application.MessageBox('Este Sector esta siendo usado por un Usuario y no podra ser eliminado!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas seguro que deseas borrar este Sector ?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Sector '+tblsectoresnombre.asstring,3);
      tblsectores.Delete;
      application.MessageBox('Eliminación del Sector Exitosa','Información',mb_ok);
      tblsectores.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblsectores.Active:=false;
   end;}
   edclave.Text:='';
  // edclave.SetFocus;
end;

procedure Tfrmmoviles.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
     //trae el maximo idsector + 1
     querys('select max(idsector) as idsector from sectores',0,sqlgeneral);
       edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
       edclave.Enabled:=false;
     //pone la tabla de areas en modo de insercion
     tblsectores.Active:=true;
     tblsectores.Append;
     btnalta.Caption:='&Guardar';
     btnalta.Hint:='Guardar los datos de la alta';
     btnalta.ImageIndex:=1;
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Alta';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.Enabled:=false;
     ednombre.Enabled:=true;
     mmdescripcion.Enabled:=true;
     ednombre.SetFocus;
     navegador.Enabled:=false;
     lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from sectores where idsector<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     ednombre.Enabled:=false;
     mmdescripcion.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Sector';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta del Sector '+ednombre.text,1);
     //trae el maximo idsector + 1
     querys('select max(idsector) as idsector from sectores',0,sqlgeneral);
       edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     tblsectoresidsector.AsString:=edclave.Text;   //guarda los datos
         //actualiza la tabla tokens con el nuevo idsector que se acaba de crear
    querys('insert into tokens (idsector,idusuario) values ('+edclave.Text+',0'+')',1,sqlgeneral);
     tblsectores.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update sectores set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where nombre='+quotedstr(ednombre.Text),1,sqlgeneral);
     tblsectores.Active:=false;
     edclave.Text:='';
     edclave.SetFocus;

   end;
end;

procedure Tfrmmoviles.btnmodificarClick(Sender: TObject);
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
     mmdescripcion.Enabled:=true;
     tblsectores.Edit;
     navegador.Enabled:=false;
     ednombre.SetFocus;
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
     frmprincipal.ucprincipal.Log('Edito el Sector '+tblsectoresnombre.AsString,2);
     tblsectores.Post;
     edclave.Enabled:=true;
     tblsectores.Active:=false;
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
  end;
end;

procedure Tfrmmoviles.btncancelarClick(Sender: TObject);
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
         edclave.Text:='';
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
     edclave.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
 end
else
close;

end;

procedure Tfrmmoviles.mmdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

  end;
end;

end.
