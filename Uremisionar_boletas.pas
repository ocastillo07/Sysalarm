{///////////////////////////////////////////////////////////////////////////////
2010/09/27 Oscar  agrege el filtro de bloqueado=0 en el query de remisionar boletas
2010/05/12 dalyla en cerrar DROP TABLE IF EXISTS temporal_boletasCOM'+frmprincipal.idmaq
2009/01/27 Oscar validacion en remisionar para que no remisione un pedido que ya tiene una fac,rem o rem2
2008/11/27 oscar botonremisionar
2008/11/25 oscar comunicadores
2008/09/13 Oscar agrege el proceso de remisionar pediddos COMUNICADOR
2008/06/04 oscar agrege dos procedures en el boton remisionar llenarcuantasact y llenarremimon
2008/04/24 dalyla cliente cambios
2008/02/28 dalyla zona horaria ok
2008/01/23 Dalyla btnremisionar query usaba sqlgeneral2 y lo cambie por 8
2007/10/03 Dalyla Procedure ComisionesVend; y la quite jajaja
}///////////////////////////////////////////////////////////////////////////////
unit Uremisionar_boletas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, RzPanel,DateUtils,
  RzPrgres;

type
  Tfrmremisionar_boletas = class(TForm)
    gbperiodo: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    dfecha1: TRzDateTimeEdit;
    dfecha2: TRzDateTimeEdit;
    btncerrar: TRzBitBtn;
    btnalta: TRzBitBtn;
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    mm1: TRzMemo;
    mm2: TRzMemo;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmremisionar_boletas: Tfrmremisionar_boletas;

implementation

uses Urecursos, Udmrep, Uprincipal;

{$R *.dfm}

procedure Tfrmremisionar_boletas.FormShow(Sender: TObject);
var fecha:string;
dias:word;
begin
dias:=daysinmonth(now);
fecha:=formatdatetime('yyyy"/"mm"/',now)+'01' ;
dfecha1.Date:=strtodate(fecha);
fecha:=formatdatetime('yyyy"/"mm"/',now)+vartostr(dias) ;
dfecha2.Date:=strtodate(fecha);
end;

procedure Tfrmremisionar_boletas.btnaltaClick(Sender: TObject);
var idcliente:string;
begin
   if dfecha1.Date<= dfecha2.Date then
   begin
      with dmreportes do
      begin
         querys('DROP TABLE IF EXISTS temporal_boletas'+frmprincipal.idmaq,1,sqlgeneral2);
         querys('CREATE TABLE temporal_boletas'+frmprincipal.idmaq+' (idpedido int(11),idcliente int(11),saldo double,FechaVence '+
                ' date,KEY idpedido (idpedido))',1,sqlgeneral2);
         querys('INSERT INTO temporal_boletas'+frmprincipal.idmaq+' (idpedido,idcliente,saldo,FechaVence) SELECT distinct '+
                ' p.idpedido,p.idcliente,p.TotMn,p.FechaVencimiento FROM pedidos as p LEFT JOIN clientes as dc ON '+
                ' (dc.idcliente=p.idcliente) LEFT JOIN contratos as con ON (con.TipoCont=dc.TipoCont) LEFT JOIN DetPedido as dp '+
                ' ON (dp.idpedido=p.idpedido)  LEFT JOIN UnidadNegocio as l on (l.idUnidadNegocio=p.idUnidadNegocio) '+
                ' WHERE p.estatus=0 and con.estatus=1  and remisiona = 1 and l.nombre=''MONITOREO''  and  p.FechaCreacion  between '+
                quotedstr(dfecha1.Text)+' and '+quotedstr(dfecha2.Text)+' and p.Anualidad=0 and dc.bloqueado=0 order by idcliente',1,sqlgeneral2);
         querys('SELECT * FROM temporal_boletas'+frmprincipal.idmaq,0,sqlgeneral2);
         if sqlgeneral2.FieldByName('idpedido').AsString <> '' then
         begin
            mm1.clear;
            while not sqlgeneral2.Eof do
            begin
               if querys('select idcliente,idpedido from pedidos where estatus in (3,4,5) and idunidadnegocio = 4 and '+
                  ' concepto like "%'+meses[monthof(dfecha1.date)]+'%" and concepto like "%'+inttostr(yearof(dfecha1.Date))+'%" and idcliente='+
                  sqlgeneral2.FieldByName('idcliente').AsString,0,sqlgeneral3)=0 then
               begin
                  querys('select idremicion from folios',0,sqlgeneral3);
                  querys('INSERT INTO RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1)+','+quotedstr(sqlgeneral2.fieldbyname('idpedido').AsString)+',CURDATE(),"'+FormatDateTime('HH:mm:ss',Time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,sqlgeneral);
                  querys('INSERT INTO PagosClientes (idcliente,idremicion,idpedido,FechaAlta,cargo,restante,movimiento,FechaVence,usuario,fecha,hora) VALUES ('+quotedstr(sqlgeneral2.fieldbyname('idcliente').AsString)+','+inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1)+','+quotedstr(sqlgeneral2.fieldbyname('idpedido').AsString)+','+
                  'CURDATE(),'+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+','+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+',0,'+quotedstr(sqlgeneral2.fieldbyname('FechaVence').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+',"'+datetostr(date)+'","'+timetostr(time)+'")',1,sqlgeneral);
                  bpcambios('clientes', sqlgeneral2.fieldbyname('idcliente').AsString, 'idcliente');
                  querys('UPDATE clientes SET saldo=saldo + '+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+', TotComprado=TotComprado+ '+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+' WHERE idcliente='+quotedstr(sqlgeneral2.fieldbyname('idcliente').AsString),1,sqlgeneral);
                  apcambios('idcliente', sqlgeneral2.fieldbyname('idcliente').AsString, 'clientes', 'frmremisionar_boletas');
                  querys('Update folios set idremicion ='+inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1),1,sqlgeneral8);
                  mm1.Lines.Add(sqlgeneral2.fieldbyname('idpedido').AsString+'-'+inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1)+'-'+sqlgeneral2.fieldbyname('idcliente').AsString);
                  querys('UPDATE pedidos as p,temporal_boletas'+frmprincipal.idmaq+' as tb SET p.estatus=3, p.Saldo=tb.saldo, p.FechaRemision = Curdate() WHERE p.idpedido= '+quotedstr(sqlgeneral2.fieldbyname('idpedido').AsString)+
                         ' and tb.idpedido=p.idpedido and p.estatus=0',1,sqlgeneral8);
                  //Comunicador {Proceso para generar los pedidos en caso de que no tenga}
                  idcliente:=sqlgeneral2.fieldbyname('idcliente').AsString;
                  querys('select tipocont from clientes where idcliente='+idcliente,0,sqlgeneral);
                  if (sqlgeneral.FieldByName('tipocont').asstring='17') then
                  begin
                     if (querys('select p.idpedido from pedidos p left join '+
                        ' DetPedido dp using(idpedido) where p.idunidadnegocio=2 and dp.cod_cve="COMUNICADOR" and p.concepto like"%'+
                        meses[monthof(date)]+'%" and p.idcliente='+idcliente,0,sqlgeneral)=0) then
                           generarpedidosCom(idcliente,1,false);
                     //actualiza la fecha de la renta del comunicador
                     querys('update rentascom set fecharenta="'+datetostr(EncodeDate(yearof(date),monthof(date),
                            DaysInMonth(date)))+'" where idcliente='+idcliente,1,sqlgeneral);
                  end;
               end;
               sqlgeneral2.Next;
            end;
         end;
         //oscar
         //REMISIONAR LOS PEDIDOS DE RENTA COMUNICADOR
         querys('DROP TABLE IF EXISTS temporal_boletasCOM'+frmprincipal.idmaq,1,sqlgeneral2);
         querys('CREATE TABLE temporal_boletasCOM'+frmprincipal.idmaq+
         ' (idpedido int(11),idcliente int(11),saldo double,FechaVence date,KEY idpedido (idpedido))',1,sqlgeneral2);
         querys('INSERT INTO temporal_boletasCOM'+frmprincipal.idmaq+' (idpedido,idcliente,saldo,FechaVence) '+
         ' SELECT distinct p.idpedido,p.idcliente,p.TotMn,p.FechaVencimiento FROM pedidos as p LEFT JOIN clientes as dc ON '+
         ' (dc.idcliente=p.idcliente) LEFT JOIN contratos as con ON (con.TipoCont=dc.TipoCont) '+
         ' LEFT JOIN DetPedido as dp ON (dp.idpedido=p.idpedido)  LEFT JOIN UnidadNegocio as l on '+
         ' (l.idUnidadNegocio=p.idUnidadNegocio) WHERE p.estatus=0 and con.estatus=1  and remisiona = 1 and l.nombre=''SERVICIOS'' '+
         ' and con.tipocont=17 and  p.FechaCreacion  between '+quotedstr(dfecha1.Text)+' and '+quotedstr(dfecha2.Text)+' and p.Anualidad=0',1,sqlgeneral2);
         querys('SELECT * FROM temporal_boletasCOM'+frmprincipal.idmaq,0,sqlgeneral2);
         mm1.Lines.Add('   ');
         mm1.Lines.Add('REMISIONES RENTA DE COMUNICADORES');
         if sqlgeneral2.FieldByName('idpedido').AsString <> '' then
         begin
            while not sqlgeneral2.Eof do
            begin
               querys('select idremicion from folios',0,sqlgeneral3);
               querys('INSERT INTO RemiFact (idremicion,idpedido,FechaAlta,HoraAlta,UsuarioAlta) values ('+
               inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1)+','+quotedstr(sqlgeneral2.fieldbyname('idpedido').AsString)+
               ',CURDATE(),"'+FormatDateTime('HH:mm:ss',Time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+')',1,sqlgeneral);
               querys('INSERT INTO PagosClientes (idcliente,idremicion,idpedido,FechaAlta,cargo,restante,movimiento,FechaVence,'+
               'usuario,fecha,hora) VALUES ('+quotedstr(sqlgeneral2.fieldbyname('idcliente').AsString)+','+
               inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1)+','+quotedstr(sqlgeneral2.fieldbyname('idpedido').AsString)+','+
               'CURDATE(),'+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+','+
               quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+',0,'+quotedstr(sqlgeneral2.fieldbyname('FechaVence').AsString)+
               ','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+',"'+datetostr(date)+'","'+timetostr(time)+'")',1,sqlgeneral);
               bpcambios('clientes', sqlgeneral2.fieldbyname('idcliente').AsString, 'idcliente');
               querys('UPDATE clientes SET saldo=saldo + '+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+
               ', TotComprado=TotComprado+ '+quotedstr(sqlgeneral2.fieldbyname('saldo').AsString)+' WHERE idcliente='+
               quotedstr(sqlgeneral2.fieldbyname('idcliente').AsString),1,sqlgeneral);
               apcambios('idcliente', sqlgeneral2.fieldbyname('idcliente').AsString, 'clientes', 'frmremisionar_boletas');
               querys('Update folios set idremicion ='+inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1),1,sqlgeneral8);
               mm1.Lines.Add(sqlgeneral2.fieldbyname('idpedido').AsString+'-'+inttostr(sqlgeneral3.Fields.Fields[0].Asinteger+1)+'-'+
               sqlgeneral2.fieldbyname('idcliente').AsString);
               querys('UPDATE pedidos as p,temporal_boletasCOM'+frmprincipal.idmaq+' as tb SET p.estatus=3, p.Saldo=tb.saldo, '+
               ' p.FechaRemision = Curdate() WHERE p.idpedido= '+quotedstr(sqlgeneral2.fieldbyname('idpedido').AsString)+
               ' and tb.idpedido=p.idpedido and p.estatus=0',1,sqlgeneral8);
               sqlgeneral2.Next;
            end;
         end;

         //MOSTRAR LAS CUENTAS QUE ESTEN CANCELADAS Y POR TAL NO FUERON REMISIONADAS SUS PEDIDOS
         querys('SELECT p.idpedido as p,p.idcliente as c FROM pedidos as p LEFT JOIN clientes as dc ON (dc.idcliente=p.idcliente) '+
         ' LEFT JOIN contratos as con ON (con.TipoCont=dc.TipoCont) LEFT JOIN DetPedido as dp ON (dp.idpedido=p.idpedido)  '+
         ' LEFT JOIN UnidadNegocio as l on (l.idUnidadNegocio=p.idUnidadNegocio) '+
         ' WHERE p.estatus=0 and con.estatus=1 and l.nombre=''MONITOREO''  '+
         ' and  p.FechaCreacion  between '+quotedstr(dfecha1.Text)+' and '+quotedstr(dfecha2.Text)+' ',0,sqlgeneral2);
         if sqlgeneral2.FieldByName('p').AsString <> '' then
         begin
            mm2.Clear;
            while not sqlgeneral2.Eof do
            begin
               mm2.Lines.Add(sqlgeneral2.fieldbyname('p').AsString+'-'+sqlgeneral2.fieldbyname('c').AsString);
               sqlgeneral2.Next;
            end;
         end;//if p
         querys('DROP TABLE IF EXISTS temporal_boletas'+frmprincipal.idmaq,1,sqlgeneral2);
      end;//dmreportes
      application.MessageBox('Proceso Terminado','Aviso',MB_OK+MB_ICONINFORMATION);
   end
   else
   begin
      application.MessageBox('La fecha de inicio no debe ser mayor que la fecha final!','Atención',mb_iconinformation);
      dfecha1.SetFocus;
   end;
end;

procedure Tfrmremisionar_boletas.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmremisionar_boletas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('DROP TABLE IF EXISTS temporal_boletas'+frmprincipal.idmaq,1,dmreportes.sqlgeneral2);
querys('DROP TABLE IF EXISTS temporal_boletasCOM'+frmprincipal.idmaq,1,dmreportes.sqlgeneral2);
action:=cafree;
end;

End.
