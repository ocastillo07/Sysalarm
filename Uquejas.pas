unit Uquejas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, StdCtrls, RzCmboBx, RzEdit,
  RzBtnEdt, Mask, RzDBEdit, RzLabel, RzButton, ExtCtrls, DBCtrls, RzDBNav;

type
  TfrmQuejas = class(TForm)
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    ednombre: TRzDBEdit;
    edclave: TRzButtonEdit;
    cbarea: TRzComboBox;
    cbasunto: TRzComboBox;
    sqlgeneral: TMyQuery;
    tblquejas: TMyTable;
    DSquejas: TDataSource;
    tblquejasidqueja: TIntegerField;
    tblquejasnombre: TStringField;
    tblquejasidarea: TIntegerField;
    tblquejasidasunto: TIntegerField;
    tblquejasusuario: TStringField;
    tblquejasfecha: TStringField;
    tblquejashora: TStringField;
    lbufh: TRzLabel;
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure tblquejasBeforePost(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure cbareaKeyPress(Sender: TObject; var Key: Char);
    procedure cbasuntoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure buscarlocate;
    procedure llenacombos;
    procedure buscaid;
    procedure buscanom;
    { Private declarations }
  public
    idarea, idasunto :integer;
    { Public declarations }
  end;

var
  frmQuejas: TfrmQuejas;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure TfrmQuejas.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblquejas.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    cbarea.Text := '';
    cbasunto.Text := '';
    lbufh.Caption := '';
  end;
end;

procedure TfrmQuejas.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmQuejas.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmQuejas.buscarlocate;
begin
tblquejas.Active:=true;
if tblquejas.Locate('idqueja',edclave.Text,[]) then
    begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    idarea := tblquejasidarea.AsInteger;
    idasunto := tblquejasidasunto.AsInteger;
    lbufh.Caption := UFH(tblquejas);
    buscanom;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Queja no Existe','Información',mb_ok+mb_iconinformation);
    tblquejas.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
   end;
end;

procedure TfrmQuejas.btnmodificarClick(Sender: TObject);
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
     ednombre.Enabled:=true;
     cbarea.Enabled:=true;
     cbasunto.Enabled:=true;
     edclave.Enabled:=false;
     tblquejas.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
   // if ExisteNombre(ednombre,'select nombre from quejas where idqueja<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
   //    exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Queja actual';
     btnmodificar.ImageIndex:=2;
     ednombre.Enabled:=false;
     cbarea.Enabled:=false;
     cbasunto.Enabled:=false;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la Queja '+tblquejasnombre.AsString,2);
     tblquejas.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
      querys('update quejas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idqueja='+edclave.Text,1,sqlgeneral);
     tblquejas.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmQuejas.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblquejas.Cancel;
     tblquejas.Active:=false;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Queja Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Queja';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       cbarea.Text := '';
       cbasunto.Text := '';
       lbufh.Caption := '';
       ednombre.Enabled:=false;
       cbarea.Enabled:=false;
       cbasunto.Enabled:=false;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmQuejas.tblquejasBeforePost(DataSet: TDataSet);
begin
tblquejasidqueja.AsString:=edclave.Text;
buscaid;
tblquejasidarea.AsInteger:=idarea;
tblquejasidasunto.AsInteger:=idasunto;

end;

procedure TfrmQuejas.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
  edclave.text:=DSquejas.dataset.fieldbyname('idqueja').AsString;
  idarea := tblquejasidarea.AsInteger;
  idasunto := tblquejasidasunto.AsInteger;
  lbufh.Caption := UFH(tblquejas);
  buscanom;
end;

procedure TfrmQuejas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmQuejas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblquejas,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmQuejas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select quejas.idqueja, quejas.nombre, areas.nombre as area, quejas.idasunto, quejas.usuario as Usuario,quejas.fecha as Fecha,quejas.hora as Hora From quejas inner join areas on quejas.idarea = areas.idarea order by quejas.idqueja';
        campo_retorno:='idqueja';
        campo_busqueda:='nombre';
        tblorigen := 'quejas';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblquejas.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
    end;
end;

procedure TfrmQuejas.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idqueja)from quejas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblquejas.Active:=true;
    tblquejas.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    ednombre.Enabled:=true;
    cbarea.Enabled:=true;
    cbasunto.Enabled:=true;
    cbarea.Text := '';
    cbasunto.Text := '';
    lbufh.Caption := '';
    ednombre.SetFocus;
    navegador.Enabled:=false;
    end
  else
    begin
     // if ExisteNombre(ednombre,'select nombre from quejas where idqueja<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
      //  exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una la Queja';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la Queja '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idqueja)+1 from quejas',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger);
     //guarda los datos
     tblquejas.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update quejas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idqueja='+edclave.Text,1,sqlgeneral);
     tblquejas.Active:=false;
     ednombre.Enabled:=false;
     cbarea.Enabled:=false;
     cbasunto.Enabled:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     cbarea.Text := '';
     cbasunto.Text := '';
     edclave.SetFocus;
   end;
end;

procedure TfrmQuejas.btnborrarClick(Sender: TObject);
begin
  //valida que no se use en la tabla de travel
  querys('select idqueja from travel where idqueja='+quotedstr(edclave.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta Queja esta siendo usado por un Travel y no podra ser eliminada hasta que se borre el Travel o haga referencia a otra Queja!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin
      if application.MessageBox('Estas Seguro que deseas borrar esta Queja?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino la Queja '+tblquejasnombre.asstring,3);
        tblquejas.Delete;
        application.MessageBox('Eliminacion de la Queja Exitosa','Información',mb_ok);
        tblquejas.Active:=false;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        tblquejas.Active:=false;
        edclave.text:='';
        cbarea.Text := '';
        cbasunto.Text := '';
        edclave.SetFocus;
        end;
    end;
end;

procedure TfrmQuejas.llenacombos;
begin
querys('Select * from areas order by nombre asc', 0, sqlgeneral);
with cbarea do
  begin
  clear;
  sqlgeneral.First;
  while not sqlgeneral.eof do
    begin
    add(sqlgeneral.FieldByName('nombre').AsString);
    sqlgeneral.next;
    end;
  end;

querys('Select * from asuntos order by nombre asc', 0, sqlgeneral);
with cbasunto do
  begin
  clear;
  sqlgeneral.First;
  while not sqlgeneral.eof do
    begin
    add(sqlgeneral.FieldByName('nombre').AsString);
    sqlgeneral.next;
    end;
  end;
end;

procedure TfrmQuejas.FormShow(Sender: TObject);
begin
edclave.SetFocus;
llenacombos;
end;

procedure TfrmQuejas.buscaid;
begin
/////AREA///////
querys('Select idarea from areas where nombre ='+quotedstr(cbarea.Text), 0, sqlgeneral);
idarea := sqlgeneral.fieldbyname('idarea').AsInteger;

/////ASUNTO///////
querys('Select idasunto from asuntos where nombre ='+quotedstr(cbasunto.Text), 0, sqlgeneral);
idasunto := sqlgeneral.fieldbyname('idasunto').AsInteger;
end;

procedure TfrmQuejas.buscanom;
begin
/////AREA///////
querys('Select * from areas where idarea ='+quotedstr(inttostr(idarea)), 0, sqlgeneral);
cbarea.Text := sqlgeneral.fieldbyname('nombre').AsString;

/////ASUNTO///////
querys('Select * from asuntos where idasunto ='+quotedstr(inttostr(idasunto)), 0, sqlgeneral);
cbasunto.Text  := sqlgeneral.fieldbyname('nombre').AsString;
end;

procedure TfrmQuejas.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmQuejas.cbareaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cbarea.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmQuejas.cbasuntoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cbasunto.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
