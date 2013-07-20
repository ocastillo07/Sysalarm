unit uSolicitudesWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, MemDS, DBAccess, MyAccess, RzPanel,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls,
  RzSplit, RzDBEdit, StdCtrls, DBCtrls, Mask, RzEdit, RzLabel, RzButton,
  RzDBNav;

type
  TfrmSolicitudesWeb = class(TForm)
    Splitter: TRzSplitter;
    VWeb: TcxGridDBTableView;
    LWeb: TcxGridLevel;
    GWeb: TcxGrid;
    RzPanel1: TRzPanel;
    sqlweb: TMyQuery;
    dsweb: TDataSource;
    colid: TcxGridDBColumn;
    colidcliente: TcxGridDBColumn;
    colCliente: TcxGridDBColumn;
    colAsunto: TcxGridDBColumn;
    colDescripcion: TcxGridDBColumn;
    colarea: TcxGridDBColumn;
    colfecha: TcxGridDBColumn;
    RzPanel2: TRzPanel;
    btncerrar: TRzBitBtn;
    btnregresar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzPanel3: TRzPanel;
    navegador: TRzDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure VWebDblClick(Sender: TObject);
    procedure btnregresarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSolicitudesWeb: TfrmSolicitudesWeb;

implementation

uses Urecursos, Udm, Udmrep;

{$R *.dfm}

procedure TfrmSolicitudesWeb.FormShow(Sender: TObject);
begin
querys('SELECT s.idsolicitudweb, s.idcliente, '+ClienteNombre('c')+' as cliente, s.asunto, s.descripcion, '+
       'a.nombre as area, t.nombre, s.fechacreacion FROM SolicitudesWeb AS s Left join clientes c on '+
       'c.idcliente=s.idcliente LEFT JOIN areas a on a.idarea=s.idarea Left join (Select '+UsuarioNombre('u')+
       ' as nombre, u.idarea from usuarios u left join puestos p on p.idpuesto =u.idpuesto where p.nombre = '+
       '"Gerente") as t on t.idarea=s.idarea ', 0, sqlweb);
end;

procedure TfrmSolicitudesWeb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmSolicitudesWeb.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmSolicitudesWeb.VWebDblClick(Sender: TObject);
begin
splitter.percent := 0;
splitter.RestoreHotSpot;
end;

procedure TfrmSolicitudesWeb.btnregresarClick(Sender: TObject);
begin
splitter.percent := 100;
splitter.ResetHotSpot;
end;

end.
