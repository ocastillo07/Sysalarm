unit uservicios_esp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzButton, ExtCtrls, RzPanel, RzRadGrp,
  StdCtrls, RzEdit, Mask, RzLabel, MemDS, DBAccess, MyAccess;

type
  Tfrmservicios_esp = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edcliente: TRzEdit;
    ednombre: TRzEdit;
    dtservicio: TRzDateTimeEdit;
    ednota: TRzMemo;
    rgtipo: TRzRadioGroup;
    btnagregar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel5: TRzLabel;
    vservicios: TcxGridDBTableView;
    lservicios: TcxGridLevel;
    gservicios: TcxGrid;
    colfecha: TcxGridDBColumn;
    colservicio: TcxGridDBColumn;
    colnota: TcxGridDBColumn;
    sqlserv: TMyQuery;
    dsserv: TDataSource;
    sqlgen: TMyQuery;
    lbservicios: TRzLabel;
    procedure sqlservAfterOpen(DataSet: TDataSet);
    procedure btnagregarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure inicializa(cliente:string);
    { Public declarations }
  end;

var
  frmservicios_esp: Tfrmservicios_esp;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}

procedure Tfrmservicios_esp.inicializa(cliente:string);
begin
edcliente.Text := cliente;
querys('Select '+ClienteNombre('c')+' as nombre from clientes c where idcliente='+cliente, 0, sqlgen);
ednombre.Text := sqlgen.fieldbyname('nombre').AsString;

querys('Select s.fechacreacion as fecha, t.nombre as tiposerv, s.nota from servicios_espmov s '+
       'left join servicios_especiales t on t.idserv_esp=s.idserv_esp where s.idcliente='+cliente, 0, sqlserv);
dtservicio.Date := Date();
querys('Select nombre, usuario, fecha, hora from servicios_especiales', 0, sqlgen);
rgtipo.Items.Clear;
while not sqlgen.Eof do
   begin
   rgtipo.Items.Add(sqlgen.fieldbyname('nombre').AsString);
   sqlgen.next;
   end;
end;

procedure Tfrmservicios_esp.sqlservAfterOpen(DataSet: TDataSet);
var cad:string;
begin
cad := '';
querys('Select count(idcliente) as cant, t.cantidad, t.nombre as tiposerv from servicios_espmov s '+
       'left join servicios_especiales t on t.idserv_esp=s.idserv_esp '+
       'where s.idcliente='+edcliente.Text+' and year(s.fechacreacion)=year(curdate()) '+
       'group by s.idserv_esp having cant>=cantidad', 0, sqlgen);
while not sqlgen.eof do
   begin
   cad := cad + sqlgen.fieldbyname('tiposerv').AsString+char(#13);
   sqlgen.Next;
   end;
lbservicios.Caption := cad;
end;

procedure Tfrmservicios_esp.btnagregarClick(Sender: TObject);
begin
if rgtipo.ItemIndex = -1 then
   begin
   Application.MessageBox('Falta el Tipo', 'Atencion', MB_ICONINFORMATION);
   exit;
   end;

if dtservicio.Text = '' then
   begin
   Application.MessageBox('Falta la Fecha', 'Atencion', MB_ICONINFORMATION);
   exit;
   end;

if ednota.Text = '' then
   begin
   Application.MessageBox('Falta la Nota', 'Atencion', MB_ICONINFORMATION);
   exit;
   end;

if(querys('Select count(idcliente) as cant, t.cantidad, t.nombre as tiposerv from servicios_espmov s '+
       'left join servicios_especiales t on t.idserv_esp=s.idserv_esp '+
       'where s.idcliente='+edcliente.Text+' and year(s.fechacreacion)=year(curdate()) '+
       'and t.idserv_esp = '+inttostr(rgtipo.ItemIndex+1)+' group by s.idserv_esp having cant>=cantidad', 0, sqlgen) > 0 ) then
   begin
   Application.MessageBox('Este servicio se ha cubierto en su totalidad no puede agregar mas', 'Atencion', MB_ICONEXCLAMATION);
   end
else
   begin

querys('Insert into servicios_espmov (idcliente, fechacreacion, idserv_esp, nota, usuario, fecha, hora) values '+
       '('+edcliente.Text+', "'+dtservicio.Text+'", '+inttostr(rgtipo.ItemIndex+1)+', "'+ednota.Text+'", '+
       '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date())+'", "'+TimeToStr(HoraServidor)+'")', 1, sqlgen);
frmprincipal.ucprincipal.Log('Dio de alta el servicio especial al cliente '+edcliente.Text, 1);
ednota.text := '';
sqlserv.close;
sqlserv.open;
end;
end;

procedure Tfrmservicios_esp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmservicios_esp.btncancelarClick(Sender: TObject);
begin
close;
end;

End.
