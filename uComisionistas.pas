unit uComisionistas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, ExtCtrls, DBCtrls, RzDBNav,
  StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit, RzButton, RzBtnEdt;

type
  TfrmComisionistas = class(TForm)
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    sqlgeneral: TMyQuery;
    tblcomisionistas: TMyTable;
    dscomisionistas: TDataSource;
    edapaterno: TRzDBEdit;
    edamaterno: TRzDBEdit;
    edpassword: TRzDBEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edclave: TRzButtonEdit;
    tblcomisionistasidcomisionista: TIntegerField;
    tblcomisionistasnombre: TStringField;
    tblcomisionistasapaterno: TStringField;
    tblcomisionistasamaterno: TStringField;
    tblcomisionistaspassword: TStringField;
    tblcomisionistasusuario: TStringField;
    tblcomisionistasfecha: TStringField;
    tblcomisionistashora: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edclaveButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edapaternoKeyPress(Sender: TObject; var Key: Char);
    procedure edamaternoKeyPress(Sender: TObject; var Key: Char);
    procedure edpasswordKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblcomisionistasBeforePost(DataSet: TDataSet);
  private
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComisionistas: TfrmComisionistas;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos;

{$R *.dfm}

procedure TfrmComisionistas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmComisionistas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblcomisionistas,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmComisionistas.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;


procedure TfrmComisionistas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idcomisionista,nombre, usuario as Usuario,fecha as Fecha,hora as Hora From Comisionistas order by idcomisionista';
        campo_retorno:='idcomisionista';
        campo_busqueda:='nombre';
        tblorigen := 'Comisionistas';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblcomisionistas.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmComisionistas.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblcomisionistas.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    lbufh.Caption := '';
  end;
end;

procedure TfrmComisionistas.edclaveKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmComisionistas.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmComisionistas.edapaternoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edapaterno.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmComisionistas.edamaternoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edamaterno.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmComisionistas.edpasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edpassword.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmComisionistas.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DScomisionistas.dataset.fieldbyname('idcomisionista').AsString;
lbufh.Caption := UFH(tblcomisionistas);
end;

procedure TfrmComisionistas.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idcomisionista)from Comisionistas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblcomisionistas.Active:=true;
    tblcomisionistas.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    ednombre.SetFocus;
    navegador.Enabled:=false;
    lbufh.Caption := '';
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from Comisionistas where idcomisionista<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Comisionista';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta el Comisionista '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idcomisionista) from Comisionistas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblcomisionistas.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update Comisionistas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcomisionista='+edclave.Text,1,sqlgeneral);
     tblcomisionistas.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmComisionistas.btnborrarClick(Sender: TObject);
begin
//valida que no se use en la tabla de travel
{  querys('select idcomisionista from pedidos where idcomisionista='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta Comisionistas esta siendo usado por un Pedido y no podra ser eliminada hasta que se borre el Pedido o haga referencia a otra Comisionistas!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin   }
    if application.MessageBox('Estas Seguro que deseas borrar este Comisionista?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino el Comisionista '+tblcomisionistasnombre.asstring,3);
        tblcomisionistas.Delete;
        application.MessageBox('Eliminacion del Comisionista Exitosa','Información',mb_ok);
        tblcomisionistas.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblcomisionistas.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
//    end;
end;

procedure TfrmComisionistas.btnmodificarClick(Sender: TObject);
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
     habilita(true);
     edclave.Enabled:=false;
     tblcomisionistas.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from Comisionistas where idcomisionista<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Comisionista Actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el Comisionista '+tblcomisionistasnombre.AsString,2);
     bpcambios('Comisionistas', edclave.text, 'idcomisionista');
     tblcomisionistas.Post;
     apcambios('idcomisionista', edclave.Text, 'Comisionistas', 'frmComisionistas');
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update Comisionistas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcomisionista='+edclave.Text,1,sqlgeneral);
     tblcomisionistas.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmComisionistas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcomisionistas.Cancel;
     tblcomisionistas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Comisionistas Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Comisionistas';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       habilita(false);
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmComisionistas.buscarlocate;
begin
tblcomisionistas.Active:=true;
if tblcomisionistas.Locate('idcomisionista',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblcomisionistas);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Comisionista no Existe','Información',mb_ok+mb_iconinformation);
    tblcomisionistas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmComisionistas.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
edapaterno.Enabled := hab;
edamaterno.Enabled := hab;
edpassword.Enabled := hab;
end;


procedure TfrmComisionistas.tblcomisionistasBeforePost(DataSet: TDataSet);
begin
tblcomisionistasidcomisionista.AsString:=edclave.Text;
end;

End.
