{///////////////////////////////////////////////////////////////////////////////
2010/12/14 dalyla cambiar meses de bonificacion al primer mes no usa configuracion
2010/11/10 dalyla cambiar el articulo por el del año y quitar lista de generados
2010/09/08 dalyla cortesias un mes si un mes no otro si
                  query de buscar si ya existe el monitoreo
2009/03/18 dalyla el join de boletas con clientes fact sea por clientes idfact
2009/01/19 Oscar configuracion para meses bonificacion
2009/01/14 Oscar agrege los compartidos en el costo que trae de categ.
--------------------------------------------------------------------------------
2008/12/30 dalyla query de impresion boletas
2008/12/27 dalyla no generar boleta a cortesias, etc
2008/12/10 Oscar btngenerar validacion boletas 2009
2008/12/10 dalyla codigos referencia banorte
2008/06/12 dalyla estatus
2008/05/20 dalyla referencia Bancaria
2008/05/19 dalyla correccion de pagos clientes en cortesias
2008/05/07 dalyla abono por promocion en el primer mes en caso de cuenta nueva
2008/02/28 dalyla zona horaria ok
2007/01/31 dalyla
}///////////////////////////////////////////////////////////////////////////////
unit Uboletas_mensualesElectronicas;

interface

uses
  Windows,strutils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzCmboBx, ExtCtrls, RzPanel, RzButton,
  RzBtnEdt, Mask, RzEdit, RzRadChk, DB, MemDS, DBAccess, MyAccess, RzSplit, DateUtils,
  RzLstBox, RzChkLst, RzPrgres;

type
  Tfrmboletas_mensualesElectronicas = class(TForm)
    btncerrar: TRzBitBtn;
    vendedores: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzGroupBox1: TRzGroupBox;
    RzLabel4: TRzLabel;
    edmeses: TRzNumericEdit;
    edbuscar: TRzButtonEdit;
    edbuscar2: TRzButtonEdit;
    RzLabel1: TRzLabel;
    mmconcepto: TRzMemo;
    RzLabel6: TRzLabel;
    edfecha: TRzDateTimeEdit;
    sqlgeneral: TMyQuery;
    chkgenbol: TRzCheckBox;
    chkpreview: TRzCheckBox;
    RzLabel3: TRzLabel;
    mm1: TMemo;
    RzLabel8: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel10: TRzLabel;
    mm3: TRzMemo;
    mmctacate: TRzMemo;
    RzLabel11: TRzLabel;
    lbltotal1: TLabel;
    lbltotal2: TLabel;
    lbltotal3: TLabel;
    eddias: TRzNumericEdit;
    chkult_mes: TRzCheckBox;
    clcontratos: TRzCheckList;
    RzLabel9: TRzLabel;
    sqlcontratos: TMyQuery;
    pbar: TRzProgressBar;
    Timer: TTimer;
    btnalta: TRzBitBtn;
    adjuntos: TMemo;
    cuerpo: TMemo;
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscar2ButtonClick(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscar2KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edfechaKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnocultarClick(Sender: TObject);
    procedure chkult_mesClick(Sender: TObject);
    procedure edfechaClick(Sender: TObject);
    procedure edfechaChange(Sender: TObject);
    procedure chkgenbolClick(Sender: TObject);
    procedure mm1Change(Sender: TObject);
    procedure mm3Change(Sender: TObject);
    procedure mmctacateChange(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
    //procedure cortesias(pedido, cuenta, fechacreacion, fechavencimiento, total:string)
   // procedure Mensualidad(cliente, mesesbon, hasta:integer; tipocont:string; fechatemp: tdate; bonif:boolean; tipocambio:double);
  public
    { Public declarations }
    function cobro(idcliente,mes:integer):double;
  end;

var
  frmboletas_mensualesElectronicas: Tfrmboletas_mensualesElectronicas;

implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal, Umensaje, Udmrep, Math;

{$R *.dfm}
function Tfrmboletas_mensualesElectronicas.cobro(idcliente,mes:integer):double;
begin
result:=33.22
end;


procedure Tfrmboletas_mensualesElectronicas.edbuscarButtonClick(Sender: TObject);
begin
      //BUSCAR POR CATALOGO//
  frmbusquedas.query:='Select idcliente,if(nombre<>'''' and apaterno<>'''' and amaterno<>'''',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
                      ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes order by idcliente';
  frmbusquedas.campo_retorno:='idcliente';
  frmbusquedas.campo_busqueda:='Nombre';
  frmbusquedas.tabla:='clientes';
  frmbusquedas.tblorigen := 'clientes';
  frmbusquedas.cbofiltro.ItemIndex:=1;
  frmbusquedas.cbofiltro.OnClick(self);
  frmbusquedas.ShowModal;

  if frmbusquedas.resultado <> '' then
      edbuscar.Text:=frmbusquedas.resultado;
end;

procedure Tfrmboletas_mensualesElectronicas.edbuscar2ButtonClick(Sender: TObject);
begin
      //BUSCAR POR CATALOGO//
  frmbusquedas.query:='Select idcliente,if(nombre<>'''' and apaterno<>'''' and amaterno<>'''',concat(nombre,'' '',apaterno,'' '',amaterno),nombre) as Nombre,rsocial AS Razon_Social,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
                      ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes order by idcliente';
  frmbusquedas.campo_retorno:='idcliente';
  frmbusquedas.campo_busqueda:='Nombre';
  frmbusquedas.tblorigen := 'clientes';
  frmbusquedas.tabla:='clientes';
  frmbusquedas.cbofiltro.ItemIndex:=1;
  frmbusquedas.cbofiltro.OnClick(self);
  frmbusquedas.ShowModal;

  if frmbusquedas.resultado <> '' then
      edbuscar2.Text:=frmbusquedas.resultado;
end;

procedure Tfrmboletas_mensualesElectronicas.edbuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key=#13)then
   begin
      key:=#0;
      if edbuscar.Text = '' then
         edbuscar.OnButtonClick(self)
      else
         sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
   end;

   if key = #27 then
   begin
      key:=#0;
      edbuscar.Text:='';
   end;
end;

procedure Tfrmboletas_mensualesElectronicas.edbuscar2KeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key=#13)then
   begin
      key:=#0;
      if edbuscar2.Text = '' then
         edbuscar2.OnButtonClick(self)
      else
         sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
   end;

   if key = #27 then
      begin
      key:=#0;
      edbuscar2.Text:='';
   end;
end;

procedure Tfrmboletas_mensualesElectronicas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
timer.enabled := false;
action:=cafree;
end;

procedure Tfrmboletas_mensualesElectronicas.edfechaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmboletas_mensualesElectronicas.btnaltaClick(Sender: TObject);
   var i, c, mes, hasta, cliente1, mesesbon, contador : integer;
   fechavence, pedido, fechacreacion, year, costo, origen, endolaresstring, idvendedor, idpedido1, pedtmp,cadena, cadenames,temp,fecha,monito,tipocont:string;
   tipocambio, endolares : double;
   fechatemp : TDateTime;
   bonif, ban : boolean;  dias : word;
   sqltemp : tmyquery;
   //adjuntos, cuerpo : tmemo;

procedure cortesias(pedido, cuenta, fechacreacion, fechavencimiento, total:string);
var idremision, idpago:integer;
begin
querys('select idremicion from folios',0,sqlgeneral);
idremision:=sqlgeneral.fieldbyname('idremicion').AsInteger+1;
querys('insert into RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+
       inttostr(idremision)+','+Pedido+',"'+fechacreacion+'","'+FormatDateTime('HH:mm:ss',time)+'","'+
       frmprincipal.ucprincipal.CurrentUser.LoginName+'")',1,sqlgeneral);
querys('update folios set idremicion='+inttostr(idremision),1,sqlgeneral);

querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,usuario,fecha,hora,restante) '+
       'values (0,'+cuenta+','+Pedido+','+inttostr(idremision)+',"'+datetostr(date)+'",'+total+',"'+FechaVencimiento+'","'+
       frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+datetostr(date)+'","'+timetostr(time)+'",0)',1,sQlgeneral);
querys('Select idpago from PagosClientes where idpedido ='+pedido,0,sqlgeneral);
idpago:= sqlgeneral.fieldbyname('idpago').AsInteger;

querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
       'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
       'values("P","","","PRO",10.8,'+inttostr(idpago)+', '+cuenta+','+Pedido+','+total+', "",'+inttostr(idremision)+',11,'+
       '"'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'",'+'"'+datetostr(date)+'","'+timetostr(time)+
       '","'+datetostr(date)+'",11,"'+'ABONO POR PROMOCION" )',1,dmreportes.sqlgeneral3);
querys('Update pedidos set estatus=5, saldado=1, saldo=0, FechaCierre="'+datetostr(date)+'" where idpedido='+Pedido,1,sqlgeneral);

frmprincipal.ucprincipal.Log('Remiciono el pedido #'+Pedido);
end;

begin
  // try
   sqltemp := tmyquery.Create(self);
   sqltemp.Connection := dmaccesos.conexion;

   timer.Enabled := true;
   {frmmensaje.Show;
   frmmensaje.Update;}
   bonif := false;
   if edbuscar.Text = '' then
   begin
      application.MessageBox('Falta buscar la cuenta','Atención',mb_iconwarning);
      edbuscar.SetFocus;
      exit;
   end;
   if edbuscar.Text = '' then
   begin
      application.MessageBox('Falta buscar la cuenta','Atención',mb_iconwarning);
      edbuscar2.SetFocus;
      exit;
   end;
   if edfecha.Text = '' then
   begin
      application.MessageBox('Falta la fecha','Atención',mb_iconwarning);
      edfecha.SetFocus;
      exit;
   end;
   if ((edmeses.Text = '0') or (edmeses.Text = '')) then
   begin
      application.MessageBox('Falta la cantidad de meses','Atención',mb_iconwarning);
      edmeses.SetFocus;
      exit;
   end;
   if ((eddias.Text = '0') or (eddias.Text = '')) then
   begin
      application.MessageBox('Falta los días','Atención',mb_iconwarning);
      eddias.SetFocus;
      exit;
   end;

   //traer el tipo de cambio...
   querys('select valor from configuraciones where concepto = "TipoCambio"',0,SqlGeneral);
   tipocambio:=sqlgeneral.Fields.Fields[0].asfloat;
   querys('select idUnidadNegocio from UnidadNegocio where nombre="MONITOREO" ',0,SqlGeneral);
   monito:=sqlgeneral.Fields.Fields[0].asstring;
   mm1.Clear;
   mm3.Clear;
   mmctacate.Clear;
   mesesbon:=0;
   hasta:=strtoint(edmeses.text);
   //cliente2:=strtoint(edbuscar2.Text);

   //para sacar los contratos a los que se les generaran boletas
   for i:=0 to clcontratos.Items.Count-1 do
      if clcontratos.ItemChecked[i] then
      begin
         sqlcontratos.RecNo := i+1;
         temp := temp + quotedstr(sqlcontratos.fieldbyname('TipoCont').AsString)+',';
      end;
      delete(temp,length(temp),1);
      if edbuscar.Text = edbuscar2.Text then
         if application.messagebox('¿Deseas generar Bonificacion por Cuenta Nueva?', 'Cuenta Nueva', MB_ICONQUESTION+MB_YESNO) = idyes then
         begin
            bonif := true;
            //meses de bonificacion
            mesesbon:=strtoint(GetConfiguraciones('mesesbonificacion',true));
         end;
      querys('SELECT idcliente,TipoCont,estatus from clientes where estatus = 1 and idcliente between '+
      edbuscar.Text+' and '+edbuscar2.Text+' and TipoCont in ('+temp+') order by idcliente',0,sqltemp);

      ///////////////   CICLO   ///////////////  (Clientes)
      sqltemp.First;  pbar.Percent := 0;
      while not sqltemp.Eof do
      begin
         cliente1 := sqltemp.fieldbyname('idcliente').Asinteger;
         tipocont := sqltemp.fieldbyname('TipoCont').AsString;

         mm1.text := 'Ultimo generado - '+sqltemp.fieldbyname('idcliente').AsString;
         fecha:=edfecha.Text;
         fechatemp:=strtodate(fecha);

         //GeneraBoletasAnuales(cliente1,fecha);

        // Mensualidad(cliente1, mesesbon, hasta, tipocont, fechatemp,  bonif, tipocambio);

         //si son compartidos busca el costo total
         if querys('select compartido from clientes c left join contratos con on c.TipoCont=con.tipocont '+
          ' where idcliente ='+inttostr(cliente1)+' and compartido = 1', 0, sqlgeneral) > 0 then
         begin
            querys('Select round(sum(CostoMensual),2) as costo from (select com.idcliente as Cliente,cat.CostoMensual,costoAnual '+
            'from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom left join categorias cat on c.idcategoria=cat.idcategoria '+
            'where com.idcliente='+inttostr(cliente1)+' union all select c.idcliente as Cliente, cat.CostoMensual, costoAnual from  clientes c '+
            'left join categorias cat on c.idcategoria=cat.idcategoria where c.idcliente='+inttostr(cliente1)+' ) as d', 0, sqlgeneral);
         end
         else
            //Costo de la Categoria
            querys('SELECT g.CostoMensual as costo FROM clientes as c RIGHT JOIN categorias AS g '+
            ' ON (c.idcategoria=g.idcategoria) WHERE idcliente='+inttostr(cliente1),0,sqlgeneral);
         if sqlgeneral.fieldbyname('costo').AsString = '' then
            mmctacate.Lines.Add(inttostr(cliente1));
         costo:=Format('%8.2f',[sqlgeneral.fieldbyname('costo').AsFloat]);
         querys('SELECT if(c.idvendedor = 0,1,c.idvendedor) as id,if(c.idorigen=0,99,c.idorigen) as origen '+
                ' FROM clientes as c WHERE idcliente='+inttostr(cliente1),0,sqlgeneral);
         idvendedor:=sqlgeneral.fieldbyname('id').AsString;
         origen:=sqlgeneral.fieldbyname('origen').AsString;
         //buscar el ultimo pedido para almacenar en variable y hacer consulta de boletas con ella y el utimo pedido....
         querys('select max(idpedido) from pedidos',0,SqlGeneral);
         idpedido1:=sqlgeneral.Fields.Fields[0].AsString;
         if costo <> '' then
         begin
            for c:=1 to hasta do
            begin  //meses
               mes:=strtoint(formatdatetime('m',fechatemp));
               year:=formatdatetime('yyyy',edfecha.Date);
               if  chkult_mes.checked =false then
               begin // por dias
                  fechavence:=datetostr(strtodate(fecha)+ eddias.value);
                  fechacreacion:=formatdatetime('yyyy"/"mm"/"01',fechatemp);
               end
               else
               begin // por ultimo dia
                  dias:= strtoint(GetConfiguraciones('BoletasDiaVence')); //DaysInMonth(fechatemp);
                  fechavence:=formatdatetime('yyyy"/"mm"/"',fechatemp);
                  fechavence:=fechavence+vartostr(dias);
                  fechacreacion:=formatdatetime('yyyy"/"mm"/"01',fechatemp); //fechavence+'01';
               end;

               if mes>9 then
                     cadenames:=inttostr(mes)+rightstr(inttostr(yearof(fechatemp)),2)
                  else
                     cadenames:='0'+inttostr(mes)+rightstr(inttostr(yearof(fechatemp)),2);
               //query que verifica si el cliente actual tiene pedidos de monitoreo en el
               //rango de fechas del primero al ultimo de la boleta que se esta generando
               //oscar boletas para prox anio

               querys('SELECT p.idcliente AS cli, p.idpedido, p.totmn FROM pedidos p LEFT JOIN UnidadNegocio i '+
                      'ON i.idUnidadNegocio=p.idUnidadNegocio LEFT join DetPedido dp on dp.idpedido = p.idpedido '+
                      'WHERE  p.idcliente='+inttostr(cliente1)+' and p.estatus in(0,3,4,5) '+
                      'and p.observaciones LIKE "%'+year+'%" and i.nombre="MONITOREO" and Anualidad = 0 '+
                      'and dp.cod_cve = "MON'+cadenames+'" UNION '+
                      'SELECT p.idcliente AS cli, p.idpedido, p.totmn FROM pedidos p LEFT JOIN UnidadNegocio i ON i.idUnidadNegocio=p.idUnidadNegocio '+
                      'WHERE  p.idcliente='+inttostr(cliente1)+' and p.estatus=0  and p.FechaCreacion between '+quotedstr(fechacreacion)+
                      ' and '+quotedstr(fechavence)+' and i.nombre="MONITOREO" and Anualidad = 0'
                      , 0, sqlgeneral);

               if sqlgeneral.FieldByName('cli').AsString = '' then
                  querys('select idcliente as cli from bonificaciones where NumMes='+inttostr(mes)+' and ano='+year+
                  ' and idcliente='+inttostr(cliente1),0,sqlgeneral);

               if sqlgeneral.FieldByName('cli').AsString = '' then
               begin
                  querys('select max(idpedido) from pedidos',0,SqlGeneral);
                  pedido := inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
                  pedtmp := pedido;
                  endolares:=strtofloat(Format('%8.2f',[(strtofloat(costo)*(1+GetIVA)) / tipocambio]));
                  endolaresstring:=Format('%8.2f',[endolares]);

                  //mm1.Lines.Add(inttostr(cliente1)+' '+pedido);

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
                     sqlgeneral.SQL.Add('INSERT INTO pedidos (idpedido,idcliente,usuario,fecha,hora,idorigen,idvendedor,FechaCreacion,'+
                     ' SubTotal,Iva,TotMn,Saldo,TotDlls,concepto,FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio) '+
                     ' values ('+quotedstr(pedido)+','+inttostr(cliente1)+',"'+frmprincipal.ucprincipal.CurrentUser.Username+'","'+
                     datetostr(date)+'","'+timetostr(time)+'","'+
                     origen+'",'+quotedstr(idvendedor)+','+quotedstr(fechacreacion)+','+
                     quotedstr(Format('%8.2f',[strtofloat(costo)]))+','+quotedstr(Format('%8.2f',[strtofloat(costo)*GetIVA]))+
                     ','+quotedstr(Format('%8.2f',[strtofloat(costo)*(1+GetIVA)]))+',0,'+floattostr(endolares)+','+
                     quotedstr('MONITOREO DE '+UpperCase(meses[mes])+' '+inttostr(yearof(strtodate(fechavence)))+' '+
                     getconfiguraciones('ConceptoMonitoreo',true))+','+
                     quotedstr(fechavence)+','+quotedstr(monito)+',''CA'','+Format('%8.2f',[tipocambio])+')');
                     sqlgeneral.Execute;

                     querys('INSERT INTO DetPedido(idpedido,cant,cod_cve,surtido,costo,tc,utilidad) values('+
                     quotedstr(pedido)+',1,"MON'+cadenames+'",1,'+quotedstr(costo)+',1,''A'')',1,sqlgeneral);

                     if sqlgeneral.RowsAffected>0 then
                        ban:=true;
                  except
                  end;
                  until ban;

                  if(c = 1) and (bonif = true) then
                     begin
                       cortesias(pedido, inttostr(cliente1), fechacreacion, fechavence, Format('%8.2f',[strtofloat(costo)*(1+GetIVA)]));
                     end
                  else
                     begin
                     if querys('Select TipoCont from clientes where idcliente ='+inttostr(cliente1)+
                               ' and TipoCont not in("011","004", "025", "007", "16")', 0, sqlgeneral) > 0 then
                        querys(GeneraBoletas(cliente1,strtoint(pedido),fechavence,costo),1,sqlgeneral);
                     end;

                     if tipocont='004' then
                        saldarcontratocortesia(inttostr(cliente1),pedido,fechacreacion,fechavence);

               end
               else
               begin //checar si el pedido ya tiene boletas hechas....
                  pedido := sqlgeneral.FieldByName('idpedido').AsString;
                  costo:= Format('%8.2f',[sqlgeneral.fieldbyname('totmn').AsFloat]);
                  if querys('select idpedido from boletas where idpedido = '+ pedido, 0, sqlgeneral) = 0 then
                  begin
                     if querys('Select TipoCont from clientes where idcliente ='+inttostr(cliente1)+
                               ' and TipoCont not in("011","004", "025", "007", "16")', 0, sqlgeneral) > 0 then
                        querys(GeneraBoletas(cliente1,strtoint(pedido),fechavence,costo),1,sqlgeneral);
                  end
                  else
                    mm3.Lines.Add(inttostr(cliente1)+' '+meses[mes]);
               end;
               fechatemp:=IncMonth(fechatemp);
               fecha:=datetostr(fechatemp);
            end;//for c hasta
         //if chkgenbol.Checked then
         //begin
            //querys('SELECT distinct p.idpedido,p.concepto as Concepto, '+
            // 'b.CodBarras,b.CodBanco,b.CodBBVA, b.CodBanorte,'+
            // 'b.FechaLarga,b.idcliente,b.cargo, c.email, if(cf.rsocial is null and cf.nombre is null,' +
            // ClienteNombre('c') + ','+ ClienteNombre('cf') +') as nombre, "'+GetConfiguraciones('convenioBBVA')+'" as convenio '+
            // ' FROM  boletas b Left join clientes c on c.idcliente =b.idcliente '+
            // ' LEFT JOIN ClientesFact cf ON (cf.idfact = c.idfact) left join pedidos p on p.idpedido = b.idpedido '+
            // ' WHERE b.idcliente = '+inttostr(cliente1)+' and b.FechaVence >='+
            // quotedstr(datetostr(edfecha.Date))+' and tipo = ''M'' order by b.FechaVence',0,dmreportes.sqlgeneral);
            querys('set @i = 0', 1, dmreportes.sqlgeneral);
            querys('select max(idpedido1) as idpedido1, max(Concepto1) as Concepto1,idcliente, left(nombre,40) as nombre, email, max(CodBarras1) as CodBarras1, max(CodBanco1) as CodBanco1,' +
                    'max(CodBBVA1) as CodBBVA1, max(CodBanorte1) as CodBanorte1, max(CodBanamex1) as CodBanamex1, max(FechaLarga1) as FechaLarga1, ' +
                    'max(cargo1) as cargo1, max(convenio1) as convenio1,' +
                    'max(idpedido2) as idpedido2, max(Concepto2) as Concepto2, max(CodBarras2) as CodBarras2, max(CodBanco2) as CodBanco2,' +
                    'max(CodBBVA2) as CodBBVA2, max(CodBanorte2) as CodBanorte2, max(CodBanamex2) as CodBanamex2, max(FechaLarga2) as FechaLarga2, ' +
                    'max(cargo2) as cargo2, max(convenio2) as convenio2, titulo, (select valormemo from configuraciones where concepto like "%BoletasTextoInferior%") as leyendainferior ' +
                    ' from (' +
                    ' select id, if(m=1, idpedido, '''') as idpedido1, if(m=1, Concepto, '''') as Concepto1,idcliente, nombre, email, if(m=1, CodBarras, '''') as CodBarras1, ' +
                    'if(m=1, CodBanco, '''') as CodBanco1,if(m=1, CodBBVA, '''') as CodBBVA1, if(m=1, CodBanorte, '''') as CodBanorte1, if(m=1, CodBanamex, '''') as CodBanamex1, ' +
                    'if(m=1, FechaLarga, '''') as FechaLarga1, if(m=1, cargo, 0) as cargo1,  if(m=1, convenio, '''') as convenio1,' +
                    'if(m=0, idpedido, '''') as idpedido2, if(m=0, Concepto, '''') as Concepto2, if(m=0, CodBarras, '''') as CodBarras2, if(m=0, CodBanco, '''') as CodBanco2,' +
                    'if(m=0, CodBBVA, '''') as CodBBVA2, if(m=0, CodBanorte, '''') as CodBanorte2, if(m=0, CodBanamex, '''') as CodBanamex2, if(m=0, FechaLarga, '''') as FechaLarga2, ' +
                    'if(m=0, cargo, 0) as cargo2, if(m=0, convenio, '''') as convenio2, concat(titulo, " ", t2) as titulo ' +
                    ' from( select @i := IF ( isnull(@i) ,@i := 0, @i := (@i + 1)) AS n, @i - (MOD(@i, 2) - 1) *- 1 AS ID, MOD (@i, 2) AS m, '+
                    'idpedido, idboleta, Concepto, idcliente, nombre, email, CodBarras, CodBanco, CodBBVA, CodBanorte, CodBanamex, FechaLarga, cargo, convenio, titulo, t2 '+
                    ' from (' +
                    ' SELECT distinct p.idpedido, b.idboleta, p.concepto as Concepto, b.idcliente,' +
                    'if(cf.rsocial is null and cf.nombre is null,' + ClienteNombre('c') + ','+ ClienteNombre('cf') +') as nombre, c.email,' +
                    'b.CodBarras,b.CodBanco,concat(b.CodBBVA," ","' + GetConfiguraciones('convenioBBVA') + '") as CodBBVA, '+
                    'concat(b.CodBanorte," ","' + GetConfiguraciones('convenioBanorte') + '") as CodBanorte, '+
                    'b.CodBanamex,concat("Vence ",b.FechaLarga) as FechaLarga,b.cargo, "' + GetConfiguraciones('convenioBBVA')+ '" as convenio, '+
                    'case p.idUnidadNegocio when 4 then "REFERENCIAS DE PAGO PARA MONITOREO" when 2 then "REFERENCIAS DE PAGO PARA SERVICIOS" '+
                    ' when 5 then "REFERENCIAS DE PAGO PARA INTERESES" else "REFERENCIAS DE PAGO PARA EQUIPO" end as titulo, year(b.fechavence) as t2  '+
                    ' FROM  boletas b Left join clientes c on c.idcliente =b.idcliente ' +
                    'LEFT JOIN ClientesFact cf ON (cf.idfact = c.idfact) ' +
                    'left join pedidos p on p.idpedido = b.idpedido' +
                    ' WHERE b.idcliente = '+inttostr(cliente1)+' and b.FechaVence >='+ quotedstr(datetostr(edfecha.Date)) +' and tipo = ''M'' ' +
                    ' ORDER BY left(concepto,12), FechaVence) as pre ) as t) as a group by ID  ORDER BY ID' ,0,dmreportes.sqlgeneral);
            if dmreportes.sqlgeneral.RecordCount > 0 then
            begin
              if (chkpreview.Checked = true) then
              begin
                operacionreporte('boletasElectronicas', 'boletasElectronicas', 'IMP',1);
              end;

              if (chkgenbol.Checked = true) then
              begin
                operacionreporte('boletasElectronicas', 'boletasElectronicas', 'PDFC',1);
                if dmreportes.sqlgeneral.fieldbyname('email').AsString <> '' then
                begin
                  cadena := GetConfiguraciones('SmtpServerSenderMasivo', true);
                  adjuntos.Clear;
                  cuerpo.Clear;
                  //merge los PDFS
                  MergeFiles(uprincipal.my_path+'AnexoBoletas2013.pdf',uprincipal.my_path+'boletasElectronicas'+frmprincipal.idmaq+'.pdf', uprincipal.my_path+'BoletasElectronicas.pdf');

                  //agregar params para envio de correo
                  adjuntos.Lines.Add(uprincipal.my_path+'BoletasElectronicas.pdf');
                  cuerpo.lines.Add(GetConfiguraciones('SmtpSeverMSNMasivo', true));
                  if send_email(cadena,cadena,dmreportes.sqlgeneral.fieldbyname('email').AsString,GetConfiguraciones('SmtpSeverSubMasivo', true),adjuntos,cuerpo,2) = -1 then
                  begin
                    cadena := 'INSERT INTO BoletasNoEnviadas(idcliente, email, fechaenvio, horaenvio) VALUES ('+dmreportes.sqlgeneral.fieldbyname('idcliente').AsString+
                              ', "'+dmreportes.sqlgeneral.fieldbyname('email').AsString+'", curdate(), curtime())';
                    querys(cadena, 1, dmreportes.sqlgeneral2);
                  end;
                end
                else
                begin
                  cadena := 'INSERT INTO BoletasNoEnviadas(idcliente, email, fechaenvio, horaenvio) VALUES ('+dmreportes.sqlgeneral.fieldbyname('idcliente').AsString+
                            ', "'+dmreportes.sqlgeneral.fieldbyname('email').AsString+'", curdate(), curtime())';
                  querys(cadena, 1, dmreportes.sqlgeneral2);
                end;
              end;
            end;
        //end;
      end;

      sqltemp.Next;
      pbar.Percent := Ceil((sqltemp.RecNo*100)/sqltemp.RecordCount);

      if Win32Platform = VER_PLATFORM_WIN32_NT then
          SetProcessWorkingSetSize(GetCurrentProcess, $FFFFFFFF, $FFFFFFFF);
   end;

   if frmmensaje.Showing then
      frmmensaje.Close;
   edbuscar.Text:='';
   edbuscar2.Text:='';
{   finally
   sqltemp.Free;
   end;    }
end;
{
procedure Tfrmboletas_mensuales.Mensualidad(cliente, mesesbon, hasta:integer; tipocont:string; fechatemp: tdate; bonif:boolean; tipocambio:double);
var sqlgen:TMyQuery;
   c,mes,contador:integer;    //  j, h,i,  cliente,   idpedido2, hasta,cliente1,cliente2, mesesbon,
   costo,pedido,fecha,idvendedor,fechavence,fechacreacion,year,origen,endolaresstring,monito,idpedido1,pedtmp,cadenames:string;     // temp,
   endolares:double;      //tipocambio,
   dias:word; ban :boolean;    // bonif,

procedure cortesias(pedido, cuenta, fechacreacion, fechavencimiento, total:string);
var idremision, idpago:integer;
begin
querys('select idremicion from folios',0,sqlgeneral);
idremision:=sqlgeneral.fieldbyname('idremicion').AsInteger+1;
querys('insert into RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+
       inttostr(idremision)+','+Pedido+',"'+fechacreacion+'","'+FormatDateTime('HH:mm:ss',time)+'","'+
       frmprincipal.ucprincipal.CurrentUser.LoginName+'")',1,sqlgeneral);
querys('update folios set idremicion='+inttostr(idremision),1,sqlgeneral);

querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,usuario,fecha,hora,restante) '+
       'values (0,'+cuenta+','+Pedido+','+inttostr(idremision)+',"'+datetostr(date)+'",'+total+',"'+FechaVencimiento+'","'+
       frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+datetostr(date)+'","'+timetostr(time)+'",0)',1,sQlgeneral);
querys('Select idpago from PagosClientes where idpedido ='+pedido,0,sqlgeneral);
idpago:= sqlgeneral.fieldbyname('idpago').AsInteger;

querys('INSERT INTO PagosClientes (moneda,cheque,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
       'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
       'values("P","","","PRO",10.8,'+inttostr(idpago)+', '+cuenta+','+Pedido+','+total+', "",'+inttostr(idremision)+',11,'+
       '"'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'",'+'"'+datetostr(date)+'","'+timetostr(time)+
       '","'+datetostr(date)+'",11,"'+'ABONO POR PROMOCION" )',1,dmreportes.sqlgeneral3);
querys('Update pedidos set estatus=5, saldado=1, saldo=0, FechaCierre="'+datetostr(date)+'" where idpedido='+Pedido,1,sqlgeneral);

frmprincipal.ucprincipal.Log('Remiciono el pedido #'+Pedido);
end;

begin
  sqlgen := TMyQuery.Create(nil);
   sqlgen.Connection := DMAccesos.conexion;

   //si son compartidos busca el costo total
   if querys('select compartido from clientes c left join contratos con on c.TipoCont=con.tipocont '+
          ' where idcliente ='+inttostr(cliente)+' and compartido = 1', 0, sqlgen) > 0 then
   begin
      querys('Select round(sum(CostoMensual),2) as costo from (select com.idcliente as Cliente,cat.CostoMensual,costoAnual '+
             'from clientesCompartido com left join clientes c on c.idcliente=com.idclienteCom left join categorias cat on c.idcategoria=cat.idcategoria '+
             'where com.idcliente='+inttostr(cliente)+' union all select c.idcliente as Cliente, cat.CostoMensual, costoAnual from  clientes c '+
             'left join categorias cat on c.idcategoria=cat.idcategoria where c.idcliente='+inttostr(cliente)+' ) as d', 0, sqlgen);
   end
   else
      //Costo de la Categoria
      querys('SELECT g.CostoMensual as costo FROM clientes as c RIGHT JOIN categorias AS g '+
             ' ON (c.idcategoria=g.idcategoria) WHERE idcliente='+inttostr(cliente),0,sqlgen);
      if sqlgen.fieldbyname('costo').AsString = '' then
            mmctacate.Lines.Add(inttostr(cliente));

      costo:=Format('%8.2f',[sqlgen.fieldbyname('costo').AsFloat]);
      querys('SELECT if(c.idvendedor = 0,1,c.idvendedor) as id,if(c.idorigen=0,99,c.idorigen) as origen '+
             ' FROM clientes as c WHERE idcliente='+inttostr(cliente),0,sqlgen);
      idvendedor:=sqlgen.fieldbyname('id').AsString;
      origen:=sqlgen.fieldbyname('origen').AsString;

      //buscar el ultimo pedido para almacenar en variable y hacer consulta de boletas con ella y el utimo pedido....
      querys('select max(idpedido) from pedidos',0,sqlgen);
      idpedido1:=sqlgen.Fields.Fields[0].AsString;

      if costo <> '' then
      begin
         for c:=1 to hasta do
         begin  //meses
            mes:=strtoint(formatdatetime('m',fechatemp));
            year:=formatdatetime('yyyy',edfecha.Date);

            if  chkult_mes.checked =false then
            begin // por dias
               fechavence:=datetostr(strtodate(fecha)+ eddias.value);
               fechacreacion:=formatdatetime('yyyy"/"mm"/"01',fechatemp);
            end
            else
            begin // por ultimo dia
               dias:=DaysInMonth(fechatemp);
               fechavence:=formatdatetime('yyyy"/"mm"/"',fechatemp);
               fechavence:=fechavence+vartostr(dias);
               fechacreacion:=formatdatetime('yyyy"/"mm"/"01',fechatemp); //fechavence+'01';
            end;

            if mes > 9 then
               cadenames:=inttostr(mes)+rightstr(inttostr(yearof(fechatemp)),2)
            else
               cadenames:='0'+inttostr(mes)+rightstr(inttostr(yearof(fechatemp)),2);

            //query que verifica si el cliente actual tiene pedidos de monitoreo en el
            //rango de fechas del primero al ultimo de la boleta que se esta generando
            //oscar boletas para prox anio

            querys('SELECT p.idcliente AS cli FROM pedidos p LEFT JOIN UnidadNegocio i '+
                   'ON i.idUnidadNegocio=p.idUnidadNegocio LEFT join DetPedido dp on dp.idpedido = p.idpedido '+
                   'WHERE  p.idcliente='+inttostr(cliente)+' and p.estatus in(0,3,4,5) '+
                   'and p.observaciones LIKE "%'+year+'%" and i.nombre="MONITOREO" and Anualidad = 0 '+
                   'and dp.cod_cve = "MON'+cadenames+'" UNION '+
                   'SELECT p.idcliente AS cli FROM pedidos p LEFT JOIN UnidadNegocio i ON i.idUnidadNegocio=p.idUnidadNegocio '+
                   'WHERE  p.idcliente='+inttostr(cliente)+' and p.estatus=0  and p.FechaCreacion between '+quotedstr(fechacreacion)+
                   ' and '+quotedstr(fechavence)+' and i.nombre="MONITOREO" and Anualidad = 0', 0, sqlgen);

            if sqlgen.FieldByName('cli').AsString = '' then
               querys('select idcliente as cli from bonificaciones where NumMes='+inttostr(mes)+' and ano='+year+
                      ' and idcliente='+inttostr(cliente),0,sqlgen);

            if sqlgen.FieldByName('cli').AsString = '' then
            begin
               querys('select max(idpedido) from pedidos',0,sqlgen);
               pedido := inttostr(sqlgen.Fields.Fields[0].Asinteger+1);
               pedtmp := pedido;
               endolares:=strtofloat(Format('%8.2f',[(strtofloat(costo)*(1+GetIVA)) / tipocambio]));
               endolaresstring:=Format('%8.2f',[endolares]);

               contador:=0;
               ban:=false;
               repeat
                  try
                     inc(contador);
                     if contador >= 3 then
                        ban:=true;
                     if contador > 1 then
                        pedido:=inttostr(strtoint(pedido)+1);

                     querys('INSERT INTO pedidos (idpedido,idcliente,usuario,fecha,hora,idorigen,idvendedor,FechaCreacion,'+
                     ' SubTotal,Iva,TotMn,Saldo,TotDlls,concepto,FechaVencimiento,idUnidadNegocio,FormaPago,TipoCambio) '+
                     ' values ('+quotedstr(pedido)+','+inttostr(cliente)+',"'+frmprincipal.ucprincipal.CurrentUser.Username+'","'+
                     datetostr(date)+'","'+timetostr(time)+'","'+
                     origen+'",'+quotedstr(idvendedor)+','+quotedstr(fechacreacion)+','+
                     quotedstr(Format('%8.2f',[strtofloat(costo)]))+','+quotedstr(Format('%8.2f',[strtofloat(costo)*GetIVA]))+
                     ','+quotedstr(Format('%8.2f',[strtofloat(costo)*(1+GetIVA)]))+',0,'+floattostr(endolares)+','+
                     quotedstr('MONITOREO DE '+UpperCase(meses[mes])+' '+inttostr(yearof(strtodate(fechavence)))+' '+
                     getconfiguraciones('ConceptoMonitoreo',true))+','+
                     quotedstr(fechavence)+','+quotedstr(monito)+',''CA'','+Format('%8.2f',[tipocambio])+')', 1, sqlgen);

                     querys('INSERT INTO DetPedido(idpedido,cant,cod_cve,surtido,costo,tc,utilidad) values('+
                     quotedstr(pedido)+',1,"MON'+cadenames+'",1,'+quotedstr(costo)+',1,''A'')',1,sqlgen);

                     if sqlgen.RowsAffected>0 then
                        ban:=true;
                  except
                  end;
                  until ban;

                  if((c = 1) or (c = 3)) and (bonif = true) then
                     cortesias(pedido, inttostr(cliente), fechacreacion, fechavence, Format('%8.2f',[strtofloat(costo)*(1+GetIVA)]))
                  else
                  begin
                     if querys('Select TipoCont from clientes where idcliente ='+inttostr(cliente)+
                               ' and TipoCont not in("011","004", "025", "007", "16")', 0, sqlgen) > 0 then
                        querys(GeneraBoletas(cliente,strtoint(pedido),fechavence,costo),1,sqlgen);
                  end;

                  if tipocont='004' then
                     saldarcontratocortesia(inttostr(cliente),pedido,fechacreacion,fechavence);

               end
               else //ya tiene boletas hechas....
                  mm3.Lines.Add(inttostr(cliente)+' '+meses[mes]);

               fechatemp:=IncMonth(fechatemp);
               fecha:=datetostr(fechatemp);
            end;//for c hasta

         if chkgenbol.Checked then
         begin
            querys('SELECT distinct pedidos.idpedido,pedidos.concepto as Concepto,boletas.CodBarras,boletas.CodBanco,boletas.CodBBVA, boletas.CodBanorte,boletas.FechaLarga,boletas.idcliente,boletas.cargo, ' +
                   ' ClientesFact.NombreCres as nombre FROM  boletas Left join clientes c on c.idcliente =boletas.idcliente '+
                   'LEFT JOIN ClientesFact ON (ClientesFact.idfact = c.idfact) left join pedidos on pedidos.idpedido = boletas.idpedido '+
                   ' WHERE boletas.idcliente = '+inttostr(cliente)+' and boletas.FechaVence >='+quotedstr(datetostr(edfecha.Date))+' and tipo = ''M'' order by boletas.FechaVence',0,dmreportes.sqlgeneral);

         // frmmensaje.Close;
         if dmreportes.sqlgeneral.RecordCount > 0 then
         begin
            if (chkpreview.Enabled = true) and (chkpreview.Checked = false) then
              OperacionReporte('boletas', 'boletas', 'IMPD',1)
            else
              OperacionReporte('boletas', 'boletas', 'IMP',1);
         end;
      end;
   end;  
end;       }

procedure Tfrmboletas_mensualesElectronicas.FormShow(Sender: TObject);
var fecha:string;
i : integer;
begin
fecha:=formatdatetime('yyyy"/"mm"/"',now);
fecha:=fecha + '01';
edfecha.Date:=strtodate(fecha);
edbuscar.setfocus;
querys('select TipoCont,nombre from contratos where estatus = 1 order by nombre',0,sqlcontratos);
clcontratos.Clear;
sqlcontratos.First;
i:=0;
while not sqlcontratos.Eof do
 begin
  clcontratos.Items.Add(sqlcontratos.fieldbyname('TipoCont').AsString+' - '+sqlcontratos.fieldbyname('nombre').AsString);
  sqlcontratos.Next;
  clcontratos.ItemChecked[i] := true;
  inc(i);
 end;
end;

procedure Tfrmboletas_mensualesElectronicas.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmboletas_mensualesElectronicas.btnocultarClick(Sender: TObject);
begin
//sp1.Visible:=false;
end;

procedure Tfrmboletas_mensualesElectronicas.chkult_mesClick(Sender: TObject);
begin
 if chkult_mes.checked = false then
   eddias.enabled:=true
 else
   eddias.enabled:=false;
end;

procedure Tfrmboletas_mensualesElectronicas.edfechaClick(Sender: TObject);
begin
edmeses.Text:=inttostr(13 - monthof(edfecha.Date));
end;

procedure Tfrmboletas_mensualesElectronicas.edfechaChange(Sender: TObject);
begin
edmeses.Text:=inttostr(13 - monthof(edfecha.Date));
end;

procedure Tfrmboletas_mensualesElectronicas.chkgenbolClick(Sender: TObject);
begin
//chkpreview.enabled := chkgenbol.Checked;
end;

procedure Tfrmboletas_mensualesElectronicas.mm1Change(Sender: TObject);
begin
lbltotal1.Caption := 'Total: '+inttostr(mm1.Lines.Count);
end;

procedure Tfrmboletas_mensualesElectronicas.mm3Change(Sender: TObject);
begin
lbltotal2.Caption := 'Total: '+inttostr(mm3.Lines.Count);
end;

procedure Tfrmboletas_mensualesElectronicas.mmctacateChange(Sender: TObject);
begin
lbltotal3.Caption := 'Total: '+inttostr(mmctacate.Lines.Count);
end;

procedure Tfrmboletas_mensualesElectronicas.TimerTimer(Sender: TObject);
begin
timer.enabled := false;
sleep(20000);
timer.Enabled := true;
end;

End.
