{
2011/07/17 dalyla quitar comitas dobles en sector between "" and ""
2011//12/01 dalyla correcion a reporte de cancelados y morosos no tenia auditoria
2011/11/05 dalyla agregar reporte de cancelado y morosos en auditoria
                  y el de pagos x linea anualidad
2011/10/18 dalyla modificacion a tiempo y traslado patrulleros
                  y estandares de patrullero
------------------3--------------------------------------------------------------
2010/11/03 dalyla reporte de pagos po linea eiso
2010/09/16 BICENTENARIO (0 o) dalyla Guardar  RepPagosXLineaDet
2010/08/24 Oscar Modificaion al reporte RepPagosXLineaMon
2010/08/14 dalyla Reporte de pagos x linea de monitoreo en resumen dividir Mas de Un mes
2010/03/25 Oscar Reporte de clientes x categoria
///////////////////////////////////////////////////////////////////////////////
2009/06/11 dalyla correccion tend vendedores cmapo tendencia
2009/06/01 dalyla no traiga nombres por el codigo2 vacio
2009/05/22 dalyla cieere de compras
2009/03/18 dalyla pagos por linea sabado se regrese a viernes y no jueves
2009/02/06 Oscar Remisionadomensual idcliente
2009/01/20 dalyla tendencia de servicios por dias habiles en estandares
--------------------------------------------------------------------------------
2008/11/06 dalyla tendencia de vendedores se guarde
2008/10/28 dalyla dias habiles en el total trabajados de tend, serv.
2008/09/18 dalyla tendencia de servicios sea por dias habiles (Veronica)
2008/08/18 dalyla correcion de fecha reestandares insatalaciones
2008/07/18 dalyla modificaciones en reportes oxxos (nombres)
2008/07/02 dalyla tickets pendientes no null en anio
2008/06/27 oscar reporte de cuantas morosas
2008/05/28 oscar correccion al RepEstandaresCentral agrege UNION ALL
2008/05/16 oscar reporte de lo remisionado por mes
2008/04/30 dalyla estandar instaladores
2008/04/25 dalyla obras en proceso de instalaciones
2008/04/15 dalyla tickets pendientes FormatDateTime('HH:mm:ss',Time))
2008/03/06 dalyla CuentasXContrato
2008/02/28 dalyla zona horaria ok
2008-01-17 Oscar  Agregue el procedure de reporte de estadisticas servicios
--------------------------------------------------------------------------------
2007/12/07 Dalila RepAntiguedadSaldosConcentrado(mes,ano,TipoImpresion:string);
2007/11/01 DALILA ServTotAnualClientes;
2007/10/31 DALILA Agregue TickPendTec; y quite de recursos ServTotAnual;
}///////////////////////////////////////////////////////////////////////////////
unit Ureportes;

interface
uses Clipbrd, Windows, Messages,dateutils, SysUtils,strutils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, RzTabs, RzButton, StdCtrls, RzLabel, Mask,
  RzEdit, RzDBEdit, ExtCtrls, RzPanel, DB, MemDS, DBAccess, MyAccess, DBCtrls,
  RzDBCmbo,RzCmboBx, RzDBBnEd, Buttons, RzRadGrp, RzDBRGrp, ComCtrls, RzDBNav,
  RzRadChk, RzDBChk, RzBtnEdt, RzSpnEdt, ToolWin,ActnList,IdComponent, RpSystem,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent, nrcomm,
  IdMessage, nrcommtapi, nrclasses, nrcommbox, RpRave, RpDefine, RpCon, RpConDS,
  RpBase, LMDCustomComponent, LMDIniCtrl, RzShellDialogs, RzLaunch, pptypes;

{ Procedures }
procedure CentralerosTicketsDet(finicio, ffinal:string);
procedure DetallePositivos(dfecha1, dfecha2:string);
procedure masdedostickets(finicio, ffinal:string; proceso:integer);
procedure OxxosAPAAFA(dfecha1,dfecha2, activacion, year:string);
procedure PositivosDias(oxxo:boolean; year:string);
procedure PositivosHoras(oxxo:boolean; year:string);
procedure RepEstadoCuenta(idcliente, TipoImpresion:string);
procedure RepServClientes(anio:Integer);
procedure RepTarjetaCliente(idcliente, TipoImpresion, orden:string; fecha1, fecha2:TDate);
procedure ServTotAnualClientes(TipoImpresion, MayorA:string;Estatus:Integer);
procedure TickPendTec; //Saca tickets pendientes de Servicios
procedure TickFinalizados;
procedure RepAntiguedadSaldosConcentrado(mes,ano,TipoImpresion:string);
procedure RepEstandaresInstalaciones(f1,f2,TipoImpresion:string);
procedure RepEstandaresServicios(desde,hasta,TipoImpresion:string;meta,condicion:integer);
procedure RepPagosXLineaTipoCobro(const dfecha1,dfecha2,edusuario1,edusuario2,TipoImpresion:string;ckbtodos,Guardar:boolean);
procedure RepEstandaresCentral(desde,hasta,TipoImpresion:string);
procedure RepEstandaresCobranza(ano,mes,TipoImpresion:string);
procedure RecClientesAbogado(desde,hasta:TDateTime;TipoImpresion:string;print:bool);
procedure RepTendenciaCobranza(TipoImpresion:string;print:bool);
procedure RepPedidosMes(mes,nummes,ano,TipoImpresion:string);
procedure CuentasXContrato;
procedure RemisionadoCobradoMes;
procedure RemisionesMonEnero;
procedure CuentasActivasContrato(mes,idmes,ano, tipo, tipoimpresion:string);
procedure CuentasRemisionadas(mes, tipo, tipoimpresion:string);
procedure CobradoDelMesRemisionado(mes:integer;ano,tipo,tipoimpresion:string);
procedure RemisionadoDelMes(mes:integer;ano,tipo,tipoimpresion:string);
procedure NoRemisionadoDelMes(mes:integer;ano,tipo,tipoimpresion:string);
procedure CobradoRemProceso(mes:integer;ano,tipo,tipoimpresion:string);  
procedure remisionadoMensual(mes:integer;ano,ctaini,ctafin,contrato,giro,pagos,descuentos,nuevas,canceladas,fechapago,tipoimpresion:string;estatus:integer);
procedure ReporteArticulosVendidosPorPeriodo(fecha1,fecha2,tiporeporte,tipoimpresion:string);
procedure saldosmorosos;
procedure RepCobranzaXVencer;
procedure PagosFinMes(fecha:tdatetime);
procedure pagosBanco(desde,hasta,tipoimpresion:string);
procedure RepAntiguedadSaldosFacConcentrado(mes,ano,TipoImpresion:string);
procedure TendenciaVendedoresTotales(mesr,anor:string;guardar, pormeses, totalesventas, totalescuentas, vendedores, novendedores:boolean; TipoImpresion:string);
procedure RepPagosXLineaMon(const dfecha1,dfecha2,TipoImpresion:string;ckbtodos, Mon:boolean);
procedure RepCompras(mes,ano,f1, f2:string; guardar:boolean);
procedure RepMotCancelacion(f1, f2:string);
procedure RepCajaMensual(mes,ano:string; guardar:boolean);
procedure RepCuentasxCategoria(fecha1,fecha2,tipoimpresion:string);
procedure RepClientesRFC(de,hasta:string);
procedure RepPagosXLineaDet(mes, ano:string; guardar:integer);
procedure CanceladosYMorosos(mes, ano, sectorini, sectorfin, TipoImpresion:string; guardar:integer; auditoria:boolean=false);
//procedure SectoresVencidos(fecha1, fecha2, sector1, sector2, unidad1, unidad2, idabogado, TipoImpresion:string;
//          rgpuesto:integer; bloqueados, normales, forzosos, noreporte, sinenlace, sms, guardar:boolean);


{ Functions }

implementation

uses Urecursos, Uprincipal, Udm, Udmrep, Umensaje;

procedure ReporteArticulosVendidosPorPeriodo(fecha1,fecha2,tiporeporte,tipoimpresion:string);
begin
with dmreportes do begin
  if(tiporeporte= 'CON') then
   begin
        querys('select "'+ 'Del Periodo '+fecha1+ ' al '+ fecha2  +'" as periodo, dp.cod_cve,a.nombre,sum(cant) as cantidad from pedidos as p inner join DetPedido as dp on(dp.idpedido =p.idpedido) left join articulos as a on(a.cod_cve=dp.cod_cve) '+
               ' where p.FechaRemision between "'+fecha1+'" and "'+fecha2+'"  and p.estatus in(3,4)  and a.inventariable = 1 group by cod_cve order by cantidad desc ',0,sqlgeneral);
               if (sqlgeneral.recordcount > 0) then
                  OperacionReporte('RepArtVendXPeriodo', 'reporte de articulso', TipoImpresion, 1);
   end else
   begin
        querys('select "'+ 'Del Periodo '+fecha1+ ' al '+ fecha2  +'" as periodo, p.FechaRemision as FechaCreacion,dp.idpedido,p.idfactura,dp.cant,dp.cod_cve,a.nombre from pedidos as p inner join DetPedido as dp on(dp.idpedido =p.idpedido) '+
               ' left join articulos as a on(a.cod_cve=dp.cod_cve) where p.FechaRemision between "'+fecha1+'" and "'+fecha2+'" and p.estatus in(3,4) and a.inventariable = 1 order by dp.cod_cve',0,sqlgeneral);
               if(sqlgeneral.recordcount > 0) then
                  OperacionReporte('RepArtVendXPeriodoDet', 'reporte de articulos', TipoImpresion, 1)
               else
                  application.MessageBox('No hay datos para mostrar','Aviso',MB_OK+MB_ICONASTERISK);
   end;


end;

end;

procedure RepTendenciaCobranza(TipoImpresion:string;print:bool);
var dia,m,y,titulo1,mes:string;
    dias,mmeses,Cdia,Cano,Cmes,c,CMesDias:integer;   //  Csem,
    FechaConciliacion:Tdatetime;
    Arreglo : array[0..17] of string;
    Wano,Wmes:word;
begin
with dmreportes do
  begin
  querys('DROP TABLE IF EXISTS temp_contratos0'+frmprincipal.idmaq,1,sqlgeneral7);

  FechaConciliacion:=Date-1;   // saco el dia a comparar menos uno.
  Cmes := monthof(FechaConciliacion); // el mes en numero.
  CMesDias := Cmes;
  mes := meses[monthof(FechaConciliacion)]; // saco el NOMBRE del mes a comparar
  Cdia := dayof(FechaConciliacion);  // dia del mes.
  mmeses := Cmes;
  Cano := yearof(FechaConciliacion);

  querys('CREATE TABLE temp_contratos0'+frmprincipal.idmaq+' (tipo varchar(50),columna0 double default 0, '+
         'columna1 double default 0,columna2 double default 0,columna3 double default 0,columna4 double default 0, '+
         'columna5 double default 0,mes7 double default 0,mes8 double default 0, mes9 double default 0, '+
         'mes10 double default 0,mes11 double default 0,mes12 double default 0,mes13 double default 0, '+
         'mes14 double default 0,mes15 double default 0,mes16 double default 0,mes17 double default 0,'+
         'mes18 double default 0, clasificacion int(11) default 0)',1,sqlgeneral7);

  //Saca el dia de ayer para la columna 0   (saldos y cuentas)

  querys('INSERT INTO temp_contratos0'+frmprincipal.idmaq+'(tipo,columna0,clasificacion) '+
         'SELECT "SALDOS", D'+inttostr(dayof(FechaConciliacion))+', clasificacion '+
         'FROM Cobranza where mes='+quotedstr(mes)+' and fecha ='+inttostr(cano)+' and concepto= "SALDO"  '+
         'and tipo = "CONSOLIDADO"',1,sqlgeneral7);

  querys('INSERT INTO temp_contratos0'+frmprincipal.idmaq+'(tipo,columna0,clasificacion) '+
         'SELECT "CUENTAS", D'+inttostr(dayof(FechaConciliacion))+',clasificacion '+
         'FROM Cobranza where mes='+quotedstr(mes)+' and fecha ='+inttostr(cano)+' and concepto= "CUENTAS" '+
         'and tipo = "CONSOLIDADO"',1,sqlgeneral7);

  querys('INSERT INTO temp_contratos0'+frmprincipal.idmaq+'(tipo,columna0,clasificacion) '+
         'SELECT "SALDOS", D'+inttostr(dayof(FechaConciliacion))+', 5 '+
         'FROM CobranzaXVencer where mes='+quotedstr(mes)+' and ano ='+inttostr(cano)+' and concepto= "SALDO"  '+
         'and tipo = "CONSOLIDADO"',1,sqlgeneral7);

  querys('INSERT INTO temp_contratos0'+frmprincipal.idmaq+'(tipo,columna0,clasificacion) '+
         'SELECT "CUENTAS", D'+inttostr(dayof(FechaConciliacion))+',5 '+
         'FROM CobranzaXVencer where mes='+quotedstr(mes)+' and ano ='+inttostr(cano)+' and concepto= "CUENTAS" '+
         'and tipo = "CONSOLIDADO"',1,sqlgeneral7);

  //Sacamos las columnas del 1 al 5 ..que son las comparaciones del mismo dia otros meses

  Arreglo[0] := inttostr(dayof(FechaConciliacion))+mes;
  for  c := 1 to 5 do
    begin
    dias := Cdia;
    if CMesDias = 1 then //si es uno y le resto uno entoces estoy en otro ano ay que restar un ano a la fecha
      begin
      Cano := Cano -1;
      mmeses := 12;
      CMesDias := 12;
      end
    else
      if mmeses >1 then
        mmeses := mmeses-1
      else
        begin
        mmeses := 12;
        Cano := Cano -1;
        end;

    //repeat   lo quite para que salga exactamente el mismo dia
      if dias < 10 then
        dia := '0'+inttostr(dias)
      else
        dia := inttostr(dias);

      if mmeses < 10 then
        m := '0'+inttostr(mmeses)
      else
        m := inttostr(mmeses);

      FechaConciliacion := strtodate(inttostr(Cano)+'/'+m+'/'+dia);
      //Csem := dayofweek(FechaConciliacion);
      dias := dias+1;

      if dias > DaysInMonth(FechaConciliacion) then
        begin
        //dias :=1;
        if mmeses = 12 then
          begin
          Cano := Cano+1;
          mmeses := 1;
          end
        else
          mmeses := mmeses + 1;
        end;

      {if Csem = 1 then
         Csem := 7;}

    //until Csem < 7  ;


    mes := meses[mmeses];
    y := inttostr(c);

    Arreglo[c] := inttostr(dayof(FechaConciliacion))+mes;
    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',Cobranza SET columna'+y+' = D'+inttostr(dayof(FechaConciliacion))+'  where mes='+quotedstr(meses[mmeses])+' and fecha = '+inttostr(Cano)+' and concepto= ''SALDO'' and Cobranza.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion=Cobranza.clasificacion and temp_contratos0'+frmprincipal.idmaq+'.tipo= ''SALDOS'' ',1,sqlgeneral7);
    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',Cobranza SET columna'+y+' = D'+inttostr(dayof(FechaConciliacion))+'  where mes='+quotedstr(meses[mmeses])+' and fecha = '+inttostr(Cano)+' and concepto= ''CUENTAS'' and Cobranza.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion=Cobranza.clasificacion and temp_contratos0'+frmprincipal.idmaq+'.tipo=''CUENTAS'' ',1,sqlgeneral7);

    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',CobranzaXVencer SET columna'+y+' = columna'+y+' + D'+inttostr(dayof(FechaConciliacion))+' where mes='+quotedstr(meses[mmeses])+' and ano = '+inttostr(Cano)+' and concepto= ''SALDO'' and CobranzaXVencer.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion = 5 and temp_contratos0'+frmprincipal.idmaq+'.tipo= ''SALDOS'' ',1,sqlgeneral7);
    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',CobranzaXVencer SET columna'+y+' = columna'+y+' + D'+inttostr(dayof(FechaConciliacion))+' where mes='+quotedstr(meses[mmeses])+' and ano = '+inttostr(Cano)+' and concepto= ''CUENTAS'' and CobranzaXVencer.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion = 5 and temp_contratos0'+frmprincipal.idmaq+'.tipo=''CUENTAS'' ',1,sqlgeneral7);


    end;//for

  //ahora sacar totales por mes ........
  mmeses:=Cmes;

  FechaConciliacion:=Date-1;
  Cano := yearof(FechaConciliacion); // saco el dia a comparar menos uno.

  for  c := 6 to 17 do
    begin
    if mmeses = 1 then //si es uno y le resto uno entoces estoy en otro ano ay que restar un ano a la fecha
      begin
      Cano := Cano -1;
      mmeses := 12;
      end
    else
      mmeses := mmeses-1 ;

    Wano := Cano; Wmes := mmeses;
    dias := DaysInAMonth(Wano,Wmes)-1;
    //dias := DaysInAMonth(Wano,Wmes);
    //repeat

      if dias < 10 then
         dia := '0'+inttostr(dias)
      else
         dia := inttostr(dias);

      if mmeses < 10 then
         m := '0'+inttostr(mmeses)
      else
         m := inttostr(mmeses);

      FechaConciliacion := strtodate(inttostr(Cano)+'/'+m+'/'+dia);
      //Csem := dayofweek(FechaConciliacion);
      //dias := dias - 1;

     // if Csem = 1 then
     //   Csem := 7;

   // until Csem < 7  ;

    mes := meses[mmeses];
    y := inttostr(c+1);
    Arreglo[c] := inttostr(dayof(FechaConciliacion)+1)+mes;

    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',Cobranza SET mes'+y+' = D'+inttostr(dayof(FechaConciliacion))+'  where mes='+quotedstr(meses[mmeses])+' and fecha = '+inttostr(Cano)+' and concepto= ''SALDO'' and Cobranza.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion =Cobranza.clasificacion and temp_contratos0'+frmprincipal.idmaq+'.tipo= ''SALDOS'' ',1,sqlgeneral7);
    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',Cobranza SET mes'+y+' = D'+inttostr(dayof(FechaConciliacion))+'  where mes='+quotedstr(meses[mmeses])+' and fecha = '+inttostr(Cano)+' and concepto= ''CUENTAS'' and Cobranza.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion =Cobranza.clasificacion and temp_contratos0'+frmprincipal.idmaq+'.tipo=''CUENTAS'' ',1,sqlgeneral7);

    //Menos pagos del fin de mes
    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',CobranzaPagos SET mes'+y+' = mes'+y+' - M'+inttostr(mmeses)+' where ano = '+inttostr(Cano)+' and concepto= ''SALDO'' and CobranzaPagos.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion =CobranzaPagos.clasificacion and temp_contratos0'+frmprincipal.idmaq+'.tipo= ''SALDOS'' ',1,sqlgeneral7);
    querys('UPDATE temp_contratos0'+frmprincipal.idmaq+',CobranzaPagos SET mes'+y+' = mes'+y+' - M'+inttostr(mmeses)+' where ano = '+inttostr(Cano)+' and concepto= ''CUENTAS'' and CobranzaPagos.tipo = ''CONSOLIDADO'' and temp_contratos0'+frmprincipal.idmaq+'.clasificacion =CobranzaPagos.clasificacion and temp_contratos0'+frmprincipal.idmaq+'.tipo=''CUENTAS'' ',1,sqlgeneral7);

    end; // for

  querys ('Select (case t.clasificacion when 0 then ''Cobranza 0-30'' when 1 then ''Cobranza 0-59'' when 2 then ''Cobranza 60-9999''  when 3  then ''Abogados'' when 5 then "Por Vencer" end) as Concepto '+
          ' ,'+quotedstr(titulo1)+' as encabezado,t.*,'+quotedstr(Arreglo[0])+' as titulo1,'+quotedstr(Arreglo[1])+' as titulo2,'+quotedstr(Arreglo[2])+' as titulo3,'+quotedstr(Arreglo[3])+' as titulo4,'+quotedstr(Arreglo[4])+' as titulo5,'+quotedstr(Arreglo[5])+' as titulo6,'+quotedstr(Arreglo[6])+' as m1, '+
          ' '+quotedstr(Arreglo[7])+' as m2,'+quotedstr(Arreglo[8])+' as m3,'+quotedstr(Arreglo[9])+' as m4,'+quotedstr(Arreglo[10])+' as m5,'+quotedstr(Arreglo[11])+' as m6,'+quotedstr(Arreglo[12])+' as m7,'+quotedstr(Arreglo[13])+' as m8,'+quotedstr(Arreglo[14])+' as m9, '+
          ' '+quotedstr(Arreglo[15])+' as m10,'+quotedstr(Arreglo[16])+' as m11,'+quotedstr(Arreglo[17])+' as m12,clasificacion  from temp_contratos0'+frmprincipal.idmaq+' as t where clasificacion in(1,2,3,5) order by tipo,clasificacion ',0,sqlgeneral4);

  if print then
    begin
    OperacionReporte('CobranzaMensual','Reporte de cobranza anual',TipoImpresion, 1);
    querys('DROP TABLE IF EXISTS temp_contratos0'+frmprincipal.idmaq,1,sqlgeneral8);
    end;
  end;
end;

procedure RecClientesAbogado(desde,hasta:TDateTime;TipoImpresion:string;print:bool);
begin
   with DMREPORTES do
   begin
      // CUENTAS CON ABOGADO
      querys('select sa.idcliente, if(((length(c.rsocial) = 0) or ifnull(c.rsocial,1)),concat_ws(" ",c.nombre,c.apaterno,c.amaterno),c.rsocial) AS nombre, '+
             'sa.adeudoPagare, sa.adeudoAlarmex, sa.saldoActual, sa.demanda, sa.juzgado, sa.observaciones, sa.fechaAbogado, sa.fechaDemanda, sa.fechaResolucion, c.sector, '+
             'va.fechaVisita, va.razon, sa.idSeguimientoAbogado, concat_ws(" ",c.dir,c.numero,col.nombre) AS direccion, t1.cantidad, t2.total, t3.saldoActualS, t4.saldoTotal '+
             'from SeguimientoAbogado as sa '+
             'left join VisitasActuario as va on (va.idSeguimientoAbogado=sa.idSeguimientoAbogado) '+
             'left join clientes as c on (sa.idcliente=c.idcliente) '+
             'left join colonias col on (c.idcol=col.idcol) '+
             'left join (select count( distinct sa.idcliente) as cantidad, c.sector from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(desde)+'" and "'+datetostr(hasta)+'" group by c.sector) as t1 on (c.sector=t1.sector) '+
             'left join (select sum(sa.saldoActual) as saldoActualS, c.sector from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(desde)+'" and "'+datetostr(hasta)+'" group by c.sector) as t3 on (c.sector=t3.sector), '+
             '(select sum(cantidad) as total from (select count( distinct sa.idcliente) as cantidad from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(desde)+'" and "'+datetostr(hasta)+'" group by c.sector) as tt) as t2, '+
             '(select sum(saldoActualS) as saldoTotal from (select sum(sa.saldoActual) as saldoActualS from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(desde)+'" and "'+datetostr(hasta)+'" group by c.sector) as tt) as t4 '+
             'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(desde)+'" and "'+datetostr(hasta)+'" '+
             'order by c.sector, sa.fechaAbogado, va.idVisitasActuario',0,sqlgeneral);

      // CUENTAS INCOBRABLES
      querys('select c.sector, sa.fechaAbogado, sa.idcliente, sa.saldoActual, sa.observaciones '+
             'from SeguimientoAbogado as sa '+
		       'left join clientes as c on (sa.idcliente=c.idcliente) '+
             'where 	sa.incobrable = 1 and sa.fechaAbogado between "'+datetostr(desde)+'" and "'+datetostr(hasta)+'" '+
             'order by	c.sector, sa.fechaAbogado',0,sqlgeneral2);

      if (sqlgeneral.RecordCount > 0) or (sqlgeneral2.RecordCount > 0) then
        begin
        if (print) then
           OperacionReporte('RepAbogados', 'reporte de Abogados', TipoImpresion, 1);

        end else
         application.MessageBox('No hay datos para mostrar','Aviso',MB_OK+MB_ICONASTERISK);
   end;
end;

procedure RepEstandaresCobranza(ano,mes,TipoImpresion:string);
var _arreglo:TArregloSemanal;
x:integer;
_sql:string;
_si:Boolean;
begin
_sql := '';
_si := false;

  if( strtoint(mes) < 10) then
      mes := '0'+mes;

   RegresaArraySemanasMes('LUNES',strtodatetime(ano+'/'+mes+'/01'),_arreglo);


   for x:=0 to High(_arreglo) do
       begin
           if(_arreglo[x,1] <> 0) then
              begin
                 if(_si = false) then
                    _si := true
                 else
                    _sql:=_sql+ ' UNION ';


                    _sql:= _sql +' SELECT  "FECHA : '+ano+'-'+ RegresaMesLetra(strtoint(mes)) +'" as Fecha,"SEMANA AL DIA '+inttostr(_arreglo[x,1])+'" as grupo,concat(E.SECTOR,"-") as SECTOR, '+
                           ' ( select Concat(if(u.apaterno is NULL or u.apaterno="",  u.nombre, if(u.amaterno is NULL or u.amaterno="", concat(u.nombre, " ",u.apaterno), concat(u.nombre, " ", u.apaterno, " ", u.amaterno)))) '+
                           ' from usuarios as u inner join UsuarioSector as us on(us.idusuario= u.idusuario)  where us.idsector=E.sector and u.idpuesto = 23 and estatus = 1 ) AS SECTOR  ,D1,D'+inttostr(_arreglo[x,1])+' as Saldo,'+
                           ' META, D1-D'+inttostr(_arreglo[x,1])+' as Cobrado,D'+inttostr(_arreglo[x,1])+'-META as Falta,D1-META as MetaACobrar,((D'+inttostr(_arreglo[x,1])+'-META)/D1)*100 as PorcentajeXCobrar '+
                           ' FROM EstandaresCobranza as E INNER JOIN MetasCobranza as M on(E.ano = M.ano and E.mes= M.mes and E.sector=M.sector ) '+
                           ' WHERE E.ano = '+ ano+' and E.mes ='+inttostr(strtoint(mes))+' and SaldoCuenta="S" AND D'+inttostr(_arreglo[x,1])+' > 0 ';

                   _sql:= _sql + ' UNION ';

                   _sql:= _sql +' SELECT  "FECHA : '+ano+'-'+ RegresaMesLetra(strtoint(mes)) +'" as Fecha,"SEMANA AL DIA '+inttostr(_arreglo[x,1])+'" as grupo,concat(E.SECTOR,"-",(select idsector  from UsuarioSector where '+
                           ' idusuario = ( select us.idusuario   from usuarios as u1 inner join UsuarioSector as us on(us.idusuario= u1.idusuario)  where us.idsector=E.sector and u1.idpuesto = 23 and u1.estatus = 1 and us.idsector = E.SECTOR ) and idsector <>E.SECTOR )) as SECTOR, '+
                           ' ( select Concat(if(u.apaterno is NULL or u.apaterno="",  u.nombre, if(u.amaterno is NULL or u.amaterno="", concat(u.nombre, " ",u.apaterno), concat(u.nombre, " ", u.apaterno, " ", u.amaterno)))) '+
                           ' from usuarios as u inner join UsuarioSector as us on(us.idusuario= u.idusuario)  where us.idsector=E.sector and u.idpuesto = 23 and estatus = 1 ) AS UsuarioCobranza  ,SUM(D1) AS D1,SUM(D'+inttostr(_arreglo[x,1])+') as Saldo,'+
                           ' SUM(META) AS META, SUM(D1-D'+inttostr(_arreglo[x,1])+')  as Cobrado,SUM(D'+inttostr(_arreglo[x,1])+'-META) as Falta,SUM(D1-META) as MetaACobrar,((sum( D'+inttostr(_arreglo[x,1])+')-sum(META))/sum(D1))*100 as PorcentajeXCobrar '+
                           ' FROM EstandaresCobranza as E INNER JOIN MetasCobranza as M on(E.ano = M.ano and E.mes= M.mes and E.sector=M.sector ) '+
                           ' WHERE E.ano = '+ ano+' and E.mes ='+inttostr(strtoint(mes))+' and SaldoCuenta="S" AND D'+inttostr(_arreglo[x,1])+' > 0 group by UsuarioCobranza  having count(*) > 1 ';

                   _sql:= _sql + ' UNION ';

                   _sql:= _sql +' SELECT  "FECHA : '+ano+'-'+ RegresaMesLetra(strtoint(mes)) +'" as Fecha,"SEMANA AL DIA '+inttostr(_arreglo[x,1])+'" as grupo,"" as SECTOR, '+
                           ' if(D'+inttostr(_arreglo[x,1])+' is not null,"TOTAL DEL PADRON","")  AS UsuarioCobranza  ,SUM(D1) AS D1,SUM(D'+inttostr(_arreglo[x,1])+') as Saldo,'+
                           ' SUM(META) AS META, SUM(D1-D'+inttostr(_arreglo[x,1])+')  as Cobrado,SUM(D'+inttostr(_arreglo[x,1])+'-META) as Falta,SUM(D1-META) as MetaACobrar,((sum( D'+inttostr(_arreglo[x,1])+')-sum(META))/sum(D1))*100 as PorcentajeXCobrar '+
                           ' FROM EstandaresCobranza as E INNER JOIN MetasCobranza as M on(E.ano = M.ano and E.mes= M.mes and E.sector=M.sector ) '+
                           ' WHERE E.ano = '+ ano+' and E.mes ='+inttostr(strtoint(mes))+' and SaldoCuenta="S" AND D'+inttostr(_arreglo[x,1])+' > 0 group by UsuarioCobranza ';
                          
              end;

       end;

   querys(_sql,0,dmreportes.sqlgeneral3);

   if(dmreportes.sqlgeneral3.RecordCount > 0 ) then
    begin
        RepTendenciaCobranza(TipoImpresion,false);
        RecClientesAbogado(strtodate('1990/01/01'),now,TipoImpresion,false);
        OperacionReporte('EstanderesCobranza1', '', TipoImpresion, 1);


    end
     else
         Application.MessageBox('No hay datos a mostrar','Atención',MB_OK);

end;




procedure OxxosAPAAFA(dfecha1,dfecha2, activacion, year:string);
var  m2:Word;
cadena, cadena2, cadena3:String;
//m,
u,i:Integer;
sqlreporte:TMyQuery;
begin
sqlreporte := tmyquery.Create(nil);
sqlreporte.Connection := dmaccesos.conexion;

//m := MonthOf(today);
m2 := MonthOf(strtodate(dfecha2));
u:=0;
cadena := '';
cadena2 := '';
cadena3 := '';

// INSERTA LOS OXXOS \\
querys('select idcliente from ActivOxxo where year='+year+' and conclusion='+activacion, 0, dmreportes.sqlgeneral5);
querys('select idcliente, '+clientenombre('c')+' as nombre from clientes as c '+
//       'where estatus = 1 '+
       'having nombre like "%oxxo%" ', 0, sqlreporte);
if sqlreporte.RecordCount <> dmreportes.sqlgeneral5.RecordCount then
  begin
  sqlreporte.First;
  while not sqlreporte.Eof = true do
    begin
    dmreportes.sqlgeneral5.Locate('idcliente', sqlreporte.fieldbyname('idcliente').asstring, []);
    if sqlreporte.fieldbyname('idcliente').asstring <> dmreportes.sqlgeneral5.fieldbyname('idcliente').asstring then
      querys('insert into ActivOxxo (idcliente, year, conclusion ) values ('+sqlreporte.fieldbyname('idcliente').asstring+
             ', '+year+', '+activacion+')', 1, dmreportes.sqlgeneral8);
    sqlreporte.next;
    end;
  end;

 cadena := cadena+'if(month(fecha_pc)=1, count(sk.id), 0) as M1, ';     cadena2 := cadena2+'sum(M1) as M1, ';   
 cadena := cadena+'if(month(fecha_pc)=2, count(sk.id), 0) as M2, ';     cadena2 := cadena2+'sum(M2) as M2, ';   
 cadena := cadena+'if(month(fecha_pc)=3, count(sk.id), 0) as M3, ';     cadena2 := cadena2+'sum(M3) as M3, ';   
 cadena := cadena+'if(month(fecha_pc)=4, count(sk.id), 0) as M4, ';     cadena2 := cadena2+'sum(M4) as M4, ';   
 cadena := cadena+'if(month(fecha_pc)=5, count(sk.id), 0) as M5, ';     cadena2 := cadena2+'sum(M5) as M5, ';   
 cadena := cadena+'if(month(fecha_pc)=6, count(sk.id), 0) as M6, ';     cadena2 := cadena2+'sum(M6) as M6, ';   
 cadena := cadena+'if(month(fecha_pc)=7, count(sk.id), 0) as M7, ';     cadena2 := cadena2+'sum(M7) as M7, ';   
 cadena := cadena+'if(month(fecha_pc)=8, count(sk.id), 0) as M8, ';     cadena2 := cadena2+'sum(M8) as M8, ';   
 cadena := cadena+'if(month(fecha_pc)=9, count(sk.id), 0) as M9, ';     cadena2 := cadena2+'sum(M9) as M9, ';   
 cadena := cadena+'if(month(fecha_pc)=10, count(sk.id), 0) as M10, ';   cadena2 := cadena2+'sum(M10) as M10, '; 
 cadena := cadena+'if(month(fecha_pc)=11, count(sk.id), 0) as M11, ';   cadena2 := cadena2+'sum(M11) as M11, '; 
 cadena := cadena+'if(month(fecha_pc)=12, count(sk.id), 0) as M12, ';   cadena2 := cadena2+'sum(M12) as M12, '; 

querys('Drop table if exists tmpoxxo'+frmprincipal.idmaq, 1, sqlreporte);
querys('Create table tmpoxxo'+frmprincipal.idmaq+' select sk.idcliente, '+
       ' '+clientenombre('c')+' as nombre, '+cadena+
       'count(sk.id)  as ACTIVACION from  sk_alarmas as sk left join clientes as c on '+
       'c.idcliente=sk.idcliente where year(sk.fecha_pc)='+year+' and sk.conclusion = '+activacion+
       ' and cliente like "%oxxo%"  '+
       'group by sk.id '+
       //'having nombre like "%oxxo%" '+
       'order by ACTIVACION DESC ', 1, sqlreporte);

querys('select idcliente, '+cadena2+' sum(ACTIVACION) as ACTIVACION from tmpoxxo'+frmprincipal.idmaq+
       ' group by idcliente order by ACTIVACION DESC ', 0, sqlreporte);

  sqlreporte.First;
while not sqlreporte.Eof = true do
  begin
  for i:= u to m2 do
    begin
    cadena3 := cadena3+'M1='+sqlreporte.fieldbyname('M1').AsString+', ';  
    cadena3 := cadena3+'M2='+sqlreporte.fieldbyname('M2').AsString+', ';  
    cadena3 := cadena3+'M3='+sqlreporte.fieldbyname('M3').AsString+', ';  
    cadena3 := cadena3+'M4='+sqlreporte.fieldbyname('M4').AsString+', ';  
    cadena3 := cadena3+'M5='+sqlreporte.fieldbyname('M5').AsString+', ';  
    cadena3 := cadena3+'M6='+sqlreporte.fieldbyname('M6').AsString+', ';  
    cadena3 := cadena3+'M7='+sqlreporte.fieldbyname('M7').AsString+', ';  
    cadena3 := cadena3+'M8='+sqlreporte.fieldbyname('M8').AsString+', ';  
    cadena3 := cadena3+'M9='+sqlreporte.fieldbyname('M9').AsString+', ';  
    cadena3 := cadena3+'M10='+sqlreporte.fieldbyname('M10').AsString+', ';
    cadena3 := cadena3+'M11='+sqlreporte.fieldbyname('M11').AsString+', ';
    cadena3 := cadena3+'M12='+sqlreporte.fieldbyname('M12').AsString+', ';
    end;
  querys('update ActivOxxo set '+cadena3+' total=0 where idcliente = '+
         sqlreporte.fieldbyname('idcliente').AsString+' and year='+year+' and conclusion = '+
         activacion, 1, dmreportes.sqlgeneral8);
  sqlreporte.next;
  end;
  querys('Update ActivOxxo set total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where year = '+year,1, sqlreporte);

  querys('Select a.idcliente, ac.status, '+clientenombre('c')+' as nombre,  a.year, a.M1, a.M2, a.M3, a.M4, a.M5, a.M6, a.M7, a.M8, '+
         'a.M9, a.M10, a.M11, a.M12, a.total From ActivOxxo AS a left join clientes as c on c.idcliente = a.idcliente '+
         'left join alarmas_conclusion as ac on a.conclusion=ac.id Where a.year = '+year+' AND a.conclusion = '+activacion+'  '+
         'and c.idcliente is not null order by total desc', 0, dmreportes.sqlgeneral);
end;


procedure PositivosHoras(oxxo:boolean; year:string);
var sqlgeneral:TMyQuery;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
querys('Drop table if exists tmpPositivosHoras'+frmprincipal.idmaq, 1, sqlgeneral);
if oxxo = false then
querys('Create table tmpPositivosHoras'+frmprincipal.idmaq+' select if(month(fecha_pc) = 1, count(id), 0) as M1, '+
       'if(month(fecha_pc) = 2, count(id), 0) as M2, if(month(fecha_pc) = 3, count(id), 0) as M3, if(month(fecha_pc) '+
       '= 4, count(id), 0) as M4, if(month(fecha_pc) = 5, count(id), 0) as M5, if(month(fecha_pc) = 6, count(id), 0) '+
       'as M6, if(month(fecha_pc) = 7, count(id), 0) as M7, if(month(fecha_pc) = 8, count(id), 0) as M8, if(month('+
       'fecha_pc) = 9, count(id), 0) as M9, if(month(fecha_pc) = 10, count(id), 0) as M10, if(month(fecha_pc) = 11, '+
       'count(id), 0) as M11, if(month(fecha_pc) = 12, count(id), 0) as M12, left(hora_pc, 2) as hora, month(fecha_pc) '+
       'as mes from sk_alarmas as sk where year(fecha_pc) = '+year+' and conclusion=1 '+
       'group by month(fecha_pc), left(hora_pc, 2) order by month(fecha_pc) asc', 1, sqlgeneral)
else
  querys('Create table tmpPositivosHoras'+frmprincipal.idmaq+' select if(month(fecha_pc) = 1, count(id), 0) as M1, '+
       'if(month(fecha_pc) = 2, count(id), 0) as M2, if(month(fecha_pc) = 3, count(id), 0) as M3, if(month(fecha_pc) '+
       '= 4, count(id), 0) as M4, if(month(fecha_pc) = 5, count(id), 0) as M5, if(month(fecha_pc) = 6, count(id), 0) '+
       'as M6, if(month(fecha_pc) = 7, count(id), 0) as M7, if(month(fecha_pc) = 8, count(id), 0) as M8, if(month( '+
       'fecha_pc) = 9, count(id), 0) as M9, if(month(fecha_pc) = 10, count(id), 0) as M10, if(month(fecha_pc) = 11, '+
       'count(id), 0) as M11, if(month(fecha_pc) = 12, count(id), 0) as M12, left(hora_pc, 2) as hora, month(fecha_pc) '+
       'as mes from sk_alarmas as sk where year(fecha_pc)='+year+'  and cliente like "%oxxo%" '+
       'and conclusion=1 group by month(fecha_pc), left(hora_pc, 2) order by month(fecha_pc) asc', 1, sqlgeneral);

if oxxo = true then
  begin
  querys('Delete from ActivOxxoHoras where year='+year, 1, sqlgeneral);
  querys('Insert into ActivOxxoHoras (hora, total, year, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12) select hora, (sum(M1) + sum(M2) + sum(M3) + sum(M4) + '+
         'sum(M5) + sum(M6) +sum(M7) +sum(M8) +sum(M9) +sum(M10) +sum(M11) +sum(M12)) as total, '+year+' as year, '+
         'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, '+
         'sum(M10) as M10, sum(M11) as M11, sum(M12) as M12 from tmpPositivosHoras'+frmprincipal.idmaq+' group by hora order by hora', 1, sqlgeneral);
  querys('Select M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, total, year, hora from ActivOxxoHoras where year='+year+' order by hora desc', 0, dmreportes.sqlgeneral);
  end
else
  querys('select hora, (sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) +sum(M7) +sum(M8) +sum(M9) +sum(M10) +sum(M11) +sum(M12)) as total, '+
       'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, '+
       'sum(M10) as M10, sum(M11) as M11, sum(M12) as M12 from tmpPositivosHoras'+frmprincipal.idmaq+' group by hora order by total desc', 0, dmreportes.sqlgeneral);

querys('Drop table if exists tmpPositivosHoras'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure PositivosDias(oxxo:boolean; year:string);
var sqlgeneral:TMyQuery;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
querys('Drop table if exists tmpPositivosDias'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral8);
if oxxo = true then
querys('Create table tmpPositivosDias'+frmprincipal.idmaq+' select if(month(fecha_pc) = 1, count(id), 0) as M1, if(month(fecha_pc) = 2, count(id), 0) as M2, '+
       'if(month(fecha_pc) = 3, count(id), 0) as M3, if(month(fecha_pc) = 4, count(id), 0) as M4, if(month(fecha_pc) = 5, count(id), 0) as M5, if(month(fecha_pc) = 6, '+
       'count(id), 0) as M6, if(month(fecha_pc) = 7, count(id), 0) as M7, if(month(fecha_pc) = 8, count(id), 0) as M8, if(month(fecha_pc) = 9, count(id), 0) as M9, '+
       'if(month(fecha_pc) = 10, count(id), 0) as M10, if(month(fecha_pc) = 11, count(id), 0) as M11, if(month(fecha_pc) = 12, count(id), 0) as M12, '+
       'if(dayofweek(fecha_pc)=1, "Domingo", if(dayofweek(fecha_pc)=2, "Lunes", if(dayofweek(fecha_pc)=3, "Martes", if(dayofweek(fecha_pc)=4, "Miercoles", '+
       'if(dayofweek(fecha_pc)=5, "Jueves", if(dayofweek(fecha_pc)=6, "Viernes", "Sabado"))))))  as dia  from sk_alarmas as sk left join clientes as c '+
       'on c.idcliente=sk.idcliente where year(fecha_pc)='+year+' and conclusion = 1 and cliente like "%oxxo%" group by month(fecha_pc), dayofweek(fecha_pc) ', 1, sqlgeneral)
else
  querys('Create table tmpPositivosDias'+frmprincipal.idmaq+' Select if(month(fecha_pc) = 1, count(id), 0) as M1, if(month(fecha_pc) = 2, count(id), 0) as M2, if(month(fecha_pc) = 3, count(id), 0) as M3, '+
       'if(month(fecha_pc) = 4, count(id), 0) as M4, if(month(fecha_pc) = 5, count(id), 0) as M5, if(month(fecha_pc) = 6, count(id), 0) as M6, '+
       'if(month(fecha_pc) = 7, count(id), 0) as M7, if(month(fecha_pc) = 8, count(id), 0) as M8, if(month(fecha_pc) = 9, count(id), 0) as M9, '+
       'if(month(fecha_pc) = 10, count(id), 0) as M10, if(month(fecha_pc) = 11, count(id), 0) as M11, if(month(fecha_pc) = 12, count(id), 0) as M12, '+
       'if(dayofweek(fecha_pc)=1, "Domingo", if(dayofweek(fecha_pc)=2, "Lunes", if(dayofweek(fecha_pc)=3, "Martes", if(dayofweek(fecha_pc)=4, "Miercoles", '+
       'if(dayofweek(fecha_pc)=5, "Jueves", if(dayofweek(fecha_pc)=6, "Viernes", "Sabado"))))))  as dia, month(fecha_pc) as mes from sk_alarmas as sk where year(fecha_pc)='+year+
       ' and conclusion=1 group by month(fecha_pc), dayofweek(fecha_pc) order by month(fecha_pc) asc', 1, sqlgeneral);

if oxxo = true then
  begin
  querys('Delete from ActivOxxoDias where year='+year, 1, sqlgeneral);
  querys('Insert into ActivOxxoDias (dia, total, year, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12) select dia, (sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) +sum(M7) +sum(M8) +sum(M9) +sum(M10) +sum(M11) +sum(M12)) as total, '+year+', '+
       'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, '+
       'sum(M10) as M10, sum(M11) as M11, sum(M12) as M12 from tmpPositivosDias'+frmprincipal.idmaq+' group by dia order by dia', 1, sqlgeneral);
  querys('Select M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, total, year, dia from ActivOxxoDias where year='+year+' order by total desc', 0, dmreportes.sqlgeneral);
  end
else
  querys('select dia, (sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) +sum(M7) +sum(M8) +sum(M9) +sum(M10) +sum(M11) +sum(M12)) as total, '+
       'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, '+
       'sum(M10) as M10, sum(M11) as M11, sum(M12) as M12 from tmpPositivosDias'+frmprincipal.idmaq+' group by dia order by total desc', 0, dmreportes.sqlgeneral);

querys('Drop table if exists tmpPositivosDias'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure DetallePositivos(dfecha1, dfecha2:string);
begin
querys('select distinct sk.id, sk.idcliente, day(fecha_pc) as dia, month(fecha_pc) as mes, year(fecha_pc) as ano,'+
       'if(weekday(fecha_pc)=0,"X", "") as L, if(weekday(fecha_pc)=1,"X", "") as M, if(weekday(fecha_pc)=2,"X", "") as MC, '+
       'if(weekday(fecha_pc)=3,"X", "") as J, if(weekday(fecha_pc)=4,"X", "") as V, if(weekday(fecha_pc)=5,"X", "") as S, '+
       'if(weekday(fecha_pc)=6,"X", "") as D, if(c.rsocial is NULL or c.rsocial="", if(c.apaterno is NULL or c.apaterno="", '+
       'c.nombre, if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), concat(c.nombre, " ", c.apaterno, '+
       '" ", c.amaterno))), c.rsocial) as nombre, if(c.numero <> null or c.numero <> "",concat(c.dir, " ", c.numero), c.dir) '+
       'as calle, col.nombre as colonia, m.nombre as municipio, if(ct.apaterno is NULL or ct.apaterno="", ct.nombre,  '+
       'if(ct.amaterno is NULL or ct.amaterno="", concat(ct.nombre, " ", ct.apaterno), concat(ct.nombre, " ", ct.apaterno, '+
       '" ", ct.amaterno))) as comisionista from sk_alarmas as sk left join clientes as c on c.idcliente=sk.idcliente '+
       'left join colonias as col on col.idcol=c.idcol left join municipios as m on m.idmnp=col.idmnp left join '+
       'contactos as ct on ct.idcontacto=c.idcontacto and relacion = "comisionista" where fecha_pc between "'+
       dfecha1+'" and "'+dfecha2+'" and sk.conclusion = 1 having nombre like "%oxxo%" order by sk.id', 0, dmreportes.sqlgeneral);

OperacionReporte('OxxoDetallado', '', 'XLSD', 1);
end;

procedure masdedostickets(finicio, ffinal:string; proceso:integer);
var sqlgeneral:TMyQuery;
idNota, sid:Integer;
sen:string;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
querys('Drop table if exists tmpMas2Tkt'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpMas2Tkt'+frmprincipal.idmaq+
        ' Select "Del '+finicio+' al '+ffinal+'" as periodo, sk.idcliente, count(sk.idcliente) as fe, '+ClienteNombre('c')+' as nombre, 0 as servabierto, 0 as ticket, max(fecha_pc) as fecha_pc '+
        'from sk_alarmas  as sk left join usuarios as u on u.codigo= sk.user left join areas as a on a.idarea=u.idarea left join clientes as c on c.idcliente=sk.idcliente '+
        'where sk.fecha_pc between "'+finicio+'" and "'+ffinal+'" and sk.conclusion=3 and a.nombre="central" group by sk.idcliente having fe > 2', 1, sqlgeneral);

querys('Update tmpMas2Tkt'+frmprincipal.idmaq+' as t, servicios as s set servabierto = 1, ticket=s.sid where t.idcliente = s.idcliente and s.status < 4 ', 1, sqlgeneral);
if proceso = 0 then
  begin
  querys('select t.idcliente, max(s.Fecha_Creacion) as Fecha_Creacion, max(s.sid) as sid, t.fecha_pc from tmpMas2Tkt'+frmprincipal.idmaq+' as t left join servicios as s '+
         'on s.idcliente=t.idcliente where s.Fecha_Creacion between "'+finicio+'" and "'+ffinal+'" 	and servabierto =0 group by idcliente having Fecha_Creacion >= t.fecha_pc ', 0, sqlgeneral);
  sqlgeneral.first;
  while not sqlgeneral.Eof = true do
    begin
    querys('Update tmpMas2Tkt'+frmprincipal.idmaq+' set servabierto = 2, ticket='+sqlgeneral.fieldbyname('sid').asstring+' where idcliente='+sqlgeneral.fieldbyname('idcliente').asstring,1, dmreportes.sqlgeneral4);
    sqlgeneral.Next;
    end;
  querys('select idcliente, nombre, fe, periodo, if (servabierto =1, "ABIERTO", if(servabierto = 2, "ATENDIDO","SIN SERVICIO" )) as abierto, ticket from tmpMas2Tkt'+frmprincipal.idmaq+' order by abierto, fe desc', 0, dmreportes.sqlgeneral)
  end
else
  begin
  //Se eliminan los clientes que tienen tickets abiertos
  querys('Delete from tmpMas2Tkt'+frmprincipal.idmaq+' where servabierto = 1', 1, sqlgeneral);

  {//Se abren los tickets ke tengan tickets cerrados en el mes
  querys('select t.idcliente, max(s.Fecha_Creacion) as Fecha_Creacion, max(s.sid) as sid, t.fecha_pc from tmpMas2Tkt'+frmprincipal.idmaq+' as t '+
         'left join servicios as s on s.idcliente=t.idcliente where s.Fecha_Creacion between "'+finicio+'" and "'+ffinal+'" group by idcliente '+
         'having Fecha_Creacion < t.fecha_pc', 0, sqlgeneral);
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('Update servicios set problema=concat(problema, "     ", "**Servicio abierto por SISTEMA por presentar FALLAS DE EQUIPO"), status = 1 '+
           'where sid='+sqlgeneral.fieldbyname('sid').asstring,1,dmreportes.sqlgeneral8);
    querys('UPdate tmpMas2Tkt'+frmprincipal.idmaq+' set servabierto = 1 where idcliente ='+sqlgeneral.fieldbyname('idcliente').asstring,1,dmreportes.sqlgeneral7);

    //AGREGAR NOTA
    querys('Select idnota from servicios where sid ='+sqlgeneral.fieldbyname('sid').asstring, 0, dmreportes.sqlgeneral8);
    if dmreportes.sqlgeneral8.fieldbyname('idnota').asinteger <> 0 then
      idNota:=dmreportes.sqlgeneral8.fieldbyname('idnota').asinteger
    else
      begin
      //trae el maximo idnota de la tabla de notas
      querys('select max(idnota) as id from notas',0,dmreportes.sqlgeneral8);
      idNota:=dmreportes.sqlgeneral8.fieldbyname('id').AsInteger+1;
      //actualiza el idnota de la tabla que invoco esta pantalla
      querys('update servicios set idnota='+inttostr(idNota)+' where sid='+sqlgeneral.fieldbyname('sid').asstring,1,dmreportes.sqlgeneral8);
      end;
    querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) '+
           'values ('+inttostr(idNota)+',"SERVICIOS","REGISTRO ABIERTO POR SISTEMA POR HABER FALLAS DE '+
           'EQUIPO REPORTADAS POR CENTRAL",0,"SISTEMA",""'+timetostr(time)+'"","'+datetostr(date)+'","servicios",'+sqlgeneral.fieldbyname('sid').asstring+')',1,dmreportes.sqlgeneral8);
    //AGREGAR NOTA fin
    sqlgeneral.Next;
    end;
     
  //Se eliminan los clientes que tienen tickets abiertos
  querys('Delete from tmpMas2Tkt'+frmprincipal.idmaq+' where servabierto = 1', 1, dmreportes.sqlgeneral8);
   
  querys('select t.idcliente, max(s.Fecha_Creacion) as Fecha_Creacion, max(s.sid) as sid, t.fecha_pc from tmpMas2Tkt'+frmprincipal.idmaq+' as t '+
         'left join servicios as s on s.idcliente=t.idcliente where s.Fecha_Creacion between "'+finicio+'" and "'+ffinal+'" '+
         'group by idcliente having Fecha_Creacion >= t.fecha_pc',0,sqlgeneral);

  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('Update tmpMas2Tkt'+frmprincipal.idmaq+' set servabierto = 1 where idcliente ='+sqlgeneral.fieldbyname('idcliente').asstring,1,dmreportes.sqlgeneral);
    sqlgeneral.Next;
    end;

  //Se eliminan los clientes que tienen tickets abiertos
  querys('Delete from tmpMas2Tkt'+frmprincipal.idmaq+' where servabierto = 1', 1, sqlgeneral);
   }
  //Se CREAN tickets a los clientes sobrantes
  querys('Select * from tmpMas2Tkt'+frmprincipal.idmaq+'  ', 0, sqlgeneral);
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('select distinct u.codigo2, c.idcol from clientes as c left join ColUsuarios as cu on cu.idcol=c.idcol left join usuarios as u on u.idusuario=cu.idusuario '+
           'left join puestos as p on u.idpuesto=p.idpuesto where p.nombre = "TECNICO" and c.idcliente = '+sqlgeneral.fieldbyname('idcliente').asstring , 0, dmreportes.sqlgeneral7);

    querys('Select distinct zona from sk_alarmas  as sk where sk.fecha_pc between "'+finicio+'" and "'+ffinal+'" and idcliente = '+sqlgeneral.fieldbyname('idcliente').asstring+
           ' and sk.conclusion=3', 0, dmreportes.sqlgeneral6);
    sen := '';
    dmreportes.sqlgeneral6.first;
    while not dmreportes.sqlgeneral6.Eof = true do
      begin
      sen := sen + dmreportes.sqlgeneral6.fieldbyname('zona').asstring+', ';
      dmreportes.sqlgeneral6.Next;
      end;
    Delete(sen, Length(sen)-1, 1);

    querys('INSERT INTO servicios (hora_creacion,idcliente,fecha_creacion,fecha_servicio,nomop,reportby,problema,status,'+
           'clasif,UsuarioUltAct,FechaUltAct,idtravel,CodTecnico,prioridad) values("'+FormatDateTime('HH:mm:ss',Time)+'", '+sqlgeneral.fieldbyname('idcliente').asstring+
           ',"'+datetostr(date)+'", "'+datetostr(date)+'", "SISTEMA", "SISTEMA", "EL CLIENTE CUENTA CON '+sqlgeneral.fieldbyname('fe').asstring+' ACTIVACIONES DE FALLAS DE EQUIPO REPORTADAS POR CENTRAL DE LA ZONA(S): '+sen+' ",1, 2,'+
           '"SISTEMA", "'+datetostr(date)+'", 0, "'+dmreportes.sqlgeneral7.fieldbyname('codigo2').AsString+'","2") ',1,dmreportes.sqlgeneral8);
    querys('Select max(sid) as sid from servicios where idcliente ='+sqlgeneral.fieldbyname('idcliente').asstring, 0, dmreportes.sqlgeneral8);
    sid := dmreportes.sqlgeneral8.fieldbyname('sid').AsInteger;

    { AGREGAR NOTA}
    //trae el maximo idnota de la tabla de notas
    querys('select max(idnota) as id from notas',0,dmreportes.sqlgeneral8);
    idNota:=dmreportes.sqlgeneral8.fieldbyname('id').AsInteger+1;
    //actualiza el idnota de la tabla que invoco esta pantalla
    querys('update servicios set idnota='+inttostr(idNota)+' where sid='+inttostr(sid),1,dmreportes.sqlgeneral8);
    querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) '+
           'values ('+inttostr(idNota)+',"SERVICIOS","REGISTRO AGREGADO POR SISTEMA POR HABER FALLAS DE '+
           'EQUIPO REPORTADAS POR CENTRAL",0,"SISTEMA",""'+FormatDateTime('HH:mm:ss',Time)+'"","'+datetostr(date)+'","servicios",'+inttostr(sid)+')',1,dmreportes.sqlgeneral8);
    {AGREGAR NOTA fin}

    {COBRANZA tickets}
    sqlgeneral.Next;
    end;
  querys('Drop table if exists tmpMas2Tkt'+frmprincipal.idmaq, 1, sqlgeneral);
  end;
end;

procedure CentralerosTicketsDet(finicio, ffinal:string);
var sqlgeneral:TMyQuery;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
querys('Drop table if exists tmpCentraleroTktDet'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpCentraleroTktDet'+frmprincipal.idmaq+' Select "Del '+finicio+' al '+ffinal+'" as periodo, '+
       'user as codigo, '+UsuarioNombre('u')+' as operador, idcliente, cliente, count(idcliente) as fe, 0 as ticket '+
       'from sk_alarmas as sk left join usuarios as u on u.codigo=user '+
       'where fecha_pc between "'+finicio+'" and "'+ffinal+'" and conclusion = 3 and user <> "" group by idcliente,codigo '+
       'order by codigo,idcliente', 1, sqlgeneral);

querys('Select nomop as codigo, sid, idcliente from servicios as s left join usuarios as u on s.nomop=u.codigo left join '+
       'areas as a on a.idarea=u.idarea where s.fecha_creacion between "'+finicio+'" and "'+ffinal+'" and a.idarea = 4 '+
       'and s.nomop <> "" order by s.nomop ', 0, sqlgeneral);

sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('Update tmpCentraleroTktDet'+frmprincipal.idmaq+' set ticket ='+sqlgeneral.fieldbyname('sid').AsString+
         ' where idcliente ='+sqlgeneral.fieldbyname('idcliente').AsString, 1, dmreportes.sqlgeneral6);
  sqlgeneral.next;
  end;
querys('Select * from tmpCentraleroTktDet'+frmprincipal.idmaq+' order by codigo, fe desc', 0, dmreportes.sqlgeneral);
end;

procedure RepTarjetaCliente(idcliente, TipoImpresion, orden:String; fecha1, fecha2:TDate);
  var fecha,total,tel,contac:String;

begin
if idcliente <> '' then
  begin
  with dmreportes do
    begin
     querys('SELECT c.idcliente as idcliente,cf.RFCCres as rfc,c.curp, cf.NombreCres  AS nombre,cf.DirCres as dir,c.numero,c.sector,concat(ifnull(cf.CdCres,'' '' ),'' '', ifnull(cf.EstadoCres,'' '')) as ciudad,c.estado,c.st_date,c.TotComprado,'+
           'c.saldo as CliSaldo,c.precio,c.idtel as idtel, c.idcontacto as idcontacto,cf.ColCres as colonia,cf.CPCres as cp,c.UltimaCompra,c.PlazoCredito,c.credito,IF(c.bloqueado=1,''S'',''N'') as bloqueado,c.email,c.tipocont,c.idabogado, '+
           ' Concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno)  AS vendedor FROM clientes as c LEFT JOIN ClientesFact as cf on(cf.idcliente=c.idcliente) '+
             'LEFT JOIN usuarios as u ON (u.idusuario=c.idvendedor) LEFT JOIN colonias as col ON (col.idcol=c.idcol)  WHERE c.idcliente=' +idcliente,0,sqlgeneral);

    if sqlgeneral.FieldByName('idcliente').AsString <> '' then
      begin
      tel:='10000000';
      contac:='1000000';
      if sqlgeneral.FieldByName('idtel').AsString <> '' then
         tel:=sqlgeneral.FieldByName('idtel').AsString;
      if sqlgeneral.FieldByName('idcontacto').AsString <> '' then
         contac:=sqlgeneral.FieldByName('idcontacto').AsString;
      //buscar el saldo anterior ......
      dmreportes.temp:=0;
      sqlclientes.Close;
      sqlclientes.ParamByName('id').AsString:=idcliente;
      sqlclientes.ParamByName('orden').AsString:=orden;
      sqlclientes.Open;

      if sqlclientes.recordcount > 1 then
        begin
        sqlclientes.First;
        while not sqlclientes.eof do
          begin
          sqlclientes.Next;
          end;
        end
      else
        sqlclientes.Last;
  
      if sqlclientescalculado.asstring <> '' then
        total:=format('%8.3f',[strtofloat(sqlclientescalculado.AsString)])
      else
        total:='0.00';

      if frmprincipal.PuestoUsuario = 'CAJERA' then
        begin
        querys('SELECT pc.idpago,pc.idfactura,pc.idremicion,pc.idpedido,pc.idpago_afecta,pc.FechaAlta,pc.cargo as cargo,pc.abono as abono,pc.restante,pc.notas, '+
               'pc.TipoPago,pc.movimiento,FechaVence,pc.idcliente FROM  PagosClientes as pc WHERE pc.idcliente='+idcliente+' and pc.movimiento not in (3,5) '+
               'ORDER BY '+orden, 0, sqlclientes);
        end
      else
        begin
        sqlclientes.Close;
        sqlclientes.ParamByName('id').AsString:=idcliente;
        sqlclientes.ParamByName('orden').AsString:=orden;
        sqlclientes.Open;
        end;

      if total <> '' then
        dmreportes.temp:=strtofloat(total)
      else
        dmreportes.temp:=0;
  
      querys('SELECT * FROM telefonos WHERE idtel='+quotedstr(tel)+' ORDER BY idtel ASC',0,dmreportes.sqlgeneral2);
      querys('SELECT distinct c.idcontador,c.idcontacto,c.nivel,concat(c.nombre,'' '',c.apaterno,'' '',c.amaterno) as contacto '+
              //',t.telefono,tipo_tel,t.extencion '+
              'FROM contactos as c LEFT JOIN  telefonos as t ON (t.idtel=c.idtel) WHERE idcontacto='+quotedstr(contac),0,dmreportes.sqlgeneral3);
      fecha:='Período del análisis del '+datetostr(fecha1)+' al '+datetostr(fecha2);
      RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
      RVP.SetParam('total',total);
      RVP.SetParam('fechaini',fecha);
      OperacionReporte('RepTarjetaCliente','Reporte de tarjeta del cliente',TipoImpresion, 0);
      rvp.Close;
      end
    else
      begin//if clientes
      application.MessageBox('Esa cuenta no existe!','Atención',mb_IconInformation);
      end;
    end;//with
  end
else
  application.MessageBox('Falto la cuenta para generar el reporte!','Atención',mb_IconInformation);
end;

procedure RepEstadoCuenta(idcliente, TipoImpresion:string);
var idcontacto,nombre,dir,sector,fecha1,fecha2,valor1,valor2,valor3,valor4,
    nota1,nota2,nota3,total,total1,total2,cobrador, nota22, tax, titulo2:string;


begin
//buscarEstCuenta;
with dmreportes do
  begin
  if querys('SELECT '+ClienteNombre('c')+' as nombre, c.idcliente as cuenta, c.ciudad, c.estado, '+
         'c.numero as numero, c.dir, col.cp, col.nombre as col, c.sector,idcontacto FROM clientes '+
         'AS c LEFT JOIN colonias AS col ON (col.idcol=c.idcol) WHERE c.idcliente='+idcliente,0,sqlgeneral5) > 0 then
    begin
    idcontacto:= SqlGeneral5.FieldByName('idcontacto').AsString;
    nombre:=SqlGeneral5.FieldByName('nombre').AsString;
    dir:=SqlGeneral5.FieldByName('dir').AsString+' '+SqlGeneral5.FieldByName('numero').AsString+',COL:'+SqlGeneral5.FieldByName('col').AsString;;
    sector:=SqlGeneral5.FieldByName('sector').AsString;
    end
  else
    begin
    application.MessageBox('No existe esta cuenta!','Atención',mb_iconwarning);
    exit;
    end;

  ban:=0;//bandera para saber cuanto debe por periodos
  cobrador:='';
  //GENERAR REPORTE
  if idcontacto <> '' then
    begin
    querys('SELECT  '+UsuarioNombre('c')+' AS nombre, min(idcontador) from contactos as c where idcontacto='+
           idcontacto+' and (nombre <> "TELEFONO 1" and  nombre <> "TELEFONO 2") group by idcontacto',0,sqlgeneral);
    idcontacto:=sqlgeneral.fieldbyname('nombre').AsString;
    end;

  //buscar el usuario que tiene ese sector para la cobranza
  querys('SELECT '+UsuarioNombre('u')+' AS cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) WHERE u.idsector='+quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
  if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
    cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
  else
    begin
    querys('SELECT '+UsuarioNombre('u')+'  AS cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN UsuarioSector as us ON (us.idusuario=u.idusuario) WHERE us.idsector='+sector+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
    if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
      cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
    end;

  querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
  querys('CREATE TABLE temporal_estadocuenta'+frmprincipal.idmaq+' (mov integer (11),idcliente integer (11),idpedido integer (11),fechaalta date,fechavence date,total float,saldo float,cobrador varchar(50),estatus integer(11),idpago integer(11),contacto varchar(50),KEY idpedido(idpedido)) ',1,sqlgeneral);
  querys('select idpago,pc.idpedido as ped from PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(idcliente)+' AND p.estatus in(3,4,6) and movimiento = 1',0,sqlgeneral2);
  querys('INSERT INTO temporal_estadocuenta'+frmprincipal.idmaq+'(mov,idcliente,saldo,idpedido,cobrador,estatus,contacto,idpago) SELECT pc.movimiento,pc.idcliente,pc.restante,pc.idpedido,'+quotedstr(cobrador)+',0,'+quotedstr(idcontacto)+',pc.idpago FROM PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(idcliente)+' AND p.estatus in(3,4) AND pc.restante <> 0 AND pc.movimiento in(0,1) ',1,sqlgeneral);

  if sqlgeneral2.FieldByName('idpago').AsString  <> '' then
    begin
    while not sqlgeneral2.Eof do
      begin
      querys('DELETE FROM temporal_estadocuenta'+frmprincipal.idmaq+' WHERE idpedido='+quotedstr(sqlgeneral2.FieldByName('ped').AsString)+'  and mov =0 ' ,1,sqlgeneral3);
      sqlgeneral2.Next;
      end;
    end;

   querys('SELECT idpago,idpedido,idcliente,cargo,FechaAlta,FechaVence,if(FechaVence > "'+datetostr(date)+'",1,0) as estatus  FROM PagosClientes WHERE idcliente='+quotedstr(idcliente)+' and movimiento in (0,1) order by idpedido',0,sqlgeneral);     // and saldado = 0  and (estatus=3 or estatus=4)
   while not sqlgeneral.Eof do
     begin
     querys('UPDATE temporal_estadocuenta'+frmprincipal.idmaq+' SET  fechaalta='+quotedstr(sqlgeneral.fieldbyname('FechaAlta').AsString)+',fechavence='+quotedstr(sqlgeneral.fieldbyname('FechaVence').AsString)+',total='+quotedstr(sqlgeneral.fieldbyname('cargo').AsString)+',estatus='+quotedstr(sqlgeneral.fieldbyname('estatus').AsString)+' '+
            'WHERE idpago='+quotedstr(sqlgeneral.fieldbyname('idpago').AsString),1,dmaccesos.sqlgeneral);
     sqlgeneral.Next;
     end;

   ///total
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' ''  GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     total:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     delete(total,1,1);
     end
   else
     total:='0';

   //total vencido
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=0 GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     total1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     delete(total1,1,1);
     end
   else
     total1:='0';

   //total x vencer
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=1 GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     total2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     delete(total2,1,1);
     end
   else
     total2:=' 0';

   ///cantidad de 0 a 30
   fecha1:=datetostr(now-30);
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between   '+quotedstr(fecha1)+' AND "'+datetostr(date)+'" and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     valor1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     ban:=1;
     end
   else
     valor1:='$ 0';

   ///cantidad de 31 a 60
   fecha1:=datetostr(now-31);
   fecha2:=datetostr(now-60);
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     valor2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     ban:=2;
     end
   else
     valor2:='$ 0';

   ///cantidad de 61 a 90
   fecha1:=datetostr(now-61);
   fecha2:=datetostr(now-90);
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     valor3:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     ban:=3;
     end
   else
     valor3:='$ 0';

   ///cantidad mas de 90
   fecha1:=datetostr(now-90);
   querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence < '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
   if sqlgeneral.FieldByName('suma').AsString <> '' then
     begin
     valor4:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
     ban:=4;
     end
   else
     valor4:='$ 0';

   { case ban of
     1:  begin RVP.SetParam('nota2',nota1.text); nota22 :=  nota1.text; end;
     2:  begin RVP.SetParam('nota2',nota2.text); nota22 :=  nota2.text; end;
     3:  begin RVP.SetParam('nota2',nota3.text); nota22 :=  nota3.text; end;
     4:  begin RVP.SetParam('nota2',nota4.text); nota22 :=  nota4.text; end;
   end;}

   querys('SELECT concepto,ValorMemo FROM configuraciones',0,sqlgeneral);
   while not sqlgeneral.Eof do
     begin
     if sqlgeneral.fieldbyname('concepto').AsString='CobNotasPago' then
       nota1:=sqlgeneral.fieldbyname('ValorMemo').AsString;
     if sqlgeneral.fieldbyname('concepto').AsString='CobNotasObs' then
       nota2:=sqlgeneral.fieldbyname('ValorMemo').AsString;
     case ban of
       1:if sqlgeneral.fieldbyname('concepto').AsString='A30' then
           nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
       2:if sqlgeneral.fieldbyname('concepto').AsString='A60' then
           nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
       3:if sqlgeneral.fieldbyname('concepto').AsString='A90' then
           nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
       4:if sqlgeneral.fieldbyname('concepto').AsString='M90' then
         nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
       end;
     sqlgeneral.Next;
     end;

   RVP.SetParam('nota2',nota3);
   nota22 :=  nota3;


   querys('SELECT cf.NombreCres AS nombre,c.idcliente,cf.CdCres as ciudad,cf.EstadoCres as estado,cf.DirCres as dir,cf.CPCres as cp,cf.ColCres as col,c.sector as sector,t.fechaalta,'+
          't.fechavence,t.total,t.saldo, '+quotedstr(idcontacto)+' as contacto,concat( ifnull(c.dir,''''),'','',ifnull(c.numero,''''),'' , COL:'',ifnull(col.nombre,'''') ) AS DirInst , c.ciudad as CdInst, '+
          't.idpedido,p.concepto,l.nombre as negocio,t.estatus  FROM clientes AS c LEFT JOIN ClientesFact as cf on(cf.idfact=c.idfact) LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) LEFT JOIN temporal_estadocuenta'+frmprincipal.idmaq+' as t ON (t.idcliente=c.idcliente) LEFT JOIN pedidos AS p ON (p.idpedido=t.idpedido) LEFT JOIN DetPedido AS dp ON '+
          '(dp.idpedido=p.idpedido) LEFT JOIN  articulos as a ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) WHERE c.idcliente='+quotedstr(idcliente)+' GROUP BY t.idpago Order by estatus',0,sqlgeneral3);

   if sqlgeneral3.fieldbyname('DirInst').AsString  <> '' then
     begin
     RVP.SetParam('titulo2',sqlgeneral3.fieldbyname('DirInst').AsString);
     titulo2 := sqlgeneral3.fieldbyname('DirInst').AsString;
     end
   else
     begin
     RVP.SetParam('titulo2','');
     titulo2 := '';
     end;

   if sqlgeneral3.fieldbyname('CdInst').AsString  <> '' then
     begin
     RVP.SetParam('tax',sqlgeneral3.fieldbyname('CdInst').AsString);
     tax := sqlgeneral3.fieldbyname('CdInst').AsString;
     end
   else
     begin
     RVP.SetParam('tax','');
     tax := '';
     end;

   RVP.SetParam('titulo1',cobrador);
   RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
   RVP.SetParam('total',total);
   RVP.SetParam('total1',total1);
   RVP.SetParam('total2',total2);
   RVP.SetParam('nota1',nota1);
   RVP.SetParam('nota3',nota2);
   RVP.SetParam('comodin1',valor1);
   RVP.SetParam('comodin2',valor2);
   RVP.SetParam('comodin3',valor3);
   RVP.SetParam('comodin4',valor4);
   RVP.Close;
   {ESTO ES PARA CAMBIARLO A BUILDER AL REPORTE "EstadoCuenta" OK     }
   querys('Select "'+nota22+'" as nota2, "'+titulo2+'" titulo2, "'+tax+'" as tax, "'+cobrador+'" as titulo1, '+total+' as total, "'+total1+'" as total1, '+total2+' as total2, '+
          ' "'+nota1+'" as nota1, "'+nota2+'" as nota3, "'+valor1+'" as comodin1, "'+valor2+'" as comodin2, "'+valor3+'" as comodin3, "'+valor4+'" as comodin4', 0, dmreportes.sqlgeneral2);

   // RVP.ExecuteReport('RepEstadoCuentaC');
   OperacionReporte('RepEstadoCuentaC','Reporte de estado de cuenta',TipoImpresion, 0);
   querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
   end;//with
////TERMINO GENERAR REPORTE
end;
{
procedure RepComisionesVend(fecha1, fecha2:string);
  var total,m:string; tc : double;
begin
total := '';
Screen.Cursor := crHourglass;
with dmreportes do
  begin

//CREA TABLA A LLENAR
querys('DROP TABLE IF EXISTS TmpComFin'+frmprincipal.idmaq,1,sqlgeneral3);
querys('CREATE TABLE TmpComFin'+frmprincipal.idmaq+' (codigo varchar (5), nombre varchar(100), nocamb int(11) default 0, camb int(11) default 0, norecbaja int(11) default 0, recbaja int(11) default 0, '+
       'noenla int(11) default 0, enla int(11) default 0, norecu int(11) default 0, recu int(11) default 0, nocone int(11) default 0, cone int(11) default 0, noreco int(11) default 0, reco int(11) default 0, '+
       'noctasnvas int(11) default 0, ctasnvas int(11) default 0, tc decimal (10,2), '+
       'TotDlls decimal(10,2) default 0, PCom decimal(10,2) default 0, ComVtaDlls decimal(10,2) default 0, CgoAut int(11) default 0,  B5000Dlls int(11) default 0, '+
       'MasCtaNva int(11) default 0, CtaReco int(11) default 0, cctv int(11) default 0, Pcctv decimal(10,2) default 0, Totalcctv decimal(10,2) default 0, '+
       'TotalCom int(11) default 0) ',1,sqlgeneral3);
querys('Insert into  TmpComFin'+frmprincipal.idmaq+' (codigo, nombre) select codigo, concat(if (u.nombre is null," ",u.nombre)," ", if (u.apaterno is null," ",u.apaterno)," ", if (u.amaterno is null," ",u.amaterno)) as Vendedor '+
       'from usuarios as u where idpuesto = "1" and estatus = "1" order by codigo', 1, sqlgeneral3);

//BUSCA LAS VENTAS
querys('DROP TABLE IF EXISTS tmpComVend'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend'+frmprincipal.idmaq+' SELECT distinct p.idinstal, p.idpedido, round(sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)),2) as ToTDlls, '+
       'round(if(tp.comisiones = 1,p.TipoCambio,0), 2) as TipoCambio, u.codigo, if(tp.nombre = "CONEXION2", "CON2", left(tp.nombre,4)) as Oport, cm.cantidad FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN '+
       'articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) left join Comisiones as cm '+
       'on cm.UnidadNegocio=tp.nombre '+
       'WHERE p.estatus in(3,4) and p.FechaCreacion between "'+fecha1+'" and "'+fecha2+'" and tp.instalacion =1 and a.idlinea = 4 '+
       'and left(tp.nombre,4) <> "CCTV"'+
       'GROUP BY dp.idpedido Order by codigo, oport',1,sqlgeneral3);

querys('DROP TABLE IF EXISTS tmpComVend1'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend1'+frmprincipal.idmaq+' select distinct p.idpedido, round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
       'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
       'ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
       'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaCreacion between "'+fecha1+'" and "'+fecha2+'" and tp.instalacion =1  and a.idlinea = 4 and left(tp.nombre,4) <> "CCTV" GROUP BY dnc.idpedido',1,sqlgeneral3);


 //PROMEDIO TIPO DE CAMBIO
querys('select round(avg(t1.TipoCambio),2) as TipoCambio, "h" as h FROM tmpComVend'+frmprincipal.idmaq+' AS t1 LEFT JOIN tmpComVend1'+frmprincipal.idmaq+' as t2 ON(t1.idpedido=t2.idpedido) where t1.TotDlls > 0 group by h',0,sqlgeneral2);
tc:= sqlgeneral2.FieldByName('TipoCambio').AsFloat;
  querys('Update TmpComFin'+frmprincipal.idmaq+' set tc='+sqlgeneral2.FieldByName('TipoCambio').Asstring,1, sqlgeneral4);

querys('DROP TABLE IF EXISTS tmpComVend2'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend2'+frmprincipal.idmaq+' select t.codigo, t.oport, '+
       'if(t.oport="CAMB", count(t.oport)*cantidad, 0) as camb, '+
       'if(t.oport="CAMB", count(t.oport), 0) as nocamb, '+
       'if(t.oport="ENLA", count(t.oport)*cantidad, 0) as enla, '+
       'if(t.oport="ENLA", count(t.oport), 0) as noenla, '+
       'if(t.oport="RECU", count(t.oport)*cantidad, 0) as recu,  '+
       'if(t.oport="RECU", count(t.oport), 0) as norecu, '+
       'if(t.oport="CONE", count(t.oport)*cantidad, 0) as cone,  '+
       'if(t.oport="CONE", count(t.oport), 0) as nocone, '+
       'if(t.oport="CON2", count(t.oport)*cantidad, 0) as con2,  '+
       'if(t.oport="CON2", count(t.oport), 0) as nocon2, '+
       'if(t.oport="RECO", count(t.oport)*cantidad, 0) as reco, '+
       'if(t.oport="RECO", count(t.oport), 0) as noreco, '+ //'if(t.oport="CCTV", count(t.oport)*cantidad, 0) as cctv, if(t.oport="CCTV", count(t.oport), 0) as nocctv, '+
       'sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)) AS TotDlls FROM tmpComVend'+frmprincipal.idmaq+' as t LEFT JOIN tmpComVend1'+frmprincipal.idmaq+'  as t1 ON(t.idpedido=t1.idpedido) '+
      'group by t.codigo, t.oport order by t.codigo, t.oport',1,sqlgeneral3);

querys('DROP TABLE IF EXISTS tmpComVend'+frmprincipal.idmaq,1,sqlgeneral3);
querys('DROP TABLE IF EXISTS tmpComVend1'+frmprincipal.idmaq,1,sqlgeneral3);
//querys('DROP TABLE IF EXISTS tmpComVend5'+frmprincipal.idmaq,1,sqlgeneral3);

//CONEXIONES, ENLACES, CAMBIOS, RECONEXIONES
querys('select t.codigo, Oport, sum(nocamb) as NOCAMB, sum(noenla) as NOENLA, sum(nocone) AS NOCONE, sum(nocon2) AS NOCON2, sum(noreco) as NORECO,  '+
'sum(camb) as CAMB, sum(enla) as ENLA, sum(cone) AS CONE, sum(con2) AS CON2, sum(reco) '+
       'as RECO,  SUM(TotDlls) as TotDlls FROM tmpComVend2'+frmprincipal.idmaq+' as t left join usuarios as u on u.codigo = t.codigo where u.estatus = "1" and idpuesto = "1" '+
       'group by t.codigo order by t.codigo, oport', 0, sqlgeneral3);

sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set nocamb="'+sqlgeneral3.fieldbyname('NOCAMB').asstring+'", camb="'+sqlgeneral3.fieldbyname('CAMB').asstring+'", '+
    //  'norecbaja="'+sqlgeneral.fieldbyname('').asstring+'", recbaja="'+sqlgeneral.fieldbyname('').asstring+'", '+
    'noenla="'+sqlgeneral3.fieldbyname('NOENLA').asstring+'", enla="'+sqlgeneral3.fieldbyname('ENLA').asstring+'", nocone='+sqlgeneral3.fieldbyname('NOCONE').asstring+'+'+sqlgeneral3.fieldbyname('NOCON2').asstring+
    ', cone='+sqlgeneral3.fieldbyname('CONE').asstring+'+'+sqlgeneral3.fieldbyname('CON2').asstring+', noreco="'+sqlgeneral3.fieldbyname('NORECO').asstring+'", reco="'+sqlgeneral3.fieldbyname('RECO').asstring+
    '", TotDlls=TotDlls+'+sqlgeneral3.fieldbyname('TotDlls').asstring+
    ' where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'" ',1, sqlgeneral4);
  sqlgeneral3.Next;
  end;
querys('DROP TABLE IF EXISTS tmpComVend2'+frmprincipal.idmaq,1,sqlgeneral3);

//RECUPERACION DE BAJA
querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend3'+frmprincipal.idmaq+' SELECT  distinct count(tp.nombre) as total,u.codigo '+
       'as code, tp.nombre as nom FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
       'LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont)'+
       'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN oportunidades as o '+
       'on(o.cuenta=c.idcliente) LEFT JOIN agenda_vendedores as av on av.idoportunidad = o.idoportunidad '+
       'WHERE p.estatus in(3,4) and p.FechaCreacion between "'+fecha1+'" and "'+fecha2+'" and '+
       'av.fecha_cierre between "'+fecha1+'" and "'+fecha2+'" and (c.FechaCancelacion <> '+
       '"0000-00-00") and (c.FechaCancelacion < st_date) and tp.instalacion =1 and tp.nombre '+
       'in("CONEXION","ENLACES","RECONEXION","EQUIPO","RECUPERACION POR BAJA" ) and con.estatus=1 and '+
       'o.estatus = "CLIENTE" group by u.codigo order by total desc',1,sqlgeneral3);

querys('Select total, cantidad, code as codigo from tmpComVend3'+frmprincipal.idmaq+' left join Comisiones as cm on (total between de and a) where cm.UnidadNegocio ="CUENTAS" ' , 0, sqlgeneral3);
sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set norecu="'+sqlgeneral3.fieldbyname('total').asstring+
         '", recu=('+sqlgeneral3.fieldbyname('cantidad').asstring+
         ') where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
  sqlgeneral3.Next;
  end;
querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);

//CUENTAS NUEVAS
querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend3'+frmprincipal.idmaq+' SELECT  distinct count(tp.nombre) as total,u.codigo as code, tp.nombre as nom  '+
       'FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) '+
       'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio)  WHERE p.estatus in(3,4) and p.FechaCreacion between '+
       '"'+fecha1+'" and "'+fecha2+'" and tp.instalacion =1 and tp.nombre in("CONEXION","ENLACES","RECONEXION","EQUIPO","RECUPERACION POR BAJA" ) and con.estatus=1  '+
       'group by u.codigo order by total desc',1,sqlgeneral3);
querys('Select total,  cantidad,  code as codigo from tmpComVend3'+frmprincipal.idmaq+' left join Comisiones as cm on (total between de and a) where cm.UnidadNegocio ="CUENTAS" ' , 0, sqlgeneral3);
sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set noctasnvas="'+sqlgeneral3.fieldbyname('total').asstring+
         '", ctasnvas=('+sqlgeneral3.fieldbyname('cantidad').asstring+
         ') where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
  sqlgeneral3.Next;
  end;
querys('DROP TABLE IF EXISTS tmpComVend3'+frmprincipal.idmaq,1,sqlgeneral3);

//CCTV
querys('DROP TABLE IF EXISTS tmpComVend7'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend7'+frmprincipal.idmaq+' SELECT distinct p.idinstal, p.idpedido, round(sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)),2) as ToTDlls, '+
       'round(if(tp.comisiones = 1,p.TipoCambio,0), 2) as TipoCambio, u.codigo, left(tp.nombre,4) as Oport FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN '+
       'articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
       'WHERE p.estatus in(3,4) and p.FechaCreacion between "'+fecha1+'" and "'+fecha2+'" and tp.instalacion =1 and a.idlinea = 4 '+
       'and left(tp.nombre,4) = "CCTV"'+
       'GROUP BY dp.idpedido Order by codigo, oport',1,sqlgeneral3);

querys('DROP TABLE IF EXISTS tmpComVend8'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend8'+frmprincipal.idmaq+' select distinct p.idpedido, round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
       'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
       'ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
       'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaCreacion between "'+fecha1+'" and "'+fecha2+'" and tp.instalacion =1  and a.idlinea = 4  '+
       'and left(tp.nombre,4) = "CCTV"'+
       'GROUP BY dnc.idpedido',1,sqlgeneral3);

querys('DROP TABLE IF EXISTS tmpComVend9'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend9'+frmprincipal.idmaq+' select t.codigo, sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)) AS TotDlls, if(oport="CCTV", sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)), 0) as cctv '+
       'FROM tmpComVend7'+frmprincipal.idmaq+' as t LEFT JOIN tmpComVend8'+frmprincipal.idmaq+'  as t1 ON(t.idpedido=t1.idpedido) group by t.codigo, oport order by t.codigo, oport',1,sqlgeneral3);

querys('DROP TABLE IF EXISTS tmpComVend7'+frmprincipal.idmaq,1,sqlgeneral3);
querys('DROP TABLE IF EXISTS tmpComVend8'+frmprincipal.idmaq,1,sqlgeneral3);

querys('select codigo, cctv, cantidad, (cctv*cantidad)/100 as com from tmpComVend9'+frmprincipal.idmaq+' as t left join Comisiones as c on c.UnidadNegocio = "CCTV" where cctv between de and a', 0, sqlgeneral3);

sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set TotDlls=TotDlls+'+sqlgeneral3.fieldbyname('cctv').asstring+', cctv='+sqlgeneral3.fieldbyname('cctv').asstring+', Pcctv='+sqlgeneral3.fieldbyname('cantidad').asstring+', Totalcctv='+sqlgeneral3.fieldbyname('com').asstring+' where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"',1, sqlgeneral4);
  sqlgeneral3.Next;
  end;  
querys('DROP TABLE IF EXISTS tmpComVend9'+frmprincipal.idmaq,1,sqlgeneral3);


//VENTA EN DLLS
//querys('Select codigo,cantidad,if(TotDlls between de and a, cantidad, 0) as com from TmpComFin'+
querys('Select codigo,cantidad,if(TotDlls between de and a, (TotDlls*cantidad)/100, 0) as com from TmpComFin'+
      frmprincipal.idmaq+' as t join Comisiones where UnidadNegocio = "VENTA" having com <> 0', 0, sqlgeneral3);
sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set PCom='+sqlgeneral3.fieldbyname('cantidad').asstring+
         ', ComVtaDlls= round('+sqlgeneral3.fieldbyname('com').asstring+'*'+floattostr(tc)+',2) where codigo ="'+
         sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
  sqlgeneral3.Next;
  end;

//MAS DE 5000
//querys('Select codigo, if(TotDlls between de and a, TotDlls*cantidad, 0) as com from TmpComFin'+
querys('Select codigo, if(TotDlls between de and a, cantidad, 0) as com from TmpComFin'+
      frmprincipal.idmaq+' as t join Comisiones where UnidadNegocio = "BONO" having com <> 0', 0, sqlgeneral3);
sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set B5000Dlls='+sqlgeneral3.fieldbyname('com').asstring+' where codigo ="'+
         sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
  sqlgeneral3.Next;
  end;

//CARGOS AUTOMATICOS
querys('DROP TABLE IF EXISTS tmpComVend4'+frmprincipal.idmaq,1,sqlgeneral3);
querys('create table tmpComVend4'+frmprincipal.idmaq+' SELECT  distinct count(tp.nombre) as total,u.codigo as code, tp.nombre as nom, cm.cantidad '+
       'FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) '+
       'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN DetClientes as dc on dc.idcliente =c.idcliente join Comisiones as cm WHERE p.estatus in(3,4) and p.FechaCreacion between '+
       '"'+fecha1+'" and "'+fecha2+'" and tp.instalacion =1 and tp.nombre in("CONEXION","ENLACES","RECONEXION","EQUIPO") and con.estatus=1 and cm.UnidadNegocio ="CARGOS AUTOMATICOS" '+
       'and flcargo = 1 group by u.codigo order by total desc',1,sqlgeneral3);
querys('Select total, code as codigo, cantidad from tmpComVend4'+frmprincipal.idmaq, 0, sqlgeneral3);
sqlgeneral3.First;
while not sqlgeneral3.Eof = true do
  begin
  querys('Update TmpComFin'+frmprincipal.idmaq+' set CgoAut=('+sqlgeneral3.fieldbyname('total').asstring+'*'+
         sqlgeneral3.fieldbyname('cantidad').asstring+
         ') where codigo ="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
  sqlgeneral3.Next;
  end;
querys('DROP TABLE IF EXISTS tmpComVend4'+frmprincipal.idmaq,1,sqlgeneral3);

//MAS CUENTAS NUEVAS
 querys('Select codigo, max(noctasnvas) as mas, 1 as d from TmpComFin'+frmprincipal.idmaq+' group by d', 0, sqlgeneral);
 m := sqlgeneral.fieldbyname('mas').asstring;
 if m <> '0' then
  begin
  querys('select round(cantidad/count(codigo),2) as total from TmpComFin'+frmprincipal.idmaq+' join Comisiones where noctasnvas='+m+' and UnidadNegocio="BONO MAS CUENTAS"', 0, sqlgeneral);
  querys('Update TmpComFin'+frmprincipal.idmaq+' set MasCtaNva=('+sqlgeneral.fieldbyname('total').asstring+') where noctasnvas ='+m, 1, sqlgeneral4);
  end;

 //Obtiene el Subtotal
 querys('Update TmpComFin'+frmprincipal.idmaq+' set TotalCom =(camb + recbaja + enla + cone + reco + ctasnvas + ComVtaDlls + CgoAut + B5000Dlls + MasCtaNva + CtaReco + Totalcctv)', 1, sqlgeneral3);
 querys('select *, "'+fecha1+'" as f1, "'+fecha2+'" as f2 from TmpComFin'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
 Screen.Cursor := crDefault;
 OperacionReporte('ComisionesVendedoresTodos','Reporte de comisiones vendedores','IMP', 1);
 querys('DROP TABLE IF EXISTS TmpComFin'+frmprincipal.idmaq,1,sqlgeneral3);
 end;
end;       }

procedure RepServClientes(anio:Integer);
var i:Integer;
begin
querys('Drop table if exists tmpServClientes'+frmprincipal.idmaq,1, dmaccesos.sqlgeneral);
querys('create table tmpServClientes'+frmprincipal.idmaq+' (idcliente int(11), TOTAL int(11) default 0, M1 int(11) default 0, '+
       'M2 int(11) default 0, M3  int(11) default 0, M4  int(11) default 0, M5 int(11) default 0, M6 int(11) default 0, '+
       'M7 int(11) default 0, M8 int(11) default 0, M9 int(11) default 0, M10 int(11) default 0, M11 int(11) default 0, '+
       'M12 int(11) default 0 )',1, dmaccesos.sqlgeneral);
querys('Insert into tmpServClientes'+frmprincipal.idmaq+' (idcliente) Select idcliente  from clientes where estatus = 1',1, dmaccesos.sqlgeneral);

for i:=1 to 12 do
  begin
  if querys('Select count(sid) as s, c.idcliente from servicios as s left join clientes as c on c.idcliente=s.idcliente where '+
         'c.idcliente=s.idcliente and year(s.Fecha_creacion) = '+inttostr(anio)+' and month(s.fecha_creacion) ='+inttostr(i)+
         ' and c.estatus = 1 group by s.idcliente',0, dmaccesos.sqlgeneral) > 0 then
    begin
    dmaccesos.sqlgeneral.First;
    while not dmaccesos.sqlgeneral.eof = true do
      begin
      querys('Update tmpServClientes'+frmprincipal.idmaq+' set M'+inttostr(i)+' = '+dmaccesos.sqlgeneral.fieldbyname('s').AsString+
             ' where idcliente='+dmaccesos.sqlgeneral.fieldbyname('idcliente').asstring, 1, dmreportes.sqlgeneral5);
      dmaccesos.sqlgeneral.Next;
      end;
    end;
  end;
querys('update tmpServClientes'+frmprincipal.idmaq+' set TOTAL= M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, dmaccesos.sqlgeneral);
querys('Delete from tmpServClientes'+frmprincipal.idmaq+' where TOTAL= 0', 1, dmaccesos.sqlgeneral);
end;

procedure TickPendTec;
var
mes, dia, anio:word;
i, d:integer;
fechabus:string;
sqlgeneral:TMyQuery;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
querys('Drop table if exists tmpTckPendTec'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpTckPendTec'+frmprincipal.idmaq+' (CodTecnico varchar (15), nombre varchar (40), Hoy int (11) default 0, 24HRS int (11) default 0, 48HRS int (11) default 0)', 1, sqlgeneral);
querys('select s.CodTecnico, concat(usuarios.nombre, '' '', usuarios.apaterno) as tecnico, count(distinct(s.sid)) as totserv, if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	'+
       '(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)), if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+FormatDateTime('HH:mm:ss',Time)+'">s.hora_creacion),'+
       '24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)),0),0)))<=24, ''1'', if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour('+
       '"'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)), if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+FormatDateTime('HH:mm:ss',Time)+'">s.hora_creacion),24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)),0),0))) >48, ''3'', ''2'')) '+
       'AS 24hrs from servicios as s left join EstatusServicios as es ON (es.orden=s.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) left join usuarios on (usuarios.codigo2=s.CodTecnico and usuarios.codigo2 <> "") '+
       'where s.status < 4  and ts.nombre=''ESTATUS SERVICIO'' group by codTecnico, 24hrs order by 24hrs', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.eof = true do
  begin
  querys('Insert into tmpTckPendTec'+frmprincipal.idmaq+' set CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').asstring)+', nombre='+quotedstr(sqlgeneral.fieldbyname('tecnico').asstring), 1, dmreportes.sqlgeneral2);
  sqlgeneral.Next;
  end;

sqlgeneral.First;
while not sqlgeneral.eof = true do
  begin
  if sqlgeneral.fieldbyname('24hrs').asinteger = 1 then
    querys('Update tmpTckPendTec'+frmprincipal.idmaq+' set Hoy='+quotedstr(sqlgeneral.fieldbyname('totserv').asstring)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').asstring), 1, dmreportes.sqlgeneral2);
  if sqlgeneral.fieldbyname('24hrs').asinteger = 2 then
    querys('Update tmpTckPendTec'+frmprincipal.idmaq+' set 24HRS='+quotedstr(sqlgeneral.fieldbyname('totserv').asstring)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').asstring), 1, dmreportes.sqlgeneral2);
  if sqlgeneral.fieldbyname('24hrs').asinteger = 3 then
    querys('Update tmpTckPendTec'+frmprincipal.idmaq+' set 48HRS='+quotedstr(sqlgeneral.fieldbyname('totserv').asstring)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').asstring), 1, dmreportes.sqlgeneral2);
  sqlgeneral.Next;
  end;
querys('Select * from tmpTckPendTec'+frmprincipal.idmaq+' group by codTecnico order by codTecnico', 0, dmreportes.sqlgeneral);

////////////*************** CONCENTRADO DE TICKETS PENDIENTES POR HORA *****************////////////////////////

    /// *** Verifica si ya se inserto el anio y mes actual *** ///

    querys('Select anio, mes  from  TicketsPendientes where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'")',0, sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
       begin
       querys('Insert into TicketsPendientes (anio, mes, concepto, orden) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), ''HOY'', 1)',1, sqlgeneral);
       querys('Insert into TicketsPendientes (anio, mes, concepto, orden) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), ''24HRS'', 2)',1, sqlgeneral);
       querys('Insert into TicketsPendientes (anio, mes, concepto, orden) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), ''48HRS'', 3)',1, sqlgeneral);
       querys('Insert into TicketsPendientes (anio, mes, concepto, orden) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), ''SUMA'', 4)',1, sqlgeneral);
       querys('Insert into TicketsPendientes (anio, mes, concepto, orden) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), ''FINALIZADOS'', 5)',1, sqlgeneral);
       //querys('Insert into TicketsPendientes (anio, mes, concepto, orden) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), ''VENCIDOS'', 5)',1, sqlgeneral);
       end;

    //  Verifica cuales son los dias en que no se realizo el concentrado  //
    d:= DayOfTheMonth(FechaServidor);

    for i:=1 to d do
      begin
      querys('Select d'+inttostr(i)+', month("'+datetostr(date)+'") as mes, anio from TicketsPendientes '+
             'where concepto = ''SUMA'' and d'+inttostr(i)+' = 0 and anio = year("'+datetostr(date)+'")', 0, sqlgeneral);
      if sqlgeneral.recordcount > 0 then
         begin
         fechabus := datetostr(EncodeDate(sqlgeneral.fieldbyname('anio').asinteger,sqlgeneral.fieldbyname('mes').asinteger, i));
         querys('select count(distinct(sid)) as totserv, if((if((to_days('+quotedstr(fechabus)+') -to_days(s.fecha_creacion)) > 1, (to_days('+quotedstr(fechabus)+') -to_days(s.fecha_creacion))*24+(hour('+quotedstr(fechabus)+')-hour(s.hora_creacion)), '+
                'if((to_days('+quotedstr(fechabus)+') -to_days(s.fecha_creacion)) =1, 	if(('+quotedstr(fechabus)+'>s.hora_creacion), 24+(hour('+quotedstr(fechabus)+')-hour(s.hora_creacion)),0),0)))<=24, ''1'', if((if((to_days('+quotedstr(fechabus)+') '+
                '-to_days(s.fecha_creacion)) > 1,	(to_days('+quotedstr(fechabus)+') -to_days(s.fecha_creacion))*24+(hour('+quotedstr(fechabus)+')-hour(s.hora_creacion)), if((to_days('+quotedstr(fechabus)+') -to_days(s.fecha_creacion)) =1, '+
                'if(( '+quotedstr(fechabus)+'>s.hora_creacion),24+(hour( '+quotedstr(fechabus)+')-hour(s.hora_creacion)),0),0))) >48, ''3'', ''2'')) aS 24hrs from servicios as s left join EstatusServicios as es ON (es.orden=s.status) '+
                'left join TipoServicios as ts ON (ts.idserv=es.idserv) left join usuarios on (usuarios.codigo2=s.CodTecnico) where ts.nombre=''ESTATUS SERVICIO'' and s.fecha_creacion <= '+quotedstr(fechabus)+' and '+
                'year(s.fecha_creacion) = year('+quotedstr(fechabus)+') and (FechaFinUsr > '+quotedstr(fechabus)+' or FechaFinUsr is null) group by 24hrs order by 24hrs', 0, dmreportes.sqlgeneral2);
         dmreportes.sqlgeneral2.First;
         while not dmreportes.sqlgeneral2.eof do
            begin
            case dmreportes.sqlgeneral2.FieldByName('24hrs').Asinteger of
            1: querys('Update TicketsPendientes set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral2.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''HOY'' ', 1, dmreportes.sqlgeneral3);
            2: querys('Update TicketsPendientes set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral2.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''24HRS'' ', 1, dmreportes.sqlgeneral3);
            3: querys('Update TicketsPendientes set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral2.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''48HRS'' ', 1, dmreportes.sqlgeneral3);
            end;
        dmreportes.sqlgeneral2.Next;
        end;

        //Actualiza el total
        querys('Select sum(d'+inttostr(i)+') as totserv from TicketsPendientes where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and (concepto=''HOY'' or concepto=''24HRS'' or concepto=''48HRS'')', 0, dmreportes.sqlgeneral2);
        querys('Update TicketsPendientes set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral2.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''SUMA'' ', 1, dmreportes.sqlgeneral3);
        // actualiza los finalizados
        //querys('select count(sid) as fin from servicios where FechaFinUsr='+quotedstr(fechabus), 0, dmreportes.sqlgeneral3);
        querys('select count(sid) as fin from servicios left join EstatusServicios as es  ON (es.orden=servicios.status)  where FechaFinUsr= "'+fechabus+'" and es.nombre =  "FINALIZADA"', 0, dmreportes.sqlgeneral3);
        querys('Update TicketsPendientes set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral3.fieldbyname('fin').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''FINALIZADOS'' ', 1, dmreportes.sqlgeneral2);
        end;

      end;  //for
    // Realiza el dia actual
    querys('select  count(distinct(sid)) as totserv, if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1, (to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion))*24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)), if((to_days("'+datetostr(date)+'") '+
           '-to_days(s.fecha_creacion)) =1, if(("'+FormatDateTime('HH:mm:ss',Time)+'">s.hora_creacion), 24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)),0),0)))<=24, ''1'', if((if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) > 1,	(to_days("'+datetostr(date)+'") '+
           '-to_days(s.fecha_creacion))*24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)), if((to_days("'+datetostr(date)+'") -to_days(s.fecha_creacion)) =1, if(("'+FormatDateTime('HH:mm:ss',Time)+'">s.hora_creacion),24+(hour("'+FormatDateTime('HH:mm:ss',Time)+'")-hour(s.hora_creacion)),0),0))) >48, ''3'', ''2'')) '+
           'AS 24hrs from servicios as s left join EstatusServicios as es ON (es.orden=s.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) left join usuarios on (usuarios.codigo2=s.CodTecnico) where '+
           's.status <= 4 '+
           ' and ts.nombre=''ESTATUS SERVICIO'' group by 24hrs order by 24hrs', 0, sqlgeneral);

    decodedate(FechaServidor, anio, mes, dia);
    sqlgeneral.First;
    while not sqlgeneral.eof = true do
      begin
        case sqlgeneral.FieldByName('24hrs').Asinteger of
        1: querys('Update TicketsPendientes set d'+vartostr(dia)+' = '+quotedstr(sqlgeneral.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''HOY'' ', 1, dmreportes.sqlgeneral2);
        2: querys('Update TicketsPendientes set d'+vartostr(dia)+' = '+quotedstr(sqlgeneral.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''24HRS'' ', 1, dmreportes.sqlgeneral2);
        3: querys('Update TicketsPendientes set d'+vartostr(dia)+' = '+quotedstr(sqlgeneral.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''48HRS'' ', 1, dmreportes.sqlgeneral2);
        end;
      sqlgeneral.Next;
      end;

        //Actualiza el total
    querys('Select sum(d'+inttostr(d)+') as totserv from TicketsPendientes where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and (concepto=''HOY'' or concepto=''24HRS'' or concepto=''48HRS'')', 0, dmreportes.sqlgeneral2);
    querys('Update TicketsPendientes set d'+vartostr(dia)+' = '+quotedstr(dmreportes.sqlgeneral2.fieldbyname('totserv').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''SUMA'' ', 1, dmreportes.sqlgeneral3);

    querys('select count(distinct(sid)) as fin from servicios where FechaFinUsr="'+datetostr(date)+'" and status=5', 0, dmreportes.sqlgeneral3);
    querys('Update TicketsPendientes set d'+vartostr(dia)+' = '+quotedstr(dmreportes.sqlgeneral3.fieldbyname('fin').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and concepto=''FINALIZADOS'' ', 1, dmreportes.sqlgeneral2);

    querys('Select * from TicketsPendientes where mes ='+vartostr(mes)+' and anio=year("'+datetostr(date)+'") order by orden', 0, dmreportes.sqlgeneral2);


    ///----- CONCENTRADO DE TICKETS FINALIZADOS POR TECNICO -----///
    TickFinalizados;

    querys('Select t.*, if(t.CodTecnico = "Z" , " ", t.CodTecnico) as CodTecnico, if(t.CodTecnico = "Z" , "TOTAL", '+
    'usuarios.nombre) as tecnico from TicketsFinalizados as t left join usuarios on (usuarios.codigo2=t.CodTecnico) '+
    'where t.anio=year("'+datetostr(date)+'") and t.mes=month("'+datetostr(date)+'") order by t.CodTecnico asc', 0, dmreportes.sqlgeneral3);

end;

procedure TickFinalizados;
var
mes, dia, anio:word;
i, d:integer;       //, dd, dm
fechabus:string;
sqlgeneral:TMyQuery;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
d:= DayOfTheMonth(FechaServidor);
decodedate(FechaServidor, anio, mes, dia);
//dm := DaysInAMonth(anio, mes);
    fechabus := datetostr(EncodeDate(anio,mes, 1));

    // INSERTA LOS TECNICOS DEL MES //
    querys('select CodTecnico from servicios where FechaFinUsr between "'+fechabus+'" and "'+datetostr(date)+'" and status = 5 group by CodTecnico order by CodTecnico', 0, sqlgeneral);
    sqlgeneral.First;
    while not sqlgeneral.Eof = true do
      begin
      if sqlgeneral.fieldbyname('CodTecnico').AsString <> '' then
        begin
        querys('select CodTecnico from TicketsFinalizados where CodTecnico="'+sqlgeneral.fieldbyname('CodTecnico').AsString+'" and anio=year("'+fechabus+'") and mes=month("'+fechabus+'")', 0, dmreportes.sqlgeneral7);
        if dmreportes.sqlgeneral7.RecordCount <= 0 then
           querys('Insert into TicketsFinalizados (anio, mes, CodTecnico) values (year("'+fechabus+'") , month("'+fechabus+'"), "'+sqlgeneral.fieldbyname('CodTecnico').AsString+'")', 1, dmreportes.sqlgeneral8);
        end;
      sqlgeneral.Next;
      end;
    // inserta el tecnico Z para totales

    querys('select CodTecnico from TicketsFinalizados where CodTecnico="Z" and anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'")', 0, dmreportes.sqlgeneral7);
    if dmreportes.sqlgeneral7.RecordCount <= 0 then
       querys('Insert into TicketsFinalizados (anio, mes, CodTecnico) values (year("'+datetostr(date)+'") , month("'+datetostr(date)+'"), "Z")', 1, dmreportes.sqlgeneral8);

    // ACTUALIZA LOS TICKETS FINALIZADOS //

    querys('Select max(d'+inttostr(dia)+') as d'+inttostr(dia)+', mes, anio from TicketsFinalizados where d'+inttostr(dia)+' = 0 and anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") group by mes', 0, sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      for i:=1 to (d-1) do
        begin
        DecodeDate(FechaServidor, anio, mes, dia);
        fechabus := datetostr(EncodeDate(anio,mes, i));
        //querys('select FechaFinUsr, CodTecnico, count(distinct(sid)) as fin from servicios where FechaFinUsr= '+quotedstr(fechabus)+' and FechaFinUsr <= "'+datetostr(date)+'" group by CodTecnico, FechaFinUsr order by CodTecnico, FechaFinUsr', 0, sqlgeneral);
        querys('select FechaFinUsr, CodTecnico, count(distinct(sid)) as fin from servicios left join EstatusServicios as es ON (es.orden=servicios.status) where FechaFinUSr = "'+fechabus+'"  and es.nombre =  "FINALIZADA" group by CodTecnico, FechaFinUsr order by CodTecnico, FechaFinUsr', 0, sqlgeneral);
        sqlgeneral.first;
        while not sqlgeneral.EOF = true do
          begin
          querys('Update TicketsFinalizados set d'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('fin').AsString)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').AsString)+' and anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'")',1, dmreportes.sqlgeneral7);
          sqlgeneral.next;
          end; //while
        end;
      end; //if
    // ACTUALIZA EL DIA ACTUAL //

    querys('select FechaFinUsr, CodTecnico, count(distinct(sid)) as fin from servicios where FechaFinUsr = '+quotedstr(datetostr(FechaServidor))+' and status=5  group by CodTecnico, FechaFinUsr order by CodTecnico, FechaFinUsr', 0, sqlgeneral);
    sqlgeneral.first;
        while not sqlgeneral.EOF = true do
          begin
          querys('Update TicketsFinalizados set d'+inttostr(d)+'='+quotedstr(sqlgeneral.fieldbyname('fin').AsString)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').AsString)+' and anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'")',1, dmreportes.sqlgeneral7);
          sqlgeneral.next;
          end; //while

    for i:=1 to (d) do
      begin
      querys('Select sum(d'+inttostr(i)+') as tot from TicketsFinalizados where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and CodTecnico <> ''Z'' ', 0, dmreportes.sqlgeneral5);
      querys('Update TicketsFinalizados set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral5.fieldbyname('tot').asstring)+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'") and CodTecnico=''Z'' ', 1, dmreportes.sqlgeneral6);
      end;
querys('Update TicketsFinalizados set total = D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31 ', 1, dmreportes.sqlgeneral6);
//if d = 1 then
//  dd := d;
//else
// dd := d-1;
querys('Update TicketsFinalizados set tendencia = (total/'+inttostr(DiasHabilesMesAFecha(date))+')*'+inttostr(DiasHabilesMes(yearof(date), monthof(date)))+' where anio=year("'+datetostr(date)+'") and mes=month("'+datetostr(date)+'")', 1, dmreportes.sqlgeneral6);

end;

procedure ServTotAnualClientes(TipoImpresion, MayorA:string;Estatus:Integer);
var i, ban:Integer;  cadena:String;
begin          /////FALTA EL HAVING > 1, 2. ...
ban := 0;
case estatus of
  0: cadena := '';
  1: cadena := 'and estatus = 1 ';
  2: cadena := 'and estatus = 0 ';
  end;


with dmreportes do
  begin     
 { // INSERTA LOS CLIENTES  DEL AÑO //
  querys('select distinct idcliente from servicios where year(fecha_creacion)=year("'+datetostr(date)+'") and idcliente not '+
         'in(select idcliente from TotalServiciosClientes where anio=year("'+datetostr(date)+'")) group by idcliente order by '+
         'idcliente', 0, sqlgeneral4);
  sqlgeneral4.First;
  while not sqlgeneral4.Eof = true do
    begin
    if sqlgeneral4.fieldbyname('idcliente').AsString <> '' then
      querys('Insert into TotalServiciosClientes (anio, idcliente) values (year("'+datetostr(date)+'"), "'+
      sqlgeneral4.fieldbyname('idcliente').AsString+'")', 1, sqlgeneral5);
    sqlgeneral4.Next;
    end;       }

  //Actualiza los tickets
  for i:=1 to 12 do
    begin
    querys('Select sum(m'+inttostr(i)+') as t from TotalServiciosClientes where anio = year("'+datetostr(date)+'") group by anio', 0, sqlgeneral4);
    if sqlgeneral4.FieldByName('t').AsInteger > 0 then
      begin
      ban := 1;
      if i >= (monthof(today)-1) then
        ban := 0;
      end;

    if ban <> 1 then
      begin
      if querys('select idcliente, month(fecha_creacion) as mes, count(sid) as total from servicios '+
                'where month(fecha_creacion) ='+inttostr(i)+' and year(fecha_creacion)= year("'+datetostr(date)+'") '+
                'group by idcliente order by mes, idcliente',0, sqlgeneral4) > 0 then
        begin
        sqlgeneral4.First;
        while not sqlgeneral4.Eof = true do
          begin
          if i = sqlgeneral4.fieldbyname('mes').AsInteger then
            begin
            if querys('Select idcliente from  TotalServiciosClientes where anio = year("'+datetostr(date)+'") and idcliente="'+
                     sqlgeneral4.fieldbyname('idcliente').AsString+'"', 0, sqlgeneral6) = 0 then
              querys('Insert into TotalServiciosClientes (anio, idcliente) values (year("'+datetostr(date)+'"), "'+
                      sqlgeneral4.fieldbyname('idcliente').AsString+'")', 1, sqlgeneral5);
            querys('Update TotalServiciosClientes set M'+inttostr(i)+'= '+sqlgeneral4.fieldbyname('total').AsString+
                   ' where anio = year("'+datetostr(date)+'") and idcliente="'+sqlgeneral4.fieldbyname('idcliente').AsString+'"', 1, sqlgeneral5);
            end;
        sqlgeneral4.Next;
        end;
      end;
    end;
  end;
  querys('Update TotalServiciosClientes set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where anio = year("'+datetostr(date)+'")', 1, sqlgeneral5);
  querys('select t.*, '+ClienteNombre('c')+' as nombre, if(c.estatus=1, "ACTIVOS", if(c.estatus=0, "INACTIVOS", "PENDIENTES")) as estatus '+
         'from TotalServiciosClientes as t join clientes as c on c.idcliente=t.idcliente where anio = year("'+datetostr(date)+'") '+
         cadena+' having total > '+mayora+' order by estatus, total desc', 0, sqlgeneral);
  end;
operacionreporte('ServiciosClientesAnual', 'Total de Servicios por Clientes', TipoImpresion, 1);
end;

procedure RepAntiguedadSaldosConcentrado(mes,ano,TipoImpresion:string);
var mess:string;    // , fecha
begin
mess := meses[strtoint(mes)];

//if mes = '1' then
  //ano := inttostr(strtoint(ano)-1);

//fecha := datetostr(encodedate(strtoint(ano), strtoint(mes), DaysInAMonth(strtoint(ano), strtoint(mes))));

querys('SELECT "Al mes '+mess+' del '+ano+'" as periodo,"REMISIONES" as titulo,  '+
       'TXVencer, TVencidos, sector, Sum(VENCIDO) as VENCIDO, '+
       'SUM(XVENCER) as XVENCER FROM RepAntiguedadSaldos '+
       'where mes = "'+mess+'" and ano = '+ano+' GROUP BY sector ORDER BY sector ASC',0,dmreportes.sqlgeneral3);
OperacionReporte('RepAntxLineaConcen','Reporte de antiguedad por linea Concentrado',TipoImpresion, 1);
end;

procedure RepAntiguedadSaldosFacConcentrado(mes,ano,TipoImpresion:string);
var mess:string;    // , fecha
begin
mess := meses[strtoint(mes)];

querys('SELECT "Al mes '+mess+' del '+ano+'" as periodo,"REMISIONES" as titulo,  '+
       'TXVencer, TVencidos, sector, Sum(VENCIDO) as VENCIDO, '+
       'SUM(XVENCER) as XVENCER FROM RepAntiguedadSaldosFacturas '+
       'where mes = "'+mess+'" and ano = '+ano+' GROUP BY sector ORDER BY sector ASC',0,dmreportes.sqlgeneral3);
OperacionReporte('RepAntxLineaConcen','Reporte de antiguedad por linea Concentrado (Facturas)',TipoImpresion, 1);
end;

procedure RepEstandaresInstalaciones(f1,f2,TipoImpresion:string);
var  sqlgeneral, sqlgeneral2:TmyQuery;   //   d34:string;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
sqlgeneral2 := tmyquery.Create(nil);
sqlgeneral2.Connection := dmaccesos.conexion;                 

querys('select "De  '+f1+'  a  '+f2+'" as periodo, if(codigo="", "SIN", codigo) as codigo, if(codigo="", "SIN INSTALADOR", tecnico) as tecnico, '+
       'round(sum(TotHrs),2) as FinHrs, round((estandar/6)*((to_days("'+f2+'")-to_days("'+f1+'"))+1) -sum(TotHrs),2)  as Diferencia, '+
       '((estandar/6)*((to_days("'+f2+'")-to_days("'+f1+'"))+1) ) as estandar, round((sum(TotHrs)/((estandar/6)*((to_days("'+f2+'") - '+
       'to_days("'+f1+'"))+1) ) )*100,2) as porcentaje from ( SELECT if(instalador2 <> "", (p.TotHrsCom + i.TExtra)/2, (p.TotHrsCom + i.TExtra)) '+
       'as TotHrs, 1 as cant , u.codigo, if(u.codigo is null, "SIN INSTALADOR", '+UsuarioNombre('u')+') as tecnico, i.FechaFinal, p.idpedido, estandar '+
       'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido)  left join usuarios as u  on (u.codigo=i.instalador1 and '+
       'length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto '+
       'LEFT JOIN UnidadNegocio as un On (un.idUnidadNegocio = p.idUnidadNegocio) LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) '+
       'WHERE i.FechaFinal between "'+f1+'" and "'+f2+'" and p.estatus IN(3,4) and i.estatus = 1 and ObraEnProceso <> 1 and p.estatus in(3,4) '+
       'and un.instalacion = 1 and (u.idarea = 2) GROUP BY p.idpedido, u.codigo '+
       'UNION '+
       'SELECT  ((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100 as TotHrs,  '+
       '1 as cant , u.codigo, if(u.codigo is null, "SIN INSTALADOR", '+UsuarioNombre('u')+') as tecnico, i.FechaFinal, p.idpedido, estandar '+
       'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u  on (u.codigo=i.instalador1 and '+
       'length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto '+
       'Left join ObrasProceso as op on op.idinstalacion = i.idinstalacion left join (select o.idstatus, cs.nombre, o.idinstalacion from ObrasProceso '+
       'as o left join clasif_servicios as cs on cs.idstatus=o.idstatus and cs.idserv = 10 where idobra in (Select max(idobra) as idobra from '+
       'ObrasProceso as o where FechaObra between "'+f1+'" and "'+f2+'" group by idinstalacion) group by idinstalacion) as cs on cs.idinstalacion = '+
       'i.idinstalacion left join (select o2.idstatus, cs2.nombre, o2.idinstalacion from ObrasProceso as o2 left join clasif_servicios as cs2 on '+
       'cs2.idstatus=o2.idstatus and cs2.idserv = 10 where idobra in (Select max(idobra) as idobra from ObrasProceso as o where FechaObra < "'+f1+'" '+
       'group by idinstalacion) group by idinstalacion ) as cs2 on i.idinstalacion=cs2.idinstalacion left join clasif_servicios as cs1 on '+
       'cs1.idstatus=i.idstatus and cs1.idserv = 10 WHERE  p.estatus IN(3,4) and ObraEnProceso = 1 and op.FechaObra between "'+f1+'" and "'+f2+'" '+
       'GROUP BY p.idpedido, u.codigo ) as tmpinst group by codigo ORDER BY tecnico,FechaFinal', 0, dmreportes.sqlgeneral);

querys('select if(codigo="", "SIN", codigo) as codigo, if(codigo="", "SIN INSTALADOR", tecnico) as tecnico, round(sum(TotHrs),2) as FinHrs, '+
       'concat("De ", cast(subdate("'+f2+'", interval 4 week)+1 as date), " a ", subdate("'+f2+'", interval 3 week)) as ps1, '+
       'concat("De ", cast(subdate("'+f2+'", interval 3 week)+1 as date), " a ", subdate("'+f2+'", interval 2 week)) as ps2, '+
       'concat("De ", cast(subdate("'+f2+'", interval 2 week)+1 as date), " a ", subdate("'+f2+'", interval 1 week)) as ps3, '+
       'concat("De ", cast(subdate("'+f2+'", interval 1 week)+1 as date), " a ", "'+f2+'") as ps4, '+
       'sum(s1) as s1, sum(s2) as s2, sum(s3) as s3, sum(s4) as s4 from ( '+
       'SELECT distinct if(instalador2 <> "", (p.TotHrsCom + i.TExtra)/2, (p.TotHrsCom + i.TExtra)) as TotHrs, 1 as cant , u.codigo, '+
       'if(u.codigo is null, "SIN INSTALADOR", '+UsuarioNombre('u')+') as tecnico, i.FechaFinal, p.idpedido, '+
       'if( i.FechaFinal between subdate("'+f2+'", interval 4 week)+1 and subdate("'+f2+'", interval 3 week), p.TotHrsCom, 0) as s1, '+
       'if( i.FechaFinal between subdate("'+f2+'", interval 3 week)+1 and subdate("'+f2+'", interval 2 week), p.TotHrsCom, 0) as s2, '+
       'if( i.FechaFinal between subdate("'+f2+'", interval 2 week)+1 and subdate("'+f2+'", interval 1 week), p.TotHrsCom, 0) as s3, '+
       'if( i.FechaFinal between subdate("'+f2+'", interval 1 week)+1 and "'+f2+'", p.TotHrsCom, 0) as s4 '+
       'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido)  left join usuarios as u  on '+
       '(u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) '+
       'Left Join Estandares as e on e.idpuesto =u.idpuesto LEFT JOIN UnidadNegocio as un On (un.idUnidadNegocio = p.idUnidadNegocio) '+
       'LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) WHERE i.FechaFinal between "'+f1+'" and "'+f2+'" and p.estatus IN(3,4) '+
       'and i.estatus = 1 and ObraEnProceso <> 1 and p.estatus in(3,4) and un.instalacion = 1 and (u.idarea = 2) GROUP BY p.idpedido, u.codigo '+
       'UNION '+
       'SELECT  distinct ((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100 as TotHrs, '+
       '1 as cant, u.codigo, if(u.codigo is null, "SIN INSTALADOR", '+UsuarioNombre('u')+') as tecnico, i.FechaFinal, p.idpedido, '+
       'if( cs.FechaObra between subdate("'+f2+'", interval 4 week)+1 and subdate("'+f2+'", interval 3 week),  ((if(instalador2 <> "", '+
       '(p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100, 0) as s1, '+
       'if( cs.FechaObra between subdate("'+f2+'", interval 3 week)+1 and subdate("'+f2+'", interval 2 week),  ((if(instalador2 <> "", '+
       '(p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100, 0) as s2, '+
       'if( cs.FechaObra between subdate("'+f2+'", interval 2 week)+1 and subdate("'+f2+'", interval 1 week),  ((if(instalador2 <> "", '+
       '(p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100, 0) as s3, '+
       'if( cs.FechaObra between subdate("'+f2+'", interval 1 week)+1 and "'+f2+'",  ((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) '+
       ') *(cs.nombre- if(cs2.nombre is null, 0,  cs2.nombre)) )/100, 0) as s4 '+
       'FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u  on (u.codigo=i.instalador1 '+
       'and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto = '+
       'u.idpuesto Left join ObrasProceso as op on op.idinstalacion = i.idinstalacion left join ( select o.idstatus, cs.nombre, o.idinstalacion, o.FechaObra '+
       'from ObrasProceso as o left join clasif_servicios as cs on cs.idstatus=o.idstatus and cs.idserv = 10 where idobra in ( '+
       'Select max(idobra) as idobra from ObrasProceso as o where FechaObra between "'+f1+'" and "'+f2+'" group by idinstalacion) '+
       'group by idinstalacion ) as cs on cs.idinstalacion = i.idinstalacion left join ( 	select o2.idstatus, cs2.nombre, o2.idinstalacion, '+
       'o2.FechaObra  from ObrasProceso as o2 left join clasif_servicios as cs2 on cs2.idstatus=o2.idstatus and cs2.idserv = 10 '+
       'where idobra in (Select max(idobra) as idobra from ObrasProceso as o where FechaObra < "'+f1+'" group by idinstalacion) group by idinstalacion '+
       ') as cs2 on i.idinstalacion=cs2.idinstalacion left join clasif_servicios as cs1 on cs1.idstatus=i.idstatus and cs1.idserv = 10 '+
       'WHERE  p.estatus IN(3,4) and ObraEnProceso = 1 and op.FechaObra between "'+f1+'" and "'+f2+'" GROUP BY p.idpedido, u.codigo '+
       ') as tmpinst   group by codigo', 0, dmreportes.sqlgeneral2);
operacionreporte('MetaInstaladores', 'Meta instaladores',TipoImpresion, 1);


end;

procedure RepEstandaresServicios(desde,hasta,TipoImpresion:string;meta,condicion:integer);    // dias
var mt:integer; inimes,finmes,finsema,desde1,desde2,desde3,hasta1,hasta2,hasta3:TDateTime;
    dia,mes,anio,diasactual, diashab:word;  //estandar :string;   diasmes,
begin
   {dias:=DayOf(strtodate(hasta)-strtodate(desde))+1;
   mt:=round(((dias)*meta)/(7));}
    mt:=0;
    //diasmes:=0;
    //diasactual:=0;

   // diasmes:=DaysInAMonth(yearof(date),MonthOf(date));
    diasactual:=DayOf(date);
   if condicion=0 then
      mt:=meta;
   if condicion=1 then
      mt:=meta*4;
   frmmensaje.Show;
   frmmensaje.Update;
   querys('select t7.Codigo,t7.Tecnico,if(t7.Tickets is null,0,t7.Tickets) as periodo,'+inttostr(meta)+' as Estandar,('+inttostr(mt)+'-t7.Tickets) dif,'+
          ' if(round(((t7.Tickets*100)/'+inttostr(meta)+'),2) is null,0,round(((t7.Tickets*100)/'+inttostr(meta)+'),2)) as  Porcentaje,'+
          ' "del  '+inttostr(dayOf(strtodate(desde)))+'/'+inttostr(MonthOf(strtodate(desde)))+'/'+inttostr(yearof(strtodate(desde)))+
          '  al  '+inttostr(dayOf(strtodate(hasta)))+'/'+inttostr(MonthOf(strtodate(hasta)))+'/'+inttostr(yearof(strtodate(hasta)))+'" as fecha,week("'+hasta+'",3) as semana'+
          ' from(	select codigo,tecnico,count(codigo) as Tickets from(select s.CodTecnico as Codigo,concat(u.nombre," ", u.apaterno) as Tecnico, if (fechaFinsys between "'+desde+'" and "'+hasta+'",1,0) as condicion'+
          ' from servicios s left join usuarios u on u.codigo2=s.CodTecnico  where FechaFinUSr between "'+desde+'" and "'+hasta+'" and s.CodTecnico<>"TSC" and status=5'+
          '	having condicion=1) as tabla group by codigo) as t7 left join usuarios u on t7.codigo=u.codigo2 where u.idpuesto=16 or u.idpuesto=3'+
          ' order by porcentaje desc',0,dmreportes.sqlgeneral);
          finsema:=encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),DaysInAMonth(yearof(strtodate(desde)),monthof(strtodate(desde))));
          DecodeDate(finsema,anio,mes,dia);

    diashab := DiasHabilesMes(yearof(strtodate(desde)), monthof(strtodate(desde)));
   querys('select t1.CodTecnico, t1.Tickets  as sem1,if(t2.Tickets is null,0,t2.Tickets) as sem2, if(t3.Tickets is null,0,t3.Tickets)  as sem3,'+
          ' if(t4.Tickets is null,0,t4.Tickets)  as sem4,(t1.Tickets)+if(t2.Tickets is null,0,t2.Tickets)+if(t3.Tickets is null,0,t3.Tickets) +if(t4.Tickets is null,0,t4.Tickets) as total,'+
          ' round((((t1.Tickets)+if(t2.Tickets is null,0,t2.Tickets)+if(t3.Tickets is null,0,t3.Tickets) +if(t4.Tickets is null,0,t4.Tickets))/'+inttostr(diasactual)+')*'+
          //inttostr(diasmes)+
          inttostr(diashab)+
          ',2) as tendencia,'+
          ' concat(u.nombre," ",if(u.apaterno is null," ",u.apaterno)," ",if(u.amaterno is null," ",u.amaterno)) as Tecnico,'+
          ' " del '+inttostr(1)+' al '+inttostr(7)+' " as p1, " del '+inttostr(8)+' al '+inttostr(14)+' " as p2, " del '+inttostr(15)+' al '+inttostr(21)+' " as p3, " del '+inttostr(22)+' al '+inttostr(dia)+' " as p4'+
          ' from (select CodTecnico,count(CodTecnico) as Tickets from(select s.CodTecnico'+
          '	from servicios s where FechaFinUSr between "'+DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+'" and date_add("'+DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+
          '", INTERVAL 6 DAY) and s.CodTecnico<>"TSC" and status=5'+
		    '  ) as t group by CodTecnico) as t1 left join (select CodTecnico,count(CodTecnico) as Tickets	from (select s.CodTecnico'+
          '	from servicios s	where FechaFinUSr between date_add("'+DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+'", INTERVAL 7 DAY) and date_add("'+
          DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+'", INTERVAL 13 DAY) and s.CodTecnico<>"TSC" and status=5'+
          '	) as t group by CodTecnico) as t2 on t1.CodTecnico=t2.CodTecnico left join (select CodTecnico,count(CodTecnico) as Tickets from (select s.CodTecnico'+
          ' from servicios s where FechaFinUSr between date_add("'+DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+'", INTERVAL 14 DAY) '+
          ' and date_add("'+DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+'", INTERVAL 20 DAY) and s.CodTecnico<>"TSC" and status=5'+
          ' ) as t group by CodTecnico) as t3 on t1.codtecnico=t3.CodTecnico left join (select CodTecnico,count(CodTecnico) as Tickets from (select s.CodTecnico'+
          ' from servicios s where FechaFinUSr between date_add("'+DateToStr(encodedate(yearof(strtodate(desde)),monthof(strtodate(desde)),1))+'", INTERVAL 21 DAY) and "'+datetostr(finsema)+'" and s.CodTecnico<>"TSC" and status=5'+
          ' ) as t group by CodTecnico) as t4 on t4.codtecnico=t1.CodTecnico left join usuarios u on t1.CodTecnico=u.codigo2 '+
          'where u.codigo2 <> " " and u.idpuesto =16 order by sem1 desc',0,dmreportes.sqlgeneral3);
   inimes:=EncodeDate(YearOf(strtodate(desde)),MonthOf(strtodate(desde)),01);
   finmes:=EncodeDate(YearOf(strtodate(desde)),MonthOf(strtodate(desde)),DayOf(Date));
   desde1:=IncMonth(inimes,-1);
   hasta1:=IncMonth(finmes,-1);
   desde2:=IncMonth(desde1,-1);
   hasta2:=IncMonth(hasta1,-1);
   desde3:=IncMonth(desde2,-1);
   hasta3:=IncMonth(hasta2,-1);
   querys('select t1.status,t1.activaciones as m1,t2.activaciones as m2,t3.activaciones as m3,t4.activaciones as m4,'+
          '"del '+inttostr(dayOf(inimes))+'/'+inttostr(MonthOf(inimes))+' al '+inttostr(dayOf(finmes))+'/'+inttostr(MonthOf(finmes))+'" as p1,'+
          '"del '+inttostr(dayOf(desde1))+'/'+inttostr(MonthOf(desde1))+' al '+inttostr(dayOf(hasta1))+'/'+inttostr(MonthOf(hasta1))+'" as p2,'+
          '"del '+inttostr(dayOf(desde2))+'/'+inttostr(MonthOf(desde2))+' al '+inttostr(dayOf(hasta2))+'/'+inttostr(MonthOf(hasta2))+'" as p3,'+
          '"del '+inttostr(dayOf(desde3))+'/'+inttostr(MonthOf(desde3))+' al '+inttostr(dayOf(hasta3))+'/'+inttostr(MonthOf(hasta3))+'" as p4'+
          ' from(	select count(sk.conclusion) as activaciones,ac.status FROM sk_alarmas sk INNER JOIN alarmas_conclusion ac ON (ac.id=sk.conclusion)'+
		    ' WHERE    sk.status=3 AND sk.fecha_pc BETWEEN "'+datetostr(inimes)+'" AND "'+datetostr(finmes)+'" and (ac.status="ACTIVACION ACCIDENTAL" or ac.status="FALLA EN EQUIPO"  or'+
      	 '	ac.status="FALSA ALARMA" or ac.status="FALSA ALARMA ATRIBUIBLE AL CLIENTE" ) GROUP BY ac.status) as t1 left join ('+
          '	select count(sk.conclusion) as activaciones,ac.status FROM sk_alarmas sk INNER JOIN alarmas_conclusion ac ON (ac.id=sk.conclusion)'+
          '	WHERE    sk.status=3 AND sk.fecha_pc BETWEEN "'+datetostr(desde1)+'" AND "'+datetostr(hasta1)+'" and (ac.status="ACTIVACION ACCIDENTAL" or ac.status="FALLA EN EQUIPO"  or'+
          '	ac.status="FALSA ALARMA" or ac.status="FALSA ALARMA ATRIBUIBLE AL CLIENTE" ) GROUP BY ac.status ) as t2 on t1.status=t2.status left join ('+
          '	select count(sk.conclusion) as activaciones,ac.status FROM sk_alarmas sk INNER JOIN alarmas_conclusion ac ON (ac.id=sk.conclusion)'+
          '	WHERE    sk.status=3 AND sk.fecha_pc BETWEEN "'+datetostr(desde2)+'" AND "'+datetostr(hasta2)+'" and (ac.status="ACTIVACION ACCIDENTAL" or ac.status="FALLA EN EQUIPO"  or'+
          '	ac.status="FALSA ALARMA" or ac.status="FALSA ALARMA ATRIBUIBLE AL CLIENTE" ) GROUP BY ac.status) as t3 on t3.status=t1.status left join('+
          '	select count(sk.conclusion) as activaciones,ac.status FROM sk_alarmas sk INNER JOIN alarmas_conclusion ac ON (ac.id=sk.conclusion)'+
          ' WHERE    sk.status=3 AND sk.fecha_pc BETWEEN "'+datetostr(desde3)+'" AND "'+datetostr(hasta3)+'" and (ac.status="ACTIVACION ACCIDENTAL" or ac.status="FALLA EN EQUIPO"  or'+
          ' ac.status="FALSA ALARMA" or ac.status="FALSA ALARMA ATRIBUIBLE AL CLIENTE" ) GROUP BY ac.status) as t4 on t4.status=t1.status',0,dmreportes.sqlgeneral2);
         frmmensaje.Update;
         frmmensaje.Close;
         OperacionReporte('RepMedServicios','',TipoImpresion,1);

end;


{    No borrar
procedure RegenerarRepTicketsFinalizados(mes, ano:integer);
var fecha1, fecha2:string;
i, d, dia:integer;
sqlgeneral:TMyQuery;
begin
dia := DaysInAMonth(ano, mes);
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
fecha1 := datetostr(EncodeDate(ano,mes, 1));
fecha2 := datetostr(EncodeDate(ano,mes,dia));
// INSERTA LOS TECNICOS DEL MES //
querys('Delete from TicketsFinalizados where mes = '+inttostr(mes)+' and anio ='+inttostr(ano), 1, sqlgeneral);
querys('select CodTecnico from servicios where FechaFinUsr between "'+fecha1+'" and "'+fecha2+'" group by CodTecnico order by CodTecnico', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  if sqlgeneral.fieldbyname('CodTecnico').AsString <> '' then
    begin
    querys('select CodTecnico from TicketsFinalizados where CodTecnico="'+sqlgeneral.fieldbyname('CodTecnico').AsString+'" and anio=year("'+fecha1+'") and mes=month("'+fecha1+'")', 0, dmreportes.sqlgeneral7);
    if dmreportes.sqlgeneral7.RecordCount <= 0 then
       querys('Insert into TicketsFinalizados (anio, mes, CodTecnico) values (year("'+fecha1+'") , month("'+fecha1+'"), "'+sqlgeneral.fieldbyname('CodTecnico').AsString+'")', 1, dmreportes.sqlgeneral8);
    end;
  sqlgeneral.Next;
  end;

// inserta el tecnico Z para totales
querys('select CodTecnico from TicketsFinalizados where CodTecnico="Z" and anio=year("'+fecha2+'") and mes=month("'+fecha2+'")', 0, dmreportes.sqlgeneral7);
if dmreportes.sqlgeneral7.RecordCount <= 0 then
   querys('Insert into TicketsFinalizados (anio, mes, CodTecnico) values (year("'+fecha2+'") , month("'+fecha2+'"), "Z")', 1, dmreportes.sqlgeneral8);


// ACTUALIZA LOS TICKETS FINALIZADOS //
querys('Select max(d'+inttostr(dia)+') as d'+inttostr(dia)+', mes, anio from TicketsFinalizados where d'+inttostr(dia)+' = 0 and anio=year("'+fecha2+'") and mes=month("'+fecha2+'") group by mes', 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  for i:=1 to dia do
    begin
    fecha1 := datetostr(EncodeDate(ano,mes, i));
    querys('select FechaFinUsr, CodTecnico, count(distinct(sid)) as fin from servicios left join EstatusServicios as es ON (es.orden=servicios.status) where FechaFinUSr = "'+fecha1+'"  and es.nombre =  "FINALIZADA" group by CodTecnico, FechaFinUsr order by CodTecnico, FechaFinUsr', 0, sqlgeneral);
    sqlgeneral.first;
    while not sqlgeneral.EOF = true do
      begin
      querys('Update TicketsFinalizados set d'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('fin').AsString)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').AsString)+' and anio=year("'+fecha2+'") and mes=month("'+fecha2+'")',1, dmreportes.sqlgeneral7);
      sqlgeneral.next;
      end; //while
    end;
  end; //if

for i:=1 to (dia) do
  begin
  querys('Select sum(d'+inttostr(i)+') as tot from TicketsFinalizados where anio=year("'+fecha2+'") and mes=month("'+fecha2+'") and CodTecnico <> ''Z'' ', 0, dmreportes.sqlgeneral5);
  querys('Update TicketsFinalizados set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral5.fieldbyname('tot').asstring)+' where anio=year("'+fecha2+'") and mes=month("'+fecha2+'") and CodTecnico=''Z'' ', 1, dmreportes.sqlgeneral6);
  end;

//querys('Select t.*, if(t.CodTecnico = "Z" , " ", t.CodTecnico) as CodTecnico, if(t.CodTecnico = "Z" , "TOTAL", '+
//'usuarios.nombre) as tecnico from TicketsFinalizados as t left join usuarios on (usuarios.codigo2=t.CodTecnico) '+
//'where t.anio=year("'+fecha2+'") and t.mes=month("'+fecha2+'") order by t.CodTecnico asc', 0, dmreportes.sqlgeneral3);


end;}

procedure RepPagosXLineaTipoCobro(const dfecha1,dfecha2,edusuario1,edusuario2,TipoImpresion:string;ckbtodos,Guardar:boolean);
var dia1,dia2,m1,cadena,fecha:string;   // ano,
fecha1,fecha2:tdatetime;
begin
fecha1:=strtodate(dfecha1);
fecha2:=strtodate(dfecha2);
with dmreportes do
  begin
  if Guardar = true then
    begin
    fecha := meses[strtoint(formatdatetime('m',strtodate(dfecha1)))]+'-'+formatdatetime('yyyy',strtodate(dfecha1));
    querys('SELECT PeriodoReporte FROM RepPagosXLinea where PeriodoReporte='+''''+fecha+'''  limit 0,1',0,sqlgeneral2);
    if sqlgeneral2.FieldByName('PeriodoReporte').AsString <> '' then
      begin
      application.MessageBox('Ya fue generado el corte del mes y año de este reporte !','Atención',MB_ICONINFORMATION);
      Exit;
      end;
    end;
  m1 :=  formatdatetime('m',strtodate(dfecha1));
  //esto se hace por que se nececita sacar los cobros de un dia antes o del dia anterior habil antes para ello necesitamos saber que dia es y asi hacer lo pertinente
  if querys('select dias from PagosXLineaDias where fecha in ("'+dfecha2+'") order by fecha',0,sqlgeneral2) > 0 then
    begin
    fecha1:=fecha1-sqlgeneral2.Fields.Fields[0].AsInteger;
    fecha2:=fecha2-1;
    end
  else
    begin
    querys('select dayname("'+dfecha1+'") as dia1,dayname("'+dfecha2+'") as dia2',0,sqlgeneral);
    dia1:=sqlgeneral.fieldbyname('dia1').AsString;
    dia2:=sqlgeneral.fieldbyname('dia2').AsString;
    //casos normales de dias
    if dia1 = 'Monday' then
      fecha1:=fecha1-3
    else
    if dia1 = 'Saturday' then
       fecha1:=fecha1-1
    else
      fecha1:=fecha1-1;

    if dia2= 'Monday' then
         fecha2:=fecha2-2
    else
    if dia2 = 'Saturday' then
     fecha1:=fecha1-2
    else
     fecha2:=fecha2-1;
    end;

    BorrarTablasPagosTemp;

    //buscarmos primero por los cobros normales y despues por los cobro en caja
    /// primero sumamos por lineas
    cadena:='';
    cadena:='CREATE TABLE temporalpagos'+frmprincipal.idmaq+' SELECT u.idusuario,a.inventariable,dp.id,p.idcliente,dp.idpedido,pc.idremicion,p.idfactura,l.nombre,a.moneda,if ( (truncate(((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant,3) > p.TotMn),p.TotMn,(truncate(((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant,3)) ) as TOTAL,'+
           'if((round(((((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant)*100)/p.TotMn,2)) > 100,100,(round(((((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant)*100)/p.TotMn,2)) ) as Porcentaje,p.TotMn,pc.FechaAlta,if (c.bloqueado=0,''NO'',''SI'') AS bloqueado,c.sector, '+
           'concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Usuario FROM DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) LEFT JOIN articulos as a  '+
           'ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) LEFT JOIN RemiFact as rm ON (rm.idpedido=dp.idpedido) LEFT JOIN PagosClientes as pc ON (pc.idpedido = dp.idpedido) LEFT JOIN clientes as c ON (p.idcliente=c.idcliente) '+
           'LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between "'+dfecha1+'" and "'+dfecha2+'" and p.estatus in(3,4) and pc.movimiento in(0,2) and pc.TipoCobro =0 and pc.abono > 0 '+
           'and pc.TipoPago="AB" ';
           {if ckbtodos = false then
           cadena:=cadena + 'and lg.UCLogin = '+quotedstr(edusuario1)+' ';  // and '+quotedstr(edusuario2.Text)+' ';
           //else}
           
           cadena:=cadena + 'GROUP BY dp.id,u.idusuario ORDER BY dp.idpedido';

   querys(cadena,1,sqlgeneral2);//crea la tabla temporal de sumas por lineas
   querys('Create Index idpedido on temporalpagos'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);

   //ahora siguen los cobros en caja.....
   cadena:='';
   cadena:='INSERT INTO temporalpagos'+frmprincipal.idmaq+' (idusuario,inventariable,id,idcliente,idpedido,idremicion,idfactura,nombre,moneda,TOTAL,Porcentaje,TotMn,FechaAlta,bloqueado,sector,Usuario) SELECT u.idusuario,a.inventariable,dp.id,p.idcliente,dp.idpedido,pc.idremicion,'+
           ' p.idfactura,l.nombre,a.moneda,if ( (truncate(((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant,3) > p.TotMn),p.TotMn,(truncate(((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant,3)) ) as TOTAL,'+
           'if((round(((((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant)*100)/p.TotMn,2)) > 100,100,(round(((((dp.costo*dp.tc)*'+floattostr(1+getIVA)+')*dp.cant)*100)/p.TotMn,2)) ) as Porcentaje,p.TotMn,pc.FechaAlta,if (c.bloqueado=0,''NO'',''SI'') AS bloqueado,c.sector, '+
           'concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Usuario FROM DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) LEFT JOIN articulos as a  '+
           'ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) LEFT JOIN RemiFact as rm ON (rm.idpedido=dp.idpedido) LEFT JOIN PagosClientes as pc ON (pc.idpedido = dp.idpedido) LEFT JOIN clientes as c ON (p.idcliente=c.idcliente) '+
           'LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '''+datetostr(fecha1)+''' and '''+datetostr(fecha2)+''' and p.estatus in(3,4) and pc.movimiento =2 and pc.TipoCobro =1 and pc.abono > 0 '+     //and not ( l.nombre =''EQUIPO'' AND a.inventariable =0 ) ';
           'and pc.TipoPago="AB" ';
           {if ckbtodos = false then
           //cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ';
           cadena:=cadena + 'and lg.UCLogin = '+quotedstr(edusuario1)+' ';// and '+quotedstr(edusuario2.Text)+' ';
           //else}
           
           cadena:=cadena + 'GROUP BY dp.id,u.idusuario ORDER BY dp.idpedido';

   querys(cadena,1,sqlgeneral2);//insertamos en tabla temporal de sumas por lineas

 querys('select idpedido from  temporalpagos'+frmprincipal.idmaq+' where Porcentaje = 100 group by idpedido',0,sqlgeneral2);
 while not sqlgeneral2.eof do
 begin
  querys(' delete from temporalpagos'+frmprincipal.idmaq+' where idpedido = '+sqlgeneral2.Fields.Fields[0].AsString+' and Porcentaje < 100 ',1,sqlgeneral);

  sqlgeneral2.Next;
 end;

// segunda creamos la tabla suma por pagos  con tipocobro 0   /// a.inventariable=1
   cadena:='';
   cadena:='CREATE TABLE temporalpagos100'+frmprincipal.idmaq+' SELECT pc.idpedido,sum(pc.abono) as abono,u.idusuario FROM PagosClientes as pc LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '+''''+dfecha1+''' and '+''''+dfecha2+''' and pc.movimiento in(0,2) and pc.abono> 0 and pc.TipoCobro =0 ';
     if ckbtodos  = false then
        //cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ' ;
        cadena:=cadena + 'and lg.UCLogin = '+quotedstr(edusuario1)+' '; // and '+quotedstr(edusuario2.Text)+' ';
        cadena:=cadena + ' GROUP BY idpedido,u.idusuario';

   querys(cadena,1,sqlgeneral2);//crea la tabla temporal suma por pagos

//insertamos en tabla con tipocobro 1

// segunda creamos la tabla suma por pagos  con tipocobro 0   /// a.inventariable=1

   cadena:='';
   cadena:='INSERT INTO temporalpagos100'+frmprincipal.idmaq+'(idpedido,abono,idusuario) SELECT pc.idpedido,sum(pc.abono) as abono,u.idusuario FROM PagosClientes as pc LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '''+datetostr(fecha1)+''' and '''+datetostr(fecha2)+''' and pc.movimiento in(0,2) and pc.abono> 0 and pc.TipoCobro =1 ';
     if ckbtodos = false then
        //cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ' ;
        cadena:=cadena + 'and lg.UCLogin = '+quotedstr(edusuario1)+' '; //and '+quotedstr(edusuario2.Text)+' ';
        cadena:=cadena + ' GROUP BY idpedido,u.idusuario';

   querys(cadena,1,sqlgeneral2);//crea la tabla temporal suma por pagos

 querys('CREATE TABLE temporalpagos3'+frmprincipal.idmaq+' SELECT idpedido,sum(abono) as abono,idusuario FROM temporalpagos100'+frmprincipal.idmaq+' group by idpedido,idusuario',1,sqlgeneral2);
 querys('Create Index idpedido on temporalpagos3'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);


//tercero de la tabla temporal creamos otra pero ya con totalse por linea
   querys('CREATE TABLE temporalpagos2'+frmprincipal.idmaq+' SELECT idusuario,idcliente,idpedido,idremicion,idfactura,nombre,sum(TOTAL)AS TOTAL,TotMn,FechaAlta,bloqueado,sector,Usuario FROM temporalpagos'+frmprincipal.idmaq+' GROUP BY nombre,idpedido,idusuario ORDER BY idpedido',1,sqlgeneral2);
   querys('CREATE INDEX idpedido on temporalpagos2'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);

//creamos otra tabla donde se mostrara el reporte
   querys('CREATE TABLE temporalpagos4'+frmprincipal.idmaq+' SELECT t2.idusuario,t2.idcliente,t2.idpedido,t2.idremicion,t2.idfactura,t3.abono,t2.FechaAlta,'+
          't2.bloqueado,t2.sector,t2.Usuario,if (t3.abono <> '''',t3.abono,0) as MONITOREO,if (t3.abono <> '''',t3.abono,0) as INTERESES,if (t3.abono <> '''',t3.abono,0) as SERVICIO,if (t3.abono <> '''',t3.abono,0) as EQUIPO,if (t3.abono <> '''',t3.abono,0) as OTROS '+
          'FROM temporalpagos2'+frmprincipal.idmaq+' as t2 LEFT JOIN temporalpagos3'+frmprincipal.idmaq+' as t3 ON (t3.idpedido=t2.idpedido) where abono <=0 GROUP BY t2.nombre,t2.idpedido,t2.idusuario ORDER BY t2.idpedido',1,sqlgeneral2);
   querys('Create Index idpedido on temporalpagos4'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);

///ahora insertamos a la tabla el pedido para poder comparar
      querys('INSERT INTO temporalpagos4'+frmprincipal.idmaq+' (idusuario,idpedido,idremicion,idfactura,FechaAlta,bloqueado,sector,Usuario) SELECT idusuario,idpedido,idremicion,idfactura,FechaAlta,bloqueado,sector,Usuario FROM temporalpagos2'+frmprincipal.idmaq+' GROUP BY idpedido,idusuario ORDER BY idpedido',1,sqlgeneral2);

      querys('SELECT t2.idcliente as cliente,t2.idpedido as pedido,t2.idremicion as remicion,t2.idfactura as factura,t2.nombre as linea,t3.abono as pago,ROUND(((t2.TOTAL*100)/t2.TotMn),2) as Porcentaje,ROUND((((t2.TOTAL*100)/t2.TotMn)/100)*t3.abono,2) as resultado,'+
             't3.idusuario as idusuario,t2.TOTAL as total,t2.TotMn as totpedido,t2.FechaAlta as FechaAlta,t2.bloqueado as bloqueado,t2.sector as sector,t2.Usuario as cobrador FROM temporalpagos2'+frmprincipal.idmaq+' as t2 LEFT JOIN temporalpagos3'+frmprincipal.idmaq+' as t3 ON (t3.idpedido=t2.idpedido) WHERE abono >0 GROUP BY t2.nombre,t2.idpedido,t3.idusuario ORDER BY t2.idpedido',0,sqlgeneral);

if sqlgeneral.FieldByName('cliente').AsString  <> ''then begin

      while not sqlgeneral.Eof do begin
           querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET idcliente='+quotedstr(sqlgeneral.fieldbyname('cliente').AsString)+' ,'+sqlgeneral.fieldbyname('linea').AsString+'=('+quotedstr(sqlgeneral.fieldbyname('linea').AsString)+'  +  '+quotedstr(sqlgeneral.fieldbyname('resultado').AsString)+' ),  abono='+quotedstr(sqlgeneral.fieldbyname('pago').AsString)+'  WHERE idpedido='+quotedstr(sqlgeneral.fieldbyname('pedido').AsString)+' and idusuario='+quotedstr(sqlgeneral.fieldbyname('idusuario').AsString),1,sqlgeneral2);
           sqlgeneral.Next;
      end;
     querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET MONITOREO=0 WHERE (MONITOREO IS NULL)' ,1,sqlgeneral2);
     querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET INTERESES=0 WHERE (INTERESES IS NULL)' ,1,sqlgeneral2);
     querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET SERVICIO=0 WHERE (SERVICIO IS NULL )' ,1,sqlgeneral2);
     querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET EQUIPO=0 WHERE (EQUIPO IS NULL)' ,1,sqlgeneral2);
     querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET OTROS=0 WHERE (OTROS IS NULL)' ,1,sqlgeneral2);


//////////SEGUNDA PARTE DE REPORTE ////////////////////////////

           querys('DROP TABLE IF EXISTS temporal_pagosxlinea'+frmprincipal.idmaq,1,sqlgeneral);
           querys('CREATE TABLE temporal_pagosxlinea'+frmprincipal.idmaq+' (sector varchar(30),clientes float default 0,otros float default 0,anticipos float default 0,total float default 0,MV float default 0,MxV float default 0)',1,sqlgeneral);
           querys('INSERT INTO temporal_pagosxlinea'+frmprincipal.idmaq+' (sector) SELECT idsector FROM sectores ORDER BY idsector',1,sqlgeneral);

//buscarmos los que sean pagos por clientes  que no son anticipos
//para tipocobro =0
            cadena:='';
            cadena:='SELECT c.sector as sector,sum(pc.abono) as total FROM pedidos as p INNER JOIN PagosClientes AS pc ON (pc.idpedido=p.idpedido)  LEFT JOIN clientes as c ON (c.idcliente=p.idcliente)  LEFT JOIN TiposPagos as tps ON (tps.iniciales=pc.TipoPago)  '+
                   'LEFT JOIN UCTabUsers as uc ON (uc.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=uc.UCIdUser)  LEFT JOIN UnidadNegocio as tp ON (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE  '+
                   'pc.FechaAlta between '+''''+dfecha1+''' and '+''''+dfecha2+''' and pc.movimiento in(0,2) and p.estatus in(3,4) AND tps.nombre<>''ANTICIPO'' AND tp.nombre <> ''EQUIPO(2)''  and pc.TipoCobro =0 and pc.abono > 0';
             if ckbtodos = false then
                // cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ';
                cadena:=cadena + 'and uc.UCLogin = '+quotedstr(edusuario1)+' '; //and '+quotedstr(edusuario2.Text)+' ';
            // else
                 cadena:=cadena + ' GROUP BY sector';

             querys(cadena,0,sqlgeneral);
             while  not sqlgeneral.eof do begin

                 querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set clientes ='+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;

//para tipocobro = 1
            cadena:='';
            cadena:='SELECT c.sector as sector,sum(pc.abono) as total FROM pedidos as p INNER JOIN PagosClientes AS pc ON (pc.idpedido=p.idpedido)  LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) '+
                   'LEFT JOIN UCTabUsers as uc ON (uc.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=uc.UCIdUser)  LEFT JOIN UnidadNegocio as tp ON (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE pc.FechaAlta between '''+datetostr(fecha1)+''' and '''+datetostr(fecha2)+''' and '+
                   'pc.movimiento in(0,2) and p.estatus in(3,4) AND  TipoPago <> ''AT'' AND tp.nombre <> ''EQUIPO(2)''  and pc.TipoCobro =1  and pc.abono >0 ';
             if ckbtodos = false then
                // cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ';
                cadena:=cadena + 'and uc.UCLogin = '+quotedstr(edusuario1)+' '; // and '+quotedstr(edusuario2.Text)+' ';
            // else
                 cadena:=cadena + ' GROUP BY sector';

             querys(cadena,0,sqlgeneral);
             while  not sqlgeneral.eof do begin                                                                                                   // + clientes

                 querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set clientes = '+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' + clientes  WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;


//buscarmos anticIpos del cliente
//por tipocobro = 0
            cadena:='';
            cadena:='SELECT c.sector as sector,sum(pc.abono) as total FROM PagosClientes AS pc left join pedidos as p  ON (p.idpedido=pc.idpedido) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) '+
                   'LEFT JOIN UCTabUsers as uc ON (uc.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=uc.UCIdUser)  LEFT JOIN UnidadNegocio as tp ON (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE '+
                   'pc.FechaAlta between '+''''+dfecha1+''' and '+''''+dfecha2+''' and  pc.movimiento IN(0,2) and p.estatus in(3,4) AND TipoPago = ''AT'' AND tp.nombre <> ''EQUIPO(2)'' and sector<> '''' and pc.TipoCobro =0 and pc.abono >0  ';

            if ckbtodos = false then
                 cadena:=cadena + 'and uc.UCLogin = '+quotedstr(edusuario1)+' '; //and '+quotedstr(edusuario2.Text)+' ';


            cadena:=cadena + ' GROUP BY sector';

           querys(cadena,0,sqlgeneral);
             while  not sqlgeneral.eof do begin
                 querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set anticipos =  '+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;

//tipocobro 1
            cadena:='';
            cadena:='SELECT c.sector as sector,sum(pc.abono) as total FROM PagosClientes AS pc left join pedidos as p  ON (pc.idpedido=p.idpedido) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) '+
                   'LEFT JOIN UCTabUsers as uc ON (uc.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=uc.UCIdUser)  LEFT JOIN UnidadNegocio as tp ON (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE  '+
                   'pc.FechaAlta between '''+datetostr(fecha1)+''' and '''+datetostr(fecha2)+''' and  pc.movimiento IN(0,2) and p.estatus in(3,4) AND TipoPago = ''AT'' AND tp.nombre <> ''EQUIPO(2)'' and sector<> '''' and pc.TipoCobro =1 and pc.abono >0 ';

            if ckbtodos = false then
                // cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ';
                cadena:=cadena + 'and uc.UCLogin = '+quotedstr(edusuario1)+'' ;// and '+quotedstr(edusuario2.Text)+' ';
             //else
                 cadena:=cadena + ' GROUP BY sector';
                          querys(cadena,0,sqlgeneral);
             while  not sqlgeneral.eof do begin
                 querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set anticipos = anticipos+'+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;


///buscar pagos de oportunidadas OTROS (equipo2)
//tipocobro = 0
            cadena:='';
            cadena:='SELECT c.sector as sector,sum(pc.abono) as total FROM pedidos as p INNER JOIN PagosClientes AS pc ON (pc.idpedido=p.idpedido) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) '+
                    'LEFT JOIN UCTabUsers as uc ON (uc.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=uc.UCIdUser) LEFT JOIN UnidadNegocio as tp ON (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE  '+
                    'pc.FechaAlta between '+''''+dfecha1+''' and '+''''+dfecha2+''' and  pc.movimiento in(0,2) and p.estatus in(3,4) AND TipoPago <> ''AT'' AND tp.nombre=''EQUIPO(2)''  and sector<> '''' and TipoCobro = 0 and pc.abono > 0 ' ;

            if ckbtodos = false then
              //   cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ';
              cadena:=cadena + 'and uc.UCLogin = '+quotedstr(edusuario1)+' '; // and '+quotedstr(edusuario2.Text)+' ';
            // else
                 cadena:=cadena + ' GROUP BY sector';
             querys(cadena,0,sqlgeneral);
             while  not sqlgeneral.eof do begin
                 querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set otros = '+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;
//tipocobro =1
            cadena:='';
            cadena:='SELECT c.sector as sector,sum(pc.abono) as total FROM pedidos as p INNER JOIN PagosClientes AS pc ON (pc.idpedido=p.idpedido) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) '+
                    'LEFT JOIN UCTabUsers as uc ON (uc.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=uc.UCIdUser) LEFT JOIN UnidadNegocio as tp ON (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE  '+
                    'pc.FechaAlta between '+datetostr(fecha1)+' and '+datetostr(fecha2)+' and pc.movimiento in(0,2) and p.estatus in(3,4) AND TipoPago <> ''AT'' AND tp.nombre=''EQUIPO(2)''  and sector<> '''' and TipoCobro = 1 and pc.abono > 0 ' ;

            if ckbtodos = false then
             //    cadena:=cadena + 'and u.idusuario between '+quotedstr(edusuario1.Text)+' and '+quotedstr(edusuario2.Text)+' ';
             cadena:=cadena + 'and uc.UCLogin = '+quotedstr(edusuario1)+' '; // and '+quotedstr(edusuario2.Text)+' ';
            // else
                 cadena:=cadena + ' GROUP BY sector';
             querys(cadena,0,sqlgeneral);
             while  not sqlgeneral.eof do begin
                 querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set otros = otros + '+quotedstr(sqlgeneral.fieldbyname('total').AsString)+' WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;

////actualizamos el total
        querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set total =(clientes+anticipos+otros)',1,sqlgeneral3);

          querys('SELECT distinct t.idcliente,t.idpedido,t.sector,t.abono,MONITOREO,t.FechaAlta,pa.idpago2,pa.pago,pc.FechaVence,pc.idpago,t4.porcentaje,pc2.FechaVence,IF (pc2.FechaVence > t.FechaAlta,0,1) AS condicion,truncate((t4.porcentaje/100)*pa.pago,3) as CM  '+
                 'from temporalpagos4'+frmprincipal.idmaq+'  as t left JOIN  PagosClientes as pc ON (pc.idpedido=t.idpedido) left join PagosAfecta as pa ON (pc.idpago=pa.idpago) left join temporalpagos'+frmprincipal.idmaq+' as t4 ON (t4.idpedido=t.idpedido) left join PagosClientes as pc2 ON (pa.idpago2=pc2.idpago) where t.idcliente is not null and MONITOREO > 0 and pa.idpago2 is not null AND t4.nombre=''MONITOREO'' ',0,sqlgeneral);

            while  not sqlgeneral.eof do begin
                if sqlgeneral.FieldByName('condicion').asstring = '1' then
                   querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set MV ='+quotedstr(sqlgeneral.fieldbyname('CM').AsString)+' + MV WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3)
                else
                   querys('UPDATE temporal_pagosxlinea'+frmprincipal.idmaq+' set MxV ='+quotedstr(sqlgeneral.fieldbyname('CM').AsString)+' + MxV WHERE sector='+quotedstr(sqlgeneral.fieldbyname('sector').AsString),1,sqlgeneral3);
                 sqlgeneral.next;
             end;

             querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' set EQUIPO= (abono-(MONITOREO+INTERESES+SERVICIO+OTROS))',1,sqlgeneral);
             querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' set MONITOREO = IF ( EQUIPO < 1,MONITOREO + EQUIPO,MONITOREO)',1,sqlgeneral);
             querys('UPDATE  temporalpagos4'+frmprincipal.idmaq+' SET EQUIPO = IF ( EQUIPO < 1,0,EQUIPO)',1,sqlgeneral);
             querys('UPDATE  temporalpagos4'+frmprincipal.idmaq+' SET EQUIPO = IF ( EQUIPO < 0.1,0,EQUIPO), MONITOREO  = IF ( MONITOREO  < 0.1,0,MONITOREO ),INTERESES = IF ( INTERESES < 0.1,0,INTERESES),SERVICIO = IF ( SERVICIO < 0.1,0,SERVICIO) ',1,sqlgeneral);

/////////////////////////////FIN DE SEGUNDA PARTE DE REPORTE////////////////////////////////
////////generar reportes
             dia1:='Del '+dfecha1+' al '+dfecha2;
             if guardar = false then
              begin
                querys('SELECT t.*,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' ,'',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''            RFC :'',de.rfc ) as rfc,'+quotedstr(dia1)+' as periodo FROM temporalpagos4'+frmprincipal.idmaq+' as t join DatosEmpresa as de  WHERE abono >0 and idcliente <> '' '' order by idusuario,idfactura,FechaAlta asc ',0,sqlgeneral);
                querys('SELECT * FROM temporal_pagosxlinea'+frmprincipal.idmaq,0,sqlgeneral2);
                //querys('SELECT "nda"',0,sqlgeneral2);
              end else
                begin
                   {   if application.MessageBox(pchar('Esta seguro de generar reporte Pagos x Linea historico del año '+ano+' del mes '+meses[strtoint(m1)]+' ?, no podra hacer cambios posteriores!'),'Confirmación',MB_YESNO+MB_ICONWARNING) = idyes then
                         begin
                            querys('insert into RepPagosXLinea SELECT t.*,'+''''+dia1+''' as periodo,'+''''+fecha+''' FROM temporalpagos4'+frmprincipal.idmaq+' as t WHERE abono >0 and idcliente <> '' '' order by idusuario,idfactura asc',1,sqlgeneral2);
                            //querys('insert into RepPagosXLinea2 SELECT t1.*,'+''''+fecha+''' FROM temporal_pagosxlinea'+frmprincipal.idmaq+' as t1',1,sqlgeneral2);
                            application.MessageBox('Generado con exito!','Información',MB_ICONINFORMATION);
                            Screen.Cursor := crDefault;
                         end;
                         exit;}
                end;

             
             OperacionReporte('PagosXLinea','Reporte de pagos por linea',TipoImpresion, 1);

end else begin

         application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);
end;


BorrarTablasPagosTemp;

end;//with
Screen.Cursor := crDefault;

end;


procedure RepEstandaresCentral(desde,hasta,TipoImpresion:string);
begin
frmmensaje.Show;
frmmensaje.Update;
///////////////////////////// QUERY PATRULLEROS  //////////////////////////////////////
 {querys('select codpatrullero,tabla.nombre,if(sector="6","C",sector) as sector,sum(p1) as p1,sum(p2) as p2,sum(p3) as p3,sum(p4) as p4,sum(r1) as r1,sum(r2) as r2,sum(r3) as r3,sum(r4) as r4,sum(nr1) as nr1,sum(nr2) as nr2,sum(nr3) as nr3,'+
         ' sum(nr4) as nr4,turno,mes,if(turno="DIURNO",1,if(turno="VESPERTINO",2,3)) AS idturno,concat(day("'+desde+'"), " al ", day(date_add("'+desde+'", interval 6 day))) as periodo1, concat(day("'+datetostr(strtodate(desde)+7)+'"), " al ", day(date_add("'+datetostr(strtodate(desde)+7)+'", interval 6 day))) as periodo2,'+
         ' concat(day("'+datetostr(strtodate(desde)+14)+'"), " al ", day(date_add("'+datetostr(strtodate(desde)+14)+'", interval 6 day))) as periodo3,concat(day("'+datetostr(strtodate(desde)+21)+'"), " al ", day("'+hasta+'")) as periodo4  from'+
         ' (select  codpatrullero,if(u.apaterno is NULL or u.apaterno="", u.nombre, concat(u.nombre, " ", u.apaterno)) as nombre,idsector as sector,if(periodo=1,sum(promedio),0) as p1,if(periodo=2,sum(promedio),0) as p2,'+
         ' if(periodo=3,sum(promedio),0) as p3,if(periodo=4,sum(promedio),0) as p4,'+
         ' if(periodo=1,sum(retardos),0) as r1,if(periodo=2,sum(retardos),0) as r2,if(periodo=3,sum(retardos),0) as r3,if(periodo=4,sum(retardos),0) as r4,'+
         ' if(periodo=1,sum(nretardos),0) as nr1,if(periodo=2,sum(nretardos),0) as nr2,if(periodo=3,sum(nretardos),0) as nr3,if(periodo=4,sum(nretardos),0) as nr4,periodo,'+
         ' t.nombre as turno,monthname(now()) as mes'+
         ' from ((select CodPatrullero,round(sum(tiempo)/count(tiempo),2) as promedio, sum(retardos) as retardos,(count(retardos)-sum(retardos)) as nretardos,"1" as periodo from ('+
         ' select tr.CodPatrullero,tr.tiempo, if(tr.tiempo>5,1,0) as retardos,if(tr.tiempo>5,"R","NR") as condicion,fecha'+
         ' from tiempo_respuesta tr where tr.fecha between "'+desde+'" and date_add("'+desde+'", INTERVAL 6 DAY) and tr.idmotivo<>2 and tr.tiempo>0) as t group by CodPatrullero )'+
         ' UNION (select CodPatrullero,round(sum(tiempo)/count(tiempo),2) as promedio,  sum(retardos) as retardos,(count(retardos)-sum(retardos)) as nretardos,"2" as periodo from'+
         ' (select tr.CodPatrullero,tr.tiempo, if(tr.tiempo>5,1,0) as retardos,if(tr.tiempo>5,"R","NR") as condicion'+
         ' from tiempo_respuesta tr where tr.fecha between date_add("'+desde+'", INTERVAL 7 DAY) and date_add("'+desde+'", INTERVAL 13 DAY) and tr.idmotivo<>2 and tr.tiempo>=0 ) as t group by CodPatrullero)'+
         ' UNION (select CodPatrullero,round(sum(tiempo)/count(tiempo),2) as promedio,  sum(retardos) as retardos,(count(retardos)-sum(retardos)) as nretardos,"3" as periodo from'+
         ' (select tr.CodPatrullero,tr.tiempo, if(tr.tiempo>5,1,0) as retardos,if(tr.tiempo>5,"R","NR") as condicion'+
         ' from tiempo_respuesta tr where tr.fecha between date_add("'+desde+'", INTERVAL 14 DAY) and date_add("'+desde+'", INTERVAL 20 DAY) and tr.idmotivo<>2 and tr.tiempo>=0 ) as t group by CodPatrullero)'+
         ' UNION (select CodPatrullero,round(sum(tiempo)/count(tiempo),2) as promedio,  sum(retardos) as retardos,(count(retardos)-sum(retardos)) as  nretardos,"4" as periodo from'+
         ' (select tr.CodPatrullero,tr.tiempo, if(tr.tiempo>5,1,0) as retardos,if(tr.tiempo>5,"R","NR") as condicion'+
         ' from tiempo_respuesta tr where tr.fecha between date_add("'+desde+'", INTERVAL 21 DAY) and "'+hasta+'" and tr.idmotivo<>2 and tr.tiempo>=0 ) as t group by CodPatrullero)'+
         ' ORDER BY codpatrullero,periodo ) as tabla left join usuarios u on tabla.codpatrullero=u.codigo left join turnos t on u.idturno=t.idturno WHERE u.idpuesto=24 and CodPatrullero<>"SP3"'+
         ' group by codpatrullero,periodo order by turno,codpatrullero,periodo) as tabla group by codpatrullero order by idturno,sector',0,dmreportes.sqlgeneral);}

  querys('select codpatrullero, tabla.nombre, if(sector="6","C",sector) as sector, '+
         'sum(p1) as p1,sum(p2) as p2,sum(p3) as p3,sum(p4) as p4, '+
         'sum(r1) as r1,sum(r2) as r2,sum(r3) as r3,sum(r4) as r4, '+
         'sum(nr1) as nr1,sum(nr2) as nr2,sum(nr3) as nr3, sum(nr4) as nr4, '+
         'turno, concat(MesNombre(month("'+desde+'")), " ", year("'+desde+'")) as mes, '+
         'if(turno="DIURNO",1,if(turno="VESPERTINO",2,3)) AS idturno, '+
         'concat(day("'+desde+'"), " al ", day(date_add("'+desde+'", interval 6 day))) as periodo1, '+
         'concat(day(date_add("'+desde+'", interval 7 day)), " al ", day(date_add("'+desde+'", interval 13 day))) as periodo2, '+
         'concat(day(date_add("'+desde+'", interval 14 day)), " al ", day(date_add("'+desde+'", interval 20 day))) as periodo3, '+
         'concat(day(date_add("'+desde+'", interval 21 day)), " al ", day("'+hasta+'")) as periodo4 '+
         'from ( select  codpatrullero, '+UsuarioNombre('u')+' as nombre, '+
         'idsector as sector,  '+
         'if(periodo=1,sum(promedio),0) as p1, if(periodo=2,sum(promedio),0) as p2, if(periodo=3,sum(promedio),0) as p3, if(periodo=4,sum(promedio),0) as p4, '+
         'if(periodo=1,sum(retardos),0) as r1, if(periodo=2,sum(retardos),0) as r2, if(periodo=3,sum(retardos),0) as r3, if(periodo=4,sum(retardos),0) as r4, '+
         'if(periodo=1,sum(atiempo),0) as nr1, if(periodo=2,sum(atiempo),0) as nr2, if(periodo=3,sum(atiempo),0) as nr3, if(periodo=4,sum(atiempo),0) as nr4, '+
         'periodo, t.nombre as turno from ( '+

         'select tr.CodPatrullero, round(avg(tr.tiempo),2) as promedio, sum(if(tr.tiempo > 5,1, 0)) as retardos, sum(if(tr.tiempo <= 5, 1, 0)) as atiempo, '+
         'tr.fecha, u.idturno, case '+
         'when tr.fecha between "'+desde+'" and date_add("'+desde+'", INTERVAL 6 DAY) then 1 '+
         'when tr.fecha between date_add("'+desde+'", INTERVAL 7 DAY) and date_add("'+desde+'", INTERVAL 13 DAY) then 2 '+
         'when tr.fecha between date_add("'+desde+'", INTERVAL 14 DAY) and date_add("'+desde+'", INTERVAL 20 DAY) then 3 '+
         'when tr.fecha between date_add("'+desde+'", INTERVAL 21 DAY) and "'+hasta+'" then 4 '+
         'else 5 end as periodo '+
         'from tiempo_respuesta tr left join usuarios u on u.codigo=tr.codpatrullero '+
         'where tr.fecha between "'+desde+'" and "'+hasta+'" '+
         //'and tr.idmotivo <> 2 '+
         ' and u.idturno in (1,2) '+
         'group by codpatrullero, periodo '+
         '  UNION  '+

         'select tr.CodPatrullero, round(avg( tr.tiempo ),2)  as promedio, sum( if(tr.tiempo > 5,1, 0) ) as retardos, '+
         'sum( if( tr.tiempo <= 5, 1, 0) ) as atiempo, tr.fecha, u.idturno, '+
         'case WHEN cast(concat(tr.fecha, " ", tr.hora) as datetime) '+
         'between cast(concat("2011/10/01", " ", t.HoraInicio) as datetime) '+
         'and cast(concat(date_add("'+desde+'", INTERVAL 7 DAY), " ", t.HoraFin) as datetime) then 1 '+
         'WHEN cast(concat(tr.fecha, " ", tr.hora) as datetime) '+
         'between cast(concat(date_add("'+desde+'", INTERVAL 7 DAY), " ", t.HoraInicio) as datetime) '+
         'and cast(concat(date_add("'+desde+'", INTERVAL 14 DAY), " ", t.HoraFin) as datetime) then 2 '+
         'WHEN cast(concat(tr.fecha, " ", tr.hora) as datetime) '+
         'between cast(concat(date_add("'+desde+'", INTERVAL 14 DAY), " ", t.HoraInicio) as datetime) '+
         'and cast(concat(date_add("'+desde+'", INTERVAL 21 DAY), " ", t.HoraFin) as datetime) then 3 '+
         'WHEN cast(concat(tr.fecha, " ", tr.hora) as datetime) '+
         'between cast(concat(date_add("'+desde+'", INTERVAL 21 DAY), " ", t.HoraInicio) as datetime) '+
         'and cast(concat("'+hasta+'", " ", t.HoraFin) as datetime) then 4 else 5 end as periodo '+
         'from tiempo_respuesta tr left join usuarios u on u.codigo=tr.codpatrullero left join turnos t on t.idturno=u.idturno '+
         'where cast(concat(tr.fecha, " ", tr.hora) as datetime) between cast(concat("'+desde+'", " ", t.HoraInicio) as datetime) '+
         'and cast(concat("'+hasta+'", " ", t.HoraFin) as datetime)'+
         //'and tr.idmotivo <> 2 '+
         //'and (tr.hora >= t.HoraInicio or tr.hora <= t.HoraFin) '+
         'and u.idturno = 3 Group by codpatrullero, periodo order by periodo, idturno, codpatrullero '+       
         ') as tabla left join usuarios u on tabla.codpatrullero=u.codigo '+
         'left join turnos t on u.idturno=t.idturno WHERE u.idpuesto=24 and CodPatrullero<>"SP3" '+
         'group by codpatrullero,periodo  order by turno,codpatrullero,periodo ) as tabla group by codpatrullero '+
         'order by idturno,sector', 0, dmreportes.sqlgeneral);

  //////////////////////////////////////     QUERY DE LOS CENTRALEROS   /////////////////////////////////////////
   querys('select user,nombre,round(sum(mins1),2) as mins1,sum(activaciones1) as activaciones1,round(sum(mins2),2) as mins2,sum(activaciones2) as activaciones2,round(sum(mins3),2) as mins3,'+
         ' sum(activaciones3) as activaciones3,round(sum(mins4),2) as mins4,sum(activaciones4) as activaciones4,turno,idturno,per1,per2,per3,per4, "'+inttostr(dayOf(strtodate(desde)))+'/'+inttostr(MonthOf(strtodate(desde)))+'/'+inttostr(yearof(strtodate(desde)))+
         '  al  '+inttostr(dayOf(strtodate(hasta)))+'/'+inttostr(MonthOf(strtodate(hasta)))+'/'+inttostr(yearof(strtodate(hasta)))+'" as periodo'+
         ' from(select user, if(u.apaterno is NULL or u.apaterno="", u.nombre, concat(u.nombre, " ", u.apaterno)) as nombre,t.nombre as turno,t.idturno,'+
         ' if(periodo="p1",sum(dif)/60,0) as mins1, if(periodo="p1",count(user),0) as  activaciones1,if(periodo="p2",sum(dif)/60,0) as mins2, if(periodo="p2",count(user),0) as  activaciones2,'+
         ' if(periodo="p3",sum(dif)/60,0) as mins3, if(periodo="p3",count(user),0) as  activaciones3,if(periodo="p4",sum(dif)/60,0) as mins4, if(periodo="p4",count(user),0) as  activaciones4,'+
         ' concat(day("'+desde+'"), " al ", day(date_add("'+desde+'", interval 6 day))) as per1, concat(day("'+datetostr(strtodate(desde)+7)+'"), " al ", day(date_add("'+datetostr(strtodate(desde)+7)+'", interval 6 day))) as per2,'+
         ' concat(day("'+datetostr(strtodate(desde)+14)+'"), " al ", day(date_add("'+datetostr(strtodate(desde)+14)+'", interval 6 day))) as per3,concat(day("'+datetostr(strtodate(desde)+21)+'"), " al ", day("'+hasta+'"))  as per4'+
         ' from(select user,time_to_sec(dif) as dif,periodo from(select  sk.user, if(min(fecha) <> max(fecha), addtime(timediff("24:00:00", max(hora)), min(hora)),  timediff(max(hora), min(hora))) as dif, "p1" as periodo'+
         ' from sk_alarmas as sk left join alarmas_detalle as ad on ad.aid=sk.id'+
		     ' where fecha_pc between "'+desde+'" and  date_add("'+desde+'", INTERVAL 6 DAY)  and ad.did is not null and sk.user<>""'+
         ' group by aid,user UNION ALL select  sk.user, if(min(fecha) <> max(fecha), addtime(timediff("24:00:00", max(hora)), min(hora)),  timediff(max(hora), min(hora))) as dif, "p2" as periodo'+
         ' from sk_alarmas as sk left join alarmas_detalle as ad on ad.aid=sk.id'+
		     ' where fecha_pc between date_add("'+desde+'", INTERVAL 7 DAY)  and  date_add("'+desde+'", INTERVAL 13 DAY)   and ad.did is not null and sk.user<>""'+
		     ' group by aid,user UNION ALL	select  sk.user, if(min(fecha) <> max(fecha), addtime(timediff("24:00:00", max(hora)), min(hora)),  timediff(max(hora), min(hora))) as dif, "p3" as periodo'+
		     ' from sk_alarmas as sk left join alarmas_detalle as ad on ad.aid=sk.id'+
		     ' where fecha_pc between date_add("'+desde+'", INTERVAL 14 DAY)  and  date_add("'+desde+'", INTERVAL 20 DAY)   and ad.did is not null and sk.user<>""'+
		     ' group by aid,user UNION ALL select  sk.user, if(min(fecha) <> max(fecha), addtime(timediff("24:00:00", max(hora)), min(hora)),  timediff(max(hora), min(hora))) as dif, "p4" as periodo'+
   		   ' from sk_alarmas as sk left join alarmas_detalle as ad on ad.aid=sk.id  where fecha_pc between date_add("'+desde+'", INTERVAL 21 DAY)  and  "'+hasta+'"  and ad.did is not null and sk.user<>""'+
		     ' group by aid,user)as t) as tab left join usuarios as u on u.codigo=tab.user left join turnos t on u.idturno=t.idturno'+
         ' where u.idpuesto=17 group by tab.user,periodo) as st group by user order by idturno,user', 1, dmreportes.sqlgeneral2);
   OperacionReporte('EstandaresPatrulleros','',TipoImpresion,1);
   OperacionReporte('EstandaresCentraleros','',TipoImpresion,1);
   frmmensaje.Update;
   frmmensaje.Close;
end;

procedure RepPedidosMes(mes,nummes,ano,TipoImpresion:string);
begin
   frmmensaje.Show;
   frmmensaje.Update;

   querys('select count(*) as ctas, "'+mes+'" as mes, "'+ano+'" as ano '+
          'from clientes '+
          'where estatus=1',0,dmreportes.sqlgeneral);

   querys('select ct.nombre as tipo, count(*) as cuantos '+
          'from clientes as c left join contratos as ct on (c.tipocont=ct.tipocont) '+
          'where c.estatus in (1) '+
          'group by c.tipocont '+
          'order by tipo desc',0,dmreportes.sqlgeneral2);

   querys('select giro, pago, F, R, P, N, if(pago=1,(F+R+P+N)*monto,0) as monto '+
          'from '+
          '(select if(c.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, m.m'+nummes+' as pago, '+
          'sum(if(m.l'+nummes+'="F",1,0)) as F, sum(if(m.l'+nummes+'="R",1,0)) as R, sum(if(m.l'+nummes+'="P",1,0)) as P, sum(if((m.l'+nummes+'<>"F") and (m.l'+nummes+'<>"R") and (m.l'+nummes+'<>"P"),1,0)) as N, '+
          'ROUND(ROUND(cat.CostoMensual)*(1.1)) as monto '+
          'from ConcentradoAbonosxMonitoreo as m '+
          'left join clientes as c on (m.idcliente=c.idcliente) '+
          'left join categorias as cat on (c.idcategoria=cat.idcategoria) '+
          'where m.anio="'+ano+'" and c.estatus=1 and c.tipocont in ("001","005","006") and m.m'+nummes+' <> 2 '+
          'group by giro, pago '+
          'order by pago, c.idgiro) as t1',0,dmreportes.sqlgeneral3);

   OperacionReporte('RemisionesDelMes','Reporte de Pedidos del mes',TipoImpresion, 1);
   frmmensaje.Close;
end;

procedure CuentasXContrato;
begin
with dmreportes do
  begin
  if querys('Select ano from TotalContratos where ano = year("'+datetostr(date)+'")', 0, sqlgeneral1) = 0 then
    begin
    querys('Insert into TotalContratos (TipoCont, M'+inttostr(monthof(date))+', ano) Select if(cn.TipoCont is null, "SIN", cn.TipoCont) as TipoCont, '+
           'count(c.idcliente) as total, year("'+datetostr(date)+'") as ano From clientes AS c Left Join contratos AS cn ON c.TipoCont '+
           '= cn.TipoCont group by cn.TipoCont Order by cn.estatus desc, total desc', 1, sqlgeneral1);
    end
  else
    begin
    querys('Select if(cn.TipoCont is null, "SIN", cn.TipoCont) as TipoCont, count(c.idcliente) as total, year("'+datetostr(date)+'") as '+
           'ano From clientes AS c Left Join contratos AS cn ON c.TipoCont = cn.TipoCont group by cn.TipoCont Order by cn.estatus desc, total desc', 0, sqlgeneral1);
    sqlgeneral1.First;
    while not sqlgeneral1.Eof do
      begin
      if querys('Select TipoCont from TotalContratos where ano = year("'+datetostr(date)+'") and TipoCont = "'+sqlgeneral1.fieldbyname('TipoCont').AsString+'"', 0, sqlgeneral6) = 0 then
        querys('Insert into TotalContratos (M'+inttostr(monthof(date))+', TipoCont, ano) values ('+sqlgeneral1.fieldbyname('total').AsString+', "'+
               sqlgeneral1.fieldbyname('TipoCont').AsString+'", '+sqlgeneral1.fieldbyname('ano').AsString, 1, sqlgeneral6)
      else
        querys('Update TotalContratos set M'+inttostr(monthof(date))+' = '+sqlgeneral1.fieldbyname('total').AsString+' where TipoCont = "'+
               sqlgeneral1.fieldbyname('TipoCont').AsString+'" and ano ='+sqlgeneral1.fieldbyname('ano').AsString, 1, sqlgeneral6);
      sqlgeneral1.Next;
      end;
    end;
  end;
end;

procedure RemisionadoCobradoMes;
var sqlgeneral, sqlgeneral2 :TMyQuery;
begin
sqlgeneral := TmyQuery.Create(nil);
sqlgeneral.Connection := DMAccesos.conexion;
sqlgeneral2 := TmyQuery.Create(nil);
sqlgeneral2.Connection := DMAccesos.conexion;

//Primero creamos la tabla que contenga las cuentas y dinero segun la categoria dividio por contrato
querys('Drop table if exists tmpRemiCobMes'+frmprincipal.idmaq, 1, sqlgeneral);

querys('Create table tmpRemiCobMes'+frmprincipal.idmaq+' select TipoCont, nombre as Contrato, giro as Giro, sum(total) as ContratoCuentas, '+
       'round(sum(tt),2) as ContratoDinero from ( select c.tipocont,con.nombre,if(c.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,count(c.idcliente) '+
       'as total,cat.CostoMensual, (count(c.idcliente) * CostoMensual) as tt from clientes c left join contratos con on c.tipocont=con.tipocont '+
       'left join categorias cat on c.idcategoria=cat.idcategoria left join giros g on c.idgiro=g.idgiro where c.estatus=1 group by CostoMensual, '+
       'tipocont) as t group by tipocont,giro order by giro', 1, sqlgeneral);

//Despues sacamos las remisionadas
querys('Alter table tmpRemiCobMes'+frmprincipal.idmaq+' add (RemCuentas int(11) default 0, RemSubtotal decimal(10,2) default 0, RemTotal '+
       'decimal(10,2) default 0, Cobrado decimal(10,2) default 0)', 1, sqlgeneral);

querys('select tt.tipocont as TipoCont, giro as Giro, sum(cuentas) as RemCuentas, round(sum(subtotal),2) as RemSubTotal, round(sum(Total),2) '+
       'as RemTotal, round(sum(pagado),2) as Cobrado from ( select tipocont, giro, sum(cuentas) as cuentas, round(sum(subtotal),2) as subtotal, '+
       'round(sum(Total), 2) as Total, round(sum(pagado),2) as pagado from (select c.tipocont,con.nombre,if(c.idgiro=1,"RESIDENCIAL","COMERCIAL") '+
       'as giro,1 as cuentas, c.idcliente, sum(p.subtotal) as subtotal,sum(p.TotMn) as Total, 0 as pagado from clientes c left join contratos con '+
       'on c.tipocont=con.tipocont left join categorias cat on c.idcategoria=cat.idcategoria left join pedidos p on c.idcliente=p.idcliente left '+
       'join giros g on c.idgiro=g.idgiro where c.estatus=1 and p.idUnidadNegocio=4 and p.estatus in (3,4) and p.concepto like '+
       '"%'+uppercase(meses[monthof(today)])+'%" and p.concepto like "%'+inttostr(yearof(today))+'%" group by c.idcliente union '+
       'select c.tipocont, con.nombre,if(c.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,0 as cuentas, c.idcliente, 0 as subtotal, 0 as Total, '+
       'sum(pc.abono) as pagado from clientes c left join contratos con on c.tipocont=con.tipocont left join categorias cat on '+
       'c.idcategoria=cat.idcategoria left join pedidos p on c.idcliente=p.idcliente left join giros g on c.idgiro=g.idgiro left join PagosClientes '+
       'pc on pc.idpedido=p.idpedido where c.estatus=1 and p.idUnidadNegocio=4 and p.estatus in (3,4) and p.concepto like '+
       '"%'+uppercase(meses[monthof(today)])+'%" and p.concepto like "%'+inttostr(yearof(today))+'%" and pc.movimiento = 2 group by c.idcliente) as t '+
       'group by idcliente) as tt left join contratos as c on c.tipocont=tt.tipocont group by giro, tipocont ', 0, sqlgeneral);

sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  querys('Update tmpRemiCobMes'+frmprincipal.idmaq+' set RemCuentas='+sqlgeneral.fieldbyname('RemCuentas').asstring+', '+
         'RemSubtotal ='+sqlgeneral.fieldbyname('RemSubTotal').asstring+', RemTotal ='+sqlgeneral.fieldbyname('RemTotal').asstring+', '+
         'Cobrado='+sqlgeneral.fieldbyname('Cobrado').asstring+' where TipoCont="'+sqlgeneral.fieldbyname('TipoCont').asstring+'" '+
         'and Giro="'+sqlgeneral.fieldbyname('Giro').asstring+'"', 1, sqlgeneral2);
  sqlgeneral.Next;
  end;
end;

procedure RemisionesMonEnero;
begin                     {  enero con pedidos
querys('select
idcliente, CostoMensual, subtotal, Total,Cobrado,cuantos,t.estatus,giro,c1.nombre as ContratoActual, if(c2.nombre is null,  c1.nombre, c2.nombre) as Contrato_Al_1Enero
from
(
select c.idcliente, CostoMensual, round(sum(subtotal),2) as subtotal, round(sum(ToTmN), 2) as Total,
 round(sum(p.saldo), 2) as Saldo,
(select sum(abono) from PagosClientes as pc where pc.idpedido = p.idpedido and movimiento in(0,2)) as Cobrado,
count(c.idcliente) as cuantos,
case p.estatus when  0 then "PED" when 1 then "CAN" when 3 then "REMI" when 4 then "FAC" else "S/P" end as estatus,
 if(c.idgiro=1,'RESIDENCIAL','COMERCIAL') as giro,
TipoCont as ContratoActual,
 (select Anterior from Cambios where idCambio =  (select min(idCambio) from Cambios where e.idcliente = Cambios.idprimario and  fecha >= '2008/01/03' and campo = 'TipoCont')) as Contrato_Al_1Enero
from
edwinCuentasEnero as e
left join clientes as c on( c.idcliente = e.idcliente)
left join categorias as cat on(cat.idcategoria = c.idcategoria)
left join pedidos p on (c.idcliente=p.idcliente and (p.concepto like '%ENERO%' and p.concepto like'%2008%')  and p.estatus in(3,4) and p.idUnidadNegocio=4 )
group by idcliente
) as t
left join contratos as c1 on(c1.TipoCont = ContratoActual)
left join contratos as c2 on(c2.TipoCont = Contrato_Al_1Enero)
order by giro, Contrato_Al_1Enero, estatus,  idcliente
}


{Enero sin pedidos
select count(idcliente) as cuentas, CostoMensual,
giro,ContratoActual,Cont01Ene, categoria
from
(

select idcliente, round(CostoMensual,2) as CostoMensual,
giro,c1.nombre as ContratoActual, if(c2.nombre is null,  c1.nombre, c2.nombre) as Cont01Ene, categoria
from
(
select c.idcliente, if(cat.nombre like "%ANUAL%", CostoAnual/12,  CostoMensual) as CostoMensual, --round(sum(subtotal),2) as subtotal, round(sum(ToTmN), 2) as Total, 
 cat.nombre as categoria,
count(c.idcliente) as cuantos,
 if(cat.idgiro=1,'RESIDENCIAL','COMERCIAL') as giro,
TipoCont as ContratoActual,
 (select Anterior from Cambios where idCambio =  (select min(idCambio) from Cambios where e.idcliente = Cambios.idprimario and  fecha >= '2008/01/03' and campo = 'TipoCont')) as Contrato_Al_1Enero
from
edwinCuentasEnero as e
left join clientes as c on( c.idcliente = e.idcliente)
left join categorias as cat on(cat.idcategoria = c.idcategoria)
group by idcliente
) as t
left join contratos as c1 on(c1.TipoCont = ContratoActual)
left join contratos as c2 on(c2.TipoCont = Contrato_Al_1Enero)

order by giro, Cont01Ene, categoria, idcliente

) as tt

group by giro, Cont01Ene, CostoMensual

order by giro, Cont01Ene, categoria}
end;

{procedure CuentasActivasContrato(mes, tipo, tipoimpresion:string);
var inires, finres, tabla, fecha, cadena:string;
begin
if uppercase(mes) = 'MARZO' then
  begin
  querys('select contrato,giro,categoria,sum(cuentas) as cuentas, CostoMensual ,sum(tt) as TotalDinero, "'+mes+'" as mes from ( '+
         'select c.tipocont,con.nombre as contrato,if(c.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria, '+
         'count(c.idcliente) as cuentas, if(c.TipoCont= "012" or c.TipoCont ="15" or c.TipoCont="16" or c.TipoCont="025" or '+
         'c.TipoCont="010",cat.CostoAnual /12, cat.CostoMensual) as CostoMensual, (count(c.idcliente) *CostoMensual) as tt '+
         'from clientes c left join contratos con on c.tipocont=con.tipocont left join categorias cat on c.idcategoria=cat.idcategoria '+
         'left join giros g on c.idgiro=g.idgiro where c.estatus=1 group by CostoMensual, tipocont order by giro ) as t '+
         'group by giro, Contrato, categoria order by giro, Contrato, categoria', 0, dmreportes.sqlgeneral);
  if UPPERcase(tipo) <> 'DET' then
  begin
  operacionreporte('RepCuentasActivas', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end
else
  begin
  querys('select c.tipocont,con.nombre as contrato,if(c.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, '+ClienteNombre('c')+' as nombre, cat.nombre as categoria, '+
         'c.idcliente, if(c.TipoCont= "012" or c.TipoCont ="15" or c.TipoCont="16" or c.TipoCont="025" or '+
         'c.TipoCont="010",cat.CostoAnual /12, cat.CostoMensual) as CostoMensual, (count(c.idcliente) *CostoMensual) as tt, "'+mes+'" as mes  '+
         'from clientes c left join contratos con on c.tipocont=con.tipocont left join categorias cat on c.idcategoria=cat.idcategoria '+
         'left join giros g on c.idgiro=g.idgiro where c.estatus=1 group by CostoMensual, tipocont order by idcliente', 0, dmreportes.sqlgeneral2);
  operacionreporte('RepCuentasActivasDet', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end;
  exit;
end;

inires := 'select Contrato,giro,categoria,count(idcliente) as cuentas, CostoMensual, count(idcliente)*CostoMensual as TotalDinero, "'+mes+'" as mes from ( ';
finres := ') as tt group by giro, Contrato, categoria order by giro, Contrato, categoria';

if uppercase(mes) = 'ENERO' then
  begin
  tabla := 'cuentasEnero';
  fecha := '2008/01/03';
  end
else
  begin
  if uppercase(mes) = 'FEBRERO' then
    begin
    tabla := 'cuentasFebrero';
    fecha := '2008/02/01';
    end
  else
    begin
    application.MessageBox('Este reporte aun no se genera', 'Aviso', MB_ICONINFORMATION);
    exit;
    end;
  end;

cadena := 'select c.idcliente,'+ClienteNombre('c')+' as nombre,c.tipocont,con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,'+
          'cat.nombre as categoria, if(c.TipoCont= "012" or c.TipoCont ="15" or c.TipoCont="16" or c.TipoCont="025" or '+
          'c.TipoCont="010", cat.CostoAnual /12, cat.CostoMensual) as CostoMensual, "'+mes+'" as mes from '+tabla+' ce left join clientes c on ce.idcliente=c.idcliente '+
          'left join contratos con on ce.tipocont=con.tipocont left join categorias cat on ce.idcategoria=cat.idcategoria';

{cadena := 'select idcliente,t.nombre, round(CostoMensual,2) as CostoMensual, Giro, "'+mes+'" as mes, if(c2.nombre is null, c1.nombre, c2.nombre) as Contrato, '+
       'categoria from  (	select c.idcliente, '+ClienteNombre('c')+' as nombre, if(cat.nombre like "%ANUAL%", CostoAnual/12,  CostoMensual) as CostoMensual,  cat.nombre as categoria, count(c.idcliente) '+
       'as cuantos, if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, TipoCont as ContratoActual, (select Anterior from Cambios where idCambio =  '+
       '(select min(idCambio) from Cambios where e.idcliente = Cambios.idprimario and  fecha >= "'+fecha+'" and campo = "TipoCont")) as Contrato '+
       ' from	'+tabla+' as e 	left join clientes as c on( c.idcliente = e.idcliente) 	left join categorias as cat on(cat.idcategoria = '+
       'c.idcategoria) group by idcliente 	) as t 	left join contratos as c1 on(c1.TipoCont = ContratoActual) left join contratos as c2 '+
       'on(c2.TipoCont = Contrato) 	order by idcliente';}

 {

if UPPERcase(tipo) <> 'DET' then
  begin
  querys(inires+cadena+finres, 0, dmreportes.sqlgeneral);
  operacionreporte('RepCuentasActivas', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end
else
  begin
  querys(inires+cadena+finres, 0, dmreportes.sqlgeneral);
  querys(cadena, 0, dmreportes.sqlgeneral2);
  operacionreporte('RepCuentasActivasDet', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end;

end;}


procedure CuentasActivasContrato(mes,idmes,ano, tipo, tipoimpresion:string);
var inires, finres,  cadena:string;       //  tabla, fecha,
begin
   inires := 'select Contrato,giro,categoria,count(idcliente) as cuentas, CostoMensual, count(idcliente)*CostoMensual as TotalDinero, "'+mes+'" as mes from ( ';
   finres:=')as t group by giro,contrato,categoria,costomensual order by giro,contrato,idcliente';
   cadena:='select c.idcliente,'+ClienteNombre('c')+' as nombre,'+
	      ' ce.tipocont,con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,cat.nombre as categoria,'+
	      ' if(ce.TipoCont= "012" or ce.TipoCont ="15" or ce.TipoCont="16" or ce.TipoCont="025" or ce.TipoCont="010",cat.CostoAnual /12,'+
      	' cat.CostoMensual) as CostoMensual,"'+mes+'" as mes from cuentasActivas ce left join clientes c on ce.idcliente=c.idcliente'+
	      ' left join contratos con on ce.tipocont=con.tipocont left join categorias cat on ce.idcategoria=cat.idcategoria'+
         ' where ce.mes="'+idmes+'" and ce.ano="'+ano+'" order by giro,contrato,categoria,idcliente';
   if UPPERcase(tipo) <> 'DET' then
   begin
      querys(inires+cadena+finres, 0, dmreportes.sqlgeneral);
      operacionreporte('RepCuentasActivas', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end
  else
  begin
      querys(inires+cadena+finres, 0, dmreportes.sqlgeneral);
      querys(cadena, 0, dmreportes.sqlgeneral2);
      operacionreporte('RepCuentasActivasDet', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end;
end;


procedure NoRemisionadoDelMes(mes:integer;ano,tipo,tipoimpresion:string);
var _mes,_fecha1,_fecha2,_sql:string;  _dias :integer;
begin
      _dias := DiasMes(inttostr(mes));
      if(Length(inttostr(mes)) = 1) then
        _mes := '0'+inttostr(mes)
      else
        _mes := inttostr(mes);

      _fecha1 := ano+'/'+_mes+'/01';
      _fecha2 := ano+'/'+_mes+'/'+ inttostr(_dias);

with dmreportes do
begin
        querys('SELECT idcliente from cuentasActivas where ano='+ano+' and mes ='+_mes+' ',0,sqlgeneral);
        if(sqlgeneral.RecordCount > 0) then
          begin

           _sql := 'SELECT  "'+ ano +'/'+ meses[mes] +'" AS mes,'+ClienteNombre('clie')+' as nombre,c.idcliente,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,con.nombre as ContratoRemision,con2.nombre as ContratoActual,cat.nombre as categoria,'+
                   'clie.st_date,if(con.remisiona= 0,"NO GENERA REMISION","SE REMISIONA") AS remisiona ,cat.costomensual, (select b.mes from bonificaciones as b where b.idcliente=c.idcliente and  b.mes ="'+meses[mes]+'" AND b.ano= '+ano+' )  as bonificacion,'+
                   '(select concepto from pedidos where c.idcliente = pedidos.idcliente and idUnidadNegocio  in(18, 4,6,3,15,2) and concepto like "'+'%'+meses[mes]+'%'+'" and FechaVencimiento > "2007-06-01"  limit 1) as cortesia '+
                   ' FROM cuentasActivas as c left join clientes as clie on(clie.idcliente=c.idcliente) left join contratos as con on(con.TipoCont = c.tipocont) left join contratos as con2 on(con2.TipoCont = clie.tipocont) '+
                   ' left join categorias as cat on (cat.idcategoria= c.idcategoria) WHERE c.mes = '+_mes+' AND c.ano LIKE "'+'%'+ano+'%'+'" AND c.idpedido IS  NULL order by con.remisiona,cat.idgiro,c.tipocont,c.idcategoria,c.idcliente ';

         querys(_sql,0,sqlgeneral);

         if(sqlgeneral.RecordCount > 0) then
             operacionreporte('RepNoRemisionesDet', '', tipoimpresion, 1)
         else
             Application.MessageBox('No hay datos a mostrar!', 'Aviso', MB_ICONINFORMATION);


          end else
             Application.MessageBox('Este reporte aun no se genera!', 'Aviso', MB_ICONINFORMATION);

end;

end;


//Lo cobrado en el mes en cuentas activas.
procedure CobradoRemProceso(mes:integer;ano,tipo,tipoimpresion:string);
var _mes,_fecha1,_fecha2,_sql:string;  _dias :integer;
begin
      _dias := DiasMes(inttostr(mes));
      if(Length(inttostr(mes)) = 1) then
        _mes := '0'+inttostr(mes)
      else
        _mes := inttostr(mes);

      _fecha1 := ano+'/'+_mes+'/01';
      _fecha2 := ano+'/'+_mes+'/'+ inttostr(_dias);

with dmreportes do
begin
        querys('SELECT idcliente from cuentasActivas where ano='+ano+' and mes ='+_mes+' ',0,sqlgeneral);
        if(sqlgeneral.RecordCount > 0) then
          begin

            _mes :=ano +' / '+  meses[mes];

                  {
            if tipo = 'RES' then
              begin
               _sql :=
                    'select distinct pc.idpago,"REPORTE CONCENTRADO ABONOS DEL MES" as Titulo ,count(pc.idcliente) as cuentas,con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria, pc.idpedido,p.idfactura,'+
                    'p.saldado,sum(p.subTotal) as subtotal,sum((select  sum(round(pc3.abono/1.1,2))  from PagosClientes as pc3  where  pc3.idpedido=pc.idpedido and pc3.movimiento in(0,2,10,8)  )) as  abono '+
                    ',sum(round(pc.restante/1.1,2)) as restante,"'+ _mes+'" as mes from PagosClientes as pc inner join pedidos as p on(p.idpedido=pc.idpedido)  left join clientes c on pc.idcliente=c.idcliente '+
                    ' left join contratos con on c.tipocont=con.tipocont  left join categorias cat on c.idcategoria=cat.idcategoria '+
                    ' where pc.FechaAlta between  "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (3,4)   and p.idUnidadNegocio = 4 and pc.movimiento in (0) '+
                    ' and pc.idpedido not in(select pc2.idpedido  from PagosClientes as pc2 where pc2.idpedido = pc.idpedido and pc2.movimiento = 6  ) group by giro,contrato,categoria order by  giro,contrato,categoria ';
                  querys(_sql, 0, dmreportes.sqlgeneral);
                  operacionreporte('RepRemisionesMensuales', 'REPORTE DE CUENTAS COBRADAS', tipoimpresion, 1);


              end else
               begin
                        }
                 _sql :=
                    'select distinct pc.idpago,"REPORTE DETALLADO ABONOS DEL MES POR CUENTAS ACTIVAS" as Titulo, pc.idcliente,'+ClienteNombre('c')+' as nombre, con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria,"'+ _mes+'" as mes, '+
                    ' p.concepto,pc.idpedido,p.idfactura,p.saldado,p.subTotal,(select  sum(round(pc3.abono/1.1,2))  from PagosClientes as pc3 inner join pedidos as p2 on(p2.idpedido=pc3.idpedido) where  pc3.idcliente=c2.idcliente and pc3.idpedido=p.idpedido and'+
                    ' pc3.FechaAlta between "'+_fecha1+'" and "'+_fecha2+'"   and pc3.movimiento in(0,2,10,8)) as  abono,round(pc.restante/1.1,2) as restante '+
                    ' from cuentasActivas as c2 left join PagosClientes as pc on( pc.idcliente=c2.idcliente)'+
                    ' left join pedidos as p on(p.idpedido=pc.idpedido) left join clientes c on c2.idcliente=c.idcliente '+
                    ' left join contratos con on c.tipocont=con.tipocont left join categorias cat on c.idcategoria=cat.idcategoria '+
                    ' where '+
                    '  c2.ano='+ano+' and c2.mes = '+inttostr(mes)+' and pc.FechaAlta between "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (3,4) and p.idUnidadNegocio = 4 and pc.movimiento in (0) '+
                    ' and pc.idpedido not in(select pc2.idpedido  from PagosClientes as pc2 where pc2.idpedido = pc.idpedido and pc2.movimiento = 6  ) '+
                    ' group by pc.idpedido order by  giro,contrato,idcliente';

                  querys(_sql, 0, dmreportes.sqlgeneral);
                  operacionreporte('RepRemisionesMensualesDet', 'REPORTE DE CUENTAS COBRADAS', tipoimpresion, 1);

            //   end;

              end
                else
                  Application.MessageBox('Este reporte aun no se genera!', 'Aviso', MB_ICONINFORMATION);

end;


end;


//Reporte donde muestra las remisiones generadas en el mes que sea monitoreo ya sean cuentas activas o lo que sea(todo lo del mes), en el rango de alta de mes.
procedure RemisionadoDelMes(mes:integer;ano,tipo,tipoimpresion:string);
var _mes,_fecha1,_fecha2,_sql:string;  _dias :integer;
begin
      _dias := DiasMes(inttostr(mes));
      if(Length(inttostr(mes)) = 1) then
        _mes := '0'+inttostr(mes)
      else
        _mes := inttostr(mes);

      _fecha1 := ano+'/'+_mes+'/01';
      _fecha2 := ano+'/'+_mes+'/'+ inttostr(_dias);

with dmreportes do
begin
        querys('SELECT idcliente from cuentasActivas where ano='+ano+' and mes ='+_mes+' ',0,sqlgeneral);
        if(sqlgeneral.RecordCount > 0) then
          begin

            _mes :=ano +' / '+  meses[mes];


            if tipo = 'RES' then
              begin

               _sql :=
                    'select distinct pc.idpago,"REPORTE CONCENTRADO ABONOS DEL MES" as Titulo ,count(pc.idcliente) as cuentas,con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria, pc.idpedido,p.idfactura,'+
                    'p.saldado,sum(p.subTotal) as subtotal,sum((select  sum(round(pc3.abono/1.1,2))  from PagosClientes as pc3  where  pc3.idpedido=pc.idpedido and pc3.movimiento in(0,2,10,8)  )) as  abono '+
                    ',sum(round(pc.restante/1.1,2)) as restante,"'+ _mes+'" as mes from PagosClientes as pc inner join pedidos as p on(p.idpedido=pc.idpedido)  left join clientes c on pc.idcliente=c.idcliente '+
                    ' left join contratos con on c.tipocont=con.tipocont  left join categorias cat on c.idcategoria=cat.idcategoria '+
                    ' where pc.FechaAlta between  "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (3,4)   and p.idUnidadNegocio = 4 and pc.movimiento in (0) '+
                    ' and pc.idpedido not in(select pc2.idpedido  from PagosClientes as pc2 where pc2.idpedido = pc.idpedido and pc2.movimiento = 6  ) group by giro,contrato,categoria order by  giro,contrato,categoria ';
                  querys(_sql, 0, dmreportes.sqlgeneral);
                  operacionreporte('RepRemisionesMensuales', 'REPORTE DE CUENTAS COBRADAS', tipoimpresion, 1);
              end else
              begin

               _sql :=
                    'select distinct pc.idpago,"REPORTE DETALLADO ABONOS DEL MES" as Titulo, pc.idcliente,'+ClienteNombre('c')+' as nombre, con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria,"'+ _mes+'" as mes, '+
                    ' p.concepto,pc.idpedido,p.idfactura,p.saldado,p.subTotal,(select  sum(round(pc3.abono/1.1,2))  from PagosClientes as pc3  where  pc3.idpedido=pc.idpedido and pc3.movimiento in(0,2,10,8)) as  abono,round(pc.restante/1.1,2) as restante '+
                    ' from PagosClientes as pc '+
                    ' inner join pedidos as p on(p.idpedido=pc.idpedido) left join clientes c on pc.idcliente=c.idcliente '+
                    ' left join contratos con on c.tipocont=con.tipocont left join categorias cat on c.idcategoria=cat.idcategoria '+
                    ' where '+
                    ' pc.FechaAlta between "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (3,4) and p.idUnidadNegocio = 4 and pc.movimiento in (0) '+
                    ' and pc.idpedido not in(select pc2.idpedido  from PagosClientes as pc2 where pc2.idpedido = pc.idpedido and pc2.movimiento = 6  ) '+
                    ' group by pc.idpedido order by  giro,contrato,idcliente';

                  querys(_sql, 0, dmreportes.sqlgeneral);
                  operacionreporte('RepRemisionesMensualesDet', 'REPORTE DE CUENTAS COBRADAS', tipoimpresion, 1);
              end;


          end
           else
              Application.MessageBox('Este reporte aun no se genera!', 'Aviso', MB_ICONINFORMATION);


end;

end;


procedure CobradoDelMesRemisionado(mes:integer;ano,tipo,tipoimpresion:string);
var _mes,_fecha1,_fecha2,_sql:string;  _dias :integer;
begin
      _dias := DiasMes(inttostr(mes));
      if(Length(inttostr(mes)) = 1) then
        _mes := '0'+inttostr(mes)
      else
        _mes := inttostr(mes);

      _fecha1 := ano+'/'+_mes+'/01';
      _fecha2 := ano+'/'+_mes+'/'+ inttostr(_dias);

with dmreportes do
begin
        querys('SELECT idcliente from cuentasActivas where ano='+ano+' and mes ='+_mes+' ',0,sqlgeneral);
        if(sqlgeneral.RecordCount > 0) then
          begin

             _mes :=ano +' / '+  meses[mes];


            if tipo = 'RES' then
              begin

                  _sql :='select '+
                  ' con.nombre as Contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria,'+
                  ' count(ca.idcliente) as cuentas,sum(if(abono>0,1,0)) as cobrado,sum(if(abono>0,abono,0)) as total,"'+ _mes+'" as mes,ca.estatus,if(ca.estatus = 1,"COBRADO",if(ca.estatus=2,"NOTA_CREDITO","FACT_CANCE")) as Tipo '+
                  ' from '+
                  ' ( ' +
                  'select idcliente,tipocont,idcategoria,(actual+if(historico is null,0,historico)) as abono,1 as estatus '+
                  'from'+
                  '('+
                     'select idcliente,tipocont,idcategoria,(select sum(round(pc.abono/1.1,2)) as abono from PagosClientes as pc inner join pedidos as p on(p.idpedido=pc.idpedido) where pc.idcliente= e.idcliente  and p.estatus in (3,4) '+
                     ' and pc.fecha between "'+_fecha1+'" and "'+_fecha2+'" and p.idUnidadNegocio = 4 and pc.movimiento in (0,2) ) as actual,'+
          				   '(select sum(pc.abono) as abono  from NoPagosClientes as pc inner join NoPedidos as p on(p.idpedido=pc.idpedido) where pc.idcliente= e.idcliente  and p.estatus in (3,4,6)  and pc.fecha between  "'+_fecha1+'" and "'+_fecha2+'" '+
                		 ' and p.idUnidadNegocio =4 and pc.movimiento in (0,2) ) as historico from 	cuentasActivas as e 	where e.ano='+ano+' and e.mes = '+inttostr(mes)+' '+
                  ') as t '+
                  ' UNION '+
                  'select idcliente,tipocont,idcategoria, (actual+if(historico is null,0,historico)) as abono,3 as estatus '+
                  'from '+
                  '( '+
                     'select idcliente,tipocont,idcategoria, (select sum(p.SubTotal) as abono FROM RemiFact as rm left JOIN pedidos as p ON (p.idpedido=rm.idpedido)  WHERE p.idcliente= e.idcliente and rm.FechaBaja BETWEEN "'+_fecha1+'" and "'+_fecha2+'" and p.estatus = 1 and p.idfactura is not null '+
              			 'and p.idUnidadNegocio = 4 ) as actual, (select sum(pc.abono) as abono  from NoPagosClientes as pc inner join NoPedidos as p on(p.idpedido=pc.idpedido) '+
                     ' where pc.idcliente= e.idcliente  and p.estatus in (1) and pc.fecha between "'+_fecha1+'" and "'+_fecha2+'" and p.idfactura is not null and p.idUnidadNegocio = 4  and pc.movimiento in (0,2)	) as historico 	'+
                     'from cuentasActivas as e 	where  e.ano='+ano+' and e.mes = '+inttostr(mes)+' '+
                  ') as t '+
                  'having abono is not null and abono > 0 '+
                  ' UNION '+
                  'select idcliente,tipocont,idcategoria, (actual+if(historico is null,0,historico)) as abono,2 as estatus '+
                  'from '+
                  '('+
                     ' select idcliente,tipocont,idcategoria,(select sum(pc.subtotal) as abono from NotasCredito as pc inner join pedidos as p on(p.idfactura=pc.idfactura) where pc.idcliente= e.idcliente  and p.estatus in (3,4)  and pc.FechaNc between "'+_fecha1+'" and "'+_fecha2+'" '+
            				 ' and p.idUnidadNegocio = 4 ) as actual, (select sum(pc.subtotal) as abono  from NoNotasCredito as pc inner join NoPedidos as p on(p.idfactura=pc.idfactura) where pc.idcliente= e.idcliente  and p.estatus in (3,4)  and pc.FechaNc between "'+_fecha1+'" and "'+_fecha2+'" '+
              			 ' and p.idUnidadNegocio = 4 ) as historico from cuentasActivas as e where e.ano='+ano+' and e.mes = '+inttostr(mes)+' '+
                  ') as t '+
                  ' having abono is not null and abono > 0 '+
                  ' ) as ca '+

                  ' left join clientes c on ca.idcliente=c.idcliente '+
                  ' left join contratos con on ca.tipocont=con.tipocont '+
                  ' left join categorias cat on ca.idcategoria=cat.idcategoria '+
                  ' group by ca.estatus,giro,contrato,categoria order by ca.estatus,giro,contrato ';


                  querys(_sql, 0, dmreportes.sqlgeneral);
                  operacionreporte('RepCobradoRem', 'REPORTE DE CUENTAS COBRADAS', tipoimpresion, 1);


              end
             else
              begin

                  _sql :=
                  'select ca.idcliente,'+ClienteNombre('c')+' as nombre,con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro, cat.nombre as categoria,'+
                  'idpedido,idfactura,abono,ca.estatus,if(ca.estatus = 1,"COBRADO",if(ca.estatus=2,"NOTA_CREDITO","FACT_CANCE")) as Tipo '+
                  ' from ('+
                        'select e.idcliente,e.tipocont,e.idcategoria,p.idpedido,p.idfactura,sum(round(pc.abono/1.1,2)) as  abono,1 as estatus from cuentasActivas as e'+
                        ' left join  PagosClientes as pc on (pc.idcliente =e.idcliente) inner join pedidos as p on(p.idpedido=pc.idpedido) where e.ano='+ano+' and e.mes = '+inttostr(mes)+' and '+
                        ' pc.fecha between "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (3,4,6)   and p.idUnidadNegocio = 4 and pc.movimiento in (0,2) group by p.idfactura '+
                        ' union '+
                        ' select e.idcliente,e.tipocont,e.idcategoria,p.idpedido,p.idfactura,sum(pc.subtotal) as  abono,2 as estatus from cuentasActivas as e '+
                        ' left join  NotasCredito as pc on (pc.idcliente =e.idcliente) inner join pedidos as p on(p.idfactura=pc.idfactura) where e.ano='+ano+' and e.mes = '+inttostr(mes)+' '+
                        ' and pc.FechaNc between "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (3,4,6)   and p.idUnidadNegocio = 4 group by p.idfactura having abono is not null and abono > 0 '+
                        ' union '+
                        ' select e.idcliente,e.tipocont,e.idcategoria,p.idpedido,p.idfactura,sum(p.subtotal) as  abono,2 as estatus from cuentasActivas as e '+
                        ' left JOIN pedidos as p ON (p.idcliente=e.idcliente) left join  RemiFact as rm on  (p.idpedido=rm.idpedido) where  e.ano='+ano+' and e.mes = '+inttostr(mes)+' '+
                        ' and rm.FechaBaja BETWEEN "'+_fecha1+'" and "'+_fecha2+'" and  p.estatus in (1) and p.idUnidadNegocio = 4  and p.idfactura is not null '+
                        ' group by p.idfactura having abono is not null and abono > 0'+
                  ') as ca '+
                  ' left join clientes c on ca.idcliente=c.idcliente ' +
                  ' left join contratos con on ca.tipocont=con.tipocont '+
                  ' left join categorias cat on ca.idcategoria=cat.idcategoria '+
                  ' order by  estatus,giro,contrato,ca.idcliente ';

                  querys(_sql, 0, dmreportes.sqlgeneral);
                  operacionreporte('RepCobradoRemDet', 'REPORTE DE CUENTAS COBRADAS', tipoimpresion, 1);
              end;



          end
           else
              Application.MessageBox('Este reporte aun no se genera!', 'Aviso', MB_ICONINFORMATION);

end;

end;


procedure CuentasRemisionadas(mes, tipo, tipoimpresion:string);
var inires, finres, tabla, fecha, cadena:string;
begin
   inires := 'select Contrato,giro,categoria,count(idcliente) as cuentas,sum(if(idpedido<>0,1,0)) as remisionadas, sum(total) as total,"'+mes+'" as mes from (';
   finres:=')as t group by giro,contrato,categoria order by giro,contrato';
   if uppercase(mes) = 'ENERO' then
   begin
      tabla := '1';
      fecha := '2008';
   end
   else
   begin
      if uppercase(mes) = 'FEBRERO' then
      begin
         tabla := '2';
         fecha := '2008';
      end
      else
      begin
         if uppercase(mes) = 'MARZO' then
         begin
            tabla := '3';
            fecha := '2008';
         end
         else
           begin
            if uppercase(mes) = 'ABRIL' then
            begin
              tabla := '4';
              fecha := '2008';
            end
            else
            begin
              application.MessageBox('Este reporte aun no se genera', 'Aviso', MB_ICONINFORMATION);
              exit;
            end;
         end;
      end;
   end;
    cadena:= 'select c.idcliente,'+ClienteNombre('c')+' as nombre,'+
            ' c.tipocont,con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,'+
            ' cat.nombre as categoria,ca.idpedido,if(ca.idpedido is null,0,1) as pedido,ca.total,'+
            ' "'+mes+'" as mes from cuentasActivas ca left join clientes c on ca.idcliente=c.idcliente'+
            ' left join contratos con on ca.tipocont=con.tipocont left join categorias cat on ca.idcategoria=cat.idcategoria'+
            ' where ca.mes="'+tabla+'" and ca.ano="'+fecha+'" order by giro,contrato,categoria,idcliente';


if UPPERcase(tipo) <> 'DET' then
  begin
  querys(inires+cadena+finres, 0, dmreportes.sqlgeneral);
  operacionreporte('RepcuentasRemision', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end
else
  begin
  querys(inires+cadena+finres, 0, dmreportes.sqlgeneral);
  querys(cadena, 0, dmreportes.sqlgeneral2);
  operacionreporte('RepcuentasRemisionadasDet', 'REPORTE DE CUENTAS ACTIVAS', tipoimpresion, 1);
  end;

end;

{#### estatus   #######
      0 detalle
      1 concentrado
      2 historico
}
procedure RemisionadoMensual(mes:integer;ano,ctaini,ctafin,contrato,giro,pagos,descuentos,nuevas,canceladas,fechapago,tipoimpresion:string;estatus:integer);
var _mes,_sql,resumenini,resumenfin,descuentoini,descuentofin,pagoini,pagofin,mesnum,condicion:string;
    x,total,nomeses:integer;  promedio:double;
    //fecha :TDate;
begin
   with dmreportes do
   begin
      if estatus=0 then
      begin
         querys('SELECT idcliente from cuentasActivas where ano='+ano+' and mes ='+inttostr(mes)+' ',0,sqlgeneral);
         if(sqlgeneral.RecordCount > 0) then
         begin
             _mes :=ano +' / '+  meses[mes];
             if ano<='2010' then
             begin
               if mes<10 then
                 mesnum:='0'+inttostr(mes)
               else
                 mesnum:=inttostr(mes);
             end
             else
             begin
                if mes<10 then
                   mesnum:='0'+inttostr(mes)+copy(ano,3,2)
                 else
                   mesnum:=inttostr(mes)+copy(ano,3,2);;
             end;
             resumenini:='select giro,contrato,sum(cancelado) as can, sum(nueva) as nueva,count(cuenta) as num,sum(total) as total,costomensual from ( ';
             resumenfin:=' ) as t group by giro,contrato';
             descuentoini:='select tipo,count(tipo) as cuentas,sum(descuento) as total from( ';
             if(fechapago<>'')then
             begin
                descuentofin:=' and tipo<>"") as t group by tipo';
                pagofin:=' and pago is not null and pago<>"" ) as t group by pago';
             end
             else
             begin
                descuentofin:=' having tipo<>"") as t group by tipo';
                pagofin:=' having pago is not null and pago<>"" ) as t group by pago';
             end;

             pagoini:='select pago,count(pago) as cuentas,sum(abono) as total from( ';

             _sql:='select Cuenta,Nombre,Giro,residencial,cantidad,Contrato,cancelado,nueva,Remision, total,if(Descuento is null,0,Descuento) as Descuento,'+
                   'if(abono is null,0,abono) as abono,"'+_mes+'" AS mes,case when pago in ("CH","CA","EF","TA","AT","NC") or (pago is null and abono>0) then "CAJ"'+
                   ' when pago in ("BA","AE","SA","BM","BC","SB","BN") then "BAN" when pago in ("CB","CD") then "CAU" when pago in ("CM") then "CAM"'+
                   ' when pago="NC" then "" else pago end as Pago,tipo,if(saldo is null,0,saldo) as saldo,fechapago, costomensual'+
                   ' from ('+
                          'select  t.idcliente as Cuenta,t.nombre,p'+inttostr(mes)+',r'+inttostr(mes)+' as remision,t.estatus,idpago,t.cancelado,t.nueva,'+
                          'con.nombre as contrato,t.idgiro, if(t.tipocont in ("011","007","16"),0,if(t.tipocont in ("006","15"),'+
                          '	count(t.idcliente)+1,count(t.idcliente))) as cantidad,'+
                          ' if(t.idgiro=1,"RES","COM") as Giro,if(t.idgiro=1,1,0) as residencial, '+
                          ' if(t.tipocont in ("012","025","010","15","16"),0,if(total is null,0,total)) as total,'+
                          ' if(t.tipocont in ("012","025","010","15","16"),0,if(abono is null,0,if(movimiento=11,0,abono))) as abono, round(t.Saldo) as saldo,if(movimiento=11,abono,0) as Descuento,'+
                          ' if(movimiento=11,"",pago) as Pago,if(movimiento=11,pago,"") as tipo,fechapago, costomensual'+
                          ' from ('+
                              'select ca.idcliente,'+ClienteNombre('c')+' as nombre,rm.p'+inttostr(mes)+',rm.r'+inttostr(mes)+','+
                              ' p.estatus,pc1.idpago,cat.idgiro,c.tipocont,cancelado,nueva,ca.idcategoria,p.idfactura,'+
                              ' round(cat.costomensual*(1+(select valor from configuraciones where concepto="IVA"))) as costomensual,'+
                              ' round(if((select costo*(p.piva+1) from DetPedido '+
                              ' where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido) is null,'+
                              ' (cat.costomensual*(1+(select valor from configuraciones where concepto="IVA"))),'+
                              ' (select costo*(p.piva+1) from DetPedido where idpedido=p.idpedido and cod_cve="MON'+mesnum+
                              '" group by idpedido)),2) as total,pc2.movimiento,';
                             { if ano>'2008' then
                                _sql:=_sql+'round(if(ca.tipocont="012",(select costo*(p.piva+1) from DetPedido '+
                                    'where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido), pc2.abono),2) as abono,pc1.restante as saldo,'
                              else
                                _sql:=_sql+'sum(round(if(ca.tipocont="012",(select costo*(p.piva+1) from DetPedido '+
                                    'where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido), pc2.abono),2)) as abono,sum(pc1.restante) as saldo,';}
                              if ano>'2008' then
                                  _sql:=_sql+'round(if(pc1.restante=0,(select costo*(p.piva+1) from DetPedido where idpedido=p.idpedido '+
                                        ' and cod_cve="MON'+mesnum+'" group by idpedido),	pc2.abono/(select count(cod_cve) '+
                                        ' from DetPedido where idpedido=p.idpedido)),2) as abono,pc1.restante as saldo,'
                              else
                                  _sql:=_sql+'sum(round(if(ca.tipocont="012",(select costo*(p.piva+1) from DetPedido '+
                                        'where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido), pc2.abono),2)) as abono,sum(pc1.restante) as saldo,';
                              _sql:=_sql+'pc2.TipoPago as Pago, p.anualidad,'+
                              '	case when month(pc2.fechaalta)=1 then concat("ENE",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=2 then concat("FEB",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=3 then concat("MAR",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=4 then concat("ABR",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=5 then concat("MAY",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=6 then concat("JUN",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=7 then concat("JUL",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=8 then concat("AGO",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=9 then concat("SEP",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=10 then concat("OCT",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=11 then concat("NOV",right(year(pc2.fechaalta),2))'+
                              ' when month(pc2.fechaalta)=12 then concat("DIC",right(year(pc2.fechaalta),2)) end as fechapago '+
                              ' from cuentasActivas ca left join RemiMon rm on  rm.idcliente=ca.idcliente and anio='+ano+
                              ' left join clientes c on ca.idcliente=c.idcliente left join categorias cat on c.idcategoria=cat.idcategoria'+
                              ' left join pedidos p on p.idpedido=rm.p'+inttostr(mes)+
                              ' left join PagosClientes pc1 on pc1.idpedido=rm.p'+inttostr(mes)+' and pc1.movimiento in (0)'+
                              ' left join PagosClientes pc2 on pc2.idpedido=rm.p'+inttostr(mes)+' and pc2.movimiento in (2,8,10,11)'+
                              ' where ca.idcliente<>"10000" and ca.idcliente>='+ctaini+' and ca.idcliente<='+ctafin+' and ca.mes='+
                              inttostr(mes)+' and ano='+ano+' and anio='+ano;
                              //si quiere ver solo cuentas nuevas
                              if(nuevas='1')then
                                 _sql:=_sql+' and ca.nueva=1 ';
                              //si quiere ver solo cuentas que cancelaron
                              if(canceladas='1')then
                                 _sql:=_sql+' and ca.cancelado=1 ';

                              _sql:=_sql+' group by ca.idcliente) as t'+
                          ' left join contratos con on t.tipocont=con.tipocont'+
                          ' left join clientesCompartido  '+
                          ' cc on (cc.idcliente = t.idcliente) group by t.idcliente) as tab';
             if(fechapago<>'')then
                _sql:=_sql + ' having fechapago = "'+UpperCase(fechapago)+'"';
             //giro
             if(UpperCase(giro)<>'TODOS') then
                condicion:='giro="'+giro+'"';
             //contrato
             if(UpperCase(contrato)<>'TODOS')then
                if(condicion<>'')then
                  condicion:=condicion+' and contrato="'+contrato+'"'
                else
                  condicion:='contrato="'+contrato+'"';

             //descuentos
             if(UpperCase(descuentos)<>'TODOS')then
                if(condicion<>'')then
                  condicion:=condicion+' and tipo="'+descuentos+'"'
                else
                  condicion:='tipo="'+descuentos+'"';
             //descuentos
             if(UpperCase(pagos)<>'TODOS')then
             begin
                if(pagos='CAJ') then
                  pagos:='pago in ("CH","CA","EF","TA","AT","NC")';
                if(pagos='BAN') then
                  pagos:='pago in ("BA","AE","SA","BM","BC","SB","BN")';
                if(pagos='CAU') then
                  pagos:='pago in ("CB","CD")';
                if(pagos='CAM') then
                  pagos:='pago in ("CM")';

                if(condicion<>'')then
                  condicion:=condicion+' and '+pagos
                else
                  condicion:= pagos;
             end;

             //condicion
             if(condicion<>'')then
                _sql:=_sql+' where '+condicion;

             querys(_sql, 0, sqlgeneral);
             querys('select contrato,' +
                    'if(contrato like "%anual%",sum(numcom)+sum(numres),0) as anuales,' +
                    'if(contrato like "%anual%",sum(numcom),0) as anualescom,' +
                    'if(contrato like "%anual%",sum(numres),0) as anualesres,' +
                    'if(contrato like "%cortesias%",sum(numcom)+sum(numres),0) as cortesias,' +
                    'if(contrato like "%cortesias%",sum(numcom),0) as cortesiascom,if(contrato like "%cortesias%",sum(numcom)*sum(costocom),0) as cortesiascoimp,' +
                    'if(contrato like "%cortesias%",sum(numres),0) as cortesiasres,if(contrato like "%cortesias%",sum(numres)*sum(costores),0) as cortesiasresimp,' +
                    'sum(cancom) cancom,sum(cancom)*sum(costocom) as cancomimp,sum(nuecom) as nuecom,sum(nuecom)*sum(costocom) as nuecomimp,' +
                    'sum(canres) as canres, sum(canres)*sum(costores) as canresimp,sum(nueres) as nueres,sum(nueres)*sum(costores) as nueresimp,' +
                    'sum(numcom) as numcom,round(sum(totalcom)) as totalcom, sum(numres) as numres, round(sum(totalres)) as totalres,sum(cancom)+sum(canres) as cancelados,' +
                    'sum(nuecom)+sum(nueres) as nuevos, sum(numcom)+sum(numres) as numero,' +
                    'round(sum(totalcom)+sum(totalres)) as total,sum(costocom) as costocom,sum(costores) as costores from ('+
                    'select contrato,if(giro="COM", can,0) as cancom,if(giro="COM", nueva,0) as nuecom, if(giro="COM", num,0) as numcom,if(giro="COM", total,0) as totalcom,'+
                    'if(giro="RES", can,0) as canres,if(giro="RES", nueva,0) as nueres,if(giro="RES", num,0) as numres,if(giro="RES", total,0) as totalres,'+
                    'if(giro="COM",costomensual,0) as costocom,if(giro="RES",costomensual,0) as costores from ('+resumenini+_sql+resumenfin+') as q) as qr group by contrato', 0, sqlgeneral2);
             querys(descuentoini+_sql+descuentofin, 0, sqlgeneral3);
             querys(pagoini+_sql+pagofin, 0, sqlgeneral4);
             _sql:='select if('+mesnum+'=id and ano='+ano+',"1",if(id<'+mesnum+',0,if(ano<'+ano+',0,2))) as grupo,id,mes,ano,count(Cuenta) as cuentas,'+
                    'sum(total) as cargo,sum(if(Descuento is null,0,Descuento)) as Descuento,sum(if(abono is null,0,abono)) as abono,'+
                    ' sum(if(saldo is null,0,saldo)) as restante from ('+
                    ' select  t.idcliente as Cuenta,if(t.tipocont in ("012","025","010","15","16"),0,if(total is null,0,total)) as total,'+
                    ' if(t.tipocont in ("012","025","010","15","16"),0,if(abono is null,0,if(movimiento=11,0,abono))) as abono,round(t.Saldo) as saldo,'+
                    'if(movimiento=11,abono,0) as Descuento,if(movimiento=11,"",pago) as Pago,if(movimiento=11,pago,"") as tipo,mes,ano,id'+
                    ' from ('+
                            'select ca.idcliente,p.estatus,p.idfactura,c.tipocont,'+
                            'round(if(round((select costo*(p.piva+1) from DetPedido where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido),2) is null,' +
                            '(cat.costomensual*(1+(select valor from configuraciones where concepto ="IVA"))),' +
                            '(select costo*(p.piva+1) from DetPedido where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido)),2) as total,';
                        if ano>'2008' then
                            _sql:=_sql+'round(if(pc1.restante=0,(select costo*(p.piva+1) from DetPedido where idpedido=p.idpedido '+
                                  ' and cod_cve="MON'+mesnum+'" group by idpedido),	pc2.abono/(select count(cod_cve) '+
                                  ' from DetPedido where idpedido=p.idpedido)),2) as abono,pc1.restante as saldo, ';
                        {else
                            _sql:=_sql+'sum(round(if(ca.tipocont in ("012","025","010","15","16"),(select costo*(p.piva+1) from DetPedido '+
                                  'where idpedido=p.idpedido and cod_cve="MON'+mesnum+'" group by idpedido), pc2.abono),2)) as abono,sum(pc1.restante) as saldo,';
                         }
                            _sql:=_sql+'pc2.TipoPago as Pago, p.anualidad,pc2.movimiento,'+
                            ' case 1 when month(pc2.fechaalta)=1 then "Enero" when month(pc2.fechaalta)=2 then "Febrero"'+
                            ' when month(pc2.fechaalta)=3 then "Marzo" when month(pc2.fechaalta)=4 then "Abril"'+
                            ' when month(pc2.fechaalta)=5 then "Mayo" when month(pc2.fechaalta)=6 then "Junio"'+
                            ' when month(pc2.fechaalta)=7 then "Julio" when month(pc2.fechaalta)=8 then "Agosto"'+
                            ' when month(pc2.fechaalta)=9 then "Septiembre" when month(pc2.fechaalta)=10 then "Octubre"'+
                            ' when month(pc2.fechaalta)=11 then "Noviembre" when month(pc2.fechaalta)=12 then "Diciembre"'+
                            ' when month(pc2.fechaalta) is null then "Ctas x Cobrar" end as mes,if(month(pc2.fechaalta) is null,13,month(pc2.fechaalta)) as id,'+
                            ' if(year(pc2.fechaalta) is null,year(curdate()),year(pc2.fechaalta)) as ano,'+
                            ' g.nombre as giro, con.nombre as contrato, '+
                            'case when month(pc2.fechaalta)=1 then concat("ENE",right(year(pc2.fechaalta),2)) ' +
                            'when month(pc2.fechaalta)=2 then concat("FEB",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=3 then concat("MAR",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=4 then concat("ABR",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=5 then concat("MAY",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=6 then concat("JUN",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=7 then concat("JUL",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=8 then concat("AGO",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=9 then concat("SEP",right(year(pc2.fechaalta),2)) ' + 
                            'when month(pc2.fechaalta)=10 then concat("OCT",right(year(pc2.fechaalta),2)) ' +
                            'when month(pc2.fechaalta)=11 then concat("NOV",right(year(pc2.fechaalta),2)) ' +
                            'when month(pc2.fechaalta)=12 then concat("DIC",right(year(pc2.fechaalta),2)) end as fechapago ' +
                            ' from cuentasActivas ca left join clientes c on c.idcliente=ca.idcliente '+
                            ' left join categorias cat on cat.idcategoria=c.idcategoria'+
                            ' left join giros g on c.idgiro=g.idgiro left join contratos con on con.tipocont=c.tipocont'+
                            ' left join RemiMon rm on rm.idcliente=ca.idcliente and anio='+ano+' left join pedidos p on p.idpedido=rm.p'+inttostr(mes)+
                            ' left join PagosClientes pc1 on pc1.idpedido=rm.p'+inttostr(mes)+' and pc1.movimiento in (0) left '+
                            ' join PagosClientes pc2 on pc2.idpedido=rm.p'+inttostr(mes)+' and pc2.movimiento in (2,8,10,11)'+
                            ' where ca.idcliente<>"10000" and ca.idcliente>='+ctaini+' and ca.idcliente<='+ctafin+
                            ' and ca.mes='+inttostr(mes)+' and ano='+ano+' and anio='+ano+' and c.tipocont not in("004","012","025","010","15","16")';
                    //si quiere ver solo cuentas nuevas
                    //if(nuevas='1')then
                      //_sql:=_sql+' and ca.nueva=1 '
                    //else
                      //_sql:=_sql+' and ca.nueva=0 ';
                    //si quiere ver solo cuentas que cancelaron
                    if(canceladas='1')then
                      _sql:=_sql+' and ca.cancelado=1'
                    else
                      _sql:=_sql+' and ca.cancelado in (0,1)';

                    _sql:=_sql+' group by ca.idcliente';
                    if(fechapago<>'')then
                      _sql:= _sql + ' having fechapago="'+UpperCase(fechapago)+'") as t'
                    else
                      _sql := _sql + ' ) as t';

             //giro
             condicion:='';
             if(UpperCase(giro)<>'TODOS') then
                condicion:='giro="'+giro+'"';
             //contrato
             if(UpperCase(contrato)<>'TODOS')then
                if(condicion<>'')then
                  condicion:=condicion+' and contrato="'+contrato+'"'
                else
                  condicion:='contrato="'+contrato+'"';

             //descuentos
             if(UpperCase(descuentos)<>'TODOS')then
                if(condicion<>'')then
                  condicion:=condicion+' and pago="'+descuentos+'"'
                else
                  condicion:='pago="'+descuentos+'"';
             //descuentos
             if(UpperCase(pagos)<>'TODOS')then
             begin
                if(pagos='CAJ') then
                  pagos:='pago in ("CH","CA","EF","TA","AT","NC")';
                if(pagos='BAN') then
                  pagos:='pago in ("BA","AE","SA","BM","BC","SB","BN")';
                if(pagos='CAU') then
                  pagos:='pago in ("CB","CD")';
                if(pagos='CAM') then
                  pagos:='pago in ("CM")';

                if(condicion<>'')then
                  condicion:=condicion+' and '+pagos
                else
                  condicion:= pagos;
             end;
             if(condicion<>'')then
                _sql:=_sql+' where '+condicion+' group by t.idcliente) as tab group by ano,id'
             else
                _sql:=_sql+'  group by t.idcliente) as tab group by ano,id';

             //resumen de abonos por mes
             querys(_sql,0,sqlgeneral5);
            // fecha:=encodedate(StrToInt(ano),mes,1);
            { _sql:='select "Pagos del Mes en Curso" as concepto,count(idcliente) numero,round(sum(abono)) abono from ('+
                    ' select p.idcliente,cargo,movimiento,Concepto, '+
                    ' round(pc.abono/(select count(cod_cve)  from DetPedido where idpedido=p.idpedido),2)'+
                    ' abono,restante,cod_cve from PagosClientes pc '+
                    ' left join pedidos p on p.idpedido = pc.idpedido '+
                    ' left join DetPedido dp on dp.idpedido = p.idpedido '+
                    ' left join clientes c on c.idcliente=p.idcliente '+
                    ' where c.TipoCont not in("012","025","010","15","16") and pc.fechaalta BETWEEN "'+ano+'-'+inttostr(mes)+'-01" '+
                    ' and "'+DateToStr(encodedate(StrToInt(ano),mes,daysinmonth(fecha)))+
                    '" and movimiento in (2,8, 10) and p.idUnidadNegocio=4 and dp.cod_cve="MON'+mesnum+'" '+
                    ' GROUP BY p.idpedido) as t '+
                    ' union select "Pagos Atrasados" as concepto,count(idcliente),round(sum(abono)) from ('+
                    ' select p.idcliente,cargo,movimiento,Concepto,'+
                    ' round(pc.abono/(select count(cod_cve)  from DetPedido where idpedido=p.idpedido),2)'+
                    ' abono,restante,cod_cve '+
                    ' from PagosClientes pc left join pedidos p on p.idpedido = pc.idpedido'+
                    ' left join DetPedido dp on dp.idpedido = p.idpedido '+
                    ' where pc.fechaalta BETWEEN "'+ano+'-'+inttostr(mes)+'-01" and "'+
                    DateToStr(encodedate(StrToInt(ano),mes,daysinmonth(fecha)))+
                    '" and movimiento in (2,8, 10) and p.idUnidadNegocio=4 and dp.cod_cve<>"MON'+mesnum+'"'+ ' GROUP BY p.idpedido) as t';}
             _sql := 'select if(tipo=1,"Pagos del Mes","Pagos fuera del mes") as tipo,count(idcliente) as cuentas, sum(total) from (' +
                     'SELECT if(dp.cod_cve="MON'+mesnum+'","1","2") as tipo,u.idusuario,a.inventariable,dp.id,p.idcliente,dp.idpedido,'+
                     'pc.idremicion,p.idfactura,l.nombre,a.moneda,  ' + #13#10 +
                     'if((truncate(((dp.costo*dp.tc)*(1+ p.piva))*dp.cant,3) > p.TotMn),p.TotMn,(truncate(((dp.costo*dp.tc)*(1+ p.piva))*dp.cant,3))) as TOTAL,  ' + #13#10 +
                     'if((round(((((dp.costo*dp.tc)*(1+ p.piva))*dp.cant)*100)/p.TotMn,2)) > 100,100,(round(((((dp.costo*dp.tc)*(1+ p.piva))*dp.cant)*100)/p.TotMn,2))) as Porcentaje,  ' + #13#10 +
                     'p.TotMn,pc.FechaAlta ' + #13#10 +
                     'FROM DetPedido as dp ' + #13#10 +
                     'LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) ' + #13#10 +
                     'LEFT JOIN articulos as a oN (a.cod_cve=dp.cod_cve) ' + #13#10 +
                     'LEFT JOIN lineas as l ON (l.idlinea=a.idlinea)   ' + #13#10 +
                     'LEFT JOIN RemiFact as rm ON (rm.idpedido=dp.idpedido) ' + #13#10 +
                     'LEFT JOIN PagosClientes as pc ON (pc.idpedido = dp.idpedido)   ' + #13#10 +
                     'LEFT JOIN clientes as c ON (p.idcliente=c.idcliente)   ' + #13#10 +
                     'LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario)   ' + #13#10 +
                     'LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser)   ' + #13#10 +
                     'WHERE pc.FechaAlta between "2010-09-01" and "2010-09-20" and p.estatus in(3,4,6) and pc.movimiento in(0,2) and dp.cod_cve="MON'+mesnum+'"   ' + #13#10 +
                     'and pc.TipoCobro =0 and pc.abono > 0  and l.nombre="MONITOREO"' + #13#10 +
                     'GROUP BY l.nombre,dp.idpedido,u.idusuario ' + #13#10 +
                     'having porcentaje=100.00' + #13#10 +
                     'UNION all' + #13#10 +
                     'SELECT if(dp.cod_cve="MON'+mesnum+'","1","2") as tipo,u.idusuario,a.inventariable,dp.id,p.idcliente,dp.idpedido,pc.idremicion, '+
                     'p.idfactura,l.nombre,a.moneda,if((truncate(((dp.costo*dp.tc)*(1+ p.piva))*dp.cant,3)>p.TotMn),p.TotMn,(truncate(((dp.costo*dp.tc)*(1+ p.piva))*dp.cant,3)) ) as TOTAL,  ' + #13#10 +
                     'if((round(((((dp.costo*dp.tc)*(1+ p.piva))*dp.cant)*100)/p.TotMn,2)) > 100,100,(round(((((dp.costo*dp.tc)*(1+ p.piva))*dp.cant)*100)/p.TotMn,2))) as Porcentaje,' + #13#10 +
                     'p.TotMn,pc.FechaAlta' + #13#10 +
                     'FROM DetPedido as dp ' + #13#10 +
                     'LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) ' + #13#10 +
                     'LEFT JOIN articulos as a ON (a.cod_cve=dp.cod_cve) ' + #13#10 +
                     'LEFT JOIN lineas as l ON (l.idlinea=a.idlinea)   '+
                     'LEFT JOIN RemiFact as rm ON (rm.idpedido=dp.idpedido)   ' + #13#10 +
                     'LEFT JOIN PagosClientes as pc ON (pc.idpedido = dp.idpedido) ' + #13#10 +
                     'LEFT JOIN clientes as c ON (p.idcliente=c.idcliente)   ' + #13#10 +
                     'LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) ' + #13#10 +
                     'LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser)   ' + #13#10 +
                     'WHERE pc.FechaAlta between "2010-08-31" and "2010-09-20" and p.estatus in(3,4,6) and pc.movimiento =2 AND dp.cod_cve="MON'+mesnum+'"' + #13#10 +
                     'and pc.TipoCobro =1 and pc.abono > 0  and l.nombre="MONITOREO"' + #13#10 +
                     'GROUP BY l.nombre,dp.idpedido,u.idusuario ' + #13#10 +
                     'having porcentaje=100.00' + #13#10 +
                     'ORDER BY idpedido' + #13#10 +
                     ') as t group by tipo';
             querys(_sql,0,sqlgeneral6);
             if(sqlgeneral.RecordCount > 0) then
               operacionreporte('RepCuentasRemisionadasSaldadas', 'REPORTE DE REMISIONES SALDADAS', tipoimpresion, 1)
             else
               Application.MessageBox('No existen datos a mostrar!','Atencion',MB_OK);
         end
         else
            Application.MessageBox('No esta generado ese mes del año!','Atencion',MB_OK);
      end
      else if estatus=3 then
      begin
         querys('select * from RepRemisionesMensuales where periodo="'+meses[mes+1]+'-'+ano+'"',0,sqlgeneral);
         operacionreporte('RepCuentasRemisionadasHistorico','HISTORICO DE REMISIONES MESUALES',tipoimpresion,1);
      end
      else
      begin
         {################# Reporte del concentrado Anual #################}
         querys('DROP TABLE IF EXISTS tempRemisiones'+frmprincipal.idmaq,1,sqlgeneral);
         querys('create table tempRemisiones'+frmprincipal.idmaq+' (id integer(11),Concepto varchar(25),Enero integer(11) default 0,'+
                'Febrero integer(11) default 0,Marzo integer(11)default 0,Abril integer(11) default 0,'+
                'Mayo integer(11) default 0,Junio integer(11) default 0,Julio integer(11) default 0,Agosto integer(11) default 0,'+
                'Septiembre integer(11) default 0,Octubre integer(11) default 0,Noviembre integer(11) default 0,'+
                'Diciembre integer(11) default 0,Total float(10))',1,sqlgeneral);
         querys('select count(idcliente) as clientes,sum(totmn) as cargo,sum(abono) as abonos,sum(descuento) as '+
                ' descuento,sum(restante) as restante, mes from (select ped.idcliente,pedido,p.totmn,'+
                ' sum(if(pc.movimiento<>11,abono,0)) as abono, sum(if(pc.movimiento=11,abono,0)) as descuento,'+
                ' sum(restante) as restante,mes from (select ca.idcliente,case 1 when mes=1 then rm.p1'+
                ' when mes=2 then rm.p2 when mes=3 then rm.p3 when mes=4 then rm.p4 when mes=5 then rm.p5'+
                ' when mes=6 then rm.p6 when mes=7 then rm.p7 when mes=8 then rm.p8 when mes=9 then rm.p9'+
                ' when mes=10 then rm.p10 when mes=11 then rm.p11 when mes=12 then rm.p12 end as pedido,mes'+
                ' from cuentasActivas ca left join RemiMon rm using(idcliente) where ano='+ano+' and anio='+ano+
                ' ) as ped left join PagosClientes '+
                ' pc on ped.pedido=pc.idpedido and movimiento in (0,2,8,10,11) left join pedidos p on '+
                ' p.idpedido=ped.pedido where ped.idcliente<>10000 '+
                ' group by pedido,idcliente,mes order by idcliente, mes) as t group by mes',0,sqlgeneral);
         nomeses:=sqlgeneral.RecordCount;
         querys('insert into tempRemisiones'+frmprincipal.idmaq+' (id,concepto) values (1,"Clientes")',1,sqlgeneral2);
         querys('insert into tempRemisiones'+frmprincipal.idmaq+' (id,concepto) values (2,"Cargo")',1,sqlgeneral2);
         querys('insert into tempRemisiones'+frmprincipal.idmaq+' (id,concepto) values (3,"Abono")',1,sqlgeneral2);
         querys('insert into tempRemisiones'+frmprincipal.idmaq+' (id,concepto) values (4,"Descuento")',1,sqlgeneral2);
         querys('insert into tempRemisiones'+frmprincipal.idmaq+' (id,concepto) values (5,"Restante")',1,sqlgeneral2);
         querys('insert into tempRemisiones'+frmprincipal.idmaq+' (id,concepto) values (6,"Cuentas Restantes")',1,sqlgeneral2);
         querys('describe tempRemisiones'+frmprincipal.idmaq,1,sqlgeneral3);
         sqlgeneral3.First; sqlgeneral3.Next; sqlgeneral3.Next;
         while not sqlgeneral.Eof do
         begin
            for x := 0 to 4 do
            begin
               querys('update tempRemisiones'+frmprincipal.idmaq+' set '+sqlgeneral3.fieldbyname('Field').asstring+'='+
               sqlgeneral.Fields.Fields[x].AsString+' where id='+inttostr(x+1),1,sqlgeneral2);
            end;
            sqlgeneral3.Next;
            sqlgeneral.next;
         end;
         querys('select count(idcliente) as clientes,sum(restante) as restante, mes from ('+
                ' select ped.idcliente,pedido,p.totmn, sum(if(pc.movimiento<>11,abono,0)) as abono,'+
                ' sum(if(pc.movimiento=11,abono,0)) as descuento, sum(restante) as restante,mes from ('+
                ' select ca.idcliente,case 1 when mes=1 then rm.p1 when mes=2 then rm.p2 when mes=3 then rm.p3 '+
                ' when mes=4 then rm.p4 when mes=5 then rm.p5 when mes=6 then rm.p6 when mes=7 then rm.p7 '+
                ' when mes=8 then rm.p8 when mes=9 then rm.p9 when mes=10 then rm.p10 when mes=11 then rm.p11'+
                ' when mes=12 then rm.p12 end as pedido,mes from cuentasActivas ca left join RemiMon rm using(idcliente)'+
                ' ) as ped left join PagosClientes  pc on ped.pedido=pc.idpedido and movimiento in (0,2,8,10,11)'+
                ' left join pedidos p on  p.idpedido=ped.pedido where ped.idcliente<>10000 '+
                ' group by pedido,idcliente,mes having restante>0 order by idcliente, mes ) as t group by mes',0,sqlgeneral);
         sqlgeneral.First; sqlgeneral3.First; sqlgeneral3.Next; sqlgeneral3.Next;
         while not sqlgeneral.Eof do
         begin
            querys('update tempRemisiones'+frmprincipal.idmaq+' set '+sqlgeneral3.fieldbyname('Field').asstring+'='+
            sqlgeneral.fieldbyname('clientes').asstring+' where id=6',1,sqlgeneral2);
            sqlgeneral3.next;
            sqlgeneral.Next;
         end;
         total:=0;
         querys('select * from tempRemisiones'+frmprincipal.idmaq,1,sqlgeneral);
         sqlgeneral.First;
         while not sqlgeneral.Eof do
         begin
            for x:=2 to 12 do
            begin
               total:=total+sqlgeneral.Fields.Fields[x].AsInteger;
            end;
            if total > 0 then
              promedio:=total/nomeses
            else
              promedio:= 0;
            if sqlgeneral.RecNo=1  then
               querys('update tempRemisiones'+frmprincipal.idmaq+' set total='+Format('%8.2f',[promedio])+
               ' where id='+inttostr(sqlgeneral.RecNo),1,sqlgeneral2)
            else
               querys('update tempRemisiones'+frmprincipal.idmaq+' set total='+inttostr(total)+
               ' where id='+inttostr(sqlgeneral.RecNo),1,sqlgeneral2);
            total:=0;
            sqlgeneral.Next;
         end;
         querys('select * from tempRemisiones'+frmprincipal.idmaq,0,sqlgeneral);
         if estatus=1 then
            operacionreporte('RepCuentasRemisionadasconcentrado','CONCENTRADO DE REMISIONES MESUALES',tipoimpresion,1);
         if estatus=2 then
         begin
            if querys('select * from RepRemisionesMensuales where periodo="'+meses[mes+1]+'-'+ano+'"',0,sqlgeneral2)>0 then
            begin
               application.MessageBox('El Mes ya esta generado!!','AVISO',MB_OK+MB_ICONINFORMATION);
            end
            else
            begin
               if application.MessageBox(pchar('Esta seguro de generar reporte Remisiones Mensuales Historico del año '+ano+
               ' del mes '+meses[mes+1]+' ?, no podra hacer cambios posteriores!'),'Confirmación',MB_YESNO+MB_ICONWARNING) = idyes then
               begin
                  querys('insert into RepRemisionesMensuales select "'+meses[mes+1]+'-'+ano+'" as periodo,concepto,enero,febrero,marzo,abril,'+
                  ' mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre,total from tempRemisiones'+frmprincipal.idmaq,1,sqlgeneral);
                  application.MessageBox('Generado con exito!','Información',MB_ICONINFORMATION);
               end;
            end;
         end;
         querys('DROP TABLE IF EXISTS tempRemisiones'+frmprincipal.idmaq,1,sqlgeneral);
      end;
   end;
end;

procedure saldosmorosos;
begin
   querys(' select c.idcliente,'+ClienteNombre('c')+' as cliente,sum(p.totmn) as saldo, max(pc.fechavence) as fecha'+
          ' from clientes c left join pedidos p using(idcliente)'+
          ' left join PagosClientes pc on pc.idpedido=p.idpedido '+
          ' where c.tipocont="mor" and p.estatus in (5) and pc.tipopago="MOR"'+
          ' group by idcliente',0,dmreportes.sqlgeneral);
   OperacionReporte('SaldosMorosos','Reporte de Saldos Morosos','IMP',1);
end;

procedure RepCobranzaXVencer;
var fecha1,fecha2, dia1:string;  sqlgeneral:TMyQuery; //, dia2
begin     //esta tambien en reporteador

sqlgeneral := TMyQuery.Create(nil);
sqlgeneral.Connection := DMAccesos.conexion;
//dias restantes del mes actual menos uno
dia1 := inttostr((DaysInAMonth(yearof(today), monthof(today))- 1)  - dayof(today));


fecha1:=datetostr(now+1);
fecha2:=datetostr(now+strtoint(dia1));

//elimina tablas temporales
querys('DROP TABLE IF EXISTS tmpSecXVen'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS tmpSecXVen0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('CREATE TABLE tmpSecXVen'+frmprincipal.idmaq+' (idcliente integer(11),saldo float default 0, '+
       'condicion1 float default 0, '+
       'dias integer(11),tipo varchar(15),EstatusInstalacion varchar(50),nombre varchar(254), '+
       'contrato varchar(100),KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);



querys('create table tmpSecXVen0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
        '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta,pc.restante,pc.FechaVence '+
        'FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c '+
        'ON c.idcliente=pc.idcliente LEFT JOIN sectores as s ON s.idsector=c.sector LEFT JOIN contratos as con ON '+
        'c.TipoCont=con.TipoCont WHERE pc.FechaVence BETWEEN  "'+fecha1+'" AND "'+fecha2+'" and p.estatus in(3,4,6) AND '+
        'restante > 0.9 and pc.movimiento IN(0,1) '+
        'and c.idabogado <> ""',1,dmaccesos.sqlgeneral);

//Despues insertamos los demas
querys('insert into tmpSecXVen0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,'+
       '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta,pc.restante ,pc.FechaVence '+
       'FROM PagosClientes as pc left join pedidos as p ON p.idpedido=pc.idpedido LEFT JOIN clientes as c ON c.idcliente = '+
       'pc.idcliente LEFT JOIN  contratos as con ON c.TipoCont=con.TipoCont LEFT JOIN sectores as s ON (s.idsector=c.sector) '+
       'WHERE pc.FechaVence BETWEEN  "'+fecha1+'" AND "'+fecha2+'" and p.estatus in(3,4,6) AND restante > 0.9 and pc.movimiento '+
       'IN(0,1) '+
       'and con.estatus in (0,1) and c.idabogado = 0 GROUP BY pc.idpago',1,dmaccesos.sqlgeneral);

querys('Create Index idpago on tmpSecXVen0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
querys('Create Index idpedido on tmpSecXVen0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);


///*borrar cuentas que tienen parcialidades
with dmreportes do
  begin
  querys('DELETE tmpSecXVen0'+frmprincipal.idmaq+' FROM tmpSecXVen0'+frmprincipal.idmaq+' inner join PagosClientes '+
         'ON(tmpSecXVen0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) where  tmpSecXVen0'+frmprincipal.idmaq+
         '.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral2);

  querys('INSERT INTO tmpSecXVen'+frmprincipal.idmaq+' Select t.cuenta,round(Sum(restante),2) AS saldo, '+
         'round(Sum(restante),2) as condicion1, '+
         'to_days(FechaVence)-to_days("'+datetostr(date)+'") as dias, if (c.bloqueado=0,"N","B") as tipo, '+
         'case i.EstatusInst when 0 then "PENDI" when 1 then "INSTA" when 2 then "SUPER" when 4 then "UBICA" when 5 then "CUESTI" '+
         'when 7 then "CANCE" else "" end AS EstatusInstalacion, cf.NombreCres,con.nombre  '+
         'from tmpSecXVen0'+frmprincipal.idmaq+' as t left join clientes as c on c.idcliente=t.cuenta left join contratos as con on '+
         'con.TipoCont=c.TipoCont left join instalaciones as i on t.idpedido=i.idpedido left join ClientesFact as cf on '+
         'cf.idfact=c.idfact group by idpago',1,sqlgeneral2);

//inserta lo que falta de DESGLOSADO CUENTAS
querys('Insert into CobranzaXVencer (tipo, sector, ano, mes, clasificacion, id, concepto) '+
       'select "DESGLOSADO" as tipo, idsector,  year(curdate()) as ano, "'+meses[monthof(today)]+'" as mes, 0 as clasificacion, 1 as id, '+
       '"CUENTAS" as concepto from (select idsector from sectores) as s where idsector not in (select sector from '+
       'CobranzaXVencer where ano = year(curdate()) and mes = "'+meses[monthof(today)]+'" and clasificacion =0  and id = 1) ', 1, sqlgeneral5);

//inserta lo que falta de DESGLOSADO SALDOS
querys('Insert into CobranzaXVencer (tipo, sector, ano, mes, clasificacion, id, concepto) '+
       'select "DESGLOSADO" as tipo, idsector,  year(curdate()) as ano, "'+meses[monthof(today)]+'" as mes, 0 as clasificacion, 2 as id, '+
       '"SALDO" as concepto from (select idsector from sectores) as s where idsector not in (select sector from '+
       'CobranzaXVencer where ano = year(curdate()) and mes = "'+meses[monthof(today)]+'" and clasificacion =0  and id = 2) ', 1, sqlgeneral5);

//inserta lo que falta de CONSOLIDADO CUENTAS
querys('Insert into CobranzaXVencer (tipo, sector, ano, mes, clasificacion, id, concepto) '+
       'select "CONSOLIDADO" as tipo, idsector,  year(curdate()) as ano, "'+meses[monthof(today)]+'" as mes, 0 as clasificacion, 1 as id, '+
       '"CUENTAS" as concepto from (select 0 as idsector) as s where idsector not in (select sector from '+
       'CobranzaXVencer where ano = year(curdate()) and mes = "'+meses[monthof(today)]+'" and clasificacion =0  and id = 1) ', 1, sqlgeneral5);

//inserta lo que falta de CONSOLIDADO SALDOS
querys('Insert into CobranzaXVencer (tipo, sector, ano, mes, clasificacion, id, concepto) '+
       'select "CONSOLIDADO" as tipo, idsector,  year(curdate()) as ano, "'+meses[monthof(today)]+'" as mes, 0 as clasificacion, 2 as id, '+
       '"SALDO" as concepto from (select 0 as idsector) as s where idsector not in (select sector from '+
       'CobranzaXVencer where ano = year(curdate()) and mes = "'+meses[monthof(today)]+'" and clasificacion =0  and id = 2) ', 1, sqlgeneral5);

querys('select "DESGLOSADO" as tipo, sector, s1 as tot, year(curdate()) as ano, "'+meses[monthof(today)]+'" as mes, day(curdate()) as dia, '+
       'clasificacion, id, concepto from ( '+
       'select round(sum(condicion1),2) as s1, c.sector, 2 as id, "SALDO" as concepto, 0  as clasificacion '+
       'from tmpSecXVen'+frmprincipal.idmaq+' t left join clientes c on c.idcliente=t.idcliente group by sector '+
       'union '+
       'select count(t.idcliente ) as c1, c.sector, 1 as id, "CUENTAS" as concepto, 0 as clasificacion '+
       'from (select distinct idcliente from tmpSecXVen'+frmprincipal.idmaq+' where condicion1 <> 0) as t left join clientes c '+
       'on c.idcliente=t.idcliente group by sector  '+
       ') as des '+
       'UNION '+
       'select "CONSOLIDADO" as tipo, 0 as sector, s1 as tot, year(curdate()) as ano, "'+meses[monthof(today)]+'" as mes, day(curdate()) as dia, '+
       'clasificacion, id, concepto from ( '+
       'select round(sum(condicion1),2) as s1, c.sector, 2 as id, "SALDO" as concepto, 0  as clasificacion '+
       'from tmpSecXVen'+frmprincipal.idmaq+' t left join clientes c on c.idcliente=t.idcliente group by id '+
        'union '+
       'select count(t.idcliente ) as c1, c.sector, 1 as id, "CUENTAS" as concepto, 0 as clasificacion '+
       'from (select distinct idcliente from tmpSecXVen'+frmprincipal.idmaq+' where condicion1 <> 0) as t left join clientes c '+
       'on c.idcliente=t.idcliente group by id  '+
       ') as des ', 0, sqlgeneral8);

  sqlgeneral8.First;
  while not sqlgeneral8.Eof = true do
    begin
    querys('Update CobranzaXVencer set D'+inttostr(dayof(today))+' =  '+sqlgeneral8.fieldbyname('tot').AsString+
            ' where ano = '+sqlgeneral8.fieldbyname('ano').AsString+' and mes = "'+meses[monthof(today)]+'" and '+
            //'clasificacion ='+sqlgeneral8.fieldbyname('clasificacion').AsString+
            ' id = '+sqlgeneral8.fieldbyname('id').AsString+' and sector = '+sqlgeneral8.fieldbyname('sector').AsString, 1, sqlgeneral7);
    sqlgeneral8.Next;
    end;

  querys('Update CobranzaXVencer set total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31) ', 1, sqlgeneral7);

  querys('DROP TABLE IF EXISTS tmpSecXVen0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('DROP TABLE IF EXISTS tmpSecXVen'+frmprincipal.idmaq,1,sqlgeneral);
  end;//reportes
end;

procedure PagosFinMes(fecha:tdatetime);
var mes, ano:string;      //REPORTE PASADO A CIERRE DE PAGOS POR LINEA
begin
//////LLENA LOS PAGOS DEL ULTIMO DIA DE MES, SI ES ULTIMO DE MES
ano := inttostr(yearof(fecha));
mes := inttostr(monthof(fecha));
with dmreportes do
  begin
  if DaysInMonth(fecha) = dayof(fecha) then
    begin
    //llena la tabla con lo que falte
    querys('Insert into CobranzaPagos (tipo, sector, ano, clasificacion, id, concepto) '+
           'select "DESGLOSADO" as tipo, idsector,  '+ano+' as ano,  1 as clasificacion, 1 as id, "CUENTAS" as concepto '+
           'from (select idsector from sectores) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =1  and id = 1) '+
           'union '+
           'select "DESGLOSADO" as tipo, idsector,  '+ano+' as ano,  2 as clasificacion, 1 as id, "CUENTAS" as concepto '+
           'from (select idsector from sectores) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =2  and id = 1) '+
           'union '+
           'select "CONSOLIDADO" as tipo, idsector,  '+ano+' as ano,  1 as clasificacion, 1 as id, "CUENTAS" as concepto '+
           'from (select 0 as idsector) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =1  and id = 1) '+
           'union '+
           'select "CONSOLIDADO" as tipo, idsector,  '+ano+' as ano,  2 as clasificacion, 1 as id, "CUENTAS" as concepto '+
           'from (select 0 as idsector) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =2  and id = 1) '+
           'union '+
           'select "DESGLOSADO" as tipo, idsector,  '+ano+' as ano,  1 as clasificacion, 1 as id, "SALDO" as concepto '+
           'from (select idsector from sectores) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =1  and id = 1) '+
           'union '+
           'select "DESGLOSADO" as tipo, idsector,  '+ano+' as ano,  2 as clasificacion, 1 as id, "SALDO" as concepto '+
           'from (select idsector from sectores) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =2  and id = 1) '+
           'union '+
           'select "CONSOLIDADO" as tipo, idsector,  '+ano+' as ano,  1 as clasificacion, 1 as id, "SALDO" as concepto '+
           'from (select 0 as idsector) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =1  and id = 1) '+
           'union '+
           'select "CONSOLIDADO" as tipo, idsector,  '+ano+' as ano,  2 as clasificacion, 1 as id, "SALDO" as concepto '+
           'from (select 0 as idsector) as s where idsector not in ( '+
           'select sector from CobranzaPagos where ano = '+ano+' and clasificacion =2  and id = 1)', 1, sqlgeneral4);

    //actualiza los meses, correspondiente alos pagos del ultimo dia
    querys('update CobranzaPagos c, ( Select "CONSOLIDADO" as concepto, sector, 3, sum(abono) as total, clasificacion '+
           'from ( SELECT distinct rp.FechaAlta, pc.FechaVence, rp.idcliente, rp.abono, rp.idpedido, 0 as sector, '+
           'c.idabogado, if( to_days("'+datetostr(fecha)+'")-to_days(pc.FechaVence) < 60, 1, 2) as clasificacion, '+
           ' to_days("'+datetostr(fecha)+'")- to_days(pc.FechaVence) as rer FROM RepPagosXLinea rp left join PagosClientes pc '+
           'on pc.idpedido=rp.idpedido left join clientes c on c.idcliente = rp.idcliente where  rp.FechaAlta = "'+
           datetostr(fecha)+'" and pc.FechaVence < "'+datetostr(fecha)+'" ) as r group by clasificacion ) as  t '+
           'set c.M'+mes+' = t.total where c.ano = '+ano+'  and c.clasificacion =t.clasificacion and c.sector=t.sector '+
           'and c.concepto="SALDO"  and c.tipo = "CONSOLIDADO"', 1, sqlgeneral3);

    querys('update CobranzaPagos c, ( Select "DESGLOSADO", sector, 3, sum(abono) as total, clasificacion '+
           'from ( SELECT distinct rp.FechaAlta, pc.FechaVence, rp.idcliente, rp.abono, rp.idpedido, '+
           'if (c.idabogado =0, c.sector, "" ) as sector, c.idabogado, if (c.idabogado =0, if( to_days("'+
           datetostr(fecha)+'") - to_days(pc.FechaVence) < 60, 1, 2)  , "3" )  as clasificacion, to_days("'+
           datetostr(fecha)+'") - to_days(pc.FechaVence) as rer FROM RepPagosXLinea rp left join PagosClientes '+
           'pc on pc.idpedido=rp.idpedido left join clientes c on c.idcliente = rp.idcliente where  rp.FechaAlta = '+
           '"'+datetostr(fecha)+'" and pc.FechaVence < "'+datetostr(fecha)+'" ) as r group by clasificacion, sector '+
           ') as  t set c.M'+mes+' =  t.total where c.ano = '+ano+'  and c.clasificacion =t.clasificacion and c.sector= '+
           't.sector and c.concepto="SALDO"  and c.tipo = "DESGLOSADO" ', 1, sqlgeneral3);

    querys('update CobranzaPagos c, ( Select "CONSOLIDADO", sector, 4, count(idcliente) as total, clasificacion '+
           'from ( SELECT distinct rp.FechaAlta, pc.FechaVence, rp.idcliente, rp.abono, rp.idpedido, 0 as sector, '+
           'c.idabogado, if( to_days("'+datetostr(fecha)+'")-to_days(pc.FechaVence) < 60, 1, 2) as clasificacion, '+
           'to_days("'+datetostr(fecha)+'")- to_days(pc.FechaVence) as rer FROM RepPagosXLinea rp left join '+
           'PagosClientes pc on pc.idpedido=rp.idpedido left join clientes c on c.idcliente = rp.idcliente '+
           'where rp.FechaAlta = "'+datetostr(fecha)+'" and pc.FechaVence < "'+datetostr(fecha)+'" ) as r group by '+
           'clasificacion ) as  t set c.M'+mes+' =  t.total where c.ano = '+ano+'  and c.clasificacion =t.clasificacion '+
           'and c.sector=t.sector and c.concepto="CUENTAS"  and c.tipo = "CONSOLIDADO" ', 1, sqlgeneral3);

    querys('update CobranzaPagos c, ( Select "DESGLOSADO", sector, 4, count(idcliente) as total, clasificacion '+
           'from ( SELECT distinct rp.FechaAlta, pc.FechaVence, rp.idcliente, rp.abono, rp.idpedido, if(c.idabogado =0, '+
           'c.sector, "" ) as sector, c.idabogado, if (c.idabogado =0, if( to_days("'+datetostr(fecha)+'") - to_days( '+
           'pc.FechaVence) < 60, 1, 2)  , "3" )  as clasificacion, to_days("'+datetostr(fecha)+'")- to_days(pc.FechaVence) '+
           'as rer FROM RepPagosXLinea rp left join PagosClientes pc on pc.idpedido=rp.idpedido left join clientes c on '+
           'c.idcliente = rp.idcliente where  rp.FechaAlta = "'+datetostr(fecha)+'" and pc.FechaVence < "'+datetostr(fecha)+
           '" ) as r group by clasificacion, sector ) as  t set c.M'+mes+' =  t.total where c.ano = '+ano+'  and c.clasificacion '+
           '=t.clasificacion and c.sector=t.sector and c.concepto="CUENTAS"  and c.tipo = "DESGLOSADO" ', 1, sqlgeneral3);
    end;
  end;
end;

procedure pagosBanco(desde,hasta,tipoimpresion:string);
begin
   querys('	select pc.idcliente,idpedido,'+ClienteNombre('c')+' as nombre,sum(abono) as importe'+
          ' from PagosClientes pc left join clientes c using (idcliente)'+
	        ' where fechaalta between "'+desde+'" and "'+hasta+'" and tipopago="BA"'+
          ' group by idcliente order by idcliente',0,dmreportes.sqlgeneral);
   operacionreporte('pagosenbanco','',tipoimpresion,1);

end;

procedure TendenciaVendedoresTotales(mesr,anor:string;guardar, pormeses, totalesventas, totalescuentas, vendedores, novendedores:boolean; TipoImpresion:string);
var diaf,diai:integer; realizado:boolean;
TotDlls,TotCuentas:double;
fecha1,fecha2,mes,m,y,dia,condicion:string;
begin

fecha1 := formatdatetime('yyyy"/"mm"/"',now)+ '01';
mes := formatdatetime('mm',now);
diai := strtoint(formatdatetime('d',now));


condicion:='';
TotDlls := 0;
TotCuentas := 0;
m := inttostr(idmes(mesr));
y := anor;
//dia := formatdatetime('d',date);
dia := formatdatetime('d', strtodate(fecha1));
diaf:=DiasMes(m);

with dmreportes do
  begin
  if querys('Select mes FROM TendenciaVendedores WHERE mes = "'+mesr+'" '+
             'AND fecha ='+anor+' and fechaCierre<> "0000-00-00"', 0, sqlgeneral8) > 0 then
    realizado := true
  else
    realizado := false;

  if (guardar = true) and (realizado = true) then
    begin
    application.MessageBox('El cierre de este mes ya fue generado.', 'Aviso', MB_ICONINFORMATION);
    exit;
    end;

  if (realizado = true) and (guardar = false) and (pormeses) then
    begin
    querys('select sum(cn) as cn, sum(vd) as vd from ( '+
           'SELECT if(tipo ="CUENTAS NUEVAS", total, 0) as cn, if(tipo ="VENTAS DLLS", total, 0) as vd '+
           'FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" AND `TipoReporte` = 1 '+
           'AND concepto = "TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)" AND tipo in ("CUENTAS NUEVAS", '+
           '"VENTAS DLLS") ) as t ',0,sqlgeneral2);
    TotDlls := sqlgeneral2.fieldbyname('vd').AsFloat;
    TotCuentas := sqlgeneral2.fieldbyname('cn').AsFloat;

    querys('SELECT *,'+floattostr(TotDlls)+' as TotalDolares,'+floattostr(TotCuentas)+' as TotalCuentas '+
           'FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" and concepto is not null '+
           'and TipoReporte=1 and idsector < 101 and fechaCierre <> "0000-00-00" order by idsector,concepto,id',0,sqlgeneral2);

    querys('SELECT * FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" and TipoReporte = 1 '+
           'and concepto is not null and TipoReporte=1 and idsector between 101 and 200 and total > 0 '+
           'and fechaCierre <> "0000-00-00" order by idsector,concepto,id',0,sqlgeneral);


    if sqlgeneral2.RecordCount > 0 then
      begin
      if dmreportes.sqlgeneral.recordcount = 6 then // 6 son los registros que tiene por default y si solo tiene 6 es que ninguna venta por un no vendedor se ha realizado
        //querys('SELECT * FROM TendenciaVendedores WHERE mes = ''NO MOSTRARSE EN REPORTE'' ',0,sqlgeneral);
        querys('SELECT * FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" ',0,sqlgeneral);
      OperacionReporte('TendenciaVentasMes','Reporte de tendencia de vtas ('+datetostr(now)+')',TipoImpresion, 1)
      end
    else
      application.MessageBox('No hay datos!','Confirmación',mb_iconwarning);
    exit;
    end;
  realizado := false;
  if (realizado = false )  then
    begin

    if pormeses = true then
      begin
      if strtoint(m) > 9 then
        mes := m
      else
        mes := '0'+m;

      fecha1:=y+'/'+mes+'/'+'01';
      fecha2 := y+'/'+mes+'/'+ inttostr(diaf);

      querys('DELETE FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" and TipoReporte=1',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT ''EQUIPOS'',concat(ifnull(U.nombre," "),'' '',ifnull(U.apaterno,""),'' '',ifnull(U.amaterno,""),'' (Sec '',U.idsector,'')'') as completo,''1'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',idsector,1 FROM usuarios AS U  left join areas as a ON(a.idarea=U.idarea) '+
             ' left join puestos as p ON(p.idpuesto=U.idpuesto)  where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector >0 group by completo having  completo <> ''''',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT ''ENLACES'',concat(ifnull(U.nombre,""),'' '',ifnull(U.apaterno,""),'' '',ifnull(U.amaterno,""),'' (Sec '',U.idsector,'')'') as completo,''2'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',idsector,1 FROM usuarios AS U  left join areas as a ON(a.idarea=U.idarea)  '+
             ' left join puestos as p ON(p.idpuesto=U.idpuesto) where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector >0 group by completo having  completo <> ''''',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT ''CONEXIONES'',concat(ifnull(U.nombre,""),'' '',ifnull(U.apaterno,""),'' '',ifnull(U.amaterno,""),'' (Sec '',U.idsector,'')'') as completo,''3'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',idsector,1 FROM usuarios AS U  left join areas as a ON(a.idarea=U.idarea)  '+
             ' left join puestos as p ON(p.idpuesto=U.idpuesto) where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector >0 group by completo having  completo <> ''''',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT ''RECONEXIONES'',concat(ifnull(U.nombre,""),'' '',ifnull(U.apaterno,""),'' '',ifnull(U.amaterno,""),'' (Sec '',U.idsector,'')'') as completo,''4'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',idsector,1 FROM usuarios AS U  left join areas as a ON(a.idarea=U.idarea)  '+
           ' left join puestos as p ON(p.idpuesto=U.idpuesto) where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector >0 group by completo having  completo <> ''''',1,sqlgeneral);

      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT ''VENTAS DLLS'',concat(ifnull(U.nombre,""),'' '',ifnull(U.apaterno,""),'' '',ifnull(U.amaterno,""),'' (Sec '',U.idsector,'')'') as completo,''6'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',idsector,1 FROM usuarios AS U  left join areas as a ON(a.idarea=U.idarea)  '+
             ' left join puestos as p ON(p.idpuesto=U.idpuesto) where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector >0 group by completo having  completo <> '''' ',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,idsector,TipoReporte) SELECT ''CUENTAS NUEVAS'',concat(ifnull(U.nombre,""),'' '',ifnull(U.apaterno,""),'' '',ifnull(U.amaterno,""),'' (Sec '',U.idsector,'')'') as completo,''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',idsector,1 FROM usuarios AS U left join areas as a ON(a.idarea=U.idarea) left join puestos as p ON(p.idpuesto=U.idpuesto) where U.estatus=1 and p.nombre=''VENDEDOR'' AND a.nombre = ''VENTAS'' and U.idsector >0 group by completo having  completo <> '''' ',1,sqlgeneral);


      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''EQUIPOS'',''XCONSOLIDADO'',''4'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,100)',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''ENLACES'',''XCONSOLIDADO'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,100 )',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''CONEXIONES'',''XCONSOLIDADO'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,100 )',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''RECONEXIONES'',''XCONSOLIDADO'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,100 )',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''CUENTAS NUEVAS'',''XCONSOLIDADO'',''6'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,100)',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''VENTAS DLLS'',''XCONSOLIDADO'',''7'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,100)',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''VENTAS DLLS'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'',''7'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,200)',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''EQUIPOS'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'',''4'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,200)',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''ENLACES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,200 )',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''CONEXIONES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,200 )',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''RECONEXIONES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,200 )',1,sqlgeneral);
      querys('INSERT INTO TendenciaVendedores (tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES(''CUENTAS NUEVAS'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'',''6'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,200)',1,sqlgeneral);

      //m := formatdatetime('m',now);
      //y := formatdatetime('yyyy',now);

      /////////EQUIPOS.........

      /////////ENLACES,RECONEXIONES,CONEXION
      querys('SELECT  distinct count(tp.nombre) as t,(case 1 when tp.nombre =''CONEXION'' then ''CONEXIONES'' when tp.nombre =''CONEXION2'' then ''CONEXIONES'' when tp.nombre =''RECONEXION'' then ''RECONEXIONES'' when tp.nombre =''ENLACES'' then ''ENLACES'' when tp.nombre =''EQUIPO'' '+
             'then if(c.estatus=1,''EQUIPOS'',''NO APLICA'') end) as nom, (case 1 when tp.nombre =''CONEXION'' then ''3'' when tp.nombre =''RECONEXION'' then ''4'' when tp.nombre =''ENLACES'' then ''2'' when tp.nombre =''EQUIPO'' then ''1'' end) as orden  '+
             ',concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno,'' (Sec '',u.idsector,'')'')  as completo,dayofmonth(p.FechaRemision) AS dia  FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) '+
             'LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) left join clientes as c on(c.idcliente=p.idcliente) WHERE p.estatus in(3,4) and p.FechaRemision between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' and tp.instalacion =1  and tp.CuentaNueva =1  '+
             'GROUP BY completo,nom,dia having nom <> ''NO APLICA'' ',0,sqlgeneral);
      while not sqlgeneral.EOF do
        begin
        querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'=D'+sqlgeneral.fieldbyname('dia').AsString+' + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' AND concepto=''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2);
        querys('select concepto,idsector from TendenciaVendedores where fecha ="'+anor+'" and mes ="'+mesr+'" and concepto = '+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and  tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' ',0,sqlgeneral3);
        if sqlgeneral3.FieldByName('concepto').AsString <> '' then
          begin
          querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' AND concepto='+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2);
          if sqlgeneral3.FieldByName('idsector').AsInteger < 101 then
            querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'=D'+sqlgeneral.fieldbyname('dia').AsString+' + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' AND concepto=''XCONSOLIDADO'' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2)
          else
            querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes="'+mesr+'" and fecha="'+anor+'" and  tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' ',1,sqlgeneral2)
          end
        else
          begin
          querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+','+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+','+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+','+quotedstr(sqlgeneral.fieldbyname('orden').AsString)+',"'+mesr+'","'+anor+'",'+quotedstr(inttostr(idmes(mesr)))+',1,101 )',1,sqlgeneral2);
          querys('select concepto from TendenciaVendedores where fecha ="'+anor+'" and mes ="'+mesr+'" and concepto = ''XCONSOLIDADONO_VENDEDORES'' and  tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' ',0,sqlgeneral3);
          if sqlgeneral3.FieldByName('concepto').AsString <> '' then
            querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes="'+mesr+'" and fecha="'+anor+'" and  tipo='+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+' ',1,sqlgeneral2)
          else
            querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+','+quotedstr(sqlgeneral.fieldbyname('nom').AsString)+',''XCONSOLIDADONO_VENDEDORES'','+quotedstr(sqlgeneral.fieldbyname('orden').AsString)+',"'+mesr+'","'+anor+'",'+quotedstr(inttostr(idmes(mesr)))+',1,101 )',1,sqlgeneral2);
          end;
        sqlgeneral.Next;
        end;  //while sqlgeneral

      //////////CUENTAS NUEVAS
      querys('SELECT  distinct count(tp.nombre) as t,tp.nombre as nom,con.estatus,u.codigo as code,concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno,'' (Sec '',u.idsector,'')'')  as completo,dayofmonth(FechaRemision) AS dia  FROM pedidos as p LEFT JOIN usuarios as u   '+
             ' ON (u.idusuario=p.idvendedor)  LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) '+
             ' WHERE p.estatus in(3,4)  and p.FechaRemision between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' and tp.instalacion =1 and tp.CuentaNueva = 1 and con.estatus=1 group by u.codigo,dia ',0,sqlgeneral);

      while not sqlgeneral.EOF do
        begin
        TotCuentas :=  sqlgeneral.fieldbyname('t').asfloat + TotCuentas;
        querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'=D'+sqlgeneral.fieldbyname('dia').AsString+' + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''CUENTAS NUEVAS'' AND concepto=''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2);
        querys('select concepto,idsector from TendenciaVendedores where fecha ="'+anor+'" and mes ="'+mesr+'" and concepto = '+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and  tipo=''CUENTAS NUEVAS'' ',0,sqlgeneral3);
        if sqlgeneral3.FieldByName('concepto').AsString <> '' then
          begin
          querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''CUENTAS NUEVAS'' AND concepto='+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2);
          if sqlgeneral3.FieldByName('idsector').AsInteger < 101 then
            querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'=D'+sqlgeneral.fieldbyname('dia').AsString+' + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''CUENTAS NUEVAS'' AND concepto=''XCONSOLIDADO'' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2)
          else
            querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes="'+mesr+'" and fecha="'+anor+'" and  tipo=''CUENTAS NUEVAS'' ',1,sqlgeneral2);
          end
        else
          begin
          querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+',''CUENTAS NUEVAS'','+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,101 )',1,sqlgeneral2);
          querys('select concepto from TendenciaVendedores where fecha ="'+anor+'" and mes ="'+mesr+'" and concepto = ''XCONSOLIDADONO_VENDEDORES'' and  tipo=''CUENTAS NUEVAS'' ',0,sqlgeneral3);
          if sqlgeneral3.FieldByName('concepto').AsString <> '' then
            querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes="'+mesr+'" and fecha="'+anor+'" and  tipo=''CUENTAS NUEVAS'' ',1,sqlgeneral2)
          else
            querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+',''CUENTAS NUEVAS'',''XCONSOLIDADONO_VENDEDORES'',''5'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,101 )',1,sqlgeneral2);
          end;
        sqlgeneral.Next;
        end;

      ////tendencia por ventas .......

      //primero sacamos datos para saber que ventas realizo el vendedor en el periodo hecho .. ok , despues saber cuanto fue en dolares para realizar el segundo reporte de totales.....
      querys('DROP TABLE IF EXISTS TempComisiones0'+frmprincipal.idmaq,1,sqlgeneral3);
      querys('DROP TABLE IF EXISTS TempComisiones2'+frmprincipal.idmaq,1,sqlgeneral3);

      querys('CREATE TABLE TempComisiones0'+frmprincipal.idmaq+' SELECT  distinct p.idinstal,'+
             ' sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls ,'+
             ' p.idpedido as Venta,p.FechaRemision as Fecha, '+
             'left(ori.nombre,4) as Origen,p.idcliente as Cuenta,u.codigo,c.NombreCres as Cliente,left(tp.nombre,4) as Oport,concat(ifnull(u.nombre,""),'' '',ifnull(u.apaterno,""),'' '',ifnull(u.amaterno,""),'' (Sec '',u.idsector,'')'')  as completo FROM DetPedido as dp  '+
             ' LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN clientes as cl ON (p.idcliente=cl.idcliente) LEFT JOIN ClientesFact as c ON (cl.idfact=c.idfact)  '+
             'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) WHERE p.estatus in(3,4) and  '+
             'p.FechaRemision between '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+' and tp.instalacion =1 and a.idlinea = 4  GROUP BY dp.idpedido',1,sqlgeneral2);

      querys('create table TempComisiones2'+frmprincipal.idmaq+' select distinct p.idpedido , '+
             'sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)),if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio,(dnc.piezas*dnc.costo))),0) ) '+
             '  as ToTDlls  from DetNotasCredito as dnc left join NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf ON (rf.idfactura=nc.idfactura)  left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve)  '+
             ' LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE nc.FechaNc between  '+quotedstr(fecha1)+' and '+quotedstr(fecha2)+''+
             ' and tp.instalacion =1  and a.idlinea = 4  GROUP BY dnc.idpedido ',1,sqlgeneral3);

      ///////////////////////////////////

      querys('select t1.idinstal, sum(if (t2.TotDlls IS NULL,t1.ToTDlls,(t1.ToTDlls-t2.ToTDlls))) AS t,t1.Venta,dayofmonth(t1.Fecha)  '+
             'as dia,t1.Origen,t1.Cuenta,t1.codigo,t1.Cliente,t1.Oport,t1.Completo FROM TempComisiones0'+frmprincipal.idmaq+' AS t1 LEFT JOIN TempComisiones2'+frmprincipal.idmaq+' as t2 ON(t1.Venta=t2.idpedido) where completo <> ''''  group by completo,t1.Fecha',0,sqlgeneral);

      while not sqlgeneral.EOF do
        begin
        TotDlls := sqlgeneral.fieldbyname('t').AsFloat  + TotDlls;
        //if sqlgeneral.fieldbyname('completo').AsString <> 'CASA   (Sec 1)' then
        querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'=D'+sqlgeneral.fieldbyname('dia').AsString+' + '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''VENTAS DLLS'' AND concepto=''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2);
        querys('select concepto,idsector from TendenciaVendedores where fecha ="'+anor+'" and mes ="'+mesr+'" and concepto = '+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and  tipo=''VENTAS DLLS'' ',0,sqlgeneral3);
        if sqlgeneral3.FieldByName('concepto').AsString <> '' then
          begin
          querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' WHERE tipo=''VENTAS DLLS'' AND concepto='+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2);
          if sqlgeneral3.FieldByName('idsector').AsInteger < 101 then
            querys('UPDATE TendenciaVendedores SET D'+sqlgeneral.fieldbyname('dia').AsString+'= '+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' + D'+sqlgeneral.fieldbyname('dia').AsString+'  WHERE tipo=''VENTAS DLLS'' AND concepto=''XCONSOLIDADO'' and mes = "'+mesr+'" and fecha ='+quotedstr(anor) ,1,sqlgeneral2)
          else
            querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes="'+mesr+'" and fecha="'+anor+'" and  tipo=''VENTAS DLLS'' ',1,sqlgeneral2);
          end
        else
          begin
          querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+',''VENTAS DLLS'','+quotedstr(sqlgeneral.fieldbyname('completo').AsString)+',''6'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,101 )',1,sqlgeneral2);
          querys('select concepto from TendenciaVendedores where fecha ="'+anor+'" and mes ="'+mesr+'" and concepto = ''XCONSOLIDADONO_VENDEDORES'' and  tipo=''VENTAS DLLS'' ',0,sqlgeneral3);
          if sqlgeneral3.FieldByName('concepto').AsString <> '' then
            querys('UPDATE TendenciaVendedores set D'+sqlgeneral.fieldbyname('dia').AsString+'= D'+sqlgeneral.fieldbyname('dia').AsString+'+'+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto=''XCONSOLIDADONO_VENDEDORES'' and mes="'+mesr+'" and fecha="'+anor+'" and  tipo=''VENTAS DLLS'' ',1,sqlgeneral2)
          else
            querys('INSERT INTO TendenciaVendedores (D'+sqlgeneral.fieldbyname('dia').AsString+',tipo,concepto,id,mes,fecha,idmes,TipoReporte,idsector) VALUES('+quotedstr(sqlgeneral.fieldbyname('t').AsString)+',''VENTAS DLLS'',''XCONSOLIDADONO_VENDEDORES'',''6'',"'+mesr+'","'+anor+'",'+quotedstr(m)+',1,101 )',1,sqlgeneral2);
          end;
        sqlgeneral.Next;
        end;

      //////////////////////////////
      ///sacar la tendencia

      querys('UPDATE TendenciaVendedores SET total=round((D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31),3) WHERE mes="'+mesr+'" and fecha= '+quotedstr(anor),1,sqlgeneral2);
      //if ((y=anor)  and  (m=inttostr(idmes(mesr)))) then
      if ((y=anor)  and  (strtoint(m)=strtoint(mes))) then
        begin
        querys('UPDATE TendenciaVendedores SET porciento=(total/'+inttostr(diai)+'),tendencia=round(((total/('+quotedstr(inttostr(diai))+'-1))*'+inttostr(diaf-1)+'),2) WHERE mes="'+mesr+'" and fecha= '+quotedstr(anor),1,sqlgeneral2);
        TotDlls := (TotDlls/strtoint(dia) )* diaf;
        TotCuentas :=  (TotCuentas/strtoint(dia) )* diaf;
        end
      else
        begin
        querys('UPDATE TendenciaVendedores SET porciento=(total/'+inttostr(diaf)+'),tendencia=round(((total/'+inttostr(diaf)+')*'+inttostr(diaf)+'),2) WHERE mes="'+mesr+'" and fecha= '+quotedstr(anor),1,sqlgeneral2);
        TotDlls := (TotDlls/diaf )* diaf;
        TotCuentas :=  (TotCuentas/diaf )* diaf;
        end;

      ///-----------IMPRESION O CREACION --------------------------------------------------------------------------//
      if guardar = true then
        begin
        querys('Update TendenciaVendedores set fechaCierre = "'+datetostr(date)+'" WHERE mes="'+mesr+'" and fecha= "'+anor+'"', 1, sqlgeneral8);
        if querys('Select mes FROM TendenciaVendedores WHERE mes = "'+mesr+'" '+
             'AND fecha ='+anor+' and fechaCierre<> "0000-00-00"', 0, sqlgeneral8) > 0 then
          application.messagebox('Se realizo el cierre de Tendencia Vendedores', 'Cierre Mensual', MB_ICONINFORMATION)
        else
          application.messagebox('No se enconctraron datos', 'Cierre Mensual', MB_ICONINFORMATION);
        end
      else
        begin
        querys('SELECT *,'+floattostr(TotDlls)+' as TotalDolares,'+floattostr(TotCuentas)+' as TotalCuentas '+
               'FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" and concepto is not null '+
               'and TipoReporte=1 and idsector < 101 order by idsector,concepto,id',0,sqlgeneral2);
        if novendedores = true then
          querys('SELECT * FROM TendenciaVendedores WHERE mes="'+mesr+'" and fecha= "'+anor+'" and concepto is not null and TipoReporte=1 and idsector between 101 and 200 and total > 0 order by idsector,concepto,id',0,sqlgeneral)
        else
          querys('SELECT * FROM TendenciaVendedores WHERE mes = ''NO MOSTRARSE EN REPORTE'' ',0,sqlgeneral);

        if sqlgeneral2.RecordCount > 0 then
          begin
          if dmreportes.sqlgeneral.recordcount = 6 then // 6 son los registros que tiene por default y si solo tiene 6 es que ninguna venta por un no vendedor se ha realizado
            querys('SELECT * FROM TendenciaVendedores WHERE mes = ''NO MOSTRARSE EN REPORTE'' ',0,sqlgeneral);
          OperacionReporte('TendenciaVentasMes','Reporte de tendencia de vtas ('+datetostr(now)+')',TipoImpresion, 1)
          end
        else
          application.MessageBox('No hay datos!','Confirmación',mb_iconwarning);
        end;
      querys('DROP TABLE IF EXISTS TempComisiones0'+frmprincipal.idmaq,1,sqlgeneral3);
      querys('DROP TABLE IF EXISTS TempComisiones2'+frmprincipal.idmaq,1,sqlgeneral3);
      end;

    if totalesventas = true then
      begin
      ///mostrar reporte 2 totales por mes.........
      querys('DROP TABLE IF EXISTS temporal_tendencia'+frmprincipal.idmaq,1,sqlgeneral);
      querys('create table temporal_tendencia'+frmprincipal.idmaq+' (m1 double default 0,m2 double default 0,m3 double default 0,m4 double default 0,m5 double default 0,m6 double default 0,m7 double default 0,m8 double default 0,m9 double default 0,m10 double default 0,m11 double default 0,m12 double default 0, '+
             ' codigo varchar(150),total double default 0,promedio double default 0,tendencia double default 0,fecha varchar(50))',1,sqlgeneral2);
      if ( vendedores  and   novendedores ) then
        begin
        condicion := 'Tendencia Ventas Dlls Vendedores y No Vendedores ';
        querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha="'+anor+'" and tipo =''VENTAS DLLS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') order by id,concepto,mes ',0,sqlgeneral)
        end
      else
        if vendedores then
          begin
          condicion := 'Tendencia Ventas Dlls Vendedores ';
          querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha="'+anor+'" and tipo =''VENTAS DLLS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101  order by id,concepto,mes ',0,sqlgeneral)
          end
        else
          if novendedores then
            begin
            condicion := 'Tendencia Ventas Dlls No Vendedores ';
            querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha="'+anor+'" and tipo =''VENTAS DLLS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'')  and idsector between 101 and 199 order by id,concepto,mes ',0,sqlgeneral);
            end;

      while not sqlgeneral.eof do
        begin
        querys('select codigo from temporal_tendencia'+frmprincipal.idmaq+' where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
        if sqlgeneral2.fieldbyname('codigo').asstring = '' then
          begin
          querys('insert into temporal_tendencia'+frmprincipal.idmaq+' (codigo,m'+sqlgeneral.fieldbyname('idmes').asstring+',fecha) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(sqlgeneral.fieldbyname('total').asstring)+',"'+anor+'") ',1,sqlgeneral3);
          end
        else
           begin
           querys('update temporal_tendencia'+frmprincipal.idmaq+' set m'+sqlgeneral.fieldbyname('idmes').asstring+' = '+sqlgeneral.fieldbyname('total').asstring+' + m'+sqlgeneral.fieldbyname('idmes').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),1,sqlgeneral3);
           end;
        sqlgeneral.next;
        end;

      querys('update temporal_tendencia'+frmprincipal.idmaq+' set total=(m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12)', 1, sqlgeneral3);
      querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=round((total/'+quotedstr(m)+'),2),tendencia=round(((total/'+quotedstr(m)+')*'+inttostr(12)+'),2)', 1, sqlgeneral3);
      condicion := condicion + ' del año '+anor;

      querys('select t.*,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,'+quotedstr(condicion)+' as titulo from temporal_tendencia'+frmprincipal.idmaq+' as t join DatosEmpresa as de where  fecha="'+anor+'" order by codigo ',0,sqlgeneral);
      OperacionReporte('TendenciaVendedoresVtas','Reporte de tendecia ventas',TipoImpresion, 1);
      end;

    if totalescuentas = true then
      begin
      ///mostrar reporte 2 totales por mes.........
      querys('DROP TABLE IF EXISTS temporal_tendencia'+frmprincipal.idmaq,1,sqlgeneral);
      querys('create table temporal_tendencia'+frmprincipal.idmaq+' (m1 double default 0,m2 double default 0,m3 double default 0,m4 double default 0,m5 double default 0,m6 double default 0,m7 double default 0,m8 double default 0,m9 double default 0,m10 double default 0,m11 double default 0,m12 double default 0, '+
             ' codigo varchar(150),total double default 0,promedio double default 0,tendencia double default 0,fecha varchar(50))',1,sqlgeneral2);
      if ( vendedores  and   novendedores ) then
        begin
        condicion := 'Tendencia de Cuentas Vendedores No vendedores ';
        querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha="'+anor+'" and tipo =''CUENTAS NUEVAS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') order by id,concepto,mes ',0,sqlgeneral)
        end
      else
        if vendedores then
          begin
          condicion := 'Tendencia de Cuentas Vendedores ';
          querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha="'+anor+'" and tipo =''CUENTAS NUEVAS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'') and idsector < 101 order by id,concepto,mes ',0,sqlgeneral)
          end
        else
         if novendedores then
           begin
           condicion := 'Tendencia de CuentasNo Vendedores ';
           querys('select total,mes,fecha,concepto as code,idmes from TendenciaVendedores where fecha="'+anor+'" and tipo =''CUENTAS NUEVAS'' and concepto not in(''XCONSOLIDADO'',''XCONSOLIDADONO_VENDEDORES'',''TOTAL CONSOLIDADO(VENDEDORES-NO VENDEDORES)'')  and idsector between 101 and 199 order by id,concepto,mes ',0,sqlgeneral);
           end;

      while not sqlgeneral.eof do
        begin
        querys('select codigo from temporal_tendencia'+frmprincipal.idmaq+' where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),0,sqlgeneral2);
        if sqlgeneral2.fieldbyname('codigo').asstring = '' then
          begin
          querys('insert into temporal_tendencia'+frmprincipal.idmaq+' (codigo,m'+sqlgeneral.fieldbyname('idmes').asstring+',fecha) values('+quotedstr(sqlgeneral.fieldbyname('code').asstring)+','+quotedstr(sqlgeneral.fieldbyname('total').asstring)+',"'+anor+'") ',1,sqlgeneral3);
          end
        else
          begin
          querys('update temporal_tendencia'+frmprincipal.idmaq+' set m'+sqlgeneral.fieldbyname('idmes').asstring+'=  '+sqlgeneral.fieldbyname('total').asstring+' + m'+sqlgeneral.fieldbyname('idmes').asstring+'  where codigo = '+quotedstr(sqlgeneral.fieldbyname('code').asstring),1,sqlgeneral3);
          end;
        sqlgeneral.next;
        end;

      querys('update temporal_tendencia'+frmprincipal.idmaq+' set total=(m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12)', 1, sqlgeneral3);
      querys('update temporal_tendencia'+frmprincipal.idmaq+' set promedio=round((total/'+quotedstr(m)+'),2),tendencia=round(((total/'+quotedstr(m)+')*'+inttostr(12)+'),2)', 1, sqlgeneral3);
      condicion := condicion +' del año '+ anor;
      querys('select t.*,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'''' ,'''',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,'+quotedstr(condicion)+' as titulo from temporal_tendencia'+frmprincipal.idmaq+' as t join DatosEmpresa as de where  fecha="'+anor+'" order by codigo ',0,sqlgeneral);
      OperacionReporte('TendenciaVendedoresCtas','Reporte de tendencia vendedores ',TipoImpresion, 1);
      end;
    end;
  end; //dmreportes
end;

procedure RepPagosXLineaMon(const dfecha1,dfecha2,TipoImpresion:string;ckbtodos, Mon:boolean);
var dia1,dia2,m1,cadena:string; //y2, y1, di1,di2, m2,   ano, ,fecha
fecha1,fecha2:tdatetime;
begin
   Screen.Cursor := crHourglass;
   fecha1:=strtodate(dfecha1);
   fecha2:=strtodate(dfecha2);
   with dmreportes do
   begin
      m1 :=  formatdatetime('m',strtodate(dfecha1));
      //esto se hace por que se nececita sacar los cobros de un dia antes o del dia anterior habil antes para ello necesitamos saber que dia es y asi hacer lo pertinente
      querys('select dias from PagosXLineaDias where fecha in ("'+dfecha2+'") order by fecha',0,sqlgeneral2);
      if(sqlgeneral2.RecordCount > 0) then
      begin
         fecha1:=fecha1-sqlgeneral2.Fields.Fields[0].AsInteger;
         fecha2:=fecha2-1;
      end
      else
      begin
         querys('select dayname("'+dfecha1+'") as dia1,dayname("'+dfecha2+'") as dia2',0,sqlgeneral);
         dia1:=sqlgeneral.fieldbyname('dia1').AsString;
         dia2:=sqlgeneral.fieldbyname('dia2').AsString;
         //casos normales de dias
         if dia1 = 'Monday' then
            fecha1:=fecha1-3
         else
            if dia1 = 'Saturday' then
               fecha1:=fecha1-1
            else
               fecha1:=fecha1-1;
         if dia2= 'Monday' then
            fecha2:=fecha2-2
         else
            if dia2 = 'Saturday' then
               fecha1:=fecha1-2
            else
               fecha2:=fecha2-1;
      end;
      BorrarTablasPagosTemp;
      //buscarmos primero por los cobros normales y despues por los cobro en caja
      // primero sumamos por lineas
      cadena:='';
      cadena:='CREATE TABLE temporalpagos'+frmprincipal.idmaq+          //(1+p.piva)
           ' SELECT u.idusuario,a.inventariable,dp.id,p.idcliente,dp.idpedido,pc.idremicion,p.idfactura,l.nombre,a.moneda,if ( (truncate(((dp.costo*dp.tc)*(1+p.piva))*dp.cant,3) > p.TotMn),p.TotMn,(truncate(((dp.costo*dp.tc)*(1+p.piva))*dp.cant,3)) ) as TOTAL,'+
           'if((round(((((dp.costo*dp.tc)*(1+p.piva))*dp.cant)*100)/p.TotMn,2)) > 100,100,(round(((((dp.costo*dp.tc)*(1+p.piva))*dp.cant)*100)/p.TotMn,2)) ) as Porcentaje,p.TotMn,pc.FechaAlta,if (c.bloqueado=0,''NO'',''SI'') AS bloqueado,c.sector, '+
           'concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Usuario,pc.idpago FROM DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) LEFT JOIN articulos as a  '+
           'ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) LEFT JOIN RemiFact as rm ON (rm.idpedido=dp.idpedido) LEFT JOIN PagosClientes as pc ON (pc.idpedido = dp.idpedido) LEFT JOIN clientes as c ON (p.idcliente=c.idcliente) '+
           'LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '+''''+dfecha1+''' and '+''''+dfecha2+''' and p.estatus in(3,4,6) and pc.movimiento in(0,2) and pc.TipoCobro =0 and pc.abono > 0 ';
      cadena:=cadena + ' GROUP BY dp.id,u.idusuario ORDER BY dp.idpedido';
      querys(cadena,1,sqlgeneral2);//crea la tabla temporal de sumas por lineas
      querys('Create Index idpedido on temporalpagos'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);
      //ahora siguen los cobros en caja.....
      cadena:='';                                     //  (1+p.piva)
      cadena:='INSERT INTO temporalpagos'+frmprincipal.idmaq+' (idusuario,inventariable,id,idcliente,idpedido,idremicion,idfactura,nombre,moneda,TOTAL,Porcentaje,TotMn,FechaAlta,bloqueado,sector,Usuario,idpago) SELECT u.idusuario,a.inventariable,dp.id,p.idcliente,dp.idpedido,pc.idremicion,'+
              ' p.idfactura,l.nombre,a.moneda,if ( (truncate(((dp.costo*dp.tc)*(1+p.piva))*dp.cant,3) > p.TotMn),p.TotMn,(truncate(((dp.costo*dp.tc)*(1+p.piva))*dp.cant,3)) ) as TOTAL,'+
              'if((round(((((dp.costo*dp.tc)*(1+p.piva))*dp.cant)*100)/p.TotMn,2)) > 100,100,(round(((((dp.costo*dp.tc)*(1+p.piva))*dp.cant)*100)/p.TotMn,2)) ) as Porcentaje,p.TotMn,pc.FechaAlta,if (c.bloqueado=0,''NO'',''SI'') AS bloqueado,c.sector, '+
              'concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Usuario,pc.idpago FROM DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido) LEFT JOIN articulos as a  '+
              'ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) LEFT JOIN RemiFact as rm ON (rm.idpedido=dp.idpedido) LEFT JOIN PagosClientes as pc ON (pc.idpedido = dp.idpedido) LEFT JOIN clientes as c ON (p.idcliente=c.idcliente) '+
              'LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '''+datetostr(fecha1)+''' and '''+datetostr(fecha2)+''' and p.estatus in(3,4,6) and pc.movimiento =2 and pc.TipoCobro =1 and pc.abono > 0 ';     //and not ( l.nombre =''EQUIPO'' AND a.inventariable =0 ) ';

      cadena:=cadena + ' GROUP BY dp.id,u.idusuario ORDER BY dp.idpedido';
      querys(cadena,1,sqlgeneral2);//insertamos en tabla temporal de sumas por lineas
      querys('select idpedido from  temporalpagos'+frmprincipal.idmaq+' where Porcentaje = 100 group by idpedido',0,sqlgeneral2);
      while not sqlgeneral2.eof do
      begin
         querys(' delete from temporalpagos'+frmprincipal.idmaq+' where idpedido = '+sqlgeneral2.Fields.Fields[0].AsString+' and Porcentaje < 100 ',1,sqlgeneral);
         sqlgeneral2.Next;
      end;
      // segunda creamos la tabla suma por pagos  con tipocobro 0   /// a.inventariable=1
      cadena:='';
      cadena:='CREATE TABLE temporalpagos100'+frmprincipal.idmaq+' SELECT pc.idpedido,sum(pc.abono) as abono,u.idusuario FROM PagosClientes as pc LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '+''''+dfecha1+''' and '+''''+dfecha2+''' and pc.movimiento in(0,2) and pc.abono> 0 and pc.TipoCobro =0 ';
      cadena:=cadena + ' GROUP BY idpedido,u.idusuario';
      querys(cadena,1,sqlgeneral2);//crea la tabla temporal suma por pagos
      //insertamos en tabla con tipocobro 1
      // segunda creamos la tabla suma por pagos  con tipocobro 0   /// a.inventariable=1
      cadena:='';
      cadena:='INSERT INTO temporalpagos100'+frmprincipal.idmaq+'(idpedido,abono,idusuario) SELECT pc.idpedido,sum(pc.abono) as abono,u.idusuario FROM PagosClientes as pc LEFT JOIN UCTabUsers as lg ON (lg.UCLogin=pc.usuario) LEFT JOIN usuarios as u ON (u.idusuario=lg.UCIdUser) WHERE pc.FechaAlta between '''+datetostr(fecha1)+''' and '''+datetostr(fecha2)+''' and pc.movimiento in(0,2) and pc.abono> 0 and pc.TipoCobro =1 ';
      cadena:=cadena + ' GROUP BY idpedido,u.idusuario';
      querys(cadena,1,sqlgeneral2);//crea la tabla temporal suma por pagos
      querys('CREATE TABLE temporalpagos3'+frmprincipal.idmaq+' SELECT idpedido,sum(abono) as abono,idusuario FROM temporalpagos100'+frmprincipal.idmaq+' group by idpedido,idusuario',1,sqlgeneral2);
      querys('Create Index idpedido on temporalpagos3'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);
      // tercero de la tabla temporal creamos otra pero ya con totalse por linea
      querys('CREATE TABLE temporalpagos2'+frmprincipal.idmaq+' SELECT idusuario,idcliente,idpedido,idremicion,idfactura,nombre,sum(TOTAL)AS TOTAL,TotMn,FechaAlta,bloqueado,sector,Usuario,idpago FROM temporalpagos'+frmprincipal.idmaq+' GROUP BY nombre,idpedido,idusuario ORDER BY idpedido',1,sqlgeneral2);
      querys('CREATE INDEX idpedido on temporalpagos2'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);
      //creamos otra tabla donde se mostrara el reporte
      querys('CREATE TABLE temporalpagos4'+frmprincipal.idmaq+' SELECT t2.idusuario,t2.idcliente,t2.idpedido,t2.idremicion,t2.idfactura,t3.abono,t2.FechaAlta,'+
             't2.bloqueado,t2.sector,t2.Usuario,if (t3.abono <> '''',t3.abono,0) as MONITOREO,if (t3.abono <> '''',t3.abono,0) as INTERESES,if (t3.abono <> '''',t3.abono,0) as SERVICIO,if (t3.abono <> '''',t3.abono,0) as EQUIPO,if (t3.abono <> '''',t3.abono,0) '+
             'as OTROS,t2.idpago FROM temporalpagos2'+frmprincipal.idmaq+' as t2 LEFT JOIN temporalpagos3'+frmprincipal.idmaq+' as t3 ON (t3.idpedido=t2.idpedido) where abono <=0 GROUP BY t2.nombre,t2.idpedido,t2.idusuario ORDER BY t2.idpedido',1,sqlgeneral2);
      querys('Create Index idpedido on temporalpagos4'+frmprincipal.idmaq+' (idpedido)',1,sqlgeneral2);
      //ahora insertamos a la tabla el pedido para poder comparar
      querys('INSERT INTO temporalpagos4'+frmprincipal.idmaq+' (idusuario,idpedido,idremicion,idfactura,FechaAlta,bloqueado,sector,Usuario,idpago) SELECT idusuario,idpedido,idremicion,idfactura,FechaAlta,bloqueado,sector,Usuario,idpago FROM temporalpagos2'+frmprincipal.idmaq+' GROUP BY idpedido,idusuario ORDER BY idpedido',1,sqlgeneral2);
      querys('SELECT t2.idcliente as cliente,t2.idpedido as pedido,t2.idremicion as remicion,t2.idfactura as factura,t2.nombre as linea,t3.abono as pago,ROUND(((t2.TOTAL*100)/t2.TotMn),2) as Porcentaje,ROUND((((t2.TOTAL*100)/t2.TotMn)/100)*t3.abono,2) as resultado,'+
          't3.idusuario as idusuario,t2.TOTAL as total,t2.TotMn as totpedido,t2.FechaAlta as FechaAlta,t2.bloqueado as bloqueado,t2.sector as sector,t2.Usuario as cobrador FROM temporalpagos2'+frmprincipal.idmaq+' as t2 LEFT JOIN temporalpagos3'+frmprincipal.idmaq+' as t3 ON (t3.idpedido=t2.idpedido) WHERE abono >0 GROUP BY t2.nombre,t2.idpedido,t3.idusuario ORDER BY t2.idpedido',0,sqlgeneral);
      if sqlgeneral.FieldByName('cliente').AsString  <> ''then
      begin
         while not sqlgeneral.Eof do
         begin
            querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET idcliente='+quotedstr(sqlgeneral.fieldbyname('cliente').AsString)+' ,'+sqlgeneral.fieldbyname('linea').AsString+'=('+quotedstr(sqlgeneral.fieldbyname('linea').AsString)+'  +  '+quotedstr(sqlgeneral.fieldbyname('resultado').AsString)+' ),  abono='+quotedstr(sqlgeneral.fieldbyname('pago').AsString)+'  WHERE idpedido='+quotedstr(sqlgeneral.fieldbyname('pedido').AsString)+' and idusuario='+quotedstr(sqlgeneral.fieldbyname('idusuario').AsString),1,sqlgeneral2);
            sqlgeneral.Next;
         end;
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET MONITOREO=0 WHERE (MONITOREO IS NULL)' ,1,sqlgeneral2);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET INTERESES=0 WHERE (INTERESES IS NULL)' ,1,sqlgeneral2);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET SERVICIO=0 WHERE (SERVICIO IS NULL )' ,1,sqlgeneral2);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET EQUIPO=0 WHERE (EQUIPO IS NULL)' ,1,sqlgeneral2);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET OTROS=0 WHERE (OTROS IS NULL)' ,1,sqlgeneral2);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' set EQUIPO= (abono-(MONITOREO+INTERESES+SERVICIO+OTROS))',1,sqlgeneral);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' set MONITOREO = IF ( EQUIPO < 1,MONITOREO + EQUIPO,MONITOREO)',1,sqlgeneral);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET EQUIPO = IF ( EQUIPO < 1,0,EQUIPO)',1,sqlgeneral);
         querys('UPDATE temporalpagos4'+frmprincipal.idmaq+' SET EQUIPO = IF ( EQUIPO < 0.1,0,EQUIPO), MONITOREO  = IF ( MONITOREO  < 0.1,0,MONITOREO ),INTERESES = IF ( INTERESES < 0.1,0,INTERESES),SERVICIO = IF ( SERVICIO < 0.1,0,SERVICIO) ',1,sqlgeneral);


         ///////////////   generar reportes  ///////////////////////////

         dia1:='Del '+dfecha1+' al '+dfecha2;

         if Mon = true then
         begin
         querys('SELECT if(monitoreo<>0,if(count(dp.idpedido)>1,"Mas Un Mes",dp.cod_cve),"") as concepto,t.*,de.nombre as Empresa,'+
                'concat(de.direccion,'' ,'',de.ciudad,'' ,'',de.estado) as DirEmpresa,'+
                'concat(''Tel : '',de.telefono,''            RFC :'',de.rfc ) as rfc,'+quotedstr(dia1)+' as periodo '+
                'FROM temporalpagos4'+frmprincipal.idmaq+' as t left join DetPedido dp on t.idpedido=dp.idpedido '+
                ' join DatosEmpresa as de WHERE abono >0 and idcliente <> " " and monitoreo<>0'+
                ' group by dp.idpedido order by idusuario,idfactura,FechaAlta asc ',0,sqlgeneral);

          querys('select concepto,round(sum(total),2) as total,'+
                 ' round(sum(residencial),2) as residencial,round(sum(comercial),2) as comercial from('+
                 ' Select concepto,sum(monitoreo) as total,idgiro,giro,if(idgiro=1,sum(monitoreo),0) as residencial,'+
                 ' if(idgiro in (2,3,4), sum(monitoreo),0) as comercial'+
                 ' from ( select concepto,sum(monitoreo)/count(idpedido) as monitoreo,idgiro,giro from ('+
                 ' SELECT dp.cod_cve as concepto, MONITOREO, dp.idpedido,c.idgiro, g.nombre as giro '+
                 ' FROM temporalpagos4'+frmprincipal.idmaq+' as t '+
                 ' left join DetPedido dp on t.idpedido=dp.idpedido '+
                 ' left join clientes c on c.idcliente=t.idcliente '+
                 ' left join giros g on c.idgiro=g.idgiro '+
                 ' WHERE abono >0 and t.idcliente <>" " and monitoreo<>0 '+
                 ' ) as ta group by idpedido) as tt'+
                 ' group by concepto,giro) as t GROUP BY concepto '+
                 ' order by concepto ',0,sqlgeneral2);

                 frmmensaje.Close;
         Screen.Cursor := crDefault;
         OperacionReporte('PagosXLineaMon','Reporte de pagos por linea',TipoImpresion, 1);
          end
          else
          begin
          querys('SELECT dp.cod_cve as concepto, t.*, '+quotedstr(dia1)+' as periodo '+
                 'FROM temporalpagos4'+frmprincipal.idmaq+' as t left join DetPedido dp on t.idpedido=dp.idpedido '+
                 'WHERE abono >0 and idcliente <> " " and monitoreo=0 '+
                 'group by dp.idpedido order by idusuario,idfactura,FechaAlta asc ',0,sqlgeneral);

          querys('Select concepto, sum(total) as total, sum(residencial)  as residencial, sum(comercial) as comercial '+
                 'from ( Select concepto, giro, sum(equipo)+sum(servicio)+sum(intereses)+sum(otros) as total, '+
                 'if(idgiro=1,sum(equipo)+sum(servicio)+sum(intereses)+sum(otros),0) as residencial,  '+
                 'if(idgiro > 1, sum(equipo)+sum(servicio)+sum(intereses)+sum(otros),0) as comercial from ( '+
                 'select concepto, sum(equipo) as equipo, sum(servicio) as servicio, sum(intereses) as intereses, '+
                 'sum(otros)as otros, c.idgiro, if(c.idgiro=1, "RESIDENCIAL", "COMERCIAL") giro from ( '+
                 'SELECT distinct if(equipo <> 0, "EQUIPO", if(intereses <> 0, "INTERESES", '+
                 'if(servicio <> 0, "SERVICIO", "OTROS"))) as concepto, t.idcliente, t.idpedido, '+
                 't.INTERESES, t.SERVICIO, t.EQUIPO, t.OTROS, '+quotedstr(dia1)+' AS periodo '+
                 'FROM temporalpagos4'+frmprincipal.idmaq+' as t left join DetPedido dp on t.idpedido=dp.idpedido '+
                 'WHERE abono >0 and idcliente <> " " and monitoreo=0 group by dp.idpedido '+
                 'as ta inner join clientes c on c.idcliente=ta.idcliente group by concepto, giro '+
                 ') as tt group by concepto, giro ) as t group by concepto ',0,sqlgeneral2);



                 frmmensaje.Close;
         Screen.Cursor := crDefault;
         OperacionReporte('PagosXLineaEquipoMes','Reporte de pagos por linea por mes',TipoImpresion, 1);

          end;
         {querys('Select concepto,sum(monitoreo) from ( select concepto,sum(monitoreo)/count(idpedido) as monitoreo '+
                'from (  SELECT dp.cod_cve as concepto, MONITOREO, dp.idpedido FROM temporalpagos4'+frmprincipal.idmaq+' as t '+
                'left join DetPedido dp on t.idpedido=dp.idpedido WHERE abono >0 and idcliente <>" " and monitoreo<>0 '+
                ') as ta group by idpedido ) as tt group by concepto order by concepto', 0, sqlgeneral2);
          }
      end
      else
      begin
         Screen.Cursor := crDefault;
         frmmensaje.Close;
         application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);
      end;
      BorrarTablasPagosTemp;
   end;//with
   Screen.Cursor := crDefault;
end;

procedure RepCompras(mes,ano,f1, f2:string; guardar:boolean);
begin

if guardar = true then
  begin
  if querys('Select idcompra from RepCompras where Periodo = "'+mes+'-'+ano+'"', 0, dmreportes.sqlgeneral) > 0 then
    begin
    Application.MessageBox('El cierre de este periodo ya se realizo', 'Aviso', MB_ICONINFORMATION);
    exit;
    end
  else
    begin
    if Application.MessageBox('Estas seguro de realizar el cierre de compras?', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
      begin
      try
      querys('Insert into RepCompras (Periodo,mes,ano,idcompra,idproveedor,nombre,FechaCompra,NumFactura,NumPedimento,moneda,subtotal,iva,total,totaldll,TipoCambio,usuario,fecha,hora) ' +
         ' Select "'+mes+'-'+ano+'" as Periodo, '+inttostr(idmes('mes'))+' as mes, '+ano+' as ano, '+
         'c.idcompra, c.idprov as idproveedor, '+ClienteNombre('p')+' as nombre, c.FechaCompra, c.NumFactura , '+
         'c.NumPedimento, moneda, round(if(moneda = "P", subtotal, subtotal * TipoCambio),4) as subtotal, '+
         'round(if(moneda = "P", c.iva, c.iva * TipoCambio),4) as iva, round(if(moneda = "P", totalmn, total * '+
         'TipoCambio),4) as total, round(if(moneda = "P", subtotal / TipoCambio, total),4) as totaldll, TipoCambio, '+
         '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, "'+datetostr(date)+'" as fecha, '+
         '"'+FormatDateTime('HH:mm:ss', time)+'" as hora from compras as c left join proveedores as p on(p.idprov=c.idprov) '+
         'where c.FechaCompra between "'+f1+'" and "'+f2+'" order by p.idprov, c.FechaCompra', 1, dmreportes.sqlgeneral5);
         Application.MessageBox('Se genero el cierre', 'Atencion', MB_ICONINFORMATION);
      except
        Application.MessageBox('No se guardo o se guardo incorrectamente el cierre de compras', 'Atencion', MB_ICONINFORMATION);
        exit;
      end;
      end
    else
      exit;
    end;
   end
else
  querys('Select * from RepCompras where Periodo = "'+mes+'-'+ano+'" and tipo = 1', 0, dmreportes.sqlgeneral);
end;

procedure RepMotCancelacion(f1, f2:string);
begin
  with DMREPORTES do
  begin
    if querys('select "Del '+f1+' Al '+f2+' " as periodo, p.idpedido,p.idfactura,p.idcliente,if(c.rsocial <> "" or c.rsocial is not null, c.rsocial,concat(if(c.nombre is null," ",c.nombre)," ",'+
         'if(c.apaterno is null," ",c.apaterno)," ",if(c.amaterno is null," ",c.amaterno))) as cliente,motivo,can.usuario, can.fecha, can.hora'+
         ' from pedidos_motcancelacion can'+
         ' left join pedidos p on p.idpedido=can.idpedido'+
         ' left join clientes c on c.idcliente=p.idcliente '+
         ' where fecha_cancelacion BETWEEN "'+f1+'" and "'+f2+'" order by idfactura',0,sqlgeneral)>0 then
    begin
      operacionreporte('FacturasCanceladasMotivos', 'Reporte de Facturas Canceladas ', 'IMP', 1);
    end
    else
      Application.MessageBox('No se encontraron Datos','Aviso',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure RepCajaMensual(mes,ano:string; guardar:boolean);
var sqlgeneral:TMyQuery; f1, f2,  d:string;  // m,
begin
sqlgeneral := TMyQuery.Create(nil);
sqlgeneral.Connection := DMAccesos.conexion;

//m := inttostr(mes+1);
if(Length(mes) = 1) then
   mes := '0'+ mes;

d := inttostr(DiasMes(mes));
f1 := ano+'/'+mes+'/01';
f2 := ano+'/'+mes+'/'+d;

querys('DROP TABLE IF EXISTS tmpIngresos'+frmprincipal.idmaq, 1, sqlgeneral);
querys('CREATE TABLE tmpIngresos'+frmprincipal.idmaq+' (Concepto varchar(100), HSBCMN decimal(10,2) default 0, '+
       'HSBCDLL decimal(10,2)  default 0, HSBCRAP decimal(10,2) default 0, BANORTEMN decimal(10,2) default 0, BANORTEDLL decimal(10,2)  default 0, '+
       'BANAMEX decimal(10,2) default 0, BANCOMER decimal(10,2) default 0, RABOBANK decimal(10,2) default 0, TOTAL decimal(10,2) default 0)', 1, sqlgeneral);

querys('Insert into tmpIngresos'+frmprincipal.idmaq+' (Concepto) select cs.nombre from clasif_servicios cs '+
       'LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv where ts.nombre = "CAJA INGRESOS" '+
       'AND cs.nombre not like "%OTROS%" order by orden', 1, sqlgeneral);

querys('Select round(sum(monto),2) as monto, concepto, orden, banco from ( '+
       'SELECT if(rc.moneda = "D", (rc.monto*rc.tc), rc.monto) as monto, rc.concepto, cs.orden,'+
       'replace(cs.nombre, " ", "") as banco FROM RepCaja AS rc LEFT JOIN clasif_servicios cs on cs.orden=rc.idbanco '+
       'LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv where rc.FechaAlta between "'+f1+'" and "'+f2+'" and rc.tipo = "Ing" '+
       'and ts.nombre = "CAJA BANCOS" )'+
       ' as t group by concepto, orden', 0, sqlgeneral);
while not sqlgeneral.Eof do
  begin
  querys('Update tmpIngresos'+frmprincipal.idmaq+' set '+sqlgeneral.fieldbyname('banco').AsString+' = '+
         sqlgeneral.fieldbyname('banco').AsString+'+'+sqlgeneral.fieldbyname('monto').AsString+', TOTAL=TOTAL+'+sqlgeneral.fieldbyname('monto').AsString+' '+
         'where Concepto="'+sqlgeneral.fieldbyname('concepto').AsString+'"', 1, dmreportes.sqlgeneral6);
  sqlgeneral.Next;
  end;

querys('Select round(sum(monto),2) as monto, concepto, banco, orden from ('+
       'SELECT if(rc.moneda = "D", (rc.monto*rc.tc), rc.monto) as monto, rc.concepto, replace(cs.nombre, " ", "") as banco, orden '+
       'FROM RepCaja AS rc LEFT JOIN clasif_servicios cs on cs.orden=rc.idbanco LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv '+
       'where rc.FechaAlta between "'+f1+'" and "'+f2+'" and rc.tipo = "Ing" and ts.nombre = "CAJA BANCOS" and rc.concepto like "OTROS%" '+
       ') as t group by concepto, orden order by orden', 0, sqlgeneral);
while not sqlgeneral.Eof do
  begin
  querys('Insert into tmpIngresos'+frmprincipal.idmaq+' (Concepto, '+sqlgeneral.fieldbyname('banco').AsString+', TOTAL) values ("'+
         sqlgeneral.fieldbyname('concepto').AsString+'", '+sqlgeneral.fieldbyname('monto').AsString+', '+
         sqlgeneral.fieldbyname('monto').AsString+')', 1, dmreportes.sqlgeneral6);
  sqlgeneral.Next;
  end;


querys('SELECT *, "'+meses[strtoint(mes)]+'-'+ano+'" as periodo FROM `tmpIngresos'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
querys('SELECT replace(cs.nombre, " ", "") as banco, round(if(rc.moneda = "D", rc.monto, 0),2) as imp, rc.tc, '+
       'round(if(rc.moneda = "D", (rc.monto*rc.tc), rc.monto),2) as monto, cs.orden, rc.concepto, '+
       'if(cs.nombre="HSBCMN", "HSBCMN", if(concepto like "%RAP%", "RAP", rc.moneda)) as moneda FROM RepCaja AS rc '+
       'LEFT JOIN clasif_servicios cs on cs.orden=rc.idbanco LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv '+
       'where rc.FechaAlta between "'+f1+'" and "'+f2+'" and rc.tipo = "Dep" and ts.nombre = "CAJA BANCOS" order by moneda desc, idreporte asc', 0, dmreportes.sqlgeneral2);

operacionreporte('RepCaja', 'Reporte de Caja ', 'IMP', 1);

querys('DROP TABLE IF EXISTS tmpIngresos'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure RepCuentasxCategoria(fecha1,fecha2,tipoimpresion:string);
var sqlgeneral:TMyQuery;
begin
  sqlgeneral := TMyQuery.Create(nil);
  sqlgeneral.Connection := DMAccesos.conexion;
  querys('select c.idcliente, if(c.rsocial is NULL or c.rsocial="", if(c.apaterno is NULL or c.apaterno="", '+
  ' c.nombre, if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), '+
  'concat(c.nombre, " ", c.apaterno, " ", c.amaterno))), c.rsocial) as nombre, '+
  ' "Periodo del '+fecha1+' al '+fecha2+'" as periodo,'+
  ' con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,cat.nombre as categoria, '+
  ' sum(pc.abono) as Pago, count(p.idpedido) as NoMensualidades'+
  ' from clientes c '+
  ' left join contratos con on c.tipocont=con.tipocont '+
  ' left join pedidos p on p.idcliente=c.idcliente '+
  ' left join categorias cat on c.idcategoria=cat.idcategoria'+
  ' left join PagosClientes pc on pc.idpedido=p.idpedido and movimiento=2 '+
  ' where c.estatus=1 and pc.fechaalta between "'+fecha1+'" and "'+fecha2+'" and p.idunidadnegocio=4'+
  ' group by idcliente order by giro, categoria,contrato,idcliente',0,DMREPORTES.sqlgeneral);
  querys('select giro,categoria,sum(pago) as total,count(idcliente) from ('+
  ' select c.idcliente, if(c.rsocial is NULL or c.rsocial="", if(c.apaterno is NULL or c.apaterno="", '+
  ' c.nombre, if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), concat(c.nombre, " ", c.apaterno, " ", c.amaterno))), c.rsocial) as nombre,'+
  ' con.nombre as contrato,if(cat.idgiro=1,"RESIDENCIAL","COMERCIAL") as giro,cat.nombre as categoria,'+
  ' sum(pc.abono) as Pago, count(p.idpedido) as NoMensualidades '+
  ' from clientes c left join contratos con on c.tipocont=con.tipocont '+
  ' left join pedidos p on p.idcliente=c.idcliente left join categorias cat on c.idcategoria=cat.idcategoria'+
  ' left join PagosClientes pc on pc.idpedido=p.idpedido and movimiento=2 '+
  ' where c.estatus=1 and pc.fechaalta between "'+fecha1+'" and "'+fecha2+'" and p.idunidadnegocio=4'+
  ' group by idcliente order by giro, categoria,contrato,idcliente) as t group by giro,categoria',0,dmreportes.sqlgeneral2);
  operacionreporte('Repcuentasxcategoria', 'Reporte de Cuentas X Categoria ', 'IMP', 1);
end;

procedure RepClientesRFC(de,hasta:string);
begin
querys('select c.idcliente, if(c.rsocial is NULL or c.rsocial="", if(c.apaterno is NULL or c.apaterno="", c.nombre, if(c.amaterno is NULL or c.amaterno="",'+
        'concat(c.nombre, " ", c.apaterno), concat(c.nombre, " ", c.apaterno, " ", c.amaterno))), c.rsocial) as nombre, cf.rfc, st_date as fechaalta '+
        'from clientes c left join ClientesFact cf on c.idfact=cf.idfact where c.idcliente>='+de+' and c.idcliente<='+hasta,0,dmreportes.sqlgeneral);
operacionreporte('ClientesRFC', 'Reporte de Cuentas con RFC', 'IMP', 1);
end;

procedure RepPagosXLineaDet(mes, ano:string; guardar:integer);
var cad:string;
begin
if guardar = 1 then
   begin
   if  querys('Select periodo from RepPagosXLineaDet where PeriodoReporte = "'+mes+'-'+ano+'"', 0, dmreportes.sqlgeneral5) > 0 then
      begin
      Application.MessageBox('Ya se ha generado el reporte del periodo', 'Aviso', MB_ICONINFORMATION);
      exit;
      end;
   cad := 'Insert into RepPagosXLineaDet (idfactura, idremicion, FechaFactura, FechaRemision, FechaCobro, '+
         'anio, estatus, Importe, iva, piva, total, MONITOREO, INTERESES, SERVICIO, EQUIPO, OTROS, periodo, '+
         'PeriodoReporte, usuario, fecha, hora)';
   end
else
   cad := '';
if querys(cad+'Select r.idfactura, r.idremicion, rf.FechaAlta AS FechaFactura, p.FechaRemision,r.FechaAlta as FechaCobro, '+
       'year(p.FechaRemision) as anio, if(r.idfactura IS NULL, "REMISIONADO", "FACTURADO") as estatus, '+
       'round((r.abono/(p.piva+1)),2) as Importe, round(((r.abono/(p.piva+1)) *p.piva),2) as iva, p.piva, '+
       'round(r.abono,2) as total, r.MONITOREO, r.INTERESES, r.SERVICIO, r.EQUIPO, r.OTROS, r.periodo, r.PeriodoReporte, '+
       '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+timetostr(time)+'" '+
       'from RepPagosXLinea as r left join RemiFact as rf on (r.idFactura=rf.idFactura) left join pedidos as p '+
       'on p.idpedido=r.idpedido where upper(PeriodoReporte) = "'+mes+'-'+ano+'" group by idpago '+
       'order by anio,piva,estatus desc,idfactura', guardar, dmreportes.sqlgeneral2) = 0 then
   application.MessageBox('Favor de revisar que este generado el cierre de Pagos por Linea Primero', 'Atencion', MB_ICONINFORMATION);
end;

procedure CanceladosYMorosos(mes, ano, sectorini, sectorfin, TipoImpresion:string; guardar:integer; auditoria:boolean=false);
var cad1, cad2, cad3, cond, mesnombre : string;
begin

//si es igual a 0 manda la fecha :P
if guardar = 1 then
  begin
  mesnombre := UpperCase(meses[strtoint(mes)]);
   if querys('Select * from RepCanceladosMorosos where periodo  = "'+mesnombre+'-'+ano+'"', 0, dmreportes.sqlgeneral) > 0 then
      begin
      application.MessageBox('Ya se ha generado el reporte del periodo','Atención',mb_iconwarning);
      exit;
      end
   else
    cond := 'and year(c.FechaCancelacion) = "'+ano+'"  and month(c.FechaCancelacion)="'+mes+'" ';
  end
else
  begin
  if auditoria = false then
  begin
  cond := 'and c.FechaCancelacion between "'+mes+'"  and "'+ano+'" '+
          'and s.nombre Between '+sectorini+' and '+sectorfin+' ';
  mesnombre := UpperCase(meses[monthof(strtodate(mes))]);
  end
  else
  begin
  mesnombre := UpperCase(meses[strtoint(mes)]);
  end;
  end;

if auditoria = false then
begin
cad1 := 'SELECT c.sector, c.saldo, c.idcliente, c.TipoCont, c.MemoCancelacion, c.FechaCancelacion, mc.nombre as motivo, '+
       'c.idmotivo, cf.NombreCres as nombre, con.nombre as contrato, s.nombre as SectorNombre, '+
       'concat(ifnull(c.dir,''''),'' '',ifnull(c.numero,''''),'' '',ifnull(colonias.nombre,'' '')) as Dir, '+
       '"'+mesnombre+'-'+ano+'" as periodo, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"  as usuario, curdate() as fecha, curtime() as hora '+
       'FROM clientes as c Left Join ClientesFact as cf ON (cf.idfact=c.idfact) '+
       'LEFT JOIN contratos as con ON (con.TipoCont=c.TipoCont) LEFT JOIN MotCancel as mc ON (mc.idmotivo=c.idmotivo) '+
       'LEFT JOIN sectores as s ON (s.idsector=c.sector) left join colonias on  colonias.idcol=c.idcol '+
       'WHERE con.TipoCont in ("CAN","MOR") and c.idcliente <> 10000 '+cond+

       'order by c.sector,c.idcliente asc';

cad2 := 'SELECT count(c.idmotivo) as total,mc.nombre,mc.idmotivo, '+
        '"'+mesnombre+'-'+ano+'" as periodo, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"  as usuario, curdate() as fecha, curtime() as hora '+
        'FROM clientes as c '+
        'INNER JOIN MotCancel as mc ON (mc.idmotivo=c.idmotivo) '+
        'LEFT JOIN contratos as con ON (con.TipoCont=c.TipoCont) LEFT JOIN sectores as s ON (s.idsector=c.sector) '+
        'WHERE con.TipoCont in ("CAN","MOR") and c.idcliente <> 10000 '+cond+
        'GROUP BY mc.idmotivo ';

cad3 := 'SELECT count(c.idcliente) as total,g.nombre as giro, '+
        '"'+mesnombre+'-'+ano+'" as periodo, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"  as usuario, '+
        'curdate() as fecha, curtime() as hora '+
        'FROM clientes as c ' +
        'left join giros g on c.idgiro=g.idgiro ' +
        'INNER JOIN MotCancel as mc ON (mc.idmotivo=c.idmotivo) ' +
        'LEFT JOIN contratos as con ON (con.TipoCont=c.TipoCont) ' +
        'LEFT JOIN sectores as s ON (s.idsector=c.sector) ' +
        'WHERE con.TipoCont in ("CAN","MOR") and c.idcliente <> 10000 '+cond+
        'GROUP BY c.idgiro';
end
else
begin
cad1 := 'Select * from RepCanceladosMorosos where periodo  = "'+mesnombre+'-'+ano+'"';
cad2 := 'Select * from RepCanceladosMorosos2 where periodo  = "'+mesnombre+'-'+ano+'"';
cad3 := 'Select * from RepCanceladosMorosos3 where periodo  = "'+mesnombre+'-'+ano+'"';
end;

if guardar = 1 then
  begin
  if querys('Insert into RepCanceladosMorosos (sector, saldo, idcliente, TipoCont, MemoCancelacion, FechaCancelacion, motivo, '+
         'idmotivo, nombre, contrato, SectorNombre, Dir, periodo, usuario, fecha, hora) '+cad1,1,dmreportes.sqlgeneral) > 0 then
  begin
  querys('Insert into RepCanceladosMorosos2 (total, nombre, idmotivo, periodo, usuario, fecha, hora) '+cad2,1,dmreportes.sqlgeneral2);
  querys('Insert into RepCanceladosMorosos3 (total, giro, periodo, usuario, fecha, hora) '+cad3,1,dmreportes.sqlgeneral3);
  application.MessageBox('Termino de guardar','Atención',mb_iconwarning);
  end
  else
  begin
  application.MessageBox('No se encontraron datos a guardar','Atención',mb_iconwarning);
  end;
  end
else
  begin
  querys(cad1,0,dmreportes.sqlgeneral);
  if dmreportes.sqlgeneral.RecordCount > 0 then
    begin
    querys(cad2,0,dmreportes.sqlgeneral2);
    querys(cad3,0,dmreportes.sqlgeneral3);
    OperacionReporte('ClientesCancelados2','',TipoImpresion,1);
    end
  else
    begin
    frmmensaje.Close;
    application.MessageBox('No hay datos a mostrar','Atención',mb_iconwarning);
    end;
  end;
end;
{
procedure SectoresVencidos(fecha1, fecha2, TipoImpresion:string;
          rgpuesto:integer; bloqueados, normales, forzosos, noreporte, sinenlace, guardar:boolean);
var cadena,servicio,user,passwd,msn,telefono:string;
    resultadosms:Boolean; f,activo:Integer;
    clientessms:Array of Array of string;
begin
  Screen.Cursor := crHourglass;
  //fecha1:='';
  //fecha2:='';
  //elimina tablas temporales
  querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
  querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (mov integer(11),idcliente integer(11), '+
  'saldo float default 0,condicion1 float default 0,condicion2 float default 0,condicion3 float default 0,condicion4 float default 0, '+
  //lineas
  'condicion1mon float default 0,condicion1int float default 0,condicion1ser float default 0,condicion1eq float default 0,condicion1ot float default 0,'+
  'condicion2mon float default 0,condicion2int float default 0,condicion2ser float default 0,condicion2eq float default 0,condicion2ot float default 0,'+
  'condicion3mon float default 0,condicion3int float default 0,condicion3ser float default 0,condicion3eq float default 0,condicion3ot float default 0,'+
  'condicion4mon float default 0,condicion4int float default 0,condicion4ser float default 0,condicion4eq float default 0,condicion4ot float default 0,'+
  'dias integer(11),tipo varchar(15),EstatusInstalacion varchar(50), '+
  'KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);
  //trae los nombres de los sectores
  //buscarsectorID;
  fecha1:=datetostr(now-eddias1.Value);
  fecha2:=datetostr(now-9999);
  //buscarUnidadID;

  cadena:='';
      cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
            '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta '+
            'FROM PagosClientes as pc left join pedidos as p ON p.idpedido=pc.idpedido LEFT JOIN clientes as c '+
            'ON c.idcliente=pc.idcliente LEFT JOIN sectores as s ON s.idsector=c.sector LEFT JOIN contratos as con '+
            'ON c.TipoCont=con.TipoCont '+
            'WHERE p.estatus in(3,4,6) AND pc.FechaVence BETWEEN "'+fecha2+'" AND "'+fecha1+'" AND restante > 0.9 and pc.movimiento IN(0,1) '+
            'and c.sector between '+sector1+' and '+sector2+' AND p.idUnidadNegocio between '+unidad1+' and '+unidad2+' and '+
            '(c.idabogado = '+idabogado+') ';

  if ( idabogado = '' ) or ( idabogado = '0' ) then
      cadena:= cadena+' and '+'(c.idabogado = '+idabogado+') ';
  else
  begin
    if bloqueados = false then
      cadena:=cadena+' and c.bloqueado = 0 '
    else
      cadena:=cadena+' and c.bloqueado in(0,1) ';
    if (normales) and (ckbforzosos) then  //para activos
      cadena := cadena + ' and con.estatus in (0,1)  '
    else
    begin
      if forzosos then //para inactivos
        cadena := cadena + ' and con.estatus = 0 ';
      if normales then
        cadena := cadena + ' and con.estatus = 1 and (c.idabogado = 0)';
    end;
  end;
  if (noReporte.checked = true) then
    cadena:=cadena+' and NoReporte=0';
  cadena:=cadena+' GROUP BY pc.idpago';
  querys(cadena,1,dmaccesos.sqlgeneral);

  querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
  querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);
  if (SinEnlace = true) and (forzosos = false) then
  begin
    cadena :='insert into temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
                '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta  '+
                'FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c '+
                'ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) LEFT JOIN '+
                'sectores as s ON (s.idsector=c.sector) '+
                'WHERE pc.FechaVence BETWEEN "'+fecha2+'" AND "'+fecha1+'" and p.estatus in(3,4) AND restante > 0.9 '+
                'and pc.movimiento IN(0,1) and c.sector between '+sector1+' and '+sector2+' AND '+
                'p.idUnidadNegocio between '+unidad1+' and '+unidad2+'  and c.TipoCont ="SEN" ';
      if ( idabogado = '' ) or ( idabogado = '0' ) then
      cadena:=cadena + ' and c.idabogado = '+idabogado;
    cadena:=cadena+' GROUP BY pc.idpago';
    querys(cadena,1,dmaccesos.sqlgeneral);
  end;

  if((SinEnlace = false) and (forzosos = true)) then
      querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+
      ' inner join clientes as c on (c.idcliente = temporal_sectorvence0'+frmprincipal.idmaq+'.cuenta) where c.TipoCont = ''SEN'' ',1,sqlgeneral);

  ///*borrar cuentas que son mayores a (dias)
  querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+
         ' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) '+
         'where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);
  //por el puesto es el rango de dias permitido para ver en el reporte
  if rgpuesto=0 then
    querys('select cuenta from temporal_sectorvence0'+frmprincipal.idmaq+
           ' where dias not between '+eddias1.text+' and '+eddias2.text,0,sqlgeneral)
  else if rgpuesto=1 then //encargada de cobranza
    querys('select cuenta,max(dias) as dias,count(cuenta) as n from temporal_sectorvence0'+frmprincipal.idmaq+
           ' GROUP BY cuenta HAVING dias>60',0,sqlgeneral)
  else if rgpuesto=2 then  //extrajudicial
    querys('select cuenta,max(dias) as dias,count(cuenta) as n from temporal_sectorvence0'+frmprincipal.idmaq+
           ' GROUP BY cuenta HAVING dias not between 60 and 90',0,sqlgeneral)
  else if rgpuesto=3 then //abogados
    querys('select cuenta,max(dias) as dias,count(cuenta) as n from temporal_sectorvence0'+frmprincipal.idmaq+
           ' GROUP BY cuenta HAVING dias<91',0,sqlgeneral);
  //eliminar las cuentas que no entren dentro del rango
  while not sqlgeneral.Eof do
  begin
    querys('DELETE  from temporal_sectorvence0'+frmprincipal.idmaq+' where cuenta = '+
            sqlgeneral.fieldbyname('cuenta').AsString ,1,dmreportes.sqlgeneral2);
    sqlgeneral.Next;
  end;

  querys('INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+' (idcliente,dias) SELECT pc.idcliente,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias '+
         ' FROM PagosClientes as pc INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago) '+
         ' GROUP BY pc.idcliente  HAVING dias <= '+eddias2.text+' ',1,sqlgeneral);
  querys('SELECT if(i.EstatusInst=0,''PENDI'',if(i.EstatusInst=1,''INSTA'',if(i.EstatusInst=2,''SUPER'',if(i.EstatusInst=4,''UBICA'','+
         'if(i.EstatusInst=5,''CUESTI'',if(i.EstatusInst=7,''CANCE'','''')))))) AS valor,p.idcliente from instalaciones as i '+
         ' inner join pedidos as p on (p.idpedido=i.idpedido) inner join temporal_sectorvence'+frmprincipal.idmaq+' as t1 '+
         ' on(t1.idcliente=p.idcliente) where i.estatus  <> 1 having valor <>''''  ',0,sqlgeneral);
  while not sqlgeneral.Eof do
  begin
    querys('Update temporal_sectorvence'+frmprincipal.idmaq+' set EstatusInstalacion='+quotedstr(sqlgeneral.fieldbyname('valor').AsString)+
       ' where idcliente = '+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString)+'  ',1,dmreportes.sqlgeneral2);
    sqlgeneral.Next;
  end;
  if ( eddias1.Value <= 30 ) then
  begin
    if eddias1.Value <=30 then
      fecha1 := datetostr(now-eddias1.Value)
    else
      fecha1 := datetostr(now-0);
    if eddias2.Value >=30 then
      fecha2 := datetostr(now-30)
    else
      fecha2 := datetostr(now-eddias2.value);
    actualizar(fecha1,fecha2,'condicion1');
  end;
  if eddias1.Value <= 60 then
  begin
    if eddias1.Value > 31 then
    begin
      fecha1:=datetostr(now-0);
      fecha2:=datetostr(now-30);
      actualizar(fecha1,fecha2,'condicion1');
      fecha1:=datetostr(now-31)
    end
    else
      fecha1:=datetostr(now-31);
    if eddias2.Value >= 60 then
      fecha2:=datetostr(now-60)
    else
      fecha2:=datetostr(now-eddias2.Value);
    actualizar(fecha1,fecha2,'condicion2');
  end;
  if  ((eddias2.Value >= 90) or ((eddias2.Value  >=  61)  and   (eddias2.Value  <=  90 ))  ) then
  begin
    if eddias1.Value > 61 then
      fecha1:=datetostr(now-eddias1.Value)
    else
      fecha1:=datetostr(now-61);
    if eddias2.Value >= 90 then
      fecha2 := datetostr(now-90)
    else
      fecha2 := datetostr(now-eddias2.Value);
    actualizar(fecha1,fecha2,'condicion3');
  end;
  if eddias2.Value > 90 then
  begin
    fecha1:=datetostr(now-90);
    fecha2:='';
    actualizar(fecha1,fecha2,'condicion4');
  end;
  //actualizar saldo
  querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET saldo=condicion1+condicion2+condicion3+condicion4',1,dmaccesos.sqlgeneral);
  //generar reporte
  with dmreportes do
  begin
    fecha1:='Del Sector '+cbosector1.Text +' al '+cbosector2.Text +' de '+eddias1.Text+' dias a '+eddias2.Text;
    if ckbabogado.Checked = true then
    begin
      querys('Select idabogado,concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) as Abogado '+
      ' from abogados where idabogado='+quotedstr(edabogado.Text),0,sqlgeneral2);
      fecha2:='Abogado : '+sqlgeneral2.fieldbyname('Abogado').AsString;
    end
    else
      fecha2:='.';
    cadena:='Del Sector '+cbosector1.Text +' al '+cbosector2.Text;
    cadena := 'select '+quotedstr(fecha1)+' as titulo1,'+quotedstr(fecha2)+' as titulo2,'+quotedstr(cadena)+
            ' as titulo3,''SECTORES VENCIDOS'' as encabezado, t.saldo,t.idcliente,cf.NombreCres as nombre,t.condicion1,t.condicion2,'+
            't.condicion3,t.condicion4,t.dias,if (d.bloqueado=0,''N'',''B'') as tipo,con.nombre as contrato,EstatusInstalacion '+
            'from temporal_sectorvence'+frmprincipal.idmaq+' as t  LEFT JOIN clientes as d ON(d.idcliente=t.idcliente) '+
            'LEFT JOIN contratos as con ON (d.TipoCont=con.TipoCont) LEFT JOIN ClientesFact as cf ON  (d.idfact=cf.idfact) '+
            'where t.saldo > 2';
    querys(cadena,0,sqlgeneral);
    querys('select linea,round(condicion1+condicion2+condicion3+condicion4,2) as saldo, round(condicion1,2) as condicion1, round(condicion2,2) as condicion2, ' + #13#10 +
           'round(condicion3,2) as condicion3, round(condicion4,2) as condicion4' + #13#10 +
           ' from (select ''Monitoreo'' as linea, sum(condicion1mon) as condicion1, sum(condicion2mon) as condicion2, '+
           ' sum(condicion3mon) as condicion3, sum(condicion4mon) as condicion4' + #13#10 +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Intereses'' as linea, sum(condicion1int), sum(condicion2int), sum(condicion3int), sum(condicion4int)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Servicio'' as linea, sum(condicion1ser),sum(condicion2ser), sum(condicion3ser), sum(condicion4ser)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Equipo'' as linea, sum(condicion1eq), sum(condicion2eq), sum(condicion3eq), sum(condicion4eq)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+' UNION' +
           ' select ''Otros'' as linea, sum(condicion1ot), sum(condicion2ot), sum(condicion3ot), sum(condicion4ot)' +
           ' from temporal_sectorvence'+frmprincipal.idmaq+
           ') as t', 0, sqlgeneral2);
    Screen.Cursor := crDefault;
    if sqlgeneral.FieldByName('idcliente').AsString <> '' then
    begin
      frmmensaje.Close;
      //REPORTE DE SECTORES VENCIDOS
      OperacionReporte('SectoresVencidos','Reportes de ',TipoImpresion, 1);
      //SMS
      if(chksms.Checked=true)then
      begin
        querys('select c.idcliente,replace(replace(trim(tel.telefono),"044-",""),"-","") as telefono '+
               ' from temporal_sectorvence'+frmprincipal.idmaq+' t left join clientes c on c.idcliente=t.idcliente '+
               ' left join telefonos tel on c.idtel=tel.idtel and tel.tipo_tel="CELULAR" GROUP BY idcliente',0,sqlgeneral2);
        SetLength(clientessms, 3);
        SetLength(clientessms[0], sqlgeneral2.RecordCount);
        SetLength(clientessms[1], sqlgeneral2.RecordCount);
        SetLength(clientessms[2], sqlgeneral2.RecordCount);
        servicio := GetConfiguraciones('ServicioSMS',true);
        user := GetConfiguraciones('UsuarioSMS',true);
        passwd := GetConfiguraciones('PasswordSMS',true);
        msn := GetConfiguraciones('MsnSMSVencido',false);
        activo:= StrToInt(GetConfiguraciones('ActivoSMS',true));
        while not sqlgeneral2.EOF do
        begin
          if(sqlgeneral2.FieldByName('telefono').AsString<>'') then
          begin
            telefono := ValidarCelularSMS(sqlgeneral2.fieldbyname('telefono').AsString);
            resultadosms := false;
            try
            if activo=1 then
              resultadosms := GetInfomensajeSoap(False, '', nil).Enviar(servicio,user,passwd,telefono,msn)
            else
              resultadosms := true;
            except
              //Application.MessageBox('Falla en el Servicio de Comunets, Intentelo mas tarde','Aviso',MB_OK+MB_ICONEXCLAMATION);
              resultadosms:=false;
            end;
            if(resultadosms)then
            begin
              clientessms[0,sqlgeneral2.RecNo-1]:='1'; //enviados
              clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
              clientessms[2,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('telefono').AsString;
              //ShowMessage('Fallo al enviar SMS');
            end
            else
            begin
              clientessms[0,sqlgeneral2.RecNo-1]:='2'; //fallidos
              clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
              clientessms[2,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('telefono').AsString;
            end;
          end
          else
          begin
            clientessms[0,sqlgeneral2.RecNo-1]:='3'; //Sin Telefono Celular
            clientessms[1,sqlgeneral2.RecNo-1]:=sqlgeneral2.FieldByName('idcliente').AsString;
            clientessms[2,sqlgeneral2.RecNo-1]:='';
          end;
          sqlgeneral2.Next;
        end;
        querys('DROP TABLE IF EXISTS clientesSMS'+frmprincipal.idmaq,1, sqlgeneral2);
        querys('CREATE TABLE clientesSMS'+frmprincipal.idmaq+' (idcliente int(11) NOT NULL default "0", '+
                'tipo varchar(80) NOT NULL default "",telefono varchar(80) NOT NULL default "") TYPE=MyISAM',1,sqlgeneral2);
        for f:=0 to Length(clientessms[0])-1 do
           querys('insert into clientesSMS'+frmprincipal.idmaq+'(idcliente,tipo,telefono) values ('+clientessms[1,f]+
                  ','+quotedstr(clientessms[0,f])+','+quotedstr(clientessms[2,f])+')',1,sqlgeneral2);
        querys('select cs.idcliente, '+ClienteNombre('c')+' as nombre, replace(replace(trim(cs.telefono),"044-",""),"-","") as telefono, if(tipo="1","Enviados",if(tipo="2","Fallidos","Sin Telefono Celular")) as tipo '+
               ' from clientesSMS'+frmprincipal.idmaq+' cs left join clientes c on c.idcliente=cs.idcliente order by tipo, idcliente',0,sqlgeneral2);
        OperacionReporte('ClientesSMS','',TipoImpresion,1);
        querys('drop table clientesSMS'+frmprincipal.idmaq,1,sqlgeneral2);
      end;
      if chkcelulares.Checked then
      begin
        querys('Select clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial = '''',concat(ifnull(clientes.nombre,''''),'' '','+
               ' ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'' '')),clientes.rsocial) as Nombre,replace(replace(trim(telefonos.telefono),"044-",""),"-","") as telefono '+
               ' From clientes Inner Join telefonos ON clientes.idtel = telefonos.idtel inner join temporal_sectorvence'+frmprincipal.idmaq+
               ' on temporal_sectorvence'+frmprincipal.idmaq+'.idcliente=clientes.idcliente Where telefonos.tipo_tel = ''CELULAR'' and '+
               ' temporal_sectorvence'+frmprincipal.idmaq+'.dias <=60',0,dmreportes.sqlgeneral4);
        OperacionReporte('CelularesClientes','Reportes de ',TipoImpresion, 1);
      end;
    end
    else
    begin
      Screen.Cursor := crDefault;
      frmmensaje.Close;
      application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);
    end;
    querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
    querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,sqlgeneral);
  end;//reportes

end;

procedure actualizar(fecha1,fecha2,campo:string);
begin
  ////no aparexcan pagos si tienen parcialidades
  if campo <> 'condicion4' then                                                             //<> 3              <> 0
      querys('SELECT sum(pc.restante) as total,pc.idcliente as cli,pc.idpedido,l.idlinea, l.nombre as linea  '+
      ' FROM PagosClientes as pc LEFT JOIN pedidos as p ON(p.idpedido=pc.idpedido) '+
      ' left join UnidadNegocio u on u.idunidadnegocio=p.idUnidadNegocio '+
      ' left join lineas l on l.idlinea=u.idlinea '+
      ' WHERE p.estatus in(3,4) and pc.movimiento in(0,1,4) AND pc.restante <> 0 '+
      'AND pc.FechaVence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+
      ' AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' GROUP BY pc.idpedido,l.idlinea',0,dmreportes.sqlgeneral2)
  else
      querys('SELECT sum(pc.restante) as total,pc.idcliente as cli,pc.idpedido,l.idlinea, l.nombre as linea  '+
      ' FROM PagosClientes as pc LEFT JOIN pedidos as p ON(p.idpedido=pc.idpedido) '+
      ' left join UnidadNegocio u on u.idunidadnegocio=p.idUnidadNegocio '+
      ' left join lineas l on l.idlinea=u.idlinea '+
      ' WHERE p.estatus in(3,4) and pc.movimiento in(0,1,4) AND pc.restante <> 0 AND pc.FechaVence < '+quotedstr(fecha1)+
      ' AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' GROUP BY pc.idpedido, l.idlinea',0,dmreportes.sqlgeneral2);
  while not dmreportes.sqlgeneral2.Eof do
  begin
     querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'=('+campo+' + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '1') then //monitoreo
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'mon=('+campo+'mon + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '2') then // intereses
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'int=('+campo+'int + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '3') then //servicio
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'ser=('+campo+'ser + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '4') then //equipo
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'eq=('+campo+'eq + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     if(dmreportes.sqlgeneral2.fieldbyname('idlinea').AsString = '5') then //otros
        querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'ot=('+campo+'ot + '+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+
            quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     dmreportes.sqlgeneral2.Next;
  end;
end;     }

End.
