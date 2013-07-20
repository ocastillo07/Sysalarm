unit Upresupuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, RzPanel,
  RzBtnEdt, RzDBEdit, RzCmboBx, RzCommon, RzBckgnd, DB, MemDS, DBAccess,
  MyAccess, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, RzGroupBar, cxCurrencyEdit;

type
  Tfrmpresupuestos = class(TForm)
    gboportunidad: TGroupBox;
    RzLabel1: TRzLabel;
    lblmovil: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblentre: TRzLabel;
    lblalta: TRzLabel;
    lblfuente: TRzLabel;
    lblorigen: TRzLabel;
    lblnombre: TRzLabel;
    lblgiro: TRzLabel;
    lblcategoria: TRzLabel;
    RzLabel7: TRzLabel;
    edentre: TRzDBEdit;
    ednombre: TRzDBEdit;
    edestatus: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    c: TRzDBEdit;
    edgiro: TRzDBEdit;
    edcategoria: TRzDBEdit;
    edNumOpor: TRzButtonEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzDBEdit6: TRzDBEdit;
    RzLabel5: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    sqloportunidades: TMyQuery;
    dsoportunidades: TDataSource;
    RzDBEdit3: TRzDBEdit;
    Sqlrejillaalta: TMyQuery;
    SqlGeneral: TMyQuery;
    gbarticulo: TGroupBox;
    edcantidad: TRzNumericEdit;
    RzLabel16: TRzLabel;
    chkpiezas: TCheckBox;
    Label8: TLabel;
    lblproducto: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    btnagregar: TRzBitBtn;
    RzLabel9: TRzLabel;
    CboUtilidad: TRzComboBox;
    edDescripcion: TRzEdit;
    EdPrecio: TRzEdit;
    EdDesc: TRzEdit;
    RzLabel10: TRzLabel;
    edTInsta: TRzEdit;
    edcodigo: TRzButtonEdit;
    RejillaDBTableView1: TcxGridDBTableView;
    RejillaLevel1: TcxGridLevel;
    Rejilla: TcxGrid;
    DsRejilla: TDataSource;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    piezas: TcxGridDBColumn;
    precio: TcxGridDBColumn;
    total: TcxGridDBColumn;
    sqlrejillaedit: TMyQuery;
    gbtotales: TGroupBox;
    edTotMat: TRzNumericEdit;
    RzLabel12: TRzLabel;
    tiempo: TcxGridDBColumn;
    RzLabel17: TRzLabel;
    edTotHrs: TRzNumericEdit;
    RzLabel18: TRzLabel;
    edCostoHrs: TRzNumericEdit;
    edHoras: TRzNumericEdit;
    RzLabel22: TRzLabel;
    edDescuento: TRzNumericEdit;
    ediva: TRzNumericEdit;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    edTotDlls: TRzNumericEdit;
    edTotMn: TRzNumericEdit;
    RzLabel25: TRzLabel;
    Label1: TLabel;
    gbVendedor: TGroupBox;
    edNumCotizacion: TRzButtonEdit;
    RzLabel11: TRzLabel;
    RzLabel2: TRzLabel;
    Edcve_vend: TRzEdit;
    cbonomvend: TRzComboBox;
    RzLabel6: TRzLabel;
    edTCP: TRzEdit;
    RzLabel8: TRzLabel;
    RzLabel28: TRzLabel;
    edCostoHoras: TRzEdit;
    edFechaCreacion: TRzEdit;
    RzLabel29: TRzLabel;
    btnrecalcular: TRzBitBtn;
    RzLabel31: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    paquete: TcxGridDBColumn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnalta: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    sqlclientes: TMyQuery;
    edcvecte: TRzButtonEdit;
    RzLabel39: TRzLabel;
    cxmoneda: TcxGridDBColumn;
    sqltemp: TMyQuery;
    btnimprimir: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNumOporButtonClick(Sender: TObject);
    procedure edNumOporKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadChange(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Edcve_vendKeyPress(Sender: TObject; var Key: Char);
    procedure cbonomvendClick(Sender: TObject);
    procedure edTCPKeyPress(Sender: TObject; var Key: Char);
    procedure edTCPExit(Sender: TObject);
    procedure edTCPContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure edTCPChange(Sender: TObject);
    procedure CboUtilidadClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure CboUtilidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarClick(Sender: TObject);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure SqlrejillaaltaAfterOpen(DataSet: TDataSet);
    procedure edNumCotizacionButtonClick(Sender: TObject);
    procedure sqlrejillaeditAfterOpen(DataSet: TDataSet);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnmodificarClick(Sender: TObject);
    procedure edNumCotizacionKeyPress(Sender: TObject; var Key: Char);
    procedure edNumCotizacionChange(Sender: TObject);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnrecalcularClick(Sender: TObject);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcvecteKeyPress(Sender: TObject; var Key: Char);
    procedure edcvecteButtonClick(Sender: TObject);
    procedure edNumOporChange(Sender: TObject);
    procedure edcvecteChange(Sender: TObject);
    procedure SqlrejillaaltaAfterDelete(DataSet: TDataSet);
    procedure sqlrejillaeditAfterDelete(DataSet: TDataSet);
    procedure EdPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    tecla:char;
    num:integer;
    utilidad:string;
    function ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
    function ValidaProducto(CodCve:string):integer;
    function TraePedido(pedido:string):integer;
    function ValidaExistenciasPaquete(codigo:string;cantidad:integer):integer;
    procedure LimpiaDatArt;
    procedure limpia;
    procedure CalculaTotales(query:tMyQuery);
  //  procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor,cod_cve:string;cantidad:integer);
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor,cod_cve:string;cantidad:integer);
    procedure InsertaArticulosPaquete(tabla,campo,valor,cod_paquete:string;query:tmyquery;cantidad:integer);
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure BorraArticulos(tabla,campo,valor,cod_cve,id:string);
    end;

var
  frmpresupuestos: Tfrmpresupuestos;

implementation

uses Ubusquedas, Udm, Urecursos, Uprincipal, UBuscaArt, Uclientes, Udmrep;

{$R *.dfm}



procedure tfrmpresupuestos.LimpiaDatArt;
begin
     //limpia los campos
     btnagregar.Enabled:=false;
     edcantidad.Text:='1';
     edcantidad.Enabled:=false;
     chkpiezas.Checked:=false;
     chkpiezas.Enabled:=false;
     CboUtilidad.Text:=utilidad;
     Cboutilidad.Enabled:=false;
     edtinsta.Text:='';
     edDesc.Text:='';
     edprecio.Text:='';
     edDescripcion.Text:='';
     edCodigo.Text:='';
     edcodigo.Enabled:=true;
     edcodigo.SetFocus;
end;

procedure tfrmpresupuestos.limpia;
begin
edcvecte.Clear;
edFechaCreacion.Text:='';
ednumcotizacion.Text:='';
edcve_vend.Clear;
cbonomvend.Clear;
ednumopor.Clear;
dsoportunidades.DataSet.Close;
edcodigo.Clear;
eddescripcion.Clear;
edprecio.Clear;
eddesc.Clear;
edtinsta.Clear;
cboutilidad.ItemIndex:=0;
cboutilidad.Text:='A';
chkpiezas.Checked:=false;
edcantidad.Clear;
btnagregar.Enabled:=true;
edTotMat.Text:='0';
edTotHrs.Text:='0';
edCostoHrs.Text:='0';
edHoras.Text:='0';
edDescuento.Text:='0';
edIva.Text:='0';
edTotdlls.Text:='0';
edTotMn.Text:='0';
//edSaldo.Text:='0';
end;

procedure tfrmpresupuestos.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
if (dsrejilla.DataSet.RecordCount > 0) and (dsrejilla.DataSet.FieldByName('paquete').AsString = '') then
  begin
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
      //elimina el registro del articulo
    querys('delete from '+tabla+' where '+campo+'='+valor+' and id='+dsrejilla.DataSet.fieldbyname('id').AsString+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' or paquete='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
    //refresca la rejilla de datos
     query.Close;
     query.ParamByName(campo).AsInteger:=strtoint(valor);
     query.Open;
     dsrejilla.DataSet:=query;
     btnagregar.Enabled:=true;
     edcodigo.Enabled:=false;
     edcantidad.Enabled:=true;
     edcantidad.SetFocus;
  end;
end;


{procedure tfrmpresupuestos.InsertaArticulo(query:tMyQuery;tabla,campo,valor,cod_cve:string;cantidad:integer);
var descu:string;
cant,piezas:double;
begin
  if chkpiezas.Checked then
 //    begin
        piezas:=cantidad
     else
        cant:=cantidad;

     if eddesc.Text = '' then
        descu:='0';
        if rejilla.Enabled = false then
           rejilla.Enabled:=true;

//       verifica que no exista el articulo en la lista
    //   querys('select * from '+tabla+' where '+campo+'='+valor+' and cod_cve='+quotedstr(edcodigo.Text)+' and paquete='+quotedstr(' '),0,SqlGeneral);
   //      if SqlGeneral.RecordCount = 0 then
          //inserta los datos del articulo en DetPresupuesto
          querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+') values ('+floattostr(cant)+','+floattostr(piezas)+','+quotedstr(cod_cve)+','+quotedstr(CboUtilidad.Text)+','+valor+')',1,SqlGeneral);
 //      else
          //solo actualiza las existencias en caso de ya estar en la tabla
   //       querys('update '+tabla+' set cant=cant+'+floattostr(cant)+',piezas=piezas+'+floattostr(piezas)+' where '+campo+'='+valor+' and cod_cve='+quotedstr(edcodigo.Text),1,SqlGeneral);
          querys('delete from '+tabla+' where cant<=0 and piezas<=0',1,sqlgeneral);
     //refresca la rejilla de datos
     query.Close;
     query.ParamByName(campo).AsInteger:=strtoint(valor);
     query.Open;
end;}

procedure tfrmpresupuestos.InsertaArticulo(query:tMyQuery;tabla,campo,valor,cod_cve:string;cantidad:integer);
var descu,costo,tc:string;
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
 querys('select articulos.PrecioCapturable,articulos.servicio,articulos.moneda,usuarios.PrecioCapturable as pc from articulos,usuarios where cod_cve='+quotedstr(cod_cve)+' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
 //esto es por si son pesos se ocupa que el tc sea 1
 if sqlgeneral.fieldbyname('moneda').asstring = 'P' then
  tc := '1'
 else
  tc := edTCP.text;

if ((sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 0) and (sqlgeneral.FieldByName('pc').AsInteger = 0)) and (sqlgeneral.FieldByName('servicio').AsInteger = 0) then
 begin
  //trae el costo del articulo en base al tipo de precio
  querys('select precio'+CboUtilidad.Text+' as costo from articulos where cod_cve='+quotedstr(cod_cve),0,sqlgeneral);
  costo := sqlgeneral.fieldbyname('costo').AsString;
 end
else
  costo := edPrecio.Text;

//inserta los datos del articulo en DetPresupuesto
querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+',costo,tc,usuario,fecha,hora) values ('+floattostr(cant)+','+floattostr(piezas)+','+quotedstr(cod_cve)+','+quotedstr(CboUtilidad.Text)+','+valor+','+costo+','+tc+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+quotedstr(datetostr(date))+','+quotedstr(timetostr(time))+')',1,SqlGeneral);
querys('delete from '+tabla+' where cant<=0 and piezas<=0',1,sqlgeneral);
//refresca la rejilla de datos
query.Close;
query.ParamByName(campo).AsInteger:=strtoint(valor);
query.Open;
end;


procedure tfrmpresupuestos.InsertaArticulosPaquete(tabla,campo,valor,cod_paquete:string;query:tmyquery;cantidad:integer);
//var cantidad:integer;
begin
//cantidad:=strtoint(edcantidad.Text);
querys('delete from '+tabla+' where '+campo+' = '+valor+' and (cod_cve='+quotedstr(cod_paquete)+' or paquete='+quotedstr(cod_paquete)+')',1,sqlgeneral);
if cantidad > 0 then
begin

InsertaArticulo(query,tabla,campo,valor,cod_paquete,cantidad);
querys('select cod_cve,cant,piezas from art_compuestos where cod_paq='+quotedstr(cod_paquete),0,sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof do
    begin
     //inserta los datos del articulo en DetPresupuesto
      querys('insert into '+tabla+'(cant,piezas,cod_cve,utilidad,'+campo+',paquete) values ('+inttostr(sqlgeneral.fieldbyname('cant').Asinteger*cantidad)+','+inttostr(sqlgeneral.fieldbyname('piezas').Asinteger*cantidad)+','+quotedstr(sqlgeneral.fieldbyname('cod_cve').AsString)+','' '','+valor+','+quotedstr(cod_paquete)+')',1,frmprincipal.SqlGeneral);
      sqlgeneral.Next;
      end;

query.Close;
query.ParamByName(campo).AsString:=valor;
query.Open;
dsrejilla.DataSet:=query;
end;
end;


function Tfrmpresupuestos.TraePedido(pedido:string):integer;
begin
             querys('select * from presupuestos where idpresupuesto='+pedido,0,sqlgeneral);
             if SqlGeneral.RecordCount > 0 then
                begin
                 edcve_vend.Text:=sqlgeneral.fieldbyname('idvendedor').AsString;
                 edCostoHrs.Text:=sqlgeneral.fieldbyname('CostoHrs').AsString;
//                 edCentral.Text:=sqlgeneral.fieldbyname('Central').AsString;
  //               edFinanciamiento.Text:=sqlgeneral.fieldbyname('Financiamientos').AsString;
//                 edAnticipo.Text:=sqlgeneral.fieldbyname('Anticipo').AsString;
                 edFechaCreacion.Text:=sqlgeneral.fieldbyname('FechaCreacion').AsString;
//                 DescPP.Text:=sqlgeneral.fieldbyname('DescPP').AsString;
                 edcvecte.Text:=sqlgeneral.fieldbyname('idcliente').AsString;
                 ednumopor.Text:=sqlgeneral.fieldbyname('idoportunidad').AsString;

                 tecla:=#13;
                 edcve_vend.OnKeyPress(self,tecla);
                 tecla:=#13;

             if ednumopor.Text <> '0' then
                begin
                ednumopor.OnKeyPress(self,tecla);
                dsoportunidades.DataSet:=sqloportunidades;
                end
             else
               begin
                edcvecte.OnKeyPress(self,tecla);
               end;
                //refresca la rejilla de datos
                 sqlrejillaedit.Close;
                 sqlrejillaedit.ParamByName('idpresupuesto').AsInteger:=strtoint(ednumcotizacion.Text);
                 sqlrejillaedit.Open;
                 dsrejilla.DataSet:=sqlrejillaedit;
               if dsrejilla.DataSet.RecordCount > 0 then
                    btnrecalcular.Enabled:= true
                 else
                    btnrecalcular.Enabled:=false;
               
                 gbvendedor.Enabled:=false;
                 gboportunidad.Enabled:=false;
                 gbarticulo.Enabled:=false;
                 rejilla.Enabled:=false;
                 btnmodificar.Enabled:=true;
                 btnborrar.Enabled:=true;
                 result:=1;
                end
             else
               begin
                 application.MessageBox('Ese numero de pedido no existe...!','Aviso',mb_iconinformation);
                 limpia;
                 DSrejilla.DataSet.Close;
                 result:=0;
               end;
end;

function tfrmpresupuestos.ValidaExistencias(CodCve:string;cantidad:integer;piezas:boolean):integer;
var band:integer;
unidades,cant,pzs,pzsxunidad,existencia,dif:integer;
begin
//los resultados de esta funcion son los siguientes
//si regresa 0 significa que puede vender bien
//si regresa cantidad negativa es que ya no hay existencias
//si regresa cantidad positiva significa que no puede vender por completo la mercancia
band:=0;
if btnalta.Caption='&Guardar' then
   querys('select SUM(cant) as cant,sum(piezas) as piezas from DetPresupTemp where idmaq='+frmprincipal.idmaq+' and cod_cve='+quotedstr(codcve),0,sqlgeneral)
else
   querys('select sum(cant) as cant,sum(piezas) as piezas from DetPresupuesto where  idpresupuesto='+ednumcotizacion.Text+' and cod_cve='+quotedstr(codcve),0,sqlgeneral);
cant:=sqlgeneral.fieldbyname('cant').AsInteger;
pzs:=sqlgeneral.Fieldbyname('piezas').AsInteger;
unidades:=cantidad;
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve,nombre,precio'+lowercase(cboutilidad.Text)+',desc_esp,tinstalacion,existencia,servicio,paquete,piezasxunidad from articulos where cod_cve='+quotedstr(CodCve)+ ' or cod_barras='+quotedstr(CodCve),0,SqlGeneral);
if (SqlGeneral.FieldByName('servicio').AsInteger = 0) and (SqlGeneral.FieldByName('paquete').AsInteger = 0) then
  begin
   existencia:=SqlGeneral.FieldByName('existencia').AsInteger;
   pzsxunidad:=SqlGeneral.FieldByName('piezasxunidad').AsInteger;
    if piezas then
     begin
      if SqlGeneral.FieldByName('piezasxunidad').AsInteger = 1 then
         begin
          btnagregar.Tag:=1;
          exit;
         end;
      end
     else
        unidades:=unidades*pzsxunidad;

   dif:=(existencia-pzs-(cant*pzsxunidad));
   if dif < 0 then
    begin
     if piezas then
          result:=cantidad
       else
         if ((unidades+dif) mod pzsxunidad)=0 then
            result:=((unidades+dif) div pzsxunidad)
         else
           result:=(cantidad*-1);

    end
   else
     begin
      dif:=dif-unidades;
     if dif>=0 then
      result:=0
     else
       if piezas then
          result:=dif
       else
       if ((unidades+dif) mod pzsxunidad)=0 then
            result:=((unidades+dif) div pzsxunidad)
         else
           result:=(cantidad*-1);
     end;
end;




  { if piezas then
      if SqlGeneral.FieldByName('piezasxunidad').AsInteger = 1 then
         band:=-1
      else
         if SqlGeneral.FieldByName('existencia').AsInteger-(cant*SqlGeneral.FieldByName('piezasxunidad').AsInteger+pzs) <= 0 then
            band:=-2
         else
             if (SqlGeneral.FieldByName('existencia').AsInteger < (cantidad + (cant*SqlGeneral.FieldByName('piezasxunidad').AsInteger) + pzs))  then
                band:=-4
                // band:=SqlGeneral.FieldByName('existencia').Asinteger - ((cant*SqlGeneral.FieldByName('piezasxunidad').AsInteger) + pzs)
             else
                band:=0
   else
     begin
          if ((SqlGeneral.FieldByName('existencia').AsInteger-pzs-(cant*SqlGeneral.FieldByName('piezasxunidad').AsInteger)) div SqlGeneral.FieldByName('piezasxunidad').AsInteger)-(cantidad*SqlGeneral.FieldByName('piezasxunidad').AsInteger) <= 0  then
            band:=-3
         else
              if (((SqlGeneral.FieldByName('existencia').AsInteger-pzs-(cant*SqlGeneral.FieldByName('piezasxunidad').AsInteger)) div SqlGeneral.FieldByName('piezasxunidad').AsInteger) < ((cantidad + cant)*SqlGeneral.FieldByName('piezasxunidad').AsInteger)) then
                 band:=-4
                 // band:=(SqlGeneral.FieldByName('existencia').AsInteger div SqlGeneral.FieldByName('piezasxunidad').AsInteger)
               else
                  band:=0;
     end;
  end
else
  band:=0; }
//result:=band;
end;

{procedure tfrmpresupuestos.CalculaTotales(query:tMyQuery);
var subtotal,descuento,total,iva,hrs,costhrs:double;
begin
if query.RecordCount = 0 then
   begin
    btnrecalcular.Enabled:=false;
    rejilla.Enabled:=false;
    edTotMat.Text:='0';
    edTotHrs.Text:='0';
    edHoras.Text:='0';
    edCentral.Text:='0';
    edFinanciamiento.Text:='0';
    SubTot1.Text:='0';
    SubTot2.text:='0';
    SubTot3.Text:='0';
    edDescuento.Text:='0';
    edIva.Text:='0';
    edTotDlls.Text:='0';
    edTotMn.Text:='0';
    edanticipo.Text:='0';
    edSaldo.Text:='0';
   end
else
  begin
     if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
        begin
         rejilla.Enabled:=true;
         btnrecalcular.Enabled:=true;
        end
     else
       begin
        rejilla.Enabled:=false;
        btnrecalcular.Enabled:=false;
       end;

    query.First;
while not query.Eof do
   begin
   if query.FieldValues['precio'] > 0 then
      begin
       if (query.FieldValues['cant'] > 0) or (query.FieldValues['cant'] < 0) then
          begin
             subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']);
             iva:=iva+((query.FieldValues['precio']*query.FieldValues['iva'])*query.FieldValues['cant']);
          if query.FieldValues['aplica_desc'] then
             descuento:=descuento+((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant']);
          end
       else
         begin
          subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad']));
         iva:=iva+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['iva'])*query.FieldValues['piezas']);
          if query.FieldValues['aplica_desc'] then
              descuento:=descuento+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas']);
          end;
          hrs:=hrs+query.FieldValues['tinstalacion'];
         end;
          query.Next;
       end;

    edTotMat.Text:=Format('%8.3f',[subtotal]);
    edTotHrs.Text:=Format('%8.3f',[hrs]);
    edCostoHrs.Text:=Format('%8.3f',[strtofloat(edCostoHoras.Text)]);
    edHoras.Text:=Format('%8.3f',[strtofloat(edTotHrs.Text)*strtofloat(edCostoHoras.Text)]);
    SubTot1.Text:=format('%8.3f',[strtofloat(edTotMat.Text)+strtofloat(edHoras.Text)+strtofloat(edCentral.Text)]);
    SubTot2.Text:=format('%8.3f',[-strtofloat(DescProm.Text)-((strtofloat(DescPP.Text)/100)*strtofloat(SubTot1.Text))+strtofloat(SubTot1.Text)]);
    SubTot3.Text:=format('%8.3f',[((strtofloat(edTotDlls.Text)-strtofloat(edanticipo.Text))*strtofloat(edFinanciamiento.Text))+strtofloat(SubTot2.Text)]);
    ediva.Text:=format('%8.3f',[strtofloat(SubTot3.Text)*0.10]);
    eddescuento.Text:=Format('%8.3f',[descuento]);
//    ediva.Text:=Format('%8.3f',[iva]);

    edTotDlls.Text:=Format('%8.3f',[strtofloat(SubTot3.Text)+strtofloat(ediva.Text)]);
    edTotmn.Text:=Format('%8.3f',[(strtofloat(edTotDlls.Text)*strtofloat(edTCP.Text))-((strtofloat(eddescuento.text)/100)*(strtofloat(edTotDlls.Text)*strtofloat(edTCP.Text)))]);
    edSaldo.Text:=Format('%8.3f',[strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text)]);
  end;
end;}
procedure tfrmpresupuestos.CalculaTotales(query:tMyQuery);
var subtotal,descuento,iva,hrs:double;
begin
if query.RecordCount = 0 then
   begin
    btnrecalcular.Enabled:=false;
    rejilla.Enabled:=false;
    edTotMat.Text:='0';
    edTotHrs.Text:='0';
    edHoras.Text:='0';
//    edCentral.Text:='0';
 //   edFinanciamiento.Text:='0';
  //  SubTot1.Text:='0';
  //  SubTot2.text:='0';
  //  SubTot3.Text:='0';
    edDescuento.Text:='0';
    edIva.Text:='0';
    edTotDlls.Text:='0';
    edTotMn.Text:='0';
//    edanticipo.Text:='0';
//    edSaldo.Text:='0';
   end
else
  begin
     if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
        begin
         rejilla.Enabled:=true;
         btnrecalcular.Enabled:=true;
        end
     else
       begin
        rejilla.Enabled:=false;
        btnrecalcular.Enabled:=false;
       end;

    query.First;
while not query.Eof do
   begin
  // if query.FieldValues['precio'] > 0 then
   //   begin
       if (query.FieldValues['cant'] > 0) or (query.FieldValues['cant'] < 0) then
          begin
           if query.FieldValues['moneda'] = 'PESOS' then
             begin
              subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']);
              iva:=iva+((query.FieldValues['precio']*query.FieldValues['iva'])*query.FieldValues['cant']);
              if query.FieldValues['aplica_desc'] then
               descuento:=descuento+((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant']);
             end
           else
            begin
              subtotal:=subtotal+(query.FieldValues['cant']*query.FieldValues['precio']*strtofloat(edtcp.Text));
              iva:=iva+(((query.FieldValues['precio']*query.FieldValues['iva'])*query.FieldValues['cant'])*strtofloat(edtcp.Text));
              if query.FieldValues['aplica_desc'] then
               descuento:=descuento+(((query.FieldValues['precio']*query.FieldValues['descuento'])*query.FieldValues['cant'])*strtofloat(edtcp.Text));
            end;
          end
       else
         begin
          if query.FieldValues['moneda'] = 'PESOS' then
           begin
            subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad']));
            iva:=iva+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['iva'])*query.FieldValues['piezas']);
            if query.FieldValues['aplica_desc'] then
              descuento:=descuento+(((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas']);
           end
          else
           begin
            subtotal:=subtotal+(query.FieldValues['piezas']*(query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*strtofloat(edtcp.Text));
            iva:=iva+((((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['iva'])*query.FieldValues['piezas'])*strtofloat(edtcp.Text));
            if query.FieldValues['aplica_desc'] then
             descuento:=descuento+((((query.FieldValues['precio']/query.FieldValues['piezasxunidad'])*query.FieldValues['descuento'])*query.FieldValues['piezas'])*strtofloat(edtcp.Text));
          end;
         end;
           hrs:=hrs+query.FieldValues['tinstalacion'];
           query.Next;
       end;

    edTotMat.Text:=Format('%8.2f',[subtotal]);
    edTotHrs.Text:=Format('%8.2f',[hrs]);
    ediva.Text := format('%8.2f',[strtofloat(edTotMat.Text)*0.10]);
    eddescuento.Text:=Format('%8.2f',[descuento]);
   // showmessage(pchar(floattostr(strtofloat(edHoras.Text)+strtofloat(edTotMat.Text)-strtofloat(eddescuento.text)+strtofloat(ediva.Text))));
    edTotDlls.Text := Format('%8.2f',[((strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text))/strtofloat(edtcp.Text)]);
    edTotmn.Text:=Format('%8.2f',[((strtofloat(edTotMat.Text)+strtofloat(ediva.Text))-strtofloat(eddescuento.text))]);
//    strtofloat(edTotDlls.Text)*strtofloat(edtcp.text)]);
 //   edTotDlls.Text:=Format('%8.3f',[strtofloat(SubTot3.Text)+strtofloat(ediva.Text)]);
 //   edTotmn.Text:=Format('%8.3f',[(strtofloat(edTotDlls.Text)*strtofloat(edTCP.Text))-((strtofloat(eddescuento.text)/100)*(strtofloat(edTotDlls.Text)*strtofloat(edTCP.Text)))]);
 //  edSaldo.Text:=Format('%8.2f',[strtofloat(edTotMn.Text)-strtofloat(edAnticipo.Text)]);
  end;
end;

//quite esta y puse la que esta en monitoreo esta abajo de esta
{function c.ValidaProducto(CodCve:string):integer;
begin
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve,nombre,precio'+lowercase(CboUtilidad.Text)+' as precio,desc_esp,tinstalacion,piezasxunidad,existencia,aplica_desc,nom_envase,nom_piezas,servicio,paquete from articulos where cod_cve='+quotedstr(CodCve)+ ' or cod_barras='+quotedstr(CodCve),0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
   begin
      application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
      edcodigo.SelectAll;
      SqlGeneral.Close;
      edcantidad.Text:='1';
      edcodigo.Text:='';
      chkpiezas.Checked:=false;
    //  edcodigo.setfocus;
      result:=0;
   end
    else
      begin
                                                                //and (SqlGeneral.FieldByName('servicio').AsInteger=0)
       if (SqlGeneral.FieldByName('existencia').AsInteger <= 0) and (SqlGeneral.FieldByName('paquete').AsInteger=0) then
       // begin
         application.MessageBox('Se han agotado todas las existencias de este producto...!','Aviso',mb_iconinformation);
        // result:=0;
        //end
      //else
        //       begin
                 //pregunta si se va a poder ValidaProducto en piezas
                 edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
                 edPrecio.Text:=SqlGeneral.fieldbyname('precio').AsString;
                if SqlGeneral.FieldByName('aplica_desc').Asstring = 'True' then
                   edDesc.Text:=SqlGeneral.fieldbyname('desc_esp').Asstring;
                   edTInsta.Text:=SqlGeneral.fieldbyname('tinstalacion').AsString;
                   result:=1;
          //      end;
           end;
end; }

function Tfrmpresupuestos.ValidaProducto(CodCve:string):integer;
begin
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve,nombre,precio'+lowercase(CboUtilidad.Text)+' as precio,desc_esp,tinstalacion,piezasxunidad,existencia,aplica_desc, '+
       ' nom_envase,nom_piezas,servicio,paquete from articulos where cod_cve='+quotedstr(CodCve)+ ' or cod_barras='+quotedstr(CodCve),0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
 begin
  application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
  edcodigo.SelectAll;
  SqlGeneral.Close;
  edcantidad.Text:='1';
  edcodigo.Text:='';
  chkpiezas.Checked:=false;
  result:=0;
 end
else
 begin
  querys('select iplocked,userlocked from LockedArt where cod_cve='+quotedstr(codCve),0,dmaccesos.sqlgeneral);
  if (dmaccesos.sqlgeneral.RecordCount = 0) or ((dmaccesos.sqlgeneral.RecordCount > 0) and (dmaccesos.sqlgeneral.FieldByName('iplocked').Asstring = frmprincipal.TcpClient.LocalHostAddr)) then
   begin
    if edcodigo.Text = 'MONITOREO' then
     begin
       querys('select CostoMensual from categorias where nombre = ' + quotedstr(edcategoria.Text),0,sqltemp);
       edPrecio.Text := sqltemp.fieldbyname('CostoMensual').AsString;
     end
    else
     edPrecio.Text:=SqlGeneral.fieldbyname('precio').AsString;
      // if (edcodigo.Text = 'CARGOS') or  (edcodigo.Text = 'DESCUENTOPP') then
      querys('select PrecioCapturable,servicio from articulos where cod_cve='+quotedstr(CodCve),0,sqltemp);
     if (sqltemp.FieldByName('PrecioCapturable').AsInteger = 1) or (sqltemp.FieldByName('servicio').AsInteger = 1) then
      edprecio.Enabled := true;
     //pregunta si se va a poder ValidaProducto en piezas
      edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
      if SqlGeneral.FieldByName('aplica_desc').Asstring = 'True' then
       edDesc.Text:=SqlGeneral.fieldbyname('desc_esp').Asstring;
       edTInsta.Text:=SqlGeneral.fieldbyname('tinstalacion').AsString;
       result:=1;
     end
  else
   begin
    application.MessageBox(pchar('Este articulo ha sido bloqueado por el usuario: '+dmaccesos.sqlgeneral.FieldByName('userlocked').Asstring+' y no podra agregarlo hasta que se desbloquee!'),'Aviso',mb_iconinformation);
    result:=0;
   end;
 end;
end;

function tfrmpresupuestos.ValidaExistenciasPaquete(codigo:string;cantidad:integer):integer;
var valor:integer;
begin
btnagregar.Tag:=0;
querys('select * from art_compuestos where cod_paq='+quotedstr(codigo),0,frmprincipal.Sqlgeneral);
frmprincipal.Sqlgeneral.First;
while not frmprincipal.Sqlgeneral.Eof do
     begin
        if frmprincipal.Sqlgeneral.FieldByName('cant').AsInteger > 0 then
           valor:=ValidaExistencias(frmprincipal.Sqlgeneral.FieldByName('cod_cve').Asstring,frmprincipal.Sqlgeneral.FieldByName('cant').AsInteger*cantidad,false)
        else
           valor:=ValidaExistencias(frmprincipal.Sqlgeneral.FieldByName('cod_cve').Asstring,frmprincipal.Sqlgeneral.FieldByName('piezas').AsInteger*cantidad,true);

     if (valor < 0) or (valor>0) then
       application.MessageBox(pchar('Le Informo que lo que esta presupuestando no lo tiene en existencias!'+inttostr(valor)),'Aviso',mb_iconinformation);

    if btnagregar.Tag=1 then
       begin application.MessageBox('Este articulo no se puede vender en piezas!','Aviso',mb_iconinformation); chkpiezas.Checked := false; end;

   { if (valor < 0) or (valor>0) then
    begin result:=valor; break; end
     else                          }
          frmprincipal.Sqlgeneral.Next;
     end;


if frmprincipal.Sqlgeneral.Eof then
   result:=0;
end;

procedure Tfrmpresupuestos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmpresupuestos.edNumOporButtonClick(Sender: TObject);
begin
      if edNumOpor.Text = '' then
         begin
          frmbusquedas.query:='SELECT agenda_vendedores.idoportunidad,if (oportunidades.nombre='''' and oportunidades.apaterno = '''' and oportunidades.amaterno='''',oportunidades.rsocial,concat(oportunidades.nombre,'' '',oportunidades.apaterno,'' '', ' +
                                  ' oportunidades.amaterno)) as Oportunidad,concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as Vendedor FROM agenda_vendedores INNER JOIN actividades_vendedores ON (agenda_vendedores.idevento = ' +
                                  ' actividades_vendedores.idevento) INNER JOIN tipos_actividades ON (actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad)  INNER JOIN oportunidades ON (agenda_vendedores.idoportunidad = ' +
                                  ' oportunidades.idoportunidad) INNER JOIN usuarios ON (agenda_vendedores.idvendedor = usuarios.idusuario) WHERE tipos_actividades.nombre = '+quotedstr('PRESUPUESTO');
            frmbusquedas.campo_busqueda:='Oportunidad';
            frmbusquedas.campo_retorno:='idoportunidad';
            frmbusquedas.tblorigen := 'oportunidades';
           frmbusquedas.tabla:='';
           frmbusquedas.ShowModal;
          if frmbusquedas.resultado <> '' then
              begin
            //  querys('select idoportunidad from presupuestos where idoportunidad = '+ frmbusquedas.sqlbuscar.fieldbyname('idoportunidad').AsString,0,SqlGeneral);
            //  if SqlGeneral.RecordCount > 0 then
             //     application.MessageBox('Ha esta oportunidad ya se le ha hecho un presupuesto y no podra hacerle otro presupuesto','Aviso',mb_iconinformation)
             // else
              //  begin
                  tecla:=#13;
                  edNumOpor.Text:=frmbusquedas.resultado;
                 edNumOpor.OnKeyPress(self,tecla);
               // end;
               end;
          end
         else
           edNumOpor.OnKeyPress(self,tecla);

end;

procedure Tfrmpresupuestos.edNumOporKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edNumOpor.Text<>'') then
   begin
     key:=#0;
     //trae los datos de la oportunidad dependiendo del idoportunidad
     sqloportunidades.Close;
     sqloportunidades.ParamByName('idoportunidad').AsInteger:=strtoint(edNumOpor.text);
     sqloportunidades.Open;
     dsoportunidades.DataSet:=sqloportunidades;
      if sqloportunidades.RecordCount = 0 then
         begin
            application.MessageBox('Ese numero de oportunidad no existe o no se le ha dado un estatus de Aceptada o Presupuesto','Aviso',mb_iconinformation);
            edNumOpor.Text:='';
       //    if edNumOpor.enabled then
        //    edNumOpor.SetFocus;
         end
      else
         begin
            if btnalta.caption = '&Guardar' then begin
            { querys('select idoportunidad from presupuestos where idoportunidad = '+EdNumOpor.Text,0,SqlGeneral);
              if SqlGeneral.RecordCount > 0 then
                 begin
                  application.MessageBox('Ha esta oportunidad ya se le ha hecho un presupuesto y no podra hacerle otro presupuesto','Aviso',mb_iconinformation);
                  sqloportunidades.Close;
                 end
              else
                begin }
                  edCve_Vend.Text:=sqloportunidades.fieldbyname('idvendedor').AsString;
                  tecla:=#13;
                  edCve_Vend.OnKeyPress(self,tecla);
                  if btncancelar.Caption<>'&Cerrar' then
                     begin
                      edCve_Vend.Enabled:=true;
                      CboNomVend.Enabled:=true;
                     gbarticulo.Enabled:=true;
                     btnagregar.enabled:=false;
                     CboUtilidad.Enabled:=true;
                     edcantidad.Enabled:=true;
                     chkpiezas.Enabled:=true;
                     edcodigo.SetFocus;
                  end;
//                end;
              end
             else
               begin
                  edCve_Vend.Text:=sqloportunidades.fieldbyname('idvendedor').AsString;
                  tecla:=#13;
                  edCve_Vend.OnKeyPress(self,tecla);
                  edCve_Vend.Enabled:=true;
                  CboNomVend.Enabled:=true;
                 // edestat.Text:=sqloportunidades.fieldbyname('Estatus').AsString;
                  gbarticulo.Enabled:=true;
                  CboUtilidad.Enabled:=true;
                  edcantidad.Enabled:=true;
                  chkpiezas.Enabled:=true;
                  edcodigo.SetFocus;
                end;
         end;
   end;

if (key=#13) and (edNumOpor.Text='') then
    edNumOpor.Buttons.Button.Click;

if ((key < #48) or (key > #57))and (key<>#8) then
    key:=#0;

end;

procedure Tfrmpresupuestos.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=#0;
end;

procedure Tfrmpresupuestos.edcantidadChange(Sender: TObject);
begin
if edcantidad.Text = ''  then
  btnagregar.Enabled:=false
else
  btnagregar.Enabled:=true;
end;

procedure Tfrmpresupuestos.edcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
{if (key=#13)and(edcodigo.text<>'') then begin //if 1
     key:=#0;
     if ValidaProducto(edcodigo.Text) = 1 then
        begin
          edcantidad.Enabled:=true;
          edcantidad.SetFocus;
          btnagregar.Enabled:=true;
        end;
     end;

if (key = #13) and (edcodigo.Text = '') then
   begin
     key:=#0;
    edcodigo.OnButtonClick(self);
   end;}
   if (key=#27) then
 begin
  key:=#0;
  LimpiaDatArt;
 end;

if (key=#13)and(edcodigo.text<>'') then
 begin //if 1
     key:=#0;
     if ValidaProducto(edcodigo.Text) = 1 then
        begin
          edcantidad.Enabled:=true;
          //trae el campo PrecioCapturable
          querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
          if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
           begin
            edprecio.Enabled := true;
            edPrecio.SetFocus;
           end
          else
           begin
             querys('select PrecioCapturable from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
             if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
              begin
               edprecio.Enabled := true;
               edPrecio.SetFocus;
              end
             else
              edcantidad.SetFocus;
            btnagregar.Enabled:=true;
        end;
     end;
  end;

if (key = #13) and (edcodigo.Text = '') then
   begin
     key:=#0;
    edcodigo.OnButtonClick(self);
   end;
end;


procedure Tfrmpresupuestos.FormActivate(Sender: TObject);
begin
querys('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' AND usuarios.estatus = 1)',0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
   begin
     application.MessageBox('No hay vendedores registrados en el sistema y no podra crear una cotizacion...!','Aviso',mb_iconwarning);
     close;
   end;
{else
  begin
    CboNomVend.Items.Clear;
    SqlGeneral.First;
    while not SqlGeneral.Eof do
       begin
          cboNomVend.Items.Add(SqlGeneral.Fieldbyname('nombre').AsString);
          SqlGeneral.Next;
       end;
  end; }
  
querys('select count(idpresupuesto) as p from presupuestos',0,sqlgeneral);
if sqlgeneral.FieldByName('p').Asinteger = 0 then
   begin
    gbvendedor.Enabled:=false;
    edNumCotizacion.enabled:=false;
   end
else
  begin
   gbvendedor.Enabled:=true;
   edNumCotizacion.enabled:=true;
  end;
//trae el tipo de combio y el precio por hora
querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
edTCP.Text:=sqlgeneral.Fields.Fields[0].asstring;
//querys('select valor from configuraciones where concepto='+quotedstr('CostoHora'),0,SqlGeneral);
//edCostoHoras.Text:=sqlgeneral.Fields.Fields[0].asstring;
end;

procedure Tfrmpresupuestos.Edcve_vendKeyPress(Sender: TObject;
  var Key: Char);
begin
if (edcve_vend.Text<>'')and(key=#13) then
   begin
   //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend
    querys('SELECT concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) AS Nombre FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' or usuarios.PuedeVender=1) AND usuarios.estatus = 1 and  usuarios.idusuario='+EdCve_Vend.Text,0,SqlGeneral);
    key:=#0;
   if SqlGeneral.RecordCount > 0 then
    CboNomVend.Text:=SqlGeneral.fieldbyname('nombre').AsString
   else
    begin
     application.MessageBox('Esa Clave de Vendedor no Existe o no esta activo, verifiquelo y vuelva a intentarlo!','Error',mb_ok+mb_iconwarning);
     edcve_vend.Text:='';
     btncancelar.Click;
    end;
   end;
end;

procedure Tfrmpresupuestos.cbonomvendClick(Sender: TObject);
begin
     querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE (puestos.nombre = '+quotedstr('VENDEDOR')+' or usuarios.PuedeVender=1) AND usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) ='+quotedstr(cbonomvend.Text),0,SqlGeneral);
     edcve_vend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
  //   gboportunidad.Enabled:=true;
   //  edNumOpor.Enabled:=true;
    // edNumOpor.SetFocus;
end;

procedure Tfrmpresupuestos.edTCPKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (edTCP.Text<>'')and(key=#13)and(EdCve_Vend.Text<>'')and(CboNomVend.Text<>'') then
 begin
    gboportunidad.Enabled:=true;
    edNumOpor.SetFocus;
 end;
key:=ValidaPunto(edTCP.Text,key);
end;

procedure Tfrmpresupuestos.edTCPExit(Sender: TObject);
begin
if edTCP.Text <> '' then
   begin
   edTCP.Text:=trim(Format('%8.2f',[strtofloat(edTCP.Text)]));
   if btnalta.Enabled then
      CalculaTotales(sqlrejillaalta)
   else
      CalculaTotales(sqlrejillaedit);
   end
else
   edTCP.Text:='1';
end;

procedure Tfrmpresupuestos.edTCPContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
HANDLED:=TRUE;
end;

procedure Tfrmpresupuestos.edTCPChange(Sender: TObject);
var valor:double;
begin
try
valor:=strtofloat(edTCP.text);
except
edTCP.Text:='1';
end;
end;

procedure Tfrmpresupuestos.CboUtilidadClick(Sender: TObject);
begin
if edcodigo.Text <> '' then
ValidaProducto(edcodigo.Text);
end;

procedure Tfrmpresupuestos.btnaltaClick(Sender: TObject);
Var cvevend,tipo,valor:string;
begin
if btnalta.Caption='&Alta' then
   begin
    limpia;
    //trae los vendedores
   { querys('select usuarios.nombre,usuarios.apaterno,usuarios.amaterno from usuarios inner join areas on areas.idarea = usuarios.idarea inner join puestos on puestos.idpuesto=usuarios.idpuesto  where areas.nombre=''VENTAS'''+
          ' and puestos.nombre=''VENDEDOR'' and usuarios.estatus=1',0,sqlgeneral);
    while not sqlgeneral.Eof do
     begin
      cbonomvend.Items.Add(sqlgeneral.Fields.Fields[0].asstring+' '+sqlgeneral.Fields.Fields[1].asstring+' '+sqlgeneral.Fields.Fields[2].asstring);
      sqlgeneral.Next;
     end;}
     CargaCombo('select concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as nombre from usuarios inner join areas on areas.idarea = usuarios.idarea inner join puestos on puestos.idpuesto= '+
                ' usuarios.idpuesto where ((areas.nombre=''VENTAS'' and puestos.nombre=''VENDEDOR'') or (usuarios.PuedeVender=1)) and usuarios.estatus=1 order by nombre','Vendedores',cbonomvend);
    gbtotales.Enabled:=true;
    DSrejilla.DataSet:=SqlRejillaAlta;
    edFechaCreacion.text:=datetostr(date);
    tecla:=#13;
    //borra los datos de la tabla DetPresupTemp
      querys('delete from DetPresupTemp where idmaq='+frmprincipal.idmaq,1,SqlGeneral);
    //trae el tipo de cambio de la tabla configuraciones
    querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
    edTCP.Text:=SqlGeneral.Fields.Fields[0].AsString;
  //  edTCP.Enabled:=true;
    //trae la utilidad que esta por default en la tabla de configuraciones
    querys('select valor from configuraciones where concepto='+quotedstr('UtilDefault'),0,SqlGeneral);
    CboUtilidad.Text:=SqlGeneral.Fields.Fields[0].AsString;
    utilidad:=SqlGeneral.Fields.Fields[0].AsString;
    //trae el ultimo numero de cotizacion
    querys('select max(idpresupuesto) from presupuestos',0,SqlGeneral);
    edNumCotizacion.Text:=inttostr(SqlGeneral.Fields.Fields[0].AsInteger + 1);
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    gbvendedor.Enabled:=true;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    btnrecalcular.Enabled:=false;
    ednumcotizacion.Enabled:=false;
    sqloportunidades.Close;
    gbOportunidad.Enabled:=true;
    edNumOpor.SetFocus;
    end
   else
   begin
  if dsoportunidades.DataSet.RecordCount > 0 then
     begin
     if (edcve_vend.Text='') or (cbonomvend.Text='') then
       begin
         application.MessageBox('Debe de especificar el vendedor','Aviso',mb_iconinformation);
         cbonomvend.DroppedDown:=true;
         exit;
       end;
     frmprincipal.ucprincipal.Log('Dio de Alta la Cotizacion '+edNumCotizacion.text,1);
     //trae el ultimo numero de cotizacion
     querys('select max(idpresupuesto) from presupuestos',0,SqlGeneral);
     edNumcotizacion.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //actualiza idpresupuesto de la tabla DetPresupTemp de la maquina actual
     querys('update DetPresupTemp set idpresupuesto='+ednumcotizacion.Text+' where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
      //saca los datos de DetPresupTemp para insertarlo en DetPresupuesto
     querys('insert into DetPresupuesto(cant,piezas,cod_cve,utilidad,idmaq,idpresupuesto,paquete,costo,tc) select cant,piezas,cod_cve,utilidad,idmaq,idpresupuesto,paquete,costo,tc from DetPresupTemp where idmaq = '+frmprincipal.idmaq,1,SqlGeneral);
      //Borra de la tabla Detpresupuesto
      querys('delete from DetPresupTemp where idmaq = '+frmprincipal.idmaq,1,SqlGeneral);
     //guarda los datos
     shortdateformat:='yyyy/mm/dd';
     if ednumopor.Text<>'' then
       begin
        tipo:='idoportunidad';
        valor:=sqloportunidades.fieldbyname('idoportunidad').AsString;
        end
     else
       begin
       tipo:='idcliente';
       valor:=sqlclientes.fieldbyname('idcliente').AsString;
     end;
     if edcve_vend.Text='' then
      cvevend:='0'
     else
      cvevend:=edcve_vend.Text;
     //guarda los datos en la tabla de presupuestos
     querys('insert into presupuestos(idpresupuesto,'+tipo+',idvendedor,FechaCreacion,TipoCambio,TotMat,MontoHrs,Descuento,Iva,TotDlls,TotMn) values ' +
           '('+edNumcotizacion.Text+','+valor+','+cvevend+','+quotedstr(datetostr(date))+','+edTCP.Text+','+edTotMat.Text+','+edHoras.Text+','+eddescuento.Text+','+edIva.Text+','+edTotDlls.Text+','+edTotMn.Text+')',1,SqlGeneral);
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update presupuestos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idpresupuesto='+edNumcotizacion.Text,1,sqlgeneral);
     if tipo='idoportunidad' then
       begin
        //me trae el idactividad para poder modificar de realizado false a true
        querys('SELECT actividades_vendedores.idactividades FROM agenda_vendedores INNER JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) INNER JOIN tipos_actividades ON ' +
               '(actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idoportunidad = '+edNumOpor.Text+') AND tipos_actividades.nombre = '+quotedstr('PRESUPUESTO'),0,sqlgeneral);
        //actualiza la tabla de actividades_vendedores el campo realizado
        querys('update actividades_vendedores set realizada = 1 where idactividades = '+sqlgeneral.Fields.Fields[0].AsString,1,SqlGeneral);
     end;
     end;
      Limpia;
      self.OnActivate(self);
      dsrejilla.DataSet.Close;
      dsoportunidades.DataSet.Close;
      edNumCotizacion.Enabled:=true;
      edNumCotizacion.Text:='';
      edcve_vend.Enabled:=false;
      CboNomVend.Enabled:=false;
      edTCP.Enabled:=false;
      gboportunidad.Enabled:=false;
      gbarticulo.Enabled:=false;
      CboUtilidad.Enabled:=false;
      btnmodificar.Enabled:=false;
      btnborrar.Enabled:=false;
      btnrecalcular.Enabled:=false;
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta un presupuesto';
      btncancelar.Caption:='&Cerrar';
      btncancelar.Hint:='Cerrar esta Ventana';
      btnalta.ImageIndex:=5;
      btnborrar.Enabled:=true;
      btnmodificar.Enabled:=true;
      application.messagebox('Presupuesto Registrado con exito!','Confirmacion',mb_IconInformation);
    end;
end;

procedure Tfrmpresupuestos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     btnrecalcular.Enabled := false;
     if btnmodificar.Enabled then
        begin
         gbtotales.Enabled:=false;
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Presupuesto Actual';
         btnmodificar.ImageIndex:=2;
         self.OnActivate(self);
         dsrejilla.DataSet.Close;
          rejilla.Enabled:=false;
          limpia;
          gbvendedor.Enabled:=true;
          edcve_vend.Enabled:=false;
          cbonomvend.Enabled:=false;
          edTCP.Enabled:=false;
          edNumCotizacion.Enabled:=true;
          gboportunidad.Enabled:=false;
          gbarticulo.Enabled:=false;
        end;
     if btnalta.Enabled then
        begin
          gbtotales.Enabled:=false;
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Area';
          btnalta.ImageIndex:=5;
          //borra la tabla temporal DetPresupTemp
          querys('delete from DetPresupTemp where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
          limpia;
          self.OnActivate(self);
          dsrejilla.DataSet.Close;
          gboportunidad.Enabled:=false;
          edcve_vend.Enabled:=false;
          cbonomvend.Enabled:=false;
          edTCP.Enabled:=false;
          self.OnActivate(self);
        end;

querys('select count(idpresupuesto) as p from presupuestos',0,sqlgeneral);
if sqlgeneral.FieldByName('p').AsInteger = 0 then
   gbvendedor.Enabled:=false
else
  gbvendedor.Enabled:=true;
  btnalta.Enabled:=true;
  btnagregar.Enabled:=false;
  gbarticulo.Enabled:=false;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  dsoportunidades.DataSet.Close;
  edcvecte.Text:='';
  end
else
close;
btnimprimir.Enabled := false;
end;

procedure Tfrmpresupuestos.edcodigoButtonClick(Sender: TObject);
begin
frmbuscaart.SqlGeneral.Connection:=dmaccesos.conexion;
frmbuscaart.tblarticulos.Connection:=dmaccesos.conexion;
frmbuscaart.ShowModal;
     if frmbuscaart.cod_cve <> '' then
        begin
         edcodigo.Text:=frmbuscaart.cod_cve;
    if ValidaProducto(edcodigo.text) = 1 then
       begin
         edcantidad.Enabled:=true;
          //trae el campo PrecioCapturable
          querys('select PrecioCapturable from articulos where cod_cve='+quotedstr(edcodigo.text),0,sqlgeneral);
          if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
           begin
            edprecio.Enabled := true;
            edPrecio.SetFocus;
           end
          else
           begin
             querys('select PrecioCapturable from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
             if sqlgeneral.FieldByName('PrecioCapturable').AsInteger = 1 then
              begin
               edprecio.Enabled := true;
               edPrecio.SetFocus;
              end
             else
              edcantidad.SetFocus;
            btnagregar.Enabled:=true;
        end;
     end;
   end;
end;

procedure Tfrmpresupuestos.RzBitBtn1Click(Sender: TObject);
begin
frmbuscaart.ShowModal;
end;

procedure Tfrmpresupuestos.edcantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edcantidad.Text <> '') then
    begin
     if edcantidad.Text = '0' then
        edcantidad.Text:='1';
      key :=#0;
      btnagregar.Click;
    end;

if (key = 'p') or (key = 'P') then
   begin
     if chkpiezas.Checked then
        chkpiezas.Checked:=false
     else
        chkpiezas.Checked:=true;
     key:=#0;
   end;

if key = #27 then
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;


end;

procedure Tfrmpresupuestos.CboUtilidadKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
   edcantidad.SetFocus;
end;

procedure Tfrmpresupuestos.btnagregarClick(Sender: TObject);
var valor:integer;
begin
btnagregar.Tag:=0;
//verifica si es paquete
querys('select paquete from articulos where cod_cve='+quotedstr(edcodigo.Text)+ ' and paquete=1',0,SqlGeneral);
if sqlgeneral.RecordCount > 0 then
   begin
    // if ValidaExistenciasPaquete(edcodigo.Text,strtoint(edcantidad.Text)) = 0 then
     //   begin
     ValidaExistenciasPaquete(edcodigo.Text,strtoint(edcantidad.Text));
          if btnalta.enabled then
            InsertaArticulosPaquete('DetPresupTemp','idmaq',frmprincipal.idmaq,edcodigo.Text,sqlrejillaalta,strtoint(edcantidad.Text))
          else
            InsertaArticulosPaquete('DetPresupuesto','idpresupuesto',ednumcotizacion.Text,edcodigo.Text,sqlrejillaedit,strtoint(edcantidad.Text));
           LimpiaDatArt;
      //  end
     //else
      //  application.MessageBox('No se cuenta con todos los componentes de este paquete y no podra venderlo','Aviso',mb_iconinformation);
   end
else
   begin
      valor:=ValidaExistencias(edcodigo.Text,strtoint(edcantidad.text),chkpiezas.Checked);
    if (valor < 0) or (valor>0) then
       application.MessageBox(pchar('Le Informo que de la cantidad de '+edcantidad.text+' que esta presupuestando solo tiene en existencia '+inttostr(valor)+'!') ,'Aviso',mb_iconinformation);
    if btnagregar.Tag=1 then
       begin application.MessageBox('Este articulo no se puede vender en piezas!','Aviso',mb_iconinformation); chkpiezas.Checked := false; end;
        if valor = 0 then valor:=strtoint(edcantidad.Text);
        if valor < 0 then valor:=abs(valor);
         if btnalta.Enabled then
          InsertaArticulo(sqlrejillaalta,'DetPresupTemp','idmaq',frmprincipal.idmaq,edcodigo.Text,strtoint(edcantidad.Text))
         else
          InsertaArticulo(sqlrejillaedit,'DetPresupuesto','idpresupuesto',ednumcotizacion.Text,edcodigo.Text,strtoint(edcantidad.Text));

                      { if btnalta.Enabled then
                          InsertaArticulo(sqlrejillaalta,'DetPresupTemp','idmaq',frmprincipal.idmaq,edcodigo.Text,strtoint(edcantidad.Text))
                       else
                          InsertaArticulo(sqlrejillaedit,'DetPresupuesto','idpresupuesto',edNumCotizacion.Text,edcodigo.Text,strtoint(edcantidad.Text));}
                          LimpiaDatArt;
       end;
end;

procedure Tfrmpresupuestos.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
  var band,val:integer;
tabla,campo,valor:string;
paquete,piezas:boolean;
query:tmyquery;
  begin
query:=tmyquery.Create(self);
band:=2;
//determina si es paquete o no
querys('select if(paquete=1,''true'',''false'') as paquete from articulos where cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),0,sqlgeneral);
paquete:=strtobool(sqlgeneral.Fields.Fields[0].AsString);
//determina si estamos dando de altao editando
if btnalta.Enabled then
   begin tabla:='DetPresupTemp';campo:='idmaq';valor:=frmprincipal.idmaq; dsrejilla.DataSet:=sqlrejillaalta; query:=sqlrejillaalta; end
else
  begin tabla:='DetPresupuesto';campo:='idpresupuesto';valor:=ednumcotizacion.Text; dsrejilla.DataSet:=sqlrejillaedit; query:=sqlrejillaedit; end;
if dsrejilla.DataSet.FieldValues['piezas'] > 0 then
   piezas:=true
else
   piezas:=false;

if (rejilla.Enabled) and (key='+') then
    begin
    //  if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and (dsrejilla.DataSet.FieldValues['utilidad']<>'') then
        if paquete then begin
//         if (ValidaExistenciasPaquete(dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['cant']+1) = 0)  then
            ValidaExistenciasPaquete(dsrejilla.DataSet.FieldValues['cod_cve'],1);
            InsertaArticulosPaquete(tabla,campo,valor,dsrejilla.DataSet.FieldValues['cod_cve'],query,dsrejilla.DataSet.FieldValues['cant']+1);
          end
         else
           begin
                                                                  //dsrejilla.DataSet.FieldValues['cant']+
         // if (val >= 0) and (paquete=false) then
               // querys('update '+tabla+' set cant=cant+1 where ('+campo+'='+valor+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and utilidad<>'''''+')',1,sqlgeneral);
                val:=Validaexistencias(dsrejilla.DataSet.FieldValues['cod_cve'],1,false);
                if dsrejilla.DataSet.FieldValues['cant'] <> '0' then
                 // begin
                  querys('update '+tabla+' set cant=cant+1 where id='+dsrejilla.DataSet.fieldbyname('id').AsString,1,sqlgeneral)
                 else

     //   if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') then          //dsrejilla.DataSet.FieldValues['piezas']+
      //      begin
           //  val:=Validaexistencias(dsrejilla.DataSet.FieldValues['cod_cve'],1,false);
          //   if val >= 0 then
                 //querys('update '+tabla+' set piezas=piezas+1 where ('+campo+'='+valor+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and utilidad<>'''''+')',1,sqlgeneral);
                querys('update '+tabla+' set piezas=piezas+1 where id='+dsrejilla.DataSet.fieldbyname('id').AsString,1,sqlgeneral);
            //end;

          if (val>0)or(val<0) then
             application.MessageBox('Le Informo que lo que esta presupuestando no lo tiene en existencias!','Aviso',mb_iconinformation);
      end;
      end;

if (rejilla.Enabled) and (key='-') then
    begin
      if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and (dsrejilla.DataSet.FieldValues['utilidad']<>'') then
        if paquete then
            InsertaArticulosPaquete(tabla,campo,valor,dsrejilla.DataSet.FieldValues['cod_cve'],query,dsrejilla.DataSet.FieldValues['cant']-1)
         else
          if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and (paquete=false) and (dsrejilla.DataSet.FieldValues['cant']>1) then
//                querys('update '+tabla+' set cant=cant-1 where ('+campo+'='+valor+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and utilidad<>'''''+')',1,sqlgeneral);
            querys('update '+tabla+' set cant=cant-1 where id='+dsrejilla.DataSet.Fieldbyname('id').AsString,1,sqlgeneral);
          if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') and (paquete=false) and (dsrejilla.DataSet.FieldValues['piezas']>1) then
              querys('update '+tabla+' set piezas=piezas-1 where id='+dsrejilla.DataSet.Fieldbyname('id').AsString,1,sqlgeneral);
              // querys('update '+tabla+' set piezas=piezas-1 where ('+campo+'='+valor+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and utilidad<>'''''+')',1,sqlgeneral);
          end;
       //refresca la rejilla de datos
         query.Close;
         query.ParamByName(campo).AsInteger:=strtoint(valor);
         query.Open;
end;

procedure Tfrmpresupuestos.SqlrejillaaltaAfterOpen(DataSet: TDataSet);
begin
CalculaTotales(SqlRejillaAlta);
end;

procedure Tfrmpresupuestos.edNumCotizacionButtonClick(Sender: TObject);
begin
 {  frmbusquedas.query:='SELECT presupuestos.idpresupuesto as ID,if (oportunidades.nombre='''' and oportunidades.apaterno='''' and oportunidades.amaterno='''',rsocial,concat(oportunidades.nombre,'' '',oportunidades.apaterno,'' '',oportunidades.amaterno)) '+
                        ' as Cliente,concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as Vendedor, presupuestos.fecha,presupuestos.hora FROM presupuestos INNER JOIN oportunidades ON (presupuestos.idoportunidad = ' +
                        ' oportunidades.idoportunidad) INNER JOIN usuarios ON (presupuestos.idvendedor = usuarios.idusuario) ';}

frmbusquedas.query:='SELECT presupuestos.idpresupuesto,if(oportunidades.rsocial='''',concat(ifnull(oportunidades.nombre,''''),'' '',ifnull(oportunidades.apaterno,''''),'' '',ifnull(oportunidades.amaterno,'''')),oportunidades.rsocial) as Cliente, '+
                    'concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Vendedor, presupuestos.fecha,presupuestos.hora FROM presupuestos left JOIN oportunidades ON (presupuestos.idoportunidad =  ' +
                    ' oportunidades.idoportunidad) left JOIN usuarios ON (presupuestos.idvendedor = usuarios.idusuario) left join clientes on presupuestos.idcliente=clientes.idcliente ';
                         frmbusquedas.campo_busqueda:='Cliente';
                         frmbusquedas.campo_retorno:='idpresupuesto';
                         frmbusquedas.tblorigen := 'presupuestos';
      frmbusquedas.tabla:='';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
              tecla:=#13;
              ednumcotizacion.Text:=frmbusquedas.resultado;
              TraePedido(edNumCotizacion.Text);
           //   edNumCotizacion.OnKeyPress(self,tecla);
              gbvendedor.Enabled:=true;
              EdNumCotizacion.Enabled:=true;
              edcve_vend.Enabled:=false;
              cbonomvend.Enabled:=false;
              edTCP.Enabled:=false;
              btnborrar.Enabled:=true;
              btnimprimir.Enabled := true;
              end;
end;

procedure Tfrmpresupuestos.sqlrejillaeditAfterOpen(DataSet: TDataSet);
begin
CalculaTotales(SqlRejillaEdit);
end;

procedure tfrmpresupuestos.BorraArticulos(tabla,campo,valor,cod_cve,id:string);
begin
//verifica si es un paquete
//querys('select cod_cve from art_compuestos where cod_paq='+quotedstr(cod_cve),0,sqlgeneral);
querys('select cod_cve,id from '+tabla+' where paquete='+quotedstr(cod_cve),0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   begin
     sqlgeneral.First;
     while not sqlgeneral.Eof do
         begin
            querys('delete from '+tabla+' where '+campo+' = '+valor + ' and id='+quotedstr(sqlgeneral.fieldbyname('id').AsString),1,frmprincipal.SqlGeneral);
            sqlgeneral.Next;
         end;
      querys('delete from '+tabla+' where '+campo+' = '+valor + ' and cod_cve='+quotedstr(cod_cve),1,frmprincipal.SqlGeneral);
   end
else
   querys('delete from '+tabla+' where id='+id+' and paquete=''''',1,sqlgeneral);
  // querys('delete from '+tabla+' where '+campo+' = '+valor + ' and cod_cve='+quotedstr(cod_cve)+ ' and id='+id,1,frmprincipal.SqlGeneral);
   //querys('delete from '+tabla+' where '+campo+' = '+valor + ' and cod_cve='+quotedstr(sqlgeneral.fieldbyname('cod_cve').AsString) + ' and utilidad = ''''',1,frmprincipal.SqlGeneral);
end;


procedure Tfrmpresupuestos.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key = 46) and (btnalta.Caption='&Guardar') then
  begin
    //elimina el registro del articulo
     BorraArticulos('DetPresupTemp','idmaq',frmprincipal.idmaq,dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['id']);
    //refresca la rejilla de datos
     sqlrejillaalta.Close;
     sqlrejillaalta.ParamByName('idmaq').AsInteger:=strtoint(frmprincipal.idmaq);
     sqlrejillaalta.Open;
     dsrejilla.DataSet:=sqlrejillaalta;
     edcodigo.SetFocus;
  end;

if (key = 46) and (btnmodificar.Caption='&Guardar') then
  begin
    //elimina el registro del articulo
   //  querys('delete from DetPresupuesto where idpresupuesto='+ednumcotizacion.Text+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
     BorraArticulos('DetPresupuesto','idpresupuesto',ednumcotizacion.Text,dsrejilla.DataSet.FieldValues['cod_cve'],dsrejilla.DataSet.FieldValues['id']);
    //refresca la rejilla de datos
     sqlrejillaedit.Close;
     sqlrejillaedit.ParamByName('idpresupuesto').AsInteger:=strtoint(ednumcotizacion.Text);
     sqlrejillaedit.Open;
     dsrejilla.DataSet:=sqlrejillaedit;
     edcodigo.SetFocus;
  end;   
end;

procedure Tfrmpresupuestos.btnmodificarClick(Sender: TObject);
var valor,tipo:string;
begin
if btnmodificar.Caption = '&Editar' then
   begin
     //verifica que no exista
     querys('select idpresupuesto from pedidos where idpresupuesto='+ednumcotizacion.Text,0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
         begin
           gbtotales.Enabled:=true;
           DSrejilla.DataSet:=SqlRejillaEdit;
           btnmodificar.Caption:='&Guardar';
           btncancelar.Caption:='&Cancelar';
           btncancelar.Hint:='Cancelar la Edición';
           btnmodificar.hint:='Guarda los Cambios Realizados';
           btnmodificar.ImageIndex:=1;
           btnalta.Enabled:=false;
           btnborrar.Enabled:=false;
           gbvendedor.Enabled:=true;
           edcve_vend.Enabled:=true;
           cbonomvend.Enabled:=true;
           gboportunidad.Enabled:=true;
           gbarticulo.Enabled:=true;
           btnagregar.Enabled:=false;
           edcantidad.enabled:=false;
           edNumCotizacion.Enabled:=false;
           if ednumopor.Text <> '0' then
              ednumopor.Enabled:=true
           else
             edcvecte.Enabled:=true;

     if dsrejilla.DataSet.RecordCount > 0 then
        rejilla.Enabled:=true
     else
       rejilla.Enabled:=false;
     edcodigo.SetFocus;
   end
  else
      application.MessageBox('No puede modificar este presupuesto, ya que se ha ligado con un Pedido!','Aviso',mb_iconinformation);
   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del presupuesto Actual';
     btnmodificar.ImageIndex:=2;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el presupuesto '+ednumcotizacion.Text,2);
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
        if ednumopor.Text<>'0' then
       begin
        tipo:='idoportunidad';
        valor:=sqloportunidades.fieldbyname('idoportunidad').AsString;
        end
     else
       begin
       tipo:='idcliente';
       valor:=sqlclientes.fieldbyname('idcliente').AsString;
     end;
     //actualiza los datos de la tabla presupuestos                                                                                                                                                                                                                                                                                      //',Anticipo='+edAnticipo.text+',Saldo='+EdSaldo.Text
     querys('update presupuestos set idpresupuesto='+edNumCotizacion.Text+','+tipo+'='+valor+',idvendedor='+edCve_Vend.Text+',TipoCambio='+edTCP.Text+',CostoHrs='+edCostohrs.Text+',TotMat='+edTotMat.Text+',MontoHrs='+edHoras.Text+',Descuento='+edDescuento.Text+',Iva='+edIva.Text+',TotDlls='+edTotDlls.Text+',TotMn='+edTotMn.Text+' where idpresupuesto='+edNumCotizacion.Text,1,SqlGeneral);
     limpia;
     DSrejilla.DataSet.Close;
     edcve_vend.Enabled:=false;
     cbonomvend.Enabled:=false;
     edTCP.Enabled:=false;
     edCostoHrs.Enabled:=false;
     edFechaCreacion.Enabled:=false;
     gboportunidad.Enabled:=false;
     gbarticulo.Enabled:=false;
     rejilla.Enabled:=false;
     btnrecalcular.Enabled:=false;
     edNumCotizacion.Text:='';
     edNumCotizacion.Enabled:=true;
     edNumCotizacion.SetFocus;
     end;
end;

procedure Tfrmpresupuestos.edNumCotizacionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edNumCotizacion.Text <> '' ) then
   begin
     key:=#0;
    if TraePedido(edNumCotizacion.Text) = 1 then
       begin
         gbvendedor.Enabled:=true;
         edNumCotizacion.Enabled:=true;
         btnimprimir.Enabled := true;
       end;
   end;

if (key = #13) and (edNumCotizacion.Text = '') then
   begin
     key:=#0;
     edNumCotizacion.OnButtonClick(self);
   end;
end;

procedure Tfrmpresupuestos.edNumCotizacionChange(Sender: TObject);
begin
if edNumCotizacion.Text = '' then
  begin
      limpia;
      DSrejilla.DataSet.Close;
      btnimprimir.enabled := false;
  end;
end;

procedure Tfrmpresupuestos.RejillaDBTableView1DblClick(Sender: TObject);
begin
if btnalta.Enabled then
   ModificaArticulo(SqlRejillaAlta,'DetPresupTemp','idmaq',frmprincipal.idmaq);
if btnmodificar.Enabled then
   ModificaArticulo(SqlRejillaEdit,'DetPresupuesto','idpresupuesto',edNumCotizacion.Text);
end;

procedure Tfrmpresupuestos.btnborrarClick(Sender: TObject);
begin
//elimina la cotizacion y sus detalles
querys('delete from DetPresupuesto where idPresupuesto='+edNumCotizacion.Text,1,SqlGeneral);
querys('delete from presupuestos where idpresupuesto='+edNumCotizacion.Text,1,SqlGeneral);
limpia;
btnmodificar.Enabled:=false;
btnborrar.Enabled:=false;
end;

procedure Tfrmpresupuestos.btnrecalcularClick(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   CalculaTotales(SqlRejillaAlta);
if btnmodificar.caption = '&Guardar' then
   CalculaTotales(SqlRejillaEdit);
end;

procedure Tfrmpresupuestos.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
begin
  edcantidad.Text:='1';
  btnagregar.Enabled:=false;
end;
end;

procedure Tfrmpresupuestos.edcvecteKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 then begin
     key:=#0;
      if edcvecte.Text <> '' then
        begin
         sqlclientes.Close;
         sqlclientes.Params.Items[0].Value:=strtoint(edcvecte.Text);
         sqlclientes.Open;
         if sqlclientes.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
             gbarticulo.Enabled:=false;
             rejilla.Enabled:=false;
             edcvecte.SetFocus;
           end
         else
          begin
            gbarticulo.Enabled:=true;
            rejilla.Enabled:=true;
           dsoportunidades.DataSet:=sqlclientes;

         if (sqlclientes.fieldbyname('idvendedor').Asinteger>0)and(edcve_vend.Text='') then begin
            edcve_vend.Text:=sqlclientes.fieldbyname('idvendedor').AsString;
            tecla:=#13;
             edcve_vend.OnKeyPress(self,tecla);
             edcodigo.SetFocus;
            end;
          if edcve_vend.Text='' then
           begin
            edcve_vend.Enabled:=true;
            cbonomvend.Enabled:=true;
            edcve_vend.Clear;
            cbonomvend.Text:='';
           end;

         end;
         end
     else
        edcvecte.OnButtonClick(self);
  end;

  if key = #27 then
     begin
      key:=#0;
     edcvecte.Text:='';
  end;
end;

procedure Tfrmpresupuestos.edcvecteButtonClick(Sender: TObject);
begin
       frmbusquedas.query:='Select idcliente,nombre,apaterno,amaterno,rsocial AS Razon_Social,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
                           ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes order by idcliente';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tecla:=#13;
             edcvecte.Text:=frmbusquedas.resultado;
             edcvecte.OnKeyPress(self,tecla);
             edcodigo.setfocus;
            end;
end;

procedure Tfrmpresupuestos.edNumOporChange(Sender: TObject);
begin
if ednumopor.Text='' then
  begin
   edcvecte.Enabled:=true;
   dsoportunidades.DataSet.Close;
  end
else
  edcvecte.Enabled:=false;
end;

procedure Tfrmpresupuestos.edcvecteChange(Sender: TObject);
begin
if edcvecte.Text='' then
   begin
   ednumopor.Enabled:=true;
     dsoportunidades.DataSet.Close;
  end
else
  ednumopor.Enabled:=false;
end;

procedure Tfrmpresupuestos.SqlrejillaaltaAfterDelete(DataSet: TDataSet);
begin
CalculaTotales(Sqlrejillaalta);
end;

procedure Tfrmpresupuestos.sqlrejillaeditAfterDelete(DataSet: TDataSet);
begin
CalculaTotales(Sqlrejillaedit);
end;

procedure Tfrmpresupuestos.EdPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #27 then
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;

  key := ValidaNumeros(key,false);
  key := ValidaPunto(EdPrecio.Text,key);

if (key = #13) and (edPrecio.Text <> '') then
 begin
  key := #0;
  edCantidad.SetFocus;
 end;
end;

procedure Tfrmpresupuestos.btnimprimirClick(Sender: TObject);
begin
with dmreportes do
  begin
  querys('select * from presupuestos where idpresupuesto='+quotedstr(edNumCotizacion.Text), 0, sqlgeneral);

    if edNumopor.Text <> '0' then
    begin
    querys('SELECT ''PRESUPUESTO DE OPORTUNIDADES'' as titulo, ''No. de Oportunidad'' as cuenta, oportunidades.idoportunidad as idpersona, ifnull(rsocial, concat(oportunidades.nombre, '' '', oportunidades.apaterno, '' '', oportunidades.amaterno)) AS nombre, '+
           'concat(oportunidades.dir, ''  '', oportunidades.numero, ''  '',   colonias.nombre) as dir, '+
           'oportunidades.ciudad, oportunidades.estado, oportunidades.cp, oportunidades.alta, oportunidades.entre, origen.nombre AS origen, fuentes.nombre AS fuente, giros.nombre AS giro, categorias.nombre AS Categoria, sectores.nombre AS sector '+
           'FROM oportunidades LEFT OUTER JOIN colonias ON (oportunidades.idcol = colonias.idcol) LEFT OUTER JOIN origen ON (oportunidades.idorigen = origen.idorigen) LEFT OUTER JOIN fuentes ON (oportunidades.idfuente = fuentes.idfuente) '+
           'LEFT OUTER JOIN giros ON (oportunidades.idgiro = giros.idgiro) LEFT OUTER JOIN categorias ON (oportunidades.idcategoria = categorias.idcategoria) LEFT OUTER JOIN col_sector ON (oportunidades.idcol = col_sector.idcol) '+
           'LEFT OUTER JOIN sectores ON (col_sector.idsector = sectores.idsector) INNER JOIN agenda_vendedores ON (oportunidades.idoportunidad = agenda_vendedores.idoportunidad) '+
           'INNER JOIN estatus_eventos ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) INNER JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) '+
           'INNER JOIN tipos_actividades ON (actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (oportunidades.idoportunidad = '+quotedstr(edNumOpor.text)+') AND (tipos_actividades.nombre = ''PRESUPUESTO'')', 0, sqlgeneral3);

    querys('select DetPresupuesto.idpresupuesto,DetPresupuesto.id,DetPresupuesto.cod_cve,articulos.nombre,DetPresupuesto.cant,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_esp/100 as descuento,'+
           'if (articulos.aplica_desc = 1, ''TRUE'',''FALSE'') as aplica_desc, DetPresupuesto.costo as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda, if (articulos.aplica_desc = 1, '+
           '(((DetPresupuesto.costo-(DetPresupuesto.costo*articulos.desc_esp/100)) + ((DetPresupuesto.costo-(DetPresupuesto.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPresupuesto.cant) '+
           ' + ((((DetPresupuesto.costo/articulos.piezasxunidad)-((DetPresupuesto.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPresupuesto.costo/articulos.piezasxunidad)-((DetPresupuesto.costo/articulos.piezasxunidad)'+
           '*articulos.desc_esp/100))*articulos.iva/100))*DetPresupuesto.piezas), ((DetPresupuesto.costo+(DetPresupuesto.costo*articulos.iva/100))*DetPresupuesto.cant) + (((DetPresupuesto.costo/articulos.piezasxunidad)+'+
           '((DetPresupuesto.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPresupuesto.piezas))  as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPresupuesto.cant)  as tinstalacion,DetPresupuesto.utilidad'+
           ' from DetPresupuesto inner join articulos on DetPresupuesto.cod_cve = articulos.cod_cve where DetPresupuesto.idpresupuesto='+quotedstr(edNumCotizacion.text)+' order by DetPresupuesto.id', 0, sqlgeneral2);

    end
  else
    begin
    querys('SELECT ''PRESUPUESTO DE CLIENTES'' as titulo, ''Cuenta'' as cuenta,clientes.idcliente as idpersona, ifnull(rsocial, concat(clientes.nombre,'' '',clientes.apaterno,'' '',clientes.amaterno)) as nombre, '+
           'concat(clientes.dir, ''  '', clientes.numero, ''  '',  colonias.nombre)  as dir, '+
           'clientes.ciudad, clientes.estado, clientes.cp, sectores.nombre AS sector, clientes.st_date as alta, clientes.refs as entre, origen.nombre AS origen, fuentes.nombre AS fuente, giros.nombre AS giro, categorias.nombre AS categoria '+
           'FROM clientes LEFT OUTER JOIN colonias ON (clientes.idcol = colonias.idcol) LEFT OUTER JOIN col_sector ON (colonias.idcol = col_sector.idcol) LEFT OUTER JOIN sectores ON (col_sector.idsector = sectores.idsector) '+
           'LEFT OUTER JOIN origen ON (clientes.idorigen = origen.idorigen) LEFT OUTER JOIN fuentes ON (clientes.idfuente = fuentes.idfuente) LEFT OUTER JOIN giros ON (clientes.idgiro = giros.idgiro) '+
           'LEFT OUTER JOIN categorias ON (clientes.idcategoria = categorias.idcategoria) WHERE clientes.idcliente = '+quotedstr(edcvecte.text), 0, sqlgeneral3);

    querys('select DetPresupuesto.idpresupuesto,DetPresupuesto.id,DetPresupuesto.cod_cve,articulos.nombre,DetPresupuesto.cant,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_esp/100 as descuento,'+
           'if (articulos.aplica_desc = 1, ''TRUE'',''FALSE'') as aplica_desc, DetPresupuesto.costo as precio,if(articulos.moneda = ''D'',''DOLARES'',''PESOS'') as Moneda, if (articulos.aplica_desc = 1, '+
           '(((DetPresupuesto.costo-(DetPresupuesto.costo*articulos.desc_esp/100)) + ((DetPresupuesto.costo-(DetPresupuesto.costo*articulos.desc_esp/100))*articulos.iva/100))*DetPresupuesto.cant) '+
           ' + ((((DetPresupuesto.costo/articulos.piezasxunidad)-((DetPresupuesto.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((DetPresupuesto.costo/articulos.piezasxunidad)-((DetPresupuesto.costo/articulos.piezasxunidad)'+
           '*articulos.desc_esp/100))*articulos.iva/100))*DetPresupuesto.piezas), ((DetPresupuesto.costo+(DetPresupuesto.costo*articulos.iva/100))*DetPresupuesto.cant) + (((DetPresupuesto.costo/articulos.piezasxunidad)+'+
           '((DetPresupuesto.costo/articulos.piezasxunidad)*articulos.iva/100))*DetPresupuesto.piezas))  as Total,articulos.piezasxunidad,(articulos.tinstalacion*DetPresupuesto.cant)  as tinstalacion,DetPresupuesto.utilidad'+
           ' from DetPresupuesto inner join articulos on DetPresupuesto.cod_cve = articulos.cod_cve where DetPresupuesto.idpresupuesto='+quotedstr(edNumCotizacion.text)+' order by DetPresupuesto.id', 0, sqlgeneral2);

    end;       
  end;                 
  OperacionReporte('Presupuestos', 'Presupuesto', 'IMP', 1);
end;

end.

