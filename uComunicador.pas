unit uComunicador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzButton,
  RzRadChk, RzDBChk, RzEdit, RzBtnEdt, Mask, RzDBEdit, DB, MemDS, DBAccess,
  MyAccess, DateUtils;

type
  TfrmComunicadores = class(TForm)
    tblcomun: TMyTable;
    dscomun: TDataSource;
    ednoserie: TRzDBEdit;
    edclave: TRzButtonEdit;
    dtsalida: TRzDateTimeEdit;
    dtentrada: TRzDateTimeEdit;
    ckdisponible: TRzDBCheckBox;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    sqlgeneral: TMyQuery;
    tblcomunidcomunicador: TIntegerField;
    tblcomunnoserie: TStringField;
    tblcomunultimaSalida: TDateField;
    tblcomunultimaEntrada: TDateField;
    tblcomundisponible: TSmallintField;
    tblcomunusuario: TStringField;
    tblcomunfecha: TStringField;
    tblcomunhora: TStringField;
    ckestatus: TRzDBCheckBox;
    tblcomunestatus: TSmallintField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblcomunBeforePost(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmComunicadores: TfrmComunicadores;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos;

{$R *.dfm}

procedure TfrmComunicadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmComunicadores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
CanClose := CerrarPantalla(tblcomun, btncancelar, btnalta, btnmodificar);
end;

procedure TfrmComunicadores.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
  begin
  with frmbusquedas do
    begin
    query:='SELECT idcomunicador, noserie, ultimaSalida, ultimaEntrada, disponible '+
           'FROM comunicadores';
    campo_busqueda:='noserie';
    campo_retorno:='idcomunicador';
    tabla:='comunicadores';
    ShowModal;
    if resultado <> '' then
      begin
      tblcomun.Active:=true;
      tblcomun.Locate('idcomunicador',resultado,[]);
      navegador.Enabled:=true;
      btnalta.Enabled:=true;
      btnmodificar.Enabled:=true;
      btnborrar.Enabled:=true;
      end;
    end;
  end;
end;

procedure TfrmComunicadores.edclaveButtonClick(Sender: TObject);
  var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmComunicadores.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then  begin
   tblcomun.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure TfrmComunicadores.edclaveKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TfrmComunicadores.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
  begin
  edclave.Enabled:=false;
  //pone la tabla de areas en modo de insercion
  tblcomun.Active:=true;
  tblcomun.Insert;
  querys('select max(idcomunicador) as id from comunicadores',0,sqlgeneral);
  edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  dtsalida.Date := today;
  dtentrada.Date := today;
  ckestatus.Checked := true;
  habilita(true);
  lbufh.Caption := '';
  ednoserie.SetFocus;
  end
else
  begin
  if ExisteNombre(ednoserie,'select noserie from comunicadores where idcomunicador <> '+
     edclave.Text+' and noserie="'+ednoserie.Text+'"',sqlgeneral) = 1 then
    exit;
  habilita(false);
  btnalta.Caption:='&Alta';
  btnalta.Hint:='Dar de Alta un comunicador';
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar esta Ventana';
  btnalta.ImageIndex:=5;
  btnborrar.Enabled:=true;
  btnmodificar.Enabled:=true;
  frmprincipal.ucprincipal.Log('Dio de Alta el comunicador '+ednoserie.text,1);
  querys('select max(idcomunicador) as id from comunicadores',0,sqlgeneral);
  edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
  tblcomun.Post;
  tblcomun.Active:=false;
  edclave.Text:='';
  edclave.SetFocus;
  end;
end;

procedure TfrmComunicadores.btnborrarClick(Sender: TObject);
begin
exit;
//SELECT QUE BUSCA DONDE SE USA
querys('select noserie from rentacom where noserie='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  application.MessageBox('Este comunicador esta relacionado con una venta. ','Operacion No Realizada',mb_iconwarning)
else
  begin
  frmprincipal.ucprincipal.Log('Elimino el comunicador '+tblcomunnoserie.asstring,3);
  tblcomun.Delete;
  application.MessageBox('Eliminacion del comunicador Exitosa','Información',mb_ok);
  tblcomun.Active:=false;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  tblcomun.Active:=false;
  end;
end;

procedure TfrmComunicadores.btnmodificarClick(Sender: TObject);
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
     tblcomun.Edit;
     ednoserie.setfocus;
   end
else
  begin
  if ExisteNombre(ednoserie,'select noserie from comunicadores where idcomunicador <> '+
     edclave.Text+' and noserie="'+ednoserie.Text+'"',sqlgeneral) = 1 then
    exit;
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btncancelar.Hint:='Cerrar esta Pantalla';
  btnmodificar.hint:='Editar los datos del comunicador Actual';
  btnmodificar.ImageIndex:=2;
  btnalta.Enabled:=true;
  frmprincipal.ucprincipal.Log('Edito el Area '+tblcomunnoserie.AsString,2);
  tblcomun.Post;
  habilita(false);
  edclave.Text:='';
  edclave.SetFocus;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmComunicadores.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
  tblcomun.Cancel;
  tblcomun.Active:=false;
  navegador.Enabled:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  lbufh.Caption := '';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del comunicador Actual';
    btnmodificar.ImageIndex:=2;
    edclave.Text:='';
    end;
  if btnalta.Enabled then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Area';
    btnalta.ImageIndex:=5;
    edclave.Text:='';
    end;
  habilita(false);
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edclave.SetFocus;
  end
else
  close;
end;

procedure TfrmComunicadores.buscarlocate;
begin
tblcomun.Active:=true;
if (tblcomun.Locate('idcomunicador',edclave.Text,[])) or (tblcomun.Locate('noserie',edclave.Text,[])) then
   begin
   edclave.text := tblcomunidcomunicador.AsString;
dtsalida.Date := tblcomunultimaSalida.AsDateTime;
dtentrada.Date := tblcomunultimaEntrada.AsDateTime;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblcomun);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese comunicador no Existe','Información',mb_ok+mb_iconinformation);
    tblcomun.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmComunicadores.habilita(hab:boolean);
begin
edclave.enabled := not hab;
navegador.enabled := not hab;
ednoserie.enabled := hab;
ckestatus.enabled := hab;
{dtsalida.enabled := hab;
dtentrada.enabled := hab;
ckdisponible.enabled := hab;}
end;

procedure TfrmComunicadores.tblcomunBeforePost(DataSet: TDataSet);
begin
tblcomunidcomunicador.AsString:=edclave.Text;
tblcomunultimaSalida.AsDateTime := dtsalida.Date;
tblcomunultimaEntrada.AsDateTime := dtentrada.Date;
tblcomunusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
tblcomunfecha.AsString:=datetostr(date);
tblcomunhora.AsString:=timetostr(time);
end;

procedure TfrmComunicadores.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text := tblcomunidcomunicador.AsString;
dtsalida.Date := tblcomunultimaSalida.AsDateTime;
dtentrada.Date := tblcomunultimaEntrada.AsDateTime;
lbufh.Caption := UFH(tblcomun);
end;

End.

