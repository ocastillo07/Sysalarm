{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
}///////////////////////////////////////////////////////////////////////////////
unit UFacturacionLotesFECus;

interface

uses
  Windows, Messages,RpRave, RpDefine, SysUtils,strutils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, RzPanel, RzRadGrp, StdCtrls,
  Mask, RzEdit, RzLabel, RzButton, DB, MemDS, DBAccess, MyAccess, Grids,
  DBGrids, RzBtnEdt, RzRadChk, RzGroupBar, RzCmboBx, Printers;

type
  TfrmFacturacionLotesFECus = class(TForm)
    btnfacturar: TRzBitBtn;
    sqltemp: TMyQuery;
    SqlGeneral: TMyQuery;
    sqlpedidos: TMyQuery;
    lblregistros: TRzLabel;
    btnsalir: TRzBitBtn;
    DBGrid1: TDBGrid;
    dspedidos: TDataSource;
    btnconsultar: TRzBitBtn;
    RzGroupBar1: TRzGroupBar;
    Gfechas: TRzGroup;
    RzLabel1: TRzLabel;
    dtphasta: TRzDateTimeEdit;
    dtpdesde: TRzDateTimeEdit;
    RzLabel5: TRzLabel;
    Gventas: TRzGroup;
    Gfact: TRzGroup;
    dtpFecFact: TRzDateTimeEdit;
    cbprinters: TRzComboBox;
    cbSeries: TRzComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnfacturarClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure btnconsultarClick(Sender: TObject);
    procedure sqlpedidosAfterOpen(DataSet: TDataSet);
    procedure sqlpedidosAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFacturacionLotesFECus: TfrmFacturacionLotesFECus;

implementation

uses Urecursos, Uprincipal, Udm, Udmrep, Umensaje, Ubusquedas;

{$R *.dfm}

procedure TfrmFacturacionLotesFECus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmFacturacionLotesFECus.FormShow(Sender: TObject);
var c:integer;
begin
  shortdateformat:='yyyy/mm/dd';
  //dtpdesde.Date := FechaServidor;
  //dtphasta.Date := FechaServidor;
  //dtpFecFact.Date := FechaServidor;
  for c:=0 to printer.Printers.Count - 1 do
    cbprinters.Items.Add(printer.Printers.Strings[c]);
  CargaCombo('Select letras as nombre from FoliosFE where procedencia = "Sector"','FoliosFE',cbSeries);
  cbSeries.Text := 'SB';
end;

procedure TfrmFacturacionLotesFECus.btnfacturarClick(Sender: TObject);
var pzsxunidad,pzs,cant,idmovi:integer;     total,tc,ant,tot:double;
    cod_cve,idfactura,_facturaDefault, folio,  fol1, fol2 : string;  //  deducible,      dec,
    year,dia,mes:word;    sqlaux : tmyquery;    memo:tmemo;
begin
    //creacion de variables
    memo := tmemo.Create(nil);
    memo.Parent := self;
    memo.visible := false;

    sqlaux := tmyquery.Create(self);
    sqlaux.Connection := dmaccesos.conexion;


    //validar cierre
    if(dtpFecFact.Date <= frmprincipal._fechaCierreMes ) then
    begin
      if DerechosSys('Modifica Cierre')= false then
      begin
         application.MessageBox('La fecha afecta a un cierre anterior!. '+#13+'  solo un administrador puede realizar esta operación! '+#13+'Modifique la fecha por favor!','Aviso',mb_iconinformation);
         exit;
      end
      else
      begin
         if application.MessageBox(pchar('Este movimiento afectara un cierre, '+#13+' desea continuar(YES) ó modifique la fecha(NO) ?'),'Confirmación',mb_yesno+mb_iconwarning) =IDNO then
         begin
           dtpFecFact.Date := now;
           exit;
         end;
      end;
    end;


    //definimos el folio de la factura
    _facturaDefault := cbSeries.text;

    if sqlpedidos.RecordCount > 0 then
    begin
      lblregistros.Visible := true;
      lblregistros.Caption := 'Registros encontrados: '+inttostr(sqlpedidos.RecordCount-1);
      sqlpedidos.First;
      while not sqlpedidos.Eof do
      begin
        querys('select TotDlls,TipoCambio,Anticipo,TotMn,FechaCreacion from pedidos where idpedido ='+sqlpedidos.fieldbyname('idpedido').AsString,0,sqlaux);
        total := sqlaux.fieldbyname('TotDlls').Asfloat;
        tc := sqlaux.fieldbyname('TipoCambio').Asfloat;
        ant := sqlaux.fieldbyname('anticipo').Asfloat;
        tot :=  sqlaux.fieldbyname('TotDlls').Asfloat;
        tot := (tc*tot)-ant;

        querys('select folio from FoliosFE where letras = "'+_facturaDefault+'"',0,sqltemp);
        idfactura:=_facturaDefault+inttostr(sqltemp.fieldbyname('folio').AsInteger+1);
        if sqlpedidos.Bof = true then
          fol1 := idfactura;

        //inserta en remifact la factura
        querys('select idremicion from RemiFact where idpedido='+sqlpedidos.fieldbyname('idpedido').asstring,0,sqlgeneral);
        querys('insert into RemiFact(idfactura, idremicion, idpedido,FechaAlta,HoraAlta,UsuarioAlta, tipo) values ('+
                quotedstr(idfactura)+','+sqlgeneral.fieldbyname('idremicion').asstring+','+sqlpedidos.fieldbyname('idpedido').asstring+
                ',"'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+', "E")',1,sqlgeneral);

        //actualiza el campo FechaFactura de Pedidos
        querys('update pedidos set FechaFactura='+quotedstr(datetostr(dtpFecFact.date))+',idfactura='+quotedstr(idfactura)+' where idpedido='+sqlpedidos.fieldbyname('idpedido').asstring,1,sqlgeneral);

        //verifica si este pedido ya esta en instalaciones
        //querys('select idpedido from instalaciones where idpedido='+sqlpedidos.fieldbyname('idpedido').asstring,0,sqlgeneral);
        //if sqlgeneral.recordcount = 0 then
        //begin
          //verifica que este pedido ocupe instalacion
          //querys('select instalacion from UnidadNegocio where idUnidadNegocio='+sqlpedidos.fieldbyname('idUnidadNegocio').asstring,0,sqlgeneral);
          //if sqlgeneral.FieldByName('instalacion').AsInteger = 1 then
          //begin
            //inserta en la tabla de instalaciones el id pedido
            //querys('select idusuario from usuarios where nombre = ''SIN INSTALADOR''',0,sqlgeneral);
            //querys('insert into instalaciones (idpedido,instalador1,EstatusInst, idcliente) values ('+sqlpedidos.fieldbyname('idpedido').asstring+','+sqlgeneral.fieldbyname('idusuario').asstring+',0, '+sqlpedidos.fieldbyname('idcliente').asstring+')',1,sqlgeneral);
          //end;
        //end;

        //si la fecha de factura es menor que la fecha de remision , cambiar FechaRemision en pedidos:
        querys('Update pedidos set FechaRemision='+quotedstr(datetostr(dtpFecFact.Date))+' Where idpedido = '+quotedstr(sqlpedidos.fieldbyname('idpedido').AsString)+'  and FechaRemision > '+quotedstr(datetostr(dtpFecFact.Date))+' ',1,dmaccesos.sqlgeneral);
        querys('Update PagosClientes set idfactura="'+idfactura+'" Where idpedido = '+quotedstr(sqlpedidos.fieldbyname('idpedido').AsString),1,dmaccesos.sqlgeneral);

        /////////////
        querys('Update pedidos set estatus=4 where idpedido='+sqlpedidos.fieldbyname('idpedido').AsString,1,sqlgeneral);
        frmprincipal.ucprincipal.Log('Facturo el Pedido '+sqlpedidos.fieldbyname('idpedido').asstring+' y obtuvo la factura '+idfactura,1);
        SeparaSerieFolio(idfactura, _facturaDefault, Folio);
        querys('update FoliosFE set folio ='+folio+' where letras="'+_facturaDefault+'"',1,sqltemp);

        //inicia proceso de impresion de factura
        decodedate(strtodate(sqlaux.fieldbyname('FechaCreacion').Asstring),year,mes,dia);
        with dmreportes do
        begin
            memo.Lines.Add( FacturaElectronica(sqlpedidos.fieldbyname('idcliente').AsString, sqlpedidos.fieldbyname('idpedido').AsString,'en una sola exhibicion', '1', 'FA', false));
        end;

        sqlpedidos.Next;
      end;

      fol2 := idfactura;
      memo.Lines.SaveToFile(Getconfiguraciones('FEPathEntrada', true)+fol1+'-'+fol2+'.txt');
      memo.free;
      application.MessageBox('Facturacion Exitosa','Aviso',mb_iconinformation);
      btnfacturar.Enabled := false;
      sqlpedidos.Close;
    end
    else
    begin
      lblregistros.Visible := false;
      application.messagebox('No se Encontraron ventas para facturar en este rango de fechas','Aviso',mb_iconinformation);
    end;
end;

procedure TfrmFacturacionLotesFECus.btnsalirClick(Sender: TObject);
begin
close;
end;

procedure TfrmFacturacionLotesFECus.btnconsultarClick(Sender: TObject);
var sector:string;
begin
  frmmensaje.Show;
  frmmensaje.Update;
  querys('select p.TotMn,p.estatus,p.idUnidadNegocio,p.idpedido,p.idcliente,p.FechaLiquidacion,c.sector  '+
         ' FROM PagosClientes as pc  left join pedidos as p ON(p.idpedido=pc.idpedido)  '+
         ' LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont) '+
         ' where  p.estatus in(3) AND pc.FechaVence between '+quotedstr(datetostr(dtpdesde.Date))+' and ' + quotedstr(datetostr(dtphasta.Date)) +
         ' and con.estatus = 1 AND restante > 0.9 and pc.movimiento IN(0,1) and p.estatus = 3  and p.idcliente <> 10000 GROUP BY pc.idpago',0,sqlpedidos);

  lblregistros.Caption := 'Total Registros: '+inttostr(sqlpedidos.RecordCount);
end;

procedure TfrmFacturacionLotesFECus.sqlpedidosAfterOpen(DataSet: TDataSet);
begin
  frmmensaje.Close;
  if dataset.RecordCount > 0 then
  begin
    lblregistros.visible := true;
    btnfacturar.Enabled := true;
    lblregistros.Caption := 'Registros Encontrados '+inttostr(dataset.RecordCount-1);
  end
  else
  begin
    lblregistros.visible := false;
    btnfacturar.Enabled := false;
    application.MessageBox('No se encontro ningun registro bajo esos criterios','Aviso',mb_iconinformation);
  end;
end;

procedure TfrmFacturacionLotesFECus.sqlpedidosAfterClose(DataSet: TDataSet);
begin
 btnfacturar.Enabled := false;
end;

End.
