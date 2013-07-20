//2009/05/28 oscar campo tipo con tabla
//2009-02-17 agregar facturascanceladas 
//2008-12-04 Oscar correccion en el iva15
//2008-10-07 Oscar agrege el numero y concepto de la poliza capturables
//creada: 2008-05-30 Oscar Castillo

unit Uexportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls,
  RzPanel, dateutils, shellAPI,strutils;

type
  Tfrmexportar = class(TForm)
    gbventa: TRzGroupBox;
    RzLabel14: TRzLabel;
    RzLabel24: TRzLabel;
    btnexportar: TRzBitBtn;
    desde: TRzDateTimeEdit;
    hasta: TRzDateTimeEdit;
    memo: TRzMemo;

    procedure FormShow(Sender: TObject);
    procedure btnexportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure encabezadopoliza(fecha:string;contador:integer);
    procedure detmovimiento(cuenta,tipo:string;importe:double;concepto,fecha:string);
  private

  public

  end;

var
  frmexportar: Tfrmexportar;
  poliza,movimiento:string;


implementation

uses Udmrep, Urecursos, DB, Uprincipal;

{$R *.dfm}

procedure Tfrmexportar.FormShow(Sender: TObject);
begin
   desde.Date := encodedate(yearof(today), monthof(today), DayOf(today-1));
   hasta.Date := today-1;
end;

procedure Tfrmexportar.btnexportarClick(Sender: TObject);
var fecha,fechafac,cuenta,id,concepto:string;
    importe,iva10,iva15:double; contador:integer;
    entro:boolean;
begin
   try  //oscar
      contador:=strtoint(InputBox('Numero Poliza','Ingrese el Numero de Poliza',''));
      concepto:=InputBox('Concepto Poliza','Ingrese el Concepto:','');
   except
      On e:Exception do
      begin
         MessageDlg('"Error: El valor no es un Numero Valido"',mtError,[mbOK],0);
         exit;
      end;
   end;
   entro:=false;
   with dmreportes do
   begin
      querys('DROP TABLE IF EXISTS tmpExportar'+frmprincipal.idmaq,1,sqlgeneral);
      querys('Create table tmpExportar'+frmprincipal.idmaq+'  SELECT "1" as id,cc.tipo,cuenta,piva,fechafactura,'+
      ' round(sum(if(dp.cant > 0,(dp.cant*dp.costo)*dp.tc,(dp.piezas*dp.costo)*dp.tc)),2)  as subtotal,'+
      ' if(p.piva=0.1,round(sum(if(dp.cant>0,((dp.cant*dp.costo)*dp.tc)*p.pIVA,((dp.piezas*dp.costo)*dp.tc)*p.pIVA)),2),0) as IVA,'+
      ' if(p.piva=0.15,round(sum(if(dp.cant>0,((dp.cant*dp.costo)*dp.tc)*p.pIVA,((dp.piezas*dp.costo)*dp.tc)*p.pIVA)),2),0) as IVA2'+
      ' from DetPedido as dp LEFT JOIN pedidos as p ON (p.idpedido=dp.idpedido)'+
      ' LEFT JOIN articulos as a ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea)'+
      ' left join catalogoCuentas cc on l.idcuenta=cc.idcuenta'+
      ' WHERE p.FechaFactura between "'+desde.Text+'" and "'+hasta.Text+'"  and p.estatus in(1,4,6)'+
      ' group by fechafactura,piva,cuenta',1,sqlgeneral);
      querys('insert into tmpExportar'+frmprincipal.idmaq+' (id,tipo,cuenta,piva,fechafactura,subtotal,IVA,IVA2) '+
      ' SELECT "2" as id,c.tipo,cuenta,p.piva,fechabaja,round(sum(subtotal),2) as subtotal,'+
      ' if(p.piva=0.1,round(sum(p.iva),2),0) as iva,if(p.piva=0.15,round(sum(p.iva),2),0) as iva2'+
      ' FROM RemiFact as rm left JOIN pedidos as p ON (p.idfactura=rm.idfactura)'+
      ' left join UnidadNegocio as u on(p.idunidadnegocio=u.idunidadnegocio) left join lineas l on l.idlinea=u.idlinea'+
      ' left join catalogoCuentas c on c.idcuenta=l.idcuentacan '+
      ' WHERE rm.FechaBaja BETWEEN "'+desde.text+'" and "'+hasta.text+'" and p.estatus = 1 and'+
      ' p.idfactura is not null and p.idunidadnegocio<>18 GROUP BY fechabaja,piva,cuenta',1,sqlgeneral);
      querys('insert into tmpExportar'+frmprincipal.idmaq+' (id,tipo,cuenta,piva,fechafactura,subtotal,IVA,IVA2) SELECT "3" as id,cc.tipo,cc.cuenta,p.piva,fechanc,'+
      ' round(sum(if(dnc.cant > 0,if (dnc.tc>0, (dnc.cant*dnc.costo)*dnc.tc,(dnc.cant*dnc.costo)),'+
      ' if (dnc.tc>0,((dnc.piezas*dnc.costo) )*dnc.tc,(dnc.piezas*dnc.costo)))),2) as subtotal,'+
      ' if(p.piva=0.1,round(sum(if(dnc.cant > 0,if (dnc.tc>0,((dnc.cant*dnc.costo)*nc.piva)*dnc.tc,'+
      ' (dnc.cant*dnc.costo)*nc.piva),if (dnc.tc>0,((dnc.piezas*dnc.costo)*nc.piva)*dnc.tc,(dnc.piezas*dnc.costo)*nc.piva))),2),0) as IVA,'+
      ' if(p.piva=0.15,round(sum(if(dnc.cant > 0,if (dnc.tc>0,((dnc.cant*dnc.costo)*nc.piva)*dnc.tc,'+
      ' (dnc.cant*dnc.costo)*nc.piva),if (dnc.tc>0,((dnc.piezas*dnc.costo)*nc.piva)*dnc.tc,(dnc.piezas*dnc.costo)*nc.piva))),2),0) as IVA2'+
      ' from DetNotasCredito as dnc LEFT JOIN NotasCredito as nc ON (dnc.idnc=nc.idnc) left join pedidos as p on p.idfactura=nc.idfactura'+
      ' LEFT JOIN articulos as a ON (a.cod_cve=dnc.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea)'+
      ' left join catalogoCuentas as cc on cc.idcuenta=l.idcuentanc WHERE nc.FechaNc between "'+desde.text+'" and "'+hasta.text+'" '+
      ' group by fechanc,piva,cuenta',1,sqlgeneral);
       querys('select * from tmpExportar'+frmprincipal.idmaq+' order by fechafactura,id,cuenta',0,sqlgeneral);
      importe:=0;
      iva10:=0; iva15:=0;
      // para sacar el monto total
      sqlgeneral.First;
      fechafac:=sqlgeneral.fieldbyname('fechafactura').asstring;
      fecha:=AnsiReplaceStr(fechafac,'/','');
      id:=sqlgeneral.fieldbyname('id').AsString;
      encabezadopoliza(fecha,contador);
      while not sqlgeneral.Eof do
      begin
         if fechafac<>sqlgeneral.fieldbyname('fechafactura').asstring then
         begin
            //  CARGO A LA CUENTA CLIENTES
            if entro=false then
            begin
               detmovimiento('44001010001','2',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
               if iva15>0 then
                  detmovimiento('44001010002','2',strtofloat(Format('%8.2f',[(iva15)])),concepto,fecha);
               detmovimiento('12101031000','1',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
            end
            else
            begin
               if id='2' then
               begin
                  detmovimiento('44001010007','1',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
                  detmovimiento('12101031002','2',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
               end;
               if id='3' then
               begin
                  detmovimiento('44001010006','1',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
                  detmovimiento('12101031001','2',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
               end;
            end;

            importe:=0; iva10:=0;  iva15:=0;
            entro:=false;
            inc(contador);
            // poliza
            encabezadopoliza(AnsiReplaceStr(sqlgeneral.fieldbyname('fechafactura').asstring,'/',''),contador);
         end;
         if (id<>sqlgeneral.fieldbyname('id').asstring) and (fechafac=sqlgeneral.fieldbyname('fechafactura').asstring) then
         begin
            //CARGO A LA CUENTA CLIENTES
            if entro=false then
            begin
               detmovimiento('44001010001','2',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
               if iva15>0 then
                  detmovimiento('44001010002','2',strtofloat(Format('%8.2f',[(iva15)])),concepto,fecha);
               detmovimiento('12101031000','1',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
            end
            else
            begin
               if id='2' then
               begin
                  detmovimiento('44001010007','1',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
                  detmovimiento('12101031002','2',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
               end;
               if id='3' then
               begin
                  detmovimiento('44001010006','1',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
                  detmovimiento('12101031001','2',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
               end;
            end;
            importe:=0; iva10:=0;  iva15:=0;
         end;
         // ABONO A LAS CUENTAS DEPENDIENDO EL MOVIMIENTO
         fecha:=AnsiReplaceStr(sqlgeneral.fieldbyname('fechafactura').asstring,'/','');
         cuenta:=sqlgeneral.fieldbyname('cuenta').asstring;
         //se busca si son facturas candeladas o notas de credito
         if (sqlgeneral.fieldbyname('id').asstring='2') or (sqlgeneral.fieldbyname('id').asstring='3') then
         begin
            entro:=true;
            detmovimiento(cuenta,'1',sqlgeneral.fieldbyname('subtotal').AsFloat,concepto,fecha)
         end
         else
            detmovimiento(cuenta,'2',(sqlgeneral.fieldbyname('subtotal').AsFloat),concepto,fecha);
         //if sqlgeneral.fieldbyname('piva').asstring='0.1' then
         iva10:=iva10+sqlgeneral.fieldbyname('iva').AsFloat;
         //else
         iva15:=iva15+sqlgeneral.fieldbyname('iva2').AsFloat;
         importe:=importe+sqlgeneral.fieldbyname('subtotal').AsFloat;
         fechafac:=sqlgeneral.fieldbyname('fechafactura').asstring;
         id:=sqlgeneral.fieldbyname('id').AsString;
         sqlgeneral.Next;
      end;
      if entro then
      begin
         if id='2' then
         begin
            detmovimiento('44001010007','1',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
            if iva15>0 then
               detmovimiento('44001010002','2',strtofloat(Format('%8.2f',[(iva15)])),concepto,fecha);
            detmovimiento('12101031002','2',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
         end;
         if id='3' then
         begin
            detmovimiento('44001010006','1',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
            if iva15>0 then
               detmovimiento('44001010002','2',strtofloat(Format('%8.2f',[(iva15)])),concepto,fecha);
            detmovimiento('12101031001','2',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
         end;
      end
      else
      begin
         detmovimiento('44001010001','2',strtofloat(Format('%8.2f',[(iva10)])),concepto,fecha);
         if iva15>0 then
            detmovimiento('44001010002','2',strtofloat(Format('%8.2f',[(iva15)])),concepto,fecha);
         detmovimiento('12101031000','1',strtofloat(Format('%8.2f',[(importe+iva10+iva15)])),concepto,fecha);
      end;
      querys('DROP TABLE IF EXISTS tmpExportar'+frmprincipal.idmaq,1,sqlgeneral);
   end;
   //se genera el archivo
   memo.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'polizas.txt');
   memo.Clear;
   ShellExecute(0,nil,PChar(ExtractFilePath(Application.ExeName) + 'polizas.txt'),'','',SW_SHOWNORMAL);
end;

procedure Tfrmexportar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action:=cafree;
end;

procedure Tfrmexportar.encabezadopoliza(fecha:string;contador:integer);
   var x:integer;
begin
   {########################## POLIZA ####################################}
   // encabezado
   poliza:='P ';
   //02 fecha
   poliza:=poliza+fecha;
   //03 tipo de poliza
   poliza:=poliza+' 003 ';
   //04 numero de la poliza
   for x :=1  to 8-length(inttostr(contador)) do
   begin
      poliza:=poliza+'0';
   end;
   poliza:=poliza+inttostr(contador);
   //poliza:=poliza+'00000001';
   //05 clase de poliza
   poliza:=poliza+' 1';
   //06 no obligatorio
   poliza:=poliza+' 000 ';
   //07 Concepto
   for  x:=1  to 101 do
   begin
      poliza:=poliza+' ';
   end;
   //08 a donde se importara.. 09 si la poliza se a impreso
   poliza:=poliza+'01 2 ';
   memo.Lines.Add(poliza);
end;

procedure Tfrmexportar.detmovimiento(cuenta,tipo:string;importe:double;concepto,fecha:string);
   var x:integer;
begin
         //A identificador
         movimiento:='M ';
         //B cuenta que afecta
         movimiento:=movimiento+cuenta;
         for x :=length(cuenta) to 20 do
         begin
            movimiento:=movimiento+' ';
         end;
         //C dato no obligatorio referencia del documento(factura)
         for x := 1 to 11 do
         begin
            movimiento:=movimiento+' ';
         end;
         // D tipo de movimiento Cargo o Abono
         movimiento:=movimiento+tipo+' ';
         // E importe del movimiento
         for x :=1 to 15-length(floattostr(importe))+1 do
         begin
            movimiento:=movimiento+' ';
         end;
         movimiento:=movimiento+floattostr(importe)+' ';
         //F diario especial del movimiento NO Obligatorio
         movimiento:=movimiento+'    ';
         //G importe en moneda extranjera NO obligatorio
         movimiento:=movimiento+'            0.00 ';
         // H concepto del movimiento NO Obligatorio
         //concepto:=concepto+' '+copy(fecha,7,2)+copy(fecha,5,2)+copy(fecha,3,2);
         //concepto:='';
         movimiento:=movimiento+concepto;
         for x :=length(concepto) to 30 do
         begin
            movimiento:=movimiento+' ';
         end;
         memo.Lines.Add(movimiento);
end;

end.
