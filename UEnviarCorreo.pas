{///////////////////////////////////////////////////////////////////////////////
2012/07/19 dalyla correo a proveedor
2009/02/26 dalyla mostrar el area
}///////////////////////////////////////////////////////////////////////////////
unit UEnviarCorreo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzGroupBar, RzButton, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, MemDS,
  DBAccess, MyAccess, ExtCtrls, RzPanel, RzRadGrp, RzRadChk;

type
  TfrmEnviarCorreo = class(TForm)
    edenviar: TRzEdit;
    RzLabel8: TRzLabel;
    edmensaje: TRzEdit;
    RzLabel1: TRzLabel;
    rgtipo: TRzRadioGroup;
    sqlgeneral: TMyQuery;
    DS1: TDataSource;
    MemoBody: TRzMemo;
    RzLabel2: TRzLabel;
    Grid: TcxGrid;
    GridView1: TcxGridDBTableView;
    GridView1DBColumn1: TcxGridDBColumn;
    GridView1DBColumn2: TcxGridDBColumn;
    DBGLevel1: TcxGridLevel;
    GridView1DBColumn3: TcxGridDBColumn;
    btnenviar: TRzBitBtn;
    btnsalir: TRzBitBtn;
    chkCorreoInterno: TRzCheckBox;
    adj: TRzMemo;
    RzLabel3: TRzLabel;
    GridView1DBColumn4: TcxGridDBColumn;
    procedure GridView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridView1DblClick(Sender: TObject);
    procedure btnenviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    cliente,ori,responder,direccion,subject, tipogrid:string;
    body:tmemo;  //  adj,
    ini:boolean;
    constructor inicializa(const asunto:string;const adjuntos:Tmemo);
  end;

var
  frmEnviarCorreo: TfrmEnviarCorreo;

implementation

uses Urecursos, Udm, Uprincipal, Udmrep;

{$R *.dfm}

constructor TfrmEnviarCorreo.inicializa(const asunto:string;const adjuntos:TMemo);
begin
subject:=asunto;
adj.Text := adjuntos.Text;
sqlgeneral.active:=true;
edmensaje.Text:=asunto;
if asunto = '' then
  ini:=false
else
  ini:=true;
if tipogrid = 'P' then
  begin
  sqlgeneral.SQL.text := 'select idprov as codigo, '+ClienteNombre('p')+' as Nombre, email as Email, ciudad as area '+
                         'from proveedores p where p.estatus = 1 ';
  chkCorreoInterno.Checked := false;
  end
else
  begin
  sqlgeneral.SQL.text := 'select codigo, '+UsuarioNombre('u')+' as Nombre, email1 as Email, a.nombre as area '+
                         'from usuarios u left join areas a on a.idarea=u.idarea where u.estatus = 1 ';
  chkCorreoInterno.Checked := true;
  end;
sqlgeneral.Open;
end;


procedure TfrmEnviarCorreo.GridView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
GridView1.BeginUpdate;
GridView1.DataController.ClearSorting(true);
GridView1.Columns[GridView1.Controller.FocusedColumnIndex].SortOrder:= soAscending;
GridView1.EndUpdate;

end;

procedure TfrmEnviarCorreo.GridView1DblClick(Sender: TObject);
begin
if edenviar.Text <> '' then
edenviar.Text:= edenviar.Text+','+lowercase(DS1.DataSet.FieldValues['Email'])
else
edenviar.Text:= lowercase(DS1.DataSet.FieldValues['Email'])

end;

procedure TfrmEnviarCorreo.btnenviarClick(Sender: TObject);
var hostint:integer;
begin
if edenviar.Text <> '' then
  begin
  if edmensaje.Text <> '' then
    begin
    memobody.Lines.Add('');
    memobody.Lines.Add('Reporte generado por :');

    querys('select '+UsuarioNombre('usuarios')+' as usuario,p.nombre as puesto from usuarios left join puestos as p '+
           'on p.idpuesto=usuarios.idpuesto where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,dmreportes.sqlgeneral5);

    memobody.Lines.Add(dmreportes.sqlgeneral5.fieldbyname('usuario').asstring +' con el puesto de '+dmreportes.sqlgeneral5.fieldbyname('puesto').asstring);
    memobody.Lines.Add('Si no puede leer el archivo descargue la versión mas nueva del visualizador de pdf e instalela en su computadora ');
    memobody.Lines.Add('http://www.adobe.com/products/acrobat/readstep2.html');

    if chkCorreoInterno.Checked = true then
      begin
      hostint := 1;
      querys('Select valor from configuraciones where concepto="UserEmailInterno" ',0,dmaccesos.sqlgeneral);
      end
    else
      begin
      hostint := 0;
      querys('Select valor from configuraciones where concepto="UserEmail" ',0,dmaccesos.sqlgeneral);
      end;
      
    if send_email(dmaccesos.sqlgeneral.fieldbyname('valor').asstring,dmaccesos.sqlgeneral.fieldbyname('valor').asstring,edenviar.Text,edmensaje.Text,adj,memobody, hostint) = 1 then
      application.MessageBox('Hubo un error al enviar el reporte!, intente de nuevo ó consulte con el Administrador del sistema!','Atencíón',mb_IconWarning);
    if ini = true then
      close;
    end
  else
    begin
    grid.SetFocus;
    application.MessageBox('Falta el comentario del correo','Atención',mb_IconWarning);
    end;
  end
else
  begin
  edenviar.SetFocus;
  application.MessageBox('Seleccione un destinatario por lo menos','Atención',mb_IconWarning);
  end;
end;

procedure TfrmEnviarCorreo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmEnviarCorreo.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmEnviarCorreo.FormCreate(Sender: TObject);
begin
tipogrid := 'U';
end;

end.
