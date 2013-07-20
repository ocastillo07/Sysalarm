unit UCambs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzRadChk, ComCtrls, RzDTP, StdCtrls, RzCmboBx,
  RzDBEdit, Mask, RzEdit, RzBtnEdt, RzLabel, ExtCtrls, DBCtrls, RzDBNav,
  RzDBChk, DB, MemDS, DBAccess, MyAccess, RzDBCmbo;

type
  TfrmCabms = class(TForm)
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel15: TRzLabel;
    edclave: TRzButtonEdit;
    eddescripcion: TRzDBEdit;
    edpartida: TRzDBEdit;
    edexistencia: TRzDBEdit;
    edminimo: TRzDBEdit;
    edmaximo: TRzDBEdit;
    edpiezas: TRzDBEdit;
    ednacional: TRzDBEdit;
    edunidades: TRzDBEdit;
    edcosto: TRzDBEdit;
    tpultcompra: TRzDateTimePicker;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    tblCabms: TMyTable;
    DSCabms: TDataSource;
    chkAutorizable: TRzDBCheckBox;
    sqlgeneral: TMyQuery;
    chkestatus: TRzDBCheckBox;
    tblCabmsidcabm: TStringField;
    tblCabmsnivel: TIntegerField;
    tblCabmspartida: TIntegerField;
    tblCabmsdescripcion: TStringField;
    tblCabmsexistencia: TIntegerField;
    tblCabmsmaximo: TIntegerField;
    tblCabmsminimo: TIntegerField;
    tblCabmspiezasxunidad: TIntegerField;
    tblCabmsunidadesxcaja: TIntegerField;
    tblCabmsnacional: TStringField;
    tblCabmsultimocosto: TFloatField;
    tblCabmsultima_compra: TDateField;
    tblCabmspreautorizado: TSmallintField;
    tblCabmsmoneda: TStringField;
    cbnivel: TRzDBComboBox;
    cbmoneda: TRzDBComboBox;
    tblCabmsestatus: TIntegerField;
    tblCabmsusuario: TStringField;
    tblCabmsfecha: TStringField;
    tblCabmshora: TStringField;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edpartidaKeyPress(Sender: TObject; var Key: Char);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edexistenciaKeyPress(Sender: TObject; var Key: Char);
    procedure edminimoKeyPress(Sender: TObject; var Key: Char);
    procedure edmaximoKeyPress(Sender: TObject; var Key: Char);
    procedure cbmonedaKeyPress(Sender: TObject; var Key: Char);
    procedure edpiezasKeyPress(Sender: TObject; var Key: Char);
    procedure edunidadesKeyPress(Sender: TObject; var Key: Char);
    procedure ednacionalKeyPress(Sender: TObject; var Key: Char);
    procedure edcostoKeyPress(Sender: TObject; var Key: Char);
    procedure chkestatusKeyPress(Sender: TObject; var Key: Char);
    procedure tpultcompraKeyPress(Sender: TObject; var Key: Char);
    procedure chkAutorizableKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblCabmsBeforePost(DataSet: TDataSet);
    procedure cbnivelKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCabms: TfrmCabms;

implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmCabms.FormShow(Sender: TObject);
begin
   edclave.SetFocus;
end;

procedure TfrmCabms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure TfrmCabms.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblCabms,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmCabms.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idcabm, descripcion, nivel, existencia, ultimocosto, estatus, preautorizado as autorizable From Cabms order by estatus, idcabm';
        campo_retorno:='idcabm';
        campo_busqueda:='descripcion';
        tblorigen := 'Cabms';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblCabms.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmCabms.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmCabms.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblCabms.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmCabms.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
//key:=ValidaNumeros(key,true);
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

procedure TfrmCabms.edpartidaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edpartida.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.eddescripcionKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(eddescripcion.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.edexistenciaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edexistencia.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.edminimoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edminimo.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.edmaximoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edmaximo.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.cbmonedaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cbmoneda.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.edpiezasKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edpiezas.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.edunidadesKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edunidades.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.ednacionalKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednacional.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.edcostoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edcosto.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.chkestatusKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.tpultcompraKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.chkAutorizableKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.buscarlocate;
begin
tblCabms.Active:=true;
if tblCabms.Locate('idcabm',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    //checar;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tblCabms);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Cabms no Existe','Información',mb_ok+mb_iconinformation);
    tblCabms.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmCabms.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    //querys('select max(idcabm)from Cabms',0,sqlgeneral);
//    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
  //  edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblCabms.Active:=true;
    tblCabms.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    edclave.text := '';
    edclave.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
      if ExisteNombre(eddescripcion,'select descripcion from Cabms where idcabm<>'+quotedstr(edclave.Text)+' and descripcion='+quotedstr(eddescripcion.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Cabms';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Cabms '+eddescripcion.text,1);
    //trae el maximo idtipo + 1
    //querys('select max(idcabm)+1 from Cabms',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger);
     //guarda los datos
     tblCabms.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update Cabms set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcabm='+quotedstr(edclave.Text),1,sqlgeneral);
     tblCabms.Active:=false;
     habilita(false);
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmCabms.btnborrarClick(Sender: TObject);
begin
//valida que no se use en la tabla de travel
  querys('select idcabm from pedidos where idcabm='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta Cabms esta siendo usado por un Pedido y no podra ser eliminada hasta que se borre el Pedido o haga referencia a otra Cabms!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
    if application.MessageBox('Estas Seguro que deseas borrar esta Cabms?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la Cabms '+tblCabmsdescripcion.asstring,3);
        tblCabms.Delete;
        application.MessageBox('Eliminacion de la Cabms Exitosa','Información',mb_ok);
        tblCabms.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblCabms.Active:=false;
        edclave.text:='';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmCabms.btnmodificarClick(Sender: TObject);
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
     tblCabms.Edit;
     navegador.Enabled:=false;
     eddescripcion.setfocus;
   end
else
  begin
    if ExisteNombre(eddescripcion,'select descripcion from Cabms where idcabm<>'+quotedstr(edclave.Text)+' and descripcion='+quotedstr(eddescripcion.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Cabms actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Cabms '+tblCabmsdescripcion.AsString,2);
     tblCabms.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update Cabms set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcabm='+quotedstr(edclave.Text),1,sqlgeneral);
  //   tblCabms.Active:=true;
     edclave.Enabled:=true;
     navegador.Enabled:=true;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
//     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmCabms.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblCabms.Cancel;
     tblCabms.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Cabms Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Cabms';
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

procedure TfrmCabms.tblCabmsBeforePost(DataSet: TDataSet);
begin
tblCabmsidcabm.AsString:=edclave.Text;
end;

procedure TfrmCabms.cbnivelKeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13)and(cbnivel.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCabms.habilita(hab:boolean);
begin
eddescripcion.Enabled := hab;
edpartida.Enabled := hab;
edexistencia.Enabled := hab;
edminimo.Enabled := hab;
edmaximo.Enabled := hab;
edpiezas.Enabled := hab;
ednacional.Enabled := hab;
edunidades.Enabled := hab;
edcosto.Enabled := hab;
tpultcompra.Enabled := hab;
cbnivel.Enabled := hab;
cbmoneda.Enabled := hab;
chkAutorizable.Enabled := hab;
chkestatus.Enabled := hab;

end;

procedure TfrmCabms.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=DSCabms.dataset.fieldbyname('idcabm').AsString;
lbufh.Caption := UFH(tblCabms);
end;

End.
