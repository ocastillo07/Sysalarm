{///////////////////////////////////////////////////////////////////////////////
2008/10/31 dalyla replace stren fehca con ---
2008/02/28 dalyla zona horaria ok
CREADO POR DALILA ROBLEDO
ULTIMA MODIFICACION dalyla  2007/10/04  ComisionesVend; 2007/10/06   lo quite

}///////////////////////////////////////////////////////////////////////////////
unit UDesaplicarNC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzButton, StdCtrls, RzLabel,
  Mask, RzEdit, RzBtnEdt, ExtCtrls, RzPanel, ComCtrls, RzListVw, DateUtils;

type
  TfrmDesaplicarNC = class(TForm)
    edpedido: TRzButtonEdit;
    lventa: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    btndesaplicar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    edNCpedido: TRzEdit;
    edNC: TRzEdit;
    edNCtotal: TRzEdit;
    pnc: TRzGroupBox;
    RzLabel1: TRzLabel;
    btncerrar: TRzBitBtn;
    RzLabel4: TRzLabel;
    edNCcuenta: TRzEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    edcuenta: TRzEdit;
    edtotal: TRzEdit;
    lidpago: TRzLabel;
    LPagos: TRzListView;
    edserie: TRzEdit;
    procedure btndesaplicarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure edpedidoButtonClick(Sender: TObject);
    procedure edpedidoKeyPress(Sender: TObject; var Key: Char);
  private
    _fechaPago:string;
    procedure buscarlocate;
//    procedure ComisionesVend;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDesaplicarNC: TfrmDesaplicarNC;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas, StrUtils, ConvUtils;

{$R *.dfm}

procedure TfrmDesaplicarNC.btndesaplicarClick(Sender: TObject);
var i:integer;  dif, tot : double;
begin

if(strtodate(_fechaPago) <= frmprincipal._fechaCierreMes ) then
 begin
   //if(frmprincipal._ModificarCierre = false) then
   if DerechosSys('Modifica Cierre')= false then
      begin
           application.MessageBox('La fecha afecta a un cierre anterior!. '+#13+'  solo un administrador puede realizar esta operación! ','Aviso',mb_iconinformation);
           exit;
      end else
       begin
          if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea continuar(YES) ?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
           begin
              exit;
           end;
       end;
 end;         

if (edpedido.Text = '') or (edNCpedido.Text = '') or (edNC.Text = '') or (edNCtotal.text = '')  then
  begin
    application.MessageBox('Faltan Datos para continuar', 'Atencion', MB_ICONEXCLAMATION);
    edpedido.SetFocus;
    exit;
  end;

if application.MessageBox('Estas seguro de continuar?', 'Atencion', MB_ICONQUESTION+MB_YESNO) <> idyes then
    exit;

try
  //Pedido con la aplicacion
  tot :=  strtofloat(ednctotal.Text);
  for i:=0 to lpagos.Items.Count-1 do
    begin
    if lpagos.Items.Item[i].Checked = true then
      begin
      if tot >  strtofloat(Trim( lpagos.Items.Item[i].SubItems.Text))  then
        begin
        tot := tot-strtofloat(Trim( lpagos.Items.Item[i].SubItems.Text));
        dif := strtofloat(Trim( lpagos.Items.Item[i].SubItems.Text));
        end
      else
        dif := tot;
      lidpago.caption := lpagos.Items.Item[i].Caption;
      //edtotal.Text := lpagos.Items.Item[i].SubItems.Text;
      //querys('Update pedidos set saldo=saldo+'+floattostr(dif)+', saldado = 0 where idpedido='+edpedido.text, 1, sqlgeneral);
      //querys('Update PagosClientes set restante=restante+'+floattostr(dif)+' where idpedido='+edpedido.text+' and movimiento =0', 1, sqlgeneral);
      querys('Delete from PagosClientes where idpedido = '+edpedido.Text+
             ' and movimiento = 10 and idpago='+lidpago.caption,  1, sqlgeneral);

      //Pedido con la NC
      querys('update PagosClientes set restante = ROUND(restante-'+floattostr(dif)+',2) where idpedido='+edNCpedido.text+' and movimiento = 6',1,sqlgeneral);
      // querys('update pedidos set saldo = ROUND(saldo-'+edtotal.Text+',2) where idpedido='+edNCpedido.text,1,sqlgeneral);

      //Modificar saldo de nc??
      querys('Insert into DesaplicacionNC (idpedidoaplica, idpedidonc, serie, idnc, idclienteaplica, idclientenc, monto, usuario, fecha, hora) values'+
              '('+edpedido.text+', '+edNCpedido.text+', "'+edserie.text+'", '+edNC.text+', '+edcuenta.text+', '+edNCcuenta.text+', '+edNCtotal.text+
              ', "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+timetostr(time)+'")', 1, sqlgeneral);

      if querys('select movimiento from PagosClientes where idpedido='+edNCpedido.text+' and movimiento=1 ', 0, sqlgeneral) > 0 then
         querys('Update PagosClientes set restante=restante+'+floattostr(dif)+' where idpedido='+edNCpedido.text+' and movimiento =1 '+
                'and ceil(cargo) >= ceil(restante+'+floattostr(dif)+') limit 1', 1, sqlgeneral)
      else
         querys('Update PagosClientes set restante=restante+'+ednctotal.Text+' where idpedido='+edNCpedido.text+' and movimiento =0', 1, sqlgeneral);
//      querys('Update PagosClientes set restante=restante+'+floattostr(dif)+' where idpedido='+edNCpedido.text+' and idpago='+lpagos.Items.Item[i].caption, 1, sqlgeneral)


      end;
    end;
  frmprincipal.ucprincipal.Log('Desaplico la Nota de Credito '+edNC.text+' al pedido '+edpedido.text, 3);
  application.MessageBox('Se ha terminado de desaplicar la Nota de Credito','Atencion', MB_ICONINFORMATION);

  edNCpedido.text:= '';
  edNC.text:= '';
  edNCtotal.text:= '';
  edNCcuenta.text:= '';
  edcuenta.text:= '';
  edtotal.text:= '';
       //  edNCsaldo.text:= '';
except
  application.MessageBox('Ocurrio un error al ejecutar la operacion','Atencion', MB_ICONERROR);
  end;
end;

procedure TfrmDesaplicarNC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmDesaplicarNC.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmDesaplicarNC.edpedidoButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='select pc.idpedido,pc.idcliente, pc.idfactura as Factura, notas, pc.FechaAlta, '+
         'if(p.estatus = 3, "REMISIONADO", "FACTURADO") as estatus from PagosClientes  as pc '+
         'left join pedidos as p on p.idpedido = pc.idpedido where pc.movimiento = 10 and p.estatus in (3, 4,6)';
  campo_retorno:='idpedido';
  campo_busqueda:='idcliente';
  tblorigen := 'pedidos';
  maxrow := 2;
  lbldesc.Caption:='Busqueda por Cuenta:';
  ShowModal;
  if resultado <> '' then
    begin
    edpedido.Text:=resultado;
    buscarlocate;
    end;
  end;
end;

procedure TfrmDesaplicarNC.buscarlocate;
var cadena, pedido, nc:string; i:integer;
begin
//Se aplico la Nota de Credito 6735 de la venta 1300525
  if querys('Select pc.idpago, p.idcliente, pc.idfactura, pc.idremicion, pc.idpedido, FechaAlta, cargo, abono, '+
            'restante, moneda, notas,(select min(pc2.fecha) from PagosClientes as pc2 where pc2.idpedido= '+edpedido.text+' and pc2.movimiento = 10) as fecha  from PagosClientes as pc right join pedidos as p on p.idpedido=pc.idpedido '+
            'where pc.idpedido = '+edpedido.text+' and movimiento = 10', 0, sqlgeneral) > 0 then
    begin
    sqlgeneral.First; i:= 0;
    _fechaPago := AnsiReplaceStr(sqlgeneral.fieldbyname('fecha').Asstring, '-', '/');
    lpagos.Items.Clear;
    while not sqlgeneral.Eof = true do
      begin
      lpagos.Items.Add.Caption :=  sqlgeneral.fieldbyname('idpago').AsString;
//      lpagos.Items.AddItem(LPagos,i).Caption :=  sqlgeneral.fieldbyname('idpago').AsString;
      lpagos.Items.Item[i].Caption := sqlgeneral.fieldbyname('idpago').AsString;
      lpagos.Items.Item[i].SubItems.Text := sqlgeneral.fieldbyname('abono').AsString;
      inc(i);
      sqlgeneral.next;
      end;
    lidpago.Caption := sqlgeneral.fieldbyname('idpago').AsString;
    edcuenta.Text := sqlgeneral.fieldbyname('idcliente').AsString;

    //edtotal.Text := sqlgeneral.fieldbyname('abono').AsString;
    cadena := sqlgeneral.fieldbyname('notas').AsString;
    nc := cadena;
    Delete(nc, 1, 29);
    Delete(nc, AnsiPos(' de', nc), Length(nc));
    //edNC.Text := nc;

    pedido := cadena;
    Delete(pedido, 1, AnsiPos('venta', pedido)+5);
    //'1115473 y se aplicara a la parcialidad 1115473'
    Delete(pedido, AnsiPos(' ', pedido), Length(pedido));

    edNCpedido.Text := pedido;
    querys('Select serie, idnc, total, saldo, idcliente from NotasCredito where concat(serie,idnc)="'+nc+'" ', 0, sqlgeneral);
    edNCtotal.Text := sqlgeneral.fieldbyname('total').AsString;
//    edNCsaldo.Text := sqlgeneral.fieldbyname('saldo').AsString;
    edNCcuenta.Text := sqlgeneral.fieldbyname('idcliente').AsString;
    ednc.text := sqlgeneral.fieldbyname('idnc').AsString;
    edserie.text := sqlgeneral.fieldbyname('serie').AsString;
    end
  else
    begin
    application.MessageBox('No se encontraron coincidencias, revise el numero de pedido.','Aviso', MB_ICONHAND);
    edpedido.SetFocus;
    end;
end;

procedure TfrmDesaplicarNC.edpedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, false);
if key = #13 then
  begin
  if edpedido.Text <> '' then
    buscarlocate
  else
    edpedido.OnButtonClick(self);
  end;
end;

End.
