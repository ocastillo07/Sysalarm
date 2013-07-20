{///////////////////////////////////////////////////////////////////////////////
2012/04/13 dalyla se cambio el mensaje de inicializa
}///////////////////////////////////////////////////////////////////////////////
unit UBuscarServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzPanel, RzRadGrp, StdCtrls, Mask, RzEdit,
  RzButton, RzCmboBx, ExtCtrls, RzSplit, MemDS, DBAccess, MyAccess,
  RzBtnEdt;

type
  TfrmBuscarServ = class(TForm)
    splitter1: TRzSplitter;
    cbotipo: TRzComboBox;
    rgestatus: TRzRadioGroup;
    cxGrid1: TcxGrid;
    DBGVista2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    btncancelar: TRzBitBtn;
    sqlrejilla: TMyQuery;
    DSrejilla: TDataSource;
    edbuscar: TRzButtonEdit;
    columna1: TcxGridDBColumn;
    columna2: TcxGridDBColumn;
    columna3: TcxGridDBColumn;
    columna4: TcxGridDBColumn;
    columan5: TcxGridDBColumn;
    columna6: TcxGridDBColumn;
    columna7: TcxGridDBColumn;
    btncontinuar: TRzBitBtn;
    cxCta: TcxGridDBColumn;
    cxCliente: TcxGridDBColumn;
    procedure cbotipoNotInList(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure buscarlocate;
    procedure edbuscarButtonClick(Sender: TObject);
    procedure rgestatusClick(Sender: TObject);
    procedure edbuscarChange(Sender: TObject);
    procedure cbotipoChange(Sender: TObject);
    procedure btncontinuarClick(Sender: TObject);
    procedure DBGVista2DblClick(Sender: TObject);
  private
    forma:string;
    { Private declarations }
  public
    { Public declarations }
    valor,cliente:string;
    constructor inicializa(const cadena,cadena2:string;vista:boolean);


  end;

var
  frmBuscarServ: TfrmBuscarServ;

implementation

uses Urecursos, Ubusquedas, Uservicios, Uprincipal, Udmrep, Udm;

{$R *.dfm}

constructor TfrmBuscarServ.inicializa(const cadena,cadena2:string;vista:boolean);
begin
forma := cadena2;
if cadena2  =  'CLIENTES' then
 begin
  btncontinuar.visible := false;
  btncancelar.Caption := '&Cerrar';
  edbuscar.text := cadena;
  cbotipo.ItemIndex := 1;
  cliente := cadena;
  buscarlocate;
 end
else
 begin
  if cadena <> '0' then
   begin
    edbuscar.text := cadena;
    ///btncontinuar.visible := true;
    cbotipo.ItemIndex := 1;
    buscarlocate;
    if vista = true then
     begin
      btncontinuar.caption := 'Crear Orden';
      btncancelar.Caption := '&Cancelar';
      if edbuscar.Showing then
         edbuscar.setfocus;
     end
    else
     if cxgrid1.Showing then
      cxgrid1.SetFocus;
   end
  else
   btncontinuar.Caption := 'Ver orden';
end;
if cadena2 = 'Ajuste' then
 begin
  btncontinuar.Caption := 'C&ontinuar';
  btncontinuar.visible := true;
  btncancelar.Caption := '&Cerrar';
  cliente:='Ajuste';
 end;

  with dmreportes do
   begin
    querys('SELECT es.nombre as combo FROM EstatusServicios as es  left join TipoServicios as ts ON (ts.idserv=es.idserv) left join areas as a ON(a.idarea=ts.idarea) '+
           ' where a.nombre = ''SERVICIOS'' AND ts.nombre=''ESTATUS SERVICIO''  order by es.orden asc ',0,sqlgeneral);
    rgestatus.Items.Clear;
    rgestatus.Items.Add('Todos');
    while not sqlgeneral.eof do
     begin
      rgestatus.Items.Add(sqlgeneral.fieldbyname('combo').AsString);
      sqlgeneral.next;
     end;//with
   end;//dmon
end;

procedure TfrmBuscarServ.buscarlocate;
begin
//deshabilitado hasta que hagamos los camibos con la tabla de clientes
if cbotipo.ItemIndex = 0 then
  querys('select sid,s.idcliente as clie,if(c.rsocial is null or c.rsocial = '''',concat(if(nombre is null or nombre = '''','''',nombre),'' '',if(apaterno is null or apaterno = '''','''',apaterno),'' '',if(amaterno is null or amaterno = '''','''',amaterno)),c.rsocial) as clienombre '+
         ' from servicios as s left join clientes as c on(s.idcliente=c.idcliente) where s.sid='+quotedstr(edbuscar.text)+' order by sid desc',0,dmaccesos.sqlgeneral)
else
 if edbuscar.text <> '' then
  querys('select sid,s.idcliente as clie,if (c.rsocial is null or c.rsocial = '''',concat(if(nombre is null or nombre = '''','''',nombre),'' '',if(apaterno is null or apaterno = '''','''',apaterno),'' '',if(amaterno is null or amaterno = '''','''',amaterno)),c.rsocial)  '+
         'as clienombre from servicios as s left join clientes as c on(s.idcliente=c.idcliente) where s.idcliente='+quotedstr(edbuscar.text)+' order by sid desc',0,dmaccesos.sqlgeneral)
 else
  exit;

if dmaccesos.sqlgeneral.fieldbyname('sid').AsString <> '' then begin

  self.Caption:='Buscar Servicio del cliente : '+dmaccesos.sqlgeneral.fieldbyname('clie').AsString+' ( '+ dmaccesos.sqlgeneral.fieldbyname('clienombre').AsString +') ';

if cbotipo.ItemIndex = 0 then
begin
//  querys('select sid,idcliente as clie,fecha_creacion,reportby,status,problema,trab_realizado,comentario from servicios where sid='+quotedstr(edbuscar.text)+' order by sid desc',0,sqlrejilla);
querys('select s.sid,s.idcliente as clie,s.fecha_creacion,s.reportby,es.nombre as estatus,s.problema,s.trab_realizado,s.comentario,if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''),'' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,''''))'+
       ',c.rsocial) as nombre from servicios as s inner join clientes as c on s.idcliente = c.idcliente left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) where sid='+quotedstr(edbuscar.text)+'  and ts.nombre=''ESTATUS SERVICIO'' order by sid desc',0,sqlrejilla);
  rgestatus.visible := false;
end else
  begin
//  querys('select sid,idcliente as clie,fecha_creacion,reportby,status,problema,trab_realizado,comentario from servicios where idcliente='+quotedstr(edbuscar.text)+' order by sid desc',0,sqlrejilla);
querys('select s.sid,s.idcliente as clie,s.fecha_creacion,s.reportby,es.nombre as estatus,s.problema,s.trab_realizado,s.comentario,if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''),'' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,''''))'+
       ',c.rsocial) as nombre from servicios as s inner join clientes as c on s.idcliente = c.idcliente left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) where s.idcliente='+quotedstr(edbuscar.text)+'  and ts.nombre=''ESTATUS SERVICIO'' order by sid desc',0,sqlrejilla);
  rgestatus.Visible:=true;
  end;

end else begin
    application.MessageBox('No se encontraron servicios!','Atención',mb_iconInformation);
    edbuscar.text:='';
end;

end;


procedure TfrmBuscarServ.cbotipoNotInList(Sender: TObject);
begin
    cbotipo.ItemIndex:=0;
end;

procedure TfrmBuscarServ.btnbuscarClick(Sender: TObject);
begin

if cbotipo.ItemIndex = 0 then //por servicio
   querys('select sid,idcliente as clie,fecha_creacion from servicios where sid='+quotedstr(edbuscar.Text),0,dmaccesos.sqlgeneral)

else //por cuenta
   querys('select sid,idcliente as clie,fecha_creacion from servicios where idcliente='+quotedstr(edbuscar.Text),0,dmaccesos.sqlgeneral);

if dmaccesos.sqlgeneral.RecordCount = 0 then
//   lblregistros.Caption:='No se encontro ningun registro'
else
  //  lblregistros.Caption:='Registros Encontrados:'+inttostr(sqlbuscar.RecordCount);
  //  DBGVista2.DataController.CreateAllItems;
    rgestatus.Visible:=true;

end;

procedure TfrmBuscarServ.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cancelar' then
 begin
  idClienteGral := '-1';
  idServicioGral := '';
 end;
close;
end;

procedure TfrmBuscarServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmBuscarServ.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edbuscar.Text <> '' then
         buscarlocate
     else
        edbuscar.OnButtonClick(self);


    if key = #27 then
     begin
        key:=#0;
        edbuscar.Text:='';
     end;

end;

end;

procedure TfrmBuscarServ.edbuscarButtonClick(Sender: TObject);
begin
  querys('select count(sid) as total from servicios order by sid desc',0,dmaccesos.sqlgeneral);
  frmbusquedas.maxrow:=dmaccesos.sqlgeneral.fieldbyname('total').AsInteger;

frmbusquedas.query := 'select sid,s.idcliente as idcliente,if (c.rsocial is null or c.rsocial = '''',concat(if(nombre is null or nombre = '''','''',nombre),'' '',if(apaterno is null or apaterno = '''','''',apaterno),'' '',if(amaterno is null or amaterno = '''','''',amaterno)),c.rsocial)  '+
                       'as clienombre from servicios as s left join clientes as c on(s.idcliente=c.idcliente) order by sid desc';


if cbotipo.ItemIndex = 0 then begin

  frmbusquedas.campo_retorno:='sid';
  frmbusquedas.campo_busqueda:='sid';
  frmbusquedas.tblorigen:='servicios';
  frmbusquedas.ShowModal;

end else begin

  frmbusquedas.campo_retorno:='idcliente';
  frmbusquedas.campo_busqueda:='idcliente';
  frmbusquedas.tblorigen:='servicios';
  frmbusquedas.ShowModal;

end;
     if frmbusquedas.resultado <> '' then
            begin
                edbuscar.Text:=frmbusquedas.resultado;
                buscarlocate;
            end;
end;

procedure TfrmBuscarServ.rgestatusClick(Sender: TObject);
begin

if rgestatus.itemindex = 0  then
 querys('select s.sid,s.idcliente as clie,s.fecha_creacion,s.reportby,es.nombre as estatus,s.problema,s.trab_realizado,s.comentario,if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''),'' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,''''))'+
        ',c.rsocial) as nombre from servicios as s inner join clientes as c on s.idcliente = c.idcliente left join EstatusServicios as es ON (es.orden=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idserv) where s.idcliente='+quotedstr(edbuscar.text)+' and ts.nombre=''ESTATUS SERVICIO'' order by sid desc',0,sqlrejilla)
else
 querys('select s.sid,s.idcliente as clie,s.fecha_creacion,s.reportby,es.nombre as estatus,s.problema,s.trab_realizado,s.comentario,if(c.rsocial is null or c.rsocial = '''',concat(ifnull(c.nombre,''''),'' '',ifnull(c.amaterno,''''),'' '',ifnull(c.apaterno,''''))'+
        ',c.rsocial) as nombre  from servicios as s inner join clientes as c on s.idcliente = c.idcliente left join EstatusServicios as es ON (es.orden=s.status) left join TipoServicios as ts ON (ts.idserv=es.idserv) where s.idcliente='+quotedstr(edbuscar.text)+' and ts.nombre=''ESTATUS SERVICIO'' and es.orden='+inttostr(rgestatus.itemindex)+' order by sid desc',0,sqlrejilla);

end;

procedure TfrmBuscarServ.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then begin
    sqlrejilla.close;
    rgestatus.visible:=false;
    self.caption:='Buscar Servicio';
end;
end;

procedure TfrmBuscarServ.cbotipoChange(Sender: TObject);
begin
sqlrejilla.close;
edbuscar.setfocus;
buscarlocate;
end;

procedure TfrmBuscarServ.btncontinuarClick(Sender: TObject);
begin
if btncontinuar.Caption = 'C&ontinuar'  then
 begin
  if sqlrejilla.recordcount > 0 then
   begin
    idClienteGral := DSrejilla.dataset.FieldValues['clie'];
    idServicioGral := DSrejilla.DataSet.FieldValues['sid'];
   end;
  close;
 end;

if btncontinuar.caption = 'Ver orden' then begin
if sqlrejilla.recordcount > 0 then
   begin
       idClienteGral := DSrejilla.dataset.FieldValues['clie'];
       idServicioGral := DSrejilla.DataSet.FieldValues['sid'];
       close;
   end;
end;
if ((btncontinuar.Caption = 'Crear Orden') or  (btncontinuar.Caption = 'Continuar' ))then
  begin
   //  frmprincipal.tbmain.Tag := strtoint(edbuscar.text);
     close;
   end;

end;

procedure TfrmBuscarServ.DBGVista2DblClick(Sender: TObject);
//var i:integer; c, s:boolean;
 //hija : Tfrmservicios;
begin
if cliente <> 'CLIENTES' then
  begin
  if sqlrejilla.recordcount > 0 then
    begin
    idClienteGral := DSrejilla.dataset.FieldValues['clie'];
    idServicioGral := DSrejilla.DataSet.FieldValues['sid'];
    close;
    end;
  end;
  {
if forma = 'CLIENTES' then
  begin
  hija := Tfrmservicios.Create(frmprincipal);
  hija.inicializa(DSrejilla.DataSet.FieldValues['sid'],false, '');
  hija.Show;
  close;
  end;}
end;

End.
