{//////////////////////////// MODIFICACIONES ///////////////////////////////////

2010-05-24 Oscar correccion en la busqueda
#############################3
2008/10/27 dalyla bloqueo de cancelacion si tiene factura
2008/07/28 dalyla no regresar cancelacion si tiene requi y no borrar requi en cancelacion
2008/06/26-30 dalyla cambios por inventario
2008/04/29 edwin no cancelar el estatus 5
2008/04/08 dalyla Puedan Cancelar Facturas pero no remisiones sin factura
2008/02/28 dalyla zona horaria ok
2007/12/11 Edwin Validacion para el cierre.
2007/12/06 Dalila Calcula Costo Promedio
2007/10/04 Dalila Procedure CancelarVenta;
2007/10/04 Dalila procedure ComisionesVend; 2007/10/06   lo quite
}///////////////////////////////////////////////////////////////////////////////

Unit UCancelaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls, RzPanel,
  RzDBEdit, DB, MemDS, DBAccess, MyAccess, RzButton;

type
  Tfrmcancelaciones = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;      
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edNumPedido: TRzButtonEdit;
    edremicion: TRzButtonEdit;
    edfactura: TRzButtonEdit;
    dsclientes: TDataSource;
    sqlclientes: TMyQuery;
    gbcliente: TGroupBox;
    RzLabel9: TRzLabel;
    lblmovil: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblentre: TRzLabel;
    lblalta: TRzLabel;
    lblfuente: TRzLabel;
    lblorigen: TRzLabel;
    lblnombre: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel47: TRzLabel;
    RzLabel8: TRzLabel;
    lblcategoria: TRzLabel;
    RzLabel45: TRzLabel;
    edentre: TRzDBEdit;
    ednombre: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    c: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    edcuenta: TRzDBEdit;
    edrsocial: TRzDBEdit;
    edcontrol: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    SqlGeneral: TMyQuery;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    edtotal: TRzEdit;
    edabonos: TRzEdit;
    edsaldo: TRzEdit;
    Articulos: TMyQuery;
    DataSource1: TDataSource;
    dtpfecha: TRzDateTimeEdit;
    mmmotivo: TRzMemo;
    RzLabel7: TRzLabel;
    btncancelar: TRzBitBtn;
    procedure edNumPedidoButtonClick(Sender: TObject);
    procedure edNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure edremicionButtonClick(Sender: TObject);
    procedure edremicionKeyPress(Sender: TObject; var Key: Char);
    procedure edfacturaButtonClick(Sender: TObject);
    procedure edfacturaKeyPress(Sender: TObject; var Key: Char);
    procedure edNumPedidoChange(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
  private
    procedure CancelarVenta;
//    procedure ComisionesVend;
    { Private declarations }
  public
    { Public declarations }
    procedure Limpia;
  end;

var
  frmcancelaciones: Tfrmcancelaciones;
  tecla : char;
implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal;

{$R *.dfm}
//para el campo movimientos de PagosClientes se dan los siguientes significados
//0 = venta
//1 = parcialidad
//2 = abono
//3 = cancelado
//4 = abono por parcializacion.
//5 = abono de restante por cancelacion de remicion o factura
procedure Tfrmcancelaciones.edNumPedidoButtonClick(Sender: TObject);
begin
  frmbusquedas.query:='SELECT p.idpedido, p.idfactura,p.subtotal,p.iva,p.totmn ,if(c.rsocial is null or c.rsocial = "",concat(ifnull(c.nombre,"")," ",ifnull(c.apaterno,"")," ",'+
                      ' ifnull(c.amaterno," ")),c.rsocial) as cliente,'+
                      ' if(p.estatus=0,"Pedido",if(p.estatus=1,"Cancelado",if(p.estatus=2,"BackOrder",if(p.estatus=3,"Remicionado"'+
                      ',if(p.estatus in (4,6) ,"Facturado",""))))) as Estatus,p.FechaCreacion,p.usuario, p.fecha, p.hora'+
                      ' FROM  pedidos p left JOIN clientes c ON (p.idcliente = c.idcliente)'+
                      ' left join ClientesFact cf on c.idfact = cf.idfact where p.estatus in (3,4)'+
                      'order by estatus,idpedido';
 frmbusquedas.campo_retorno:='idpedido';
 frmbusquedas.tabla:='';
 frmbusquedas.tblorigen := 'pedidos';
 frmbusquedas.ShowModal;
 if frmbusquedas.resultado <> '' then
 begin
    tecla:=#13;
    edNumPedido.Text:=frmbusquedas.resultado;
    edNumPedido.OnKeyPress(self,tecla);
 end;
end;  

procedure tfrmcancelaciones.Limpia;
begin
edNumpedido.Text := '';
edremicion.Text := '';
edremicion.Enabled := true;
edfactura.Text := '';
edfactura.Enabled := true;
edNumPedido.Enabled := true;
sqlclientes.Close;
edtotal.Clear;
edabonos.Clear;
edsaldo.Clear;
end;

procedure Tfrmcancelaciones.edNumPedidoKeyPress(Sender: TObject;
  var Key: Char);
//Var   NParcialidades : integer;   Mensaje : string;
begin
key:=validanumeros(key,false);
key:=validapunto(ednumpedido.Text+'.',key);
if (key = #13) and (edNumPedido.Text <> '') then
   begin
    key:= #0;
    //verifica que existe ese numero de pedido
    if querys('select * from pedidos where idpedido = '+edNumPedido.text,0,sqlgeneral)= 0 then
      begin
      application.MessageBox(pchar('El pedido #'+edNumPedido.Text+' No Existe'),'Aviso',mb_iconinformation);
      limpia;
      exit;
      end;
    CancelarVenta;
end;

if (key=#13)and(edNumPedido.Text='') then
    edNumpedido.OnButtonClick(self);

if key = #27 then
   begin
   key:=#0;
   end;
end;

procedure Tfrmcancelaciones.FormShow(Sender: TObject);
begin
tecla := #13;
dtpfecha.Date:=FechaServidor;
end;

procedure Tfrmcancelaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmcancelaciones.RzBitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmcancelaciones.edremicionButtonClick(Sender: TObject);
begin
frmbusquedas.query:='SELECT RemiFact.idremicion,pedidos.idpedido,if ((clientes.nombre = ''''  or clientes.nombre is null) and (clientes.apaterno=''''  or clientes.apaterno is null) and (clientes.amaterno=''''  or clientes.amaterno is null) ' +
                    ', clientes.rsocial,concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as Cliente,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                    ',''Facturado'')))) as Estatus,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)  '+
                    ' left join RemiFact on pedidos.idpedido = RemiFact.idpedido where pedidos.estatus in(3,4,6)  and  RemiFact.idremicion <> 0';
querys('SELECT count(RemiFact.idremicion) as Cant FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente) '+
       'left join RemiFact on pedidos.idpedido = RemiFact.idpedido where pedidos.estatus in(3,4,6) and  RemiFact.idremicion <> 0',0,sqlgeneral);
frmbusquedas.maxrow := sqlgeneral.fieldbyname('cant').AsInteger;
frmbusquedas.campo_retorno:='idremicion';
frmbusquedas.tblorigen := 'RemiFact';
frmbusquedas.tabla:='';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  tecla:=#13;
  edremicion.Text:=frmbusquedas.resultado;
  edremicion.OnKeyPress(self,tecla);
 end;
end;

procedure Tfrmcancelaciones.edremicionKeyPress(Sender: TObject;
  var Key: Char);
//Var   NParcialidades : integer;   Mensaje : string;
begin
key:=validanumeros(key,false);
key:=validapunto(edremicion.Text+'.',key);
if (key = #13) and (edremicion.Text <> '') then
  begin
  key:= #0;
  if querys('select pedidos.idpedido from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido  where pedidos.estatus in(3,4,6) and RemiFact.idremicion='+edremicion.Text,0,SqlGeneral) = 0 then
    begin
    application.MessageBox('El numero de remicion tecleado no existe','Aviso',mb_iconinformation);
    Limpia;
    exit;
    end
  else
    edNumPedido.Text := sqlgeneral.fieldbyname('idpedido').AsString;
  CancelarVenta;

end;

if (key=#13)and(edNumPedido.Text='') then
    edremicion.OnButtonClick(self);

if key = #27 then
   begin
   key:=#0;
   Limpia;
   end;

end;

procedure Tfrmcancelaciones.edfacturaButtonClick(Sender: TObject);
begin
frmbusquedas.query:='SELECT RemiFact.idfactura,RemiFact.idremicion,pedidos.idpedido,if ((clientes.nombre = '''' or clientes.nombre is null) and (clientes.apaterno='''' or clientes.apaterno is null) and (clientes.amaterno='''' or clientes.amaterno is null) ' +
                    ', clientes.rsocial,concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as Cliente,if(pedidos.estatus=0,''Pedido'',if(pedidos.estatus=1,''Cancelado'',if(pedidos.estatus=2,''BackOrder'',if(pedidos.estatus=3,''Remicionado'''+
                    ',if(pedidos.estatus in(4,6),''Facturado'',""))))) as Estatus,pedidos.FechaCreacion,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)  '+
                    ' left join RemiFact on pedidos.idpedido = RemiFact.idpedido where pedidos.estatus in(3,4,6) and  RemiFact.idfactura <> ''0''';

frmbusquedas.campo_retorno := 'idfactura';
querys('SELECT count(RemiFact.idfactura) as cant FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)  left join RemiFact on pedidos.idpedido = RemiFact.idpedido where pedidos.estatus in(3,4,6) and  RemiFact.idfactura <> 0',0,sqlgeneral);
frmbusquedas.maxrow :=sqlgeneral.fieldbyname('cant').AsInteger;
frmbusquedas.tblorigen := 'RemiFact';
frmbusquedas.tabla:='';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  tecla:=#13;
  edfactura.Text:=frmbusquedas.resultado;
  edfactura.OnKeyPress(self,tecla);
 end;
end;

procedure Tfrmcancelaciones.edfacturaKeyPress(Sender: TObject;
  var Key: Char);
//Var    NParcialidades : integer;  Mensaje : string;
begin
if (key = #13) and (edfactura.Text <> '') then
  begin
  key:= #0;
  if querys('select RemiFact.idremicion,RemiFact.idfactura,pedidos.idpedido,pedidos.idcliente,pedidos.TotMn from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido  where RemiFact.idfactura='+quotedstr(edfactura.Text),0,SqlGeneral) > 0 then
    edNumPedido.Text := sqlgeneral.fieldbyname('idpedido').AsString
  else
    begin
    application.MessageBox('El numero de factura tecleado no existe','Aviso',mb_iconinformation);
    Limpia;
    exit;
    end;
  CancelarVenta;
end;

if (key=#13)and(edNumPedido.Text='') then
    edfactura.OnButtonClick(self);

if key = #27 then
   begin
   key:=#0;
   Limpia;
   end;

end;

procedure Tfrmcancelaciones.CancelarVenta;
 var NParcialidades:Integer; Mensaje,idfactura:String; fechaRemi:tdate;
begin
//showmessage(datetostr(dtpfecha.Date));
btncancelar.Enabled := true;
if mmmotivo.Text = '' then
  begin
  application.MessageBox('Escriba el motivo de cancelacion','Aviso',mb_iconinformation);
  mmmotivo.SetFocus;
  exit;
  end;

//verifica si no se ha cancelado esta venta
if querys('select movimiento from PagosClientes where movimiento = 5 and idpedido = '+
          edNumPedido.Text,0,sqlgeneral) > 0 then
  begin
  application.MessageBox('Esta Venta ya ha sido cancelada','Aviso',mb_iconinformation);
  Limpia;
  exit;
  end
else
  begin

  if querys('select idpedido from pedidos where idpedido = '+
          edNumPedido.Text+' and estatus = 5' ,0,sqlgeneral) > 0 then
  begin
  application.MessageBox('Este Pedido es saldado por alguna cortesia o bonificacion etc..., no se puede cancelar!','Aviso',mb_iconinformation);
  Limpia;
  exit;
  end;

  if querys('SELECT r.iddoc FROM requisiciones r where iddoc = '+edNumPedido.Text+' and surtido not in (2,4)' ,0,sqlgeneral) > 0 then
    begin
    if application.MessageBox(pchar('Este Pedido tiene una requisicion y no podra deshacer la cancelacion. '+char(#13)+
                              'Desea continuar?'),'Aviso',MB_ICONQUESTION+MB_YESNO) <> idyes then
      begin
      Limpia;
      exit;
      end;
    end;

  //trae el idfactura
    querys('select idfactura from RemiFact where idfactura<>''0'' and idpedido='+edNumPedido.Text,0,sqlgeneral);
    if sqlgeneral.fieldbyname('idfactura').AsString = '' then
      edFactura.Text := '0'
    else
      edFactura.Text := sqlgeneral.fieldbyname('idfactura').AsString;

  if querys('select pc.idpedido, FechaFactura,subdate("'+datetostr(date)+'", interval dayofmonth("'+datetostr(date)+'") day), '+
            'movimiento,date_format((select min(rf.FechaAlta) from RemiFact as rf where rf.idpedido ='+EdNumPedido.Text+'), "%Y/%m/%d") as FechaRemision from PagosClientes as pc '+
            'left join pedidos as p on p.idpedido=pc.idpedido where p.idpedido='+EdNumPedido.Text+' ', 0, sqlgeneral) > 0 then

    begin
    fechaRemi :=   sqlgeneral.fieldbyname('FechaRemision').Asdatetime;
    if( fechaRemi <= frmprincipal._fechaCierreMes ) then
      begin
         //if(frmprincipal._ModificarCierre = false) then
         if DerechosSys('Modifica Cierre')= false then
            begin
            if edfactura.text <> '0' then
              begin
              application.MessageBox('El pedido es de un cierre anterior!!. '+#13+'  solo un administrador puede realizar esta operación!','Aviso',mb_iconinformation);
              Limpia;
              exit;
              end;
            end
         else
            begin
            if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea cancelar el pedido (YES)?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
              begin
              Limpia;
              exit;
              end;
             end;
     end;
    end;


  if querys('select p.idpedido from PagosClientes as pc left join pedidos as p on p.idpedido=pc.idpedido where p.idpedido='+EdNumPedido.Text+' and movimiento in(2,4) ',0,sqlgeneral) > 0 then
    begin
    if (application.MessageBox('Esta Venta tiene un pago o abono. Desea continuar?','Aviso',mb_iconinformation+mb_yesno) <> idyes) then
      begin
      limpia;
      exit;
      end;
    end;

  if querys('select RemiFact.idremicion,pedidos.idpedido,pedidos.idcliente,pedidos.TotMn from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido  where  pedidos.idpedido='+edNumPedido.Text+' and   pedidos.estatus in(3,4) ' ,0,SqlGeneral) > 0 then
    begin
    edtotal.text := sqlgeneral.fieldbyname('TotMn').AsString;
    edRemicion.Text := sqlgeneral.fieldbyname('idremicion').AsString;
    edRemicion.Enabled := false;
    edFactura.Enabled := false;

    sqlclientes.Close;
    sqlclientes.ParamByName('idcliente').Value := sqlgeneral.fieldbyname('idcliente').AsInteger;
    sqlclientes.Open;
    if sqlclientes.RecordCount = 0 then
      edcuenta.Text := sqlgeneral.fieldbyname('idcliente').Asstring;

    //trae la cantidad de pagos hechos para esta venta
    querys('select count(idpago) as cant from PagosClientes where movimiento = 1 and idpedido='+edNumPedido.text,0,sqlgeneral);
    NParcialidades := sqlgeneral.fieldbyname('cant').AsInteger;
    //trae el abonos y el saldo de este pedido
    if NParcialidades > 0 then
      begin
      querys('select sum(restante) as rest,sum(abono) as abono from PagosClientes where movimiento in(1,2,6,10) and restante >= 0 and idpedido='+ednumpedido.Text,0,sqlgeneral);
      edabonos.Text := floattostr(sqlgeneral.fieldbyname('abono').AsFloat);
      edsaldo.Text := floattostr(sqlgeneral.fieldbyname('rest').AsFloat);
      end
    else
      begin
      querys('select sum(restante) as rest,sum(abono) as abono from PagosClientes where movimiento in(0,2,6,10) and restante >= 0 and idpedido='+ednumpedido.Text,0,sqlgeneral);
      edabonos.Text := floattostr(sqlgeneral.fieldbyname('abono').AsFloat);
      edsaldo.Text := floattostr(sqlgeneral.fieldbyname('rest').AsFloat);
      end;

    if (edremicion.Text <> '0') and (edfactura.Text = '0') then
      Mensaje :='Esta seguro que desea cancelar la Remicion #'+edremicion.Text+'?';
    if edfactura.Text <> '0' then
      Mensaje := 'Esta seguro que desea cancelar la Factura #'+edfactura.Text+'?';
    if application.MessageBox(Pchar(Mensaje),'Confirmacion',mb_yesno) = idyes then
      begin
      if NParcialidades > 0 then
        begin
      //inserta el abono por lo que tiene en restante                                                                                           //cambie de 5 a 4 por peticion de edwin
      querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,idfactura,FechaAlta,abono,restante,usuario,fecha,hora) values (5,'+edcuenta.Text+','+edNumPedido.Text+','+edremicion.Text+','+quotedstr(edfactura.Text)+','+quotedstr(datetostr(dtpfecha.Date))+','+edsaldo.text+',-'+edsaldo.text+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(date))+','+quotedstr(timetostr(time))+')',1,sqlgeneral);
      //les cambia el campo movimiento = 3 a las parcialidades
      querys('update PagosClientes set movimiento = 3 where movimiento = 1  and idpedido='+edNumPedido.Text,1,sqlgeneral);
        end
      else
        //inserta el abono por el monto de la venta                                                                                              //cambie de 5 a 4 por peticion de edwin
        querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,idfactura,FechaAlta,abono,restante,usuario,fecha,hora) values (5,'+edcuenta.Text+','+edNumPedido.Text+','+edremicion.Text+','+quotedstr(edfactura.Text)+','+quotedstr(datetostr(dtpfecha.Date))+','+edsaldo.text+',-'+edsaldo.text+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(date))+','+quotedstr(timetostr(time))+')',1,sqlgeneral);

      //actualiza el ifactura de los registros de PagosClientes del pedido actual
      if edfactura.Text <> '' then
        querys('update PagosClientes set idfactura='+quotedstr(edfactura.Text)+' where idpedido='+edNumPedido.Text,1,sqlgeneral);

      //actualiza el saldo del cliente
      bpcambios('clientes', edcuenta.Text, 'idcliente');
      querys('update clientes set saldo=saldo-'+edsaldo.Text+',TotComprado=TotComprado-'+edtotal.Text+' where idcliente='+edcuenta.Text,1,sqlgeneral);
      apcambios('idcliente', edcuenta.Text, 'clientes', 'frmCancelaciones');

      //actualiza el campo AbonoDev
      querys('update PagosClientes set AbonoDev = AbonoDev+'+edabonos.Text+' where movimiento = 0 and idpedido='+edNumPedido.Text,1,sqlgeneral);
      //pone el estatus de cancelado al pedido
      querys('update pedidos set estatus=1,Saldo=0 where idpedido = '+edNumPedido.Text,1,sqlgeneral);
      //querys('update PagosClientes set AbonoDev = AbonoDev+'+edabonos.Text+' where movimiento = 0 and idpedido='+edNumPedido.Text,1,sqlgeneral);
      if (edremicion.Text <> '0') and (edfactura.Text = '0') then
        //actualiza los datos de cancelacion en la tabla RemiFact
        querys('update RemiFact set FechaBaja = '+quotedstr(datetostr(dtpfecha.Date))+',HoraBaja='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',UsuarioBaja='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idremicion <> 0 and idpedido = '+edNumPedido.Text,1,sqlgeneral);
      if edfactura.Text <> '0' then
      begin
        //actualiza los datos de cancelacion en la tabla RemiFact
        querys('update RemiFact set FechaBaja = '+quotedstr(datetostr(dtpfecha.Date))+',HoraBaja='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',UsuarioBaja='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idfactura <> ''0'' and idpedido = '+edNumPedido.Text,1,sqlgeneral);
        idfactura:=edfactura.Text;
      end
      else
        idfactura:='';

      querys('delete from boletas where idpedido='+edNumPedido.Text,1,sqlgeneral);

      querys('insert into pedidos_motcancelacion(idpedido, idfactura,fecha_cancelacion, motivo, usuario, fecha, hora) values '+
             '("'+edNumPedido.Text+'", "'+idfactura+'", "'+datetostr(dtpfecha.Date)+'", "'+mmmotivo.text+'", "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'")',1,sqlgeneral);

      CancelaPedido(edNumPedido.Text);
      application.MessageBox('Cancelacion Exitosa','Aviso',mb_iconinformation);
      frmprincipal.ucprincipal.Log('Cancelo el pedido #'+edNumPedido.Text+' con Remicion #'+edremicion.Text+' y Factura #'+edfactura.Text,3);
      btncancelar.Enabled := false;
      Limpia;
      end;
    end;
  end;
end;

procedure Tfrmcancelaciones.edNumPedidoChange(Sender: TObject);
begin
if edNumPedido.Text = '' then
  limpia;
end;

procedure Tfrmcancelaciones.btncancelarClick(Sender: TObject);
var key :char;
begin
key :=  char(13);
edNumPedido.OnKeyPress(sender, key);
end;

End.
