{///////////////////////////////////////////////////////////////////////////////
2009/01/08 Oscar Correccion al detalle de pedidos
--------------------------------------------------------------------------------
2008/12/15 dalyla impresion de anual se por 12
2008/12/10 Oscar ultimamodificacion boletas2009
2008/07/14 dalyla referencia bancaria configuraciones
2008/02/28 dalyla zona horaria ok
--------------------------------------------------------------------------------
Ultima Modificacion: 2007/01/31
Ultima Modificacion por: Dalila Robledo
}///////////////////////////////////////////////////////////////////////////////
unit UBolAnuales;


interface

uses
  Windows, Messages,dateutils, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,strutils, StdCtrls, RzLabel, Mask, RzEdit, RzButton, RzLstBox, RzChkLst,
  DB, MemDS, DBAccess, MyAccess, RzBtnEdt, ExtCtrls, RzPanel, RzDBEdit;

type
  TfrmBolAnuales = class(TForm)
    edFechaCreacion: TRzDateTimeEdit;
    RzLabel28: TRzLabel;
    clcontratos: TRzCheckList;
    RzLabel1: TRzLabel;
    btnsalir: TRzBitBtn;
    sqlgeneral: TMyQuery;
    sqlcontratos: TMyQuery;
    btnalta: TRzBitBtn;
    RzLabel2: TRzLabel;
    edFechaVence: TRzDateTimeEdit;
    RzLabel3: TRzLabel;
    mmconcepto: TRzMemo;
    sqlclientes: TMyQuery;
    mmcuentas: TRzMemo;
    RzLabel4: TRzLabel;
    mmnocuentas: TRzMemo;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    mmctaCate: TRzMemo;
    lbltotal1: TLabel;
    lbltotal2: TLabel;
    lbltotal3: TLabel;
    rgClientes: TRzGroupBox;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    RzLabel9: TRzLabel;
    EdDesc: TRzEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnocultarClick(Sender: TObject);
    procedure mmcuentasChange(Sender: TObject);
    procedure mmnocuentasChange(Sender: TObject);
    procedure mmctaCateChange(Sender: TObject);
    procedure lbltotal3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBolAnuales: TfrmBolAnuales;

implementation

uses Udm, Urecursos, Umensaje, Uprincipal;

{$R *.dfm}

procedure TfrmBolAnuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmBolAnuales.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmBolAnuales.FormShow(Sender: TObject);
begin
querys('select TipoCont,nombre from contratos where estatus = 1 order by nombre',0,sqlcontratos);
clcontratos.Clear;
sqlcontratos.First;
while not sqlcontratos.Eof do
 begin
  clcontratos.Items.Add(sqlcontratos.fieldbyname('TipoCont').AsString+' - '+sqlcontratos.fieldbyname('nombre').AsString);
  sqlcontratos.Next;
 end;
if monthof(today) = 12 then
  begin
  edfechacreacion.date := encodedate(yearof(today)+1, 1, 1);
  edfechavence.date := encodedate(yearof(today)+1, 1, 31);
  end
else
  begin
  edfechacreacion.date := encodedate(yearof(today), 1, 1);
  edfechavence.date := encodedate(yearof(today), 1, 31);
  end;

end;

{procedure TfrmBolAnuales.btnaltaClick(Sender: TObject);
var c,cliente1,dias,year,acum:integer;       // mes,   fecha, idpedido1,idpedido2,  pedtmp,
pedido,idvendedor,fechavence,fechacreacion,origen,endolaresstring,monito,temp:string;
tipocambio,endolares,costo:double;  // total,  ,j
fechatemp:TDateTime;
//dia,mes,ano,DiaPago : word;
i : integer;
//parcialidad : double;
//CodBarras,Banco,cvecte,cvevta: string;
begin
mmcuentas.Clear;
mmnocuentas.Clear;
mmctaCate.Clear;
if edfechacreacion.Text = '' then
 begin
  application.MessageBox('Falta la fecha de creacion','Atención',mb_iconwarning);
  edfechacreacion.SetFocus;
  exit;
 end;
if mmconcepto.Text = '' then
 begin
  application.MessageBox('Falta el concepto','Atención',mb_iconwarning);
  mmconcepto.SetFocus;
  exit;
 end;

if not mmconcepto.Modified then
 if application.MessageBox('No ha modificado el concepto, desea continuar?','Pregunta',mb_iconquestion+mb_yesno)=idno then
  begin
   mmconcepto.SetFocus;
   exit;
  end;


//traer el tipo de cambio...
querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
tipocambio:=strtofloat(Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]));
querys('select idUnidadNegocio from UnidadNegocio where nombre=''MONITOREO'' ',0,SqlGeneral);
monito:=sqlgeneral.Fields.Fields[0].asstring;
temp := '';
sqlcontratos.First;
//para hacerlo por un rango de clientes
if (vendedores.Visible)and(eddesde.Text <> '') and (edhasta.Text <> '') then
 querys('select idcliente from clientes where idcliente between '+eddesde.Text+' and '+edhasta.Text+' order by idcliente',0,sqlclientes)
else  //para hacerlo por los contratos seleccionados
 begin
  for i:=0 to clcontratos.Items.Count-1 do
   if clcontratos.ItemChecked[i] then
    begin
     sqlcontratos.RecNo := i+1;
     temp := temp + quotedstr(sqlcontratos.fieldbyname('TipoCont').AsString)+',';
    end;
   delete(temp,length(temp),1);
   querys('select idcliente from clientes where TipoCont in ('+temp+') order by idcliente',0,sqlclientes);
end;
sqlclientes.First;
while not sqlclientes.Eof do
 begin
  cliente1 := sqlclientes.fieldbyname('idcliente').AsInteger;
  fechatemp:=edfechavence.Date;
  acum := 0;
   querys('SELECT g.CostoAnual as costo,if(c.idvendedor = 0,1,c.idvendedor) as id,if(c.idorigen=0,99,c.idorigen) as origen FROM clientes as c RIGHT JOIN categorias AS g ON (c.idcategoria=g.idcategoria) WHERE idcliente='+inttostr(cliente1),0,sqlgeneral);
     if sqlgeneral.fieldbyname('costo').AsString = '' then
      mmctaCate.Lines.Add(inttostr(cliente1));
      costo:=strtofloat(Format('%8.2f',[sqlgeneral.fieldbyname('costo').Asfloat]));
      idvendedor:=sqlgeneral.fieldbyname('id').AsString;
      origen:=sqlgeneral.fieldbyname('origen').AsString;
      //buscar el ultimo pedido para almacenar en variable y hacer consulta de boletas con ella y el utimo pedido....
      querys('select max(idpedido) from pedidos',0,SqlGeneral);
      pedido:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      for c:=1 to 12 do
       begin  //meses
        year := yearof(fechatemp);
        dias := DaysInMonth(fechatemp);
        fechacreacion := inttostr(year)+'/'+inttostr(c)+'/01';
        fechavence := inttostr(year)+'/'+inttostr(c)+'/'+inttostr(dias);
        //valida si no tiene ya una anualidad en el año
        querys('select idpedido from pedidos where idcliente='+inttostr(cliente1)+' and Anualidad ='+inttostr(year),0,sqlgeneral);
        if sqlgeneral.RecordCount > 0 then
         begin
          acum:=-1;
          mmnocuentas.Lines.Add(inttostr(cliente1));
          break;
         end;
        //query que verifica si el cliente actual tiene un pedidos de monitoreo en el rango de fechas del primero al ultimo de la boleta que se esta genrando
        querys('SELECT p.idcliente AS cli FROM pedidos as p  LEFT JOIN UnidadNegocio as i ON (i.idUnidadNegocio=p.idUnidadNegocio) WHERE p.estatus=0 and  p.idcliente='+inttostr(cliente1)+'  and p.FechaCreacion between '+quotedstr(fechacreacion)+' and '+quotedstr(fechavence)+' and i.nombre=''MONITOREO''',0,sqlgeneral);
        if sqlgeneral.FieldByName('cli').AsString = '' then
         begin
          querys('select idcliente as cli from bonificaciones where NumMes='+inttostr(c)+' and ano='+inttostr(year)+' and idcliente='+inttostr(cliente1),0,sqlgeneral);
          if sqlgeneral.FieldByName('cli').AsString = '' then
          inc(acum);
         end;
       end; //for c

       if (acum <> 0) and (acum <> -1) then
        begin
          fechavence := edfechavence.Text;
          costo := strtofloat(Format('%8.2f',[(costo/12)*acum]));
          endolares := strtofloat(Format('%8.2f',[costo / tipocambio]));
          endolaresstring:=Format('%8.2f',[endolares]);
          mmcuentas.Lines.Add(inttostr(cliente1)+' '+pedido);
          frmmensaje.Show;
          frmmensaje.Update;
          { // sin format
          querys('INSERT INTO pedidos (idpedido,idcliente,usuario,fecha,hora,idorigen,idvendedor,FechaCreacion,'+
                 'SubTotal,Iva,TotMn,Saldo,concepto,FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio,Anualidad) '+
                 'values( '+quotedstr(pedido)+','+inttostr(cliente1)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+
                 ',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(origen)+','+quotedstr(idvendedor)+','+quotedstr(datetostr(edfechacreacion.Date))+
                 ','+quotedstr(endolaresstring)+',('+quotedstr(endolaresstring)+'/10),('+floattostr(costo)+'*1.1),0, '+
                 quotedstr(mmconcepto.Text)+','+quotedstr(datetostr(edfechavence.Date))+','+quotedstr(monito)+',''CA'','+
                 floattostr(tipocambio)+','+inttostr(year)+')',1,sqlgeneral);                     }

          //el mismo de arribe pero con format de 2
      {    querys('INSERT INTO pedidos (idpedido,idcliente,usuario,fecha,hora,idorigen,idvendedor,FechaCreacion,'+
                 'SubTotal,Iva,TotMn,Saldo,concepto,FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio,Anualidad) '+
                 'values( '+quotedstr(pedido)+','+inttostr(cliente1)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+
                 //',"'+datetostr(date)+'","'+timetostr(time)+'",'+
                 ',"'+datetostr(date)+'","'+timetostr(time)+'",'+
                 quotedstr(origen)+','+quotedstr(idvendedor)+','+quotedstr(datetostr(edfechacreacion.Date))+
//                 ','+quotedstr(endolaresstring)+',('+quotedstr(Format('%8.2f',[strtofloat(endolaresstring)/10]))+
                 ','+quotedstr(Format('%8.2f',[costo]))+',('+quotedstr(Format('%8.2f',[costo*(getIVA)]))+
                 '),('+quotedstr(Format('%8.2f',[costo*(1+getIVA)]))+'),0, '+quotedstr(mmconcepto.Text)+','+
                 quotedstr(datetostr(edfechavence.Date))+','+quotedstr(monito)+',''CA'','+Format('%8.2f',[tipocambio])+','+inttostr(year)+')',1,sqlgeneral);

          querys('INSERT INTO DetPedido(idpedido,cant,cod_cve,surtido,costo,tc,utilidad) values('+
          quotedstr(pedido)+',1,''MONITOREO'',1,'+Format('%8.2f',[costo])+',1,''A'')',1,sqlgeneral);
          //inicia proceso de generacion de boletas
          //para el codigo de barras de las boletas se saca cuenta + idpedido +  cargo + relleno para que sean 10 caracteres
          querys(GeneraBoletas(cliente1,strtoint(pedido),fechavence,Format('%8.2f',[costo])),1,sqlgeneral);
        end;
           sqlclientes.Next;
   end;//while cliente
if frmmensaje.Showing then
 frmmensaje.Close;
end;
           }

    
procedure TfrmBolAnuales.btnaltaClick(Sender: TObject);
var c,cliente1,dias,year,month,acum:integer;       //    fecha, idpedido1,idpedido2,  pedtmp,
   pedido,idvendedor,fechavence,fechacreacion,origen,mes,endolaresstring,monito,temp:string;
   tipocambio,endolares,costo, descuento, costo12,costoAnual:double;  // total,  ,j
   fechatemp:TDateTime;
   i,contador : integer; ban:boolean;
begin
   mmcuentas.Clear;
   mmnocuentas.Clear;
   mmctaCate.Clear;
   if edfechacreacion.Text = '' then
   begin
      application.MessageBox('Falta la fecha de creacion','Atención',mb_iconwarning);
      edfechacreacion.SetFocus;
      exit;
   end;
   if mmconcepto.Text = '' then
   begin                              
      application.MessageBox('Falta el concepto','Atención',mb_iconwarning);
      mmconcepto.SetFocus;
      exit;
   end;
   if not mmconcepto.Modified then
      if application.MessageBox('No ha modificado el concepto, desea continuar?','Pregunta',mb_iconquestion+mb_yesno)=idno then
      begin
         mmconcepto.SetFocus;
         exit;
      end;

   //traer el tipo de cambio...
   querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
   tipocambio:=strtofloat(Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]));
   querys('select idUnidadNegocio from UnidadNegocio where nombre=''MONITOREO'' ',0,SqlGeneral);
   monito:=sqlgeneral.Fields.Fields[0].asstring;
   temp := '';
   sqlcontratos.First;
   //para hacerlo por un rango de clientes
   if (rgclientes.Visible)and(eddesde.Text <> '') and (edhasta.Text <> '') then
     querys('select idcliente from clientes where idcliente between '+eddesde.Text+' and '+edhasta.Text+' order by idcliente',0,sqlclientes)
   else  //para hacerlo por los contratos seleccionados
   begin
      for i:=0 to clcontratos.Items.Count-1 do
         if clcontratos.ItemChecked[i] then
         begin
            sqlcontratos.RecNo := i+1;
            temp := temp + quotedstr(sqlcontratos.fieldbyname('TipoCont').AsString)+',';
         end;
         delete(temp,length(temp),1);
         querys('select idcliente from clientes where TipoCont in ('+temp+') order by idcliente',0,sqlclientes);
   end;
   sqlclientes.First;
   while not sqlclientes.Eof do
   begin
      cliente1 := sqlclientes.fieldbyname('idcliente').AsInteger;
      fechatemp:=edfechavence.Date;
      acum := 0;
      querys('SELECT g.CostoAnual as costo,if(c.idvendedor = 0,1,c.idvendedor) as id,if(c.idorigen=0,99,c.idorigen) as origen FROM clientes as c RIGHT JOIN categorias AS g ON (c.idcategoria=g.idcategoria) WHERE idcliente='+inttostr(cliente1),0,sqlgeneral);
      if sqlgeneral.fieldbyname('costo').AsString = '' then
         mmctaCate.Lines.Add(inttostr(cliente1));

      if EdDesc.Text <> '' then
        descuento := (strtofloat(Format('%8.2f',[strtofloat(EdDesc.Text)])) /100) * strtofloat(Format('%8.2f',[sqlgeneral.fieldbyname('costo').Asfloat]))
      else
        descuento := 0;
      costo:= strtofloat(Format('%8.2f',[sqlgeneral.fieldbyname('costo').Asfloat])) -  descuento;
      costoAnual:= costo;
      idvendedor:=sqlgeneral.fieldbyname('id').AsString;
      origen:=sqlgeneral.fieldbyname('origen').AsString;
      //buscar el ultimo pedido para almacenar en variable y hacer consulta de boletas con ella y el utimo pedido....
      querys('select max(idpedido) from pedidos',0,SqlGeneral);
      pedido:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      for c:=1 to 12 do
      begin  //meses
         year := yearof(fechatemp);
         month := monthof(fechatemp);
         dias := DaysInMonth(fechatemp);
         fechacreacion := inttostr(year)+'/'+inttostr(c)+'/01';
         fechavence := inttostr(year)+'/'+inttostr(c)+'/'+inttostr(dias);
         //valida si no tiene ya una anualidad en el año
         querys('select idpedido from pedidos where idcliente='+inttostr(cliente1)+
                ' and Anualidad ='+inttostr(year) + ' and MONTH(FechaVencimiento) = ' + inttostr(month),0,sqlgeneral);
         if sqlgeneral.RecordCount > 0 then
         begin
            acum:=-1;
            mmnocuentas.Lines.Add(inttostr(cliente1));
            break;
         end;
         //query que verifica si el cliente actual tiene un pedido de monitoreo Anual en el rango
         //de fechas del primero al ultimo de la boleta que se esta genrando
        // querys('SELECT p.idcliente AS cli FROM pedidos as p  LEFT JOIN UnidadNegocio as i ON (i.idUnidadNegocio=p.idUnidadNegocio) '+
        //        ' WHERE p.estatus=0 and  p.idcliente='+inttostr(cliente1)+'  and p.FechaCreacion between '+
        //       quotedstr(fechacreacion)+' and '+quotedstr(fechavence)+' and i.nombre=''MONITOREO'' and anualidad>0',0,sqlgeneral);
        // if sqlgeneral.FieldByName('cli').AsString = '' then
        // begin
            querys('select idcliente as cli from bonificaciones where NumMes='+inttostr(c)+' and ano='+inttostr(year)+' and idcliente='+inttostr(cliente1),0,sqlgeneral);
            if sqlgeneral.FieldByName('cli').AsString = '' then
               inc(acum);
        // end;
      end; //for c
      if (acum <> 0) and (acum <> -1) then
      begin
         fechavence := edfechavence.Text;
         costo := round(strtofloat(Format('%8.2f',[(costo/12)*acum])));
         endolares := strtofloat(Format('%8.2f',[costo / tipocambio]));
         endolaresstring:=Format('%8.2f',[endolares]);
         frmmensaje.Show;
         frmmensaje.Update;

         //validar que no se repita el idpedido
         contador:=0;
         ban:=false;
         repeat
            try
               inc(contador);
               if contador>=3 then
                  ban:=true;
               if contador>1 then
                  pedido:=inttostr(strtoint(pedido)+1);
               sqlgeneral.Close;
               sqlgeneral.SQL.Clear;
               //el mismo de arribe pero con format de 2
               sqlgeneral.SQL.Add('INSERT INTO pedidos (idpedido,idcliente,usuario,fecha,hora,idorigen,idvendedor,FechaCreacion,'+
               'SubTotal,Iva,TotMn,Saldo,concepto,FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio,Anualidad) '+
               'values( '+quotedstr(pedido)+','+inttostr(cliente1)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+
               ',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(origen)+','+quotedstr(idvendedor)+','+
               quotedstr(datetostr(edfechacreacion.Date))+','+quotedstr(Format('%8.2f',[costo]))+',('+
               quotedstr(Format('%8.2f',[costo*(getIVA)]))+'),('+quotedstr(inttostr(round(costo*(1+getIVA))))+'),0, '+
               quotedstr(mmconcepto.Text)+','+quotedstr(datetostr(edfechavence.Date))+','+
               quotedstr(monito)+',''CA'','+Format('%8.2f',[tipocambio])+','+inttostr(year)+')');
               sqlgeneral.Execute;
               if sqlgeneral.RowsAffected>0 then
                  ban:=true;
            except
            end;
         until ban;
          //#boletas 2009
         costo:=strtofloat(Format('%8.2f',[costo/12]));
         if contador<3 then
         begin
            for i:=1 to 12 do
            begin
               if i>9 then
                  mes:=inttostr(i)+rightstr(inttostr(year),2)
               else
                  mes:='0'+inttostr(i)+rightstr(inttostr(year),2);
               //para corregir el error de centavos se le agrega la diferencia al ultimo articulo
               if i=12 then
               begin
                  costo12:= strtofloat(Format('%8.2f',[costo+(costoAnual-(costo*12))]));
                  querys('INSERT INTO DetPedido(idpedido,cant,cod_cve,surtido,costo,tc,utilidad) values('+
                  quotedstr(pedido)+',1,"MON'+mes+'",1,'+Format('%8.2f',[costo12])+',1,''A'')',1,sqlgeneral);
               end
               else
                  querys('INSERT INTO DetPedido(idpedido,cant,cod_cve,surtido,costo,tc,utilidad) values('+
                  quotedstr(pedido)+',1,"MON'+mes+'",1,'+Format('%8.2f',[costo])+',1,''A'')',1,sqlgeneral);
            end;
            //inicia proceso de generacion de boletas
            //para el codigo de barras de las boletas se saca cuenta + idpedido +  cargo + relleno para que sean 10 caracteres
            querys(GeneraBoletas(cliente1,strtoint(pedido),fechavence,Format('%8.2f',[costoAnual])),1,sqlgeneral);
            mmcuentas.Lines.Add(inttostr(cliente1)+' '+pedido);
         end
         else
            mmnocuentas.Lines.Add(inttostr(cliente1));
      end;
      if Win32Platform = VER_PLATFORM_WIN32_NT then
          SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);


      sqlclientes.Next;
   end;//while cliente
   if frmmensaje.Showing then
      frmmensaje.Close;
end;


procedure TfrmBolAnuales.btnocultarClick(Sender: TObject);
begin
self.Width := 314;
end;

procedure TfrmBolAnuales.mmcuentasChange(Sender: TObject);
begin
lbltotal1.Caption := 'Total: '+ inttostr(mmcuentas.Lines.Count-1);
end;

procedure TfrmBolAnuales.mmnocuentasChange(Sender: TObject);
begin
lbltotal2.Caption :='Total: '+inttostr(mmnocuentas.Lines.Count-1);
end;

procedure TfrmBolAnuales.mmctaCateChange(Sender: TObject);
begin
lbltotal3.Caption := 'Total: '+inttostr(mmctacate.Lines.Count-1);
end;

procedure TfrmBolAnuales.lbltotal3DblClick(Sender: TObject);
begin
rgClientes.visible := not rgClientes.visible;
end;

end.
