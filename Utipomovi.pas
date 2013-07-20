unit Utipomovi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt, ExtCtrls,
  DBCtrls, RzDBNav, StdCtrls, Mask, RzDBEdit, RzButton, RzLabel, RzCmboBx;

type
  Tfrmtiposmovi = class(TForm)
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    DStipomov: TDataSource;
    sqlgeneral: TMyQuery;
    tbltipomovi: TMyTable;
    tbltipomoviidmovi: TIntegerField;
    tbltipomovinombre: TStringField;
    edafecta: TRzComboBox;
    RzLabel22: TRzLabel;
    tbltipomoviafecta: TStringField;
    tbltipomoviusuario: TStringField;
    tbltipomovifecha: TStringField;
    tbltipomovihora: TStringField;
    lbufh: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure buscarlocate;
    procedure edafectaNotInList(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure tbltipomoviBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtiposmovi: Tfrmtiposmovi;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmtiposmovi.buscarlocate;
begin

tbltipomovi.Active:=true;
if tbltipomovi.Locate('idmovi',edclave.Text,[]) then
  begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.enabled:=true;
    edafecta.Text:=tbltipomoviafecta.AsString;
    lbufh.Caption := UFH(tbltipomovi);
  end
else
  begin
    edafecta.Text:='';
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbltipomovi.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
end;


end;




procedure Tfrmtiposmovi.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
       navegador.Enabled:=false;
    //trae el maximo idtipo + 1
    querys('select max(idmovi) from TipoMov',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled:=false;
   //pone la tabla de TipoMov en modo de insercion
   tbltipomovi.Active:=true;
   tbltipomovi.Insert;
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
   edafecta.enabled:=true;
   edafecta.Text:='';
   lbufh.Caption := '';
   end
   else
   begin
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta una TipoMov';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta la TipoMov '+ednombre.text,1);
     //trae el maximo idtipo + 1
     querys('select max(idmovi)+1 from TipoMov',0,sqlgeneral);
     IF sqlgeneral.Fields.Fields[0].AsString ='' THEN
     edclave.Text:='1'
     else
     edclave.Text:=sqlgeneral.Fields.Fields[0].AsString;
     //guarda los datos
     tbltipomoviafecta.AsString:=edafecta.Text;
     tbltipomovi.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
     querys('update TipoMov set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmovi='+edclave.Text,1,sqlgeneral);
      tbltipomovi.Active:=false;
      ednombre.Enabled:=false;
      edclave.Enabled:=true;
      //btnbuscar.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
      edafecta.enabled:=false;
   end;
end;

procedure Tfrmtiposmovi.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que la TipoMov no este siendo usado en la tabla de articulos
querys('select idmovi as Id,idprov as IDProveedor,usuario as Usuario,fecha as Fecha,hora as Hora from PagosProv where idmovi='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Tipo esta siendo usado por un pago a un proveedor y no podra ser eliminado hasta que se borre la referencia  o cambie a otro Tipo de Movimiento!','Cuidado',mb_ok+mb_iconinformation)
else begin
querys('select idmovi as Id,cod_cve as Cod_Cve,usuario as Usuario,FechaMov as Fecha,HoraMov as Hora from CardexArt where idmovi='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Tipo esta siendo usado por un cardex y no podra ser eliminado hasta que se borre la referencia  o cambie a otro Tipo de Movimiento!','Cuidado',mb_ok+mb_iconinformation)
else begin
  if application.MessageBox('Estas Seguro que deseas borrar esta TipoMov?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la TipoMov '+tbltipomovinombre.asstring,3);
      tbltipomovi.Delete;
      application.MessageBox('Eliminación de la TipoMov Exitosa','Información',mb_ok);
      tbltipomovi.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbltipomovi.Active:=false;
      edclave.text:='';
      edclave.SetFocus;
      edafecta.Text:='';
   end;
end;   
end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

end;

procedure Tfrmtiposmovi.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     navegador.Enabled:=false;
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
     tbltipomovi.Edit;
     ednombre.setfocus;
     edafecta.enabled:=true;
   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la TipoMov actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la TipoMov '+tbltipomovinombre.AsString,2);
     tbltipomoviafecta.AsString:=edafecta.Text;
     tbltipomovi.Post;
     tbltipomovi.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     edafecta.Text:='';
     edafecta.enabled:=false;     
     end;
end;

procedure Tfrmtiposmovi.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tbltipomovi.Cancel;
     tbltipomovi.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la TipoMov actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una TipoMov';
          btnalta.ImageIndex:=5;

        end;
       ednombre.Enabled:=false;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
       edafecta.Text:='';
       edafecta.Text:='';
       edafecta.enabled:=false;
 end
else
release;
end;

procedure Tfrmtiposmovi.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=dsTipoMov.DataSet.fieldbyname('idmovi').AsString;
edafecta.Text:=dsTipoMov.DataSet.fieldbyname('afecta').AsString;
lbufh.Caption := UFH(tbltipomovi);
end;

procedure Tfrmtiposmovi.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmtiposmovi.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbltipomovi.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   edafecta.Text:='';
   lbufh.Caption := '';
   end;
end;

procedure Tfrmtiposmovi.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmtiposmovi.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmtiposmovi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmtiposmovi.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tbltipomovi,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmtiposmovi.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idmovi,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From TipoMov order by idmovi';
      frmbusquedas.campo_retorno:='idmovi';
      frmbusquedas.tblorigen := 'TipoMov';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbltipomovi.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //btnbuscar.Click;
             //edclave.OnButtonClick(self);
             buscarlocate;
            end;
    end;
end;

procedure Tfrmtiposmovi.edafectaNotInList(Sender: TObject);
begin
edafecta.ItemIndex:=0;
end;

procedure Tfrmtiposmovi.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)  then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmtiposmovi.tbltipomoviBeforePost(DataSet: TDataSet);
begin
 tbltipomoviusuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
 tbltipomovifecha.AsDateTime := date();
 tbltipomovihora.AsString := timetostr(now());
 tbltipomoviafecta.AsString := edafecta.Text;
end;

end.
