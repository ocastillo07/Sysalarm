unit Ulineas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt;

type
  Tfrmlineas = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSlineas: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tbllineas: TMyTable;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    tbllineasidlinea: TIntegerField;
    tbllineasnombre: TStringField;
    tbllineascantidad: TFloatField;
    tbllineasimporte: TFloatField;
    tbllineasusuario: TStringField;
    tbllineashora: TStringField;
    tbllineasfecha: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tbllineasBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmlineas: Tfrmlineas;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos;

{$R *.dfm}


procedure Tfrmlineas.buscarlocate;
begin

tbllineas.Active:=true;
if tbllineas.Locate('idlinea',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tbllineas);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa linea no Existe','Información',mb_ok+mb_iconinformation);
    tbllineas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;


procedure Tfrmlineas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;



procedure Tfrmlineas.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idlinea + 1
    querys('select max(idlinea) from lineas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled:=false;
   //pone la tabla de Lineass en modo de insercion
   tbllineas.Active:=true;
   tbllineas.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   ednombre.Enabled:=true;
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from lineas where idlinea<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta una Linea';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta la Linea '+ednombre.text,1);
     //trae el maximo idlinea + 1
     querys('select max(idlinea) from lineas',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      //guarda los datos
      tbllineas.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update lineas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idlinea='+edclave.Text,1,sqlgeneral);
      tbllineas.Active:=false;
      ednombre.Enabled:=false;
      edclave.Enabled:=true;
      //btnbuscar.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
   end;
end;

procedure Tfrmlineas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idlinea,nombre as Nombre,cantidad as Cantidad,importe as Importe,usuario as Usuario,fecha as Fecha,hora as Hora From lineas order by idlinea';
      frmbusquedas.campo_retorno:='idlinea';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen := 'lineas';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbllineas.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //btnbuscar.Click;
             //dclave.OnButtonClick(self);
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmlineas.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;

if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbllineas.Active:=true;
if tbllineas.Locate('idlinea',edclave.Text,[]) then
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
    application.MessageBox('Esa Linea no Existe','Información',mb_ok+mb_iconinformation);
    tbllineas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmlineas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tbllineas.Cancel;
     tbllineas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Linea Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Linea';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure Tfrmlineas.btnmodificarClick(Sender: TObject);
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
     tbllineas.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
   if ExisteNombre(ednombre,'select nombre from lineas where idlinea<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Linea actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Linea '+tbllineasnombre.AsString,2);
     tbllineas.Post;
     tbllineas.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmlineas.tbllineasBeforePost(DataSet: TDataSet);
begin
tbllineasidlinea.AsString:=edclave.Text;
end;

procedure Tfrmlineas.btnborrarClick(Sender: TObject);
begin
//busca que el tipo no este siendo usado en la tabla de prospectos
querys('select idlinea from articulos where idlinea='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Lineas esta siendo usado por un articulo y no podra ser eliminada hasta que se borre el articulo o haga referencia a otra Linea!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas Seguro que deseas borrar esta Linea?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la Linea '+tbllineasnombre.asstring,3);
      tbllineas.Delete;
      application.MessageBox('Eliminacion Exitosa de la linea ','Información',mb_ok);
      tbllineas.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbllineas.Active:=false;
      edclave.text:='';
      edclave.SetFocus;
   end;
end;

procedure Tfrmlineas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tbllineas,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmlineas.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=DSlineas.dataset.fieldbyname('idlinea').AsString;
lbufh.Caption := UFH(tbllineas);
end;

procedure Tfrmlineas.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmlineas.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmlineas.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmlineas.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbllineas.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;   
end;

procedure Tfrmlineas.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

end.
