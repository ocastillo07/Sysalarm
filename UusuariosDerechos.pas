{///////////////////////////////////////////////////////////////////////////////
2008/08/20 dalyla orden de derechos
2008/07/08 dalyla creado

FAVOR DE NO MOVER EL ORDEN DE LOS DERECHOS POR QUE AFECTA QUERYS CON IN()
POR EJEMPLO AGENDA ADMINISTRADORES, SI LO CAMBIAN MODIFICARLO PARA QUE FUNCIONE
}///////////////////////////////////////////////////////////////////////////////

unit UusuariosDerechos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzBtnEdt, RzLstBox, ExtCtrls, RzPanel,
  RzRadGrp, RzDBRGrp, RzLabel, RzButton, RzCmboBx, DB, MemDS, DBAccess,
  MyAccess, DBCtrls, RzDBNav, RzChkLst;

type
  TfrmUsuariosDerechos = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    cbarea: TRzComboBox;
    cbpuesto: TRzComboBox;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    ltderechos: TRzCheckList;
    navegador: TRzDBNavigator;
    dsderechos: TDataSource;
    sqlderechos: TMyQuery;
    cbusuario: TRzComboBox;
    edclave: TRzButtonEdit;
    RzLabel2: TRzLabel;
    sqlderechosidusrder: TIntegerField;
    sqlderechosidusuario: TIntegerField;
    sqlderechostipo: TIntegerField;
    sqlderechosusuario: TStringField;
    sqlderechosfecha: TStringField;
    sqlderechoshora: TStringField;
    rgtipo: TRzRadioGroup;
    sqlderechosderechos: TMemoField;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure sqlderechosBeforePost(DataSet: TDataSet);
    procedure cbareaSelect(Sender: TObject);
    procedure cbpuestoSelect(Sender: TObject);
    procedure rgtipoClick(Sender: TObject);
    procedure cbareaNotInList(Sender: TObject);
    procedure cbpuestoNotInList(Sender: TObject);
    procedure cbusuarioNotInList(Sender: TObject);
  private
    derechos: array of integer;
    idusuario :string;
    procedure limpiar;
    procedure buscarlocate;
    procedure SelectDerechos;
    procedure habilita(hab:boolean);

    function GuardarDerechos:string;
    function Existe:boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuariosDerechos: TfrmUsuariosDerechos;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure TfrmUsuariosDerechos.buscarlocate;
begin
idusuario := '';
sqlderechos.Active:=true;
if sqlderechos.Locate('idusrder',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.enabled := true;
    lbufh.Caption := UFH(sqlderechos);
    querys('select tipo from UsuariosDerechos where idusrder = '+edclave.text,0,sqlgeneral);
    rgtipo.ItemIndex := sqlgeneral.fieldbyname('tipo').AsInteger - 1;
    case rgtipo.ItemIndex of
      0: begin
         querys('select ud.idusuario, a.nombre from UsuariosDerechos ud left join areas as a on a.idarea=ud.idusuario '+
                'left join clasif_servicios cs on cs.orden = ud.tipo and cs.idserv =12 where tipo = 1 and ud.idusrder ='+
                edclave.text, 0, sqlgeneral);
         cbarea.Text := sqlgeneral.fieldbyname('nombre').AsString;
         cbpuesto.Text := '';
         cbusuario.Text := '';
         end;
      1: begin
         querys('select ud.idusuario, p.nombre as puesto, a.nombre as area from UsuariosDerechos ud left join puestos p '+
                'on p.idpuesto=ud.idusuario left join areas as a on a.idarea=p.idarea left join clasif_servicios cs on '+
                'cs.orden = ud.tipo and cs.idserv =12 where tipo = 2 and ud.idusrder ='+edclave.text, 0, sqlgeneral);
         cbarea.Text := sqlgeneral.fieldbyname('area').AsString;
         cbpuesto.Text := sqlgeneral.fieldbyname('puesto').AsString;
         cbusuario.Text := '';
         end;
      2: begin
         querys('select ud.idusuario, '+UsuarioNombre('u')+' as nombre, cs.nombre as tipo, ud.usuario, p.nombre as puesto, a.nombre as area '+
                'from UsuariosDerechos ud left join usuarios u on u.idusuario=ud.idusuario left join puestos p on '+
                'p.idpuesto=u.idpuesto left join areas as a on a.idarea=u.idarea left join clasif_servicios cs on '+
                'cs.orden = ud.tipo and cs.idserv =12 where tipo = 3 and ud.idusrder ='+edclave.text, 0, sqlgeneral);
         idusuario :=  sqlgeneral.fieldbyname('idusuario').AsString;
         cbusuario.Text := sqlgeneral.fieldbyname('nombre').AsString;
         cbarea.Text := sqlgeneral.fieldbyname('area').AsString;
         cbpuesto.Text := sqlgeneral.fieldbyname('puesto').AsString;
         end;
      end;
    SelectDerechos;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Asignacion de Derecho no Existe','Información',mb_ok+mb_iconinformation);
    sqlderechos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmUsuariosDerechos.SelectDerechos;
var der:string;
begin
der := sqlderechosderechos.asstring;
querys('select idderecho, nombre from Derechos order by idderecho', 0, sqlgeneral);
SetLength(derechos, sqlgeneral.RecordCount);
ltderechos.Items.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  ltderechos.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
  derechos[sqlgeneral.RecNo-1] := sqlgeneral.fieldbyname('idderecho').AsInteger;
  sqlgeneral.Next;
  end;

if der <> '' then
  begin
  if der = '0' then
    begin
    ltderechos.CheckAll;
    end
  else
    begin
    querys('select idderecho, nombre from Derechos where idderecho in('+der+') order by nombre', 0, sqlgeneral);
    sqlgeneral.First;
    while not sqlgeneral.Eof = true do
      begin
      ltderechos.ItemChecked[ltderechos.Items.IndexOf(sqlgeneral.FieldByName('nombre').AsString)] := true;
      sqlgeneral.Next;
      end;
    end;
  end;
end;

function TfrmUsuariosDerechos.GuardarDerechos:string;
var i, c : integer; cadena:string;
begin
cadena:='';
c:=0;
for i:=0 to ltderechos.Count-1 do
  begin
  if ltderechos.ItemChecked[i] = true then
    begin
    cadena := cadena + inttostr(derechos[i]) + ',';
    c:= c+1;
    end;
  end;
delete(cadena, length(cadena), 1);
if c <> (ltderechos.Count) then
  result := cadena
else
  result := '0';
end;

procedure TfrmUsuariosDerechos.habilita(hab:boolean);
begin
if btncancelar.Caption = '&Cerrar' then
  begin
  cbarea.Enabled:=hab;
  ltderechos.Enabled := hab;
  rgtipo.enabled := true;
  case rgtipo.ItemIndex of
    1: begin
       cbpuesto.Enabled:=hab;
       end;
    2: begin
       cbusuario.Enabled:=hab;
       cbpuesto.Enabled:=hab;
       end;
    end;
  end
else
  begin
  cbarea.Enabled:=hab;
  ltderechos.Enabled := hab;
  rgtipo.enabled := hab;
  cbusuario.Enabled:=hab;
  cbpuesto.Enabled:=hab;
  end;
end;

procedure TfrmUsuariosDerechos.FormShow(Sender: TObject);
begin
edclave.SetFocus;
querys('Select idderecho, nombre from Derechos order by idderecho', 0, sqlgeneral);
SetLength(derechos, sqlgeneral.RecordCount);
ltderechos.Items.Clear;
sqlgeneral.First;
while not sqlgeneral.Eof = true do
  begin
  ltderechos.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
  derechos[sqlgeneral.RecNo-1] := sqlgeneral.fieldbyname('idderecho').AsInteger;
  sqlgeneral.Next;
  end;
CargaCombo('select nombre from areas order by nombre','Areas',cbarea);
CargaCombo('select nombre from puestos order by nombre','puestos',cbpuesto);
CargaCombo('select '+UsuarioNombre('u')+' as nombre from usuarios u where estatus =1 order by nombre','usuarios',cbusuario);
sqlderechos.Open;
end;

procedure TfrmUsuariosDerechos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmUsuariosDerechos.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
  begin
   sqlderechos.Active:=false;
   cbarea.Text:='';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   limpiar;
  end;
end;

procedure TfrmUsuariosDerechos.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
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

procedure TfrmUsuariosDerechos.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.Text:=dsderechos.DataSet.fieldbyname('idusrder').AsString;
buscarlocate;
//SelectDerechos;
end;

procedure TfrmUsuariosDerechos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmUsuariosDerechos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  with frmbusquedas do
    begin
    query := 'select ud.idusrder, a.nombre, cs.nombre as tipo, ud.usuario, ud.fecha, ud.hora from UsuariosDerechos ud '+
             'left join areas as a on a.idarea=ud.idusuario left join clasif_servicios cs on cs.orden = ud.tipo and '+
             'cs.idserv = 12 where tipo = 1 union select ud.idusrder, concat(p.nombre, " ", a.nombre) as nombre, '+
             'cs.nombre as tipo, ud.usuario, ud.fecha, ud.hora from UsuariosDerechos ud left join puestos p on '+
             'p.idpuesto=ud.idusuario left join areas as a on a.idarea=p.idarea left join clasif_servicios cs on '+
             'cs.orden = ud.tipo and cs.idserv =12 where tipo = 2 union select ud.idusrder, u.nombre, cs.nombre as tipo, '+
             'ud.usuario, ud.fecha, ud.hora from UsuariosDerechos ud left join usuarios u on u.idusuario=ud.idusuario '+
             'left join clasif_servicios cs on cs.orden = ud.tipo and cs.idserv =12 where tipo = 3 order by tipo, nombre';
    campo_retorno:='idusrder';
    campo_busqueda:='Nombre';
    tblorigen := 'nombre';
    ShowModal;
    if resultado <> '' then
      begin
      sqlderechos.Active:=true;
      edclave.Text:=resultado;
      buscarlocate;
      end;
    end;
  end;
end;

procedure TfrmUsuariosDerechos.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
   navegador.Enabled:=false;
   //trae el maximo id + 1
   querys('select max(idusrder) as idusrder from UsuariosDerechos',0,sqlgeneral);
   edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled:=false;
   sqlderechos.Active:=true;
   sqlderechos.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   habilita(true);
   cbusuario.SetFocus;
   navegador.Enabled:=false;
   limpiar;
   end
   else
   begin
   if rgtipo.itemindex = -1 then
     begin
     Application.MessageBox('Elija el tipo', 'Atencion', MB_ICONINFORMATION);
     exit;
     end;
     
   if Existe = true then
      exit;

     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Derecho';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta la Asignacion de Derecho '+edclave.text,1);
     querys('select max(idusrder) as id from UsuariosDerechos',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     sqlderechos.Post;
     querys('update UsuariosDerechos set fecha="'+datetostr(date)+'",hora="'+FormatDateTime('HH:mm:ss',Time)+'",usuario="'+
            frmprincipal.ucprincipal.CurrentUser.LoginName+'" where idusrder='+edclave.Text,1,sqlgeneral);
     limpiar;
     sqlderechos.Active:=false;
     edclave.Enabled:=true;
     habilita(false);
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmUsuariosDerechos.btnborrarClick(Sender: TObject);
begin         {
//busca que el puesto no este siendo usado en la tabla de usuarios
querys('select idusuario as Id,nombre as Nombre,apaterno as Apaterno,amaterno as Amaterno from usuarios where idpuesto='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
 application.MessageBox('Este Puesto esta relacionada con un(os) Usuario(s),primero debe de eliminar ese relacion para borrar este Puesto','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas seguro que deseas borrar este Puesto?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el Derecho '+sqlderechosnombre.asstring,3);
      sqlderechos.Delete;
      application.MessageBox('Eliminacion del Puesto Exitosa','Información',mb_ok);
      ltderechos.UncheckAll;
      sqlderechos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      sqlderechos.Active:=false;
      cbarea.Text:='';
      edclave.Text:='';
      edclave.SetFocus;
      sqlgeneral.Close;
   end;
         }
end;

procedure TfrmUsuariosDerechos.btnmodificarClick(Sender: TObject);
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
     ltderechos.Enabled := true;
     area:=cbarea.Text;
     //carga el combo areas con las areas de la tabla de areas
     cbarea.Text:=area;
     sqlderechos.Edit; 
   end
else
  begin
  if Existe = true then
      exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Asignacion de Derecho Actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito Asignacion de Derecho '+edclave.text,2);
     sqlderechos.Post;
     querys('update UsuariosDerechos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+' where idusrder='+edclave.Text,1,sqlgeneral);
     edclave.Enabled:=true;
     sqlderechos.active:=false;
     edclave.Text:='';
     limpiar;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     ltderechos.Enabled := false;

     end;
end;

procedure TfrmUsuariosDerechos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     sqlderechos.Cancel;
     sqlderechos.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then

        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos de la Asignacion de Derecho Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Asignacion de Derecho';
          btnalta.ImageIndex:=5;
        end;
       habilita(false);
       edclave.Enabled:=true;
       limpiar;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
       edclave.Text:='';
 end
else
close;
end;

procedure TfrmUsuariosDerechos.sqlderechosBeforePost(DataSet: TDataSet);
begin
sqlderechosidusrder.AsString:=edclave.Text;
sqlderechostipo.AsInteger := rgtipo.ItemIndex+1;
case rgtipo.ItemIndex of
  0 : querys('select idarea as id from areas where nombre="'+cbarea.Text+'"',0,sqlgeneral);
  1 : querys('select idpuesto as id from puestos p left join areas a on a.idarea = p.idarea where p.nombre ="'+cbpuesto.text+
             '" and a.nombre="'+cbarea.text+'"',0,sqlgeneral);
  2 : querys('select idusuario as id from usuarios u left join areas a on a.idarea = u.idarea left join puestos '+
             'p on p.idpuesto = u.idpuesto where '+UsuarioNombre('u')+'="'+cbusuario.text+'" and a.nombre="'+cbarea.Text+'" '+
             'and p.nombre ="'+cbpuesto.text+'"',0,sqlgeneral);
  end;
sqlderechosidusuario.Value:=sqlgeneral.FieldByName('id').Asinteger;
sqlderechosderechos.AsString := GuardarDerechos;
end;

procedure TfrmUsuariosDerechos.cbareaSelect(Sender: TObject);
begin
CargaCombo2('select idpuesto, p.nombre from puestos p left join areas a on a.idarea=p.idarea '+
            'where a.nombre = "'+cbarea.text+'" order by nombre', 'nombre','idpuesto',cbpuesto);
cbpuesto.OnNotInList(self);
cbusuario.OnNotInList(self);
end;

procedure TfrmUsuariosDerechos.cbpuestoSelect(Sender: TObject);
begin
CargaCombo2('select idusuario, '+usuarioNombre('u')+' as nombre from usuarios u left join puestos p on p.idpuesto=u.idpuesto '+
            'left join areas a on a.idarea=p.idarea '+
            'where p.nombre = "'+cbpuesto.text+'" and a.nombre = "'+cbarea.text+'" and u.estatus = 1 order by nombre', 'nombre','idusuario',cbusuario);
cbusuario.OnNotInList(self);

end;

function TfrmUsuariosDerechos.Existe:boolean;
begin
result := false;
case rgtipo.ItemIndex of
  0: begin
     if querys('select idusuario from UsuariosDerechos d left join areas a on a.idarea=d.idusuario where tipo = 1 and a.nombre = "'+cbarea.text+'" and d.idusrder <> '+edclave.text, 0, sqlgeneral) > 0 then
      begin
      Application.MessageBox('Ya existe la asignacion de esta area, utilice la edicion para cambios', 'Atencion', MB_ICONINFORMATION);
      result :=true;
      end;
     end;
  1: begin
     if querys('select idusuario from UsuariosDerechos d left join puestos p on p.idpuesto=d.idusuario left join areas a on a.idarea=p.idarea '+
               'where tipo = 2 and p.nombre = "'+cbpuesto.text+'" and a.nombre = "'+cbarea.text+'" and d.idusrder <> '+edclave.text, 0, sqlgeneral) > 0 then
     begin
      Application.MessageBox('Ya existe la asignacion de este puesto, utilice la edicion para cambios', 'Atencion', MB_ICONINFORMATION);
      result :=true;
      end;
     end;
  2: begin
     if querys('select d.idusuario from UsuariosDerechos d left join usuarios u on u.idusuario=d.idusuario where tipo = 3 '+
               'and u.idusuario = "'+idusuario+'" and d.idusrder <> '+edclave.text , 0, sqlgeneral) > 0 then
     begin
      Application.MessageBox('Ya existe la asignacion de este usuario, utilice la edicion para cambios', 'Atencion', MB_ICONINFORMATION);
      result :=true;
      end;
     end;
  end;
end;

procedure TfrmUsuariosDerechos.limpiar;
begin
rgtipo.ItemIndex := -1;
cbarea.text := '';
cbpuesto.text := '';
cbusuario.text := '';
ltderechos.UncheckAll;
lbufh.Caption := '';
end;

procedure TfrmUsuariosDerechos.rgtipoClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cancelar' then
case rgtipo.ItemIndex of
  0: begin
     cbpuesto.Enabled := false;
     cbusuario.Enabled := false;
     end;

  1: begin
     cbpuesto.Enabled := true;
     cbusuario.Enabled := false;
     end;

  2: begin
     cbpuesto.Enabled := true;
     cbusuario.Enabled := true;
     end;
  end;
end;

procedure TfrmUsuariosDerechos.cbareaNotInList(Sender: TObject);
begin
cbarea.Text := '';
end;

procedure TfrmUsuariosDerechos.cbpuestoNotInList(Sender: TObject);
begin
cbpuesto.Text := '';
end;

procedure TfrmUsuariosDerechos.cbusuarioNotInList(Sender: TObject);
begin
cbusuario.Text := '';
end;

End.


