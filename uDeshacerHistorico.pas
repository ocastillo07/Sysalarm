{///////////////////////////////////////////////////////////////////////////////
2011//12/01 dalyla correcion a reporte de cancelados y morosos no tenia auditoria
2011/11/05 dalyla agregar reporte de cancelado y morosos en auditoria
                  y el de pagos x linea anualidad
2010/12/09 dalyla Poder deshacer el historico de cualquier mes (otra vez)
}///////////////////////////////////////////////////////////////////////////////
unit uDeshacerHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, RzLabel, ExtCtrls, RzPanel, DB,
  MemDS, DBAccess, MyAccess, DateUtils;

type
  TfrmDeshacerHistorico = class(TForm)
    gbPeriodoMesA: TRzGroupBox;
    RzLabel6: TRzLabel;
    RzLabel11: TRzLabel;
    cbomeses: TRzComboBox;
    cboano: TRzComboBox;
    btnregresar: TRzBitBtn;
    chbTipoReporte: TRzComboBox;
    btncerrar: TRzBitBtn;
    sqlgen: TMyQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure cbomesesNotInList(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnregresarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeshacerHistorico: TfrmDeshacerHistorico;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmDeshacerHistorico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmDeshacerHistorico.btncerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmDeshacerHistorico.cbomesesNotInList(Sender: TObject);
begin
cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
end;

procedure TfrmDeshacerHistorico.FormCreate(Sender: TObject);
var ma : tdate;
begin
ma := IncMonth( today, -1 );

cboano.Text := inttostr(YearOf(ma));
cbomeses.ItemIndex := MonthOf(ma)-1;
end;

procedure TfrmDeshacerHistorico.btnregresarClick(Sender: TObject);
var msg : string;
{m1, m2, a1, a2 : integer;
ma : tdate;   }
begin
{
m1 := monthof(today);
a1 := yearof(today);

ma := IncMonth( today, -1 );

m2 := MonthOf(ma);
a2 := YearOf(ma);
 
if not (cbomeses.ItemIndex = m1) and (cboano.Text = inttostr(a1)) then
   if not (cbomeses.ItemIndex = m2) and (cboano.Text = inttostr(a2)) then
   begin  
      if(Application.MessageBox('No puedes exceder del mes anterior y el actual', 'Atencion', MB_ICONINFORMATION)<>idyes)then
      exit;
  // end;  }

      case chbTipoReporte.ItemIndex of

      0: begin
         querys('Delete from RepVentasMensuales where year = "'+cboano.Text+'" and Titulo = "'+cbomeses.text+'"', 1, sqlgen);
         querys('Delete from RepVentasMensuales2 where year = "'+cboano.Text+'" and mes = "'+cbomeses.text+'"', 1, sqlgen);
         querys('Delete from RepVentasMensuales3 where year = "'+cboano.Text+'" and mes = "'+cbomeses.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Ventas Mensuales del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      1: begin
         querys('Delete from RepDiarioVentas where titulo1 = "'+cboano.Text+'" and titulo2 = "'+cbomeses.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Diario de Ventas del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      2: begin
         querys('Delete from RepAnaliticoVentas where PERIODO = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Analitico de Ventas del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      3: begin
         querys('Delete from RepFactCanceladas where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Facturas Canceladas del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      4: begin
         querys('Delete from RepNotasCredito where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Notas de Credito Resumen del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      5: begin
         querys('Delete from RepNotasCreditoDetallado where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Notas de Credito Detallado del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      6: begin
         querys('Delete from RepPagosXLinea where PeriodoReporte = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         querys('Delete from RepPagosXLinea2 where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         querys('Delete from RepPagosXLineaAnualidades where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Pagos por Linea del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      7: begin
         querys('Delete from RepAntiguedadSaldos where mes = "'+cbomeses.Text+'" and ano = "'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Antiguedad de Saldos Total del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      8: begin
         querys('Delete from RepAntiguedadSaldosFacturas where mes = "'+cbomeses.Text+'" and ano = "'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Antiguedad de Saldos Facturas del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

      9: begin
         querys('Delete from RepRemisionesMensuales where Periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Remisiones Mensuales del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;

     10: begin
         querys('Delete from RepCanceladosMorosos where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         querys('Delete from RepCanceladosMorosos2 where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         querys('Delete from RepCanceladosMorosos3 where periodo = "'+cbomeses.Text+'-'+cboano.text+'"', 1, sqlgen);
         msg := 'Regreso el Reporte de Cancelados y Morosos del periodo: '+cboano.Text+' - '+cbomeses.text;
         end;


   end;

frmprincipal.ucprincipal.Log(msg, 3);
application.MessageBox(pchar(msg), 'Aviso', MB_ICONINFORMATION);

Screen.Cursor := crDefault;
end;

End.
