{///////////////////////////////////////////////////////////////////////////////
2007/12/19 Dalila Cambiar el path a ..//Manuales, es decir a sspa/manuales
}///////////////////////////////////////////////////////////////////////////////
unit UMantManuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp, RzDBRGrp, StdCtrls, RzCmboBx,
  RzDBSpin, RzDBBnEd, RzDBEdit, Mask, RzEdit, RzBtnEdt, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  MyAccess, MemDS, DBAccess, RzButton, DBCtrls, RzDBNav, RzLabel, RzLaunch,
  RzShellDialogs, RzDBCmbo, StrUtils, RzSpnEdt;

type
  TfrmMantManuales = class(TForm)
    edclave: TRzButtonEdit;
    ednombre: TRzDBEdit;
    rgnivel: TRzDBRadioGroup;
    sqlgeneral: TMyQuery;
    tblmanual: TMyTable;
    dsmanual: TDataSource;
    Vsubtitulo: TcxGridDBTableView;
    Lsubtitulo: TcxGridLevel;
    Gsubtitulo: TcxGrid;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    navegador: TRzDBNavigator;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlsubtitulo: TMyQuery;
    dssubtitulo: TDataSource;
    ODArchivo: TRzOpenDialog;
    cbsubtitulo: TRzComboBox;
    cposicion: TcxGridDBColumn;
    cnombre: TcxGridDBColumn;
    cbarea: TRzComboBox;
    edruta: TRzButtonEdit;
    edposicion: TRzSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edruta1KeyPress(Sender: TObject; var Key: Char);
    procedure cbsubtituloKeyPress(Sender: TObject; var Key: Char);
    procedure edposicionKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edruta1ButtonClick(Sender: TObject);
    procedure tblmanualBeforePost(DataSet: TDataSet);
    procedure cbareaSelect(Sender: TObject);
    procedure rgnivelClick(Sender: TObject);
    procedure cbsubtituloSelect(Sender: TObject);
    procedure cbareaKeyPress(Sender: TObject; var Key: Char);
    procedure cbareaClick(Sender: TObject);
    procedure edrutaButtonClick(Sender: TObject);
    procedure edrutaKeyPress(Sender: TObject; var Key: Char);
    procedure tblmanualAfterPost(DataSet: TDataSet);
    procedure cbareaNotInList(Sender: TObject);
    procedure cbsubtituloNotInList(Sender: TObject);
  private
    idarea, idsub,nombre,RutaCarpeta  :string;
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    procedure buscatexto;
    procedure posicion;
    procedure ruta;
    procedure buscavalue;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantManuales: TfrmMantManuales;



implementation

uses Udm, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmMantManuales.FormShow(Sender: TObject);
begin
edclave.setfocus;
RutaCarpeta  :=  ExtractFilePath(Application.ExeName) +'Manuales\';
end;

procedure TfrmMantManuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmMantManuales.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tblmanual,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmMantManuales.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select idmanual,nombre, usuario as Usuario,fecha as Fecha,hora as Hora From MantManuales order by idmanual';
        campo_retorno:='idmanual';
        campo_busqueda:='nombre';
        tblorigen := 'MantManuales';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblmanual.Active:=true;
           //sqlsubtitulo.Active:=true;
           edclave.Text:=resultado;
           buscarlocate;
           navegador.Enabled:=true;
           end;
        end;
      end;
end;

procedure TfrmMantManuales.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmMantManuales.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    tblmanual.Active:=false;
    sqlsubtitulo.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    cbarea.Text := '';
    cbsubtitulo.Text := '';
    edruta.text := '';
    edposicion.text := '';
  end;
end;

procedure TfrmMantManuales.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmMantManuales.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   edclave.text:=DSManual.dataset.fieldbyname('idmanual').AsString;
   if(tblmanual.fieldbyname('ruta').asstring <> '')  then
   edruta.text :=     RutaCarpeta + tblmanual.fieldbyname('ruta').asstring;
   edposicion.text := tblmanual.FieldByName('posicion').asstring;
   buscatexto;
end;

procedure TfrmMantManuales.ednombreKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMantManuales.edruta1KeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edruta.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMantManuales.cbareaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMantManuales.cbsubtituloKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMantManuales.edposicionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMantManuales.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(idmanual)from MantManuales',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblmanual.Active:=true;
    tblmanual.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    //maximapos;
    cbarea.Text := '';
    cbsubtitulo.Text := '';
    edruta.text := '';
    edposicion.text := '';
    ednombre.SetFocus;
    navegador.Enabled:=false;
    rgnivel.itemindex := 1;
    end
  else
    begin
      if ExisteNombre(ednombre,'select nombre from MantManuales where idmanual<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
        exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Manual';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta el Manual '+ednombre.text,1);
    //trae el maximo idtipo + 1
    querys('select max(idmanual) from MantManuales',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblmanual.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update MantManuales set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmanual='+edclave.Text,1,sqlgeneral);
     tblmanual.Active:=false;
     sqlsubtitulo.Active:=false;
     habilita(false);
     cbarea.Text := '';
     cbsubtitulo.Text := '';
     edruta.text := '';
     edposicion.text := '';
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
   end;
end;

procedure TfrmMantManuales.btnborrarClick(Sender: TObject);
begin
if application.MessageBox('Estas Seguro que deseas borrar este Manual?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
  begin
  frmprincipal.ucprincipal.Log('Elimino el Manual '+ednombre.text,3);
  tblmanual.Delete;
  application.MessageBox('Eliminacion del Manual Exitosa','Información',mb_ok);
  tblmanual.Active:=false;
  sqlsubtitulo.Active:=false;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  cbarea.Text := '';
  cbsubtitulo.Text := '';
  edruta.text := '';
  edposicion.text := '';
  edclave.text:='';
  edclave.SetFocus;
  end;
end;

procedure TfrmMantManuales.btnmodificarClick(Sender: TObject);
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
     if cbarea.text <> '' then
      cbarea.OnSelect(self);
     edclave.Enabled:=false;
     tblmanual.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
   end
else
  begin
    if ExisteNombre(ednombre,'select nombre from MantManuales where idmanual<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Manual actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el Manual '+ednombre.text,2);
     tblmanual.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update MantManuales set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idmanual='+edclave.Text,1,sqlgeneral);
     tblmanual.Active:=false;
     sqlsubtitulo.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure TfrmMantManuales.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblmanual.Cancel;
     tblmanual.Active:=false;
     sqlsubtitulo.Active:=true;
     navegador.Enabled:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Manual Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Manual';
          btnalta.ImageIndex:=5;
        end;
       edclave.Text:='';
       cbarea.Text := '';
       cbsubtitulo.Text := '';
       edruta.text := '';
       edposicion.text := '';
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

procedure TfrmMantManuales.buscarlocate;
begin
tblmanual.Active:=true;
if tblmanual.Locate('idmanual',edclave.Text,[]) then
    begin
    rgnivel.enabled := false;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;

    if(tblmanual.fieldbyname('ruta').asstring <> '')  then
      edruta.text := RutaCarpeta + tblmanual.fieldbyname('ruta').asstring;
    edposicion.text := tblmanual.FieldByName('posicion').asstring;
    buscatexto;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese Manual no Existe','Información',mb_ok+mb_iconinformation);
    tblmanual.Active:=false;
    sqlsubtitulo.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmMantManuales.habilita(hab:boolean);
begin
ednombre.Enabled := hab;
edruta.Enabled := hab;
edposicion.Enabled := hab;
cbarea.Enabled := hab;
cbsubtitulo.Enabled := hab;
//gsubtitulo.Enabled := hab;
rgnivel.Enabled := hab;
if hab = true then
  begin
  cargacombo2('Select nombre, idarea from areas order by nombre', 'nombre', 'idarea', cbarea);
  cbarea.Items.Insert(0,'TODAS');
  cbarea.Values.Insert(0, '0');
  end;
end;

procedure TfrmMantManuales.edruta1ButtonClick(Sender: TObject);
begin
if ODArchivo.Execute then
  edruta.text := ODArchivo.FileName
else
  ODArchivo.Free;
end;

procedure TfrmMantManuales.tblmanualBeforePost(DataSet: TDataSet);
var cadena, c:string;
begin
//Asigna Valores
tblmanual.FieldByName('idmanual').asstring := edclave.text;
tblmanual.FieldByName('idarea').asstring := idarea;
if cbsubtitulo.Text <> '' then
  tblmanual.FieldByName('subtitulo').asstring := idsub
else
  tblmanual.FieldByName('subtitulo').asstring := '';

//Acomoda posiciones
//posicion;
if rgnivel.itemindex = 1 then
  c := ' and subtitulo = '+idsub
else
  c:='';

//Si falta una posicion



if (edposicion.text = '0') or (edposicion.text = '') then
  begin
  cadena := 'Select idmanual, posicion from MantManuales where idarea = '+idarea;
c:=c+' and nivel = '+inttostr(rgnivel.itemindex+1)+' ';
  querys('Select max(posicion) as m from MantManuales where idarea ='+idarea+c, 0, sqlgeneral);
  edposicion.text := inttostr(sqlgeneral.fieldbyname('m').asinteger+1);
  end;
tblmanual.FieldByName('posicion').asstring := edposicion.text;

//Graba el archvio en la ruta
ruta;

//tblmanual.FieldByName('ruta').asstring := edruta.text;
end;

procedure TfrmMantManuales.rgnivelClick(Sender: TObject);
begin
if rgnivel.ItemIndex = 0 then
  begin
  edruta.enabled := false;
  edruta.text := '';
  edposicion.text := '';
  cbsubtitulo.enabled := false;
  end
else
  begin
  edruta.enabled := true;
  cbsubtitulo.enabled := true;
  cbarea.text := '';
  end;
end;

procedure TfrmMantManuales.cbareaSelect(Sender: TObject);
begin
cbarea.OnClick(Self);
end;

procedure TfrmMantManuales.buscatexto;
begin
querys('Select nombre from areas where idarea ='+tblmanual.FieldByName('idarea').asstring, 0, sqlgeneral);
cbarea.text := sqlgeneral.fieldbyname('nombre').AsString;

if (tblmanual.FieldByName('subtitulo').asstring <> '') and (tblmanual.FieldByName('subtitulo').asstring <> NULL) then
  begin
  querys('Select nombre from MantManuales where idmanual ='+tblmanual.FieldByName('subtitulo').asstring, 0, sqlgeneral);
  cbsubtitulo.text := sqlgeneral.fieldbyname('nombre').AsString;
  querys('select m.idmanual, m.posicion, m.nombre from MantManuales as m left join areas as a on '+
         '(a.idarea=m.idarea) where a.nombre = "'+cbarea.text+'" and nivel = 2 and subtitulo='+
         tblmanual.FieldByName('subtitulo').asstring+' order by posicion ', 0, sqlsubtitulo);
  end
else
  querys('select m.idmanual, m.posicion, m.nombre from MantManuales as m left join areas as a on '+
         '(a.idarea=m.idarea) where a.nombre = "'+cbarea.text+'" and nivel = 1 order by posicion ', 0, sqlsubtitulo);
  buscavalue;
end;


procedure TfrmMantManuales.cbareaClick(Sender: TObject);
begin
buscavalue;
if rgnivel.ItemIndex = 1 then
  begin
  if(idarea <> '') then
      cargacombo2('Select nombre, idmanual from MantManuales where nivel = 1 and idarea = '+idarea+' order by nombre', 'nombre', 'idmanual', cbsubtitulo);
  end;
end;

procedure TfrmMantManuales.cbsubtituloSelect(Sender: TObject);
begin
buscavalue;
if rgnivel.ItemIndex = 1 then
  begin
  querys('select * from MantManuales where idarea = '+idarea+' and subtitulo = '+idsub+' order by posicion ', 0, sqlsubtitulo);
  end;

end;

procedure TfrmMantManuales.buscavalue;
begin
querys('Select idarea from areas where nombre="'+cbarea.text+'"', 0, sqlgeneral);
idarea := sqlgeneral.FieldByName('idarea').AsString;
querys('Select idmanual from MantManuales where nombre="'+cbsubtitulo.text+'"', 0, sqlgeneral);
idsub := sqlgeneral.FieldByName('idmanual').AsString;
end;

procedure TfrmMantManuales.edrutaButtonClick(Sender: TObject);
begin
if ODArchivo.Execute then
  edruta.text := ODArchivo.FileName
else
  ODArchivo.Free;
end;

procedure TfrmMantManuales.edrutaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(edruta.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMantManuales.ruta;
var newpath:string;
ban:Integer;
begin
newpath:= my_path+'..\';
newpath := newpath+'Manuales\';

querys('Select ruta from MantManuales where idmanual='+edclave.Text, 0, sqlgeneral);
nombre := AnsiRightStr(edruta.text, Length(edruta.text)- LastDelimiter('\', edruta.text));
ban:=0;
if edruta.text <> sqlgeneral.FieldByName('ruta').AsString then
  begin
  if DirectoryExists(newpath) then
    begin
    ban := 1;
    end
  else
    begin
    if CreateDir(newpath) then
      ban := 1
    else
      begin
      ShowMessage('No se pudo Copiar el archivo el Directorio no se pudo crear ' + newpath);
      ban := 0;
      end;
    end;

  if (ban = 1) and (edruta.text <> '')then
    begin
   	if CopyFile(PChar(edruta.text),PChar(newpath+nombre),FALSE) then
      begin
      edruta.text := newpath+nombre;
      tblmanual.FieldByName('ruta').asstring := nombre;
      end
    else
      MessageDlg('No se ha podido copiar el fichero edite para volver a intentar', mtWarning, [mbOk], 0);
    end;
  end;
end;

procedure TfrmMantManuales.posicion;
var  n, i:Integer;     //   j,   , t
//hallada:Boolean;
cadena, c :String;
//L:array of integer;
begin
if rgnivel.itemindex = 1 then
  c := ' and subtitulo = '+idsub
else
  c:='';

//Si falta una posicion
cadena := 'Select idmanual, posicion from MantManuales where idarea = '+idarea;
c:=c+' and nivel = '+inttostr(rgnivel.itemindex+1);



querys(cadena, 0, sqlgeneral);
i:=1;
n:=0;
sqlgeneral.first;
while not sqlgeneral.eof = true do
  begin
  if sqlgeneral.fieldbyname('posicion').asinteger <> i then
    begin
    n:=i;
    sqlgeneral.Last;
    end
  else
    inc(i);
  sqlgeneral.Next;
  end;
if n <> 0 then
  querys('Update MantManuales set posicion=posicion-1 where idarea='+idarea+c+' and posicion between '+inttostr(n)+' and '+edposicion.text+' and idmanual<>'+edclave.text, 1, sqlgeneral);



//Si hay otro registro igual al que se guardo pone pos+1
cadena := 'Select idmanual, posicion from MantManuales where idarea = '+idarea;
c:=c+' and nivel = '+inttostr(rgnivel.itemindex+1);
cadena:= cadena+c+' and posicion ='+edposicion.text+' and idmanual<>'+edclave.text;
querys(cadena, 0, sqlgeneral);

if sqlgeneral.recordcount > 0 then
  begin
  querys('Update MantManuales set posicion=posicion+1 where idarea='+idarea+c+' and posicion between '+edposicion.text+' and '+inttostr(sqlsubtitulo.recordcount)+' and idmanual<>'+edclave.text, 1, sqlgeneral);
  end;

end;

procedure TfrmMantManuales.tblmanualAfterPost(DataSet: TDataSet);
begin
posicion;
end;

procedure TfrmMantManuales.cbareaNotInList(Sender: TObject);
begin
cbarea.itemindex := -1;
cbarea.text := '';
end;

procedure TfrmMantManuales.cbsubtituloNotInList(Sender: TObject);
begin
cbsubtitulo.itemindex := -1;
cbsubtitulo.text := '';
end;

End.
