unit UFactoresIndividuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAccess, DB, MemDS, DBAccess, RzDBBnEd, StdCtrls, Mask, RzEdit,
  RzDBEdit, RzButton, ExtCtrls, DBCtrls, RzDBNav, RzLabel, RzBtnEdt;

type
  TfrmFactoresIndividuales = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    DSFactores: TDataSource;
    tblfactores: TMyTable;
    sqlgeneral: TMyQuery;
    edclave: TRzButtonEdit;
    tblfactoresidfactor: TIntegerField;
    tblfactoresnombre: TStringField;
    tblfactoresusuario: TStringField;
    tblfactoresfecha: TStringField;
    tblfactoreshora: TStringField;
    RzLabel3: TRzLabel;
    eddescripcion: TRzDBEdit;
    tblfactoresdescripcion: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblfactoresBeforePost(DataSet: TDataSet);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
  private
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFactoresIndividuales: TfrmFactoresIndividuales;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure TfrmFactoresIndividuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmFactoresIndividuales.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblfactores,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmFactoresIndividuales.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idfactor,nombre, usuario as Usuario,fecha as Fecha,hora as Hora From Factores_Individuales order by idfactor';
        campo_retorno:='idfactor';
        campo_busqueda:='nombre';
        tblorigen := 'Factores_Individuales';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblfactores.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmFactoresIndividuales.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure TfrmFactoresIndividuales.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmFactoresIndividuales.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblfactores.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmFactoresIndividuales.edclaveKeyPress(Sender: TObject;
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

procedure TfrmFactoresIndividuales.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   edclave.text:= DSFactores.dataset.fieldbyname('idfactor').AsString;
end;

procedure TfrmFactoresIndividuales.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmFactoresIndividuales.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idfactor)from Factores_Individuales',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblfactores.Active:=true;
    tblfactores.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from Factores_Individuales where idfactor<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Factores_Individuales';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Factores_Individuales '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idfactor) from Factores_Individuales',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger +1 );
     //guarda los datos
     tblfactores.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update Factores_Individuales set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idfactor='+edclave.Text,1,sqlgeneral);
     tblfactores.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmFactoresIndividuales.btnborrarClick(Sender: TObject);
begin
 //valida que no se use en la tabla de travel
  querys('select idfactor from DescPuntxFactor where idfactor='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Ese Factor Individual esta siendo usado por una Descripcion de Puntuacion por Factor y no podra ser eliminada hasta que se borre la descripcion o haga referencia a otro Factor Individual!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esta Factor Individual?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino el Factor Individual'+tblfactoresnombre.asstring,3);
        tblfactores.Delete;
        application.MessageBox('Eliminacion del Factor Individual Exitosa','Información',mb_ok);
        tblfactores.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblfactores.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmFactoresIndividuales.btnmodificarClick(Sender: TObject);
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
     tblfactores.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from Factores_Individuales where idfactor<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Factor Individual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el Factor Individuales '+tblfactoresnombre.AsString,2);
     tblfactores.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update Factores_Individuales set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idfactor='+edclave.Text,1,sqlgeneral);
     tblfactores.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmFactoresIndividuales.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblfactores.Cancel;
     tblfactores.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Factor Individual Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Factor Individual';
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

procedure TfrmFactoresIndividuales.tblfactoresBeforePost(
  DataSet: TDataSet);
begin
tblfactoresidfactor.AsString:=edclave.Text;
end;

procedure TfrmFactoresIndividuales.buscarlocate;
begin
tblfactores.Active:=true;
if tblfactores.Locate('idfactor',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Factor Individual no Existe','Información',mb_ok+mb_iconinformation);
    tblfactores.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmFactoresIndividuales.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
eddescripcion.Enabled := hab;
end;

procedure TfrmFactoresIndividuales.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(eddescripcion.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end
end;

End.
