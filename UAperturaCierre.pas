unit UAperturaCierre;

interface

uses
  Windows,QDialogs, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, DB, MemDS, DBAccess,
  MyAccess, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxDropDownEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzCmboBx, ComCtrls, RzDTP, cxTimeEdit, Menus,
  RzButton, RzBckgnd;

type
  TfrmAperturaCierre = class(TForm)
    sqlgeneral: TMyQuery;
    sqlaperturas1: TMyQuery;
    dsaperturas: TDataSource;
    tvapertura: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxdia: TcxGridDBColumn;
    cxope: TcxGridDBColumn;
    cxOPNormal: TcxGridDBColumn;
    cxoplate: TcxGridDBColumn;
    cxclearly: TcxGridDBColumn;
    cxclnormal: TcxGridDBColumn;
    cxcllate: TcxGridDBColumn;
    cxcliente: TcxGridDBColumn;
    tblaperturas: TMyTable;
    Submenu: TPopupMenu;
    InsertarRenglonIgualalSeleccionado1: TMenuItem;
    RzLabel1: TRzLabel;
    EliminarRenglon1: TMenuItem;
    btncerrar: TRzBitBtn;
    tblaperturasidcliente: TIntegerField;
    tblaperturasdia: TStringField;
    tblaperturasok: TTimeField;
    tblaperturasop: TTimeField;
    tblaperturasoj: TTimeField;
    tblaperturasck: TTimeField;
    tblaperturascl: TTimeField;
    tblaperturascj: TTimeField;
    tblaperturasid: TIntegerField;
    tblaperturasNumDia: TSmallintField;
    cxNumDia: TcxGridDBColumn;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzSeparator1: TRzSeparator;
    RzLabel6: TRzLabel;
    RzSeparator2: TRzSeparator;
    tblaperturasDiaSig: TSmallintField;
    InsertarNrenglonesigualesalSeleccionado1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblaperturasBeforePost(DataSet: TDataSet);
    procedure InsertarRenglonIgualalSeleccionado1Click(Sender: TObject);
    procedure EliminarRenglon1Click(Sender: TObject);
    procedure SubmenuPopup(Sender: TObject);
    procedure tblaperturasBeforeScroll(DataSet: TDataSet);
    procedure tvaperturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncerrarClick(Sender: TObject);
    procedure InsertarNrenglonesigualesalSeleccionado1Click(
      Sender: TObject);
    procedure tblaperturasAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    idcta : string;
    constructor inicializa(idc:string);
  end;

var
  frmAperturaCierre: TfrmAperturaCierre;

implementation

uses Urecursos, Ubusquedas, Udm, Uprincipal;

{$R *.dfm}

constructor tfrmAperturaCierre.inicializa(idc:string);
begin
idcta := idc;
tblaperturas.Active := false;
tblaperturas.Active := true;
tblaperturas.Filter := 'idcliente = '+idc;
tblaperturas.Filtered := true;
end;


procedure TfrmAperturaCierre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmAperturaCierre.tblaperturasBeforePost(DataSet: TDataSet);
var i:integer;
begin
 tblaperturasidcliente.AsInteger := strtoint(idcta);
 for i:=1 to 7 do
  if dias[i]=trim(cxdia.DataBinding.Field.AsString) then
   begin
    tblaperturasNumDia.AsInteger := i;
    break;
    exit;
   end;
  if tblaperturascl.AsDateTime < tblaperturasop.AsDateTime then
   tblaperturasDiaSig.AsInteger := 1
  else
   tblaperturasDiaSig.AsInteger := 0; 
end;

procedure TfrmAperturaCierre.InsertarRenglonIgualalSeleccionado1Click(
  Sender: TObject);
begin
querys('insert into AperturaCierre (idcliente,dia,ok,op,oj,ck,cl,cj) select idcliente,dia,ok,op,oj,ck,cl,cj from AperturaCierre where id='+tblaperturasid.AsString,1,sqlgeneral);
self.inicializa(idcta);
end;

procedure TfrmAperturaCierre.EliminarRenglon1Click(Sender: TObject);
begin
if application.MessageBox('Esta seguro que desea eliminar el renglon actual','Aviso',mb_iconquestion+mb_yesno)=idyes then
 begin
  querys('delete from AperturaCierre where id='+tblaperturasid.AsString,1,sqlgeneral);
  self.inicializa(idcta);
 end;
end;

procedure TfrmAperturaCierre.SubmenuPopup(Sender: TObject);
begin
if tblaperturas.RecordCount = 0 then
 begin
  submenu.Items.Items[0].Enabled := false;
  submenu.Items.Items[1].Enabled := false;
  submenu.Items.Items[2].Enabled := false;
 end
else
 begin
  if tblaperturas.RecordCount >= 7 then
   begin
    submenu.Items.Items[0].Enabled := false;
    submenu.Items.Items[1].Enabled := false;
   end
  else
   begin
    submenu.Items.Items[0].Enabled := true;
    submenu.Items.Items[1].Enabled := true;
   end;
  submenu.Items.Items[2].Enabled := true;
 end;
end;

procedure TfrmAperturaCierre.tblaperturasBeforeScroll(DataSet: TDataSet);
begin
try
 if tblaperturas.RecordCount >=6 then
  tvapertura.NavigatorButtons.Insert.Visible := false
 else
  tvapertura.NavigatorButtons.Insert.Visible := true;
except
 tvapertura.NavigatorButtons.Insert.Visible := false;
end;
end;

procedure TfrmAperturaCierre.tvaperturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key = 46)and(tblaperturas.RecordCount > 0) then
 eliminarrenglon1.Click;
end;

procedure TfrmAperturaCierre.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmAperturaCierre.InsertarNrenglonesigualesalSeleccionado1Click(
  Sender: TObject);
var i,cant : integer;
begin
cant:=InputBox('Insertar Renglones','Cantidad de Renglones?',7-tblaperturas.RecordCount,1,7-tblaperturas.RecordCount,1);
if cant <> 0 then
 for i := 1 to cant do
  querys('insert into AperturaCierre (idcliente,dia,ok,op,oj,ck,cl,cj) select idcliente,dia,ok,op,oj,ck,cl,cj from AperturaCierre where id='+tblaperturasid.AsString,1,sqlgeneral);
  self.inicializa(idcta);
end;

procedure TfrmAperturaCierre.tblaperturasAfterPost(DataSet: TDataSet);
begin
frmprincipal.ucprincipal.Log('Modifico el horario de apertura y cierre', 2);
end;

end.

