//2008/02/28 dalyla zona horaria ok
unit UDerechosAdicionales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, DBCtrls, RzDBNav, RzButton,
  ExtCtrls, RzPanel, RzEdit, RzBtnEdt, StdCtrls, RzCmboBx, Mask, RzDBEdit,
  RzLabel, RzRadChk, RzDBChk;

type
  TfrmDerechosAdicionales = class(TForm)
    chkauditor: TRzDBCheckBox;
    chkCapPrecios: TRzDBCheckBox;
    chkcontrato: TRzDBCheckBox;
    chkModServFin: TRzDBCheckBox;
    chkvender: TRzDBCheckBox;
    chkCreaServ: TRzDBCheckBox;
    chkModInst: TRzDBCheckBox;
    chkAbogados: TRzDBCheckBox;
    chkUniNeg: TRzDBCheckBox;
    chkPresDefault: TRzDBCheckBox;
    chkFinMinuta: TRzDBCheckBox;
    chkRequisicion: TRzDBCheckBox;
    chkMinCorp: TRzDBCheckBox;
    chkModCosto: TRzDBCheckBox;
    lblnombre: TRzLabel;
    ednombre: TRzDBEdit;
    lblapaterno: TRzLabel;
    edapaterno: TRzDBEdit;
    lblamaterno: TRzLabel;
    edamaterno: TRzDBEdit;
    RzLabel4: TRzLabel;
    edcodigo: TRzDBEdit;
    RzLabel11: TRzLabel;
    edcodigo2: TRzDBEdit;
    cboarea: TRzComboBox;
    cbopuesto: TRzComboBox;
    lblpuesto: TRzLabel;
    lblarea: TRzLabel;
    lblclave: TRzLabel;
    edclave: TRzButtonEdit;
    rgusuario: TRzGroupBox;
    btncancelar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    dbnavegador: TRzDBNavigator;
    tblusuarios: TMyTable;
    tblusuariosidusuario: TIntegerField;
    tblusuariosnombre: TStringField;
    tblusuarioscodigo: TStringField;
    tblusuariosidarea: TIntegerField;
    tblusuariosidpuesto: TIntegerField;
    tblusuariosapaterno: TStringField;
    tblusuariosamaterno: TStringField;
    tblusuariosestatus: TBooleanField;
    tblusuariosFacturaC: TBooleanField;
    tblusuariosPrecioCapturable: TSmallintField;
    tblusuariosaudittravel: TSmallintField;
    tblusuarioscodigo2: TStringField;
    tblusuariosalta_senales: TSmallintField;
    tblusuariosCambiaContrato: TIntegerField;
    tblusuariosModificarServicios: TSmallintField;
    tblusuariosPuedeVender: TSmallintField;
    tblusuariosCrearServicio: TSmallintField;
    tblusuariosModificarInstalaciones: TSmallintField;
    tblusuariosCambiarAbogado: TSmallintField;
    tblusuariosTodasUNPedidos: TBooleanField;
    tblusuariosGuardaPresDefault: TBooleanField;
    tblusuariosFinalizaMinuta: TBooleanField;
    tblusuariosAutorizaRequisiciones: TSmallintField;
    tblusuariosMinutaGerencial: TIntegerField;
    tblusuariosModificaCosto: TBooleanField;
    DSusuarios: TDataSource;
    tblusuariosFacturaP: TBooleanField;
    tblusuariosFacturaD: TBooleanField;
    gbfacturar: TRzGroupBox;
    chkpedidos: TRzDBCheckBox;
    chkcaja: TRzDBCheckBox;
    chkcd: TRzDBCheckBox;
    lblestatus: TRzLabel;
    chkInsSen: TRzDBCheckBox;
    rgadmitivo: TRzGroupBox;
    rgoptivo: TRzGroupBox;
    sqlgeneral: TMyQuery;
    edestatus: TRzEdit;
    chkApareceMinuta: TRzDBCheckBox;
    tblusuariosAparMinMensual: TBooleanField;
    chkRemisionar: TRzDBCheckBox;
    tblusuariosRemisionar: TBooleanField;
    RzDBCheckBox1: TRzDBCheckBox;
    tblusuariosFinalizaTickets: TBooleanField;
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure dbnavegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDerechosAdicionales: TfrmDerechosAdicionales;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmDerechosAdicionales.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo := 66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmDerechosAdicionales.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
  key:=#0;
  if edclave.Text <> '' then
    buscarlocate
  else
    edclave.OnButtonClick(self);
  end;
end;

procedure TfrmDerechosAdicionales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmDerechosAdicionales.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
  begin
  with frmbusquedas do
    begin
    query:='Select u.idusuario, u.codigo, '+UsuarioNombre('u')+' as nombre,a.nombre as Area, p.nombre as Puesto, '+
           'if(u.estatus = 0, "INACTIVO", "ACTIVO") as estatus From usuarios as u left join areas as a on a.idarea = '+
           'u.idarea left join puestos as p on p.idpuesto=u.idpuesto order by idusuario';
    campo_retorno:='idusuario';
    campo_busqueda:='nombre';
    tblorigen := 'usuarios';
    ShowModal;
    if resultado <> '' then
      begin
      edclave.Text:=frmbusquedas.resultado;
      buscarlocate;
      end;
    end;
  edclave.setfocus;
  end;
end;

procedure TfrmDerechosAdicionales.buscarlocate;
begin
tblusuarios.Active:=true;
if tblusuarios.Locate('idusuario',edclave.Text,[]) then
  begin
  querys('Select u.idusuario, u.codigo, '+UsuarioNombre('u')+' as nombre,a.nombre as Area, p.nombre as Puesto, '+
         'if(u.estatus = 0, "INACTIVO", "ACTIVO") as estatus From usuarios as u left join areas as a on a.idarea = '+
         'u.idarea left join puestos as p on p.idpuesto=u.idpuesto where idusuario='+edclave.text, 0, sqlgeneral);
  cboarea.Text := sqlgeneral.fieldbyname('Area').AsString;
  cbopuesto.Text := sqlgeneral.fieldbyname('Puesto').AsString;
  edestatus.Text := sqlgeneral.fieldbyname('estatus').AsString;     
  btnmodificar.Enabled:=true;
  edclave.SetFocus;
  end
else
  begin
  btnmodificar.Enabled:=false;
  application.MessageBox('Esa Clave de Usuario no Existe','Información',MB_ICONINFORMATION);
  tblusuarios.close;
  edclave.SetFocus;
  end;
end;

procedure TfrmDerechosAdicionales.FormShow(Sender: TObject);
begin
cargacombo2('Select nombre, idarea from areas order by nombre', 'nombre', 'idarea', cboarea);
cargacombo2('Select nombre, idpuesto from puestos order by nombre', 'nombre', 'idpuesto', cbopuesto);
end;

procedure TfrmDerechosAdicionales.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
   rgadmitivo.Enabled := True;
   rgoptivo.Enabled := True;
   btnmodificar.Caption:='&Guardar';
   btncancelar.Caption:='&Cancelar';
   btnmodificar.hint:='Guarda los Cambios Realizados';
   btnmodificar.ImageIndex:=1;
   dbnavegador.Enabled:=false;
   edclave.Enabled:=false;
   tblusuarios.Edit;
   end
else
  begin
  frmprincipal.ucprincipal.Log('Edicion del usuario #'+edclave.Text,0);
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Usuario Actual';
  btnmodificar.ImageIndex:=2;
  rgadmitivo.Enabled := True;
  rgoptivo.Enabled := True;
  tblusuarios.Post;
  querys('Update usuarios set usuario="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha="'+datetostr(date)+'", hora="'+timetostr(time)+'" where idusuario='+edclave.text, 1, sqlgeneral);
  frmprincipal.ucprincipal.Log('Edito los derechos del usuario # '+edclave.text,2);
  dbnavegador.Enabled:=true;
  edclave.Enabled:=true;
  end;
end;

procedure TfrmDerechosAdicionales.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Usuario Actual';
  btnmodificar.ImageIndex:=2;
  dbnavegador.Enabled:=true;
  edclave.Enabled:=true;
  tblusuarios.Cancel;
  end
else
  close;
end;

procedure TfrmDerechosAdicionales.dbnavegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text := tblusuariosidusuario.AsString;
buscarlocate;
end;

End.
