{///////////////////////////////////////////////////////////////////////////////
2009/03/18 dalyla mostrar la ultima nota
2009/03/12 dalyla quitar seguimiento y dejar nota
--------------------------------------------------------------------------------
2008/09/09 dalyla notas de seguimiento
2008/02/28 dalyla zona horaria ok
2008/01/22 dalyla origen solo por reporte en tabla solo llam, llamtmk y visita
                  y visitas nuevas
}///////////////////////////////////////////////////////////////////////////////
unit Urep_oport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, StdCtrls, RzLabel, Mask, RzButton, ExtCtrls, RzPanel,
  DB, MemDS, DBAccess, MyAccess, RzCmboBx, RzRadGrp;

type
  Tfrmrep_oportu = class(TForm)
    RzGroupBox1: TRzGroupBox;
    btnalta: TRzBitBtn;
    periodo: TRzGroupBox;
    edfechafin: TRzDateTimeEdit;
    RzLabel4: TRzLabel;
    RzLabel3: TRzLabel;
    edfechaini: TRzDateTimeEdit;
    vendedores: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    fuentes: TRzGroupBox;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    giros: TRzGroupBox;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    estatus: TRzGroupBox;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    origen: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel14: TRzLabel;
    btncerrar: TRzBitBtn;
    sqlgeneral2: TMyQuery;
    cboven1: TRzComboBox;
    cboven2: TRzComboBox;
    cbofuen2: TRzComboBox;
    cbofuen1: TRzComboBox;
    cbogiro2: TRzComboBox;
    cbogiro1: TRzComboBox;
    cboesta2: TRzComboBox;
    cboesta1: TRzComboBox;
    cboorig2: TRzComboBox;
    cboorig1: TRzComboBox;
    rgReporte: TRzRadioGroup;
    procedure carga_combo(const combo:trzcombobox;Sender :TObject);
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edfechainiKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrep_oportu: Tfrmrep_oportu;
  vend1,vend2,fuente1,fuente2,tipo1,tipo2,giro1,giro2,estatus1,estatus2,origen1,origen2:string;
  v1,v2:integer;
implementation

uses Udm, Urecursos, Udmrep, Uprincipal, DateUtils;

{$R *.dfm}

procedure Tfrmrep_oportu.carga_combo(const combo:trzcombobox;Sender :TObject);
begin
      combo.Clear;
      //asigna todos los nombre a el combo pedido
      sqlgeneral2.first;
       while not sqlgeneral2.eof do
          begin
           combo.Items.Add(sqlgeneral2.fieldbyname('nombre').AsString);
           sqlgeneral2.next;
          end;
end;



procedure Tfrmrep_oportu.FormShow(Sender: TObject);
begin
edfechaini.Date:=EncodeDate(yearof(date),monthof(date),strtoint('01'));
edfechafin.Date:=date;
edfechaini.SetFocus;    
end;

procedure Tfrmrep_oportu.btnaltaClick(Sender: TObject);
var
mypath,fecharep1,fecharep2:string;     // fecha,
begin

if edfechaini.Date <= edfechafin.Date then
  begin
    try
      mypath:=ExtractFilePath(Application.ExeName);
    
      //variables combos
      querys('SELECT codigo,idusuario FROM usuarios where codigo='+quotedstr(cboven1.Text)+'',0,sqlgeneral2);
      v1:=sqlgeneral2.fieldbyname('idusuario').AsInteger;
      querys('SELECT codigo,idusuario FROM usuarios where codigo='+quotedstr(cboven2.Text)+'',0,sqlgeneral2);
      v2:=sqlgeneral2.fieldbyname('idusuario').AsInteger;
    
      querys('SELECT nombre,idfuente FROM fuentes where nombre='+quotedstr(cbofuen1.Text)+'',0,sqlgeneral2);
      fuente1:=sqlgeneral2.fieldbyname('idfuente').asstring;
      querys('SELECT nombre,idfuente FROM fuentes where nombre='+quotedstr(cbofuen2.Text)+'',0,sqlgeneral2);
      fuente2:=sqlgeneral2.fieldbyname('idfuente').asstring;
      
      querys('SELECT nombre,idtipo_oportunidad FROM tipo_oportunidad where nombre='+quotedstr(cbogiro1.Text)+'',0,sqlgeneral2);
      giro1:=sqlgeneral2.fieldbyname('idtipo_oportunidad').asstring;
      querys('SELECT nombre,idtipo_oportunidad FROM tipo_oportunidad where nombre='+quotedstr(cbogiro2.Text)+'',0,sqlgeneral2);
      giro2:=sqlgeneral2.fieldbyname('idtipo_oportunidad').asstring;
      
      querys('SELECT nombre,idestatus FROM estatus_eventos where nombre='+quotedstr(cboesta1.Text)+'',0,sqlgeneral2);
      estatus1:=sqlgeneral2.fieldbyname('idestatus').asstring;
      querys('SELECT nombre,idestatus FROM estatus_eventos where nombre='+quotedstr(cboesta2.Text)+'',0,sqlgeneral2);
      estatus2:=sqlgeneral2.fieldbyname('idestatus').asstring;
      
      querys('SELECT nombre,idorigen FROM origen where nombre='+quotedstr(cboorig1.Text)+'',0,sqlgeneral2);
      origen1:=sqlgeneral2.fieldbyname('idorigen').asstring;
      querys('SELECT nombre,idorigen FROM origen where nombre='+quotedstr(cboorig2.Text)+'',0,sqlgeneral2);
      origen2:=sqlgeneral2.fieldbyname('idorigen').asstring;
      
      fecharep1:=formatdatetime('yyyy"/"mm"/"dd',edfechaini.Date);
      fecharep2:=formatdatetime('yyyy"/"mm"/"dd',edfechafin.Date);
    
      //INICIO REPORTE
      if rgreporte.ItemIndex = 0 then
      begin
      //crear tabla temporal de visita y insertar los datos necesarios
      querys('drop table if exists visita'+frmprincipal.idmaq,1,sqlgeneral2);
      querys('create table visita'+frmprincipal.idmaq+' (idevento varchar (20),idtipo varchar (20))',1,sqlgeneral2);
      querys('insert into visita'+frmprincipal.idmaq+' (idevento,idtipo) select ac.idevento, count(ac.idtipo_actividad) as llamada '+
             'from actividades_vendedores as ac inner join agenda_vendedores as ag on (ag.idevento=ac.idevento) left join '+
             'tipos_actividades as ta on (ta.idtipo_actividad=ac.idtipo_actividad) where ag.fecha_creacion BETWEEN "'+fecharep1+'" '+
             'and "'+fecharep2+'" AND ta.nombre= "VISITA" group by ac.idevento',1,sqlgeneral2);

      //crear tabla temporal de llamada y insertar los datos necesarios
      querys('drop table if exists llamada'+frmprincipal.idmaq,1,sqlgeneral2);
      querys('create table llamada'+frmprincipal.idmaq+' (idevento varchar (20),idtipo varchar (20))',1,sqlgeneral2);
      querys('insert into llamada'+frmprincipal.idmaq+' (idevento,idtipo) select ac.idevento,count(ac.idtipo_actividad) as llamada '+
             'from actividades_vendedores as ac inner join agenda_vendedores as ag on (ag.idevento=ac.idevento) left join '+
             'tipos_actividades as ta on (ta.idtipo_actividad=ac.idtipo_actividad) where ag.fecha_creacion BETWEEN "'+fecharep1+'" '+
             'and "'+fecharep2+'" AND ta.nombre= "LLAMADA" group by ac.idevento',1,sqlgeneral2);
      end else begin
      //crear tabla temporal de visita y insertar los datos necesarios
      querys('drop table if exists visita'+frmprincipal.idmaq,1,sqlgeneral2);
      querys('create table visita'+frmprincipal.idmaq+' (idevento varchar (20),idtipo varchar (20))',1,sqlgeneral2);
      querys('insert into visita'+frmprincipal.idmaq+' (idevento,idtipo) select ac.idevento, count(ac.idtipo_actividad) as llamada '+
             'from actividades_vendedores as ac inner join agenda_vendedores as ag on (ag.idevento=ac.idevento) left join '+
             'tipos_actividades as ta on (ta.idtipo_actividad=ac.idtipo_actividad) left join oportunidades as op on '+
             'op.idoportunidad=ag.idoportunidad left join clientes as c on c.idcliente=ag.idoportunidad '+
             'where ag.fecha_creacion BETWEEN "'+fecharep1+'" and "'+fecharep2+'" AND ta.nombre= "VISITA" '+
             'and (st_date > date_sub("'+fecharep2+'", interval 7 month) or op.cuenta is null or op.cuenta="") group by ac.idevento',1,sqlgeneral2);
      end;

      with dmreportes do
        begin
        sqlgeneral.Close;
        sqlgeneral.SQL.Clear;
        if rgreporte.ItemIndex = 0 then
        begin
       sqlgeneral.SQL.Add('SELECT sag.fecha_creacion,sag.hora_creacion,sag.idvendedor, '+
                           //'sag.observaciones as seguimiento, '+
                           'ns.nota as seguimiento, '+
                           'op.idoportunidad, '+
                            ClienteNombre('op')+' as COMPLETO, tip.nombre as TipoOportunidad, un.codigo, '+UsuarioNombre('un')+' as nombre_ven, '+
                            'tipos.nombre as t_a_nombre, tel.telefono,tel.tipo_tel,f.nombre as fuentes,o.nombre as origen, col.nombre as '+
                            'colonia,ev.nombre as estatus,giros.nombre,op.cuenta,if (sag.prox_llama >= "'+datetostr(date)+'",sag.prox_llama,"") '+
                            'as PROX, ((to_days("'+datetostr(date)+'")-to_days(sag.fecha_creacion))*1) as dias,'+
                            '(visita'+frmprincipal.idmaq+'.idtipo *1) as vis, ');
         sqlgeneral.SQL.Add('(llamada'+frmprincipal.idmaq+'.idtipo *1) as llam, '+
                            'de.nombre as Empresa, concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa, '+
                            'concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,');

         sqlgeneral.SQL.Add('"Del '+datetostr(edfechaini.date)+' al  '+datetostr(edfechafin.date)+'" as periodo '+
                            'FROM agenda_vendedores as sag '+
                            'join DatosEmpresa as de '+
                            'INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad LEFT JOIN actividades_vendedores as ac ON '+
                            '(sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (sag.idvendedor = un.idusuario) LEFT JOIN tipos ON '+
                            '(op.idtipo=tipos.idtipo) left join giros on(giros.idgiro=op.idgiro) LEFT JOIN  telefonos as tel ON (tel.idtel = op.idtel) '+
                            'LEFT JOIN fuentes as f ON (f.idfuente = op.idfuente) LEFT JOIN origen o ON o.idorigen=op.idorigen LEFT JOIN '+
                            'colonias as col ON(col.idcol=op.idcol) LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) '+
                            'LEFT JOIN tipo_oportunidad as tip ON (tip.idtipo_oportunidad=sag.idtipo_oportunidad) ');

         //sqlgeneral.SQL.Add('left join notasseg ns on ns.idnota=sag.idnota ');
         sqlgeneral.SQL.Add('left join ( Select max(n.id) as id, n.idnota from  agenda_vendedores as ag Left join notasseg as n on '+
                            'ag.idnota=n.idnota WHERE ag.fecha_creacion between '+quotedstr(fecharep1)+'  and '+quotedstr(fecharep2)+' '+
                            'AND ag.idvendedor between '+inttostr(v1)+' and '+inttostr(v2)+' group by n.idnota ) as n on n.idnota=sag.idnota '+
                            'left join notasseg ns on ns.idnota=sag.idnota and n.id=ns.id ');

        sqlgeneral.SQL.Add('LEFT JOIN visita'+frmprincipal.idmaq+' ON (visita'+frmprincipal.idmaq+'.idevento=sag.idevento) ');
        sqlgeneral.SQL.Add('LEFT JOIN llamada'+frmprincipal.idmaq+' ON (llamada'+frmprincipal.idmaq+'.idevento=sag.idevento) ');
        sqlgeneral.SQL.Add('WHERE sag.fecha_creacion between '+quotedstr(fecharep1)+'  and '+quotedstr(fecharep2));
        if v2 > v1 then
          sqlgeneral.SQL.Add(' AND un.idusuario between '+inttostr(v1)+' and '+inttostr(v2)+' AND f.idfuente between '+quotedstr(fuente1)+' and '+quotedstr(fuente2)+' ')   //AND tipos.idtipo between '+quotedstr(tipo1)+' and '+quotedstr(tipo2)+'
        else
          sqlgeneral.SQL.Add(' AND un.idusuario between '+inttostr(v2)+' and '+inttostr(v1)+' AND f.idfuente between '+quotedstr(fuente1)+' and '+quotedstr(fuente2)+' ');  //AND tipos.idtipo between '+quotedstr(tipo1)+' and '+quotedstr(tipo2)+'

        sqlgeneral.SQL.Add('AND tip.idtipo_oportunidad between '+quotedstr(giro1)+' and '+quotedstr(giro2)+' AND ev.idestatus between '+quotedstr(estatus1)+' and '+quotedstr(estatus2)+' AND o.idorigen between '+quotedstr(origen1)+' and '+quotedstr(origen2)+' '+
                          'and o.reporte = 1 '+
                          'and un.estatus=1 GROUP BY sag.idevento  ORDER BY un.codigo,sag.fecha_creacion,sag.hora_creacion ASC');
        end else begin
        sqlgeneral.SQL.Add('SELECT sag.fecha_creacion,sag.hora_creacion,sag.idvendedor, '+
                           //'concat(sag.observaciones, "  ", ifnull(ns.nota, "")) as seguimiento, '+
                           'ns.nota as seguimiento, '+
                           'op.idoportunidad, '+
                            ClienteNombre('op')+' as COMPLETO, tip.nombre as TipoOportunidad, un.codigo, '+UsuarioNombre('un')+' as nombre_ven, '+
                            'tipos.nombre as t_a_nombre, tel.telefono,tel.tipo_tel,f.nombre as fuentes,o.nombre as origen, col.nombre as '+
                            'colonia,estatus_eventos.nombre as estatus,giros.nombre,op.cuenta,if (sag.prox_llama >= "'+datetostr(date)+'",sag.prox_llama,"") '+
                            'as PROX, ((to_days("'+datetostr(date)+'")-to_days(sag.fecha_creacion))*1) as dias,'+
                            '(visita'+frmprincipal.idmaq+'.idtipo *1) as vis, '+
                            'de.nombre as Empresa, concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc,');

         sqlgeneral.SQL.Add('"Del '+datetostr(edfechaini.date)+' al  '+datetostr(edfechafin.date)+'" as periodo '+
                            'FROM agenda_vendedores as sag '+
                            'join DatosEmpresa as de '+
                            'INNER JOIN oportunidades as op ON (sag.idoportunidad=op.idoportunidad ) LEFT JOIN actividades_vendedores as ac ON '+
                            '(sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (sag.idvendedor = un.idusuario) LEFT JOIN tipos ON '+
                            '(op.idtipo=tipos.idtipo) left join giros on(giros.idgiro=op.idgiro) LEFT JOIN  telefonos as tel ON (tel.idtel = op.idtel) '+
                            'LEFT JOIN fuentes as f ON (f.idfuente = op.idfuente) LEFT JOIN origen o ON (o.idorigen=op.idorigen) LEFT JOIN '+
                            'colonias as col ON(col.idcol=op.idcol) LEFT JOIN estatus_eventos ON (estatus_eventos.idestatus=sag.idestatus) LEFT JOIN '+
                            'tipo_oportunidad as tip ON (tip.idtipo_oportunidad=sag.idtipo_oportunidad) ');
         //sqlgeneral.SQL.Add('left join notasseg ns on ns.idnota=sag.idnota ');
         sqlgeneral.SQL.Add('left join ( Select max(n.id) as id, n.idnota from  agenda_vendedores as ag Left join notasseg as n on '+
                            'ag.idnota=n.idnota WHERE ag.fecha_creacion between '+quotedstr(fecharep1)+'  and '+quotedstr(fecharep2)+' '+
                            'AND ag.idvendedor between '+inttostr(v1)+' and '+inttostr(v2)+' group by n.idnota ) as n on n.idnota=sag.idnota '+
                            'left join notasseg ns on ns.idnota=sag.idnota and n.id=ns.id ');

         sqlgeneral.SQL.Add('left join clientes as c on c.idcliente=sag.idoportunidad ');
        sqlgeneral.SQL.Add('LEFT JOIN visita'+frmprincipal.idmaq+' ON (visita'+frmprincipal.idmaq+'.idevento=sag.idevento) ');
        sqlgeneral.SQL.Add('WHERE sag.fecha_creacion between '+quotedstr(fecharep1)+'  and '+quotedstr(fecharep2));
        if v2 > v1 then
          sqlgeneral.SQL.Add(' AND un.idusuario between '+inttostr(v1)+' and '+inttostr(v2)+' AND f.idfuente between '+quotedstr(fuente1)+' and '+quotedstr(fuente2)+' ')   //AND tipos.idtipo between '+quotedstr(tipo1)+' and '+quotedstr(tipo2)+'
        else
          sqlgeneral.SQL.Add(' AND un.idusuario between '+inttostr(v2)+' and '+inttostr(v1)+' AND f.idfuente between '+quotedstr(fuente1)+' and '+quotedstr(fuente2)+' ');  //AND tipos.idtipo between '+quotedstr(tipo1)+' and '+quotedstr(tipo2)+'

        sqlgeneral.SQL.Add('AND tip.idtipo_oportunidad between '+quotedstr(giro1)+' and '+quotedstr(giro2)+' AND estatus_eventos.idestatus between '+quotedstr(estatus1)+' and '+quotedstr(estatus2)+' AND o.idorigen between '+quotedstr(origen1)+' and '+quotedstr(origen2)+' '+
                          'and o.reporte = 1 '+ 'and (st_date > date_sub("'+fecharep2+'", interval 7 month) or op.cuenta="" or op.cuenta is null) '+
                          'and un.estatus=1 GROUP BY sag.idevento  ORDER BY un.codigo,sag.fecha_creacion,sag.hora_creacion ASC');
        end;
        sqlgeneral.Open;
        if sqlgeneral.RecordCount > 0 then
          begin
          OperacionReporte('ContactosPendVendedores','','IMP',1);
          edfechaini.SetFocus;
          end
        else
          begin
          application.MessageBox('No hay datos en esos rangos!','Mensaje',mb_iconwarning);
          edfechaini.SetFocus;
          end;
       sqlgeneral.close;
       end; //with
    finally
      querys('drop table if exists llamada'+frmprincipal.idmaq,1,sqlgeneral2);
      querys('drop table if exists visita'+frmprincipal.idmaq,1,sqlgeneral2);
    end;
  end
else
  begin
  application.MessageBox('La fecha inicial debe ser menor que la fecha final','Mensaje de error',mb_ok+mb_iconwarning);
  edfechafin.Date:=date;
  edfechafin.Date:=date;
  edfechaini.SetFocus;
  end;
end;

procedure Tfrmrep_oportu.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrep_oportu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmrep_oportu.edfechainiKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmrep_oportu.FormCreate(Sender: TObject);
begin
querys('SELECT (usuarios.codigo) as nombre FROM usuarios,areas where usuarios.idarea= areas.idarea and areas.nombre=''VENTAS'' and usuarios.estatus=1 ORDER BY usuarios.idusuario',0,sqlgeneral2);
carga_combo(cboven1,self);
cboven1.ItemIndex:=0;
carga_combo(cboven2,self);
sqlgeneral2.First;
cboven2.ItemIndex:=sqlgeneral2.recordcount-1;

querys('SELECT nombre,idfuente FROM fuentes',0,sqlgeneral2);
carga_combo(cbofuen1,self);
cbofuen1.ItemIndex:=0;
carga_combo(cbofuen2,self);
sqlgeneral2.First;
cbofuen2.ItemIndex:=sqlgeneral2.recordcount-1;

{
querys('SELECT nombre FROM tipos',0,sqlgeneral2);
carga_combo(cbotipo1,self);
cbotipo1.ItemIndex:=0;
carga_combo(cbotipo2,self);
sqlgeneral2.First;
cbotipo2.ItemIndex:=sqlgeneral2.recordcount-1;
}
querys('SELECT nombre FROM tipo_oportunidad',0,sqlgeneral2);
carga_combo(cbogiro1,self);
cbogiro1.ItemIndex:=0;
carga_combo(cbogiro2,self);
sqlgeneral2.First;
cbogiro2.ItemIndex:=sqlgeneral2.recordcount-1;

querys('SELECT nombre FROM estatus_eventos',0,sqlgeneral2);
carga_combo(cboesta1,self);
cboesta1.ItemIndex:=0;
carga_combo(cboesta2,self);
sqlgeneral2.First;
cboesta2.ItemIndex:=sqlgeneral2.recordcount-1;

querys('SELECT nombre FROM origen where reporte = 1',0,sqlgeneral2);
carga_combo(cboorig1,self);
cboorig1.ItemIndex:=0;
carga_combo(cboorig2,self);
sqlgeneral2.First;
cboorig2.ItemIndex:=sqlgeneral2.recordcount-1;
end;

end.
