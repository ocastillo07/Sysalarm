{//////////////////////////// MODIFICACIONES ///////////////////////////////////
2008/08/12 dalyla derechos sys modificar fecha vencimiento
//2008/02/28 dalyla zona horaria ok
2007/12/11 Edwin Guardar Valores en historico cd CambiosVencimiento.
}///////////////////////////////////////////////////////////////////////////////

unit UfrmPagosDebe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzButton, StdCtrls, ComCtrls, RzDTP, Mask,DateUtils,
  RzEdit;

type
  TfrmPagosDebe = class(TForm)
    cxGrid2: TcxGrid;
    DBGVista3: TcxGridDBTableView;
    DBGVista3DBColumn1: TcxGridDBColumn;
    DBGVista3DBColumn2: TcxGridDBColumn;
    DBGVista3DBColumn4: TcxGridDBColumn;
    DBGVista3DBColumn7: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    DBGVista3DBColumn5: TcxGridDBColumn;
    btncerrar: TRzBitBtn;
    lb: TLabel;
    DBGVista3DBColumn3: TcxGridDBColumn;
    btnmodificar: TRzBitBtn;
    lb1: TLabel;
    dfecha: TRzDateTimeEdit;
    DBGVista3DBColumn6: TcxGridDBColumn;
    lblDebe: TLabel;
    lbxvencer: TLabel;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnmodificarClick(Sender: TObject);
    procedure DBGVista3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure DBGVista3CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DBGVista3CustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    idpago,cliente:string;
    c:integer;
    debe, xvencer : Currency;

    constructor inicializa(const idcliente:string);

  end;

var
  frmPagosDebe: TfrmPagosDebe;

implementation

uses Urecursos, Udmrep, Uprincipal;

{$R *.dfm}
constructor TfrmPagosDebe.inicializa(const idcliente:string);
begin
c:=0;
debe:=0;
xvencer := 0;
cliente:=idcliente;
with dmreportes do
  begin


 querys('SELECT distinct if(pc.movimiento= 0,if(pc2.movimiento = 1, -1,0),1) as condicion, '+
        'if(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence) > 0,to_days("'+datetostr(date)+'") -to_days(pc.FechaVence),0) as dias,'+
        'pc.idpago as idpago,pc.movimiento,p.concepto,pc.cargo,pc.restante,pc.idpedido,pc.idfactura,pc.FechaVence,'+
        'pc.idcliente,'+
        'if(pc.FechaVence <= "'+datetostr(date)+'",pc.restante,0) as debe, '+
        'if(pc.FechaVence > "'+datetostr(date)+'",pc.restante,0) as xvencer '+
        'from PagosClientes as pc left join  pedidos as p on '+
        '(p.idpedido=pc.idpedido) left join PagosClientes as pc2 on (pc2.idpedido = pc.idpedido and pc2.movimiento = 1) where pc.idcliente ='+idcliente+' and p.estatus in(3,4,6) and p.saldado=0  and pc.movimiento in(0,1) and pc.restante > 0 having condicion >= 0 order by dias desc ',0,sqlgeneral8);

while not sqlgeneral8.eof do
   begin

      debe := debe + sqlgeneral8.fieldbyname('debe').AsFloat;
      xvencer := xvencer + sqlgeneral8.fieldbyname('xvencer').AsFloat;
      sqlgeneral8.Next;
   end;
      sqlgeneral8.First;


lblDebe.Caption := 'TOTAL VENCIDO :   '+ CurrToStrF(debe,ffCurrency, 2);
lbxvencer.Caption := 'TOTAL X VENCER :   '+ CurrToStrF(xvencer,ffCurrency, 2);
lb.caption:='CUENTA : '+idcliente;

if DerechosSys('Modificar Fecha de Vencimiento Pedidos') then
 btnmodificar.Visible := true
else
 btnmodificar.Visible := false;

 end;
end;


procedure TfrmPagosDebe.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmPagosDebe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmPagosDebe.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
querys('DROP TABLE IF EXISTS TempPago'+frmprincipal.idmaq,1,dmreportes.sqlgeneral);
end;

procedure TfrmPagosDebe.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then begin

        if DMREPORTES.sqlgeneral8.RecordCount > 0 then begin
            try
               dfecha.Date:=strtodate(DMREPORTES.DS5.DataSet.FieldValues['FechaVence']);
            except
               dfecha.Date:=FechaServidor;
            end;
           idpago:=DMREPORTES.DS5.DataSet.FieldValues['idpago'];
           btnmodificar.Caption:='&Guardar';
           lb1.Visible:=true;
           dfecha.Visible:=true;
           dfecha.setfocus;
        end
           else begin
            application.MessageBox('No hay cobro que modificar','Atención',mb_IconInformation); 
       end;
end
   else
begin
  //grabar;
    btnmodificar.Caption:='&Editar';
    lb1.Visible:=false;
    dfecha.Visible:=false;
    querys('Update boletas set FechaVence = '+quotedstr(dfecha.text)+',FechaLarga = '+quotedstr(meses[monthof(strtodate(dfecha.text))]+' '+inttostr(dayof(strtodate(dfecha.text)))+' de '+inttostr(yearof(strtodate(dfecha.text))))+' where idpedido = '+quotedstr(DMREPORTES.DS5.DataSet['idpedido'])+' and FechaVence ='+quotedstr(DMREPORTES.DS5.DataSet['FechaVence']),1,dmreportes.sqlgeneral);
    querys('Update PagosClientes set FechaVence='+quotedstr(dfecha.text)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" where idpago='+quotedstr(idpago),1,dmreportes.sqlgeneral);
    querys('Insert into CambiosVencimiento (idpedido,idpago,FechaAnterior,idusuario,fecha,hora) values('+quotedstr(DMREPORTES.DS5.DataSet['idpedido'])+','+idpago+','+quotedstr(DMREPORTES.sqlgeneral8.fieldbyname('FechaVence').AsString)+','+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',"'+datetostr(date)+'","'+timetostr(time)+'") ',1,dmreportes.sqlgeneral);

    idpago:='';
    application.MessageBox('Fecha actualizada','Información',mb_IconInformation);
    self.inicializa(cliente);
    btnmodificar.Enabled:=false;
end;
end;

procedure TfrmPagosDebe.DBGVista3CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
btnmodificar.Enabled:=true;
btnmodificar.Caption:='&Editar';
lb1.Visible:=false;
dfecha.Visible:=false;
end;

procedure TfrmPagosDebe.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #27 then
close;
end;

procedure TfrmPagosDebe.DBGVista3CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Column: tcxGridDBColumn;
  srt:string;
begin
     Column := tcxGridDBColumn(AViewInfo.Item);
      try
         if strtodate(AViewInfo.Text) <  now then
           begin
                ACanvas.Font.Style:=[fsBold];
                ACanvas.Font.Color := clRed;
           end;
       except
         srt := '';
       end;
// ADone:= true;
end;

procedure TfrmPagosDebe.DBGVista3CustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
//var Column: tcxGridDBColumn;  srt:string;
begin
                ACanvas.Font.Style:=[fsBold];
                //ACanvas.Font.Style:=[fsUnderline];
                ACanvas.Font.Color := clRed;
end;

end.
