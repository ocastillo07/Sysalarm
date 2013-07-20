{///////////////////////////////////////////////////////////////////////////////
2012/07/06 dalyla se agrego FE Transferencia abono en 0 (mov 12) 
2010-04-21 Ozkar insertar nota cuando pasa de rem2 a rem
--------------------------------------------------------------------------------
2009/06/03 dalyla busquedas por factura y correccion porque ya estaba
--------------------------------------------------------------------------------
2008/05/20 dalyla referencia Bancaria
2008/05/16 oscar corregi la opcion de regresar a REM un REM2
2008/05/12 dalyla derechos para pasar a remision la rem2
2008/05/07 dalyla boton de notas de credito a remision, y correccion de memo
2008/02/28 dalyla zona horaria ok
2008/01/10 Dalila idfact por idlciente en tarjeta cliente para busqueda del mismo
}///////////////////////////////////////////////////////////////////////////////
unit UVistaVtasCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, ComCtrls, RzEdit, ExtCtrls, RzPanel,
  RzSplit, RzLabel, RzButton, MemDS, DBAccess, MyAccess, Menus,StrUtils,
  Mask, RzCmboBx;

type
  TfrmVistaVtasCliente = class(TForm)
    sqlbuscar: TMyQuery;
    RzPanel1: TRzPanel;
    btnestadoc: TRzBitBtn;
    btntarjeta: TRzBitBtn;
    btncobros: TRzBitBtn;
    btnclientes: TRzBitBtn;
    PopupMenu1: TPopupMenu;
    Referencia1: TMenuItem;
    btnmovimientos: TRzBitBtn;
    btnrem2: TRzBitBtn;
    ConvertiraventaRemisionada1: TMenuItem;
    lbldesc: TLabel;
    edbuscar: TRzEdit;
    lblfiltro: TLabel;
    cbofiltro: TRzComboBox;
    btnbuscar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    lbcuenta: TLabel;
    lbnombre: TLabel;
    lbsaldo: TLabel;
    lblCantBloq: TRzLabel;
    GridGeneral: TcxGrid;
    DBGVista1: TcxGridDBTableView;
    DBGVista1DBColumn1: TcxGridDBColumn;
    DBGVista1DBColumn7: TcxGridDBColumn;
    DBGVista1DBColumn5: TcxGridDBColumn;
    DBGVista1DBColumn2: TcxGridDBColumn;
    DBGVista1DBColumn10: TcxGridDBColumn;
    DBGVista1DBColumn4: TcxGridDBColumn;
    DBGVista1DBColumn9: TcxGridDBColumn;
    DBGVista1DBColumn6: TcxGridDBColumn;
    DBGVista1DBColumn8: TcxGridDBColumn;
    DBGVista1DBColumn3: TcxGridDBColumn;
    DBGVista1DBColumn11: TcxGridDBColumn;
    DBGLevel1: TcxGridLevel;
    RzLabel1: TRzLabel;
    cxGrid1: TcxGrid;
    DBGVista2: TcxGridDBTableView;
    DBGVista2DBColumn1: TcxGridDBColumn;
    DBGVista2DBColumn2: TcxGridDBColumn;
    DBGVista2DBColumn3: TcxGridDBColumn;
    DBGVista2DBColumn5: TcxGridDBColumn;
    DBGVista2DBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    RzSplitter1: TRzSplitter;
    Panel1: TPanel;
    RzLabel2: TRzLabel;
    btnCanceladosBoton: TRzBitBtn;
    cxGrid2: TcxGrid;
    DBGVista3: TcxGridDBTableView;
    DBGVista3DBColumn1: TcxGridDBColumn;
    DBGVista3DBColumn2: TcxGridDBColumn;
    DBGVista3DBColumn3: TcxGridDBColumn;
    DBGVista3DBColumn4: TcxGridDBColumn;
    DBGVista3DBColumn6: TcxGridDBColumn;
    DBGVista3DBColumn7: TcxGridDBColumn;
    DBGVista3DBColumn8: TcxGridDBColumn;
    DBGVista3DBColumn9: TcxGridDBColumn;
    DBGVista3DBColumn10: TcxGridDBColumn;
    DBGVista3DBColumn11: TcxGridDBColumn;
    DBGVista3DBColumn5: TcxGridDBColumn;
    DBGVista3DBColumn12: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    MemoViewer: TRzRichEdit;
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
    procedure btnrem2Click(Sender: TObject);
    procedure ConvertiraventaRemisionada1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idpedido,cliente:string;

    constructor inicializa(const cli:string);
    procedure mostrar_registros;
    procedure mostrar_datos;
//    procedure SiHayPagos;
  end;

var
  frmVistaVtasCliente: TfrmVistaVtasCliente;

implementation

uses Urecursos, Udmrep, Ubusquedas, Udm, Ucobros, Uprincipal, Upedidos,
  UfrmPagosDebe, Uclientes, UFechaAplicacion, UMensajeCliente,
  USaldarCortesias;

{$R *.dfm}


constructor TfrmVistaVtasCliente.inicializa(const cli:string);
begin
cliente:=cli;
edbuscar.Text := cli;

btncobros.Enabled:=true;
btnclientes.enabled:=true;
btntarjeta.enabled:=true;
btnestadoc.enabled:=true;
btnrem2.enabled:=true;
querys(' select p.FechaFactura,p.idfactura,p.idpedido,p.FechaCreacion,p.TotMn ,if(p.estatus =0,''PED'',if(p.estatus =1,''CAN'',if(p.estatus =2 ,''BACK'',if (p.estatus =3 ,''REM'',if (p.estatus in(4,6) ,''FAC'',IF(p.estatus=5,"REM2","")))))) as Estado,'+
       ' p.FechaVencimiento,u.codigo as Code,p.concepto,if (p.saldado=1,''SI'',''NO'') AS saldado,p.idUnidadNegocio, '+
       //' if(p.estatus=1,0,p.Saldo) as Saldo '+
       ' p.Saldo '+
       'from pedidos as p left join usuarios as u ON (u.idusuario=p.idvendedor) '+
       ' where p.idcliente ='+quotedstr(cli)+' group by p.idpedido order by p.idpedido desc',0,dmreportes.sqlgeneral5);

if dmreportes.sqlgeneral5.FieldByName('idpedido').AsString <> '' then  begin
//querys('SELECT cant,dp.piezas,dp.cod_cve,a.nombre,if (cant>0,truncate(((cant*dp.costo)*tc)*1.1,3),truncate(((dp.piezas*dp.costo)*tc)*1.1,3)) as importe,dp.costo as precio,if (cant>0,truncate(((cant*dp.costo)),3),   '+
//       'truncate(((dp.piezas*dp.costo)),3)) as ImpDlls FROM DetPedido as dp  INNER JOIN articulos as a on (a.cod_cve=dp.cod_cve)  where idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString),0,dmreportes.sqlgeneral6);
querys('SELECT cant,dp.piezas,dp.cod_cve,a.nombre,if (cant>0,truncate(((cant*dp.costo)*tc)*'+floattostr(1+getIVA)+',2),truncate(((dp.piezas*dp.costo)*tc)*'+floattostr(1+getIVA)+',2)) as importe,dp.costo as precio,if (cant>0,truncate(if(dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),2),   '+
       'truncate(if(dp.tc <> 1,dp.piezas*dp.costo,(dp.piezas*dp.costo)/p.TipoCambio),2)) as ImpDlls FROM DetPedido as dp  INNER JOIN articulos as a on (a.cod_cve=dp.cod_cve) left join pedidos as p on (p.idpedido=dp.idpedido) where dp.idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString),0,dmreportes.sqlgeneral6);
if(dmreportes.sqlgeneral5.RecordCount >0) then
   idpedido := dmreportes.sqlgeneral5.FieldByName('idpedido').AsString;
                                             //  in(0,1,2,4,10,5,6, 7, 8,11,12)
querys('select idpago,FechaAlta,cargo,abono,restante,idremicion,idfactura,FechaVence,notas,movimiento,idpago,usuario '+
       'from PagosClientes where idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString)+' '+
       'and movimiento <> 3 order by idpago asc',0,dmreportes.sqlgeneral7);

querys('Select c.idcliente,cf.NombreCres as Nombre,'+Clientenombre('c')+' as NombreInstalacion, '+
            'cf.rsocial as Razon_Social,c.dir,c.numero, c.ciudad,c.estado,c.Saldo as s,c.bloqueado as b '+
            'From clientes c left join ClientesFact cf on c.idfact = cf.idfact where c.idcliente= '+cli,0,sqlbuscar);
mostrar_datos;



end; //si hay datps

end;


procedure TfrmVistaVtasCliente.mostrar_registros;
begin
idpedido:=DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString;

//querys('SELECT distinct cant,dp.piezas,dp.cod_cve,a.nombre,if (cant>0,truncate(((cant*dp.costo)*tc)*1.1,3),truncate(((dp.piezas*dp.costo)*tc)*1.1,3)) as importe,if (cant>0,truncate((dp.costo*tc)*1.1,3),truncate((dp.costo*tc)*1.1,3)) '+
//       ' as precio FROM DetPedido as dp LEFT JOIN articulos as a on (a.cod_cve=dp.cod_cve) where idpedido='+quotedstr(idpedido),0,dmreportes.sqlgeneral6);
querys('SELECT cant,dp.piezas,dp.cod_cve,a.nombre,if (cant>0,truncate(((cant*dp.costo)*tc)*(1+p.piva),2),truncate(((dp.piezas*dp.costo)*tc)*(1+p.piva),2)) as importe,'+
        'dp.costo as precio,if (cant>0,truncate(if(dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),2),   '+
       'truncate(if(dp.tc <> 1,dp.piezas*dp.costo,(dp.piezas*dp.costo)/p.TipoCambio),2)) as ImpDlls FROM DetPedido as dp  INNER JOIN articulos as a on (a.cod_cve=dp.cod_cve) left join pedidos as p on (p.idpedido=dp.idpedido) where dp.idpedido='+quotedstr(dmreportes.sqlgeneral5.FieldByName('idpedido').AsString),0,dmreportes.sqlgeneral6);
                                                                                       //    in(0,1,2,4,10,5,6, 7, 8,11,12)
querys('select FechaAlta,cargo,abono,restante,movimiento,notas,idremicion,idfactura,FechaVence,TipoPago,idpago,usuario '+
'from PagosClientes where idpedido='+quotedstr(idpedido)+' and movimiento <> 3 '+
'order by idpago asc ',0,dmreportes.sqlgeneral7);

end;


procedure TfrmVistaVtasCliente.DBGVista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  mostrar_registros;
  if DBGVista1.Controller.FocusedItem.EditValue<>null then
    MemoViewer.Text:=DBGVista1.Controller.FocusedItem.EditValue;
end;

procedure TfrmVistaVtasCliente.DBGVista2CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
MemoViewer.Text:=DBGVista2.Controller.FocusedItem.EditValue;
end;

procedure TfrmVistaVtasCliente.DBGVista3CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
MemoViewer.Text:=DBGVista3.Controller.FocusedItem.EditValue;
end;

procedure TfrmVistaVtasCliente.FormClose(Sender: TObject;
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

procedure TfrmVistaVtasCliente.DBGVista1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if ((key=40) or (key=38) or (key=33) or (key=34)) then
mostrar_registros;
DBGVista1.BeginUpdate;
DBGVista1.DataController.ClearSorting(true);
DBGVista1.Columns[DBGVista1.Controller.FocusedColumnIndex].SortOrder:= soAscending;
DBGVista1.EndUpdate;

end;

procedure TfrmVistaVtasCliente.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmVistaVtasCliente.Mostrar_datos;
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
end;


procedure TfrmVistaVtasCliente.btnbuscarClick(Sender: TObject);
var temp : string;
begin
   try
     sqlbuscar.Close;
     sqlbuscar.SQl.Clear;
     case cbofiltro.ItemIndex of
       0: sqlbuscar.SQL.Add('Select clientes.idcliente, '+ClienteNombre('clientes')+' as Nom,ClientesFact.NombreCres as Nombre,ClientesFact.rsocial as Razon_Social,clientes.dir, ' +
                            'clientes.numero, clientes.ciudad,clientes.estado,clientes.Saldo as s,clientes.bloqueado as b From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where clientes.idcliente='+quotedstr(edbuscar.Text)+'  order by clientes.idcliente');
       1: sqlbuscar.SQL.Add('Select clientes.idcliente,'+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,clientes.dir,clientes.numero, '+
                            ' clientes.ciudad,clientes.estado,clientes.Saldo as s,clientes.bloqueado as b From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where NombreCres like '+quotedstr('%'+edbuscar.Text+'%')+' order by ClientesFact.NombreCres');
       2: sqlbuscar.SQL.Add('Select clientes.idcliente,clientes.Saldo, '+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,clientes.dir,clientes.numero, '+
                            ' clientes.ciudad,clientes.estado,clientes.bloqueado as b From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where  ClientesFact.rsocial like '+quotedstr('%'+edbuscar.Text+'%')+'  order by clientes.idcliente');
       {telefonos}
       3: begin
          case length(edbuscar.Text) of
             7: temp := midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,7);
             8: temp := AnsiReplaceText(edbuscar.Text,'-','');
            13: temp :=  midstr(edbuscar.Text,1,3)+'-'+midstr(edbuscar.Text,4,3)+'-'+midstr(edbuscar.Text,7,7);
            15: temp := AnsiReplaceText(edbuscar.Text,'-','');
          end;
          sqlbuscar.SQL.Add('Select clientes.idcliente,'+ClienteNombre('clientes')+' as Nom,ClientesFact.NombreCres as Nombre,ClientesFact.rsocial as Razon_Social,clientes.dir, ' +
                            'clientes.numero, clientes.ciudad,clientes.estado,clientes.Saldo as s,clientes.bloqueado as b FROM clientes INNER JOIN telefonos ON '+
                            ' (clientes.idtel = telefonos.idtel) left join ClientesFact on clientes.idfact = ClientesFact.idfact WHERE telefonos.telefono LIKE '+quotedstr('%'+edbuscar.text+'%')+' or telefonos.telefono LIKE '+quotedstr('%'+temp+'%')+' group by clientes.idcliente order by clientes.idcliente');
          end;


       4: sqlbuscar.SQL.Add('Select clientes.idcliente,clientes.Saldo as s,'+ClienteNombre('clientes')+' as Nombre,ClientesFact.rsocial as Razon_Social,clientes.dir,clientes.numero,'+
                            ' clientes.ciudad,clientes.estado,clientes.bloqueado as b From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where  clientes.dir like '+quotedstr('%'+edbuscar.Text+'%')+'  order by clientes.idcliente');
       5: sqlbuscar.SQL.add('Select clientes.idcliente,clientes.Saldo as s,'+ClienteNombre('ClientesFact')+' as Nombre,clientes.bloqueado as b From clientes inner join pedidos on clientes.idcliente = pedidos.idcliente inner join ClientesFact on ClientesFact.idfact = clientes.idfact where pedidos.idpedido='+quotedstr(edbuscar.text));
       6: sqlbuscar.SQL.Add('Select clientes.idcliente,clientes.Saldo as s,'+ClienteNombre('ClientesFact')+' as Nombre,clientes.bloqueado as b From clientes inner join pedidos on clientes.idcliente = pedidos.idcliente inner join ClientesFact on ClientesFact.idfact = clientes.idfact inner join RemiFact on RemiFact.idpedido = ' +
                            ' pedidos.idpedido where RemiFact.idremicion='+quotedstr(edbuscar.text)+' group by clientes.idcliente ');
       7: sqlbuscar.SQL.Add('Select clientes.idcliente,clientes.Saldo as s,'+ClienteNombre('ClientesFact')+' as Nombre,clientes.bloqueado as b From clientes inner join pedidos on clientes.idcliente = pedidos.idcliente inner join ClientesFact on ClientesFact.idfact = clientes.idfact inner join RemiFact on RemiFact.idpedido = ' +
                            ' pedidos.idpedido where RemiFact.idFactura='+quotedstr(edbuscar.text)+' ');
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
            btnrem2.enabled:=false;


           end
        else
         begin

        if sqlbuscar.RecordCount > 1 then begin

         frmbusquedas.query:='Select clientes.idcliente,ClientesFact.NombreCres as Nombre,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as NombreInstalacion,ClientesFact.rsocial as Razon_Social,clientes.dir,clientes.numero, '+
                             ' clientes.ciudad,clientes.estado,clientes.Saldo as s,clientes.bloqueado as b From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where ClientesFact.NombreCres like '+quotedstr('%'+edbuscar.Text+'%')+' order by ClientesFact.Nombre asc'; //concat(clientes.nombre,'+quotedstr(' ')+',clientes.apaterno,'+quotedstr(' ')+',clientes.amaterno) like '+quotedstr('%'+edbuscar.Text+'%')+' order by clientes.apaterno');

       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Numero';
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.cbofiltro.ItemIndex:=0;
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
             cliente := frmbusquedas.resultado;

             querys('Select clientes.idcliente,ClientesFact.NombreCres  as Nombre,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as NombreInstalacion,ClientesFact.rsocial as Razon_Social,clientes.dir,clientes.numero, '+
                    ' clientes.ciudad,clientes.estado,clientes.Saldo as s,clientes.bloqueado as b From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where clientes.idcliente= '+quotedstr(cliente)+' ',0,sqlbuscar);
             mostrar_datos;
        end else begin
             mostrar_datos;
        end; // if sqlbuscar > 1
        inicializa(cliente);
         end;
        except
         edbuscar.Text:='';
        end;
end;

procedure TfrmVistaVtasCliente.cbofiltroClick(Sender: TObject);
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

procedure TfrmVistaVtasCliente.edbuscarChange(Sender: TObject);
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
    btnrem2.enabled:=false;
  end;
end;

procedure TfrmVistaVtasCliente.edbuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edbuscar.Text<>'') then
 begin
  key :=#0;
  btnbuscar.Click;
 end;
end;

procedure TfrmVistaVtasCliente.DBGVista1DblClick(Sender: TObject);
var //forma:Tfrmcobros;
    mdipedidos : tfrmpedidos;

begin
   mdipedidos:=Tfrmpedidos.Create(self);
  frmprincipal.ucprincipal.Log('Acceso la Pantalla de Pedidos',0);
  mdipedidos.inicializa(DMREPORTES.DS2.DataSet.FieldByName('idpedido').AsString);
  mdipedidos.Show;

end;

procedure TfrmVistaVtasCliente.FormShow(Sender: TObject);
begin
cbofiltro.ItemIndex := 0;
self.WindowState:=wsMaximized;
edbuscar.setfocus;

end;

procedure TfrmVistaVtasCliente.btncobrosClick(Sender: TObject);
var hija:TfrmPagosDebe;
begin
     hija:=TfrmPagosDebe.Create(self);
     hija.inicializa(cliente);
     hija.Show;

end;

procedure TfrmVistaVtasCliente.btnestadocClick(Sender: TObject);
var fecha1,fecha2,valor1,valor2,valor3,valor4,total,total1,total2,cobrador,sector,idcontacto,nota1,nota2,nota3:string;
//ban:integer;
begin
//buscarEstCuenta;
if cliente <> '' then begin

//busca contacto

with dmreportes do begin
  querys('SELECT ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) AS nombre,c.idcliente as cuenta,c.ciudad,c.estado,c.numero as numero,'+
         'c.dir,col.cp,col.nombre as col,c.sector as sector,idcontacto FROM clientes AS c LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) WHERE c.idcliente='+quotedstr(cliente),0,sqlgeneral);

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
          querys('SELECT  concat(nombre,'' '',apaterno,'' '',amaterno) AS nombre, min(idcontador)  from contactos where idcontacto='+quotedstr(idcontacto)+' and (nombre <> ''TELEFONO 1'' and  nombre <> ''TELEFONO 2''  ) group by idcontacto',0,sqlgeneral);
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

    querys('select idpago,pc.idpedido as ped from PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4,6) and movimiento = 1',0,sqlgeneral2);

    querys('INSERT INTO temporal_estadocuenta'+frmprincipal.idmaq+'(mov,idcliente,saldo,idpedido,cobrador,estatus,contacto,idpago) SELECT pc.movimiento,pc.idcliente,pc.restante,pc.idpedido,'+quotedstr(cobrador)+',0,'+quotedstr(idcontacto)+',pc.idpago FROM PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4) AND pc.restante <> 0 AND pc.movimiento in(0,1) ',1,sqlgeneral);
   if sqlgeneral2.FieldByName('idpago').AsString  <> '' then begin
     while not sqlgeneral2.Eof do begin

         querys('DELETE FROM temporal_estadocuenta'+frmprincipal.idmaq+' WHERE  idpedido='+quotedstr(sqlgeneral2.FieldByName('ped').AsString)+' and mov =0 ',1,sqlgeneral3);
         sqlgeneral2.Next;
     end;                                                                                          //idpago='+quotedstr(sqlgeneral2.FieldByName('idpago').AsString)+' and
   end;

   querys('SELECT idpago,idpedido,idcliente,cargo,FechaAlta,FechaVence,if(FechaVence > "'+datetostr(date)+'",1,0) as estatus  FROM PagosClientes WHERE idcliente='+quotedstr(cliente)+' and movimiento in(0,1) order by idpedido',0,sqlgeneral);     // and saldado = 0  and (estatus=3 or estatus=4)

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
               't.idpedido,p.concepto,l.nombre as negocio,t.estatus  FROM clientes AS c LEFT JOIN ClientesFact as cf on(cf.idfact=c.idfact) LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) LEFT JOIN temporal_estadocuenta'+frmprincipal.idmaq+' as t ON (t.idcliente=c.idcliente) LEFT JOIN pedidos AS p ON (p.idpedido=t.idpedido) LEFT JOIN DetPedido AS dp ON '+
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

procedure TfrmVistaVtasCliente.btntarjetaClick(Sender: TObject);
var fecha,total,tel,contac:string;
begin


with dmreportes do begin

querys('SELECT c.idcliente as idcliente,cf.RFCCres as rfc,c.curp, cf.NombreCres  AS nombre,cf.DirCres as dir,c.sector,concat(ifnull(cf.CdCres,'' '' ),'' '', ifnull(cf.EstadoCres,'' '')) as ciudad,c.estado,c.st_date,c.TotComprado,'+
       'c.saldo as CliSaldo,c.precio,c.idtel as idtel, c.idcontacto as idcontacto,cf.ColCres as colonia,cf.CPCres as cp,c.UltimaCompra,c.PlazoCredito,c.credito,IF(c.bloqueado=1,''S'',''N'') as bloqueado,c.email,c.tipocont,c.idabogado, '+
       ' Concat(u.nombre,'' '',u.apaterno,'' '',u.amaterno)  AS vendedor FROM clientes as c LEFT JOIN ClientesFact as cf on(cf.idfact=c.idfact) '+
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

      querys('SELECT * FROM telefonos WHERE idtel='+quotedstr(tel)+' ORDER BY idtel ASC',0,dmreportes.sqlgeneral2);
      querys('SELECT c.idcontador,c.idcontacto,c.nivel,concat(c.nombre,'' '',c.apaterno,'' '',c.amaterno) as contacto,t.telefono,tipo_tel,t.extencion FROM contactos as c LEFT JOIN  telefonos as t ON (t.idtel=c.idtel) WHERE idcontacto='+quotedstr(contac),0,dmreportes.sqlgeneral3);
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

procedure TfrmVistaVtasCliente.btnclientesClick(Sender: TObject);
var forma:tfrmclientes;
begin
forma:=tfrmclientes.Create(self);
frmprincipal.ucprincipal.Log('Acceso a la Pantalla de clientes',0);
forma.inicializa(cliente);
forma.Show;
end;

procedure TfrmVistaVtasCliente.DBGVista1KeyPress(Sender: TObject;
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

procedure TfrmVistaVtasCliente.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #27 then
edbuscar.setfocus;
end;

procedure TfrmVistaVtasCliente.FormActivate(Sender: TObject);
begin
self.WindowState:=wsMaximized;
with dmreportes do
  begin
  if sqlgeneral5.Active = true then
    sqlgeneral5.Refresh;
  if sqlgeneral6.Active = true then
    sqlgeneral6.Refresh;
  if sqlgeneral7.Active = true then
    sqlgeneral7.Refresh;
  end;
end;

procedure TfrmVistaVtasCliente.Referencia1Click(Sender: TObject);
var idcliente,  costo, fechavence:string; //pedido,
begin
idcliente := cliente;
idpedido := DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString;
querys('select FechaVencimiento, TotMn from pedidos where idpedido='+idpedido,0,dmreportes.sqlgeneral1);
costo := dmreportes.sqlgeneral1.fieldbyname('TotMn').asstring;
fechavence := dmreportes.sqlgeneral1.fieldbyname('FechaVencimiento').asstring;
  showmessage('Referencia : '+ ReferenciaBanco(cliente, DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString) +chr(13)+
              '                OXXO '+ CodBarrasOxxo(idcliente, idpedido, costo, fechavence) +chr(13)+
              '                '+ CodBarrasBBVA(idcliente, idpedido, costo, fechavence) +chr(13)+
              '                '+ CodBarrasBanorte(idcliente, idpedido, costo, fechavence) + chr(13)+
              '* Oxxo, BBVA, y Banorte varian si cuenta con parcialidades');
end;

procedure TfrmVistaVtasCliente.btnmovimientosClick(Sender: TObject);
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
frmmensajecliente.memo1.Lines.Add('11      Abono desde una Nota de Credito Para Remisiones (Cuadre)');
frmmensajecliente.memo1.Lines.Add('12      Abono previo Traspaso para Facturacion Electronica');
frmmensajecliente.ShowModal;
end;

procedure TfrmVistaVtasCliente.btnCanceladosBotonClick(Sender: TObject);
begin
 if btnCanceladosBoton.ImageIndex = 2 then
   begin
        btnCanceladosBoton.ImageIndex := 6;
        btnCanceladosBoton.Caption := 'Muestra los Pagos de Movimientos';
        btnCanceladosBoton.Hint := 'Muestra los movimientos como cobros ,parcialidades,aplicaciones de notas de credito etc...';
        querys('select FechaAlta,cargo,abono,restante,movimiento,notas,idremicion,idfactura,FechaVence,TipoPago,idpago,usuario '+
               'from PagosClientes where idpedido='+quotedstr(idpedido)+' and movimiento in(3) order by idpago asc ',0,dmreportes.sqlgeneral7);

    end
       else
    begin
         btnCanceladosBoton.ImageIndex := 2;               //  in(0,1,2,4,10,5,6,7,8,11)
         btnCanceladosBoton.Caption := 'Muestra los Pagos Cancelados';
         btnCanceladosBoton.Hint := ' Solo muestra los movimientos cancelados de esa venta';
         querys('select FechaAlta,cargo,abono,restante,movimiento,notas,idremicion,idfactura,FechaVence,TipoPago,idpago,usuario '+
         'from PagosClientes where idpedido='+quotedstr(idpedido)+' and movimiento <> 3 order by idpago asc ',0,dmreportes.sqlgeneral7);
     end;

end;

procedure TfrmVistaVtasCliente.btnrem2Click(Sender: TObject);
var hija:TfrmSaldarCortesias;
begin
//if (frmprincipal.AreaUsuario = 'COBRANZA') or ((frmprincipal.AreaUsuario = 'ADMINISTRACION') and (frmprincipal.PuestoUsuario = 'GERENTE')) or (frmprincipal.AreaUsuario = 'SISTEMAS') then
if DerechosSys('Nota de Credito a Remision') then
  begin
  hija := TfrmSaldarCortesias.Create(Self);
  frmprincipal.ucprincipal.Log('Acceso al Reporte de Remisiones Saldadas',0);
  hija.inicializa(lbcuenta.Caption);
  hija.Show;
  end
else
  application.MessageBox('Usted no tiene derechos para usar esta pantalla', 'Atencion', MB_ICONINFORMATION);

end;

procedure TfrmVistaVtasCliente.ConvertiraventaRemisionada1Click(
  Sender: TObject);
var saldo:string;
begin
  if (DBGVista1.DataController.DataSet.FieldByName('Estado').AsString = 'REM2') then//and (DBGVista1.DataController.DataSet.FieldByName('saldado').AsString = 'NO' ))
     begin
         //se elimina el movimiento 11
         querys('delete from PagosClientes where idpedido='+DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString+
         ' and movimiento=11',1,dmreportes.sqlgeneral7);
         //calculamos el saldo
         querys('select (sum(cargo)-sum(abono)) as restante from PagosClientes where idpedido='+
         DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString,0,dmreportes.sqlgeneral7);
         saldo:=dmreportes.sqlgeneral7.fieldbyname('restante').asstring;
         querys('update pedidos set estatus = 3, saldo='+saldo+', saldado=0 where idpedido = '+
         DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString,1,dmreportes.sqlgeneral7);
         querys('update PagosClientes set restante='+saldo+' where idpedido='+
         DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString+' and movimiento=0',1,dmreportes.sqlgeneral7);
         querys('select idcliente from pedidos where idpedido='+
         DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString,0,dmreportes.sqlgeneral7);
         bpcambios('clientes', dmreportes.sqlgeneral7.fieldbyname('idcliente').AsString, 'idcliente');
         querys('update clientes c, ( select sum(saldo) as saldo, idcliente from ( select if(p.estatus=1,0,p.Saldo) as Saldo, '+
         'idcliente  from pedidos as p where p.idcliente ='+dmreportes.sqlgeneral7.fieldbyname('idcliente').AsString+
         ' group by p.idpedido ) as tbl group by idcliente ) as f set c.saldo = f.saldo where c.idcliente=f.idcliente', 1, dmreportes.sqlgeneral3);
         apcambios('idcliente', dmreportes.sqlgeneral7.fieldbyname('idcliente').AsString, 'clientes', 'frmVistaVtasCliente');
         frmprincipal.ucprincipal.Log('Regreso el pedido en remision2 a pedido remisionado : '+
         DBGVista1.DataController.DataSet.FieldByName('idpedido').AsString,0);
         //insertar en notas
         querys('select idnota from clientes where idcliente='+lbcuenta.Caption,0,DMREPORTES.sqlgeneral3);
         if(dmreportes.sqlgeneral3.fieldbyname('idnota').AsInteger > 0) then
            querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
                   dmreportes.sqlgeneral3.fieldbyname('idnota').AsString+',"BONIFICACIONES",'+
                   '"Movimiento que paso de REM2 a REM del Pedido '+DMREPORTES.DS2.DataSet.FieldByName('idpedido').AsString+
                   ' COMENTADO POR '+frmprincipal.ucprincipal.CurrentUser.LoginName+' DE '+frmprincipal.AreaUsuario+' CON EL PUESTO '+
                   frmprincipal.PuestoUsuario+' EL '+datetostr(FechaServidor)+' A LAS '+timetostr(HoraServidor)+
                   '",0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
                   ',CURTIME(),CURDATE(),"NC REM2 a REM",'+lbcuenta.Caption+')',1,DMREPORTES.sqlgeneral4)
          else
          begin
            if(querys('select max(idnota) as id from notas',0,DMREPORTES.sqlgeneral3) >0) then
              querys('update clientes set idnota='+dmreportes.sqlgeneral3.fieldbyname('id').AsString+' where idcliente='+lbcuenta.Caption,1,dmreportes.sqlgeneral3);
              querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+
                   dmreportes.sqlgeneral3.fieldbyname('idnota').AsString+',"BONIFICACIONES",'+
                   '"Movimiento que paso de REM2 a REM del Pedido '+DMREPORTES.DS2.DataSet.FieldByName('idpedido').AsString+
                   ' COMENTADO POR '+frmprincipal.ucprincipal.CurrentUser.LoginName+' DE '+frmprincipal.AreaUsuario+' CON EL PUESTO '+
                   frmprincipal.PuestoUsuario+' EL '+datetostr(FechaServidor)+' A LAS '+timetostr(HoraServidor)+
                   '",0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',CURTIME(),CURDATE(),"NC REM2 a REM",'+lbcuenta.Caption+')',1,DMREPORTES.sqlgeneral4)
          end;

         btnbuscar.OnClick(Self);
     end;
end;


procedure TfrmVistaVtasCliente.PopupMenu1Popup(Sender: TObject);
begin
if (DBGVista1.DataController.DataSet.FieldByName('Estado').AsString <> 'REM2') then
  ConvertiraventaRemisionada1.Enabled := false
else
  if DerechosSys('Convertir a venta remisionada') = true then
  //if ((frmprincipal.PuestoUsuario = 'GERENTE') and (frmprincipal.AreaUsuario = 'COBRANZA')) or (frmprincipal.AreaUsuario = 'SISTEMAS') then
    ConvertiraventaRemisionada1.Enabled := true;

end;

end.
