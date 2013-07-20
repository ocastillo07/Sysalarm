{///////////////////////////////////////////////////////////////////////////////
2008/08/20 dalyla agregar extension y modificar orden de derechos para mostrar
2008/07/28 dalyla creado
}///////////////////////////////////////////////////////////////////////////////
unit uUsuarioActual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit, RzDBEdit, DB, MemDS,
  DBAccess, MyAccess;

type
  TfrmUsuarioActual = class(TForm)
    lnombre: TRzLabel;
    lidusuario: TRzLabel;
    lpuesto: TRzLabel;
    larea: TRzLabel;
    lcodigo: TRzLabel;
    llogin: TRzLabel;
    lipaddress: TRzLabel;
    lmaq: TRzLabel;
    RzLabel1: TRzLabel;
    btncerrar: TRzBitBtn;
    tblusuario: TMyQuery;
    edidusuario: TRzEdit;
    edlogin: TRzEdit;
    edcodigo: TRzEdit;
    edcodigo2: TRzEdit;
    ednombre: TRzEdit;
    edarea: TRzEdit;
    edpuesto: TRzEdit;
    edidmaq: TRzEdit;
    edip: TRzEdit;
    RzLabel2: TRzLabel;
    edextension: TRzEdit;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure lidusuarioDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarioActual: TfrmUsuarioActual;

implementation

uses Udm, Uprincipal, Urecursos, Uautentificacion, Ubusquedas;

{$R *.dfm}

procedure TfrmUsuarioActual.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmUsuarioActual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmUsuarioActual.FormShow(Sender: TObject);
begin
querys('select '+usuarionombre('u')+' as nombre, codigo, codigo2, extension from usuarios u '+
       'left join maquinas m on m.idmaq=u.idmaq '+
       'where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID), 0, tblusuario);
edidusuario.Text := inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
edlogin.Text := frmprincipal.ucprincipal.CurrentUser.LoginName;
ednombre.Text := tblusuario.fieldbyname('nombre').AsString;
edcodigo.Text := tblusuario.fieldbyname('codigo').AsString;
edcodigo2.Text := tblusuario.fieldbyname('codigo2').AsString;
edextension.Text := tblusuario.fieldbyname('extension').AsString;
edarea.Text := frmprincipal.AreaUsuario;
edpuesto.Text := frmprincipal.PuestoUsuario;
edidmaq.Text := frmprincipal.idmaq;
edip.Text := frmprincipal.ipmaq;
end;

procedure TfrmUsuarioActual.lidusuarioDblClick(Sender: TObject);
begin
if DerechosSys('Ver Usuarios') = false then
  begin
  if frmautentificacion.ShowModal <> mrok then
    begin
    Application.MessageBox('Usted no tiene derechos para accesar', 'Atencion', MB_ICONEXCLAMATION);
    exit;
    end;
  end;

with frmbusquedas do
   begin
   query:='select u.idusuario, '+usuarionombre('u')+' as nombre, codigo, codigo2, UCLogin, a.nombre as area, p.nombre as puesto, case u.estatus  '+
          'when 1 then "ACTIVO" when 0 then "INACTIVO" end as estatus, u.idmaq, m.ipadress '+
          'from usuarios u left join UCTabUsers uc on uc.UCIdUser = u.idusuario left join areas a on '+
          'a.idarea = u.idarea left join puestos p on p.idpuesto=u.idpuesto left join maquinas m on u.idmaq=m.idmaq';
   campo_retorno:='idusuario';
   campo_busqueda:='nombre';
   tblorigen := 'usuarios';
   lbldesc.Caption:='Busqueda por Nombre:';
   ShowModal;
   if resultado <> '' then
     begin
     querys('select u.idusuario, '+usuarionombre('u')+' as nombre, codigo, codigo2, UCLogin as login, '+
            'a.nombre as area, p.nombre as puesto, m.idmaq, ipadress, m.extension '+
            'from usuarios u left join UCTabUsers uc on uc.UCIdUser = u.idusuario left join areas a on '+
            'a.idarea = u.idarea left join puestos p on p.idpuesto=u.idpuesto left join maquinas m on u.idmaq=m.idmaq '+
            'where idusuario = '+resultado, 0,tblusuario);
     edidusuario.Text := tblusuario.fieldbyname('idusuario').AsString;
     edlogin.Text := tblusuario.fieldbyname('login').AsString;
     ednombre.Text := tblusuario.fieldbyname('nombre').AsString;
     edcodigo.Text := tblusuario.fieldbyname('codigo').AsString;
     edcodigo2.Text := tblusuario.fieldbyname('codigo2').AsString;
     edarea.Text := tblusuario.fieldbyname('area').AsString;
     edpuesto.Text := tblusuario.fieldbyname('puesto').AsString;
     edidmaq.Text := tblusuario.fieldbyname('idmaq').AsString;
     edip.Text := tblusuario.fieldbyname('ipadress').AsString;
     edextension.Text := tblusuario.fieldbyname('extension').AsString;
     end;
   end;
end;

end.
