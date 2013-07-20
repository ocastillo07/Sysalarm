{///////////////////////////////////////////////////////////////////////////////
2009/04/01 dalyla modificar notas temporales creacion
}///////////////////////////////////////////////////////////////////////////////
unit uNotasTemp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, Mask, RzEdit, RzBtnEdt,
  MemDS, DBAccess, MyAccess, RzButton, RzPanel, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, RzDTP, RzLabel, ExtCtrls;

type
  TfrmNotasTemp = class(TForm)
    gbVigencia: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    dtpFDesde: TRzDateTimePicker;
    dtpFHasta: TRzDateTimePicker;
    dtphdesde: TDateTimePicker;
    dtphhasta: TDateTimePicker;
    vnotas: TcxGridDBTableView;
    lnotas: TcxGridLevel;
    gnotas: TcxGrid;
    RzPanel1: TRzPanel;
    btnguardar: TRzBitBtn;
    btnCerrar: TRzBitBtn;
    sqlnotas: TMyQuery;
    dsnotas: TDataSource;
    RzLabel7: TRzLabel;
    edcliente: TRzButtonEdit;
    clid: TcxGridDBColumn;
    colNota: TcxGridDBColumn;
    colfdesde: TcxGridDBColumn;
    colhdesde: TcxGridDBColumn;
    colfhasta: TcxGridDBColumn;
    colhhasta: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCerrarClick(Sender: TObject);
    procedure vnotasCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnguardarClick(Sender: TObject);
  private
    id:string;
    { Private declarations }
  public
    procedure inicializa(idcliente:string);
    { Public declarations }
  end;

var
  frmNotasTemp: TfrmNotasTemp;

implementation

uses Udm, Urecursos, Udmrep, Uprincipal;

{$R *.dfm}

procedure TfrmNotasTemp.inicializa(idcliente:string);
begin
edcliente.Enabled := false;
edcliente.text :=idcliente;
querys('Select n.* from notas n left join clientes c on c.idnota=n.idnota where idcliente = '+idcliente+' '+
       'and TipoNota like "%TEMPORAL%"', 0, sqlnotas);
end;

procedure TfrmNotasTemp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin       
action := cafree;
end;

procedure TfrmNotasTemp.btnCerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmNotasTemp.vnotasCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  id := sqlnotas.fieldbyname('id').AsString;
  dtpFDesde.Date := sqlnotas.fieldbyname('dfecha').AsDateTime;
  dtpFHasta.Date := sqlnotas.fieldbyname('hfecha').AsDateTime;
  dtphdesde.Time := sqlnotas.fieldbyname('dhora').AsDateTime;
  dtphhasta.Time := sqlnotas.fieldbyname('hhora').AsDateTime;
end;

procedure TfrmNotasTemp.btnguardarClick(Sender: TObject);
begin
querys('Update notas set dfecha="'+datetostr(dtpFDesde.date)+'", hfecha="'+datetostr(dtpFHasta.date)+'", '+
       'dhora="'+timetostr(dtphdesde.time)+'", hhora="'+timetostr(dtphhasta.time)+'", '+
       'idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+', fecha="'+datetostr(date)+'", '+
       'hora="'+FormatDateTime('HH:mm:ss', time)+'" where id = "'+id+'"', 1, dmreportes.sqlgeneral6);
close;
end;

End.
