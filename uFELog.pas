{///////////////////////////////////////////////////////////////////////////////
2009/06/08 dalyla codigo de facturacion en  sys listo

Pantallas del FE
Asignacion Factura Pedido
Cancelaciones
Cobros FE
Facturacion el Lotes
Regresar a Remision
Notas de Credito
pedidos
RemiFact
Configuraciones
}///////////////////////////////////////////////////////////////////////////////
unit uFELog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, StdCtrls, RzCmboBx, RzButton, RzLabel,
  DateUtils, RzRadGrp, Mask, RzEdit, ExtCtrls, RzPanel, RzRadChk, RzBtnEdt,
  RzShellDialogs, StrUtils;

type
  TfrmFELog = class(TForm)
    rgperiodo: TRzGroupBox;
    tpdesde: TRzDateTimeEdit;
    tphasta: TRzDateTimeEdit;
    rgusuario: TRzRadioGroup;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btnImprimir: TRzBitBtn;
    btnCerrar: TRzBitBtn;
    cbtipoimpresion: TRzComboBox;
    rgErrores: TRzGroupBox;
    ckError: TRzCheckBox;
    cberror: TRzComboBox;
    odbuscar: TRzOpenDialog;
    rgbuscar: TRzGroupBox;
    edbuscar: TRzButtonEdit;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCerrarClick(Sender: TObject);
    procedure cbtipoimpresionSelect(Sender: TObject);
    procedure edbuscarButtonClick(Sender: TObject);
  private
    procedure FELog;
    procedure Conteo;
    { Private declarations }
  public
    Rep:integer;
    TipoImpresion:string;
    procedure inicializa;
    { Public declarations }
  end;

var
  frmFELog: TfrmFELog;

implementation

uses udmFE, Udmrep, Urecursos;

{$R *.dfm}

procedure TfrmFELog.btnImprimirClick(Sender: TObject);
begin
   case Rep of
      1: FeLog;
      2: Conteo;
   end;

end;

procedure TfrmFELog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmFELog.btnCerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmFELog.cbtipoimpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
      0: TipoImpresion :='IMP';
      1: TipoImpresion :='PDF';
      2: TipoImpresion :='PDFC';
   end;
end;


procedure TfrmFELog.inicializa;
begin
TipoImpresion:= 'IMP';
tpdesde.Date := EncodeDate(yearof(today), monthof(today), 1);
tphasta.Date := today;

case Rep of
  1: begin
     CargaCombo2('select orden, ce.nombre from clasif_servicios ce left join TipoServicios ts on ts.idserv=ce.idserv '+
                 'where ts.nombre = "ERRORES FE"', 'nombre', 'orden', cberror);
     end;

  2: begin
     rgperiodo.Visible := false;
     rgusuario.Visible := false;
     rgErrores.Visible := false;
     rgbuscar.Visible := true;
     end;

  end;
end;

procedure TfrmFELog.edbuscarButtonClick(Sender: TObject);
begin
if odbuscar.Execute then
  begin
  edbuscar.Text := odbuscar.FileName;
  end;
end;


procedure TfrmFELog.FELog;
var error:string;
begin
if cberror.Text <> '' then
  error := ' and descripcion like ''%'+cberror.text+'%'' ';

DMREPORTES.conexionFE.Connected := true;
querys('Select convert(char(11), Fecha_Evento, 111) as Fecha, convert(char(11), Fecha_Evento, 108) as Hora, '+
       'UsuarioId_conectado, descripcion '+
       'from Tbl_Bitacora where UsuarioId_conectado = '''+rgusuario.Items.Strings[rgusuario.ItemIndex]+''''+
       'and convert(char(11), Fecha_Evento, 111) between '''+tpdesde.Text+''' and '''+tphasta.Text+''' '+error, 0, DMREPORTES.sqlFE);
OperacionReporte('FELog', 'Log de Factura Electronica', TipoImpresion, 1);
end;

procedure TfrmFELog.Conteo;
var memo:Tmemo; i,a : integer; cadena:string;
//e := 192
//d := 98
//i :=  3
begin
a:= 0;
memo:= Tmemo.Create(self);
memo.Parent := self;
memo.Top := 240;
memo.Left := 8;
memo.Height := 400;
memo.Width := 800;
memo.Lines.LoadFromFile(edbuscar.text);

/////////////////////////////////////
cadena := memo.Lines.Text;
for i := 1 to AnsiPos('¬', cadena) do
  begin
  if cadena[i] = '|' then
    inc(a);
  end;

if a = 192 then
  showmessage('El encabezado esta correcto')
else
  showmessage('El encabezado debe contener 192 y contiene: '+inttostr(a));

///////////////////////////////////

//Detalle

cadena := AnsiMidStr(cadena, AnsiPos('¬', cadena), length(cadena)-AnsiPos('¬', cadena)+1 );

repeat


a:= 0;
for i := 1 to AnsiPos(char(#10), cadena) do
  begin
  if cadena[i] = '|' then
    inc(a);
  end;
if a <> 98 then
  showmessage('El detalle debe contener 98 y contiene '+inttostr(a)+'  En :'+AnsiLeftStr(cadena, 20));

cadena := AnsiMidStr(cadena, AnsiPos(char(#10), cadena)+1, length(cadena)+1 );
until AnsiPos('¬', cadena) = 1;

//Impuestos
a:= 0;
for i := 1 to AnsiPos(char(#10), cadena) do
  begin
  if cadena[i] = '|' then
    inc(a);
  end;

if a = 3 then
  showmessage('Los impuestos son correctos')
else
  showmessage('el impuesto debe contener 3 y contiene : '+inttostr(a));


end;

End.
