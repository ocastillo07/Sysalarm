{///////////////////////////////////////////////////////////////////////////////
2010/09/24 Oscar modificacion del reporte de notasbonificaciones, en el iddoc considerar el pedido no idcliente
2010/05/12 dalyla onclose querys('Drop table if exists tmpTravUsuarios'+frmprincipal.idmaq,1, dmaccesos.sqlgeneral);
2009/02/10 dalyla reprote de notas
}///////////////////////////////////////////////////////////////////////////////
unit URepRecHumanos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzButton, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, DateUtils, RzBtnEdt;

type
  TfrmRepRecHumanos = class(TForm)
    rgbusqueda: TRzGroupBox;
    btnImprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    cbTipoImpresion: TRzComboBox;
    rgcombo: TRzGroupBox;
    cbarea: TRzComboBox;
    rgPeriodo: TRzGroupBox;
    tpdesde: TRzDateTimeEdit;
    tphasta: TRzDateTimeEdit;
    ldesde: TRzLabel;
    lhasta: TRzLabel;
    edanio: TRzEdit;
    edclave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    procedure btnImprimirClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbareaNotInList(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
  private
    Tipoimpresion:string;
    procedure TravelersQuejas;
    procedure TravelerUsuarios;
    procedure LogUsuarios;
    procedure NotasUsuarios;
    procedure NotasUsuariosBon;
    { Private declarations }
  public
    Reporte:Integer;
    procedure inicializa;
    { Public declarations }
  end;

var
  frmRepRecHumanos: TfrmRepRecHumanos;

implementation

uses Ureportes, Urecursos, Uprincipal, Udm, Udmrep, Ubusquedas;

{$R *.dfm}

procedure TfrmRepRecHumanos.inicializa;
begin
Self.height := 200;
self.Width := 390;

case Reporte of
   1: begin   //Travelers Quejas
      rgperiodo.Visible := true;
      tpdesde.Visible := false;
      tphasta.Visible := false;
      edanio.Visible := true;
      lhasta.Visible := false;
      ldesde.Caption := 'Año:';
      rgperiodo.height := 45;
      edanio.text := inttostr(yearof(today));
      cbtipoimpresion.Top := 8;
      cbtipoimpresion.Left := 205;
      btnImprimir.Top := 40;
      btnImprimir.Left := 205;
      btncerrar.Top := 96;
      btncerrar.Left := 205;
      end;

   2: begin   //Travelers Usuarios
      rgperiodo.visible := true;
      tpdesde.Date := EncodeDate(yearof(today), monthof(today), 1);
      tphasta.Date := today;
      rgcombo.Visible := true;
      cargacombo2('Select idarea, nombre from areas order by nombre', 'nombre', 'idarea', cbarea);
      cbarea.Items.Insert(0, 'TODAS');
      cbarea.ItemIndex := 0;
      cbtipoimpresion.Top := 8;
      cbtipoimpresion.Left := 205;
      btnImprimir.Top := 40;
      btnImprimir.Left := 205;
      btncerrar.Top := 96;
      btncerrar.Left := 205;
      end;

   3: begin    //log usuarios
      rgbusqueda.visible := true;
      rgperiodo.Visible := true;
      tpdesde.Date := PrimeroMesActual;
      tphasta.Date := today;
      end;

   4: begin    //notas usuarios
      rgbusqueda.visible := true;
      rgperiodo.Visible := true;
      tpdesde.Date := PrimeroMesActual;
      tphasta.Date := today;
      end;

   5: begin    //notas usuarios  bonificacion
      rgbusqueda.visible := true;
      rgperiodo.Visible := true;
      tpdesde.Date := PrimeroMesActual;
      tphasta.Date := today;
      end;
   end;

end;

procedure TfrmRepRecHumanos.btnImprimirClick(Sender: TObject);
begin
case Reporte of
   1: TravelersQuejas;
   2: TravelerUsuarios;
   3: LogUsuarios;
   4: NotasUsuarios;
   5: NotasUsuariosBon;
   end;
end;

procedure TfrmRepRecHumanos.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmRepRecHumanos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('Drop table if exists tmpTravUsuarios'+frmprincipal.idmaq,1, dmaccesos.sqlgeneral);
action := cafree;
end;

procedure TfrmRepRecHumanos.cbTipoImpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmRepRecHumanos.FormShow(Sender: TObject);
begin
TipoImpresion := cbTipoImpresion.Value;
end;

procedure TfrmRepRecHumanos.cbareaNotInList(Sender: TObject);
begin
cbarea.ItemIndex := 0;
end;

procedure TfrmRepRecHumanos.TravelersQuejas;
var i:Integer;
begin

querys('Drop table if exists tmpTravUsuarios'+frmprincipal.idmaq,1, dmaccesos.sqlgeneral);
querys('create table tmpTravUsuarios'+frmprincipal.idmaq+' (idusuario int(11), TOTAL int(11) default 0, M1 int(11) default 0, '+
       'M2 int(11) default 0, M3  int(11) default 0, M4  int(11) default 0, M5 int(11) default 0, M6 int(11) default 0, '+
       'M7 int(11) default 0, M8 int(11) default 0, M9 int(11) default 0, M10 int(11) default 0, M11 int(11) default 0, '+
       'M12 int(11) default 0 )',1, dmaccesos.sqlgeneral);
querys('Insert into tmpTravUsuarios'+frmprincipal.idmaq+' (idusuario) Select idusuario  from usuarios where estatus = 1',1, dmaccesos.sqlgeneral);

for i:=1 to 12 do
  begin
  if querys('Select count(idtravel) as t, u.idusuario from travel as t left join usuarios as u on u.idusuario=t.idusra where '+
         'u.idusuario=t.idusra and year(t.FechaRecive) = '+edanio.text+' and month(t.FechaRecive) ='+inttostr(i)+
         ' and u.estatus = 1 and idasunto in (3,16) group by u.idusuario',0, dmaccesos.sqlgeneral) > 0 then
    begin
    dmaccesos.sqlgeneral.First;
    while not dmaccesos.sqlgeneral.eof = true do
      begin
      querys('Update tmpTravUsuarios'+frmprincipal.idmaq+' set M'+inttostr(i)+' = '+dmaccesos.sqlgeneral.fieldbyname('t').AsString+
             ' where idusuario='+dmaccesos.sqlgeneral.fieldbyname('idusuario').asstring, 1, dmreportes.sqlgeneral5);
      dmaccesos.sqlgeneral.Next;
      end;
    end;
  end;
querys('update tmpTravUsuarios'+frmprincipal.idmaq+' set TOTAL= M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, dmaccesos.sqlgeneral);
querys('Delete from tmpTravUsuarios'+frmprincipal.idmaq+' where TOTAL= 0', 1, dmaccesos.sqlgeneral);
querys('select '+UsuarioNombre('u')+' as nombre, u.codigo, t.* , a.nombre as area, "AÑO DE '+edanio.text+'" as periodo from tmpTravUsuarios'+frmprincipal.idmaq+' as t left join usuarios as u on '+
       'u.idusuario = t.idusuario left join areas as a on u.idarea=a.idarea order by a.nombre, total desc', 0, dmreportes.sqlgeneral);
OperacionReporte('TravelersUsuarios', 'Travelers por Usuario', 'IMP', 1);
//por quejas
end;

procedure TfrmRepRecHumanos.TravelerUsuarios;
var cadena, idarea:string;
begin

querys('Select idarea from areas where nombre = "'+cbarea.Text+'"', 0, dmaccesos.sqlgeneral);
idarea := dmaccesos.sqlgeneral.fieldbyname('idarea').AsString;
cadena := 'Select "De '+tpdesde.Text+' a '+tphasta.Text+'" as periodo, u.codigo, '+usuarionombre('u')+' as nombre, u.idusuario, idcliente, count(idcliente) as total, a.nombre as area, '+ClienteNombre('c')+
          ' as cliente from travel t left join usuarios u on t.idusra = u.idusuario left join clientes c using(idcliente) '+
          'left join areas a using (idarea) where ';
if cbarea.ItemIndex <> 0 then
  cadena := cadena + 'u.idarea = '+idarea+' and ';

cadena := cadena + 'FechaRecive between "'+tpdesde.Text+'" and "'+tphasta.Text+'" group by u.idusuario, t.idcliente '+
          'order by area, nombre, idcliente desc';
querys(cadena, 0, dmreportes.sqlgeneral);

OperacionReporte('TravelerUsuarios', 'Travelers por Usuario', TipoImpresion, 1);  
end;

procedure TfrmRepRecHumanos.edclaveButtonClick(Sender: TObject);
begin
  with frmbusquedas do
    begin
    query:='Select u.idusuario, u.codigo, '+UsuarioNombre('u')+' as nombre, a.nombre as Area, p.nombre as Puesto, '+
           'if(u.estatus = 0, "INACTIVO", "ACTIVO") as estatus From usuarios u left join areas a on a.idarea = '+
           'u.idarea left join puestos p on p.idpuesto=u.idpuesto order by nombre';
    campo_retorno:='idusuario';
    campo_busqueda:='nombre';
    tblorigen := 'usuarios';
    ShowModal;
    if resultado <> '' then
      edclave.Text:=resultado;
    end;
end;

procedure TfrmRepRecHumanos.LogUsuarios;
begin
if querys('Select '+Usuarionombre('u')+' as nombre, u.codigo, date_format(l.Data, "%Y/%m/%d  %r") as fecha,  MSG, '+
       'a.nombre as area, p.nombre as puesto from usuarios u left join UCLog l on IdUser = u.idusuario left join '+
       'areas a on a.idarea=u.idarea left join puestos p on p.idpuesto=u.idpuesto where u.idusuario = '+edclave.text+
       ' and Data between date_format("'+tpdesde.text+'", "%Y%m%d")  and date_format(date_add("'+tphasta.text+
       '", interval 1 day), "%Y%m%d")', 0, dmreportes.sqlgeneral) > 0 then

OperacionReporte('UsuariosLog', 'Log del(a) usuario '+dmreportes.sqlgeneral.fieldbyname('nombre').asstring, tipoimpresion,1)
  else
    application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION)
end;

procedure TfrmRepRecHumanos.NotasUsuarios;
begin
querys('SELECT '+Usuarionombre('u')+' as nombre, u.codigo, n.idnota, n.TipoNota, n.nota, n.idusuario, n.fecha, '+
       'n.hora, n.procedencia, n.id, n.iddoc '+
       'FROM notas AS n Left join usuarios u on u.idusuario=n.idusuario '+
       'WHERE n.idusuario =  '+edclave.text+' AND n.fecha BETWEEN  "'+tpdesde.text+'" AND "'+tphasta.text+'" '+
       'ORDER BY n.TipoNota, n.idnota', 0, dmreportes.sqlgeneral);
OperacionReporte('NotasUsuario', 'Notas del(a) usuario '+dmreportes.sqlgeneral.fieldbyname('nombre').asstring, tipoimpresion,1)
end;

procedure TfrmRepRecHumanos.NotasUsuariosBon;
var cadena,titulo, cad2:string;
begin
  {cadena:= 'SELECT '+Usuarionombre('u')+' as nombre, u.codigo, n.idnota, n.TipoNota, n.nota, n.idusuario, pc.notas, '+
           'n.procedencia, n.id, n.iddoc, pc.idpago, pc.abono, pc.idpedido '+
           'FROM notas AS n Left join usuarios u on u.idusuario=n.idusuario '+
           'Left join clientes c on c.idcliente=n.iddoc Left join PagosClientes pc on pc.idcliente=c.idcliente '+
           'and pc.movimiento=11 and pc.fecha=n.fecha '+
           'and ((n.hora = pc.hora) or (ADDTIME(n.hora, "00:00:01") =  ADDTIME(pc.hora, "00:00:01"))) '+
           'WHERE n.TipoNota = "BONIFICACIONES" AND n.fecha BETWEEN "'+tpdesde.text+'" AND "'+tphasta.text+'" ';    }
  cadena:='SELECT p.idcliente,'+Usuarionombre('u')+' as nombre, u.codigo, n.idnota, n.TipoNota, n.nota, n.idusuario, pc.notas, '+
           'n.procedencia, n.id, n.iddoc, pc.idpago, pc.abono, pc.idpedido '+
           ' FROM notas AS n           '+
           ' Left join usuarios u on u.idusuario=n.idusuario'+
           ' Left join pedidos p on p.idpedido=n.iddoc '+
           ' Left join PagosClientes pc on pc.idpedido=p.idpedido and pc.movimiento=11 '+
           ' WHERE n.TipoNota = "BONIFICACIONES" AND n.fecha BETWEEN "'+tpdesde.text+'" AND "'+tphasta.text+'" ';

  if edclave.Text <> '' then
    cad2 :=  ' and u.idusuario = '+edclave.text;

  querys(cadena + cad2 + ' ORDER BY u.codigo,pc.notas, n.idnota', 0, dmreportes.sqlgeneral);

  if edclave.Text <> '' then
    titulo := 'Notas del(a) usuario '+dmreportes.sqlgeneral.fieldbyname('nombre').asstring
  else
    titulo := 'Notas de Todos los Usuarios';
    
  //resumen
  cadena:='SELECT nombre,codigo,notas,count(idcliente) as cuentas,sum(pedidos) as pedidos, round(sum(abono),2) as abono from ('+
         ' SELECT u.idusuario,p.idcliente,u.codigo,u.nombre as nombre,pc.notas,count(p.idpedido) as pedidos,round(sum(pc.abono),2) as abono '+
         ' FROM notas AS n Left join usuarios u on u.idusuario=n.idusuario'+
         ' Left join pedidos p on p.idpedido=n.iddoc Left join PagosClientes pc on pc.idpedido=p.idpedido and pc.movimiento=11 '+
         ' WHERE n.TipoNota = "BONIFICACIONES" AND n.fecha BETWEEN "'+tpdesde.text+'" AND "'+tphasta.text+'" ';

  cadena := cadena + cad2 + ' group by p.idcliente,u.idusuario,pc.notas) as t group by idusuario,notas ORDER BY codigo,notas';

  querys(cadena,0,dmreportes.sqlgeneral2);

  OperacionReporte('NotasUsuarioBon', titulo, Tipoimpresion, 1);
end;


End.
