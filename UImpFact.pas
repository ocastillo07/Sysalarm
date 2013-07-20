{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
2009/05/21 dalyla la consulta sea por numero y no letra numero
2009/05/12 dalyla arreglar la busqueda eje de 17690 a 17710 trae la 1770 por la letra de la fact
2009/03/25 dalyla desgloce el iva
}///////////////////////////////////////////////////////////////////////////////

unit UImpFact;

interface

uses
  Windows, StrUtils, RpRave, RpDefine, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, RzLabel, Mask, RzEdit, RzBtnEdt,
  DB, MemDS, DBAccess, MyAccess, ExtCtrls, RzPanel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, RzButton, RzRadGrp,printers;

type
  TfrmImpFact = class(TForm)
    SqlGeneral: TMyQuery;
    gbrangoventas: TRzGroupBox;
    RzLabel5: TRzLabel;
    RzLabel2: TRzLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    btnconsulta: TRzBitBtn;
    btnimprimir: TRzBitBtn;
    btnsalir: TRzBitBtn;
    lblregistros: TRzLabel;
    cxboletas: TcxGrid;
    vista: TcxGridDBTableView;
    cxdbcuenta: TcxGridDBColumn;
    cxdbpedido: TcxGridDBColumn;
    nivel: TcxGridLevel;
    DSBuscaPed: TDataSource;
    sqlBuscaPed: TMyQuery;
    cxdbremicion: TcxGridDBColumn;
    cxdbfactura: TcxGridDBColumn;
    cxdbTotMn: TcxGridDBColumn;
    rgTFactura: TRzRadioGroup;
    sqltemp: TMyQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure btnconsultaClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure eddesdeChange(Sender: TObject);
    procedure rgTFacturaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpFact: TfrmImpFact;

implementation

uses Udm, Urecursos, Ubusquedas, Udmrep, Umensaje, Uprincipal;

{$R *.dfm}

procedure TfrmImpFact.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmImpFact.eddesdeButtonClick(Sender: TObject);
var tf, f : string;
begin
if rgTFactura.ItemIndex = 0 then
 tf := 'P%'
else
 if rgTFactura.ItemIndex = 1 then
  tf := 'D%'
 else
  tf := 'C%';

{frmbusquedas.query:='SELECT RemiFact.idfactura,RemiFact.idremicion,pedidos.idpedido,pedidos.idcliente,if(clientes.rsocial is null or clientes.rsocial,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')), '+
                    'clientes.rsocial) as cliente,RemiFact.FechaAlta,pedidos.usuario, pedidos.fecha, pedidos.hora FROM  pedidos INNER JOIN clientes ON (pedidos.idcliente = clientes.idcliente)   left join RemiFact on pedidos.idpedido = RemiFact.idpedido '+
                    ' where pedidos.estatus=4 and RemiFact.idfactura <> ''0'' and RemiFact.idfactura like '+quotedstr(tf)+' order by RemiFact.FechaAlta';}
                                                                                             //''P%''
frmbusquedas.query:='SELECT idfactura,idpedido,idremicion FROM  RemiFact where idfactura like "'+tf+'%" order by FechaAlta';
frmbusquedas.campo_retorno := 'idfactura';
//querys('SELECT count(RemiFact.idfactura) as cant FROM  pedidos  inner join RemiFact on pedidos.idpedido = RemiFact.idpedido where RemiFact.idfactura <> ''0'' and RemiFact.idfactura like '+quotedstr(tf),0,sqlgeneral);
querys('SELECT count(RemiFact.idfactura) as cant FROM  RemiFact where RemiFact.idfactura like '+quotedstr(tf),0,sqlgeneral);
frmbusquedas.maxrow :=sqlgeneral.fieldbyname('cant').AsInteger;
frmbusquedas.tblorigen := 'RemiFact';
frmbusquedas.tabla:='';
frmbusquedas.ShowModal;
f :=  frmbusquedas.resultado;
if f <> '' then
  begin
  chtecla:=#13;
  Delete(f, 1, 1);
  (sender as trzbuttonedit).Text := f;
  (sender as trzbuttonedit).OnKeyPress((sender as trzbuttonedit),chtecla);
  end;
end;

procedure TfrmImpFact.eddesdeKeyPress(Sender: TObject; var Key: Char);
var tf:string;
begin
key := ValidaNumeros(key,false);

if (key = #13)and ((sender as trzbuttonedit).Text <> '')  then
   begin
     if rgTFactura.ItemIndex = 0 then
    tf := 'P'
  else
    if rgTFactura.ItemIndex = 1 then
      tf := 'D'
    else
      tf := 'C';
    key:= #0;
    //valida que exista el numero de factura tecleado
    querys('select RemiFact.idremicion,RemiFact.idfactura,pedidos.idpedido,pedidos.idcliente,pedidos.TotMn from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido where pedidos.estatus=4 and RemiFact.idfactura='+quotedstr(tf+(sender as trzbuttonedit).Text),0,SqlGeneral);
    if sqlgeneral.RecordCount = 0 then
     begin
      application.MessageBox('El numero de factura tecleado no existe','Aviso',mb_iconinformation);
      (sender as trzbuttonedit).Text := '';
     end
    else
      SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TfrmImpFact.btnconsultaClick(Sender: TObject);
var tf:string;
begin
  frmmensaje.Show;
  frmmensaje.Update;

  if rgTFactura.ItemIndex = 0 then
    tf := 'P'
  else
    if rgTFactura.ItemIndex = 1 then
      tf := 'D'
    else
      tf := 'C';

  //querys('select RemiFact.idremicion,RemiFact.idfactura,pedidos.idpedido,pedidos.idcliente,pedidos.TotMn from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido where pedidos.estatus=4 and RemiFact.idfactura>='+quotedstr(eddesde.Text)+' and RemiFact.idfactura<='+quotedstr(edhasta.Text)+' order by RemiFact.idfactura',0,SqlBuscaPed);
  querys('select rf.idremicion,rf.idfactura,p.idpedido,p.idcliente,p.TotMn from pedidos p inner join RemiFact rf on '+
         'p.idpedido = rf.idpedido where p.estatus=4  and replace(rf.idfactura, "'+tf+'", "") between '+eddesde.text+' and '+
         ''+edhasta.text+' order by rf.idfactura',0,SqlBuscaPed);
  frmmensaje.Close;
if SqlBuscaPed.RecordCount = 0 then
 begin
  lblregistros.Visible := false;
  btnimprimir.Enabled := false;
  application.MessageBox('No se encontro ningun registro','Aviso',mb_iconinformation);
 end
else
 begin
  lblregistros.Visible := true;
  lblregistros.Caption := 'Registros encontrados '+inttostr(SqlBuscaPed.RecordCount);
  btnimprimir.Enabled:=true;
 end;
end;

procedure TfrmImpFact.btnimprimirClick(Sender: TObject);
var total,tc,ant,tot:double;
    year,dia,mes:word;
    dec : string; // CantEnLetras,  ,deducible
    sqlaux : tmyquery;
begin
sqlaux := tmyquery.Create(self);
sqlaux.Connection := dmaccesos.conexion;
frmprincipal.ucprincipal.Log('Imprimio de la Factura '+eddesde.Text+' hasta '+edhasta.Text+','+lblregistros.Caption,1);
if application.MessageBox('Desea Ver el Preview de la(s) factura(s)?','Pregunta',mb_yesno+mb_iconquestion)=idyes then
 dmreportes.rvp.Engine := dmreportes.rvsystem1
else
 dmreportes.rvp.Engine := dmreportes.rvsystem2;
sqlBuscaPed.First;
while not sqlBuscaPed.Eof do
 begin
  querys('select TotDlls,TipoCambio,Anticipo,TotMn,FechaCreacion from pedidos where idpedido ='+sqlBuscaPed.fieldbyname('idpedido').AsString,0,sqlaux);
  total := sqlaux.fieldbyname('TotDlls').Asfloat;
  tc := sqlaux.fieldbyname('TipoCambio').Asfloat;
  ant := sqlaux.fieldbyname('anticipo').Asfloat;
  tot :=  sqlaux.fieldbyname('TotDlls').Asfloat;
  tot := (tc*tot)-ant;

   //inicia proceso de impresion de factura
    decodedate(strtodate(sqlaux.fieldbyname('FechaCreacion').Asstring),year,mes,dia);
    with dmreportes do
     begin
      {try
       NumToLetras.Numero := strtoint(midstr(sqlaux.fieldbyname('TotMn').Asstring,1,posex('.',sqlaux.fieldbyname('TotMn').Asstring)-1));
       dec := midstr(sqlaux.fieldbyname('TotMn').Asstring,posex('.',sqlaux.fieldbyname('TotMn').Asstring)+1,length(sqlaux.fieldbyname('TotMn').Asstring));
      except
       NumToLetras.Numero := 0;
       dec := '0';
      end;    }
      sqlclientesfact.Close;
      sqlclientesfact.ParamByName('dia').Value := dia;
      sqlclientesfact.ParamByName('mes').Value := meses[mes];
      sqlclientesfact.ParamByName('ano').Value := year;
      sqlclientesfact.ParamByName('ped').Value := strtoint(sqlBuscaPed.fieldbyname('idpedido').AsString);
      sqlclientesfact.ParamByName('idcliente').Value := sqlBuscaPed.fieldbyname('idcliente').AsString;
      //sqlclientesfact.ParamByName('cant').Value :='(' + uppercase(NumToLetras.Letras) + ' PESOS ' + dec + '/100)';
      sqlclientesfact.ParamByName('cant').Value := 'PESOS';
      sqlclientesfact.ParamByName('Fact').Value :=sqlBuscaPed.fieldbyname('idfactura').AsString;
      sqlclientesfact.Open;

        {if sqlclientesfact.FieldByName('deducible').AsString = 'True' then
            deducible := '1'
        else
            deducible := floattostr(1+getIVA);}
        {querys('select DetPedido.idpedido,DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido.cant,DetPedido.piezas,if ('+floattostr(1+getIVA)+'='+deducible+',articulos.iva/100,0) as Iva,articulos.desc_esp/100 as descuento,DetPedido.tc,if(articulos.aplica_desc = 1,''TRUE'',''FALSE'') '+
               ' as aplica_desc,(DetPedido.costo*'+deducible+'*DetPedido.tc) as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda,(if (articulos.aplica_desc = 1,(((DetPedido.costo-(DetPedido.costo*articulos.desc_esp/100)) + ((DetPedido.costo- '+
               '(DetPedido.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.cant) + ((((DetPedido.costo/articulos.piezasxunidad)-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPedido.costo/articulos.piezasxunidad)'+
               '-((DetPedido.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*DetPedido.piezas), ((DetPedido.costo+(DetPedido.costo*articulos.iva/100))*DetPedido.cant) + (((DetPedido.costo/articulos.piezasxunidad)+'+
               '((DetPedido.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas))*'+deducible+'*DetPedido.tc) as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPedido.cant)  as tinstalacion,DetPedido.utilidad,DetPedido.paquete,'+
               'DetPedido.idrequisicion,DetPedido.idCardexArt from DetPedido inner join articulos on DetPedido.cod_cve = articulos.cod_cve where DetPedido.idpedido='+sqlBuscaPed.fieldbyname('idpedido').AsString+' order by DetPedido.id',0,sqlgeneral2);}

         querys('select dp.idpedido,dp.id,dp.cod_cve,a.nombre,dp.cant,dp.piezas,a.desc_esp/100 as descuento,dp.tc, '+
        'if(a.aplica_desc = 1, "TRUE", "FALSE") as aplica_desc,(dp.costo*dp.tc) as precio, if(a.moneda = "D", '+
        '"DOLARES","PESOS") as Moneda,(if (a.aplica_desc = 1,(((dp.costo-(dp.costo*a.desc_esp/100)) + ((dp.costo- '+
        '(dp.costo*a.desc_esp/100))*a.iva/100))*dp.cant) + ((((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)'+
        '*a.desc_esp/100)) +(((dp.costo/a.piezasxunidad)-((dp.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))* '+
        'dp.piezas), ((dp.costo+(dp.costo*a.iva/100))*dp.cant) + (((dp.costo/a.piezasxunidad)+ ((dp.costo/a.piezasxunidad)'+
        '*a.iva/100))*dp.piezas))*dp.tc) as Total,a.piezasxunidad,(a.tinstalacion*dp.cant)  as tinstalacion,dp.utilidad,'+
        'dp.paquete, dp.idrequisicion,dp.idCardexArt '+
        'from DetPedido dp inner join articulos a on dp.cod_cve = a.cod_cve where dp.idpedido='+sqlBuscaPed.fieldbyname('idpedido').AsString+' '+
        'order by dp.id',0,sqlgeneral2);
       //dmreportes.rvsystem2.DefaultDest := rdprinter;
      // dmreportes.RvSystem1.DoNativeOutput:=false;
      //printer.Printers.IndexOf('Epson FX-880');
     // rvsystem1.BaseReport.PrinterIndex :=printer.Printers.IndexOf('Epson FX-880');
       rvp.ProjectFile := uprincipal.my_path + 'Reportes_sysalarm.rav';
      // rvsystem1.BaseReport.PrinterIndex :=printer.Printers.IndexOf('Epson FX-880');
      // rvsystem1.SystemPrinter.InitPrinter(rvsystem1.BaseReport);
       if rgTFactura.itemindex = 0 then
         RVP.ExecuteReport('FacturasMX')
        // RVP.ExecuteReport('temp')
       else
        if rgTFactura.itemindex = 1 then
         RVP.ExecuteReport('FacturasCD')
        else
         RVP.ExecuteReport('Factura');
     end;
   sqlBuscaPed.Next;
  end;
  sqlBuscaPed.First;
  application.MessageBox(pchar('Ha finalizado la reimpresion de facturas del rango de la factura '+eddesde.text+' a la '+edhasta.text),'Aviso',mb_iconinformation);
dmreportes.RVP.Engine:=dmreportes.RvSystem1;
end;

procedure TfrmImpFact.btnsalirClick(Sender: TObject);
begin
close
end;

procedure TfrmImpFact.eddesdeChange(Sender: TObject);
begin
btnimprimir.Enabled := false;
sqlbuscaped.Close;
if (eddesde.Text = '') or(edhasta.Text = '') then
 begin
  sqlBuscaPed.Close;
  btnimprimir.Enabled := false;
  btnconsulta.Enabled := false;
 end
else
  btnconsulta.Enabled := true;
end;

procedure TfrmImpFact.rgTFacturaClick(Sender: TObject);
begin
eddesde.Clear;
edhasta.Clear;
sqlbuscaped.Close;
end;

end.
