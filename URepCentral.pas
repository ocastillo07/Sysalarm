{///////////////////////////////////////////////////////////////////////////////
2011/03/08 dalyla reportes de anual y mensual de activaciones
2010/04/23 dalyla no bloqueados e cuentas sin armar
2010/03/01 dalyla cuentas sin desarmar solo activas
--------------------------------------------------------------------------------
2009/03/05 dalyla colonias por sector
2009/05/21 dalyla correccion de cuentas sin desarmar
2009/04/22 dalyla Reporte de cuentas sin armar
2008/10/23 dalyla cobro de activaciones
2008/08/20 dalyla rep activaciones por periodo
2008/05/23 dalyla Reporte de Atencion por Activacion
}///////////////////////////////////////////////////////////////////////////////
unit URepCentral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, ComCtrls, RzDTP, Mask, RzEdit,
  RzLabel, DateUtils, DB, MemDS, DBAccess, MyAccess, ExtCtrls, RzPanel,
  RzRadGrp;

type
  TfrmRepCentral = class(TForm)
    gbfecha: TGroupBox;
    gbturno: TGroupBox;
    cbturno: TRzComboBox;
    btnimprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    cbtipoimpresion: TRzComboBox;
    ldesde: TRzLabel;
    lhasta: TRzLabel;
    tpdesde: TRzDateTimeEdit;
    tphasta: TRzDateTimeEdit;
    sqlgeneral: TMyQuery;
    rgopciones: TRzRadioGroup;
    rgtiempo: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    tmdesde: TRzDateTimeEdit;
    tmhasta: TRzDateTimeEdit;
    cbdesde: TRzComboBox;
    cbhasta: TRzComboBox;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure cbtipoimpresionSelect(Sender: TObject);
  private
    procedure TiempoActivacion;
    procedure AsistenciaAnual;
    procedure CuentasSinSen;
    procedure ActivacionesDiariasDetalle;
    procedure CobroAccidentales;
    procedure CuentasSinArmarDesarmar;
    procedure ColoniasPorSector;
    procedure OxxoPasswords;
    procedure TiempoTrasladoPatrulleros;
    procedure ActivacionesDiariasMensual;
    procedure ActivacionesDiariasAnual;
    procedure CuentasInactivasConTrafico;
    { Private declarations }
  public
    { Public declarations }
    Rep:integer;
    TipoImpresion:string;
    procedure inicializa;
  end;

var
  frmRepCentral: TfrmRepCentral;

implementation

uses Urecursos, Uprincipal, Udmrep, Udm;

{$R *.dfm}

procedure TfrmRepCentral.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmRepCentral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:= caFree;
end;
                    
procedure TfrmRepCentral.inicializa;
begin
   CargaCombo2('SELECT nombre FROM turnos WHERE idarea = 4','nombre','nombre',cbturno);
   cbturno.ItemIndex:= 0;
   TipoImpresion:= 'IMP';
   tpdesde.Date := EncodeDate(yearof(today), monthof(today), 1);
   tphasta.Date := today;
   self.width := 390;
   case Rep of
      1: begin
         gbturno.Visible := true;
         tphasta.Enabled := false;
         Height:= 195;
         end;

      2: //Tiempo por Activacion Cetraleros
         begin
         gbturno.Caption := 'Activacion';
         gbturno.Visible := true;
         CBturno.text := 'ACTIVACION POSITIVA';
         CargaCombo2('SELECT id, status FROM alarmas_conclusion','status','id',cbturno);
         end;

      3: begin
         gbturno.Visible := true;
         CBturno.text := 'AÑO:';
         ComboYear(cbturno);
         gbturno.Top := 3;
         gbfecha.Visible := false;
         end;

      4: begin
         Self.Caption := 'Cuentas Activas sin Señales';
         gbfecha.Visible := false;
         rgopciones.left := 0;
         rgopciones.top := 0;
         rgopciones.Height := 60;
         rgopciones.Width := 201;
         rgopciones.Items.Clear;
         rgopciones.Items.Add('Cuentas sin señales');
         rgopciones.Items.Add('Cuentas sin Pruebas Semanal');
         rgopciones.ItemIndex := 0;
         end;

      5: begin
         Self.Caption := 'Activaciones por periodo';
         self.Height :=280;
         tphasta.enabled := false;
         rgopciones.Items.Clear;
         rgopciones.Items.Add('Turno');
         rgopciones.Items.Add('Horas');
         rgopciones.ItemIndex := 0;
         gbturno.Visible := true;
         querys('Select idturno from turnos where curtime() between horainicio and horafin ', 0, sqlgeneral);
         cbturno.ItemIndex := sqlgeneral.fieldbyname('idturno').AsInteger-1;
         rgtiempo.Visible := true;
         tmdesde.Time := now;
         tmhasta.Time := now;
         end;

      6: //Cobro de Accidentales
         begin
         Self.Caption := 'Cobro de Activaciones Accidentales';
         gbturno.Caption := 'Activacion';
         gbturno.Visible := true;
         CargaCombo2('SELECT id, status FROM alarmas_conclusion','status','id',cbturno);
         CBturno.text := 'ACTIVACION ACCIDENTAL';
         rgtiempo.visible := false;
         rgopciones.visible := false;
         end;

      7: //Cuentas sin armar
         begin
         Self.Caption := 'Cuentas sin Armar';
         self.Height :=230;
         tphasta.Enabled := false;
         gbturno.Visible := false;
         rgtiempo.visible := false;
         rgopciones.visible := true;
         rgopciones.Items.Clear;
         rgopciones.Items.Add('APERTURAS');
         rgopciones.Items.Add('CIERRES');
         rgopciones.ItemIndex := 0;
         rgopciones.Left := 8;
         rgopciones.Top := 96;
         tpdesde.Date := today;
         end;

      8: //Colonias por sEctor
         begin
         Self.Caption := 'Colonias por sector';
         self.Height :=192;
         gbfecha.Visible := false;
         gbturno.Visible := true;
         gbturno.Caption := ' Sector: ';
         gbturno.Top := 8;
         gbturno.Left := 8;
         CargaCombo2('select idsector from sectores', 'idsector', 'idsector', cbturno);
         rgtiempo.Visible := false;
         rgopciones.Visible := false;
         end;

      9: //Oxxo Passwords
         begin
         Self.Caption := 'Passwords de Oxxo';
         self.Height :=192;
         gbfecha.Visible := false;
         gbturno.Visible := false;
         rgtiempo.Visible := false;
         rgopciones.Visible := false;
         end;

     10: //Tiempo y Traslado Patrulleros
         begin
         Self.Caption := 'Tiempo y Traslado de Patrulleros';
         self.Height :=192;
         tphasta.Enabled := false;
         rgtiempo.Visible := false;
         rgopciones.Visible := false;
         end;

     11: //Activaciones diarias mensual
         begin
         Self.Caption := 'Activaciones por Mes';
         self.Height := 192;
         tpdesde.Visible := false;
         tphasta.Visible := false;
         gbturno.Visible := false;
         rgtiempo.Visible := false;
         rgopciones.Visible := false;
         cbdesde.visible := true;
         cbhasta.visible := true;
         ldesde.caption := 'Mes:';
         lhasta.caption := 'Año:';
         cbdesde.ItemIndex := Monthof(today)-1;
         cbhasta.text := inttostr(Yearof(today));
         end;

     12: //Activaciones diarias anual
         begin
         Self.Caption := 'Activaciones por Año';
         self.Height := 192;
         tpdesde.Visible := false;
         tphasta.Visible := false;
         gbturno.Visible := false;
         rgtiempo.Visible := false;
         rgopciones.Visible := false;
         cbdesde.visible := true;
         cbhasta.visible := true;
         cbdesde.Enabled := false;
         ldesde.caption := 'Mes:';
         lhasta.caption := 'Año:';
         cbhasta.text := inttostr(Yearof(today));
         end;

     13: //Cuentas Inactivas Con Trafico
         begin
         Self.Caption := 'Cuentas Inactivas Con Trafico';
         self.Height := 192;
         tpdesde.Visible := true;
         tphasta.Visible := false;
         gbturno.Visible := false;
         rgtiempo.Visible := false;
         rgopciones.Visible := false;
         cbdesde.visible := false;
         cbhasta.visible := false;
         cbdesde.Enabled := false;
         ldesde.caption := 'Mes:';
         lhasta.caption := 'Año:';
         end;

   end;
end;

procedure TfrmRepCentral.btnimprimirClick(Sender: TObject);
begin
   case Rep of
      1: RepFindeturno(datetostr(tpdesde.Date),cbturno.Text,TipoImpresion);
      2: TiempoActivacion;
      3: AsistenciaAnual;
      4: CuentasSinSen;
      5: ActivacionesDiariasDetalle;
      6: CobroAccidentales;
      7: CuentasSinArmarDesarmar;
      8: ColoniasPorSector;
      9: OxxoPasswords;
     10: TiempoTrasladoPatrulleros;
     11: ActivacionesDiariasMensual;
     12: ActivacionesDiariasAnual;
     13: CuentasInactivasConTrafico
   end;
end;

procedure TfrmRepCentral.cbtipoimpresionSelect(Sender: TObject);
begin
   case cbTipoImpresion.itemindex of
      0: TipoImpresion :='IMP';
      1: TipoImpresion :='PDF';
      2: TipoImpresion :='PDFC';
   end;
end;

procedure TfrmRepCentral.TiempoActivacion;
  var tiempo :TTime; usuario,tipo, tim:string; t,i:integer;
begin
tiempo := strtotime('00:00:00');

querys('Drop table if exists tmpcenttiempo'+frmprincipal.idmaq, 1, sqlgeneral);
querys('create table tmpcenttiempo'+frmprincipal.idmaq+' select '+
      //'sk.idcliente as cuenta, sk.cliente as nomcliente, '+
      'min(fecha) as fi,max(hora) as ht, max(fecha) as ft,min(hora) as hi, '+
      ' sk.user, if(min(fecha) <> max(fecha), addtime(timediff("24:00:00", max(hora)), min(hora)), '+
      ' timediff(max(hora), min(hora))) as dif, "00:00:00" as suma, cast(0 as decimal) as prom,'+
      ' ac.status as tipo from sk_alarmas as sk left join alarmas_detalle as ad on ad.aid=sk.id '+
      ' left join alarmas_conclusion as ac on ac.id=sk.conclusion  where fecha_pc between "'+datetostr(tpdesde.date)+
      '" and  "'+datetostr(tphasta.date)+'"  and ad.did is not null and sk.user<>"" and ac.status="'+cbturno.text+'" '+
      'group by aid,tipo,user', 1, sqlgeneral);

querys('Alter table tmpcenttiempo'+frmprincipal.idmaq+' add mins double default 0.00',1,sqlgeneral);
i:=0;  t:=0;
querys('Select user,tipo, dif, hour(dif) as h, minute(dif) as m from tmpcenttiempo'+frmprincipal.idmaq+' order by user,tipo', 0, sqlgeneral);
sqlgeneral.first;
usuario := sqlgeneral.fieldbyname('user').AsString;
tipo:=sqlgeneral.fieldbyname('tipo').asstring;
while not sqlgeneral.Eof = true do
  begin
  if (usuario <> sqlgeneral.fieldbyname('user').AsString) or (tipo<>sqlgeneral.FieldByName('tipo').AsString) then
    begin
    querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set suma = "'+timetostr(tiempo)+'" , mins = '+inttostr(t)+' where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
    querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set prom =round(mins/'+inttostr(i)+', 2) where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
    i:=0;
    tiempo:= strtotime('00:00:00');
    t:=0
    end;
  tiempo := tiempo + strtotime(FormatDateTime('HH:nn:ss',strtotime(sqlgeneral.fieldbyname('dif').Asstring)));
  tim := timetostr(tiempo);
  t:= t+(sqlgeneral.fieldbyname('h').AsInteger*60)+sqlgeneral.fieldbyname('m').AsInteger;
  usuario := sqlgeneral.fieldbyname('user').AsString;
  tipo:=sqlgeneral.fieldbyname('tipo').asstring;
  inc(i);
  sqlgeneral.Next;
  end;
querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set suma = "'+timetostr(tiempo)+'", mins = '+inttostr(t)+'  where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
querys('Update tmpcenttiempo'+frmprincipal.idmaq+' set prom =round(mins/'+inttostr(i)+', 2) where user ="'+usuario+'" and tipo="'+tipo+'"', 1, dmreportes.sqlgeneral3);
querys('select count(ft) as total,t.*, "Del '+datetostr(tpdesde.date)+' al '+datetostr(tphasta.date)+'" as periodo, '+UsuarioNombre('u')+' as nombre from tmpcenttiempo'+frmprincipal.idmaq+' as t '+
      'left join usuarios as u on u.codigo=t.user group by nombre,tipo order by nombre,t.tipo', 0, dmreportes.sqlgeneral);

OperacionReporte('CentralPromAtn', 'Promedio de Atencion Centraleros: '+cbturno.text, TipoImpresion, 1);
querys('Drop table if exists tmpcenttiempo'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure TfrmRepCentral.AsistenciaAnual;
begin
  querys('Select "ASISTENCIA PATRULLEROS" as titulo,  '+cbturno.text+' as anio, idcliente, nombre, '+
         'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, '+
         'sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum( M10) as M10, sum(M11) as M11, sum(M12) as M12, '+
         'sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) + sum(M7) +sum(M8) + sum(M9) + sum(M10) + '+
         'sum(M11) + sum(M12) as total  from ( SELECT distinct c.idcliente, '+ClienteNombre('c')+' as nombre, '+
         'count(aid) as total, month(sk.fecha_pc) as mes, if(month(sk.fecha_pc) = 1, count(aid) , 0) as M1, '+
         'if(month(sk.fecha_pc) = 2, count(aid) , 0) as M2, if(month(sk.fecha_pc) = 3, count(aid) , 0) as M3, '+
         'if(month(sk.fecha_pc) = 4, count(aid) , 0) as M4, if(month(sk.fecha_pc) = 5, count(aid) , 0) as M5, '+
         'if(month(sk.fecha_pc) = 6, count(aid) , 0) as M6, if(month(sk.fecha_pc) = 7, count(aid) , 0) as M7, '+
         'if(month(sk.fecha_pc) = 8, count(aid) , 0) as M8, if(month(sk.fecha_pc) = 9, count(aid) , 0) as M9, '+
         'if(month(sk.fecha_pc) = 10, count(aid) , 0) as M10, if(month(sk.fecha_pc) = 11, count(aid) , 0) as M11, '+
         'if(month(sk.fecha_pc) = 12, count(aid) , 0) as M12 FROM tiempo_respuesta t INNER JOIN sk_alarmas sk ON '+
         't.aid =  sk.id Left join clientes c on c.idcliente=sk.idcliente WHERE year(sk.fecha_pc) = '+cbturno.text+
         ' group by idcliente, mes ) as t group by idcliente order by total desc', 0, dmreportes.sqlgeneral);

  OperacionReporte('ServiciosOxxosAnual', 'Asistencia Patrulleros Anual', TipoImpresion, 1);
end;

procedure TfrmRepCentral.CuentasSinSen;
var cadena:string;
begin
case rgopciones.ItemIndex of
  0: cadena := '';
  1: cadena := 'where tipo in ("RP", "0", "602")';
  end;

querys('Select "'+rgopciones.Items.Strings[rgopciones.itemindex]+'" as titulo, idcliente, '+ClienteNombre('c')+' as nombre, st_date as FechaAlta from clientes c '+
       'where estatus = 1 and idcliente < 10000 and idcliente not in (select distinct idcliente from alarmas '+
       cadena+')', 0, dmreportes.sqlgeneral);
OperacionReporte('CuentasSinSen', rgopciones.Items.Strings[rgopciones.itemindex], tipoImpresion, 1);
end;

procedure TfrmRepCentral.ActivacionesDiariasDetalle;
var cond:string;
begin
case rgopciones.ItemIndex of
  0: cond:= 'where (if(t.idturno=3, ((fecha_pc= "'+tpdesde.Text+'" and hora_pc > t.horainicio ) or '+
            '(fecha_pc= adddate("'+tpdesde.Text+'", interval 1 day) and  hora_pc < t.horafin)), fecha_pc = "'+
             tpdesde.Text+'" and sk.hora_pc between t.horainicio and t.horafin )) ';
  1: cond:= 'where fecha_pc = "'+tpdesde.Text+'" and sk.hora_pc between "'+tmdesde.Text+'" and "'+tmhasta.Text+'" ';
  end;

querys('Select sk.id, sk.idcliente, sk.cliente, sk.fecha_pc, sk.hora_pc, tr.tiempo, descripcion, sk.tipo, '+
       'sk.zona, ac.status, sk.user, cast((fecha_pc+hora_pc) as datetime) as r, ad.fecha, ad.hora, ad.detalle '+
       'from sk_alarmas sk join turnos t left join alarmas_conclusion ac on ac.id = sk.conclusion '+
       'left join tiempo_respuesta tr on tr.aid = sk.id left join alarmas_detalle ad on ad.aid=sk.id '+
       cond+' and ac.status <> "CONCLUIDA SISTEMA" and t.idturno=3 order by sk.id, ad.fecha, ad.hora', 0, dmreportes.sqlgeneral);

OperacionReporte('CentralActivPeriodo', 'CentralActivPeriodo', TipoImpresion, 1);
end;

procedure TfrmRepCentral.CobroAccidentales;
var tol, costo:string;
begin
tol := GetConfiguraciones('ToleranciaAccidentales', true);
costo := GetConfiguraciones('RecActAccidentales', true);
querys('select idcliente, cliente, "'+cbturno.Text+'" as alarma, "Del '+tpdesde.text+' al '+tphasta.text+'" as periodo, '+
       'COUNT(conclusion) as condicion,  (COUNT(conclusion)-'+tol+')*'+costo+' AS APAGAR from ( '+
       'SELECT distinct sk.idcliente,sk.cliente,conclusion, sk.fecha_pc FROM sk_alarmas sk '+
       'INNER JOIN alarmas_conclusion ac ON (ac.id=sk.conclusion) WHERE ac.status="'+cbturno.Text+'" and '+
       'sk.status=3 AND sk.fecha_pc BETWEEN "'+tpdesde.text+'" AND "'+tphasta.text+'") as t GROUP BY idcliente '+
       'HAVING CONDICION > '+tol+' order by condicion desc', 0, dmreportes.sqlgeneral);

OperacionReporte('CentralCobroAcc', 'Cobro de Activaciones Accidentales', TipoImpresion, 1);
       
end;

procedure TfrmRepCentral.CuentasSinArmarDesarmar;
var oc, tipo:string;
begin
if rgopciones.ItemIndex = 1 then
  begin
  oc := '"4", "CL", "400"';
  tipo := 'CUENTAS SIN ARMAR';
  end
else
  begin
  oc := '"5", "OP", "400"';
  tipo := 'CUENTAS SIN DESARMAR';
  end;

querys('Select "'+tipo+'" as tipo, c.idcliente, '+ClienteNombre('c')+' as nombre, t.telefono '+
       'from clientes c left join telefonos t on t.idtel = c.idtel '+
       'where c.idopenclose = 1 and c.idcliente not in('+
       'Select idcliente from alarmas where fecha_pc ="'+tpdesde.Text+'" and tipo in ('+oc+')) '+
       'and c.estatus = 1 and c.bloqueado = 0 group by c.idcliente', 0, dmreportes.sqlgeneral);
 operacionreporte('CuentasSinArmarDesarmar','', Tipoimpresion,1);
end;

procedure TfrmRepCentral.ColoniasPorSector;
begin
querys('Select cs.idsector, col.idcol, col.nombre as colonia, col.cp from colonias col left join col_sector cs on '+
       'cs.idcol=col.idcol where idsector = "'+cbturno.Text+'" order by cp, nombre', 0, dmreportes.sqlgeneral);
 operacionreporte('ColoniasPorSector','', Tipoimpresion,1);
end;

procedure TfrmRepCentral.OxxoPasswords;
begin
querys('Select idcliente, '+ClienteNombre('c')+' as rsocial, password from clientes c where '+ClienteNombre('c')+' like "%oxxo%" and estatus=1', 0, dmreportes.sqlgeneral);
OperacionReporte('OxxoPasswords','', TipoImpresion,1);
end;

procedure TfrmRepCentral.TiempoTrasladoPatrulleros;
begin
querys('Select distinct sk.id, sk.idcliente, sk.fecha_pc, cs.idsector, col.nombre as colonia, tr.CodPatrullero, '+
       'tr.nombre as patrullero, tr.hora, tr.hora_llegada, tr.tiempo from sk_alarmas sk '+
       'inner join tiempo_respuesta tr on tr.aid=sk.id left join clientes c on c.idcliente=sk.idcliente '+
       'left join colonias col on col.idcol=c.idcol left join col_sector cs on cs.idcol=col.idcol '+
       'where sk.fecha_pc = "'+tpdesde.Text+'" order by CodPatrullero, id ', 0, dmreportes.sqlgeneral);

querys('Select distinct sk.id, sk.idcliente, sk.fecha_pc, cs.idsector, col.nombre as colonia, '+
       'tr.CodPatrullero, tr.nombre as patrullero, tr.hora, tr.hora_llegada, tr.tiempo '+
       'from sk_alarmas sk inner join tiempo_respuesta tr on tr.aid=sk.id '+
       'left join clientes c on c.idcliente=sk.idcliente left join colonias col on col.idcol=c.idcol '+
       'left join col_sector cs on cs.idcol=col.idcol left join usuarios u on u.codigo=tr.CodPatrullero '+
       'left join turnos t on t.idturno=u.idturno '+
       'where sk.fecha_pc = "'+tpdesde.Text+'" and t.idturno in (1,2) '+
       ' UNION '+
       'Select distinct sk.id, sk.idcliente, sk.fecha_pc, cs.idsector, col.nombre as colonia, '+
       'tr.CodPatrullero, tr.nombre as patrullero, tr.hora, tr.hora_llegada, tr.tiempo '+
       'from sk_alarmas sk inner join tiempo_respuesta tr on tr.aid=sk.id '+
       'left join clientes c on c.idcliente=sk.idcliente left join colonias col on col.idcol=c.idcol '+
       'left join col_sector cs on cs.idcol=col.idcol left join usuarios u on u.codigo=tr.CodPatrullero '+
       'left join turnos t on t.idturno=u.idturno '+
       'where ((sk.fecha_pc = "'+tpdesde.Text+'" and tr.hora >= t.HoraInicio) or '+
       '(sk.fecha_pc = ADDDATE("'+tpdesde.Text+'" ,interval 1 day) and tr.hora <= t.HoraFin) ) '+
       'and t.idturno = 3 '+
       'order by CodPatrullero, id', 0, dmreportes.sqlgeneral);
OperacionReporte('CentralTiempoTraslado','', TipoImpresion,1);
end;

procedure TfrmRepCentral.ActivacionesDiariasMensual;
var f1, f2, d, m:string; dd, mm:integer;
begin
f1 := cbhasta.Text + '/' + inttostr(cbdesde.itemindex+1) + '/01';
dd := DaysInMonth(strtodate(f1));
if dd < 10 then
   d := '0' + inttostr(dd)
else
   d := inttostr(dd);

mm := MonthOf(strtodate(f1));
if mm < 10 then
   m := '0' + inttostr(mm)
else
   m := inttostr(mm);


f2 := cbhasta.Text + '/' + m + '/' + d;

querys('SELECT "Periodo '+cbdesde.text+' - '+cbhasta.text+'" as titulo, '+
       'concepto, turno, nombreturno, sum(D1) + sum(D2) + sum(D3) + sum(D4) + sum(D5) + '+
       'sum(D6) + sum(D7) + sum(D8) + sum(D9) + sum(D10) + '+
       'sum(D11) + sum(D12) + sum(D13) + sum(D14) + sum(D15) + '+
       'sum(D16) + sum(D17) + sum(D18) + sum(D19) + sum(D20) + '+
       'sum(D21) + sum(D22) + sum(D23) + sum(D24) + sum(D25) + '+
       'sum(D26) + sum(D27) + sum(D28) + sum(D29) + sum(D30) + '+
       'sum(D31) as total, '+
       'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
       'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
       'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
       'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
       'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
       'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
       'sum(D31) as D31 from ( '+
       'Select ac.status as concepto, t.turno, t.NombreTurno, '+
       'if(t.dia=1, t.tot, 0)  as D1, if(t.dia=2, t.tot, 0)  as D2, if(t.dia=3, t.tot, 0)  as D3, if(t.dia=4, t.tot, 0)  as D4, if(t.dia=5, t.tot, 0)  as D5, '+
       'if(t.dia=6, t.tot, 0)  as D6, if(t.dia=7, t.tot, 0)  as D7, if(t.dia=8, t.tot, 0)  as D8, if(t.dia=9, t.tot, 0)  as D9, if(t.dia=10, t.tot, 0)  as D10, '+
       'if(t.dia=11, t.tot, 0)  as D11, if(t.dia=12, t.tot, 0)  as D12, if(t.dia=13, t.tot, 0)  as D13, if(t.dia=14, t.tot, 0)  as D14, if(t.dia=15, t.tot, 0)  as D15, '+
       'if(t.dia=16, t.tot, 0)  as D16, if(t.dia=17, t.tot, 0)  as D17, if(t.dia=18, t.tot, 0)  as D18, if(t.dia=19, t.tot, 0)  as D19, if(t.dia=20, t.tot, 0)  as D20, '+
       'if(t.dia=21, t.tot, 0)  as D21, if(t.dia=22, t.tot, 0)  as D22, if(t.dia=23, t.tot, 0)  as D23, if(t.dia=24, t.tot, 0)  as D24, if(t.dia=25, t.tot, 0)  as D25, '+
       'if(t.dia=26, t.tot, 0)  as D26, if(t.dia=27, t.tot, 0)  as D27, if(t.dia=28, t.tot, 0)  as D28, if(t.dia=29, t.tot, 0)  as D29, if(t.dia=30, t.tot, 0)  as D30, '+
       'if(t.dia=31, t.tot, 0)  as D31 from ( '+
       'select count(id) as tot, dia, nombreturno, idturno as turno, conclusion from ( '+

       'Select distinct sk.id, day(fecha_pc) as dia, t.idturno, sk.conclusion, left(t.nombre, 3) as NombreTurno '+
       'from sk_alarmas sk join turnos t '+
       'where fecha_pc BETWEEN "'+f1+'" AND "'+f2+'" and sk.conclusion not in(0,5,6,7,8,10) '+
       'and if(idturno<>3, hora_pc between t.horainicio and t.horafin, (hora_pc >= t.horainicio )  '+
       'and t.idturno = 3) '+
       'union ALL '+
       'Select distinct sk.id,  day(adddate(fecha_pc, -1)) as dia, t.idturno, sk.conclusion, left(t.nombre, 3) as NombreTurno '+
       'from sk_alarmas sk join turnos t '+
       'where fecha_pc BETWEEN adddate("'+f1+'",1) AND adddate("'+f2+'",1) and sk.conclusion not in(0,5,6,7,8,10) '+
       'and  ( hora_pc <= t.horafin) and t.idturno = 3'+

       ') as t group by dia, turno, conclusion ) as t '+
       'left join alarmas_conclusion ac on (ac.id = t.conclusion) ) as ta group by concepto, turno order by turno, concepto', 0, dmreportes.sqlgeneral);

OperacionReporte('ActivacionesDiariasMensual','Activaciones Diarias Mensual', TipoImpresion,1);      
end;

procedure TfrmRepCentral.ActivacionesDiariasAnual;
var f1, f2:string;
begin
f1 := cbhasta.Text + '/01/01';
f2 := cbhasta.Text + '/12/31';

querys('SELECT  "Año: '+cbhasta.text+'" as titulo, '+
       'concepto, turno, nombreturno, sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + '+
       'sum(M6) + sum(M7) + sum(M8) + sum(M9) + sum(M10) + sum(M11) + sum(M12)  as total, '+
       'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, '+
       'sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12 '+
       'from ( Select ac.status as concepto, t.turno, t.NombreTurno, sum(t.tot) as total, '+
       'if(mes = 1, t.tot, 0) as M1, if(mes = 2, t.tot, 0) as M2, if(mes = 3, t.tot, 0) as M3, if(mes = 4, t.tot, 0) as M4, '+
       'if(mes = 5, t.tot, 0) as M5, if(mes = 6, t.tot, 0) as M6, if(mes = 7, t.tot, 0) as M7, if(mes = 8, t.tot, 0) as M8, '+
       'if(mes= 9, t.tot, 0) as M9, if(mes= 10, t.tot, 0) as M10, if(mes = 11, t.tot, 0) as M11, if(mes = 10, t.tot, 0) as M12 '+
       'from ( select count(id) as tot, mes, nombreturno, idturno as turno, conclusion from ( '+

       'Select distinct sk.id, month(fecha_pc) as mes, t.idturno, sk.conclusion, left(t.nombre, 3) as NombreTurno '+
       'from sk_alarmas sk join turnos t '+
       'where fecha_pc BETWEEN "'+f1+'" AND "'+f2+'" and sk.conclusion not in(0,5,6,7,8,10) '+
       'and if(idturno<>3, hora_pc between t.horainicio and t.horafin, (hora_pc >= t.horainicio )  '+
       'and t.idturno = 3) '+
       'union ALL '+
       'Select distinct sk.id,  month(adddate(fecha_pc, -1)) as mes, t.idturno, sk.conclusion, left(t.nombre, 3) as NombreTurno '+
       'from sk_alarmas sk join turnos t '+
       'where fecha_pc BETWEEN adddate("'+f1+'",1) AND adddate("'+f2+'",1) and sk.conclusion not in(0,5,6,7,8,10) '+
       'and  ( hora_pc <= t.horafin) and t.idturno = 3'+

       ') as t group by mes, turno, conclusion ) as t '+
       'left join alarmas_conclusion ac on (ac.id = t.conclusion) group by turno, mes, concepto ) as ta '+
       'group by concepto, turno order by turno, concepto ', 0, dmreportes.sqlgeneral);
OperacionReporte('ActivacionesDiariasAnual','Activaciones Diarias Anual', TipoImpresion,1);
end;

procedure TfrmRepCentral.CuentasInactivasConTrafico;
begin
querys('SELECT c.idcliente, '+ClienteNombre('c')+'as nombre, max(a.fecha_pc) as fecha_pc, c.FechaCancelacion, c.st_date, c.TipoCont '+
       'from clientes c left join alarmas a on a.idcliente=c.idcliente '+
       'where c.estatus <> 1 '+
       'and fecha_pc > "'+tpdesde.text+'" and (fecha_pc > c.FechaCancelacion or FechaCancelacion is NULL) '+
       'group by idcliente order by fecha_pc asc', 0, dmreportes.sqlgeneral);
OperacionReporte('CuentasInactivasConTrafico','Cuentas Inactivas Con Trafico', TipoImpresion,1);
end;

End.

