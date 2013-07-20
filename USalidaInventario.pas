{///////////////////////////////////////////////////////////////////////////////
2008/12/04 oscar fechadevolucion comunicadores 
2008/11/25 dalyla comunicadores
2008/11/25 dalyla seleccionar el articulo para dar salida, ya no mas jejej
2008/10/21 dalyla condicion para traer instalacion pedido en remi o fact
2008/10/10 dalyla inventariable
2008/10/08 dalyla correcion de disponible por requisiciones que sea tmb por  cod_cve
2008/06/25 dalyla cambios por inventario
2008/06/10 dalyla PERIMIYR DAR SALIDA SIN EXISTENCIAS    quitar cuando se deba
2008/06/05 dalyla setfocus
2008/05/21 dalyla resize
2008/02/28 dalyla zona horaria ok
Creado por Dalila Robledo Noviembre 2007
--------------------------------------------------------------------------------
NOTAS

En articulos agregar campo cotizados, minimo y maximo sugerido
Reporte de cercas de minimos
Costo promedio
Primero saldar por mercancia, despues por abono en cancelaciones
Sist. cargos automaticos. compras a credito
********************************************************************************
________________________________________________________________________________
Tablas afectadas                                Estatus Articulos
por inventario
________________________________________________________________________________
Articulos                                       Existencias     Estatus DetPed
Compras                                         Ordenados
DetCompras                                      Cotizados *
Pedido                                          Apartados        1
DetPedido                                       Instalacion      2
NotasCredito                                    Salidas          3
DetNotasCredito                                 BackOrder        4
AjusteInventario
CardexArticulos
}///////////////////////////////////////////////////////////////////////////////
unit USalidaInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, MemDS, DBAccess, MyAccess, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt,
  cxCheckBox, RzButton, cxCurrencyEdit, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDInputDlg, Menus, RzRadChk,
  ExtCtrls, RzPanel;

type
  TfrmSalidaInventario = class(TForm)
    edinstalacion: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    edpedido: TRzButtonEdit;
    VSalidas: TcxGridDBTableView;
    LSalidas: TcxGridLevel;
    GSalidas: TcxGrid;
    sqlsalidas: TMyQuery;
    DataSource1: TDataSource;
    colcant: TcxGridDBColumn;
    colclave: TcxGridDBColumn;
    colhoras: TcxGridDBColumn;
    coldesc: TcxGridDBColumn;
    btncerrar: TRzBitBtn;
    colcheck: TcxGridDBColumn;
    sqlgeneral: TMyQuery;
    edcuenta: TRzEdit;
    ednominst: TRzEdit;
    ednomfact: TRzEdit;
    edinst1: TRzEdit;
    edinst2: TRzEdit;
    edcadena: TRzEdit;
    RzLabel8: TRzLabel;
    edcant: TRzEdit;
    RzLabel9: TRzLabel;
    btneditar: TRzBitBtn;
    colsalida: TcxGridDBColumn;
    idlg: TLMDInputDlg;
    ckCancelar: TRzCheckBox;
    pabajo: TRzPanel;
    RzPanel1: TRzPanel;
    colbarras: TcxGridDBColumn;
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edinstalacionButtonClick(Sender: TObject);
    procedure edpedidoButtonClick(Sender: TObject);
    procedure edinstalacionKeyPress(Sender: TObject; var Key: Char);
    procedure edpedidoKeyPress(Sender: TObject; var Key: Char);
    procedure edcadenaChange(Sender: TObject);
    procedure btneditarClick(Sender: TObject);
    procedure edinstalacionChange(Sender: TObject);
    procedure edpedidoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    noserie, campobus : string;
    cant : array of integer;
    cod : array of string;
    { Private declarations }
    procedure buscarlocate;
    function capturar:boolean;
    procedure limpiar;
    procedure habilita(hab:Boolean);
    procedure CancelarSalida;
    procedure comunicador;
  public
    { Public declarations }
  end;

var
  frmSalidaInventario: TfrmSalidaInventario;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas, UBuscaArt;

{$R *.dfm}

procedure TfrmSalidaInventario.btncerrarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSalidaInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmSalidaInventario.edinstalacionButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='Select i.idpedido, idinstalacion, i.idcliente, instalador1, instalador2, FechaPromesa, FechaInicio, '+
         ''+ClienteNombre('c')+' as nombre from instalaciones as i left join clientes as c on c.idcliente=i.idcliente left join pedidos p '+
         'on p.idpedido=i.idpedido where i.estatus = 0 and p.estatus in(3,4) order by idpedido desc';
  campo_retorno:='idinstalacion';
  campo_busqueda:='idinstalacion';
  tblorigen := 'instalaciones';
  lbldesc.Caption:='Busqueda por Idinstalacion:';
  ShowModal;
  if resultado <> '' then
     begin
     edinstalacion.Text := resultado;
     querys('select idpedido from pedidos where idinstal ='+resultado, 0, sqlgeneral);
     edpedido.Text := sqlgeneral.fieldbyname('idpedido').AsString;
     buscarlocate;
     end;
  end;
end;

procedure TfrmSalidaInventario.edpedidoButtonClick(Sender: TObject);
begin
with frmbusquedas do
  begin
  query:='Select i.idpedido, idinstalacion, i.idcliente, instalador1, instalador2, FechaPromesa, FechaInicio, '+
         'c.nombre from instalaciones as i left join clientes as c on c.idcliente=i.idcliente where i.estatus = 0';
  campo_retorno:='idpedido';
  campo_busqueda:='idpedido';
  tblorigen := 'pedidos';
  lbldesc.Caption:='Busqueda por idpedido:';
  ShowModal;
  if resultado <> '' then
     begin
     edpedido.Text := resultado;
     querys('select idinstal from pedidos where idpedido ='+resultado, 0, sqlgeneral);
     edinstalacion.Text := sqlgeneral.fieldbyname('idinstal').AsString;
     buscarlocate;
     end;
  end;
end;

procedure TfrmSalidaInventario.buscarlocate;
var i:integer;
begin
querys('Select i.idpedido, i.idinstalacion, i.idcliente, concat(instalador1, " ", '+UsuarioNombre('u1')+') as instalador1, '+
       'concat(instalador2, " ", '+UsuarioNombre('u2')+') as instalador2, '+ClienteNombre('c')+' as nombre, '+
       ClienteNombre('cf')+' as nombrefact from instalaciones as i left join clientes as c on c.idcliente=i.idcliente '+
       'left join ClientesFact as cf on c.idfact=cf.idfact left join usuarios as u1 on u1.codigo=instalador1 left join '+
       'usuarios as u2 on u2.codigo=instalador2 where i.idpedido = '+edpedido.Text, 0, sqlgeneral);
edinstalacion.text := sqlgeneral.fieldbyname('idinstalacion').AsString;
edcuenta.Text := sqlgeneral.fieldbyname('idcliente').AsString;
ednominst.Text := sqlgeneral.fieldbyname('nombre').AsString;
ednomfact.Text := sqlgeneral.fieldbyname('nombrefact').AsString;
edinst1.Text := sqlgeneral.fieldbyname('instalador1').AsString;
edinst2.Text := sqlgeneral.fieldbyname('instalador2').AsString;

sqlsalidas.Close;
sqlsalidas.ParamByName('pedido').AsString :=  edpedido.Text;
sqlsalidas.Open;
{querys('Select dp.cant, dp.cod_cve, a.nombre, round(dp.cant*a.tinstalacionCom,2) as tinstalacionCom, idlinea, dp.estatus from DetPedido as '+
       'dp left join articulos as a on dp.cod_cve=a.cod_cve where dp.idpedido='+edpedido.Text, 0, sqlsalidas);}
i:=0;
sqlsalidas.First;
while not sqlsalidas.Eof = true do
  begin
  SetLength(cant, sqlsalidas.RecordCount);
  SetLength(cod, sqlsalidas.RecordCount);
  cod[i] := sqlsalidas.fieldbyname('cod_cve').AsString;
  cant[i] := sqlsalidas.fieldbyname('cant').AsInteger;
  inc(i);
  sqlsalidas.Next;
  end;
end;

procedure TfrmSalidaInventario.edinstalacionKeyPress(Sender: TObject;
  var Key: Char);
begin
key := Validanumeros(key, true);
if key = #13 then
  begin
  if edinstalacion.Text = '' then
    edinstalacion.OnButtonClick(Self)
  else
    begin
    querys('select idpedido from pedidos where idinstal ='+edinstalacion.Text+' and estatus in(3,4)', 0, sqlgeneral);
    edpedido.Text := sqlgeneral.fieldbyname('idpedido').AsString;
    buscarlocate;
    end;
  end;
end;

procedure TfrmSalidaInventario.edpedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
key := Validanumeros(key, true);
if key = #13 then
  if edpedido.Text = '' then
    edpedido.OnButtonClick(self)
  else
    buscarlocate;
end;

procedure TfrmSalidaInventario.edcadenaChange(Sender: TObject);
var  ant:string;   //    idnota,resta :integer;        , act
begin
//0=No surtido, 1=Surtido Completo, 2=Surtido incompleto con backorder, 3=cancelado
if edcadena.text = '' then
  exit;

//Cancela la salida del articulo digitado
if (ckcancelar.Checked = true) and (sqlsalidas.Locate(campobus, edcadena.Text, []) = true) then
  begin
  cancelarsalida;
  exit;
  end;

if sqlsalidas.Locate(campobus, edcadena.Text, []) = true then
  begin
  if (sqlsalidas.FieldByName('cant').AsInteger-sqlsalidas.FieldByName('cant_salida').AsInteger) = 0 then
    exit;
  edcadena.text := sqlsalidas.fieldbyname('cod_cve').AsString;
  ant := sqlsalidas.FieldByName('cod_cve').AsString;

  if sqlsalidas.FieldByName('cant').AsInteger <> 1 then
    begin
    edcant.text := '0';
    edcant.Text := idlg.InputBox('Cantidad de Articulos', 'Cantidad:', inttostr(sqlsalidas.FieldByName('cant').AsInteger-sqlsalidas.FieldByName('cant_salida').AsInteger));

    if idlg.Value = '' then
      exit;

    if (edcant.Text = '0') or (edcant.Text = '') then
      exit;

    if strtoint(edcant.Text) < (sqlsalidas.FieldByName('cant').AsInteger - sqlsalidas.FieldByName('cant_salida').Asinteger) then
      begin
      //if capturar = true then
      capturar;
      exit;
      end; //cant.text < cant

    //if strtoint(edcant.Text) > sqlsalidas.FieldByName('cant_salida').Asinteger then
    if strtoint(edcant.Text) > (sqlsalidas.FieldByName('cant').AsInteger - sqlsalidas.FieldByName('cant_salida').Asinteger) then
      begin
      application.MessageBox('La cantidad no puede ser mayor a la del pedido', 'Atencion', MB_ICONEXCLAMATION);
      edcadena.SetFocus;
      exit;
      end;

    if strtoint(edcant.Text) = (sqlsalidas.FieldByName('cant').AsInteger - sqlsalidas.FieldByName('cant_salida').Asinteger) then
      begin
      capturar;
      exit;
      end;
    end
  else  //cant = 1
    begin
    edcant.text := '1';
    capturar;
    end;
  end; //locate;
end;

function TfrmSalidaInventario.capturar:boolean;
var resta:integer;
begin
result := false;
///////////////comunicador
if edcadena.text = 'INSTCOMUNICADOR' then
  comunicador
else
  begin
///////////////comunicador

querys('Select d.cod_cve, (d.cant-d.cant_salida) - (r.cantidad-r.surtido) as salida from DetPedido d left join requisiciones r '+
       'on d.idpedido=r.iddoc and d.cod_cve=r.cod_cve where d.idpedido ='+edpedido.text+' and d.cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+'"', 0, sqlgeneral);

if sqlgeneral.fieldbyname('salida').AsString <> '' then
  if sqlgeneral.fieldbyname('salida').AsInteger < strtoint(edcant.text) then
    begin
    application.MessageBox(pchar('No se cuenta con la mercancia disponible para este articulo y esta instalacion.'+char(#13)+
                          'Articulos Disponibles: '+sqlgeneral.fieldbyname('salida').AsString), 'Atencion', MB_ICONINFORMATION);
    edcant.Text := '';
    edcadena.text := '';
    sqlsalidas.Close;
    sqlsalidas.ParamByName('pedido').AsString :=  edpedido.Text;
    sqlsalidas.Open;
    exit;
    end;


querys('Select instalacion, existencia from articulos where cod_cve = "'+sqlsalidas.FieldByName('cod_cve').AsString+'"', 0, sqlgeneral);

resta := sqlgeneral.FieldByName('instalacion').asinteger - strtoint(edcant.text);
if resta >= 0 then
  begin
  querys('Update DetPedido set estatus = 2, cant_salida=cant_salida+'+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where idpedido = '+edpedido.text+' and cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+'"',1, sqlgeneral);
  querys('Update articulos set instalacion = instalacion - '+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+'" and inventariable = 1',1, sqlgeneral);
  querys('Update articulos set instalacion = 0 where cod_cve="'+edcadena.text+'" and instalacion < 0',1, sqlgeneral);
  end
else
  begin
  {resta := sqlgeneral.FieldByName('existencia').asinteger - strtoint(edcant.text);
  if resta >= 0 then
    begin}
    querys('Update DetPedido set estatus = 2, cant_salida=cant_salida+'+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where idpedido = '+edpedido.text+' and cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+'"',1, sqlgeneral);
    querys('Update articulos set existencia=existencia - '+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+' and inventariable = 1"',1, sqlgeneral)
{    end
  else
    begin
    application.MessageBox('No hay existencias del articulo', 'Atencion', MB_ICONEXCLAMATION);
    result := true;
    end;}
  end;

querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) values ("'+sqlsalidas.FieldByName('cod_cve').AsString+
       '","S",16,"'+datetostr(date)+'",'+edpedido.Text+','+edcant.text+',0,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
       '","'+FormatDateTime('HH:mm:ss',Time)+'", "Salida de Inventario de la Instalacion '+edinstalacion.Text+'")',1,sqlgeneral);
end;
edcant.Text := '';
edcadena.text := '';
sqlsalidas.Close;
sqlsalidas.ParamByName('pedido').AsString :=  edpedido.Text;
sqlsalidas.Open;
end;

procedure TfrmSalidaInventario.habilita(hab:Boolean);
begin
edcant.Enabled := hab;
edcadena.Enabled := hab;
gsalidas.Enabled := hab;
if hab = true then
  begin
  edinstalacion.Enabled := false;
  edpedido.Enabled := false;
  end
else
  begin
  edinstalacion.Enabled := true;
  edpedido.Enabled := true;
  end;
end;

procedure TfrmSalidaInventario.btneditarClick(Sender: TObject);
begin
if btneditar.Caption = '&Editar' then
  begin
  habilita(true);
  btneditar.Caption := '&Finalizar';
  edcadena.setfocus;
  end
else
  begin
  //que el dpto no sea descuento, sea equipo y sean salidas
  if querys('Select cant_salida from DetPedido as d left join articulos as a on a.cod_cve=d.cod_cve where idpedido='+
            edpedido.Text+' and cant_salida = 0 and idlinea=4 and iddpto <> 30', 0, sqlgeneral) = 0 then
    begin
    querys('update instalaciones set SalidaInventario="1",FechaSalidaInventario="'+datetostr(date)+'",UsuarioSalidaInventario="'+
            CodigoUsuario(frmprincipal.ucprincipal.CurrentUser.UserID)+'" where idinstalacion='+
            edinstalacion.text, 1, sqlgeneral);
    end
  else
    begin
    //querys('Select from', 0, sqlgeneral)
    end;
  habilita(false);
  btneditar.Caption := '&Editar';
  edinstalacion.Text := '';
  edinstalacion.setfocus;
  end;
end;

procedure TfrmSalidaInventario.edinstalacionChange(Sender: TObject);
begin
if edinstalacion.Text = '' then
  limpiar;
end;

procedure TfrmSalidaInventario.edpedidoChange(Sender: TObject);
begin
if edpedido.Text = '' then
  limpiar;
end;

procedure TfrmSalidaInventario.limpiar;
begin
edcuenta.Text := '';
edinst1.Text := '';
edinst2.Text := '';
ednominst.Text := '';
ednomfact.Text := '';
edcant.Text := '';
edcadena.Text := '';
edinstalacion.Text := '';
edpedido.Text := '';
sqlsalidas.Close;
end;

procedure TfrmSalidaInventario.FormCreate(Sender: TObject);
begin
campobus :=  'cod_barras';
end;

procedure TfrmSalidaInventario.CancelarSalida;
begin
if application.MessageBox(pchar('Estas seguro de cancelar la Salida del articulo "'+
  sqlsalidas.FieldByName('cod_cve').AsString+'"'), 'Pregunta', MB_ICONQUESTION+MB_YESNO) = idyes then
  begin
  edcant.text := sqlsalidas.fieldbyname('cant_salida').AsString;
  querys('Update DetPedido set estatus = 0, cant_salida=cant_salida-'+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where idpedido = '+edpedido.text+' and cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+'"',1, sqlgeneral);
  querys('Update articulos set instalacion=instalacion + '+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where cod_cve="'+sqlsalidas.FieldByName('cod_cve').AsString+'" and inventariable = 1',1, sqlgeneral);
  querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) values ("'+sqlsalidas.FieldByName('cod_cve').AsString+
       '","E",44,"'+datetostr(date)+'",'+edpedido.Text+','+edcant.text+',0,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
       '","'+FormatDateTime('HH:mm:ss',Time)+'", "Cancelacion de Salida de Inventario de la Instalacion '+edinstalacion.Text+'")',1,sqlgeneral);
///////////////comunicador    oscar
if sqlsalidas.FieldByName('cod_cve').AsString = 'INSTCOMUNICADOR' then
  begin
  querys('Update rentascom set noserie = "0", concliente = 0, FechaDevolucion = "0000-00-00", '+
         'usuario ="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", '+
         'hora="'+FormatDateTime('HH:mm:ss',Time)+'" where idcliente = '+edcuenta.text+'', 1, sqlgeneral);

    querys('update comunicadores set ultimaEntrada = "0000-00-00", disponible =  1, usuario="'+
             frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora = "'+
             FormatDateTime('HH:mm:ss',Time)+'" where noserie ="'+noserie+'"', 1, sqlgeneral);
    frmprincipal.ucprincipal.Log('Dio cancelo salida al comunicador '+noserie, 2);
    frmprincipal.ucprincipal.Log('Se removio la asignacion del comunicador '+noserie+' al cliente '+edcuenta.text, 1);
  end;
///////////////comunicador    oscar
  edcant.Text := '';
  edcadena.text := '';
  sqlsalidas.Close;
  sqlsalidas.ParamByName('pedido').AsString :=  edpedido.Text;
  sqlsalidas.Open;

  ckcancelar.Checked := false;
 end;
end;

///////////////comunicador      oscar
procedure TfrmSalidaInventario.comunicador;
begin
noserie := idlg.InputBox('Renta de Comunicador', 'Numero de Serie:', noserie);
if noserie = '' then
  begin
  application.MessageBox('No fue realizada la asignacion del comunicador', 'Renta de Comunicador', MB_ICONEXCLAMATION);
  exit;
  end;
 querys('Update rentascom set noserie = "'+noserie+'", concliente = 1, FechaDevolucion = "'+datetostr(date)+'", '+
          'usuario ="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", '+
          'hora="'+FormatDateTime('HH:mm:ss',Time)+'" where idcliente='+edcuenta.text+' and fecharenta>="'+datetostr(date)+'"',1,sqlgeneral);

  querys('update comunicadores set ultimaEntrada = "'+datetostr(date)+'", disponible =  0, usuario="'+
           frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora = "'+
           FormatDateTime('HH:mm:ss',Time)+'" where noserie ="'+noserie+'"', 1, sqlgeneral);

  //actualiza articulos
  querys('Update DetPedido set estatus = 2, cant_salida=cant_salida+'+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where idpedido = '+edpedido.text+' and cod_cve="'+edcadena.text+'"',1, sqlgeneral);
  querys('Update articulos set instalacion = instalacion - '+edcant.text+', usuario = "'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha = "'+datetostr(date)+'", hora="'+timetostr(time)+'" where cod_cve="'+edcadena.text+'"',1, sqlgeneral);
  querys('Update articulos set instalacion = 0 where cod_cve="'+edcadena.text+'" and instalacion < 0',1, sqlgeneral);

  querys('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) values ("'+edcadena.text+
       '","S",16,"'+datetostr(date)+'",'+edpedido.Text+','+edcant.text+',0,"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
       '","'+FormatDateTime('HH:mm:ss',Time)+'", "Salida de Inventario de la Instalacion '+edinstalacion.Text+'")',1,sqlgeneral);

  frmprincipal.ucprincipal.Log('Dio salida al comunicador '+noserie, 2);
  application.MessageBox('Se asigno exitosamente el numero de serie', 'Renta de Comunicador', MB_ICONINFORMATION);
  frmprincipal.ucprincipal.Log('Se asigno el comunicador '+noserie+' al cliente '+edcuenta.text, 1);

end;

End.
