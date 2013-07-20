unit UDescPuntFactor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, ExtCtrls, DBCtrls, RzDBNav,
  RzButton, StdCtrls, RzCmboBx, RzDBEdit, Mask, RzEdit, RzBtnEdt, RzLabel;

type
  TfrmDescripcionPuntuacion = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    cbfactor: TRzComboBox;
    cbcalificacion: TRzComboBox;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    sqlgeneral: TMyQuery;
    tblDPF: TMyTable;
    DSDPF: TDataSource;
    tblDPFiddpf: TIntegerField;
    tblDPFdescripcion: TStringField;
    tblDPFidcalificacion: TIntegerField;
    tblDPFidfactor: TIntegerField;
    tblDPFusuario: TStringField;
    tblDPFfecha: TStringField;
    tblDPFhora: TStringField;
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
    procedure cbfactorKeyPress(Sender: TObject; var Key: Char);
    procedure cbcalificacionKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblDPFBeforePost(DataSet: TDataSet);
    procedure cbfactorClick(Sender: TObject);
    procedure cbfactorNotInList(Sender: TObject);
    procedure cbcalificacionNotInList(Sender: TObject);
    procedure cbcalificacionClick(Sender: TObject);
    procedure cbfactorSelect(Sender: TObject);
    procedure cbcalificacionSelect(Sender: TObject);
  private
    nomfactor, nomcalif, idcalificacion, idfactor:string;
    procedure habilita(hab:boolean);
    procedure buscarlocate;
    procedure combofactor;
    procedure combocalificacion;
    procedure facnumtex;
    procedure calnumtex;
    procedure factexnum;
    procedure caltexnum;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDescripcionPuntuacion: TfrmDescripcionPuntuacion;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure TfrmDescripcionPuntuacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmDescripcionPuntuacion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblDPF,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmDescripcionPuntuacion.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idDPF, descripcion, usuario as Usuario,fecha as Fecha,hora as Hora From DescPuntxFactor order by idDPF';
        campo_retorno:='idDPF';
        campo_busqueda:='descripcion';
        tblorigen := 'DescPuntxFactor';
        lbldesc.Caption:='Busqueda por descripcion:';
        ShowModal;
        if resultado <> '' then
           begin
           cbfactor.text:= '';
           cbcalificacion.text:='';                
           tblDPF.Active:=true;
           edclave.Text:=resultado;  
           querys('Select * from DescPuntxFactor where idDPF='+quotedstr(edclave.text), 0, sqlgeneral);
           idcalificacion:=sqlgeneral.fieldbyname('idcalificacion').AsString;
           idfactor:=sqlgeneral.fieldbyname('idfactor').AsString;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmDescripcionPuntuacion.FormShow(Sender: TObject);
begin
edclave.SetFocus;
combofactor;
combocalificacion;
end;

procedure TfrmDescripcionPuntuacion.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmDescripcionPuntuacion.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblDPF.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    cbfactor.text:= '';
    cbcalificacion.text:='';
  end;
end;

procedure TfrmDescripcionPuntuacion.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=ValidaNumeros(key,true);
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        begin
        cbfactor.text:= '';
      cbcalificacion.text:='';
      querys('Select * from DescPuntxFactor where idDPF='+quotedstr(edclave.text), 0, sqlgeneral);
      idcalificacion:=sqlgeneral.fieldbyname('idcalificacion').AsString;
      idfactor:=sqlgeneral.fieldbyname('idfactor').AsString;
        buscarlocate;
        end
     else
       begin
      cbfactor.text:= '';
      cbcalificacion.text:='';
      edclave.OnButtonClick(self);
      end;
   end;

   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
     cbfactor.text:= '';
     cbcalificacion.text:='';
  end;
end;

procedure TfrmDescripcionPuntuacion.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:= DSDPF.dataset.fieldbyname('idDPF').AsString;
  idfactor :=tblDPF.Fieldbyname('idfactor').AsString;
  idcalificacion :=tblDPF.Fieldbyname('idcalificacion').AsString;
  facnumtex;
  calnumtex;
end;

procedure TfrmDescripcionPuntuacion.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDescripcionPuntuacion.cbfactorKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbfactor.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDescripcionPuntuacion.cbcalificacionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(cbcalificacion.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDescripcionPuntuacion.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idDPF) from DescPuntxFactor',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblDPF.Active:=true;
    tblDPF.Insert;
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
    combofactor;
  combocalificacion;
    end
  else
    begin
    if ExisteNombre(ednombre,'select descripcion from DescPuntxFactor where idDPF<>'+edclave.Text+' and descripcion='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    querys('Select * from DescPuntxFactor where idDPF<> '+quotedstr(edclave.text)+' and idfactor= '+quotedstr(idfactor)+' and idcalificacion ='+quotedstr(idcalificacion), 0, sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      application.messagebox('La descripcion para este factor y calificacion ya ha sido descrita, y no podra ser dupilicada, para cambiarla vaya a la opcion de Editar', 'Aviso', MB_ICONEXCLAMATION);
      exit;
      end;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Descripcion';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Descripcion '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idDPF) from DescPuntxFactor',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger +1 );
     //guarda los datos
     tblDPF.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update DescPuntxFactor set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idDPF='+edclave.Text,1,sqlgeneral);
     tblDPF.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmDescripcionPuntuacion.btnborrarClick(Sender: TObject);
begin
//valida que no se use en la tabla de travel
  querys('select idDPF from DescPuntxFactor where idDPF='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esa Descripcion esta siendo usado por una Descripcion de Puntuacion por Factor y no podra ser eliminada hasta que se borre la descripcion o haga referencia a otro Factor Individual!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esa Descripcion?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la Descripcion '+tblDPFdescripcion.asstring,3);
        tblDPF.Delete;
        application.MessageBox('Eliminacion de la Descripcion Exitosa','Información',mb_ok);
        tblDPF.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblDPF.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmDescripcionPuntuacion.btnmodificarClick(Sender: TObject);
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
     tblDPF.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select descripcion from DescPuntxFactor where idDPF<>'+edclave.Text+' and descripcion='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     querys('Select * from DescPuntxFactor where idDPF<> '+quotedstr(edclave.text)+' and idfactor= '+quotedstr(idfactor)+' and idcalificacion ='+quotedstr(idcalificacion), 0, sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      application.messagebox('La descripcion para este factor y calificacion ya ha sido descrita, y no podra ser dupilicada, para cambiarla vaya a la opcion de Editar', 'Aviso', MB_ICONEXCLAMATION);
      exit;
      end;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Descripcion';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Descripcion '+tblDPFdescripcion.AsString,2);
     tblDPF.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update DescPuntxFactor set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idDPF='+edclave.Text,1,sqlgeneral);
     tblDPF.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmDescripcionPuntuacion.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblDPF.Cancel;
     tblDPF.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Descripcion Actual';
         btnmodificar.ImageIndex:=2;
         cbfactor.text:='';
         cbcalificacion.text:='';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Descripcion';
          btnalta.ImageIndex:=5;
          cbfactor.text:='';
          cbcalificacion.text:='';
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

procedure TfrmDescripcionPuntuacion.tblDPFBeforePost(DataSet: TDataSet);
begin
  tblDPFiddpf.AsString:= edclave.Text;
  tblDPFdescripcion.AsString:=ednombre.Text;
  tblDPFidfactor.AsString:=idfactor;
  tblDPFidcalificacion.AsString:=idcalificacion;
end;

procedure TfrmDescripcionPuntuacion.buscarlocate;
begin
tblDPF.Active:=true;
if tblDPF.Locate('idDPF',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    facnumtex;
    calnumtex;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Descripcion no Existe','Información',mb_ok+mb_iconinformation);
    tblDPF.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmDescripcionPuntuacion.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
cbcalificacion.Enabled := hab;
cbfactor.Enabled := hab;
end;

procedure TfrmDescripcionPuntuacion.combofactor;
begin
querys('Select * from Factores_Individuales', 0, sqlgeneral);
cbfactor.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  cbfactor.Add(sqlgeneral.fieldbyname('nombre').AsString);
  sqlgeneral.Next;
  end;
end;

procedure TfrmDescripcionPuntuacion.combocalificacion;
begin
querys('Select * from Calificacion', 0, sqlgeneral);
cbcalificacion.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  cbcalificacion.Add(sqlgeneral.fieldbyname('nombre').AsString);
  sqlgeneral.Next;
  end;
end;

procedure TfrmDescripcionPuntuacion.facnumtex;
begin
querys('Select * from Factores_Individuales where idfactor ='+quotedstr(idfactor), 0, sqlgeneral);
nomfactor:=sqlgeneral.fieldbyname('nombre').AsString;
cbfactor.Text:= nomfactor;
end;

procedure TfrmDescripcionPuntuacion.calnumtex;
begin
querys('Select * from Calificacion where idcalificacion ='+quotedstr(idcalificacion), 0, sqlgeneral);
nomcalif:=sqlgeneral.fieldbyname('nombre').AsString;
cbcalificacion.Text := nomcalif;
end;

procedure TfrmDescripcionPuntuacion.factexnum;
begin
querys('Select * from Factores_Individuales where nombre ='+quotedstr(cbfactor.text), 0, sqlgeneral);
idfactor:=sqlgeneral.fieldbyname('idfactor').AsString;
end;

procedure TfrmDescripcionPuntuacion.caltexnum;
begin
querys('Select * from Calificacion where nombre ='+quotedstr(cbcalificacion.text), 0, sqlgeneral);
idcalificacion:=sqlgeneral.fieldbyname('idcalificacion').AsString;
end;

procedure TfrmDescripcionPuntuacion.cbfactorClick(Sender: TObject);
begin
factexnum;
end;

procedure TfrmDescripcionPuntuacion.cbfactorNotInList(Sender: TObject);
begin
cbfactor.itemindex := 0;
end;

procedure TfrmDescripcionPuntuacion.cbcalificacionNotInList(
  Sender: TObject);
begin
 cbcalificacion.itemindex := 0;
end;

procedure TfrmDescripcionPuntuacion.cbcalificacionClick(Sender: TObject);
begin
caltexnum;
end;

procedure TfrmDescripcionPuntuacion.cbfactorSelect(Sender: TObject);
begin
factexnum;
end;

procedure TfrmDescripcionPuntuacion.cbcalificacionSelect(Sender: TObject);
begin
caltexnum;
end;

End.
