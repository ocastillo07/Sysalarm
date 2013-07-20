{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
________________________________________________________________________________
2009/03/25 dalyla desgloce el iva
--------------------------------------------------------------------------------
2008/10/10 dalyla inventariable
2008/04/28 dalyla
2008/04/24 dalyla cliente cambios
2007/12/11 Edwin Validacion para el cierre.
2007/11/27 Dalila Agregue pasar articulos a instalacion en remision
}///////////////////////////////////////////////////////////////////////////////
unit UFacturacionLotes;

interface

uses
  Windows, Messages,RpRave, RpDefine, SysUtils,strutils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, RzPanel, RzRadGrp, StdCtrls,
  Mask, RzEdit, RzLabel, RzButton, DB, MemDS, DBAccess, MyAccess, Grids,
  DBGrids, RzBtnEdt, RzRadChk, RzGroupBar, RzCmboBx, Printers;

type
  TfrmFacturacionLotes = class(TForm)
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
  frmFacturacionLotes: TfrmFacturacionLotes;

implementation

uses Urecursos, Uprincipal, Udm, Udmrep, Umensaje, Ubusquedas;

{$R *.dfm}

procedure TfrmFacturacionLotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmFacturacionLotes.FormShow(Sender: TObject);
var c:integer;
begin
shortdateformat:='yyyy/mm/dd';
dtpdesde.Date := FechaServidor;
dtphasta.Date := FechaServidor;
//dtpfvencimiento.Date := FechaServidor;
dtpFecFact.Date := FechaServidor;
for c:=0 to printer.Printers.Count - 1 do
cbprinters.Items.Add(printer.Printers.Strings[c]);
CargaCombo('select nombre from sectores order by nombre','Sectores',cbosector);
cbosector.Items.Add('TODOS');
cbosector.Text := 'TODOS';
end;

procedure TfrmFacturacionLotes.btnfacturarClick(Sender: TObject);
var pzsxunidad,pzs,cant,idmovi:integer;
    total,tc,ant,tot:double;
     cod_cve,idfactura,_facturaDefault:string;
  year,dia,mes:word;
  //dec : string;          //  CantEnLetras,   ,deducible
  sqlaux : tmyquery;
begin

//validar cierre
if(dtpFecFact.Date <= frmprincipal._fechaCierreMes ) then
 begin
   //if(frmprincipal._ModificarCierre = false) then
   if DerechosSys('Modifica Cierre')= false then
      begin
           application.MessageBox('La fecha afecta a un cierre anterior!. '+#13+'  solo un administrador puede realizar esta operación! '+#13+'Modifique la fecha por favor!','Aviso',mb_iconinformation);
           exit;
      end else
       begin
        
          if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea continuar(YES) ó modifique la fecha(NO) ?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
             begin
                 dtpFecFact.Date := now;
                 exit;
             end;

       end;
 end;                 

 
  querys('Select valor From configuraciones where concepto="FacturaDefault" ',0,sqltemp);
  if(sqltemp.RecordCount > 0) then
      _facturaDefault := sqltemp.Fields.Fields[0].AsString
  else
    begin
         if application.MessageBox(pchar('No hay Factura Default en el sistema!, se imprimira con Factura P , '+#13+' desea continuar(YES)?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
                 exit;
      _facturaDefault := 'P';// SI NO EXISTE POR DEFAULT.
   end;



if application.MessageBox('Desea Ver el Preview de la(s) factura(s)?','Pregunta',mb_yesno+mb_iconquestion)=idyes then
 dmreportes.rvp.Engine := dmreportes.rvsystem1
else
 dmreportes.rvp.Engine := dmreportes.rvsystem2;
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
       { ////lo que se aparto se pasa a instalacion
       querys('update articulos set instalacion=instalacion+('+inttostr(pzs+(cant*pzsxunidad))+') where cod_cve='+quotedstr(cod_cve),1,sqltemp);
        //actualiza los detalles del pedido diciendo que y ase surtio el art
        querys('update DetPedido set surtido=1 where idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,1,sqltemp);                    }
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

  //actualiza el campo ultima compra del cliente al igual que su saldo
  //querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',saldo=saldo+'+floattostr(tot)+',TotComprado=TotComprado + '+floattostr(total*tc)+' where idcliente='+sqlpedidos.FieldByName('idcliente').AsString,1,sqltemp);
  //trae el maximo numero de factura
//  querys('select FacturaP from folios',0,sqltemp);
// idfactura:='P'+inttostr(sqltemp.fieldbyname('FacturaP').AsInteger+1);

 querys('select Factura'+_facturaDefault+' from folios',0,sqltemp);
 idfactura:=_facturaDefault+inttostr(sqltemp.fieldbyname('Factura'+_facturaDefault).AsInteger+1);

 //inserta en remifact la factura
 querys('insert into RemiFact(idfactura,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+quotedstr(idfactura)+','+sqlpedidos.fieldbyname('idpedido').asstring+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,sqlgeneral);
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
    //actualizar la fecha de creacion del pedido si fue facturado a un mes despues de la fecha de creacion
    //querys('Update pedidos set FechaCreacion='+quotedstr(datetostr(dtpFecFact.date))+' Where idpedido = '+quotedstr(sqlpedidos.fieldbyname('idpedido').AsString)+' and (month(FechaCreacion)-month('+quotedstr(datetostr(dtpFecFact.date))+')) <> 0  and idunidadnegocio <> 4',1,sqlgeneral);
    //si la fecha de factura es menor que la fecha de remision , cambiar FechaRemision en pedidos:
    querys('Update pedidos set FechaRemision='+quotedstr(datetostr(dtpFecFact.Date))+' Where idpedido = '+quotedstr(sqlpedidos.fieldbyname('idpedido').AsString)+'  and FechaRemision > '+quotedstr(datetostr(dtpFecFact.Date))+' ',1,dmaccesos.sqlgeneral);

    /////////////
    querys('Update pedidos set estatus=4 where idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,1,sqlgeneral);
    frmprincipal.ucprincipal.Log('Facturo el Pedido '+sqlpedidos.fieldbyname('idpedido').asstring+' y obtuvo la factura '+idfactura,1);
    delete(idfactura,1,1);
    querys('update folios set Factura'+_facturaDefault+'='+idfactura,1,sqltemp);
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
      end;   }
      sqlclientesfact.Close;
      sqlclientesfact.ParamByName('dia').Value := dia;
      sqlclientesfact.ParamByName('mes').Value := meses[mes];
      sqlclientesfact.ParamByName('ano').Value := year;
      sqlclientesfact.ParamByName('ped').Value := strtoint(sqlpedidos.fieldbyname('idpedido').AsString);
      sqlclientesfact.ParamByName('idcliente').Value := sqlpedidos.fieldbyname('idcliente').AsString;
      //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
      sqlclientesfact.ParamByName('cant').Value := 'PESOS';
      sqlclientesfact.ParamByName('Fact').Value :=idfactura;
      sqlclientesfact.Open;

        {if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
            deducible := '1'
        else
            deducible := floattostr(1+getIVA);}


        {querys('select DetPedido.idpedido,DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido.cant,DetPedido.piezas,if ('+floattostr(1+getIVA)+'='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetPedido.tc,if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') '+
               ' as aplica_desc,(DetPedido.costo*'+deducible+'*DetPedido.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1,(((DetPedido.costo-(DetPedido.costo*articulos.desc_esp/100)) + ((DetPedido.costo- '+
               '(DetPedido.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.cant) + ((((DetPedido.costo/articulos.piezasxunidad)-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPedido.costo/articulos.piezasxunidad)'+
               '-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), ((DetPedido.costo+(DetPedido.costo*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo/articulos.piezasxunidad)+'+
               '((DetPedido.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas))*'+deducible+'*DetPedido.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPedido.cant)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,'+
               'DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = articulos.cod_cve where DetPedido.idpedido='+sqlpedidos.fieldbyname('idpedido').AsString+' order by DetPedido.id',0,sqlgeneral2);}

         querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+sqlpedidos.fieldbyname('idpedido').AsString+' '+
        'order by dp.id',0,sqlgeneral2);
          {
      if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
       deducible := '1'
      else
       deducible := '0';
      //query con para sacar precios que no son deducibles de impuestos......
                                             //if ('+quotedstr(deducible)+' = 1,
      querys('select DetPedido.id,DetPedido.cod_cve,articulos.nombre,if(DetPedido.cant=0,DetPedido.piezas,DetPedido.cant) as cant,articulos.iva/100 as Iva,articulos.desc_esp/100 as descuento, ' +
            'if (articulos.aplica_desc = 1, ''TRUE'',''FALSE'') as aplica_desc,if ('+quotedstr(deducible)+' = 1,truncate((DetPedido.costo*DetPedido.tc),3),truncate(((DetPedido.costo*DetPedido.tc)*1.1),3)) as precio, '+
           'if ('+quotedstr(deducible)+' = 1,truncate(if (articulos.aplica_desc = 1,((((DetPedido.costo*DetPedido.tc)-((DetPedido.costo*DetPedido.tc)*articulos.desc_esp/100)) + (((DetPedido.costo*DetPedido.tc)- '+
           '((DetPedido.costo*DetPedido.tc)*articulos.desc_esp/100))*articulos.iva/100)) *DetPedido.cant) + (((((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)-(((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)*articulos.desc_esp/100)) + '+
           '((((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)-(((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), (((DetPedido.costo*DetPedido.tc)+ '+
           '((DetPedido.costo*DetPedido.tc)*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)+((((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas)),3), '+
           ' truncate((if (articulos.aplica_desc = 1,((((DetPedido.costo*DetPedido.tc)-((DetPedido.costo*DetPedido.tc)*articulos.desc_esp/100)) + (((DetPedido.costo*DetPedido.tc)- '+
           '((DetPedido.costo*DetPedido.tc)*articulos.desc_esp/100))*articulos.iva/100)) *DetPedido.cant) + (((((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)-(((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)*articulos.desc_esp/100)) + '+
           '((((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)-(((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), (((DetPedido.costo*DetPedido.tc)+ '+
           '((DetPedido.costo*DetPedido.tc)*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)+((((DetPedido.costo*DetPedido.tc)/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas)))*1.1,3)) as Total, '+
           'articulos.piezasxunidad,ROUND((articulos.tinstalacion*DetPedido.cant),3)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = '+
           'articulos.cod_cve where DetPedido.idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,0,dmreportes.sqlgeneral2);

           }

       dmreportes.rvsystem2.DefaultDest := rdprinter;
      // dmreportes.RvSystem1.DoNativeOutput:=false;
       rvp.ProjectFile := uprincipal.my_path + 'Reportes_sysalarm.rav';
       RvNDRWriter1.PrinterIndex := cbprinters.Items.IndexOf(cbprinters.Text);
      RvNDRWriter1.Title := 'Facturacion por Lote';
      printer.Title := 'Facturacion por Lote';
       RVP.ExecuteReport('FacturasMX');
     end;
   sqlpedidos.Next;
  end;
  application.MessageBox('Facturacion Exitosa','Aviso',mb_iconinformation);
  btnfacturar.Enabled := false;
  sqlpedidos.Close;
 end
else
 begin
  lblregistros.Visible := false;
  application.messagebox('No se Encontraron ventas para facturar en este rango de fechas','Aviso',mb_iconinformation);
end;
dmreportes.RVP.Engine:=dmreportes.RvSystem1;
dmreportes.rvsystem2.DefaultDest := rdpreview;
end;

procedure TfrmFacturacionLotes.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmFacturacionLotes.btnconsultarClick(Sender: TObject);
var sector:string;
begin
if cbosector.Text <> 'TODOS' then
 sector := ' and clientes.sector='+cbosector.Text
else
 sector := '';

frmmensaje.Show;
frmmensaje.Update;
if rbfechas.Checked then
// querys('select pedidos.TotMn,pedidos.estatus,pedidos.idUnidadNegocio,pedidos.idpedido,pedidos.idcliente,PagosClientes.FechaAlta, count(pedidos.idpedido) as ped from pedidos inner join PagosClientes on pedidos.idpedido = PagosClientes.idpedido '+
//        ' where pedidos.saldado = 1 and  PagosClientes.FechaAlta between '+quotedstr(datetostr(dtpdesde.Date))+' and '+quotedstr(datetostr(dtphasta.Date))+' and pedidos.estatus = 3 group by pedidos.idpedido order by PagosClientes.FechaAlta',0,sqlpedidos)
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
// querys('select pedidos.TotMn,pedidos.estatus,pedidos.idUnidadNegocio,pedidos.idpedido,pedidos.idcliente,PagosClientes.FechaAlta, count(pedidos.idpedido) as ped from pedidos inner join PagosClientes on pedidos.idpedido = PagosClientes.idpedido '+
//        ' where pedidos.saldado = 1 and  pedidos.idpedido between '+quotedstr(edVdesde.text)+' and '+quotedstr(edvhasta.Text)+' and pedidos.estatus = 3 group by pedidos.idpedido order by PagosClientes.FechaAlta',0,sqlpedidos);
lblregistros.Caption := 'Total Registros: '+inttostr(sqlpedidos.RecordCount);
end;

procedure TfrmFacturacionLotes.sqlpedidosAfterOpen(DataSet: TDataSet);
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

procedure TfrmFacturacionLotes.sqlpedidosAfterClose(DataSet: TDataSet);
begin
 btnfacturar.Enabled := false;
end;

procedure TfrmFacturacionLotes.edVdesdeKeyPress(Sender: TObject;
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

procedure TfrmFacturacionLotes.edVdesdeButtonClick(Sender: TObject);
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

procedure TfrmFacturacionLotes.rbventasClick(Sender: TObject);
begin
edvdesde.Enabled := true;
edvhasta.Enabled := true;
dtpdesde.Enabled := false;
dtphasta.Enabled := false;
edvdesde.SetFocus;
gfechas.close;
gventas.open;
end;

procedure TfrmFacturacionLotes.rbfechasClick(Sender: TObject);
begin
edvdesde.Enabled := false;
edvhasta.Enabled := false;
dtpdesde.Enabled := true;
dtphasta.Enabled := true;
dtpdesde.SetFocus;
gfechas.Open;
gventas.Close;
end;

procedure TfrmFacturacionLotes.edVdesdeChange(Sender: TObject);
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

procedure TfrmFacturacionLotes.rbsectorClick(Sender: TObject);
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

procedure TfrmFacturacionLotes.cbosectorNotInList(Sender: TObject);
begin
cbosector.Text := 'TODOS';
end;

end.
