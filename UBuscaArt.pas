{///////////////////////////////////////////////////////////////////////////////
2008/07/28 dalyla arreglar filtro
2008/05/27 dalyla articulos.status a integer
2008/02/28 dalyla zona horaria ok
2008/04/07 Dalila Robledo
}///////////////////////////////////////////////////////////////////////////////
unit UBuscaArt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, StdCtrls, RzCmboBx, RzDBCmbo,
  RzButton, Mask, RzEdit, RzLabel, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxCurrencyEdit, ExtCtrls, RzPanel;

type
  TfrmBuscaArt = class(TForm)
    SqlGeneral: TMyQuery;
    dsarticulos: TDataSource;
    tblarticulos: TMyTable;
    vista: TcxGridDBTableView;
    Nivel: TcxGridLevel;
    Rejilla: TcxGrid;
    codcve: TcxGridDBColumn;
    Nombre: TcxGridDBColumn;
    precioa: TcxGridDBColumn;
    iva: TcxGridDBColumn;
    costo: TcxGridDBColumn;
    tinstalacion: TcxGridDBColumn;
    PiezasXUnidad: TcxGridDBColumn;
    existencia: TcxGridDBColumn;
    ordenadas: TcxGridDBColumn;
    ApartExist: TcxGridDBColumn;
    ApartOrden: TcxGridDBColumn;
    minimo: TcxGridDBColumn;
    maximo: TcxGridDBColumn;
    RzPanel1: TRzPanel;
    btncerrar: TRzBitBtn;
    btnbuscar: TRzBitBtn;
    cbodepto: TRzComboBox;
    RzLabel1: TRzLabel;
    ednombre: TRzEdit;
    RzLabel13: TRzLabel;
    RzLabel2: TRzLabel;
    tblarticuloscod_cve: TStringField;
    tblarticuloscod_barras: TStringField;
    tblarticulosnombre: TStringField;
    tblarticulosexistencia: TIntegerField;
    tblarticulosordenados: TIntegerField;
    tblarticulosbackorder: TIntegerField;
    tblarticulosapartado: TIntegerField;
    tblarticulospiezasxunidad: TIntegerField;
    tblarticulosunidades_caja: TIntegerField;
    tblarticulosnacional: TStringField;
    tblarticulosidfamilia: TIntegerField;
    tblarticulosiddpto: TIntegerField;
    tblarticulosiva: TFloatField;
    tblarticuloscosto: TFloatField;
    tblarticulosutila: TFloatField;
    tblarticulosutilb: TFloatField;
    tblarticulosutilc: TFloatField;
    tblarticulosutild: TFloatField;
    tblarticulosprecioa: TFloatField;
    tblarticulospreciob: TFloatField;
    tblarticulosprecioc: TFloatField;
    tblarticulospreciod: TFloatField;
    tblarticulosdesc_esp: TFloatField;
    tblarticulosaplica_desc: TSmallintField;
    tblarticulosminimo: TIntegerField;
    tblarticulosmaximo: TIntegerField;
    tblarticuloslocalizacion: TStringField;
    tblarticulosidSectorArt: TIntegerField;
    tblarticulosidseccion: TIntegerField;
    tblarticulosnom_envase: TStringField;
    tblarticulosnom_piezas: TStringField;
    tblarticulosultima_compra: TDateField;
    tblarticulosultima_venta: TDateField;
    tblarticulosusuario: TStringField;
    tblarticulosfecha: TDateField;
    tblarticuloshora: TStringField;
    tblarticulosprecio_desc: TFloatField;
    tblarticulosmodelo: TStringField;
    tblarticulosgarantia_cliente: TStringField;
    tblarticulosgarantia_proveedor: TStringField;
    tblarticulosgarantia_fabricante: TStringField;
    tblarticulostinstalacion: TFloatField;
    tblarticulosservicio: TSmallintField;
    tblarticulospaquete: TSmallintField;
    tblarticulosdescripcion: TMemoField;
    tblarticulosidlinea: TIntegerField;
    tblarticulosinventariable: TSmallintField;
    tblarticulosmoneda: TStringField;
    tblarticulosPrecioCapturable: TSmallintField;
    CxEstatus: TcxGridDBColumn;
    lblarticulos: TRzLabel;
    RzLabel4: TRzLabel;
    tblarticulosstatus: TIntegerField;
    cbestatus: TRzComboBox;
    RzLabel3: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure cbodeptoClick(Sender: TObject);
    procedure ednombreChange(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreEnter(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure vistaDblClick(Sender: TObject);
    procedure vistaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblarticulosBeforeScroll(DataSet: TDataSet);
    procedure vistaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblarticulosAfterOpen(DataSet: TDataSet);
    procedure cbestatusChange(Sender: TObject);
  private
    { Private declarations }
      procedure CentraPantalla(var m: TWMWINDOWPOSCHANGED); message
   WM_WINDOWPOSCHANGING ;
  public
    { Public declarations }
    ban,depto:integer;
    cod_cve, dpto:string;
  end;

var
  frmBuscaArt: TfrmBuscaArt;

implementation

uses Udm, Urecursos, Ucontactos, Ureportes;

{$R *.dfm}

procedure TfrmBuscaArt.CentraPantalla(var m : TWMWINDOWPOSCHANGED);
  begin
  if frmcontacto.Showing then
     begin
        m.windowpos.x := round((screen.Width - frmBuscaArt.Width) div 2);  {Left/Posicion X}
        m.windowpos.y := round((screen.Height - frmBuscaArt.Height) div 2);  {Left/Posicion X}
      end;
end;

procedure TfrmBuscaArt.FormShow(Sender: TObject);
begin
  cbodepto.Items.Clear;
  cod_cve:='';
  querys('select nombre from dptos order by nivel',0,SqlGeneral);
  SqlGeneral.First;
  while not SqlGeneral.Eof do
     begin
     cbodepto.Items.Add(SqlGeneral.FieldByName('nombre').Asstring);
     SqlGeneral.Next;
     end;
  cbodepto.Items.Add('TODOS');
  tblarticulos.Active:=true;
  tblarticulos.Refresh;
  vista.Filtering.Visible := fvNonEmpty;
  ednombre.clear;
  btnbuscar.onclick(self);
  ednombre.SetFocus;
if ban = 1 then
  begin
  querys('Select nivel from dptos where nombre ="'+dpto+'"', 0, sqlgeneral);
  cbodepto.ItemIndex := sqlgeneral.fieldbyname('nivel').asinteger-1;
  end
else
  cbodepto.ItemIndex:=cbodepto.Items.Count-1;
btnbuscar.OnClick(Self);
end;

procedure TfrmBuscaArt.cbodeptoClick(Sender: TObject);
begin
btnbuscar.onclick(self);
{
if cbodepto.ItemIndex=cbodepto.Items.Count - 1 then
   tblarticulos.Filtered:=false
else
  begin
    querys('select iddpto from dptos where nombre='+quotedstr(cbodepto.Text),0,SqlGeneral);
    depto:=Sqlgeneral.Fields.Fields[0].AsInteger;
    tblarticulos.Filter:='iddpto='+inttostr(depto);
    tblarticulos.Filtered:=true;
  end;}
end;

procedure TfrmBuscaArt.ednombreChange(Sender: TObject);
begin
if ednombre.Text <> '' then
   begin
     btnbuscar.Enabled:=true;
   tblarticulos.Locate('nombre',ednombre.Text,[lopartialkey]);
  end
else
  btnbuscar.Enabled:=false;
end;

procedure TfrmBuscaArt.btnbuscarClick(Sender: TObject);
begin
querys('select iddpto from dptos where nombre = "'+cbodepto.Text+'"', 0, sqlgeneral);
depto := sqlgeneral.fieldbyname('iddpto').AsInteger;
tblarticulos.Filtered:=false;
if ednombre.Text = '' then
  begin
  if cbodepto.ItemIndex=cbodepto.Items.Count - 1 then
    tblarticulos.Filter:='status ='+cbestatus.Value
  else
    tblarticulos.Filter:='iddpto='+inttostr(depto)+' and status ='+cbestatus.Value;
  end
else
  begin
  if cbodepto.ItemIndex=cbodepto.Items.Count - 1 then
    tblarticulos.Filter:='nombre like "'+ednombre.Text+'" and status ='+cbestatus.Value
  else
    tblarticulos.Filter:='nombre like "'+ednombre.Text+'" and iddpto='+inttostr(depto)+' and status ='+cbestatus.Value;
  end;
tblarticulos.Filtered:=true;
end;

procedure TfrmBuscaArt.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if key = #27 then
   begin
     key:=#0;
     cbodepto.ItemIndex:=cbodepto.Items.Count - 1;
     cbodepto.OnClick(self);
     ednombre.Text:='';
     close;
   end;
if (key = #13) then //and (ednombre.Text = '')
    begin
      key:=#0;
      rejilla.SetFocus;
    end;
end;

procedure TfrmBuscaArt.ednombreEnter(Sender: TObject);
begin
ednombre.SelectAll;
end;

procedure TfrmBuscaArt.btncerrarClick(Sender: TObject);
begin
cod_cve:='';
close;
end;

procedure TfrmBuscaArt.vistaDblClick(Sender: TObject);
begin
cod_cve:=dsarticulos.DataSet.FieldValues['cod_cve'];
close;
end;

procedure TfrmBuscaArt.vistaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
   begin
     key:=#0;
     cod_cve:=dsarticulos.DataSet.FieldValues['cod_cve'];
     close;
   end;
end;

procedure TfrmBuscaArt.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 27 then
  close;
end;

procedure TfrmBuscaArt.tblarticulosBeforeScroll(DataSet: TDataSet);
begin
//edunidades.text:=inttostr(tblarticulos.FieldValues['existencia'] div tblarticulos.FieldValues['piezasxunidad']);
//edpiezas.Text:=inttostr(tblarticulos.FieldValues['existencia'] mod tblarticulos.FieldValues['piezasxunidad']);
end;

procedure TfrmBuscaArt.vistaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = 27 then
close;
Vista.BeginUpdate;
Vista.DataController.ClearSorting(true);
Vista.Columns[Vista.Controller.FocusedColumnIndex].SortOrder:= soAscending;
Vista.EndUpdate;
end;

procedure TfrmBuscaArt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ban := 0;
tblarticulos.Active:=false;
end;

procedure TfrmBuscaArt.tblarticulosAfterOpen(DataSet: TDataSet);
begin
 lblarticulos.Caption := 'Articulos encontrados '+inttostr(dataset.RecordCount)
end;

procedure TfrmBuscaArt.cbestatusChange(Sender: TObject);
begin
btnbuscar.onclick(self);
end;

End.
