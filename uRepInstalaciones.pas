{///////////////////////////////////////////////////////////////////////////////
2010/05/13 dalyla on close drop querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
2008/09/30 dalyla corregir el tc en costeado
2008/09/24 dalyla borrar temporales
20080/09/17 dalyla reporte costeado a fecha
2008/08/04 dalyla tendencia por meses
2008/07/02 disponibles y real en rep 7
2008/06/19 dalyla creado
}///////////////////////////////////////////////////////////////////////////////


unit uRepInstalaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, LMDCustomComponent, DateUtils,
  LMDContainerComponent, LMDBaseDialog, LMDInputDlg, DB, MemDS, DBAccess,
  MyAccess, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls, RzPanel, RzRadGrp;

type
  TfrmRepInstalaciones = class(TForm)
    cbTipoImpresion: TRzComboBox;
    btnImprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    idlg: TLMDInputDlg;
    sqlgeneral: TMyQuery;
    rgRango: TRzGroupBox;
    ldesde: TRzLabel;
    lhasta: TRzLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    rgcombo: TRzGroupBox;
    cbdesde: TRzComboBox;
    cbhasta: TRzComboBox;
    lcdesde: TRzLabel;
    lchasta: TRzLabel;
    dtdesde: TRzDateTimeEdit;
    dthasta: TRzDateTimeEdit;
    rgopcion: TRzRadioGroup;
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure rgopcionClick(Sender: TObject);
  private
    TipoImpresion:String;
    procedure InventarioCosteado;
    procedure InstPendXHora;
    procedure PedidosPendMain;
    procedure PedidosPendTodos;
    procedure PedidoPendXInstalador;
    procedure PedidoPendXFecha;
    procedure VentasPromedio;
    procedure VentasPromedioAnual;
    procedure TendenciaInstaladores;
    { Private declarations }
  public
    Reporte:Integer;
    procedure inicializa;
    { Public declarations }
  end;

var
  frmRepInstalaciones: TfrmRepInstalaciones;

implementation

uses Udmrep, Urecursos, Uprincipal, Udm, Umensaje, Ubusquedas;

{$R *.dfm}

procedure TfrmRepInstalaciones.btnImprimirClick(Sender: TObject);
begin
frmmensaje.Show;
   frmmensaje.Update;
case Reporte of
   1: InventarioCosteado;
   2: InstPendXHora;
   3: PedidosPendTodos;
   4: PedidoPendXInstalador;
   5: PedidoPendXFecha;
   6: VentasPromedio;
   7: VentasPromedioAnual;
   8: TendenciaInstaladores;
   end;
frmmensaje.close;
end;

procedure TfrmRepInstalaciones.inicializa;
begin
Tipoimpresion := 'IMP';
case Reporte of
   1: begin
      Self.Caption := 'Inventario Costeado';
      rgrango.Visible := false;
      rgcombo.Visible := true;
      dtdesde.Visible := true;
      dtdesde.date := today;
      dthasta.Visible := true;
      dthasta.Enabled := false;
      cbdesde.Visible := false;
      cbhasta.Visible := false;
      self.Height := 160;
      self.Width := 390;
      end;

   2: begin
      Self.Caption := 'Pendientes por Hora';
      rgrango.Visible := false;
      self.Height := 160;
      self.Width := 240;
      cbTipoImpresion.Left := 5;
      btnImprimir.Left := 5;
      btncerrar.Left := 5;
      end;

   3: begin
      Self.Caption := 'Pedidos Pendientes';
      self.Height := 150;
      self.Width := 240;
      ldesde.Caption := 'Pedido';
      rgrango.Visible := false;
      cbTipoImpresion.Left := 5;
      btnImprimir.Left := 5;
      btncerrar.Left := 5;
      end;

   4: begin
      Self.Caption := 'Pedidos Pendientes por Instalador';
      self.Height := 150;
      self.Width := 390;
      ldesde.Caption := 'Codigo';
      edhasta.enabled := false;
      if not ((frmprincipal.PuestoUsuario = 'GERENTE') or (frmprincipal.AreaUsuario = 'SISTEMAS')) then
        begin
        eddesde.enabled := false;
        eddesde.Text :=  UsuarioPropiedad('codigo',inttostr(frmprincipal.ucprincipal.CurrentUser.UserID));
        end;
      end;

   5: begin
      Self.Caption := 'Pedidos Pendientes por Fechas';
      self.Height := 160;
      self.Width := 390;
      rgrango.visible := false;
      rgcombo.Visible := true;
      cbdesde.Visible := false;
      cbhasta.Visible := false;
      dtdesde.Visible := true;
      dthasta.Visible := true;
      dtdesde.Date := PrimeroMesActual;
      dthasta.Date := today;
      end;

   6: begin
      Self.Caption := 'Ventas Promedio';
      self.Height := 160;
      self.Width := 240;
      rgrango.Visible := false;
      cbTipoImpresion.Left := 15;
      btnImprimir.Left := 15;
      btncerrar.Left := 15;
      end;

   7: begin
      Self.Caption := 'Ventas Promedio Anual';
      self.Height := 150;
      self.Width := 390;
      rgrango.Caption := 'Periodo';
      ldesde.Caption := 'Año';
      eddesde.ButtonVisible := false;
      eddesde.text := inttostr(yearof(today));
      edhasta.Enabled := false;
      end;

   8: begin
      Self.Caption := 'Tendencia Instaladores';
      self.Height := 270;
      self.Width := 390;
      rgrango.Visible := false;
      rgcombo.Visible := true;
      rgopcion.Visible := true;
      ComboMeses(cbdesde);
      cbdesde.ItemIndex := monthof(today)-1;
      ComboYear(cbhasta);
      cbhasta.Text := inttostr(yearof(today));
      end;
   end;

end;

procedure TfrmRepInstalaciones.cbTipoImpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmRepInstalaciones.btncerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRepInstalaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
querys('DROP TABLE IF EXISTS TempPedidosPend2'+frmprincipal.idmaq,1,sqlgeneral);
querys('Drop table if exists tmpTendHrsIns'+frmprincipal.idmaq,1,dmreportes.sqlgeneral8);
querys('Drop table if exists tmpTendHrsVen'+frmprincipal.idmaq,1,dmreportes.sqlgeneral2);
action := cafree;
end;

procedure TfrmRepInstalaciones.eddesdeKeyPress(Sender: TObject;
  var Key: Char);
begin

case Reporte of
  7: key := ValidaNumeros(key, true);
  end;
end;

procedure TfrmRepInstalaciones.InventarioCosteado;
var tc:string;
begin
tc := idlg.InputBox('Tipo de Cambio', 'Pesos:', GetConfiguraciones('TipoCambio', true));
try
  tc := floattostr(strtofloat(tc)/1);
except
  application.MessageBox('Hay un error en el tipo de cambio', 'Atencion', MB_ICONINFORMATION);
end;
querys('select "Al '+dtdesde.text+'" as periodo, a.nombre, "'+tc+'" as tc, a.cod_cve, a.tinstalacionCom, '+
       'p.nombre as proveedor, a.existencia+ifnull(r.cant,0)+ ifnull(aphoy.cant,0) as disponible, '+
       '(a.existencia + a.apartado - backorder + instalacion + ifnull(r.cant,0) + ifnull(ap.cant,0)) as existencia, '+
       'maximo, minimo, '+
       'if(moneda = "D", a.costo, a.costo*'+tc+') as costo, a.moneda, (a.existencia * if(moneda = "D", '+
       'a.costo, a.costo*'+tc+')) as CostoDisponible, (a.existencia + a.apartado - backorder + instalacion) '+
       '* ( if(moneda = "D", a.costo, a.costo*'+tc+')) as CostoExistencia from articulos a left join '+
       'proveedores p on p.idprov = a.idproveedor left join ( select cod_cve, sum(cant) as cant from ( '+
       //compras
       'select dc.cod_cve, sum(cant_ord) * -1 as cant from DetCompras dc left join compras c on c.idcompra = '+
       'dc.idcompra where FechaCompra between adddate("'+dtdesde.text+'", interval 1 day) and curdate() '+
       'group by cod_cve union '+
       //ajustes
       'select cod_cve, sum(cant) as cant from ( select dc.cod_cve, if(movimiento = "E", cant_ord*-1, cant_ord) '+
       'as cant from DetAjusteInv dc left join AjusteInv c on c.idajuste=dc.idajuste where FechaAlta between '+
       'adddate("'+dtdesde.text+'", interval 1 day) and curdate()) as ai group by cod_cve union '+
       // dev clientes
       'select dp.cod_cve as cod, sum(cant)*-1 as cant from DetPedido as dp left join pedidos as p ON '+
       'dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where p.FechaRemision '+
       'between adddate("'+dtdesde.text+'", interval 1 day) and curdate()  and p.estatus in(5) '+
       'and a.inventariable = 1 and a.servicio = 0 and a.paquete=0 and a.status=1 group by dp.cod_cve '+
       'UNION ALL select sum(if(dn.cant is null, dp.cant,dp.cant-dn.cant))*-1 as cant, dp.cod_cve as cod '+
       'from DetPedido as dp left join pedidos as p ON dp.idpedido=p.idpedido left join articulos as a ON '+
       'a.cod_cve=dp.cod_cve left join instalaciones as i ON i.idpedido=p.idpedido left join UnidadNegocio '+
       'as uni on uni.idUnidadNegocio=p.idUnidadNegocio inner join DetNotasCredito as dn on (dn.idpedido = '+
       'p.idpedido and dp.cod_cve= dn.cod_cve) where p.FechaRemision between adddate("'+dtdesde.text+'", '+
       'interval 1 day) and curdate() and  p.estatus in(3,4) and i.FechaInicio is null and a.inventariable = '+
       '1 and a.servicio = 0 and a.paquete = 0 and a.status = 1 and uni.instalacion = 1 and i.estatus = 0 '+
       'group by dp.cod_cve,dp.idpedido having cant > 0 union '+
       //ventas
       'select dp.cod_cve as cod, sum(cant) as cant from DetPedido as dp left join pedidos as p ON dp.idpedido '+
       '= p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where p.FechaRemision between adddate("'+
       dtdesde.text+'", interval 1 day) and curdate() and p.estatus in(3,4) and a.inventariable =1 and '+
       'a.servicio=0 and a.paquete=0 and a.status = 1 group by dp.cod_cve union  '+
       //dev com
       'select cod_cve as cod, sum(cant_ord) as cant from DevCompras c left join DetDevCompras dc on '+
       'dc.iddev=c.iddev where c.FechaDev between adddate("'+dtdesde.text+'", interval 1 day) and curdate() '+
       'group by cod_cve '+
       ') as r group by cod_cve ) as r on r.cod_cve = a.cod_cve '+
       //apartados
       'left join (select dp.cod_cve, sum(cant) as cant from DetPedido as dp left join pedidos as p '+
       'ON dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where '+
       'p.FechaCreacion between "'+dtdesde.text+'" and subdate( curdate(), interval 1 day) '+
       'and p.estatus in(0) and a.inventariable =1 and a.servicio=0 and a.paquete = 0 '+
       'and a.status = 1 group by dp.cod_cve) as ap on ap.cod_cve=a.cod_cve '+
       //apartados hoy
       'left join (select dp.cod_cve, sum(cant) as cant from DetPedido as dp left join pedidos as p '+
       'ON dp.idpedido=p.idpedido left join articulos as a ON a.cod_cve=dp.cod_cve where '+
       'p.FechaCreacion = curdate() and p.estatus in(0) and a.inventariable =1 and a.servicio=0 and a.paquete = 0 '+
       'and a.status = 1 group by dp.cod_cve) as aphoy on aphoy.cod_cve=a.cod_cve '+
       'where a.status = 1 and a.idlinea = 4 and a.inventariable = 1 order by iddpto, nombre', 0, dmreportes.sqlgeneral);

{querys('select a.nombre, "'+tc+'" as tc, a.cod_cve, a.tinstalacionCom, p.nombre as proveedor, '+
       'a.existencia as disponible, (a.existencia+a.apartado-backorder+instalacion) as existencia, '+
       'maximo, minimo, if(moneda = "D", a.costo, a.costo*'+tc+') as costo, a.moneda, '+
       '(a.existencia* if(moneda = "D", a.costo, a.costo*'+tc+')) as CostoDisponible, '+
       '(a.existencia+a.apartado-backorder+instalacion)*( if(moneda = "D", a.costo, a.costo*'+tc+')) '+
       'as CostoExistencia from articulos a left join proveedores p on p.idprov=a.idproveedor '+
       'where a.status = 1 and a.idlinea = 4 and a.inventariable = 1 order by iddpto, nombre', 0, dmreportes.sqlgeneral);}

OperacionReporte('ArticulosCosteado', 'Reporte de Articulos Costeado', TipoImpresion, 1);
end;

procedure TfrmRepInstalaciones.InstPendXHora;
begin
querys('Drop table  if exists tmpInstPend'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table tmpInstPend'+frmprincipal.idmaq+' (idpedido int (11), FechaCreacion date, Horas decimal(10,2), '+
       'FechaVencimiento date, Vence varchar (10), idusuario int (11))', 1, sqlgeneral);
querys('Insert into tmpInstPend'+frmprincipal.idmaq+' (idpedido, FechaCreacion, Horas, '+
       'FechaVencimiento, Vence, idusuario) SELECT p.idpedido, p.FechaRemision, p.TotHrsCom as TotHrs, '+
       'if((dayofweek(cast(adddate(p.FechaRemision,interval 1 day) as date)))=1, adddate(p.FechaRemision,interval '+
       '4 day), if (( dayofweek(cast(adddate(p.FechaRemision,interval 2 day) as date)))=1, adddate(p.FechaRemision, '+
       'interval 4 day), if(( dayofweek(cast(adddate(p.FechaRemision, '+
       'interval 3 day) as date)))=1, adddate(p.FechaRemision, interval 4 day), cast(adddate(p.FechaRemision,interval '+
       '3 day) as date)))) as FechaVencimiento, " " as Vence, '+
       'u.idusuario FROM pedidos as p LEFT JOIN '+
       'clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON (i.idpedido=p.idpedido) '+
       'LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio= p.idUnidadNegocio) LEFT JOIN usuarios as u ON '+
       '(i.instalador1=u.codigo) WHERE  i.estatus = 0  and p.estatus in(3,4) GROUP BY p.idpedido order by '+
       'u.idusuario,idinstalacion', 1, sqlgeneral);

querys('SELECT * from tmpInstPend'+frmprincipal.idmaq, 0, sqlgeneral);

sqlgeneral.first;
while not sqlgeneral.eof = true do
  begin
  if sqlgeneral.fieldbyname('FechaVencimiento').AsDatetime >= FechaServidor then
    querys('update tmpInstPend'+frmprincipal.idmaq+' set Vence = "Por Vencer" where idpedido='+
           quotedstr(sqlgeneral.fieldbyname('idpedido').asstring), 1, dmreportes.sqlgeneral6)
  else
    querys('update tmpInstPend'+frmprincipal.idmaq+' set Vence = "Vencido" where idpedido='+
           quotedstr(sqlgeneral.fieldbyname('idpedido').asstring), 1, dmreportes.sqlgeneral6);
  sqlgeneral.next;
  end;

querys('Drop table  if exists tmpInstPend2'+frmprincipal.idmaq, 1, sqlgeneral);

querys('Create table tmpInstPend2'+frmprincipal.idmaq+' select idusuario, count(idpedido) as total, '+
       'Vence, if(Vence = "Por Vencer", count(idpedido), "0") as PorVencer, if(Vence = "Vencido", '+
       'count(idpedido), "0") as Vencido, if(Vence = "Por Vencer",  sum(Horas), "0") as HrsPorVencer, '+
       'if(Vence = "Vencido", sum(Horas), "0") as HrsVencido from tmpInstPend'+frmprincipal.idmaq+' as t group '+
       'by Vence, t.idusuario', 1, sqlgeneral);

querys('Drop table  if exists tmpInstPend'+frmprincipal.idmaq, 1, sqlgeneral);

querys('select u.codigo, if(u.apaterno is null or u.apaterno = "", u.nombre,  concat(u.nombre, " ", u.apaterno)) '+
       'as nombre, sum(Vencido) as Vencido, sum(HrsVencido) as HrsVencido, sum(PorVencer) as PorVencer, '+
       'sum(HrsPorVencer) as HrsPorVencer from tmpInstPend2'+frmprincipal.idmaq+' as t left join usuarios as u '+
       'on(u.idusuario=t.idusuario) group by t.idusuario', 0, dmreportes.sqlgeneral);

OperacionReporte('InstPendHrs','', TipoImpresion, 1);
querys('Drop table  if exists tmpInstPend2'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure TfrmRepInstalaciones.PedidosPendMain;
var c,cadena,horas:string;
begin
   c:='0';
   horas := '';
   cadena := '';
   with dmreportes do
   begin
      querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
      querys('CREATE TABLE TempPedidosPend'+frmprincipal.idmaq+' (idauto int(11) NOT NULL auto_increment,idpedido int(11),otro varchar(100),FechaCreacion date default NULL,FechaRemi date default NULL,idnota int(11) default 0,Observaciones text,FechaContacto Date default null, PRIMARY KEY (idauto))',1,sqlgeneral);

      /////////////////////////////////////////////////////////
      ////////////////// TODOS ////////////////////////////////

      querys('INSERT INTO TempPedidosPend'+frmprincipal.idmaq+' (idpedido,otro,FechaCreacion,idnota,Observaciones) '+
             'SELECT p.idpedido,u.idusuario,p.FechaRemision,i.idnota,'''' FROM pedidos as p LEFT JOIN clientes as c '+
             'ON (c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON (i.idpedido=p.idpedido) LEFT JOIN '+
             'UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) lEFT JOIN usuarios as u ON '+
             '(i.instalador1=u.codigo) Left Join ObrasProceso op on op.idinstalacion=i.idinstalacion '+
             'WHERE  i.estatus = 0  and p.estatus in(3,4) GROUP BY p.idpedido union '+

             'SELECT p.idpedido,u.idusuario,p.FechaRemision,i.idnota,'''' FROM pedidos as p LEFT JOIN clientes as c '+
             'ON (c.idcliente=p.idcliente) LEFT JOIN instalaciones as i ON (i.idpedido=p.idpedido) LEFT JOIN '+
             'UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) lEFT JOIN usuarios as u ON '+
             '(i.instalador1=u.codigo) Left Join (Select min(idstatus) as estatus, idinstalacion from ObrasProceso '+
             'op group by idinstalacion ) as t on t.idinstalacion=i.idinstalacion WHERE  i.estatus = 0  and p.estatus '+
             'in(3,4) and t.estatus > 0 GROUP BY p.idpedido order by idusuario,idpedido', 1, sqlgeneral2);
      {sqlgeneral2.SQL.Add(cadena);
      sqlgeneral2.execute;}
      querys('select idnota,idpedido from TempPedidosPend'+frmprincipal.idmaq+' where idnota > 1',0,sqlgeneral);
      while not sqlgeneral.Eof do
      begin
         querys('SELECT nota,fecha from notas where idnota ='+quotedstr(sqlgeneral.fieldbyname('idnota').AsString)+' order by id desc',1,sqlgeneral2);
         if sqlgeneral2.RecordCount > 0 then
            if sqlgeneral2.fieldbyname('nota').AsString <> '' then
               querys('UPDATE TempPedidosPend'+frmprincipal.idmaq+' set Observaciones = LOWER('+quotedstr(sqlgeneral2.fieldbyname('nota').AsString)+') , FechaContacto ='+quotedstr(sqlgeneral2.fieldbyname('fecha').AsString)+' WHERE idpedido='+quotedstr(sqlgeneral.fieldbyname('idpedido').AsString),1,sqlgeneral3);
         sqlgeneral.Next;
      end;
   end;
end;

procedure TfrmRepInstalaciones.PedidoPendXInstalador;
begin
PedidosPendMain;
with dmreportes do
   begin
   if querys('SELECT t.idauto,i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, '+
          ' t.FechaCreacion as Fecha,if ((dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
          ' if (( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day),if (( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1,'+
          ' adddate(t.FechaCreacion,interval 4 day), cast(adddate(t.FechaCreacion,interval 3 day) as date)))) as FechaVencimiento,'+
          ' if(c.rsocial is null or c.rsocial = "",concat(ifnull(c.nombre," ")," ", ifnull(c.apaterno," ")," ",ifnull(c.amaterno," ")),c.rsocial) as Cliente,'+
          ' u.codigo, if(i.FechaPromesa>"1990/01/01",i.FechaPromesa,"") as FechaPromesa , if(i.FechaInicio>"1990/01/01",i.FechaInicio,"") as FechaInicio,'+
          ' t.Observaciones as Observaciones,t.FechaContacto as FechaContacto, p.idUnidadNegocio,p.TotHrs, c.sector,u.idusuario,if(SalidaInventario=1,"S","N") as Salida,'+
          ' left(un.nombre,4) as unidad,if (i.instalador1 is null,"SIN INSTALADOR",concat(if (u.nombre is null," ",u.nombre)," ", if (u.apaterno is null," ",u.apaterno)," ",if (u.amaterno is null," ",u.amaterno))) as instalador,'+
          ' if(i.EstatusInst =0,"EN PROCESO DE INSTALACION",if(i.EstatusInst =1,"INSTALANDO",if(i.EstatusInst =3,"SUPERVISION CON PROBLEMAS DE INSTALACION",if(i.EstatusInst =4,"UBICACION",if(i.EstatusInst =5,"CUESTIONARIO",""))))) as ESTADO,'+
          ' if(i.EstatusInst =0,"PENDI",if(i.EstatusInst =1,"INST",if(i.EstatusInst =3,"SUP/I",if(i.EstatusInst =4,"UBIC",if(i.EstatusInst =5,"CUE",""))))) as estatus,'+
          ' i.EstatusInst, us.codigo as vendedor FROM pedidos as p LEFT JOIN clientes as c ON (c.idcliente=p.idcliente)'+
          ' LEFT JOIN instalaciones as i ON(i.idpedido=p.idpedido) INNER JOIN TempPedidosPend'+frmprincipal.idmaq+' as t ON(t.idpedido=p.idpedido)'+
          ' LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN usuarios as u ON (i.instalador1=u.codigo)'+
          ' LEFT JOIN usuarios as us ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and u.codigo='+quotedstr(eddesde.Text)+
          ' GROUP BY p.idpedido order by u.idusuario,t.idauto asc', 0, sqlgeneral2) > 0 then
    begin
     OperacionReporte('RepPedidosPend','Reporte de Pedido Pendientes',tipoImpresion,1);
     end
   else
     begin
     application.MessageBox('No hay datos a mostrar','Atención',mb_IconInformation);
     end;

   querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
   querys('DROP TABLE IF EXISTS TempPedidosPend2'+frmprincipal.idmaq,1,sqlgeneral);
   end;
end;

procedure TfrmRepInstalaciones.PedidoPendXFecha;
begin
PedidosPendMain;
with dmreportes do
   begin
   if querys('SELECT t.idauto,i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, '+
             ' t.FechaCreacion as Fecha,if ((dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
             ' if (( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day),if (( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1,'+
             ' adddate(t.FechaCreacion,interval 4 day), cast(adddate(t.FechaCreacion,interval 3 day) as date)))) as FechaVencimiento,'+
             ' if(c.rsocial is null or c.rsocial = "",concat(ifnull(c.nombre," ")," ", ifnull(c.apaterno," ")," ",ifnull(c.amaterno," ")),c.rsocial) as Cliente,'+
             ' u.codigo, if(i.FechaPromesa>"1990/01/01",i.FechaPromesa,"") as FechaPromesa , if(i.FechaInicio>"1990/01/01",i.FechaInicio,"") as FechaInicio,'+
             ' t.Observaciones as Observaciones,t.FechaContacto as FechaContacto, p.idUnidadNegocio,p.TotHrs, c.sector,u.idusuario,if(SalidaInventario=1,"S","N") as Salida,'+
             ' left(un.nombre,4) as unidad,if (i.instalador1 is null,"SIN INSTALADOR",concat(if (u.nombre is null," ",u.nombre)," ", if (u.apaterno is null," ",u.apaterno)," ",if (u.amaterno is null," ",u.amaterno))) as instalador,'+
             ' if(i.EstatusInst =0,"EN PROCESO DE INSTALACION",if(i.EstatusInst =1,"INSTALANDO",if(i.EstatusInst =3,"SUPERVISION CON PROBLEMAS DE INSTALACION",if(i.EstatusInst =4,"UBICACION",if(i.EstatusInst =5,"CUESTIONARIO",""))))) as ESTADO,'+
             ' if(i.EstatusInst =0,"PENDI",if(i.EstatusInst =1,"INST",if(i.EstatusInst =3,"SUP/I",if(i.EstatusInst =4,"UBIC",if(i.EstatusInst =5,"CUE",""))))) as estatus,'+
             ' i.EstatusInst, us.codigo as vendedor FROM pedidos as p LEFT JOIN clientes as c ON (c.idcliente=p.idcliente)'+
             ' LEFT JOIN instalaciones as i ON(i.idpedido=p.idpedido) INNER JOIN TempPedidosPend'+frmprincipal.idmaq+' as t ON(t.idpedido=p.idpedido)'+
             ' LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) LEFT JOIN usuarios as u ON (i.instalador1=u.codigo)'+
             ' LEFT JOIN usuarios as us ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and fechavencimiento between "'+dtdesde.text+'" and "'+dthasta.Text+'"'+
             ' and i.ObraEnProceso = 0 GROUP BY p.idpedido order by u.idusuario,t.idauto asc', 0, sqlgeneral2) > 0 then
    begin
     OperacionReporte('RepPedidosPend','Reporte de Pedido Pendientes',tipoImpresion,1);
     end
   else
     begin
     application.MessageBox('No hay datos a mostrar','Atención',mb_IconInformation);
     end;

   querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
   querys('DROP TABLE IF EXISTS TempPedidosPend2'+frmprincipal.idmaq,1,sqlgeneral);
   end;
end;

procedure TfrmRepInstalaciones.PedidosPendTodos;
begin
with dmreportes do
   begin
  PedidosPendMain;
  querys('select idauto, if(FechaVencimiento>=cast("'+datetostr(date)+'" as date),"No Vencidos","Vencidos") as tipo, '+
         'if(FechaVencimiento>=cast("'+datetostr(date)+'" as date),1,0) as nven,  idinstalacion,venta, cuenta,fecha,cliente,codigo, '+
         'instalador, fechaVencimiento, estado,fechapromesa,fechainicio,observaciones,fechacontacto,salida,idunidadnegocio, '+
         'unidad,round(tothrs,2) as tothrs,sector,estatus,estatusinst,idusuario,vendedor from  ( '+

         'SELECT t.idauto, i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, t.FechaCreacion as Fecha, '+
         'if((dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
         'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
         'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
         'cast(adddate(t.FechaCreacion,interval 3 day) as date)))) as FechaVencimiento, '+ClienteNombre('c')+' as Cliente, '+
         'u.codigo,if(i.FechaPromesa > "1990/01/01",i.FechaPromesa," ") as FechaPromesa , if(i.FechaInicio > "1990/01/01", '+
         'i.FechaInicio,"") as FechaInicio, t.Observaciones as Observaciones,t.FechaContacto as FechaContacto,p.idUnidadNegocio, '+
         'if(instalador2 <> "", (p.TotHrsCom + i.TExtra)/2, (p.TotHrsCom + i.TExtra)) as TotHrs, i.ObraEnProceso, TotHrsCom, '+
         'c.sector,u.idusuario,if(SalidaInventario=1,"S","N") as Salida, left(un.nombre,4) as unidad, if (i.instalador1 is null, '+
         '"SIN INSTALADOR", '+UsuarioNombre('u')+') as instalador, if(i.EstatusInst =0,"EN PROCESO DE INSTALACION", '+
         'if(i.EstatusInst =1,"INSTALANDO",if(i.EstatusInst =3,"SUPERVISION CON PROBLEMAS DE INSTALACION",if(i.EstatusInst =4,"UBICACION", '+
         'if(i.EstatusInst =5,"CUESTIONARIO",""))))) as ESTADO, if(i.EstatusInst =0,"PENDI",if(i.EstatusInst =1,"INST",if(i.EstatusInst =3,'+
         '"SUP/I",if(i.EstatusInst =4,"UBIC",if(i.EstatusInst =5,"CUE",""))))) as estatus, i.EstatusInst,us.codigo as vendedor '+
         'FROM pedidos as p  LEFT JOIN clientes as c ON (c.idcliente=p.idcliente)  LEFT JOIN instalaciones as i ON(i.idpedido=p.idpedido) '+
         'INNER JOIN TempPedidosPend'+frmprincipal.idmaq+' as t ON(t.idpedido=p.idpedido) LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) '+
         'left join usuarios as u  on (u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) '+
         'LEFT JOIN usuarios as us ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and ObraEnproceso = 0  '+
         'GROUP BY p.idpedido, codigo union '+

         'SELECT t.idauto, i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, t.FechaCreacion as Fecha, '+
         'if((dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
         'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
         'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
         'cast(adddate(t.FechaCreacion,interval 3 day) as date)))) as FechaVencimiento, '+clienteNombre('c')+' as Cliente, '+
         'u.codigo,if(i.FechaPromesa > "1990/01/01",i.FechaPromesa," ") as FechaPromesa , if(i.FechaInicio > "1990/01/01", '+
         'i.FechaInicio,"") as FechaInicio, t.Observaciones as Observaciones,t.FechaContacto as FechaContacto,p.idUnidadNegocio, '+
         '((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) ) * (100-cs.nombre) )/100 as TotHrs, i.ObraEnProceso, TotHrsCom, '+
         'c.sector,u.idusuario,if(SalidaInventario=1,"S","N") as Salida, left(un.nombre,4) as unidad, if (i.instalador1 is null,'+
         '"SIN INSTALADOR",'+UsuarioNombre('u')+') as instalador, if(i.EstatusInst =0,"EN PROCESO DE INSTALACION",'+
         'if(i.EstatusInst =1,"INSTALANDO",if(i.EstatusInst =3,"SUPERVISION CON PROBLEMAS DE INSTALACION",if(i.EstatusInst =4, '+
         '"UBICACION", if(i.EstatusInst =5,"CUESTIONARIO",""))))) as ESTADO, if(i.EstatusInst =0,"PENDI",if(i.EstatusInst =1,'+
         '"INST",if(i.EstatusInst =3,"SUP/I",if(i.EstatusInst =4,"UBIC",if(i.EstatusInst =5,"CUE",""))))) as estatus, '+
         'i.EstatusInst,us.codigo as vendedor  FROM pedidos as p  LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) '+
         'LEFT JOIN instalaciones as i ON(i.idpedido=p.idpedido) INNER JOIN TempPedidosPend'+frmprincipal.idmaq+' as t ON(t.idpedido=p.idpedido) '+
         'LEFT JOIN UnidadNegocio as un ON (un.idUnidadNegocio=p.idUnidadNegocio) left join usuarios as u  on (u.codigo=i.instalador1 '+
         'and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left join (Select min(idstatus) '+
         'as idestatus, idinstalacion from ObrasProceso  group by idinstalacion having idestatus > 0) as op on op.idinstalacion = '+
         'i.idinstalacion Left join clasif_servicios as cs on cs.idstatus=i.idstatus and cs.idserv = 10  LEFT JOIN usuarios as us '+
         'ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and ObraEnProceso = 1 GROUP BY p.idpedido, codigo '+
         ') as tabla order by codigo desc, nven asc ',0,sqlgeneral2);

  querys('SELECT  sum(p.TotHrs) as total FROM TempPedidosPend'+frmprincipal.idmaq+' as t left JOIN pedidos as p ON(p.idpedido=t.idpedido) ',0,sqlgeneral);
  Operacionreporte('RepPedidosPend', '', tipoImpresion, 1);
  end;
end;

procedure TfrmRepInstalaciones.eddesdeButtonClick(Sender: TObject);
begin
case Reporte of
  4: begin
     with frmbusquedas do
       begin
       query := 'Select idusuario, codigo, '+UsuarioNombre('u')+' as nombre from usuarios u where estatus = 1 '+
                'order by nombre';
       campo_retorno:='codigo';
       campo_busqueda:='nombre';
       tblorigen := 'usuarios';
       lbldesc.Caption:='Busqueda por Nombre:';
       ShowModal;
       if resultado <> '' then
         eddesde.Text:=resultado;
       end;
     end;
  end;
end;

procedure TfrmRepInstalaciones.VentasPromedio;
begin

querys('Select "'+meses[monthof(today)] + ' ' + inttostr(yearof(today))+'" as periodo, a.nombre, a.maximo as amax, a.minimo as amin,  '+
       'art.cod_cve, max(cant) as maximo, min(cant) as minimo,ifnull(v.dias_entrega, 0) as entrega, existencia, '+
       'round(avg(cant),0) as prom, round((min(cant) *ifnull(v.dias_entrega, 0))/30,0) as mini, round(((max(cant) * '+
       'ifnull(v.dias_entrega, 0))/30) + ((min(cant) *ifnull(v.dias_entrega, 0))/30),0) as maxi, '+
       'if( ((((max(cant) *ifnull(v.dias_entrega, 0))/30) + ((min(cant) *ifnull(v.dias_entrega, 0))/30)) - a.existencia) < 0, 0, '+
       'round((((max(cant) *ifnull(v.dias_entrega, 0))/30) + ((min(cant) *ifnull(v.dias_entrega, 0))/30)) - a.existencia,0)) as '+
       'CantPedido, round((avg(cant) * ( ifnull(v.dias_entrega, 0)/30 ) ) + (min(cant) *ifnull(v.dias_entrega, 0))/30,0) as '+
       'PuntoReabas from ( Select dp.cod_cve, month(p.FechaCreacion)  as m, sum(dp.cant) as cant from DetPedido dp left join '+
       'pedidos p on dp.idpedido=p.idpedido left join articulos a on dp.cod_cve=a.cod_cve where year(p.FechaCreacion) = '+inttostr(yearof(today))+
       ' and p.estatus < 5 and a.inventariable = 1 and a.status = 1 group by dp.cod_cve, m ) as art left join articulos a on '+
       'art.cod_cve=a.cod_cve left join proveedores v on v.idprov = a.idproveedor group by art.cod_cve order by cod_cve', 0, dmreportes.sqlgeneral);

OperacionReporte('VentasPromedioArt', 'Ventas promedio por Articulo', tipoImpresion, 1);
end;

procedure TfrmRepInstalaciones.VentasPromedioAnual;                       
begin
querys('Select "Año ' + eddesde.text+'" as periodo, a.nombre, a.maximo as amax, a.minimo as amin, art.cod_cve, existencia, (existencia+apartado+instalacion-backorder) as reales, '+
       'sum(m1) as m1,  sum(m2) as m2,  sum(m3) as m3, sum(m4) as m4,  sum(m5) as m5,  sum(m6) as m6, sum(m7) as m7,  sum(m8) as m8,  sum(m9) as m9, '+
       'sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( Select dp.cod_cve, month(p.FechaCreacion)  as m, sum(dp.cant) as cant, '+
       'if(month(p.FechaCreacion) = 1, sum(dp.cant), 0) as m1,if(month(p.FechaCreacion) = 2, sum(dp.cant), 0) as m2,if(month(p.FechaCreacion) = 3, sum(dp.cant), 0) as m3, '+
       'if(month(p.FechaCreacion) = 4, sum(dp.cant), 0) as m4,if(month(p.FechaCreacion) = 5, sum(dp.cant), 0) as m5,if(month(p.FechaCreacion) = 6, sum(dp.cant), 0) as m6, '+
       'if(month(p.FechaCreacion) = 7, sum(dp.cant), 0) as m7,if(month(p.FechaCreacion) = 8, sum(dp.cant), 0) as m8,if(month(p.FechaCreacion) = 9, sum(dp.cant), 0) as m9, '+
       'if(month(p.FechaCreacion) = 10, sum(dp.cant), 0) as m10,if(month(p.FechaCreacion) = 11, sum(dp.cant), 0) as m11,if(month(p.FechaCreacion) = 12, sum(dp.cant), 0) as m12 '+
       'from DetPedido dp left join pedidos p on dp.idpedido=p.idpedido left join articulos a on dp.cod_cve=a.cod_cve '+
       'where year(p.FechaCreacion) = '+eddesde.text+' and p.estatus < 5 and a.inventariable = 1 and a.status = 1 '+
       'group by dp.cod_cve, m ) as art left join articulos a on art.cod_cve=a.cod_cve left join proveedores v on v.idprov = a.idproveedor group by art.cod_cve order by cod_cve', 0, dmreportes.sqlgeneral);

OperacionReporte('VentasPromedioArtAnual', 'Ventas promedio por Articulo', tipoImpresion, 1);
end;

procedure TfrmRepInstalaciones.TendenciaInstaladores;
var fecha1,m,fecha2:string; diaf:integer;
begin

with dmreportes do
  begin
  case rgopcion.ItemIndex of
    0 : //  Mensual
        begin
        fecha1 := datetostr(Encodedate(strtoint(cbhasta.text), idmes(cbdesde.Text), 1));
        diaf := daysinmonth(strtodate(fecha1));
        fecha2 := datetostr(Encodedate(strtoint(cbhasta.text), idmes(cbdesde.Text), diaf));
        querys('delete from TendenciaInstaladores where mes = "'+cbdesde.text+'" and fecha = '+cbhasta.Text+' ',1,sqlgeneral);
  
        querys('SELECT u.codigo as code, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), sum(p.TotHrsCom)) as horas, '+
               'dayofmonth(i.FechaFinal) as dia FROM pedidos as p join usuarios as u INNER JOIN instalaciones as i ON '+
               'i.idpedido=p.idpedido WHERE i.FechaFinal between "'+fecha1+'" and "'+fecha2+'" and (u.codigo=i.instalador1 '+
               'or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "", not (instalador1 <> "" and instalador2 '+
               '= ""),  instalador1 <> "" ) group by codigo, i.FechaFinal', 1, sqlgeneral);
        while not sqlgeneral.eof do
          begin
          querys('select mes from TendenciaInstaladores where mes= "'+cbdesde.text+'" and fecha='+cbhasta.Text+' and codigo = "'+
                 sqlgeneral.fieldbyname('code').asstring+'"',0,sqlgeneral2);
          if sqlgeneral2.fieldbyname('mes').asstring = '' then
            querys('insert into TendenciaInstaladores (codigo,fecha,mes,D'+sqlgeneral.fieldbyname('dia').asstring+',idmes) '+
                   'values("'+sqlgeneral.fieldbyname('code').asstring+'",'+cbhasta.Text+',"'+cbdesde.text+'","'+
                   sqlgeneral.fieldbyname('horas').asstring+'","'+m+'") ',1,sqlgeneral3)
          else
            querys('update TendenciaInstaladores set D'+sqlgeneral.fieldbyname('dia').asstring+'=  '+
                    sqlgeneral.fieldbyname('horas').asstring+' + D'+sqlgeneral.fieldbyname('dia').asstring+
                    ' where codigo = "'+sqlgeneral.fieldbyname('code').asstring+'" and  fecha = '+cbhasta.Text+' and mes = "'+
                    cbdesde.text+'"',1,sqlgeneral3);
          sqlgeneral.next;
          end;
  
        //sacar el total de todas los servicios
        querys('update TendenciaInstaladores set total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+'+
               'D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31)', 1, sqlgeneral3);
  
        //sacar la tendencia por tecnico
        if monthof(today) = (cbdesde.ItemIndex+1) then
          querys('update TendenciaInstaladores set promedio=round((total/'+inttostr(dayof(today))+'),2), tendencia=round(((total/'+
                 inttostr(dayof(today))+')*'+inttostr(diaf)+'),2)', 1, sqlgeneral3)
        else
          querys('update TendenciaInstaladores set promedio=round((total/'+inttostr(diaf)+'),2), tendencia=round(((total/'+
                 inttostr(diaf)+')*'+inttostr(diaf)+'),2)', 1, sqlgeneral3);
        //diferencia
        querys('update TendenciaInstaladores set diferencia = 200 - tendencia', 1, sqlgeneral3);
  
        querys('select t.*, '+UsuarioNombre('usuarios')+' as tecnico from TendenciaInstaladores as t '+
              'left join usuarios on (usuarios.codigo=t.codigo) where mes= "'+cbdesde.text+'" and t.fecha='+cbhasta.Text+
              ' and usuarios.estatus = 1 group by codigo  order by t.codigo ',0,sqlgeneral);
        OperacionReporte('TendenciaInstaladores','Reporte de tendencia instaladores',TipoImpresion, 1);
        end;
    1 : //  Anual Hrs Com
        begin
         querys('select codigo, "Tendencia Instalaciones Anual Horas Instaladores" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+
          inttostr(cbdesde.itemindex+1)+'),2) as promedio, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+')*12,2) as tendencia,'+
          ''+cbhasta.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
          'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
          'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), sum(p.TotHrsCom)) as horas, '+
          'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
          'sum(p.TotHrsCom), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrsCom), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrsCom), 0) as m3, '+
          'if(month(i.FechaFinal) = 4, sum(p.TotHrsCom), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrsCom), 0) as m5,if(month(i.FechaFinal) = 6, '+
          'sum(p.TotHrsCom), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrsCom), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrsCom), 0) as m8, '+
          'if(month(i.FechaFinal) = 9, sum(p.TotHrsCom), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrsCom), 0) as m10,if(month(i.FechaFinal) '+
          '= 11, sum(p.TotHrsCom), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrsCom), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
          'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) = '+cbhasta.Text+' and month(i.FechaFinal) <= '+inttostr(cbdesde.itemindex+1)+' '+
          'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
          'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
          'group by codigo',0,sqlgeneral);
        OperacionReporte('TendenciaInstalacionesYear','Reporte de tendencia instaladores por año',TipoImpresion, 1);
        end;
    2 : //  Anual Hrs Vta
        begin
         querys('select codigo, "Tendencia Instalaciones Anual Horas Ventas" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+
          '),2) as promedio, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+')*12,2) as tendencia,'+
          ''+cbhasta.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
          'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
          'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrs)/count(u.codigo), sum(p.TotHrs)) as horas, '+
          'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
          'sum(p.TotHrs), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrs), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrs), 0) as m3, '+
          'if(month(i.FechaFinal) = 4, sum(p.TotHrs), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrs), 0) as m5,if(month(i.FechaFinal) = 6, '+
          'sum(p.TotHrs), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrs), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrs), 0) as m8, '+
          'if(month(i.FechaFinal) = 9, sum(p.TotHrs), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrs), 0) as m10,if(month(i.FechaFinal) '+
          '= 11, sum(p.TotHrs), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrs), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
          'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) = '+cbhasta.Text+' and month(i.FechaFinal) <= '+inttostr(cbdesde.itemindex+1)+' '+
          'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
          'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
          'group by codigo',0,sqlgeneral);
        OperacionReporte('TendenciaInstalacionesYear','Reporte de tendencia instaladores por año',TipoImpresion, 1);
        end;
  
    3: //comparacion
       begin
       querys('Drop table if exists tmpTendHrsIns'+frmprincipal.idmaq,1,sqlgeneral2);
       querys('Create table tmpTendHrsIns'+frmprincipal.idmaq+' '+
          'select codigo, "Tendencia Instalaciones Anual Horas Instaladores" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+
          '),2) as promedio, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+')*12,2) as tendencia,'+
          ''+cbhasta.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
          'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
          'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), sum(p.TotHrsCom)) as horas, '+
          'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
          'sum(p.TotHrsCom), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrsCom), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrsCom), 0) as m3, '+
          'if(month(i.FechaFinal) = 4, sum(p.TotHrsCom), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrsCom), 0) as m5,if(month(i.FechaFinal) = 6, '+
          'sum(p.TotHrsCom), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrsCom), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrsCom), 0) as m8, '+
          'if(month(i.FechaFinal) = 9, sum(p.TotHrsCom), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrsCom), 0) as m10,if(month(i.FechaFinal) '+
          '= 11, sum(p.TotHrsCom), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrsCom), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
          'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) = '+cbhasta.Text+' and month(i.FechaFinal) <= '+inttostr(cbdesde.itemindex+1)+' '+
          'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
          'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
          'group by codigo',1,sqlgeneral2);

  
       querys('Drop table if exists tmpTendHrsVen'+frmprincipal.idmaq,1,sqlgeneral2);
       querys('Create table tmpTendHrsVen'+frmprincipal.idmaq+' '+
          'select codigo, "Tendencia Instalaciones Anual Horas Ventas" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+
          '),2) as promedio, round((sum(horas)/'+inttostr(cbdesde.itemindex+1)+')*12,2) as tendencia,'+
          ''+cbhasta.Text+' as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
          'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
          'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrs)/count(u.codigo), sum(p.TotHrs)) as horas, '+
          'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
          'sum(p.TotHrs), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrs), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrs), 0) as m3, '+
          'if(month(i.FechaFinal) = 4, sum(p.TotHrs), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrs), 0) as m5,if(month(i.FechaFinal) = 6, '+
          'sum(p.TotHrs), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrs), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrs), 0) as m8, '+
          'if(month(i.FechaFinal) = 9, sum(p.TotHrs), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrs), 0) as m10,if(month(i.FechaFinal) '+
          '= 11, sum(p.TotHrs), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrs), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
          'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) = '+cbhasta.Text+' and month(i.FechaFinal) <= '+inttostr(cbdesde.itemindex+1)+' '+
          'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
          'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
          'group by codigo',1,sqlgeneral);

      querys('select "AÑO  '+cbhasta.Text+'" as periodo, '+UsuarioNombre('u')+' as nombre, tipo, t.codigo, tendencia, '+
              'ifnull(t.total, 0) as total, ifnull(t.promedio, 0) as promedio, ifnull(t.tendencia, 0) as total, ifnull(t.m1, 0) as m1, '+
              'ifnull(t.m2, 0) as m2, ifnull(t.m3, 0) as m3, ifnull(t.m4, 0) as m4, ifnull(t.m5, 0) as m5, ifnull(t.m6, 0) as m6, '+
              'ifnull(t.m7, 0) as m7, ifnull(t.m8, 0) as m8, ifnull(t.m9, 0) as m9, ifnull(t.m10, 0) as m10, ifnull(t.m11, 0) as m11, ifnull(t.m12, 0) as m12 '+
              'from ( SELECT "HI" as tipo, 1 as tt, hi.codigo, hi.total, hi.promedio, hi.tendencia, hi.m1, '+
             'hi.m2, hi.m3, hi.m4, hi.m5, hi.m6, hi.m7, hi.m8,hi.m9, hi.m10, hi.m11, hi.m12 FROM tmpTendHrsIns'+frmprincipal.idmaq+' AS hi '+
             'union all SELECT "HV" as tipo, 2 as tt, hv.codigo, hv.total, hv.promedio, hv.tendencia, hv.m1, hv.m2, hv.m3, hv.m4, hv.m5, hv.m6, hv.m7, '+
             'hv.m8, hv.m9, hv.m10, hv.m11, hv.m12 FROM tmpTendHrsVen'+frmprincipal.idmaq+' AS hv union all select "CMP" as tipo, 3 as tt, hi.codigo, '+
             'round(hv.total/hi.total,2) as total, round(hv.promedio/hi.promedio,2), round(hv.tendencia/hi.tendencia,2), round(hv.m1/hi.m1,2), '+
             'round(hv.m2/hi.m2,2), round(hv.m3/hi.m3,2), round(hv.m4/hi.m4,2), round(hv.m5/hi.m5,2), round(hv.m6/hi.m6,2), '+
             'round(hv.m7/hi.m7,2), round(hv.m8/hi.m8,2),round(hv.m9/hi.m9,2), round(hv.m10/hi.m10,2),round(hv.m11/ hi.m1,2), '+
             'round(hv.m12/hi.m12,2) FROM tmpTendHrsIns'+frmprincipal.idmaq+' AS hi left join tmpTendHrsVen'+frmprincipal.idmaq+' AS hv on '+
             'hv.codigo = hi.codigo group by hi.codigo order by codigo, tt) as t left join usuarios u on u.codigo =t.codigo', 0, sqlgeneral);
      OperacionReporte('TendenciaInstaladoresComp','Reporte de Tendencia Instaladores Comparacion',TipoImpresion, 1);
      end;
    4 : //  Anual por Meses
        begin
        if cbdesde.ItemIndex > cbhasta.ItemIndex then
          fecha1 := datetostr(encodedate(yearof(today)-1, cbdesde.itemindex+1, 1))
        else
          fecha1 := datetostr(encodedate(yearof(today), cbdesde.itemindex+1, 1));
        fecha2 := datetostr(encodedate(yearof(today), cbhasta.itemindex+1, DaysInAMonth(yearof(today), cbhasta.itemindex+1)));

        if cbdesde.ItemIndex > cbhasta.ItemIndex then
          m :=  inttostr((12-cbdesde.itemindex) + (cbhasta.itemindex+1))
        else
          m :=  inttostr((cbhasta.itemindex+1) - (cbdesde.itemindex));



         querys('select codigo, "Tendencia Instalaciones" titulo, tecnico, sum(horas) as total, round((sum(horas)/'+
          inttostr(cbdesde.itemindex+1)+'),2) as promedio, round((sum(horas)/'+m+')*12,2) as tendencia,'+
          '"De '+fecha1+' a  '+fecha2+'" as fecha, sum(m1) as m1, sum(m2) as m2, sum(m3) as m3, sum(m4) as m4, sum(m5) as m5, sum(m6) as m6, '+
          'sum(m7) as m7, sum(m8) as m8, sum(m9) as m9, sum(m10) as m10,sum(m11) as m11,sum(m12) as m12 from ( '+
          'SELECT u.codigo, if(u.codigo = "", sum(p.TotHrsCom)/count(u.codigo), sum(p.TotHrsCom)) as horas, '+
          'month(i.FechaFinal) as mes, month(i.FechaFinal)  as m, '+UsuarioNombre('u')+' as tecnico, if(month(i.FechaFinal) = 1, '+
          'sum(p.TotHrsCom), 0) as m1,if(month(i.FechaFinal) = 2, sum(p.TotHrsCom), 0) as m2,if(month(i.FechaFinal) = 3, sum(p.TotHrsCom), 0) as m3, '+
          'if(month(i.FechaFinal) = 4, sum(p.TotHrsCom), 0) as m4,if(month(i.FechaFinal) = 5, sum(p.TotHrsCom), 0) as m5,if(month(i.FechaFinal) = 6, '+
          'sum(p.TotHrsCom), 0) as m6, if(month(i.FechaFinal) = 7, sum(p.TotHrsCom), 0) as m7,if(month(i.FechaFinal) = 8, sum(p.TotHrsCom), 0) as m8, '+
          'if(month(i.FechaFinal) = 9, sum(p.TotHrsCom), 0) as m9, if(month(i.FechaFinal) = 10, sum(p.TotHrsCom), 0) as m10,if(month(i.FechaFinal) '+
          '= 11, sum(p.TotHrsCom), 0) as m11,if(month(i.FechaFinal) = 12, sum(p.TotHrsCom), 0) as m12 FROM pedidos as p join usuarios as u INNER '+
          'JOIN instalaciones as  i ON (i.idpedido=p.idpedido) '+
          'WHERE i.FechaFinal between "'+fecha1+'" and  "'+fecha2+'" '+
          'and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) and if(u.codigo = "",  '+
          'not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes) as tmp where length(codigo) = 3 '+
          'group by codigo',0,sqlgeneral);
        OperacionReporte('TendenciaInstalacionesYear','Reporte de tendencia instaladores por año',TipoImpresion, 1);
        end;
    end;
  end;
end;

procedure TfrmRepInstalaciones.rgopcionClick(Sender: TObject);
begin
case reporte of
  8: begin
     case rgopcion.ItemIndex of
       0,1,2,3  : begin
                 ComboYear(cbhasta);
                 cbhasta.Text := inttostr(yearof(today));
                 lchasta.Caption := 'Año:';
                 end;
             4 : begin
                 ComboMeses(cbhasta);
                 cbhasta.ItemIndex := monthof(today)-1;
                 lchasta.Caption := 'Mes:';
                 end;
             end;
     end;
  end;
end;

End.



