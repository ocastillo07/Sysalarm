unit Urepllamadasxfuente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, RzPanel,
  DB, MemDS, DBAccess, MyAccess;

type
  Tfrmrepllamadasxfuente = class(TForm)
    RzGroupBox1: TRzGroupBox;
    RzLabel2: TRzLabel;

    RzLabel3: TRzLabel;
    dinicial: TRzDateTimeEdit;
    btngenerar: TRzBitBtn;
    dfinal: TRzDateTimeEdit;
    SqlGeneral: TMyQuery;
    sqlgrabar: TMyQuery;
    btncerrar: TRzBitBtn;
    procedure btngenerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure dinicialKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrepllamadasxfuente: Tfrmrepllamadasxfuente;

implementation

uses Uprincipal, Udmrep, Udm, Urecursos;

{$R *.dfm}

procedure Tfrmrepllamadasxfuente.btngenerarClick(Sender: TObject);
var
cont,dfin,dini,t1,t2,y1,y2:integer;
mes,mes1,dia,dia1,year,year1,fecha,fecha2,mypath:string;
begin

t1:=strtoint(FormatDateTime('mm', dinicial.Date));
t2:=strtoint(FormatDateTime('mm', dfinal.Date));
y1:=strtoint(FormatDateTime('yyyy', dinicial.Date));
y2:=strtoint(FormatDateTime('yyyy', dfinal.Date));

if (t1 =t2) and (y1 = y2) then begin

//-------------------------------------

  dini:=strtoint(FormatDateTime('d', dinicial.Date));
  dfin:=strtoint(FormatDateTime('d', dfinal.Date));

if dini <= dfin then begin

  dia:=FormatDateTime('d', dinicial.Date);
  mes:=FormatDateTime('mm', dinicial.Date);
  year:=FormatDateTime('yyyy', dinicial.Date);


  querys('delete from temporal_fuentes where idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgeneral);

  querys('insert into temporal_fuentes (fuente,id,tipo,concepto,idmaq) select ''1'',''1'',''CONCEPTO_LLAMA'',nombre,'+quotedstr(frmprincipal.idmaq)+' from fuentes',1,sqlgeneral);
  querys('insert into temporal_fuentes (fuente,id,tipo,concepto,idmaq) select ''1'',''2'',''CITAS_ASIGNADAS'',concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as nombre,'+quotedstr(frmprincipal.idmaq)+' from usuarios,areas where usuarios.idarea=areas.idarea AND areas.nombre=''VENTAS''',1,sqlgrabar);
  querys('insert into temporal_fuentes (fuente,id,tipo,concepto,idmaq) select ''2'',''3'',''CONCEPTO_VISITA'',nombre,'+quotedstr(frmprincipal.idmaq)+' from fuentes',1,sqlgeneral);
  querys('insert into temporal_fuentes (fuente,id,tipo,concepto,idmaq) select ''2'',''4'',''ORIGINADAS_POR'',concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as nombre,'+quotedstr(frmprincipal.idmaq)+' from usuarios,areas where usuarios.idarea=areas.idarea AND areas.nombre=''VENTAS''',1,sqlgrabar);



for cont:=dini to dfin do begin

  if cont >= 10 then
     fecha:=year+'/'+mes+'/'+inttostr(cont)
  else
     fecha:=year+'/'+mes+'/0'+inttostr(cont);

///////----------------------------------------------------------------------------------//////
///////----------------------------CONCEPTO_LLAMADA--------------------------------------//////
  sqlgeneral.Close;
  sqlgeneral.SQL.Clear;
  sqlgeneral.SQL.Add('SELECT o.fecha,f.nombre as f,count(f.nombre) as t FROM fuentes as f inner join oportunidades as o on (o.idfuente=f.idfuente) inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on ');
  sqlgeneral.SQL.Add('(av.idoportunidad=o.idoportunidad) where o.alta ='+quotedstr(fecha)+' and ori.idorigen=1 and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2) group by f.nombre');
  sqlgeneral.Open;
//  querys('SELECT o.fecha,f.nombre as nombre_fuente,count(f.nombre) as t FROM fuentes as f inner join oportunidades as o on (o.idfuente=f.idfuente) inner join origen as ori on (ori.idorigen=o.idorigen) where o.fecha ='+quotedstr(fecha)+' and ori.nombre=''LLAMADA'' group by f.nombre',1,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
       while not sqlgeneral.Eof do begin
         querys('update temporal_fuentes set D'+inttostr(cont)+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('f').AsString)+' and tipo=''CONCEPTO_LLAMA'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
         sqlgeneral.Next;
       end;//while
//---------------------------------------------------------------

//--------------------CITAS ASIGNADAS----------------------------

          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.add('SELECT count(a.idevento) as t,a.idvendedor,concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) as nombre from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea)');
          sqlgeneral.SQL.add('inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) where ori.idorigen=1 and ar.idarea=1 and o.alta ='+quotedstr(fecha)+' and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2) group by nombre');
          sqlgeneral.Open;

            if sqlgeneral.RecordCount > 0 then
            while not sqlgeneral.Eof do begin
               querys('update temporal_fuentes set D'+inttostr(cont)+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').AsString)+' and tipo=''CITAS_ASIGNADAS'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
               sqlgeneral.Next;
            end;//while

///---------------------------------------------------------------

//----------------------CONCEPTO_VISITA---------------------------
  sqlgeneral.Close;
  sqlgeneral.SQL.Clear;
  sqlgeneral.SQL.Add('SELECT o.fecha,f.nombre as f,count(f.nombre) as t FROM fuentes as f inner join oportunidades as o on (o.idfuente=f.idfuente) inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on ');
  sqlgeneral.SQL.Add('(av.idoportunidad=o.idoportunidad) where o.alta ='+quotedstr(fecha)+' and ori.idorigen=2 and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2) group by f.nombre');
  sqlgeneral.Open;

    if sqlgeneral.RecordCount > 0 then
       while not sqlgeneral.Eof do begin
         querys('update temporal_fuentes set D'+inttostr(cont)+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('f').AsString)+' and tipo=''CONCEPTO_VISITA'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
         sqlgeneral.Next;
       end;//while

//-----------------------------------------------------------------

///---------------------ORIGINADAS_POR-----------------------------

          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.add('SELECT count(a.idevento) as t,a.idvendedor,concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) as nombre from agenda_vendedores as a inner join usuarios as u on (u.idusuario=a.idvendedor) inner join areas as ar on (ar.idarea=u.idarea)');
          sqlgeneral.SQL.add('inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) inner join origen as ori on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) where ori.idorigen=2 and ar.idarea=1 and o.alta ='+quotedstr(fecha)+' and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2) group by nombre');
          sqlgeneral.Open;

            if sqlgeneral.RecordCount > 0 then
            while not sqlgeneral.Eof do begin
               querys('update temporal_fuentes set D'+inttostr(cont)+'='+quotedstr(sqlgeneral.fieldbyname('t').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').AsString)+' and tipo=''ORIGINADAS_POR'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
               sqlgeneral.Next;
            end;//while



//------------------------------------------------------------------
//////-----------------------------------------------------------------------------///////
end;//for

  dia1:=FormatDateTime('d', dfinal.Date);
  mes1:=FormatDateTime('mm', dfinal.Date);
  year1:=FormatDateTime('yyyy', dfinal.Date);


///fecha inicial.......

      if strtoint(dia) < 10 then
         fecha:=year+'/'+mes+'/0'+dia
      else
         fecha:=year+'/'+mes+'/'+dia;

//fecha final...........

      if strtoint(dia1) < 10 then
         fecha2:=year1+'/'+mes1+'/0'+dia1
      else
         fecha2:=year1+'/'+mes1+'/'+dia1;


////TOTAL VENTAS.................. CONCEPTO_LLAMA

          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('SELECT f.nombre as f,count(f.nombre) as e FROM estatus_eventos as e INNER JOIN agenda_vendedores as  a on (a.idestatus=e.idestatus) INNER JOIN oportunidades as o on (o.idoportunidad = a.idoportunidad) INNER JOIN fuentes as f on (o.idfuente = f.idfuente)');
          sqlgeneral.SQL.Add('inner join origen as ori on (ori.idorigen = o.idorigen) WHERE ori.idorigen=1 AND o.alta between '+quotedstr(fecha)+' and '+quotedstr(fecha2)+' AND e.idestatus = 2 and (a.idtipo_oportunidad=1 or  a.idtipo_oportunidad=2) group by f.nombre');
          sqlgeneral.open;

          if sqlgeneral.RecordCount > 0 then
                 while not sqlgeneral.Eof do begin
                    querys('update temporal_fuentes set ven='+quotedstr(sqlgeneral.fieldbyname('e').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('f').AsString)+' and tipo=''CONCEPTO_LLAMA'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
                    sqlgeneral.Next;
                 end;//while

          querys('update temporal_fuentes as t,fuentes set total = (D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31)where t.concepto = fuentes.nombre AND t.tipo=''CONCEPTO_LLAMA'' and t.idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
          querys('update temporal_fuentes,fuentes set porciento=ROUND(((ven/total)*100),3) where temporal_fuentes.concepto = fuentes.nombre AND temporal_fuentes.tipo=''CONCEPTO_LLAMA'' and ven > 0 and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);

///TOTAL VENTAS..................CITAS_ASIGNADAS
          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('SELECT concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) as nombre,count(u.nombre) as e FROM usuarios as u INNER JOIN agenda_vendedores as a on (u.idusuario=a.idvendedor) INNER JOIN areas as ar on (ar.idarea=u.idarea) INNER JOIN oportunidades as o on  ');
          sqlgeneral.SQL.Add('(o.idoportunidad = a.idoportunidad) INNER JOIN  origen as ori on (ori.idorigen = o.idorigen) INNER JOIN estatus_eventos as es on (a.idestatus=es.idestatus) WHERE ori.idorigen=1 AND o.alta between '+quotedstr(fecha)+' and '+quotedstr(fecha2)+' ');
          sqlgeneral.SQL.Add('AND es.idestatus =2 and (a.idtipo_oportunidad=1 or  a.idtipo_oportunidad=2) group by u.nombre');
          sqlgeneral.Open;

          if sqlgeneral.RecordCount > 0 then
                 while not sqlgeneral.Eof do begin
                    querys('update temporal_fuentes set ven='+quotedstr(sqlgeneral.fieldbyname('e').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').AsString)+' and tipo=''CITAS_ASIGNADAS'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
                    sqlgeneral.Next;
                 end;///while

          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('update temporal_fuentes as t,usuarios as u set total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31) ');
          sqlgeneral.SQL.Add('where t.concepto=concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) and t.tipo=''CITAS_ASIGNADAS'' and t.idmaq='+quotedstr(frmprincipal.idmaq)+'');
          sqlgeneral.Execute;

          querys('update temporal_fuentes,usuarios as u set porciento=ROUND(((ven/total)*100),3)  where temporal_fuentes.concepto=concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) and temporal_fuentes.tipo=''CITAS_ASIGNADAS'' and ven > 0 and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);


///TOTAL VENTAS...................CONCEPTO_VISITA
          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('SELECT f.nombre as f,count(f.nombre) as e FROM estatus_eventos as e INNER JOIN agenda_vendedores as  a on (a.idestatus=e.idestatus) INNER JOIN oportunidades as o on (o.idoportunidad = a.idoportunidad) INNER JOIN fuentes as f on (o.idfuente = f.idfuente)');
          sqlgeneral.SQL.Add('inner join origen as ori on (ori.idorigen = o.idorigen) WHERE ori.idorigen=2 AND o.alta between '+quotedstr(fecha)+' and '+quotedstr(fecha2)+' AND e.idestatus = 2 and (a.idtipo_oportunidad=1 or  a.idtipo_oportunidad=2) group by f.nombre');
          sqlgeneral.open;

          if sqlgeneral.RecordCount > 0 then
                 while not sqlgeneral.Eof do begin
                    querys('update temporal_fuentes set ven='+quotedstr(sqlgeneral.fieldbyname('e').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('f').AsString)+' and tipo=''CONCEPTO_VISITA'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
                    sqlgeneral.Next;
                 end;//while

          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('update temporal_fuentes,fuentes set total = (D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31) ');
          sqlgeneral.SQL.Add('where temporal_fuentes.concepto = fuentes.nombre AND temporal_fuentes.tipo=''CONCEPTO_VISITA'' and temporal_fuentes.idmaq='+quotedstr(frmprincipal.idmaq)+'');
          sqlgeneral.Execute;
          querys('update temporal_fuentes,fuentes set porciento=ROUND(((ven/total)*100),3) where temporal_fuentes.concepto = fuentes.nombre AND temporal_fuentes.tipo=''CONCEPTO_VISITA'' and ven > 0 and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);

///TOTAL VENTAS...................ORIGINAS_POR
          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('SELECT concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) as nombre,count(u.nombre) as e FROM usuarios as u INNER JOIN agenda_vendedores as a on (u.idusuario=a.idvendedor) INNER JOIN areas as ar on (ar.idarea=u.idarea) INNER JOIN oportunidades as o on ');
          sqlgeneral.SQL.Add('(o.idoportunidad = a.idoportunidad) INNER JOIN origen as ori on (ori.idorigen = o.idorigen) INNER JOIN estatus_eventos as es on (a.idestatus=es.idestatus) WHERE ori.idorigen=2 AND o.alta between '+quotedstr(fecha)+' and '+quotedstr(fecha2)+' AND es.idestatus =2 and (a.idtipo_oportunidad=1 or  a.idtipo_oportunidad=2) group by u.nombre');
          sqlgeneral.Open;

          if sqlgeneral.RecordCount > 0 then
                 while not sqlgeneral.Eof do begin
                    querys('update temporal_fuentes set ven='+quotedstr(sqlgeneral.fieldbyname('e').AsString)+' where concepto='+quotedstr(sqlgeneral.fieldbyname('nombre').AsString)+' and tipo=''ORIGINADAS_POR'' and idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);
                    sqlgeneral.Next;
                 end;///while

          sqlgeneral.Close;
          sqlgeneral.SQL.Clear;
          sqlgeneral.SQL.Add('update temporal_fuentes as t,usuarios as u set total=(D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31) ');
          sqlgeneral.SQL.Add('where t.concepto=concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) and t.tipo=''ORIGINADAS_POR'' and t.idmaq='+quotedstr(frmprincipal.idmaq)+'');
          sqlgeneral.Execute;
          querys('update temporal_fuentes,usuarios as u set porciento=ROUND(((ven/total)*100),3)  where temporal_fuentes.concepto=concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno) and temporal_fuentes.tipo=''ORIGINADAS_POR'' and ven > 0 and temporal_fuentes.idmaq='+quotedstr(frmprincipal.idmaq),1,sqlgrabar);


///GENERAR REPORTE.....................................................................................................

mypath:=ExtractFilePath(Application.ExeName);


       fecha:=(FormatDateTime('d"/"mm"/"yyyy',dinicial.Date));
       fecha2:=(FormatDateTime('d"/"mm"/"yyyy',dfinal.Date));


      with dmreportes do begin
           sqlgeneral.Close;
           sqlgeneral.SQL.Clear;
           sqlgeneral.SQL.Add('SELECT * FROM temporal_fuentes where idmaq='+quotedstr(frmprincipal.idmaq)+' and total > 0 order by fuente,id,tipo,concepto');
           sqlgeneral.Open;

           if sqlgeneral.recordcount > 0 then begin

             ppReport.Template.DatabaseSettings.Name := 'LlamadasXFuente';
             ppReport.Template.LoadFromDatabase;
             ppReport.Template.SaveToDatabase;
             ppReport.Print;

               {
           RVP.ProjectFile:=mypath+'Reportes_sysalarm.rav';
           RVP.SetParam('fechaini','del '+fecha+' al '+fecha2+'');
           RVP.ExecuteReport('Reporte_llamadasxfuente');
                            LlamadasXFuente
                            }
           end else
            application.MessageBox('No hay datos a mostrar','Mensaje',mb_ok+mb_iconwarning);

      end;
          dinicial.SetFocus;


end else begin
    application.MessageBox('El dia inicial no debe ser mayor que el dia final','Mensaje de error',mb_ok+mb_iconwarning);
    dinicial.Date:=date;
    dinicial.SetFocus;
end;


end else begin
     application.MessageBox('Solo se hacen busquedas del mismo mes y año','Mensaje de error',mb_ok+mb_iconwarning);
     dinicial.Date:=date;
     dfinal.Date:=date;
     dinicial.SetFocus;

end;



end;




procedure Tfrmrepllamadasxfuente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmrepllamadasxfuente.FormShow(Sender: TObject);
begin
dinicial.Date:=date;
dfinal.Date:=date;
dinicial.SetFocus;
end;

procedure Tfrmrepllamadasxfuente.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmrepllamadasxfuente.dinicialKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
