unit UConversionProtocolos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, RzLabel, RzButton, MemDS,
  DBAccess, MyAccess, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, DBCtrls, RzDBNav, RzDBEdit, Mask, RzEdit, RzBtnEdt, RzCmboBx;

type
  TfrmConversionProtocolos = class(TForm)
    dsconvertir: TDataSource;
    sqlgeneral: TMyQuery;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    cb4x2: TRzComboBox;
    cbsia: TRzComboBox;
    cbcid: TRzComboBox;
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    tblconvertir: TMyTable;
    tblconvertiridconversion: TIntegerField;
    tblconvertirnombre: TStringField;
    tblconvertirp4x2: TStringField;
    tblconvertirpsia: TStringField;
    tblconvertirpcontactid: TStringField;
    tblconvertirusuario: TStringField;
    tblconvertirfecha: TStringField;
    tblconvertirhora: TStringField;
    RzLabel6: TRzLabel;
    cbzon4x2: TRzComboBox;
    tblconvertirzonas4x2: TStringField;
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tblconvertirBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure habilita(hab:boolean);
    procedure buscarlocate;
    procedure llenacombos;
  public
    { Public declarations }
  end;

var
  frmConversionProtocolos: TfrmConversionProtocolos;

implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmConversionProtocolos.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmConversionProtocolos.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblconvertir.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    cbcid.text := '';
    cbsia.text := '';
    cb4x2.text := '';
    cbzon4x2.text := '';
  end;
end;

procedure TfrmConversionProtocolos.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=ValidaNumeros(key,true);
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
   end;

   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure TfrmConversionProtocolos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DSconvertir.dataset.fieldbyname('idconversion').AsString;
cb4x2.Text:=DSconvertir.dataset.fieldbyname('p4x2').AsString;
cbsia.Text:=DSconvertir.dataset.fieldbyname('psia').AsString;
cbcid.Text:=DSconvertir.dataset.fieldbyname('pcontactid').AsString;
cbzon4x2.text:=DSconvertir.dataset.fieldbyname('zonas4x2').AsString;
end;

procedure TfrmConversionProtocolos.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmConversionProtocolos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idconversion)from ConvertirZonas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblconvertir.Active:=true;
    tblconvertir.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    cbsia.text := '';
    cbcid.text := '';
    cb4x2.text := '';
    cbzon4x2.text := '';
    llenacombos;
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from ConvertirZonas where idconversion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una ConvertirZonas';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la ConvertirZonas '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idconversion) from ConvertirZonas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblconvertir.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update ConvertirZonas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idconversion='+edclave.Text,1,sqlgeneral);
     tblconvertir.Active:=false;
     habilita(false);
     cbcid.text := '';
     cbsia.text := '';
     cb4x2.text := '';
     cbzon4x2.text := '';
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmConversionProtocolos.btnborrarClick(Sender: TObject);
begin
 //valida que no se use en la tabla de travel
  querys('select idconversion from pedidos where idconversion='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta ConvertirZonas esta siendo usado por un Pedido y no podra ser eliminada hasta que se borre el Pedido o haga referencia a otra ConvertirZonas!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esta ConvertirZonas?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la ConvertirZonas '+tblconvertirnombre.asstring,3);
        tblconvertir.Delete;
        application.MessageBox('Eliminacion de la ConvertirZonas Exitosa','Información',mb_ok);
        tblconvertir.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblconvertir.Active:=false;
        cbcid.text := '';
        cbsia.text := '';
        cb4x2.text := '';
        cbzon4x2.text := '';
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmConversionProtocolos.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     habilita(true);
     edclave.Enabled:=false;
     tblconvertir.Edit;
     navegador.Enabled:=false;
     llenacombos;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from ConvertirZonas where idconversion<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la ConvertirZonas actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la ConvertirZonas '+tblconvertirnombre.AsString,2);
     bpcambios('ConvertirZonas', edclave.text, 'idconversion');
     tblconvertir.Post;
     apcambios('idconversion', edclave.Text, 'ConvertirZonas', 'frmConvertirZonas');
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update ConvertirZonas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idconversion='+edclave.Text,1,sqlgeneral);
     tblconvertir.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmConversionProtocolos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblconvertir.Cancel;
     tblconvertir.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la ConvertirZonas Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una ConvertirZonas';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       cbcid.text := '';
       cbsia.text := '';
       cb4x2.text := '';
       cbzon4x2.text := '';
       habilita(false);
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmConversionProtocolos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmConversionProtocolos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblconvertir,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmConversionProtocolos.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idconversion,nombre, usuario as Usuario,fecha as Fecha,hora as Hora From ConvertirZonas order by idconversion';
        campo_retorno:='idconversion';
        campo_busqueda:='nombre';
        tblorigen := 'ConvertirZonas';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblconvertir.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmConversionProtocolos.habilita(hab:boolean);
begin
cb4x2.enabled := hab;
cbsia.enabled := hab;
cbcid.enabled := hab;
cbzon4x2.enabled := hab;
ednombre.enabled := hab;
end;

procedure TfrmConversionProtocolos.buscarlocate;
begin
tblconvertir.Active:=true;
if tblconvertir.Locate('idconversion',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    cb4x2.Text:=DSconvertir.dataset.fieldbyname('p4x2').AsString;
    cbsia.Text:=DSconvertir.dataset.fieldbyname('psia').AsString;
    cbcid.Text:=DSconvertir.dataset.fieldbyname('pcontactid').AsString;
    cbzon4x2.text:=DSconvertir.dataset.fieldbyname('zonas4x2').AsString;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa ConvertirZonas no Existe','Información',mb_ok+mb_iconinformation);
    tblconvertir.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmConversionProtocolos.llenacombos;
begin
cargacombo2('select clave from alarmas_tipos where idprotocolo = 1 order by clave', 'clave', 'clave', cb4x2);
cargacombo2('select clave from alarmas_tipos where idprotocolo = 2 order by clave', 'clave', 'clave', cbsia);
cargacombo2('select clave from alarmas_tipos where idprotocolo = 3 order by clave', 'clave', 'clave', cbcid);
cargacombo2('select zona from zonas_protocolo where idprotocolo = 1 order by zona', 'zona', 'zona', cbzon4x2);
end;

procedure TfrmConversionProtocolos.tblconvertirBeforePost(
  DataSet: TDataSet);
begin
tblconvertiridconversion.AsString:=edclave.Text;
tblconvertirp4x2.AsString:=cb4x2.text;
tblconvertirpsia.AsString:=cbsia.text;
tblconvertirpcontactid.AsString:=cbcid.text;
tblconvertirzonas4x2.AsString:=cbzon4x2.text;
end;

End.
