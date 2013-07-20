//2008/02/28 dalyla zona horaria ok
unit USectoresVencidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzBtnEdt, StdCtrls, RzCmboBx, RzRadChk, Mask, RzEdit,
  RzLabel, ExtCtrls, RzPanel, DB, MemDS, DBAccess, MyAccess, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzRadGrp;

type
  Tfrmsectoresvencidos = class(TForm)
    gbdias: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    eddias1: TRzNumericEdit;
    eddias2: TRzNumericEdit;
    gbUnidadNegocio: TRzGroupBox;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    cbounidad1: TRzComboBox;
    cbounidad2: TRzComboBox;
    gbabogado: TRzGroupBox;
    RzLabel27: TRzLabel;
    edabogado: TRzButtonEdit;
    RzBitBtn1: TRzBitBtn;
    sqlgeneral: TMyQuery;
    sqlgeneral2: TMyQuery;
    RzBitBtn2: TRzBitBtn;
    RzGroupBox1: TRzGroupBox;
    cbosector1: TRzComboBox;
    cbosector2: TRzComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    rgincluir: TRzCheckGroup;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SectoresVencidosNew;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsectoresvencidos: Tfrmsectoresvencidos;

implementation

uses Udm, Urecursos, Udmrep, Uprincipal, Umensaje;

{$R *.dfm}

        {
fecha1:='';
fecha2:='';
//elimina tablas temporales
querys('DROP TABLE IF EXISTS temporal_sectorvence'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('DROP TABLE IF EXISTS temporal_sectorvence0'+frmprincipal.idmaq,1,dmaccesos.sqlgeneral);
querys('CREATE TABLE temporal_sectorvence'+frmprincipal.idmaq+' (mov integer(11),idcliente integer(11),'+
       'saldo float default 0,condicion1 float default 0,condicion2 float default 0,condicion3 float '+
       'default 0,condicion4 float default 0,dias integer(11),tipo varchar(15),EstatusInstalacion ''varchar(50),KEY idcliente(idcliente))',1,dmaccesos.sqlgeneral);

//trae los nombres de los sectores
buscarsectorID;
fecha1:=datetostr(now-eddias1.Value);
fecha2:=datetostr(now-9999);
buscarUnidadID;

if ckbabogado.Checked = true then
 begin
  if edabogado.Text <> '' then
   begin
    cadena:='';
    cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido) LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) '+
            ' LEFT JOIN sectores as s ON (s.idsector=c.sector)   '+
            'LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) WHERE pc.FechaVence BETWEEN '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+'   and  p.estatus in(3,4) AND restante > 0 and pc.movimiento IN(0,1) and c.sector between '+quotedstr(sector1)+' and '+quotedstr(sector2)+'  '+
            'AND p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+'  and (c.idabogado = '+quotedstr(edabogado.Text)+')';
   end
  else
   begin
    application.MessageBox('Falta el abogado','Atención',mb_iconwarning);
    edabogado.SetFocus;
    exit;
   end;
 end
else
 begin
  cadena:='';                                                     //
  cadena:='create table temporal_sectorvence0'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,pc.idcliente as cuenta  FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido)  LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente)'+
          'LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont)  ' +
          'LEFT JOIN sectores as s ON (s.idsector=c.sector) WHERE pc.FechaVence  BETWEEN  '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+'   and  p.estatus in(3,4) AND restante > 0 and pc.movimiento IN(0,1) and c.sector between '+quotedstr(sector1)+' and '+quotedstr(sector2)+' AND '+
          'p.idUnidadNegocio between '+quotedstr(UN1)+' and '+quotedstr(UN2)+'  and (c.idabogado = 0) '  ;
  if ckbbloqueados.Checked = false then
   cadena:=cadena+' and c.bloqueado = 0 '
  else
   cadena:=cadena+' and c.bloqueado in(0,1) ';
  if (ckbnormales.Checked) and (ckbforzosos.Checked) then  //para activos
   cadena := cadena + ' and con.estatus in (0,1) '
  else
   begin
    if ckbforzosos.Checked then //para inactivos
     cadena := cadena + ' and con.estatus=0 ';
    if ckbnormales.Checked then
     cadena := cadena + ' and con.estatus=1';
   end;

  end;
if (chkSinCuentasReporte.checked = true) then
 cadena:=cadena+' and NoReporte=0';
cadena:=cadena+' GROUP BY pc.idpago';
querys(cadena,1,dmaccesos.sqlgeneral);
querys('Create Index idpago on temporal_sectorvence0'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral);
querys('Create Index idpedido on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);

querys('Create Index cuenta on temporal_sectorvence0'+frmprincipal.idmaq+' (idpedido) ',1,sqlgeneral);
///*borrar cuentas que son mayores a (dias)
querys('DELETE temporal_sectorvence0'+frmprincipal.idmaq+' FROM temporal_sectorvence0'+frmprincipal.idmaq+' inner join PagosClientes ON(temporal_sectorvence0'+frmprincipal.idmaq+'.idpedido= PagosClientes.idpedido) where  temporal_sectorvence0'+frmprincipal.idmaq+'.movimiento = 0 and PagosClientes.movimiento =1 ',1,sqlgeneral);

querys('select cuenta from temporal_sectorvence0'+frmprincipal.idmaq+' where dias >'+eddias2.text+' group by cuenta',0,sqlgeneral);
while not sqlgeneral.Eof do
  begin
      querys('DELETE  from temporal_sectorvence0'+frmprincipal.idmaq+' where cuenta = '+sqlgeneral.fieldbyname('cuenta').AsString,1,dmreportes.sqlgeneral2);
      sqlgeneral.Next;
  end;


querys('INSERT INTO temporal_sectorvence'+frmprincipal.idmaq+' (idcliente,dias) SELECT pc.idcliente,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias FROM PagosClientes as pc   '+
       'INNER JOIN temporal_sectorvence0'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago) LEFT JOIN instalaciones as i ON(i.idpedido=pc.idpedido) GROUP BY pc.idcliente  HAVING dias <= '+eddias2.text+' ',1,sqlgeneral);
querys('SELECT if(i.EstatusInst=0,''PENDI'',if(i.EstatusInst=1,''INSTA'',if(i.EstatusInst=2,''SUPER'',if(i.EstatusInst=4,''UBICA'',if(i.EstatusInst=5,''CUESTI'',if(i.EstatusInst=7,''CANCE'','''')))))) AS valor,p.idcliente from instalaciones as i '+
       ' inner join pedidos as p on (p.idpedido=i.idpedido) inner join temporal_sectorvence'+frmprincipal.idmaq+' as t1 on(t1.idcliente=p.idcliente) where i.estatus  <> 1 having valor <>''''  ',0,sqlgeneral);
while not sqlgeneral.Eof do
begin
querys('Update temporal_sectorvence'+frmprincipal.idmaq+' set EstatusInstalacion='+quotedstr(sqlgeneral.fieldbyname('valor').AsString)+' where idcliente = '+quotedstr(sqlgeneral.fieldbyname('idcliente').AsString)+'  ',1,dmreportes.sqlgeneral2);
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
 {esto es para traer el saldo anterior a esas fechas.}
{  if( eddias1.Value > 59) then
    begin
       fecha1:=datetostr(now-0);
       fecha2:=datetostr(now-30);
       actualizar(fecha1,fecha2,'condicion1');
       fecha1:=datetostr(now-31);
       fecha2:=datetostr(now-59);
       actualizar(fecha1,fecha2,'condicion2'); 
   end;



  if eddias1.Value > 31 then
   fecha1:=datetostr(now-eddias1.Value)
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
   querys('Select idabogado,concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) as Abogado from abogados where idabogado='+quotedstr(edabogado.Text),0,sqlgeneral2);
   fecha2:='Abogado : '+sqlgeneral2.fieldbyname('Abogado').AsString;
  end
 else
  fecha2:='.';
  cadena:='Del Sector '+cbosector1.Text +' al '+cbosector2.Text;
  querys('select '+quotedstr(fecha1)+' as titulo1,'+quotedstr(fecha2)+' as titulo2,'+quotedstr(cadena)+' as titulo3, t.saldo,t.idcliente,cf.NombreCres as nombre,t.condicion1,t.condicion2,t.condicion3,t.condicion4,t.dias,if (d.bloqueado=0,''N'',''B'') as tipo,con.nombre as contrato,EstatusInstalacion from temporal_sectorvence'+frmprincipal.idmaq+' as t  LEFT JOIN clientes as d ON(d.idcliente=t.idcliente) LEFT JOIN contratos as con ON (d.TipoCont=con.TipoCont) LEFT JOIN ClientesFact as cf ON  (d.idfact=cf.idfact) where t.saldo > 2',0,sqlgeneral);//'+
  Screen.Cursor := crDefault;
  //' '   // where t.condicion1 > 0 and t.condicion2 >0 and t.condicion3>0 and t.condicion4 >0
  if sqlgeneral.FieldByName('idcliente').AsString <> '' then
   begin
    frmmensaje.Close;
    OperacionReporte('SectoresVencidos','Reportes de ',TipoImpresion, 1);
    if chkcelulares.Checked then
     begin
      querys('Select clientes.idcliente,if(clientes.rsocial is null or clientes.rsocial = '''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'' '')),clientes.rsocial) as Nombre,telefonos.telefono '+
             ' From clientes Inner Join telefonos ON clientes.idtel = telefonos.idtel inner join temporal_sectorvence'+frmprincipal.idmaq+' on temporal_sectorvence'+frmprincipal.idmaq+'.idcliente=clientes.idcliente Where telefonos.tipo_tel = ''CELULAR'' and temporal_sectorvence'+frmprincipal.idmaq+'.dias <=60',0,dmreportes.sqlgeneral4);
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
 end;//reportes    }


procedure Tfrmsectoresvencidos.RzBitBtn1Click(Sender: TObject);
begin
SectoresVencidosNew;
end;

procedure Tfrmsectoresvencidos.SectoresVencidosNew;
var fecha1,fecha2, cadena :string;
begin
fecha1:='';
fecha2:='';
fecha1:=datetostr(now-eddias1.Value);
fecha2:=datetostr(now-eddias2.value);

//Crea tabla con todos los pagos pendientes segun fechas
querys('DROP TABLE IF EXISTS tmpSecVen'+frmprincipal.idmaq,1,sqlgeneral);
cadena := 'create table tmpSecVen'+frmprincipal.idmaq+' Select pc.idpago,pc.movimiento as movimiento,'+
          'pc.idpedido as idpedido, p.idcliente, pc.restante, pc.FechaVence From PagosClientes as pc '+
          'Left join  pedidos as p on (p.idpedido=pc.idpedido) '+
          'LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) '+
          'LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) ';
cadena := cadena +'where p.estatus in(3,4,6) '+
          //'and p.saldado=0 '+    si se guardara correcto lo usara jijiji
          'and pc.movimiento in(0,1) '+
          'and pc.FechaVence between '+quotedstr(fecha2)+' and '+quotedstr(fecha1)+
          ' AND p.idUnidadNegocio between "'+cbounidad1.Value+'" and "'+cbounidad2.Value+'" and restante > 0 ';
if not(rgincluir.ItemState[0] = cbChecked) and (rgincluir.ItemState[1] = cbChecked) then
  begin
  if rgincluir.ItemState[0] = cbChecked then
   cadena := cadena + 'and con.estatus = 1 ';
  if rgincluir.ItemState[1] = cbChecked then
   cadena := cadena + 'and con.estatus = 0 ';
  end;

if rgincluir.ItemState[2]= cbChecked then
cadena := cadena + 'and c.idabogado = "'+edabogado.Text+'" ';

if rgincluir.ItemState[3]= cbChecked then
   cadena:=cadena+'and c.bloqueado = 0 '
else
   cadena:=cadena+'and c.bloqueado in(0,1) ';

if rgincluir.ItemState[4]= cbChecked  then
   cadena:=cadena+'and NoReporte=0 ';

if not ((cbosector1.itemindex = 0) and (cbosector2.ItemIndex = cbosector2.Items.Count-1)) then
  cadena := cadena + 'and c.sector between "'+cbosector1.value+'" and "'+cbosector2.value+'" ';
querys(cadena, 1, sqlgeneral);

// Borra los registros repetidos como venta y parcializacion
querys('DROP TABLE IF EXISTS tmpSecVend'+frmprincipal.idmaq,1,sqlgeneral);
querys('create table tmpSecVend'+frmprincipal.idmaq+' select pc.movimiento as mov, t.movimiento, t.idpedido as id  from  tmpSecVen'+frmprincipal.idmaq+
       ' as t left join PagosClientes as pc on(t.idpedido=pc.idpedido) having  (mov=1 and movimiento = 0)',1,sqlgeneral);
querys('Select id from tmpSecVend'+frmprincipal.idmaq+' group by id',0,sqlgeneral);
if sqlgeneral.recordcount > 0 then
  begin
  sqlgeneral.first;
  while not sqlgeneral.Eof = true do
    begin
    querys('DELETE FROM tmpSecVen'+frmprincipal.idmaq+' WHERE idpedido='+sqlgeneral.FieldByName('id').AsString+' and movimiento = 0',1,sqlgeneral2);
    sqlgeneral.Next;
    end;
  end;
querys('DROP TABLE IF EXISTS tmpSecVend'+frmprincipal.idmaq,1,sqlgeneral);
querys('DROP TABLE IF EXISTS tmpSecVen2'+frmprincipal.idmaq,1,sqlgeneral);
// Crea la ultima tabla con condicion de instalacion cerrada y listo para el reporte

querys('create table tmpSecVen2'+frmprincipal.idmaq+' Select t.idcliente, to_days("'+datetostr(date)+'")-to_days(FechaVence) as dias, '+
       'con.nombre as contrato, round(Sum(restante),2) AS saldo, if (i.EstatusInst=0,"PENDI",if(i.EstatusInst'+
       '=1,"INSTA",if(i.EstatusInst=2,"SUPER",if(i.EstatusInst=4,"UBICA",if(i.EstatusInst=5,"CUESTI",'+
       'if(i.EstatusInst=7,"CANCE","")))))) AS EstatusInstalacion, if (to_days("'+datetostr(date)+'")-to_days(FechaVence) '+
       '<=30, round(Sum(restante),2), 0) as condicion1, if (to_days("'+datetostr(date)+'")-to_days(FechaVence)>30 and '+
       'to_days("'+datetostr(date)+'")-to_days(FechaVence) <=60, round(Sum(restante),2) , 0) as condicion2, '+
       'if(to_days("'+datetostr(date)+'")-to_days(FechaVence) >60 and to_days("'+datetostr(date)+'")-to_days(FechaVence)<=90, '+
       'round(Sum(restante),2),0) as condicion3, if (to_days("'+datetostr(date)+'")-to_days(FechaVence) >90, '+
       'round(Sum(restante),2) , 0) as condicion4, if (c.bloqueado=0,"N","B") as tipo,cf.NombreCres '+
       'as nombre from tmpSecVen'+frmprincipal.idmaq+' as t left join clientes as c on(c.idcliente=t.idcliente) left join '+
       'contratos as con on(con.TipoCont=c.TipoCont) left join instalaciones as i on(t.idpedido=i.idpedido) '+
       'left join ClientesFact as cf on(cf.idfact=c.idfact) where (i.estatus = 1 or  i.estatus is null) '+
       'group by idpago order by t.idcliente  asc', 1, sqlgeneral2);

querys('DROP TABLE IF EXISTS tmpSecVen'+frmprincipal.idmaq,1,sqlgeneral);

querys('Select "'+fecha1+'" as titulo1,"'+fecha2+'" as titulo2,"Del Sector '+cbosector1.Text +' al '+
       cbosector2.Text+'" as titulo3, idcliente, contrato, dias, EstatusInstalacion,tipo, nombre, sum(saldo) '+
       'as saldo, sum(condicion1) as condicion1, sum(condicion2) as condicion2, sum(condicion3) as condicion3, '+
       'sum(condicion4) as condicion4 from tmpSecVen2'+frmprincipal.idmaq+' group by idcliente having saldo > 1 order by '+
       'idcliente  asc ', 0, dmreportes.sqlgeneral);
 OperacionReporte('SectoresVencidos','Reportes de SectoresVencidos','IMP', 1);

if rgincluir.ItemState[5]= cbChecked then
     begin
     querys('Select clientes.idcliente, '+ClienteNombre('clientes')+' as Nombre,telefonos.telefono From '+
            'tmpSecVen2'+frmprincipal.idmaq+' as t inner join clientes on clientes.idcliente=t.idcliente '+
            'inner Join telefonos ON clientes.idtel = telefonos.idtel Where telefonos.tipo_tel = "CELULAR"'+
            ' and t.dias <=60 ',0,dmreportes.sqlgeneral4);
     OperacionReporte('CelularesClientes','Reportes de ','IMP', 1);
     end;
end;

procedure Tfrmsectoresvencidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('DROP TABLE IF EXISTS tmpSecVen'+frmprincipal.idmaq,1,sqlgeneral);
querys('DROP TABLE IF EXISTS tmpSecVen2'+frmprincipal.idmaq,1,sqlgeneral);
action:=cafree;
end;

procedure Tfrmsectoresvencidos.RzBitBtn2Click(Sender: TObject);
begin
querys('DROP TABLE IF EXISTS tmpSecVen'+frmprincipal.idmaq,1,sqlgeneral);
querys('DROP TABLE IF EXISTS tmpSecVen2'+frmprincipal.idmaq,1,sqlgeneral);
release;
end;

procedure Tfrmsectoresvencidos.FormShow(Sender: TObject);
begin
cargacombo2('select * from UnidadNegocio', 'nombre', 'idunidadnegocio',cbounidad1);
cargacombo2('select * from UnidadNegocio', 'nombre', 'idunidadnegocio',cbounidad2);
cbounidad1.ItemIndex :=0;
cbounidad2.ItemIndex :=cbounidad2.Items.Count-1;
cargacombo2('select * from sectores', 'nombre', 'idsector',cbosector1);
cargacombo2('select * from sectores', 'nombre', 'idsector',cbosector2);
cbosector1.ItemIndex :=0;
cbosector2.ItemIndex :=cbosector2.Items.Count-1;

end;

End.
