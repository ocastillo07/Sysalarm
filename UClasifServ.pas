unit UClasifServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, ExtCtrls, DBCtrls, RzDBNav,
  StdCtrls, RzCmboBx, RzDBEdit, Mask, RzEdit, RzBtnEdt, RzLabel, RzButton;

type
  TfrmClasificacionServicios = class(TForm)
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    cbareas: TRzComboBox;
    cbestatus: TRzComboBox;
    navegador: TRzDBNavigator;
    sqlgeneral: TMyQuery;
    tblclaserv: TMyTable;
    DSclaseven: TDataSource;
    tblclaservid: TIntegerField;
    tblclaservnombre: TStringField;
    tblclaservidareas: TIntegerField;
    tblclaservidstatus: TIntegerField;
    tblclaservusuario: TStringField;
    tblclaservfecha: TStringField;
    tblclaservhora: TStringField;
    procedure FormShow(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure comboareas;
    procedure combostatus;
    procedure arnumtex;
    procedure stnumtex;
    procedure artexnum;
    procedure sttexnum;
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure buscarlocate;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btncancelarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbareasClick(Sender: TObject);
    procedure cbestatusClick(Sender: TObject);
    procedure tblclaservBeforePost(DataSet: TDataSet);
    procedure cbareasNotInList(Sender: TObject);
    procedure cbestatusNotInList(Sender: TObject);
  private
    idarea,idstatus:string;
    nomarea, nomstatus:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClasificacionServicios: TfrmClasificacionServicios;

implementation

uses udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmClasificacionServicios.FormShow(Sender: TObject);
begin
edclave.SetFocus;
comboareas;
combostatus;
end;

procedure TfrmClasificacionServicios.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  edclave.text:=DSclaseven.dataset.fieldbyname('id').AsString;
  idarea :=tblclaserv.Fields[2].AsString;
  idstatus :=tblclaserv.Fields[3].AsString;
  arnumtex;
  stnumtex;
end;

procedure TfrmClasificacionServicios.comboareas;
begin
querys('Select * from areas', 0, sqlgeneral);
cbareas.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  cbareas.Add(sqlgeneral.fieldbyname('nombre').AsString);
  sqlgeneral.Next;
  end;
end;

procedure TfrmClasificacionServicios.combostatus;
begin
querys('Select * from servicios_status', 0, sqlgeneral);
cbestatus.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  cbestatus.Add(sqlgeneral.fieldbyname('nombre').AsString);
  sqlgeneral.Next;
  end;
end;



procedure TfrmClasificacionServicios.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then
    begin
    tblclaserv.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    end;
end;

procedure TfrmClasificacionServicios.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure TfrmClasificacionServicios.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key='.' then
    key:=#0;
  if (key = #13) then
    begin
    key:=#0;
    if edclave.Text <> '' then
      begin
      cbareas.text:= '';
      cbestatus.text:='';
      querys('Select * from clasif_servicios where id='+quotedstr(edclave.text), 0, sqlgeneral);
      idstatus:=sqlgeneral.fieldbyname('idstatus').AsString;
      idarea:=sqlgeneral.fieldbyname('idareas').AsString;
      buscarlocate;
      end
    else
      begin
      cbareas.text:= '';
      cbestatus.text:='';
      edclave.OnButtonClick(self);
      end;
    end;
  if key = #27 then
    begin
    key:=#0;
    edclave.Text:='';
    cbareas.text:= '';
    cbestatus.text:='';
    end;
end;

procedure TfrmClasificacionServicios.buscarlocate;
begin
tblclaserv.Active:=true;
if tblclaserv.Locate('id',edclave.Text,[]) then
    begin
      btnmodificar.Enabled:=true;
      btnalta.Enabled:=true;
      btnborrar.Enabled:=true;
      navegador.Enabled:=true;
      arnumtex;
      stnumtex;
      end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Clasificacion de Servicios no Existe','Información',mb_ok+mb_iconinformation);
    tblclaserv.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;

end;

procedure TfrmClasificacionServicios.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select id, nombre, idareas as IDareas, idstatus as IDstatus, Usuario as Usuario, fecha as Fecha,hora as Hora From clasif_servicios order by id';
        campo_retorno:='id';
        campo_busqueda:='Nombre';
        tblorigen := 'clasif_servicios';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
          begin
          cbareas.text:= '';
          cbestatus.text:='';
          querys('Select * from clasif_servicios where id='+quotedstr(resultado), 0, sqlgeneral);
          idstatus:=sqlgeneral.fieldbyname('idstatus').AsString;
          idarea:=sqlgeneral.fieldbyname('idareas').AsString;
          tblclaserv.Active:=true;
          edclave.Text:=resultado;
          buscarlocate;
          navegador.Enabled:=true;
          end;
        end;
      end;
end;

procedure TfrmClasificacionServicios.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  tblclaserv.Cancel;
  tblclaserv.Active:=false;
  navegador.Enabled:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos de la Clasificacion de Servicios Actual';
    btnmodificar.ImageIndex:=2;
    cbareas.text:='';
    cbestatus.text:='';
    end;
  if btnalta.Enabled then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Clasificacion de Servicios';
    btnalta.ImageIndex:=5;
    cbareas.text:='';
    cbestatus.text:='';
    edclave.Text:='';
    end;
  ednombre.Enabled :=false;
  cbareas.Enabled := false;
  cbestatus.Enabled := false;
  edclave.Enabled:=true;
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edclave.SetFocus;
  end
else
  release;
end;

procedure TfrmClasificacionServicios.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
  begin
  //trae el maximo idtipo + 1
  querys('select max(id) from clasif_servicios',0,sqlgeneral);
  edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
  edclave.Enabled:=false;
  //pone la tabla en modo de insercion
  tblclaserv.Active:=true;
  tblclaserv.Insert;
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  ednombre.Enabled := true;
  cbareas.Enabled := true;
  cbestatus.Enabled := true;
  cbareas.text := '';
  cbestatus.text := '';
  ednombre.SetFocus;
  navegador.Enabled:=false;
  comboareas;
  combostatus;
  end
else
  begin
  artexnum;
  sttexnum;
  querys('select * from clasif_servicios where nombre='+quotedstr(ednombre.text)+' and idareas ='+ quotedstr(idarea)+' and idstatus ='+ quotedstr(idstatus),0,sqlgeneral);
  if  sqlgeneral.RecordCount > 0 then
    begin
    application.messagebox('Existe ya un Registro con estos datos y no puede ser duplicado', 'Aviso', MB_ICONWARNING );
    exit;
    end;
  btnalta.Caption:='&Alta';
  btnalta.Hint:='Dar de Alta una Clasificacion de Servicio';
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar esta Ventana';
  btnalta.ImageIndex:=5;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  frmprincipal.ucprincipal.Log('Dio de Alta una Clasificacion de Servicio',1);
  //guarda los datos
  tblclaserv.Post;
  //actualiza los datos de hora,fecha de creacion y usuario
  querys('update clasif_servicios set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where id='+quotedstr(edclave.Text), 1, sqlgeneral);
  tblclaserv.Active:=false;
  cbareas.Enabled := false;
  cbestatus.Enabled := false;
  edclave.Enabled:=true;
  edclave.Text:='';
  cbareas.text:='';
  cbestatus.text:='';
  edclave.SetFocus;
  end;
end;

procedure TfrmClasificacionServicios.btnborrarClick(Sender: TObject);
begin
//busca que el tipo no este siendo usado en la tabla de sk alarmas
querys('select * from servicios where clasif='+quotedstr(edclave.Text), 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Esta Clasificacion de Servicio esta siendo usado por un Servicio y no podra ser eliminada!','Cuidado',mb_ok+mb_iconinformation)
else
  begin
  if application.MessageBox('Estas Seguro que deseas borrar esta Clasificacion de Servicio?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la Clasificacion de Servicio '+tblclaservid.asstring, 3);
      tblclaserv.Delete;
      application.MessageBox('Eliminacion de la Clasificacion de Servicio Exitosa','Información',mb_ok);
      tblclaserv.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblclaserv.Active:=false;
      cbareas.text:='';
      cbestatus.text:='';
      edclave.text:='';
      edclave.SetFocus;
     end;
   end;
end;

procedure TfrmClasificacionServicios.btnmodificarClick(Sender: TObject);
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
     cbareas.Enabled := true;
     cbestatus.Enabled := true;
     ednombre.Enabled := true;
     edclave.Enabled:=false;
     tblclaserv.Edit;
     navegador.Enabled:=false;
     //comboareas;
     //combostatus;
   end
else
  begin
     artexnum;
     sttexnum;
     querys('select * from clasif_servicios where nombre='+quotedstr(ednombre.text)+' and idareas ='+ quotedstr(idarea)+' and idstatus ='+ quotedstr(idstatus),0,sqlgeneral);
     if  sqlgeneral.RecordCount > 0 then
       begin
       application.messagebox('Existe ya un Registro con estos datos y no puede ser duplicado', 'Aviso', MB_ICONWARNING );
       exit;
       end;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Clasificacion de Servicio actual';
     btnmodificar.ImageIndex:=2;
     cbareas.Enabled := false;
     cbestatus.Enabled := false;
     ednombre.Enabled :=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito una Clasificacion de Servicio',2);
     tblclaserv.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update clasif_servicios set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where id='+quotedstr(edclave.Text), 1, sqlgeneral);
     tblclaserv.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     cbareas.text:='';
     cbestatus.Text :='';
     edclave.SetFocus;
     end;
end;

procedure TfrmClasificacionServicios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure TfrmClasificacionServicios.arnumtex;
begin
querys('Select * from areas where idarea ='+quotedstr(idarea), 0, sqlgeneral);
nomarea:=sqlgeneral.fieldbyname('nombre').AsString;
cbareas.Text:= nomarea;
end;

procedure TfrmClasificacionServicios.stnumtex;
begin
querys('Select * from servicios_status where ssid ='+quotedstr(idstatus), 0, sqlgeneral);
nomstatus:=sqlgeneral.fieldbyname('nombre').AsString;
cbestatus.Text := nomstatus;
end;

procedure TfrmClasificacionServicios.artexnum;
begin
querys('Select * from areas where nombre ='+quotedstr(cbareas.text), 0, sqlgeneral);
idarea:=sqlgeneral.fieldbyname('idarea').AsString;
end;

procedure TfrmClasificacionServicios.sttexnum;
begin
querys('Select * from servicios_status where nombre ='+quotedstr(cbestatus.text), 0, sqlgeneral);
idstatus:=sqlgeneral.fieldbyname('ssid').AsString;
end;



procedure TfrmClasificacionServicios.cbareasClick(Sender: TObject);
begin
artexnum;
end;

procedure TfrmClasificacionServicios.cbestatusClick(Sender: TObject);
begin
sttexnum;
end;

procedure TfrmClasificacionServicios.tblclaservBeforePost(
  DataSet: TDataSet);
begin
  tblclaservidareas.AsString:=idarea;
  tblclaservidstatus.AsString:=idstatus;
end;

procedure TfrmClasificacionServicios.cbareasNotInList(Sender: TObject);
begin
cbareas.itemindex := 0;
end;

procedure TfrmClasificacionServicios.cbestatusNotInList(Sender: TObject);
begin
cbestatus.itemindex := 0;
end;

end.
