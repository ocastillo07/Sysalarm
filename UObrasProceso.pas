{///////////////////////////////////////////////////////////////////////////////
2008/06/18 dalyla poder borrar
2008/06/10 dalyla creado
}///////////////////////////////////////////////////////////////////////////////
unit UObrasProceso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzBtnEdt, RzButton, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  MemDS, DBAccess, MyAccess, RzLabel, RzCmboBx, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TfrmObrasProceso = class(TForm)
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    edinstalacion: TRzButtonEdit;
    VObra: TcxGridDBTableView;
    LObra: TcxGridLevel;
    GObra: TcxGrid;
    cbavance: TRzComboBox;
    dtobra: TRzDateTimeEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    sqlobra: TMyQuery;
    dsobra: TDataSource;
    colfecha: TcxGridDBColumn;
    Estatus: TcxGridDBColumn;
    lbufh: TRzLabel;
    procedure edinstalacionKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure VObraCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edinstalacionChange(Sender: TObject);
    procedure edinstalacionButtonClick(Sender: TObject);
    procedure VObraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure buscarlocate;
    { Private declarations }
  public
    procedure inicializa(instalacion:string);
    { Public declarations }
  end;

var
  frmObrasProceso: TfrmObrasProceso;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmObrasProceso.inicializa(instalacion:string);
var k:char;
begin
k :=  #13;
edinstalacion.Text := instalacion;
edinstalacion.OnKeyPress(self, k);
end;

procedure TfrmObrasProceso.edinstalacionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (edinstalacion.Text <> '') and (key = #13) then
  begin
  buscarlocate;

  end;
end;

procedure TfrmObrasProceso.buscarlocate;
begin
sqlobra.Close;
sqlobra.ParamByName('idinstalacion').AsString := edinstalacion.Text;
sqlobra.Open;
lbufh.Caption := UFH(sqlobra);
end;

procedure TfrmObrasProceso.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cancelar' then
  begin
  btnmodificar.Caption := '&Editar';
  btncancelar.Caption := '&Cerrar';
  gobra.Enabled := false;
  dtobra.Enabled := false;
  cbavance.Enabled := false;
  lbufh.Caption := '';
  end
else
  close;
end;

procedure TfrmObrasProceso.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
  begin
  btnmodificar.Caption := '&Guardar';
  btncancelar.Caption := '&Cancelar';
  gobra.Enabled := true;
  dtobra.Enabled := true;
  cbavance.Enabled := true;
  end
else
  begin
  querys('Select idstatus from clasif_servicios where idserv = 10 and descripcion = "'+cbavance.text+'"', 0, frmprincipal.sqlgeneral);
  querys('Update ObrasProceso set FechaObra = "'+dtobra.Text+'", idstatus="'+frmprincipal.SqlGeneral.fieldbyname('idstatus').AsString+
         '", usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha ="'+datetostr(date)+'", hora = "'+timetostr(time)+
         '" where idobra = '+sqlobra.fieldbyname('idobra').AsString, 1, dmaccesos.sqlgeneral);
  sqlobra.Refresh;
  frmprincipal.ucprincipal.Log('Edito la obra en proceso '+sqlobra.fieldbyname('idobra').AsString, 2);
  btnmodificar.Caption := '&Editar';
  btncancelar.Caption := '&Cerrar';
  gobra.Enabled := false;
  dtobra.Enabled := false;
  cbavance.Enabled := false;
  end;
end;

procedure TfrmObrasProceso.VObraCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
dtobra.Date := sqlobra.fieldbyname('FechaObra').AsDateTime;
cbavance.Text := sqlobra.fieldbyname('avance').Asstring;
end;

procedure TfrmObrasProceso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmObrasProceso.FormShow(Sender: TObject);
begin
CargaCombo2('Select idstatus, nombre, descripcion from clasif_servicios where idserv = 10', 'descripcion', 'nombre', cbavance);
end;

procedure TfrmObrasProceso.edinstalacionChange(Sender: TObject);
begin
if edinstalacion.Text = '' then
  begin
  sqlobra.Close;
  dtobra.text := '';
  cbavance.text := '';
  end;
end;

procedure TfrmObrasProceso.edinstalacionButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='Select i.idinstalacion, idpedido, FechaInicio,  c.idcliente, '+ClienteNombre('c')+' as nombre, cs.descripcion from instalaciones i '+
         'inner join (Select i.idinstalacion, min(o.idstatus) as idstatus from instalaciones i left join ObrasProceso '+
         'o on i.idinstalacion=o.idinstalacion where ObraEnProceso = 1 group by i.idinstalacion) as o on o.idinstalacion '+
         '=i.idinstalacion left join clientes c on c.idcliente=i.idcliente left join clasif_servicios cs on cs.idstatus '+
         '= o.idstatus and cs.idserv = 10 where ObraEnProceso = 1 order by FechaInicio desc ';
  campo_retorno:='idinstalacion';
  campo_busqueda:='idinstalacion';
  tblorigen := 'instalaciones';
  lbldesc.Caption:='Busqueda por Instalacion:';
  ShowModal;
  if resultado <> '' then
    begin
     edinstalacion.Text:= resultado;
     buscarlocate;
    end;
  end;
end;

procedure TfrmObrasProceso.VObraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (sqlobra.RecordCount > 0) and ((key = 8) or (key = 46)) then
 begin
  //elimina de UsuarioSector el registro
 if (application.MessageBox(pchar('El registro se eliminara inmediatamente, '+#13+'Esta seguro de eliminar el registro?'), 'Atencion', MB_ICONQUESTION+MB_YESNO)) = idyes then
    begin
    querys('delete from ObrasProceso where idinstalacion = '+edinstalacion.Text + ' and idobra = ' +
           Sqlobra.fieldbyname('idobra').AsString,1,dmaccesos.sqlgeneral);
    Sqlobra.Refresh;
    end;
 end;
end;

End.
