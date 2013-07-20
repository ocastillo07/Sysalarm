unit UNoClienteZonas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, DB, MyAccess, MemDS, DBAccess, ExtCtrls, DBCtrls,
  RzDBNav, RzDBEdit, StdCtrls, RzCmboBx, Mask, RzEdit, RzBtnEdt, RzLabel,
  RzBmpBtn, UCBase, Grids, DBGrids, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzPanel, RzRadGrp, RzBckgnd;

type
  TfrmNoZonasCliente = class(TForm)
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    sqlgeneral: TMyQuery;
    DSclizon: TDataSource;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edclave: TRzButtonEdit;
    edtipo: TRzButtonEdit;
    edzona: TRzComboBox;
    eddescripcion: TRzDBEdit;
    edprotocolo: TRzComboBox;
    RzLabel5: TRzLabel;
    qtipo: TMyQuery;
    eddestipo: TRzDBEdit;
    RzLabel6: TRzLabel;
    sqlgen: TMyQuery;
    GridZonaDBTableView1: TcxGridDBTableView;
    GridZonaLevel1: TcxGridLevel;
    GridZona: TcxGrid;
    coltipo: TcxGridDBColumn;
    colzona: TcxGridDBColumn;
    colnota: TcxGridDBColumn;
    tblclizon: TMyQuery;
    tblclizonczid: TIntegerField;
    tblclizoncid: TFloatField;
    tblclizonatid: TStringField;
    tblclizonznum: TStringField;
    tblclizonnota: TStringField;
    tblclizonnombre: TStringField;
    tblclizonidprotocolo: TIntegerField;
    tblclizonusuario: TStringField;
    tblclizonfecha: TStringField;
    tblclizonhora: TStringField;
    bg: TRzBackground;
    ltitulo: TRzLabel;
    edidnocliente: TRzDBEdit;
    tblclizonidnocliente: TIntegerField;
    RzLabel7: TRzLabel;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure edzonaKeyPress(Sender: TObject; var Key: Char);
    procedure edtipoButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btncancelarClick(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edtipoKeyPress(Sender: TObject; var Key: Char);
    //procedure btndefaultClick(Sender: TObject);
    procedure edprotocoloNotInList(Sender: TObject);
    procedure edzonaNotInList(Sender: TObject);
    procedure edprotocoloChange(Sender: TObject);
    //procedure btnnodefClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure GridZonaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridZonaDBTableView1DblClick(Sender: TObject);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edprotocoloKeyPress(Sender: TObject; var Key: Char);
    //procedure btnconverClick(Sender: TObject);
  private
    i, ban:integer;
    idcz, idprotocolo, zonaid:string;
    procedure comboprotocolo;
    procedure zonas;
    procedure buscartipozona;
    procedure prototex;
    procedure protonum;
    //procedure convertirold;
    //procedure convertir;
    { Private declarations }
  public
    idnocliente:string;
    eshija: boolean;
    procedure buscarlocate;
    { Public declarations }

  end;

var
  frmNoZonasCliente: TfrmNoZonasCliente;

implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas, Urelacionborrar,
  Uautentificacion, Umensaje, Uclientes;

{$R *.dfm}

procedure TfrmNoZonasCliente.FormShow(Sender: TObject);
begin
//btnconver.Enabled := false;
//btnnodef.Enabled := false;
//btndefault.Enabled := false;
ban:=0;
edclave.SetFocus;
idnocliente:='';
idcz:='';
idprotocolo:='';
zonaid:='';
comboprotocolo;
{
querys('Select protocolo from protocolos order by idprotocolo', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.eof do
  begin
  rgconver.Items.Add(sqlgeneral.fieldbyname('protocolo').AsString);
  sqlgeneral.Next;
  end;  }
end;

procedure TfrmNoZonasCliente.comboprotocolo;
begin
  i:=0;
  qtipo.Active := True;
  qtipo.First;
  edprotocolo.Clear;
  while not qtipo.Eof = true do
    begin                                                         
    edprotocolo.Items.Add(qtipo.fieldbyname('protocolo').AsString);
    qtipo.Next;
    end;
end;

procedure TfrmNoZonasCliente.edzonaKeyPress(Sender: TObject; var Key: Char);
begin
if key='.' then
  key:=#0;
  if (key = #13) then
    begin
    key:=#0;
    eddescripcion.setfocus;
    end;
  if key = #27 then
    begin
    key:=#0;
    edtipo.Text:='';
    if (eshija = false) or (tblclizon.RecordCount < 0) then
      edprotocolo.Text := '';
    end;
end;

procedure TfrmNoZonasCliente.zonas;
begin
  querys('Select * from zonas_protocolo where idprotocolo = '+quotedstr(idprotocolo), 0, sqlgeneral);
  edzona.Clear;
  sqlgeneral.First;
  while not sqlgeneral.Eof = true do
    begin
    edzona.Items.Add(sqlgeneral.fieldbyname('zona').AsString);
    sqlgeneral.Next;
    end;
   edzona.ItemIndex:=0;
   edzona.Text := zonaid;
end;

procedure TfrmNoZonasCliente.buscarlocate;
begin
idnocliente:=edidnocliente.text;
querys('select idcliente from NoClientes where idnocliente='+quotedstr(idnocliente), 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  if btnalta.Caption = '&Guardar' then
    exit;
  querys('Select * from NoCliente_zonas where idnocliente='+quotedstr(idnocliente), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    idprotocolo:=sqlgeneral.fieldbyname('idprotocolo').asstring;
    lbufh.Caption := UFH(sqlgeneral);
    prototex;
    idcz:= tblclizon.Fields[0].Asstring;
    edprotocolo.enabled :=false;
    if btnalta.Caption <> '&Guardar' then
      buscartipozona
    else 
      edtipo.OnButtonClick(self);
    end
  else
    if btnalta.Caption <> '&Alta' then
      begin
      //btndefault.Enabled := true;
      btnalta.enabled:=false;
      edtipo.Enabled :=false;
      edzona.Enabled :=false;
      eddescripcion.Enabled :=false;
      end
    else
      begin
        navegador.enabled:=false;
        eddescripcion.Text := '';
        eddestipo.Text := '';
        application.MessageBox('El cliente no tiene zonas asignadas', 'Aviso', MB_ICONINFORMATION);
        edprotocolo.enabled:= true;
        edprotocolo.setfocus;
        //btndefault.Enabled := true;
       // btnalta.enabled:=false;
      end;
  end
else
  begin
  application.MessageBox(pchar('La cuenta '+idnocliente+' no esta dada de alta.'), 'Aviso', MB_ICONEXCLAMATION );
  edclave.text:='';
  end;
end;

procedure TfrmNoZonasCliente.edtipoButtonClick(Sender: TObject);
begin
idnocliente:=edclave.text;
protonum;
  with frmbusquedas do
    begin
    query:='Select clave,nombre as Nombre,prioridad as Prioridad, comment as Comment, monitoreo as Monitoreo,alarmas_tipos.descripcion as Descripcion,protocolos.protocolo, Usuario as Usuario,fecha as Fecha,hora as Hora From alarmas_tipos inner join protocolos on '+
           ' alarmas_tipos.idprotocolo = protocolos.idprotocolo where alarmas_tipos.idprotocolo='+quotedstr(idprotocolo)+ ' order by clave';
    campo_retorno:='clave';
    campo_busqueda:='nombre';
    tblorigen := 'alarmas_tipos';
    lbldesc.Caption:='Busqueda por Nombre:';
    ShowModal;
    if resultado <> '' then
      begin
      tblclizon.Active:=true;
      edtipo.Text:=resultado;
      querys('Select clave, nombre, idprotocolo from alarmas_tipos where clave ='+quotedstr(resultado), 0, sqlgeneral);
      eddestipo.Text := '( '+ resultado + ' ) '+sqlgeneral.fieldbyname('nombre').AsString;
      zonaid:='';
      zonas;
      end;
    end;
end;

procedure TfrmNoZonasCliente.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key='.' then
    key:=#0;
  if (key = #13) then
    begin
    key:=#0;
    if edclave.Text <> '' then
      begin
      buscarlocate;
      end
    else
      edclave.OnButtonClick(self);
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end;
  if key = #27 then
    begin
    key:=#0;
    edclave.Text:='';
    edprotocolo.Text := '';
    edprotocolo.Enabled :=true;
    end;
end;

procedure TfrmNoZonasCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmNoZonasCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//canclose:=CerrarPantalla(tblclizon,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmNoZonasCliente.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  tblclizon.Cancel;
  tblclizon.Active:=false;
  navegador.Enabled:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  if (btnmodificar.Enabled=true) or (btnmodificar.Caption = '&Guardar') then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos de la Zona del Cliente Actual';
    btnmodificar.ImageIndex:=2;
    end;
  if (btnalta.Enabled=true) or (btnalta.caption = '&Guardar') then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Zona del Cliente';
    btnalta.ImageIndex:=5;
   end;
  //btnconver.Enabled := false;
  //btnnodef.Enabled := false;
  //btndefault.Enabled:=false;
  edtipo.text:='';
  edzona.text:='';
  edtipo.Enabled:=false;
  edzona.Enabled:=false;
  eddescripcion.Enabled:=false;
  btnalta.Enabled:=true;
  edprotocolo.Enabled:=false;
  if eshija = false then
    begin
    edclave.Enabled:=true;
    edclave.Text:='';
    edclave.SetFocus;
    edprotocolo.Text := '';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    end
  else
    begin
    tblclizon.Active := true;
    navegador.Enabled:= true;
    tblclizon.First;
    Gridzona.Enabled := true;
    edtipo.Text := tblclizon.Fields[2].AsString;
    edzona.text:= tblclizon.Fields[3].AsString;
    zonaid := tblclizon.Fields[3].AsString;
    btnborrar.Enabled:= true;
    btnmodificar.Enabled:= true;
    btnalta.setfocus;
    end;
  end
else
  release;
end;

procedure TfrmNoZonasCliente.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
    edclave.text:= tblclizon.Fields[1].AsString;
    edtipo.Text := tblclizon.Fields[2].AsString;
    edzona.text:= tblclizon.Fields[3].AsString;
    zonaid := tblclizon.Fields[3].AsString;
    idprotocolo:=tblclizon.Fields[6].AsString;
    idcz:= tblclizon.Fields[0].Asstring;
    lbufh.Caption := UFH(tblclizon);
    prototex;
end;

procedure TfrmNoZonasCliente.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then
    begin
    tblclizon.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    edtipo.Text:='';
    edzona.Text:='';
    edprotocolo.Text := '';
    eddestipo.Text := '';
    eddescripcion.Text := '';
    end;
end;

procedure TfrmNoZonasCliente.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmNoZonasCliente.prototex;
begin
  querys('select * from protocolos where idprotocolo = '+quotedstr(idprotocolo), 0, sqlgeneral);
  edprotocolo.Text:= sqlgeneral.FieldByName('protocolo').AsString;
end;

procedure TfrmNoZonasCliente.protonum;
begin
  querys('select * from protocolos where protocolo = '+quotedstr(edprotocolo.text), 0, dmaccesos.sqlgeneral);
  idprotocolo:= dmaccesos.sqlgeneral.FieldByName('idprotocolo').AsString;
end;

procedure TfrmNoZonasCliente.edtipoKeyPress(Sender: TObject; var Key: Char);
begin
     if key='.' then
    key:=#0;
  if (key = #13) then
    begin
    key:=#0;
    if (edzona.Text = '') and (edtipo.text<> '') then
      buscarlocate;
    if edtipo.Text = '' then
      edtipo.OnButtonClick(self);
    querys('Select clave, nombre, idprotocolo from alarmas_tipos where clave ='+quotedstr(edtipo.text), 0, sqlgeneral);
    eddestipo.Text := '( '+ edtipo.text + ' ) '+sqlgeneral.fieldbyname('nombre').AsString;
    zonas;
    edzona.setfocus;
    end;
  if key = #27 then
    begin
    key:=#0;
    edtipo.Text:='';
    edprotocolo.Text := '';
    end;
end;

procedure TfrmNoZonasCliente.buscartipozona;
begin
    querys('Select * from NoCliente_zonas where idnocliente='+quotedstr(idnocliente)+' order by atid', 0, sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      querys('Select * from NoCliente_zonas where idnocliente='+quotedstr(idnocliente), 0 , tblclizon);
      tblclizon.Active:=true;
      edtipo.text:= sqlgeneral.fieldbyname('atid').AsString;
      edzona.text:= sqlgeneral.fieldbyname('znum').AsString;
      idprotocolo:= sqlgeneral.fieldbyname('idprotocolo').AsString;
      zonaid:= sqlgeneral.fieldbyname('znum').AsString;
      idcz:=sqlgeneral.fieldbyname('czid').AsString;
      tblclizon.Locate('czid', idcz, []);
      prototex;
      navegador.Enabled:=true;
      btnmodificar.Enabled := true;
      btnborrar.Enabled := true;
      btnalta.Enabled := true;
      end;
end;

procedure TfrmNoZonasCliente.edprotocoloNotInList(Sender: TObject);
begin
edprotocolo.itemindex := 0;
end;

procedure TfrmNoZonasCliente.edzonaNotInList(Sender: TObject);
begin
edzona.ItemIndex := 0;
end;

procedure TfrmNoZonasCliente.edprotocoloChange(Sender: TObject);
begin
edtipo.text := '';
edzona.clear;
eddescripcion.text := '';
eddestipo.text := '';
end;

procedure TfrmNoZonasCliente.DBGrid1DblClick(Sender: TObject);
begin
btnmodificar.OnClick(self);
end;

procedure TfrmNoZonasCliente.GridZonaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
idprotocolo:=tblclizon.Fields[6].AsString;
prototex;
edtipo.text:=tblclizon.Fields[2].AsString;
edzona.text:=tblclizon.Fields[3].AsString;
zonaid:=tblclizon.Fields[3].AsString;
lbufh.Caption := UFH(tblclizon);
end;

procedure TfrmNoZonasCliente.FormCreate(Sender: TObject);
begin
 eshija:= false;
end;

procedure TfrmNoZonasCliente.GridZonaDBTableView1DblClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Guardar' then
  btnmodificar.Caption := '&Editar';
btnmodificar.OnClick(self);

end;

procedure TfrmNoZonasCliente.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key := #0;
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmNoZonasCliente.edprotocoloKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

End.
