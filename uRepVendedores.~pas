{///////////////////////////////////////////////////////////////////////////////
2012/07/23 dalyla Reporte de metas inicio
2009/03/12--04/02 dalyla reporte de prospecciones
2008/07/24 dalyla Reportes de log sync
}///////////////////////////////////////////////////////////////////////////////
unit uRepVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, StdCtrls, Mask, RzBtnEdt, RzLabel, ExtCtrls, RzPanel,
  RzButton, RzCmboBx, DateUtils, StrUtils, DB, MemDS, DBAccess, MyAccess;

type
  TfrmrepVendedores = class(TForm)
    cbTipoImpresion: TRzComboBox;
    btnImprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    rgrango: TRzGroupBox;
    ldesde: TRzLabel;
    lhasta: TRzLabel;
    cbdesde: TRzComboBox;
    cbhasta: TRzComboBox;
    edhasta: TRzButtonEdit;
    eddesde: TRzButtonEdit;
    rgPeriodo: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    tpdesde: TRzDateTimeEdit;
    tphasta: TRzDateTimeEdit;
    rgrango2: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    cbrango1: TRzComboBox;
    cbrango2: TRzComboBox;
    btngenerar: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure btngenerarClick(Sender: TObject);
  private
    TipoImpresion:String;
    procedure LogSincronizar;
    procedure Prospecciones;
    procedure TendenciaProspectadores;
    procedure MetasVendedores(generar:boolean);
    procedure MetasVendedoresAnual;

    function GetMeta(concepto:string):string;
    { Private declarations }
  public
    Reporte:Integer;
    procedure inicializa;
    { Public declarations }
  end;

var
  frmrepVendedores: TfrmrepVendedores;

implementation

uses Urecursos, Udmrep, Uprincipal, Ubusquedas, Udm;

{$R *.dfm}

procedure TfrmrepVendedores.inicializa;
var i : integer;
begin
Tipoimpresion := 'IMP';
tpDesde.Date := StrToDate(FormatDateTime('yyyy""/""mm',Now)+'/01');
tpHasta.Date := Today;
case Reporte of
   1: begin
      Self.caption := 'Log de sincronizacion';
      Self.Height := 215;
      Self.Width := 385;
      rgrango.Caption := ' Usuario ';
      edhasta.Enabled := false;
      rgperiodo.Visible := true;
      if AnsiContainsStr(frmprincipal.PuestoUsuario, 'VENDEDOR') then
        begin
        eddesde.text := inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
        eddesde.Enabled := false;
        end;
      end;
   2: begin
      Self.caption := 'Prospecciones';
      Self.Height := 300;
      Self.Width := 385;
      rgrango.Caption := ' Codigo ';
      rgperiodo.Visible := true;
      rgrango2.Visible := true;
      CargaCombo2('select idestatus, nombre from estatus_eventos order by idestatus', 'nombre', 'idestatus', cbrango1);
      cbrango1.ItemIndex := 0;
      CargaCombo2('select idestatus, nombre from estatus_eventos order by idestatus', 'nombre', 'idestatus', cbrango2);
      cbrango2.ItemIndex := cbrango2.Items.Count-1;
      if AnsiContainsStr(frmprincipal.PuestoUsuario, 'PROSPECTADOR') then
        begin
        edhasta.Enabled := false;
        eddesde.text := inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
        eddesde.Enabled := false;
        end;
      end;

   3: begin
      Self.caption := 'Tendencia de Prospectadores';
      Self.Height := 180;
      Self.Width := 385;
      rgperiodo.Top := 8;
      rgrango.Visible := false;
      end;

   4: begin
      Self.caption := 'Reporte de Metas Vendedor';
      Self.Height := 230;
      Self.Width := 385;
      rgperiodo.Top := 8;
      rgrango.Visible := false;
      btngenerar.Visible := true;
      end;

   5: begin
      Self.caption := 'Reporte de Metas Vendedor Anual';
      Self.Height := 230;
      Self.Width := 385;
      rgrango.Visible := true;
      rgrango.Caption := ' Año ';
      eddesde.Visible := false;
      edhasta.Visible := false;
      cbdesde.Visible := true;
      btngenerar.Visible := false;

      cbdesde.Clear;
      for i :=2000  to 2030 do
      begin
        cbdesde.Items.Add(inttostr(i));
      end;

      end;

   end;
end;

procedure TfrmrepVendedores.btnImprimirClick(Sender: TObject);
begin
case Reporte of
   1: LogSincronizar;
   2: Prospecciones;
   3: TendenciaProspectadores;
   4: MetasVendedores(false);
   5: MetasVendedoresAnual;
   end;
end;

procedure TfrmrepVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmrepVendedores.cbTipoImpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmrepVendedores.btncerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmrepVendedores.LogSincronizar;
begin
querys('SELECT l.* , '+Usuarionombre('u')+' as nombre, "'+tpdesde.Text+' a '+tphasta.Text+'" as periodo FROM LogSincronizacion l '+
       'Left join usuarios u on u.idusuario=l.idvendedor WHERE idvendedor = "'+eddesde.text+'" and '+
       'l.fecha between "'+tpdesde.Text+'" and "'+tphasta.Text+'"', 0, dmreportes.sqlgeneral);
OperacionReporte('LosSync', 'Log de sincronizacion de '+eddesde.text, TipoImpresion, 1);
end;

procedure TfrmrepVendedores.eddesdeButtonClick(Sender: TObject);
begin
case Reporte of
  1: begin
     with frmbusquedas do
       begin
       query:='select idusuario, '+Usuarionombre('u')+' as nombre from usuarios order by idusuario';
       campo_busqueda:='nombre';
       campo_retorno:='idusuario';
       tabla:='';
       tblorigen := 'usuarios';
       ShowModal;
       if resultado <> '' then
         eddesde.text := resultado;
       end;
     end;
  end;
end;

procedure TfrmrepVendedores.Prospecciones;
var desde, hasta, condicion, estatus, r1,r2:string;
begin
with dmreportes do
  begin
  if eddesde.Text <> '' then
    if querys('Select idusuario from usuarios where codigo= "'+eddesde.text+'"', 0, sqlgeneral8) > 0 then
      desde := sqlgeneral8.fieldbyname('idusuario').asstring
    else
      begin
      application.MessageBox('Codigo de usuario no existe', 'Atencion', MB_ICONINFORMATION);
      eddesde.SetFocus;
      exit;
      end;

  if edhasta.Text <> '' then
    if querys('Select idusuario from usuarios where codigo= "'+edhasta.text+'"', 0, sqlgeneral8) > 0 then
      hasta := sqlgeneral8.fieldbyname('idusuario').asstring
    else
      begin
      application.MessageBox('Codigo de usuario no existe', 'Atencion', MB_ICONINFORMATION);
      edhasta.SetFocus;
      exit;
      end;

  if edhasta.text = '' then
    hasta := desde;

  if eddesde.text = '' then
    condicion := ''
  else
    begin
    if strtoint(desde) > strtoint(hasta) then
      condicion := 'AND un.idusuario between '+hasta+' and '+desde+' '
    else
      condicion := 'AND un.idusuario between '+desde+' and '+hasta+' ';
    end;

  querys('select idestatus, nombre from estatus_eventos order by idestatus', 0, sqlgeneral);
  sqlgeneral.Locate('nombre', cbrango1.Text, []);
  r1 := sqlgeneral.fieldbyname('idestatus').AsString;
  sqlgeneral.Locate('nombre', cbrango2.Text, []);
  r2 := sqlgeneral.fieldbyname('idestatus').AsString;

  estatus := ' and ev.idestatus between "'+r1+'" and "'+r2+'" ';

  querys('SELECT op.idoportunidad, op.cuenta, '+ClienteNombre('op')+' as nomOport, sag.fecha_creacion, '+
         'tel.telefono,tip.nombre as TipoOportunidad, ev.nombre as estatus, un.codigo, '+UsuarioNombre('un')+
         ' as nombre_ven, "Del '+tpdesde.Text+' al  '+tphasta.Text+'" as periodo FROM agenda_vendedores as sag '+
         'INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad LEFT JOIN actividades_vendedores '+
         'as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = un.codigo) LEFT JOIN '+
         'telefonos as tel ON (tel.idtel = op.idtel) LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) '+
         'LEFT JOIN tipo_oportunidad as tip ON (tip.idtipo_oportunidad=sag.idtipo_oportunidad) LEFT JOIN puestos '+
         'p on p.idpuesto=un.idpuesto WHERE sag.fecha_creacion between "'+tpdesde.Text+'"  and "'+tphasta.Text+'" '+
         'and un.estatus = 1 and p.nombre like "%PROSPECTADOR%" '+condicion+estatus+' GROUP BY sag.idevento '+
         'ORDER BY un.codigo,sag.fecha_creacion,sag.hora_creacion ASC', 0, sqlgeneral);

 { querys('select codigo, count(idoportunidad) as prospectos, sum(cierres) as cierres, sum(visitas) as visitas, '+
         'round(sum(visitas)/ count(idoportunidad),2)*100  as pvis, round(sum(cierres)/sum(visitas),2)*100 as pcierres '+
         'from ( SELECT op.idoportunidad, op.cuenta,  ev.nombre as estatus, if(ev.nombre="CERRADA", 1 , 0) as '+
         'cierres, if(ta.nombre="VISITA", 1, 0) as visitas, un.codigo FROM agenda_vendedores as sag '+
         'INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad LEFT JOIN actividades_vendedores '+
         'as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = un.codigo) LEFT JOIN '+
         'estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN puestos p on p.idpuesto=un.idpuesto LEFT '+
         'JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad WHERE sag.fecha_creacion '+
         'between "'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 and p.nombre like "%PROSPECTADOR%" '+
         ''+condicion+estatus+' GROUP BY sag.idevento ORDER BY un.codigo,sag.fecha_creacion,sag.hora_creacion ASC ) as p '+
         'group by p.codigo', 0, sqlgeneral2);}

  querys('select codigo, sum(pros) as prospectos, sum(cierres) as cierres, sum(visitas) as visitas, '+
          'round(sum(visitas)/ count(idoportunidad),2)*100  as pvis, round(sum(cierres)/sum(visitas),2)*100 as pcierres from ( '+
          'SELECT op.idoportunidad, op.cuenta,  ev.nombre as estatus,1 as pros, 0 as cierres,  0 as visitas, un.codigo '+
          'FROM agenda_vendedores as sag INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad LEFT JOIN '+
          'actividades_vendedores as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = un.codigo) '+
          'LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN puestos p on p.idpuesto=un.idpuesto '+
          'LEFT JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad WHERE sag.fecha_creacion between '+
          '"'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 and p.nombre like "%PROSPECTADOR%" '+
          condicion+estatus+' GROUP BY sag.idevento union '+
          'SELECT op.idoportunidad, op.cuenta,  ev.nombre as estatus,0 as pros, if(ev.nombre="CERRADA", 1 , 0) as cierres, '+
          '0 as visitas, un.codigo FROM agenda_vendedores as sag INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad'+
          ' LEFT JOIN actividades_vendedores as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = un.codigo) '+
          'LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN puestos p on p.idpuesto=un.idpuesto '+
          'LEFT JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad WHERE sag.fecha_cierre between '+
          '"'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 and p.nombre like "%PROSPECTADOR%" '+
          condicion+estatus+' GROUP BY sag.idevento union '+
          'SELECT op.idoportunidad, op.cuenta,  ev.nombre as estatus,0 as pros, 0 as cierres, 1 as visitas, un.codigo '+
          'FROM agenda_vendedores as sag INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad LEFT JOIN '+
          'actividades_vendedores as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = un.codigo) '+
          'LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN puestos p on p.idpuesto=un.idpuesto '+
          'LEFT JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad WHERE ac.fecha between '+
          '"'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 and p.nombre like "%PROSPECTADOR%" and '+
          'ta.nombre = "VISITA" '+condicion+estatus+' GROUP BY sag.idevento  ) as p group by p.codigo', 0, sqlgeneral2);
  OperacionReporte('ContactosProspectadores','Contactos por Prospectadores',TipoImpresion,1);
  end;
end;

procedure TfrmrepVendedores.TendenciaProspectadores;
var dhab, dtrans:string;
begin
dhab :=  inttostr(DiasHabiles(tpdesde.Date, tphasta.Date));
if tphasta.date < date then
  dtrans := dhab
else
  dtrans := inttostr(DiasHabiles(tpdesde.Date, Date));

     
querys('Select "De '+tpdesde.Text+' a '+tphasta.Text+'" as periodo, p.codigo, nombre, count(idoportunidad) as '+
       'prospectos, ifnull(c.cierres,0) as cierres, ifnull(v.visitas,0) as visitas, round(ifnull(v.visitas,0) / '+
       'count(idoportunidad),2)*100  as pvis, round(ifnull(c.cierres,0)/ifnull(v.visitas,0) ,2)*100 as pcierres, '+
       'round(count(idoportunidad)/'+dhab+',2) as promedio, round(count(idoportunidad)/'+dhab+'*'+dtrans+',2) as tendencia, '+
       'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, sum(D6) as D6, sum(D7) as D7, '+
       'sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, '+
       'sum(D14) as D14, sum(D15) as D15, sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, '+
       'sum(D20) as D20, sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
       'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, sum(D31) as D31 from ( '+
       'SELECT op.idoportunidad, op.cuenta,  ev.nombre as estatus, day(Fecha_Creacion) as dia, 0 as cierres, '+
       '0 as visitas, un.codigo, '+UsuarioNombre('un')+' as nombre, if(day(Fecha_Creacion)=1, 1,0) as D1, '+
       'if(day(Fecha_Creacion)=2, 1,0) as D2, if(day(Fecha_Creacion)=3, 1,0) as D3, if(day(Fecha_Creacion)=4, 1,0) as D4, '+
       'if(day(Fecha_Creacion)=5, 1,0) as D5, if(day(Fecha_Creacion)=6, 1,0) as D6, if(day(Fecha_Creacion)=7, 1,0) as D7, '+
       'if(day(Fecha_Creacion)=8, 1,0) as D8, if(day(Fecha_Creacion)=9, 1,0) as D9, if(day(Fecha_Creacion)=10, 1,0) as D10, '+
       'if(day(Fecha_Creacion)=11, 1,0) as D11, if(day(Fecha_Creacion)=12, 1,0) as D12, if(day(Fecha_Creacion)=13, 1,0) as D13, '+
       'if(day(Fecha_Creacion)=14, 1,0) as D14, if(day(Fecha_Creacion)=15, 1,0) as D15, if(day(Fecha_Creacion)=16, 1,0) as D16, '+
       'if(day(Fecha_Creacion)=17, 1,0) as D17, if(day(Fecha_Creacion)=18, 1,0) as D18, if(day(Fecha_Creacion)=19, 1,0) as D19, '+
       'if(day(Fecha_Creacion)=20, 1,0) as D20, if(day(Fecha_Creacion)=21, 1,0) as D21, if(day(Fecha_Creacion)=22, 1,0) as D22, '+
       'if(day(Fecha_Creacion)=23, 1,0) as D23, if(day(Fecha_Creacion)=24, 1,0) as D24, if(day(Fecha_Creacion)=25, 1,0) as D25, '+
       'if(day(Fecha_Creacion)=26, 1,0) as D26, if(day(Fecha_Creacion)=27, 1,0) as D27, if(day(Fecha_Creacion)=28, 1,0) as D28, '+
       'if(day(Fecha_Creacion)=29, 1,0) as D29, if(day(Fecha_Creacion)=30, 1,0) as D30, if(day(Fecha_Creacion)=31, 1,0) as D31 '+
       'FROM agenda_vendedores as sag INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad LEFT JOIN '+
       'actividades_vendedores as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = un.codigo) '+
       'LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN puestos p on p.idpuesto=un.idpuesto '+
       'LEFT JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad WHERE sag.fecha_creacion '+
       'between "'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 and p.nombre like "%PROSPECTADOR%" GROUP BY '+
       'sag.idevento ORDER BY un.codigo,sag.fecha_creacion,sag.hora_creacion ASC ) as p '+
       'left join ( select count(visitas) as visitas, codigo from ( SELECT op.idoportunidad as visitas, un.codigo '+
       'FROM agenda_vendedores as sag INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad '+
       'LEFT JOIN actividades_vendedores as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON (op.codalta = '+
       'un.codigo) LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN puestos p on p.idpuesto='+
       'un.idpuesto LEFT JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad WHERE ac.fecha '+
       'between "'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 and p.nombre like "%PROSPECTADOR%" '+
       'and ta.nombre = "VISITA" GROUP BY sag.idevento ) as t group by codigo ) as v on v.codigo=p.codigo '+
       'left join ( select sum(cierres) as cierres, codigo from ( SELECT if(ev.nombre="CERRADA", 1 , 0) as cierres, '+
       'un.codigo FROM agenda_vendedores as sag INNER JOIN oportunidades as op ON sag.idoportunidad=op.idoportunidad '+
       'LEFT JOIN actividades_vendedores as ac ON (sag.idevento = ac.idevento) LEFT JOIN usuarios as un ON '+
       '(op.codalta = un.codigo) LEFT JOIN estatus_eventos ev ON (ev.idestatus=sag.idestatus) LEFT JOIN '+
       'puestos p on p.idpuesto=un.idpuesto LEFT JOIN tipos_actividades ta on ta.idtipo_actividad=ac.idtipo_actividad '+
       'WHERE sag.fecha_cierre between "'+tpdesde.Text+'"  and "'+tphasta.Text+'" and un.estatus=1 '+
       'and p.nombre like "%PROSPECTADOR%" GROUP BY sag.idevento ) as t group by codigo ) as c on c.codigo = p.codigo '+
       'group by p.codigo ', 0, dmreportes.sqlgeneral);
OperacionReporte('TendenciaProspectadores','Tendencia por Prospectadores',TipoImpresion,1);
end;

function TfrmrepVendedores.GetMeta(concepto:string):string;
var sqlgeneral:tMyQuery;
begin
sqlgeneral := TMyQuery.Create(nil);
sqlgeneral.Connection := DMAccesos.conexion;

querys('select estandar as valor from Estandares where descripcion = "'+concepto+'"',0, sqlgeneral );
result := sqlgeneral.fieldbyname('valor').AsString;
end;

procedure TfrmrepVendedores.btngenerarClick(Sender: TObject);
begin
case Reporte of
{   1: LogSincronizar;
   2: Prospecciones;
   3: TendenciaProspectadores;}
   4: MetasVendedores(true);
   end;
end;


procedure TfrmrepVendedores.MetasVendedores(generar:boolean);
var diasmes : string;
begin

diasmes := inttostr(DaysInMonth(strtodate(tphasta.Text)));

if (yearof(strtodate(tpdesde.Text)) <> yearof(strtodate(tphasta.Text))) or
    (MonthOf(strtodate(tpdesde.Text)) <> MonthOf(StrToDate(tphasta.Text))) then
  begin
  application.MessageBox('Las fechas deben pertenecer al mismo mes', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

with dmreportes do
  begin
  if generar then
    begin
    querys('Delete from repvendvolanteo where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 1, sqlgeneral);
    querys('Delete from repvendcontactos where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 1, sqlgeneral);
    querys('Delete from repvendprospectos where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 1, sqlgeneral);
    querys('Delete from repvenddolares where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 1, sqlgeneral);
    querys('Delete from repvendcuentas where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 1, sqlgeneral);
    querys('Delete from repvendfuentes where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 1, sqlgeneral);

    //  #CONTROL DE VOLANTES (personas que se les entreo volante en mano) 25 dias habiles 30 diarios
    querys('Insert into repvendvolanteo (idvendedor, mes, anio, dif, tend, acum, '+
           'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
           'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
           'usuario, fecha, hora )'+
           'select '+
           //'"De '+tpdesde.Text+' a '+tphasta.Text+'" as periodo, '+
           'idvendedor, '+
           //'codigo, nombre, fechavolanteo, '+
           'MesNombre(month(fechavolanteo)) as mes, '+
           'year(fechavolanteo) as anio, '+GetMeta('MetaVolanteo')+'-sum(cantidad) as dif, '+
           'floor((sum(cantidad)/day("'+tphasta.Text+'"))*'+diasmes+') as tend, sum(cantidad) as acum, '+
           'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
           'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
           'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
           'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
           'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
           'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
           'sum(D31) as D31, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, curdate(), curtime() from ( '+
           'select u.codigo, u.nombre, v.fechavolanteo, v.cantidad, v.idvendedor, day(v.fechavolanteo) as dia, '+
           'if(day(v.fechavolanteo) = 1, v.cantidad, 0) as D1, if(day(v.fechavolanteo) = 2, v.cantidad, 0) as D2, '+
           'if(day(v.fechavolanteo) = 3, v.cantidad, 0) as D3, if(day(v.fechavolanteo) = 4, v.cantidad, 0) as D4, '+
           'if(day(v.fechavolanteo) = 5, v.cantidad, 0) as D5, if(day(v.fechavolanteo) = 6, v.cantidad, 0) as D6,'+
           'if(day(v.fechavolanteo) = 7, v.cantidad, 0) as D7, if(day(v.fechavolanteo) = 8, v.cantidad, 0) as D8, '+
           'if(day(v.fechavolanteo) = 9, v.cantidad, 0) as D9, if(day(v.fechavolanteo) = 10, v.cantidad, 0) as D10, '+
           'if(day(v.fechavolanteo) = 11, v.cantidad, 0) as D11, if(day(v.fechavolanteo) = 12, v.cantidad, 0) as D12, '+
           'if(day(v.fechavolanteo) = 13, v.cantidad, 0) as D13, if(day(v.fechavolanteo) = 14, v.cantidad, 0) as D14, '+
           'if(day(v.fechavolanteo) = 15, v.cantidad, 0) as D15, if(day(v.fechavolanteo) = 16, v.cantidad, 0) as D16, '+
           'if(day(v.fechavolanteo) = 17, v.cantidad, 0) as D17, if(day(v.fechavolanteo) = 18, v.cantidad, 0) as D18, '+
           'if(day(v.fechavolanteo) = 19, v.cantidad, 0) as D19, if(day(v.fechavolanteo) = 20, v.cantidad, 0) as D20, '+
           'if(day(v.fechavolanteo) = 21, v.cantidad, 0) as D21, if(day(v.fechavolanteo) = 22, v.cantidad, 0) as D22, '+
           'if(day(v.fechavolanteo) = 23, v.cantidad, 0) as D23, if(day(v.fechavolanteo) = 24, v.cantidad, 0) as D24, '+
           'if(day(v.fechavolanteo) = 25, v.cantidad, 0) as D25, if(day(v.fechavolanteo) = 26, v.cantidad, 0) as D26, '+
           'if(day(v.fechavolanteo) = 27, v.cantidad, 0) as D27, if(day(v.fechavolanteo) = 28, v.cantidad, 0) as D28, '+
           'if(day(v.fechavolanteo) = 29, v.cantidad, 0) as D29, if(day(v.fechavolanteo) = 30, v.cantidad, 0) as D30, '+
           'if(day(v.fechavolanteo) = 31, v.cantidad, 0) as D31 '+
           'from volanteos v left join usuarios u on u.idusuario=v.idvendedor '+
           'where v.fechavolanteo between "'+tpdesde.Text+'" and "'+tphasta.Text+'" ) as t group by idvendedor', 1, sqlgeneral);

    //CONTROL DE CONTACTOS (PERSONAS A LAS QUE SE LES DEJO EL VOLANTE Y NOS DIERON SU NOMBRE, TELEFONO, DIRECCION) 500 MENSUALES 20 DIARIOS
    querys('Insert into repvendcontactos (idvendedor, mes, anio, dif, tend, acum, '+
           'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
           'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
           'usuario, fecha, hora )'+
           'select idvendedor, '+
           //'codigo, '+UsuarioNombre('u')+' as nombre, '+
           'MesNombre(month(fecha_creacion)) as mes, year(fecha_creacion) as anio, '+
           ''+GetMeta('MetaContactos')+'-sum(cantidad) as dif, floor((sum(cantidad)/day("'+tphasta.Text+'"))*'+diasmes+') as tend, sum(cantidad) as acum, '+
           'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
           'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
           'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
           'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
           'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
           'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
           'sum(D31) as D31, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, curdate(), curtime() from ( '+
           'SELECT a.fecha_creacion, a.idvendedor, op.idoportunidad, o.nombre as origen, 1 as cantidad, '+
           'if(day(a.fecha_creacion) = 1, 1, 0) as D1, if(day(a.fecha_creacion) = 2, 1, 0) as D2, '+
           'if(day(a.fecha_creacion) = 3, 1, 0) as D3, if(day(a.fecha_creacion) = 4, 1, 0) as D4, '+
           'if(day(a.fecha_creacion) = 5, 1, 0) as D5, if(day(a.fecha_creacion) = 6, 1, 0) as D6, '+
           'if(day(a.fecha_creacion) = 7, 1, 0) as D7, if(day(a.fecha_creacion) = 8, 1, 0) as D8, '+
           'if(day(a.fecha_creacion) = 9, 1, 0) as D9, if(day(a.fecha_creacion) = 10, 1, 0) as D10, '+
           'if(day(a.fecha_creacion) = 11, 1, 0) as D11, if(day(a.fecha_creacion) = 12, 1, 0) as D12, '+
           'if(day(a.fecha_creacion) = 13, 1, 0) as D13, if(day(a.fecha_creacion) = 14, 1, 0) as D14, '+
           'if(day(a.fecha_creacion) = 15, 1, 0) as D15, if(day(a.fecha_creacion) = 16, 1, 0) as D16, '+
           'if(day(a.fecha_creacion) = 17, 1, 0) as D17, if(day(a.fecha_creacion) = 18, 1, 0) as D18, '+
           'if(day(a.fecha_creacion) = 19, 1, 0) as D19, if(day(a.fecha_creacion) = 20, 1, 0) as D20, '+
           'if(day(a.fecha_creacion) = 21, 1, 0) as D21, if(day(a.fecha_creacion) = 22, 1, 0) as D22, '+
           'if(day(a.fecha_creacion) = 23, 1, 0) as D23, if(day(a.fecha_creacion) = 24, 1, 0) as D24, '+
           'if(day(a.fecha_creacion) = 25, 1, 0) as D25, if(day(a.fecha_creacion) = 26, 1, 0) as D26, '+
           'if(day(a.fecha_creacion) = 27, 1, 0) as D27, if(day(a.fecha_creacion) = 28, 1, 0) as D28, '+
           'if(day(a.fecha_creacion) = 29, 1, 0) as D29, if(day(a.fecha_creacion) = 30, 1, 0) as D30, '+
           'if(day(a.fecha_creacion) = 31, 1, 0) as D31 FROM agenda_vendedores as a '+
           'INNER JOIN oportunidades as op ON a.idoportunidad=op.idoportunidad '+
           'LEFT JOIN actividades_vendedores as ac ON (a.idevento = ac.idevento) '+
           'LEFT JOIN origen o ON o.idorigen=op.idorigen '+
           'WHERE a.fecha_creacion between "'+tpdesde.Text+'" and "'+tphasta.Text+'" '+
           'AND o.idorigen = 2 and o.reporte = 1 GROUP BY a.idevento ORDER BY a.fecha_creacion ASC '+
           ') as t left join usuarios u on u.idusuario=t.idvendedor group by idvendedor', 1, sqlgeneral2);

    //CONTROL DE PROSPECTOS (PERSONAS A LAS QUE SE LES HIZO ESTUDIO DE VULNERABILIDAD Y PRESUPUESTO) 200 MENSUALES  8 DIARIOS
    querys('Insert into repvendprospectos (idvendedor, mes, anio, dif, tend, acum, '+
           'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
           'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
           'usuario, fecha, hora )'+
           'select idvendedor, '+
           //'codigo, '+UsuarioNombre('u')+' as nombre, '+
           'MesNombre(month(fecha_creacion)) as mes, year(fecha_creacion) as anio, '+
           ''+GetMeta('MetaProspectos')+'-sum(cantidad) as dif, floor((sum(cantidad)/day("'+tphasta.Text+'"))*'+diasmes+') as tend, sum(cantidad) as acum, '+
           'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
           'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
           'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
           'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
           'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
           'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
           'sum(D31) as D31, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, curdate(), curtime() from ( '+
           'SELECT a.fecha_creacion, a.idvendedor, op.idoportunidad, o.nombre as origen, 1 as cantidad, '+
           'if(day(a.fecha_creacion) = 1, 1, 0) as D1, if(day(a.fecha_creacion) = 2, 1, 0) as D2, '+
           'if(day(a.fecha_creacion) = 3, 1, 0) as D3, if(day(a.fecha_creacion) = 4, 1, 0) as D4, '+
           'if(day(a.fecha_creacion) = 5, 1, 0) as D5, if(day(a.fecha_creacion) = 6, 1, 0) as D6, '+
           'if(day(a.fecha_creacion) = 7, 1, 0) as D7, if(day(a.fecha_creacion) = 8, 1, 0) as D8, '+
           'if(day(a.fecha_creacion) = 9, 1, 0) as D9, if(day(a.fecha_creacion) = 10, 1, 0) as D10, '+
           'if(day(a.fecha_creacion) = 11, 1, 0) as D11, if(day(a.fecha_creacion) = 12, 1, 0) as D12, '+
           'if(day(a.fecha_creacion) = 13, 1, 0) as D13, if(day(a.fecha_creacion) = 14, 1, 0) as D14, '+
           'if(day(a.fecha_creacion) = 15, 1, 0) as D15, if(day(a.fecha_creacion) = 16, 1, 0) as D16, '+
           'if(day(a.fecha_creacion) = 17, 1, 0) as D17, if(day(a.fecha_creacion) = 18, 1, 0) as D18, '+
           'if(day(a.fecha_creacion) = 19, 1, 0) as D19, if(day(a.fecha_creacion) = 20, 1, 0) as D20, '+
           'if(day(a.fecha_creacion) = 21, 1, 0) as D21, if(day(a.fecha_creacion) = 22, 1, 0) as D22, '+
           'if(day(a.fecha_creacion) = 23, 1, 0) as D23, if(day(a.fecha_creacion) = 24, 1, 0) as D24, '+
           'if(day(a.fecha_creacion) = 25, 1, 0) as D25, if(day(a.fecha_creacion) = 26, 1, 0) as D26, '+
           'if(day(a.fecha_creacion) = 27, 1, 0) as D27, if(day(a.fecha_creacion) = 28, 1, 0) as D28, '+
           'if(day(a.fecha_creacion) = 29, 1, 0) as D29, if(day(a.fecha_creacion) = 30, 1, 0) as D30, '+
           'if(day(a.fecha_creacion) = 31, 1, 0) as D31 FROM agenda_vendedores as a '+
           'INNER JOIN oportunidades as op ON a.idoportunidad=op.idoportunidad '+
           'LEFT JOIN actividades_vendedores as ac ON (a.idevento = ac.idevento) '+
           'LEFT JOIN origen o ON o.idorigen=op.idorigen '+
           'WHERE a.fecha_creacion between "'+tpdesde.Text+'" and "'+tphasta.Text+'" '+
           'AND o.idorigen in (1, 2) and o.reporte = 1 GROUP BY a.idevento ORDER BY a.fecha_creacion ASC '+
           ') as t left join usuarios u on u.idusuario=t.idvendedor group by idvendedor', 1, sqlgeneral3);

    //CONTROL DE VENTA EN DOLARES
    querys('Insert into repvenddolares (idvendedor, mes, anio, dif, tend, acum, '+
           'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
           'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
           'usuario, fecha, hora )'+
           'select idvendedor, '+
           //'codigo, u.nombre, '+
           'MesNombre(month(FechaRemision)) as mes, year(FechaRemision) as anio, '+
           ''+GetMeta('Venta en Dolares')+'-sum(TotDlls) as dif, floor((sum(TotDlls)/day("'+tphasta.Text+'"))*'+diasmes+') as tend, sum(TotDlls) as acum, '+
           'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
           'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
           'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
           'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
           'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
           'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
           'sum(D31) as D31, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, curdate(), curtime() from ( '+
           'select idvendedor, sum(TotDlls-nctotdlls) as TotDlls, sum(Cuentanueva) as Cuentanueva, FechaRemision, '+
           'if(day(t.FechaRemision) = 1, sum(TotDlls-nctotdlls), 0) as D1, if(day(t.FechaRemision) = 2, sum(TotDlls-nctotdlls), 0) as D2, '+
           'if(day(t.FechaRemision) = 3, sum(TotDlls-nctotdlls), 0) as D3, if(day(t.FechaRemision) = 4, sum(TotDlls-nctotdlls), 0) as D4, '+
           'if(day(t.FechaRemision) = 5, sum(TotDlls-nctotdlls), 0) as D5, if(day(t.FechaRemision) = 6, sum(TotDlls-nctotdlls), 0) as D6, '+
           'if(day(t.FechaRemision) = 7, sum(TotDlls-nctotdlls), 0) as D7, if(day(t.FechaRemision) = 8, sum(TotDlls-nctotdlls), 0) as D8, '+
           'if(day(t.FechaRemision) = 9, sum(TotDlls-nctotdlls), 0) as D9, if(day(t.FechaRemision) = 10, sum(TotDlls-nctotdlls), 0) as D10, '+
           'if(day(t.FechaRemision) = 11, sum(TotDlls-nctotdlls), 0) as D11, if(day(t.FechaRemision) = 12, sum(TotDlls-nctotdlls), 0) as D12, '+
           'if(day(t.FechaRemision) = 13, sum(TotDlls-nctotdlls), 0) as D13, if(day(t.FechaRemision) = 14, sum(TotDlls-nctotdlls), 0) as D14, '+
           'if(day(t.FechaRemision) = 15, sum(TotDlls-nctotdlls), 0) as D15, if(day(t.FechaRemision) = 16, sum(TotDlls-nctotdlls), 0) as D16, '+
           'if(day(t.FechaRemision) = 17, sum(TotDlls-nctotdlls), 0) as D17, if(day(t.FechaRemision) = 18, sum(TotDlls-nctotdlls), 0) as D18, '+
           'if(day(t.FechaRemision) = 19, sum(TotDlls-nctotdlls), 0) as D19, if(day(t.FechaRemision) = 20, sum(TotDlls-nctotdlls), 0) as D20, '+
           'if(day(t.FechaRemision) = 21, sum(TotDlls-nctotdlls), 0) as D21, if(day(t.FechaRemision) = 22, sum(TotDlls-nctotdlls), 0) as D22, '+
           'if(day(t.FechaRemision) = 23, sum(TotDlls-nctotdlls), 0) as D23, if(day(t.FechaRemision) = 24, sum(TotDlls-nctotdlls), 0) as D24, '+
           'if(day(t.FechaRemision) = 25, sum(TotDlls-nctotdlls), 0) as D25, if(day(t.FechaRemision) = 26, sum(TotDlls-nctotdlls), 0) as D26, '+
           'if(day(t.FechaRemision) = 27, sum(TotDlls-nctotdlls), 0) as D27, if(day(t.FechaRemision) = 28, sum(TotDlls-nctotdlls), 0) as D28, '+
           'if(day(t.FechaRemision) = 29, sum(TotDlls-nctotdlls), 0) as D29, if(day(t.FechaRemision) = 30, sum(TotDlls-nctotdlls), 0) as D30, '+
           'if(day(t.FechaRemision) = 31, sum(TotDlls-nctotdlls), 0) as D31 from ( '+
           'SELECT p.idpedido as Venta, if(clientes.tipocont<>"SEN",left(tp.nombre,7),concat(left(tp.nombre,4),"SEN")) as Oport, tp.Cuentanueva, '+
           'sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls,  p.idvendedor, '+
           'ifnull(nc.ToTDlls, 0) as ncTotDlls, p.FechaRemision FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) '+
           'LEFT JOIN clientes ON  (p.idcliente=clientes.idcliente) LEFT JOIN UnidadNegocio as tp On  (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN articulos as a ON(a.cod_cve=dp.cod_cve) left join ( select distinct p.idpedido, '+
           'sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
           'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio,(dnc.piezas*dnc.costo))),0) )   as ToTDlls '+
           'from DetNotasCredito as dnc left join NotasCredito as nc ON(nc.idnc=dnc.idnc) '+
           'LEFT JOIN  RemiFact as rf ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) '+
           'LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'WHERE nc.FechaNc between "'+tpdesde.Text+'" and "'+tphasta.Text+'"  and tp.instalacion =1  and a.idlinea = 4 '+
           'GROUP BY dnc.idpedido ) as nc on nc.idpedido=p.idpedido '+
           'WHERE  p.FechaRemision BETWEEN "'+tpdesde.Text+'" and "'+tphasta.Text+'" and p.estatus in(3,4) '+
           'and tp.instalacion in(1) and a.idlinea = 4 AND tp.nombre not in ("GARANTIAS") group by p.idpedido '+
           ') as t group by idvendedor, FechaRemision ) as t LEFT JOIN usuarios as u ON (u.idusuario=t.idvendedor) '+
           'group by idvendedor ', 1, sqlgeneral4);

    //CONTROL DE CUENTAS NUEVAS (CIERRES)
    querys('Insert into repvendcuentas (idvendedor, mes, anio, dif, tend, acum, '+
           'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
           'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
           'usuario, fecha, hora )'+
           'select idvendedor, '+
           //'codigo, u.nombre, '+
           'MesNombre(month(FechaRemision)) as mes, year(FechaRemision) as anio, '+
           ''+GetMeta('Cuentas Nuevas')+'-sum(Cuentanueva) as dif, floor((sum(Cuentanueva)/day("'+tphasta.Text+'"))*'+diasmes+') as tend, sum(Cuentanueva) as acum, '+
           'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
           'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
           'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
           'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
           'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
           'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
           'sum(D31) as D31, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, curdate(), curtime() from ( '+
           'select idvendedor, sum(Cuentanueva) as Cuentanueva, FechaRemision, '+
           'if(day(t.FechaRemision) = 1, sum(TotDlls-nctotdlls), 0) as D1, if(day(t.FechaRemision) = 2, sum(CuentaNueva), 0) as D2, '+
           'if(day(t.FechaRemision) = 3, sum(CuentaNueva), 0) as D3, if(day(t.FechaRemision) = 4, sum(CuentaNueva), 0) as D4, '+
           'if(day(t.FechaRemision) = 5, sum(CuentaNueva), 0) as D5, if(day(t.FechaRemision) = 6, sum(CuentaNueva), 0) as D6, '+
           'if(day(t.FechaRemision) = 7, sum(CuentaNueva), 0) as D7, if(day(t.FechaRemision) = 8, sum(CuentaNueva), 0) as D8, '+
           'if(day(t.FechaRemision) = 9, sum(CuentaNueva), 0) as D9, if(day(t.FechaRemision) = 10, sum(CuentaNueva), 0) as D10, '+
           'if(day(t.FechaRemision) = 11, sum(CuentaNueva), 0) as D11, if(day(t.FechaRemision) = 12, sum(CuentaNueva), 0) as D12, '+
           'if(day(t.FechaRemision) = 13, sum(CuentaNueva), 0) as D13, if(day(t.FechaRemision) = 14, sum(CuentaNueva), 0) as D14, '+
           'if(day(t.FechaRemision) = 15, sum(CuentaNueva), 0) as D15, if(day(t.FechaRemision) = 16, sum(CuentaNueva), 0) as D16, '+
           'if(day(t.FechaRemision) = 17, sum(CuentaNueva), 0) as D17, if(day(t.FechaRemision) = 18, sum(CuentaNueva), 0) as D18, '+
           'if(day(t.FechaRemision) = 19, sum(CuentaNueva), 0) as D19, if(day(t.FechaRemision) = 20, sum(CuentaNueva), 0) as D20, '+
           'if(day(t.FechaRemision) = 21, sum(CuentaNueva), 0) as D21, if(day(t.FechaRemision) = 22, sum(CuentaNueva), 0) as D22, '+
           'if(day(t.FechaRemision) = 23, sum(CuentaNueva), 0) as D23, if(day(t.FechaRemision) = 24, sum(CuentaNueva), 0) as D24, '+
           'if(day(t.FechaRemision) = 25, sum(CuentaNueva), 0) as D25, if(day(t.FechaRemision) = 26, sum(CuentaNueva), 0) as D26, '+
           'if(day(t.FechaRemision) = 27, sum(CuentaNueva), 0) as D27, if(day(t.FechaRemision) = 28, sum(CuentaNueva), 0) as D28, '+
           'if(day(t.FechaRemision) = 29, sum(CuentaNueva), 0) as D29, if(day(t.FechaRemision) = 30, sum(CuentaNueva), 0) as D30, '+
           'if(day(t.FechaRemision) = 31, sum(CuentaNueva), 0) as D31 from ( '+
           'SELECT p.idpedido as Venta, if(clientes.tipocont<>"SEN",left(tp.nombre,7),concat(left(tp.nombre,4),"SEN")) as Oport, tp.Cuentanueva, '+
           'sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls,  p.idvendedor, '+
           'ifnull(nc.ToTDlls, 0) as ncTotDlls, p.FechaRemision FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) '+
           'LEFT JOIN clientes ON  (p.idcliente=clientes.idcliente) LEFT JOIN UnidadNegocio as tp On  (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN articulos as a ON(a.cod_cve=dp.cod_cve) left join ( select distinct p.idpedido, '+
           'sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
           'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio,(dnc.piezas*dnc.costo))),0) )   as ToTDlls '+
           'from DetNotasCredito as dnc left join NotasCredito as nc ON(nc.idnc=dnc.idnc) '+
           'LEFT JOIN  RemiFact as rf ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) '+
           'LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'WHERE nc.FechaNc between "'+tpdesde.Text+'" and "'+tphasta.Text+'"  and tp.instalacion =1  and a.idlinea = 4 '+
           'GROUP BY dnc.idpedido ) as nc on nc.idpedido=p.idpedido '+
           'WHERE  p.FechaRemision BETWEEN "'+tpdesde.Text+'" and "'+tphasta.Text+'" and p.estatus in(3,4) '+
           'and tp.instalacion in(1) and a.idlinea = 4 AND tp.nombre not in ("GARANTIAS") group by p.idpedido '+
           ') as t group by idvendedor, FechaRemision ) as t LEFT JOIN usuarios as u ON (u.idusuario=t.idvendedor) '+
           'group by idvendedor ', 1, sqlgeneral5);

    //REPORTE DE LLAMADAS/ EQUIPOS
    querys('Insert into repvendfuentes (idfuente, mes, anio, tend, acum, cierres, '+
           'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
           'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
           'usuario, fecha, hora )'+
           'select t.idfuente,  MesNombre(month(fecha_creacion)) as mes, year(fecha_creacion) as anio, '+
           'floor((sum(cantidad)/day("'+tphasta.Text+'"))*'+diasmes+') as tend, sum(cantidad) as acum, sum(cuentanueva) as cuentanueva, '+
           'sum(D1) as D1, sum(D2) as D2, sum(D3) as D3, sum(D4) as D4, sum(D5) as D5, '+
           'sum(D6) as D6, sum(D7) as D7, sum(D8) as D8, sum(D9) as D9, sum(D10) as D10, '+
           'sum(D11) as D11, sum(D12) as D12, sum(D13) as D13, sum(D14) as D14, sum(D15) as D15, '+
           'sum(D16) as D16, sum(D17) as D17, sum(D18) as D18, sum(D19) as D19, sum(D20) as D20, '+
           'sum(D21) as D21, sum(D22) as D22, sum(D23) as D23, sum(D24) as D24, sum(D25) as D25, '+
           'sum(D26) as D26, sum(D27) as D27, sum(D28) as D28, sum(D29) as D29, sum(D30) as D30, '+
           'sum(D31) as D31, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'" as usuario, curdate(), curtime() from ( '+
           'SELECT a.fecha_creacion, a.idvendedor, op.idoportunidad, o.nombre as origen, 1 as cantidad, '+
           'op.idfuente, ifnull(tp.cuentanueva, 0) as cuentanueva, '+
           'if(day(a.fecha_creacion) = 1, 1, 0) as D1, if(day(a.fecha_creacion) = 2, 1, 0) as D2, '+
           'if(day(a.fecha_creacion) = 3, 1, 0) as D3, if(day(a.fecha_creacion) = 4, 1, 0) as D4, '+
           'if(day(a.fecha_creacion) = 5, 1, 0) as D5, if(day(a.fecha_creacion) = 6, 1, 0) as D6, '+
           'if(day(a.fecha_creacion) = 7, 1, 0) as D7, if(day(a.fecha_creacion) = 8, 1, 0) as D8, '+
           'if(day(a.fecha_creacion) = 9, 1, 0) as D9, if(day(a.fecha_creacion) = 10, 1, 0) as D10, '+
           'if(day(a.fecha_creacion) = 11, 1, 0) as D11, if(day(a.fecha_creacion) = 12, 1, 0) as D12, '+
           'if(day(a.fecha_creacion) = 13, 1, 0) as D13, if(day(a.fecha_creacion) = 14, 1, 0) as D14, '+
           'if(day(a.fecha_creacion) = 15, 1, 0) as D15, if(day(a.fecha_creacion) = 16, 1, 0) as D16, '+
           'if(day(a.fecha_creacion) = 17, 1, 0) as D17, if(day(a.fecha_creacion) = 18, 1, 0) as D18, '+
           'if(day(a.fecha_creacion) = 19, 1, 0) as D19, if(day(a.fecha_creacion) = 20, 1, 0) as D20, '+
           'if(day(a.fecha_creacion) = 21, 1, 0) as D21, if(day(a.fecha_creacion) = 22, 1, 0) as D22, '+
           'if(day(a.fecha_creacion) = 23, 1, 0) as D23, if(day(a.fecha_creacion) = 24, 1, 0) as D24, '+
           'if(day(a.fecha_creacion) = 25, 1, 0) as D25, if(day(a.fecha_creacion) = 26, 1, 0) as D26, '+
           'if(day(a.fecha_creacion) = 27, 1, 0) as D27, if(day(a.fecha_creacion) = 28, 1, 0) as D28, '+
           'if(day(a.fecha_creacion) = 29, 1, 0) as D29, if(day(a.fecha_creacion) = 30, 1, 0) as D30, '+
           'if(day(a.fecha_creacion) = 31, 1, 0) as D31 FROM agenda_vendedores as a '+
           'INNER JOIN oportunidades as op ON a.idoportunidad=op.idoportunidad '+
           'LEFT JOIN actividades_vendedores as ac ON (a.idevento = ac.idevento) '+
           'LEFT JOIN origen o ON o.idorigen=op.idorigen '+
           'LEFT JOIN tipo_oportunidad as tip ON (tip.idtipo_oportunidad=a.idtipo_oportunidad) '+
           'left join unidadnegocio tp on tp.idunidadnegocio=tip.idunidadnegocio '+
           'WHERE a.fecha_creacion between "'+tpdesde.Text+'" and "'+tphasta.Text+'" '+
           'AND o.idorigen = 1 and o.reporte = 1 GROUP BY a.idevento ORDER BY a.fecha_creacion ASC ) as t '+
           'left join fuentes f on f.idfuente=t.idfuente group by t.idfuente', 1, sqlgeneral6);
      application.messagebox('Termino de generar', 'Atencion', mb_iconinformation);
      end
    else
      begin
      //  #CONTROL DE VOLANTES (personas que se les entreo volante en mano) 25 dias habiles 30 diarios
      if querys('select u.idusuario as idvendedor, MesNombre(month("'+tphasta.Text+'")) as mes, year("'+tphasta.Text+'") as anio, '+
             '0 as dif, 0 as tend, 0 as acum, concat(MesNombre(month("'+tphasta.Text+'")), " - ", year("'+tphasta.Text+'")) as periodo,  '+
             '0 as D1, 0 as D2, 0 as D3, 0 as D4, 0 as D5, 0 as D6, 0 as D7, 0 as D8, 0 as D9, 0 as D10, '+
             '0 as D11, 0 as D12, 0 as D13, 0 as D14, 0 as D15, 0 as D16, 0 as D17, 0 as D18, 0 as D19, 0 as D20, '+
             '0 as D21, 0 as D22, 0 as D23, 0 as D24, 0 as D25, 0 as D26, 0 as D27, 0 as D28, 0 as D29, 0 as D30, 0 as D31, '+
             'u.codigo, '+UsuarioNombre('u')+' as nombre '+
             'from usuarios u left join puestos p on p.idpuesto=u.idpuesto where p.nombre like "%vendedor%" '+
             'and u.estatus=1', 0, sqlgeneral) > 0 then
        OperacionReporte('VendMetasVol', 'Metas Vendedores Volantes', TipoImpresion, 1)
      else
        application.messagebox('No se encontraron datos en Metas Vendedores Volantes', 'Atencion', mb_iconinformation);


      //CONTROL DE CONTACTOS (PERSONAS A LAS QUE SE LES DEJO EL VOLANTE Y NOS DIERON SU NOMBRE, TELEFONO, DIRECCION) 500 MENSUALES 20 DIARIOS
      if querys('select idvendedor, mes, anio, dif, tend, acum, concat(mes, " - ", anio) as periodo, '+
             'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
             'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
             'u.codigo, '+UsuarioNombre('u')+' as nombre '+
             'from repvendcontactos v left join usuarios u on u.idusuario=v.idvendedor '+
             'where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 0, sqlgeneral2) > 0 then
        OperacionReporte('VendMetasCont', 'Metas Vendedores Contactos', TipoImpresion, 1)
      else
        application.messagebox('No se encontraron datos en Metas Vendedores Contactos', 'Atencion', mb_iconinformation);

      //CONTROL DE PROSPECTOS (PERSONAS A LAS QUE SE LES HIZO ESTUDIO DE VULNERABILIDAD Y PRESUPUESTO) 200 MENSUALES  8 DIARIOS
      if querys('select idvendedor, mes, anio, dif, tend, acum, concat(mes, " - ", anio) as periodo, '+
             'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
             'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
             'u.codigo, '+UsuarioNombre('u')+' as nombre '+
             'from repvendprospectos v left join usuarios u on u.idusuario=v.idvendedor '+
             'where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 0, sqlgeneral3) > 0 then
        OperacionReporte('VendMetasProsp', 'Metas Vendedores Prospectos', TipoImpresion, 1)
      else
        application.messagebox('No se encontraron datos en Metas Vendedores Prospectos', 'Atencion', mb_iconinformation);


      //CONTROL DE VENTA EN DOLARES
      if querys('select idvendedor, mes, anio, dif, tend, acum, concat(mes, " - ", anio) as periodo, '+
             'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
             'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
             'u.codigo, '+UsuarioNombre('u')+' as nombre '+
             'from repvenddolares v left join usuarios u on u.idusuario=v.idvendedor '+
             'where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 0, sqlgeneral4) > 0 then
        OperacionReporte('VendMetasDol', 'Metas Vendedores Dolares', TipoImpresion, 1)
      else
        application.messagebox('No se encontraron datos en Metas Vendedores Dolares', 'Atencion', mb_iconinformation);

      //CONTROL DE CUENTAS NUEVAS (CIERRES)
      if querys('select idvendedor, mes, anio, dif, tend, acum, concat(mes, " - ", anio) as periodo, '+
             'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
             'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
             'u.codigo, '+UsuarioNombre('u')+' as nombre '+
             'from repvendcuentas v left join usuarios u on u.idusuario=v.idvendedor '+
             'where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 0, sqlgeneral5) > 0 then
        OperacionReporte('VendMetasCuentas', 'Metas Vendedores Cuentas', TipoImpresion, 1)
      else
        application.messagebox('No se encontraron datos en Metas Vendedores Cuentas', 'Atencion', mb_iconinformation);

      //REPORTE DE LLAMADAS/ EQUIPOS
      if querys('select v.idfuente, mes, anio, tend, acum, concat(mes, " - ", anio) as periodo, '+
             'D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, '+
             'D16, D17, D18, D19, D20, D21, D22, D23, D24, D25, D26, D27, D28, D29, D30, D31, '+
             'f.nombre as fuente '+
             'from repvendfuentes v left join fuentes f on f.idfuente=v.idfuente '+
             'where mes = MesNombre(month("'+tphasta.Text+'")) and anio = year("'+tphasta.Text+'")', 0, sqlgeneral6) > 0 then
        OperacionReporte('VendMetasLlam', 'Metas Vendedores Llamadas', TipoImpresion, 1)
      else
        application.messagebox('No se encontraron datos en Metas Vendedores Llamadas', 'Atencion', mb_iconinformation);
      end;
  end;
end;

procedure TfrmrepVendedores.MetasVendedoresAnual;
var anio:string;
begin
anio := cbdesde.text;
  with dmreportes do
    begin
    //llamadas por fuente y cierres anual
    if querys('SELECT idfuente, nombre, anio, sum(cierres) as cierres, sum(acum) as acum, '+
              'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, '+
              'sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, '+
              'sum(C1) as C1, sum(C2) as C2, sum(C3) as C3, sum(C4) as C4, sum(C5) as C5, sum(C6) as C6, '+
              'sum(C7) as C7, sum(C8) as C8, sum(C9) as C9, sum(C10) as C10, sum(C11) as C11, sum(C12) as C12 '+
              'from ( '+
              'SELECT f.idfuente, n.nombre, f.anio, f.cierres, sum(acum) as acum, '+
              'if(LEFT(mes,3)="ENE", sum(acum), 0) as M1, if(LEFT(mes,3)="FEB", sum(acum), 0) as M2, '+
              'if(LEFT(mes,3)="MAR", sum(acum), 0) as M3, if(LEFT(mes,3)="ABR", sum(acum), 0) as M4, '+
              'if(LEFT(mes,3)="MAY", sum(acum), 0) as M5, if(LEFT(mes,3)="JUN", sum(acum), 0) as M6, '+
              'if(LEFT(mes,3)="JUL", sum(acum), 0) as M7, if(LEFT(mes,3)="AGO", sum(acum), 0) as M8, '+
              'if(LEFT(mes,3)="SEP", sum(acum), 0) as M9, if(LEFT(mes,3)="OCT", sum(acum), 0) as M10, '+
              'if(LEFT(mes,3)="NOV", sum(acum), 0) as M11, if(LEFT(mes,3)="DIC", sum(acum), 0) as M12, '+
              'if(LEFT(mes,3)="ENE", sum(cierres), 0) as C1, if(LEFT(mes,3)="FEB", sum(cierres), 0) as C2, '+
              'if(LEFT(mes,3)="MAR", sum(cierres), 0) as C3, if(LEFT(mes,3)="ABR", sum(cierres), 0) as C4, '+
              'if(LEFT(mes,3)="MAY", sum(cierres), 0) as C5, if(LEFT(mes,3)="JUN", sum(cierres), 0) as C6, '+
              'if(LEFT(mes,3)="JUL", sum(cierres), 0) as C7, if(LEFT(mes,3)="AGO", sum(cierres), 0) as C8, '+
              'if(LEFT(mes,3)="SEP", sum(cierres), 0) as C9, if(LEFT(mes,3)="OCT", sum(cierres), 0) as C10, '+
              'if(LEFT(mes,3)="NOV", sum(cierres), 0) as C11, if(LEFT(mes,3)="DIC", sum(cierres), 0) as C12 '+
              'from repvendfuentes f LEFT JOIN fuentes n on f.idfuente=n.idfuente '+
              'where f.anio = '+anio+' group by f.idfuente, mes ) as f group by idfuente', 0, sqlgeneral) > 0 then
      OperacionReporte('VendMetasLlamAnual', 'Metas Vendedores Fuentes / Cierres Anual', TipoImpresion, 1)
    else
      application.messagebox('No se encontraron datos en Metas Vendedores uentes / Cierres Anual', 'Atencion', mb_iconinformation);

    if querys('SELECT idvendedor, codigo, nombre, anio, sum(acum) as acum, '+
              'sum(C1) as C1, sum(C2) as C2, sum(C3) as C3, sum(C4) as C4, sum(C5) as C5, sum(C6) as C6, '+
              'sum(C7) as C7, sum(C8) as C8, sum(C9) as C9, sum(C10) as C10, sum(C11) as C11, sum(C12) as C12 '+
              'from ( '+
              'SELECT c.idvendedor, u.codigo, u.nombre, c.anio, sum(acum) as acum, '+
              'if(LEFT(mes,3)="ENE", sum(acum), 0) as C1, if(LEFT(mes,3)="FEB", sum(acum), 0) as C2, '+
              'if(LEFT(mes,3)="MAR", sum(acum), 0) as C3, if(LEFT(mes,3)="ABR", sum(acum), 0) as C4, '+
              'if(LEFT(mes,3)="MAY", sum(acum), 0) as C5, if(LEFT(mes,3)="JUN", sum(acum), 0) as C6, '+
              'if(LEFT(mes,3)="JUL", sum(acum), 0) as C7, if(LEFT(mes,3)="AGO", sum(acum), 0) as C8, '+
              'if(LEFT(mes,3)="SEP", sum(acum), 0) as C9, if(LEFT(mes,3)="OCT", sum(acum), 0) as C10, '+
              'if(LEFT(mes,3)="NOV", sum(acum), 0) as C11, if(LEFT(mes,3)="DIC", sum(acum), 0) as C12 '+
              'from repvendcuentas c LEFT JOIN usuarios u on u.idusuario=c.idvendedor '+
              'where c.anio = '+anio+' group by c.idvendedor, mes) as f group by idvendedor', 0, sqlgeneral2) > 0 then
      OperacionReporte('VendMetasCuentasAnual', 'Metas Vendedores Cuentas Anual', TipoImpresion, 1)
    else
      application.messagebox('No se encontraron datos en Metas Vendedores Cuentas Anual', 'Atencion', mb_iconinformation);
    end;
end;

End.


