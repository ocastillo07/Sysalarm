{///////////////////////////////////////////////////////////////////////////////
2008/10/10 dalyla inventariable
2008/02/28 dalyla zona horaria ok
2007/11/12 Dalila Precio por costo en el articulo
}///////////////////////////////////////////////////////////////////////////////
unit Uart_comp;

interface
                                                           
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAccess, DB, MemDS, DBAccess, StdCtrls, RzLabel, Mask, RzEdit,
  RzDBEdit, DBCtrls, RzDBCmbo, RzButton, RzRadChk, RzDBChk, ExtCtrls,
  RzDBNav, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzBtnEdt, RzCmboBx, cxCurrencyEdit, ComCtrls,
  ToolWin;

type
  Tfrmart_comp = class(TForm)
    gbdatos: TGroupBox;
    edcbarras: TRzDBEdit;
    edclave: TRzDBEdit;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    ednombre: TRzDBEdit;
    tblarticulos: TMyTable;
    dsarticulos: TDataSource;
    sqlgeneral: TMyQuery;
    navegador: TRzDBNavigator;
    gbfinancieros: TGroupBox;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    ediva: TRzDBNumericEdit;
    edcosto: TRzDBNumericEdit;
    chkAplicaDesc: TRzDBCheckBox;
    eddscto: TRzDBNumericEdit;
    edPrecioDscto: TRzDBNumericEdit;
    gbutilidades: TGroupBox;
    RzLabel12: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel29: TRzLabel;
    edutild: TRzDBNumericEdit;
    edutilc: TRzDBNumericEdit;
    edutilb: TRzDBNumericEdit;
    edutila: TRzDBNumericEdit;
    edPrecioConIvaa: TRzNumericEdit;
    edPrecioConIvab: TRzNumericEdit;
    edPrecioConIvac: TRzNumericEdit;
    edPrecioConIvad: TRzNumericEdit;
    edPrecioDsctoIva: TRzNumericEdit;
    edtinstalacion: TRzDBNumericEdit;
    btnalta: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    Rejilla: TcxGrid;
    RejillaDBTableView1: TcxGridDBTableView;
    clave: TcxGridDBColumn;
    nombre: TcxGridDBColumn;
    cant: TcxGridDBColumn;
    util: TcxGridDBColumn;
    dbiva: TcxGridDBColumn;
    descuento: TcxGridDBColumn;
    aplica_desc: TcxGridDBColumn;
    tiempo: TcxGridDBColumn;
    precio_costo: TcxGridDBColumn;
    total: TcxGridDBColumn;
    RejillaLevel1: TcxGridLevel;
    edbuscar: TRzButtonEdit;
    RzLabel11: TRzLabel;
    RzLabel18: TRzLabel;
    gbarticulo: TGroupBox;
    RzLabel6: TRzLabel;
    Label8: TLabel;
    lblproducto: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel8: TRzLabel;
    Label1: TLabel;
    edcantidad: TRzNumericEdit;
    chkpiezas: TCheckBox;
    btnagregar: TRzBitBtn;
    edDescripcion: TRzEdit;
    EdCosto_unidad: TRzEdit;
    edTInsta: TRzEdit;
    edcodigo: TRzButtonEdit;
    Sqlrejillaalta: TMyQuery;
    DsRejilla: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    eddescrip: TRzDBRichEdit;
    Label5: TLabel;
    piezas: TcxGridDBColumn;
    tblarticuloscod_cve: TStringField;
    tblarticuloscod_barras: TStringField;
    tblarticulosnombre: TStringField;
    tblarticulosiva: TFloatField;
    tblarticuloscosto: TFloatField;
    tblarticulosutila: TFloatField;
    tblarticulosutilb: TFloatField;
    tblarticulosutilc: TFloatField;
    tblarticulosutild: TFloatField;
    tblarticulosprecioa: TFloatField;
    tblarticulospreciob: TFloatField;
    tblarticulosprecioc: TFloatField;
    tblarticulospreciod: TFloatField;
    tblarticulosdesc_esp: TFloatField;
    tblarticulosaplica_desc: TSmallintField;
    tblarticulosunidades_caja: TIntegerField;
    tblarticulospiezasxunidad: TIntegerField;
    tblarticulosusuario: TStringField;
    tblarticulosfecha: TDateField;
    tblarticuloshora: TStringField;
    tblarticulosprecio_desc: TFloatField;
    tblarticulostinstalacion: TFloatField;
    tblarticulosservicio: TSmallintField;
    tblarticulospaquete: TSmallintField;
    tblarticulosdescripcion: TMemoField;
    precioa: TRzDBEdit;
    preciob: TRzDBEdit;
    precioc: TRzDBEdit;
    preciod: TRzDBEdit;
    FontDialog1: TFontDialog;
    lbufh: TRzLabel;
    procedure edclaveExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure edcostoExit(Sender: TObject);
    procedure edcostoKeyPress(Sender: TObject; var Key: Char);
    procedure edcostoEnter(Sender: TObject);
    procedure edivaEnter(Sender: TObject);
    procedure edivaExit(Sender: TObject);
    procedure edivaKeyPress(Sender: TObject; var Key: Char);
    procedure edtinstalacionKeyPress(Sender: TObject; var Key: Char);
    procedure edutilaExit(Sender: TObject);
    procedure edutilaKeyPress(Sender: TObject; var Key: Char);
    procedure edutilbExit(Sender: TObject);
    procedure edutilbKeyPress(Sender: TObject; var Key: Char);
    procedure edutilcExit(Sender: TObject);
    procedure edutilcKeyPress(Sender: TObject; var Key: Char);
    procedure edutildExit(Sender: TObject);
    procedure edutildKeyPress(Sender: TObject; var Key: Char);
    procedure eddsctoExit(Sender: TObject);
    procedure eddsctoKeyPress(Sender: TObject; var Key: Char);
    procedure edPrecioDsctoKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoButtonClick(Sender: TObject);
    procedure edcodigoEnter(Sender: TObject);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edcantidadKeyPress(Sender: TObject; var Key: Char);
    procedure btnagregarClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edcbarrasKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eddescripKeyPress(Sender: TObject; var Key: Char);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure RejillaDBTableView1DblClick(Sender: TObject);
    procedure edcantidadChange(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure eddescKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripEnter(Sender: TObject);
    procedure eddescripExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edbuscarChange(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure precioaExit(Sender: TObject);
    procedure preciobExit(Sender: TObject);
    procedure preciocExit(Sender: TObject);
    procedure preciodExit(Sender: TObject);
    procedure tblarticulosAfterPost(DataSet: TDataSet);

  private
    procedure buscarlocate;
    procedure CalculaIva;
    procedure LimpiaDatArt;
    procedure limpiaprecio;
    procedure calcula_utilidad;
    procedure operacion;
    procedure ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
    procedure InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
    function  ValidaProducto(CodCve:string):integer;
    { Private declarations }
  public
    { Public declarations }
    codigo:word;
    costo,iva:double;
  end;

var
  frmart_comp: Tfrmart_comp;

implementation

uses Uprincipal, Ubusquedas, Urecursos, Udm, UBuscaArt;

{$R *.dfm}

{procedure Tfrmart_comp.CentraPantalla(var m : TWMWINDOWPOSCHANGED);
  begin

        m.windowpos.x := round((screen.Width - self.Width) div 2);  {Left/Posicion X}
     {   m.windowpos.y := round((screen.Height - self.Height) div 2);  {Left/Posicion X}

//end;

{procedure Tfrmart_comp.buscarlocate;
begin


end;}


procedure Tfrmart_comp.limpiaprecio;
begin
edPrecioConIvaa.Clear;
edPrecioConIvab.Clear;
edPrecioConIvac.Clear;
edPrecioConIvad.Clear;
edPrecioDsctoIva.Clear;
end;

procedure Tfrmart_comp.operacion;
var id:string;
begin
id:=edclave.text;
        SqlGeneral.Close;
        SqlGeneral.SQL.Clear;
        SqlGeneral.SQL.Add('select SUM(if (art_compuestos.piezas > 0,((articulos.precioa/articulos.piezasxunidad) * art_compuestos.piezas),(art_compuestos.cant * articulos.precioa))) as  COSTO, SUM(if (art_compuestos.piezas > 0,ROUND(((articulos.tinstalacion/articulos.piezasxunidad)');
        SqlGeneral.SQL.Add('*art_compuestos.piezas),3),ROUND((articulos.tinstalacion*art_compuestos.cant),3))) AS TIEMPO from  art_compuestos inner join articulos on art_compuestos.cod_cve = articulos.cod_cve where art_compuestos.cod_paq=:id order by  art_compuestos.cod_cve');
        SqlGeneral.ParamByName('id').AsString:=id;
        SqlGeneral.Open;
        edcosto.Text:='$'+floattostr(SqlGeneral.fieldbyname('COSTO').AsFloat);
        edtinstalacion.Text:=floattostr(SqlGeneral.fieldbyname('TIEMPO').AsFloat);
end;



procedure Tfrmart_comp.calcula_utilidad;
begin
// calcula la utilidad conforme se vayan aumentando los articulos, se debe de tener el iva antes y sus porcentajes correspondientes capturados
      ediva.OnExit(self);
      edutila.OnExit(self);
      edutilb.OnExit(self);
      edutilc.OnExit(self);
      edutild.OnExit(self);
      if chkAplicaDesc.Checked then
         eddscto.OnExit(self);
end;


procedure Tfrmart_comp.InsertaArticulo(query:tMyQuery;tabla,campo,valor:string);
var cant,piezas:string;
begin
cant:='0';
piezas:='0';
  if (chkpiezas.enabled= true) and (chkpiezas.Checked=true) then begin//si es en piezas
        piezas:=edcantidad.text;
  end else begin
        cant:=edcantidad.Text;
  end;

        if rejilla.Enabled = false then
           rejilla.Enabled:=true;

          //verifica que no exista el articulo en la lista

        if piezas <> '0' then begin
          //insercion para piezas.
             querys('select * from '+tabla+' where '+campo+'='+quotedstr(valor)+' and piezas > 0 and cant=0 and cod_cve='+quotedstr(edcodigo.Text),0,SqlGeneral);
             if SqlGeneral.RecordCount = 0 then
                //inserta los datos del articulo en art_compuestos
                querys('insert into '+tabla+'(cant,piezas,cod_cve,'+campo+') values ('+cant+','+piezas+','+quotedstr(edcodigo.Text)+','+quotedstr(valor)+')',1,SqlGeneral)
             else
                //solo actualiza las existencias en caso de ya estar en la tabla
                querys('update '+tabla+' set piezas=piezas+'+piezas+' where cant=0 and '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text),1,SqlGeneral);

        end else begin
            //insercion para unidades.
              querys('select * from '+tabla+' where '+campo+'='+quotedstr(valor)+' and cant > 0 and piezas=0 and cod_cve='+quotedstr(edcodigo.Text),0,SqlGeneral);
             if SqlGeneral.RecordCount = 0 then
                //inserta los datos del articulo en art_compuestos
                querys('insert into '+tabla+'(cant,piezas,cod_cve,'+campo+') values ('+cant+','+piezas+','+quotedstr(edcodigo.Text)+','+quotedstr(valor)+')',1,SqlGeneral)
             else
                //solo actualiza las existencias en caso de ya estar en la tabla
                querys('update '+tabla+' set cant=cant+'+cant+' where piezas=0 and '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(edcodigo.Text),1,SqlGeneral);
        end;//piezas > 0

//SACAR LOS COSTOS Y LOS TIEMPOS
       operacion;//actualizar costo,instalacion en la tabla de articulos
        //mostrar los articulos del paquete en la rejilla.......

        rejilla.Enabled:=true;
        //vuelve a abrir la query con el id;
        query.Close;
        query.ParamByName('id').AsString:=valor;
        query.Open;
        LimpiaDatArt;
end;


procedure Tfrmart_comp.LimpiaDatArt;
begin
     //limpia los campos
     btnagregar.Enabled:=false;
     edcantidad.Text:='1';
     edcantidad.Enabled:=false;
     chkpiezas.Checked:=false;
     chkpiezas.Enabled:=false;
     edtinsta.Text:='';
     edcosto_unidad.Text:='';
     edDescripcion.Text:='';
     edCodigo.Text:='';
     lbufh.Caption := '';
     edcodigo.Enabled:=true;
     if btncancelar.caption= '&Cancelar' then
        edcodigo.SetFocus;
end;

function Tfrmart_comp.ValidaProducto(CodCve:string):integer;
begin
//aqui busca el articulo por codigo de barras o por clave
querys('select cod_cve,nombre,desc_esp,tinstalacion,piezasxunidad,unidades_caja,aplica_desc,nom_envase,nom_piezas,servicio,precioa from articulos where cod_cve='+quotedstr(CodCve),0,SqlGeneral);
if SqlGeneral.RecordCount = 0 then
   begin
      application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
      edcodigo.SelectAll;
      SqlGeneral.Close;
      edcantidad.Text:='1';
      edcodigo.Text:='';
      chkpiezas.Checked:=false;
      result:=0;
   end  else  begin
      // si hay datos en el campo piezas_envase entonces que se habilite el checkbox de piezas........
       if SqlGeneral.FieldByName('piezasxunidad').AsInteger > 1 then
          chkpiezas.Enabled:=true
       else
          chkpiezas.Enabled:=false;

       edDescripcion.Text:=SqlGeneral.fieldbyname('nombre').AsString;
       edCosto_Unidad.Text:=SqlGeneral.fieldbyname('precioa').AsString;
       edTInsta.Text:=SqlGeneral.fieldbyname('tinstalacion').AsString;
       result:=1;

   end;
end;


procedure Tfrmart_comp.CalculaIva;
begin // calculo del iva para las utilidades
costo:=QuitaCaracteres(edcosto.Text,'$');
iva:=QuitaCaracteres(ediva.Text,'%');

if edutila.Text<> '' then
   edutila.OnExit(self);
if edutilb.Text<> '' then
   edutilb.OnExit(self);
if edutilc.Text<> '' then
   edutilc.OnExit(self);
if edutild.Text<> '' then
   edutild.OnExit(self);
if eddscto.Text <> '' then
   eddscto.OnExit(self);

end;


procedure Tfrmart_comp.buscarlocate;
begin
//if edbuscar.Text <> '' then begin


   //si hay un valor mayor de cero
   tblarticulos.Open;
         if tblarticulos.Locate('cod_cve',edbuscar.Text,[]) then
           begin
              btnmodificar.Enabled:=true;
              btnalta.Enabled:=true;
              btnborrar.Enabled:=true;
              navegador.Enabled:=true;
              SqlRejillaAlta.Close;
              SqlRejillaAlta.ParamByName('id').AsString:=edclave.text;
              SqlRejillaAlta.Open;
              lbufh.Caption := UFH(tblarticulos);
           end else begin

            btnmodificar.Enabled:=false;
            btnborrar.Enabled:=false;
            application.MessageBox('Ese Paquete no Existe','Información',mb_ok+mb_iconinformation);
            tblarticulos.Active:=false;
            edclave.Text:='';
            //edclave.SetFocus;
            SqlRejillaAlta.Close;
            edbuscar.Text:='';
          end;

   //end;//if edclave =0;

//end;
end;

procedure Tfrmart_comp.edclaveExit(Sender: TObject);
var mensaje:pchar;
begin
if btnalta.Caption='&Guardar' then
  begin
   if edclave.Text<>'' then
      begin
    //busca si ya existe ese codigo clave de articulo en la tabla de articulos
    querys('select * from articulos where cod_cve='+quotedstr(edclave.Text),0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
       begin
        mensaje:='El codigo tecleado ya esta siendo usado por otro paquete, favor de introducir uno diferente!';
        application.MessageBox(mensaje,'Aviso',mb_iconwarning);
        edclave.Clear;
        edclave.SetFocus;
       end else begin
       gbarticulo.Enabled:=true;
       edclave.Enabled:=false;
       end;
    end
  end;

end;

procedure Tfrmart_comp.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
    begin
    //buscarlocate;
      frmbusquedas.query:='Select cod_cve,cod_barras as Cod_Barras,nombre as Nombre,paquete as Paquete,usuario as Usuario,fecha as Fecha,hora as Hora from articulos where paquete=1 order by cod_cve';
      frmbusquedas.campo_retorno:='cod_cve';
      frmbusquedas.tabla:='articulos';
      frmbusquedas.tblorigen:='articulos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             edbuscar.Text:=frmbusquedas.resultado;
             tblarticulos.Active:=true;

             tblarticulos.Locate('cod_cve',frmbusquedas.resultado,[]);
             navegador.Enabled:=true;
             btnalta.Enabled:=true;
             btnmodificar.Enabled:=true;
             btnborrar.Enabled:=true;
             SqlRejillaAlta.Close;
             SqlRejillaAlta.ParamByName('id').AsString:=edclave.text;
             SqlRejillaAlta.Open;

        end else begin
        edbuscar.Text:='';
        end;
    end;
end;

procedure Tfrmart_comp.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  if application.MessageBox('Deseas cancelar?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
    begin
    if btnalta.Caption='&Guardar' then
      begin
      edclave.Enabled:=true;
      querys('delete from art_compuestos where cod_paq='+quotedstr(edclave.text),1,sqlgeneral);
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta un Paquete';
      btnalta.ImageIndex:=5;
      gbdatos.Enabled:=false;
      gbarticulo.Enabled:=false;
      gbfinancieros.Enabled:=false;
      rejilla.Enabled:=false;
      end;
    tblarticulos.Cancel;
    btncancelar.Hint:='Cerrar esta Pantalla';
    btncancelar.Caption:='&Cerrar';
    LimpiaDatArt;
    if btnmodificar.Enabled then
      begin
      //borrar los registros de tablas y insertar los datos anteriores.....
      querys('delete from art_compuestos where cod_paq='+quotedstr(edclave.text),1,sqlgeneral);
      querys('insert into art_compuestos(cod_paq,cod_cve,cant,piezas)select cod_paq,cod_cve,cant,piezas from art_compuestosTemp where idmaq='+frmprincipal.idmaq,1,SqlGeneral);
      querys('delete from art_compuestosTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);

      edclave.Enabled:=true;
      btnmodificar.Caption:='&Editar';
      btnmodificar.hint:='Editar los datos del Paquete Actual';
      btnmodificar.ImageIndex:=2;

      gbdatos.Enabled:=false;
      gbarticulo.Enabled:=false;
      gbfinancieros.Enabled:=false;
      rejilla.Enabled:=false;

      end;
    SqlRejillaAlta.Close;
    //SqlRejillaAlta.Open;
    tblarticulos.Close;
    edbuscar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    navegador.enabled:=true;
    limpiaprecio;
    edbuscar.setfocus;
    end;
  End
else
 close;
end;

procedure Tfrmart_comp.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin   
       navegador.Enabled:=false;
       DSrejilla.DataSet:=SqlRejillaAlta;
        //pone la tabla de articulos en modo de insercion
       edbuscar.text:='';
       tblarticulos.Active:=true;
       tblarticulos.insert;
       btnalta.Caption:='&Guardar';
       btnalta.Hint:='Guardar los datos de la alta';
       btnalta.ImageIndex:=1;
       btncancelar.Caption:='&Cancelar';
       btncancelar.Hint:='Cancelar la Alta';
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       gbfinancieros.Enabled:=true;
       gbdatos.Enabled:=true;
       edbuscar.Enabled:=false;
       chkAplicaDesc.Enabled:=TRUE;
        if edclave.Enabled then begin
           edclave.setfocus;
        end else begin
           edclave.Enabled:=true;
           edclave.SetFocus;
        end;

   end
   else
   begin

      if edclave.Text <> '' then begin
      limpiaprecio;
      navegador.Enabled:=true;
      btnalta.Caption:='&Alta';
      btnalta.Hint:='Dar de Alta a un Paquete';
      btncancelar.Caption:='&Cerrar';
      btncancelar.Hint:='Cerrar esta Ventana';
      btnalta.ImageIndex:=5;
      btnborrar.Enabled:=true;
      btnmodificar.Enabled:=true;
      frmprincipal.ucprincipal.Log('Dio de Alta el Paquete'+ednombre.text,1);
       if chkAplicaDesc.Checked then
           tblarticulos.FieldByName('aplica_desc').asinteger:=1
       else
           tblarticulos.FieldByName('aplica_desc').AsInteger:=0;

      //guarda los datos
      tblarticulos.FieldByName('paquete').AsInteger:=1;

      tblarticulos.Post;
      gbfinancieros.Enabled:=false;
      gbdatos.Enabled:=false;
      edclave.Enabled:=true;
      edbuscar.Enabled:=true;
      chkAplicaDesc.Enabled:=false;
      shortdateformat:='yyyy/mm/dd';
      tblarticulos.close;
      Sqlrejillaalta.Close;

      end else begin

      showmessage('TECLEE UNA CLAVE PARA EL PAQUETE');
      edclave.SetFocus;
      end;
     end;
end;

procedure Tfrmart_comp.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     navegador.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio click en el boton editar de Paquetes',0);
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     navegador.Enabled:=false;
     edbuscar.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     edclave.Enabled:=false;
     gbdatos.Enabled:=true;
     gbfinancieros.Enabled:=true;
     gbarticulo.Enabled:=true;
     tblarticulos.Edit;
     edbuscar.Enabled:=false;
     chkAplicaDesc.Enabled:=TRUE;
     querys('insert into art_compuestosTemp(cod_paq,cod_cve,cant,piezas) select cod_paq,cod_cve,cant,piezas from art_compuestos where cod_paq = '+quotedstr(edclave.Text),1,SqlGeneral);
     querys('update art_compuestosTemp set idmaq='+quotedstr(frmprincipal.idmaq)+' where cod_paq='+quotedstr(edclave.Text),1,SqlGeneral);
     rejilla.Enabled:=true;
     edcbarras.setfocus;
   end
else
  begin
//     limpiaprecio;
     navegador.Enabled:=true;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos del Paquete Actual';
     btnmodificar.ImageIndex:=2;
     if chkAplicaDesc.Checked then
           tblarticulos.FieldByName('aplica_desc').AsInteger :=1
       else
           tblarticulos.FieldByName('aplica_desc').AsInteger:=0;

     frmprincipal.ucprincipal.Log('Edito el Paquete'+tblarticulosnombre.AsString,2);
     tblarticulos.Post;
     querys('delete from art_compuestosTemp where idmaq = '+frmprincipal.idmaq,1,sqlgeneral);
     edbuscar.Enabled:=true;
     btnmodificar.Enabled:=true;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     gbfinancieros.Enabled:=false;
     gbdatos.Enabled:=false;
     edclave.Enabled:=true;
     navegador.Enabled:=true;
     gbarticulo.Enabled:=false;
     chkAplicaDesc.Enabled:=FALSE;
     rejilla.Enabled:=false;
     end;

end;

procedure Tfrmart_comp.btnborrarClick(Sender: TObject);
begin
if application.MessageBox('Deseas borrar este paquete del sistema?','Confirmación',mb_yesno+mb_iconwarning) = idyes then begin
     querys('delete from art_compuestos where cod_paq='+quotedstr(edclave.text),1,sqlgeneral);
     tblarticulos.Delete;
     frmprincipal.ucprincipal.Log('Dio de Baja el Paquete'+ednombre.text,3);
     querys('select cod_cve from articulos',0,sqlgeneral);
     limpiaprecio;
     edbuscar.Text:='';
     if sqlgeneral.RecordCount = 0 then
     begin
        btnmodificar.Enabled:=false;
        btnborrar.Enabled:=false;
        tblarticulos.Active:=false;
     end;
end;
end;

procedure Tfrmart_comp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmart_comp.edbuscarButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl]);

end;

procedure Tfrmart_comp.edcostoExit(Sender: TObject);
begin
 if btnmodificar.Caption='&Guardar' then
    CalculaIva
 else
   begin
costo:=QuitaCaracteres(edcosto.Text,'$');
iva:=QuitaCaracteres(ediva.Text,'%');
if costo > 0 then
   begin
     gbutilidades.Enabled:=true;
     chkAplicaDesc.Enabled:=true;
    end
else
  begin
   gbutilidades.Enabled:=false;
   chkAplicaDesc.Enabled:=false;
  end;
end;
    edutila.OnExit(self);
    edutilb.OnExit(self);
    edutilc.OnExit(self);
    edutild.OnExit(self);
end;

procedure Tfrmart_comp.edcostoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    ediva.SetFocus;


  end;
end;

procedure Tfrmart_comp.edcostoEnter(Sender: TObject);
begin
edcosto.selectall;
end;

procedure Tfrmart_comp.edivaEnter(Sender: TObject);
begin
ediva.SelectAll;
end;

procedure Tfrmart_comp.edivaExit(Sender: TObject);
begin
 if btnmodificar.Caption='&Guardar' then
    CalculaIva
 else
   begin
costo:=QuitaCaracteres(edcosto.Text,'$');
iva:=QuitaCaracteres(ediva.Text,'%');
if costo > 0 then
   begin
     gbutilidades.Enabled:=true;
     chkAplicaDesc.Enabled:=true;
    end
else
  begin
   gbutilidades.Enabled:=false;
   chkAplicaDesc.Enabled:=false;
  end;
end;
    edutila.OnExit(self);
    edutilb.OnExit(self);
    edutilc.OnExit(self);
    edutild.OnExit(self);
end;

procedure Tfrmart_comp.edivaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    ediva.OnExit(self);
    end;
end;

procedure Tfrmart_comp.edtinstalacionKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutila.SetFocus;
  end;
end;

procedure Tfrmart_comp.edutilaExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutila.Text,'%');
eddscto.Enabled:=true;
a:=(costo*(a/100))+costo;
precioa.text:=Format('%8.0f',[a]);
edPrecioconIvaa.Text:=Format('%8.0f',[(a*(iva/100))+a]);

end;

procedure Tfrmart_comp.edutilaKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutilb.SetFocus;
  end;
end;

procedure Tfrmart_comp.edutilbExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutilb.Text,'%');
a:=(costo*(a/100))+costo;
preciob.text:=Format('%8.0f',[a]);
edPrecioconIvab.Text:=Format('%8.0f',[(a*(iva/100))+a]);

end;

procedure Tfrmart_comp.edutilbKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutilc.SetFocus;
  end;
end;

procedure Tfrmart_comp.edutilcExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutilc.Text,'%');
a:=(costo*(a/100))+costo;
precioc.text:=Format('%8.0f',[a]);
edPrecioconIvac.Text:=Format('%8.0f',[(a*(iva/100))+a]);

end;

procedure Tfrmart_comp.edutilcKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    edutild.SetFocus;
  end;
end;

procedure Tfrmart_comp.edutildExit(Sender: TObject);
var a:double;
begin
a:=QuitaCaracteres(edutild.Text,'%');
a:=(costo*(a/100))+costo;
preciod.text:=Format('%8.0f',[a]);
edPrecioconIvad.Text:=Format('%8.0f',[(a*(iva/100))+a]);

end;

procedure Tfrmart_comp.edutildKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  begin
    key:=#0;
    eddscto.SetFocus;
  end;
end;

procedure Tfrmart_comp.eddsctoExit(Sender: TObject);
var a,b,pra,temp:double;
begin
if chkAplicaDesc.Checked = true then
  begin
  pra:=QuitaCaracteres(precioa.Text,'$');
  a:=QuitaCaracteres(eddscto.Text,'%');
  b:=QuitaCaracteres(edcosto.Text,'$');
  a:=pra-(pra*(a/100));
  edPrecioDscto.text:=floattostr(a);
  edPrecioDsctoIva.Text:=floattostr(a+(a*(iva/100)));
  temp:=b-a;

  if a < b then
    begin
    showmessage('Con ese descuento vas a tener una perdida en el paquete de: $'+ floattostr(temp));
    if (tblarticulos.State = dsinsert) or (tblarticulos.State = dsedit) then
      begin
      eddscto.SetFocus;
      tblarticulosdesc_esp.AsFloat:=0;
      end;
    end;
  end;
end;

procedure Tfrmart_comp.eddsctoKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
  begin
    key:=#0;
    if btnalta.Caption = '&Guardar' then
      btnalta.setfocus
    else
      btnmodificar.SetFocus;
  end;
end;

procedure Tfrmart_comp.edPrecioDsctoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmart_comp.edcodigoButtonClick(Sender: TObject);
begin
frmbuscaart.tblarticulos.FilterSQL:='paquete <> 1 order by cod_cve';
frmbuscaart.tblarticulos.Active:=true;
frmbuscaart.ShowModal;

     if frmbuscaart.cod_cve <> '' then
        begin
         edcodigo.Text:=frmbuscaart.cod_cve;
         ////se calcula el costo y el tiempo para cada elemento del articulo.
        if frmbuscaart.tblarticulos.FieldByName('piezasxunidad').AsInteger > 1 then
           chkpiezas.Enabled:=true
        else
           chkpiezas.Enabled:=false;


    if ValidaProducto(edcodigo.text) = 1 then
       begin
          edcantidad.Enabled:=true;
          edcantidad.SetFocus;
         // chkpiezas.Enabled:=true;
          btnagregar.Enabled:=true;
          edcodigo.Enabled:=false;
       end
    else
       begin
         edcodigo.Text:='';
         edcodigo.SetFocus;
       end;
       end;
frmbuscaart.tblarticulos.FilterSQL:='';
frmbuscaart.tblarticulos.Active:=false;
end;

procedure Tfrmart_comp.edcodigoEnter(Sender: TObject);
begin
if eddescripcion.Text = '' then
  edcantidad.Text:='1';
end;

procedure Tfrmart_comp.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin

if (key=#13)and(edcodigo.text <> '') then begin //if 1
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
   end;

end;

procedure Tfrmart_comp.edcantidadKeyPress(Sender: TObject; var Key: Char);
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
     if chkpiezas.enabled= false then
        chkpiezas.Checked:=false
     else begin
         if chkpiezas.checked then
            chkpiezas.Checked:=false
         else
            chkpiezas.Checked:=true;
     key:=#0;
     end//chkpiezas.enabled
   end;

if key = #27 then //SI PRESIONA LA TECLA ESC.....
   begin
     key:=#0;
     LimpiaDatArt;
     edcodigo.SetFocus;
   end;
end;




procedure Tfrmart_comp.btnagregarClick(Sender: TObject);
begin
      InsertaArticulo(sqlrejillaalta,'art_compuestos','cod_paq',edclave.Text);
      calcula_utilidad;
end;

procedure Tfrmart_comp.edclaveKeyPress(Sender: TObject; var Key: Char);
begin

if (key=#13)then begin
  if (edclave.Text<>'') then begin
      key:=#0;
      edcbarras.setfocus;
  end else begin
     showmessage('DEBE TENER UN CODIGO EL PAQUETE');
  end;
end;

end;

procedure Tfrmart_comp.edcbarrasKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmart_comp.RejillaDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin

if (rejilla.Enabled) and (key='+') then
    begin
      //incrementa en uno la cantidad de unidades o piezas que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and  (dsrejilla.DataSet.FieldValues['piezas'] = 0)  and(btnalta.Enabled) then
         begin
                querys('update art_compuestos set cant=cant+1 where piezas=0 and (cod_paq='+quotedstr(edclave.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+')',1,sqlgeneral);
                operacion;
                calcula_utilidad;
         end
      else
          if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and  (dsrejilla.DataSet.FieldValues['piezas'] = '0') and (btnalta.Enabled=false) then
             begin
                  querys('update art_compuestos set cant=cant+1 where piezas=0 and (cod_paq='+quotedstr(dsrejilla.DataSet.FieldValues['cod_paq'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+')',1,sqlgeneral);
                  operacion;
                  calcula_utilidad;
              end
          else
               if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') and  (dsrejilla.DataSet.FieldValues['cant'] ='0') and (btnalta.Enabled) then
                  begin
                       querys('update art_compuestos set piezas=piezas+1 where cant=0 and (cod_paq='+quotedstr(edclave.Text)+' and cod_cve='+dsrejilla.DataSet.FieldValues['cod_cve']+')',1,sqlgeneral);
                       operacion;
                       calcula_utilidad;
                   end
               else
                  if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') and  (dsrejilla.DataSet.FieldValues['cant'] ='0') and (btnalta.Enabled=false) then
                     begin
                          querys('update art_compuestos set piezas=piezas+1 where cant=0 and (cod_paq='+quotedstr(dsrejilla.DataSet.FieldValues['cod_paq'])+' and cod_cve='+dsrejilla.DataSet.FieldValues['cod_cve']+')',1,sqlgeneral);
                          operacion;
                          calcula_utilidad;
                     end;
end;

if (rejilla.Enabled) and (key='-') then
    begin
      //decrementa en uno la cantidad de unidades o piezas que se halla cotizado
      if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and  (dsrejilla.DataSet.FieldValues['piezas'] = '0') and (btnalta.Enabled) then
         begin
                querys('update art_compuestos set cant=cant-1 where piezas =0 and (cod_paq='+quotedstr(edclave.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+')',1,sqlgeneral);
                operacion;
                calcula_utilidad;
         end
      else
          if (dsrejilla.DataSet.FieldValues['cant'] <> '0') and  (dsrejilla.DataSet.FieldValues['piezas'] = '0') and (btnalta.Enabled=false) then
             begin
                  querys('update art_compuestos set cant=cant-1 where piezas=0 and (cod_paq='+quotedstr(dsrejilla.DataSet.FieldValues['cod_paq'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+')',1,sqlgeneral);
                  operacion;
                  calcula_utilidad;
             end
          else
               if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') and (dsrejilla.DataSet.FieldValues['cant'] = '0') and (btnalta.Enabled) then
                  begin
                       querys('update art_compuestos set piezas=piezas-1 where cant=0 and (cod_paq='+quotedstr(edclave.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+')',1,sqlgeneral);
                       operacion;
                       calcula_utilidad;
                  end
               else
                  if (dsrejilla.DataSet.FieldValues['piezas'] <> '0') and (dsrejilla.DataSet.FieldValues['cant'] = '0')and (btnalta.Enabled=false) then
                     begin
                          querys('update art_compuestos set piezas=piezas-1 where cant=0 and (cod_paq='+quotedstr(dsrejilla.DataSet.FieldValues['cod_paq'])+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+')',1,sqlgeneral);
                          operacion;
                          calcula_utilidad;
                     end;
                                                                                                                                            sleep(1000);
            //borrar los registros que no tengan valores en cantidad y piezas.........
            querys('delete from art_compuestos where cant=0 and piezas=0 and cod_paq='+quotedstr(edclave.Text),1,sqlgeneral);
end;

//cerrar y abrir la consulta,

      SqlRejillaAlta.Close;
      SqlRejillaAlta.Open;
      if SqlRejillaAlta.RecordCount = 0 then begin
            rejilla.Enabled:=false;
            edtinstalacion.Text:='0';
            edcosto.Text:='$0';
      end;


end;

procedure Tfrmart_comp.FormShow(Sender: TObject);
begin
edbuscar.SetFocus;
end;

procedure Tfrmart_comp.RejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key=46) and (rejilla.Enabled) then
  begin

      if (dsrejilla.DataSet.FieldValues['cant'] <> '0') then begin
             querys('delete from art_compuestos where piezas=0 and cod_paq='+quotedstr(edclave.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
             operacion;

      end else begin
            //elimina el registro del articulo
            querys('delete from art_compuestos where cant=0 and cod_paq='+quotedstr(edclave.Text)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve']),1,SqlGeneral);
            operacion;
      end;

     calcula_utilidad;
     //refresca la rejilla de datos
     sqlrejillaalta.Close;
     sqlrejillaalta.Open;
     if SqlRejillaAlta.RecordCount = 0 then begin
            rejilla.Enabled:=false;
            edtinstalacion.Text:='0';
            edcosto.Text:='$0';
      end;

  end;

end;

procedure Tfrmart_comp.eddescripKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     edcodigo.setfocus;
  end;
end;

procedure Tfrmart_comp.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13)  then
   begin
     key:=#0;
     if edbuscar.Text <> '' then
        buscarlocate
     else
        //edclave.OnButtonClick(self);
     edbuscar.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edbuscar.Text:='';
  end;   
end;

procedure Tfrmart_comp.RejillaDBTableView1DblClick(Sender: TObject);
begin
   ModificaArticulo(SqlRejillaAlta,'art_compuestos','cod_paq',edclave.Text);
end;

procedure Tfrmart_comp.ModificaArticulo(query:tMyQuery;tabla,campo,valor:string);
begin
if dsrejilla.DataSet.RecordCount > 0 then
  begin
    edcodigo.Text:=dsrejilla.DataSet.FieldValues['cod_cve'];
    eddescripcion.Text:=dsrejilla.DataSet.FieldValues['nombre'];
    EdCosto_unidad.Text:=dsrejilla.DataSet.FieldValues['precioa'];
    edtinsta.Text:=dsrejilla.DataSet.FieldValues['tiempo'];

    if dsrejilla.DataSet.FieldValues['cant'] > 0 then
       edcantidad.Text:=dsrejilla.DataSet.FieldValues['cant']
    else
    begin
        edcantidad.Text:=dsrejilla.DataSet.FieldValues['piezas'];
        chkpiezas.Checked:=true;
    end;

     //elimina el registro del articulo
     querys('delete from '+tabla+' where '+campo+'='+quotedstr(valor)+' and cod_cve='+quotedstr(dsrejilla.DataSet.FieldValues['cod_cve'])+' and cant='+quotedstr(dsrejilla.DataSet.FieldValues['cant'])+' and piezas='+quotedstr(dsrejilla.DataSet.FieldValues['piezas']),1,SqlGeneral);
     //refresca la rejilla de datos
     query.Close;
     query.ParamByName('id').asstring:=valor;
     query.Open;
     dsrejilla.DataSet:=query;
     btnagregar.Enabled:=true;
     edcodigo.Enabled:=false;
     edcantidad.Enabled:=true;
     edcantidad.SetFocus;
  end;
end;


procedure Tfrmart_comp.edcantidadChange(Sender: TObject);
begin
if edcantidad.Text = ''  then
  btnagregar.Enabled:=false
else
  btnagregar.Enabled:=true;
end;

procedure Tfrmart_comp.btnfuentesClick(Sender: TObject);
begin
 FontDialog1.Font := eddescrip.Font;
  if FontDialog1.Execute then
    eddescrip.SelAttributes.Assign(FontDialog1.Font);
end;

procedure Tfrmart_comp.eddescKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     edcodigo.setfocus;
  end;
end;

procedure Tfrmart_comp.eddescripEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmart_comp.eddescripExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmart_comp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if (btnalta.Caption='&Guardar') or (btnmodificar.Caption='&Guardar') then begin
showmessage('No has guardado los datos, si deseas salir oprime el boton cancelar');
//            if application.MessageBox('No has guardado los datos, deseas salir sin guardar?','Confirmación', mb_yesno+mb_iconwarning) = idno then
               canclose:=false;

end;//botones

end;

procedure Tfrmart_comp.edbuscarChange(Sender: TObject);
begin
if edbuscar.Text = '' then begin
   tblarticulos.Close;
   SqlRejillaAlta.Close;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   end;
   
end;

procedure Tfrmart_comp.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  SqlRejillaAlta.Close;
  SqlRejillaAlta.ParamByName('id').AsString:=edclave.text;
  SqlRejillaAlta.Open;
  edbuscar.Text:=tblarticulos.fieldbyname('cod_cve').AsString;
  lbufh.Caption := UFH(tblarticulos);
end;

procedure Tfrmart_comp.precioaExit(Sender: TObject);
begin
precioa.text := Format('%8.2f',[precioa.text]);
edutila.text := Format('%8.2f',[((quitacaracteres(precioa.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
edPrecioconIvaa.Text:=Format('%8.2f',[(quitacaracteres(precioa.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(precioa.text)]);
end;

procedure Tfrmart_comp.preciobExit(Sender: TObject);
begin
preciob.text := Format('%8.2f',[preciob.text]);
edutilb.text := Format('%8.2f',[((quitacaracteres(preciob.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
edPrecioconIvab.Text:=Format('%8.2f',[(quitacaracteres(preciob.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(preciob.text)]);
end;

procedure Tfrmart_comp.preciocExit(Sender: TObject);
begin
precioc.text := Format('%8.2f',[precioc.text]);
edutilc.text := Format('%8.2f',[((quitacaracteres(precioc.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
edPrecioconIvac.Text:=Format('%8.2f',[(quitacaracteres(precioc.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(precioc.text)]);
end;

procedure Tfrmart_comp.preciodExit(Sender: TObject);
begin
preciod.text := Format('%8.2f',[preciod.text]);
edutild.text := Format('%8.2f',[((quitacaracteres(preciod.text, ',')-strtofloat(edcosto.text))/strtofloat(edcosto.text))*100]);
edPrecioconIvad.Text:=Format('%8.2f',[(quitacaracteres(preciod.text, ',')*(strtofloat(ediva.text)/100))+strtofloat(preciod.text)]);
end;

procedure Tfrmart_comp.tblarticulosAfterPost(DataSet: TDataSet);
  var zh:string;
begin
querys('Select valor from configuraciones where concepto = "ZonaHoraria"', 0, sqlgeneral);
zh := sqlgeneral.FieldByName('valor').Asstring;
querys('update articulos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where cod_cve='+quotedstr(edclave.Text),1,sqlgeneral);
querys('update art_compuestos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where cod_paq='+quotedstr(edclave.Text),1,sqlgeneral);
end;

end.
