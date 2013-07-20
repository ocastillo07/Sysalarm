//2008/07/02 dalyla correccion
//2008/02/28 dalyla zona horaria ok
unit URepLlamXFuente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit, RzCmboBx, ComCtrls,
  RzDTP, ExtCtrls, RzPanel, RzRadGrp, DB, MemDS, DBAccess, MyAccess,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmLlamXFuente = class(TForm)
    RGConsulta: TRzRadioGroup;
    edsemana: TRzDateTimePicker;
    edmes: TRzComboBox;
    btnGenerar: TRzBitBtn;
    btnCerrar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    sqlgeneral: TMyQuery;
    sqlgeneral2: TMyQuery;
    edano: TRzEdit;
    DS: TDataSource;
    rdTipoBusqueda: TRzRadioGroup;
    procedure btnGenerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGConsultaClick(Sender: TObject);
  private
    { Private declarations }
   procedure year;
   procedure mes;
   procedure semana;
   procedure yearOrigen;
   procedure mesOrigen;
   procedure semanaOrigen;
  public
    { Public declarations }
    tmpInicio,tmpFinal:string;
  end;

var
  frmLlamXFuente: TfrmLlamXFuente;

  sqlOrden:string = '  CASE WHEN too.nombre  IN( ''EQUIPO COMERCIAL'' ,''EQUIPO RESIDENCIAL'')  THEN 1'+
                    '  WHEN too.nombre  IN(''AMPLIACION'' ,''REUBICACION'',''CAMBIO DE CONTROL'',''REINSTALACION'') THEN 2 '+
                    '  WHEN too.nombre  IN(''ENLACE'' ,''CONEXION'',''RECONEXION'') THEN 3 END as orden';

  sqlTipoLlamadas:string = ' CASE WHEN  too.nombre  IN( ''EQUIPO COMERCIAL'' ,''EQUIPO RESIDENCIAL'')  THEN ''LLAMADAS X FUENTE (EQUIPO)'' '+
                                 //'  WHEN too.nombre  IN( ''AMPLIACION'' ,''REUBICACION'',''CAMBIO DE CONTROL'') THEN ''LLAMADAS X FUENTE (AMP/REU/C.C.)'' '+
                                 '  WHEN too.nombre  IN( ''ENLACE'' ,''CONEXION'',''RECONEXION'') THEN ''LLAMADAS X FUENTE (ENL/CONEX/REC)''  END as concepto ';

  sqlTipoLlamadasAsignadas:string = ' CASE WHEN  too.nombre  IN( ''EQUIPO COMERCIAL'' ,''EQUIPO RESIDENCIAL'')  THEN ''LLAMADAS ASIGNADAS (EQUIPO)'' '+
                                 '  WHEN too.nombre  IN( ''AMPLIACION'' ,''REUBICACION'',''CAMBIO DE CONTROL'',''REINSTALACION'') THEN ''LLAMADAS ASIGNADAS (AMP/REU/C.C.)'' '+
                                 '  WHEN too.nombre  IN( ''ENLACE'' ,''CONEXION'',''RECONEXION'') THEN ''LLAMADAS ASIGNADAS (ENL/CONEX/REC)''  END as concepto ';


  sqlTipoVisitas:string = ' CASE WHEN  too.nombre  IN( ''EQUIPO COMERCIAL'' ,''EQUIPO RESIDENCIAL'')  THEN ''VISITAS DEL VENDEDOR (EQUIPO)'' '+
                                 '  WHEN too.nombre  IN( ''AMPLIACION'' ,''REUBICACION'',''CAMBIO DE CONTROL'',''REINSTALACION'') THEN ''VISITAS DEL VENDEDOR (AMP/REU/C.C.)'' '+
                                 '  WHEN too.nombre  IN( ''ENLACE'' ,''CONEXION'',''RECONEXION'') THEN ''VISITAS DEL VENDEDOR(ENL/CONEX/REC)'' END as concepto ';

                                                                                                                                   //'LLAMADAS X FUENTE (AMP/REU/C.C.)'
  grupo:array[1..8] of string = ('LLAMADAS X FUENTE (EQUIPO)','LLAMADAS ASIGNADAS (EQUIPO)','LLAMADAS ASIGNADAS (AMP/REU/C.C./REINS)','LLAMADAS X FUENTE (ENL/CONEX/REC)','LLAMADAS ASIGNADAS (ENL/CONEX/REC)','VISITAS DEL VENDEDOR (EQUIPO)','VISITAS DEL VENDEDOR (AMP/REU/C.C.)', 'VISITAS DEL VENDEDOR(ENL/CONEX/REC)');




implementation

uses Udm, Udmrep, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmLlamXFuente.mes;
var
m,y,dia:string;
//i,
fm,diaf:integer;
f1, f2:Tdate;
begin
Screen.Cursor := crHourglass;

m := inttostr(edmes.ItemIndex+1);
y := formatdatetime('yyyy',now);
dia := formatdatetime('d',FechaServidor);

diaf:=DiasMes(m);

     querys('Drop table if exists tmpLlamXFuenteMes'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto varchar(100), Tipo varchar(100), ano int(11), MES varchar(30), D1 int(11) default 0 , D2 int(11) default 0, D3 int(11) default 0, D4 int(11) default 0, '+
            'D5 int(11) default 0, D6 int(11) default 0, D7 int(11) default 0, D8 int(11) default 0, D9 int(11) default 0, D10 int(11) default 0, D11 int(11) default 0, D12 int(11) default 0, D13 int(11) default 0, '+
            'D14 int(11) default 0, D15 int(11) default 0, D16 int(11) default 0, D17 int(11) default 0, D18 int(11) default 0, D19 int(11) default 0, D20 int(11) default 0, D21 int(11) default 0, D22 int(11) default 0, '+
            'D23 int(11) default 0, D24 int(11) default 0, D25 int(11) default 0, D26 int(11) default 0, D27 int(11) default 0, D28 int(11) default 0, D29 int(11) default 0, D30 int(11) default 0, '+
            'D31 int(11) default 0, TOTAL int(11) default 0, TOTALP float(11,2) default 0.00,TendenciaFuentes float(11,2) default 0.00, CIERRE int(11) default 0, CIERREP float(11,2) default 0.00,TendenciaCierre float(11,2)'+
            ' default 0.00,sector int(11) default 0,nivel int(11) default 0)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
     if ( (strtoint(formatdatetime('m',now)) <>  strtoint(edano.Text)) and ((edmes.ItemIndex+1)<>  strtoint(formatdatetime('m',now))) ) then
        fm := MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1]
     else
       fm :=  strtoint(formatdatetime('d',now));// MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1];

     f2 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, fm);

     tmpInicio :=  'Insert into tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto, Tipo,nivel, ano, MES) SELECT f.nombre as f,';
     tmpFinal := ', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+' as mes FROM fuentes as f';
     querys(tmpInicio+''''+grupo[1]+''',1'+tmpFinal, 1, sqlgeneral);
     querys(tmpInicio+''''+grupo[4]+''',4'+tmpFinal, 1, sqlgeneral);


    tmpInicio:='Insert into tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto, Tipo,nivel, ano, MES,sector)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,';
    tmpFinal:= ', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where ori.nombre=''LLAMADA''  '+
               ' and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2));
     //INSERTAR LOS VENDEDORES fPOR FUENTES POR LLAMADAS
     querys(tmpInicio +''''+grupo[2]+''',2'+ tmpFinal + grupoIn[1] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[3]+''',3'+ tmpFinal + grupoIn[2] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[5]+''',5'+ tmpFinal + grupoIn[3] +' group by completo',1,sqlgeneral);

                                                                                                                                                                                                                                                                         //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
     tmpInicio := 'Insert into tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto, Tipo,nivel, ano, MES,sector)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,';
     tmpFinal := ' , '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
                   ' inner join origen as ori on (ori.idorigen=o.idorigen)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where '+
                   ' a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' ';


     querys(tmpInicio +''''+grupo[6]+''',6'+tmpFinal + grupoIn[1] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[7]+''',7'+tmpFinal + grupoIn[2] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[8]+''',8'+tmpFinal + grupoIn[3] +' group by completo',1,sqlgeneral);


     // INSERTA LOS TIPOS DE FUENTES POR VISITAS//
        querys('SELECT dayofmonth(av.fecha_creacion) as dia,f.nombre as f,count(f.nombre) as t,'+sqlTipoLlamadas+' from agenda_vendedores as av inner join oportunidades as o on (o.idoportunidad=av.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) '+
               ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=av.idtipo_oportunidad) where ori.nombre=''LLAMADA'' and av.fecha_creacion  between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' '+
               '  group by f.nombre,concepto,dia',0,sqlgeneral);
                                                                                           //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set D'+(sqlgeneral.fieldbyname('dia').asstring)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        //end;

     /// INSERTAR TOTAL POR DIAS LLAMADAS ASIGNADAS
          querys('SELECT dayofmonth(av.fecha_creacion) as dia,count(av.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as nombre,'+sqlTipoLlamadasAsignadas+' from agenda_vendedores as av inner join usuarios as u on (u.idusuario=av.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=av.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 '  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=av.idtipo_oportunidad)'+
                 ' where ori.nombre=''LLAMADA'' and av.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' group by nombre,concepto,dia',0,sqlgeneral);
                                                                                                         //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

            if sqlgeneral.RecordCount > 0 then
            while not sqlgeneral.Eof do begin
                  querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set D'+sqlgeneral.fieldbyname('dia').asstring+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                  sqlgeneral.Next;
            end;//while
     //   end;


        // INSERTA TOTAL POR DIAS VISITAS//

        querys('SELECT dayofmonth(av.fecha_creacion) as dia,count(av.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as nombre,'+sqlTipoVisitas+' from agenda_vendedores as av inner join usuarios as u on (u.idusuario=av.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=av.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=av.idtipo_oportunidad) where av.fecha_creacion  between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' group by nombre,concepto,dia',0,sqlgeneral);

        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
              querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set D'+sqlgeneral.fieldbyname('dia').asstring+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ',1,sqlgeneral2);
              sqlgeneral.Next;
          end;
       // end;

     //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS ASIGNADAS//
     f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
     fm := MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1];
     f2 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, fm);

      querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoLlamadasAsignadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) '+
             '  WHERE u.estatus=1 AND AG.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND '+
             ' origen.nombre=''LLAMADA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') GROUP BY completo,concepto',0,sqlgeneral);
     while not sqlgeneral.Eof  do                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
          sqlgeneral.Next;
       end;

     //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS POR FUENTE//
      querys('SELECT f.nombre as fuente,count(O.idoportunidad) as t,'+sqlTipoLlamadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto)'+
             ' left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''LLAMADA'' and ee.nombre in(''ACEPTADA'',''CERRADA'') '+
             ' GROUP BY fuente,concepto',0,sqlgeneral);

     while not sqlgeneral.Eof  do                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

       querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoVisitas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ee.nombre in(''ACEPTADA'',''CERRADA'')  and origen.nombre=''VISITA'' GROUP BY completo,concepto',0,sqlgeneral);
                                                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

     querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set TOTAL = D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31', 1, sqlgeneral);

     if ((y=edano.Text)  and  (m=inttostr(edmes.ItemIndex+1))) then
      begin
         querys('UPDATE tmpLlamXFuenteMes'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+quotedstr(dia)+',2),TendenciaFuentes = truncate(truncate(TOTAL/'+quotedstr(dia)+',2)*'+inttostr(diaf)+',2), CIERREP = truncate(CIERRE/'+quotedstr(dia)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+quotedstr(dia)+',2)*'+inttostr(diaf)+',2) ',1,sqlgeneral2);
      end else
       begin
         querys('UPDATE tmpLlamXFuenteMes'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+inttostr(diaf)+',2),TendenciaFuentes= truncate((TOTAL/'+inttostr(diaf)+')*'+inttostr(diaf)+',2), CIERREP = truncate(CIERRE/'+inttostr(diaf)+',2),TendenciaCierre = truncate((CIERRE/'+inttostr(diaf)+')*'+inttostr(diaf)+',2)  ',1,sqlgeneral2);
      end;

     querys('select *,''Reporte de Control de LLamadas por Fuente Mensual'' as titulo from tmpLlamXFuenteMes'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+ 'and MES ='+quotedstr(edmes.text)+' and TOTAL > 0 order by nivel,sector asc',0,dmreportes.sqlgeneral);
Screen.Cursor := crDefault;

end;


procedure TfrmLlamXFuente.mesOrigen;
var
m,y,dia:string;
i, fm,diaf:integer;
f1, f2:Tdate;
begin
     //ar.idarea=1 and
Screen.Cursor := crHourglass;
m := inttostr(edmes.ItemIndex+1);
y := formatdatetime('yyyy',now);
dia := formatdatetime('d',FechaServidor);

diaf:=DiasMes(m);

     querys('Drop table if exists tmpLlamXFuenteMes'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto varchar(30), Tipo varchar(30), ano int(11), MES varchar(30), D1 int(11) default 0 , D2 int(11) default 0, D3 int(11) default 0, D4 int(11) default 0, '+
            'D5 int(11) default 0, D6 int(11) default 0, D7 int(11) default 0, D8 int(11) default 0, D9 int(11) default 0, D10 int(11) default 0, D11 int(11) default 0, D12 int(11) default 0, D13 int(11) default 0, '+
            'D14 int(11) default 0, D15 int(11) default 0, D16 int(11) default 0, D17 int(11) default 0, D18 int(11) default 0, D19 int(11) default 0, D20 int(11) default 0, D21 int(11) default 0, D22 int(11) default 0, '+
            'D23 int(11) default 0, D24 int(11) default 0, D25 int(11) default 0, D26 int(11) default 0, D27 int(11) default 0, D28 int(11) default 0, D29 int(11) default 0, D30 int(11) default 0, '+
            'D31 int(11) default 0, TOTAL int(11) default 0, TOTALP float(11,2) default 0.00,TendenciaFuentes float(11,2) default 0.00, CIERRE int(11) default 0, CIERREP float(11,2) default 0.00,TendenciaCierre float(11,2)'+
            ' default 0.00,sector int(11) default 0,nivel int(11) default 0)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE ORIGENES //
     f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
     if ( (strtoint(formatdatetime('m',now)) <>  strtoint(edano.Text)) and ((edmes.ItemIndex+1)<>  strtoint(formatdatetime('m',now))) ) then
        fm := MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1]
     else
       fm :=  strtoint(formatdatetime('d',now));// MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1];

     f2 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, fm);

     querys('Insert into tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto, Tipo, ano, MES,nivel) SELECT f.nombre as f, ''ORIGENES'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+' as mes,1 FROM origen as f ', 1, sqlgeneral);
            {

     //INSERTAR LOS VENDEDORES POR FUENTES POR LLAMADAS
     querys('Insert into tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto, Tipo, ano, MES,sector,nivel)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''ORIGENES'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector,2 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where  '+
            '  ar.idarea=1 and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and  too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);
          }                                                                                                                                                                                                                                                               //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

     // INSERTA LOS TIPOS DE FUENTES POR VISITAS//
     querys('Insert into tmpLlamXFuenteMes'+frmprincipal.idmaq+' (Concepto, Tipo, ano, MES,sector,nivel)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''VENDEDORES ORIGENES'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector,3 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where '+
            ' a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);     //and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')
                                                                                                                                                //ori.nombre=''VISITA'' and                                                                                                                         //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)


     // INSERTA TOTAL POR DIAS LLAMADAS POR FUENTE //
     for i:=1 to fm do
        begin
        f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, i);

        querys('SELECT ori.nombre as f,count(ori.nombre) as t from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) '+
               ' left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where av.fecha_creacion ='+quotedstr(datetostr(f1))+' and '+
               ' too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by ori.nombre',0,sqlgeneral);
                                                                                           //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set D'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''ORIGENES'' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;

     /// INSERTAR TOTAL POR DIAS LLAMADAS ASIGNADAS
       for i:=1 to fm do
        begin
        f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, i);
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as nombre from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad)'+
                 ' where  av.fecha_creacion ='+quotedstr(datetostr(f1))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by nombre',0,sqlgeneral);
                                                                                                         //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

            if sqlgeneral.RecordCount > 0 then
            while not sqlgeneral.Eof do begin
                  querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set D'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
                  sqlgeneral.Next;
            end;//while
        end;

             {
        // INSERTA TOTAL POR DIAS VISITAS//
        for i:=1 to fm do
        begin
        f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, i);

        querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as nombre from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad)'+
                 ' where ar.idarea=1 and av.fecha_creacion  ='+quotedstr(datetostr(f1))+' and ori.nombre=''VISITA'' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by nombre',0,sqlgeneral);          //and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')
                         // ori.nombre=''VISITA'' and                                                                              //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)


        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
              querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set D'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
              sqlgeneral.Next;
          end;
        end;

     //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS ASIGNADAS//
     f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
     fm := MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1];
     f2 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, fm);

      querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) '+
             '  WHERE u.estatus=1 AND AG.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND '+
             ' origen.nombre=''LLAMADA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY completo',0,sqlgeneral);
     while not sqlgeneral.Eof  do                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
          sqlgeneral.Next;
       end;
                 }
     //  INSERTA LOS QUE SE HICIERON CLIENTES POR ORIGENES//
       f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
      querys('SELECT origen.nombre as fuente,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto)'+
             ' left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ee.nombre in(''ACEPTADA'',''CERRADA'') and '+
             ' too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY fuente',0,sqlgeneral);
             //and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')
     while not sqlgeneral.Eof  do                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
                querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo=''ORIGENES''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;


     //  INSERTA LOS QUE SE HICIERON CLIENTES VISITAS POR FUENTE//


     querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE  AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ee.nombre in(''ACEPTADA'',''CERRADA'') and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')  GROUP BY completo',0,sqlgeneral);
                                                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;


     querys('Update tmpLlamXFuenteMes'+frmprincipal.idmaq+' set TOTAL = D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31', 1, sqlgeneral);

     if ((y=edano.Text)  and  (m=inttostr(edmes.ItemIndex+1))) then
      begin
         querys('UPDATE tmpLlamXFuenteMes'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+quotedstr(dia)+',2),TendenciaFuentes = truncate(truncate(TOTAL/'+quotedstr(dia)+',2)*'+inttostr(diaf)+',2), CIERREP = truncate(CIERRE/'+quotedstr(dia)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+quotedstr(dia)+',2)*'+inttostr(diaf)+',2) ',1,sqlgeneral2);
      end else
       begin
         querys('UPDATE tmpLlamXFuenteMes'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+inttostr(diaf)+',2),TendenciaFuentes= truncate((TOTAL/'+inttostr(diaf)+')*'+inttostr(diaf)+',2), CIERREP = truncate(CIERRE/'+inttostr(diaf)+',2),TendenciaCierre = truncate((CIERRE/'+inttostr(diaf)+')*'+inttostr(diaf)+',2)  ',1,sqlgeneral2);
      end;

     querys('select *,''Reporte de Control de LLamadas por Origen Mensual'' as titulo from tmpLlamXFuenteMes'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+ 'and MES ='+quotedstr(edmes.text)+' and TOTAL > 0 order by nivel,sector asc',0,dmreportes.sqlgeneral);
Screen.Cursor := crDefault;



end;
procedure TfrmLlamXFuente.semanaOrigen;
var
i, d:integer;
f1, f2:Tdate;
dia, mes, ano:word;
begin

Screen.Cursor := crHourglass;
// CREA LA TABLA //
     querys('Drop table if exists tmpLlamXFuenteSemana'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpLlamXFuenteSemana'+frmprincipal.idmaq+' ( ano int(11), MES varchar(30),sector int(11) default 0,nivel int(11) default 0,Concepto varchar(30), Tipo varchar(30), fecha date, LUNES int(11) default 0, MARTES int(11) default 0, MIERCOLES int(11) default 0, '+
     'JUEVES int(11) default 0, VIERNES int(11) default 0,  SABADO int(11) default 0, TOTAL int(11) default 0, TOTALP float default 0.00,TendenciaFuentes float(11,2) default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00,TendenciaCierre float(11,2))', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     d := dayofweek(edsemana.date);
     DecodeDate(edsemana.date-d+1, ano, mes, dia);
     f1 := EncodeDate(ano, mes, dia);
     f2 := f1 + 6;

     querys('Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo, ano, MES,nivel)  SELECT "'+datetostr(date)+'",f.nombre as f, ''ORIGENES'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+' as mes,1 FROM origen as f', 1, sqlgeneral);


          //INSERTAR LOS VENDEDORES POR FUENTES POR LLAMADAS
     querys('Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo, ano, MES,sector,nivel)  SELECT "'+datetostr(date)+'",if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''ORIGENES'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector,2 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
            ' where  a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);
                                                                                                                                                                                                                                                                          //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

     // INSERTA LOS TIPOS DE FUENTES POR VISITAS//
     querys('Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo, ano, MES,sector,nivel)  SELECT "'+datetostr(date)+'",if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''VENDEDORES ORIGENES'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector,3 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and '+
            ' too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);
                                                                                                                                               //ori.nombre=''VISITA''

      // INSERTA TOTAL POR DIAS LLAMADAS POR FUENTE // // INSERTA TOTAL POR DIAS //
     for i:=1 to 7 do
        begin
          querys('SELECT ori.nombre as f,count(ori.nombre) as t from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) '+
               'LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
               ' where a.fecha_creacion ='+quotedstr(datetostr(f1))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by ori.nombre',0,sqlgeneral);
       sqlgeneral.first;                                                                    //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        while not sqlgeneral.Eof = true do
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo=''ORIGENES'' ', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo=''ORIGENES'' ', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''ORIGENES'' ', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''ORIGENES'' ', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''ORIGENES'' ', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''ORIGENES'' ', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;


        /// INSERTAR TOTAL POR DIAS LLAMADAS ASIGNADAS
             f1 := EncodeDate(ano, mes, dia);

     for i:=1 to 7 do
        begin
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                 ' where a.fecha_creacion ='+quotedstr(datetostr(f1))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by f',0,sqlgeneral);
         while not sqlgeneral.Eof = true do                                                               //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+'and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;
        {
              f1 := EncodeDate(ano, mes, dia);
        // INSERTA TOTAL POR DIAS VISITAS//
       for i:=1 to 7 do
        begin
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad)'+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) where ar.idarea=1 and a.fecha_creacion ='+quotedstr(datetostr(f1))+' '+
                 ' and ori.nombre=''VISITA'' And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by f',0,sqlgeneral);
         while not sqlgeneral.Eof = true do   //ori.nombre=''VISITA''                                                         //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;
                      }
       f1 := EncodeDate(ano, mes, dia);
     //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS ASIGNADAS//
      querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE  AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+'  and ee.nombre in(''ACEPTADA'',''CERRADA'') and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY completo',0,sqlgeneral);
                                                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
          sqlgeneral.Next;
       end;

       //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS POR FUENTE//

      querys('SELECT origen.nombre as fuente,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion '+
             ' between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ee.nombre in(''ACEPTADA'',''CERRADA'') and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY fuente',0,sqlgeneral);
     while not sqlgeneral.Eof  do                                                                                                                              //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo=''ORIGENES''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

               {

     querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND ee.nombre in(''ACEPTADA'',''CERRADA'') And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') and origen.nombre=''VISITA'' GROUP BY completo',0,sqlgeneral);
                                                                                                                                                            //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

            }

    querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set TOTAL = LUNES+MARTES+MIERCOLES+JUEVES+VIERNES+SABADO', 1, dmreportes.sqlgeneral);

//     if ((formatdatetime('yyyy',now)=edano.Text)  and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then

     if (datetostr(edsemana.Date) = datetostr(now) ) then// and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then
      begin
         querys('UPDATE tmpLlamXFuenteSemana'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+inttostr(d-1)+',2),TendenciaFuentes = truncate(truncate(TOTAL/'+inttostr(d-1)+',2)*6,2), CIERREP = truncate(CIERRE/'+inttostr(d-1)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+inttostr(d-1)+',2)*6,2) ',1,sqlgeneral2);
      end else
       begin
         querys('UPDATE tmpLlamXFuenteSemana'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/6,2),TendenciaFuentes=  TOTAL, CIERREP = truncate(CIERRE/6,2),TendenciaCierre = CIERRE  ',1,sqlgeneral2);
      end;

     querys('select *,''Reporte de Control de LLamadas por Origen Semanal'' as titulo from tmpLlamXFuenteSemana'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+ 'and MES ='+quotedstr(edmes.text)+' and TOTAL > 0 order by nivel,sector asc',0,dmreportes.sqlgeneral);
Screen.Cursor := crDefault;
end;


procedure TfrmLlamXFuente.yearOrigen;
var
i, fm:integer;
f1, f2:Tdate;
begin
Screen.Cursor := crHourglass;
// CREA LA TABLA //
     querys('Drop table if exists tmpLlamXFuenteAnual'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto varchar(30), Tipo varchar(30), '+
            'ano int(11), M1 int(11) default 0, M2 int(11) default 0, M3 int(11) default 0, M4 int(11) default 0, '+
            'M5 int(11) default 0, M6 int(11) default 0, M7 int(11) default 0, M8 int(11) default 0, M9 int(11) '+
            'default 0, M10 int(11) default 0, M11 int(11) default 0, M12 int(11) default 0, TOTAL int(11) default 0, '+
            'TOTALP float default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00,TendenciaCierre float(11,2),TendenciaFuentes float(11,2) default 0.00,sector int(11) default 0,nivel int(11) default 0)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     f1 := EncodeDate(strtoint(edano.text), 1, 1);
     f2 := EncodeDate(strtoint(edano.text), 12, 31);

     querys('Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo, ano, nivel) SELECT f.nombre as f, ''ORIGENES'', '+quotedstr(edano.text)+',1 FROM origen as f ', 1, sqlgeneral);

                {
     //INSERTAR LOS VENDEDORES POR ORIGEN POR LLAMADAS
     querys('Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo, ano, sector,nivel)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''ORIGENES'', '+quotedstr(edano.text)+', u.idsector,2 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where ar.idarea=1 and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' '+
            ' And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);
        }

     // INSERTA LOS TIPOS DE ORIGEN POR VISITAS//
     querys('Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo, ano, sector,nivel)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''VENDEDORES ORIGENES'', '+quotedstr(edano.text)+',u.idsector,3 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+'  and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);


      ///llamadas por fuente
       for i:=1 to 12 do
        begin
         fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
         f1 := EncodeDate(strtoint(edano.text), i, 1);
         f2 := EncodeDate(strtoint(edano.text), i, fm);
                querys('SELECT ori.nombre as f,count(ori.nombre) as t from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
                       ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                       ' where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+'   And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by ori.nombre',0,sqlgeneral);
           sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''ORIGENES''', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;


       //vendedores por fuentes
       for i:=1 to 12 do
        begin
         fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
         f1 := EncodeDate(strtoint(edano.text), i, 1);
         f2 := EncodeDate(strtoint(edano.text), i, fm);
              querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                 ' where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')  group by f',0,sqlgeneral);
           sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VENDEDORES ORIGENES'' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;

                  {
        ///visitas por fuentes
        for i:=1 to 12 do
        begin
         fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
         f1 := EncodeDate(strtoint(edano.text), i, 1);
         f2 := EncodeDate(strtoint(edano.text), i, fm);
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where  a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' '+
                  ' and ori.nombre=''VISITA'' and ar.idarea=1  And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')  group by f',0,sqlgeneral);
           sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR'' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;
                       }

     f1 := EncodeDate(strtoint(edano.text), 1, 1);
     f2 := EncodeDate(strtoint(edano.text), 12, 31);
      //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS POR FUENTE//

      querys('SELECT origen.nombre as fuente,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad)  '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion '+
             ' between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND u.estatus=1 and ee.nombre in(''ACEPTADA'',''CERRADA'') And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY fuente',0,sqlgeneral);

     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo=''ORIGENES''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;



     querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+'  and ee.nombre in(''ACEPTADA'',''CERRADA'') And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY completo',0,sqlgeneral);

     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''VENDEDORES ORIGENES''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;
           {
    querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND u.estatus=1 AND  origen.nombre=''VISITA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') and And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY completo',0,sqlgeneral);

     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

             }
      querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set TOTAL = M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral);

     fm := strtoint(formatdatetime('m',now));
     if (edano.Text = FormatDateTime('yyyy',now) ) then// and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then
      begin
         querys('UPDATE tmpLlamXFuenteAnual'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+inttostr(fm)+',2),TendenciaFuentes = truncate(truncate(TOTAL/'+inttostr(fm)+',2)*12,2), CIERREP = truncate(CIERRE/'+inttostr(fm)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+inttostr(fm)+',2)*12,2) ',1,sqlgeneral2);
      end else
       begin
         querys('UPDATE tmpLlamXFuenteAnual'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/12,2),TendenciaFuentes=  TOTAL, CIERREP = truncate(CIERRE/12,2),TendenciaCierre = CIERRE  ',1,sqlgeneral2);
      end;

     querys('select *,''Reporte de Control de LLamadas por Origen Anual'' as titulo from tmpLlamXFuenteAnual'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+' order by nivel,sector asc',0,dmreportes.sqlgeneral);
Screen.Cursor := crDefault;
end;


procedure TfrmLlamXFuente.btnGenerarClick(Sender: TObject);
begin

Case RGConsulta.ItemIndex of
  0: begin // Año
     if edano.text = '' then
       begin
       application.MessageBox('No Escribio el Año', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     if(rdTipoBusqueda.itemindex =0) then
           year
     else
          yearOrigen;

         if dmreportes.sqlgeneral.recordcount > 0 then
               OperacionReporte('LLamXFuenteAnual', '', 'IMP', 1);


     end;
  1: begin // Mes
     if (edano.text = '') or (edano.text = '') then
       begin
       application.MessageBox('No Escribio el Año o el Mes', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     if(rdTipoBusqueda.itemindex =0) then
          mes
     else
         mesOrigen;

          if dmreportes.sqlgeneral.recordcount > 0 then
              OperacionReporte('LlamadasXFuente', '', 'IMP', 1);
     end;
  2: begin // Semana

          if(rdTipoBusqueda.itemindex =0) then
             semana
          else
             semanaOrigen;

            if dmreportes.sqlgeneral.recordcount > 0 then
                        OperacionReporte('LLamXFuenteSemanal', '', 'IMP', 1);

       end;


  end;





{
case rdTipoBusqueda.ItemIndex of
   0: begin
Case RGConsulta.ItemIndex of
  0: begin // Año
     if edano.text = '' then
       begin
       application.MessageBox('No Escribio el Año', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     if(rdTipoBusqueda.itemindex =0) then
        begin
           year;
           if dmreportes.sqlgeneral.recordcount > 0 then
               OperacionReporte('LLamXFuenteAnual', '', 'IMP', 1);

        end;

     end;
  1: begin // Mes
     if (edano.text = '') or (edano.text = '') then
       begin
       application.MessageBox('No Escribio el Año o el Mes', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     if(rdTipoBusqueda.itemindex =0) then
        begin
          mes;
          if dmreportes.sqlgeneral.recordcount > 0 then
              OperacionReporte('LlamadasXFuente', '', 'IMP', 1);
        end;
     end;
  2: begin // Semana
       if(rdTipoBusqueda.itemindex =0) then
        begin
          if(rdTipoBusqueda.itemindex =0) then
           begin
               semana;
                   if(rdTipoBusqueda.itemindex =0) then
                    begin
                     if dmreportes.sqlgeneral.recordcount > 0 then
                        OperacionReporte('LLamXFuenteSemanal', '', 'IMP', 1);
                   end;
            end;
        end;
       end;
  end;

  end;

 1: begin
 Case RGConsulta.ItemIndex of
  0: begin // Año
     if edano.text = '' then
       begin
       application.MessageBox('No Escribio el Año', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     if(rdTipoBusqueda.itemindex =0) then
        begin
           yearOrigen;
           if dmreportes.sqlgeneral.recordcount > 0 then
               OperacionReporte('LLamXFuenteAnual', '', 'IMP', 1);

        end;

     end;
  1: begin // Mes
     if (edano.text = '') or (edano.text = '') then
       begin
       application.MessageBox('No Escribio el Año o el Mes', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     if(rdTipoBusqueda.itemindex =0) then
        begin
          mesOrigen;
          if dmreportes.sqlgeneral.recordcount > 0 then
              OperacionReporte('LlamadasXFuente', '', 'IMP', 1);
        end;
     end;
  2: begin // Semana
       if(rdTipoBusqueda.itemindex =0) then
        begin
          if(rdTipoBusqueda.itemindex =0) then
           begin
               semanaOrigen;
                   if(rdTipoBusqueda.itemindex =0) then
                    begin
                     if dmreportes.sqlgeneral.recordcount > 0 then
                        OperacionReporte('LLamXFuenteSemanal', '', 'IMP', 1);
                   end;
            end;
        end;
       end;
  end;
     END;
    end;
    }
end;

procedure TfrmLlamXFuente.year;
var
i, fm:integer;
f1, f2:Tdate;
begin
Screen.Cursor := crHourglass;
// CREA LA TABLA //
     querys('Drop table if exists tmpLlamXFuenteAnual'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto varchar(200), Tipo varchar(200), '+
            'ano int(11), M1 int(11) default 0, M2 int(11) default 0, M3 int(11) default 0, M4 int(11) default 0, '+
            'M5 int(11) default 0, M6 int(11) default 0, M7 int(11) default 0, M8 int(11) default 0, M9 int(11) '+
            'default 0, M10 int(11) default 0, M11 int(11) default 0, M12 int(11) default 0, TOTAL int(11) default 0, '+
            'TOTALP float default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00,TendenciaCierre float(11,2),TendenciaFuentes float(11,2) default 0.00,sector int(11) default 0,nivel int(11) default 0)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     f1 := EncodeDate(strtoint(edano.text), 1, 1);
     f2 := EncodeDate(strtoint(edano.text), 12, 31);
                                       {
     querys('Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo, ano, nivel) SELECT f.nombre as f, ''LLAMADAS X FUENTE'', '+quotedstr(edano.text)+',1 FROM fuentes as f ', 1, sqlgeneral);

     //INSERTAR LOS VENDEDORES POR FUENTES POR LLAMADAS
     querys('Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo, ano, sector,nivel)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''LLAMADAS ASIGNADAS'', '+quotedstr(edano.text)+', u.idsector,2 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where ori.nombre=''LLAMADA''  and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and '+
            ' too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')  group by completo',1,sqlgeneral);
                                                                                                                                                                                                                                                                               //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

     // INSERTA LOS TIPOS DE FUENTES POR VISITAS//
     querys('Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo, ano, sector,nivel)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''VISITAS DEL VENDEDOR'', '+quotedstr(edano.text)+',u.idsector,3 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' '+
            ' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'')  group by completo',1,sqlgeneral);
                        }

     tmpInicio :=  'Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo,nivel, ano) SELECT f.nombre as f,';
     tmpFinal := ', '+quotedstr(edano.text)+' FROM fuentes as f';
     querys(tmpInicio+''''+grupo[1]+''',1'+tmpFinal, 1, sqlgeneral);
     querys(tmpInicio+''''+grupo[4]+''',4'+tmpFinal, 1, sqlgeneral);


    tmpInicio:='Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto,Tipo,nivel,  ano, sector)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,';
    tmpFinal:= ', '+quotedstr(edano.text)+',u.idsector from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where ori.nombre=''LLAMADA''  '+
               ' and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2));
     //INSERTAR LOS VENDEDORES POR FUENTES POR LLAMADAS
     querys(tmpInicio +''''+grupo[2]+''',2'+ tmpFinal + grupoIn[1] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[3]+''',3'+ tmpFinal + grupoIn[2] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[5]+''',5'+ tmpFinal + grupoIn[3] +' group by completo',1,sqlgeneral);
                                                                                                                                                                                                                                                                        //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

     tmpInicio := 'Insert into tmpLlamXFuenteAnual'+frmprincipal.idmaq+' (Concepto, Tipo,nivel, ano,sector)  SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,';
     tmpFinal := ' , '+quotedstr(edano.text)+',u.idsector from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
                   ' inner join origen as ori on (ori.idorigen=o.idorigen)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where '+
                   ' a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' ';


     querys(tmpInicio +''''+grupo[6]+''',6'+tmpFinal + grupoIn[1] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[7]+''',7'+tmpFinal + grupoIn[2] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[8]+''',8'+tmpFinal + grupoIn[3] +' group by completo',1,sqlgeneral);


      ///llamadas por fuente
       for i:=1 to 12 do
        begin
         fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
         f1 := EncodeDate(strtoint(edano.text), i, 1);
         f2 := EncodeDate(strtoint(edano.text), i, fm);
                querys('SELECT f.nombre as f,count(f.nombre) as t,'+sqlTipoLlamadas+' from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
                       ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                       ' where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+'  and  ori.nombre=''LLAMADA''  group by f.nombre,concepto',0,sqlgeneral);
           sqlgeneral.first;                                                                                                             //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;


       //vendedores por fuentes
       for i:=1 to 12 do
        begin
         fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
         f1 := EncodeDate(strtoint(edano.text), i, 1);
         f2 := EncodeDate(strtoint(edano.text), i, fm);
              querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f,'+sqlTipoLlamadasAsignadas+' from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and '+
                 '  ori.nombre=''LLAMADA''  group by f,concepto',0,sqlgeneral);
           sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;


        ///visitas por fuentes
        for i:=1 to 12 do
        begin
         fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
         f1 := EncodeDate(strtoint(edano.text), i, 1);
         f2 := EncodeDate(strtoint(edano.text), i, fm);
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f,'+sqlTipoVisitas+' from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) '+
                 ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                 ' where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' group by f,concepto',0,sqlgeneral);
           sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;


     f1 := EncodeDate(strtoint(edano.text), 1, 1);
     f2 := EncodeDate(strtoint(edano.text), 12, 31);
      //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS POR FUENTE//

      querys('SELECT f.nombre as fuente,count(O.idoportunidad) as t,'+sqlTipoLlamadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion '+
             ' between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''LLAMADA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') and  u.estatus=1 GROUP BY fuente,concepto',0,sqlgeneral);
     while not sqlgeneral.Eof  do                                                                                                                                  ///and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;



     querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoLlamadasAsignadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''VISITA''  and ee.nombre in(''ACEPTADA'',''CERRADA'')  GROUP BY completo,concepto',0,sqlgeneral);
                                                                                                                                                                 //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;



    querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoVisitas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''LLAMADA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY completo,concepto',0,sqlgeneral);
                                                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;


      querys('Update tmpLlamXFuenteAnual'+frmprincipal.idmaq+' set TOTAL = M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral);

//     if ((formatdatetime('yyyy',now)=edano.Text)  and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then
     fm := strtoint(formatdatetime('m',now));
     if (edano.Text = FormatDateTime('yyyy',now) ) then// and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then
      begin
         querys('UPDATE tmpLlamXFuenteAnual'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+inttostr(fm)+',2),TendenciaFuentes = truncate(truncate(TOTAL/'+inttostr(fm)+',2)*12,2), CIERREP = truncate(CIERRE/'+inttostr(fm)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+inttostr(fm)+',2)*12,2) ',1,sqlgeneral2);
      end else
       begin
         querys('UPDATE tmpLlamXFuenteAnual'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/12,2),TendenciaFuentes=  TOTAL, CIERREP = truncate(CIERRE/12,2),TendenciaCierre = CIERRE  ',1,sqlgeneral2);
      end;



     querys('select *,''Reporte de Control de LLamadas por Fuentes Anual'' as titulo from tmpLlamXFuenteAnual'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+' order by nivel,sector asc',0,dmreportes.sqlgeneral);
Screen.Cursor := crDefault;
end;


procedure TfrmLlamXFuente.semana;
var
i, d:integer;
f1, f2:Tdate;
dia, mes, ano:word;
begin

           {
m := inttostr(edmes.ItemIndex+1);
y := formatdatetime('yyyy',now);
dia := formatdatetime('d',FechaServidor);

diaf:=DiasMes(m);
            }

 Screen.Cursor := crHourglass;
// CREA LA TABLA //
     querys('Drop table if exists tmpLlamXFuenteSemana'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpLlamXFuenteSemana'+frmprincipal.idmaq+' ( ano int(11), MES varchar(30),sector int(11) default 0,nivel int(11) default 0,Concepto varchar(30), Tipo varchar(200), fecha date, LUNES int(11) default 0, MARTES int(11) default 0, MIERCOLES int(11) default 0, '+
     'JUEVES int(11) default 0, VIERNES int(11) default 0,  SABADO int(11) default 0, TOTAL int(11) default 0, TOTALP float default 0.00,TendenciaFuentes float(11,2) default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00,TendenciaCierre float(11,2))', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     d := dayofweek(edsemana.date);
     DecodeDate(edsemana.date-d+1, ano, mes, dia);
     f1 := EncodeDate(ano, mes, dia);
     f2 := f1 + 6;

     tmpInicio :=  'Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo,nivel, ano, MES) SELECT "'+datetostr(date)+'",f.nombre as f,';
     tmpFinal := ', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+' as mes FROM fuentes as f';
     querys(tmpInicio+''''+grupo[1]+''',1'+tmpFinal, 1, sqlgeneral);
     querys(tmpInicio+''''+grupo[4]+''',4'+tmpFinal, 1, sqlgeneral);

    tmpInicio:='Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo,nivel, ano, MES,sector)  SELECT "'+datetostr(date)+'",if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,';
    tmpFinal:= ', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where ori.nombre=''LLAMADA''  '+
               ' and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2));
     //INSERTAR LOS VENDEDORES POR FUENTES POR LLAMADAS
     querys(tmpInicio +''''+grupo[2]+''',2'+ tmpFinal + grupoIn[1] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[3]+''',3'+ tmpFinal + grupoIn[2] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[5]+''',5'+ tmpFinal + grupoIn[3] +' group by completo',1,sqlgeneral);


     tmpInicio := 'Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo,nivel, ano, MES,sector)  SELECT "'+datetostr(date)+'",if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,';
     tmpFinal := ' , '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
                   ' inner join origen as ori on (ori.idorigen=o.idorigen)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) where '+
                   ' a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' ';


     querys(tmpInicio +''''+grupo[6]+''',6'+tmpFinal + grupoIn[1] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[7]+''',7'+tmpFinal + grupoIn[2] +' group by completo',1,sqlgeneral);
     querys(tmpInicio +''''+grupo[8]+''',8'+tmpFinal + grupoIn[3] +' group by completo',1,sqlgeneral);

                   {
     querys('Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo, ano, MES,nivel)  SELECT "'+datetostr(date)+'",f.nombre as f, ''LLAMADAS X FUENTE'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+' as mes,1 FROM fuentes as f', 1, sqlgeneral);


          //INSERTAR LOS VENDEDORES POR FUENTES POR LLAMADAS
     querys('Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo, ano, MES,sector,nivel)  SELECT "'+datetostr(date)+'",if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''LLAMADAS ASIGNADAS'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector,2 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' inner join origen as ori on (ori.idorigen=o.idorigen)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
            ' where ori.nombre=''LLAMADA''  and a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);
                                                                                                                                                                                                                                                                          //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)

     // INSERTA LOS TIPOS DE FUENTES POR VISITAS//
     querys('Insert into tmpLlamXFuenteSemana'+frmprincipal.idmaq+' (fecha,Concepto, Tipo, ano, MES,sector,nivel)  SELECT "'+datetostr(date)+'",if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,'+
            ' ''VISITAS DEL VENDEDOR'', '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+',u.idsector,3 from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
            ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) where a.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ori.nombre=''VISITA'' and '+
            ' too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by completo',1,sqlgeneral);
                                                                                                                                               //ori.nombre=''VISITA''
                    }



     // INSERTA LOS TIPOS DE FUENTES//
     for i:=1 to 7 do
        begin
          querys('SELECT f.nombre as f,count(f.nombre) as t,'+sqlTipoLlamadas+' from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) '+
               'LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
               ' where ori.nombre=''LLAMADA''  and a.fecha_creacion ='+quotedstr(datetostr(f1))+' group by f.nombre,concepto',0,sqlgeneral);
       sqlgeneral.first;                                                                    //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        while not sqlgeneral.Eof = true do
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;
           f1 := EncodeDate(ano, mes, dia);
    // INSERTA LOS TIPOS DE FUENTES LLAMADAS ASIGANADAS//
     for i:=1 to 7 do
        begin
          querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f,count(f.nombre) as t,'+sqlTipoLlamadasAsignadas+' from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente)  '+
               'LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) inner join usuarios as u on (u.idusuario=a.idvendedor)'+
               ' where ori.nombre=''LLAMADA''  and a.fecha_creacion ='+quotedstr(datetostr(f1))+' group by f.nombre,concepto',0,sqlgeneral);
       sqlgeneral.first;                                                                    //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        while not sqlgeneral.Eof = true do
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = LUNES+ '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = MARTES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = MIERCOLES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = JUEVES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES =VIERNES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO = SABADO+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;


              f1 := EncodeDate(ano, mes, dia);
     // INSERTA TOTAL POR DIAS VISITAS//
     for i:=1 to 7 do
        begin
          querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f,count(f.nombre) as t,'+sqlTipoVisitas+' from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
               ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) inner join usuarios as u on (u.idusuario=a.idvendedor)'+
               ' where ori.nombre=''VISITA''  and a.fecha_creacion ='+quotedstr(datetostr(f1))+' group by f.nombre,concepto',0,sqlgeneral);
       sqlgeneral.first;                                                                    //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
        while not sqlgeneral.Eof = true do
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = LUNES+ '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = MARTES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = MIERCOLES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = JUEVES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES =VIERNES+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO = SABADO+'+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);

          {
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and  Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
            }
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;


              {
        /// INSERTAR TOTAL POR DIAS LLAMADAS ASIGNADAS
             f1 := EncodeDate(ano, mes, dia);

     for i:=1 to 7 do
        begin
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) '+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                 ' where ori.nombre=''LLAMADA'' and a.fecha_creacion ='+quotedstr(datetostr(f1))+' and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by f',0,sqlgeneral);
         while not sqlgeneral.Eof = true do                                                               //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+'and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;
              f1 := EncodeDate(ano, mes, dia);
        // INSERTA TOTAL POR DIAS VISITAS//
       for i:=1 to 7 do
        begin
          querys('SELECT count(a.idevento) as t,if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno),'+
                 ' concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno))) as f from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad)'+
                 ' inner join areas as ar on (ar.idarea=u.idarea) inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) where a.fecha_creacion ='+quotedstr(datetostr(f1))+' '+
                 ' and ori.nombre=''VISITA'' And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') group by f',0,sqlgeneral);
         while not sqlgeneral.Eof = true do   //ori.nombre=''VISITA''                                                         //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
          begin
          case i of
            2 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            3 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            4 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            5 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            6 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            7 : querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('f').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;
               }
            f1 := EncodeDate(ano, mes, dia);

      querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoLlamadasAsignadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) '+
             '  WHERE u.estatus=1 AND AG.fecha_creacion between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND '+
             ' origen.nombre=''LLAMADA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') GROUP BY completo,concepto',0,sqlgeneral);
     while not sqlgeneral.Eof  do                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
          sqlgeneral.Next;
       end;

           //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS POR FUENTE//
      querys('SELECT f.nombre as fuente,count(O.idoportunidad) as t,'+sqlTipoLlamadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto)'+
             ' left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''LLAMADA'' and ee.nombre in(''ACEPTADA'',''CERRADA'') '+
             ' GROUP BY fuente,concepto',0,sqlgeneral);

     while not sqlgeneral.Eof  do                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

       querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoVisitas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and ee.nombre in(''ACEPTADA'',''CERRADA'')  and origen.nombre=''VISITA'' GROUP BY completo,concepto',0,sqlgeneral);
                                                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo='+''''+sqlgeneral.fieldbyname('concepto').asstring+''' ', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;


              {
     //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS ASIGNADAS//
      querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t,'+sqlTipoLlamadasAsignadas+' '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''LLAMADA'' and ee.nombre in(''ACEPTADA'',''CERRADA'')  GROUP BY completo',0,sqlgeneral);
                                                                                                                                                               //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''LLAMADAS ASIGNADAS''', 1, sqlgeneral2);
          sqlgeneral.Next;
       end;

       //  INSERTA LOS QUE SE HICIERON CLIENTES LLAMADAS POR FUENTE//

      querys('SELECT f.nombre as fuente,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) LEFT JOIN fuentes as f ON(O.idfuente=f.idfuente) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor) '+
             ' LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between  '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND origen.nombre=''LLAMADA''  and ee.nombre in(''ACEPTADA'',''CERRADA'') and too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') GROUP BY fuente',0,sqlgeneral);
     while not sqlgeneral.Eof  do                                                                                                                              //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('fuente').asstring)+' and Tipo=''LLAMADAS X FUENTE''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;



     querys('SELECT if(u.apaterno is NULL or u.apaterno='''', u.nombre, if(u.amaterno is NULL or u.amaterno='''',concat(u.nombre, '' '', u.apaterno), concat(u.nombre, '' '', u.apaterno, '' '', u.amaterno)))  as completo,count(O.idoportunidad) as t '+
             ' FROM oportunidades as O INNER JOIN agenda_vendedores as AG ON (AG.idoportunidad=O.idoportunidad) INNER JOIN usuarios as u ON (u.idusuario=AG.idvendedor)  LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=AG.idtipo_oportunidad) '+
             ' left join origen on(origen.idorigen=O.idorigen) LEFT JOIN estatus_eventos as ee on(ee.idestatus=AG.idestatus) left join puestos as p on(p.idpuesto=u.idpuesto) left join areas as a on(a.idarea=u.idarea) WHERE u.estatus=1 AND AG.fecha_creacion '+
             ' between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' AND ee.nombre in(''ACEPTADA'',''CERRADA'') And too.nombre in(''EQUIPO RESIDENCIAL'',''EQUIPO COMERCIAL'',''ENLACE'',''CONEXION'',''RECONEXION'') and origen.nombre=''VISITA'' GROUP BY completo',0,sqlgeneral);
                                                                                                                                                            //and (AG. idtipo_oportunidad=1 OR AG.idtipo_oportunidad=2)
     while not sqlgeneral.Eof  do
       begin
          querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('completo').asstring)+' and Tipo=''VISITAS DEL VENDEDOR''', 1, sqlgeneral2);
                sqlgeneral.Next;
       end;

              }
    querys('Update tmpLlamXFuenteSemana'+frmprincipal.idmaq+' set TOTAL = LUNES+MARTES+MIERCOLES+JUEVES+VIERNES+SABADO', 1, dmreportes.sqlgeneral);

//     if ((formatdatetime('yyyy',now)=edano.Text)  and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then

     if (datetostr(edsemana.Date) = datetostr(now) ) then// and  (formatdatetime('m',now)=inttostr(edmes.ItemIndex+1))) then
      begin
         querys('UPDATE tmpLlamXFuenteSemana'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/'+inttostr(d-1)+',2),TendenciaFuentes = truncate(truncate(TOTAL/'+inttostr(d-1)+',2)*6,2), CIERREP = truncate(CIERRE/'+inttostr(d-1)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+inttostr(d-1)+',2)*6,2) ',1,sqlgeneral2);
      end else
       begin
         querys('UPDATE tmpLlamXFuenteSemana'+frmprincipal.idmaq+' SET TOTALP=truncate(TOTAL/6,2),TendenciaFuentes=  TOTAL, CIERREP = truncate(CIERRE/6,2),TendenciaCierre = CIERRE  ',1,sqlgeneral2);
      end;

     querys('select *,''Reporte de Control de LLamadas por Fuentes Semanal'' as titulo from tmpLlamXFuenteSemana'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+ 'and MES ='+quotedstr(edmes.text)+' and TOTAL > 0 order by nivel,sector asc',0,dmreportes.sqlgeneral);
Screen.Cursor := crDefault;

end;

procedure TfrmLlamXFuente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('Drop table if exists tmpLlamXFuenteAnual'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Drop table if exists tmpLlamXFuenteMes'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Drop table if exists tmpLlamXFuenteSemana'+frmprincipal.idmaq, 1, sqlgeneral);
Action := caFree;
end;

procedure TfrmLlamXFuente.btnCerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmLlamXFuente.FormShow(Sender: TObject);
begin
edmes.itemindex := strtoint(formatdatetime('m',now))-1;
edano.text := formatdatetime('yyyy',now);
edsemana.Date := now;
end;

procedure TfrmLlamXFuente.RGConsultaClick(Sender: TObject);
begin
if(RGConsulta.ItemIndex = 2) then
   edsemana.Enabled := true
else
   edsemana.Enabled := false;

end;

End.
