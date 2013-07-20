unit udptocategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, RzEdit, RzBtnEdt, ExtCtrls,
  DBCtrls, RzDBNav, StdCtrls, Mask, RzDBEdit, RzButton, RzLabel;

type
  Tfrmdptoscategorias = class(TForm)
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ednombre: TRzDBEdit;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    DSdptos: TDataSource;
    sqlgeneral: TMyQuery;
    tbldptos: TMyTable;
    RzLabel2: TRzLabel;
    tbldptosiddptocategoria: TSmallintField;
    tbldptosnombre: TStringField;
    tbldptosusuario: TStringField;
    tbldptosfecha: TDateField;
    tbldptoshora: TTimeField;
    edfactor: TRzEdit;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure tbldptosAfterScroll(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbldptosBeforePost(DataSet: TDataSet);
    procedure tbldptosAfterPost(DataSet: TDataSet);
    procedure tbldptosAfterClose(DataSet: TDataSet);
  private
    procedure habilitar(hab:boolean);
    procedure buscarlocate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdptoscategorias: Tfrmdptoscategorias;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos, Urelacionborrar;

{$R *.dfm}

procedure Tfrmdptoscategorias.FormShow(Sender: TObject);
begin
  edclave.SetFocus;
end;

procedure Tfrmdptoscategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrmdptoscategorias.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption = '&Alta' then
   begin
   //trae el maximo idtipo + 1
   querys('select max(iddptocategoria) from dptocategorias',0,sqlgeneral);
   edclave.Text := inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled := false;

   //pone la tabla de departamentos en modo de insercion
   tbldptos.Active := true;
   tbldptos.Insert;
   btnalta.Caption :='&Guardar';
   btnalta.Hint := 'Guardar los datos de la Alta';
   btnalta.ImageIndex := 1;
   btncancelar.Caption := '&Cancelar';
   btncancelar.Hint := 'Cancelar la Alta';
   btnborrar.Enabled := false;
   btnmodificar.Enabled := false;
   edfactor.text := '';
   lbufh.Caption := '';
   habilitar(true);
   ednombre.SetFocus;
   navegador.Enabled := false;
   end
else
   begin
   if ExisteNombre(ednombre,'select nombre from dptocategorias where iddptocategoria <> '+edclave.Text+' '+
      'and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
      exit;

   btnalta.Caption := '&Alta';
   btnalta.Hint := 'Dar de Alta a una Categoria';
   btncancelar.Caption := '&Cerrar';
   btncancelar.Hint := 'Cerrar esta Ventana';
   btnalta.ImageIndex := 5;
   btnborrar.Enabled := false;
   btnmodificar.Enabled := false;
   frmprincipal.ucprincipal.Log('Dio de Alta a la Categoria de Departamentos '+ednombre.text,1);

   //trae el maximo idtipo + 1
   querys('select max(iddptocategoria) from dptocategorias',0,sqlgeneral);
   edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);

   //guarda los datos
   tbldptos.Post;
   tbldptos.Active:=false;
   habilitar(false);
   edclave.Enabled:=true;
   edclave.Text:='';
   edfactor.text := '';
   edclave.SetFocus;
   end;
end;

procedure Tfrmdptoscategorias.btnborrarClick(Sender: TObject);
  var hija:tfrmrelacionborrar;
begin
//busca que el depto no se este usando en articulos
if querys('select iddpto, nombre, usuario, fecha, hora from dptos '+
          'where iddptocategoria='+edclave.Text,0,sqlgeneral) > 0 then
   application.MessageBox('Este departamento esta siendo usado por un articulo y no podra ser eliminado '+
   'hasta que se borre la referencia al departamento!', 'Cuidado', MB_ICONINFORMATION)
else
  if application.MessageBox('Estas Seguro que deseas borrar esta categoria?','Confirmación',MB_YESNO+MB_ICONWARNING) = idyes then
    begin
    frmprincipal.ucprincipal.Log('Elimino el departamento '+tbldptosnombre.asstring,3);
    tbldptos.Delete;
    application.MessageBox('Eliminacion del tipo Exitosa','Información',mb_ok);
    tbldptos.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    tbldptos.Active:=false;
    edclave.text:='';
    edclave.SetFocus;
    end;

if sqlgeneral.RecordCount > 0 then
  begin
  hija := tfrmrelacionborrar.Create(self);
  hija.inicializa(sqlgeneral);
  hija.Show;
  end;
end;

procedure Tfrmdptoscategorias.btnmodificarClick(Sender: TObject);
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
     habilitar(true);
     edclave.Enabled:=false;
     tbldptos.Edit;
     navegador.Enabled:=false;
     ednombre.setfocus;
     lbufh.Caption := '';
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from dptocategorias where iddptocategoria<>'+edclave.Text+' '+
      'and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
     btncancelar.Caption := '&Cerrar';
     btnmodificar.Caption := '&Editar';
     btncancelar.Hint := 'Cerrar esta Pantalla';
     btnmodificar.hint := 'Editar los datos de la categoria actual';
     btnmodificar.ImageIndex := 2;
     habilitar(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la categoria '+tbldptosnombre.AsString,2);
     tbldptos.Post;
     edfactor.text := '';
     tbldptos.Active:=false;
     edclave.Enabled:=true;
     edclave.Text:='';
     edclave.SetFocus;
     end;
end;

procedure Tfrmdptoscategorias.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cancelar' then
  begin
  tbldptos.Cancel;
  tbldptos.Active:=false;
  navegador.Enabled:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  lbufh.Caption := '';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del departamento Actual';
    btnmodificar.ImageIndex:=2;
    end;

  if btnalta.Enabled then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta a un Departamento';
    btnalta.ImageIndex:=5;
    edclave.Text:='';
    end;

  habilitar(false);
  edclave.Enabled:=true;
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edclave.SetFocus;
  end
else
  release;
end;

procedure Tfrmdptoscategorias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tbldptos,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmdptoscategorias.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text:=DSdptos.dataset.fieldbyname('iddptocategoria').AsString;
lbufh.Caption := UFH(tbldptos);
end;

procedure Tfrmdptoscategorias.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmdptoscategorias.edclaveKeyPress(Sender: TObject;
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

procedure Tfrmdptoscategorias.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbldptos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
end;
end;

procedure Tfrmdptoscategorias.habilitar(hab:boolean);
begin
ednombre.Enabled:=hab;
edfactor.Enabled := hab;
end;

procedure Tfrmdptoscategorias.tbldptosAfterScroll(DataSet: TDataSet);
begin
if (tbldptos.State <> dsInsert) and (tbldptos.State <> dsedit) then
  begin
  //edclave.text := tbldptosiddptocategoria.AsString;
  querys('select factor from dptos where iddptocategoria = '+edclave.Text+' limit 1', 0, sqlgeneral);
  edfactor.text := sqlgeneral.fieldbyname('factor').asstring;
  end;
end;

procedure Tfrmdptoscategorias.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  frmbusquedas.query := 'Select iddptocategoria, nombre as Nombre, usuario as Usuario, fecha as Fecha, hora as Hora '+
                        'From dptocategorias order by iddptocategoria';
  frmbusquedas.campo_retorno:='iddptocategoria';
  frmbusquedas.campo_busqueda:='nombre';
  frmbusquedas.tblorigen:='dptocategorias';
  frmbusquedas.ShowModal;
  if frmbusquedas.resultado <> '' then
    begin
    tbldptos.Active:=true;
    edclave.Text:=frmbusquedas.resultado;
    buscarlocate;
    navegador.Enabled:=true;
    end;
  end;
end;

procedure Tfrmdptoscategorias.buscarlocate;
begin
//tbldptos.Active:=false;
tbldptos.Active:=true;
tbldptos.Refresh;
if tbldptos.Locate('iddptocategoria',edclave.Text,[]) then
   begin
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    lbufh.Caption := UFH(tbldptos);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbldptos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure Tfrmdptoscategorias.tbldptosBeforePost(DataSet: TDataSet);
begin
tbldptosusuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
tbldptosfecha.AsString := datetostr(date());
tbldptoshora.asstring := timetostr(time());
end;

procedure Tfrmdptoscategorias.tbldptosAfterPost(DataSet: TDataSet);
var dividendo:string;
begin
querys('update dptos set factor='+edfactor.text+', usuario="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", fecha=curdate(), hora=curtime() '+
       'where iddptocategoria='+edclave.text, 1, sqlgeneral);

if ( application.MessageBox('Desea aplicar los cambios a TODOS los articulos de la linea de EQUIPO este factor?', 'Atencion', MB_ICONWARNING+MB_YESNO)) = idyes then
  begin
  dividendo := getconfiguraciones('dividendoDpto', true);

  querys('update articulos a, dptos d set precioa=round((costo*'+edfactor.text+')/'+dividendo+'), '+
         'utila=round(((((costo*'+edfactor.text+')/'+dividendo+')/costo)-1)*100,2) '+
         'where a.iddpto = d.iddpto and d.iddptocategoria='+edclave.text+' and a.idlinea=4', 1, sqlgeneral);
  end;
end;

procedure Tfrmdptoscategorias.tbldptosAfterClose(DataSet: TDataSet);
begin
edfactor.text := '';
end;

End.
