{///////////////////////////////////////////////////////////////////////////////
2009/03/04 dalyla Mant pinte la stdate del cliente y ordene por tecnico
2008/06/11 dalyla Reportes de oxxos
2007/12/24 lila
}///////////////////////////////////////////////////////////////////////////////
unit URepServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzDTP, StdCtrls, RzLabel, ExtCtrls, RzPanel, RzCmboBx,
  RzButton, DB, MemDS, DBAccess, MyAccess, DateUtils, Mask, RzEdit,
  RzBtnEdt, RzRadGrp;

type
  TfrmRepServicios = class(TForm)
    btnImprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    cbTipoImpresion: TRzComboBox;
    rgPeriodo: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    sqlgeneral: TMyQuery;
    rgrango: TRzGroupBox;
    eddesde: TRzButtonEdit;
    ldesde: TRzLabel;
    edhasta: TRzButtonEdit;
    lhasta: TRzLabel;
    rgRango2: TRzRadioGroup;
    rgRango3: TRzRadioGroup;
    cbdesde: TRzComboBox;
    cbhasta: TRzComboBox;
    tpdesde: TRzDateTimeEdit;
    tphasta: TRzDateTimeEdit;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure rgRango2Click(Sender: TObject);
  private
    TipoImpresion:String;
    procedure Mantenimientos;
    procedure Servicios;
    procedure RegenerarRepTicketsFinalizados;
    procedure ServiciosOxxo;
    procedure CambioCodigo;
    { Private declarations }
  public
    Reporte:Integer;
    procedure inicializa;
    { Public declarations }
  end;

var
  frmRepServicios: TfrmRepServicios;

implementation

uses Urecursos, Udm, Uprincipal, Udmrep, Ubusquedas;

{$R *.dfm}

procedure TfrmRepServicios.inicializa;
begin
Tipoimpresion := 'IMP';
tpDesde.Date := StrToDate(FormatDateTime('yyyy""/""mm',Now)+'/01');
tpHasta.Date := Today;
case Reporte of
   1: begin
      Self.Height := 175;
      Self.Width := 380;
      Self.caption := 'Mantenimientos de Servicios';
      rgrango.Caption := ' Mantenimientos ';
      edhasta.Enabled := false;
      rgperiodo.Visible := false;
      end;

   2: begin
      Self.caption := 'Servicios por Cuentas';
      Self.Height := 175;
      Self.Width := 380;

      rgrango.Caption := ' Mantenimientos ';
      edhasta.Enabled := false;
      rgrango2.Visible := True;
      rgrango2.Items.Clear;
      rgrango2.Items.Add('Todas');
      rgrango2.Items.Add('Rango');
      rgrango2.ItemIndex := 0;
      rgrango3.Visible := true;
      rgrango3.Caption := ' Busqueda por: ';
      rgrango3.Items.Clear;
      rgrango3.Items.Add('Cuenta');
      rgrango3.Items.Add('Tecnico');
      rgrango3.Items.Add('Fechas');
      rgrango3.Items.Add('Estatus');
      rgrango3.Items.Add('Problema');
      rgrango3.ItemIndex := 0;
      rgperiodo.Visible := false;
      end;

   3: begin
      rgperiodo.Visible := false;
      rgrango2.Visible := false;
      rgrango3.Visible := false;
      cbdesde.visible := true;
      eddesde.Visible := false;
      cbhasta.Visible := false;
      edhasta.ButtonVisible := false;
      edhasta.Text := inttostr(yearof(today));
      ldesde.Caption := 'MES: ';
      lhasta.Caption := 'AÑO: ';
      ComboMeses(cbdesde);
      btnimprimir.caption := 'Actualizar';
      cbTipoImpresion.Visible := false;
      self.Height := 160;
      self.Width :=  380;
      end;

   4: begin
      Self.caption := 'Servicios por periodo';
      Self.Height := 300;
      Self.Width := 390;
      rgrango.Caption := ' Periodo ';
      cbdesde.visible := true;
      cbdesde.Enabled := false;
      eddesde.Visible := false;
      cbhasta.Visible := false;
      edhasta.ButtonVisible := false;
      edhasta.Text := inttostr(yearof(today));
      ldesde.Caption := 'MES: ';
      ldesde.Enabled := false;
      lhasta.Caption := 'AÑO: ';
      rgrango2.caption := ' Tipo: ';
      rgrango2.Visible := True;
      rgrango2.Items.Clear;
      rgrango2.Items.Add('Resumen Anual');
      rgrango2.Items.Add('Detallado Mes');
      rgrango2.ItemIndex := 0;
      rgrango3.Caption := ' Reporte anual para: ';
      rgrango3.Visible := true;
      rgrango3.Items.Clear;
      rgrango3.Items.Add('Oxxo');
      rgrango3.Items.Add('Clientes');
      rgrango3.ItemIndex := 0;
      rgperiodo.Visible := true;
      end;

   5: begin
      Self.caption := 'Cambio de Codigo';
      Self.Height := 250;
      Self.Width := 390;
      rgrango.visible := false;
      rgperiodo.Visible := true;
      rgperiodo.top := 6;
      end;
   end;
end;

procedure TfrmRepServicios.btnImprimirClick(Sender: TObject);
begin
case Reporte of
   1: Mantenimientos;
   2: Servicios;
   3: RegenerarRepTicketsFinalizados;
   4: ServiciosOxxo;
   5: CambioCodigo;

   end;
end;

procedure TfrmRepServicios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmRepServicios.cbTipoImpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmRepServicios.btncerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRepServicios.Mantenimientos;
begin
{querys('Select dm.idmantenimiento, m.nombre as mant, '+ClienteNombre('c')+' as nombre, dm.idcliente, c.st_date as alta, '+
       'if(FechaRealizada is null, min(dm.fecha), max(FechaRealizada)) as fecha1, min(dm.fecha) as fecha2, '+
       'if(realizada=1,"SI", "NO") as realizada, dm.FechaRealizada, f1,f2,f3,f4, '+UsuarioNombre('u')+
       ' as tecnico From DetMantenimientos AS dm left join mantenimientos as m on '+
       'dm.idmantenimiento=m.idmantenimiento left join clientes as c on c.idcliente=dm.idcliente '+
       'left join usuarios as u on u.idusuario=dm.idtecnico where dm.idmantenimiento = '+eddesde.text+
       ' group by idcliente order by tecnico, realizada, idcliente', 1, dmreportes.sqlgeneral);}

querys('Select dm.idmantenimiento, m.nombre as mant, '+ClienteNombre('c')+' as nombre, dm.idcliente, '+
       'c.st_date as alta, if(FechaRealizada is null, min(dm.fecha), max(FechaRealizada)) as fecha1, '+
       'min(dm.fecha) as fecha2, if(realizada=1,"SI", "NO") as realizada, dm.FechaRealizada, f1,f2,f3,f4, '+
       ''+UsuarioNombre('u')+' as tecnico, if(c.bloqueado = 1 , "BLOQUEADO", if( ad.total > 0, "ADEUDO", '+
       '"") ) as bloqueado From DetMantenimientos AS dm left join mantenimientos as m on dm.idmantenimiento='+
       'm.idmantenimiento left join clientes as c on c.idcliente=dm.idcliente left join usuarios as u on '+
       'u.idusuario=dm.idtecnico left join ( Select count(total) as total, idcliente from ( select count(*) '+
       'as total,tipocont, p.idcliente from  PagosClientes as pc  left join  pedidos as p on '+
       '(p.idpedido=pc.idpedido) left join clientes c on c.idcliente=p.idcliente where c.idcliente in ( '+
       'select idcliente from DetMantenimientos where idmantenimiento = '+eddesde.text+' ) and p.estatus '+
       'in(3,4,6) and p.saldado=0  and pc.movimiento in(0,1,4) and pc.restante > 0 and pc.FechaVence <= curdate() '+
       'group by p.idpedido ) as t group by idcliente ) as ad on ad.idcliente = dm.idcliente '+
       'where dm.idmantenimiento = '+eddesde.text+' group by idcliente order by tecnico, realizada, idcliente', 1, dmreportes.sqlgeneral);

OperacionReporte('ServiciosMantenimientos', 'Servicios de Mantenimientos', TipoImpresion, 1);
end;

procedure TfrmRepServicios.eddesdeButtonClick(Sender: TObject);
begin
case Reporte of
  1: begin
     with frmbusquedas do
       begin
       query:='select idmantenimiento,nombre,if(tipo=0,"Anual",if(tipo=1,"Semestral","Trimestral")) as Tipo,f1,f2,f3,f4,usuario,fecha,hora from mantenimientos order by idmantenimiento';
       campo_busqueda:='nombre';
       campo_retorno:='idmantenimiento';
       tabla:='';
       tblorigen := 'mantenimientos';
       ShowModal;
       if resultado <> '' then
         eddesde.text := resultado;
       end;
     end;
  end;
end;

procedure TfrmRepServicios.Servicios;
var cadena:string;
begin

  cadena := 'select sid as servicio, fecha_creacion as creacion, hora_creacion, FechaFinUsr as ffinal, c.idcliente as cuenta, '+
                ClienteNombre('c')+' as Nombre, problema,  codtecnico as tecnico, es.nombre, servicios.trab_realizado, '+
                'servicios.comentario, reportby as reporto,cs2.nombre as clasificacion from servicios left join clientes as c '+
                'on (servicios.idcliente = clientes.idcliente) left join EstatusServicios as es ON (es.orden=servicios.status) '+
                'left join TipoServicios as ts ON (ts.idserv=es.idserv) left join TipoServicios as tipos '+
                'on(tipos.nombre="CLASIFICAR SERVICIO") left join clasif_servicios as cs2 on(cs2.idserv=tipos.idserv and '+
                'cs2.orden=servicios.clasif) ';
  case rgrango3.ItemIndex of
    //Cuenta
    0: begin
      cadena := cadena +'where c.idcliente='+eddesde.Text+' ';

      if RgRango2.ItemIndex = 0 then
        cadena := cadena +'and fecha_creacion between "'+tpdesde.text+'" and "'+tphasta.text+'" ';
      cadena := cadena+'group by sid';
      end;

    //Tecnico
    1: begin
       end;
  
    //Fechas
    2: begin
       end;
  
    //Estatus
    3: begin
       end;
       
    //Problema
    4: begin
       end;
    end;//case
with dmreportes do
  begin
  querys(cadena, 0, sqlgeneral);
  case rgrango3.itemindex of
  0: begin
     if rgrango2.ItemIndex = 0 then
       querys('select '+quotedstr('LISTADO TOTAL')+' as inicio, '+quotedstr('LISTADO TOTAL')+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount , de.nombre as Empresa,' +
       ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc  from DatosEmpresa as de', 0, sqlgeneral2)
     else
      querys('select "'+TPdesde.text+'" as inicio, "'+TPhasta.text+'" as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount, de.nombre as Empresa,'+
       'concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc  from DatosEmpresa as de', 0, sqlgeneral2);
     OperacionReporte('ServiciosPorCliente','',TipoImpresion, 1);
     end;

 { 1: begin
         if Chfecha.Checked = false then
            querys('select idusuario, if(apaterno is NULL or apaterno='''', usuarios.nombre, if(amaterno is NULL or amaterno='''', concat(usuarios.nombre, '' '', apaterno), concat(usuarios.nombre, '' '', apaterno, '' '', amaterno))) as tecnombre, de.nombre as Empresa, '+
                   ' '+quotedstr('LISTADO TOTAL')+' as inicio, '+quotedstr('LISTADO TOTAL')+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount, '+
                   ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc  from usuarios  join DatosEmpresa as de where codigo2 = '+quotedstr(cbtecnico.text), 0, dmreportes.sqlgeneral2)
      else
       querys('select idusuario, if(apaterno is NULL or apaterno='''', usuarios.nombre, if(amaterno is NULL or amaterno='''', concat(usuarios.nombre, '' '', apaterno), concat(usuarios.nombre,'' '', apaterno,'' '',amaterno))) as tecnombre, de.nombre as Empresa, '+
             ''+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount, '+
             ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc  from usuarios join DatosEmpresa as de where codigo2 = '+quotedstr(cbtecnico.text), 0, dmreportes.sqlgeneral2);

     OperacionReporte('ServiciosTecnicos','',TipoImpresion, 1);
     end;

  2: begin
     if cbestatusf.Text = 'POR ATENDER' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Por Atender')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa, '+
               ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2);
     if cbestatusf.Text = 'FINALIZADOS' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Finalizados')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,' +
               ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     if cbestatusf.Text = 'CANCELADA' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Cancelados')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,' +
               ' concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     if cbestatusf.Text = 'TODOS' then
        querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr('Lista de Servicios Totales')+' as titulo, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,'+
               'concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de', 0, dmreportes.sqlgeneral2);
     //ImprimirReporte('ServiciosPorEstatus');
     OperacionReporte('ServiciosPorEstatus','',TipoImpresion, 1);
     end;

  3: begin
     if RBFecTodas.Checked = true then
       querys('select '+quotedstr('LISTADO TOTAL')+' as inicio, '+quotedstr('LISTADO TOTAL')+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa, '+
              ' concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2)
     else
      querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,'+
             'concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2);
     //ImprimirReporte('ServiciosPorClasificacion');
      OperacionReporte('ServiciosPorClasificacion2','',TipoImpresion, 1);
     end;
   4:begin

      querys('select '+quotedstr(datetostr(TPSdesde.Date))+' as inicio, '+quotedstr(datetostr(TPShasta.Date))+' as termino, '+quotedstr(inttostr(sqlgeneral.RecordCount))+' as rcount,de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' '' ,'' '',de.estado) as DirEmpresa,'+
             'concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc from DatosEmpresa as de ', 0, dmreportes.sqlgeneral2);

      OperacionReporte('ServiciosPorProblema','',TipoImpresion, 1);
     end; }
  end; 
  end; //with
end;

procedure TfrmRepServicios.rgRango2Click(Sender: TObject);
begin
case reporte of
  2: begin
     if rgrango2.ItemIndex = 0 then
       rgperiodo.Visible := False
     else
       rgperiodo.Visible := True;
     end;
  end;
end;

procedure TfrmRepServicios.RegenerarRepTicketsFinalizados;
var fecha1, fecha2:string;
i, dia, ano, mes:integer;
sqlgeneral:TMyQuery;
begin
sqlgeneral := tmyquery.Create(nil);
mes := idmes(cbdesde.text);
ano := strtoint(edhasta.text);
dia := DaysInAMonth(ano, mes);
sqlgeneral.Connection := dmaccesos.conexion;
fecha1 := datetostr(EncodeDate(ano,mes, 1));
fecha2 := datetostr(EncodeDate(ano,mes,dia));
// INSERTA LOS TECNICOS DEL MES //
querys('Delete from TicketsFinalizados where mes = '+inttostr(mes)+' and anio ='+inttostr(ano), 1, sqlgeneral);
querys('select CodTecnico from servicios where FechaFinUsr between "'+fecha1+'" and "'+fecha2+'" group by CodTecnico order by CodTecnico', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  if sqlgeneral.fieldbyname('CodTecnico').AsString <> '' then
    begin
    querys('select CodTecnico from TicketsFinalizados where CodTecnico="'+sqlgeneral.fieldbyname('CodTecnico').AsString+'" and anio=year("'+fecha1+'") and mes=month("'+fecha1+'")', 0, dmreportes.sqlgeneral7);
    if dmreportes.sqlgeneral7.RecordCount <= 0 then
       querys('Insert into TicketsFinalizados (anio, mes, CodTecnico) values (year("'+fecha1+'") , month("'+fecha1+'"), "'+sqlgeneral.fieldbyname('CodTecnico').AsString+'")', 1, dmreportes.sqlgeneral8);
    end;
  sqlgeneral.Next;
  end;

// inserta el tecnico Z para totales
querys('select CodTecnico from TicketsFinalizados where CodTecnico="Z" and anio=year("'+fecha2+'") and mes=month("'+fecha2+'")', 0, dmreportes.sqlgeneral7);
if dmreportes.sqlgeneral7.RecordCount <= 0 then
   querys('Insert into TicketsFinalizados (anio, mes, CodTecnico) values (year("'+fecha2+'") , month("'+fecha2+'"), "Z")', 1, dmreportes.sqlgeneral8);


// ACTUALIZA LOS TICKETS FINALIZADOS //
querys('Select max(d'+inttostr(dia)+') as d'+inttostr(dia)+', mes, anio from TicketsFinalizados where d'+inttostr(dia)+' = 0 and anio=year("'+fecha2+'") and mes=month("'+fecha2+'") group by mes', 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  for i:=1 to dia do
    begin
    fecha1 := datetostr(EncodeDate(ano,mes, i));
    querys('select FechaFinUsr, CodTecnico, count(distinct(sid)) as fin from servicios left join EstatusServicios as es ON (es.orden=servicios.status) where FechaFinUSr = "'+fecha1+'"  and es.nombre =  "FINALIZADA" group by CodTecnico, FechaFinUsr order by CodTecnico, FechaFinUsr', 0, sqlgeneral);
    sqlgeneral.first;
    while not sqlgeneral.EOF = true do
      begin
      querys('Update TicketsFinalizados set d'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('fin').AsString)+' where CodTecnico='+quotedstr(sqlgeneral.fieldbyname('CodTecnico').AsString)+' and anio=year("'+fecha2+'") and mes=month("'+fecha2+'")',1, dmreportes.sqlgeneral7);
      sqlgeneral.next;
      end; //while
    end;
  end; //if

for i:=1 to (dia) do
  begin
  querys('Select sum(d'+inttostr(i)+') as tot from TicketsFinalizados where anio=year("'+fecha2+'") and mes=month("'+fecha2+'") and CodTecnico <> ''Z'' ', 0, dmreportes.sqlgeneral5);
  querys('Update TicketsFinalizados set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral5.fieldbyname('tot').asstring)+' where anio=year("'+fecha2+'") and mes=month("'+fecha2+'") and CodTecnico=''Z'' ', 1, dmreportes.sqlgeneral6);
  end;

application.MessageBox('Termino de Actualizar', 'Atencion', MB_ICONINFORMATION);
{
querys('Select t.*, if(t.CodTecnico = "Z" , " ", t.CodTecnico) as CodTecnico, if(t.CodTecnico = "Z" , "TOTAL", '+
'usuarios.nombre) as tecnico from TicketsFinalizados as t left join usuarios on (usuarios.codigo2=t.CodTecnico) '+
'where t.anio=year("'+fecha2+'") and t.mes=month("'+fecha2+'") order by t.CodTecnico asc', 0, dmreportes.sqlgeneral3);
 }

end;

procedure TfrmRepServicios.ServiciosOxxo;
var condicion, titulo:string;
begin
if rgrango3.ItemIndex = 0 then
  begin
  condicion := ClienteNombre('c')+' LIKE "%OXXO%" and ';
  titulo := 'Servicios a OXXOS Anual';
  end
else
  begin
  condicion := '';
  titulo := 'Servicios a Clientes Anual';
  end;


if rgrango2.ItemIndex = 0 then
  begin
  querys('Select "'+titulo+'" as titulo, idcliente, nombre, sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, '+
         'sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum( M10) as M10, sum(M11) as M11, '+
         'sum(M12) as M12, sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) + sum(M7) +sum(M8) + '+
         'sum(M9) + sum(M10) + sum(M11) + sum(M12) as total, "'+edhasta.text+'" as anio from ( '+
         'SELECT distinct c.idcliente, '+ClienteNombre('c')+' as nombre, count(sid) as total, month(s.fecha_creacion) '+
         'as mes, if(month(s.fecha_creacion) = 1, count(sid) , 0) as M1, if(month(s.fecha_creacion) = 2, count(sid) , 0) as M2, '+
         'if(month(s.fecha_creacion) = 3, count(sid) , 0) as M3, if(month(s.fecha_creacion) = 4, count(sid) , 0) as M4, '+
         'if(month(s.fecha_creacion) = 5, count(sid) , 0) as M5, if(month(s.fecha_creacion) = 6, count(sid) , 0) as M6, '+
         'if(month(s.fecha_creacion) = 7, count(sid) , 0) as M7, if(month(s.fecha_creacion) = 8, count(sid) , 0) as M8, '+
         'if(month(s.fecha_creacion) = 9, count(sid) , 0) as M9, if(month(s.fecha_creacion) = 10, count(sid) , 0) as M10, '+
         'if(month(s.fecha_creacion) = 11, count(sid) , 0) as M11, if(month(s.fecha_creacion) = 12, count(sid) , 0) as M12 '+
         'FROM clientes c LEFT JOIN servicios s on s.idcliente=c.idcliente where '+condicion+
         'year(s.fecha_creacion) = '+edhasta.text+' and s.status <> 4 group by idcliente, mes ) as t group by idcliente order by total desc', 0, dmreportes.sqlgeneral);

  OperacionReporte('ServiciosOxxosAnual', 'Servicios a Oxxos Anual', TipoImpresion, 1);
  end
else
  begin
  querys('Select count(idcliente) as total from (Select distinct c.idcliente '+
         'from clientes c left join servicios s on s.idcliente=c.idcliente where '+ClienteNombre('c')+' like "%oxxo%" '+
         'and fecha_creacion between "'+tpdesde.Text+'" and "'+tphasta.Text+'" and s.status<>4) as t ', 0, sqlgeneral);

  querys('Select '+sqlgeneral.fieldbyname('total').AsString+' as total, c.idcliente, '+ClienteNombre('c')+' as nombre, '+
         'sid, fecha_creacion, problema, trab_realizado, "Del '+tpdesde.Text+' al '+tphasta.Text+'" as periodo '+
         'from clientes c left join servicios s on s.idcliente=c.idcliente where '+ClienteNombre('c')+' like "%oxxo%" '+
         'and fecha_creacion between "'+tpdesde.Text+'" and "'+tphasta.Text+'" and s.status<>4 order by idcliente, fecha_creacion', 0, dmreportes.sqlgeneral);
  OperacionReporte('ServiciosOxxos', titulo, TipoImpresion, 1);
  end;
end;

procedure TfrmRepServicios.CambioCodigo;
begin
querys('SELECT cc.idcliente, c.sector, '+ClienteNombre('c')+' as nombre, cc.idservicio, cc.CodTecnico, '+
       UsuarioNombre('u')+' as tecnico, cc.fechacambio from CambioCodigo as cc '+
       'left join clientes c on c.idcliente=cc.idcliente left join usuarios u on u.codigo=cc.CodTecnico '+
       'where cc.fechacambio between "'+tpdesde.Text+'" and "'+tphasta.Text+'"  '+
       'order by sector, fechacambio, idcliente', 0, DMREPORTES.sqlgeneral);
OperacionReporte('CambioCodigos', 'Cambios de Codigos', TipoImpresion, 1);

end;

End.
