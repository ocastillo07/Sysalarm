unit Upuestos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, RzCmboBx, RzDBCmbo, ExtCtrls, DBCtrls, RzDBNav,
  RzBtnEdt, RzLstBox, RzChkLst;

type
  Tfrmpuestos = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSpuestos: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tblpuestos: TMyTable;
    RzLabel2: TRzLabel;
    eddescripcion: TRzDBEdit;
    lblarea: TRzLabel;
    tblpuestosidpuesto: TIntegerField;
    tblpuestosnombre: TStringField;
    tblpuestosdescripcion: TStringField;
    tblpuestosidarea: TIntegerField;
    cboarea: TRzComboBox;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    tblpuestosusuario: TStringField;
    tblpuestoshora: TStringField;
    tblpuestosfecha: TStringField;
    tblpuestosUnidadNegocio: TStringField;
    RzLabel3: TRzLabel;
    ltUnidadNegocio: TRzCheckList;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblpuestosBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure tblpuestosAfterOpen(DataSet: TDataSet);
    procedure tblpuestosBeforeClose(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveButtonClick(Sender: TObject);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure cboareaKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblpuestosAfterScroll(DataSet: TDataSet);
    procedure cboareaNotInList(Sender: TObject);
  private
    { Private declarations }
    unineg: array of integer;
    procedure buscarlocate;
    procedure SelectUniNeg;
    function GuardarUniNeg:string;
    procedure habilita(hab:boolean);
  public
    { Public declarations }
  end;

var
  frmpuestos: Tfrmpuestos;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmpuestos.buscarlocate;
begin
tblpuestos.Active:=true;
if tblpuestos.Locate('idpuesto',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    querys('select a.nombre from puestos as p left join areas as a on a.idarea=p.idarea where idpuesto='+tblpuestosidpuesto.AsString,0,sqlgeneral);
    cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    SelectUniNeg;
    lbufh.Caption := UFH(tblpuestos);
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Puesto no Existe','Información',mb_ok+mb_iconinformation);
    tblpuestos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure Tfrmpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmpuestos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    navegador.Enabled:=false; 
    //trae el maximo idpuesto + 1
    querys('select max(idpuesto) as idpuesto from puestos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //carga el combo areas con las areas de la tabla de areas
    CargaCombo('select nombre from areas order by nombre','Areas',cboarea);
   //pone la tabla de puestos en modo de insercion
   tblpuestos.Active:=true;
   tblpuestos.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   habilita(true);
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
  // if ExisteNombre(ednombre,'select nombre from puestos where idpuesto<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
  //   exit;
     if cboarea.Text = '' then
      begin
       application.MessageBox('Debe indicar el area a que pertenece este puesto','Aviso',mb_iconinformation);
       cboarea.DroppedDown := true;
       exit;
      end;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Puesto';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta el Puesto '+ednombre.text,1);
       //trae el maximo idpuesto + 1
     querys('select max(idpuesto) as idpuesto from puestos',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblpuestos.Post;
     ltUnidadNegocio.UncheckAll;
    //actualiza los datos de hora,fecha de creacion y usuario
     querys('update puestos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idpuesto='+edclave.Text,1,sqlgeneral);
     tblpuestos.Active:=false;
     cboarea.Text:='';
     edclave.Enabled:=true;
     habilita(false);
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure Tfrmpuestos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      //frmbusquedas.query:='Select idpuesto,nombre as Nombre,descripcion as Descripcion,usuario as Usuario,hora as Hora,fecha as Fecha From puestos order by idpuesto';
      frmbusquedas.query := 'Select puestos.idpuesto,areas.nombre AS Area,puestos.nombre AS Puesto,puestos.usuario AS Usuario,puestos.hora AS Hora,puestos.fecha AS Fecha From puestos Inner Join areas ON puestos.idarea = areas.idarea Order By areas.nombre Asc';
      frmbusquedas.campo_retorno:='idpuesto';
      frmbusquedas.campo_busqueda:='Puesto';
      frmbusquedas.tblorigen := 'puestos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblpuestos.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
            end;
    end;
end;

procedure Tfrmpuestos.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblpuestos.Active:=true;
if tblpuestos.Locate('idpuesto',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    querys('select nombre from areas where idarea='+tblpuestosidarea.AsString,0,sqlgeneral);
    cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Puesto no Existe','Información',mb_ok+mb_iconinformation);
    tblpuestos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmpuestos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblpuestos.Cancel;
     tblpuestos.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then

        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Puesto Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Puesto';
          btnalta.ImageIndex:=5;
        end;
       habilita(false);
       ltUnidadNegocio.UncheckAll;
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
 end
else
close;
end;

procedure Tfrmpuestos.btnmodificarClick(Sender: TObject);
var area:string;
begin
if btnmodificar.Caption = '&Editar' then
   begin
     navegador.Enabled:=false;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     //btnbuscar.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     habilita(true);
     area:=cboarea.Text;
     //carga el combo areas con las areas de la tabla de areas
     CargaCombo('select nombre from areas order by nombre','Areas',cboarea);
     cboarea.Text:=area;
     tblpuestos.Edit;
     ednombre.setfocus;
   end
else
  begin
  //if ExisteNombre(ednombre,'select nombre from puestos where idpuesto<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
  //   exit;
     if cboarea.Text = '' then
      begin
       application.MessageBox('Debe indicar el area a que pertenece este puesto','Aviso',mb_iconinformation);
       cboarea.DroppedDown := true;
       exit;
      end;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Puesto Actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Puesto '+tblpuestosnombre.AsString,2);
     tblpuestos.Post;
     querys('update puestos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idpuesto='+edclave.Text,1,sqlgeneral);
     ltUnidadNegocio.UncheckAll;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     tblpuestos.active:=false;
     cboarea.Text:='';
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     habilita(false);

     end;
end;

procedure Tfrmpuestos.tblpuestosBeforePost(DataSet: TDataSet);
begin
tblpuestosidpuesto.AsString:=edclave.Text;
querys('select idarea from areas where nombre='+quotedstr(cboarea.Text),0,sqlgeneral);
tblpuestosidarea.Value:=sqlgeneral.FieldByName('idarea').Asinteger;
tblpuestosUnidadNegocio.AsString := GuardarUniNeg;
end;

procedure Tfrmpuestos.btnborrarClick(Sender: TObject);
Var hija:tfrmrelacionborrar;
begin
//busca que el puesto no este siendo usado en la tabla de usuarios
querys('select idusuario as Id,nombre as Nombre,apaterno as Apaterno,amaterno as Amaterno from usuarios where idpuesto='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 application.MessageBox('Este Puesto esta relacionada con un(os) Usuario(s),primero debe de eliminar ese relacion para borrar este Puesto','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas seguro que deseas borrar este Puesto?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Puesto '+tblpuestosnombre.asstring,3);
      tblpuestos.Delete;
      application.MessageBox('Eliminacion del Puesto Exitosa','Información',mb_ok);
      ltUnidadNegocio.UncheckAll;
      tblpuestos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblpuestos.Active:=false;
      cboarea.Text:='';
      edclave.Text:='';
      edclave.SetFocus;
      sqlgeneral.Close;
   end;
   
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmpuestos.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     eddescripcion.SetFocus;
  end;
end;

procedure Tfrmpuestos.tblpuestosAfterOpen(DataSet: TDataSet);
begin
navegador.Enabled:=true;
end;

procedure Tfrmpuestos.tblpuestosBeforeClose(DataSet: TDataSet);
begin
navegador.Enabled:=false;
end;

procedure Tfrmpuestos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=dspuestos.DataSet.fieldbyname('idpuesto').AsString;
lbufh.Caption := UFH(tblpuestos);
SelectUniNeg;
end;

procedure Tfrmpuestos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblpuestos,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmpuestos.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
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

procedure Tfrmpuestos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmpuestos.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmpuestos.cboareaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmpuestos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
  begin
   tblpuestos.Active:=false;
   cboarea.Text:='';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
  end;
end;

procedure Tfrmpuestos.FormShow(Sender: TObject);
begin
edclave.SetFocus;
end;

procedure Tfrmpuestos.tblpuestosAfterScroll(DataSet: TDataSet);
begin
    querys('select nombre from areas where idarea='+quotedstr(tblpuestosidarea.AsString),0,sqlgeneral);
    cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
end;

procedure Tfrmpuestos.cboareaNotInList(Sender: TObject);
begin
cboarea.ItemIndex:=0;
end;

procedure Tfrmpuestos.SelectUniNeg;
var un:string; 
begin
un := tblpuestosunidadnegocio.asstring;
querys('select idunidadnegocio, nombre from UnidadNegocio order by nombre', 0, sqlgeneral);
SetLength(unineg, sqlgeneral.RecordCount);
ltUnidadNegocio.Items.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  ltUnidadNegocio.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
  unineg[sqlgeneral.RecNo-1] := sqlgeneral.fieldbyname('idunidadnegocio').AsInteger;
  sqlgeneral.Next;
  end;

if un <> '' then
  begin
  if un = '0' then
    begin
    ltUnidadNegocio.CheckAll;
    {for i:=0 to ltUnidadNegocio.Count-1 do
      ltUnidadNegocio.Selected[i] := true;}
    end
  else
    begin
    querys('select idunidadnegocio, nombre from UnidadNegocio where idunidadnegocio in('+un+') order by nombre', 0, sqlgeneral);
    sqlgeneral.First;
    while not sqlgeneral.Eof = true do
      begin
      ltUnidadNegocio.ItemChecked[ltUnidadNegocio.Items.IndexOf(sqlgeneral.FieldByName('nombre').AsString)] := true;
      //ltUnidadNegocio.Selected[ltUnidadNegocio.Items.IndexOf(sqlgeneral.FieldByName('nombre').AsString)] := true;
      sqlgeneral.Next;
      end;
    end;
  end;
end;

function Tfrmpuestos.GuardarUniNeg:string;
var i, c : integer; cadena:string;
begin
cadena:='';
c:=0;
for i:=0 to ltUnidadNegocio.Count-1 do
  begin
  //if ltUnidadNegocio.Selected[i] = true then
  if ltUnidadNegocio.ItemChecked[i] = true then
    begin
    cadena := cadena + inttostr(unineg[i]) + ',';
    c:= c+1;
    end;
  end;
delete(cadena, length(cadena), 1);
if c <> (ltUnidadNegocio.Count) then
  result := cadena
else
  result := '0';
end;

procedure Tfrmpuestos.habilita(hab:boolean);
begin
ednombre.Enabled:=hab;
eddescripcion.Enabled:=hab;
cboarea.Enabled:=hab;
eddescripcion.Enabled:=hab;
ltUnidadNegocio.Enabled := hab;
end;

End.
