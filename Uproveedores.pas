unit Uproveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DB, MyAccess, Menus, MemDS, DBAccess, Grids,        
  DBGrids, Mask, StdCtrls, RzCmboBx, RzDBEdit, RzButton, RzEdit, RzLabel,
  RzDBCmbo, UCBase, LMDCustomComponent, LMDWndProcComponent,
  LMDMouseBaseCtrl, LMDMouseFencer, DBCtrls, ComCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit,
  cxMaskEdit, RzTabs, RzDBNav, RzBtnEdt, RzRadChk, RzDBChk, ToolWin;

type                                  
  Tfrmproveedores = class(TForm)
    DSproveedores: TDataSource;
    sqlgeneral: TMyQuery;
    tblproveedores: TMyTable;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    gbproveedores: TGroupBox;
    RzLabel2: TRzLabel;
    lblcp: TRzLabel;
    lblcalle: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblalta: TRzLabel;
    lblamaterno: TRzLabel;
    lblapaterno: TRzLabel;
    lblplazo: TRzLabel;
    lbliva: TRzLabel;
    lblrazon: TRzLabel;
    lblcomentarios: TRzLabel;
    lblnombre: TRzLabel;
    RzLabel1: TRzLabel;
    edciudad: TRzDBEdit;
    edcalle: TRzDBEdit;
    edestado: TRzDBEdit;
    dtalta: TRzDBDateTimeEdit;
    edamaterno: TRzDBEdit;
    edapaterno: TRzDBEdit;
    ednombre: TRzDBEdit;
    edrazon: TRzDBEdit;
    mmcomentario: TRzDBRichEdit;
    ednumero: TRzDBEdit;
    eddias_cred: TRzDBEdit;
    ediva: TRzDBEdit;
    edmskrfc: TcxDBMaskEdit;
    navegador: TRzDBNavigator;
    lblclave: TRzLabel;
    btntelefonos: TRzBitBtn;
    btncontactos: TRzBitBtn;
    edd_entrega: TRzDBEdit;
    eddias_entrega: TRzLabel;
    edmskcurp: TcxDBMaskEdit;
    lblcurp: TRzLabel;
    LBcolonias: TRzDBLookupComboBox;
    DScolonias: TDataSource;
    SQLcolonias: TMyQuery;
    edcp: TRzDBEdit;
    edclave: TRzButtonEdit;
    edcredito: TRzDBNumericEdit;
    RzLabel3: TRzLabel;
    lblestatus: TRzLabel;
    tblproveedoresidprov: TIntegerField;
    tblproveedoresrsocial: TStringField;
    tblproveedoresnombre: TStringField;
    tblproveedoresapaterno: TStringField;
    tblproveedoresamaterno: TStringField;
    tblproveedoresrfc: TStringField;
    tblproveedorescalle: TStringField;
    tblproveedoresidcol: TStringField;
    tblproveedoresciudad: TStringField;
    tblproveedoresestado: TStringField;
    tblproveedoresnumero: TIntegerField;
    tblproveedorescp: TStringField;
    tblproveedoresfax: TStringField;
    tblproveedoresemail: TStringField;
    tblproveedoresidcontacto: TIntegerField;
    tblproveedoresidtel: TIntegerField;
    tblproveedoresdias_cred: TIntegerField;
    tblproveedoresiva: TFloatField;
    tblproveedorescant_provd: TFloatField;
    tblproveedorescant_provp: TFloatField;
    tblproveedoresdebo_v: TFloatField;
    tblproveedoresdebo_p: TFloatField;
    tblproveedoresultima: TDateTimeField;
    tblproveedorescomentario: TMemoField;
    tblproveedoresnpedido: TIntegerField;
    tblproveedorestransfer: TStringField;
    tblproveedoresctacont: TStringField;
    tblproveedoresdistribcom: TStringField;
    tblproveedoresdistribabo: TStringField;
    tblproveedoresalta: TDateField;
    tblproveedoresusuario: TStringField;
    tblproveedoresfecha: TStringField;
    tblproveedoreshora: TStringField;
    tblproveedoresdias_entrega: TIntegerField;
    tblproveedorescurp: TStringField;
    tblproveedorescredito: TFloatField;
    SQLcoloniasnombre: TStringField;
    SQLcoloniasidcol: TIntegerField;
    SQLcoloniascp: TIntegerField;
    SQLcoloniasidsector: TSmallintField;
    cboestatus: TRzComboBox;
    tblproveedoresestatus: TBooleanField;
    tblproveedoresdeducible: TIntegerField;
    RzDBCheckBox1: TRzDBCheckBox;
    edemail: TRzDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbnacional: TRzDBComboBox;
    tblproveedoresnacional: TStringField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btntelefonosClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure dtaltaClick(Sender: TObject);
    procedure edciudadEnter(Sender: TObject);
    procedure edestadoEnter(Sender: TObject);
    procedure dtaltaEnter(Sender: TObject);
    procedure edamaternoKeyPress(Sender: TObject; var Key: Char);
    procedure btncontactosClick(Sender: TObject);
    procedure edrazonChange(Sender: TObject);
    procedure edmskrfcKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SQLcoloniasAfterScroll(DataSet: TDataSet);
    procedure edclaveButtonClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure dtaltaExit(Sender: TObject);
    procedure tblproveedoresAfterScroll(DataSet: TDataSet);
    procedure tblproveedoresAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
    idtelefono:string;
    procedure trae_datos(Sender: TObject);
    procedure limpia_combos(Sender: TObject);
    procedure buscarlocate;
  public
    { Public declarations }
  end;

var
  frmproveedores: Tfrmproveedores;
  tecla:char;
implementation

uses Udm, Uprincipal, Ubusquedas, Uasig_eve_vend, Ucontactos, Urecursos,
  Utel, Urelacionborrar;

{$R *.dfm}

procedure Tfrmproveedores.buscarlocate;
begin
tblproveedores.Active:=true;
if tblproveedores.Locate('idprov',edclave.Text,[]) then
   begin
    sqlcolonias.Active:=true;
    trae_datos(self);
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblproveedores);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Proveedor no Existe','Información',mb_ok+mb_iconinformation);
    tblproveedores.Active:=false;
    limpia_combos(self);
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;


procedure tfrmproveedores.limpia_combos(Sender: TObject);
begin
edestado.Text:='';
ednombre.Text:='';
edapaterno.Text:='';
edamaterno.Text:='';
edcalle.Text:='';
ednumero.Text:='';
edciudad.Text:='';
edcp.Text:='';
idtelefono:='';
end;

procedure Tfrmproveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmproveedores.FormCreate(Sender: TObject);
begin
trae_datos(self);
//gbproveedores.Enabled:=true;
end;

procedure tfrmproveedores.trae_datos(Sender: TObject);
begin
     edclave.Text:=inttostr(tblproveedoresidprov.AsInteger);
      edcp.Text:=tblproveedorescp.AsString;
end;

procedure Tfrmproveedores.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
   navegador.Enabled:=false;
      //pone la tabla de proveedores en modo de insercion
   tblproveedores.Active:=true;
   sqlcolonias.Active:=true;
   tblproveedores.insert;
    //trae el maximo idproveedor + 1
    querys('select max(idprov) as idprov from proveedores',0,sqlgeneral);

    if sqlgeneral.Fields.Fields[0].AsString = '' then
      edclave.Text:='1'
    else
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].asinteger + 1);

    edclave.Enabled:=false;
   dtalta.Date:=date;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   gbproveedores.Enabled:=true;
   limpia_combos(self);
   dtalta.Date:=date;
   dtalta.Text:=datetostr(date);
   cboestatus.itemindex:=1;
   lbufh.Caption := '';
    edrazon.SetFocus;
   end
   else
   begin
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta a un Proveedor';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     navegador.Enabled:=true;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     gbproveedores.Enabled:=false;
     if cboestatus.ItemIndex = 1 then
       tblproveedoresestatus.AsBoolean:=true
     else
       tblproveedoresestatus.AsBoolean:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta al proveedor '+ednombre.text,1);
       //trae el maximo idprov + 1
       querys('select max(idprov) as idprov from proveedores',0,sqlgeneral);
       tblproveedoresidprov.asinteger:=(sqlgeneral.Fields.Fields[0].Asinteger + 1);
        tblproveedores.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update proveedores set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idprov='+edclave.Text,1,sqlgeneral);
       tblproveedores.Active:=false;
        edclave.Text:='';
        edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       querys('delete from proveedores where idprov=0',1,sqlgeneral);
          sqlcolonias.Active:=false;
           end;

end;

procedure Tfrmproveedores.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  btntelefonos.Visible:=false;
  btncontactos.Visible:=false;
  if btnalta.Caption='&Guardar' then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta a un Proveedor';
    btnalta.ImageIndex:=5;
    querys('delete from proveedores where idprov='+edclave.Text,1,sqlgeneral);
    edclave.Text:='';
    end;

  tblproveedores.Cancel;
  tblproveedores.Active:=false;
  limpia_combos(self);
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del Proveedor Actual';
    btnmodificar.ImageIndex:=2;
    end;

  gbproveedores.Enabled:=false;
  edclave.Enabled:=true;
  edclave.Text:='';
  lbufh.Caption := '';
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edclave.SetFocus;
  end
else
  close;

end;

procedure Tfrmproveedores.FormShow(Sender: TObject);
begin
btntelefonos.Visible:=false;
btncontactos.Visible:=false;
btnborrar.Enabled:=false;
btnmodificar.Enabled:=false;
edclave.Text:='';
edclave.SetFocus;
end;

procedure Tfrmproveedores.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
   btntelefonos.Visible:=true;
   btncontactos.Visible:=true;
   frmprincipal.ucprincipal.Log('Dio click en el boton editar de proveedores',0);
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     navegador.Enabled:=false;
     //btnbuscar.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     gbproveedores.Enabled:=true;
     idtelefono:='';
     edclave.Enabled:=false;
     tblproveedores.Edit;
     sqlcolonias.Active:=true;
     if edrazon.text <> '' then
        edrazon.setfocus
     else
        ednombre.setfocus;
   end
else
  begin
     navegador.Enabled:=true;
     btntelefonos.Visible:=false;
     btncontactos.Visible:=false;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos del Proveedor Actual';
     btnmodificar.ImageIndex:=2;
     gbproveedores.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     if cboestatus.ItemIndex = 1 then
       tblproveedoresestatus.AsBoolean:=true
     else
       tblproveedoresestatus.AsBoolean:=false;


     frmprincipal.ucprincipal.Log('Edito el Proveedor'+tblproveedoresnombre.AsString,2);
     tblproveedores.Post;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
         limpia_combos(self);
      btnmodificar.Enabled:=false;
      btnborrar.Enabled:=false;
      tblproveedores.Active:=false;
      edclave.Text:='';
      edclave.SetFocus;
      sqlcolonias.Active:=false;
     end;

end;

procedure Tfrmproveedores.btntelefonosClick(Sender: TObject);
begin
     frmtel.inicializa(strtoint(edclave.text),tblproveedoresidtel.AsInteger,0,'proveedores','idprov', false);
     frmtel.showmodal;
     tblproveedores.Post;
     tblproveedores.Refresh;
     tblproveedores.Edit;

end;

procedure Tfrmproveedores.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) and (gbproveedores.Enabled=false) then
    begin
       frmbusquedas.query:='Select idprov,if(rsocial is null or rsocial = '''',concat(ifnull(nombre,'''' ),'' '',ifnull(apaterno,'''' ),'' '',ifnull(amaterno,'''')),rsocial) as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From proveedores order by idprov';
       frmbusquedas.campo_retorno:='idprov';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tblorigen := 'proveedores';
       frmbusquedas.tabla:='proveedores';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(self);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblproveedores.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;

end;

procedure Tfrmproveedores.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblproveedores.Active:=true;
if tblproveedores.Locate('idprov',edclave.Text,[]) then
   begin
    sqlcolonias.Active:=true;
    trae_datos(self);
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Proveedor no Existe','Información',mb_ok+mb_iconinformation);
    tblproveedores.Active:=false;
    limpia_combos(self);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmproveedores.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
querys('select idcompra as IdCompra,usuario as Usuario,fecha as Fecha,hora as hora from compras where idprov='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este proveedor tiene relación con una compra, no puede ser borrado!','Cuidado',mb_ok+mb_iconinformation)
else
if application.MessageBox('Estas Seguro que deseas borrar este Proveedor, se perderan sus telefonos y contactos?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el  '+tblproveedoresnombre.asstring,3);
      if tblproveedoresidtel.AsString <> '' then
      //elimina los telefonos de la tabla de telefonos
      querys('delete from telefonos where idtel='+tblproveedoresidtel.AsString,1,sqlgeneral);
      if tblproveedoresidcontacto.AsString <> '' then
      //elimina los contactos de la tabla de contactos
      querys('delete from contactos where idcontacto='+tblproveedoresidcontacto.AsString,1,sqlgeneral);
      tblproveedores.Delete;
      application.MessageBox('Eliminación del Proveedor Exitosa','Información',mb_ok);
      tblproveedores.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblproveedores.Active:=false;
      limpia_combos(self);
      edclave.Text:='';
      edclave.SetFocus;
   end;
//end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmproveedores.dtaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   begin
     dtalta.Date:=date;
     dtalta.Text:=datetostr(date);
   end;
end;

procedure Tfrmproveedores.edciudadEnter(Sender: TObject);
begin
if edciudad.Text='' then
  begin
   querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
  edciudad.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure Tfrmproveedores.edestadoEnter(Sender: TObject);
begin
if edestado.Text='' then
  begin
   querys('Select valor from configuraciones where concepto = "estado"', 0, sqlgeneral);
  edestado.Text:=sqlgeneral.fieldbyname('valor').AsString;
  end;
end;

procedure Tfrmproveedores.dtaltaEnter(Sender: TObject);
begin
if btnalta.Caption='&Guardar' then
   dtalta.Date:=date;
end;

procedure Tfrmproveedores.edamaternoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
{  begin
     key:=#0;
     querys('SELECT * FROM PROVEEDORES WHERE proveedores.nombre ='+quotedstr(ednombre.Text)+' AND proveedores.apaterno = '+quotedstr(edapaterno.Text)+' AND proveedores.amaterno = '+quotedstr(edamaterno.Text),0,self);
if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox('Ya se encuentra un Proveedor registrado bajo ese nombre, Se cargaran sus datos.','Aviso',mb_iconinformation);
     edclave.Text:=sqlgeneral.fieldbyname('account').AsString;
     edcalle.Text:=sqlgeneral.fieldbyname('dir').AsString;
     ednumero.Text:=sqlgeneral.fieldbyname('numero').AsString;
   end
else}
    edcalle.SetFocus;

end;

procedure Tfrmproveedores.btncontactosClick(Sender: TObject);
begin
     frmcontacto.inicializa(strtoint(edclave.Text),tblproveedoresidcontacto.AsInteger,'proveedores','idprov');
     frmcontacto.ShowModal;
     tblproveedores.Post;
     tblproveedores.Refresh;
     tblproveedores.Edit;
end;

procedure Tfrmproveedores.edrazonChange(Sender: TObject);
begin
if edrazon.Text <> '' then
   begin
     ednombre.Enabled:=false;
     edapaterno.Enabled:=false;
     edamaterno.Enabled:=false;
     ednombre.Text:='';
     edapaterno.Text:='';
     edamaterno.Text:='';
   end
else
  begin
    ednombre.Enabled:=true;
    edapaterno.Enabled:=true;
    edamaterno.Enabled:=true;
  end;
end;

procedure Tfrmproveedores.edmskrfcKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmproveedores.ednombreChange(Sender: TObject);
begin
if (ednombre.Text<>'') or (edapaterno.Text<>'') or (edamaterno.Text<>'') then
   begin
     edrazon.Enabled:=false;
     edrazon.Text:='';
     ednombre.Enabled:=true;
     edapaterno.Enabled:=true;
     edamaterno.Enabled:=true;
   end
else
  edrazon.Enabled:=true;
end;

procedure Tfrmproveedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblproveedores,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmproveedores.SQLcoloniasAfterScroll(DataSet: TDataSet);
begin
IF (TBLproveedores.State = dsEdit)  or (TBLproveedores.State = dsinsert) then
begin
edcp.Text:=sqlcolonias.fieldbyname('cp').AsString;
//edsector.Text:=sqlcolonias.Fields.Fields[4].AsString;
end;
end;

procedure Tfrmproveedores.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
{if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblproveedores.Active:=true;
if tblproveedores.Locate('idprov',edclave.Text,[]) then
   begin
    sqlcolonias.Active:=true;
    trae_datos(self);
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clave de Proveedor no Existe','Información',mb_ok+mb_iconinformation);
    tblproveedores.Active:=false;
    limpia_combos(self);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;}

end;

procedure Tfrmproveedores.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=tblproveedoresidprov.AsString;
lbufh.Caption := UFH(tblproveedores);
end;

procedure Tfrmproveedores.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     key:=#0;

     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);

        //edclave.OnButtonClick(self);
  end;


     if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
  end;

procedure Tfrmproveedores.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin

   tblproveedores.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
   end;
end;

procedure Tfrmproveedores.dtaltaExit(Sender: TObject);
begin
cboestatus.ItemIndex:=1;
end;

procedure Tfrmproveedores.tblproveedoresAfterScroll(DataSet: TDataSet);
begin
if   tblproveedoresestatus.AsBoolean=false then
      cboestatus.ItemIndex:=0
else
      if  tblproveedoresestatus.AsBoolean=true then
           cboestatus.ItemIndex:=1
      else
           cboestatus.ItemIndex:=-1;
end;

procedure Tfrmproveedores.tblproveedoresAfterClose(DataSet: TDataSet);
begin
      cboestatus.itemindex:=-1;
end;

end.
