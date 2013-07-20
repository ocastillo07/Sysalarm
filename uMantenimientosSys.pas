{//***************************************************************************//
2008/08/21 dalyla agregar que tenga pagos mayores a un  año
2008/04/24 dalyla cliente cambios
2008/02/14 dalyla correccion de lo de una año no haya problemas con idcliente igual
2008/02/28 dalyla zona horaria ok
2007/11/03  Que se pase el Det de pedidos y notas :'(
}//***************************************************************************//
unit uMantenimientosSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzButton, StdCtrls, Mask, RzEdit,
  RzDBEdit, RzLabel, ExtCtrls, RzPanel, RzRadGrp;

type
  TfrmMantenimientosSys = class(TForm)
    sqlgeneral: TMyQuery;
    sqlgeneral2: TMyQuery;
    btnpasar: TRzBitBtn;
    sqlgeneral3: TMyQuery;
    sqlgeneral1: TMyQuery;
    rglimite: TRzRadioGroup;
    RzLabel1: TRzLabel;
    edlimite: TRzEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnpasarClick(Sender: TObject);
    procedure edlimiteKeyPress(Sender: TObject; var Key: Char);
    procedure rglimiteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure PasaANoClientes(idnocliente, tablaOrigen, tablaDestino, idprimario, idvalor:string);
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmMantenimientosSys: TfrmMantenimientosSys;

implementation

uses Urecursos, Udm, Uprincipal, Umensaje;

{$R *.dfm}

procedure TfrmMantenimientosSys.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmMantenimientosSys.btnpasarClick(Sender: TObject);
var idcliente, idnocliente, cadena:string;
begin
frmmensaje.Show;
frmmensaje.Update;

{// hace una busqueda de las cuentas a liberar con las sig. condiciones
 mas de un año cancelado
 mas de dos años sin trafico
 que no este con abogado
}
Cursor := crHourGlass;
{cadena:='Select clientes.idcliente, max(fecha_pc) as fecha_pc from clientes left join alarmas '+
        'on(alarmas.idcliente=clientes.idcliente) where TipoCont = "CAN" and FechaCancelacion < '+
        'date_sub("'+datetostr(date)+'", interval 1 year) and idabogado = 0 group by clientes.idcliente having '+
        ' (fecha_pc < date_sub("'+datetostr(date)+'", interval 1 year) or fecha_pc is null ) order by '+
        'clientes.idcliente '; }

cadena:= 'Select c.idcliente, max(fecha_pc) as fecha_pc, max(pc.FechaAlta) as pagos from clientes c '+
         'left join alarmas a on a.idcliente=c.idcliente left join PagosClientes pc on pc.idcliente=c.idcliente '+
         'where TipoCont = "CAN" and FechaCancelacion < date_sub("'+datetostr(date)+'", interval 1 year) '+
         'and pc.FechaAlta < date_sub("'+datetostr(date)+'", interval 1 year) and idabogado = 0 group by c.idcliente '+
         'having (fecha_pc < date_sub("'+datetostr(date)+'", interval 1 year) or fecha_pc is null ) order by c.idcliente  ';

if edlimite.text <> '' then
  cadena:= cadena + ' limit '+edlimite.text;

querys(cadena, 0, sqlgeneral1);

sqlgeneral1.First;
while not sqlgeneral1.Eof = true do
  begin
  idcliente := sqlgeneral1.fieldbyname('idcliente').AsString;

  // Pasa al cliente a la Tabla de No Clientes
  querys('Select max(idnocliente) as idnocliente from NoClientes', 0, sqlgeneral);
  idnocliente := inttostr(sqlgeneral.fieldbyname('idnocliente').AsInteger + 1);
  querys('Update clientes set idnocliente='+quotedstr(idnocliente)+' where idcliente ='+quotedstr(idcliente), 1, sqlgeneral);

  PasaANoClientes(idnocliente, 'clientes', 'NoClientes','idcliente', idcliente );
  querys('Update NoClientes set FechaNoCliente="'+datetostr(date)+'" where idnocliente='+quotedstr(idnocliente), 1, sqlgeneral3);
  PasaANoClientes(idnocliente, 'ClientesFact', 'NoClientesFact','idcliente', idcliente );
  PasaANoClientes(idnocliente, 'DetClientes', 'NoDetClientes', 'idcliente' , idcliente);

  querys('Select idnc from NotasCredito where idcliente='+quotedstr(idcliente), 0, sqlgeneral3);
  if sqlgeneral3.recordcount > 0 then
    PasaANoClientes(idnocliente, 'DetNotasCredito', 'NoDetNotasCredito', 'idnc' , sqlgeneral3.fieldbyname('idnc').AsString);
  PasaANoClientes(idnocliente, 'NotasCredito', 'NoNotasCredito', 'idcliente' , idcliente);


  querys('Select idnota from clientes where idcliente='+quotedstr(idcliente), 0, sqlgeneral3);
  if sqlgeneral3.recordcount > 0 then
    PasaANoClientes(idnocliente, 'notas', 'NoNotas', 'idnota' , sqlgeneral3.fieldbyname('idnota').AsString);

  querys('Select idcontacto from clientes where idcliente='+quotedstr(idcliente), 0, sqlgeneral3);
  if sqlgeneral3.recordcount > 0 then
    PasaANoClientes(idnocliente, 'contactos', 'NoContactos', 'idcontacto' , sqlgeneral3.fieldbyname('idcontacto').AsString);

  querys('Select idpedido from pedidos where idcliente='+quotedstr(idcliente), 0, sqlgeneral3);
  if sqlgeneral3.recordcount > 0 then
    PasaANoClientes(idnocliente, 'DetPedido', 'NoDetPedido', 'idpedido' , sqlgeneral3.fieldbyname('idpedido').AsString);
  querys('Select idpedido from pedidos where idcliente='+quotedstr(idcliente), 0, sqlgeneral3);
  if sqlgeneral3.recordcount > 0 then
    PasaANoClientes(idnocliente, 'RemiFact', 'NoRemiFact', 'idpedido' , sqlgeneral3.fieldbyname('idpedido').AsString);
  PasaANoClientes(idnocliente, 'pedidos', 'NoPedidos', 'idcliente' , idcliente);


  PasaANoClientes(idnocliente, 'instalaciones', 'NoInstalaciones', 'idcliente' , idcliente);
  PasaANoClientes(idnocliente, 'PagosClientes', 'NoPagosClientes', 'idcliente' , idcliente);
  PasaANoClientes(idnocliente, 'servicios', 'NoServicios', 'idcliente' , idcliente);
  PasaANoClientes(idnocliente, 'cliente_zonas', 'NoCliente_zonas', 'cid' , idcliente);
  PasaANoClientes(idnocliente, 'cliente_usuarios', 'NoCliente_usuarios', 'iduc' , idcliente);      
  querys('Select idtel from clientes where idcliente='+quotedstr(idcliente), 0, sqlgeneral3);
  if sqlgeneral3.recordcount > 0 then
    PasaANoClientes(idnocliente, 'telefonos', 'NoTelefonos', 'idtel' , sqlgeneral3.fieldbyname('idtel').AsString);
  querys('Delete from AperturaCierre where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from DetMantenimientos where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from nota_ubicacion where cuenta = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from SolicitudesWeb where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from boletas where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from Cambios where (tabla = "clientes" or tabla = "cliente_zonas") and idprimario = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from alarmas where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Select id from sk_alarmas where idcliente='+quotedstr(idcliente), 1, sqlgeneral3);
  sqlgeneral3.First;
  while not sqlgeneral3.eof = true do
    begin
    querys('Delete from alarmas_detalle where aid = '+
            quotedstr(sqlgeneral3.fieldbyname('id').asstring), 1, sqlgeneral2);
    sqlgeneral3.Next;
    end;                    
  querys('Delete from sk_alarmas where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from open_close where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  querys('Delete from clientes where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  // querys('Delete from ConcentradoAbonosxCuenta where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  // querys('Delete from RepVentasMensuales where idcliente = '+quotedstr(idcliente), 1, sqlgeneral3);
  sqlgeneral1.Next;
  end;
Cursor := crDefault;
frmmensaje.Update;
frmmensaje.Close;
application.messagebox('Termino', 'Aviso', mb_iconinformation);
end;

procedure TfrmMantenimientosSys.PasaANoClientes(idnocliente, tablaOrigen, tablaDestino, idprimario, idvalor:string);
var i:integer;
llave:string;
begin            //SUPER PERFECTISIMO 
//PasaANoClientes(idnocliente, 'DetNotasCredito', 'NoDetNotasCredito', 'idnc' , sqlgeneral3.fieldbyname('idnc').AsString);
//Busca el campo llave de la tabla
querys('describe '+tablaOrigen, 0, sqlgeneral);
sqlgeneral.Locate('Key', 'PRI', []);
llave := sqlgeneral.fieldbyname('Field').AsString;
{else
  begin
  sqlgeneral.first;
  llave := sqlgeneral.fieldbyname('Field').AsString;
  end;}

querys('describe '+tablaDestino, 0, sqlgeneral2);
if sqlgeneral2.Locate('Field','idnocliente', []) = true then
  begin
  querys('Insert into '+tablaDestino+' ('+llave+', idnocliente) Select '+llave+', '+idnocliente+' from '+tablaOrigen+
         ' where '+idprimario+' ='+quotedstr(idvalor), 1, sqlgeneral);
  end
else
  //Inserta los campos llave
  querys('Insert into '+tablaDestino+' ('+llave+') Select '+llave+' from '+tablaOrigen+
         ' where '+idprimario+' ='+quotedstr(idvalor), 1, sqlgeneral);

//Busca los datos a insertar
querys('Select * from '+tablaOrigen+' where '+idprimario+'='+idvalor, 0, sqlgeneral);
for i:=0 to sqlgeneral.FieldCount-1 do
  begin
  if sqlgeneral.recordcount > 0 then
    begin
    querys('describe '+tablaDestino, 0, sqlgeneral2);
    {if sqlgeneral2.Locate('Field','idnocliente', []) = true then
      begin
      querys('Update '+tablaDestino+' set idnocliente = '+quotedstr(idnocliente)+' where '+
      llave+'='+quotedstr(sqlgeneral.Fieldbyname(llave).asvariant), 1, sqlgeneral2);
      end;}
    if sqlgeneral2.Locate('Field',sqlgeneral.Fields.Fields[i].fieldname, []) = true then
      begin
      sqlgeneral.First;
      while not sqlgeneral.Eof do
       begin
        if (idvalor <> null) and (sqlgeneral.Fields.Fields[i].asvariant <> null) then
         begin
         querys('describe '+tablaDestino, 0, sqlgeneral2);
         if sqlgeneral2.Locate('Field','idnocliente', []) = true then
           begin
           querys('Update '+tablaDestino+' set '+sqlgeneral.Fields.Fields[i].FieldName+' = '+
                   quotedstr(sqlgeneral.Fields.Fields[i].asstring)+' where '+
                   llave+'='+quotedstr(sqlgeneral.Fieldbyname(llave).asvariant)+' and idnocliente = '+idnocliente, 1, sqlgeneral2);
           end
         else
            querys('Update '+tablaDestino+' set '+sqlgeneral.Fields.Fields[i].FieldName+' = '+
                   quotedstr(sqlgeneral.Fields.Fields[i].asstring)+' where '+
                   llave+'='+quotedstr(sqlgeneral.Fieldbyname(llave).asvariant), 1, sqlgeneral2);


         end;
        sqlgeneral.Next;
       end;

     end;
    end;
  end;
  if tablaOrigen <> 'clientes' then
    querys('Delete from '+tablaOrigen+' where '+idprimario+' = '+quotedstr(idvalor), 1, sqlgeneral3);
end;

procedure TfrmMantenimientosSys.edlimiteKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key,true);
if key = #13 then
  btnpasar.OnClick(self);
end;

procedure TfrmMantenimientosSys.rglimiteClick(Sender: TObject);
begin
if rglimite.ItemIndex = 0 then
  begin
  edlimite.enabled := true;
  edlimite.setfocus;
  end
else
  begin
  edlimite.enabled :=  false;       
  end;
end;

procedure TfrmMantenimientosSys.FormShow(Sender: TObject);
begin
edlimite.setfocus;
end;

End.
