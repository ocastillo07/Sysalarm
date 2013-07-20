unit Ucategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, RzDBEdit, RzButton, StdCtrls, StrUtils,
  Mask, RzEdit, RzLabel, RzCmboBx, RzDBCmbo, DBCtrls, ComCtrls, ToolWin,
  ExtCtrls, RzDBNav, RzBtnEdt, MyAccess, RxCombos, RzRadChk, RzDBChk;

type
  Tfrmcategorias = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DScategorias: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    RzLabel2: TRzLabel;
    tblcategorias: TMyTable;
    navegador: TRzDBNavigator;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    redescripcion: TRzDBRichEdit;
    edclave: TRzButtonEdit;
    tblcategoriasidcategoria: TIntegerField;
    tblcategoriasnombre: TStringField;
    tblcategoriasdescripcion: TMemoField;
    tblcategoriasidgiro: TIntegerField;
    tblcategoriasfecha: TStringField;
    tblcategoriashora: TStringField;
    tblcategoriasusuario: TStringField;
    lblgiro: TRzLabel;
    cbogiro: TRzComboBox;
    RzLabel3: TRzLabel;
    edCostoAnual: TRzDBEdit;
    edCostoMensual: TRzDBEdit;
    RzLabel4: TRzLabel;
    tblcategoriasCostoAnual: TFloatField;
    tblcategoriasCostoMensual: TFloatField;
    lbufh: TRzLabel;
    edcolor: TRzColorEdit;
    tblcategoriasidtipomonitoreo: TSmallintField;
    tblcategoriasserviciocobrable: TSmallintField;
    tblcategoriascolor: TStringField;
    RzLabel5: TRzLabel;
    chkservcob: TRzDBCheckBox;
    RzLabel6: TRzLabel;
    cbtipo: TRzComboBox;
    edcolor1: TRzDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure tblcategoriasAfterOpen(DataSet: TDataSet);
    procedure tblcategoriasAfterClose(DataSet: TDataSet);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnfuentesClick(Sender: TObject);
    procedure redescripcionEnter(Sender: TObject);
    procedure redescripcionExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure redescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure cbogiroKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure cbogiroNotInList(Sender: TObject);
    procedure edCostoAnualKeyPress(Sender: TObject; var Key: Char);
    procedure edCostoMensualKeyPress(Sender: TObject; var Key: Char);
    procedure edCostoAnualExit(Sender: TObject);
    procedure edCostoMensualExit(Sender: TObject);
    procedure tblcategoriasBeforePost(DataSet: TDataSet);
    procedure edcolor1KeyPress(Sender: TObject; var Key: Char);
  private
    procedure locate;
    procedure Habilitar(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcategorias: Tfrmcategorias;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmcategorias.buscarlocate;
begin
tblcategorias.Active:=true;
if tblcategorias.Locate('idcategoria',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    locate;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa categoria no Existe','Información',mb_ok+mb_iconinformation);
    tblcategorias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;


end;


procedure Tfrmcategorias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmcategorias.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    navegador.Enabled:=false;
    //trae el maximo idcategoria + 1
    querys('select max(idcategoria) as idcategoria from categorias',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;

   //pone la tabla de categorias en modo de insercion
   tblcategorias.Active:=true;
   tblcategorias.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   //btnbuscar.Enabled:=false;
   edclave.Enabled:=false;
   habilitar(true);
   ednombre.SetFocus;
   navegador.Enabled:=false;
   lbufh.Caption := '';
   end
   else
   begin
     //btnbuscar.Enabled:=true;
     if cbogiro.Text = '' then
       begin
        application.MessageBox('Debe de especificar a que giro pertenece esta Categoria, para poder guardar!','Aviso',mb_iconinformation);
        exit;
       end;

     if cbtipo.Text = '' then
       begin
        application.MessageBox('Debe de especificar a que tipo de monitoreo pertenece esta Categoria, para poder guardar!','Aviso',mb_iconinformation);
        exit;
       end;

     if ExisteNombre(ednombre,'select nombre from categorias where idcategoria<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     habilitar(false);
     edclave.Enabled:=true;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta una Categoria';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     
     frmprincipal.ucprincipal.Log('Dio de alta la categoria '+ednombre.text,1);



      //trae el maximo idcategoria + 1
      querys('select max(idcategoria) as idcategoria from categorias',0,sqlgeneral);
      edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
     tblcategorias.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
 //     querys('update categorias set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idcategoria='+edclave.Text,1,sqlgeneral);
     tblcategorias.Active:=false;
     edclave.Text:='';
     habilitar(false);
     cbogiro.Text:='';
     cbtipo.Text:='';
     edclave.SetFocus;
   end;
end;

procedure Tfrmcategorias.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='SELECT categorias.idcategoria,categorias.nombre as Nombre,giros.nombre AS Giro,categorias.CostoAnual,categorias.CostoMensual,categorias.usuario as Usuario,categorias.fecha as Fecha,categorias.hora as Hora FROM giros INNER JOIN categorias ON ' +
                          ' (giros.idgiro = categorias.idgiro) order by categorias.idcategoria';
      frmbusquedas.campo_retorno:='idcategoria';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='categorias';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tblcategorias.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmcategorias.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tblcategorias.Active:=true;
if tblcategorias.Locate('idcategoria',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    locate;
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa categoria no Existe','Información',mb_ok+mb_iconinformation);
    tblcategorias.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmcategorias.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblcategorias.Cancel;
     tblcategorias.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     lbufh.Caption := '';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Categoria Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta una Categoria';
          btnalta.ImageIndex:=5;
        end;
       habilitar(false);
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

procedure Tfrmcategorias.btnmodificarClick(Sender: TObject);
var giro:string;
begin
if btnmodificar.Caption = '&Editar' then
   begin
     navegador.Enabled:=false;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     edclave.Enabled:=false;
     habilitar(true);
     giro:=cbogiro.Text;
     //carga el combo giros con los giros de la tabla de giros
     cbogiro.Text:=giro;
     tblcategorias.Active:=true;
     tblcategorias.Edit;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from categorias where idcategoria<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
       exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Categoria Actual';
     btnmodificar.ImageIndex:=2;
     habilitar(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     
     frmprincipal.ucprincipal.Log('Edito la Categoria '+tblcategoriasnombre.AsString,2);
     //querys('select idgiro from giros where nombre='+quotedstr(cbogiro.Text),0,sqlgeneral);
     //querys('update categorias set nombre='+quotedstr(ednombre.Text)+',descripcion='+quotedstr(redescripcion.Text)+',idgiro='+ sqlgeneral.FieldByName('idgiro').Asstring+',CostoAnual='+edcostoanual.Text+',CostoMensual='+edCostoMensual.Text+' where idcategoria='+edclave.Text,1,sqlgeneral);
     tblcategorias.Post;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     cbogiro.Text:='';
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.Setfocus;
     end;
end;

procedure Tfrmcategorias.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que la categoria no este siendo usado en la tabla de oportunidades
querys('select idoportunidad as Id,nombre as Nombre,apaterno as Apaterno,amaterno as Amaterno,rsocial as RazonSocial from oportunidades where idcategoria='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
application.MessageBox('Esta Categoria esta relacionada con un(as) Oportunidad(es),primero debe de eliminar esa relacion para borrar la Categoria!','Operacion No Realizada',mb_iconwarning)
else
 begin
//busca que la categoria no este siendo usado en la tabla de clientes
querys('select idcliente as Id,nombre as Nombre,amaterno as Amaterno,apaterno as Apaterno,rsocial as RazonSocial from clientes where idcategoria='+edclave.Text,0,sqlgeneral);
 if sqlgeneral.RecordCount > 0 then
application.MessageBox('Esta Categoria esta relacionada con un(os) Clientes(es),primero debe de eliminar esa relacion para borrar la Categoria!','Operacion No Realizada',mb_iconwarning)
else
  if application.MessageBox('Estas seguro que deseas borrar esta Categoria?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la Categoria '+tblcategoriasnombre.asstring,3);
      tblcategorias.Delete;
      application.MessageBox('Eliminacion de la Categoria Exitosa','Información',mb_ok);
      tblcategorias.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblcategorias.Active:=false;
      edclave.text:='';
   end;
end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;
end;

procedure Tfrmcategorias.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     edCostoanual.SetFocus;
  end;
end;

procedure Tfrmcategorias.tblcategoriasAfterOpen(DataSet: TDataSet);
begin
navegador.Enabled:=true;
end;

procedure Tfrmcategorias.tblcategoriasAfterClose(DataSet: TDataSet);
begin
navegador.Enabled:=false;
end;

procedure Tfrmcategorias.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin

edclave.Text:=dscategorias.DataSet.fieldbyname('idcategoria').AsString;
locate;

end;

procedure Tfrmcategorias.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := redescripcion.Font;
  if fuentes.Execute then
   begin
      redescripcion.SelAttributes.Size:=fuentes.Font.Size;
      redescripcion.SelAttributes.color:=fuentes.Font.color;
      redescripcion.SelAttributes.style:=fuentes.Font.style;
    end;
end;

procedure Tfrmcategorias.redescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmcategorias.redescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmcategorias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=CerrarPantalla(tblcategorias,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmcategorias.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmcategorias.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmcategorias.redescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmcategorias.cbogiroKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     //sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
     redescripcion.SetFocus;
  end;
end;

procedure Tfrmcategorias.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
   begin
   cbogiro.Text:='';
   cbtipo.Text:='';
   tblcategorias.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;
end;

procedure Tfrmcategorias.FormShow(Sender: TObject);
begin
edclave.setfocus;
 //carga el combo giro con los giros de la tabla de giros
    CargaCombo('select nombre from giros order by nombre','Giros',cbogiro);
    CargaCombo('select nombre from TiposMonitoreo order by nombre','TiposMonitoreo',cbtipo);
end;

procedure Tfrmcategorias.cbogiroNotInList(Sender: TObject);
begin
cbogiro.ItemIndex:=0;
end;

procedure Tfrmcategorias.edCostoAnualKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edCostoanual.Text,key);
if (key=#13)and(edCostoAnual.Text<>'') then
   begin
    key:=#0;
    edCostoMensual.SetFocus;
   end;
end;

procedure Tfrmcategorias.edCostoMensualKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edCostoMensual.Text,key);
if (key=#13)and(edCostoMensual.Text<>'') then
   begin
    key:=#0;
    cboGiro.SetFocus;
   end;
end;

procedure Tfrmcategorias.edCostoAnualExit(Sender: TObject);
begin
if (edCostoAnual.Text<>'')and(edCostoMensual.Text='') then
   edCostoMensual.Text:=floattostr(strtofloat(edCostoAnual.Text)/12);
end;

procedure Tfrmcategorias.edCostoMensualExit(Sender: TObject);
begin
if (edCostoMensual.Text<>'')and(edCostoAnual.Text<>'')and(strtofloat(edCostoMensual.Text)>strtofloat(edCostoAnual.Text)) then
   begin
     application.MessageBox('El Costo Mensual no puede ser mayor que el Anual, Rectifiquelo.','Aviso',mb_iconinformation);
     edCostoMensual.Text:='';
   end;
end;

procedure Tfrmcategorias.tblcategoriasBeforePost(DataSet: TDataSet);
begin
  tblcategoriasidcategoria.value:=strtoint(edclave.text);
  tblcategoriasusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
  tblcategoriasfecha.AsString:=datetostr(FechaServidor);
  tblcategoriashora.AsString:=timetostr(HoraServidor);

  {tblcategoriascolor.asstring := StringReplace(ColorToString(edcolor.SelectedColor), '$', '', []);
  if leftstr(tblcategoriascolor.asstring,2) = 'cl' then
     tblcategoriascolor.asstring := RightStr(inttohex(edcolor.SelectedColor,6),2)+
                                 MidStr(inttohex(edcolor.SelectedColor,6),2,2)+
                                 LeftStr(inttohex(edcolor.SelectedColor,6),2);}

  //querys que me trae el numero del giro dependiendo del nombre
  querys('select idgiro from giros where nombre='+quotedstr(cbogiro.Text),0,sqlgeneral);
  tblcategorias.FieldByName('idgiro').Value:=sqlgeneral.Fields.Fields[0].AsInteger;

  //querys que me trae el numero del giro dependiendo del nombre
  querys('select idtipomonitoreo from TiposMonitoreo where nombre='+quotedstr(cbtipo.Text),0,sqlgeneral);
  tblcategorias.FieldByName('idtipomonitoreo').Value:=sqlgeneral.Fields.Fields[0].AsInteger;
end;

procedure Tfrmcategorias.locate;
begin
edcolor.SelectedColor := RGBToColor(tblcategoriascolor.AsString);
if tblcategoriasidgiro.AsString <> '' then
      begin
       querys('select nombre from giros where idgiro='+tblcategoriasidgiro.AsString,0,sqlgeneral);
       cbogiro.Text:=sqlgeneral.fieldbyname('nombre').AsString;
      end
     else
       cbogiro.Text:='';

     if tblcategoriasidtipomonitoreo.AsString <> '' then
      begin
       querys('select nombre from TiposMonitoreo where idtipomonitoreo='+tblcategoriasidtipomonitoreo.AsString,0,sqlgeneral);
       cbtipo.Text:=sqlgeneral.fieldbyname('nombre').AsString;
      end
     else
       cbtipo.Text:='';
     lbufh.Caption := UFH(tblcategorias);
end;

procedure Tfrmcategorias.Habilitar(hab:boolean);
begin
ednombre.Enabled:=hab;
   redescripcion.Enabled:=hab;
   cbogiro.Enabled:=hab;
   cbtipo.Enabled:=hab;
   redescripcion.Enabled:=hab;
   edCostoAnual.Enabled:=hab;
   edCostoMensual.Enabled:=hab;
   chkservcob.Enabled:=hab;
   //edcolor.Enabled:=hab;
   edcolor1.Enabled:=hab;

end;

procedure Tfrmcategorias.edcolor1KeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (edcolor.text <> '') then
  edcolor.SelectedColor := RGBToColor(edcolor1.text);
end;

end.
