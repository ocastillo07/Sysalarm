{///////////////////////////////////////////////////////////////////////////////
2010-04-21 Oscar insertar nota cancelacion cuando saldas un pedido
2010/04/09 Oscar campo para los motivos de bonificacion

////////////////////////////////////////////////////////////////////////////////
2009/06/05 dalyla inicializa remifac (#CFD #FE)
2008/07/01 oscar modifique el procedure de buscarpedidos agrege los recargos de morosos
2008/05/26 oscar modifique saldarporfactura agrege factura y fechafactura
2008/05/16 dalyla crear factura en 0
2008/05/16 oscar le modifique el tipo movimiento al insert de pagosclientes y
           que no pueda saldar las facturas 
2008/05/07 dalyla solo pedidos de monitoreo, e inicializa
2008/04/24 dalyla time zone ok
}///////////////////////////////////////////////////////////////////////////////
unit USaldarCortesias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp, RzButton, ComCtrls, StdCtrls,
  RzLabel, Mask, RzEdit, RzBtnEdt, RzCmboBx, DateUtils, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDCustomCheckListDlg,
  LMDCheckListDlg, RzRadChk;

type
  TfrmSaldarCortesias = class(TForm)
    btnSi: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    btnNo: TRzBitBtn;
    Label5: TLabel;
    cbotipopago: TRzComboBox;
    GroupBox1: TGroupBox;
    edclave: TRzButtonEdit;
    lblclave: TRzLabel;
    lsPedidos: TListView;
    RzLabel1: TRzLabel;
    lblNombre: TRzLabel;
    lbl5: TRzLabel;
    lblDomicilio: TRzLabel;
    btnfacturar: TRzBitBtn;
    gbFactura: TGroupBox;
    lsFactura: TListView;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzLabel2: TRzLabel;
    lblFactura: TRzLabel;
    RzLabel3: TRzLabel;
    lblFechaFactura: TRzLabel;
    RzLabel4: TRzLabel;
    lblFacturaNombre: TRzLabel;
    RzLabel5: TRzLabel;
    lblFacturaCuenta: TRzLabel;
    BorrarPed: TLMDCheckListDlg;
    chkredondear: TRzCheckBox;
    Label1: TLabel;
    mobservacion: TMemo;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveButtonClick(Sender: TObject);
    procedure btnSiClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure btnfacturarClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure chkredondearClick(Sender: TObject);
    procedure cbotipopagoSelect(Sender: TObject);
  private
     _factura,_fecha:string;
    procedure buscarlocate;
    procedure CargarPedidos;
    procedure CargarFacturaPago;
    procedure Buscarpedidos;
    procedure FacturaenCero;
     { Private declarations }
  public
    procedure inicializa(cuenta:string);
    { Public declarations }
  end;

var
  frmSaldarCortesias: TfrmSaldarCortesias;

implementation

uses Urecursos, Uprincipal, Udmrep, Ubusquedas, Udm, URemiFac, StrUtils;

{$R *.dfm}
procedure TfrmSaldarCortesias.Buscarpedidos;
var cadena:string;
begin
   with dmreportes do
   begin   //oscar
      cadena:=' select * from (select idpedido,concepto,p.saldo,(select idremicion from RemiFact as rf where rf.idpedido = p.idpedido limit 1) as remision, '+
      ' (select idpago from PagosClientes as pc where pc.idpedido=p.idpedido and movimiento =0 limit 1 ) as idpago'+
      ' from pedidos  p where p.idcliente ='+edclave.Text+' and p.estatus not in(0,1) and idunidadnegocio in(4,5) and saldado = 0 and anualidad = 0'+
      ' union all select idpedido,concepto,p.saldo,(select idremicion from RemiFact as rf where rf.idpedido = p.idpedido limit 1) as remision,'+
      ' (select idpago from PagosClientes as pc where pc.idpedido=p.idpedido and movimiento =0 limit 1 ) as idpago'+
      ' from pedidos  p left join clientes c using(idcliente) where p.idcliente ='+edclave.Text+' and p.estatus not in(0,1) '+
      ' and idunidadnegocio in(5) and saldado = 0 and anualidad = 0 and tipocont="MOR"';

      cadena:= cadena + ' union select idpedido,concepto,saldo,(select idremicion '+
              ' from RemiFact as rf where rf.idpedido = t.idpedido limit 1) as remision,'+
              ' idpago from (SELECT distinct if(pc.movimiento= 0,if(pc2.movimiento = 1, -1,0),1) as condicion, '+
              ' if(to_days(curtime()) -to_days(pc.FechaVence) > 0,to_days(curtime()) -to_days(pc.FechaVence),0) as dias,'+
              ' pc.idpago as idpago,pc.movimiento,p.concepto,'+
              ' pc.cargo,pc.restante as saldo,pc.idpedido,pc.idcliente '+
              ' from PagosClientes as pc left join  pedidos as p on (p.idpedido=pc.idpedido) '+
              ' left join PagosClientes as pc2 on (pc2.idpedido = pc.idpedido and pc2.movimiento = 1) '+
              ' where pc.idcliente ='+edclave.Text+' and p.estatus in(3,4,6) and pc.movimiento in(0,1) '+
              ' and pc.restante >0 and  pc.restante <= '+GetConfiguraciones('Redondeo',true)+'  having condicion >= 0 order by dias desc' +
              ') as t ) as query group by idpedido';

      if(querys(cadena,0,sqlgeneral2) >0 ) then
      begin
         querys('Select '+ClienteNombre('clientes')+' as nombre,concat(clientes.dir,'','',clientes.numero,'','','+
         ' clientes.ciudad,'','',clientes.estado) as Direccion From clientes where idcliente='+edclave.Text,0,sqlgeneral3);
         lblNombre.Caption := sqlgeneral3.fieldbyname('nombre').AsString;
         lblDomicilio.Caption := sqlgeneral3.fieldbyname('Direccion').AsString;
         CargarPedidos;
      end
      else
      begin
         Application.MessageBox('Esta cuenta tiene saldados todos los Pedidos!','Aviso',MB_OK);
         edclave.SetFocus;
      end;
   end;
end;

procedure TfrmSaldarCortesias.CargarPedidos;
var
newitem :TListItem;
//_saldo:Double;
begin
_factura := '';
//_saldo := 0;
lsPedidos.Items.Clear;

with dmreportes do
 begin
while not sqlgeneral2.Eof do
 begin
  newitem := nil;
  newitem := lsPedidos.Items.Add;
  newitem.Caption :=  sqlgeneral2.fieldbyname('idpedido').AsString;
  newitem.ImageIndex := 0;
  newitem.SubItems.Add(sqlgeneral2.fieldbyname('concepto').AsString);
  //  newitem.SubItems.Add(CurrToStrF(sqlgeneral2.fieldbyname('totmn').AsFloat,ffCurrency, 2));
  newitem.SubItems.Add(sqlgeneral2.fieldbyname('saldo').AsSTRING);
  newitem.SubItems.Add(sqlgeneral2.fieldbyname('remision').asstring);
  newitem.SubItems.Add(sqlgeneral2.fieldbyname('idpago').asstring);

  sqlgeneral2.Next;
 end;
      lsPedidos.Items.Item[0].Selected := true;
      lsPedidos.setfocus;
      if(lsPedidos.Items.Count > 0) then
        btnfacturar.Enabled := true
      else
        btnfacturar.Enabled := false;

 end;

end;


procedure TfrmSaldarCortesias.buscarlocate;
begin

       frmbusquedas.query:='Select clientes.idcliente,'+ClienteNombre('clientes')+' as nombre,case 1 when clientes.estatus=0  then ''Inactivo'' when estatus=1 then ''Activo'' when clientes.estatus=2 then ''Por Revisar'' when '+
                           ' clientes.estatus=3 then ''Cortesia'' when clientes.estatus=4 then ''Moroso'' when clientes.estatus=5 then  ''Cancelado'' when clientes.estatus = 6 then ''Libre'' end as Estatus,clientes.bloqueado as Bloqueado,clientes.TipoCont,'+
                           ' concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','',clientes.estado) as Direccion,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on '+
                           ' clientes.idfact = ClientesFact.idfact group by idcliente  order by idcliente';
                           frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
          begin
                  edclave.text := frmbusquedas.resultado;
                  Buscarpedidos;
          end;

end;



procedure TfrmSaldarCortesias.btnCancelarClick(Sender: TObject);
begin
lsPedidos.Items.Clear;
lblNombre.Caption := '';
lblDomicilio.Caption := '';
edclave.SetFocus;
gbFactura.Visible := false;
_factura := '';

end;

procedure TfrmSaldarCortesias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmSaldarCortesias.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key,true);
  if key=#13 then
   begin
    key:=#0;
    if edclave.Text <> '' then
     Buscarpedidos
    else
     edclave.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure TfrmSaldarCortesias.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
    buscarlocate;
end;

procedure TfrmSaldarCortesias.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure TfrmSaldarCortesias.btnSiClick(Sender: TObject);
var saldo:string;
begin
  if(edclave.Text <> '' ) then
  begin
    saldo:= AnsiReplaceStr(lsPedidos.Selected.SubItems[1],'$','');
    if(lsPedidos.Items.Count > 0) then
    begin
      if(lsPedidos.Selected <> nil ) then
      begin
        if (mobservacion.Text<>'')then
        begin
          if(chkredondear.Checked=false)then
          begin
            if querys('select estatus from pedidos where estatus<>4 and idpedido='+
             lsPedidos.Selected.Caption,0,dmreportes.sqlgeneral8)>0 then
            begin
              //saldar pedido, registrar asiento.
              // lsPedidos.Items[lsPedidos.Selected.Index].Caption;
              querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
              'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
              'values("P","","","'+cbotipopago.Value+'",'+GetConfiguraciones('tipocambio',true)+','+lsPedidos.Selected.SubItems[3] +','+
              ''+edclave.Text+' ,'+lsPedidos.Selected.Caption +','+saldo +','+
              '"",'+ lsPedidos.Selected.SubItems[2]+',11,"'+frmprincipal.ucprincipal.CurrentUser.loginname+'",CURDATE(),'+
              'CURDATE() ,CURTIME(),CURDATE(),11,"'+'ABONO POR ' +cbotipopago.Text +'" )',1,dmreportes.sqlgeneral3);

              querys('UPDATE pedidos set saldado =1, saldo = 0, estatus = 5 where idpedido='+
                   lsPedidos.Selected.Caption,1,dmreportes.sqlgeneral3);
              querys('UPDATE PagosClientes set restante =0 where idpedido='+
                  lsPedidos.Selected.Caption+' AND movimiento in(0,1)',1,dmreportes.sqlgeneral3);

              //insertar el motivo de la cancelacion
              querys('select idnota from clientes where idcliente='+edclave.text,0,dmreportes.sqlgeneral3);
              if(dmreportes.sqlgeneral3.fieldbyname('idnota').AsInteger > 0) then
                  querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
                  dmreportes.sqlgeneral3.fieldbyname('idnota').AsString+',"BONIFICACIONES","'+cbotipopago.Text+' '+AnsiUpperCase(mobservacion.Text)+
                  ' COMENTADO POR '+frmprincipal.ucprincipal.CurrentUser.LoginName+' DE '+frmprincipal.AreaUsuario+' CON EL PUESTO '+
                   frmprincipal.PuestoUsuario+' EL '+datetostr(FechaServidor)+' A LAS '+timetostr(HoraServidor)+
                  '",0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',CURTIME(),CURDATE(),"NC REMISIONES",'+lsPedidos.Selected.Caption+')',1,DMREPORTES.sqlgeneral4)
              else
              begin
                if(querys('select max(idnota)+1 as id from notas',0,DMREPORTES.sqlgeneral3) >0) then
                    querys('update clientes set idnota='+dmreportes.sqlgeneral3.fieldbyname('id').AsString+' where idcliente='+edclave.Text,1,dmreportes.sqlgeneral3);
                    querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
                    dmreportes.sqlgeneral3.fieldbyname('id').AsString+',"BONIFICACIONES","'+cbotipopago.Text+' '+AnsiUpperCase(mobservacion.Text)+
                    ' COMENTADO POR '+frmprincipal.ucprincipal.CurrentUser.LoginName+' DE '+frmprincipal.AreaUsuario+' CON EL PUESTO '+
                   frmprincipal.PuestoUsuario+' EL '+datetostr(FechaServidor)+' A LAS '+timetostr(HoraServidor)+
                    '",0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',CURTIME(),CURDATE(),"NC REMISIONES",'+lsPedidos.Selected.Caption+')',1,DMREPORTES.sqlgeneral4)
              end;

              frmprincipal.ucprincipal.Log('Saldo el pedido : '+lsPedidos.Selected.Caption+' como '+lsPedidos.Selected.SubItems[3] ,0);
              if application.MessageBox('Desea crear una factura en 0 por este pedido?', 'Atencion', MB_ICONINFORMATION+MB_YESNO) = idyes then
                FacturaenCero;

               // frmprincipal.log
              bpcambios('clientes', edclave.Text, 'idcliente');
              querys('update clientes c, ( select sum(saldo) as saldo, idcliente ' +
                  'from ( select if(p.estatus=1,0,p.Saldo) as Saldo, idcliente  from pedidos as p '+
                  'where p.idcliente ='+edclave.Text+' group by p.idpedido ) as tbl group by idcliente) as f '+
                  'set c.saldo = f.saldo where c.idcliente=f.idcliente', 1, dmreportes.sqlgeneral3);
              apcambios('idcliente', edclave.Text, 'clientes', 'frmSaldarCortesias');
              btnCancelar.OnClick(self);
              Buscarpedidos;
            end;
          end
          else  //////////////redondear///////////////
          begin
            querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
              'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
              'values("P","","","'+cbotipopago.Value+'",'+GetConfiguraciones('tipocambio',true)+','+lsPedidos.Selected.SubItems[3] +','+
              ''+edclave.Text+' ,'+lsPedidos.Selected.Caption +','+saldo+' ,'+
              '"","",11,"'+frmprincipal.ucprincipal.CurrentUser.loginname+'",CURDATE(),'+
              'CURDATE() ,CURTIME(),CURDATE(),11,"'+'ABONO POR ' +cbotipopago.Text +'" )',1,dmreportes.sqlgeneral3);

            //querys('UPDATE pedidos set saldado =1, saldo = 0 where idpedido='+lsPedidos.Selected.Caption,1,dmreportes.sqlgeneral3);
            querys('UPDATE PagosClientes set restante =0 where idpago='+lsPedidos.Selected.SubItems[3],1,dmreportes.sqlgeneral3);
            querys('UPDATE PagosClientes set restante =if(round(restante-'+saldo+',2)<0,0,round(restante-'+saldo+',2)) where idpedido='+
                  lsPedidos.Selected.Caption+' AND movimiento in(0)',1,dmreportes.sqlgeneral3);
            querys('select if(saldo-'+saldo+'<0 or saldo-'+saldo+'=0,1,0) as saldo '+
                  ' from pedidos where idpedido='+lsPedidos.Selected.Caption,0,dmreportes.sqlgeneral3);
            querys('update pedidos set saldo=saldo-'+saldo+',saldado='+
                  dmreportes.sqlgeneral3.fieldbyname('saldo').AsString+' where idpedido='+
                  lsPedidos.Selected.Caption,1,dmreportes.sqlgeneral3);
            { //insertar el motivo de la cancelacion
            querys('INSERT INTO pedidosaldoscancelados (idpedido,tipopago,observacion,usuario,fecha,hora) values '+
                 lsPedidos.Selected.Caption+',"'+cbotipopago.Value+'","'+mobservacion.Text+'","'+
                 frmprincipal.ucprincipal.CurrentUser.loginname+'",CURDATE(),CURTIME())',1,DMREPORTES.sqlgeneral4);
            }

            //insertar el motivo de la cancelacion
            querys('select idnota from clientes where idcliente='+edclave.text,0,dmreportes.sqlgeneral3);
            if(dmreportes.sqlgeneral3.fieldbyname('idnota').AsInteger > 0) then
                  querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
                  dmreportes.sqlgeneral3.fieldbyname('idnota').AsString+',"BONIFICACIONES","'+cbotipopago.Text+' '+AnsiUpperCase(mobservacion.Text)+
                  ' COMENTADO POR '+frmprincipal.ucprincipal.CurrentUser.LoginName+' DE '+frmprincipal.AreaUsuario+' CON EL PUESTO '+
                   frmprincipal.PuestoUsuario+' EL '+datetostr(FechaServidor)+' A LAS '+timetostr(HoraServidor)+
                  '",0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',CURTIME(),CURDATE(),"NC REMISIONES",'+lsPedidos.Selected.Caption+')',1,DMREPORTES.sqlgeneral4)
            else
            begin
                if(querys('select max(idnota)+1 as id from notas',0,DMREPORTES.sqlgeneral3) >0) then
                    querys('update clientes set idnota='+dmreportes.sqlgeneral3.fieldbyname('id').AsString+' where idcliente='+edclave.Text,1,dmreportes.sqlgeneral3);
                    querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
                    dmreportes.sqlgeneral3.fieldbyname('id').AsString+',"BONIFICACIONES","'+cbotipopago.Text+' '+AnsiUpperCase(mobservacion.Text)+
                    ' COMENTADO POR '+frmprincipal.ucprincipal.CurrentUser.LoginName+' DE '+frmprincipal.AreaUsuario+' CON EL PUESTO '+
                   frmprincipal.PuestoUsuario+' EL '+datetostr(FechaServidor)+' A LAS '+timetostr(HoraServidor)+
                    '",0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',CURTIME(),CURDATE(),"NC REMISIONES",'+lsPedidos.Selected.Caption+')',1,DMREPORTES.sqlgeneral4)
            end;
            frmprincipal.ucprincipal.Log('Saldo el pedido : '+lsPedidos.Selected.Caption+' como '+lsPedidos.Selected.SubItems[3] ,0);

            bpcambios('clientes', edclave.Text, 'idcliente');
            querys('update clientes c, ( select sum(saldo) as saldo, idcliente ' +
                  'from ( select if(p.estatus=1,0,p.Saldo) as Saldo, idcliente  from pedidos as p '+
                  'where p.idcliente ='+edclave.Text+' group by p.idpedido ) as tbl group by idcliente) as f '+
                  'set c.saldo = f.saldo where c.idcliente=f.idcliente', 1, dmreportes.sqlgeneral3);
            apcambios('idcliente', edclave.Text, 'clientes', 'frmSaldarCortesias');
            btnCancelar.OnClick(self);
            Buscarpedidos;
          end;
          mobservacion.Clear();
          Application.MessageBox('Aplicación realizada','Aviso',MB_OK);
        end
        else
        begin
          Application.MessageBox('Favor de Poner el Comentario del Motivo','Aviso',MB_OK);
        end;
      end
      else
      begin
          Application.MessageBox('No ha seleccionado el pedido','Aviso',MB_OK);
          lsPedidos.Items.Item[0].Selected := true;
          lsPedidos.setfocus;
      end;
    end
    else
    begin
       Application.MessageBox('No hay pedidos a saldar','Aviso',MB_OK);
       edclave.SetFocus;
    end;
  end
  else
  begin
     Application.MessageBox('Falta la clave','Aviso',MB_OK);
     edclave.SetFocus;
  end;
end;

procedure TfrmSaldarCortesias.btnNoClick(Sender: TObject);
begin
close;
end;

procedure TfrmSaldarCortesias.FormShow(Sender: TObject);
begin
CargaCombo2('Select iniciales, nombre from TiposPagos where tipo=3','nombre','iniciales', cbotipopago);
cbotipopago.Enabled:=true;
cbotipopago.ItemIndex := 0;
edclave.SetFocus;

end;

procedure TfrmSaldarCortesias.edclaveChange(Sender: TObject);
begin
lsPedidos.Items.Clear;
lblNombre.Caption := '';
lblDomicilio.Caption := '';
end;

procedure TfrmSaldarCortesias.btnfacturarClick(Sender: TObject);
begin
_factura := '';
      if inputquery('Confirmación','Indique la factura con la que se va a saldar : ',_factura) = true then
        begin
         _factura := UpperCase(_factura);
         querys('select p.idpedido,p.concepto,p.TotMn,pc.TipoPago,pc.FechaAlta,pc.idPago,p.idcliente,p.FechaFactura from PagosClientes as pc inner join pedidos as p on(p.idpedido = pc.idpedido) '+
                ' where p.idfactura = "'+_factura+'" and movimiento in (0,2,8,10) and abono > 0 and p.estatus in (4,6) limit 1' ,0,dmreportes.sqlgeneral4);
              if dmreportes.sqlgeneral4.RecordCount = 0 then
                begin
                  application.MessageBox('La factura que ingreso no existe o se encuentra cancelada verifique primero!','Aviso',mb_iconinformation);
                  _factura := '';
                end
                 else
                begin                           // replace("'+lsPedidos.Selected.SubItems[1] +'","$","")
                    if(DMREPORTES.sqlgeneral4.FieldByName('TotMn').AsFloat >=  strtofloat(StringReplace(lsPedidos.Selected.SubItems[1],'$', '',[rfReplaceAll, rfIgnoreCase]))) then
                        CargarFacturaPago
                    else
                      begin
                         application.MessageBox('El total de la factura que ingreso no es mayor que la de la remision!','Aviso',mb_iconinformation);
                         _factura := '';
                      end;

                end;

        end
          else
            _factura := '';


end;



procedure TfrmSaldarCortesias.CargarFacturaPago;
var
newitem :TListItem;
//_saldo:Double;
begin
//_saldo := 0;
lsFactura.Items.Clear;

with dmreportes do
 begin
    while not sqlgeneral4.Eof do
       begin
            newitem := nil;
            newitem := lsFactura.Items.Add;
            newitem.Caption := sqlgeneral4.fieldbyname('idpedido').AsString;
            newitem.ImageIndex := 0;
            newitem.SubItems.Add(sqlgeneral4.fieldbyname('concepto').AsString);
            newitem.SubItems.Add(CurrToStrF(sqlgeneral4.fieldbyname('totmn').AsFloat,ffCurrency, 2));
            newitem.SubItems.Add(sqlgeneral4.fieldbyname('TipoPago').asstring);
            newitem.SubItems.Add(sqlgeneral4.fieldbyname('FechaAlta').asstring);
            newitem.SubItems.Add(sqlgeneral4.fieldbyname('idpago').asstring);

            lblFechaFactura.Caption :=  sqlgeneral4.fieldbyname('FechaFactura').asstring;
            lblFacturaCuenta.Caption := sqlgeneral4.fieldbyname('idcliente').asstring;

            sqlgeneral4.Next;
       end;
          lblFactura.Caption := _factura;
          gbFactura.Visible := true;
          lsFactura.Items.Item[0].Selected := true;
          lsFactura.setfocus;
 end;

end;




procedure TfrmSaldarCortesias.RzBitBtn2Click(Sender: TObject);
begin
lsFactura.Items.Clear;
_factura := '';
gbFactura.Visible := false;
end;

procedure TfrmSaldarCortesias.RzBitBtn1Click(Sender: TObject);
//var idpedido:string;
begin

if(edclave.Text <> '' ) then
begin
 if(lsPedidos.Items.Count > 0) then
   begin
         if(lsPedidos.Selected <> nil ) then
         begin
            querys('select fechaalta from RemiFact where idfactura="'+_factura+'"',0,dmreportes.sqlgeneral3);
            _fecha:=dmreportes.sqlgeneral3.fieldbyname('fechaalta').asstring;
              //saldar pedido, registrar asiento.
              // lsPedidos.Items[lsPedidos.Selected.Index].Caption;
            querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
                   'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
                   'select moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,'+edclave.Text+','+
                   ' '+lsPedidos.Selected.Caption +',replace("'+lsPedidos.Selected.SubItems[1] +'","$",""),"'+_factura+'",'+ lsPedidos.Selected.SubItems[2]+',2,"'+frmprincipal.ucprincipal.CurrentUser.loginname+'",FechaVence,CURDATE(),CURTIME(),FechaAlta,TipoCobro,"'+'ABONO POR Factura PAGADA' + _factura +'" '+
                   ' from PagosClientes  where idpago = '+lsFactura.Selected.SubItems[4],1,dmreportes.sqlgeneral3);

            querys('UPDATE pedidos set estatus = 6 where idfactura = "'+_factura+'" and estatus = 4' , 1,dmreportes.sqlgeneral3);
            querys('UPDATE pedidos set saldado =1, saldo = 0, estatus = 5, idfactura="'+_factura+'", fechafactura="'+_fecha+'" where idpedido='+lsPedidos.Selected.Caption,1,dmreportes.sqlgeneral3);
            querys('UPDATE PagosClientes set restante =0 where idpedido='+lsPedidos.Selected.Caption+' AND movimiento in(0,1)',1,dmreportes.sqlgeneral3);

            frmprincipal.ucprincipal.Log('Saldo el pedido : '+lsPedidos.Selected.Caption+' como '+lsPedidos.Selected.SubItems[3] ,0);
            btnCancelar.OnClick(self);
            Buscarpedidos;
                  bpcambios('clientes', edclave.Text, 'idcliente');
            querys('update clientes c, ( select sum(saldo) as saldo, idcliente from ( select if(p.estatus=1,0,p.Saldo) as Saldo, idcliente  from pedidos as p '+
                   'where p.idcliente ='+edclave.Text+' group by p.idpedido ) as tbl group by idcliente ) as f set c.saldo = f.saldo where c.idcliente=f.idcliente', 1, dmreportes.sqlgeneral3);
            apcambios('idcliente', edclave.Text, 'clientes', 'frmSaldarCortesias');
            Application.MessageBox('Aplicación realizada','Aviso',MB_OK);
             
          end else
          begin
               Application.MessageBox('No ha seleccionado el pedido','Aviso',MB_OK);
               lsPedidos.Items.Item[0].Selected := true;
               lsPedidos.setfocus;
          end;
   end
     else
   begin
       Application.MessageBox('No hay pedidos a saldar','Aviso',MB_OK);
       edclave.SetFocus;

   end;
end
 else
 begin
     Application.MessageBox('Falta la clave','Aviso',MB_OK);
     edclave.SetFocus;
 end;
end;

procedure TfrmSaldarCortesias.inicializa(cuenta:string);
begin
edclave.Text := cuenta;
Buscarpedidos;
end;

procedure TfrmSaldarCortesias.FacturaenCero;
var pedido, idremision, idfactura, fact:string;
cont:integer;
begin
//CREA EL PEDIDO EN 0
querys('Select max(idpedido) as pedido from pedidos', 0, dmaccesos.sqlgeneral);
pedido := inttostr(dmaccesos.sqlgeneral.fieldbyname('pedido').asinteger+1);
querys('INSERT INTO pedidos (idpedido,idcliente,usuario,fecha,hora,idorigen,idvendedor,FechaCreacion,'+
       'SubTotal,Iva,TotMn,Saldo,saldado,TotDlls,concepto,'+
       'FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio,observaciones,estatus,anualidad,ban) '+
       'Select '+pedido+',idcliente,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", '+
       '"'+datetostr(date)+'","'+timetostr(time)+'",idorigen,idvendedor,"'+datetostr(date)+'",0,0,0,'+
       '0,1,0,concepto,FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio,'+
       '"FACTURA EN CERO POR PEDIDO '+lsPedidos.Selected.Caption+'",0,0,9 from pedidos where idpedido = '+
       lsPedidos.Selected.Caption,1,dmaccesos.sqlgeneral);

querys('INSERT INTO DetPedido (idpedido,cant,cod_cve,surtido,costo,tc,utilidad,ban) '+
       ' select '+pedido+',cant,cod_cve,surtido,0,tc,utilidad,9 '+
       'from DetPedido where idpedido = '+lsPedidos.Selected.Caption,1,dmaccesos.sqlgeneral);

//CREA LA REMISION
querys('select idremicion from folios',0,dmaccesos.sqlgeneral);
idremision:=inttostr(dmaccesos.sqlgeneral.fieldbyname('idremicion').AsInteger+1);
querys('insert into RemiFact (idremicion,idpedido,idfactura,FechaAlta,HoraAlta,UsuarioAlta,ban) values( '+
          idremision+','+pedido+' ,"0","'+datetostr(date)+'","'+timetostr(time)+'","'+
          frmprincipal.ucprincipal.CurrentUser.LoginName+'",9 ) ',1,dmaccesos.sqlgeneral);
querys('update folios set idremicion='+idremision,1,dmaccesos.sqlgeneral);

querys('insert into PagosClientes (movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence, '+
       'usuario,fecha,hora,restante,abono,ban,TipoPago) '+
       'select 0,idcliente,'+pedido+','+idremision+', "'+datetostr(date)+'",0,FechaVence, '+
       '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+datetostr(date)+'","'+timetostr(time)+'",0, '+
       '0,9,"" from PagosClientes where idpedido = '+lsPedidos.Selected.Caption+
       ' and movimiento = 0',1,dmaccesos.sqlgeneral);

//CREA FACTURACION
//Verifica porque puede facturar
querys('select FacturaP,FacturaD,FacturaC from usuarios where idusuario = '+
       inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,dmaccesos.sqlgeneral);

cont := 0;
if dmaccesos.sqlgeneral.Fields.Fields[0].Asboolean then
  begin
  inc(cont);
  fact := 'FacturaP';
  end;

if dmaccesos.sqlgeneral.Fields.Fields[1].Asboolean then
  begin
  inc(cont);
  fact := 'FacturaD';
  end;

if dmaccesos.sqlgeneral.Fields.Fields[2].Asboolean then
  begin
  inc(cont);
  fact := 'FacturaC';
  end;

//SELECCIONA EL TIPO DE FACTURA
if cont > 1 then
  begin
  BorrarPed.CaptionTitle := 'Seleccion de Tipo de Folio';
  BorrarPed.Prompt := 'Cual Folio desea utilizar?';
  BorrarPed.Items.Clear;
  if dmaccesos.sqlgeneral.Fields.Fields[0].Asboolean then
    BorrarPed.Items.Add('FacturaP');
  if dmaccesos.sqlgeneral.Fields.Fields[1].Asboolean then
    BorrarPed.Items.Add('FacturaD');
  if dmaccesos.sqlgeneral.Fields.Fields[2].Asboolean then
    BorrarPed.Items.Add('FacturaC');

  repeat
  if BorrarPed.Execute then
    begin
    //trae el maximo numero de factura
    querys('select '+BorrarPed.Items.Strings[borrarped.value]+' from folios',0,dmaccesos.sqlgeneral);
    idfactura:=BorrarPed.Items.Strings[borrarped.value][8]+inttostr(dmaccesos.sqlgeneral.fieldbyname(BorrarPed.Items.Strings[borrarped.value]).AsInteger+1);
    fact := BorrarPed.Items.Strings[borrarped.value];
    end
  else
    begin
    application.MessageBox(pchar('Cancelo la facturacion del pedido #'+Pedido),'Aviso',mb_iconinformation);
    exit;
    end;
  until application.MessageBox('Esta seguro de lo que selecciono?','Pregunta',mb_yesno+mb_iconquestion) = idyes;
  end
else
  begin
  if (dmaccesos.sqlgeneral.Fields.Fields[0].Asboolean = false) and (dmaccesos.sqlgeneral.Fields.Fields[1].Asboolean = false) and (dmaccesos.sqlgeneral.Fields.Fields[2].Asboolean= false) then
     begin
     application.messagebox('Usted NO tiene Derechos para Facturar', 'Atencion', MB_ICONSTOP);
     exit;
     end;
     //trae el maximo numero de factura
  querys('select '+fact+' from folios',0,dmaccesos.sqlgeneral);
  idfactura:=fact[8]+inttostr(dmaccesos.sqlgeneral.fieldbyname(fact).AsInteger+1);
  end;

Application.CreateForm(TfrmRemiFac, frmRemiFac);
frmremifac.inicializa(false, true, strtoint(pedido),idfactura, 'N');
frmremifac.ShowModal;

querys('select sum(restante) as saldo from PagosClientes where idpedido='+pedido+' and movimiento in(0,1,4,10) ',0,dmaccesos.sqlgeneral);
querys('Update pedidos set estatus=6,saldo=0,FechaCierre="'+datetostr(date)+'"  where idpedido='+pedido,1,dmaccesos.sqlgeneral);
delete(idfactura,1,1);
querys('update folios set '+fact+'='+idfactura,1,dmaccesos.sqlgeneral);

end;

procedure TfrmSaldarCortesias.chkredondearClick(Sender: TObject);
begin
  if(chkredondear.Checked)then
  begin
    cbotipopago.ItemIndex:=9;
    cbotipopago.Enabled:=false;
    mobservacion.Text:= 'Redondeo';
  end
  else
  begin
    cbotipopago.ItemIndex:=0;
    cbotipopago.Enabled:=true;
    mobservacion.Clear();
  end;
end;

procedure TfrmSaldarCortesias.cbotipopagoSelect(Sender: TObject);
begin
  if(cbotipopago.ItemIndex=9)then
  begin
    chkredondear.Checked:=true;
    mobservacion.Text:= 'Redondeo';
  end;
end;

End.
