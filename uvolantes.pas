unit uvolantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzButton, StdCtrls, RzLabel, RzEdit, RzCmboBx,
  Mask, MemDS, DBAccess, MyAccess;

type
  Tfrmvolantes = class(TForm)
    dtfecha: TRzDateTimeEdit;
    cbvendedor: TRzComboBox;
    edcantidad: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    btncancelar: TRzBitBtn;
    vvolanteo: TcxGridDBTableView;
    lvolanteo: TcxGridLevel;
    gvolanteo: TcxGrid;
    btnimprimir: TRzBitBtn;
    btnagregar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    sqlvolantes: TMyQuery;
    dsvolantes: TDataSource;
    colcodigo: TcxGridDBColumn;
    colnombre: TcxGridDBColumn;
    colcantidad: TcxGridDBColumn;
    procedure btnagregarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure vvolanteoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure dtfechaChange(Sender: TObject);
  private
    procedure actualizargrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvolantes: Tfrmvolantes;

implementation

uses Udm, Udmrep, Uprincipal, Urecursos, DateUtils;

{$R *.dfm}

procedure Tfrmvolantes.btnagregarClick(Sender: TObject);
var idvendedor : string;
begin
if ( cbvendedor.Text = '' ) or ( dtfecha.Text = '' ) or ( edcantidad.Text = '' ) then
  begin
  Application.MessageBox('Faltan Datos', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

querys('select idusuario from usuarios u where '+UsuarioNombre('u')+'="'+cbvendedor.text+'"', 0, sqlgeneral);
idvendedor := sqlgeneral.fieldbyname('idusuario').asstring;

if querys('select idvolanteo from volanteos where idvendedor = '+idvendedor+' and fechavolanteo="'+dtfecha.text+'"', 0, sqlgeneral) > 0 then
  begin
  Application.MessageBox('Ya se capturo esta informacion, borre el anterior para editar', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;


querys('insert into volanteos (idvendedor, fechavolanteo, cantidad, usuario, fecha, hora) values '+
       '('+idvendedor+', "'+dtfecha.Text+'", "'+edcantidad.Text+'", '+
       '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", curdate(), curtime())', 1, sqlgeneral);
actualizargrid;
cbvendedor.setfocus;
end;

procedure Tfrmvolantes.FormShow(Sender: TObject);
begin
CargaCombo2('SELECT u.idusuario, '+UsuarioNombre('u')+' AS nombre, idsector '+
            'FROM usuarios u LEFT JOIN puestos p ON u.idpuesto = p.idpuesto '+
            'WHERE p.nombre like "%VENDEDOR%" AND u.estatus = 1', 'nombre', 'idusuario', cbvendedor);
dtfecha.Date := Today;
actualizargrid;
end;

procedure Tfrmvolantes.actualizargrid;
begin
querys('SELECT v.idvolanteo, u.codigo, '+UsuarioNombre('u')+' AS nombre, v.cantidad from volanteos v '+
       'left join usuarios u on u.idusuario=v.idvendedor '+
       'where v.fechavolanteo = "'+dtfecha.Text+'"', 0, sqlvolantes);
end;

procedure Tfrmvolantes.vvolanteoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (sqlvolantes.RecordCount > 0) and ((key = 8) or (key = 46)) then
 begin
  //elimina de UsuarioSector el registro
  querys('delete from volanteos where idvolanteo = '+sqlvolantes.fieldbyname('idvolanteo').asstring,1,sqlgeneral);
  actualizargrid;
 end;
end;

procedure Tfrmvolantes.edcantidadKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  btnagregarClick(sender);
end;

procedure Tfrmvolantes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure Tfrmvolantes.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmvolantes.dtfechaChange(Sender: TObject);
begin
  actualizargrid;
end;

end.
