unit Ufamilias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt;

type
  Tfrmfamilias = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSfamilias: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblfamilias: TMyTable;
    tblfamiliasidfamilia: TIntegerField;
    tblfamiliasnombre: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    lbufh: TRzLabel;
    tblfamiliasusuario: TStringField;
    tblfamiliasfecha: TStringField;
    tblfamiliashora: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblfamiliasBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure tblfamiliasAfterClose(DataSet: TDataSet);
    procedure tblfamiliasAfterOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
  frmfamilias: Tfrmfamilias;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmfamilias.buscarlocate;
begin

tblfamilias.Active:=true;
if tblfamilias.Locate('idfamilia',edclave.Text,[]) then
  begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    lbufh.Caption := UFH(tblfamilias);
  end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tblfamilias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
end;


end;

procedure Tfrmfamilias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmfamilias.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
       navegador.Enabled:=false;
    //trae el maximo idtipo + 1
    querys('select max(idfamilia) from familias',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled:=false;
   //pone la tabla de familias en modo de insercion
   tblfamilias.Active:=true;
   tblfamilias.Insert;
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
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta una familia';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta la familia '+ednombre.text,1);
     //trae el maximo idtipo + 1
     querys('select max(idfamilia)+1 from familias',0,sqlgeneral);
     IF sqlgeneral.Fields.Fields[0].AsString ='' THEN
     edclave.Text:='1'
     else
     edclave.Text:=sqlgeneral.Fields.Fields[0].AsString;
     //guarda los datos
     tblfamilias.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
     querys('update familias set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idfamilia='+edclave.Text,1,sqlgeneral);
      tblfamilias.Active:=false;
      ednombre.Enabled:=false;
      edclave.Enabled:=true;
      //btnbuscar.Enabled:=true;
      edclave.Text:='';
      edclave.SetFocus;
   end;
end;

procedure Tfrmfamilias.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select idfamilia,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From familias order by idfamilia';
      frmbusquedas.campo_retorno:='idfamilia';
      frmbusquedas.campo_busqueda:='Nombre';
      frmbusquedas.tblorigen:='familias';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblfamilias.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //btnbuscar.Click;
             //edclave.OnButtonClick(self);
             buscarlocate;
            end;
    end;
end;

procedure Tfrmfamilias.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;

if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblfamilias.Active:=true;
if tblfamilias.Locate('idfamilia',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tblfamilias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmfamilias.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblfamilias.Cancel;
     tblfamilias.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la familia actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una familia';
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
       lbufh.Caption := '';
 end
else
release;
end;

procedure Tfrmfamilias.btnmodificarClick(Sender: TObject);
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
     tblfamilias.Edit;
     ednombre.setfocus;
   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la familia actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la familia '+tblfamiliasnombre.AsString,2);
     tblfamilias.Post;
     tblfamilias.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmfamilias.tblfamiliasBeforePost(DataSet: TDataSet);
begin
tblfamiliasidfamilia.AsString:=edclave.Text;
end;

procedure Tfrmfamilias.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que la familia no este siendo usado en la tabla de articulos
querys('select idfamilia as Id,cod_cve as Cod_Cve,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora from articulos where idfamilia='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este Tipo esta siendo usado por un articulo y no podra ser eliminado hasta que se borre el articulo o haga referencia a otra familia!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas Seguro que deseas borrar esta familia?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la familia '+tblfamiliasnombre.asstring,3);
      tblfamilias.Delete;
      application.MessageBox('Eliminacion de la familia Exitosa','Información',mb_ok);
      tblfamilias.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblfamilias.Active:=false;
      edclave.text:='';
      edclave.SetFocus;
   end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmfamilias.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=dsfamilias.DataSet.fieldbyname('idfamilia').AsString;
lbufh.Caption := UFH(tblfamilias);
end;

procedure Tfrmfamilias.tblfamiliasAfterClose(DataSet: TDataSet);
begin
navegador.Enabled:=false;
end;

procedure Tfrmfamilias.tblfamiliasAfterOpen(DataSet: TDataSet);
begin
navegador.Enabled:=true;
end;

procedure Tfrmfamilias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblfamilias,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmfamilias.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblfamilias.Active:=true;
if tblfamilias.Locate('idfamilia',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tblfamilias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmfamilias.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmfamilias.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmfamilias.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tblfamilias.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
   end;
end;

procedure Tfrmfamilias.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

end.
