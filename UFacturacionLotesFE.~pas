{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
}///////////////////////////////////////////////////////////////////////////////
unit UFacturacionLotesFE;

interface

uses
  Windows, Messages,RpRave, RpDefine, SysUtils,strutils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, RzPanel, RzRadGrp, StdCtrls,
  Mask, RzEdit, RzLabel, RzButton, DB, MemDS, DBAccess, MyAccess, Grids,
  DBGrids, RzBtnEdt, RzRadChk, RzGroupBar, RzCmboBx, Printers;

type
  TfrmFacturacionLotesFE = class(TForm)
    btnfacturar: TRzBitBtn;
    sqltemp: TMyQuery;
    SqlGeneral: TMyQuery;
    sqlpedidos: TMyQuery;
    lblregistros: TRzLabel;
    btnsalir: TRzBitBtn;
    DBGrid1: TDBGrid;
    dspedidos: TDataSource;
    btnconsultar: TRzBitBtn;
    RzGroupBar1: TRzGroupBar;
    GMetodo: TRzGroup;
    rbventas: TRzRadioButton;
    rbfechas: TRzRadioButton;
    Gfechas: TRzGroup;
    RzLabel1: TRzLabel;
    dtphasta: TRzDateTimeEdit;
    dtpdesde: TRzDateTimeEdit;
    RzLabel5: TRzLabel;
    Gventas: TRzGroup;
    edVdesde: TRzButtonEdit;
    edVHasta: TRzButtonEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    Gfact: TRzGroup;
    dtpFecFact: TRzDateTimeEdit;
    cbprinters: TRzComboBox;
    cbosector: TRzComboBox;
    RzLabel2: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnfacturarClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure btnconsultarClick(Sender: TObject);
    procedure sqlpedidosAfterOpen(DataSet: TDataSet);
    procedure sqlpedidosAfterClose(DataSet: TDataSet);
    procedure edVdesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edVdesdeButtonClick(Sender: TObject);
    procedure rbventasClick(Sender: TObject);
    procedure rbfechasClick(Sender: TObject);
    procedure edVdesdeChange(Sender: TObject);
    procedure rbsectorClick(Sender: TObject);
    procedure cbosectorNotInList(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFacturacionLotesFE: TfrmFacturacionLotesFE;

implementation

uses Urecursos, Uprincipal, Udm, Udmrep, Umensaje, Ubusquedas;

{$R *.dfm}

procedure TfrmFacturacionLotesFE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmFacturacionLotesFE.FormShow(Sender: TObject);
var c:integer;
begin
shortdateformat:='yyyy/mm/dd';
dtpdesde.Date := FechaServidor;
dtphasta.Date := FechaServidor;
dtpFecFact.Date := FechaServidor;
for c:=0 to printer.Printers.Count - 1 do
cbprinters.Items.Add(printer.Printers.Strings[c]);
CargaCombo('select nombre from sectores order by nombre','Sectores',cbosector);
cbosector.Items.Add('TODOS');
cbosector.Text := 'TODOS';
end;

procedure TfrmFacturacionLotesFE.btnfacturarClick(Sender: TObject);
var pzsxunidad,pzs,cant,idmovi:integer;     total,tc,ant,tot:double;
    cod_cve,idfactura,_facturaDefault, folio,  fol1, fol2 : string;  //  deducible,      dec,
    year,dia,mes:word;    sqlaux : tmyquery;    memo:tmemo;
begin
//validar cierre
if(dtpFecFact.Date <= frmprincipal._fechaCierreMes ) then
 begin
 if DerechosSys('Modifica Cierre')= false then
   begin
   application.MessageBox('La fecha afecta a un cierre anterior!. '+#13+'  solo un administrador puede realizar esta operación! '+#13+'Modifique la fecha por favor!','Aviso',mb_iconinformation);
   exit;
   end
 else
   begin
   if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea continuar(YES) ó modifique la fecha(NO) ?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
     begin
     dtpFecFact.Date := now;
     exit;
     end;
   end;
 end;


//querys('Select valor From configuraciones where concepto="FacturaDefault" ',0,sqltemp);
querys('Select letras From FoliosFE fe left join puestos p on p.idpuesto=fe.idproc left join areas a on '+
       'a.idarea=p.idarea where fe.procedencia = "PUESTO" and p.nombre = "GERENTE" and a.nombre = "COBRANZA"',0,sqltemp);
if sqltemp.RecordCount > 0 then
  _facturaDefault := sqltemp.Fields.Fields[0].AsString
else
  begin
  if application.MessageBox(pchar('No hay Factura Default en el sistema!, se imprimira con Factura GC , '+#13+' desea continuar(YES)?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
    exit;
  _facturaDefault := 'GC';// SI NO EXISTE POR DEFAULT.
  end;

memo := tmemo.Create(nil);
memo.Parent := self;
memo.visible := false;

sqlaux := tmyquery.Create(self);
sqlaux.Connection := dmaccesos.conexion;
if sqlpedidos.RecordCount > 0 then
 begin
if gfechas.Opened then
 frmprincipal.ucprincipal.Log('Genero el Proceso de Facturación por lotes de la fecha '+dtpdesde.Text+' a '+dtphasta.Text+' '+inttostr(sqlpedidos.RecordCount)+' Ventas Encontradas',1)
else
 frmprincipal.ucprincipal.Log('Genero el Proceso de Facturación por lotes de la venta '+edvdesde.Text+' a '+edvhasta.Text+' '+inttostr(sqlpedidos.RecordCount)+' Ventas Encontradas',1);
 lblregistros.Visible := true;
 lblregistros.Caption := 'Registros encontrados: '+inttostr(sqlpedidos.RecordCount-1);
  sqlpedidos.First;
 while not sqlpedidos.Eof do
  begin
  if sqlpedidos.FieldByName('estatus').AsInteger = 0 then
   begin
    //trae los articulos a remicionar
    querys('SELECT DetPedido.cant,DetPedido.piezas,DetPedido.cod_cve,articulos.piezasxunidad,articulos.paquete,articulos.servicio, idunidadnegocio '+
           'FROM DetPedido INNER JOIN articulos ON (DetPedido.cod_cve = articulos.cod_cve) left join pedidos as p on p.=idpedido=dp.idpedido '+
           'WHERE DetPedido.idpedido = '+sqlpedidos.fieldbyname('idpedido').AsString,0,sqlgeneral);
    sqlgeneral.First;
    while not sqlgeneral.Eof do
     begin
      pzsxunidad:=sqlgeneral.FieldByName('piezasxunidad').AsInteger;
      pzs:=sqlgeneral.FieldByName('piezas').AsInteger;
      cant:=sqlgeneral.FieldByName('cant').AsInteger;
      cod_cve:=sqlgeneral.FieldByName('cod_cve').Asstring;
      if (sqlgeneral.FieldByName('paquete').AsInteger = 0) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
       begin
        //trae el idmovi donde el nombre sea = pedido
        querys('select idmovi from TipoMov where nombre='+Quotedstr('PEDIDOS'),0,sqltemp);
        idmovi:=sqltemp.fieldbyname('idmovi').AsInteger;
        //resta lo que se aparto de este articulo de la columna apartado
        querys('update articulos set apartado=apartado-('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve)+' and inventariable = 1',1,sqltemp);
        ////lo que se aparto se pasa a instalacion
        if querys('select instalacion from UnidadNegocio where idunidadnegocio="'+sqlgeneral.FieldByName('idunidadnegocio').AsString+'" and instalacion = 1',0,sqltemp) > 0 then
          begin
          querys('update articulos set instalacion=instalacion+('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve)+' and inventariable = 1',1,sqltemp);
          //actualiza los detalles del pedido diciendo que y ase surtio el art
          querys('update DetPedido set surtido=1, estatus=2 where idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,1,sqltemp);
          end
        else
          querys('update DetPedido set surtido=1, estatus=3 where idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,1,sqltemp);
        //Registra la salida del articulo en CardexArt
        querys('insert into CardexArt(cod_cve,idmovi,movimiento,FechaMov,iddoc,cant,piezas,usuario,HoraMov) values ('+quotedstr(cod_cve)+','+inttostr(idmovi)+',''S'','+quotedstr(datetostr(FechaServidor))+','+sqlpedidos.fieldbyname('idpedido').AsString+','+inttostr(cant)+','+inttostr(pzs)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(timetostr(HoraServidor))+')',1,sqltemp);
        //actualiza el campo ultima venta del articulo
        querys('update articulos set ultima_venta='+quotedstr(datetostr(date))+' where cod_cve='+quotedstr(cod_cve)+' and inventariable = 1',1,sqltemp);
       end;
      sqlgeneral.Next;
     end; //end del while
   end; //end del if de estatus = 0
  querys('select TotDlls,TipoCambio,Anticipo,TotMn,FechaCreacion from pedidos where idpedido ='+sqlpedidos.fieldbyname('idpedido').AsString,0,sqlaux);
  total := sqlaux.fieldbyname('TotDlls').Asfloat;
  tc := sqlaux.fieldbyname('TipoCambio').Asfloat;
  ant := sqlaux.fieldbyname('anticipo').Asfloat;
  tot :=  sqlaux.fieldbyname('TotDlls').Asfloat;
  tot := (tc*tot)-ant;

 //querys('select Factura'+_facturaDefault+' from folios',0,sqltemp);
 querys('select folio from FoliosFE where letras = "'+_facturaDefault+'"',0,sqltemp);
 idfactura:=_facturaDefault+inttostr(sqltemp.fieldbyname('folio').AsInteger+1);
 if sqlpedidos.Bof = true then
   fol1 := idfactura;

 //inserta en remifact la factura
 querys('select idremicion from RemiFact where idpedido='+sqlpedidos.fieldbyname('idpedido').asstring,0,sqlgeneral);
 querys('insert into RemiFact(idfactura, idremicion, idpedido,FechaAlta,HoraAlta,UsuarioAlta, tipo) values ('+
        quotedstr(idfactura)+','+sqlgeneral.fieldbyname('idremicion').asstring+','+sqlpedidos.fieldbyname('idpedido').asstring+
        ',"'+datetostr(date)+'","'+
        FormatDateTime('HH:mm:ss',Time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+', "E")',1,sqlgeneral);
  //actualiza el campo FechaFactura de Pedidos
  querys('update pedidos set FechaFactura='+quotedstr(datetostr(dtpFecFact.date))+',idfactura='+quotedstr(idfactura)+' where idpedido='+sqlpedidos.fieldbyname('idpedido').asstring,1,sqlgeneral);

  //verifica si este pedido ya esta en instalaciones
  querys('select idpedido from instalaciones where idpedido='+sqlpedidos.fieldbyname('idpedido').asstring,0,sqlgeneral);
  if sqlgeneral.recordcount = 0 then
   begin
     //verifica que este pedido ocupe instalacion
    querys('select instalacion from UnidadNegocio where idUnidadNegocio='+sqlpedidos.fieldbyname('idUnidadNegocio').asstring,0,sqlgeneral);
    if sqlgeneral.FieldByName('instalacion').AsInteger = 1 then
     begin
      //inserta en la tabla de instalaciones el id pedido
      querys('select idusuario from usuarios where nombre = ''SIN INSTALADOR''',0,sqlgeneral);
      querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+sqlpedidos.fieldbyname('idpedido').asstring+','+sqlgeneral.fieldbyname('idusuario').asstring+',0, '+sqlpedidos.fieldbyname('idcliente').asstring+')',1,sqlgeneral);
     end;
    end;
    //si la fecha de factura es menor que la fecha de remision , cambiar FechaRemision en pedidos:
    querys('Update pedidos set FechaRemision='+quotedstr(datetostr(dtpFecFact.Date))+' Where idpedido = '+quotedstr(sqlpedidos.fieldbyname('idpedido').AsString)+'  and FechaRemision > '+quotedstr(datetostr(dtpFecFact.Date))+' ',1,dmaccesos.sqlgeneral);
    querys('Update PagosClientes set idfactura="'+idfactura+'" Where idpedido = '+quotedstr(sqlpedidos.fieldbyname('idpedido').AsString),1,dmaccesos.sqlgeneral);

    /////////////
    querys('Update pedidos set estatus=4 where idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,1,sqlgeneral);
    frmprincipal.ucprincipal.Log('Facturo el Pedido '+sqlpedidos.fieldbyname('idpedido').asstring+' y obtuvo la factura '+idfactura,1);
    //delete(idfactura,1,1);
    SeparaSerieFolio(idfactura, _facturaDefault, Folio);
    querys('update FoliosFE set folio ='+folio+' where letras="'+_facturaDefault+'"',1,sqltemp);
    //inicia proceso de impresion de factura
    decodedate(strtodate(sqlaux.fieldbyname('FechaCreacion').Asstring),year,mes,dia);
    with dmreportes do
     begin
      {try
       NumToLetras.Numero := strtoint(midstr(sqlaux.fieldbyname('TotMn').Asstring,1,posex('.',sqlaux.fieldbyname('TotMn').Asstring)-1));
       dec := midstr(sqlaux.fieldbyname('TotMn').Asstring,posex('.',sqlaux.fieldbyname('TotMn').Asstring)+1,length(sqlaux.fieldbyname('TotMn').Asstring));
      except
       NumToLetras.Numero := 0;
       dec := '0';
      end;  }

      memo.Lines.Add( FacturaElectronica(sqlpedidos.fieldbyname('idcliente').AsString, sqlpedidos.fieldbyname('idpedido').AsString,'en una sola exhibicion', '1', 'FA', false));
     end;
   sqlpedidos.Next;
  end;
  fol2 := idfactura;
  memo.Lines.SaveToFile(Getconfiguraciones('FEPathEntrada', true)+fol1+'-'+fol2+'.txt');
  memo.free;
  application.MessageBox('Facturacion Exitosa','Aviso',mb_iconinformation);
  btnfacturar.Enabled := false;
  sqlpedidos.Close;
 end
else
 begin
  lblregistros.Visible := false;
  application.messagebox('No se Encontraron ventas para facturar en este rango de fechas','Aviso',mb_iconinformation);
end;
end;

procedure TfrmFacturacionLotesFE.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmFacturacionLotesFE.btnconsultarClick(Sender: TObject);
var sector:string;
begin
if cbosector.Text <> 'TODOS' then
 sector := ' and clientes.sector='+cbosector.Text
else
 sector := '';

frmmensaje.Show;
frmmensaje.Update;
if rbfechas.Checked then
querys('select pedidos.TotMn,pedidos.estatus,pedidos.idUnidadNegocio,pedidos.idpedido,pedidos.idcliente,pedidos.FechaLiquidacion,clientes.sector from pedidos inner join clientes on clientes.idcliente=pedidos.idcliente where pedidos.saldado = 1 and '+
       'pedidos.FechaLiquidacion between '+quotedstr(datetostr(dtpdesde.Date))+' and '+quotedstr(datetostr(dtphasta.Date))+' and pedidos.estatus = 3 '+sector+' '+
//        CSI
       ' and pedidos.idcliente <> 10000 '+
       'order by pedidos.FechaLiquidacion',0,sqlpedidos)
else
querys('select pedidos.TotMn,pedidos.estatus,pedidos.idUnidadNegocio,pedidos.idpedido,pedidos.idcliente,pedidos.FechaLiquidacion,clientes.sector from pedidos inner join clientes on clientes.idcliente=pedidos.idcliente where pedidos.saldado = 1 and '+
       ' pedidos.idpedido between '+quotedstr(edVdesde.text)+' and '+quotedstr(edvhasta.Text)+' and pedidos.estatus = 3 '+sector+
       //CSI
       ' and pedidos.idcliente <> 10000 '+
       'order by pedidos.FechaLiquidacion',0,sqlpedidos);
lblregistros.Caption := 'Total Registros: '+inttostr(sqlpedidos.RecordCount);
end;

procedure TfrmFacturacionLotesFE.sqlpedidosAfterOpen(DataSet: TDataSet);
begin
frmmensaje.Close;
if dataset.RecordCount > 0 then
 begin
  lblregistros.visible := true;
  btnfacturar.Enabled := true;
  lblregistros.Caption := 'Registros Encontrados '+inttostr(dataset.RecordCount-1);
 end
else
 begin
  lblregistros.visible := false;
  btnfacturar.Enabled := false;
  application.MessageBox('No se encontro ningun registro bajo esos criterios','Aviso',mb_iconinformation);
 end;

end;

procedure TfrmFacturacionLotesFE.sqlpedidosAfterClose(DataSet: TDataSet);
begin
 btnfacturar.Enabled := false;
end;

procedure TfrmFacturacionLotesFE.edVdesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,false);
key:=validapunto((sender as trzbuttonedit).Text+'.',key);

if (key = #13) and ((sender as trzbuttonedit).Text <> '') then
   begin
    key:= #0;
    querys('select idpedido from pedidos where idpedido='+(sender as trzbuttonedit).Text,0,SqlGeneral);
    if SqlGeneral.RecordCount = 0 then
     application.MessageBox('El numero de pedido tecleado no existe','Aviso',mb_iconinformation)
    else
      SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
 end;


if (key=#13)and((sender as trzbuttonedit).Text='') then
   (sender as trzbuttonedit).OnButtonClick((sender as trzbuttonedit));

if key = #27 then
   key:=#0;
end;

procedure TfrmFacturacionLotesFE.edVdesdeButtonClick(Sender: TObject);
begin
 frmbusquedas.query:='SELECT pedidos.idpedido,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as cliente,ClientesFact.rsocial, ' +
                     ' pedidos.FechaRemision,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact = ' +
                     ' ClientesFact.idfact where pedidos.estatus = 3 and pedidos.saldado = 1';
  querys('SELECT pedidos.idpedido FROM  pedidos left JOIN clientes ON (pedidos.idcliente = clientes.idcliente) left join ClientesFact on clientes.idfact = ' +
         ' ClientesFact.idfact where pedidos.estatus = 3 and pedidos.saldado = 1',0,sqlgeneral);
 frmbusquedas.maxrow := sqlgeneral.RecordCount - 1;
 frmbusquedas.campo_busqueda:='idpedido';
 frmbusquedas.campo_retorno:='idpedido';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'pedidos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
              chtecla:=#13;
              (sender as trzbuttonedit).Text:=frmbusquedas.resultado;
              (sender as trzbuttonedit).OnKeyPress((sender as trzbuttonedit),chtecla);
           end;
end;

procedure TfrmFacturacionLotesFE.rbventasClick(Sender: TObject);
begin
edvdesde.Enabled := true;
edvhasta.Enabled := true;
dtpdesde.Enabled := false;
dtphasta.Enabled := false;
edvdesde.SetFocus;
gfechas.close;
gventas.open;
end;

procedure TfrmFacturacionLotesFE.rbfechasClick(Sender: TObject);
begin
edvdesde.Enabled := false;
edvhasta.Enabled := false;
dtpdesde.Enabled := true;
dtphasta.Enabled := true;
dtpdesde.SetFocus;
gfechas.Open;
gventas.Close;
end;

procedure TfrmFacturacionLotesFE.edVdesdeChange(Sender: TObject);
begin
if (edvdesde.Text ='') or (edvhasta.Text = '') then
 begin
   sqlpedidos.Close;
   btnconsultar.Enabled := false;
   btnfacturar.Enabled := false;
 end;
if  (edvdesde.Text <> '') and (edvhasta.Text <> '') then
btnconsultar.Enabled := true;
end;

procedure TfrmFacturacionLotesFE.rbsectorClick(Sender: TObject);
begin
edvdesde.Enabled := true;
edvhasta.Enabled := true;
dtpdesde.Enabled := false;
dtphasta.Enabled := false;
cbosector.Enabled := false;
edvdesde.SetFocus;
gfechas.close;
gventas.open;
end;

procedure TfrmFacturacionLotesFE.cbosectorNotInList(Sender: TObject);
begin
cbosector.Text := 'TODOS';
end;

End.
