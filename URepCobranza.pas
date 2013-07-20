{///////////////////////////////////////////////////////////////////////////////
2010/09/16 BICENTENARIO (0 o) dalyla Guardar  RepPagosXLineaDet
2010/04/23 dalyla Pedidos por Linea
2010/04/12 dalyla reporte de motivos de cancelacion de facturas
2008/11/27 Oscar Reppagosxlineames
2008/06/09 dalyla FechaRemision reprote de Pagos por linea mes
18/02/2008 - NachoBoy agregue el procedure del reporte de pedidos del mes
}///////////////////////////////////////////////////////////////////////////////
unit URepCobranza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzDTP, StdCtrls, RzLabel, ExtCtrls, RzPanel, RzCmboBx,
  RzButton, DateUtils, Mask, RzEdit, RzSpnEdt, RzRadChk, DB, MemDS,
  DBAccess, MyAccess;

type
  TfrmRepCobranza = class(TForm)
    btngenerar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    cbTipoImpresion: TRzComboBox;
    rgPeriodo: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    tpdesde: TRzDateTimePicker;
    tphasta: TRzDateTimePicker;
    rgsector: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbsecdesde: TRzComboBox;
    cbsechasta: TRzComboBox;
    rganio: TRzGroupBox;
    Label3: TLabel;
    edanio: TRzSpinEdit;
    rgmeses: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cbmesdesde: TRzComboBox;
    cbmeshasta: TRzComboBox;
    gbestatus: TGroupBox;
    cbxp: TRzCheckBox;
    cbxn: TRzCheckBox;
    cbxr: TRzCheckBox;
    cbxf: TRzCheckBox;
    sqlgeneral: TMyQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btngenerarClick(Sender: TObject);
  private
    TipoImpresion:string;
    procedure RecMonitoreo;
    procedure RecPagosClientes;
    procedure RecClientesDeudores;
    procedure RecClientesAbogado;
    procedure RecEstatusPedidos;
    procedure RecPedidosMes;
    procedure PagosPorLineaCorrespAlMes;
    procedure SectoresVencidosConBloq;
    procedure SVactualizar(fecha1,fecha2,campo:string);
    procedure MotCancFacturas;
    procedure PedidosPorLinea;
    { Private declarations }
  public
    Reporte:Integer;
    procedure Inicializa;
    function valida:boolean;
    { Public declarations }
  end;

var
  frmRepCobranza: TfrmRepCobranza;

implementation

uses Urecursos, Udmrep, Uprincipal, Umensaje, Ureportes, Udm;

{$R *.dfm}

procedure TfrmRepCobranza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmRepCobranza.cbTipoImpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmRepCobranza.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmRepCobranza.btngenerarClick(Sender: TObject);
begin
   case Reporte of
      1: RecMonitoreo;
      2: RecPagosClientes;
      3: RecClientesDeudores;
      4: RecClientesAbogado;
      5: RecEstatusPedidos;
      6: RecPedidosMes;
      7: PagosPorLineaCorrespAlMes;
      8: SectoresVencidosConBloq;
      9: MotCancFacturas;
     10: PedidosPorLinea;
   end;
end;

procedure TfrmRepCobranza.inicializa;
begin
Tipoimpresion := 'IMP';
tpDesde.Date := StrToDate(FormatDateTime('yyyy""/""mm',Now)+'/01');
tpHasta.Date := Today;
edanio.Text:= copy(DateToStr(Date),1,4);
CargaCombo2('SELECT idsector,nombre FROM sectores','nombre','idsector',cbsecdesde);
CargaCombo2('SELECT idsector,nombre FROM sectores','nombre','idsector',cbsechasta);
cbsecdesde.ItemIndex:= 0;
cbsechasta.ItemIndex:= 0;
case Reporte of
   1: begin
         Self.caption := 'Monitoreo Vencidos';
         self.Height := 150;
         self.Width := 385
      end;
   2: begin
         self.Caption := 'Abonos X Monitoreo';
         self.Height := 189;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgsector.Visible:= true;
         rganio.Visible:= true;
      end;
   3: begin
         self.Caption := 'Clientes Deudores X Mes';
         self.Height := 189;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgmeses.Visible:= true;
         rganio.Visible:= true;
      end;
   4: begin
         self.Caption := 'Clientes con Abogado';
         self.Height := 150;
         self.Width := 385;
      end;
   5: begin
         self.Caption := 'Estatus de Pedidos';
         self.Height := 245;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgmeses.Visible:= true;
         rganio.Visible:= true;
         rgmeses.Caption:= ' Mes ';
         Label5.Visible:= false;
         cbmeshasta.Visible:= false;
         Label4.Caption:= 'Mes';
         gbestatus.Visible:= true;
      end;
   6: begin
         self.Caption := 'Pedidos del Mes';
         self.Height := 189;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgmeses.Visible:= true;
         rganio.Visible:= true;
         rgmeses.Caption:= ' Mes ';
         Label5.Visible:= false;
         cbmeshasta.Visible:= false;
         Label4.Caption:= 'Mes';
      end;

   7: begin
         self.Caption := 'Pagos por Linea Correspondientes al Mes';
         self.Height := 245;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgmeses.Visible:= true;
         rganio.Visible:= true;
         rgmeses.Caption:= ' Mes ';
         Label5.Visible:= false;
         cbmeshasta.Visible:= false;
         Label4.Caption:= 'Mes';
         //gbestatus.Visible:= true;
      end;

   8: begin
         self.Caption := 'Bloqueados y por Desbloquear';
         self.Height := 150;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgmeses.Visible:= false;
         rganio.Visible:= false;
      end;

   9: begin
         self.Caption := 'Motivos de Facturas Canceladas';
         self.Height := 150;
         self.Width := 385;
         rgPeriodo.Visible:= false;
         rgmeses.Visible:= true;
         rganio.Visible:= true;
         cbmeshasta.Enabled :=false;
      end;

  10: begin
         self.Caption := 'Pedidos por Linea';
         self.Height := 150;
         self.Width := 385;
         rgPeriodo.Visible:= true;
         rgmeses.Visible:= false;
         rganio.Visible:= false;
      end;
   end;
end;

procedure TfrmRepCobranza.RecMonitoreo;
begin
with dmreportes do   //      InteresesEquipo
  begin
  querys('Drop table if exists tmpMonitVenc'+frmprincipal.idmaq, 1, sqlgeneral7);
  querys('Create table tmpMonitVenc'+frmprincipal.idmaq+' (idcliente int(11), idpedido int(11), nombre varchar(150), '+
         'Recargos decimal(10,2) default 0.00, Reconexion  decimal(10,2) default 0.00)', 1, sqlgeneral7);

  querys('Insert into tmpMonitVenc'+frmprincipal.idmaq+' (idcliente, nombre, idpedido) Select pc.idcliente, '+
         ClienteNombre('c')+' as nombre, p.idpedido from DetPedido as dp left join PagosClientes as pc on '+
         'dp.idpedido=pc.idpedido left join pedidos as p on p.idpedido=pc.idpedido left join clientes as c on '+
         'c.idcliente = p.idcliente where pc.FechaAlta between "'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and p.idunidadnegocio = 5 '+
         'and movimiento = 2 and (dp.cod_cve = "'+RecargosMonitoreo+'" or dp.cod_cve = "'+Reconexion+'") group by p.idpedido', 1, sqlgeneral8);

  querys('Select pc.idcliente, p.idpedido, dp.cod_cve, if(dp.cod_cve = "'+RecargosMonitoreo+'", round(dp.costo*cant*tc*'+floattostr(1+GetIVA)+',2), 0) as RC, '+
         'if(dp.cod_cve = "'+Reconexion+'",  round(dp.costo*cant*tc*'+floattostr(1+GetIVA)+',2), 0) as RX from DetPedido as dp left join PagosClientes as pc on '+
         'dp.idpedido=pc.idpedido left join pedidos as p on p.idpedido=pc.idpedido where pc.FechaAlta between '+
         '"'+datetostr(tpdesde.date)+'" and "'+datetostr(tphasta.date)+'" and p.idunidadnegocio = 5 and movimiento = 2 and (dp.cod_cve = "'+RecargosMonitoreo+
         '" or dp.cod_cve = "'+Reconexion+'")', 0, sqlgeneral7);
  sqlgeneral7.First;
  while not sqlgeneral7.Eof = true do
    begin
    if sqlgeneral7.fieldbyname('cod_cve').AsString = Reconexion then
        querys('Update tmpMonitVenc'+frmprincipal.idmaq+' set Reconexion='+sqlgeneral7.fieldbyname('RX').AsString+
               ' where idpedido='+sqlgeneral7.fieldbyname('idpedido').AsString, 1, sqlgeneral8)
    else
      querys('Update tmpMonitVenc'+frmprincipal.idmaq+' set Recargos='+sqlgeneral7.fieldbyname('RC').AsString+
               ' where idpedido='+sqlgeneral7.fieldbyname('idpedido').AsString, 1, sqlgeneral8);
    sqlgeneral7.Next;
    end;
    querys('Select *, "De  '+datetostr(tpdesde.date)+'  a  '+datetostr(tphasta.date)+'" as periodo from tmpMonitVenc'+frmprincipal.idmaq+' order by idpedido', 1, sqlgeneral);
  OperacionReporte('MonitoreoVencidos', 'Monitoreo Vencido', TipoImpresion, 1);
  querys('Drop table if exists tmpMonitVenc'+frmprincipal.idmaq, 1, sqlgeneral7);
  end;
end;

function TfrmRepCobranza.valida:boolean;
begin
   result:= true;
   case Reporte of
      1: begin
            //****************************************\\
         end;
      2: begin
            if cbsecdesde.Text = '' then result:= false;
            if cbsechasta.Text = '' then result:= false;
            if edanio.Text = '' then result:= false;
         end;
      3: begin
            if edanio.Text = '' then result:= false;
         end;
      4: begin
            //****************************************\\
         end;
      5: begin
            if (not cbxn.Checked) and (not cbxp.Checked) and (not cbxr.Checked) and (not cbxf.Checked) then
               result:= false;
         end;
      6: begin
            //*****************************************\\
         end;
   end;
end;

procedure TfrmRepCobranza.RecPagosClientes;
var
   m:integer;
   rango,ano:string;
begin
   //se validan los campos
   if not valida then
   begin
      application.MessageBox('Ocurrio un error revise sus datos','Error',MB_OK+MB_ICONASTERISK);
      exit;
   end;
   //se establece el rango de los sectores para el reporte
   rango:= cbsecdesde.Text;
   if cbsecdesde.Text <> cbsechasta.Text then
   begin
      for m:=strtoint(cbsecdesde.Text)+1 to strtoint(cbsechasta.Text) do
         rango:= rango+','+inttostr(m);
   end;
   ano:= edanio.Text;
   //se imprime el reporte
   RepAbonosXMonitoreo(rango,ano,TipoImpresion,false);
end;

procedure TfrmRepCobranza.RecClientesDeudores;
var
   m,mesI,mesF,cant:integer;
   rmeses,ano:string;
   const meses: array[1..12] of string = ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO', 'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE' , 'DICIEMBRE');
begin
   // SE VALIDAN LOS CAMPOS
   if not valida then
   begin
      application.MessageBox('Ocurrio un error revise sus datos','Error',MB_OK+MB_ICONASTERISK);
      exit;
   end;
   // SE ESTABLECE EL RANGO DE MESES SEPARADOS POR COMAS
   mesI:= cbmesdesde.ItemIndex+1;
   mesF:= cbmeshasta.ItemIndex+1;
   cant:= mesF-mesI;
   rmeses:= '';
   for m:=mesI to (mesI+cant) do
   begin
      if m <> mesI then
         rmeses:= rmeses + ', ';
      rmeses:= rmeses + meses[m];
   end;
   rmeses:= rmeses + ' ';
   ano:= edanio.Text;
   //SE IMPRIME EL REPORTE
   RepClientesDeudores(rmeses,ano,TipoImpresion);
end;

procedure TfrmRepCobranza.RecClientesAbogado;
begin
   // SE VALIDAN LOS CAMPOS
   if not valida then
   begin
      application.MessageBox('Ocurrio un error revise sus datos','Error',MB_OK+MB_ICONASTERISK);
      exit;
   end;
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
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" group by c.sector) as t1 on (c.sector=t1.sector) '+
             'left join (select sum(sa.saldoActual) as saldoActualS, c.sector from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" group by c.sector) as t3 on (c.sector=t3.sector), '+
             '(select sum(cantidad) as total from (select count( distinct sa.idcliente) as cantidad from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" group by c.sector) as tt) as t2, '+
             '(select sum(saldoActualS) as saldoTotal from (select sum(sa.saldoActual) as saldoActualS from SeguimientoAbogado as sa left join clientes as c on (c.idcliente=sa.idcliente) '+
                  'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" group by c.sector) as tt) as t4 '+
             'where sa.incobrable = 0 and sa.fechaAbogado between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" '+
             'order by c.sector, sa.fechaAbogado, va.idVisitasActuario',0,sqlgeneral);

      // CUENTAS INCOBRABLES
      querys('select c.sector, sa.fechaAbogado, sa.idcliente, sa.saldoActual, sa.observaciones '+
             'from SeguimientoAbogado as sa '+
		       'left join clientes as c on (sa.idcliente=c.idcliente) '+
             'where 	sa.incobrable = 1 and sa.fechaAbogado between "'+datetostr(tpdesde.Date)+'" and "'+datetostr(tphasta.Date)+'" '+
             'order by	c.sector, sa.fechaAbogado',0,sqlgeneral2);

      if (sqlgeneral.RecordCount > 0) or (sqlgeneral2.RecordCount > 0) then
         OperacionReporte('RepAbogados', 'reporte de Abogados', TipoImpresion, 1)
      else
         application.MessageBox('No hay datos para mostrar','Aviso',MB_OK+MB_ICONASTERISK);
   end;

end;

procedure TfrmRepCobranza.RecEstatusPedidos;
var
   restatus,rmeses,ano:string;
   m:integer;
   const meses: array[1..12] of string = ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO', 'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE' , 'DICIEMBRE');
begin
   // SE VALIDAN LOS CAMPOS
   if not valida then
   begin
      application.MessageBox('Ocurrio un error revise sus datos','Error',MB_OK+MB_ICONASTERISK);
      exit;
   end;

   m:=1;
   if cbxn.Checked then begin restatus:= '"N"'; m:=m+1; end;
   if cbxp.Checked then begin if m > 1 then restatus:= restatus + ','; restatus:= restatus + '"P"'; m:=m+1; end;
   if cbxr.Checked then begin if m > 1 then restatus:= restatus + ','; restatus:= restatus + '"R"'; m:=m+1; end;
   if cbxf.Checked then begin if m > 1 then restatus:= restatus + ','; restatus:= restatus + '"F"'; m:=m+1; end;

   rmeses:= meses[cbmesdesde.ItemIndex+1];
   ano:= edanio.Text;

   //SE IMPRIME EL REPORTE
   RepEstatusPedidos(rmeses,inttostr(cbmesdesde.ItemIndex+1),restatus,ano,TipoImpresion);
end;

procedure TfrmRepCobranza.RecPedidosMes;
var
   mes,ano:string;
   //m:integer;
   const meses: array[1..12] of string = ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO', 'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE' , 'DICIEMBRE');
begin
   // SE VALIDAN LOS CAMPOS
   if not valida then
   begin
      application.MessageBox('Ocurrio un error revise sus datos','Error',MB_OK+MB_ICONASTERISK);
      exit;
   end;

   mes:= meses[cbmesdesde.ItemIndex+1];
   ano:= edanio.Text;

   //SE IMPRIME EL REPORTE
   RepPedidosMes(mes,inttostr(cbmesdesde.ItemIndex+1),ano,TipoImpresion);
end;

procedure TfrmRepCobranza.PagosPorLineaCorrespAlMes;
begin
{querys('Select r.idfactura, r.idremicion, rf.FechaAlta AS FechaFactura, p.FechaRemision,r.FechaAlta as FechaCobro, '+
       'year(p.FechaRemision) as anio, if(r.idfactura IS NULL, "REMISIONADO", "FACTURADO") as estatus, '+
       'round((r.abono/(p.piva+1)),2) as Importe, round(((r.abono/(p.piva+1)) *p.piva),2) as iva, p.piva, '+
       'round(r.abono,2) as total, r.MONITOREO, r.INTERESES, r.SERVICIO, r.EQUIPO, r.OTROS, r.periodo, r.PeriodoReporte '+
       'from RepPagosXLinea as r left join RemiFact as rf on (r.idFactura=rf.idFactura) left join pedidos as p '+
       'on p.idpedido=r.idpedido where upper(PeriodoReporte) = "'+cbmesdesde.text+'-'+edanio.text+'" group by idpago '+
       'order by anio,piva,estatus desc,idfactura', 0, dmreportes.sqlgeneral2);                       }
RepPagosXLineaDet(cbmesdesde.text, edanio.text, 0);
OperacionReporte('PagosPorLineaCorrespAlMes', 'Pagos Por Linea Correspondiente Al Mes', TipoImpresion, 1);
end;

procedure TfrmRepCobranza.SectoresVencidosConBloq;
var cadena,fecha1,fecha2,eddias1, eddias2:string;
begin
eddias1 := '0';
eddias2 := '99999';

Screen.Cursor := crHourglass;

fecha1:='';
fecha2:='';
//elimina tablas temporales
querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (mov integer(11),idcliente integer(11), '+
       'saldo float default 0,condicion1 float default 0,condicion2 float default 0,condicion3 float default 0,'+
       'condicion4 float default 0,dias integer(11),tipo varchar(15),EstatusInstalacion varchar(50), '+
       'KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);

//trae los nombres de los sectores
//buscarsectorID;
fecha1:=datetostr(now-strtoint(eddias1));
fecha2:=datetostr(now-9999);
//buscarUnidadID;
{if ckbabogado = true then
  begin
  if edabogado.Text <> '' then
    begin
    cadena:='';
    cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
            '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta '+
            'FROM PagosClientes as pc left join pedidos as p ON p.idpedido=pc.idpedido LEFT JOIN clientes as c '+
            'ON c.idcliente=pc.idcliente LEFT JOIN sectores as s ON s.idsector=c.sector LEFT JOIN contratos as con '+
            'ON c.TipoCont=con.TipoCont '+
            'WHERE p.estatus in(3,4,6) AND pc.FechaVence BETWEEN "'+fecha2+'" AND "'+fecha1+'" AND restante > 0.9 and pc.movimiento IN(0,1) and c.sector between '+quotedstr(sector1)+' and '+
            quotedstr(sector2)+' AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' and '+
            '(c.idabogado = '+quotedstr(edabogado.Text)+') ';   
    end
  else
    begin
    application.MessageBox('Falta el abogado','Atención',mb_iconwarning);
    edabogado.SetFocus;
    exit;
    end;
  end
else
  begin      }
  cadena:='';
  cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
          '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta '+
          'FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido)  LEFT JOIN clientes as c '+
          'ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont)  ' +
          'LEFT JOIN sectores as s ON (s.idsector=c.sector) '+
          'WHERE p.estatus in(3,4,6) AND pc.FechaVence '+
          'BETWEEN '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+'  AND restante > 0.9 and pc.movimiento IN(0,1) ';
          {'and c.sector between '+quotedstr(sector1)+' and '+quotedstr(sector2)+' AND p.idUnidadNegocio between '+
          quotedstr(UN1)+' and '+quotedstr(UN2)+' '  ;}

 { if ckbbloqueados = false then
   cadena:=cadena+' and c.bloqueado = 0 '
  else}
   cadena:=cadena+' and c.bloqueado in(0,1) ';
  {if (ckbnormales) and (ckbforzosos) then  //para activos
   cadena := cadena + ' and con.estatus in (0,1)  '
  else
   begin
    if ckbforzosos then //para inactivos
     cadena := cadena + ' and con.estatus = 0 ';
    if ckbnormales then  }
     cadena := cadena + ' and con.estatus = 1 and (c.idabogado = 0)';
   //end;


{  end;
if (chkSinCuentasReporte.checked = true) then
 cadena:=cadena+' and NoReporte=0';   }

cadena:=cadena+' GROUP BY pc.idpago';
querys(cadena,1,dmaccesos.sqlgeneral);
querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);
    {
if((chkSinEnlace.Checked = true) and (ckbforzosos.Checked = false)) then
    begin     }
       cadena :='insert into temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento, '+
                '(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta  '+
                'FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c '+
                'ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) LEFT JOIN '+
                'sectores as s ON (s.idsector=c.sector) '+
                'WHERE pc.FechaVence BETWEEN "'+fecha2+'" AND "'+fecha1+'" and p.estatus in(3,4) AND restante > 0.9 '+
                'and pc.movimiento IN(0,1) '+
                {'and c.sector between '+quotedstr(sector1)+' and '+quotedstr(sector2)+' AND '+
                'p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+'  '+}
                'and c.TipoCont ="SEN" ';
{if ckbabogado.Checked = true then
   cadena:=cadena + ' and (c.idabogado = '+quotedstr(edabogado.Text);}

cadena:=cadena+' GROUP BY pc.idpago';
querys(cadena,1,dmaccesos.sqlgeneral);
 { end;

if((chkSinEnlace.Checked = false) and (ckbforzosos.Checked = true)) then
      querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+' inner join clientes as c on (c.idcliente = temporal_sectorvence0'+frmprincipal.idmaq+'.cuenta) where c.TipoCont = ''SEN'' ',1,sqlgeneral);
                }
///*borrar cuentas que son mayores a (dias)
querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);

querys('select cuenta from temporal_sectorvence0'+frmprincipal.idmaq+' where dias not between '+eddias1+' and '+eddias2+'  ',0,sqlgeneral);
while not sqlgeneral.Eof do
  begin
      querys('DELETE  from temporal_sectorvence0'+frmprincipal.idmaq+' where cuenta = '+sqlgeneral.fieldbyname('cuenta').AsString ,1,dmreportes.sqlgeneral2);
      sqlgeneral.Next;
  end;

querys('INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+' (idcliente,dias) SELECT pc.idcliente,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias FROM PagosClientes as pc   '+
       'INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago) GROUP BY pc.idcliente  HAVING dias <= '+eddias2+' ',1,sqlgeneral);

querys('SELECT if(i.EstatusInst=0,''PENDI'',if(i.EstatusInst=1,''INSTA'',if(i.EstatusInst=2,''SUPER'',if(i.EstatusInst=4,''UBICA'',if(i.EstatusInst=5,''CUESTI'',if(i.EstatusInst=7,''CANCE'','''')))))) AS valor,p.idcliente from instalaciones as i '+
       ' inner join pedidos as p on (p.idpedido=i.idpedido) inner join temporal_sectorvence'+frmprincipal.idmaq+' as t1 on(t1.idcliente=p.idcliente) where i.estatus  <> 1 having valor <>''''  ',0,sqlgeneral);
while not sqlgeneral.Eof do
begin
querys('Update temporal_sectorvence'+frmprincipal.idmaq+' set EstatusInstalacion='+quotedstr(sqlgeneral.fieldbyname('valor').AsString)+' where idcliente = '+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString)+'  ',1,dmreportes.sqlgeneral2);
sqlgeneral.Next;
end;

if ( strtoint(eddias1) <= 30 ) then
 begin
  if strtoint(eddias1) <=30 then
   fecha1 := datetostr(now-strtoint(eddias1))
  else
   fecha1 := datetostr(now-0);
  if strtoint(eddias2) >=30 then
   fecha2 := datetostr(now-30)
  else
   fecha2 := datetostr(now-strtoint(eddias2));
   SVactualizar(fecha1,fecha2,'condicion1');
end;

if strtoint(eddias1) <= 60 then
 begin

  if strtoint(eddias1) > 31 then
    begin
     fecha1:=datetostr(now-0);
     fecha2:=datetostr(now-30);
     SVactualizar(fecha1,fecha2,'condicion1');
     fecha1:=datetostr(now-31)
    end else
   fecha1:=datetostr(now-31);
  if strtoint(eddias2) >= 60 then
   fecha2:=datetostr(now-60)
  else
   fecha2:=datetostr(now-strtoint(eddias2));
  SVactualizar(fecha1,fecha2,'condicion2');
end;

if  ((strtoint(eddias2) >= 90) or ((strtoint(eddias2)  >=  61)  and   (strtoint(eddias2)  <=  90 ))  ) then
 begin

  if strtoint(eddias1) > 61 then
   fecha1:=datetostr(now-strtoint(eddias1))
  else
   fecha1:=datetostr(now-61);
  if strtoint(eddias2) >= 90 then
   fecha2 := datetostr(now-90)
  else
   fecha2 := datetostr(now-strtoint(eddias2));
  SVactualizar(fecha1,fecha2,'condicion3');
end;

if strtoint(eddias2) > 90 then
 begin
  fecha1:=datetostr(now-90);
  fecha2:='';
  SVactualizar(fecha1,fecha2,'condicion4');
 end;
//actualizar saldo
querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET saldo=condicion1+condicion2+condicion3+condicion4',1,dmaccesos.sqlgeneral);
//generar reporte
with dmreportes do
 begin
 fecha1:='Del Sector 1 al 6 de '+eddias1+' dias a '+eddias2;
 {if ckbabogado.Checked = true then
  begin
   querys('Select idabogado,concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) as Abogado from abogados where idabogado='+quotedstr(edabogado.Text),0,sqlgeneral2);
   fecha2:='Abogado : '+sqlgeneral2.fieldbyname('Abogado').AsString;
  end
 else
  fecha2:='.';
  cadena:='Del Sector 1 al 6';
  querys('select '+quotedstr(fecha1)+' as titulo1,'+quotedstr(fecha2)+' as titulo2,'+quotedstr(cadena)+' as titulo3,''SECTORES VENCIDOS'' as encabezado, t.saldo,t.idcliente,cf.NombreCres as nombre,t.condicion1,t.condicion2,t.condicion3,t.condicion4,t.dias,if (d.bloqueado=0,''N'',''B'') as tipo,con.nombre as contrato,EstatusInstalacion from temporal_sectorvence'+frmprincipal.idmaq+' as t  LEFT JOIN clientes as d ON(d.idcliente=t.idcliente) LEFT JOIN contratos as con ON (d.TipoCont=con.TipoCont) LEFT JOIN ClientesFact as cf ON  (d.idfact=cf.idfact) where t.saldo > 2',0,sqlgeneral);//'+
  Screen.Cursor := crDefault;

  if sqlgeneral.FieldByName('idcliente').AsString <> '' then
   begin

    frmmensaje.Close;

    OperacionReporte('SectoresVencidos','Reportes de ',TipoImpresion, 1);
    {if chkcelulares.Checked then
     begin
      querys('Select clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial = '''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'' '')),clientes.rsocial) as Nombre,telefonos.telefono '+
             ' From clientes Inner Join telefonos ON clientes.idtel = telefonos.idtel inner join temporal_sectorvence'+frmprincipal.idmaq+' on temporal_sectorvence'+frmprincipal.idmaq+'.idcliente=clientes.idcliente Where telefonos.tipo_tel = ''CELULAR'' and temporal_sectorvence'+frmprincipal.idmaq+'.dias <=60',0,dmreportes.sqlgeneral4);
      OperacionReporte('CelularesClientes','Reportes de ',TipoImpresion, 1);
     end;          
   end
  else
   begin  }
   querys('Select sector, sum(sb) as sb, sum(sn) as sn, sum(cb) as cb, sum(cn) as cn , sum(sn) + sum(sb) as sd, '+
          'sum(cn)  + sum(cb) as cd from ( Select sector, if(bloqueado = "1", "BLOQUEADO", "NORMAL") as bloqueado, '+
          'if(bloqueado = "1", sum(saldo), 0) as sb , if(bloqueado <> "1", sum(saldo), 0) as sn, '+
          'if(bloqueado = "1", count(idcliente), 0) as cb , if(bloqueado <> "1", count(idcliente), 0) as cn '+
          'from ( select t.saldo,t.idcliente, d.bloqueado, d.sector, t.dias,if (d.bloqueado=0,"N","B") as tipo, '+
          'con.nombre as contrato,EstatusInstalacion '+
          'from temporal_sectorvence'+frmprincipal.idmaq+' as t  LEFT JOIN clientes as d ON(d.idcliente='+
          't.idcliente) LEFT JOIN contratos as con ON (d.TipoCont=con.TipoCont) LEFT JOIN ClientesFact as cf '+
          'ON  (d.idfact=cf.idfact) where t.saldo > 2 ) as t group by sector, bloqueado ) as r group by sector', 0, dmreportes.sqlgeneral);
   operacionreporte('SaldosBloqueosSector', 'SaldosBloqueosSector', TipoImpresion, 1);
    Screen.Cursor := crDefault;
{    frmmensaje.Close;
    application.MessageBox('No hay registro que mostrar','Atención',mb_iconwarning);
   end;                 }
 querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
 querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,sqlgeneral); 
 end;//reportes
end;

procedure TfrmRepCobranza.SVactualizar(fecha1,fecha2,campo:string);
begin
////no aparexcan pagos si tienen parcialidades
                                                                                 //INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+'
if campo <> 'condicion4' then                                                             //<> 3              <> 0
      querys('SELECT SUM(pc.restante) as total,pc.idcliente as cli,pc.idpedido FROM PagosClientes as pc '+
      'LEFT JOIN pedidos as p ON(p.idpedido=pc.idpedido) WHERE p.estatus in(3,4) and pc.movimiento in(0,1,4) '+
      'AND pc.restante <> 0 AND pc.FechaVence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' '+
      //'AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+
      ' GROUP BY pc.idpedido',0,dmreportes.sqlgeneral2)

else
      querys('SELECT SUM(pc.restante) as total,pc.idcliente as cli,pc.idpedido FROM PagosClientes as pc '+
      'LEFT JOIN pedidos as p ON(p.idpedido=pc.idpedido) WHERE p.estatus in(3,4) and pc.movimiento in(0,1,4) '+
      'AND pc.restante <> 0 AND pc.FechaVence < '+quotedstr(fecha1)+' '+
      //'AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+' '+
      'GROUP BY pc.idpedido',0,dmreportes.sqlgeneral2);

while not dmreportes.sqlgeneral2.Eof do
  begin
     querys('UPDATE temporal_sectorvence'+frmprincipal.idmaq+' SET '+campo+'=('+campo+' + '+quotedstr(dmreportes.sqlgeneral2.fieldbyname('total').AsString)+') WHERE idcliente='+quotedstr(dmreportes.sqlgeneral2.fieldbyname('cli').AsString),1,dmreportes.sqlgeneral);
     dmreportes.sqlgeneral2.Next;
  end;
end;

procedure TfrmRepCobranza.MotCancFacturas;
var mes, d, f1, f2:string;
begin
mes :=  inttostr(cbmesdesde.ItemIndex+1);
if(Length(mes) = 1) then
   mes := '0'+ mes;

d := inttostr(DaysInAMonth(strtoint(edanio.text),cbmesdesde.ItemIndex+1));
f1 := edanio.text+'/'+mes+'/01';
f2 := edanio.text+'/'+mes+'/'+d;

querys('SELECT p.idcliente, cf.nombre AS nombre, p.idfactura, m.motivo, rf.FechaBaja, rf.UsuarioBaja, '+
       '"De '+f1+' a '+f2+'" as periodo '+
       'from pedidos p right join pedidos_motcancelacion m on p.idpedido=m.idpedido '+
       'left join RemiFact rf on rf.idfactura=m.idfactura left join clientes c on c.idcliente=p.idcliente '+
       'left join ClientesFact cf on cf.idfact=c.idfact where p.estatus=1 and rf.FechaBaja '+
       'between "'+f1+'" and "'+f2+'" ',0,dmreportes.sqlgeneral);
operacionreporte('FacturasCanceladasMot', 'Motivos de Cancelacion de Facturas', TipoImpresion, 1);
end;

procedure TfrmRepCobranza.PedidosPorLinea;
var f1, f2:string;
begin
f1 := datetostr(tpdesde.Date);
f2 := datetostr(tphasta.Date);
querys('Select distinct  "De '+f1+' a '+f2+'" as periodo, p.idcliente, p.idpedido, p.TotMn, l.nombre as linea, '+ClienteNombre('c')+' as cliente '+
       'from pedidos p left join clientes c on c.idcliente=p.idcliente left join DetPedido d on d.idpedido=p.idpedido '+
       'left join articulos a on a.cod_cve=d.cod_cve left join lineas l on l.idlinea=a.idlinea '+
       'where p.fechacreacion between "'+f1+'" and "'+f2+'" and p.estatus in (3,4,5) group by idpedido',0,dmreportes.sqlgeneral);
operacionreporte('PedidosPorLinea', 'Pedidos por Linea', TipoImpresion, 1);
end;

End.
