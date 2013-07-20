{///////////////////////////////////////////////////////////////////////////////
2010/05/13 dalyla on close drop querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
2009/02/10 dalyla 15 dias de vencimiento para cctv
2009/01/23 dalyla pedidos por vencidos y por vencer
--------------------------------------------------------------------------------
2008/06/19 dalyla Arreglar Obras en proceso
2008/02/28 dalyla zona horaria ok
2007/12/07 OSCAR  CORRECCIONES AL REPORTE PEDIDOS PENDIENTES
}///////////////////////////////////////////////////////////////////////////////
unit Upedidospendientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, ComCtrls, RzDTP, ExtCtrls,
  RzRadGrp, RzPanel;

type
  Tfrmpedidospendientes = class(TForm)
    Panel1: TPanel;
    dfecha1: TRzDateTimePicker;
    btnalta: TRzBitBtn;
    dfecha2: TRzDateTimePicker;
    edpedido: TRzEdit;
    GroupBox1: TGroupBox;
    cktodos: TCheckBox;
    ckfechas: TCheckBox;
    ckpedido: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    btncerrar: TRzBitBtn;
    rgreporte: TRzRadioGroup;
    rgpedidos: TRzRadioGroup;
    rgperiodo: TRzGroupBox;
    rgnopedido: TRzGroupBox;
    procedure btnaltaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cktodosKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure rgreporteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpedidospendientes: Tfrmpedidospendientes;

implementation

uses Umensaje, Udmrep, Uprincipal, Urecursos, DateUtils;

{$R *.dfm}

procedure Tfrmpedidospendientes.btnaltaClick(Sender: TObject);
var c,cadena,horas, condicion:string;
begin
   c:='0';
   horas := '';
   cadena := '';
   frmmensaje.Show;
   frmmensaje.Update;

case rgpedidos.itemindex of
  0: condicion := '';
  1: condicion := 'having tipo = "Vencidos" ';
  2: condicion := 'having tipo = "No Vencidos" ';
  end;

with dmreportes do
   begin
      querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
      querys('CREATE TABLE TempPedidosPend'+frmprincipal.idmaq+' (idauto int(11) NOT NULL auto_increment,idpedido int(11), '+
             'otro varchar(100),FechaCreacion date default NULL,FechaRemi date default NULL,idnota int(11) default 0, '+
             'Observaciones text,FechaContacto Date default null, PRIMARY KEY (idauto))',1,sqlgeneral);

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

      querys('select idnota,idpedido from TempPedidosPend'+frmprincipal.idmaq+' where idnota > 1',0,sqlgeneral);
      while not sqlgeneral.Eof do
      begin
         querys('SELECT nota,fecha from notas where idnota ='+quotedstr(sqlgeneral.fieldbyname('idnota').AsString)+' order by id desc',1,sqlgeneral2);
         if sqlgeneral2.RecordCount > 0 then
            if sqlgeneral2.fieldbyname('nota').AsString <> '' then
               querys('UPDATE TempPedidosPend'+frmprincipal.idmaq+' set Observaciones = LOWER('+quotedstr(sqlgeneral2.fieldbyname('nota').AsString)+') , FechaContacto ='+quotedstr(sqlgeneral2.fieldbyname('fecha').AsString)+' WHERE idpedido='+quotedstr(sqlgeneral.fieldbyname('idpedido').AsString),1,sqlgeneral3);
         sqlgeneral.Next;
      end;

      case rgreporte.ItemIndex of
      0 :begin
        querys('select idauto, if(FechaVencimiento>=cast("'+datetostr(date)+'" as date),"No Vencidos","Vencidos") as tipo, '+
               'if(FechaVencimiento>=cast("'+datetostr(date)+'" as date),1,0) as nven, '+
               'if(FechaVencimiento<cast("'+datetostr(date)+'" as date),1,0) as ven, '+
               'idinstalacion,venta, cuenta,fecha,cliente,codigo, '+
               'instalador, fechaVencimiento, estado,fechapromesa,fechainicio,observaciones,fechacontacto,salida,idunidadnegocio, '+
               'unidad,round(tothrs,2) as tothrs,sector,estatus,estatusinst,idusuario,vendedor from  ( '+

               'SELECT t.idauto, i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, t.FechaCreacion as Fecha, '+

               'if(un.nombre <> "CCTV", if(( dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'if(( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'if(( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'cast(adddate(t.FechaCreacion,interval 3 day) as date)))) , '+
               'case dayofweek(t.FechaCreacion) '+
               'when 1 then adddate(t.FechaCreacion,interval 19 day) '+
               'when 7 then adddate(t.FechaCreacion,interval 20 day) '+
               'else adddate(t.FechaCreacion,interval 21 day) end ) as FechaVencimiento,'+
               {'if((dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
               'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
               'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'cast(adddate(t.FechaCreacion,interval 3 day) as date)))) as FechaVencimiento, }
               ''+ClienteNombre('c')+' as Cliente, '+
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
               'if(un.nombre <> "CCTV", if(( dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'if(( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'if(( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'cast(adddate(t.FechaCreacion,interval 3 day) as date)))) , '+
               'case dayofweek(t.FechaCreacion) '+
               'when 1 then adddate(t.FechaCreacion,interval 19 day) '+
               'when 7 then adddate(t.FechaCreacion,interval 20 day) '+
               'else adddate(t.FechaCreacion,interval 21 day) end ) as FechaVencimiento,'+
               {'if((dayofweek(cast(adddate(t.FechaCreacion,interval 1 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
               'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 2 day) as date)))=1,adddate(t.FechaCreacion,interval 4 day), '+
               'if (( dayofweek(cast(adddate(t.FechaCreacion,interval 3 day) as date)))=1, adddate(t.FechaCreacion,interval 4 day), '+
               'cast(adddate(t.FechaCreacion,interval 3 day) as date)))) as FechaVencimiento, '+}
               ''+clienteNombre('c')+' as Cliente, '+
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
               ') as tabla '+condicion+' order by codigo desc, nven asc ',0,sqlgeneral2);
         if sqlgeneral2.FieldByName('Venta').AsString <> '' then
         begin
            c:=inttostr(strtoint(c)+sqlgeneral2.recordcount);
            sqlgeneral2.First;
         end;
         querys('SELECT  sum(p.TotHrs) as total FROM TempPedidosPend'+frmprincipal.idmaq+' as t left JOIN pedidos as p ON(p.idpedido=t.idpedido) ',0,sqlgeneral);
         Operacionreporte('RepPedidosPend', '', 'IMP', 1);
      end;

      ///////////////////////////////////////////////////////////////////////////
      ////////////////////////POR TECNICO////////////////////////////////////////
      1 :begin
        querys('select idauto, if(FechaVencimiento>=cast("'+datetostr(date)+'" as date),"No Vencidos","Vencidos") as tipo, '+
               'if(FechaVencimiento>=cast("'+datetostr(date)+'" as date),1,0) as nven, '+
               'if(FechaVencimiento<cast("'+datetostr(date)+'" as date),1,0) as ven, '+
               'idinstalacion,venta, cuenta,fecha,cliente,codigo, '+
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
               'AND u.codigo = "'+edpedido.text+'" GROUP BY p.idpedido, codigo union '+

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
               'ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and ObraEnProceso = 1 AND u.codigo = "'+edpedido.text+'"  GROUP BY p.idpedido, codigo '+
               ') as tabla '+condicion+' order by codigo desc, nven asc ',0,sqlgeneral2);
         if sqlgeneral2.FieldByName('Venta').AsString <> '' then
         begin
            c:=inttostr(strtoint(c)+sqlgeneral2.recordcount);
            sqlgeneral2.First;
         end;
         querys('SELECT  sum(p.TotHrs) as total FROM TempPedidosPend'+frmprincipal.idmaq+' as t left JOIN pedidos as p ON(p.idpedido=t.idpedido) ',0,sqlgeneral);
         Operacionreporte('RepPedidosPend', '', 'IMP', 1);
      end;
           /////////////////////////////////////////////////////////////////////
           ///////////////////////// FECHAS ////////////////////////////////////
      //if ckfechas.Checked = true then
      2:begin
         sqlgeneral2.Close;
         sqlgeneral2.SQL.Clear;
         sqlgeneral2.SQL.Add('SELECT t.idauto,i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, '+
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
                             ' LEFT JOIN usuarios as us ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and fechavencimiento between "'+datetostr(dfecha1.Date)+'" and "'+datetostr(dfecha2.Date)+'"'+
                             ' and i.ObraEnProceso = 0 GROUP BY p.idpedido order by u.idusuario,t.idauto asc');
         sqlgeneral2.Execute;
         frmmensaje.Close;
         OperacionReporte('RepPedidosPend','Reporte de Pedido Pendientes','IMP',1);
      end;
           /////////////////////////////////////////////////////////////////////
           ///////////////////////// PEDIDO ////////////////////////////////////
      //if ckpedido.Checked = true then
     3: begin
         sqlgeneral2.Close;
         sqlgeneral2.SQL.Clear;
         sqlgeneral2.SQL.Add('SELECT t.idauto,i.idinstalacion,p.idpedido as Venta,p.idcliente as Cuenta, '+
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
                             ' LEFT JOIN usuarios as us ON (us.idusuario=p.idvendedor) WHERE  i.estatus = 0 and p.estatus in(3,4) and p.idpedido='+quotedstr(edpedido.Text)+
                             ' GROUP BY p.idpedido order by u.idusuario,t.idauto asc');
         sqlgeneral2.Execute;
         frmmensaje.Close;
         OperacionReporte('RepPedidosPend','Reporte de Pedido Pendientes','IMP',1);
      end;
     end;//case
      if sqlgeneral2.recordcount = 0 then
      begin
         application.MessageBox('No hay datos a mostrar','Atención',mb_IconInformation);
      end;
      frmmensaje.Close;
      querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,sqlgeneral);
      querys('DROP TABLE IF EXISTS TempPedidosPend2'+frmprincipal.idmaq,1,sqlgeneral);
   end;
end;

procedure Tfrmpedidospendientes.FormShow(Sender: TObject);
begin
dfecha1.Date := PrimeroMesActual;
dfecha2.Date := now;
end;

procedure Tfrmpedidospendientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('DROP TABLE IF EXISTS TempPedidosPend'+frmprincipal.idmaq,1,DMREPORTES.sqlgeneral8);
querys('DROP TABLE IF EXISTS TempPedidosPend2'+frmprincipal.idmaq,1,DMREPORTES.sqlgeneral8);
action := cafree;
end;

procedure Tfrmpedidospendientes.cktodosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmpedidospendientes.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmpedidospendientes.rgreporteClick(Sender: TObject);
begin
case rgreporte.ItemIndex of
  0: begin
     rgperiodo.Enabled := false;
     rgnopedido.Enabled := false;
     rgpedidos.Enabled := true;
     edpedido.Text := '';
     end;

  1: begin
     rgperiodo.Enabled := false;
     rgnopedido.Enabled := true;
     rgnopedido.Caption := 'Codigo de Instalador';
     rgpedidos.Enabled := true;
     edpedido.SetFocus;
     edpedido.Text := '';
     end;

  2: begin
     rgperiodo.Enabled := true;
     rgnopedido.Enabled := false;
     rgpedidos.Enabled := false;
     dfecha1.SetFocus;
     edpedido.Text := '';
     end;

  3: begin
     rgperiodo.Enabled := false;
     rgnopedido.Enabled := true;
     rgnopedido.Caption := 'Numero de pedido';
     rgpedidos.Enabled := false;
     edpedido.SetFocus;
     edpedido.Text := '';
     end;
  end;

end;

End.
