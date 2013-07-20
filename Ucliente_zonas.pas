//2008-09-15 dalyla poder escribir las zonas con mas digitos que los del combo
unit Ucliente_zonas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, DB, MyAccess, MemDS, DBAccess, ExtCtrls, DBCtrls,
  RzDBNav, RzDBEdit, StdCtrls, RzCmboBx, Mask, RzEdit, RzBtnEdt, RzLabel,
  RzBmpBtn, UCBase, Grids, DBGrids, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, RzPanel, RzRadGrp;

type
  TfrmZonasCliente = class(TForm)
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
    btndefault: TRzBitBtn;
    btnnodef: TRzBitBtn;
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
    RzLabel7: TRzLabel;
    rgconver: TRzRadioGroup;
    btnconver: TRzBitBtn;
    btnimprimir: TRzBitBtn;
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
    procedure btnmodificarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure tblclizonBeforePost(DataSet: TDataSet);
    procedure edtipoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btndefaultClick(Sender: TObject);
    procedure edprotocoloNotInList(Sender: TObject);
    procedure edprotocoloChange(Sender: TObject);
    procedure btnnodefClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure GridZonaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure GridZonaDBTableView1DblClick(Sender: TObject);
    procedure eddescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure edprotocoloKeyPress(Sender: TObject; var Key: Char);
    procedure btnconverClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
  private
    i, ban:integer;
    idcz, idprotocolo, zonaid:string;
    procedure comboprotocolo;
    procedure zonas;
    procedure buscartipozona;
    procedure prototex;
    procedure protonum;
    procedure convertirold;
    procedure convertir;
    { Private declarations }
  public
    idcliente:string;
    eshija: boolean;
    procedure buscarlocate;
    { Public declarations }

  end;

var
  frmZonasCliente: TfrmZonasCliente;

implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas, Urelacionborrar,
  Uautentificacion, Umensaje, Uclientes, Udmrep;

{$R *.dfm}

procedure TfrmZonasCliente.FormShow(Sender: TObject);
begin
btnconver.Enabled := false;
btnnodef.Enabled := false;
btndefault.Enabled := false;
ban:=0;
edclave.SetFocus;
idcliente:='';
idcz:='';
idprotocolo:='';
zonaid:='';
comboprotocolo;
querys('Select protocolo from protocolos order by idprotocolo', 0, sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.eof do
  begin
  rgconver.Items.Add(sqlgeneral.fieldbyname('protocolo').AsString);
  sqlgeneral.Next;
  end;
end;

procedure TfrmZonasCliente.comboprotocolo;
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

procedure TfrmZonasCliente.edzonaKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmZonasCliente.zonas;
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

procedure TfrmZonasCliente.buscarlocate;
begin
idcliente:=edclave.text;

querys('select idcliente from clientes where idcliente='+quotedstr(idcliente), 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  if btnalta.Caption = '&Guardar' then
    exit;
  querys('Select * from cliente_zonas where cid='+quotedstr(idcliente), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    idprotocolo:=sqlgeneral.fieldbyname('idprotocolo').asstring;

    prototex;
    idcz:= tblclizon.Fields[0].Asstring;
    edprotocolo.enabled :=false;
    if btnalta.Caption <> '&Guardar' then
      buscartipozona
    else 
      edtipo.OnButtonClick(self);
    lbufh.Caption := UFH(tblclizon);
    end
  else
    if btnalta.Caption <> '&Alta' then
      begin
      btndefault.Enabled := true;
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
        btndefault.Enabled := true;
       // btnalta.enabled:=false;
      end;
  end
else
  begin
  application.MessageBox(pchar('La cuenta '+idcliente+' no esta dada de alta.'), 'Aviso', MB_ICONEXCLAMATION );
  edclave.text:='';
  end;
end;

procedure TfrmZonasCliente.edtipoButtonClick(Sender: TObject);
begin
idcliente:=edclave.text;
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

procedure TfrmZonasCliente.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmZonasCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmZonasCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//canclose:=CerrarPantalla(tblclizon,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmZonasCliente.btncancelarClick(Sender: TObject);
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
  btnconver.Enabled := false;
  btnnodef.Enabled := false;
  btndefault.Enabled:=false;
  edtipo.text:='';
  lbufh.Caption := '';
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

procedure TfrmZonasCliente.navegadorClick(Sender: TObject;
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

procedure TfrmZonasCliente.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then
    begin
    tblclizon.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    btnconver.Enabled:=false;
    btndefault.Enabled:=false;
    btnnodef.Enabled:=false;
    edtipo.Text:='';
    edzona.Text:='';
    edprotocolo.Text := '';
    eddestipo.Text := '';
    eddescripcion.Text := '';
    lbufh.Caption := '';
    end;
end;

procedure TfrmZonasCliente.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmZonasCliente.prototex;
begin
  querys('select * from protocolos where idprotocolo = '+quotedstr(idprotocolo), 0, sqlgeneral);
  edprotocolo.Text:= sqlgeneral.FieldByName('protocolo').AsString;
end;

procedure TfrmZonasCliente.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
  begin
  //pone la tabla en modo de insercion
  tblclizon.Active:=true;
  tblclizon.Insert;
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edtipo.Enabled:=true;
  edzona.Enabled:=true;
  eddescripcion.Enabled:=true;
  edtipo.text:='';
  edzona.text:='';
  lbufh.Caption := '';
  edzona.Clear;
  navegador.Enabled:=false;
  zonas;
  edzona.text:='';
  Gridzona.Enabled := false;
  if eshija = false then
    begin
    edclave.text:='';
    edclave.SetFocus;
    end
  else
    edtipo.setfocus;
  if tblclizon.RecordCount = 0 then
    begin
    edprotocolo.Enabled:=true;
    edprotocolo.Text := '';
   end;
  end
else
  begin  //MODIFICAR LO DE BUSQUEDA DE NOMBRE
  //trae el maximo idtipo + 1
  querys('select max(czid)+1 as czid from cliente_zonas',0,sqlgeneral);
  idcz:= sqlgeneral.Fields[0].AsString;
  querys('select * from cliente_zonas where czid='+quotedstr(idcz)+' and cid= '+quotedstr(edclave.text)+' and atid ='+quotedstr(edtipo.text)+' and idprotocolo='+quotedstr(edprotocolo.text), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    application.messagebox('Existe ya un Registro con estos datos y no puede ser duplicado', 'Aviso', MB_ICONWARNING );
    exit;
    end;
  querys('Select * from clientes where idcliente ='+quotedstr(edclave.text), 0, sqlgeneral);
  if sqlgeneral.recordcount = 0 then
    exit;
  querys ('Select * from alarmas_tipos where clave = '+quotedstr(edtipo.Text)+' and idprotocolo = '+quotedstr(idprotocolo), 0, sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.messagebox('Ese tipo de Alarma no existe en el protocolo', 'Aviso', MB_ICONINFORMATION);
        btncancelar.onclick(self);
        exit;
   end;
        btnalta.Caption:='&Alta';
        btnalta.Hint:='Dar de Alta una Zona del Cliente';
        btncancelar.Caption:='&Cerrar';
        btncancelar.Hint:='Cerrar esta Ventana';
        btnalta.ImageIndex:=5;
        btnborrar.Enabled:=false;
        btnmodificar.Enabled:=false;
        frmprincipal.ucprincipal.Log('Dio de Alta una Zona del Cliente',1);
        //guarda los datos
        tblclizon.Post;
        //actualiza los datos de hora,fecha de creacion y usuario
        querys('update cliente_zonas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where czid='+quotedstr(idcz), 1, sqlgeneral);
        edtipo.Enabled:=false;
        edzona.Enabled:=false;
        eddescripcion.Enabled:=false;
        edtipo.text:='';
        edzona.Text:='';
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
        if tblclizon.RecordCount = 0 then
          edprotocolo.text:='';
        Gridzona.Enabled := true;
        end;

end;

procedure TfrmZonasCliente.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el tipo no este siendo usado en la tabla de sk alarmas
querys('select * from alarmas where tipo='+quotedstr(edtipo.Text)+' and zona ='+quotedstr(edzona.text)+' and idcliente= '+quotedstr(edclave.text), 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  if (application.MessageBox(pchar('Esta Zona del Cliente esta siendo usado por '+inttostr(sqlgeneral.RecordCount) + ' alarma(s) del cliente y no podra ser eliminada!'+chr(13)+'Desea ver los registros relacionados?'), 'Cuidado',mb_yesno+mb_iconwarning) = idyes) then
    begin
    hija:=tfrmrelacionborrar.Create(self);
    hija.inicializa(sqlgeneral);
    hija.Show;
    end;
  end
else
  begin
  if application.MessageBox('Estas Seguro que deseas borrar esta Zona del Cliente?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la Zona del Cliente '+tblclizonczid.asstring, 3);
      tblclizon.Delete;
      application.MessageBox('Eliminacion de la Zona del Cliente Exitosa','Información',mb_ok);
      tblclizon.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblclizon.Active:=false;
      edtipo.text:='';
      edzona.text:='';
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
     Gridzona.Enabled := true;
      if tblclizon.RecordCount = 0 then
        edprotocolo.Text := '';
     end;
   end;
end;

procedure TfrmZonasCliente.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     idcz := tblclizonczid.AsString;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     edtipo.Enabled:=true;
     edzona.Enabled:=true;
     eddescripcion.Enabled:=true;
     edclave.Enabled:=false;
     tblclizon.Active := true;
     tblclizon.Edit;
     navegador.Enabled:=false;
     edprotocolo.Enabled:=false;
     zonas;
     if edprotocolo.Text = '4x2' then
        btnconver.Enabled := true;
     if tblclizon.RecordCount > 0 then
        btnnodef.Enabled := true
     else
      begin
      edprotocolo.Enabled:=true;
      btndefault.Enabled := true;
      end;
     edtipo.SetFocus;
   Gridzona.Enabled := false;
   end
else
  begin
     //querys('select max(czid)+1 as czid from cliente_zonas',0,sqlgeneral);
//     idcz:= sqlgeneral.Fields[0].AsString;
     querys('select * from cliente_zonas where czid='+quotedstr(idcz)+' and cid= '+quotedstr(edclave.text)+' and atid ='+quotedstr(edtipo.text)+' and idprotocolo='+quotedstr(edprotocolo.text), 0, sqlgeneral);
     if sqlgeneral.RecordCount > 0 then
        begin
        application.messagebox('Existe ya un Registro con estos datos y no puede ser duplicado', 'Aviso', MB_ICONWARNING );
        exit;
        end;
     querys('Select * from clientes where idcliente ='+quotedstr(edclave.text), 0, sqlgeneral);
     if sqlgeneral.recordcount = 0 then
       exit;
     querys ('Select * from alarmas_tipos where clave = '+quotedstr(edtipo.Text)+' and idprotocolo = '+quotedstr(idprotocolo), 0, sqlgeneral);
     if sqlgeneral.RecordCount = 0 then
        begin
        application.messagebox('Ese tipo de Alarma no existe en el protocolo, elimine la zona o cambiela por otra existente', 'Aviso', MB_ICONINFORMATION);
        btncancelar.onclick(self);
        exit;
        end;    
       btncancelar.Caption:='&Cerrar';
       btnmodificar.Caption:='&Editar';
       btncancelar.Hint:='Cerrar esta Pantalla';
       btnmodificar.hint:='Editar los datos de la Zona del Cliente actual';
       btnmodificar.ImageIndex:=2;
       btnconver.Enabled := false;
       btnnodef.Enabled := false;
       btndefault.Enabled := false;
       edtipo.Enabled:=false;
       edzona.Enabled:=false;
       eddescripcion.Enabled:=false;
       edprotocolo.Enabled:=false;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       bpcambios('cliente_zonas', idcz, 'czid');
       tblclizon.Post;
       apcambios('czid', idcz, 'cliente_zonas', 'frmZonasClientes');
       //actualiza los datos de hora,fecha de creacion y usuario
       querys('update cliente_zonas set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where czid='+quotedstr(idcz), 1, sqlgeneral);
       frmprincipal.ucprincipal.Log('Edito una Zona Default',2);
       edtipo.Text:='';
       edzona.Text :='';
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
         Gridzona.Enabled := true;
  end;
end;

procedure TfrmZonasCliente.tblclizonBeforePost(DataSet: TDataSet);
begin
  protonum;
  tblclizonczid.AsString:=idcz;
  tblclizoncid.AsString:=edclave.Text;
  if  ban = 0 then
    begin
    tblclizonatid.AsString := edtipo.text;
    tblclizonznum.AsString := edzona.text;
    tblclizonidprotocolo.AsString  := idprotocolo;
    end;
end;

procedure TfrmZonasCliente.protonum;
begin
  querys('select * from protocolos where protocolo = '+quotedstr(edprotocolo.text), 0, dmaccesos.sqlgeneral);
  idprotocolo:= dmaccesos.sqlgeneral.FieldByName('idprotocolo').AsString;
end;

procedure TfrmZonasCliente.edtipoKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmZonasCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  with frmbusquedas do
    begin
    query:='Select idcliente, nombre, apaterno, amaterno from clientes order by idcliente';
    campo_retorno:='idcliente';
    campo_busqueda:='nombre';
    tblorigen := 'clientes';
    lbldesc.Caption:='Busqueda por Nombre:';
    ShowModal;
    if resultado <> '' then
      begin
      tblclizon.Active:=true;
      edclave.Text:= resultado;
      querys('Select * from cliente_zonas where cid='+quotedstr(resultado), 0, sqlgeneral);
      if sqlgeneral.recordcount > 0 then
        begin
        if btnalta.caption = '&Guardar' then
          exit;
        idcliente:=edclave.Text;
        idprotocolo:= sqlgeneral.fieldbyname('idprotocolo').AsString;
        idcz:= tblclizon.Fields[0].Asstring;
        if btnalta.Caption = '&Alta' then
          begin
          buscartipozona;
          navegador.Enabled:=true;
          end
        else
          if btnalta.Caption <> '&Alta' then
            begin
            btndefault.Enabled := true;
            edtipo.Enabled :=false;
            edzona.Enabled :=false;
            eddescripcion.Enabled :=false;
            end;
        end
      else
        begin
        navegador.enabled:=false;
        eddescripcion.Text := '';
        eddestipo.Text := '';
        application.MessageBox('El cliente no tiene zonas asignadas. Desea asignarlas?', 'Aviso', MB_ICONINFORMATION);
        if btnalta.Caption = '&Alta' then
          begin
          btndefault.Enabled := true;
          btnalta.enabled:=false;
          edtipo.Enabled :=false;
          edzona.Enabled :=false;
          eddescripcion.Enabled :=false;
          edprotocolo.Enabled := true;
          edprotocolo.SetFocus;
          end;
        end;
      end;
    end; //with
  end;
end;

procedure TfrmZonasCliente.buscartipozona;
begin
    querys('Select * from cliente_zonas where cid='+quotedstr(idcliente)+' order by atid', 0, sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
      begin
      querys('Select * from cliente_zonas where cid='+quotedstr(idcliente), 0 , tblclizon);
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

procedure TfrmZonasCliente.btndefaultClick(Sender: TObject);
var i:integer;
begin
protonum;
if edprotocolo.Text = '' then
  begin
  application.MessageBox('No ha seleccionado el protocolo con el que se comunicara el control de este cliente, por favor hagalo y vuelva a intentar esta operacion!','Aviso',mb_iconinformation);
  edprotocolo.SetFocus;
  end
else
  begin
  frmmensaje.Show;
  ban:=1;
      querys('Insert cliente_zonas (cid,atid,znum,nota,nombre,idprotocolo,fecha,hora,usuario) '+
             ' Select '+edclave.text+',zonas_default.atid,zonas_default.znum,zonas_default.nota,concat( ''('' ,zonas_default.atid,'' ) '', alarmas_tipos.nombre),'+
             'zonas_default.idprotocolo, '+quotedstr(datetostr(date))+','+quotedstr(timetostr(time))+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
             ' from zonas_default left join alarmas_tipos on(alarmas_tipos.clave=zonas_default.atid) where zonas_default.idprotocolo ='+quotedstr(idprotocolo), 1, sqlgeneral);

      bpcambios('clientes', edclave.text, 'idcliente');
      querys('update clientes set idprotocolo='+quotedstr(idprotocolo)+' , usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' , fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where idcliente ='+quotedstr(edclave.text), 1, sqlgeneral);
      apcambios('idcliente', edclave.text, 'clientes', 'frmZonasClientes');
  frmmensaje.close;
  btndefault.Enabled := false;
  ban:=0;
  application.messagebox('Se han agregado las Zonas Default', 'Aviso', MB_ICONINFORMATION);
  btnalta.Caption:='&Alta';
  btnalta.Hint:='Dar de Alta las Zonas Default del Cliente';
  btnalta.enabled:=true;
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar esta Ventana';
  btnalta.ImageIndex:=5;
  //btnborrar.Enabled:=false;
  //btnmodificar.Enabled:=false;
  edtipo.Enabled:=false;
  edzona.Enabled:=false;
  eddescripcion.Enabled:=false;
  edprotocolo.Enabled:=false;
  tblclizon.active := true;
  tblclizon.first;
  edtipo.text:= tblclizon.fieldbyname('atid').AsString;
  edzona.text:= tblclizon.fieldbyname('znum').AsString;
  idprotocolo:= tblclizon.fieldbyname('idprotocolo').AsString;
  zonaid:=tblclizon.fieldbyname('znum').AsString;
  prototex;

  for i:=0 to screen.FormCount - 1 do
    if screen.Forms[i].Name = 'frmclientes' then
      begin
        if (screen.Forms[i] as Tfrmclientes).cboprotocolos.Showing then
           (screen.Forms[i] as Tfrmclientes).cboprotocolos.text := edprotocolo.text;
      end;

if eshija = false then
    begin
    edclave.Enabled:=true;
    edclave.Text:='';
    edclave.SetFocus;
    edprotocolo.Text := '';
    end
else
  begin
  btnborrar.enabled := true;
  btnmodificar.enabled := true;
  Gridzona.enabled := true;
  end;
end;

ban:=0;
end;

procedure TfrmZonasCliente.edprotocoloNotInList(Sender: TObject);
begin
edprotocolo.itemindex := 0;
end;

procedure TfrmZonasCliente.edprotocoloChange(Sender: TObject);
begin
edtipo.text := '';
edzona.clear;
eddescripcion.text := '';
eddestipo.text := '';
end;

procedure TfrmZonasCliente.btnnodefClick(Sender: TObject);
var i:integer;
begin
if MessageDlg('Desea eliminar todas las Zonas del Cliente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  with frmautentificacion do
    begin
    showmodal;
    if btnverificar.ModalResult = mrok then
      begin
      querys('select * from UCTabUsers left join UCTabRightsEX on (UCTabUsers.UCIdUser=UCTabRightsEX.UCIdUser) where UCCompName = ''btnnodef'' and UCTabUsers.UCLogin = '+quotedstr(frmautentificacion.edusuario.Text), 0, sqlgeneral);
      if sqlgeneral.RecordCount > 0 then
        application.MessageBox('El usuario no tiene derechos', 'Aviso', MB_ICONSTOP)
      else
        begin
        if MessageDlg('Esta seguro de eliminar todas las Zonas del Cliente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
            querys('Delete from cliente_zonas where cid='+idcliente, 1, sqlgeneral);

            bpcambios('clientes', edclave.text, 'idcliente');
            querys('update clientes set idprotocolo=0 , usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' , fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where idcliente ='+quotedstr(edclave.text), 1, sqlgeneral);
            apcambios('idcliente', edclave.text, 'clientes', 'frmZonasClientes');

            for i:=0 to screen.FormCount - 1 do
              if screen.Forms[i].Name = 'frmclientes' then
               begin
               if (screen.Forms[i] as Tfrmclientes).cboprotocolos.Showing then
                  (screen.Forms[i] as Tfrmclientes).cboprotocolos.text := edprotocolo.text;
               end;

            btnnodef.Enabled := false;
            btnconver.enabled := false;
            btndefault.Enabled:=true;
            edprotocolo.text:='';
            edtipo.text:='';
            eddescripcion.text:='';
            eddestipo.text:='';
            edzona.text:='';
            edtipo.Enabled :=false;
            edzona.Enabled :=false;
            eddestipo.Enabled :=false;
            edzona.Enabled :=false;
            eddescripcion.Enabled :=false;
            edprotocolo.enabled:=true;
            btnmodificar.Enabled :=false;
            btnmodificar.Caption:='&Editar';
            btnmodificar.hint:='Editar los datos de la Zona del Cliente Actual';
            btnmodificar.ImageIndex:=2;
            btnborrar.enabled := false;
            tblclizon.active := false;
            edprotocolo.setfocus;
            end;
        end;
      end;
    end;
  end;
end;

procedure TfrmZonasCliente.DBGrid1DblClick(Sender: TObject);
begin
btnmodificar.OnClick(self);
end;

procedure TfrmZonasCliente.GridZonaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
idprotocolo:=tblclizon.Fields[6].AsString;
prototex;
edtipo.text:=tblclizon.Fields[2].AsString;
edzona.text:=tblclizon.Fields[3].AsString;
zonaid:=tblclizon.Fields[3].AsString; 
end;

procedure TfrmZonasCliente.FormCreate(Sender: TObject);
begin
 eshija:= false;
end;

procedure TfrmZonasCliente.GridZonaDBTableView1DblClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Guardar' then
  btnmodificar.Caption := '&Editar';
btnmodificar.OnClick(self);

end;

procedure TfrmZonasCliente.eddescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key := #0;
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmZonasCliente.edprotocoloKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmZonasCliente.convertirold;
var
  zone_num,cadena:string;
  banq, i:integer;
begin
banq:=0;   //verifica que se realicen los querys de las zonas CC, E8, ...
if (application.MessageBox(pchar('Las Zonas seran afectadas y no podra ser cancelado.'+chr(13)+'Esta seguro de convertir las zonas a protocolo SIA?'), 'Cuidado',mb_yesno+mb_iconwarning) = idyes) then
  begin
  querys('delete from cliente_zonas where cid='+quotedstr(edclave.text)+' and atid=7', 1, sqlgeneral);

  //cambia las zonas del cliente una por una al nuevo formato sia
  querys('select * from cliente_zonas where cid='+quotedstr(edclave.text)+' order by atid,znum', 0, sqlgeneral);

  frmmensaje.Show;
  bpcambios('cliente_zonas', edclave.text, 'cid');
  sqlgeneral.First;
  while not sqlgeneral.Eof do
  begin
    zone_num:='';
    cadena:='';
    sqlgen.Close;
    sqlgen.SQL.Clear;
    zone_num:=sqlgeneral.fieldbyname('znum').asstring;
    if length(zone_num)=1 then
      zone_num:='0'+zone_num;
    cadena:=sqlgeneral.fieldbyname('nombre').asstring;
    delete(cadena,1,5);

    try
      with sqlgen do
        begin
        case sqlgeneral.FieldByName('atid').asinteger of
          0:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('RP')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'RP'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=0 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          1:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('BA')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'BA'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=1 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          2:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('HA')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'HA'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=2 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          3:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('FA')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'FA'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=3 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          4:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('CL')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'CL'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=4 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          5:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('OP')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'OP'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=5 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          6:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('MA')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'MA'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=6 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          8:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('AT')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'AT'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=8 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
          9:SQL.Add('update cliente_zonas set znum='+quotedstr(zone_num)+',atid='+quotedstr('PA')+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'PA'+' )'+cadena)+',idprotocolo= 2'+' where cid='+quotedstr(edclave.text)+' and atid=9 and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring));
        end;
      end;
    except
      with sqlgeneral do
        begin
        if FieldByName('atid').asstring + FieldByName('znum').asstring = 'E8' then
          begin
          sqlgen.SQL.Add('update cliente_zonas set znum='+quotedstr('00')+',atid='+quotedstr('AR')+',idprotocolo= 2'+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'AR'+' )'+cadena)+' where (cid='+quotedstr(edclave.text)+') and (atid='+quotedstr('E')+' and znum='+quotedstr('8')+')');
          banq:=1;
          end;
        if FieldByName('atid').asstring + FieldByName('znum').asstring = 'BB' then
          begin
          sqlgen.SQL.Add('update cliente_zonas set znum='+quotedstr('00')+',atid='+quotedstr('YT')+',idprotocolo= 2'+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'YT'+' )'+cadena)+' where (cid='+quotedstr(edclave.text)+') and (atid='+quotedstr('B')+' and znum='+quotedstr('B')+')');
          banq:=1;
          end;
        if FieldByName('atid').asstring + FieldByName('znum').asstring = 'CC' then
          begin
          sqlgen.SQL.Add('update cliente_zonas set znum='+quotedstr('00')+',atid='+quotedstr('RX')+',idprotocolo= 2'+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'RX'+' )'+cadena)+' where (cid='+quotedstr(edclave.text)+') and (atid='+quotedstr('C')+' and znum='+quotedstr('C')+')');
          banq:=1;
          end;
        if FieldByName('atid').asstring + FieldByName('znum').asstring = 'EB' then
          begin
          sqlgen.SQL.Add('update cliente_zonas set znum='+quotedstr('00')+',atid='+quotedstr('YR')+',idprotocolo= 2'+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',nombre='+quotedstr('( '+'YR'+' )'+cadena)+' where (cid='+quotedstr(edclave.text)+') and (atid='+quotedstr('E')+' and znum='+quotedstr('B')+')');
          banq:=1;
          end;

        if (fieldbyname('idprotocolo').AsString = '1') and (banq <> 1) then
          begin
          sqlgen.SQL.Add('update cliente_zonas set idprotocolo= 2 , usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' , fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where cid ='+quotedstr(edclave.text));
          banq:=0;
          end;
      end;
    end;

  IF sqlgen.SQL.Text <> '' then
    sqlgen.Execute;
  sqlgeneral.Next;
  end;
edprotocolo.text := 'SIA';
  for i:=0 to screen.FormCount - 1 do
    if screen.Forms[i].Name = 'frmclientes' then
      begin
        if (screen.Forms[i] as Tfrmclientes).cboprotocolos.Showing then
           (screen.Forms[i] as Tfrmclientes).cboprotocolos.text := edprotocolo.text;
      end;

  frmmensaje.Close;
  application.MessageBox('Las Zonas han sido cambiadas a protocolo SIA', 'Aviso', MB_ICONINFORMATION);
  btnconver.Enabled := false;
  apcambios('cid', edclave.text, 'cliente_zonas', 'frmZonasClientes');
end;
btncancelar.onclick(self);
bpcambios('clientes', edclave.text, 'idcliente');
querys('update clientes set idprotocolo=2 , usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' , fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where idcliente ='+quotedstr(edclave.text), 1, sqlgeneral);
apcambios('idcliente', edclave.text, 'clientes', 'frmZonasClientes');
end;

procedure TfrmZonasCliente.btnconverClick(Sender: TObject);
begin
convertirold;
//convertir;
end;

procedure TfrmZonasCliente.convertir;
var
  zone_num,cadena:string;  //   , c
  i:integer;
begin
if edprotocolo.Text <> rgconver.Items.strings[rgconver.itemindex] then
  if (application.MessageBox(pchar('Estas seguro de convertir del protocolo '+edprotocolo.Text+' al protocolo '+rgconver.Items.strings[rgconver.itemindex]), 'Atencion', mb_iconinformation+mb_yesno))=idyes then
    begin
    if (application.MessageBox(pchar('Las Zonas seran afectadas y no podra ser cancelado.'+chr(13)+'Esta seguro de convertir las zonas a protocolo SIA?'), 'Cuidado',mb_yesno+mb_iconwarning) = idyes) then
     begin
      frmmensaje.Show;


     querys('delete from cliente_zonas where cid='+quotedstr(edclave.text)+' and atid=7', 1, sqlgeneral);

     querys('select * from cliente_zonas where cid='+quotedstr(edclave.text)+' order by atid,znum', 0, sqlgeneral);
     bpcambios('cliente_zonas', edclave.text, 'cid');
     sqlgeneral.First;
     while not sqlgeneral.Eof do
       begin
       zone_num:='';
       cadena:='';

      cadena:=sqlgeneral.fieldbyname('nombre').asstring;
      delete(cadena,1,5);
      querys('Select idconversion, nombre, p4x2, psia, pcontactid, zonas4x2, if(zonas4x2 is null or '+
             'ConvertirZonas.zonas4x2 = "", "no", "si") as dif from ConvertirZonas where p'+
             AnsiLowerCase(edprotocolo.text)+'='+sqlgeneral.fieldbyname('atid').asstring , 0, qtipo);
      if length(sqlgeneral.fieldbyname('znum').asstring)=1 then
         zone_num:='0'+sqlgeneral.fieldbyname('znum').asstring;
          {
         c:='Update cliente_zonas set atid="'+qtipo.fieldbyname('p'+
             AnsiLowerCase(rgconver.Items.strings[rgconver.itemindex])).asstring+'", znum='+
             quotedstr(zone_num)+',nombre="'+'( '+qtipo.fieldbyname('p'+
             AnsiLowerCase(rgconver.Items.strings[rgconver.itemindex])).asstring+' )'+cadena+'",idprotocolo= '+
             inttostr(rgconver.itemindex+1)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
             ',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where cid='+
             quotedstr(edclave.text)+' and atid='+sqlgeneral.fieldbyname('atid').asstring+
             ' and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring);}
      querys('Update cliente_zonas set atid="'+sqlgeneral.fieldbyname('p'+
             AnsiLowerCase(rgconver.Items.strings[rgconver.itemindex])).asstring+'", znum='+
             quotedstr(zone_num)+',nombre="'+'( '+qtipo.fieldbyname('p'+
             AnsiLowerCase(rgconver.Items.strings[rgconver.itemindex])).asstring+' )'+cadena+'",idprotocolo= '+
             inttostr(rgconver.itemindex+1)+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
             ',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where cid='+
             quotedstr(edclave.text)+' and atid='+sqlgeneral.fieldbyname('atid').asstring+
             ' and znum='+quotedstr(sqlgeneral.fieldbyname('znum').asstring), 1, sqlgen);
      sqlgeneral.Next;

    end;


edprotocolo.text := rgconver.Items.strings[rgconver.itemindex];
  for i:=0 to screen.FormCount - 1 do
    if screen.Forms[i].Name = 'frmclientes' then
      begin
        if (screen.Forms[i] as Tfrmclientes).cboprotocolos.Showing then
           (screen.Forms[i] as Tfrmclientes).cboprotocolos.text := edprotocolo.text;
      end;

  frmmensaje.Close;
  application.MessageBox(pchar('Las Zonas han sido cambiadas a protocolo '+rgconver.Items.strings[rgconver.itemindex]), 'Aviso', MB_ICONINFORMATION);
  btnconver.Enabled := false;
  apcambios('cid', edclave.text, 'cliente_zonas', 'frmZonasClientes');



     end;
     btncancelar.onclick(self);
bpcambios('clientes', edclave.text, 'idcliente');
querys('update clientes set idprotocolo='+inttostr(rgconver.itemindex+1)+' , usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' , fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+' where idcliente ='+quotedstr(edclave.text), 1, sqlgeneral);
apcambios('idcliente', edclave.text, 'clientes', 'frmZonasClientes');

    end;
end;

procedure TfrmZonasCliente.btnimprimirClick(Sender: TObject);
begin
querys('Select '+ClienteNombre('c')+' as nombre, cz.atid, znum, cz.nota, cz.nombre, c.idcliente, p.protocolo '+
       'from cliente_zonas cz left join clientes c on c.idcliente=cz.cid left join protocolos p on '+
       'p.idprotocolo=cz.idprotocolo where cid='+edclave.text, 0, dmreportes.sqlgeneral);
operacionreporte('CentralClientesZonas','', 'IMP', 1);
end;

End.
