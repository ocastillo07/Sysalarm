{///////////////////////////////////////////////////////////////////////////////
2009/05/27 dalyla Factura Electronica
2009-04-01 Oscar candado para el cierre cobranza
2009/01/21 Oscar fechavencimiento
2009/01/19 Oscar derechos para fecha fact,vence
2008/12/02 dalyla incrementa mes vencimiento por funcion
2008/11/27 OScar remifact
2008/10/16 OSCAR fechavence
2008/10/10 dalyla inventariable
2008/05/16 dalyla actualizar ban en factura
2008/03/27 dalyla hora del insert
2007/12/11 Edwin Validacion para el cierre.
2007/11/02      DALILA  AGREGUE REMISIONADO PARA NO CAMBIAR F.VENCIMIENTO SI YA
                        TIENE REMISION EN EL INICIALIZA
}///////////////////////////////////////////////////////////////////////////////
unit URemiFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit, ComCtrls, RzDTP, DateUtils;

type
  TfrmRemiFac = class(TForm)
    lblfecha: TRzLabel;
    lblnumero: TRzLabel;
    lblvencimiento: TRzLabel;
    dtpfecha: TRzDateTimePicker;
    dtpvencimiento: TRzDateTimePicker;
    btnguardar: TRzBitBtn;
    ednumero: TRzEdit;
    procedure btnguardarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
     tipofac:string;
    { Private declarations }

  public
    { Public declarations }
     idPedido : integer;
     // inicializa(remicion : boolean;idped : integer;id : string);
     //constructor inicializa(remicion, remicionado: boolean;idped : integer; id : string);
     constructor inicializa(remicion, remicionado: boolean;idped : integer; id, tipo : string);

  end;

var
  frmRemiFac: TfrmRemiFac;

implementation

uses Udm, Urecursos, Uprincipal, Udmrep;

{$R *.dfm}

//#cfd
constructor tfrmremifac.inicializa(remicion, remicionado: boolean;idped : integer; id, tipo : string);
//var dia, mes:integer;
begin
  tipofac := tipo;
  if DerechosSys('Fecha Vencimiento') = true then
  begin
      dtpvencimiento.Enabled:=true;
  end;

  if DerechosSys('Fecha Facturacion') = true then
  begin
     dtpfecha.Enabled:=true;
  end;
  querys('select u.idlinea from UnidadNegocio u inner join pedidos p using(idunidadnegocio) where idpedido= '+inttostr(idped),0,dmreportes.sqlgeneral);
  if dmreportes.sqlgeneral.FieldByName('idlinea').asstring='1' then
    dtpvencimiento.Date:=  EncodeDate(yearof(IncMonth(today,1)),monthof(IncMonth(today,1)),DaysInMonth(IncMonth(today,1)))
  else
    dtpvencimiento.Date := IncMonth(today, 1);

  if remicion then
  begin
    lblfecha.Caption := 'Fecha Remision:';
    lblnumero.Caption := 'Num Remision:';
    self.Tag := 0;
  end
  else
  begin
    lblfecha.Caption := 'Fecha Facturacion:';
    lblnumero.Caption := 'Num Facturacion:';
    if remicionado = true then
    begin
      querys('Select FechaVencimiento from pedidos where idpedido='+inttostr(idped), 0, dmaccesos.sqlgeneral);
      dtpvencimiento.Date := dmaccesos.sqlgeneral.fieldbyname('FechaVencimiento').AsDateTime;
    end;
    self.Tag := 1;
  end;
  ednumero.Text := id;
  idPedido := idped;
end;

{constructor tfrmremifac.inicializa(remicion, remicionado: boolean;idped : integer; id : string);
var dia, mes:integer;
begin
  if DerechosSys('Fecha Vencimiento') = true then
  begin
      dtpvencimiento.Enabled:=true;
  end;

  if DerechosSys('Fecha Facturacion') = true then
  begin
     dtpfecha.Enabled:=true;
  end;
  querys('select u.idlinea from UnidadNegocio u inner join pedidos p using(idunidadnegocio) where idpedido= '+inttostr(idped),0,dmreportes.sqlgeneral);
  if dmreportes.sqlgeneral.FieldByName('idlinea').asstring='1' then
    dtpvencimiento.Date:= EncodeDate(yearof(today),monthof(IncMonth(today,1)),DaysInMonth(IncMonth(today,1)))
  else
    dtpvencimiento.Date := IncMonth(today, 1);

  if remicion then
  begin
    lblfecha.Caption := 'Fecha Remision:';
    lblnumero.Caption := 'Num Remision:';
    self.Tag := 0;
  end
  else
  begin
    lblfecha.Caption := 'Fecha Facturacion:';
    lblnumero.Caption := 'Num Facturacion:';
    if remicionado = true then
    begin
      querys('Select FechaVencimiento from pedidos where idpedido='+inttostr(idped), 0, dmaccesos.sqlgeneral);
      dtpvencimiento.Date := dmaccesos.sqlgeneral.fieldbyname('FechaVencimiento').AsDateTime;
    end;
    self.Tag := 1;
  end;
  ednumero.Text := id;
  idPedido := idped;
end;
 }
{procedure TfrmRemiFac.btnguardarClick(Sender: TObject);
var remicion :string;
begin

if(dtpfecha.Date <= frmprincipal._fechaCierreMes ) then
 begin
   //if(frmprincipal._ModificarCierre = false) then
   if DerechosSys('Modifica Cierre') = false then
      begin
           application.MessageBox('La fecha afecta a un cierre anterior!. '+#13+'  solo un administrador puede realizar esta operación! '+#13+'Modifique la fecha por favor!','Aviso',mb_iconinformation);
           exit;
      end else
       begin
          if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea continuar(YES) ó modifique la fecha(NO) ?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
             begin
                 exit;
             end;
       end;
 end;

if self.Tag = 0 then
 begin
  //inserta en RemiFact
  querys('insert into RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+ednumero.text+','+inttostr(idPedido)+','+quotedstr(datetostr(dtpfecha.Date))+',"'+FormatDateTime('HH:mm:ss',HoraServidor)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,dmaccesos.sqlgeneral);
  frmprincipal.ucprincipal.Log('Remiciono el pedido #'+inttostr(idPedido));
  querys('update pedidos set FechaRemision =  '+quotedstr(datetostr(dtpfecha.Date))+' where idpedido ='+inttostr(idPedido),1,dmaccesos.sqlgeneral);
 end
  else
 begin
  //busca en la tabla de RemiFact si ya existe una remicion de el pedido
  querys('select * from PagosClientes where idpedido='+inttostr(idPedido)+' and idremicion <>0',0,dmaccesos.sqlgeneral);
  if dmaccesos.sqlgeneral.RecordCount > 0 then
   begin
    remicion := dmaccesos.sqlgeneral.fieldbyname('idremicion').AsString;
    querys('update PagosClientes set idfactura='+quotedstr(ednumero.Text)+' where idpedido='+inttostr(idpedido),1,dmaccesos.sqlgeneral);
    querys('insert into RemiFact(idfactura,idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+quotedstr(ednumero.text)+','+remicion+','+inttostr(idPedido)+','+quotedstr(datetostr(dtpfecha.Date))+',"'+FormatDateTime('HH:mm:ss',HoraServidor)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,dmaccesos.sqlgeneral);
    querys('update pedidos set idfactura='+quotedstr(ednumero.text)+',FechaFactura='+quotedstr(datetostr(dtpfecha.Date))+' where idpedido= '+inttostr(idPedido),1,dmaccesos.sqlgeneral);
   end
  else begin
   querys('insert into RemiFact(idfactura,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+quotedstr(ednumero.text)+','+inttostr(idPedido)+','+quotedstr(datetostr(dtpfecha.Date))+',"'+FormatDateTime('HH:mm:ss',HoraServidor)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,dmaccesos.sqlgeneral);
   querys('update pedidos  set idfactura='+quotedstr(ednumero.text)+',FechaFactura='+quotedstr(datetostr(dtpfecha.Date))+' where idpedido= '+inttostr(idPedido),1,dmaccesos.sqlgeneral);
  end;

  //si la fecha de factura es menor que la fecha de remision , cambiar FechaRemision en pedidos:
  querys('Update pedidos set FechaRemision='+quotedstr(datetostr(dtpfecha.Date))+' Where idpedido = '+inttostr(idPedido)+' and FechaRemision > '+quotedstr(datetostr(dtpfecha.Date))+' ',1,dmaccesos.sqlgeneral);
  end;
//inserta la fecha de vencimiento en la tabla de pedidos
querys('update pedidos set FechaVencimiento='+quotedstr(datetostr(dtpvencimiento.Date))+' where idpedido='+inttostr(idPedido),1,dmaccesos.sqlgeneral);
//actualizar la fecha de creacion del pedido si fue facturado a un mes despues de la fecha de creacion
//querys('Update pedidos set FechaCreacion='+quotedstr(datetostr(dtpfecha.Date))+' Where idpedido = '+inttostr(idPedido)+' and (month(FechaCreacion)-month('+quotedstr(datetostr(dtpfecha.Date))+')) <> 0  ',1,dmaccesos.sqlgeneral);
querys('Update RemiFact rf, RemiFact rf2 set rf.ban = rf2.ban where rf.idpedido =rf2.idpedido  and rf.idpedido = '+inttostr(idPedido)+' and rf2.idfactura = 0', 1, dmaccesos.sqlgeneral);
close;
end;   }

procedure TfrmRemiFac.btnguardarClick(Sender: TObject);
var remicion, serie, folio :string; //factura,tipo,
begin
   if(dtpfecha.Date <= frmprincipal._fechaCierreMes ) then
   begin
      //if self.Tag=1 then
         if DerechosSys('Modifica Cierre') = false then
         begin
            application.MessageBox('La fecha afecta a un cierre anterior!. '+#13+'  solo un administrador puede realizar esta operación! '+#13+'Modifique la fecha por favor!','Aviso',mb_iconinformation+MB_OK);
            frmRemiFac.Tag:=2;
            close;
            exit;
         end
         else
            if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea continuar(YES) ó modifique la fecha(NO) ?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
               exit;
   end;
   if self.Tag = 0 then
   begin
        //inserta en RemiFact
        querys('insert into RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+ednumero.text+','+inttostr(idPedido)+','+quotedstr(datetostr(dtpfecha.Date))+',"'+FormatDateTime('HH:mm:ss',HoraServidor)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,dmaccesos.sqlgeneral);
        frmprincipal.ucprincipal.Log('Remiciono el pedido #'+inttostr(idPedido));
        querys('update pedidos set FechaRemision =  '+quotedstr(datetostr(dtpfecha.Date))+' where idpedido ='+inttostr(idPedido),1,dmaccesos.sqlgeneral);
   end
   else
   begin
        //busca en la tabla de RemiFact si ya existe una remicion de el pedido
        querys('select * from PagosClientes where idpedido='+inttostr(idPedido)+' and idremicion <>0',0,dmaccesos.sqlgeneral);
        if dmaccesos.sqlgeneral.RecordCount > 0 then
        begin
          if querys('select idfactura from RemiFact where idfactura="'+ednumero.text+'"',0,dmreportes.sqlgeneral)>0 then
          begin
            application.MessageBox('El Numero de Factura ya Existe!! Intenta Guardar de Nuevo','Aviso',MB_ICONWARNING);
            SeparaSerieFolio(ednumero.Text, serie, folio);
            {factura:=ednumero.Text;
            ednumero.text:=factura[1];
            delete(factura,1,1);    }
            ednumero.text:=serie+inttostr(strtoint(folio)+1);
            exit;
          end;
          remicion := dmaccesos.sqlgeneral.fieldbyname('idremicion').AsString;
          querys('update PagosClientes set idfactura='+quotedstr(ednumero.Text)+
          ' where idpedido='+inttostr(idpedido),1,dmaccesos.sqlgeneral);
          querys('insert into RemiFact(idfactura,idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta, tipo) values ('+
          quotedstr(ednumero.text)+','+remicion+','+inttostr(idPedido)+','+quotedstr(datetostr(dtpfecha.Date))+',"'+
          FormatDateTime('HH:mm:ss',HoraServidor)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+
          ', "'+tipofac+'")',1,dmaccesos.sqlgeneral);
          querys('update pedidos set idfactura='+quotedstr(ednumero.text)+',FechaFactura='+quotedstr(datetostr(dtpfecha.Date))+
          ' where idpedido= '+inttostr(idPedido),1,dmaccesos.sqlgeneral);
        end
        else
        begin
          if querys('select idfactura from RemiFact where idfactura="'+ednumero.text+'"',0,dmreportes.sqlgeneral)>0 then
          begin
            application.MessageBox('El Numero de Factura ya Existe!! Intenta Guardar de Nuevo','Aviso',MB_ICONWARNING);
            SeparaSerieFolio(ednumero.Text, serie, folio);
            {factura:=ednumero.Text;
            ednumero.text:=factura[1];
            delete(factura,1,1);    }
            ednumero.text:=serie+inttostr(strtoint(folio)+1);
            exit;
          end;
          querys('insert into RemiFact(idfactura,idpedido,FechaAlta,HoraAlta,UsuarioAlta, tipo) values ('+quotedstr(ednumero.text)+','+inttostr(idPedido)+','+quotedstr(datetostr(dtpfecha.Date))+',"'+FormatDateTime('HH:mm:ss',HoraServidor)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+', "'+tipofac+'")',1,dmaccesos.sqlgeneral);
          querys('update pedidos  set idfactura='+quotedstr(ednumero.text)+',FechaFactura='+quotedstr(datetostr(dtpfecha.Date))+' where idpedido= '+inttostr(idPedido),1,dmaccesos.sqlgeneral);
        end;
        //si la fecha de factura es menor que la fecha de remision , cambiar FechaRemision en pedidos:
        querys('Update pedidos set FechaRemision='+quotedstr(datetostr(dtpfecha.Date))+' Where idpedido = '+inttostr(idPedido)+' and FechaRemision > '+quotedstr(datetostr(dtpfecha.Date))+' ',1,dmaccesos.sqlgeneral);
   end;
   //inserta la fecha de vencimiento en la tabla de pedidos
   querys('update pedidos set FechaVencimiento='+quotedstr(datetostr(dtpvencimiento.Date))+' where idpedido='+inttostr(idPedido),1,dmaccesos.sqlgeneral);
   //actualizar la fecha de creacion del pedido si fue facturado a un mes despues de la fecha de creacion
   querys('Update RemiFact rf, RemiFact rf2 set rf.ban = rf2.ban where rf.idpedido =rf2.idpedido  and rf.idpedido = '+inttostr(idPedido)+' and rf2.idfactura = 0', 1, dmaccesos.sqlgeneral);
   close;
end;

procedure TfrmRemiFac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmRemiFac.FormShow(Sender: TObject);
begin
shortdateformat:='yyyy/mm/dd';
dtpfecha.Date := FechaServidor;
end;

end.
