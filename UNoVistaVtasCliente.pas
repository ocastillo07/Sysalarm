{///////////////////////////////////////////////////////////////////////////////
2008/02/28 dalyla zona horaria ok
2008/01/10 Dalila idfact por idlciente en tarjeta cliente para busqueda del mismo
}///////////////////////////////////////////////////////////////////////////////
unit UNoVistaVtasCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ComCtrls, RzEdit, ExtCtrls, RzPanel,
  RzSplit, RzLabel, RzButton, MemDS, DBAccess, MyAccess, Menus,StrUtils;

type
  TfrmNoVistaVtasCliente = class(TForm)
    divicion: TRzSplitter;
    MemoViewer: TRzRichEdit;
    GridGeneral: TcxGrid;
    DBGVista1: TcxGridDBTableView;
    DBGLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DBGVista2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DBGVista3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    DBGVista1DBColumn1: TcxGridDBColumn;
    DBGVista1DBColumn2: TcxGridDBColumn;
    DBGVista1DBColumn3: TcxGridDBColumn;
    DBGVista1DBColumn4: TcxGridDBColumn;
    DBGVista1DBColumn6: TcxGridDBColumn;
    DBGVista1DBColumn7: TcxGridDBColumn;
    DBGVista2DBColumn1: TcxGridDBColumn;
    DBGVista2DBColumn2: TcxGridDBColumn;
    DBGVista2DBColumn3: TcxGridDBColumn;
    DBGVista2DBColumn4: TcxGridDBColumn;
    DBGVista3DBColumn1: TcxGridDBColumn;
    DBGVista3DBColumn2: TcxGridDBColumn;
    DBGVista3DBColumn3: TcxGridDBColumn;
    DBGVista3DBColumn4: TcxGridDBColumn;
    DBGVista3DBColumn5: TcxGridDBColumn;
    DBGVista3DBColumn6: TcxGridDBColumn;
    DBGVista3DBColumn7: TcxGridDBColumn;
    DBGVista3DBColumn8: TcxGridDBColumn;
    lblCantBloq: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    DBGVista3DBColumn9: TcxGridDBColumn;
    DBGVista1DBColumn8: TcxGridDBColumn;
    btncancelar: TRzBitBtn;
    cbofiltro: TComboBox;
    lblfiltro: TLabel;
    edbuscar: TEdit;
    lbldesc: TLabel;
    btnbuscar: TRzBitBtn;
    sqlbuscar: TMyQuery;
    DBGVista3DBColumn10: TcxGridDBColumn;
    DBGVista1DBColumn9: TcxGridDBColumn;
    DBGVista1DBColumn10: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbcuenta: TLabel;
    lbnombre: TLabel;
    lbsaldo: TLabel;
    DBGVista3DBColumn11: TcxGridDBColumn;
    RzPanel1: TRzPanel;
    btnestadoc: TRzBitBtn;
    btntarjeta: TRzBitBtn;
    btncobros: TRzBitBtn;
    btnclientes: TRzBitBtn;
    DBGVista1DBColumn5: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    Referencia1: TMenuItem;
    DBGVista1DBColumn11: TcxGridDBColumn;
    btnmovimientos: TRzBitBtn;
    DBGVista2DBColumn5: TcxGridDBColumn;
    btnCanceladosBoton: TRzBitBtn;
    procedure DBGVista1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DBGVista2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DBGVista3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGVista1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
    procedure cbofiltroClick(Sender: TObject);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure DBGVista1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncobrosClick(Sender: TObject);
    procedure btnestadocClick(Sender: TObject);
    procedure btntarjetaClick(Sender: TObject);
    procedure btnclientesClick(Sender: TObject);
    procedure DBGVista1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Referencia1Click(Sender: TObject);
    procedure btnmovimientosClick(Sender: TObject);
    procedure btnCanceladosBotonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idpedido,cliente:string;
    constructor inicializa(const cli:string);
    procedure mostrar_registros;
    procedure mostrar_datos;
  end;

var
  frmNoVistaVtasCliente: TfrmNoVistaVtasCliente;

implementation

uses Urecursos, Udmrep, Ubusquedas, Udm, Ucobros, Uprincipal, Upedidos,
  UfrmPagosDebe, Uclientes, UFechaAplicacion, UMensajeCliente, UExClientes;

{$R *.dfm}


constructor TfrmNoVistaVtasCliente.inicializa(const cli:string);
begin
cliente:=cli;
btncobros.Enabled:=true;
btnclientes.enabled:=true;
btntarjeta.enabled:=true;
btnestadoc.enabled:=true;
querys('select p.FechaFactura,p.idfactura,p.idpedido,p.FechaCreacion,p.TotMn , case p.estatus when 0 then "PED" when 1 then '+
       '"CAN" when 2 then "BACK"  when  3 then "REM" when 4  then "FAC" when 5 then "REM2" else "" end as Estado, '+
       'p.FechaVencimiento,u.codigo as Code, p.concepto,if (p.saldado=1,''SI'',''NO'') AS saldado, p.idUnidadNegocio, '+
       'if(p.estatus=1,0,p.Saldo) as Saldo  from NoPedidos as p left join usuarios as u ON (u.idusuario=p.idvendedor) '+
       'where p.idcliente ='+quotedstr(cli)+' group by p.idpedido order by p.idpedido desc',0,dmreportes.sqlgeneral5);

if dmreportes.sqlgeneral5.FieldByName('idpedido').AsString <> '' then
  begin
  querys('SELECT cant,dp.piezas,dp.cod_cve,a.nombre,if (cant>0,truncate(((cant*dp.costo)*tc)*'+floattostr(1+getIVA)+',3), '+
         'truncate(((dp.piezas*dp.costo)*tc)*'+floattostr(1+getIVA)+',3)) as importe,dp.costo as precio, '+
         'if (cant>0,truncate(if(dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),3), truncate(if(dp.tc <> 1, '+
         'dp.piezas*dp.costo,(dp.piezas*dp.costo)/p.TipoCambio),3)) as ImpDlls '+
         'FROM NoDetPedido as dp  INNER JOIN articulos as a on (a.cod_cve=dp.cod_cve) left join NoPedidos as p on '+
         '(p.idpedido=dp.idpedido) where dp.idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString),0,dmreportes.sqlgeneral6);
if(dmreportes.sqlgeneral5.RecordCount >0) then
   idpedido := dmreportes.sqlgeneral5.FieldByName('idpedido').AsString;
   
querys('select idpago,FechaAlta,cargo,abono,restante,idremicion,idfactura,FechaVence,notas,movimiento,idpago,usuario '+
       'from NoPagosClientes where idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString)+' and '+
       'movimiento in(0,1,2,4,10,5,6, 7, 8) order by idpago asc',0,dmreportes.sqlgeneral7);



end; //si hay datps

end;


procedure TfrmNoVistaVtasCliente.mostrar_registros;
begin
idpedido:=DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString;

querys('SELECT cant,dp.piezas,dp.cod_cve,a.nombre,if (cant>0,truncate(((cant*dp.costo)*tc)*'+floattostr(1+getIVA)+',3), '+
       'truncate(((dp.piezas*dp.costo)*tc)*'+floattostr(1+getIVA)+',3)) as importe,dp.costo as precio, '+
       'if(cant>0,truncate(if(dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),3),   '+
       'truncate(if(dp.tc <> 1,dp.piezas*dp.costo,(dp.piezas*dp.costo)/p.TipoCambio),3)) as ImpDlls '+
       'FROM NoDetPedido as dp INNER JOIN articulos as a on (a.cod_cve=dp.cod_cve) left join NoPedidos as p on '+
       '(p.idpedido=dp.idpedido) where dp.idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString),0,dmreportes.sqlgeneral6);

querys('select FechaAlta,cargo,abono,restante,movimiento,notas,idremicion,idfactura,FechaVence,TipoPago,idpago,usuario '+
       'from NoPagosClientes where idpedido='+quotedstr(idpedido)+' and movimiento in(0,1,2,4,10,5,6, 7, 8) order by idpago asc ',0,dmreportes.sqlgeneral7);

end;


procedure TfrmNoVistaVtasCliente.DBGVista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
mostrar_registros;
MemoViewer.Text:=DBGVista1.DataController.DataSet.FieldByName(DBGVista1.DataController.DataSet.FieldDefList.FieldDefs[acellviewinfo.item.index].DisplayName).AsString;
end;

procedure TfrmNoVistaVtasCliente.DBGVista2CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin

MemoViewer.Text:=DBGVista2.DataController.DataSet.FieldByName(DBGVista2.DataController.DataSet.FieldDefList.FieldDefs[acellviewinfo.item.index].DisplayName).AsString;

end;

procedure TfrmNoVistaVtasCliente.DBGVista3CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
MemoViewer.Text:=DBGVista3.DataController.DataSet.FieldByName(DBGVista3.DataController.DataSet.FieldDefList.FieldDefs[acellviewinfo.item.index].DisplayName).AsString;
end;

procedure TfrmNoVistaVtasCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    btnbuscar.Enabled:=false;
    edbuscar.Text:='';
    self.Caption:='Ventas del cliente';
    DMREPORTES.DS1.DataSet.Close;
    DMREPORTES.DS2.DataSet.Close;
    DMREPORTES.DS3.DataSet.Close;
action:=cafree;
end;

procedure TfrmNoVistaVtasCliente.DBGVista1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if ((key=40) or (key=38) or (key=33) or (key=34)) then
mostrar_registros;
DBGVista1.BeginUpdate;
DBGVista1.DataController.ClearSorting(true);
DBGVista1.Columns[DBGVista1.Controller.FocusedColumnIndex].SortOrder:= soAscending;
DBGVista1.EndUpdate;

end;

procedure TfrmNoVistaVtasCliente.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmNoVistaVtasCliente.Mostrar_datos;
var b:string;
begin
      if sqlbuscar.FieldByName('b').AsString = '1' then begin
              b:='CUENTA BLOQUEADA.............';
              lbcuenta.Font.Color:=clRed;

           end else begin
              lbcuenta.Font.Color:=clBlack;
              b:='.';
           end;

          lbcuenta.caption:=sqlbuscar.fieldbyname('idcliente').AsString;
          lbnombre.Caption:=sqlbuscar.fieldbyname('nombre').AsString;
          lbsaldo.Caption:=CurrToStrF(sqlbuscar.fieldbyname('s').Asfloat,ffCurrency, 2);
          cliente := sqlbuscar.fieldbyname('idcliente').AsString;
          self.Caption := 'Ventas del cliente '+sqlbuscar.fieldbyname('nombre').AsString+ ' con cuenta #'+cliente +' '+b;
          self.inicializa(cliente);
end;


procedure TfrmNoVistaVtasCliente.btnbuscarClick(Sender: TObject);
var temp : string;
begin
  try
    sqlbuscar.Close;
    sqlbuscar.SQl.Clear;
    case cbofiltro.ItemIndex of
      //CUENTA
      0:sqlbuscar.SQL.Add('Select c.idcliente, '+ClienteNombre('c')+' as Nombre,cf.NombreCres as Nombre, cf.rsocial as '+
                          'Razon_Social,c.dir, c.numero, c.ciudad,c.estado,c.Saldo as s,c.bloqueado as b '+
                          'From NoClientes c left join NoClientesFact cf on c.idfact = cf.idfact where c.idcliente='+quotedstr(edbuscar.Text)+'  order by c.idcliente');

      1:sqlbuscar.SQL.Add('Select c.idcliente,'+ClienteNombre('c')+' as Nombre,cf.rsocial as Razon_Social,c.dir,c.numero, '+
                          ' c.ciudad,c.estado,c.Saldo as s,c.bloqueado as b '+
                          'From NoClientes c left join NoClientesFact cf on c.idfact = cf.idfact where NombreCres like '+quotedstr('%'+edbuscar.Text+'%')+' order by cf.NombreCres');

      2:sqlbuscar.SQL.Add('Select c.idcliente,c.Saldo,'+ClienteNombre('c')+' as Nombre,cf.rsocial as Razon_Social,c.dir,c.numero, '+
                            ' c.ciudad,c.estado,c.bloqueado as b From NoClientes c left join NoClientesFact cf on c.idfact = cf.idfact where  cf.rsocial like '+quotedstr('%'+edbuscar.Text+'%')+'  order by c.idcliente');
      3: begin
         case length(edbuscar.Text) of
           7: temp := midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,7);
           8: temp := AnsiReplaceText(edbuscar.Text,'-','');
          13: temp :=  midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,3)+'-'+midstr(edbuscar.Text,7,7);
          15: temp := AnsiReplaceText(edbuscar.Text,'-','');
         end;

        sqlbuscar.SQL.Add('Select c.idcliente,ifnull(cf.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) as Nom,cf.NombreCres as Nombre,cf.rsocial as Razon_Social,c.dir, ' +
                          'c.numero, c.ciudad,c.estado,c.Saldo as s,c.bloqueado as b '+
                          'FROM NoClientes c INNER JOIN NoTelefonos t ON '+
                          ' (c.idtel = t.idtel) left join NoClientesFact cf on c.idfact = cf.idfact WHERE t.telefono LIKE '+quotedstr('%'+edbuscar.text+'%')+' or t.telefono LIKE '+quotedstr('%'+temp+'%')+' group by c.idcliente order by c.idcliente');
        end;


      4:sqlbuscar.SQL.Add('Select c.idcliente,c.Saldo as s,ifnull(cf.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) as Nombre,cf.rsocial as Razon_Social,c.dir,c.numero,'+
                          ' c.ciudad,c.estado,c.bloqueado as b '+
                          'From NoClientes as c left join NoClientesFact cf on c.idfact = cf.idfact where  c.dir like '+quotedstr('%'+edbuscar.Text+'%')+'  order by c.idcliente');

      5:sqlbuscar.SQL.add('Select c.idcliente,c.Saldo as s,if(cf.rsocial is null or cf.rsocial='''',concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')), '+
                          'cf.rsocial) as Nombre,c.bloqueado as b '+
                          'From NoClientes as c inner join NoPedidos p on c.idcliente = pedidos.idcliente '+
                          'inner join NoClientesFact cf on cf.idfact = c.idfact where pedidos.idpedido='+quotedstr(edbuscar.text));

      6:sqlbuscar.SQL.Add('Select c.idcliente,c.Saldo as s,if(cf.rsocial is null or cf.rsocial='''',concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')), '+
                          'cf.rsocial) as Nombre,c.bloqueado as b '+
                          'From NoClientes as c inner join NoPedidos p on c.idcliente = pedidos.idcliente '+
                          'inner join NoClientesFact cf on cf.idfact = c.idfact inner join NoRemiFact rf on RemiFact.idpedido = ' +
                          ' pedidos.idpedido where RemiFact.idremicion='+quotedstr(edbuscar.text)+' and RemiFact.idfactura=''0''');

      7:sqlbuscar.SQL.Add('Select c.idcliente,c.Saldo as s,if(cf.rsocial is null or cf.rsocial='''',concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')), '+
                           'cf.rsocial) as Nombre,c.bloqueado as b '+
                           'From NoClientes as c inner join NoPedidos p on c.idcliente = pedidos.idcliente '+
                           'inner join NoClientesFact on cf.idfact = c.idfact '+
                           'inner join NoRemiFact rf on RemiFact.idpedido = pedidos.idpedido where RemiFact.idFactura='+quotedstr(edbuscar.text)+' and RemiFact.idremicion=0');

      end;
    sqlbuscar.Open;
    if sqlbuscar.RecordCount=0 then
       begin
        application.MessageBox('No se encontro Cliente','aviso',mb_iconwarning);
        //edbuscar.Text:='';
        self.Caption:='Ventas del cliente';
        DMREPORTES.DS1.DataSet.Close;
        DMREPORTES.DS2.DataSet.Close;
        DMREPORTES.DS3.DataSet.Close;
        lbcuenta.caption:='';
        lbnombre.Caption:='';
        lbsaldo.Caption:='';
        btncobros.enabled:=false;
        btntarjeta.enabled:=false;
        btnestadoc.enabled:=false;


       end
    else
     begin

      if sqlbuscar.RecordCount > 1 then begin

       frmbusquedas.query:='Select c.idcliente,cf.NombreCres as Nombre,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')) as NombreInstalacion,cf.rsocial as Razon_Social,c.dir,c.numero, '+
                           ' c.ciudad,c.estado,c.Saldo as s,c.bloqueado as b '+
                           'From NoClientes c left join ClientesFact cf on c.idfact = cf.idfact where cf.NombreCres like '+quotedstr('%'+edbuscar.Text+'%')+' order by cf.Nombre asc'; //concat(c.nombre,'+quotedstr(' ')+',c.apaterno,'+quotedstr(' ')+',c.amaterno) like '+quotedstr('%'+edbuscar.Text+'%')+' order by c.apaterno');

     frmbusquedas.campo_retorno:='idcliente';
     frmbusquedas.campo_busqueda:='Numero';
     frmbusquedas.tblorigen := 'clientes';
     frmbusquedas.tabla:='clientes';
     frmbusquedas.cbofiltro.ItemIndex:=0;
     frmbusquedas.cbofiltro.OnClick(self);
     frmbusquedas.ShowModal;
     if frmbusquedas.resultado <> '' then
           cliente := frmbusquedas.resultado;

           querys('Select c.idcliente,cf.NombreCres  as Nombre,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' '')) as NombreInstalacion,cf.rsocial as Razon_Social,c.dir,c.numero, '+
                  ' c.ciudad,c.estado,c.Saldo as s,c.bloqueado as b From NoClientes c left join NoClientesFact cf on c.idfact = cf.idfact where c.idcliente= '+quotedstr(cliente)+' ',0,sqlbuscar);
           mostrar_datos;
      end else begin
           mostrar_datos;
      end; // if sqlbuscar > 1
       end;
      except
       edbuscar.Text:='';
        end;
end;

procedure TfrmNoVistaVtasCliente.cbofiltroClick(Sender: TObject);
begin
if self.Showing then
edbuscar.SetFocus;
edbuscar.Hint:=cbofiltro.Text+' a buscar';
if edbuscar.Text<>'' then
   btnbuscar.Click;

case cbofiltro.ItemIndex of
0:begin lbldesc.Caption:='Se Buscara por Numero'; edbuscar.Hint:='Se Buscara por Numero'; end;
1:begin lbldesc.Caption:='Se Buscara por Nombre'; edbuscar.Hint:='Buscara por Nombre'; end;
2:begin lbldesc.Caption:='Se Buscara por Razon Social'; edbuscar.Hint:='Se Buscara por Razon Social'; end;
3:begin lbldesc.Caption:='Se Buscara por Telefono(ejemplo 557-0202)'; edbuscar.Hint:='Se Buscara por Telefono(ejemplo 557-0202)'; end;
4:begin lbldesc.Caption:='Se Buscara por Direccion'; edbuscar.Hint:='Se Buscara por Direccion'; end;
end;
end;

procedure TfrmNoVistaVtasCliente.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text <> '' then
  begin
     btnbuscar.Enabled:=true;
  end
else
  begin
    btnbuscar.Enabled:=false;
    edbuscar.Text:='';
    self.Caption:='Ventas del cliente';
    DMREPORTES.DS1.DataSet.Close;
    DMREPORTES.DS2.DataSet.Close;
    DMREPORTES.DS4.DataSet.Close;
    lbcuenta.Caption := '';
    lbnombre.Caption := '';
    lbsaldo.Caption := '';
    btncobros.enabled:=false;
    btntarjeta.enabled:=false;
    btnestadoc.enabled:=false;
    btnclientes.enabled:=false;
  end;
end;

procedure TfrmNoVistaVtasCliente.edbuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edbuscar.Text<>'') then
 begin
  key :=#0;
  btnbuscar.Click;
 end;
end;

procedure TfrmNoVistaVtasCliente.DBGVista1DblClick(Sender: TObject);
var //forma:Tfrmcobros;
    mdipedidos : tfrmpedidos;

begin
   mdipedidos:=Tfrmpedidos.Create(self);
  frmprincipal.ucprincipal.Log('Acceso la Pantalla de Pedidos',0);
  mdipedidos.inicializa(DMREPORTES.DS2.DataSet.FieldByName('idpedido').AsString);
  mdipedidos.Show;

end;

procedure TfrmNoVistaVtasCliente.FormShow(Sender: TObject);
begin
cbofiltro.ItemIndex := 0;
self.WindowState:=wsMaximized;
edbuscar.setfocus;

end;

procedure TfrmNoVistaVtasCliente.btncobrosClick(Sender: TObject);
//var hija:TfrmPagosDebe;
begin
  {   hija:=TfrmPagosDebe.Create(self);
     hija.inicializa(cliente);
     hija.Show;}

end;

procedure TfrmNoVistaVtasCliente.btnestadocClick(Sender: TObject);
var fecha1,fecha2,valor1,valor2,valor3,valor4,total,total1,total2,cobrador,sector,idcontacto,nota1,nota2,nota3:string;
//ban:integer;
begin
//buscarEstCuenta;
if cliente <> '' then begin

//busca contacto

with dmreportes do begin
  querys('SELECT ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) AS nombre,c.idcliente as cuenta,c.ciudad,c.estado,c.numero as numero,'+
         'c.dir,col.cp,col.nombre as col,c.sector as sector,idcontacto '+
         'FROM NoClientes AS c LEFT JOIN colonias AS col ON (col.idcol=c.idcol) WHERE c.idcliente='+quotedstr(cliente),0,sqlgeneral);

    if SqlGeneral.FieldByName('cuenta').AsString <> '' then
       begin
             idcontacto:= SqlGeneral.FieldByName('idcontacto').AsString;
                     //lnombre.Caption:=SqlGeneral.FieldByName('nombre').AsString;
             sector:=SqlGeneral.FieldByName('sector').AsString;

       end;//if recordcount
end;

/////
   with dmreportes do begin

ban:=0;//bandera para saber cuanto debe por periodos
//n2:=0;//bandera para saber si tiene parcialidades y
cobrador:='';
////GENERAR REPORTE
    if idcontacto <> '' then begin
          querys('SELECT  concat(nombre,'' '',apaterno,'' '',amaterno) AS nombre, min(idcontador)  '+
          'from NoContactos where idcontacto='+quotedstr(idcontacto)+' and (nombre <> ''TELEFONO 1'' and  nombre <> ''TELEFONO 2''  ) group by idcontacto',0,sqlgeneral);
          idcontacto:=sqlgeneral.fieldbyname('nombre').AsString;
    end;

//buscar el usuario que tiene ese sector para la cobranza
    querys('SELECT Concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno)  AS cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) WHERE u.idsector='+quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
    if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
    cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
    else begin
          querys('SELECT Concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno)  AS cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN UsuarioSector as us ON (us.idusuario=u.idusuario) WHERE us.idsector='+quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
    if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
    cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
    end;
    querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
    querys('CREATE TABLE temporal_estadocuenta'+frmprincipal.idmaq+' (mov integer (11),idcliente integer (11),idpedido integer (11),fechaalta date,fechavence date,total float,saldo float,cobrador varchar(50),estatus integer(11),idpago integer(11),contacto varchar(50),KEY idpedido(idpedido)) ',1,sqlgeneral);

    querys('select idpago,pc.idpedido as ped from NoPagosClientes as pc LEFT JOIN NoPedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4) and movimiento = 1',0,sqlgeneral2);

    querys('INSERT INTO temporal_estadocuenta'+frmprincipal.idmaq+'(mov,idcliente,saldo,idpedido,cobrador,estatus,contacto,idpago) SELECT pc.movimiento,pc.idcliente,pc.restante,pc.idpedido,'+quotedstr(cobrador)+',0,'+quotedstr(idcontacto)+',pc.idpago '+
    'FROM NoPagosClientes as pc LEFT JOIN NoPedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4) AND pc.restante <> 0 AND pc.movimiento in(0,1) ',1,sqlgeneral);
   if sqlgeneral2.FieldByName('idpago').AsString  <> '' then begin
     while not sqlgeneral2.Eof do begin

         querys('DELETE FROM temporal_estadocuenta'+frmprincipal.idmaq+' WHERE  idpedido='+quotedstr(sqlgeneral2.FieldByName('ped').AsString)+' and mov =0 ',1,sqlgeneral3);
         sqlgeneral2.Next;
     end;                                                                                          //idpago='+quotedstr(sqlgeneral2.FieldByName('idpago').AsString)+' and
   end;

   querys('SELECT idpago,idpedido,idcliente,cargo,FechaAlta,FechaVence,if(FechaVence > "'+datetostr(date)+'",1,0) as estatus  '+
   'FROM NoPagosClientes WHERE idcliente='+quotedstr(cliente)+' and movimiento in(0,1) order by idpedido',0,sqlgeneral);     // and saldado = 0  and (estatus=3 or estatus=4)

    while not sqlgeneral.Eof do begin

        querys('UPDATE temporal_estadocuenta'+frmprincipal.idmaq+' SET  fechaalta='+quotedstr(sqlgeneral.fieldbyname('FechaAlta').AsString)+',fechavence='+quotedstr(sqlgeneral.fieldbyname('FechaVence').AsString)+',total='+quotedstr(sqlgeneral.fieldbyname('cargo').AsString)+',estatus='+quotedstr(sqlgeneral.fieldbyname('estatus').AsString)+' '+
               'WHERE idpago='+quotedstr(sqlgeneral.fieldbyname('idpago').AsString),1,dmaccesos.sqlgeneral);
        sqlgeneral.Next;

    end;


///total
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' ''  GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
total:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
delete(total,1,1);
end else total:='0';

//total vencido
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=0 GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
total1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
delete(total1,1,1);
end else total1:='0';

//total x vencer
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=1 GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
total2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
delete(total2,1,1);
end else total2:=' 0';

///cantidad de 0 a 30
fecha1:=datetostr(now-30);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between   '+quotedstr(fecha1)+' AND "'+datetostr(date)+'" and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=1;
end else
valor1:='$ 0';

///cantidad de 31 a 60
fecha1:=datetostr(now-31);
fecha2:=datetostr(now-60);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=2;
end else
valor2:='$ 0';

///cantidad de 61 a 90
fecha1:=datetostr(now-61);
fecha2:=datetostr(now-90);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor3:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=3;
end else
valor3:='$ 0';

///cantidad mas de 90
fecha1:=datetostr(now-90);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence < '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if  sqlgeneral.FieldByName('suma').AsString <> '' then begin
valor4:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
ban:=4;
end else
valor4:='$ 0';

        querys('SELECT cf.NombreCres AS nombre,c.idcliente,cf.CdCres as ciudad,cf.EstadoCres as estado,cf.DirCres as dir,c.numero,cf.CPCres as cp,cf.ColCres as col,c.sector as sector,t.fechaalta,'+
               't.fechavence,t.total,t.saldo, '+quotedstr(idcontacto)+' as contacto,concat( ifnull(c.dir,'' ''),'','',ifnull(c.numero,'' ''),'' , COL:'',ifnull(col.nombre,'' '')) AS DirInst ,c.ciudad as CdInst, '+
               't.idpedido,p.concepto,l.nombre as negocio,t.estatus  FROM NoClientes AS c LEFT JOIN NoClientesFact as cf on(cf.idfact=c.idfact) LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) LEFT JOIN temporal_estadocuenta'+frmprincipal.idmaq+' as t ON (t.idcliente=c.idcliente) LEFT JOIN pedidos AS p ON (p.idpedido=t.idpedido) LEFT JOIN DetPedido AS dp ON '+
               '(dp.idpedido=p.idpedido) LEFT JOIN  articulos as a ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) WHERE c.idcliente='+quotedstr(cliente)+' GROUP BY t.idpago order by estatus',0,sqlgeneral3);

       //mostrar nota correspondiente......
       querys('SELECT concepto,ValorMemo FROM configuraciones',0,sqlgeneral);
                                       while not sqlgeneral.Eof do begin

                                           if sqlgeneral.fieldbyname('concepto').AsString='CobNotasPago' then
                                               nota1:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                                           if sqlgeneral.fieldbyname('concepto').AsString='CobNotasObs' then
                                               nota2:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                                           if ban = 1 then begin
                                           if sqlgeneral.fieldbyname('concepto').AsString='A30' then
                                               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                                           end;
                                           if ban = 2 then begin
                                           if sqlgeneral.fieldbyname('concepto').AsString='A60' then
                                               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                                           end;
                                           if ban = 3 then begin
                                           if sqlgeneral.fieldbyname('concepto').AsString='A90' then
                                               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                                           end;
                                           if ban = 4 then begin
                                           if sqlgeneral.fieldbyname('concepto').AsString='M90' then
                                               nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                                           end;
                                              sqlgeneral.Next;

                                       end;

         if sqlgeneral3.fieldbyname('DirInst').AsString  <> '' then
            RVP.SetParam('titulo2',sqlgeneral3.fieldbyname('DirInst').AsString)
         else
            RVP.SetParam('titulo2','');

         if sqlgeneral3.fieldbyname('CdInst').AsString  <> '' then
            RVP.SetParam('tax',sqlgeneral3.fieldbyname('CdInst').AsString)
         else
            RVP.SetParam('tax','');


         RVP.SetParam('titulo1',cobrador);
         RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
         RVP.SetParam('total',total);
         RVP.SetParam('total1',total1);
         RVP.SetParam('total2',total2);
         RVP.SetParam('nota1',nota1);
         RVP.SetParam('nota2',nota3);
         RVP.SetParam('nota3',nota2);
         RVP.SetParam('comodin1',valor1);
         RVP.SetParam('comodin2',valor2);
         RVP.SetParam('comodin3',valor3);
         RVP.SetParam('comodin4',valor4);
         RVP.ExecuteReport('RepEstadoCuentaC');
         rvp.close;

         querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
   end;//with

end else
      edbuscar.setfocus;
end;

procedure TfrmNoVistaVtasCliente.btntarjetaClick(Sender: TObject);
var fecha,total,tel,contac:string;
begin


with dmreportes do begin

querys('SELECT c.idcliente as idcliente,cf.RFCCres as rfc,c.curp, cf.NombreCres  AS nombre,cf.DirCres as dir,c.sector,concat(ifnull(cf.CdCres,'' '' ),'' '', ifnull(cf.EstadoCres,'' '')) as ciudad,c.estado,c.st_date,c.TotComprado,'+
       'c.saldo as CliSaldo,c.precio,c.idtel as idtel, c.idcontacto as idcontacto,cf.ColCres as colonia,cf.CPCres as cp,c.UltimaCompra,c.PlazoCredito,c.credito,IF(c.bloqueado=1,''S'',''N'') as bloqueado,c.email,c.tipocont,c.idabogado, '+
       ' Concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno)  AS vendedor '+
       'FROM NoClientes as c LEFT JOIN NoClientesFact as cf on(cf.idfact=c.idfact) '+
       'LEFT JOIN usuarios as u ON (u.idusuario=c.idvendedor) LEFT JOIN colonias as col ON (col.idcol=c.idcol)  WHERE c.idcliente=' +quotedstr(cliente),0,sqlgeneral);


if sqlgeneral.FieldByName('idcliente').AsString <> '' then begin
tel:='10000000';
contac:='1000000';
  if sqlgeneral.FieldByName('idtel').AsString <> '' then
     tel:=sqlgeneral.FieldByName('idtel').AsString;
  if sqlgeneral.FieldByName('idcontacto').AsString <> '' then
     contac:=sqlgeneral.FieldByName('idcontacto').AsString;


sqlclientes.Close;
sqlclientes.ParamByName('id').AsString:=cliente;
sqlclientes.ParamByName('orden').AsString:='pc.FechaAlta asc';
sqlclientes.Open;

if total <> '' then
    dmreportes.temp:=strtofloat(total)
else
    dmreportes.temp:=0;

      querys('SELECT * FROM NoTelefonos WHERE idtel='+quotedstr(tel)+' ORDER BY idtel ASC',0,dmreportes.sqlgeneral2);
      querys('SELECT c.idcontador,c.idcontacto,c.nivel,concat(c.nombre,'' '',c.apaterno,'' '',c.amaterno) as contacto,t.telefono,tipo_tel,t.extencion '+
      'FROM NoContactos as c LEFT JOIN  NoTelefonos as t ON (t.idtel=c.idtel) WHERE idcontacto='+quotedstr(contac),0,dmreportes.sqlgeneral3);
      fecha:='Período del análisis del '+datetostr(now);// strtonowdfecha1.Text+' al '+dfecha2.Text;
          RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
          RVP.SetParam('total',total);
          RVP.SetParam('fechaini',fecha);

          RVP.ExecuteReport('RepTarjetaCliente');


end else begin//if clientes
        application.MessageBox('Esa cuenta no existe!','Atención',mb_IconInformation);
        edbuscar.SetFocus;
        end;
end;//with


end;

procedure TfrmNoVistaVtasCliente.btnclientesClick(Sender: TObject);
var forma:tfrmExclientes;
begin
forma:=tfrmExclientes.Create(self);
frmprincipal.ucprincipal.Log('Acceso a la Pantalla de clientes',0);
forma.inicializa(cliente);
forma.Show;
end;

procedure TfrmNoVistaVtasCliente.DBGVista1KeyPress(Sender: TObject;
  var Key: Char);
 var mdipedidos : tfrmpedidos;
begin
if key = #27 then
edbuscar.setfocus;

if (key = #13) then begin
   mdipedidos:=Tfrmpedidos.Create(self);
  frmprincipal.ucprincipal.Log('Acceso la Pantalla de Pedidos',0);
  mdipedidos.inicializa(DMREPORTES.DS2.DataSet.FieldByName('idpedido').AsString);
  mdipedidos.Show;
end;
end;

procedure TfrmNoVistaVtasCliente.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #27 then
edbuscar.setfocus;
end;

procedure TfrmNoVistaVtasCliente.FormActivate(Sender: TObject);
begin
self.WindowState:=wsMaximized;
end;

procedure TfrmNoVistaVtasCliente.Referencia1Click(Sender: TObject);
{var
    //CodBarras,Banco,Temp,cvecte,cvevta,costo,pedido: string;
    j : integer;
    parcialidad : double;}
begin
     { pedido:=DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString;
      costo:=floattostr(DBGVista1.DataController.DataSet.FieldByName('TotMn').Asfloat / (1+getIVA));
 //para el codigo de barras de las boletas se saca cuenta + idpedido +  cargo + relleno para que sean 10 caracteres
       querys('select CtaBanco from DatosEmpresa',0,dmreportes.sqlgeneral);
       cvecte := cliente + CalNumVerificador(cliente);
       cvevta := pedido + CalNumVerificador(pedido);
       Banco := dmreportes.sqlgeneral.fieldbyname('CtaBanco').AsString + ' ' + StuffString('0000000',(8 - length(cvecte)),length(cvecte),cvecte) + ' ' + StuffString('0000000',(8 - length(cvevta)),length(cvevta),cvevta);
       CodBarras := cliente + '1' + pedido;
       parcialidad := strtofloat(costo)*(1+getIVA);
       Temp := floattostr(quitacaracteres(floattostr(parcialidad),'.'));
       for j := length(CodBarras)+1 to (23 - length(Temp)) do
        CodBarras := CodBarras + '0';
        CodBarras := CodBarras + floattostr(quitacaracteres(floattostr(parcialidad),'.'));

       showmessage('Referencia : '+Banco);}

       showmessage('Referencia : '+ReferenciaBanco(cliente, DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString));

end;

procedure TfrmNoVistaVtasCliente.btnmovimientosClick(Sender: TObject);
begin
Application.CreateForm(TfrmMensajeCliente,frmMensajeCliente);
frmMensajeCliente.inicializa('1','Tipos de Movimientos');
frmmensajecliente.memo1.Text := '';
frmmensajecliente.memo1.Lines.Add('Esta es la descripcion de los tipos de movimientos de los pagos');
frmmensajecliente.memo1.Lines.Add('                                  ');
frmmensajecliente.memo1.Lines.Add('Tipo    Descripcion');
frmmensajecliente.memo1.Lines.Add(' 0      Cargo por Venta');
frmmensajecliente.memo1.Lines.Add(' 1      Parcialidad');
frmmensajecliente.memo1.Lines.Add(' 2      Cobro');
frmmensajecliente.memo1.Lines.Add(' 3      Cancelado');
frmmensajecliente.memo1.Lines.Add(' 4      Abono por parcializacion');
frmmensajecliente.memo1.Lines.Add(' 5      Abono por Cancelacion');
frmmensajecliente.memo1.Lines.Add(' 6      Cargo a Favor por Nota de Credito');
frmmensajecliente.memo1.Lines.Add(' 7      Deduccion por cuenta identificada');
frmmensajecliente.memo1.Lines.Add(' 8      Pago de cuenta identificada');
frmmensajecliente.memo1.Lines.Add('10      Abono desde una Nota de Credito (Aplicacion)');
frmmensajecliente.ShowModal;
end;

procedure TfrmNoVistaVtasCliente.btnCanceladosBotonClick(Sender: TObject);
begin
 if btnCanceladosBoton.ImageIndex = 2 then
   begin
        btnCanceladosBoton.ImageIndex := 6;
        btnCanceladosBoton.Caption := 'Muestra los Pagos de Movimientos';
        btnCanceladosBoton.Hint := 'Muestra los movimientos como cobros ,parcialidades,aplicaciones de notas de credito etc...';
        querys('select FechaAlta,cargo,abono,restante,movimiento,notas,idremicion,idfactura,FechaVence,TipoPago,idpago,usuario '+
        'from NoPagosClientes where idpedido='+quotedstr(idpedido)+' and movimiento in(3) order by idpago asc ',0,dmreportes.sqlgeneral7);

    end
       else
    begin
         btnCanceladosBoton.ImageIndex := 2;
         btnCanceladosBoton.Caption := 'Muestra los Pagos Cancelados';
         btnCanceladosBoton.Hint := ' Solo muestra los movimientos cancelados de esa venta';
         querys('select FechaAlta,cargo,abono,restante,movimiento,notas,idremicion,idfactura,FechaVence,TipoPago,idpago,usuario '+
         'from NoPagosClientes where idpedido='+quotedstr(idpedido)+' and movimiento in(0,1,2,4,10,5,6,7,8) order by idpago asc ',0,dmreportes.sqlgeneral7);
     end;

end;

end.
