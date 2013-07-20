//2008/02/28 dalyla zona horaria ok
unit UDevCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MyAccess, MemDS, DBAccess, StdCtrls,
  RzCmboBx, RzDBCmbo, RzDBEdit, DBCtrls, RzEdit, RzButton, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  cxCurrencyEdit, cxDBEdit, ExtCtrls, Mask, RzBtnEdt, RzLabel, Buttons,
  ComCtrls, ToolWin;

type
  TfrmDevCompras = class(TForm)
    gbdatos: TGroupBox;
    pnldatos: TPanel;
    RzLabel2: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel11: TRzLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RzLabel21: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RzLabel25: TRzLabel;
    RzLabel29: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    comentarios: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    cant_surt: TcxGridDBColumn;
    idorden: TcxGridDBColumn;
    precio_costo: TcxGridDBColumn;
    subtotal: TcxGridDBColumn;
    dbiva: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    gbarticulo: TGroupBox;
    RzLabel13: TRzLabel;
    lblproducto: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    edcantidad: TRzNumericEdit;
    btnagregar: TRzBitBtn;
    edDescripcion: TRzEdit;
    ediva_art: TRzEdit;
    edcomentarios: TRzMemo;
    edultcompra: TRzEdit;
    edmin: TRzEdit;
    edmax: TRzEdit;
    edexist: TRzEdit;
    EdCosto_unidad: TRzEdit;
    edbuscarcompra: TRzButtonEdit;
    edprov: TRzEdit;
    edTipoCambio: TRzEdit;
    GroupBox1: TGroupBox;
    RzLabel1: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel3: TRzLabel;
    edbuscar: TRzButtonEdit;
    edFechaAlta: TRzDBEdit;
    edHoraAlta: TRzDBEdit;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    tblDevCompras: TMyTable;
    DSDevCompras: TDataSource;
    Sqlrejillaalta: TMyQuery;
    DsRejilla: TDataSource;
    SqlGeneral: TMyQuery;
    Sqlrejillaaltatemp: TMyQuery;
    sqlgeneral2: TMyQuery;
    tblDevComprasiddev: TIntegerField;
    tblDevComprasidcompra: TIntegerField;
    tblDevComprasFechaDev: TDateField;
    tblDevComprasDetallesDev: TMemoField;
    tblDevComprasTipoCambio: TFloatField;
    tblDevComprasmoneda: TStringField;
    tblDevComprassubtotal: TFloatField;
    tblDevComprasiva: TFloatField;
    tblDevComprastotal: TFloatField;
    tblDevComprastotalmn: TFloatField;
    tblDevComprasTotalProductos: TIntegerField;
    tblDevComprasusuario: TStringField;
    tblDevComprasfecha: TStringField;
    tblDevComprashora: TStringField;
    tblDevComprasHoraDev: TTimeField;
    dentrega: TRzEdit;
    dvigencia: TRzEdit;
    dpago: TRzEdit;
    edpedimento: TRzEdit;
    edaduana: TRzEdit;
    dimportacion: TRzEdit;
    edfactura: TRzEdit;
    edanticipo: TRzEdit;
    Label1: TLabel;
    rgmoneda: TRzComboBox;
    edcodigo: TRzButtonEdit;
    btnimprimir: TRzBitBtn;
    gbtotales: TGroupBox;
    RzLabel22: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel9: TRzLabel;
    edotros: TRzEdit;
    edfletes: TRzEdit;
    edtp: TRzEdit;
    RzLabel8: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel17: TRzLabel;
    edtotalmn: TRzEdit;
    edtotal: TRzEdit;
    ediva: TRzEdit;
    edsubtotal: TRzEdit;
    estatus: TRzLabel;
    tblDevComprasestatus: TStringField;
    tblDevComprasUsuarioUltMod: TStringField;
    tblDevComprasFechaUltMod: TStringField;
    tblDevComprasHoraUltMod: TStringField;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    eddatosentrega: TRzDBRichEdit;
    fuentes: TFontDialog;
    procedure edbuscarcompraButtonClick(Sender: TObject);
    procedure mostrardatos;
    procedure limpiar;
    procedure operacion;
    procedure LimpiaDatArt;
    procedure mostrar_registros;
    procedure buscarcompralocate;
    procedure buscarlocate;
    function ValidaProducto(CodCve:string):integer;    
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure edbuscarChange(Sender: TObject);
    procedure edbuscarcompraKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure eddatosentregaKeyPress(Sender: TObject; var Key: Char);
    procedure edfletesKeyPress(Sender: TObject; var Key: Char);
    procedure edotrosKeyPress(Sender: TObject; var Key: Char);
    procedure edfletesExit(Sender: TObject);
    procedure edotrosExit(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure RejillaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edbuscarcompraExit(Sender: TObject);
    procedure edbuscarcompraChange(Sender: TObject);
    procedure mostrarDBdatos;
    procedure edTipoCambioExit(Sender: TObject);
    procedure rgmonedaExit(Sender: TObject);
    procedure rgmonedaNotInList(Sender: TObject);
    procedure rgmonedaEnter(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure edcodigoChange(Sender: TObject);
    procedure eddatosentregaEnter(Sender: TObject);
    procedure edcomentariosEnter(Sender: TObject);
    procedure eddatosentregaExit(Sender: TObject);
    procedure edcomentariosExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    idprov,idord:string;
  end;

var
  frmDevCompras: TfrmDevCompras;

implementation

uses Urecursos, Ubusquedas, Uprincipal, Udm, Udmrep, UBuscaArt;

{$R *.dfm}


procedure TfrmDevCompras.mostrarDBdatos;
begin
         edbuscar.Text:=tblDevComprasiddev.asstring;
         edFechaAlta.Text:=tblDevComprasFechaDev.AsString;
         edHoraAlta.text:=tblDevComprasHoraDev.AsString;
         edbuscarcompra.Text:=tblDevCompras.fieldbyname('idcompra').AsString;
         eddatosentrega.Text:=tblDevCompras.fieldbyname('DetallesDev').AsString;
         edTipoCambio.text:=tblDevCompras.fieldbyname('TipoCambio').AsString;
         rgmoneda.Text:=tblDevCompras.fieldbyname('moneda').AsString;
         edtp.Text:=tblDevCompras.fieldbyname('TotalProductos').AsString;
         edsubtotal.Text:=tblDevCompras.fieldbyname('subtotal').AsString;
         ediva.Text:=tblDevCompras.fieldbyname('iva').AsString;
         edtotal.Text:=tblDevCompras.fieldbyname('total').AsString;
         edtotalmn.Text:=tblDevCompras.fieldbyname('totalmn').AsString;
end;


function TfrmDevCompras.ValidaProducto(CodCve:string):integer;
begin
//aqui busca el articulo por clave

  querys('SELECT a.cod_cve as Cod_Cve,a.nombre as Nombre,c.idcompra as IdCompra,c.FechaCompra,a.ultima_compra as ultima_compra,a.existencia as existencia,a.minimo as minimo,a.maximo as maximo,a.costo as Costo,a.iva as Iva,a.usuario as Usuario,'+
         'a.fecha as Fecha,a.hora as Hora  FROM articulos as a INNER JOIN DetCompras as D ON (D.cod_cve=a.cod_cve) INNER JOIN compras as c ON (c.idcompra=D.idcompra) WHERE paquete=0 AND servicio=0 and c.idcompra='+quotedstr(edbuscarcompra.Text)+' ORDER BY nombre ASC',0,sqlgeneral);
 if SqlGeneral.RecordCount = 0 then
   begin
      application.MessageBox('No corresponde ese Articulo en la compra!','Confirmación',mb_iconwarning);
      edcodigo.SelectAll;
      SqlGeneral.Close;
      edcantidad.Text:='1';
      LimpiaDatArt;
      result:=0;
   end  else  begin
      // que muestre los datos
       edDescripcion.Text:=SqlGeneral.fieldbyname('Nombre').AsString;
       edCosto_Unidad.Text:=SqlGeneral.fieldbyname('Costo').AsString;
       ediva_art.Text:=SqlGeneral.fieldbyname('Iva').AsString;
       edultcompra.Text:=SqlGeneral.fieldbyname('ultima_compra').AsString;
       edmin.Text:=SqlGeneral.fieldbyname('minimo').AsString;
       edmax.Text:=SqlGeneral.fieldbyname('maximo').AsString;
       edexist.Text:=SqlGeneral.fieldbyname('existencia').AsString;
       result:=1;

   end;
end;





procedure TfrmDevCompras.InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
var temp:string;
begin

        if rejilla.Enabled = false then
           rejilla.Enabled:=true;

          //verifica que no exista el articulo en la lista
            //insercion para unidades.
            querys('select cod_cve,if ( cant_ord >= ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') , 1, 0) as condicion from DetCompras where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);

             if SqlGeneral.RecordCount = 0 then  begin//recordcount
                querys('select cod_cve,if ( cant_ord >= ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') , 1, 0) as condicion from DetCompras where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);

                 if sqlgeneral.FieldByName('cod_cve').AsString = '' then
                     application.MessageBox('Se excede de articulos de la compra!','Información',mb_ok+mb_iconinformation)
                     else
                      querys('insert into '+tabla+'(cant_ord,cod_cve,'+campo+',costo,comentarios,idmaq) values ('+quotedstr(edcantidad.Text)+','+quotedstr(edcodigo.Text)+','+quotedstr(valor)+','+quotedstr(EdCosto_unidad.Text)+','+quotedstr(edcomentarios.Text)+','+quotedstr(frmprincipal.idmaq)+')',1,SqlGeneral);

             end else begin // recordcount
               temp:=sqlgeneral.fieldbyname('idorden').AsString;
                //solo actualiza las existencias en caso de ya estar en la tabla
               querys('select cod_cve,if ( cant_ord >= ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') , 1, 0) as condicion from DetCompras where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
                  if dmaccesos.sqlgeneral.FieldByName('cod_cve').AsString = '' then
                     application.MessageBox('Se excede de articulos de la compra!','Información',mb_ok+mb_iconinformation)
                  else
                     querys('update '+tabla+' set cant_ord=cant_ord+'+quotedstr(edcantidad.Text)+',costo='+quotedstr(EdCosto_unidad.Text)+',comentarios='+quotedstr(edcomentarios.Text)+'  where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and idorden='+quotedstr(temp),1,SqlGeneral);


             end;//recordcount
//SACAR LOS COSTOS Y LOS TIEMPOS
        //mostrar los articulos del paquete en la rejilla.......
        operacion;
        rejilla.Enabled:=true;
        //vuelve a abrir la query con el id;
        query.Close;
        query.ParamByName('id').AsString:=valor;
        query.Open;
        LimpiaDatArt;
end;


procedure TfrmDevCompras.buscarlocate;
begin
//busqueda de la orden por medio un locate esto si es oprimido el enter despues de haber tecleado un digito

tblDevCompras.Active:=true;
//tblDevCompras.Open;
if tblDevCompras.Locate('iddev',edbuscar.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    SqlRejillaAlta.Close;
    SqlRejillaAlta.ParamByName('id').AsString:=tblDevCompras.fieldbyname('iddev').AsString;
    SqlRejillaAlta.Open;
    btnmodificar.Enabled:=true;
    btnborrar.Enabled:=true;
    mostrarDBdatos;

    querys('Select c.idprov, c.FechaVigencia, c.NumFactura, c.NumPedimento, c.aduana, c.FechaRecepcion, c.FechaPago, '+
           ''+ClienteNombre('p')+' as nombre from compras c inner join proveedores p on c.idprov=p.idprov '+
           'where c.idcompra='+quotedstr(edbuscarcompra.Text),0,SqlGeneral);


    //edprov.Text:=sqlgeneral.fieldbyname('compras.idprov').AsString + sqlgeneral.fieldbyname('nombre').AsString;
    edprov.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    dvigencia.Text:=sqlgeneral.fieldbyname('FechaVigencia').AsString;
    edfactura.Text:=sqlgeneral.fieldbyname('NumFactura').AsString;
    edpedimento.Text:=sqlgeneral.fieldbyname('NumPedimento').AsString;
    edaduana.Text:=sqlgeneral.fieldbyname('aduana').AsString;
    dentrega.Text:=sqlgeneral.fieldbyname('FechaRecepcion').AsString;
    dpago.Text:=sqlgeneral.fieldbyname('FechaPago').AsString;
    btnimprimir.Enabled:=true;
    IF tblDevCompras.fieldbyname('estatus').AsString = 'CANCELADA' THEN
       estatus.Caption:=tblDevCompras.fieldbyname('estatus').AsString
    else
       estatus.caption:='';

   end
else
  begin
    estatus.Caption:='';
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa devolución no existe','Información',mb_ok+mb_iconinformation);
    limpiar;
    tblDevCompras.Active:=false;
    SqlRejillaAlta.Close;
    edbuscar.Text:='';
    edbuscar.SetFocus;
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    btnimprimir.Enabled:=false;
  end;// idarea


end;



procedure TfrmDevCompras.mostrar_registros;
begin
       idord:=RejillaDBTableView1.DataController.DataSet.fieldbyname('idorden').AsString;
       edultcompra.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('ultima_compra').AsString;
       edmin.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('minimo').AsString;
       edmax.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('maximo').AsString;
       edexist.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('existencia').AsString;
       edDescripcion.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('nombre').AsString;
       EdCosto_unidad.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('costo').AsString;
       Edcantidad.text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('cant_ord').AsString;
       Edcodigo.Text:=RejillaDBTableView1.DataController.DataSet.fieldbyname('cod_cve').AsString;
end;


procedure TfrmDevCompras.LimpiaDatArt;
begin
     //limpia los campos
     edmin.Text:='';
     edmax.Text:='';
     edultcompra.Text:='';
     btnagregar.Enabled:=false;
     edcantidad.Text:='1';
     edcantidad.Enabled:=false;
     edcosto_unidad.Text:='';
     edDescripcion.Text:='';
     ediva_art.Text:='';
     edcomentarios.text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
     edexist.text:='';
     if (btncancelar.Caption = '&Cancelar')  then
     edcodigo.SetFocus;

end;



procedure TfrmDevCompras.operacion;
var id:string;
cambio:double;
begin // se calcula los totales conforme a los datos de los campos
    id:=edbuscar.text;
        SqlGeneral.Close;
        SqlGeneral.SQL.Clear;
        SqlGeneral.SQL.Add('Select SUM(DetDevComprasTemp.cant_ord * DetDevComprasTemp.costo) as SUBTOTAL,SUM((DetDevComprasTemp.cant_ord * DetDevComprasTemp.costo)*(articulos.iva/100)) as IVA,');
        SqlGeneral.SQL.Add('SUM(if (articulos.iva > 0,((DetDevComprasTemp.cant_ord * DetDevComprasTemp.costo)*(articulos.iva/100))+DetDevComprasTemp.cant_ord * DetDevComprasTemp.costo,DetDevComprasTemp.cant_ord * DetDevComprasTemp.costo)) as TOTAL,');
        SqlGeneral.SQL.Add('SUM(DetDevComprasTemp.cant_ord) as TotalProductos From DetDevComprasTemp inner join articulos on DetDevComprasTemp.cod_cve=articulos.cod_cve');
        SqlGeneral.SQL.Add('WHERE DetDevComprasTemp.iddev=:id Order By DetDevComprasTemp.cod_cve');
        SqlGeneral.ParamByName('id').AsString:=id;
        SqlGeneral.Open;

           edtp.text:=inttostr(SqlGeneral.fieldbyname('TotalProductos').AsInteger);
           edsubtotal.Text:='$'+floattostr(SqlGeneral.fieldbyname('SUBTOTAL').AsFloat);
           ediva.Text:='$'+floattostr(SqlGeneral.fieldbyname('IVA').AsFloat);
           if ((edotros.Text <> '') and (edfletes.Text <> '')) then
               edtotal.Text:='$'+floattostr((strtofloat(edfletes.text) + strtofloat(edotros.text)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat))
           else
           if (edotros.Text <> '') then
               edtotal.Text:='$'+floattostr((strtofloat(edotros.text)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat))
           else
           if (edfletes.Text <> '') then
               edtotal.Text:='$'+floattostr((strtofloat(edfletes.text)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat));

           if (edTipoCambio.Text <> '') then begin
           cambio:=quitacaracteres(edtipocambio.Text,'$');
           if ((edotros.Text <> '') and (edfletes.Text <> '')) then
           edtotalmn.Text:='$'+ floattostr(round((((strtofloat(edfletes.text) + strtofloat(edotros.text)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat))*cambio)*100)/100)
           else
           if (edotros.Text <> '') then
           edtotalmn.Text:='$'+ floattostr(round(((( strtofloat(edotros.text)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat))*cambio)*100)/100)
           else
           if (edfletes.Text <> '') then
           edtotalmn.Text:='$'+ floattostr(round((((strtofloat(edfletes.text)) + (SqlGeneral.fieldbyname('TOTAL').AsFloat))*cambio)*100)/100);

           end;
end;





procedure TfrmDevCompras.buscarcompralocate;
begin
querys('Select idcompra from DetCompras INNER JOIN requisiciones ON (requisiciones.idorden=DetCompras.idorden) where DetCompras.idcompra='+quotedstr(edbuscarcompra.Text),1,sqlgeneral);
if sqlgeneral.FieldByName('idcompra').AsString = '' then  begin
//buscar la orden por la cual comprar
       querys('SELECT * FROM compras WHERE estatus IS NULL AND idcompra='+edbuscarcompra.text,0,SqlGeneral);

          if sqlgeneral.fieldbyname('idcompra').asstring <> '' then begin
          idprov:=sqlgeneral.fieldbyname('idprov').AsString;

          querys('SELECT * FROM DetCompras  INNER JOIN requisiciones  ON  (requisiciones.idorden= DetCompras.idorden) WHERE DetCompras.idcompra ='+quotedstr(edbuscarcompra.Text)+'  LIMIT 1 ',0,sqlgeneral2);
            if sqlgeneral2.FieldByName('cod_cve').AsString = '' then begin


                 mostrardatos;
                 querys('Select idprov,IFNULL(rsocial,Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' ''))) as nombre from proveedores where idprov='+quotedstr(idprov),0,SqlGeneral);
                 edprov.Text:=sqlgeneral.fieldbyname('idprov').AsString+' '+sqlgeneral.fieldbyname('nombre').AsString;
                 rgmoneda.SetFocus;
             end else begin
                  application.MessageBox('Esa compra fue hecha con requisiciones y no podra ser devuelta!','Aviso',mb_iconinformation);
             end;
          end else begin

             application.MessageBox('Esa compra no existe ó ya esta cancelada!','Aviso',mb_iconinformation);
             edbuscarcompra.Text:='';
             edbuscarcompra.SetFocus;

          end;


end else
             application.MessageBox('Esa compra se realizo por una requisición, no se puede modificar?!','Aviso',mb_iconinformation);
end;

procedure TfrmDevCompras.limpiar;
begin
       estatus.Caption:='';
      // tblDevCompras.Active:=false;
       Sqlrejillaalta.close;
       edbuscarcompra.Text:='';
       edfletes.Text:='';
       edotros.Text:='';
       edTipoCambio.Text:='';
       dvigencia.Text:='';
       edfactura.Text:='';
       edpedimento.Text:='';
       edaduana.Text:='';
       dentrega.Text:='';
       dpago.Text:='';
       rgmoneda.Text:='';
       edtp.Text:='';
       edsubtotal.Text:='';
       edtotal.Text:='';
       edtotalmn.Text:='';
       edsubtotal.Text:='';
       edanticipo.Text:='';
       edprov.Text:='';
       btnimprimir.Enabled:=false;
       dimportacion.Text:='';
end;


procedure TfrmDevCompras.mostrardatos;
begin
             dvigencia.Text:=sqlgeneral.fieldbyname('FechaVigencia').AsString;
             edfactura.Text:=sqlgeneral.fieldbyname('NumFactura').AsString;
             edpedimento.Text:=sqlgeneral.fieldbyname('NumPedimento').AsString;
             edaduana.Text:=sqlgeneral.fieldbyname('aduana').AsString;
             dentrega.Text:=sqlgeneral.fieldbyname('FechaRecepcion').AsString;
             dpago.Text:=sqlgeneral.fieldbyname('FechaPago').AsString;
             rgmoneda.Text:=sqlgeneral.fieldbyname('moneda').AsString;
             edtp.Text:=sqlgeneral.fieldbyname('TotalProductos').AsString;
             edsubtotal.Text:=sqlgeneral.fieldbyname('subtotal').AsString;
             edtotal.Text:=sqlgeneral.fieldbyname('total').AsString;
             edtotalmn.Text:=sqlgeneral.fieldbyname('totalmn').AsString;
             edTipoCambio.Text:=sqlgeneral.fieldbyname('TipoCambio').AsString;
             edfletes.Text:=sqlgeneral.fieldbyname('fletes').AsString;
             edotros.Text:=sqlgeneral.fieldbyname('otros').AsString;
             edsubtotal.Text:=sqlgeneral.fieldbyname('moneda').AsString;
             edanticipo.Text:=sqlgeneral.fieldbyname('moneda').AsString;
             dimportacion.text:=sqlgeneral.fieldbyname('FechaImp').AsString;

end;

procedure TfrmDevCompras.edbuscarcompraButtonClick(Sender: TObject);
begin
  //BUSCAR POR CATALOGO//
  frmbusquedas.query:='SELECT idcompra,idprov AS IdProveedor,TotalProductos,usuario AS Usuario,fecha AS Fecha,hora AS Hora FROM compras WHERE estatus IS NULL ORDER BY FechaCompra,HoraCompra ASC';
  frmbusquedas.campo_retorno:='idcompra';
  frmbusquedas.campo_busqueda:='idcompra';
  frmbusquedas.tblorigen := 'compras';
  frmbusquedas.tabla:='';
  frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
            ///////si hay un dato en la busqueda
             edbuscarcompra.Text:=frmbusquedas.resultado;
             buscarcompralocate;
             ///se realiza la busqueda para los datos necesarios de la orden con el idorden
            { querys('Select * from compras where idcompra='+quotedstr(edbuscarcompra.Text),0,SqlGeneral);
             eddatosentrega.Text:=sqlgeneral.fieldbyname('DetallesCompra').AsString;
             idprov:=sqlgeneral.fieldbyname('idprov').AsString;
             mostrardatos;
             querys('Select idprov,if (nombre <> '' '',concat(nombre,'' '',apaterno,'' '',amaterno),rsocial) as nombre from proveedores where idprov='+quotedstr(idprov),0,SqlGeneral);
             edprov.Text:=sqlgeneral.fieldbyname('idprov').AsString+' '+sqlgeneral.fieldbyname('nombre').AsString;}
             rgmoneda.SetFocus;
            end;
end;

procedure TfrmDevCompras.edbuscarChange(Sender: TObject);
begin
    if edbuscar.Text = '' then
       limpiar;

end;

procedure TfrmDevCompras.edbuscarcompraKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key=#13) then
         if edbuscarcompra.Text <> '' then
            buscarcompralocate
         else
            edbuscarcompra.OnButtonClick(self);

    if key = #27 then
        begin
          key:=#0;
          edbuscarcompra.Text:='';
        end;
end;

procedure TfrmDevCompras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmDevCompras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then begin
     showmessage('No has guardado los datos, si deseas salir oprime el boton cancelar');
     canclose:=false;
  end;//botones
end;

procedure TfrmDevCompras.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select iddev,idcompra as IdCompra,usuario as Usuario,fecha as Fecha,hora as Hora From DevCompras order by FechaDev,HoraDev asc';
      frmbusquedas.campo_retorno:='iddev';
      frmbusquedas.campo_busqueda:='iddev';
      frmbusquedas.tblorigen := 'DevCompras';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             edbuscar.Text:=frmbusquedas.resultado;
             buscarlocate; // buscar los demas datos del registro desde la tabla
             

            end;
    end
end;

procedure TfrmDevCompras.btnaltaClick(Sender: TObject);
var //subtotal,iva,total:real;
 //N:integer;
 Cad: string; //R: Real;
begin
querys('Select idcompra from compras where estatus is null ',0,SqlGeneral);
   if sqlgeneral.RecordCount > 0 then begin

if btnalta.Caption='&Alta' then
   begin
   //pone la tabla de otras entradas en modo de insercion
   tblDevCompras.cancel;
   tblDevCompras.Active:=true;
   tblDevCompras.insert;
   pnldatos.Enabled:=true;
   limpiar;
    //trae el maximo idorden + 1
   querys('select max(iddev) as id from DevCompras',0,sqlgeneral);
   edbuscar.text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
   querys('delete from DetDevComprasTemp where iddev='+quotedstr(edbuscar.text),1,sqlgeneral);
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   sqlrejillaalta.close;
   dsrejilla.DataSet:=Sqlrejillaaltatemp;
   sqlrejillaaltatemp.Close;
   sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
   edFechaAlta.text:=datetostr(FechaServidor());
   edbuscar.Enabled:=false;
   edbuscarcompra.Enabled:=true;
   edbuscarcompra.SetFocus;
   gbarticulo.Enabled:=true;
   rejilla.Enabled:=true;

   end
else
  begin

  if sqlrejillaaltatemp.RecordCount > 0 then begin
    if application.MessageBox('Estan correctos los datos?,no se podran modificar despues!','Confirmación',mb_yesno+mb_iconwarning) = idyes then
      begin
      gbarticulo.Enabled:=true;
      pnldatos.Enabled:=false;
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta una Devolución sobre Compra';
      btncancelar.Caption:='&Cerrar';
      btncancelar.Hint:='Cerrar esta Ventana';
      btnalta.ImageIndex:=5;
      btnborrar.Enabled:=true;
      btnmodificar.Enabled:=true;
      tblDevComprasFechaDev.AsDateTime:=FechaServidor();
      tblDevComprasHoraDev.AsDateTime:=HoraServidor();
      tblDevCompras.fieldbyname('idcompra').AsString:=edbuscarcompra.Text;
      tblDevCompras.fieldbyname('DetallesDev').AsString:=eddatosentrega.Text;
      tblDevCompras.fieldbyname('TipoCambio').AsString:=floattostr(QuitaCaracteres(edTipoCambio.Text,'$'));
      tblDevCompras.fieldbyname('moneda').AsString:=rgmoneda.Text;
      tblDevCompras.fieldbyname('TotalProductos').AsString:=edtp.Text;
      tblDevCompras.fieldbyname('subtotal').AsString:=floattostr(QuitaCaracteres(edsubtotal.Text,'$'));
      tblDevCompras.fieldbyname('iva').AsString:=floattostr(QuitaCaracteres(ediva.Text,'$'));
      tblDevCompras.fieldbyname('total').AsString:=floattostr(QuitaCaracteres(edtotal.Text,'$'));
      tblDevCompras.fieldbyname('totalmn').AsString:=floattostr(QuitaCaracteres(edtotalmn.Text,'$'));
      tblDevComprasusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
      tblDevCompras.fieldbyname('fecha').AsString:=datetostr(date);
      tblDevCompras.fieldbyname('hora').AsString:=timetostr(time);
      tblDevComprasUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
      tblDevCompras.fieldbyname('FechaUltMod').AsString:=datetostr(date);
      tblDevCompras.fieldbyname('HoraUltMod').AsString:=timetostr(time);
      //sacar el valor maxio de ordenes
      querys('select max(iddev) as iddev from DevCompras',0,sqlgeneral);
      edbuscar.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
      frmprincipal.ucprincipal.Log('Dio de Alta el ajuste:'+edbuscar.text,1);
      tblDevComprasiddev.asstring:=edbuscar.Text;
      tblDevCompras.Post;

      LimpiaDatArt;
      querys('UPDATE DetDevComprasTemp SET iddev = '+quotedstr(edbuscar.Text)+' WHERE idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
      ///actualizar articulos
      querys('INSERT INTO DetDevCompras(idorden,iddev,cod_cve,cant_ord,costo,comentarios) SELECT idorden,iddev,cod_cve,cant_ord,costo,comentarios FROM DetDevComprasTemp WHERE iddev = '+quotedstr(edbuscar.Text)+' AND idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);

      //deshabilitado manejar solo el costo Promedio
      querys('UPDATE articulos,DetDevCompras SET articulos.CostoPromedio=ROUND((((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) - (DetDevCompras.costo *(DetDevCompras.cant_ord/articulos.piezasxunidad)))/((articulos.existencia/articulos.piezasxunidad)-'+
             '(DetDevCompras.cant_ord/articulos.piezasxunidad) )  ),2) WHERE articulos.cod_cve=DetDevCompras.cod_cve AND DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

      //actualizar pagos proveedor
      querys('SELECT idmovi FROM TipoMov where nombre=''DEV/COMPRAS'' ',1,sqlgeneral2);
      querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,cargo,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
             'SELECT compras.idprov,DevCompras.idcompra,'+quotedstr(edfactura.Text)+',"'+datetostr(date)+'",(DevCompras.subtotal + DevCompras.iva),''CREDITO/CAN'','+quotedstr(dpago.Text)+',DevCompras.TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(now))+','+quotedstr(timetostr(time))+' '+
             'FROM DevCompras INNER JOIN compras ON (DevCompras.idcompra=compras.idcompra) WHERE DevCompras.iddev='+quotedstr(edbuscar.text),1,sqlgeneral);


      //insertar a la tabla de cardexArt
      querys('SELECT idmovi FROM TipoMov where nombre=''DEV/COMPRAS'' ',0,sqlgeneral2);
      querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario) SELECT dd.cod_cve,dd.iddev,dd.cant_ord,(dd.costo * piezasxunidad),''S'','+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+',CURDATE(),CURTIME(),'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' FROM  DetDevCompras  as dd LEFT JOIN articulos as a ON (a.cod_cve=dd.cod_cve) WHERE iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

      querys('DELETE FROM DetDevComprasTemp WHERE idmaq='+quotedstr(frmprincipal.idmaq)+' AND iddev='+quotedstr(edbuscar.Text),1,SqlGeneral);
      querys('UPDATE articulos,DetDevCompras SET articulos.existencia=(articulos.existencia - (DetDevCompras.cant_ord*articulos.piezasxunidad))  WHERE articulos.cod_cve=DetDevCompras.cod_cve AND DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
      querys('UPDATE compras SET estatus=''CANCELADA'' WHERE idcompra='+quotedstr(edbuscarcompra.Text),1,sqlgeneral);
      edbuscar.Enabled:=true;
      dsrejilla.DataSet:=Sqlrejillaalta;
      Sqlrejillaalta.Close;
      Sqlrejillaalta.ParamByName('id').AsString:=edbuscar.Text;
      Sqlrejillaalta.Open;

      if application.MessageBox('Deseas imprimirlo','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        with dmreportes do
          begin
          querys('SELECT '+ClienteNombre('p')+' as nombre, dv.FechaDev, dv.iddev as id, p.calle, p.numero, cl.cp, cl.nombre as colonia, '+
                 'p.ciudad, dvc.cod_cve, dvc.cant_ord, dvc.costo, a.nombre as articulo, dv.subtotal, dv.iva, dv.total, letras(round(dv.total,2), "pesos") as letras '+
                 'FROM proveedores as p INNER JOIN compras as c on (c.idprov = p.idprov) '+
                 'INNER JOIN DevCompras as dv on (dv.idcompra=dv.idcompra) INNER JOIN DetDevCompras as dvc on (dvc.iddev=dv.iddev)'+
                 'INNER JOIN colonias as cl on(cl.idcol=p.idcol) INNER JOIN articulos as a on(a.cod_cve=dvc.cod_cve) '+
                 'WHERE dv.iddev='+quotedstr(edbuscar.Text),0,sqlgeneral2);

          {subtotal:=QuitaCaracteres(edsubtotal.Text,'$');
          iva:=QuitaCaracteres(ediva.Text,'$');
          total:=(subtotal+iva);
          //N:= Trunc(total);
          //NLetra1.Numero := N; {Primero se convierte la parte entera del número}
          Cad := sqlgeneral2.fieldbyname('letras').AsString;

          //R := total - N; {Esto es para obtener la parte fraccionaria de la moneda}
          //R := R * 100; {Ahora se obtiene como un entero esta parte fraccionaria}
          //N := Trunc(R); {Y se vuelve a asignar a una variable entera}
          //NLetra1.Numero := N; {Y se traduce ahora la parte fraccionaria convertida en entero}
          //Cad := Cad +NLetra1.Letras+' centavos.';
          Cad:='***('+Cad+')***';

          RVP.Engine:=RvSystem2;
          rvp.SetParam('valor_en_letras',Cad);
          RVP.ProjectFile:=My_Path+'Reportes_sysalarm.rav';
          RVP.ExecuteReport('RepDevCompras');
          RVP.Engine:=RvSystem1;
          end;
        end;
      end;//if application
    end
  else
    begin
    application.MessageBox('Mínimo necesita capturar un articulo para guardar','Atención',mb_ok);
    edcodigo.SetFocus;
    end;
  end;
end else begin
         application.MessageBox('No hay compras hechas','Información',mb_ok+mb_iconinformation);
end;
end;

procedure TfrmDevCompras.btnborrarClick(Sender: TObject);
begin
if tblDevComprasestatus.AsString='CANCELADA'   then
             application.MessageBox('Esta devolución ya fue cancelada!','Confirmación',mb_iconwarning)
else begin

          if application.MessageBox('Deseas Cancelar esta Devolución de Compra del sistema?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
               //////////////////actualizar costo promedio
               querys('UPDATE articulos,DetDevCompras SET articulos.costo=TRUNCATE((((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) + (DetDevCompras.costo *(DetDevCompras.cant_ord/articulos.piezasxunidad)))/((articulos.existencia/articulos.piezasxunidad)+'+
                      '(DetDevCompras.cant_ord/articulos.piezasxunidad) )  ),3)  WHERE articulos.cod_cve=DetDevCompras.cod_cve AND DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

               querys('update articulos,DetDevCompras set articulos.existencia=(articulos.existencia + (DetDevCompras.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetDevCompras.cod_cve and DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

               //insertar en la tabla de cardex concepto de devolucion...
               querys('SELECT idmovi FROM TipoMov where nombre=''CAN/DEV/COMPRAS'' ',0,sqlgeneral2);
               querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario) SELECT cod_cve,iddev,cant_ord,costo,''E'','+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' FROM  DetDevCompras WHERE iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
               //querys('DELETE FROM DetDevCompras where iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
               //  tblDevCompras.Delete;
//               querys('UPDATE DetDevCompras SET estatus=''CANCELADA'' WHERE iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

                 tblDevCompras.Edit;
                 tblDevComprasestatus.AsString:='CANCELADA';
                 tblDevComprasUsuarioUltMod.AsString:=frmprincipal.ucprincipal.CurrentUser.loginname;
                 tblDevCompras.fieldbyname('FechaUltMod').AsString:=datetostr(date);
                 tblDevCompras.fieldbyname('HoraUltMod').AsString:=timetostr(time);
                 tblDevCompras.Post;

                 //actualizar pagos proveedor
                 querys('SELECT idmovi FROM TipoMov where nombre=''CAN/DEV/COMPRAS'' ',0,sqlgeneral2);
                 querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,abono,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
                        'SELECT compras.idprov,DevCompras.idcompra,'+quotedstr(edfactura.Text)+',"'+datetostr(date)+'",(DevCompras.subtotal + DevCompras.iva),''CREDITO'','+quotedstr(dpago.Text)+',DevCompras.TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(now))+','+quotedstr(timetostr(time))+' '+
                        'FROM DevCompras INNER JOIN compras ON (DevCompras.idcompra=compras.idcompra) where iddev='+quotedstr(edbuscar.text),1,sqlgeneral);

                 application.MessageBox('Cancelación realizada?','Confirmación',mb_iconwarning);
                 frmprincipal.ucprincipal.Log('Dio de Baja el ajuste'+edbuscar.text,3);
                 tblDevCompras.Active:=false;
                 //sqlproveedores.close;
                 SqlRejillaAlta.Close;
                 querys('select iddev from DevCompras',0,sqlgeneral);
                 edbuscar.text:='';
                   if sqlgeneral.RecordCount = 0 then
                       begin
                          btnmodificar.Enabled:=false;
                          btnborrar.Enabled:=false;
                          tblDevCompras.Active:=false;
                       end;
          end;

end;
end;

procedure TfrmDevCompras.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key=46) and (rejilla.Enabled) then
  begin
  //elimina el registro del articulo    idcompra='+quotedstr(edbuscar.Text)+' and
  querys('delete from DetDevComprasTemp where idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
  operacion;

  //refresca la rejilla de datos
  sqlrejillaaltatemp.Close;
  sqlrejillaaltatemp.Open;
  if SqlRejillaAltatemp.RecordCount = 0 then
    rejilla.Enabled:=false;
  end;

if ((key=40) or (key=38) or (key=33) or (key=34)) then  //si fue un pg dowm ó flechas
  mostrar_registros;
end;

procedure TfrmDevCompras.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
// si se aplasto al boton de + o el de - hacer la operacion correspondiente
if (rejilla.Enabled) and (key='+') then
    begin
      //incrementa en uno la cantidad de unidades que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
       begin
          querys('select cod_cve,if ( cant_ord >= ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') , 1, 0) as condicion from DetCompras where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
          //querys('select cod_cve,if ( maximo >= (('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+')/piezasxunidad) + existencia, 1, 0) as condicion from articulos where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
           if sqlgeneral.FieldByName('cod_cve').AsString = '' then
              application.MessageBox('Se excede de articulos de la compra','Información',mb_ok+mb_iconinformation)
           else begin
              querys('update DetDevComprasTemp set cant_ord=cant_ord+1 where (iddev='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
              operacion;
           end;
       end else begin

          if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and  (btnalta.Enabled=false) then
              begin
              querys('select cod_cve,if ( cant_ord >= ('+quotedstr(dsrejilla.DataSet.FieldValues['cant_ord'])+' + '+quotedstr(edcantidad.text)+') , 1, 0) as condicion from DetCompras where cod_cve='+quotedstr(edcodigo.Text)+' having condicion =1',1,sqlgeneral);
              if sqlgeneral.FieldByName('cod_cve').AsString = '' then
                 application.MessageBox('Se excede de articulos de la compra','Información',mb_ok+mb_iconinformation)
              else begin
                    querys('update DetDevComprasTemp set cant_ord=cant_ord+1 where (iddev='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                    operacion;
              end;
             end;
       end;
end;

if (rejilla.Enabled) and (key='-') then
    begin
      //decrementa en uno la cantidad de unidades que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled) then
        begin
                querys('update DetDevComprasTemp set cant_ord=cant_ord-1 where (iddev='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                operacion;

        end else begin

          if (dsrejilla.DataSet.FieldValues['cant_ord'] <> '0') and (btnalta.Enabled=false) then
             begin
                querys('update DetDevComprasTemp set cant_ord=cant_ord-1 where (iddev='+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and idorden='+quotedstr(idord)+')',1,sqlgeneral);
                operacion;
             end;
        end;                                                                                                                               //  sleep(1000);
                //borrar los registros que no tengan valores en cantidad y piezas.........
                querys('delete from DetDevComprasTemp where cant_ord=0 and idmaq='+quotedstr(frmprincipal.idmaq)+' and iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
end;

//cerrar y abrir la consulta,
      SqlRejillaAltatemp.Close;
      SqlRejillaAltatemp.Open;
      if SqlRejillaAltatemp.RecordCount = 0 then begin
            rejilla.Enabled:=false;
      end;


end;

procedure TfrmDevCompras.eddatosentregaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDevCompras.edfletesKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edfletes.Text,key);
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDevCompras.edotrosKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edotros.Text,key);
if (key=#13) then
  begin
     operacion;
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDevCompras.edfletesExit(Sender: TObject);
begin
operacion;
end;

procedure TfrmDevCompras.edotrosExit(Sender: TObject);
begin
operacion;
end;

procedure TfrmDevCompras.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin

    if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning)=idyes then begin

         if btnalta.Caption='&Guardar' then
            begin
              querys('delete from DetDevComprasTemp where iddev='+quotedstr(edbuscar.text),1,sqlgeneral);
              btnalta.Caption:='&Alta';
              btnalta.Hint:='Dar de Alta una Devolución sobre compras';
              btnalta.ImageIndex:=5;
              tblDevCompras.Cancel;
              //tblDevCompras.Delete;
            end;


        if btnmodificar.Caption='&Guardar' then
           begin
             //borra temporales y graba los datos anteriores en la tabla original
             querys('delete from DetDevComprasTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
             {querys('update articulos,DetDevCompras set articulos.existencia= if ( (articulos.existencia - (DetDevCompras.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetDevCompras.cant_ord*articulos.piezasxunidad)))'+
                    'where articulos.cod_cve=DetDevCompras.cod_cve and DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
             }
             btnmodificar.Caption:='&Editar';
             btnmodificar.hint:='Editar los datos de la devolución actual';
             btnmodificar.ImageIndex:=2;
             tblDevCompras.Cancel;
        end;


             btncancelar.Hint:='Cerrar esta Pantalla';
             btncancelar.Caption:='&Cerrar';
             LimpiaDatArt;
             pnldatos.Enabled:=false;
             gbarticulo.Enabled:=false;
             rejilla.Enabled:=false;
             btnalta.Enabled:=TRUE;
             dsrejilla.DataSet:=Sqlrejillaalta;
             SqlRejillaAlta.Close;
             dsrejilla.DataSet:=Sqlrejillaalta;
             tblDevCompras.Active:=false;
             limpiar;
             limpiaDatArt;
             edbuscar.Enabled:=true;
             edbuscar.Text:='';
             edbuscar.setfocus;

    end;//pregunta ?


end else
 close;
end;

procedure TfrmDevCompras.btnmodificarClick(Sender: TObject);
begin
if tblDevComprasestatus.AsString='CANCELADA' then
   application.MessageBox('Esta devolución ya fue cancelada!','Confirmación',mb_iconwarning)
else begin

if btnmodificar.Caption = '&Editar' then
   begin
          querys('DELETE FROM DetDevComprasTemp WHERE iddev='+quotedstr(edbuscar.text),1,sqlgeneral);
          frmprincipal.ucprincipal.Log('Dio click en el boton editar de devolución de compras',0);
          btncancelar.Caption:='&Cancelar';
          btncancelar.Hint:='Cancelar la Edición';
          btnmodificar.Caption:='&Guardar';
          btnmodificar.hint:='Guardar los Cambios Realizados';
          btnmodificar.ImageIndex:=1;
          btnalta.Enabled:=false;
          btnborrar.Enabled:=false;
          edbuscar.Enabled:=false;
          pnldatos.Enabled:=true;
          gbarticulo.Enabled:=true;
          tblDevCompras.Edit;
          edbuscar.Enabled:=false;
          rejilla.Enabled:=true;
          sqlrejillaalta.close;
          querys('INSERT INTO DetDevComprasTemp(idorden,iddev,cod_cve,cant_ord,costo,comentarios,idmaq) SELECT idorden,iddev,cod_cve,cant_ord,costo,comentarios,'+quotedstr(frmprincipal.idmaq)+' FROM DetDevCompras WHERE iddev = '+quotedstr(edbuscar.Text),1,SqlGeneral);

{          querys('update articulos,DetDevCompras set articulos.existencia= (articulos.existencia + (DetDevCompras.cant_ord*articulos.piezasxunidad)) where articulos.cod_cve=DetDevCompras.cod_cve and DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
}
          dsrejilla.DataSet:=Sqlrejillaaltatemp;
          sqlrejillaaltatemp.Close;
          sqlRejillaAltatemp.ParamByName('id').AsString:=edbuscar.text;
          sqlRejillaAltatemp.open;
          edbuscar.Enabled:=false;
          LimpiaDatArt;
          rgmoneda.SetFocus;
   end
else
  begin

         btncancelar.Caption:='&Cerrar';
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Devolución Actual';
         btnmodificar.ImageIndex:=2;
         ///////C X PAGAR
         querys('SELECT idmovi FROM TipoMov where nombre=''CAN/DEV/COMPRAS'' ',0,sqlgeneral2);
         querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,abono,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
                'SELECT compras.idprov,DevCompras.idcompra,'+quotedstr(edfactura.Text)+',"'+datetostr(date)+'",(DevCompras.subtotal + DevCompras.iva),''CREDITO/CAN'','+quotedstr(dpago.Text)+',DevCompras.TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(now))+','+quotedstr(timetostr(time))+' '+
                'FROM DevCompras INNER JOIN compras ON (DevCompras.idcompra=compras.idcompra) where DevCompras.iddev='+quotedstr(edbuscar.text),1,sqlgeneral);

         //actualizar costo promedio
         querys('UPDATE articulos,DetDevCompras SET articulos.costo=TRUNCATE((((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) + (DetDevCompras.costo*(DetDevCompras.cant_ord/articulos.piezasxunidad)))/((articulos.existencia/articulos.piezasxunidad) + '+
                '(DetDevCompras.cant_ord/articulos.piezasxunidad) )  ),3) WHERE articulos.cod_cve=DetDevCompras.cod_cve AND DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

         querys('SELECT idmovi FROM TipoMov where nombre=''DEV/COMPRAS'' ',0,sqlgeneral2);
//         querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario) SELECT cod_cve,iddev,cant_ord,costo,''E'','+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' FROM  DetDevCompras WHERE iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
         querys('DELETE FROM CardexArt WHERE idmovi='+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+' and iddoc='+quotedstr(edbuscar.Text),1,sqlgeneral);
         frmprincipal.ucprincipal.Log('Edito la devolución de compras:'+tblDevComprasiddev.AsString,2);
         querys('delete from DetDevCompras where iddev='+quotedstr(edbuscar.text),1,sqlgeneral);
         querys('insert into DetDevCompras(idorden,iddev,cod_cve,cant_ord,costo,comentarios) select idorden,iddev,cod_cve,cant_ord,costo,comentarios from DetDevComprasTemp where iddev = '+quotedstr(edbuscar.Text)+' and idmaq='+quotedstr(frmprincipal.idmaq),1,SqlGeneral);
         ///C X PAGAR
         querys('SELECT idmovi FROM TipoMov where nombre=''DEV/COMPRAS'' ',0,sqlgeneral2);
         querys('INSERT INTO PagosProv (idprov,iddoc,NumFactura,FechaAlta,cargo,TipoPago,FechaVencimiento,TipoCambio,idmovi,usuario,fecha,hora) '+
                'SELECT compras.idprov,DevCompras.idcompra,'+quotedstr(edfactura.Text)+',"'+datetostr(date)+'",(DevCompras.subtotal + DevCompras.iva),''CREDITO/CAN'','+quotedstr(dpago.Text)+',DevCompras.TipoCambio,'+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(now))+','+quotedstr(timetostr(time))+' '+
                'FROM DevCompras INNER JOIN compras ON (DevCompras.idcompra=compras.idcompra) where DevCompras.iddev='+quotedstr(edbuscar.text),1,sqlgeneral);


         tblDevCompras.fieldbyname('fecha').AsString:=datetostr(date);
         tblDevCompras.fieldbyname('DetallesDev').AsString:=eddatosentrega.Text;
         tblDevCompras.fieldbyname('TipoCambio').AsString:=floattostr(QuitaCaracteres(edTipoCambio.Text,'$'));
         tblDevCompras.fieldbyname('moneda').AsString:=rgmoneda.Text;
         tblDevCompras.fieldbyname('TotalProductos').AsString:=edtp.Text;
         tblDevCompras.fieldbyname('subtotal').AsString:=floattostr(QuitaCaracteres(edsubtotal.Text,'$'));
         tblDevCompras.fieldbyname('iva').AsString:=floattostr(QuitaCaracteres(ediva.Text,'$'));
         tblDevCompras.fieldbyname('total').AsString:=floattostr(QuitaCaracteres(edtotal.Text,'$'));
         tblDevCompras.fieldbyname('totalmn').AsString:=floattostr(QuitaCaracteres(edtotalmn.Text,'$'));
         tblDevCompras.fieldbyname('hora').AsString:=timetostr(time);
         tblDevCompras.Post;
         //actualizar costo promedio
         querys('UPDATE articulos,DetDevCompras SET articulos.costo=TRUNCATE((((articulos.costo*(articulos.existencia/articulos.piezasxunidad)) - (DetDevCompras.costo *(DetDevCompras.cant_ord/articulos.piezasxunidad)))/((articulos.existencia/articulos.piezasxunidad)- '+
                '(DetDevCompras.cant_ord/articulos.piezasxunidad) )  ),3) WHERE articulos.cod_cve=DetDevCompras.cod_cve AND DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
         //actualizar existencias
         querys('update articulos,DetDevCompras set articulos.existencia= if ( (articulos.existencia - (DetDevCompras.cant_ord*articulos.piezasxunidad)) <=0,0,(articulos.existencia - (DetDevCompras.cant_ord*articulos.piezasxunidad))) '+
                'where articulos.cod_cve=DetDevCompras.cod_cve and DetDevCompras.iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);

         querys('DELETE FROM DetDevComprasTemp WHERE idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
         querys('SELECT idmovi FROM TipoMov WHERE nombre=''DEV/COMPRAS'' ',0,sqlgeneral2);
         querys('INSERT INTO CardexArt(cod_cve,iddoc,cant,costo,movimiento,idmovi,FechaMov,HoraMov,usuario) SELECT cod_cve,iddev,cant_ord,costo,''S'','+quotedstr(sqlgeneral2.fieldbyname('idmovi').AsString)+',"'+datetostr(date)+'","'+timetostr(time)+'",'+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' FROM  DetDevCompras WHERE iddev='+quotedstr(edbuscar.Text),1,sqlgeneral);
         dsrejilla.DataSet:=Sqlrejillaalta;
         Sqlrejillaalta.Close;
         Sqlrejillaalta.ParamByName('id').AsString:=edbuscar.Text;
         Sqlrejillaalta.Open;
         edbuscar.Enabled:=true;
         btnalta.Enabled:=true;
         btnborrar.Enabled:=true;
         pnldatos.Enabled:=false;
         gbarticulo.Enabled:=false;
         rejilla.Enabled:=false;
         LimpiaDatArt;
         edbuscar.Enabled:=true;
         application.MessageBox('Dev s/compras Modificado con exito!','Información',mb_ok+mb_iconinformation);
 end;

end;
end;

procedure TfrmDevCompras.btnagregarClick(Sender: TObject);
begin
    InsertaArticulo(Sqlrejillaaltatemp,'DetAjusteInvTemp','idajuste',edbuscar.Text);
    LimpiaDatArt;
 //   querys('update DetDevComprasTemp set comentarios='+quotedstr(edcomentarios.Text)+'  where iddev='+quotedstr(edbuscar.Text)+' and cod_cve='+quotedstr(edcodigo.Text),1,SqlGeneral);
end;

procedure TfrmDevCompras.RejillaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
mostrar_registros;
end;

procedure TfrmDevCompras.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin

if (key = #13) then
   begin
     key:=#0;
        if edbuscar.Text <> '' then
           buscarlocate
        else
           edbuscar.OnButtonClick(self);

   end;


     if key = #27 then
     begin
      key:=#0;
     edbuscar.Text:='';
  end;
end;

procedure TfrmDevCompras.edcodigoButtonClick(Sender: TObject);
begin
{  frmbusquedas.query:='SELECT a.cod_cve as cod_cve,a.nombre as Nombre,c.idcompra as IdCompra,c.FechaCompra,a.UltimoCosto as Costo,a.iva as Iva,a.usuario as Usuario,a.fecha as Fecha,a.hora as Hora FROM articulos as a INNER JOIN DetCompras as D ON (D.cod_cve=a.cod_cve)'+
                      ' INNER JOIN compras as c ON (c.idcompra=D.idcompra) WHERE (paquete=0 and servicio=0) and c.idcompra='+quotedstr(edbuscarcompra.Text)+' ORDER BY nombre ASC';
  frmbusquedas.campo_retorno:='cod_cve';
  frmbusquedas.campo_busqueda:='cod_cve';
  frmbusquedas.tblorigen := 'articulos';
  frmbusquedas.tabla:='Articulos';
  frmbusquedas.ShowModal;
        if frmbusquedas.resultado <> '' then
            begin
            edcodigo.Text:=frmbusquedas.resultado;     }
    frmbuscaart.ShowModal;
    if frmbuscaart.cod_cve <> '' then
        begin
           edcodigo.Text:=frmbuscaart.cod_cve; // edcodigo.Text:=frmbusquedas.resultado;


           if ValidaProducto(edcodigo.text) = 1 then
             begin
              edcantidad.Enabled:=true;
              edcantidad.SetFocus;
              btnagregar.Enabled:=true;
              edcodigo.Enabled:=false;
             end
    else
       begin
         edcodigo.Text:='';
         edcodigo.SetFocus;
       end;
end;
end;

procedure TfrmDevCompras.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
   edcantidad.Text:='1';
end;

procedure TfrmDevCompras.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13)  then begin
  {and //if 1
     key:=#0;}
  if (edcodigo.text<>'') then begin
   if ValidaProducto(edcodigo.Text) = 1 then
      begin
          edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          btnagregar.Enabled:=true;
      end;
   end else
     edcodigo.OnButtonClick(self);
  end;
  if key = #27 then
   LimpiaDatArt;


end;

procedure TfrmDevCompras.edcantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
    end;

if key = #27 then //SI PRESIONA LA TECLA ESC.....
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;
end;

procedure TfrmDevCompras.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmDevCompras.edbuscarcompraExit(Sender: TObject);
begin
if edbuscarcompra.text = '' then
edbuscarcompra.setfocus
else begin
 if edbuscarcompra.Text <> '' then begin

   querys('select idcompra from compras where idcompra='+quotedstr(edbuscarcompra.Text),0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then begin
        
        //sacar el valor maxio de ordenes
        querys('select max(iddev) as iddev from DevCompras',0,sqlgeneral);

        edbuscar.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
        querys('insert into DetDevComprasTemp(idorden,iddev,cod_cve,cant_ord,costo,comentarios,idmaq) select idorden,'+quotedstr(edbuscar.Text)+',cod_cve,cant_ord,costo,comentarios,'+quotedstr(frmprincipal.idmaq)+' from DetCompras where cant_ord > 0 and idcompra='+quotedstr(edbuscarcompra.Text),1,SqlGeneral);
        dsrejilla.DataSet:=Sqlrejillaaltatemp;
        Sqlrejillaaltatemp.Close;
        Sqlrejillaaltatemp.ParamByName('id').AsString:=edbuscar.Text;
        Sqlrejillaaltatemp.Open;
{        tblDevCompras.Active:=true;
        tblDevCompras.insert;
        tblDevCompras.FieldByName('iddev').AsString:=edbuscar.Text;
        tblDevCompras.Post;///grabar y poner en modo edición....
        tblDevCompras.Edit;
}        operacion;
        edbuscarcompra.Enabled:=false;
        rgmoneda.SetFocus;

    end else begin
        application.MessageBox('Esa compra no existe!','Aviso',mb_iconwarning);
        edbuscarcompra.SetFocus;
        edprov.text:='';

    end;

 end;

end;//primer if
end;

procedure TfrmDevCompras.edbuscarcompraChange(Sender: TObject);
begin
    if edbuscarcompra.Text = '' then
       limpiar;

end;

procedure TfrmDevCompras.edTipoCambioExit(Sender: TObject);
begin
if edTipoCambio.Text = '' then
edTipoCambio.SetFocus
else
operacion;

end;

procedure TfrmDevCompras.rgmonedaExit(Sender: TObject);
begin
if rgmoneda.Text = 'D' then begin
edTipoCambio.SetFocus;
edtipocambio.Enabled:=true;
end else begin
edtipocambio.Enabled:=false;
eddatosentrega.setfocus;
end;  
end;

procedure TfrmDevCompras.rgmonedaNotInList(Sender: TObject);
begin
rgmoneda.itemindex:=0;
end;

procedure TfrmDevCompras.rgmonedaEnter(Sender: TObject);
begin
edtipocambio.enabled:=true;
end;

procedure TfrmDevCompras.btnimprimirClick(Sender: TObject);
var //subtotal,iva,total:real;
    //N:integer;
    Cad: string;
    //R: Real;
begin
with dmreportes do
  begin
  querys('SELECT '+Clientenombre('p')+' as nombre, dv.FechaDev, dv.iddev as id, p.calle, p.numero, cl.cp, cl.nombre as colonia, p.ciudad, dvc.cod_cve, '+
         'dvc.cant_ord, dvc.costo, a.nombre as articulo, dv.subtotal, dv.iva, dv.total, letras(round(dv.total,2)) as letras '+
         'FROM proveedores as p INNER JOIN compras as c on (c.idprov = p.idprov) '+
         'INNER JOIN DevCompras as dv on (dv.idcompra=dv.idcompra) INNER JOIN DetDevCompras as dvc on (dvc.iddev=dv.iddev)'+
         'INNER JOIN colonias as cl on(cl.idcol=p.idcol) INNER JOIN articulos as a on(a.cod_cve=dvc.cod_cve) '+
         'WHERE dv.iddev='+quotedstr(edbuscar.Text)+' GROUP BY dvc.cod_cve',0,sqlgeneral2);

  {subtotal:=QuitaCaracteres(edsubtotal.Text,'$');
  iva:=QuitaCaracteres(ediva.Text,'$');
  total:=(subtotal+iva);
  //N:= Trunc(total);
  //NLetra1.Numero := N; {Primero se convierte la parte entera del número}
  Cad := sqlgeneral2.fieldbyname('letras').asstring; //Nletra1.Letras+' pesos con ';
  //R := total - N; {Esto es para obtener la parte fraccionaria de la moneda}
  //R := R * 100; {Ahora se obtiene como un entero esta parte fraccionaria}
  //N := Trunc(R); {Y se vuelve a asignar a una variable entera}
  //NLetra1.Numero := N; {Y se traduce ahora la parte fraccionaria convertida en entero}
  //Cad := Cad +NLetra1.Letras+' centavos.';
  Cad:='***('+Cad+')***';

  RVP.Engine:=RvSystem2;
  RVP.ProjectFile:=My_Path+'Reportes_sysalarm.rav';
  RVP.SetParam('valor_en_letras',Cad);
  RVP.ExecuteReport('RepDevCompras');
  RVP.Engine:=RvSystem1;

  end;
  
end;

procedure TfrmDevCompras.edcodigoChange(Sender: TObject);
begin
if edcodigo.text = '' then
    LimpiaDatArt;
end;

procedure TfrmDevCompras.eddatosentregaEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmDevCompras.edcomentariosEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmDevCompras.eddatosentregaExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmDevCompras.edcomentariosExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure TfrmDevCompras.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := eddatosentrega.Font;
  if fuentes.Execute then
     eddatosentrega.SelAttributes.Assign(fuentes.Font);
end;

end.
