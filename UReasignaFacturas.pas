unit UReasignaFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt, DB, MemDS, DBAccess,
  MyAccess, RzButton;

type
  TfrmReasignaFact = class(TForm)
    edNumPedido: TRzButtonEdit;
    RzLabel1: TRzLabel;
    edfactura: TRzEdit;
    RzLabel4: TRzLabel;
    SqlGeneral: TMyQuery;
    RzLabel2: TRzLabel;
    edNewFactura: TRzEdit;
    btnsalir: TRzBitBtn;
    btncambiar: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNumPedidoButtonClick(Sender: TObject);
    procedure edNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edNewFacturaKeyPress(Sender: TObject; var Key: Char);
    procedure btnsalirClick(Sender: TObject);
    procedure btncambiarClick(Sender: TObject);
    procedure edNewFacturaExit(Sender: TObject);
    procedure edNumPedidoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReasignaFact: TfrmReasignaFact;

implementation

uses Ubusquedas, Urecursos, Udm, Uprincipal;

{$R *.dfm}

procedure TfrmReasignaFact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmReasignaFact.edNumPedidoButtonClick(Sender: TObject);
begin
frmbusquedas.query:='SELECT RemiFact.idfactura,pedidos.idpedido,if(clientes.rsocial is null or clientes.rsocial ='''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) as cliente,'+
                     'ClientesFact.rsocial,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'',''Facturado'')))) as Estatus,pedidos.FechaRemision,pedidos.usuario, '+
                     'pedidos.fecha, pedidos.hora FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact =  ClientesFact.idfact left join RemiFact on RemiFact.idpedido=pedidos.idpedido '+
                     ' where pedidos.estatus=4 and RemiFact.idfactura <> ''0'' order by RemiFact.idfactura';
frmbusquedas.campo_busqueda := 'idpedido';
frmbusquedas.campo_retorno:='idpedido';
frmbusquedas.tabla:='';
frmbusquedas.tblorigen := 'pedidos';
querys('SELECT count(pedidos.idpedido) as cant FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact =  ClientesFact.idfact left join RemiFact on RemiFact.idpedido=pedidos.idpedido where '+
       ' pedidos.estatus in(4,6) and RemiFact.idfactura <> ''0''',0,sqlgeneral);
frmbusquedas.maxrow := sqlgeneral.fieldbyname('cant').AsInteger;
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  chtecla:=#13;
  edNumPedido.Text:=frmbusquedas.resultado;
  edNumPedido.OnKeyPress(self,chtecla);
 end;
end;

procedure TfrmReasignaFact.edNumPedidoKeyPress(Sender: TObject;
  var Key: Char);
//Var  NParcialidades : integer;  Mensaje : string;
begin
key:=validanumeros(key,false);
key:=validapunto(ednumpedido.Text+'.',key);
if (key = #13) and (edNumPedido.Text <> '') then
   begin
    key:= #0;
    //verifica si no se ha cancelado esta venta
    querys('select movimiento from PagosClientes where movimiento = 5 and idpedido = '+edNumPedido.Text,0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      application.MessageBox('Esta Venta ya ha sido cancelada','Aviso',mb_iconinformation)
    else
     begin
      //verifica que existe ese numero de pedido
      querys('select * from pedidos where idpedido = '+edNumPedido.text,0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
       application.MessageBox(pchar('El pedido #'+edNumPedido.Text+' No Existe'),'Aviso',mb_iconinformation);
      //verifica que ya se halla remicionado o facturado
      querys('select * from RemiFact where idpedido = '+EdNumPedido.Text,0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
       application.MessageBox('Este Pedido no se ha Remicionado o Facturado','Aviso',mb_iconinformation);
       //trae el idfactura
       querys('select idfactura from RemiFact where idfactura<>''0'' and idpedido='+edNumPedido.Text,0,sqlgeneral);
       edFactura.Text := sqlgeneral.fieldbyname('idfactura').AsString;
     end;
   end;
if (key=#13)and(edNumPedido.Text='') then
    edNumpedido.OnButtonClick(self);

if key = #27 then
   begin
   key:=#0;
   end;

end;

procedure TfrmReasignaFact.edNewFacturaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in ['1','2','3','4','5','6','7','8','9','0','D','P','C',#13,#8,#27]) then
 key := #0;
if (edNewFactura.Text='')and(key in ['1','2','3','4','5','6','7','8','9','0']) then
 key := #0;
if (length(edNewFactura.Text) >= 1) and (key in ['P','D','C']) then
 key := #0;
end;

procedure TfrmReasignaFact.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmReasignaFact.btncambiarClick(Sender: TObject);
begin
//actualiza el campo idfactura de pedidos
querys('update pedidos set idfactura ='+quotedstr(ednewfactura.Text)+' where idpedido='+ednumpedido.Text,1,sqlgeneral);
//actualiza en RemiFact el campo idfactura
querys('update RemiFact set idfactura ='+quotedstr(ednewfactura.Text)+' where idpedido='+ednumpedido.Text+' and idfactura<>''0''',1,sqlgeneral);
//actualiza la tabla PagosClientes el campo idfactura
querys('update PagosClientes set idfactura ='+quotedstr(ednewfactura.Text)+' where idpedido='+ednumpedido.Text,1,sqlgeneral);
frmprincipal.ucprincipal.Log('Al pedido '+ednumpedido.Text+' se cambio de la factura '+edfactura.Text+' a '+ednewfactura.Text,3);
application.MessageBox('Cambio exitoso','Aviso',mb_iconinformation);
edfactura.Clear;
ednumpedido.Clear;
ednewfactura.Clear;
if application.MessageBox('Desea reasignar otra factura','Pregunta',mb_yesno+mb_iconquestion)=idyes then
 ednumpedido.SetFocus
else
 close;
end;

procedure TfrmReasignaFact.edNewFacturaExit(Sender: TObject);
begin
if ednewfactura.Text <> '' then
 begin
  //valida que ningun pedido tenga ese numero de factura
  querys('select idpedido from pedidos where idfactura='+quotedstr(ednewfactura.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox(pchar('Ese nuevo numero de factura ya esta siendo usado por el pedido '+sqlgeneral.fieldbyname('idpedido').asstring),'Aviso',mb_iconinformation);
    ednewfactura.Clear;
   end
  else
   begin
    querys('select idpedido from RemiFact where idfactura='+quotedstr(ednewfactura.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
     begin
      ednewfactura.Clear;
      application.MessageBox(pchar('Ese nuevo numero de factura ya esta siendo usado por el pedido '+sqlgeneral.fieldbyname('idpedido').asstring),'Aviso',mb_iconinformation)
     end;
   end;
end;

end;

procedure TfrmReasignaFact.edNumPedidoChange(Sender: TObject);
begin
if (ednumpedido.Text<>'')and(edfactura.Text<>'')and(ednewfactura.Text<>'') then
 btncambiar.Enabled := true
else
 btncambiar.Enabled := false;
end;

end.
