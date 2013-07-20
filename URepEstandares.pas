{///////////////////////////////////////////////////////////////////////////////
2009/06/15 dalyla tenddencia de ventas
2009/01/20 dalyla tendencia por dias habiles
--------------------------------------------------------------------------------
2008/08/04 dalyla cambio de nombre a la forma
}///////////////////////////////////////////////////////////////////////////////

unit URepEstandares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, StdCtrls, ExtCtrls, RzCmboBx, RzButton, RzLabel,
  ComCtrls, RzDTP;

type
  TfrmRepEstandares = class(TForm)
    btngenerar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    cbTipoImpresion: TRzComboBox;
    RzPanel1: TRzPanel;
    gbPeriodoMes: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtdesde: TRzDateTimePicker;
    dthasta: TRzDateTimePicker;
    Label3: TLabel;
    cbtipo: TRzComboBox;
    lblTitulo: TRzLabel;
    gbPeriodoAno: TRzGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cbomeses: TRzComboBox;
    cboano: TRzComboBox;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btngenerarClick(Sender: TObject);
    procedure cbtipoSelect(Sender: TObject);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    TipoImpresion:string;
    procedure RepEstandaresVentas(f1, f2:string);
  public
    { Public declarations }
    Rep:Integer;         
    procedure inicializa;
  end;

var
  frmRepEstandares: TfrmRepEstandares;

implementation

uses Urecursos, DateUtils, Ureportes, Umensaje, Udmrep, DB, Uprincipal;

{$R *.dfm}

procedure TfrmRepEstandares.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmRepEstandares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmRepEstandares.inicializa;
begin
   cbtipo.Text:= 'SEMANAL';
   dtdesde.Date:= (date-7);
   dthasta.Date:= (date-1);
   TipoImpresion := 'IMP';
   case Rep of
   
   1: begin
         Self.caption := 'Estandares de Ventas';
      end;
   2: begin
         self.Caption := 'Estandares de Instalaciones';
      end;
   3: begin
         self.Caption := 'Estandares de Servicios';
      end;
   4: begin
         self.Caption := 'Estandares de Central';
      end;

   5: begin
         self.Caption := 'Estandares de Cobranza';
         gbPeriodoMes.Visible := false;
         label3.Visible := false;
         cbtipo.Visible := false;
      end;

   end;
lblTitulo.Caption := self.Caption;
end;

procedure TfrmRepEstandares.btngenerarClick(Sender: TObject);
var meta,estandar:integer;
begin
   case Rep of
   1: begin
         //Manda llamar al metodo q imprime el reporte en urecursos de ventas
         frmmensaje.Show;
         frmmensaje.Update;
         {meta:= Round((50/7)*(DaysBetween(dthasta.Date,dtdesde.Date)+1));
         RepEstandaresVentas(datetostr(dtdesde.Date),datetostr(dthasta.Date),meta,TipoImpresion);}
         RepEstandaresVentas(datetostr(dtdesde.Date),datetostr(dthasta.Date));
         frmmensaje.Close;
      end;
   2: begin
         //Manda llamar al metodo q imprime el reporte de instalaciones
         RepEstandaresInstalaciones(datetostr(dtdesde.Date),datetostr(dthasta.Date),TipoImpresion);
      end;
   3: begin
    querys('Select estandar from Estandares where idpuesto = 29', 0, dmreportes.sqlgeneral8);
    estandar := dmreportes.sqlgeneral8.fieldbyname('estandar').AsInteger;
         //Manda llamar al metodo q imprime el reporte en urecursos de servicios
         if cbtipo.Text='SEMANAL' then
            RepEstandaresServicios(datetostr(dtdesde.Date),datetostr(dthasta.Date),TipoImpresion,estandar,0);
         if cbtipo.Text='MENSUAL' then
            RepEstandaresServicios(datetostr(dtdesde.Date),datetostr(dthasta.Date),TipoImpresion,estandar,1);
      end;
   4: begin
        //Manda llamar al metodo q imprime el reporte en urecursos de servicios
         RepEstandaresCentral(datetostr(dtdesde.date),datetostr(dthasta.date),tipoimpresion);
      end;
   
   5: begin
        //Manda llamar al metodo de estanderes de cobranza con abogados y tendencia.....
        RepEstandaresCobranza(cboano.Text,inttostr(cbomeses.itemindex+1),tipoimpresion);
      end;

   end;
end;

procedure TfrmRepEstandares.cbtipoSelect(Sender: TObject);
begin
   if cbtipo.Text = 'SEMANAL' then
    begin
      dtdesde.Date:= (date-7);
      dthasta.Date:= (date-1);
    end
   else
    begin
      dtdesde.Date:= (date-(DayOfTheMonth(date)-1));
      dthasta.Date:= date;
    end;
end;

procedure TfrmRepEstandares.cbTipoImpresionSelect(Sender: TObject);
begin
   case cbTipoImpresion.itemindex of
      0: TipoImpresion :='IMP';
      1: TipoImpresion :='IMPD';
      2: TipoImpresion :='ARC';
      3: TipoImpresion :='PDF';
   end;
end;

procedure TfrmRepEstandares.FormCreate(Sender: TObject);
begin
 cboano.Text := formatdatetime('yyyy',now);
 cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
end;

procedure TfrmRepEstandares.RepEstandaresVentas(f1, f2:string);
var mp, mc, md:string;
begin
with dmreportes do
  begin
  querys('Select estandar from Estandares where descripcion = "Prospectos Nuevos"', 0, sqlgeneral5);
  mp := sqlgeneral5.fieldbyname('estandar').asstring;
  querys('Select estandar from Estandares where descripcion = "Cuentas Nuevas"', 0, sqlgeneral5);
  mc := sqlgeneral5.fieldbyname('estandar').asstring;
  querys('Select estandar from Estandares where descripcion = "Venta en Dolares"', 0, sqlgeneral5);
  md := sqlgeneral5.fieldbyname('estandar').asstring;
  querys('Drop table if exists tmpEstProsp'+frmprincipal.idmaq, 1, sqlgeneral4);
  querys('Drop table if exists tmpEstCtas'+frmprincipal.idmaq, 1, sqlgeneral4);
  querys('Drop table if exists tmpEstDlls'+frmprincipal.idmaq, 1, sqlgeneral4);
  querys('Create table tmpEstProsp'+frmprincipal.idmaq+
         ' select "PROSPECTOS" as titulo, o.codvendedor as code, '+mp+' as meta, '+
         '(sum(total)  / day("'+f2+'")) * DAY(LAST_DAY("'+f1+'")) as tend, sum(total) as total, '+
         'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
         'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
         'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
         'sum(D16) as D16, sum(D17) as D17,  sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
         'sum(D21) as D21, sum(D22) as D22,  sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
         'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28,  sum(D29) as D29, sum(D30) as D30, '+
         'sum(D31) as D31 from ( Select o.codvendedor, day(alta) as dia, count(o.idoportunidad) as total, '+
         'if(day(alta) = 1, count(o.idoportunidad), 0) as D1, if(day(alta) = 2, count(o.idoportunidad), 0) as D2, if(day(alta) = 3, count(o.idoportunidad), 0) as D3, '+
         'if(day(alta) = 4, count(o.idoportunidad), 0) as D4, if(day(alta) = 5, count(o.idoportunidad), 0) as D5, if(day(alta) = 6, count(o.idoportunidad), 0) as D6, '+
         'if(day(alta) = 7, count(o.idoportunidad), 0) as D7, if(day(alta) = 8, count(o.idoportunidad), 0) as D8, if(day(alta) = 9, count(o.idoportunidad), 0) as D9, '+
         'if(day(alta) = 10, count(o.idoportunidad), 0) as D10, if(day(alta) = 11, count(o.idoportunidad), 0) as D11, if(day(alta) = 12, count(o.idoportunidad), 0) as D12, '+
         'if(day(alta) = 13, count(o.idoportunidad), 0) as D13, if(day(alta) = 14, count(o.idoportunidad), 0) as D14, if(day(alta) = 15, count(o.idoportunidad), 0) as D15, '+
         'if(day(alta) = 16, count(o.idoportunidad), 0) as D16, if(day(alta) = 17, count(o.idoportunidad), 0) as D17, if(day(alta) = 18, count(o.idoportunidad), 0) as D18, '+
         'if(day(alta) = 19, count(o.idoportunidad), 0) as D19, if(day(alta) = 20, count(o.idoportunidad), 0) as D20, if(day(alta) = 21, count(o.idoportunidad), 0) as D21, '+
         'if(day(alta) = 22, count(o.idoportunidad), 0) as D22, if(day(alta) = 23, count(o.idoportunidad), 0) as D23, if(day(alta) = 24, count(o.idoportunidad), 0) as D24, '+
         'if(day(alta) = 25, count(o.idoportunidad), 0) as D25, if(day(alta) = 26, count(o.idoportunidad), 0) as D26, if(day(alta) = 27, count(o.idoportunidad), 0) as D27, '+
         'if(day(alta) = 28, count(o.idoportunidad), 0) as D28, if(day(alta) = 29, count(o.idoportunidad), 0) as D29, if(day(alta) = 30, count(o.idoportunidad), 0) as D30, '+
         'if(day(alta) = 31, count(o.idoportunidad), 0) as D31 '+
         'from oportunidades o left join agenda_vendedores ag on ag.idoportunidad=o.idoportunidad left join estatus_eventos ee on '+
         'ee.idestatus=ag.idestatus left join usuarios u on o.codvendedor = u.codigo left join puestos p on p.idpuesto=u.idpuesto '+
         'where o.alta between "'+f1+'" and "'+f2+'" and o.estatus = "PROSPECTO" and p.nombre = "VENDEDOR" and ag.idestatus <> 6 '+
         'group by codvendedor, dia ) as o group by codvendedor ', 1, sqlgeneral4);

  querys('Create table tmpEstCtas'+frmprincipal.idmaq+
         ' select "CUENTAS NUEVAS" as titulo, code, '+mc+' as meta, '+
         '(sum(total)  / day("'+f2+'")) * DAY(LAST_DAY("'+f1+'")) as tend, sum(total) as total, '+
         'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
         'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
         'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
         'sum(D16) as D16, sum(D17) as D17,  sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
         'sum(D21) as D21, sum(D22) as D22,  sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
         'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28,  sum(D29) as D29, sum(D30) as D30, '+
         'sum(D31) as D31 from ( '+
         'SELECT distinct  u.codigo as code, count(tp.nombre) as total, day(p.FechaRemision) as dia, '+
         'if(day(p.FechaRemision) = 1, count(tp.nombre), 0) as D1, if(day(p.FechaRemision) = 2, count(tp.nombre), 0) as D2, if(day(p.FechaRemision) = 3, count(tp.nombre), 0) as D3, '+
         'if(day(p.FechaRemision) = 4, count(tp.nombre), 0) as D4, if(day(p.FechaRemision) = 5, count(tp.nombre), 0) as D5, if(day(p.FechaRemision) = 6, count(tp.nombre), 0) as D6, '+
         'if(day(p.FechaRemision) = 7, count(tp.nombre), 0) as D7, if(day(p.FechaRemision) = 8, count(tp.nombre), 0) as D8, if(day(p.FechaRemision) = 9, count(tp.nombre), 0) as D9, '+
         'if(day(p.FechaRemision) = 10, count(tp.nombre), 0) as D10, if(day(p.FechaRemision) = 11, count(tp.nombre), 0) as D11, if(day(p.FechaRemision) = 12, count(tp.nombre), 0) as D12, '+
         'if(day(p.FechaRemision) = 13, count(tp.nombre), 0) as D13, if(day(p.FechaRemision) = 14, count(tp.nombre), 0) as D14, if(day(p.FechaRemision) = 15, count(tp.nombre), 0) as D15, '+
         'if(day(p.FechaRemision) = 16, count(tp.nombre), 0) as D16, if(day(p.FechaRemision) = 17, count(tp.nombre), 0) as D17, if(day(p.FechaRemision) = 18, count(tp.nombre), 0) as D18, '+
         'if(day(p.FechaRemision) = 19, count(tp.nombre), 0) as D19, if(day(p.FechaRemision) = 20, count(tp.nombre), 0) as D20, if(day(p.FechaRemision) = 21, count(tp.nombre), 0) as D21, '+
         'if(day(p.FechaRemision) = 22, count(tp.nombre), 0) as D22, if(day(p.FechaRemision) = 23, count(tp.nombre), 0) as D23, if(day(p.FechaRemision) = 24, count(tp.nombre), 0) as D24, '+
         'if(day(p.FechaRemision) = 25, count(tp.nombre), 0) as D25, if(day(p.FechaRemision) = 26, count(tp.nombre), 0) as D26, if(day(p.FechaRemision) = 27, count(tp.nombre), 0) as D27, '+
         'if(day(p.FechaRemision) = 28, count(tp.nombre), 0) as D28, if(day(p.FechaRemision) = 29, count(tp.nombre), 0) as D29, if(day(p.FechaRemision) = 30, count(tp.nombre), 0) as D30, '+
         'if(day(p.FechaRemision) = 31, count(tp.nombre), 0) as D31 '+
         'FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) left join puestos pt on pt.idpuesto=u.idpuesto '+
         'LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) '+
         'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio) '+
         'WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and p.estatus in(3,4) and tp.instalacion =1 '+
         'and tp.CuentaNueva = 1 and con.estatus = 1 and pt.nombre = "VENDEDOR" group by u.codigo, dia order by total desc '+
         ') as cuentas group by code ', 1, sqlgeneral4);


  querys('Create table tmpEstDlls'+frmprincipal.idmaq+
         ' select "TOTAL DOLARES" as titulo, code,'+md+' as meta,'+
         '(sum(total)  / day("'+f2+'")) * DAY(LAST_DAY("'+f1+'")) as tend, sum(total) as total, '+
         'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
         'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
         'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
         'sum(D16) as D16, sum(D17) as D17,  sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
         'sum(D21) as D21, sum(D22) as D22,  sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
         'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28,  sum(D29) as D29, sum(D30) as D30, '+
         'sum(D31) as D31 from ( '+
         'SELECT distinct  codigo as code, sum(TotDlls) as total, day(v.Fecha) as dia, '+
         'if(day(v.Fecha) = 1, sum(TotDlls), 0) as D1, if(day(v.Fecha) = 2, sum(TotDlls), 0) as D2, if(day(v.Fecha) = 3, sum(TotDlls), 0) as D3, '+
         'if(day(v.Fecha) = 4, sum(TotDlls), 0) as D4, if(day(v.Fecha) = 5, sum(TotDlls), 0) as D5, if(day(v.Fecha) = 6, sum(TotDlls), 0) as D6, '+
         'if(day(v.Fecha) = 7, sum(TotDlls), 0) as D7, if(day(v.Fecha) = 8, sum(TotDlls), 0) as D8, if(day(v.Fecha) = 9, sum(TotDlls), 0) as D9, '+
         'if(day(v.Fecha) = 10, sum(TotDlls), 0) as D10, if(day(v.Fecha) = 11, sum(TotDlls), 0) as D11, if(day(v.Fecha) = 12, sum(TotDlls), 0) as D12, '+
         'if(day(v.Fecha) = 13, sum(TotDlls), 0) as D13, if(day(v.Fecha) = 14, sum(TotDlls), 0) as D14, if(day(v.Fecha) = 15, sum(TotDlls), 0) as D15, '+
         'if(day(v.Fecha) = 16, sum(TotDlls), 0) as D16, if(day(v.Fecha) = 17, sum(TotDlls), 0) as D17, if(day(v.Fecha) = 18, sum(TotDlls), 0) as D18, '+
         'if(day(v.Fecha) = 19, sum(TotDlls), 0) as D19, if(day(v.Fecha) = 20, sum(TotDlls), 0) as D20, if(day(v.Fecha) = 21, sum(TotDlls), 0) as D21, '+
         'if(day(v.Fecha) = 22, sum(TotDlls), 0) as D22, if(day(v.Fecha) = 23, sum(TotDlls), 0) as D23, if(day(v.Fecha) = 24, sum(TotDlls), 0) as D24, '+
         'if(day(v.Fecha) = 25, sum(TotDlls), 0) as D25, if(day(v.Fecha) = 26, sum(TotDlls), 0) as D26, if(day(v.Fecha) = 27, sum(TotDlls), 0) as D27, '+
         'if(day(v.Fecha) = 28, sum(TotDlls), 0) as D28, if(day(v.Fecha) = 29, sum(TotDlls), 0) as D29, if(day(v.Fecha) = 30, sum(TotDlls), 0) as D30, '+
         'if(day(v.Fecha) = 31, sum(TotDlls), 0) as D31 from ( '+
         'Select v.codigo, v.Fecha, (v.TotDlls-ifnull(nc.TotDlls,0)) as TotDlls from ( '+
         'SELECT  distinct sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls, '+
         'p.idpedido, p.FechaRemision as Fecha, u.codigo  FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) '+
         'LEFT JOIN articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
         'left join puestos pt on pt.idpuesto=u.idpuesto LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
         'WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and p.estatus in(3,4) and tp.instalacion = 1 and pt.nombre = "VENDEDOR" '+
         'and a.idlinea = 4 GROUP BY dp.idpedido ) as v left join ( '+
         'select sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
         'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio,   (dnc.piezas*dnc.costo))),0) ) as ToTDlls, p.idpedido '+
         'from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf ON (rf.idfactura=nc.idfactura) '+
         'left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp '+
         'On (tp.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
         'WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and tp.instalacion = 1 and a.idlinea = 4 GROUP BY dnc.idpedido '+
         ') as nc on v.idpedido=nc.idpedido ) as v group by code, dia ) d group by code', 1, sqlgeneral4);
                                       
    querys('select *, "'+meses[MonthOf(strtodate(f1))]+' '+inttostr(yearof(strtodate(f1)
    ))+'" as periodo, (meta - total) as dif FROM ( '+
           'Select * from tmpEstProsp'+frmprincipal.idmaq+' UNION '+
           'select * from tmpEstCtas'+frmprincipal.idmaq+' UNION '+
           'Select * from tmpEstDlls'+frmprincipal.idmaq+') AS T', 0, sqlgeneral);

    operacionreporte('EstandaresVentas','Estandares de Ventas ', Tipoimpresion, 1);
    querys('Drop table if exists tmpEstProsp'+frmprincipal.idmaq, 1, sqlgeneral4);
    querys('Drop table if exists tmpEstCtas'+frmprincipal.idmaq, 1, sqlgeneral4);
    querys('Drop table if exists tmpEstDlls'+frmprincipal.idmaq, 1, sqlgeneral4);
    end;

  end;
end.
