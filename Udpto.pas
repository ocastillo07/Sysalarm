{///////////////////////////////////////////////////////////////////////////////
2009/03/12 dalyla editar factor
--------------------------------------------------------------------------------
2008/06/27 dalyla correciones en nivel, cancelar, reg afterscroll condicionado
2008/06/26 dalyla quitar after scroll
}///////////////////////////////////////////////////////////////////////////////
unit Udpto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzDBEdit, RzButton, StdCtrls,
  Mask, RzEdit, RzLabel, ExtCtrls, DBCtrls, RzDBNav, RzBtnEdt, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  RzRadChk, RzDBChk, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, RzCmboBx;

type
  Tfrmdpto = class(TForm)
    lblclave: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel1: TRzLabel;
    DSdptos: TDataSource;
    sqlgeneral: TMyQuery;
    ednombre: TRzDBEdit;
    tbldptos: TMyTable;
    tbldptosiddpto: TIntegerField;
    tbldptosnombre: TStringField;
    navegador: TRzDBNavigator;
    edclave: TRzButtonEdit;
    tbldptosusuario: TStringField;
    tbldptosfecha: TStringField;
    tbldptoshora: TStringField;
    RzLabel2: TRzLabel;
    ednivel: TRzDBEdit;
    tbldptosnivel: TSmallintField;
    tbldptosestatus: TSmallintField;
    Vdptos: TcxGridDBTableView;
    Ldptos: TcxGridLevel;
    Gdptos: TcxGrid;
    chkestatus: TRzDBCheckBox;
    VdptosDBColumn1: TcxGridDBColumn;
    VdptosDBColumn2: TcxGridDBColumn;
    RzLabel3: TRzLabel;
    edfactor: TRzDBEdit;
    tbldptosfactor: TFloatField;
    VdptosDBColumn3: TcxGridDBColumn;
    cbcategorias: TRzComboBox;
    RzLabel4: TRzLabel;
    tbldptosiddptocategoria: TSmallintField;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnaltaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnbuscarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tbldptosBeforePost(DataSet: TDataSet);
    procedure btnborrarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarlocate;
    procedure VdptosCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tbldptosAfterScroll(DataSet: TDataSet);
  private
    function validanivel:integer;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdpto: Tfrmdpto;

implementation

uses Udm, Ubusquedas, Uprincipal, Urecursos, Urelacionborrar;

{$R *.dfm}


procedure Tfrmdpto.buscarlocate;
begin

tbldptos.Active:=true;
if tbldptos.Locate('iddpto',edclave.Text,[]) then
   begin
    cbcategorias.ItemIndex := tbldptosiddptocategoria.AsInteger - 1;
    btnmodificar.Enabled:=true;
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    navegador.Enabled:=true;
    gdptos.enabled := true;
    lbufh.Caption := UFH(tbldptos);
   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbldptos.Active:=false;
    edclave.Text:='';
    gdptos.enabled := false;
    edclave.SetFocus;
  end;


end;


procedure Tfrmdpto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmdpto.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //trae el maximo idtipo + 1
    querys('select max(iddpto) from dptos',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
   edclave.Enabled:=false;
   //pone la tabla de departamentos en modo de insercion
   tbldptos.Active:=true;
   tbldptos.Insert;
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
   gdptos.enabled := false;
   lbufh.Caption := '';
   end
   else
   begin
   if ExisteNombre(ednombre,'select nombre from dptos where iddpto<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
   if validanivel = 1 then
    exit;
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta a un Departamento';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Dio de Alta al Departamento '+ednombre.text,1);
     //trae el maximo idtipo + 1
     querys('select max(iddpto) from dptos',0,sqlgeneral);
     edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
     //guarda los datos
      tbldptos.Post;
      //actualiza los datos de hora,fecha de creacion y usuario
      querys('update dptos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where iddpto='+edclave.Text,1,sqlgeneral);
      tbldptos.Active:=false;
      //ednombre.Enabled:=false;
      habilita(false);
      edclave.Enabled:=true;
      gdptos.enabled := true;
      //btnbuscar.Enabled:=true;
      edclave.Text:='';
      cbcategorias.itemindex := -1;
      edclave.SetFocus;
   end;
end;

procedure Tfrmdpto.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      frmbusquedas.query:='Select iddpto,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora From dptos order by iddpto';
      frmbusquedas.campo_retorno:='iddpto';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen:='dptos';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             tbldptos.Active:=true;
             edclave.Text:=frmbusquedas.resultado;
             //btnbuscar.Click;
             //dclave.OnButtonClick(self);
             buscarlocate;
             navegador.Enabled:=true;
            end;
    end;
end;

procedure Tfrmdpto.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;

if edclave.Text='' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
tbldptos.Active:=true;
if tbldptos.Locate('iddpto',edclave.Text,[]) then
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
    application.MessageBox('Ese tipo no Existe','Información',mb_ok+mb_iconinformation);
    tbldptos.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmdpto.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
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
          cbcategorias.itemindex := -1;
        end;
       //ednombre.Enabled:=false;
       habilita(false);
       edclave.Enabled:=true;
       //btnbuscar.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       edclave.SetFocus;
 end
else
release;
end;

procedure Tfrmdpto.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     //btnbuscar.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     //ednombre.Enabled:=true;
     habilita(true);
     edclave.Enabled:=false;
     tbldptos.Edit;
     navegador.Enabled:=false;
     gdptos.enabled := false;
     ednombre.setfocus;
   end
else
  begin
  if ExisteNombre(ednombre,'select nombre from dptos where iddpto<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
     exit;
  if validanivel = 1 then
    exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del departamento actual';
     btnmodificar.ImageIndex:=2;
     gdptos.enabled := true;
     //ednombre.Enabled:=false;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito el departamento '+tbldptosnombre.AsString,2);
     tbldptos.Post;
     tbldptos.Active:=false;
     edclave.Enabled:=true;
     //btnbuscar.Enabled:=true;
     edclave.Text:='';
     cbcategorias.itemindex := -1;
     edclave.SetFocus;
     end;
end;

procedure Tfrmdpto.tbldptosBeforePost(DataSet: TDataSet);
begin
tbldptosiddpto.AsString:=edclave.Text;
tbldptosiddptocategoria.AsInteger := cbcategorias.ItemIndex + 1;
end;

procedure Tfrmdpto.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el depto no se este usando en articulos
querys('select iddpto,nombre,usuario,fecha,hora from articulos where iddpto='+edclave.Text,0,sqlgeneral);
if sqlgeneral.RecordCount > 0 then
   application.MessageBox('Este departamento esta siendo usado por un articulo y no podra ser eliminado hasta que se borre el articulo o haga referencia a otro departamento!','Cuidado',mb_ok+mb_iconinformation)
else
  if application.MessageBox('Estas Seguro que deseas borrar este departamento?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino el departamento '+tbldptosnombre.asstring,3);
      tbldptos.Delete;
      application.MessageBox('Eliminacion del tipo Exitosa','Información',mb_ok);
      tbldptos.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tbldptos.Active:=false;
      edclave.text:='';
      cbcategorias.itemindex := -1;
      edclave.SetFocus;
   end;
if sqlgeneral.RecordCount > 0 then
begin
  hija:=tfrmrelacionborrar.Create(self);
   hija.inicializa(sqlgeneral);
   hija.Show;
end;

end;

procedure Tfrmdpto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
canclose:=CerrarPantalla(tbldptos,btncancelar,btnalta,btnmodificar);
end;

procedure Tfrmdpto.navegadorClick(Sender: TObject; Button: TNavigateBtn);
begin
edclave.text:=DSdptos.dataset.fieldbyname('iddpto').AsString;
lbufh.Caption := UFH(tbldptos);
end;

procedure Tfrmdpto.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmdpto.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfrmdpto.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(ednombre.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure Tfrmdpto.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then begin
   tbldptos.Active:=false;
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   lbufh.Caption := '';
end;   
end;

procedure Tfrmdpto.FormShow(Sender: TObject);
begin
edclave.SetFocus;
CargaCombo2('Select iddptocategoria, nombre from dptocategorias', 'nombre', 'iddptocategoria', cbcategorias);
end;

function Tfrmdpto.validanivel:Integer;
begin
result := 0;
//valida que no exista otro concepto con el mismo nivel
if chkestatus.Checked = true then
  begin

  if strtoint(ednivel.Text) < 1 then
   begin
    application.MessageBox('El campo nivel no puede ser menor que 1','Aviso',mb_iconinformation);
    ednivel.Text := '1';
   end;

  querys('select nivel from dptos where nivel='+ednivel.text+' and estatus = 1 and iddpto<>'+edclave.text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin
    application.MessageBox('Ese Nivel de concepto ya existe intente con otro','Error',mb_iconwarning);
    ednivel.Clear;
    ednivel.setfocus;
    result := 1;
    exit;
   end;
  end
else
  ednivel.Text := '0';
end;

procedure Tfrmdpto.VdptosCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
edclave.text := tbldptosiddpto.AsString;
end;

procedure Tfrmdpto.habilita(hab:boolean);
begin
ednombre.Enabled:=hab;
ednivel.Enabled:=hab;
chkestatus.Enabled:=hab;
edfactor.Enabled := hab;
cbcategorias.Enabled := hab;
end;

procedure Tfrmdpto.tbldptosAfterScroll(DataSet: TDataSet);
begin
if (tbldptos.State <> dsInsert) and (tbldptos.State <> dsedit) then
  begin
  edclave.text := tbldptosiddpto.AsString;
  cbcategorias.ItemIndex := tbldptosiddptocategoria.AsInteger - 1;
  end;
end;

End.
