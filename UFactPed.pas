{///////////////////////////////////////////////////////////////////////////////
2009/02/13 dalyla Quitar el idfactura de pagos clientes
//2009/01/14 Oscar correccion FechaVencimiento y formato fecha en actualizar boletas
//2008/02/28 dalyla zona horaria ok
//2008/07/14 dalyla referencia bancaria configuraciones
}///////////////////////////////////////////////////////////////////////////////
unit UFactPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit,StrUtils,DateUtils;

type
  TfrmFactPed = class(TForm)
    edpedido: TRzEdit;
    btnalta: TRzBitBtn;
    RzLabel17: TRzLabel;
    RzLabel1: TRzLabel;
    btncancelar: TRzBitBtn;
    procedure btnaltaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnaltaKeyPress(Sender: TObject; var Key: Char);
    procedure edpedidoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFactPed: TfrmFactPed;

implementation

uses Udmrep, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmFactPed.btnaltaClick(Sender: TObject);
var fact,idpedido,idremicion,Banco,CodBarras,CodBBVA,CodBanorte,cliente,total:string; // cvecte,cvevta,
begin
   with dmreportes do
   begin
      querys('SELECT rf.idfactura as fact,p.idcliente as clie,p.TotMn as tot,p.FechaFactura as Fecha '+
      'FROM pedidos as p LEFT JOIN RemiFact as rf ON(rf.idpedido=p.idpedido)  where p.idpedido ='+quotedstr(edpedido.text)+
      ' and rf.idfactura <> ''0'' and p.estatus in(3,4)',0,sqlgeneral);
      if ((sqlgeneral.FieldByName('fact').AsString <> '0') or  (sqlgeneral.FieldByName('fact').AsString <> '')) then
      begin
         fact:=sqlgeneral.FieldByName('fact').AsString;
         if monthof(FechaServidor) <> monthof(sqlgeneral.FieldByName('Fecha').AsDateTime) then
         begin
            application.MessageBox('No se puede cancelar la factura, ya que es de diferente mes!' + #13#10 + 'Realice nota de crédito a la venta' ,'Atención',mb_Iconinformation);
            edpedido.Text := '';
            edpedido.SetFocus;
            exit
         end;
         if application.MessageBox(pchar('Esta correcta la factura a traspasar datos : '+fact+''),'Atención',mb_yesno)=idyes then
         begin
            cliente:=sqlgeneral.FieldByName('clie').AsString;
            total:=sqlgeneral.FieldByName('tot').AsString;
            querys('select max(idpedido) as idpedido from pedidos',0,sqlgeneral);
            idpedido:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
            //inserrtamos el nuevo pedido con los datos de la fctura que va hacer cancelada.......
            querys('INSERT INTO pedidos (idpedido,idpresupuesto,idoportunidad,idcliente,CodVendedor,idUnidadNegocio,'+
                   'idorigen,FechaCreacion,FechaCierre,observaciones,DescProm,DescPP,usuario,fecha,hora,TipoCambio,TotMat,TotHrs,CostoHrs,'+
                   'MontoHrs,SubTotal,Descuento,Iva,TotDlls,TotMn,Anticipo,Saldo,paquete,autorizo,estatus,concepto,Facturado,'+
                   'FechaRemision,FechaVencimiento,fechaliquidacion,idPedidoHijo,idPedidoPadre,idlinea,FormaPago,saldado,'+
                   'idvendedor,NotaInst,idinstal) SELECT '+quotedstr(idpedido)+',idpresupuesto,idoportunidad,idcliente,'+
                   'CodVendedor,idUnidadNegocio,idorigen,FechaCreacion,FechaCierre,observaciones,DescProm,DescPP,'+
                   'usuario,fecha,hora,TipoCambio,TotMat,TotHrs,CostoHrs,MontoHrs,'+
                   'SubTotal,Descuento,Iva,TotDlls,TotMn,Anticipo,Saldo,paquete,autorizo,''3'',concepto,Facturado,'+
                   'FechaRemision,FechaVencimiento,fechaliquidacion,idPedidoHijo,idPedidoPadre,idlinea,FormaPago,saldado,'+
                   'idvendedor,NotaInst,idinstal FROM pedidos where idpedido='+quotedstr(edpedido.text),1,sqlgeneral2);

            //insertamos sus detallles ....
            querys('INSERT INTO DetPedido (idpedido,cant,piezas,cod_cve,utilidad,surtido,paquete,idrequisicion,idCardexArt,costo,tc)'+
                   ' SELECT '+quotedstr(idpedido)+',cant,piezas,cod_cve,utilidad,surtido,paquete,idrequisicion,idCardexArt, '+
                   'costo,tc FROM DetPedido where idpedido='+quotedstr(edpedido.text),1,sqlgeneral2);

            //insertamos el nuevo idremicion en RemiFact
            querys('SELECT rf.idfactura as fact,min(rf.FechaAlta) as fecha, cast(rf.HoraAlta as time) as hora'+
                   ' FROM pedidos as p LEFT JOIN RemiFact as rf ON(rf.idpedido=p.idpedido) '+
                   ' where p.idpedido ='+quotedstr(edpedido.text)+' group by rf.idpedido',0,sqlgeneral2);
            querys('SELECT idremicion from folios',0,sqlgeneral3);
            idremicion:=inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1);
            querys('INSERT INTO RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values('+quotedstr(idremicion)+
                   ','+quotedstr(idpedido)+','+quotedstr(sqlgeneral2.FieldByName('fecha').AsString)+','+
                   quotedstr(FormatDateTime('HH:mm:ss',sqlgeneral2.FieldByName('hora').AsDateTime))+','+
                   quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+') ',1,sqlgeneral3);
            querys('UPDATE RemiFact set FechaBaja='+quotedstr(datetostr(FechaServidor))+' ,HoraBaja='+
                   quotedstr(FormatDateTime('HH:mm:ss',Time))+',UsuarioBaja='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+
                   ' where idpedido='+quotedstr(edpedido.text),1,sqlgeneral3);
            querys('UPDATE folios set idremicion='+quotedstr(idremicion),1,sqlgeneral3);

            //actualiazamos los pagos con el nuevo idpedido.....
            querys('UPDATE PagosClientes SET idpedido='+quotedstr(idpedido)+',idremicion='+quotedstr(idremicion)+
                   ', idfactura=0 where idpedido='+quotedstr(edpedido.text),1,sqlgeneral3);

            //actualizamos instalaciones
            querys('UPDATE instalaciones set idpedido='+quotedstr(idpedido)+' where idpedido='+
            quotedstr(edpedido.text),1,sqlgeneral3);

            //actualizar boletas......
            querys('SELECT idpedido FROM boletas where idpedido='+quotedstr(edpedido.text),0,sqlgeneral3);
            if sqlgeneral3.FieldByName('idpedido').AsString <> '' then
            begin
               Banco := ReferenciaBanco(cliente, idpedido);
               querys('select FechaVencimiento from pedidos where idpedido='+quotedstr(edpedido.text),0,sqlgeneral3);
               CodBarras := CodBarrasOxxo(cliente, idpedido, total, formatdatetime('yyyy/MM/dd', sqlgeneral3.fieldbyname('FechaVencimiento').Asdatetime));
               CodBBVA := CodBarrasBBVA(cliente, idpedido, total, formatdatetime('yyyy/MM/dd', sqlgeneral3.fieldbyname('FechaVencimiento').Asdatetime));
               CodBanorte := CodBarrasBanorte(cliente, idpedido, total, formatdatetime('yyyy/MM/dd', sqlgeneral3.fieldbyname('FechaVencimiento').Asdatetime));
               //actualizar boletas...
               querys('UPDATE boletas set idpedido='+quotedstr(idpedido)+',CodBarras='+quotedstr(CodBarras)+',CodBanco='+quotedstr(Banco)+' where idpedido='+quotedstr(edpedido.text),1,sqlgeneral3);
            end;
            //actualizamos cardex......
            querys('UPDATE CardexArt set iddoc='+quotedstr(idpedido)+' where iddoc='+quotedstr(edpedido.text)+' and idmovi=5',1,sqlgeneral3);
            // actualizamos el pedido facturado a cancelado......
            querys('UPDATE pedidos set estatus=1 where idpedido='+quotedstr(edpedido.text),1,sqlgeneral3);
            //insertamos en un tabla para poder mostrar un reporte porsteriormente......
            querys('INSERT INTO FacturaPedido (idpedido1,idpedido2,Fecha,usuario) values('+quotedstr(edpedido.text)+','+quotedstr(idpedido)+',"'+datetostr(date)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+') ',1,sqlgeneral2);
            application.MessageBox(pchar('Listo!, el nuevo pedido es:'+idpedido+''),'Atención',mb_iconinformation);
            edpedido.text:='';
         end;
      end
      else
      begin
         application.MessageBox('Este pedido no esta facturado,escribe de nuevo el pedido a trabajar','Atención',mb_iconinformation);
      end;
   end;
end;

procedure TfrmFactPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmFactPed.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmFactPed.FormShow(Sender: TObject);
begin
edpedido.SetFocus;
end;

procedure TfrmFactPed.btnaltaKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
    btnalta.OnClick(self);

end;

procedure TfrmFactPed.edpedidoKeyPress(Sender: TObject; var Key: Char);
begin
if ((key=#13)  and (edpedido.Text <> '')) then
   btnalta.OnClick(self);
end;

end.
