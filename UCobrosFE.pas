{///////////////////////////////////////////////////////////////////////////////
2012/06/27 dalyla correccion en pagos ox prob si no tenia recargos
2012/06/04 dalyla correccion de elim de recargos ox y ba
2012/06/01 dalyla facturar con el folio que se desee, 10 sectores
2012/04/12-13 dalyla eliminar recargos por pagos en banco del mismo mes
--------------------------------------------------------------------------------
TipoCobro
  0: Bancos
  1: Caja
  2: Caja2 o extra
  3: Sector
  4: CSI
}///////////////////////////////////////////////////////////////////////////////
unit UCobrosFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, RzEdit, RzRadGrp, RzCmboBx, Mask, RzBtnEdt,
  RzLabel, RzPanel, RzSplit, RzButton, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin,
  MemDS, DBAccess, MyAccess, LMDCustomComponent, LMDContainerComponent,
  LMDBaseDialog, LMDCustomCheckListDlg, LMDCheckListDlg, StrUtils;

type
   TipoPago = Record
   inicial,banco : string;
   aplicaDescuento : integer;
   end;

type
  TfrmCobrosFE = class(TForm)
    RzPanel1: TRzPanel;
    btncobrar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    btnimprimir: TRzBitBtn;
    RzPanel2: TRzPanel;
    SPpanel: TRzSplitter;
    rgventa: TRzGroupBox;
    rgcliente: TRzGroupBox;
    rgCobro: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    lsaldovta: TRzLabel;
    lsaldoparc: TRzLabel;
    lcuenta: TRzLabel;
    lnombre: TRzLabel;
    lsector: TRzLabel;
    lsaldocte: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel18: TRzLabel;
    edventa: TRzButtonEdit;
    edfactura: TRzButtonEdit;
    dtfecha: TRzDateTimeEdit;
    edtc: TRzEdit;
    edcobro: TRzEdit;
    edcheque: TRzEdit;
    cbtipopago: TRzComboBox;
    cbbanco: TRzComboBox;
    rgmoneda: TRzRadioGroup;
    ednotas: TRzMemo;
    ckdescuento: TRzCheckBox;
    RzLabel3: TRzLabel;
    edfolio: TRzButtonEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    btncobros: TRzBitBtn;
    fuentes: TFontDialog;
    DBparcialidades: TcxGrid;
    vParc: TcxGridDBTableView;
    cxNotas: TcxGridDBColumn;
    csFechaCorta: TcxGridDBColumn;
    cxCantidad: TcxGridDBColumn;
    cxidpago: TcxGridDBColumn;
    LParc: TcxGridLevel;
    lfechavta: TRzLabel;
    lfechavence: TRzLabel;
    lrestante: TRzLabel;
    lnotas: TRzLabel;
    lnotaspagos: TRzLabel;
    mmpagos: TRzMemo;
    dbmnotas: TRzMemo;
    lbtitulo: TRzLabel;
    lbcuenta: TRzLabel;
    lbnombre: TRzLabel;
    lbsector: TRzLabel;
    lbsaldocta: TRzLabel;
    lbdlls: TRzLabel;
    lbmn: TRzLabel;
    lbsaldovta: TRzLabel;
    lbsaldoparc: TRzLabel;
    sqlgeneral: TMyQuery;
    lbtotalCSI: TRzLabel;
    sqlparcialidades: TMyQuery;
    sqlpagos: TMyQuery;
    dsparcialidades: TDataSource;
    dspagos: TDataSource;
    lbcancelado: TRzLabel;
    dtaplicacion: TRzDateTimeEdit;
    RzLabel4: TRzLabel;
    lbconcepto: TRzLabel;
    BorrarPed: TLMDCheckListDlg;
    RzLabel5: TRzLabel;
    edctaban: TRzEdit;
    procedure btncobrarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgmonedaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncobrosClick(Sender: TObject);
    procedure vParcDblClick(Sender: TObject);
    procedure edventaButtonClick(Sender: TObject);
    procedure edventaKeyPress(Sender: TObject; var Key: Char);
    procedure edfacturaButtonClick(Sender: TObject);
    procedure edfacturaKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure edfolioButtonClick(Sender: TObject);
    procedure edfolioChange(Sender: TObject);
    procedure edfolioKeyPress(Sender: TObject; var Key: Char);
  private

    saldado, Transaccion, TipoMovimiento, ban,
    UnidadNegocio, Rem, CargoAutomatico, TipoCobro, MasRem : Integer;

    TotalCSI, cobro, pesos, resta, DescCargoAuto : Double;
    abono, moneda, restacadena, cheque, banco, tipo, TipoP,
    folio, pedidoCSI, RemisionCSI, FechaCSI, nota, idpago, idremision :string;
    function ValidarPedido(id:string):integer;
    function ValidaCobro:boolean;
    function UsuarioImpFact:boolean;

    procedure BuscarVentaLocate;
    procedure MostrarGrid;
    procedure limpiar;
    procedure Guardar;
    procedure Monitoreo;
    procedure CobroCSI;
    //procedure BuscarSaldos;
    procedure Imprimir;
    procedure ImprimirFE;
    procedure actualizar(operador:string);
    procedure BuscarLocate;
    procedure ImpresionTipoCobro;
    procedure RemisionarVenta;
    procedure VisiblePagos(c:integer);
    procedure OtroPago(idcliente, saldo:string);
    procedure buscarfacturalocate;
    { Private declarations }
  public
    procedure inicializa(tipo:integer);
    { Public declarations }
  end;

var
  frmCobrosFE: TfrmCobrosFE;
  FechaAplica :TDate;
  ArregloTipoPago: array of TipoPago;
  
implementation

uses Udm, Udmrep, Uprincipal, Ubusquedas, Urecursos, URemiFac, Upedidos,
  UFechaAplicacion, Umesesremision, UfrmPagosDebe, DateUtils;

{$R *.dfm}

procedure TfrmCobrosFE.btncobrarClick(Sender: TObject);
var TipoP:string;
begin
if btncobrar.Caption='&Cobrar' then
  begin
  saldado:=0;
  TipoP:='';
  unidadNegocio:=0;
  mmpagos.Clear;
  lbcancelado.Caption:='';
  idpago:=''; idremision:='';
  btncobrar.Enabled:=false;
  btncancelar.Enabled:=false;
  btncerrar.Caption:='C&ancelar';
  edfolio.Text:='';
  edfolio.Enabled:=false;
  //rgdocumentos.Enabled:=true;
  edventa.Enabled:=true;
  edfactura.Enabled:=true;
  dtfecha.date:=dtaplicacion.date;
  rgmoneda.ItemIndex := 0;
  ckDescuento.Visible := false;
  TipoMovimiento := -1;


 with frmbusquedas do
   begin
   query:='Select c.idcliente, '+ClienteNombre('c')+' as Nombre, c.estatus as Estatus, c.bloqueado as Bloqueado, '+
          'cf.DirCres as Direccion, c.numero as Numero, c.ciudad as Ciudad, c.estado as Estado '+
          'From clientes as c left join ClientesFact as cf ON(cf.idcliente=c.idcliente) order by c.idcliente';
   campo_retorno:='idcliente';
   campo_busqueda:='Numero';
   tblorigen := 'clientes';
   tabla:='clientes';
   cbofiltro.ItemIndex:=0;
   cbofiltro.OnClick(self);
   ShowModal;
   if frmbusquedas.resultado <> '' then
     begin
     lbcuenta.Caption := resultado;
 
     //mostrar mensaje si esta cancelado o bloqueado...
     EstatusCliente(lbcuenta.Caption,sqlgeneral);
     querys('select idabogado from clientes as c where c.idcliente ='+lbcuenta.Caption,0,sqlgeneral);  // cliente
         if (sqlgeneral.fieldbyname('idabogado').AsInteger <> 0) and (tipocobro = 3) then
           begin
           btncancelar.onclick(self);
           exit;
           end;
 
     querys('SELECT p.idcliente as IdCliente, p.idpedido ,if(pc.idfactura > 0, pc.idfactura,0) as IDFactura, '+
            'p.FechaCreacion, p.TotMn as ImporteNeto, p.FechaVencimiento, p.concepto  '+
            'FROM pedidos as p INNER JOIN clientes as c ON c.idcliente=p.idcliente LEFT JOIN PagosClientes as pc '+
            'ON pc.idpedido=p.idpedido WHERE p.idcliente= '+lbcuenta.Caption+' and p.estatus in(0,3,4) and '+
            'p.saldado = 0 '+
            //'and p.FechaCreacion >  ''2005/02/01'' '+
            'group by p.idpedido ',0,sqlgeneral);
 
     MaxRow := sqlgeneral.RecordCount+1;
     MasRem := sqlgeneral.RecordCount;
 
     query:='SELECT p.idcliente as IdCliente, p.idpedido, case p.estatus when 0 then "PED" when 3 then "REM" '+
            'when 4 then "FACT" end as Estatus, pc.idfactura as IDFactura, p.concepto, p.FechaVencimiento, '+
            'p.FechaCreacion, p.TotMn as ImporteNeto FROM pedidos as p INNER JOIN clientes as c ON c.idcliente = p.idcliente '+
            'LEFT JOIN PagosClientes as pc ON pc.idpedido=p.idpedido LEFT JOIN ClientesFact as dc ON dc.idcliente = p.idcliente '+
            'WHERE p.idcliente= '+lbcuenta.Caption+' and p.estatus in(0,3,4) and p.saldado=0 '+
            //'and p.FechaCreacion > ''2005/02/01'' '+
            'group by p.idpedido order by p.FechaCreacion desc';
     campo_retorno:='idpedido';
     campo_busqueda:='idpedido';
     tabla:='';
     tblorigen:='pedidos';
     ShowModal;
     if resultado <> '' then
       begin
       edventa.Text:=resultado;
       maxrow := 0;
 
       /// aqui vamos a validar que si es una remision cobre normal, si no tener que remisionar la venta.....
       querys('select p.estatus as estatus, p.idcliente as idcliente, p.idfactura, p.TotMn as TotMn, un.instalacion as inst, '+
              'p.idUnidadNegocio as unNeg from pedidos as p left join UnidadNegocio as un ON un.idUnidadNegocio = '+
              'p.idUnidadNegocio where p.idpedido = '+edventa.text,0,sqlgeneral);

       edfactura.Text :=  sqlgeneral.fieldbyname('idfactura').asstring;
       //UnidadNegocio:= sqlgeneral.fieldbyname('unNeg').asInteger;
 
       if validarpedido(edventa.Text) <> 1 then
         exit;
 
       //NECESITA REMISIONAR?
       if sqlgeneral.fieldbyname('estatus').asstring = '0' then
         begin
         if sqlgeneral.fieldbyname('inst').asstring = '1'  then
           begin
           application.MessageBox('Esta venta no se puede remisionar en este proceso, solo en la opcion de pedidos!','Atención',mb_iconInformation);
           exit;
           end
         else
           begin
           if application.MessageBox('Deseas remisionar este pedido?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
             begin
            { if validarpedido(edventa.Text) = 1 then
               begin   }
               querys('select idremicion from folios',0,dmreportes.sqlgeneral);
               rem := dmreportes.sqlgeneral.fieldbyname('idremicion').AsInteger+1;
               Application.CreateForm(TfrmRemiFac, frmRemiFac);
               //#cfd
               frmremifac.inicializa(true,false,strtoint(edventa.Text),inttostr(rem), 'N');
               frmremifac.ShowModal;
               querys('select FechaVencimiento,idUnidadNegocio from pedidos where idpedido='+edventa.Text,0,dmreportes.sqlgeneral2);
               if dmreportes.sqlgeneral2.recordcount > 0 then
                  unidadNegocio:= dmreportes.sqlgeneral2.fieldbyname('idUnidadNegocio').asInteger;
 
               bpcambios('clientes', sqlgeneral.fieldbyname('idcliente').asstring, 'idcliente');
               querys('update clientes set UltimaCompra="'+datetostr(date)+'", saldo = saldo + "'+
                      sqlgeneral.fieldbyname('TotMn').asstring+'", TotComprado = TotComprado + "'+
                      sqlgeneral.fieldbyname('TotMn').asstring+'" where idcliente='+
                      sqlgeneral.fieldbyname('idcliente').asstring,1,dmreportes.sqlgeneral);
               apcambios('idcliente', sqlgeneral.fieldbyname('idcliente').asstring, 'clientes', 'frmcobros');
 
               querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,'+
                      'usuario,fecha,hora,restante) values (0,"'+sqlgeneral.fieldbyname('idcliente').asstring+'","'+
                      edventa.Text+'",'+inttostr(rem)+',"'+datetostr(date)+'", "'+sqlgeneral.fieldbyname('TotMn').asstring+
                      '", "'+dmreportes.sqlgeneral2.fieldbyname('FechaVencimiento').asstring+'", "'+
                      frmprincipal.ucprincipal.CurrentUser.LoginName+'", "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss', time)+
                      '", "'+sqlgeneral.fieldbyname('TotMn').asstring+'")',1,dmreportes.sqlgeneral);
               querys('update folios set idremicion='+inttostr(rem),1,dmreportes.sqlgeneral);
               //actualiza el estatus
               querys('Update pedidos set estatus = 3, FechaCierre= "'+datetostr(date)+'" where idpedido='+edventa.text,1,dmreportes.sqlgeneral);
               //ya remisiona siguimos.............
            {   end
             else
               exit;}
             end;   //validar pedido
           end; //no remisionar
         end; //ocuap remisionar
 
       buscarventalocate;
       end;
     end
   else
     begin
     edventa.setfocus;
     end;
   end;
  end
else
  begin
  //GUARDAR
  Guardar;
  end;
end;

function TfrmcobrosFE.validarpedido(id:string):integer;
  var  mdipedidos : tfrmpedidos;
begin
querys('select * from DetPedido where idpedido='+quotedstr(id),0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
  begin
  if  application.messagebox('Esta venta no tiene detalles de articulos!, por lo tanto no se puede aplicar un cobro ó facturar, deseas ver el pedido?','Atención',mb_yesno+mb_IconWarning) = idyes  then
    begin
    btncobrar.Caption:='&Cobrar';
    mdipedidos:=Tfrmpedidos.Create(self);
    frmprincipal.ucprincipal.Log('Acceso la Pantalla de Pedidos',0);
    mdipedidos.inicializa(id);
    mdipedidos.Show;
    result := 0
    end
  else
    begin
    application.MessageBox('No se puede aplicar cobro a esta venta!','Atención',mb_IconInformation);
    btncobrar.Caption:='&Cobrar';
    btncerrar.OnClick(self);
    result := 0
    end;
  end
else
  result := 1;
end;

procedure TfrmcobrosFE.BuscarVentaLocate;
begin
querys('SELECT idpago FROM PagosClientes WHERE idpedido='+quotedstr(edventa.Text),0,SqlGeneral);
if SqlGeneral.FieldByName('idpago').AsString <> '' then
  begin
  querys('SELECT max(r.idfactura) as factura, dc.NombreCres as Cliente, c.sector as sec, dt.flcargo as '+
         'CargoAutomatico, p.concepto, p.idcliente as id, p.saldado as saldado, c.saldo as total '+
         'FROM pedidos as p inner join clientes as c on c.idcliente=p.idcliente left join ClientesFact '+
         'as dc ON dc.idfact=c.idfact LEFT JOIN RemiFact AS r ON r.idpedido=p.idpedido LEFT JOIN '+
         'DetClientes as dt on dt.idcliente=c.idcliente WHERE p.idpedido = "'+edventa.text+'" group by p.idpedido',0,sqlgeneral);
  // si hay algo que cobrar entonces
  if sqlgeneral.FieldByName('saldado').AsInteger = 0 then
    begin
    lbcuenta.Caption := sqlgeneral.FieldByName('id').AsString;
    lbnombre.Caption := sqlgeneral.FieldByName('Cliente').AsString;
    lbsaldocta.Caption := floattostr(sqlgeneral.FieldByName('total').AsFloat);
    lbsector.caption := sqlgeneral.FieldByName('sec').AsString;
    lbconcepto.caption := sqlgeneral.FieldByName('concepto').AsString;
    edfactura.Text := sqlgeneral.fieldbyname('factura').asstring;

    if (sqlgeneral.FieldByName('CargoAutomatico').AsString = '1') then
      CargoAutomatico := 1
    else
      CargoAutomatico := 0;

    querys('SELECT sum(restante) as saldo FROM PagosClientes  WHERE  idpedido = "'+edventa.Text+'" and movimiento <> 3',0,sqlgeneral);
    lbsaldovta.Caption := Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);

    edventa.enabled:=false;
    edfactura.enabled:=false;

    //buscamos que la venta tenga parcialidas
    mostrargrid;

    //CSI//
    if tipocobro = 4 then
      begin
      application.MessageBox('Seleccione el pedido a afectar de la cuenta 10000, en otro caso se cancelara el cobro', 'Atencion', MB_ICONINFORMATION);
      with frmbusquedas do
        begin
        query:='Select p.idpedido, round(sum(pc.cargo), 2) as cargo, round(sum(pc.abono), 2) as abono, round(sum(pc.restante), 2) as restante, p.FechaCreacion '+
        'from pedidos as p left join PagosClientes as pc on p.idpedido=pc.idpedido where p.idcliente = 10000 and p.estatus = 3 '+
        'and movimiento <> 3 group by p.idpedido having abono > 0';

        campo_retorno:='idpedido';
        campo_busqueda:='idpedido';
        tblorigen := 'pedidos';
        maxrow := 2;
        showmodal;
        if resultado <> '' then
          begin
          pedidoCSI := resultado;
          querys('Select sum(pc.abono) as restante, idremicion, FechaAlta from pedidos as p left join PagosClientes as pc '+
               'on p.idpedido=pc.idpedido where p.idpedido = '+pedidoCSI+' and movimiento = 2 group by p.idpedido', 0, dmreportes.sqlgeneral7);
          totalCSI := dmreportes.sqlgeneral7.fieldbyname('restante').AsFloat;
          lbtotalcsi.caption := floattostr(totalcsi);
          remisionCSI := dmreportes.sqlgeneral7.fieldbyname('idremicion').AsString;
          FechaCSI := dmreportes.sqlgeneral7.fieldbyname('FechaAlta').AsString;
          end
        else
          btncerrar.OnClick(self);
        end;
      end;
    end
  else
    begin//esta saldada.....
    application.MessageBox('Esa venta esta saldada!','Atención',mb_iconwarning);
    if  tipocobro = 1 then
      close;
    end;
  end
else
  begin
  application.MessageBox('Esa venta no esta realizada!','Atención',mb_iconwarning);
  edventa.Text:='';
  edventa.SetFocus;
  end;//if recordcount
end;

procedure TfrmcobrosFE.inicializa(tipo:integer);
begin
ShortDateFormat:='yyyy/mm/dd';

saldado:=0;         cobro:=0;         resta:=0;
pesos:=0;           Transaccion:=0;   tipocobro:=0;
TipoMovimiento := -1;
btncobrar.SetFocus;
Case tipo of
  0: //Bancos
    begin
    TipoCobro:=0;
    lbtitulo.Caption := 'Cobros';
    Application.MessageBox('Seleccione la fecha de aplicacion', 'Atencion', MB_ICONINFORMATION);
    dtaplicacion.Date:= date;
    dtaplicacion.enabled := true;
    dtaplicacion.SetFocus;
    end;

  1: //Caja
    begin
    tipocobro := 1;
    lbtitulo.Blinking := true;
    lbtitulo.Caption := 'Cobros en Caja';
    lbtitulo.Font.Color := clRed;
    FechaAplica := date;
    dtaplicacion.Date:= date;
    end;

  2: //Caja2 o extra
    begin
    tipocobro:=2;
    lbtitulo.Blinking:=true;
    lbtitulo.Caption:='Caja Auxiliar';
    lbtitulo.Font.Color:=clRed;
    FechaAplica:=FechaServidor;
    dtaplicacion.Date:= date;
    end;

  3: //Sector
    begin
    tipocobro:=3;
    lbtitulo.Caption := 'Cobros por Sector';
    lbtitulo.Font.Color:=clBlue;
    FechaAplica:=FechaServidor;
    dtaplicacion.Date:= date;
    end;

  4: //CSI
    begin
    tipocobro := 4;
    lbtitulo.Caption := 'Clientes Identificados';
    Application.MessageBox('Seleccione la fecha de aplicacion', 'Atencion', MB_ICONINFORMATION);
    dtaplicacion.Date:= date;
    dtaplicacion.enabled := true;
    dtaplicacion.SetFocus;
    lbtotalCSI.visible := true;
    end;
  end;



if TipoCobro = 0 then
  querys('SELECT concat("(", iniciales, ")", nombre) as nom, aplicaDescuento, banco FROM TiposPagos '+
         'where tipo = 0 ORDER BY idTipoPago asc',0,sqlgeneral)
else
  querys('SELECT concat("(", iniciales, ")", nombre) as nom, aplicaDescuento, banco FROM TiposPagos '+
         'where tipo in (1,2) ORDER BY idTipoPago asc',0,sqlgeneral);

if (sqlgeneral.RecordCount > 0) then
  SetLength(ArregloTipoPago,sqlgeneral.RecordCount)
else
  SetLength(ArregloTipoPago,1);

cbTipoPago.Clear;
while not sqlgeneral.eof do
  begin
  cbTipoPago.Items.Add(sqlgeneral.fieldbyname('nom').asstring);
  ArregloTipoPago[sqlgeneral.RecNo-1].inicial := sqlgeneral.fieldbyname('nom').asstring;
  ArregloTipoPago[sqlgeneral.RecNo-1].aplicaDescuento := sqlgeneral.fieldbyname('aplicaDescuento').AsInteger;
  ArregloTipoPago[sqlgeneral.RecNo-1].banco := sqlgeneral.fieldbyname('banco').asstring;
  sqlgeneral.Next;
  end;//while

CargaCombo2('SELECT concat("(",iniciales,") ",nombre) as nom, idTipoBanco FROM TiposBancos ORDER BY idTipoBanco asc', 'nom', 'idTipoBanco', cbbanco );
{querys('SELECT concat(''('',iniciales,'')'',nombre) as nom FROM TiposBancos ORDER BY idTipoBanco asc',0,sqlgeneral);
cbbanco.Clear;
while not sqlgeneral.eof do
  begin
  cbbanco.Items.Add(sqlgeneral.fieldbyname('nom').asstring);
  sqlgeneral.Next;
  end;//while}

//buscar descuento en configuraciones
querys('Select valor from configuraciones where concepto ='+quotedstr('DescuentoCargoAuto')+' ',0,sqlgeneral);
if (sqlgeneral.FieldByName('valor').AsString <> '' ) then
  DescCargoAuto := (sqlgeneral.FieldByName('valor').AsFloat/100)
else
  DescCargoAuto := 0;


end;

procedure TfrmCobrosFE.MostrarGrid;
begin
querys('SELECT idpago FROM PagosClientes WHERE idpedido='+edventa.Text+' and movimiento = 1 limit 1',0,sqlgeneral);
if sqlgeneral.fieldbyname('idpago').asstring = '' then
  querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion,movimiento '+
         'FROM PagosClientes WHERE idpedido='+edventa.text+' AND restante > 0',0,sqlparcialidades)
else
  querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion,movimiento '+
         'FROM PagosClientes WHERE idpedido='+edventa.text+' AND restante > 0 AND movimiento = 1',0,sqlparcialidades);

if sqlparcialidades.recordcount > 1 then
  begin
  SPpanel.Percent:=0;
  //rgdocumentos.Enabled:=true;
  DBparcialidades.setfocus;
  end
else
  begin
  dtfecha.date:=dtaplicacion.date;
  idpago:=sqlparcialidades.fieldbyname('idpago').AsString;
  lbsaldovta.Caption:=Format('%8.2f',[sqlparcialidades.fieldbyname('restante').Asfloat]);
  edcobro.Text := trim(Format('%8.2f',[sqlparcialidades.fieldbyname('restante').Asfloat]));
  cobro:=strtofloat(Format('%8.2f',[sqlparcialidades.fieldbyname('restante').AsFloat]));
  lbsaldoparc.caption:=Format('%8.2f',[sqlparcialidades.fieldbyname('restante').asfloat]);
  idremision:=sqlparcialidades.fieldbyname('idremicion').AsString;
  if sqlparcialidades.fieldbyname('movimiento').AsInteger = 1 then
    nota:='Pago de '+ sqlparcialidades.fieldbyname('notas').AsString
  else
    nota:='Pago de la venta';

  rgcobro.Enabled:=true;
  btncobrar.Enabled:=true;
  btncobrar.Caption:='&Guardar';
  btncobrar.Hint:='Guardar los datos de la alta';
  ednotas.text:=nota;
  btncobrar.ImageIndex:=1;
  edventa.Enabled:=false;
  edfactura.Enabled:=false;

  edcobro.Enabled:=true;
  ednotas.Enabled:=true;
  cbTipoPago.enabled:=true;
  querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
  edtc.Text:=trim(Format('%8.2f',[sqlgeneral.Fields.Fields[0].asfloat]));
  try
    lbdlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edcobro.Text) / strtofloat(edtc.Text) )]);
    lbmn.caption:='Cobro en MN : '+edcobro.text;
  except
    lbmn.caption:='Cobro en MN : ';
    end;
  edtc.enabled:=true;
  edtc.SetFocus;
  cbTipoPago.itemindex:=0;
  if strtofloat(edcobro.text) = 0 then
    btncerrar.onclick(self);
  end;
end;

procedure TfrmCobrosFE.btncerrarClick(Sender: TObject);
begin
TipoMovimiento := -1;
if ban = 1 then
  begin
  application.MessageBox('No puedes cerrar la pantalla hasta que termines el cobro','Atención',mb_iconwarning);
  exit;
  end;

if btncerrar.Caption='C&ancelar' then
  begin
  if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then
    begin
    btncobrar.Caption:='&Cobrar';
    btncobrar.Hint:='Dar de Alta un cobro';
    btncobrar.ImageIndex:=5;
    btncobrar.enabled:=true;
    btncerrar.Hint:='Cerrar esta Pantalla';
    btncerrar.Caption:='C&errar';
    limpiar;
    edfolio.Enabled:=true;
    edfolio.Text:='';
    SPpanel.Percent:=100;
    edventa.enabled:=false;
    edfactura.enabled:=false;
    edfolio.setfocus;
    ednotas.enabled:=false;
    end
  else //pregunta ?
    try
      edventa.setfocus;
    except
      btncobrar.setfocus;
    end;
  end
else
  close;
end;

procedure TfrmCobrosFE.FormCreate(Sender: TObject);
begin
Self.Height := 645;
Self.Width := 585;

end;

procedure TfrmcobrosFE.limpiar;
begin
    edtc.Text:='';
    edventa.text:='';
    edfactura.text:='';
    lbsaldovta.Caption:='';
    lbsaldocta.Caption:='';
    lbnombre.Caption:='';
    lbcuenta.caption:='';
    lbsector.Caption:='';
    edfolio.Text:='';
    rgmoneda.itemindex := -1;
    cbbanco.ItemIndex:=-1;
    edcheque.Text:='';
    edctaban.Text:='';
    lbmn.Caption:='Cobro en MN :';
    lbdlls.Caption:='Cobro en DLLS :';
    edcobro.text:='';
    cbTipoPago.ItemIndex:=-1;
    lbsaldoparc.Caption:='';
    btnimprimir.Enabled:=false;
    ckDescuento.Checked := false;
    ckDescuento.enabled := false;
end;

procedure TfrmCobrosFE.Guardar;
var  cob, cantidad, totalInteres : Double; idpedidoInteres :string;
begin
  if ValidaCobro = false then
    exit;

  unidadNegocio:=0;
  querys('select idUnidadNegocio from pedidos where idpedido = '+edventa.text,0,sqlgeneral);
  if sqlgeneral.recordcount > 0 then
    unidadNegocio:= sqlgeneral.fieldbyname('idUnidadNegocio').asinteger;

  if unidadNegocio = 4 then   //4 = MONITOREO
    monitoreo;

  if rgmoneda.itemindex = 1 then
  begin
    cob:=strtofloat(Format('%8.2f',[(strtofloat(edcobro.Text)* strtofloat(edtc.Text))]));
    moneda:='D';
  end
  else
  begin
    cob:=strtofloat(edcobro.Text);
    moneda:='P';
  end;

  abono:=Format('%8.2f',[cob]);

  if edcheque.text <> '' then
    cheque:=edcheque.text;

  if cbbanco.Text <> '' then
    banco:=cbbanco.text[2]+cbbanco.text[3];

  if tipocobro = 0 then
    tipo:='0'
  else
    tipo:='1';

  querys('Select idpago from PagosClientes where idpago='+quotedstr(idpago)+' and restante > 0',0,sqlgeneral);
  if sqlgeneral.fieldbyname('idpago').asstring <> '' then
  begin
    if(ckDescuento.checked =true) and (ckDescuento.enabled = true) then
    begin
      //actualizar tablas de clientes , pedidos,detpedidos, pagos clientes con el nuevo descuento.
      bpcambios('clientes', lbcuenta.caption, 'idcliente');
      querys('update clientes,PagosClientes set saldo = round((saldo -  cargo ) + (restante - (restante * '+
             floattostr(DescCargoAuto)+')  ),2), CantUltCompra=round((CantUltCompra -  restante ) + (restante - '+
             '(restante * '+floattostr(DescCargoAuto)+')  ),2), TotComprado=round((TotComprado -  restante ) + '+
             '(restante - (restante * '+floattostr(DescCargoAuto)+')  ),2) where clientes.idcliente='+
             quotedstr(lbcuenta.Caption)+' and PagosClientes.idpago ='+quotedstr(idpago),1,sqlgeneral);
      apcambios('idcliente', lbcuenta.caption, 'clientes', 'frmcobros');

      querys('update pedidos,PagosClientes set Saldo = round((Saldo -  restante ) + (restante - (restante * '+
           floattostr(DescCargoAuto)+')) ,2),TotMn=round((TotMn -  restante) + (restante - (restante * '+
           floattostr(DescCargoAuto)+')) ,2), TotDlls = round((TotDlls-(restante/pedidos.TipoCambio)) + '+
           '((restante/pedidos.TipoCambio) - ((restante - (restante * '+floattostr(DescCargoAuto)+
           ')  ) )/pedidos.TipoCambio),2),Iva = round((Iva -((restante/'+floattostr(1+getIVA)+')*'+floattostr(getIVA)+')) +  ((restante -(restante*'+
           floattostr(DescCargoAuto)+'))/'+floattostr(1+getIVA)+')*'+floattostr(getIVA)+',2), SubTotal = round( (SubTotal - (restante / '+floattostr(1+getIVA)+')) + '+
           '((restante - (restante * '+floattostr(DescCargoAuto)+')  )  / '+floattostr(1+getIVA)+')  ,2) where pedidos.idpedido='+
           'PagosClientes.idpedido and PagosClientes.idpago ='+quotedstr(idpago),1,sqlgeneral);

      querys('update DetPedido,PagosClientes,pedidos set costo = round( costo - (costo *  ('+
           floattostr(DescCargoAuto)+')) ,2) where DetPedido.idpedido= PagosClientes.idpedido and '+
           'pedidos.idpedido = PagosClientes.idpedido and PagosClientes.idpago ='+
           quotedstr(idpago),1,sqlgeneral);

      querys('update PagosClientes set cargo = round((cargo - (cargo * '+floattostr(DescCargoAuto)+
           ')),2), restante = round((restante - (restante * '+floattostr(DescCargoAuto)+')  ),2) where '+
           'PagosClientes.idpago = '+quotedstr(idpago),1,sqlgeneral);
    end;

    if tipocobro = 4 then
    begin
      TipoMovimiento := 8;
      ednotas.text :=  'Pago de la Venta, Deposito Realizado con fecha '+FechaCSI;
    end
    else
      TipoMovimiento := 2;

    querys('INSERT INTO PagosClientes (moneda,cheque,ctaban,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
           'idpedido,abono,idfactura,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,notas) '+
           'values("'+moneda+'", "'+cheque+'", "'+edctaban.text+'", "'+banco+'", "'+cbTipoPago.Text[2]+cbTipoPago.Text[3]+'", "'+
           Format('%8.2f',[strtofloat(edtc.Text)])+'", "'+idpago+'", "'+lbcuenta.Caption+'", "'+
           edventa.text+'", "'+abono+'", "'+edfactura.Text+'", "'+idremision+'", "'+inttostr(TipoMovimiento)+
            '", "'+frmprincipal.ucprincipal.CurrentUser.loginname+'", "'+datetostr(date)+'", "'+datetostr(date)+
         '", "'+Formatdatetime('HH:mm:ss', time)+'", "'+dtfecha.text+'", "'+tipo+'", "'+ednotas.text+'")',1,sqlpagos);

    //ELIMINAR RECARGOS CON PAGO OXXO
    if (cbTipoPago.Text[2]+cbTipoPago.Text[3]) = 'OX' then
    begin
      if querys('Select idpedidoInteres as xidpedidoint from PedidoInteres where idpedido='+edventa.text, 0, sqlgeneral) > 0 then
      begin
        idpedidoInteres := sqlgeneral.fieldbyname('xidpedidoint').asstring;

        querys('Select sum(restante) as xtotal from PagosClientes where idpedido = '+ idpedidoInteres +
               ' and movimiento <> 3 group by idpedido', 0, sqlgeneral);
        totalInteres := sqlgeneral.fieldbyname('xtotal').asfloat;

        if totalInteres > 0 then
        begin
          querys('Delete from PagosClientes where idpedido ='+idpedidoInteres, 1, sqlgeneral);
          querys('Delete from RemiFact where idpedido ='+idpedidoInteres, 1, sqlgeneral);
          querys('Delete from DetPedido where idpedido ='+idpedidoInteres, 1, sqlgeneral);
          querys('Delete from pedidos where idpedido ='+idpedidoInteres, 1, sqlgeneral);
          querys('Delete from PedidoInteres where idpedido ='+idpedidoInteres, 1, sqlgeneral);
          frmprincipal.ucprincipal.Log('PROCESO AUTOMATICO- Elimino los recargos por pago en OXXO del pedido: '+edventa.text, 3);
        end;
      end;
    end;

    //ELIMINAR RECARGOS CON PAGO BANCO FECHA PAGO DEL MISMO MES
    if ((cbTipoPago.Text[2]+cbTipoPago.Text[3]) = 'BA') then
    begin
      querys('Select FechaRemision from pedidos where idpedido='+edventa.text, 0, sqlgeneral);
      if (MonthOf(dtfecha.Date) = MonthOf(sqlgeneral.fieldbyname('FechaRemision').AsDateTime)) and
          (YearOf(dtfecha.Date) = YearOf(sqlgeneral.fieldbyname('FechaRemision').AsDateTime)) then
        if(querys('Select idpedidoInteres as xidpedidoint from PedidoInteres where idpedido='+edventa.text, 0, sqlgeneral)) > 1 then
        begin
          idpedidoInteres := sqlgeneral.fieldbyname('xidpedidoint').asstring;

          querys('Select sum(restante) as xtotal from PagosClientes where idpedido = '+ idpedidoInteres +
                ' and movimiento <> 3 group by idpedido;', 0, sqlgeneral);
          totalInteres := sqlgeneral.fieldbyname('xtotal').asfloat;

          if totalInteres > 0 then
          begin
           querys('Delete from PagosClientes where idpedido ='+idpedidoInteres, 1, sqlgeneral);
           querys('Delete from RemiFact where idpedido ='+idpedidoInteres, 1, sqlgeneral);
           querys('Delete from DetPedido where idpedido ='+idpedidoInteres, 1, sqlgeneral);
           querys('Delete from pedidos where idpedido ='+idpedidoInteres, 1, sqlgeneral);
           querys('Delete from PedidoInteres where idpedido ='+idpedidoInteres, 1, sqlgeneral);
           frmprincipal.ucprincipal.Log('PROCESO AUTOMATICO- Elimino los recargos por pago en BANCO del pedido: '+edventa.text, 3);
          end;
        end;
      end;
    end
    else
    begin
      application.MessageBox('Ya fue aplicado un pago a este cobro,cancele el cobro que esta realizando por que ya fue realizado,solicite informacion!','Atención',mb_IconInformation);
      exit;
    end;

    //////////////////  CSI   //////////////////////
    if tipocobro = 4 then
    begin
      CobroCSI;
    end;

    querys('select max(idpago) as id from PagosClientes where idcliente="'+lbcuenta.Caption+'" and movimiento='+
           inttostr(TipoMovimiento)+' and idpedido="'+edventa.text+'"',0,SqlPagos);
    edfolio.Text:=SqlPagos.FieldByName('id').asstring;

    querys('select nombre from TiposPagos where banco="S" and iniciales="'+cbTipoPago.Text[2]+cbTipoPago.Text[3]+'"',0,sqlgeneral);
    if sqlgeneral.FieldByName('nombre').AsString <> '' then
      TipoP:=TipoP+' '+sqlgeneral.FieldByName('nombre').AsString+' '+edcheque.Text;

    frmprincipal.ucprincipal.Log('Dio de Alta el cobro:'+edfolio.text+ ' de la venta '+edventa.text,1);

    ///////SI LA CANTIDAD ES MAYOR QUE QUE EL COBRO QUE INDIQUE A QUE PARCILIDAD VA A AFECTAR////////////
    cantidad:=strtofloat(abono);
    pesos:=cantidad + pesos;
    if (cantidad > cobro ) then
    begin
      btncobrar.Enabled:=false;
      restacadena:=Format('%8.2f',[(cantidad - cobro)]);
      resta:=strtofloat(Format('%8.2f',[(cantidad - cobro)]));
      querys('UPDATE PagosClientes SET restante=0 WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
      querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edfolio.text)+','+
             quotedstr(idpago)+','+quotedstr(abono)+')',1,sqlgeneral);

      //preguntar si desea imprimir recibo por pago de parcialidad
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir;

      if application.MessageBox(pchar('El cobro realizado es mayor que la parcialidad, escoja la siguiente parcialidad que afectara!,la cantidad sobrante es :'+restacadena+''),'Atención',mb_yesno)=idyes then
      begin
        ban:=1;
        mostrargrid;
      end;
    end //cantidad > cobro
    else
    begin
      if (cantidad = cobro ) then
      begin
        querys('UPDATE PagosClientes SET restante=0 WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
        querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edfolio.text)+','+
               quotedstr(idpago)+','+quotedstr(abono)+')',1,sqlgeneral);
        actualizar('-');
      end
      else
      begin
        if (cantidad < cobro ) then
        begin
          querys('UPDATE PagosClientes SET restante=(restante - '+floattostr(cantidad)+') WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
          querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edfolio.text)+','+
                 quotedstr(idpago)+','+quotedstr(abono)+')',1,sqlgeneral);
          actualizar('-');
          if application.MessageBox(pchar('Desea realizar otro pago al cobro?, faltan :('+floattostr(cobro-cantidad)+') para saldar el cobro'),'Atención',mb_yesno+mb_IconInformation) = idyes then
          begin
            OtroPago(lbcuenta.caption, floattostr(cobro-cantidad));
          end;//if application
        end;//if <
      end;//=

      //MODIFICACION\\
      querys('Select idinstal, instpend from pedidos where idpedido='+edventa.Text+' and instpend = 1', 0, sqlgeneral);
      if sqlgeneral.fieldbyname('instpend').asstring = '1' then
      begin
        querys('Update instalaciones set estatus = 0 where idinstalacion='+sqlgeneral.fieldbyname('idinstal').asstring, 1, sqlgeneral);
        querys('Update pedidos set instpend = 0 where idpedido='+edventa.Text, 1, sqlgeneral);
    end; //cantidad < cobro

    //MODIFICACION\\
    if unidadNegocio = 4 then   //4 = MONITOREO
    begin
      with frmmesesremision do
      begin
        querys('update ConcentradoAbonosxMonitoreo set m1='+inttostr(m1)+',m2='+inttostr(m2)+',m3='+inttostr(m3)+
               ',m4='+inttostr(m4)+',m5='+inttostr(m5)+',m6='+inttostr(m6)+',m7='+inttostr(m7)+',m8='+inttostr(m8)+
               ',m9='+inttostr(m9)+',m10='+inttostr(m10)+',m11='+inttostr(m11)+',m12='+inttostr(m12)+
               ' where idcliente = '+lbcuenta.Caption+' and anio = "'+inttostr(anio)+'"',1,sqlgeneral);
      end;
    end;

    if saldado = 0 then
    begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir
      else
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
    end
    else     //No SALDADO
      ImpresionTipoCobro;

////////////////////////////////////////////////////////////////////////////////
///////                                                                  ///////
///////                 AQUI YA SE REALIZO EL COBRO                      ///////
///////                                                                  ///////
////////////////////////////////////////////////////////////////////////////////

    if MasRem > 1 then
    begin
      if application.MessageBox('Deseas hacer otro cobro a una remision del mismo cliente?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      begin
        OtroPago(lbcuenta.caption, '0');
      end
      else
      begin
        edfolio.Enabled:=true;
        btncancelar.Enabled:=true;
        btncobrar.Enabled:=true;
        btncobrar.Caption:='&Cobrar';
        btncobrar.Hint:='Dar de Alta un cobro';
        btncerrar.Caption:='C&errar';
        btncerrar.Hint:='Cerrar esta Ventana';
        edcobro.Enabled:=false;
        ednotas.Enabled:=false;
        cbTipoPago.enabled:=false;
        edtc.enabled:=false;
        buscarlocate;
        edfolio.setfocus;
      end;
    end
    else
    begin
      edfolio.Enabled:=true;
      btncancelar.Enabled:=true;
      btncobrar.Enabled:=true;
      btncobrar.Caption:='&Cobrar';
      btncobrar.Hint:='Dar de Alta un cobro';
      btncerrar.Caption:='C&errar';
      btncerrar.Hint:='Cerrar esta Ventana';
      edcobro.Enabled:=false;
      ednotas.Enabled:=false;
      cbTipoPago.enabled:=false;
      edtc.enabled:=false;
      buscarlocate;
      edfolio.setfocus;
    end;
  end;
end;

function TfrmCobrosFE.ValidaCobro:boolean;
var ab :Double;
begin
result := false;

if dtfecha.Text = '' then
  begin
  application.MessageBox('Debe tener una fecha','Atención',mb_iconwarning);
  edcobro.SetFocus;
  exit;
  end;

if (strtofloat(edcobro.text) > strtofloat(lbsaldovta.caption)) then
  begin
  application.MessageBox('El cobro no puede ser mayor que el saldo de la venta','Atención',mb_iconwarning);
  edcobro.SetFocus;
  exit;
  end;

if strtofloat(edcobro.Text) <=  0 then
  begin
  application.MessageBox('El cobro no puede ser cero','Atención',mb_iconwarning);
  edcobro.SetFocus;
  exit;
  end;

//CSI
if tipocobro = 4 then
  begin
  ab := strtofloat(Format('%8.2f',[strtofloat(trim(edcobro.text))]));
  if strtofloat(FormatFloat('#####.##', ab)) > (strtofloat(FormatFloat('#####.##', totalCSI))) then
    begin
    application.MessageBox('El cobro no puede ser mayor al saldo del pedido de la cuenta 10000','Atención',mb_iconwarning);
    edcobro.SetFocus;
    exit;
    end;
  end;
result := true;
end;

procedure TfrmCobrosFE.Monitoreo;
var tmp_pago, tmp_pago2 :Double;
begin
with frmmesesremision do
    begin
    querys('select m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12 from ConcentradoAbonosxMonitoreo where idcliente = '+
           lbcuenta.Caption,0,sqlgeneral);
    inicializa;
    if sqlgeneral.recordcount > 0 then
      begin
      m1:= sqlgeneral.fieldbyname('m1').asInteger;    m2:= sqlgeneral.fieldbyname('m2').asInteger;
      m3:= sqlgeneral.fieldbyname('m3').asInteger;    m4:= sqlgeneral.fieldbyname('m4').asInteger;
      m5:= sqlgeneral.fieldbyname('m5').asInteger;    m6:= sqlgeneral.fieldbyname('m6').asInteger;
      m7:= sqlgeneral.fieldbyname('m7').asInteger;    m8:= sqlgeneral.fieldbyname('m8').asInteger;
      m9:= sqlgeneral.fieldbyname('m9').asInteger;    m10:= sqlgeneral.fieldbyname('m10').asInteger;
      m11:= sqlgeneral.fieldbyname('m11').asInteger;  m12:= sqlgeneral.fieldbyname('m12').asInteger;
      end;

    ltitulo.Caption:= 'SELECCIONE LOS MESES A PAGAR';
    Update;
    ShowModal;
    tmp_pago:= Round(strtofloat(edcobro.Text) / cont);
    querys('select cat.CostoMensual as pago from clientes c, categorias cat where c.idcategoria = cat.idcategoria and c.idcliente = '+lbcuenta.Caption,0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      tmp_pago2:= Round(sqlgeneral.fieldbyname('pago').asFloat *  (1+(GetIVA)));
      if (tmp_pago < tmp_pago2-1) then
        begin
        if application.MessageBox('El pago que esta registrando es menor al que corresponde'+#13+'Desea continuar?','Advertencia',MB_YESNO+MB_ICONASTERISK) = IDNO then
          exit;
        end;
      end;
    end;
end;

procedure TfrmCobrosFE.CobroCSI;
begin
//actualizar tablas de clientes , pedidos,detpedidos, pagos clientes con el nuevo descuento.
    querys('update clientes,PagosClientes set saldo = round((saldo +  cargo ) - (restante - (restante * '+
           floattostr(DescCargoAuto)+')  ),2) where clientes.idcliente=10000 and PagosClientes.idpago ='+
           quotedstr(idpago),1,sqlgeneral);

    querys('update pedidos,PagosClientes set Saldo = round(Saldo - restante,2) '+
           //'Saldo = round((Saldo +  restante ) - (restante - (restante * '+ floattostr(DescCargoAuto)+')) ,2) '+
           'where pedidos.idpedido= '+pedidoCSI+' '+
           'and PagosClientes.idpago ='+quotedstr(idpago),1,sqlgeneral);

    querys('INSERT INTO PagosClientes (moneda,cheque,ctaban,TipoPago2,TipoPago,TipoCambio,idpago_afecta,idcliente,'+
           'idpedido,abono,idremicion,movimiento,usuario,FechaVence,fecha,hora,FechaAlta,TipoCobro,'+
           'notas, restante) values('+quotedstr(moneda)+','+quotedstr(cheque)+',"'+edctaban.text+'",'+quotedstr(banco)+','+
           quotedstr(cbTipoPago.Text[2]+cbTipoPago.Text[3])+','+
           quotedstr(Format('%8.2f',[strtofloat(edtc.Text)]))+','+quotedstr(idpago) +', 10000,'+
           quotedstr(pedidoCSI) +', '+floattostr(strtofloat(abono)*-1)+','+
           quotedstr(remisionCSI)+',7,'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
           ',"'+datetostr(date)+'",'+quotedstr(datetostr(FechaServidor))+',"'+FormatDateTime('HH:mm:ss', time)+'",'+quotedstr(dtfecha.text)+
           ', 1, "Deduccion por cuenta Identificada: '+lbcuenta.Caption+' del pedido: '+edventa.text+' ", '+
           'restante+('+floattostr(strtofloat(abono)*-1)+'))',1,sqlpagos);
    //movimiento 7 cargo por cliente identificado
end;

procedure TfrmCobrosFE.rgmonedaClick(Sender: TObject);
begin
if btncobrar.Caption = '&Guardar' then
  begin
  if (edcobro.Text <> '') and (edtc.text <> '') then
  begin
  if rgmoneda.ItemIndex = 1 then
    begin
    lbdlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edcobro.Text) / strtofloat(edtc.Text) )]);
    edcobro.text := Format('%8.2f',[( strtofloat(edcobro.text) / strtofloat(edtc.text)  )]);
    lbmn.caption:='Cobro en MN : '+Format('%8.2f',[( strtofloat(edcobro.text) * strtofloat(edtc.text)  )]);
    end
  else
    begin
    edcobro.text:=Format('%8.2f',[( strtofloat(edcobro.Text) * strtofloat(edtc.Text))]);
    lbmn.caption:='Cobro en MN : '+edcobro.text;
    lbdlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edcobro.Text) / strtofloat(edtc.Text) )]);
    end;
  end;
  end;
end;

{procedure TfrmcobrosFE.buscarsaldos;
begin
  querys('SELECT saldo FROM clientes WHERE idcliente='+quotedstr(lbcuenta.Caption),0,sqlgeneral);
  lbsaldocta.Caption:=floattostr(sqlgeneral.FieldByName('saldo').AsFloat);

  querys('SELECT sum(restante) as saldo FROM PagosClientes WHERE idpedido='+quotedstr(edventa.text),0,sqlgeneral);
  lbsaldovta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);
end;}

procedure TfrmcobrosFE.buscarlocate;
  var i:integer; cob:double;
begin
//busqueda de la orden por medio un locate esto si es oprimido el enter despues de haber tecleado un digito
querys('select * from PagosClientes where idpago='+quotedstr(edfolio.Text),0,SqlPagos);
if SqlPagos.FieldByName('idpago').asstring  <> '' then
  begin
  case  SqlPagos.FieldByName('movimiento').AsInteger of
         /////////////////MOSTRAR ESTATUS DEL PAGO////////////////////////
     0: begin
        lbcancelado.Caption:='MOV: VENTA';
        lbcancelado.Font.Color:=clwhite;
        visiblepagos(0);
        end;

     1: begin
        lbcancelado.Caption:='MOV: PARCIALIDAD';
        lbcancelado.Font.Color:=clwhite;
        visiblepagos(0);
        end;

     2: begin
        lbcancelado.Caption:='MOV: COBRO REALIZADO';
        lbcancelado.Font.Color:=clwhite;
        //letreropagos.Visible:=true;
        mmpagos.Visible:=true;
        visiblepagos(1);
        end;

     3: begin
        lbcancelado.Caption:='MOV: COBRO CANCELADO';
        lbcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

     4: begin
        lbcancelado.Caption:='MOV: ABONO x PARCIALIZACION';
        lbcancelado.Font.Color:=clwhite;
        visiblepagos(0);
        end;

     5: begin
        lbcancelado.Caption:='MOV: CANCELACION ABONO';
        lbcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

     6: begin
        lbcancelado.Caption:='MOV: NOTA/CREDITO';
        lbcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

     8: begin
        lbcancelado.Caption:='MOV: PAGO DE CUENTA IDENTIFICADA';
        lbcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

    10: begin
        lbcancelado.Caption:='MOV: ABONO-NOTA/CREDITO';
        lbcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;

    11: begin
        lbcancelado.Caption:='MOV: ABONO POR CORTESIAS';
        lbcancelado.Font.Color:=clred;
        visiblepagos(0);
        end;
     end;

  rgmoneda.itemindex := -1;
  edcheque.Text := SqlPagos.fieldbyname('cheque').AsString;
  edctaban.Text := SqlPagos.fieldbyname('ctaban').AsString;
  edventa.Text :=  SqlPagos.fieldbyname('idpedido').AsString;
  edcobro.Text := Format('%8.2f',[SqlPagos.fieldbyname('abono').Asfloat]);
  edfactura.Text := SqlPagos.fieldbyname('idfactura').AsString;
  edtc.text:= Format('%8.2f',[SqlPagos.fieldbyname('TipoCambio').Asfloat]);
  cob:=strtofloat(Format('%8.2f',[SqlPagos.fieldbyname('abono').Asfloat]));
  lbmn.caption:='Cobro en MN : '+ Format('%8.2f',[cob]);
  dtfecha.Date:=SqlPagos.fieldbyname('FechaAlta').AsDateTime;
  ednotas.Text:=SqlPagos.fieldbyname('notas').asstring;

  if (edcobro.text <> '0') then
    begin
    if SqlPagos.fieldbyname('moneda').AsString ='D' then
      begin
      rgmoneda.itemindex := 1;
      cob:=(strtofloat(edcobro.Text)/ strtofloat(edtc.Text));
      lbmn.Caption:='Cobro en MN : '+edcobro.text;
      edcobro.Text:=Format('%8.2f',[cob]);
      lbdlls.Caption:='Cobro en DLLS : '+edcobro.text;
      end;
    end
  else
    begin
    try
      cob:=(strtofloat(edcobro.Text) / strtofloat(edtc.Text));
    except
      cob:=0;
    end;
    lbmn.caption:='Cobro en MN : '+edcobro.Text;
    lbdlls.Caption :='Cobro en DLLS : '+Format('%8.2f',[cob]);
    rgmoneda.itemindex := 1;
    end;
  //end;

//buscar sus parcialidades o sus cargos pendientes a pagar......
querys('SELECT idpago FROM PagosClientes WHERE idpedido='+quotedstr(edventa.Text)+' and movimiento=1 limit 1',0,sqlgeneral);
  if sqlgeneral.fieldbyname('idpago').asstring = '' then
    querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion FROM PagosClientes WHERE idpedido='+quotedstr(edventa.text)+' AND restante > 0',0,sqlparcialidades)
  else
    querys('SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion FROM PagosClientes WHERE idpedido='+quotedstr(edventa.text)+' AND restante > 0 and movimiento =1',0,sqlparcialidades);

  ////////buscar datos cliente
  querys('SELECT  cf.NombreCres as nombre, c.saldo as sa,c.sector as s FROM clientes as c left join ClientesFact as cf ON(cf.idcliente=c.idcliente) WHERE  c.idcliente='+quotedstr(SqlPagos.fieldbyname('idcliente').AsString),0,sqlgeneral);
  lbnombre.Caption:=sqlgeneral.fieldbyname('nombre').AsString;
  lbsector.caption:=sqlgeneral.fieldbyname('s').AsString;
  lbsaldocta.Caption:=sqlgeneral.fieldbyname('sa').AsString;
  lbcuenta.Caption:=SqlPagos.fieldbyname('idcliente').AsString;

  EstatusCliente(lbcuenta.Caption,sqlgeneral);  //si esta cancelado o bloquedo.
  //////////buscar saldo de la venta
  querys('SELECT sum(restante) as saldo FROM PagosClientes  WHERE movimiento=1 and idpedido='+quotedstr(SqlPagos.fieldbyname('idpedido').AsString),0,sqlgeneral);
  if sqlgeneral.FieldByName('saldo').Asstring <> '' then
     lsaldovta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat])
  else
    begin
    querys('SELECT sum(restante) as saldo FROM PagosClientes WHERE movimiento=0 and idpedido='+quotedstr(SqlPagos.fieldbyname('idpedido').AsString),0,sqlgeneral);
    lsaldovta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);
    end;

  ////////////////////////////////
  btnimprimir.Enabled:=true;
  btncobrar.Enabled:=true;
  btncancelar.Enabled:=true;
  for i := 0 to cbtipopago.Items.Count - 1 do
    if cbtipopago.Items.Strings[i][2] + cbtipopago.Items.Strings[i][3] =  SqlPagos.fieldbyname('TipoPago').Asstring then      begin
      cbtipopago.text := cbtipopago.Items.Strings[i];
      break;
      end;

  //cargarcombo;
  for i := 0 to cbbanco.Items.Count - 1 do
    if cbbanco.Items.Strings[i][2] + cbbanco.Items.Strings[i][3] =  SqlPagos.fieldbyname('TipoPago2').Asstring then      begin
      cbbanco.text := cbbanco.Items.Strings[i];
      break;
      end;

  //buscar a los pagos afectados por el cobro
  querys('SELECT idpago2 FROM PagosAfecta WHERE idpago='+quotedstr(edfolio.Text),0,sqlgeneral);
  mmpagos.clear;
  while not sqlgeneral.eof do
    begin
    mmpagos.Lines.Add(sqlgeneral.fieldbyname('idpago2').asstring);
    sqlgeneral.next;
    end;
  end
else
  begin
  btncancelar.Enabled:=false;
  application.MessageBox('Ese Pago no Existe','Información',mb_ok+mb_iconinformation);
  limpiar;
  //SqlPagos.Active:=false;
  edfolio.SetFocus;
  btncancelar.Enabled:=false;
  end;// idarea
end;

procedure TfrmcobrosFE.RemisionarVenta;
var rem :integer;
begin
if application.MessageBox('Deseas remisionar este pedido?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
  begin
  querys('select idremicion from folios',0,dmreportes.sqlgeneral);
  rem:=dmreportes.sqlgeneral.fieldbyname('idremicion').AsInteger+1;
  Application.CreateForm(TfrmRemiFac, frmRemiFac);
  //#cfd
  frmremifac.inicializa(true,false,strtoint(edventa.Text),inttostr(rem), 'N');
  frmremifac.ShowModal;
  querys('select FechaVencimiento from pedidos where idpedido='+edventa.Text,0,dmreportes.sqlgeneral2);

  querys('SELECT p.idcliente as IdCliente, p.idpedido ,if(pc.idfactura > 0, pc.idfactura,0) as IDFactura, '+
            'p.FechaCreacion, p.TotMn as ImporteNeto, p.FechaVencimiento, p.concepto  '+
            'FROM pedidos as p INNER JOIN clientes as c ON c.idcliente=p.idcliente LEFT JOIN PagosClientes as pc '+
            'ON pc.idpedido=p.idpedido WHERE p.idpedido= '+edventa.Text+' and p.estatus in(0,3,4) and '+
            'p.saldado = 0 '+
            'group by p.idpedido',0,sqlgeneral);

  bpcambios('clientes', sqlgeneral.fieldbyname('idcliente').asstring, 'idcliente');
  querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',saldo=saldo+'+
         //quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+
         quotedstr(sqlgeneral.fieldbyname('ImporteNeto').asstring)+
         ',TotComprado=TotComprado + '+
         //quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+
         quotedstr(sqlgeneral.fieldbyname('ImporteNeto').asstring)+
         ' where idcliente='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring),1,dmreportes.sqlgeneral);
  apcambios('idcliente', sqlgeneral.fieldbyname('idcliente').asstring, 'clientes', 'frmcobros');

  querys('insert into PagosClientes(movimiento,idcliente,idpedido,idremicion,FechaAlta,cargo,FechaVence,usuario,fecha,hora,restante) values (0,'+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+','+quotedstr(edventa.Text)+','+inttostr(rem)+','+quotedstr(datetostr(FechaServidor))+', '+
         //' '+quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+
         ' '+quotedstr(sqlgeneral.fieldbyname('ImporteNeto').asstring)+
         ','+quotedstr(dmreportes.sqlgeneral2.fieldbyname('FechaVencimiento').asstring)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+','+
         //quotedstr(sqlgeneral.fieldbyname('TotMn').asstring)+
         quotedstr(sqlgeneral.fieldbyname('ImporteNeto').asstring)+
         ')',1,dmreportes.sqlgeneral);

  querys('update folios set idremicion='+inttostr(rem),1,dmreportes.sqlgeneral);
  //actualiza el estatus
  querys('Update pedidos set estatus=3,FechaCierre="'+datetostr(FechaServidor)+'" where idpedido='+edventa.text,1,dmreportes.sqlgeneral);
  //ya remisiona siguimos.............
  buscarventalocate;
  end
else
  begin
  //di cancelar la remision...........
  application.MessageBox('No se remisiono la venta!','Atención',mb_iconInformation);
  edventa.SetFocus;
  end;
end;

procedure TfrmcobrosFE.visiblepagos(c:integer);
begin
if c = 0 then
  begin
  //letreropagos.Visible:=false;
  mmpagos.Visible:=false;
  end
else
  begin
  //letreropagos.Visible:=true;
  mmpagos.Visible:=true;
  end;
end;

procedure TfrmcobrosFE.ImpresionTipoCobro;
begin
  if (edfactura.text = '0') or  (edfactura.text = '') then
  begin
    {  0: Bancos
       1: Caja
       2: Caja2 o extra
       3: Sector
       4: CSI}
    if (tipocobro <> 0) and (tipocobro <> 4) then
    begin
      if UsuarioImpFact = true then
      begin
        if application.MessageBox('Deseas Imprimir la factura?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
          ImprimirFE;
          imprimir;
        end
        else
          if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
            imprimir;
      end
      else
      begin
        if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir;
      end;
    end;  //tipocobro 0
  end
  else
  begin
    if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          imprimir;
  end;

  application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
end;

procedure TfrmcobrosFE.imprimir;
begin
  with dmreportes do
  begin
    {querys('SELECT cf.idcliente, cf.NombreCres AS Cliente, ('+quotedstr(TipoP)+') as TipoP, p.concepto, '+
         UsuarioNombre('u')+' as Usuario, p.idpedido,if (pc.movimiento=1,pc.notas,"Rem: "+pc.idremicion) AS REM,'+
         '(FolioRecibo + 1) as Folio, '+quotedstr(edcobro.text)+' as TotMn '+
         'FROM pedidos p left join clientes as c on p.idcliente=c.idcliente LEFT OUTER JOIN ClientesFact cf ON '+
         'c.idfact = cf.idfact LEFT OUTER JOIN usuarios u ON (p.idvendedor = u.idusuario) join folios f LEFT '+
         'JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido) WHERE pc.idpago='+quotedstr(idpago),0,sqlgeneral);
    OperacionReporte('Recibos', 'Recibos', 'IMP', 1);
     }
    //imprimir el recibo de caja  validar el pago contra el total del pedido
    querys('select idpago,pc.idpedido, pc.idfactura, c.idcliente, pc.FechaAlta, ' + clientenombre('c') + ' as nombre, concat(c.dir," ", c.numero) as dir, '+
          'col.nombre as colonia, c.ciudad, p.concepto, LETRAS(p.TotMn,"PESOS") as letras, '+        
          'round(pc.abono / (1 + p.pIVA),2) as SubTotal, round((pc.abono / (1 + p.pIVA))*p.piva,2) as Iva, pc.abono as TotMn,'+
          ' CONCAT(IFNULL(u.nombre,"")," ",IFNULL(u.apaterno,"")) as atendio,  (FolioRecibo + 1) as Folio, "' +
          GetConfiguraciones('MSNReciboCaja', true) +'" as Leyenda'  +
          ' from PagosClientes pc ' +
          ' LEFT JOIN pedidos p on p.idpedido = pc.idpedido ' +
          ' left join clientes c on p.idcliente = c.idcliente ' +
          ' LEFT JOIN colonias col on col.idcol = c.idcol ' +
          ' left join UCTabUsers uc on uc.UCLogin = pc.usuario ' +
          ' LEFT JOIN usuarios u on u.idusuario = uc.UCIdUser  join  folios fol' +
          ' where pc.idpago = ' + edfolio.text , 0, sqlgeneral);
    OperacionReporte('cajaticket', 'cajaticket', 'IMP', 1);

    //actualizar folio
    querys('UPDATE PagosClientes SET recibo='+quotedstr(sqlgeneral.fieldbyname('Folio').AsString)+' WHERE idpago='+quotedstr(edfolio.text),1,sqlgeneral2);
    querys('UPDATE folios set FolioRecibo=FolioRecibo+1',1,sqlgeneral3);
  end;
end;

procedure TfrmcobrosFE.actualizar(operador:string);
begin
abono:=edcobro.Text;
saldado := ActualizarSaldoCliente(lbcuenta.Caption,edventa.text, dtaplicacion.text);
bpcambios('clientes', lbcuenta.Caption, 'idcliente');
querys('Update clientes as c,contratos as con,pedidos as p set c.TipoCont=con.TipoCont '+
       'where p.idcliente=c.idcliente and p.idpedido='+quotedstr(edventa.text)+' '+
       'and p.Anualidad <> 0 and con.nombre="ANUAL NORMAL" and p.idunidadnegocio = 4',1,sqlgeneral);
apcambios('idcliente', lbcuenta.Caption, 'clientes', 'frmcobros');

if sqlgeneral.RowsAffected>0 then
      begin
         //traer los meses que pago la anualidad
         querys('select idcliente,cod_cve,anualidad from pedidos p left join DetPedido using(idpedido) '+
                ' where idpedido='+quotedstr(edventa.text),0,sqlgeneral);
         sqlgeneral.First;
         while not sqlgeneral.Eof do
         begin
            //busca un pedido que este remisionado de los meses que ya se pago la anualidad
            //para regresarlo a pedido
            if querys('select idpedido,idcliente,totmn from pedidos p left join DetPedido using(idpedido) '+
                      ' where cod_cve="'+sqlgeneral.fieldbyname('cod_cve').asstring+'" and p.estatus=3 and '+
                      'p.idpedido<>'+edventa.text+' and idcliente='+sqlgeneral.fieldbyname('idcliente').asstring+
                      ' and concepto like"%'+sqlgeneral.fieldbyname('anualidad').asstring+'%"',0,dmreportes.sqlgeneral)>0 then
            begin
               //busca que el pedido no tenga ningun pago
               if querys('select idpedido from PagosClientes where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString+
                      ' and movimiento not in (0,3)',0,dmreportes.sqlgeneral2)=0 then
               begin
                  querys('update pedidos set estatus=0, fecharemision="",saldo=0 where idpedido='+
                          dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  querys('delete from PagosClientes where idpedido='+
                         dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  querys('update clientes set saldo=saldo-'+dmreportes.sqlgeneral.fieldbyname('totmn').asstring+
                         ' where idcliente='+dmreportes.sqlgeneral.fieldbyname('idcliente').AsString,1,dmreportes.sqlgeneral2);
                  querys('delete from pedidos where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  querys('delete from DetPedido where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
               end;
            end;
            //buscar los recargos de monitoreo vencido para regresarlo a pedido
            if querys('select idpedido,idcliente,totmn from pedidos p left join DetPedido using(idpedido) '+
                    'where idcliente='+sqlgeneral.fieldbyname('idcliente').asstring+' and year(fechacreacion)='+
                    sqlgeneral.fieldbyname('anualidad').asstring+' and p.estatus=3 and idunidadnegocio=5 and cod_cve="recargos01"',0,dmreportes.sqlgeneral)>0 then
            begin
               //busca que el pedido no tenga ningun pago
               if querys('select idpedido from PagosClientes where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString+
                         ' and movimiento not in (0,3)',0,dmreportes.sqlgeneral2)=0 then
               begin
                  querys('update pedidos set estatus=0, fecharemision="",saldo=0 where idpedido='+
                         dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  querys('delete from PagosClientes where idpedido='+
                         dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
                  querys('update clientes set saldo=saldo-'+dmreportes.sqlgeneral.fieldbyname('totmn').asstring+
                         ' where idcliente='+dmreportes.sqlgeneral.fieldbyname('idcliente').AsString,1,dmreportes.sqlgeneral2);
                  querys('delete from pedidos where idpedido='+dmreportes.sqlgeneral.fieldbyname('idpedido').AsString,1,dmreportes.sqlgeneral2);
               end;
            end;
            sqlgeneral.next;
         end;
      end;
end;

procedure TfrmCobrosFE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

function TfrmCobrosFE.UsuarioImpFact:boolean;
var idusuario :string; cont : integer;
begin folio := '';
result := false;
idusuario :=  inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
{if querys('select u.idsector as id, letras, folio, f.procedencia From UsuarioSector u Left join FoliosFE f on f.idproc=u.idsector '+
         'and f.procedencia = "SECTOR" where idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
         ' union '+
         'select p.idpuesto, letras, folio, f.procedencia From FoliosFE f inner join puestos p on f.idproc=p.idpuesto and '+
         'f.procedencia = "PUESTO" Left join areas a on a.idarea = p.idarea where p.nombre = "'+frmprincipal.PuestoUsuario+
         '" and a.nombre = "'+frmprincipal.AreaUsuario+'"', 0, sqlgeneral) = 0 then       }
if querys('select DISTINCT id, letras, folio, procedencia FROM ( select u.idsector as id, f.letras, f.folio, f.procedencia '+
            'From UsuarioSector u Left join FoliosFE f on f.idproc=u.idsector and f.procedencia = "SECTOR" '+
            'where idusuario = '+idusuario+' and folio is not null '+
            'UNION '+
            'select p.idpuesto, f.letras, f.folio, f.procedencia From FoliosFE f '+
            'inner join puestos p on f.idproc=p.idpuesto and f.procedencia = "PUESTO" '+
            'Left join areas a on a.idarea = p.idarea where p.nombre = "'+frmprincipal.PuestoUsuario+'" '+
            'and a.nombre = "'+frmprincipal.AreaUsuario+'" and folio is not null '+
            'UNION '+
            'select fu.idusuario as id, f.letras, f.folio, f.procedencia from FoliosUsuarios fu '+
            'left join FoliosFE f on fu.letras=f.letras where fu.idusuario = '+idusuario+' '+
            'and f.procedencia = "SECTOR" and f.letras not in  ( '+
            '	select f.letras 	From UsuarioSector u Left join FoliosFE f on f.idproc=u.idsector '+
            ' and f.procedencia = "SECTOR" where idusuario = '+idusuario+' '+
            '	and folio is not null ) ) as f', 0, sqlgeneral) = 0 then
  begin
  if tipocobro = 2 then
    begin
    folio := Getconfiguraciones('Folio Caja Extra', true);
    result := true;
    end
  else
    Application.MessageBox('Usted no tiene derechos para facturar electronicamente', 'Atencion', MB_ICONINFORMATION)
  end
else
  begin
  result := true;
  case tipocobro of
    1: //CAJA
       begin
       if (sqlgeneral.locate('procedencia', 'PUESTO', [])) and (frmprincipal.PuestoUsuario = 'CAJERA' ) then
         folio := sqlgeneral.fieldbyname('letras').asstring
       else
         folio := Getconfiguraciones('Folio Caja2', true);
       end;

    2: //CAJA2 o extra
       folio := Getconfiguraciones('Folio Caja Extra', true);

    3: //SECTOR
        begin
        BorrarPed.Items.Clear;
        BorrarPed.ImageIndex := -1;
        sqlgeneral.First;
        cont := 0;
        i := -1;
        while not sqlgeneral.Eof do
          begin
          folio :=  sqlgeneral.fieldbyname('letras').AsString;

          if (lbsector.caption = sqlgeneral.fieldbyname('id').AsString) and (sqlgeneral.fieldbyname('procedencia').AsString = 'SECTOR') then
            i := BorrarPed.Items.Count;

          BorrarPed.ImageIndex := BorrarPed.Items.Count;
          BorrarPed.Items.Add('Factura Electronica '+folio);
          inc(cont);

          sqlgeneral.Next;
          end;

        if cont > 1 then
          begin
          if i > 0 then
            borrarped.DefaultValue := i;

          BorrarPed.CaptionTitle := 'Seleccion de Tipo de Folio';
          BorrarPed.Prompt := 'Cual Folio desea utilizar?';
          repeat
            if BorrarPed.Execute then
              begin
              folio := MidStr(BorrarPed.Items.Strings[borrarped.value], 21, length(BorrarPed.Items.Strings[borrarped.value]));
              end
            else
              begin
              application.MessageBox(pchar('Cancelo la facturacion del pedido #'+edventa.text),'Aviso',mb_iconinformation);
              exit;
              end;
          until application.MessageBox('Esta seguro de lo que selecciono?','Pregunta',mb_yesno+mb_iconquestion) = idyes;
          end
        else
          begin
          if cont = 0 then
            begin
            application.messagebox('Usted NO tiene Derechos para Facturar', 'Atencion', MB_ICONSTOP);
            exit;
            end
          else
            begin
            if BorrarPed.Items.Count = 1 then
              folio := MidStr(BorrarPed.Items.Strings[0], 21, length(BorrarPed.Items.Strings[0]))
            else
              folio := MidStr(BorrarPed.Items.Strings[borrarped.value], 21, length(BorrarPed.Items.Strings[borrarped.value]));
            end;
          end;
        end;
       {
       sqlgeneral.first;
       while not sqlgeneral.eof = true do
         begin
         if (sqlgeneral.fieldbyname('procedencia').asstring = 'SECTOR') and
            (sqlgeneral.fieldbyname('id').asstring = lbsector.caption) then
           begin
           folio := sqlgeneral.fieldbyname('letras').asstring;
           end;
         sqlgeneral.next;
         end;
       end;     }
    end;
  if folio = '' then
    begin
    Application.MessageBox('Usted no tiene derechos para facturar electronicamente', 'Atencion', MB_ICONINFORMATION);
    result := false;
    end;
  end;
end;

procedure TfrmCobrosFE.ImprimirFE;
var idfac:integer;      TotVenta,idfactura: string;
    remisionado:boolean;
begin
//solo podran imprimir facturas de cobro los usuarios con los derechos correspondientes
//si puede imprimir facturas el usuario.........
querys('select idremicion, idfactura from RemiFact where idpedido='+quotedstr(edventa.Text)+' and idfactura <> ''0'' ',0,sqlgeneral);
if sqlgeneral.FieldByName('idremicion').AsString = '0' then
  remisionado := false
else
  remisionado := true;

if sqlgeneral.FieldByName('idfactura').AsString = '' then
  begin
  querys('select folio from FoliosFE where letras = "'+folio+'"', 0, sqlgeneral);
  idfac :=sqlgeneral.fieldbyname('folio').asinteger+1;
  idfactura := folio + inttostr(idfac);
  Application.CreateForm(TfrmRemiFac, frmRemiFac);
  //#cfd
  frmremifac.inicializa(false,remisionado,strtoint(edventa.Text),idfactura, 'E');
  frmremifac.ShowModal;  //mostramos forma de factura.......

   //actualiza el estatus
  querys('Update pedidos set estatus = 4 WHERE idpedido='+edventa.Text,1,sqlgeneral);
  querys('update FoliosFE set folio ="'+inttostr(idfac)+'" where letras = "'+folio+'"',1,sqlgeneral);
  querys('UPDATE PagosClientes SET idfactura='+quotedstr(idfactura)+' where idpedido='+quotedstr(edventa.text),1,sqlgeneral);

   ///actualiza el campo ultima compra del cliente al igual que su saldo
  bpcambios('clientes', lbcuenta.caption, 'idcliente');
  querys('update clientes set UltimaCompra='+quotedstr(datetostr(FechaServidor))+',TotComprado=TotComprado+'+quotedstr(TotVenta)+' where idcliente='+quotedstr(lbcuenta.caption),1,sqlgeneral);
  apcambios('idcliente', lbcuenta.caption, 'clientes', 'frmcobros');

  FacturaElectronica(lbcuenta.caption, edventa.text, 'en una sola exhibicion', '1', 'FA',true);
  end;
end;

procedure TfrmCobrosFE.OtroPago(idcliente, saldo:string);
begin
saldado:=0;
//MasRem:=0;//mas remisiones es para poder hacer varios pagos a varias remisiones....
TipoP:='';
Transaccion:=0;//normal
ban:=0;
pesos:=0;
cobro:=0;
mmpagos.Clear;
lbcancelado.Caption:='';
idpago:=''; idremision:='';
btncobrar.Enabled:=false;
btncancelar.Enabled:=false;
btncerrar.Caption:='C&ancelar';
btncerrar.Hint:='Cancelar la Alta';
btncobrar.Hint:='Guardar los datos de la alta';
edfolio.text:='';
edfolio.Enabled:=false;
edventa.Enabled:=true;
edfactura.Enabled:=true;
dtfecha.date:=dtaplicacion.date;
rgmoneda.ItemIndex := 0;

//BUSCAR POR CATALOGO//

querys('SELECT p.idcliente as IdCliente, p.idpedido ,if(pc.idfactura > 0, pc.idfactura,0) as IDFactura, '+
            'p.FechaCreacion, p.TotMn as ImporteNeto, p.FechaVencimiento, p.concepto  '+
            'FROM pedidos as p INNER JOIN clientes as c ON c.idcliente=p.idcliente LEFT JOIN PagosClientes as pc '+
            'ON pc.idpedido=p.idpedido WHERE p.idcliente= '+idcliente+' and p.estatus in(0,3,4) and '+
            'p.saldado = 0 '+
            'group by p.idpedido ',0,sqlgeneral);
 {
querys('SELECT p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura, '+ClienteNombre('c')+' as Cliente, '+
       'p.idcliente as IdCliente,p.FechaCreacion,p.TotMn as ImporteNeto,p.FechaVencimiento  '+
       'FROM pedidos as p INNER JOIN clientes as c ON c.idcliente=p.idcliente LEFT  JOIN PagosClientes as pc '+
       'ON pc.idpedido=p.idpedido WHERE p.idcliente='+idcliente+' and p.estatus in(0,3,4) and p.saldado = 0 '+
       'group by p.idpedido ',0,sqlgeneral); }
with frmbusquedas do
  begin
  maxrow := sqlgeneral.RecordCount+1;
  MasRem := sqlgeneral.RecordCount;

  query:='SELECT p.idcliente as IdCliente,p.idpedido, case p.estatus when 0 then "PED" when 3 then "REM" when 4 then "FACT" end '+
         'as Estatus, pc.idfactura as IDFactura, p.concepto, p.FechaVencimiento, p.FechaCreacion, p.TotMn as ImporteNeto '+
         'FROM pedidos as p INNER JOIN clientes as c ON c.idcliente=p.idcliente LEFT JOIN PagosClientes as pc ON '+
         'pc.idpedido=p.idpedido LEFT JOIN ClientesFact as dc ON dc.idcliente=p.idcliente WHERE p.idcliente='+
         idcliente+
         ' and p.estatus in(0,3,4) and p.saldado=0 '+
         //'and p.FechaCreacion > ''2005/02/01'' '+
         'group by p.idpedido order by p.FechaCreacion desc';
  campo_retorno:='idpedido';
  campo_busqueda:='idpedido';
  tabla:='';
  tblorigen:='pedidos';
  ShowModal;
  if frmbusquedas.resultado <> '' then
    begin
    edventa.Text:=frmbusquedas.resultado;
    frmbusquedas.maxrow:=0;

    /// aqui vamos a validar que si es una remision cobre normal, si no tener que remisionar la venta.....
    querys('select p.estatus as estatus,p.idcliente as idcliente,p.TotMn as TotMn,un.instalacion as inst from pedidos '+
           'as p left join UnidadNegocio as un ON(un.idUnidadNegocio=p.idUnidadNegocio) where p.idpedido='+
           quotedstr(edventa.text),0,dmreportes.sqlgeneral4);

    if dmreportes.sqlgeneral4.fieldbyname('estatus').asstring = '0' then
      begin
      if dmreportes.sqlgeneral4.fieldbyname('inst').asstring = '0' then
        RemisionarVenta
      else
        application.MessageBox('Esta venta no se puede remisionar en este proceso, solo en la opcion de pedidos!','Atención',mb_iconInformation);
      end
    else
      buscarventalocate;
    end
  else ///////frmbusquedas.......
    edventa.SetFocus;
  end; //with
end;

procedure TfrmCobrosFE.btncobrosClick(Sender: TObject);
var hija:TfrmPagosDebe;
begin
  if lcuenta.Caption <> '' then
    begin
    hija:=TfrmPagosDebe.Create(self);
    hija.inicializa(lbcuenta.Caption);
    hija.Show;
    end
  else
    application.messagebox('No hay cuenta con que consultar!','Atencion',mb_IconInformation);
end;

procedure TfrmCobrosFE.vParcDblClick(Sender: TObject);
var mensaje:integer; temp:string;  rest : double;
begin
if ban=1 then
  begin
  cobro := DSparcialidades.DataSet.FieldValues['restante'];
  idpago := DSparcialidades.DataSet.FieldValues['idpago'];
  lsaldovta.Caption:= DSparcialidades.DataSet.FieldValues['restante'];

  if resta > cobro then
    begin
    restacadena:=floattostr(cobro);
    mensaje:=1;
    end
  else
    begin
    restacadena:=floattostr(resta);
    mensaje:=0;
    end;

  temp := Format('%8.2f',[strtofloat(restacadena)]);
  querys('UPDATE PagosClientes SET restante=(restante - '+quotedstr(temp)+')  WHERE idpago='+quotedstr(idpago),1,sqlgeneral);
  querys('INSERT INTO PagosAfecta (idpago,idpago2,pago) values ('+quotedstr(edfolio.Text)+','+
          quotedstr(idpago)+','+quotedstr(temp)+')',1,sqlgeneral);
  resta:=resta-cobro;
  restacadena:=floattostr(resta);

  if mensaje = 1 then
    begin
    mostrargrid;
    if sqlparcialidades.recordcount > 0 then
      begin
      if application.MessageBox('Deseas Imprimir el recibo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        imprimir;
      showmessage('Sigue sobrando: '+restacadena+' , escoge otra parcialidad!');
      end
    else
      begin //recordcount
      if tipocobro = 0 then
        application.MessageBox('Cobro realizado!','Información',mb_iconinformation);
      ImpresionTipoCobro;


      ban:=0;
      SPpanel.Percent:=97;
      buscarlocate;
      actualizar('-');
      edfolio.Enabled:=true;
      btncobrar.Enabled:=true;
      //btnmodificar.Enabled:=true;
      btncancelar.Enabled:=true;
      btncobrar.Caption:='&Cobrar';
      btncobrar.Hint:='Dar de Alta un cobro';
      btncerrar.Caption:='C&errar';
      btncerrar.Hint:='Cerrar esta Ventana';
      end;///recordcount
    end
  else
    begin
    if sqlparcialidades.recordcount > 0 then
      begin
      ImpresionTipoCobro;
      end;

    ban:=0;
    SPpanel.Percent:=97;
    actualizar('-');
    edfolio.Enabled:=true;
    buscarlocate;
    btncobrar.Enabled:=true;
    //btnmodificar.Enabled:=true;
    btncancelar.Enabled:=true;
    btncobrar.Caption:='&Cobrar';
    btncobrar.Hint:='Dar de Alta un cobro';
    btncerrar.Caption:='C&errar';
    btncerrar.Hint:='Cerrar esta Ventana';
    end;  //if recordcount
  end
else
  begin //mensaje
  if  (btncobrar.Enabled = false) then
    begin
    rest := strtofloat(format('%8.2f',[DSparcialidades.DataSet.fieldbyname('restante').asfloat]));
    //dfecha.date:=strtodate(lbfecha.Caption);
    idpago:=DSparcialidades.DataSet.FieldValues['idpago'];
    edcobro.Text := floattostr(rest);
    cobro := rest;
    lbsaldoparc.caption := floattostr(rest);
    idremision:=DSparcialidades.DataSet.FieldValues['idremicion'];
    if DSparcialidades.DataSet.FieldValues['movimiento'] <> 0 then
      //nota:='Pago de '+ dbmnotas.lines.text
      nota:='Pago de '+  DSparcialidades.DataSet.FieldValues['notas']
    else
      nota:='Pago de la venta';
    SPpanel.Percent:=100;
    //gbcobro.Enabled:=true;
    btncobrar.Enabled:=true;
    btncobrar.Caption:='&Guardar';
    btncobrar.Hint:='Guardar los datos de la alta';
    ednotas.text:=nota;
    btncobrar.ImageIndex:=1;
    edventa.Enabled:=false;
    edfactura.Enabled:=false;
    //dfecha.Enabled:=true;
    edcobro.Enabled:=true;
    ednotas.Enabled:=true;
    cbtipopago.enabled:=true;
    querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
    edtc.Text:=sqlgeneral.Fields.Fields[0].AsString;
    lbdlls.Caption:='Cobro en DLLS : '+  Format('%8.2f',[( strtofloat(edcobro.Text) / strtofloat(edtc.Text) )]);
    lbmn.caption:='Cobro en MN : '+edcobro.text;
    edtc.enabled:=true;
    edtc.SetFocus;
    cbtipopago.itemindex:=0;
    end;  // if btncobrar
  end; //primer if
end;

procedure TfrmCobrosFE.edventaButtonClick(Sender: TObject);
begin
//BUSCAR POR CATALOGO//
querys('SELECT p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura,  '+
       'p.concepto,p.idcliente as IdCliente,p.FechaCreacion,p.TotMn as ImporteNeto,p.FechaVencimiento FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) '+
       ' INNER JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido)  WHERE  p.estatus IN(3,4,6) and p.saldado=0 group by p.idpedido',0,sqlgeneral);

frmbusquedas.maxrow:=sqlgeneral.RecordCount+1;
frmbusquedas.query:='SELECT p.idpedido ,if(pc.idfactura > 0,pc.idfactura,0) as IDFactura,if (c.nombre <> '' '',concat(c.nombre,'' '',c.apaterno,'' '',c.amaterno),c.rsocial) as Cliente,p.concepto,p.idcliente as IdCliente,p.FechaVencimiento,p.FechaCreacion,p.TotMn as ImporteNeto  '+
                    'FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) INNER JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido)  WHERE  p.estatus IN (3,4,6) and p.saldado=0 group by p.idpedido';
frmbusquedas.campo_retorno:='idpedido';
frmbusquedas.campo_busqueda:='idpedido';
frmbusquedas.tabla:='';
frmbusquedas.tblorigen:='pedidos';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
  begin
  edventa.Text:=frmbusquedas.resultado;
  buscarventalocate;
  frmbusquedas.maxrow:=0;
  end;
end;

procedure TfrmCobrosFE.edventaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
  key:=#0;
  if edventa.Text <> '' then
    buscarventalocate
  else
    edventa.OnButtonClick(self);
  end;

if key = #27 then
  begin
  key:=#0;
  edventa.Text:='';
  end;
end;

procedure TfrmCobrosFE.edfacturaButtonClick(Sender: TObject);
begin
 //BUSCAR POR CATALOGO//
    frmbusquedas.query:='SELECT r.idfactura ,p.idpedido as IDVenta,ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) as Cliente,p.idcliente as IdCliente,p.FechaCreacion,Saldo as Total,FechaVencimiento  '+
                        'FROM pedidos as p INNER JOIN clientes as c ON ( c.idcliente=p.idcliente) INNER JOIN PagosClientes as pc ON (pc.idpedido=p.idpedido) INNER JOIN RemiFact AS r ON (r.idpedido=p.idpedido) WHERE  p.estatus IN (3,4,6)  '+
                        'and p.saldado=0 and r.idfactura > 0 group by p.idpedido';
    frmbusquedas.campo_retorno:='idfactura';
    frmbusquedas.campo_busqueda:='idfactura';
    frmbusquedas.tabla:='pedidos';
    frmbusquedas.tblorigen:='pedidos';
    frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then begin
            edfactura.Text:=frmbusquedas.resultado;
            buscarfacturalocate;

        end;
end;

procedure TfrmCobrosFE.edfacturaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13)then begin
        key:=#0;
         if edfactura.Text <> '' then
            buscarfacturalocate
         else
            edfactura.OnButtonClick(self);
   end;

   if key = #27 then
      begin
      key:=#0;
      edfactura.Text:='';
   end;
end;

procedure TfrmcobrosFE.buscarfacturalocate;
begin
querys('SELECT idfactura,idpedido FROM RemiFact WHERE idfactura='+quotedstr(edfactura.text),0,SqlGeneral);
if SqlGeneral.FieldByName('idfactura').AsString <> '' then
  begin                                                                                                                              //
  edventa.Text:= SqlGeneral.FieldByName('idpedido').AsString;
  ////////////////buscar saldo de la factura
  querys('SELECT r.idfactura as factura, ifnull(c.rsocial,concat(ifnull(c.nombre,'' ''),'' '',ifnull(c.apaterno,'' ''),'' '',ifnull(c.amaterno,'' ''))) as Cliente '+
         ',p.idcliente as id,p.saldado as saldado,c.saldo as total,p.idpedido as pedido FROM pedidos as p inner join clientes as c on   '+
         '(c.idcliente=p.idcliente) INNER JOIN RemiFact AS r ON (r.idpedido=p.idpedido) WHERE p.idpedido='+quotedstr(edventa.text),0,sqlgeneral);
  if sqlgeneral.FieldByName('saldado').AsInteger = 0 then
    begin// si hay algo que cobrar entonces
    //idpedido:=sqlgeneral.FieldByName('pedido').AsString;
    edventa.Text:=sqlgeneral.FieldByName('pedido').AsString;
    lbcuenta.Caption:=sqlgeneral.FieldByName('id').AsString;
    lbnombre.Caption:=sqlgeneral.FieldByName('Cliente').AsString;
    lbsaldocta.Caption:=floattostr(sqlgeneral.FieldByName('total').AsFloat);
    //edfactura.Text:=sqlgeneral.fieldbyname('factura').asstring;
    querys('SELECT sum(restante) as saldo FROM PagosClientes WHERE idpedido='+quotedstr(edventa.text),0,sqlgeneral);

    lbsaldovta.Caption:=Format('%8.2f',[sqlgeneral.fieldbyname('saldo').asfloat]);
    edventa.enabled:=false;
    edfactura.enabled:=false;
    //buscamos que la venta tenga parcialidas
    mostrargrid;
    end
  else//esta saldada.....
     application.MessageBox('Esa factura esta saldada!','Atención',mb_iconwarning);
  end
else
  begin
  application.MessageBox('Esa factura no existe!','Atención',mb_iconwarning);
  edfactura.Text:='';
  edfactura.SetFocus;
  end;//if recordcount
end;

procedure TfrmCobrosFE.btncancelarClick(Sender: TObject);
begin
if((lbcancelado.Caption <> 'MOV: VENTA') and (lbcancelado.Caption <> 'MOV: COBRO REALIZADO') and
   (lbcancelado.Caption <> 'MOV: ABONO POR CORTESIAS') and (lbcancelado.Caption <> 'MOV: PAGO DE CUENTA IDENTIFICADA')) then
  application.MessageBox('No puedes cancelar este movimiento!','Atención',mb_iconinformation)
else
  begin
  if lbcancelado.Caption = 'MOV: VENTA' then
    begin
    if strtofloat(edcobro.text) > 0 then
      begin
      if application.MessageBox('Deseas Cancelar el anticipo?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        querys('UPDATE PagosClientes set abono=0, restante=restante + '+quotedstr(edcobro.text)+', usuario='+
               quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha="'+datetostr(date)+'", hora="'+
               timetostr(time)+'" WHERE idpago='+(edfolio.text),1,sqlpagos);
        actualizar('+');//actualizar las tablas correspondientes....
        application.MessageBox('Anticipo cancelado!','Información',mb_iconinformation);
        frmprincipal.ucprincipal.Log('Elimino el cobro : '+edfolio.text,3);
        end;
      end;
    end   // 'MOV: VENTA'
  else
    begin
    if (lbcancelado.Caption = 'MOV: COBRO REALIZADO') then
      begin
      if application.MessageBox('Deseas Cancelar este cobro?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
               ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edfolio.text),1,sqlgeneral);
        //Esta es la que estaba y a veces funciona
        querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) '+
               ' WHERE PagosClientes.idpago=PagosAfecta.idpago2 and PagosAfecta.idpago='+quotedstr(edfolio.text),1,sqlgeneral);
        // y  a veces funciona esta
        querys('DELETE FROM PagosAfecta WHERE idpago='+quotedstr(edfolio.text),1,sqlgeneral);
        actualizar('+');//actualizar las tablas correspondientes....
        buscarlocate;
        application.MessageBox('Cobro cancelado!','Información',mb_iconinformation);
        frmprincipal.ucprincipal.Log('Elimino el cobro : '+edfolio.text+' del pedido '+edventa.text ,3);
        end;
      end
    else
      begin
      if lbcancelado.Caption = 'MOV: PAGO DE CUENTA IDENTIFICADA' then
        begin
        if application.MessageBox('Deseas Cancelar este cobro?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
          begin
          querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                 ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpago='+(edfolio.text),1,sqlgeneral);
          //Esta es la que estaba y a veces funciona
          {querys('UPDATE PagosClientes SET PagosClientes.restante=restante+'+edcobro.text+' '+
                 ' WHERE idpedido='+edventa.text+' and movimiento = 0',1,sqlgeneral);          }
          //Esta es la que estaba y a veces funciona
          querys('UPDATE PagosClientes,PagosAfecta SET PagosClientes.restante=(PagosAfecta.pago + PagosClientes.restante) '+
               ' WHERE PagosClientes.idpago=PagosAfecta.idpago2 and PagosAfecta.idpago='+quotedstr(edfolio.text),1,sqlgeneral);
          // y  a veces funciona esta
          querys('DELETE FROM PagosAfecta WHERE idpago='+quotedstr(edfolio.text),1,sqlgeneral);

          querys('UPDATE pedidos set saldo=saldo+'+edcobro.text+', saldado=0, usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                   ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpedido='+edventa.text,1,sqlgeneral);
          actualizar('+');//actualizar las tablas correspondientes....
          //actualiza 10000
          if querys('Select idpedido from PagosClientes where idcliente = 10000 and movimiento = 7 and notas = '+
            '"Deduccion por cuenta Identificada: '+lbcuenta.Caption+' del pedido: '+edventa.text+'"', 0, sqlgeneral) > 0 then
            begin
            pedidoCSI := sqlgeneral.fieldbyname('idpedido').asstring;
            querys('UPDATE PagosClientes set movimiento=3,usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                   ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpedido='+pedidoCSI+' and movimiento = 7',1,sqlgeneral);
            querys('UPDATE pedidos set saldo=saldo+'+edcobro.text+', saldado=0, usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
                   ',fecha="'+datetostr(date)+'",hora="'+timetostr(time)+'" WHERE idpedido='+pedidoCSI,1,sqlgeneral);
            end
          else
            application.MessageBox('No se encontro el pedido de la cuenta 10000!','Atencion',mb_iconinformation);

          buscarlocate;
          application.MessageBox('Cobro cancelado!','Información',mb_iconinformation);
          frmprincipal.ucprincipal.Log('Elimino el cobro : '+edfolio.text+' del pedido '+edventa.text ,3);
          end;
        end
      else
        Application.MessageBox('No se puede cancelar este movimiento', 'Atencion', mb_iconinformation);
      end;
    end;//if venta-cobro
  end;
end;

procedure TfrmCobrosFE.edfolioButtonClick(Sender: TObject);
  var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure TfrmCobrosFE.edfolioChange(Sender: TObject);
begin
if edfolio.Text = '' then
  begin
  lbcancelado.caption:='';
  limpiar;
  btncancelar.enabled:=false;
  visiblepagos(0);
  end;
end;

procedure TfrmCobrosFE.edfolioKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
   key:=#0;
   if edfolio.Text <> '' then
      buscarlocate
   else
      edfolio.OnButtonClick(self);
   end;

if key = #27 then
  begin
  key:=#0;
  edfolio.Text:='';
  end;
end;

End.

