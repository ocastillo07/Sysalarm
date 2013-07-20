{///////////////////////////////////////////////////////////////////////////////
2011/10/19 dalyla quitar el numtolet y poner funcion letras de mysql
2010/11/18 dalyla Terminado y agregado al proyecto
}///////////////////////////////////////////////////////////////////////////////
unit UNotasCreditoHist;

interface

uses
  Windows,strutils, Messages, SysUtils,dateutils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,qdialogs, RzEdit, RzBtnEdt, StdCtrls, Mask, RzDBEdit, RzLabel, RzCmboBx,
  RzButton, DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls,
  LMDCustomComponent, LMDContainerComponent, LMDBaseDialog,
  LMDCustomCheckListDlg, LMDCheckListDlg, RzDTP, ToolWin, cxCurrencyEdit;

type
  TfrmNotasCreditoHist = class(TForm)
    gbcliente: TGroupBox;
    RzLabel9: TRzLabel;
    lblmovil: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblentre: TRzLabel;
    lblalta: TRzLabel;
    lblfuente: TRzLabel;
    lblorigen: TRzLabel;
    lblnombre: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel47: TRzLabel;
    RzLabel8: TRzLabel;
    lblcategoria: TRzLabel;
    RzLabel45: TRzLabel;
    edentre: TRzDBEdit;
    ednombre: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    c: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    edcuenta: TRzDBEdit;
    edrsocial: TRzDBEdit;
    edcontrol: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    edGiro: TRzDBEdit;
    GBprincipal: TGroupBox;
    edcvecte: TRzButtonEdit;
    RzLabel39: TRzLabel;
    edcvevend: TRzButtonEdit;
    RzLabel1: TRzLabel;
    gbarticulo: TGroupBox;
    RzLabel15: TRzLabel;
    Label8: TLabel;
    lblproducto: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    Label1: TLabel;
    chkpiezas: TCheckBox;
    btnagregar: TRzBitBtn;
    CboUtilidad: TRzComboBox;
    edDescripcion: TRzEdit;
    EdPrecio: TRzEdit;
    EdDesc: TRzEdit;
    edTInsta: TRzEdit;
    edcodigo: TRzButtonEdit;
    edCantidad: TRzEdit;
    sqlclientes: TMyQuery;
    dsclientes: TDataSource;
    btncancelar: TRzBitBtn;
    RzLabel2: TRzLabel;
    edfactura: TRzButtonEdit;
    edFecha: TRzDateTimeEdit;
    RzLabel28: TRzLabel;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    paquete: TcxGridDBColumn;
    cxmoneda: TcxGridDBColumn;
    tiempo: TcxGridDBColumn;
    precio: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    sqlrejilla: TMyQuery;
    dsrejilla: TDataSource;
    edNumNC: TRzButtonEdit;
    RzLabel11: TRzLabel;
    Dialogo: TLMDCheckListDlg;
    SqlGeneral: TMyQuery;
    sqltemp: TMyQuery;
    gbtotales: TGroupBox;
    RzLabel22: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    edTotMat: TRzNumericEdit;
    edDescuento: TRzNumericEdit;
    ediva: TRzNumericEdit;
    edTotDlls: TRzNumericEdit;
    edTotMn: TRzNumericEdit;
    edSaldo: TRzNumericEdit;
    edAnticipo: TRzEdit;
    edTCP: TRzEdit;
    RzLabel40: TRzLabel;
    GBAdicionales: TGroupBox;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    edNumPed: TRzEdit;
    edAduana: TRzEdit;
    dtpFechaAduana: TRzDateTimePicker;
    sqlNotasCred: TMyQuery;
    dtpFecPagAnt: TRzDateTimePicker;
    RzLabel7: TRzLabel;
    mmObservaciones: TRzRichEdit;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    sqlinserta: TMyQuery;
    RzLabel10: TRzLabel;
    edventa: TRzEdit;
    btnimprimir: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    edpiva: TRzEdit;
    edserie: TRzEdit;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure edCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edfacturaKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure edCantidadChange(Sender: TObject);
    procedure EdPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure EdPrecioExit(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoChange(Sender: TObject);
    procedure edAnticipoKeyPress(Sender: TObject; var Key: Char);
    procedure edAnticipoExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure edNumNCButtonClick(Sender: TObject);
    procedure mmObservacionesChange(Sender: TObject);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure edcvevendExit(Sender: TObject);
    procedure edNumNCKeyPress(Sender: TObject; var Key: Char);
    procedure edNumPedKeyPress(Sender: TObject; var Key: Char);
    procedure edAduanaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFechaAduanaKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFecPagAntKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnimprimirClick(Sender: TObject);
    procedure edNumNCChange(Sender: TObject);
    procedure edTCPExit(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    { Private declarations }
    semiauto : integer;
   procedure LimpiaTotales;
   procedure InsertaArticulo(cod_cve:string;cantidad:integer);
   procedure LimpiaDatArt;
   procedure MetodoAlta;
   procedure CalculaTotales;
   function ValidaProducto(CodCve:string):integer;
   function ValidaTipoArticulo(CodCve:string):boolean;
   function TraeNc(idnc : string) : integer;
   procedure ModificaArticulo;
   procedure actualiza;
   function ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
   procedure TraeCliente;
  public
    { Public declarations }
    idpedido : string;
    procedure limpia;
  end;

var
  frmNotasCreditoHist: TfrmNotasCreditoHist;

implementation

uses Urecursos, Ubusquedas, Udm, Uprincipal, UBuscaArt, Udmrep;

{$R *.dfm}

procedure tfrmNotasCreditoHist.LimpiaTotales;
begin
    edTotMat.Text:='0';
    edDescuento.Text:='0';
    edIva.Text:='0';
    edTotDlls.Text:='0';
    edTotMn.Text:='0';
    edanticipo.Text:='0';
    edSaldo.Text:='0';
end;

function TfrmNotasCreditoHist.TraeNc(idnc : string) : integer;
begin
chtecla := #13;
 //trae los datos de la Nota de Credito si existe
  querys('select * from NotasCredito where concat(serie, idnc)="'+idnc+'"',0,SqlNotasCred);
 if SqlNotasCred.RecordCount > 0 then
  begin
   edserie.text := SqlNotasCred.fieldbyname('serie').AsString;
   edNumNc.Text := SqlNotasCred.fieldbyname('idnc').AsString;
   edcvecte.Text := SqlNotasCred.fieldbyname('idcliente').AsString;
   lbufh.Caption := UFH(SqlNotasCred);
   TraeCliente;
   if edGiro.Text = '' then
    begin
     limpia;
     result := 0;
     exit;
    end;
   btnimprimir.Enabled := true;
   btnmodificar.enabled := true;
   //trae el idpedido
   querys('select idpedido from RemiFact where idfactura='+quotedstr(SqlNotasCred.fieldbyname('idfactura').AsString),0,sqlgeneral);
   edventa.Text := sqlgeneral.fieldbyname('idpedido').AsString;
   edcvevend.Text := SqlNotasCred.fieldbyname('idvendedor').AsString;
   edfactura.Text := SqlNotasCred.fieldbyname('idfactura').AsString;
   edfecha.Date := SqlNotasCred.fieldbyname('FechaNc').AsDateTime;
   edpiva.text := SqlNotasCred.fieldbyname('piva').AsString;
   edTCP.Text := trim(format('%8.2f',[SqlNotasCred.fieldbyname('TipoCambio').Asfloat]));
   if edTCP.Text = '0.00' then
    begin
     //trae el tipo de cambio
     querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
     if application.MessageBox(pchar('No se encontro el tipo de cambio desea utilizar el predeterminado $'+trim(format('%8.2f',[sqlgeneral.fieldbyname('valor').asfloat]))),'Confirmacion',mb_yesno+mb_iconquestion)=idyes then
      edtcp.Text :=trim(format('%8.2f',[sqlgeneral.fieldbyname('valor').asfloat]))
     else
      while edTCP.Text = '0' do
       edTCP.Text := floattostr(inputbox('Captura de Tipo de Cambio','No se encontro el tipo de cambio, debe de teclearlo:',1.000,1.000,100000.000,3));
    end;
   edNumPed.Text := SqlNotasCred.fieldbyname('pedimento').AsString;
   edAduana.Text := SqlNotasCred.fieldbyname('aduana').AsString;
   dtpFechaAduana.Date := SqlNotasCred.fieldbyname('FechaAduana').AsDateTime;
   dtpFecPagAnt.Date := SqlNotasCred.fieldbyname('FechaPago').AsDateTime;
   mmObservaciones.Text := SqlNotasCred.fieldbyname('observaciones').AsString;
   //refresca la rejilla de datos
   sqlrejilla.Close;
   sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
   sqlrejilla.ParamByName('serie').Value := edserie.Text;
   sqlrejilla.ParamByName('idnc').Value := edNumNc.Text;
   sqlrejilla.Open;
   edcvecte.enabled := false;
   edfactura.enabled := false;
   CalculaTotales;
   gbarticulo.Enabled := false;
   result := 1;
  end
 else
  begin
   application.MessageBox('Ese numero de Nota de Credito no Existe','Aviso',mb_iconinformation);
   result:=0;
 end;
end;

function TfrmNotasCreditoHist.ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
//var c,p,pxu,ex,dif:integer;
begin
result := 0;
//los resultados de esta funcion son los siguientes
//si regresa 0 significa que puede vender bien
//si regresa cantidad negativa es que ya no hay existencias
//si regresa cantidad positiva significa que no puede vender por completo la mercancia
//p:=0;c:=0;ex:=0;pxu:=0;unidades:=0;

//comentado por daly, porke es historico y no valida existencias ya ke no  las modifica
      {
  querys('select sum(cant) as cant, sum(piezas) as piezas from tmpNC'+frmprincipal.idmaq+' where cod_cve='+quotedstr(CodCve),0,sqlgeneral);

c:=sqlgeneral.fieldbyname('cant').AsInteger;
p:=sqlgeneral.fieldbyname('piezas').AsInteger;
if piezas then
 p:=p+cantidad
else
 c:=c+cantidad;

//unidades:=cantidad;
//aqui busca el articulo por codigo de barras o por clave en la detalle de pedidos
querys('SELECT DetPedido.cod_cve,sum((DetPedido.cant * articulos.piezasxunidad) + DetPedido.piezas) AS existencia,articulos.servicio,articulos.paquete,articulos.PrecioCapturable,articulos.piezasxunidad FROM DetPedido INNER JOIN articulos ON ' +
       '(DetPedido.cod_cve = articulos.cod_cve) WHERE (DetPedido.idpedido = '+edventa.text+') AND ((articulos.cod_barras = '+quotedstr(CodCve)+') or (articulos.cod_cve = '+quotedstr(CodCve)+')) GROUP BY DetPedido.cod_cve,articulos.servicio,articulos.paquete,articulos.PrecioCapturable,articulos.piezasxunidad',0,SqlGeneral);
if (SqlGeneral.FieldByName('servicio').AsInteger = 0) and (SqlGeneral.FieldByName('paquete').AsInteger = 0) then
  begin
  ex:=SqlGeneral.FieldByName('existencia').AsInteger;
  pxu:=SqlGeneral.FieldByName('piezasxunidad').AsInteger;

  if ex <> 0 then
    begin
    if piezas then
      begin
      if SqlGeneral.FieldByName('piezasxunidad').AsInteger = 1 then
        begin
        btnagregar.Tag:=1;
        result:=ex-p;
        exit;
        end;
      end;

    dif:=(ex-p-(c*pxu));
    if dif < 0 then
      begin
      if pxu > 1 then
        result:=dif*pxu
      else
        result:=(dif div pxu);
      end
    else
      begin
      if dif >= 0 then
        begin
        result:=0;
        exit;
        end
      else
        if piezas then
          result:=cantidad*(-1)
        else
          result:=cantidad*(-1)*pxu;
      end;
    end
  else
    if piezas then
      result:=p*(-1)
    else
      result:=c*(-1)*pxu;
  end
else //valida los paquetes
  if SqlGeneral.FieldByName('paquete').AsInteger = 1 then
    if SqlGeneral.FieldByName('existencia').AsInteger >= c then
      result := 0
    else
      result := -1;    }
end;

procedure TfrmNotasCreditoHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmNotasCreditoHist.ModificaArticulo;
begin
if btnmodificar.Caption = '&Guardar' then
  begin
  if (dsrejilla.DataSet.RecordCount > 0) and
    ((dsrejilla.DataSet.FieldByName('paquete').AsString = '') or (dsrejilla.DataSet.FieldByName('paquete').AsString = '0')) then
    begin
    gbarticulo.Enabled := true;
    edcodigo.Text:=dsrejilla.DataSet.FieldValues['cod_cve'];
    eddescripcion.Text:=dsrejilla.DataSet.FieldValues['nombre'];
    edprecio.Text:=dsrejilla.DataSet.FieldValues['precio'];
    eddesc.Text:=dsrejilla.DataSet.FieldValues['descuento'];
    edtinsta.Text:=dsrejilla.DataSet.FieldValues['tinstalacion'];
    cboutilidad.Text:=dsrejilla.DataSet.FieldValues['utilidad'];
    if dsrejilla.DataSet.FieldValues['cant'] > 0 then
       edcantidad.Text:=dsrejilla.DataSet.FieldValues['cant']
    else
      begin
        edcantidad.Text:=dsrejilla.DataSet.FieldValues['piezas'];
        chkpiezas.Checked:=true;
      end;
    //querys('delete from DetNotasCredito where id='+dsrejilla.DataSet.fieldbyname('id').AsString+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' or paquete='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
    //refresca la rejilla de datos
    sqlrejilla.Close;
    sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
    sqlrejilla.ParamByName('idnc').Value := 0;
    sqlrejilla.Open;
    btnagregar.Enabled:=true;
    edcodigo.Enabled:=false;
    edcantidad.Enabled:=true;
    edcantidad.SetFocus;
    end;
  end
else
  begin

  if (dsrejilla.DataSet.RecordCount > 0) and (dsrejilla.DataSet.FieldByName('paquete').AsString <> '1') then
    begin
    gbarticulo.Enabled := true;
    edcodigo.Text:=dsrejilla.DataSet.FieldValues['cod_cve'];
    eddescripcion.Text:=dsrejilla.DataSet.FieldValues['nombre'];
    edprecio.Text:=dsrejilla.DataSet.FieldValues['precio'];
    eddesc.Text:=dsrejilla.DataSet.FieldValues['descuento'];
    edtinsta.Text:=dsrejilla.DataSet.FieldValues['tinstalacion'];
    cboutilidad.Text:=dsrejilla.DataSet.FieldValues['utilidad'];
    if dsrejilla.DataSet.FieldValues['cant'] > 0 then
       edcantidad.Text:=dsrejilla.DataSet.FieldValues['cant']
    else
      begin
        edcantidad.Text:=dsrejilla.DataSet.FieldValues['piezas'];
        chkpiezas.Checked:=true;
      end;
    //querys('delete from tmpNC'+frmprincipal.idmaq+' where cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+'',1,SqlGeneral);
    //refresca la rejilla de datos
    sqltemp.Refresh;
    
    btnagregar.Enabled:=true;
    edcodigo.Enabled:=false;
    edcantidad.Enabled:=true;
    edcantidad.SetFocus;
    end;

  end;
end;


procedure TfrmNotasCreditoHist.MetodoAlta;
Var sqlarticulos : TMyquery;
begin
sqlarticulos := tmyquery.Create(self);
sqlarticulos.Connection := dmaccesos.conexion;
dialogo.CaptionTitle := 'Como desea Trabajar?';
dialogo.Prompt := 'Metodo de Captura:';
dialogo.Items.Clear;
dialogo.Items.Add('Automatico');
dialogo.Items.Add('SemiAutomatico');
dialogo.Items.Add('Manual');
if dialogo.Execute then
  begin
 case dialogo.Value of
 0 : begin
     //trae los datos de DetPedido
     querys('select dp.tc,cod_cve,sum(cant) as cant,sum(piezas) as piezas,utilidad,dp.paquete,costo,'+
             inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+idpedido+', p.piva '+
             'from DetPedido dp left join pedidos p  on p.idpedido=dp.idpedido '+
             'where dp.idpedido = '+idpedido+' group by cod_cve,costo',0,sqlgeneral);
     //trae los datos de DetNotasCredito
     sqlgeneral.First;
     edpiva.text := sqlgeneral.FieldByName('piva').AsString;
     while not sqlgeneral.Eof do
       begin
       querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas from DetNotasCredito where idpedido = '+idpedido+' and cod_cve='+quotedstr(sqlgeneral.fieldbyname('cod_cve').AsString)+' group by cod_cve',0,sqltemp);
       if sqltemp.RecordCount > 0 then
         begin
         if (sqlgeneral.FieldByName('cant').AsString > sqltemp.FieldByName('cant').AsString) or (sqlgeneral.FieldByName('piezas').AsString > sqltemp.FieldByName('piezas').AsString)  then
           begin
           querys('insert into DetNotasCredito (cant,piezas,cod_cve,utilidad,paquete,costo,idmaq,idpedido,tc,usuario,hora,fecha) values ('+inttostr(sqlgeneral.FieldByName('cant').Asinteger-sqltemp.FieldByName('cant').Asinteger)+','+inttostr(sqlgeneral.FieldByName('piezas').Asinteger-sqltemp.FieldByName('piezas').Asinteger)+
                  ','+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString)+','+quotedstr(sqlgeneral.FieldByName('utilidad').AsString)+','+quotedstr(sqlgeneral.FieldByName('paquete').AsString)+','+sqlgeneral.FieldByName('costo').AsString+','+frmprincipal.idmaq+','+
                  idpedido+','+sqlgeneral.FieldByName('tc').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(timetostr(Horaservidor))+','+quotedstr(datetostr(FechaServidor))+')',1,sqlinserta);
           end;
         end
       else
         begin
         querys('insert into DetNotasCredito (cant,piezas,cod_cve,utilidad,paquete,costo,idmaq,idpedido,tc,usuario,fecha,hora) values ('+inttostr(sqlgeneral.FieldByName('cant').Asinteger)+','+inttostr(sqlgeneral.FieldByName('piezas').Asinteger)+
                ','+quotedstr(sqlgeneral.FieldByName('cod_cve').AsString)+','+quotedstr(sqlgeneral.FieldByName('utilidad').AsString)+','+quotedstr(sqlgeneral.FieldByName('paquete').AsString)+','+sqlgeneral.FieldByName('costo').AsString+','+frmprincipal.idmaq+','+
                idpedido+','+sqlgeneral.FieldByName('tc').AsString+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlinserta);
         end;
       sqlgeneral.Next;
       end;
     sqlrejilla.Close;
     sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
     sqlrejilla.ParamByName('idnc').Value := 0;
     sqlrejilla.Open;
     if sqlrejilla.RecordCount = 0 then
       application.MessageBox('No se encontro ningun articulo que se pueda devolver de este pedido','Aviso',mb_iconinformation)
     else
       begin
       CalculaTotales;
       edcodigo.SetFocus;
       end;
     end;

  1: begin
     querys('select p.piva from pedidos p where p.idpedido = '+idpedido,0,sqlgeneral);
     edpiva.text := sqlgeneral.FieldByName('piva').AsString;
     //trae los datos de DetPedido
     querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas,utilidad,paquete,costo,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+idpedido+' from DetPedido where idpedido = '+idpedido+' group by cod_cve',0,sqlarticulos);
     sqlarticulos.First;
      while not sqlarticulos.Eof do
        begin
         //verifica si ya existe se ha hecho Nc de este articulo de ese pedido
        querys('select cod_cve,sum(cant) as cant,sum(piezas) as piezas from DetNotasCredito where idpedido = '+idpedido+' and cod_cve='+quotedstr(sqlarticulos.fieldbyname('cod_cve').AsString)+' group by cod_cve',0,sqltemp);
        if (sqlarticulos.FieldByName('cant').AsString > sqltemp.FieldByName('cant').AsString) or (sqlarticulos.FieldByName('piezas').AsString > sqltemp.FieldByName('piezas').AsString)  then
         begin
         if (sqlarticulos.fieldbyname('paquete').AsString <> '1')  then
          begin
           semiauto:=1;
           edcodigo.Text := sqlarticulos.fieldbyname('cod_cve').AsString;
           edprecio.Text := sqlarticulos.fieldbyname('costo').AsString;
           if sqlarticulos.fieldbyname('cant').Asinteger - sqltemp.fieldbyname('cant').Asinteger > 0 then
            edcantidad.Text := inttostr(sqlarticulos.fieldbyname('cant').Asinteger - sqltemp.fieldbyname('cant').Asinteger)
           else
            begin
             edcantidad.Text := inttostr(sqlarticulos.fieldbyname('piezas').Asinteger - sqltemp.fieldbyname('piezas').Asinteger);
             chkpiezas.Checked := true;
           end;
           ValidaProducto(edcodigo.Text);
           while semiauto = 1 do
            application.ProcessMessages;
            if semiauto = 2 then
             break;
          end;
        end;
         sqlarticulos.next;
       end;
        edcantidad.Text := '';
      end;
   2: begin
      querys('select p.piva from pedidos p where p.idpedido = '+idpedido,0,sqlgeneral);
      edpiva.text := sqlgeneral.FieldByName('piva').AsString;
      edcodigo.SetFocus;
      end;
   end;
 gbarticulo.Enabled := true;
end
else
 gbarticulo.Enabled := false;
end;

procedure tfrmNotasCreditoHist.limpia;
begin
edventa.Clear;
ednumnc.clear;
edserie.clear;
edcvecte.Clear;
edcvevend.Clear;
edfactura.Clear;
edpiva.clear;
edfecha.Date := date;
sqlclientes.Close;
sqlrejilla.Close;
mmObservaciones.Lines.Clear;
edcantidad.Clear;
btnimprimir.Enabled := false;
btnmodificar.enabled := false;
LimpiaTotales;
lbufh.Caption := '';
querys('Select letras from FoliosFE where procedencia="NC FE"', 0, sqlgeneral);
  edserie.text := sqlgeneral.fieldbyname('letras').AsString;
end;

procedure TfrmNotasCreditoHist.TraeCliente;
begin

      if edcvecte.Text <> '' then
        begin
         sqlclientes.Close;
         sqlclientes.Params.Items[0].Value:=strtoint(edcvecte.Text);
         sqlclientes.Open;
         if sqlclientes.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
            edfactura.SetFocus;
           end
         else
           begin
           if edGiro.Text = '' then
            begin
              application.MessageBox('Ha este cliente no se le ha especificado el giro y no podra hacerle Notas deCredito hasta no especificar su giro, lo puede hacer en la pantalla de clientes','Aviso',mb_iconinformation);
              sqlclientes.Close;
            end
           else
            begin
              gbarticulo.Enabled:=true;
              btnagregar.Enabled:=false;
              {if gbprincipal.enabled then
                edfactura.SetFocus;   }
            end;
          end;
         end;
end;

procedure TfrmNotasCreditoHist.FormShow(Sender: TObject);
begin
semiauto := 0;
//verifica que existan notas de credito
querys('select idfactura from NotasCredito limit 1,1',0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 begin
  edNumNc.Enabled := true;
  edserie.enabled := true;
  querys('Select letras from FoliosFE where procedencia="NC FE"', 0, sqlgeneral);
  edserie.text := sqlgeneral.fieldbyname('letras').AsString;
  edserie.SetFocus;
 end
else
 begin
 edNumNc.Enabled := false;
 edserie.enabled := false;
 end;

  shortdateformat:='yyyy/mm/dd';
end;

function TfrmNotasCreditoHist.ValidaProducto(CodCve:string):integer;
Var cantvend,cantdev : integer;
begin
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve,nombre,precio'+lowercase(CboUtilidad.Text)+' as precio,desc_esp,tinstalacion,piezasxunidad,existencia,aplica_desc, '+
       ' nom_envase,nom_piezas,servicio,paquete,PrecioCapturable from articulos where cod_cve='+quotedstr(CodCve)+ ' or cod_barras='+quotedstr(CodCve),0,dmreportes.sqlgeneral);
if dmreportes.sqlgeneral.RecordCount = 0 then
 begin
  application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
  edcodigo.SelectAll;
  dmreportes.sqlgeneral.Close;
  edcantidad.Text:='1';
  edcodigo.Text:='';
  chkpiezas.Checked:=false;
  result := 0;
 end
else
 begin
  if (dmreportes.sqlgeneral.fieldbyname('servicio').Asinteger = 0) and (dmreportes.sqlgeneral.fieldbyname('PrecioCapturable').Asinteger = 0) then //si se cumple significa que es un articulo
   begin
    //valida que el artiulo introducido de halla vendido
    querys('select cant from DetPedido where cod_cve='+quotedstr(CodCve)+' and idpedido='+edventa.text,0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
     begin
      application.MessageBox('El articulo tecleado no esta en la factura tecleada y no podra agregarlo a su Nota de Credito','Aviso',mb_iconinformation);
      edcodigo.Clear;
      result:=0;
      exit;
     end;
   end
  else
   begin
    //se trae de detalles de pedido la cantidad total en piezas que se halla vendido del articulo actual
    querys('SELECT sum(((DetPedido.cant * articulos.piezasxunidad) + DetPedido.piezas)) as total FROM DetPedido INNER JOIN articulos ON (DetPedido.cod_cve = articulos.cod_cve) WHERE DetPedido.idpedido = '+edventa.text+' and DetPedido.cod_cve = '+quotedstr(CodCve),0,sqlgeneral);
    cantvend := sqlgeneral.fieldbyname('total').AsInteger;
    //se trae de detalles de notas de credito total en piezas que se hallan regresado
    querys('SELECT sum(((dnc.cant * a.piezasxunidad) + dnc.piezas)) as total '+
          'FROM DetNotasCredito dnc INNER JOIN articulos a ON (dnc.cod_cve = a.cod_cve) '+
           'WHERE ((dnc.serie = "'+edserie.text+'" and dnc.idnc = '+quotedstr(edNumNc.Text)+') or (dnc.idmaq = '+frmprincipal.idmaq+') or (dnc.idpedido='+edventa.text+')) and DetNotasCredito.cod_cve='+quotedstr(CodCve),0,sqlgeneral);
    cantdev := sqlgeneral.fieldbyname('total').AsInteger;
    if cantvend <> 0 then
     if cantvend <= cantdev then
      begin
       application.MessageBox('Ya se a devuelto en su totalidad este articulo','Aviso',mb_iconinformation);
       result := 0;
       exit;
      end;
   end;

   if edcodigo.Text = 'MONITOREO' then
     begin
       querys('select CostoMensual from categorias where nombre = ' + quotedstr(edgiro.Text),0,dmreportes.sqlgeneral3);
       edPrecio.Text := dmreportes.sqlgeneral3.fieldbyname('CostoMensual').AsString;
     end
    else
      begin
      //cambio realizado el 20 enero 2007 *edwin*
      // edPrecio.Text:=dmreportes.sqlgeneral.fieldbyname('precio').AsString;
       if( edPrecio.Text = '') then
         edPrecio.Text:=dmreportes.sqlgeneral.fieldbyname('precio').AsString;

      end;
     querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(CodCve),0,sqlgeneral);
      if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
       begin
        edprecio.Enabled := true;
        edprecio.SetFocus;
       end
      else
       begin
        edcantidad.Enabled := true;
        edcantidad.setfocus;
       end;
     //pregunta si se va a poder ValidaProducto en piezas
      edDescripcion.Text:=dmreportes.sqlgeneral.fieldbyname('nombre').AsString;
      if dmreportes.sqlgeneral.FieldByName('aplica_desc').Asstring = 'True' then
       edDesc.Text:=dmreportes.sqlgeneral.fieldbyname('desc_esp').Asstring;
       edTInsta.Text:=dmreportes.sqlgeneral.fieldbyname('tinstalacion').AsString;
       result :=1;
  end;
end;

procedure TfrmNotasCreditoHist.edcodigoButtonClick(Sender: TObject);
begin
frmbuscaart.ShowModal;
     if frmbuscaart.cod_cve <> '' then
        begin
         edcodigo.Text:=frmbuscaart.cod_cve;
            edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          chkpiezas.Enabled:=true;
          edcodigo.Enabled:=false;
          ValidaProducto(edcodigo.text);
    if ValidaProducto(edcodigo.text) = 1 then
       begin
           edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          chkpiezas.Enabled:=true;
          edcodigo.Enabled:=false;
       end
    else
       begin
         edcodigo.Text:='';
         edcodigo.SetFocus;
       end;
        end;
end;

procedure TfrmNotasCreditoHist.InsertaArticulo(cod_cve:string;cantidad:integer);
var tc,descu,costo:string;
cant,piezas:integer;
begin

cant:=0;
piezas:=0;
if chkpiezas.Checked then
 piezas:=cantidad
else
 cant:=cantidad;

if eddesc.Text = '' then
 descu:='0';

if rejilla.Enabled = false then
 rejilla.Enabled:=true;

querys('select PrecioCapturable,servicio,moneda from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
if sqlgeneral.FieldByName('moneda').AsString = 'P' then
 tc := '1'
else
 tc := edtcp.text;

costo := edPrecio.Text;
///////**Comentado por edwin** le modifique el costo por el costo que tiene en el edit, si no tiene que si haga el if que tenia anteriormente ok
if costo = '' then
  begin
  if (sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 0) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
    begin
    //trae el costo del articulo en base al tipo de precio
    querys('select precio'+CboUtilidad.Text+' as costo from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
    costo := sqlgeneral.fieldbyname('costo').AsString;
    end
  else
    costo := edPrecio.Text;
  end;
//inserta los datos del articulo en DetPresupuesto
  if  querys('Select cod_cve from tmpNC'+frmprincipal.idmaq+' where cod_cve="'+cod_cve+'"', 0, sqlgeneral) = 0 then
      querys('insert into tmpNC'+frmprincipal.idmaq+' (serie, idnc, cant,piezas,cod_cve,utilidad,costo,idpedido,tc, paquete) '+
             'values ("'+edserie.text+'", '+edNumNC.text+', '+floattostr(cant)+','+floattostr(piezas)+','+quotedstr(cod_cve)+','+quotedstr(CboUtilidad.Text)+','+costo+','+
               edventa.text+','+tc+',0)',1,SqlGeneral)
  else
      querys('update tmpNC'+frmprincipal.idmaq+' set cant='+floattostr(cant)+', piezas='+floattostr(piezas)+', '+
             'utilidad='+quotedstr(CboUtilidad.Text)+', costo='+costo+' where cod_cve='+quotedstr(cod_cve)+'',1,SqlGeneral);
  sqltemp.Refresh;

LimpiaDatArt;
semiauto := 0;
edprecio.Enabled := false;
edfactura.Enabled := false;
edcantidad.Enabled := false;
end;


procedure TfrmNotasCreditoHist.btnagregarClick(Sender: TObject);
var valor : integer;
begin
valor:=ValidaExistencias(edcodigo.Text,strtoint(edcantidad.text),chkpiezas.Checked);
if valor = 0 then
 begin
 if ValidaTipoArticulo(edcodigo.Text) = false then
   begin
   application.MessageBox('El articulo no se encuentra en el pedido','Aviso',mb_iconwarning);
   exit;
   end;

  //verifica si es paquete
  querys('select * from articulos where cod_cve='+quotedstr(edcodigo.Text)+ ' and paquete=1',0,SqlGeneral);
  if sqlgeneral.RecordCount > 0 then
   application.MessageBox('No puedes insertar paquetes','Aviso',mb_iconwarning)
  else
  InsertaArticulo(edcodigo.Text,strtoint(edcantidad.text));
  CalculaTotales;
 end
else
 application.MessageBox('La cantidad que se desea devolver mas la ya devuelta es mayor a la comprada','Aviso',mb_iconwarning);
 //LimpiaDatArt;
end;

procedure TfrmNotasCreditoHist.edCantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key<>'p') and (key<>'P') and (key<>#13) and (key <> #27) then
  key := ValidaNumeros(key,false);


if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
      if semiauto = 0 then
       edcodigo.SetFocus;
    end;

if (key = 'p') or (key = 'P') then
   begin
     if chkpiezas.Checked then
        chkpiezas.Checked:=false
     else
      begin
       //pregunta si se puede vender en piezas este articulo
       querys('select piezasxunidad from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
       if sqlgeneral.FieldByName('piezasxunidad').AsInteger > 1 then
        chkpiezas.Checked:=true
       else
        application.MessageBox('Este Articulo no se vende en piezas','Aviso',mb_iconinformation);
      end;
     key:=#0;
   end;

if key = #27 then
   begin
     semiauto := 0;
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;
end;

procedure TfrmNotasCreditoHist.LimpiaDatArt;
begin
     //limpia los campos
     btnagregar.Enabled:=false;
     edcantidad.Text:='';
     edcantidad.Enabled := false;
     chkpiezas.Checked:=false;
     chkpiezas.Enabled:=false;
     Cboutilidad.Enabled:=false;
     edtinsta.Text:='';
     edDesc.Text:='';
     edprecio.Text:='';
     edprecio.Enabled := false;
     edDescripcion.Text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
end;


procedure TfrmNotasCreditoHist.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if semiauto = 1 then
 if application.MessageBox('Se encuentra en proceso de alta, desea cancelar?','Pregunta',mb_yesno+mb_iconwarning) = idyes then
  begin
   semiauto := 2;
   canclose := true;
  end
 else
  canclose := false;
end;

procedure TfrmNotasCreditoHist.edfacturaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edfactura.Text = '') then
 begin
  key := #0;
  edfactura.OnButtonClick(self);
 end;

if (key = #13) and (edfactura.Text <> '') then
   begin
    key:= #0;
    //verifica que este cliente tenga la factura tecleada
    querys('SELECT RemiFact.idfactura,pedidos.idpedido FROM RemiFact INNER JOIN pedidos ON (RemiFact.idpedido = pedidos.idpedido) WHERE RemiFact.idfactura = '+quotedstr(edfactura.Text)+' AND pedidos.idcliente = '+edcvecte.Text,0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
     begin
      application.MessageBox('La factura Tecleada no pertene al cliente seleccionado','Aviso',mb_iconinformation);
      exit;
     end;
    //verifica si no se ha cancelado esta venta
    querys('select movimiento from PagosClientes where movimiento = 5 and idfactura = '+quotedstr(edfactura.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
     begin
      application.MessageBox('Esta Venta ha sido cancelada','Aviso',mb_iconinformation);
      Limpia;
      exit;
     end
    else
     begin
      querys('select if((month(RemiFact.FechaAlta) = month(current_date)) and (year(RemiFact.FechaAlta)= year(current_date )),"No","Si") as Dif,'+
              'RemiFact.idremicion,RemiFact.idfactura,pedidos.idpedido,pedidos.idcliente,pedidos.TotMn from pedidos inner join RemiFact on pedidos.idpedido = RemiFact.idpedido'+
             ' where RemiFact.idfactura='+quotedstr(edfactura.Text),0,SqlGeneral);
      if (SqlGeneral.RecordCount > 0) and (sqlgeneral.FieldByName('Dif').AsString='Si')  then
       begin
        //trae el numero de pedido
        querys('select pedidos.idpedido,pedidos.TipoCambio,pedidos.idvendedor from RemiFact inner join pedidos on pedidos.idpedido = RemiFact.idpedido where RemiFact.idfactura='+quotedstr(edfactura.Text),0,sqlgeneral);
        idpedido := sqlgeneral.fieldbyname('idpedido').AsString;
        edcvevend.Text := sqlgeneral.fieldbyname('idvendedor').AsString;
        edtcp.Text := sqlgeneral.fieldbyname('TipoCambio').AsString;
        edventa.Text := idpedido;
        MetodoAlta;
       end
    else
       if SqlGeneral.RecordCount = 0 then
        begin
         application.MessageBox('El numero de factura tecleado no existe','Aviso',mb_iconinformation);
         edfactura.Clear;
        end
       else
        begin
          if application.MessageBox('El numero de factura tecleado es del mes en curso, Desea Continuar?','Aviso',mb_iconquestion+mb_yesno) = idyes then
           begin
            //trae el numero de pedido
            querys('select pedidos.idpedido,pedidos.TipoCambio,pedidos.idvendedor from RemiFact inner join pedidos on pedidos.idpedido = RemiFact.idpedido where RemiFact.idfactura='+quotedstr(edfactura.Text),0,sqlgeneral);
            idpedido := sqlgeneral.fieldbyname('idpedido').AsString;
            edcvevend.Text := sqlgeneral.fieldbyname('idvendedor').AsString;
            edtcp.Text := sqlgeneral.fieldbyname('TipoCambio').AsString;
            edventa.Text := idpedido;
            MetodoAlta;
           end
          else
            begin
           sqlrejilla.close;
           edfactura.Clear;
           exit;
           end;

        end;
   end;
 end;
end;

procedure TfrmNotasCreditoHist.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
begin
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption := '&Cerrar';

       btnmodificar.Caption:='&Editar';
       btnmodificar.Hint:='Modificar una Nota de Credito';
       querys('Drop table if exists tmpNC'+frmprincipal.idmaq,1,sqlgeneral);
       sqltemp.close;
       dsrejilla.DataSet := sqlrejilla;
        limpia;
          LimpiaDatArt;
          GBAdicionales.Enabled := false;
          gbarticulo.Enabled := false;
        ednumnc.Enabled := true;
        edserie.enabled := true;
        ednumnc.Text :='';
        edventa.Clear;
        ednumnc.SetFocus;
        btnmodificar.enabled := false;
 end
else
close;
end;

procedure TfrmNotasCreditoHist.edCantidadChange(Sender: TObject);
begin
if edcantidad.Text = '' then
 btnagregar.Enabled := false
else
 btnagregar.Enabled := true;
end;

procedure TfrmNotasCreditoHist.CalculaTotales;
var subtotal,descuento,iva,hrs:double; sql:tmyquery;
begin
if btnmodificar.Caption = '&Guardar' then
  sql := sqltemp
else
  sql := sqlrejilla;

if sql.RecordCount = 0 then
 LimpiaTotales
else
  begin
     if btnmodificar.Caption = '&Guardar' then
         rejilla.Enabled:=true;

subtotal := 0;   iva :=0; hrs:= 0;   descuento := 0;
    sql.First;
while not sql.Eof do
   begin
         if (sql.FieldValues['cant'] > 0) or (sql.FieldValues['cant'] < 0) then
          begin
           if sql.FieldValues['moneda'] = 'PESOS' then
             begin
              subtotal:=subtotal+(sql.FieldValues['cant']*sql.FieldValues['precio']);
              iva:=iva+((sql.FieldValues['precio']*sql.FieldValues['iva'])*sql.FieldValues['cant']);
              if sql.FieldValues['aplica_desc'] then
               descuento:=descuento+((sql.FieldValues['precio']*sql.FieldValues['descuento'])*sql.FieldValues['cant']);
             end
           else
            begin
              subtotal:=subtotal+(sql.FieldValues['cant']*sql.FieldValues['precio']*strtofloat(edtcp.Text));
              iva:=iva+(((sql.FieldValues['precio']*sql.FieldValues['iva'])*sql.FieldValues['cant'])*strtofloat(edtcp.Text));
              if sql.FieldValues['aplica_desc'] then
               descuento:=descuento+(((sql.FieldValues['precio']*sql.FieldValues['descuento'])*sql.FieldValues['cant'])*strtofloat(edtcp.Text));
            end;
          end
       else
         begin
          if sql.FieldValues['moneda'] = 'PESOS' then
           begin
            subtotal:=subtotal+(sql.FieldValues['piezas']*(sql.FieldValues['precio']/sql.FieldValues['piezasxunidad']));
            iva:=iva+(((sql.FieldValues['precio']/sql.FieldValues['piezasxunidad'])*sql.FieldValues['iva'])*sql.FieldValues['piezas']);
            if sql.FieldValues['aplica_desc'] then
              descuento:=descuento+(((sql.FieldValues['precio']/sql.FieldValues['piezasxunidad'])*sql.FieldValues['descuento'])*sql.FieldValues['piezas']);
           end
          else
           begin
            subtotal:=subtotal+(sql.FieldValues['piezas']*(sql.FieldValues['precio']/sql.FieldValues['piezasxunidad'])*strtofloat(edtcp.Text));
            iva:=iva+((((sql.FieldValues['precio']/sql.FieldValues['piezasxunidad'])*sql.FieldValues['iva'])*sql.FieldValues['piezas'])*strtofloat(edtcp.Text));
            if sql.FieldValues['aplica_desc'] then
             descuento:=descuento+((((sql.FieldValues['precio']/sql.FieldValues['piezasxunidad'])*sql.FieldValues['descuento'])*sql.FieldValues['piezas'])*strtofloat(edtcp.Text));
          end;
         end;
           hrs:=hrs+sql.FieldValues['tinstalacion'];
           sql.Next;
       end;

    edTotMat.Text:=Format('%8.2f',[subtotal]);
    ediva.Text := format('%8.2f',[strtofloat(edTotMat.Text)*strtofloat(edpiva.text)]);
    eddescuento.Text:=Format('%8.2f',[descuento]);
    edTotDlls.Text := Format('%8.2f',[((strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text))/strtofloat(edtcp.Text)]);
    edTotmn.Text:=Format('%8.2f',[(strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text)]);
   edSaldo.Text:=Format('%8.2f',[strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text)]);
 end;
end;


procedure TfrmNotasCreditoHist.EdPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin
  key := ValidaNumeros(key,false);
  key := ValidaPunto(edprecio.Text,key);
if (key = #13) and (edPrecio.Text <> '') then
 begin
  key := #0;
  edcantidad.enabled := true;
  edCantidad.SetFocus;
 end;
end;

procedure TfrmNotasCreditoHist.EdPrecioExit(Sender: TObject);
begin
if (strtofloat(edprecio.Text) <= 0) and (edcodigo.text = 'CARGOS') then
 begin
  application.MessageBox('El precio del articulo no puede ser Menor o Igual a 0','Cuidado',mb_iconwarning);
  edPrecio.Text := '1';
 end;
end;

procedure TfrmNotasCreditoHist.edcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#27) then
 begin
  key:=#0;
  LimpiaDatArt;
 end;

if (key=#13)and(edcodigo.text<>'') then begin //if 1
     key:=#0;
     if ValidaProducto(edcodigo.Text) = 1 then
        begin
          edcantidad.Enabled:=true;
          //trae el campo PrecioCapturable
          querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
          if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
           edPrecio.SetFocus
          else
           edcantidad.SetFocus;
           edcantidad.Text := '1';
          //btnagregar.Enabled:=true;
        end;
     end;

if (key = #13) and (edcodigo.Text = '') then
   begin
     key:=#0;
    edcodigo.OnButtonClick(self);
   end;
end;

procedure TfrmNotasCreditoHist.edcodigoChange(Sender: TObject);
begin
if edcodigo.Text = '' then
LimpiaDatArt;
end;

procedure TfrmNotasCreditoHist.edAnticipoKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
end;

procedure TfrmNotasCreditoHist.edAnticipoExit(Sender: TObject);
begin
if strtofloat(edanticipo.Text)>strtofloat(edTotMn.Text) then
 begin
   application.MessageBox('El anticipo no puede ser mayor que el total','Aviso',mb_iconinformation);
   edanticipo.Text:=edTotMn.Text;
 end;

if edanticipo.Text <> '' then
   begin
   edanticipo.Text:=trim(Format('%8.2f',[strtofloat(edanticipo.Text)]));
   end;
end;

procedure TfrmNotasCreditoHist.btnfuentesClick(Sender: TObject);
begin
CambiaFont(mmobservaciones);
end;

procedure TfrmNotasCreditoHist.edNumNCButtonClick(Sender: TObject);
begin
      frmbusquedas.query:='SELECT *, concat(serie,idnc) as id FROM NotasCredito';
      frmbusquedas.campo_retorno:='id';
      frmbusquedas.campo_busqueda:='idnc';
      frmbusquedas.tabla:='';
      frmbusquedas.tblorigen := 'NotasCredito';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
       begin
        edNumNc.Text := frmbusquedas.resultado;
        TraeNc(frmbusquedas.resultado);
       end;

end;

procedure TfrmNotasCreditoHist.mmObservacionesChange(Sender: TObject);
begin
if tbherramientas <> nil then
if mmobservaciones.Text <> '' then
 btnfuentes.Enabled := true
else
 btnfuentes.Enabled := false;
end;

procedure TfrmNotasCreditoHist.RejillaDBTableView1DblClick(Sender: TObject);
begin
ModificaArticulo;
CalculaTotales;
end;

procedure TfrmNotasCreditoHist.edcvevendExit(Sender: TObject);
begin
//edcvevend.OnKeyPress(self,chtecla);
end;

procedure TfrmNotasCreditoHist.edNumNCKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (edNumNc.Text <> '') then
 begin
  key := #0;
  TraeNc(edserie.text+edNumNc.Text);
 end;
end;

procedure TfrmNotasCreditoHist.edNumPedKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edNumPed.Text <> '') then
 begin
  key := #0;
  edAduana.SetFocus;
 end;
end;

procedure TfrmNotasCreditoHist.edAduanaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edAduana.Text <> '') then
 begin
  key := #0;
  dtpFechaAduana.SetFocus;
 end;
end;

procedure TfrmNotasCreditoHist.dtpFechaAduanaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  dtpFecPagAnt.SetFocus;
 end;
end;

procedure TfrmNotasCreditoHist.dtpFecPagAntKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key := #0;
  mmObservaciones.SetFocus;
 end;
end;

procedure TfrmNotasCreditoHist.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key = 46) and (sqlrejilla.RecordCount > 0) then
 begin
 if btnmodificar.Caption = '&Guardar' then
   {begin
    querys('delete from DetNotasCredito where id='+sqlrejilla.fieldbyname('id').AsString,1,sqlgeneral);
    sqlrejilla.Close;
    sqlrejilla.ParamByName('maq').Value := strtoint(frmprincipal.idmaq);
    sqlrejilla.ParamByName('idnc').Value := 0;
    sqlrejilla.Open;
    end
   else}
    begin
    querys('delete from tmpNC'+frmprincipal.idmaq+' where cod_cve="'+sqltemp.fieldbyname('cod_cve').AsString+'"',1,sqlgeneral);
    sqlrejilla.Refresh;
    sqltemp.Refresh;
    end;

  CalculaTotales;
 end;
end;

procedure TfrmNotasCreditoHist.btnimprimirClick(Sender: TObject);
var dec : string;  //   ,deducible
begin

//dmreportes.NumToLetras.Numero := strtoint(midstr(edTotMn.Text,1,posex('.',edTotMn.Text)-1));
//dec := midstr(edsaldo.text,posex('.',edTotMn.Text)+1,length(edTotMn.Text));
//dec:='(' + uppercase(dmreportes.NumToLetras.Letras) + ' PESOS ' + dec + '/100)';          '
dec := 'PESOS';


querys('SELECT '+quotedstr(edfactura.Text)+' as Factura,letras((nc.subtotal + nc.impuesto), '+quotedstr(dec)+') as NumLet,dnc.idnc,dnc.idpedido,dnc.id,dnc.cod_cve, '+
       'a.nombre as NomArt,(dnc.cant + dnc.piezas) as cant, a.iva/100 as IvaArt,'+
       'a.desc_esp/100 as descuento,dnc.tc, if(a.aplica_desc = 1,"TRUE","FALSE") as aplica_desc, nc.idnc, '+
       '(dnc.costo*dnc.tc) as precio,if(a.moneda = "D","DOLARES","PESOS") as Moneda, '+

       '(if (a.aplica_desc = 1,((( '+
       'dnc.costo-(dnc.costo*a.desc_esp/100)) + ((dnc.costo-(dnc.costo*a.desc_esp/100))*a.iva/100))*dnc.cant) + '+
       '((((dnc.costo/a.piezasxunidad)-((dnc.costo/a.piezasxunidad)*a.desc_esp/100)) +(((dnc.costo/a.piezasxunidad)-((dnc.costo/'+
       'a.piezasxunidad)*a.desc_esp/100))*a.iva/100))*dnc.piezas),((dnc.costo+(dnc.costo*a.iva/100))*dnc.cant)+(((dnc.costo/'+
       'a.piezasxunidad)+((dnc.costo/a.piezasxunidad)*a.iva/100))*dnc.piezas))*dnc.tc) as TotalArt'+

       ',a.piezasxunidad,'+
       '(a.tinstalacion*dnc.cant) as tinstalacion,dnc.utilidad, dnc.paquete,nc.idnc,nc.FechaNc,c.idcliente,cf.NombreCres AS Cliente, '+
       'concat(ifnull(cf.DirCres," "),""," ",ifnull(cf.ColCres," ")) as dir,concat(ifnull( cf.CdCres," " )," ", '+
       'ifnull(cf.EstadoCres ," "))  AS ciudad,cf.RFCCres as rfc,cf.telefono,nc.observaciones, round(nc.subtotal ,2) as SubTotal, '+
       'nc.impuesto as IvaNC,(nc.subtotal + nc.impuesto) as TotalNC, '+
       'usuarios.codigo,c.deducible as deducible '+
       'FROM clientes c LEFT JOIN ClientesFact cf ON (c.idfact = cf.idfact) LEFT JOIN contactos ON (c.idcontacto = contactos.idcontador) '+
       'LEFT  JOIN giros ON (c.idgiro = giros.idgiro) LEFT JOIN sectores ON (c.sector = sectores.idsector) '+
       'join NotasCredito nc left join DetNotasCredito dnc on dnc.idnc=nc.idnc '+
       'left join usuarios on usuarios.idusuario = nc.idvendedor inner join articulos a on dnc.cod_cve = a.cod_cve '+
       'WHERE c.idcliente='+edcvecte.Text+' and nc.serie = "'+edserie.text+'" and nc.idnc ='+edNumNc.text,0,dmreportes.sqlgeneral);

//deducible:='0';
dmreportes.ppReport.Template.DatabaseSettings.Name := 'NotasCredito';
dmreportes.ppReport.Template.LoadFromDatabase;
if dmreportes.sqlgeneral.RecordCount > 8 then
 //dmreportes.ppFooterBand1.PrintOnLastPage := true
 dmreportes.ppFooterBand1.PrintOnFirstPage := true
else
 dmreportes.ppFooterBand1.PrintOnFirstPage := true;
dmreportes.ppReport.Print;
end;

procedure TfrmNotasCreditoHist.edNumNCChange(Sender: TObject);
begin
if edNumNc.text = '' then
 limpia;
end;

procedure TfrmNotasCreditoHist.edTCPExit(Sender: TObject);
begin
if edTCP.Text = '' then
 begin
  application.MessageBox('Debe de especificar el Tipo de Cambio','Cuidado',mb_iconwarning);
  edTCP.SetFocus;
 end
else
 begin
    CalculaTotales;
 end;
end;

procedure TfrmNotasCreditoHist.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
  begin
    {if querys('select (restante*-1) as res, nc.total from PagosClientes pc '+
            'left join NotasCredito nc on nc.idfactura=pc.idfactura '+
            'where nc.idnc = '+ednumnc.text+' and pc.movimiento = 6 '+
            'having res < total', 0, sqlgeneral) > 0 then
    begin
    application.MessageBox('Esta Nota de Credito ya fue aplicada y no puede modificarla', 'Atencion', MB_ICONEXCLAMATION);
    exit;
    end;}

  edprecio.enabled := true;
  btnmodificar.Caption:='&Guardar';
  btnmodificar.Hint:='Guardar los datos de la Edicion';
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la edicion';
  gbprincipal.Enabled := true;
  edNumNc.Enabled := false;
  edserie.enabled := false;
  edfecha.Enabled := true;
  mmObservaciones.Enabled := true;
  edfactura.Enabled := false;
  edanticipo.Enabled := true;
  GBAdicionales.Enabled := true;
  gbarticulo.enabled := true;
  rejilla.enabled := true;
  edcvecte.enabled := false;
  edventa.Enabled := false;

  querys('Drop table if exists tmpNC'+frmprincipal.idmaq, 1, sqlgeneral);
  querys('Create table tmpNC'+frmprincipal.idmaq+' (serie varchar(4), idnc int(11), cant decimal(10,2), piezas int(11), '+
         'cod_cve varchar(60), utilidad decimal(10,2), paquete int(11), idpedido int(11), '+
         'costo decimal(10,2), id int(11), CostoDev decimal(10,2), ImporteDev decimal(10,2), '+
         'tc decimal(10,2)) Select serie, idnc, cant, piezas, cod_cve, utilidad, paquete, idpedido, costo, '+
         'id, CostoDev, ImporteDev, tc from DetNotasCredito where serie = "'+edserie.text+'" and idnc = '+edNumNc.Text+' '+
         'and serie = "'+edserie.Text+'"', 1, sqlgeneral);
         
  querys('select dnc.serie, dnc.idnc,dnc.id,dnc.cod_cve,a.nombre,dnc.cant,dnc.piezas,a.iva/100 as Iva,a.desc_esp/100 as descuento, '+
         'if (a.aplica_desc = 1, "TRUE","FALSE") as aplica_desc, dnc.costo as precio,if(a.moneda = "D","DOLARES","PESOS") '+
         'as Moneda, 0 as idCardexArt, if (a.aplica_desc = 1, (((dnc.costo-(dnc.costo*a.desc_esp/100)) + ((dnc.costo-'+
         '(dnc.costo*a.desc_esp/100))*a.iva/100))*dnc.cant) + ((((dnc.costo/a.piezasxunidad)-((dnc.costo/a.piezasxunidad)'+
         '*a.desc_esp/100)) +(((dnc.costo/a.piezasxunidad)-((dnc.costo/a.piezasxunidad)*a.desc_esp/100))*a.iva/100))*'+
         'dnc.piezas), ((dnc.costo+(dnc.costo*a.iva/100))*dnc.cant) + (((dnc.costo/a.piezasxunidad)+((dnc.costo/'+
         'a.piezasxunidad)*a.iva/100))*dnc.piezas)) as Total,a.piezasxunidad,(a.tinstalacion*dnc.cant) as tinstalacion, '+
         'dnc.utilidad,dnc.paquete from tmpNC'+frmprincipal.idmaq+' dnc inner join articulos a on dnc.cod_cve = a.cod_cve order by cod_cve', 0, sqltemp);
  dsrejilla.DataSet := sqltemp;
  end
else
  begin
  querys('Update NotasCredito set FechaNc = "'+edfecha.Text+'", subtotal='+edTotMat.Text+', impuesto='+ediva.Text+
         ', anticipo='+edanticipo.Text+', total='+edTotMn.Text+', pedimento='+quotedstr(edNumPed.Text)+', aduana ='+
         quotedstr(edAduana.Text)+', FechaAduana='+quotedstr(datetostr(dtpfechaaduana.date))+',FechaPago="'+
         datetostr(dtpFecPagAnt.date)+'",observaciones="'+mmobservaciones.Text+'",TipoCambio='+edTCP.Text+', '+
         'saldo='+floattostr(strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text))+',usuario="'+
         frmprincipal.ucprincipal.CurrentUser.LoginName+'",fecha="'+datetostr(date)+'",hora="'+
         FormatDateTime('HH:mm:ss',Time)+'" where serie="'+edserie.text+'" and idnc = '+edNumNc.Text+' and serie = "'+edserie.Text+'"', 1, sqlgeneral);

  querys('Update PagosClientes set abono =('+edTotMn.Text+'*-1), restante=('+edTotMn.Text+'*-1) '+
         'where idpedido = '+edventa.Text+' and movimiento = 6 and notas="N.C. :'+edserie.text+edNumNc.Text+'"', 1, sqlgeneral);
  actualiza;
  frmprincipal.ucprincipal.Log('Edito la nota de Credito '+edserie.text+ednumnc.text, 2);
   edprecio.enabled := false;
  GBAdicionales.Enabled := false;
  limpia;
  rejilla.enabled := false;
  dsrejilla.DataSet := sqlrejilla;
  btnmodificar.enabled := false;
  self.OnShow(self);
  btnmodificar.Caption:='&Editar';
  btnmodificar.Hint:='Editar los datos de la Nota de Credito';
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar la pantalla';
  end;

end;

procedure TfrmNotasCreditoHist.actualiza;
begin
//Regresa los articulos que se eliminaron de la nota
if querys('select dnc.cod_cve, dnc.cant from DetNotasCredito dnc left join tmpNC'+frmprincipal.idmaq+' t on '+
          'dnc.cod_cve = t.cod_cve where t.cod_cve is null  and dnc.serie = "'+edserie.Text+'" and dnc.idnc ='+ednumnc.text, 0, sqlgeneral) > 0 then
  begin
  RegresaCancelacion(sqlgeneral, 32, edserie.text+ednumnc.text, edventa.text);
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('Delete from DetNotasCredito where cod_cve ="'+sqlgeneral.fieldbyname('cod_cve').AsString+'" '+
           'and serie = "'+edserie.Text+'" and serie="'+edserie.text+'" and idnc ='+ednumnc.text, 1, sqlinserta);
    sqlgeneral.Next;
    end;
  end;

//Y los que la cantidad es menor
if querys('select dnc.cod_cve, (dnc.cant-t.cant) as cant, t.cant as ncant, t.piezas, t.costo, if(a.moneda="P", 1, "'+edTCP.text+'") as tc '+
          'from DetNotasCredito dnc left join tmpNC'+frmprincipal.idmaq+' t on dnc.cod_cve = t.cod_cve '+
          'left join articulos a on a.cod_cve=dnc.cod_cve '+
          'where t.cant <  dnc.cant and dnc.serie = "'+edserie.Text+'" and dnc.idnc ='+ednumnc.text, 0, sqlgeneral) > 0 then
  begin
  RegresaCancelacion(sqlgeneral, 32,  edserie.text+ednumnc.text, edventa.text);
  end;
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('Update DetNotasCredito set cant = '+sqlgeneral.fieldbyname('ncant').AsString+', '+
           'piezas='+sqlgeneral.fieldbyname('piezas').AsString+', costo='+sqlgeneral.fieldbyname('costo').AsString+' '+
           'tc="'+sqlgeneral.fieldbyname('tc').AsString+'" '+
           'where serie = "'+edserie.Text+'" and idnc ='+ednumnc.text+' and cod_cve ="'+sqlgeneral.fieldbyname('cod_cve').AsString+'" ', 1, sqlinserta);
    sqlgeneral.Next;
    end;


//Da entrada a los articulos nuevos
if querys('select t.* from tmpNC'+frmprincipal.idmaq+' t where t.cod_cve not in(select cod_cve '+
   'from DetNotasCredito where serie = "'+edserie.Text+'" and idnc = '+ednumnc.text+')', 0, sqlgeneral) > 0 then
  begin
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('select piezasxunidad,servicio,paquete,PrecioCapturable,costo, '+
            'moneda, if(moneda="P", 1, "'+edTCP.text+'") as tc from articulos '+
           'where cod_cve="'+sqlgeneral.FieldByName('cod_cve').Asstring+'" ',0,sqlinserta);
    {if (sqlinserta.FieldByName('paquete').AsInteger=0)and(sqlinserta.FieldByName('servicio').AsInteger=0) then
      begin}
      querys('insert into DetNotasCredito(serie, idnc, cant,piezas,cod_cve,utilidad,costo,idmaq,idpedido,usuario,fecha,hora,tc) '+
             'values ("'+edserie.Text+'", '+ednumnc.text+','+sqlgeneral.FieldByName('cant').Asstring+','+floattostr(sqlinserta.fieldbyname('costo').AsFloat)+
             ',"'+sqlgeneral.FieldByName('cod_cve').Asstring+'",'+sqlgeneral.FieldByName('utilidad').Asstring+','+
             sqlgeneral.FieldByName('costo').Asstring+',0,'+edventa.text+',"'+
             frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+timetostr(time)+'",'+floattostr(sqlinserta.fieldbyname('costo').AsFloat)+')',1,Sqlinserta);
      //end;
    sqlgeneral.Next;
    end;
  end;

//da entrada a los que aumentaron la cantidad
if querys('select t.cod_cve, t.cant as ncant, t.piezas from DetNotasCredito dnc left join tmpNC'+frmprincipal.idmaq+' t on '+
          'dnc.cod_cve = t.cod_cve where (t.cant <> dnc.cant or t.piezas<>dnc.piezas) '+
          'and dnc.serie = "'+edserie.Text+'" and dnc.idnc ='+ednumnc.text, 0, sqlgeneral) > 0 then
  begin
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('select piezasxunidad, servicio,paquete, PrecioCapturable, costo from articulos where cod_cve="'+sqlgeneral.FieldByName('cod_cve').Asstring+'"',0,sqlinserta);
    {if (sqlinserta.FieldByName('paquete').AsInteger=0)and(sqlinserta.FieldByName('servicio').AsInteger=0) then
      begin}
      //CalculaCostoPromedio(sqlinserta.fieldbyname('costo').AsFloat, 'N',sqlgeneral.FieldByName('cod_cve').Asstring, '-',sqlgeneral.FieldByName('cant').AsInteger);
      querys('Update DetNotasCredito set cant = '+sqlgeneral.fieldbyname('ncant').AsString+', piezas='+sqlgeneral.fieldbyname('piezas').AsString+' '+
             'where idnc="'+ednumnc.text+'" and serie = "'+edserie.Text+'" and cod_cve ="'+sqlgeneral.fieldbyname('cod_cve').AsString+'" ', 1,sqlinserta);
     //end;
    sqlgeneral.Next;
    end;
  end;


//Y los que la cantidad es igual
if querys('select dnc.cod_cve, (dnc.cant-t.cant) as cant, t.cant as ncant, t.piezas, t.costo, if(a.moneda="P", 1, "'+edTCP.text+'") as tc '+
          'from DetNotasCredito dnc left join tmpNC'+frmprincipal.idmaq+' t on dnc.cod_cve = t.cod_cve '+
          'left join articulos a on a.cod_cve=dnc.cod_cve '+
          'where t.cant =  dnc.cant and dnc.serie = "'+edserie.Text+'" and dnc.idnc ='+ednumnc.text, 0, sqlgeneral) > 0 then
  begin
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    querys('Update DetNotasCredito set '+
           'piezas='+sqlgeneral.fieldbyname('piezas').AsString+', costo='+sqlgeneral.fieldbyname('costo').AsString+', '+
           'tc="'+sqlgeneral.fieldbyname('tc').AsString+'" '+
           'where idnc ='+ednumnc.text+' and serie = "'+edserie.Text+'" and cod_cve ="'+sqlgeneral.fieldbyname('cod_cve').AsString+'" ', 1, sqlinserta);
    sqlgeneral.Next;
    end;
  end;
end;

function TfrmNotasCreditoHist.ValidaTipoArticulo(CodCve:string):boolean;
begin
if querys('select dp.cod_cve from articulos a left join DetPedido dp on a.cod_cve=dp.cod_cve where a.cod_cve = "'+
          codcve+'" and dp.idpedido = '+edventa.text+' union select a.cod_cve from articulos a where a.cod_cve = "'+codcve+'" '+
         'and a.inventariable <> 1', 0, sqlgeneral) > 0 then
  result := true
else
  result := false;
end;                 

End.




