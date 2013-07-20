{///////////////////////////// MODIFICACIONES //////////////////////////////////
2008/07/28 dalyla Terminar
}///////////////////////////// MODIFICACIONES //////////////////////////////////
unit uDeshacerCancelacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, RzButton, DB, MemDS,
  DBAccess, MyAccess;

type
  TfrmDeshacerCancelacion = class(TForm)
    RzLabel1: TRzLabel;
    edcliente: TRzButtonEdit;
    edpedido: TRzButtonEdit;
    RzLabel2: TRzLabel;
    lfactura: TRzLabel;
    lremision: TRzLabel;
    ltotmn: TRzLabel;
    ltotdlls: TRzLabel;
    lnombre: TRzLabel;
    btnregresar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    lfecha: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    procedure edclienteKeyPress(Sender: TObject; var Key: Char);
    procedure edclienteButtonClick(Sender: TObject);
    procedure edpedidoKeyPress(Sender: TObject; var Key: Char);
    procedure btnregresarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure edclienteChange(Sender: TObject);
    procedure edpedidoButtonClick(Sender: TObject);
  private
    procedure buscarlocate;
    procedure buscarcliente;
    procedure limpiar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeshacerCancelacion: TfrmDeshacerCancelacion;

implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmDeshacerCancelacion.edclienteKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
  if edcliente.Text <> '' then
    begin
    buscarcliente;
    edpedido.OnButtonClick(self);
    end
  else
    edcliente.OnButtonClick(self);
  end;
end;

procedure TfrmDeshacerCancelacion.edclienteButtonClick(Sender: TObject);
begin
  with frmbusquedas do
    begin
    query:='Select distinct c.idcliente, '+clientenombre('c')+' as nombre ,t.telefono, t.tipo_tel as Tipo, case c.estatus when 0 then '+
           '"Inactivo" when 1 then "Activo" when 2 then "Por Revisar" when 3 then "Apartado" end as estatus, c.bloqueado as Bloqueado, '+
           'c.TipoCont, concat(c.dir,'','', c.numero,'','',c.ciudad,'','',c.estado) as Direccion, c.usuario as Usuario, c.fecha as '+
           'Fecha,c.hora as Hora From clientes c left join telefonos t on c.idtel=t.idtel group by idcliente order by idcliente';
    campo_retorno:='idcliente';
    campo_busqueda:='Nombre';
    tblorigen := 'clientes';
    tabla:='clientes';
    cbofiltro.OnClick(self);
    ShowModal;
    if resultado <> '' then
      begin
      edcliente.Text := resultado;
      buscarcliente;
      end;
    end;
end;

procedure TfrmDeshacerCancelacion.buscarcliente;
begin
querys('Select '+clientenombre('c')+' as nombre From clientes c where  c.idcliente ='+edcliente.text, 0, sqlgeneral);
lnombre.Caption := sqlgeneral.fieldbyname('nombre').AsString;
edpedido.Enabled := true;
end;

procedure TfrmDeshacerCancelacion.edpedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
if edpedido.Text <> '' then
  begin
  if key = #13 then
    buscarlocate;
  end;
end;

procedure TfrmDeshacerCancelacion.buscarlocate;
begin
if querys('Select p.idfactura, rf.idremicion, p.TotMn, p.TotDlls, max(rf.FechaBaja) as FechaBaja, r.idrequisicion '+
          'from pedidos p left join RemiFact rf on rf.idpedido = p.idpedido left join requisiciones r on r.iddoc=p.idpedido '+
          'where p.idpedido = '+edpedido.text+' and idcliente = '+edcliente.text+' and p.estatus = 1 and (r.estatus in (2,4) or r.estatus '+
          'is null) group by rf.idpedido ', 0, sqlgeneral) > 0 then
  begin
  lfactura.Caption := sqlgeneral.fieldbyname('idfactura').AsString;
  lremision.Caption := sqlgeneral.fieldbyname('idremicion').AsString;
  lfecha.Caption := sqlgeneral.fieldbyname('FechaBaja').AsString;
  ltotmn.Caption := Format('%8.2f',[sqlgeneral.fieldbyname('TotMn').AsFloat]);
  ltotdlls.Caption := Format('%8.2f',[sqlgeneral.fieldbyname('TotDlls').AsFloat]);
  btnregresar.Enabled := true;
  edpedido.enabled := false;
  end
else
  begin
  Application.MessageBox('No existe el pedido, no es del cliente, tiene requisicion o no esta cancelado.', 'Atencion', MB_ICONINFORMATION);
  btnregresar.Enabled := false;
  edpedido.SetFocus;
  exit;
  end;
end;

procedure TfrmDeshacerCancelacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := caFree;
end;

procedure TfrmDeshacerCancelacion.btncancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmDeshacerCancelacion.edclienteChange(Sender: TObject);
begin
  limpiar;
if edcliente.text = '' then
  edpedido.Enabled := false;
end;

procedure TfrmDeshacerCancelacion.limpiar;
begin
edpedido.text := '';
lnombre.Caption := '';
lfactura.Caption := '';
lremision.Caption := '';
lfecha.Caption := '';
ltotmn.Caption := '';
ltotdlls.Caption := '';
end;

procedure TfrmDeshacerCancelacion.edpedidoButtonClick(Sender: TObject);
begin                                                                                               
with frmbusquedas do
  begin
  query:= 'SELECT p.idpedido, idfactura, TotMn, TotDlls, idrequisicion FROM  pedidos p left join requisiciones r on '+
          'r.iddoc=p.idpedido where idcliente = '+edcliente.text+' and p.estatus = 1 and (r.estatus  in (2,4) or r.estatus is null)';
  campo_retorno:='idpedido';
  tabla:='';
  tblorigen := 'pedidos';
  ShowModal;
  if resultado <> '' then
    begin
    edPedido.Text := resultado;
    buscarlocate;
    end;
  end;
end;

procedure TfrmDeshacerCancelacion.btnregresarClick(Sender: TObject);
var NParcialidades:integer;
begin
if edpedido.text <> '' then
  begin
  if Application.MessageBox('Esta seguro de Deshacer la Cancelacion?', 'Pregunta', MB_ICONQUESTION+MB_YESNO) = idyes then
    begin
    if  strtodate(lfecha.caption) <= frmprincipal._fechaCierreMes then
      begin
      Application.MessageBox('Esta Cancelacion es de un cierre anterior y no se puede modificar', 'Atencion', MB_ICONEXCLAMATION);
      exit;
      end
    else
      begin
      //trae la cantidad de pagos hechos para esta venta
      querys('select count(idpago) as cant from PagosClientes where movimiento = 3 and notas like "%Parcialidad%" and idpedido='+edPedido.text,0,sqlgeneral);
      NParcialidades := sqlgeneral.fieldbyname('cant').AsInteger;
      if NParcialidades > 0 then
        begin
        querys('Delete from PagosClientes where movimiento = 5 and idcliente ='+edcliente.Text+' and idpedido ='+edPedido.Text,1,sqlgeneral);
        querys('update PagosClientes set movimiento = 1 where movimiento = 3 and idpedido='+edPedido.Text,1,sqlgeneral);
        end
      else
        querys('Delete from PagosClientes where movimiento = 5 and idcliente ='+edcliente.Text+' and idpedido ='+edPedido.Text,1,sqlgeneral);

      //actualiza el saldo del cliente
      bpcambios('clientes', edcliente.Text, 'idcliente');
      querys('update clientes set saldo=saldo+'+ltotmn.caption+', TotComprado=TotComprado+'+ltotmn.caption+' where idcliente='+edcliente.Text,1,sqlgeneral);
      apcambios('idcliente', edcliente.Text, 'clientes', 'frmDeshacerCancelacion');

      //actualiza el campo AbonoDev
      querys('update PagosClientes set AbonoDev = AbonoDev=0 where movimiento = 0 and idpedido='+edPedido.Text,1,sqlgeneral);

      if lfactura.Caption <> '' then  //VERIFICAR SALDO
        querys('update pedidos set estatus=4,Saldo='+ltotmn.caption+' where idpedido = '+edPedido.Text,1,sqlgeneral)
      else
        querys('update pedidos set estatus=3,Saldo='+ltotmn.caption+' where idpedido = '+edPedido.Text,1,sqlgeneral);

      querys('update RemiFact set FechaBaja = "0000-00-00",HoraBaja= "00:00:00", UsuarioBaja="" where idpedido = '+edPedido.Text,1,sqlgeneral);
      //CancelaPedido(edPedido.Text);
      querys('Select cant, cod_cve from DetPedido where idpedido = '+edpedido.Text, 0, sqlgeneral);
      RegresaCancelacion(sqlgeneral, 32, edpedido.text, edpedido.text);
      application.MessageBox('Se ha regresado la cancelacion','Aviso',mb_iconinformation);
      frmprincipal.ucprincipal.Log('Regreso la Cancelacion el pedido #'+edpedido.Text,3);
      end;
    end;
  end;
end;

End.

