{///////////////////////////////////////////////////////////////////////////////
Creado por Dalila Robledo
Modificado  Dalila 2007/10/04

2007/10/04 En la busqueda agruegue com, inst y parc 
}///////////////////////////////////////////////////////////////////////////////

unit UunidadNegocio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzButton, ExtCtrls, DBCtrls,
  RzDBNav, RzDBEdit, RzRadChk, RzDBChk, StdCtrls, RzLabel, Mask, RzEdit,
  RzBtnEdt;

type
  TfrmUnidadNegocio = class(TForm)
    edclave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    tblUnidadNegocio: TMyTable;
    DSUnidadNegocio: TDataSource;
    tblUnidadNegocioidUnidadNegocio: TIntegerField;
    tblUnidadNegocionombre: TStringField;
    tblUnidadNegocioinstalacion: TSmallintField;
    tblUnidadNegociocomisiones: TIntegerField;
    tblUnidadNegociousuario: TStringField;
    tblUnidadNegociofecha: TStringField;
    tblUnidadNegociohora: TStringField;
    cbparcializar: TRzDBCheckBox;
    tblUnidadNegocioparcializar: TSmallintField;
    cbcomisiones: TRzDBCheckBox;
    cbinstalaciones: TRzDBCheckBox;
    RzLabel3: TRzLabel;
    eddescripcion: TRzDBEdit;
    tblUnidadNegocioDescripcion: TStringField;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure tblUnidadNegocioBeforePost(DataSet: TDataSet);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure cbinstalacionesKeyPress(Sender: TObject; var Key: Char);
    procedure cbcomisionesKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
  private
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnidadNegocio: TfrmUnidadNegocio;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Udmrep;

{$R *.dfm}

procedure TfrmUnidadNegocio.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure TfrmUnidadNegocio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmUnidadNegocio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblUnidadNegocio,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmUnidadNegocio.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idUnidadNegocio,nombre, if(comisiones =1, "SI", "NO") as comisiones, if(instalacion =1, "SI", "NO") as instalacion, if(parcializar =1, "SI", "NO") as parcializar From UnidadNegocio order by idUnidadNegocio';
        campo_retorno:='idUnidadNegocio';
        campo_busqueda:='nombre';
        tblorigen := 'UnidadNegocio';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblUnidadNegocio.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmUnidadNegocio.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmUnidadNegocio.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblUnidadNegocio.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    lbufh.Caption := '';
  end;
end;

procedure TfrmUnidadNegocio.edclaveKeyPress(Sender: TObject;
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



procedure TfrmUnidadNegocio.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmUnidadNegocio.cbinstalacionesKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmUnidadNegocio.cbcomisionesKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmUnidadNegocio.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   edclave.text:=DSUnidadNEgocio.dataset.fieldbyname('idUnidadNegocio').AsString;
   lbufh.Caption := UFH(tblUnidadNegocio);
end;

procedure TfrmUnidadNegocio.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idUnidadNegocio)from UnidadNegocio',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblUnidadNegocio.Active:=true;
    tblUnidadNegocio.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    lbufh.Caption := '';
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from UnidadNegocio where idUnidadNegocio<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una UnidadNegocio';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la UnidadNegocio '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idUnidadNegocio)+1 from UnidadNegocio',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger);
     //guarda los datos
     tblUnidadNegocio.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update UnidadNegocio set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idUnidadNegocio='+edclave.Text,1,sqlgeneral);
     tblUnidadNegocio.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmUnidadNegocio.btnborrarClick(Sender: TObject);
begin
 //valida que no se use en la tabla de travel
  querys('select idUnidadNegocio from pedidos where idUnidadNegocio='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta UnidadNegocio esta siendo usado por un Pedido y no podra ser eliminada hasta que se borre el Pedido o haga referencia a otra UnidadNegocio!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esta UnidadNegocio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la UnidadNegocio '+tblUnidadNegocionombre.asstring,3);
        tblUnidadNegocio.Delete;
        application.MessageBox('Eliminacion de la UnidadNegocio Exitosa','Información',mb_ok);
        tblUnidadNegocio.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblUnidadNegocio.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmUnidadNegocio.btnmodificarClick(Sender: TObject);
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
     tblUnidadNegocio.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from UnidadNegocio where idUnidadNegocio<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la UnidadNegocio actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la UnidadNegocio '+tblUnidadNegocionombre.AsString,2);
     bpcambios('UnidadNegocio', edclave.text, 'idunidadnegocio');
     tblUnidadNegocio.Post;
     apcambios('idunidadnegocio', edclave.Text, 'UnidadNegocio', 'frmUnidadNegocio');
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update UnidadNegocio set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idUnidadNegocio='+edclave.Text,1,sqlgeneral);
     tblUnidadNegocio.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmUnidadNegocio.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblUnidadNegocio.Cancel;
     tblUnidadNegocio.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la UnidadNegocio Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una UnidadNegocio';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
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

procedure TfrmUnidadNegocio.buscarlocate;
begin
tblUnidadNegocio.Active:=true;
if tblUnidadNegocio.Locate('idUnidadNegocio',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblUnidadNegocio);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa UnidadNegocio no Existe','Información',mb_ok+mb_iconinformation);
    tblUnidadNegocio.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmUnidadNegocio.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
eddescripcion.Enabled := hab;
cbcomisiones.Enabled := hab;
cbinstalaciones.Enabled := hab;
cbparcializar.Enabled := hab;
end;

procedure TfrmUnidadNegocio.tblUnidadNegocioBeforePost(DataSet: TDataSet);
begin
tblUnidadNegocioidUnidadNegocio.AsString:=edclave.Text;
end;

End.
