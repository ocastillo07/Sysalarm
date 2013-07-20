unit USenalesOpenClose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, RzButton, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, MemDS, DBAccess, MyAccess;

type
  TfrmSenalesOpenClose = class(TForm)
    GridTrafico: TcxGrid;
    GridTraficoDBTableView1: TcxGridDBTableView;
    colfecha: TcxGridDBColumn;
    colhora: TcxGridDBColumn;
    coldescripcion: TcxGridDBColumn;
    coltipo: TcxGridDBColumn;
    colzona: TcxGridDBColumn;
    GridTraficoLevel1: TcxGridLevel;
    btncerrar: TRzBitBtn;
    colCuenta: TcxGridDBColumn;
    sqlgeneral: TMyQuery;
    dsclientes: TDataSource;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodUser:string;

  end;

var
  frmSenalesOpenClose: TfrmSenalesOpenClose;

implementation

uses Urecursos, Udmrep, Udm;

{$R *.dfm}

procedure TfrmSenalesOpenClose.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmSenalesOpenClose.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    action:=cafree;
end;

procedure TfrmSenalesOpenClose.FormShow(Sender: TObject);
var fecha:string;
begin
fecha:=formatdatetime('yyyy"/"mm"/"dd',now-1);

//querys('Select oc.id as aid, oc.idcliente as Cuenta, oc.fecha_pc,oc.hora_pc, oc.descripcion,oc.tipo,oc.zona From open_close as oc inner join sk_alarmas as sk on(sk.idcliente = oc.idcliente) inner join alarmas_tipos as at on(at.clave=oc.tipo) '+
//        ' where  sk.status in(0,1,2) and sk.user = '+''''+CodUser+''' and oc.fecha_pc >= '+''''+fecha+''' and at.monitoreo = 1 and sk.tipo <> oc.tipo order by oc.aid asc',0,sqlgeneral);

  querys('Select oc.id as aid, oc.idcliente, oc.fecha_pc,oc.hora_pc, oc.descripcion,oc.tipo,oc.zona From open_close as oc inner join sk_alarmas as sk3 on(sk3.idcliente = oc.idcliente) inner join alarmas_tipos as at on(at.clave=oc.tipo) where  sk3.status in(0,1,2) '+
         'and sk3.user = '+''''+CodUser+''' and oc.fecha_pc >= '+''''+fecha+''' and at.monitoreo = 1 and sk3.tipo <> oc.tipo '+
         'UNION '+
         ' Select sk2.id as aid, sk2.idcliente, sk2.fecha_pc,sk2.hora_pc, sk2.descripcion,sk2.tipo,sk2.zona From sk_alarmas as sk inner join sk_alarmas as sk2 on(sk2.idcliente=sk.idcliente) where  '+
         ' sk.user = '+''''+CodUser+''' and sk.status  <  3 and sk2.status > 3 and sk.tipo <> sk2.tipo and sk2.fecha_pc >= '+''''+fecha+''' order by  aid asc',0,sqlgeneral);

end;

end.
