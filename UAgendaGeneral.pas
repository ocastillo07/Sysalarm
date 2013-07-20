unit UAgendaGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, RzDBEdit, DB, MyAccess, RzButton, ComCtrls,
  RzDTP, RzLabel, Mask, RzEdit, RzBtnEdt, MemDS, DBAccess, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, ExtCtrls, RzDBNav, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TfrmAgendaGeneral = class(TForm)
    edclave: TRzButtonEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    TPFecha: TRzDateTimePicker;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzLabel9: TRzLabel;
    sqlgeneral: TMyQuery;
    DSagenda: TDataSource;
    edevento: TRzDBMemo;
    TPHora: TRzDateTimePicker;
    edcliente: TRzButtonEdit;
    RzLabel1: TRzLabel;
    GAgendaDBTableView1: TcxGridDBTableView;
    GAgendaLevel1: TcxGridLevel;
    GAgenda: TcxGrid;
    colcliente: TcxGridDBColumn;
    colevento: TcxGridDBColumn;
    colfecha: TcxGridDBColumn;
    colhora: TcxGridDBColumn;
    navegador: TRzDBNavigator;
    tblagenda: TMyQuery;
    tblagendaidevento: TIntegerField;
    tblagendaideventoper: TIntegerField;
    tblagendaidusuario: TIntegerField;
    tblagendaevento: TMemoField;
    tblagendaidcliente: TIntegerField;
    tblagendafechaevento: TStringField;
    tblagendahoraevento: TStringField;
    tblagendausuario: TStringField;
    tblagendafecha: TStringField;
    tblagendahora: TStringField;
    btnimprimir: TRzBitBtn;
    tpdesde: TRzDateTimePicker;
    tphasta: TRzDateTimePicker;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edclienteKeyPress(Sender: TObject; var Key: Char);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure edclienteButtonClick(Sender: TObject);
    procedure tblagendaBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GAgendaDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TPFechaKeyPress(Sender: TObject; var Key: Char);
    procedure TPHoraKeyPress(Sender: TObject; var Key: Char);
    procedure edeventoKeyPress(Sender: TObject; var Key: Char);
    procedure btnimprimirClick(Sender: TObject);
    procedure tblagendaAfterScroll(DataSet: TDataSet);
  private
    idevento:integer;
    idusuario:string;
    procedure habilita(hab:boolean);
    procedure habilitabtn(habb:boolean);
    procedure buscarlocate;
    procedure llenacampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaGeneral: TfrmAgendaGeneral;

implementation

uses Udm, Uprincipal, Ubusquedas, Urecursos, Udmrep;

{$R *.dfm}

procedure TfrmAgendaGeneral.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
    querys('select max(ideventoper)from AgendaGeneral where idusuario='+quotedstr(idusuario),0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    edclave.Enabled:=false;
    //pone la tabla en modo de insercion
    tblagenda.Active:=true;
    tblagenda.Insert;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    habilita(true);
    habilitabtn(false);
    btnalta.Enabled:=true;
    edcliente.Text := '';
    TPFecha.Date := FechaServidor;
    TPHora.Time := strtotime('12:00:00 p.m.');
    edcliente.SetFocus;
    end
  else
    begin
   // if ExisteNombre(ednombre,'select nombre from AgendaGeneral where ideventoper<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
    //  exit;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Evento a la Agenda General';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    frmprincipal.ucprincipal.Log('Dio de Alta un Evento a la Agenda General',1);
    //trae el maximo idtipo + 1
    querys('select max(idevento) from AgendaGeneral',0,sqlgeneral);
    idevento := sqlgeneral.Fields.Fields[0].AsInteger+1;
     //guarda los datos
     tblagenda.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update AgendaGeneral set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idevento='+edclave.Text,1,sqlgeneral);
     tblagenda.Active:=false;
     tblagenda.Active:=true;
     habilitabtn(true);
     tblagenda.First;
     llenacampos;
     habilita(false);
     edclave.Enabled:=true;
     edclave.SetFocus;
   end;
end;

procedure TfrmAgendaGeneral.btnborrarClick(Sender: TObject);
begin
//valida que no se use en la tabla de travel
 { querys('select ideventoper from pedidos where ideventoper='+edclave.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    application.MessageBox('Esta AgendaGeneral esta siendo usado por un Pedido y no podra ser eliminada hasta que se borre el Pedido o haga referencia a otra AgendaGeneral!','Cuidado',mb_ok+mb_iconinformation)
  else
    begin  }
    if application.MessageBox('Estas Seguro que deseas borrar esta AgendaGeneral?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
        begin
        frmprincipal.ucprincipal.Log('Elimino el evento de la Agenda General '+tblagendaideventoper.asstring,3);
        tblagenda.Delete;
        application.MessageBox('Eliminacion del Evento de la Agenda General Exitosa','Información',mb_ok);
        tblagenda.Active:=false;   
        tblagenda.Active:=true;
        habilitabtn(true);
        tblagenda.First;
        llenacampos;
        edclave.SetFocus;
        end;
   // end;
end;

procedure TfrmAgendaGeneral.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     habilita(true);
     habilitabtn(false);
     btnmodificar.enabled:=true;
     edclave.Enabled:=false;
     tblagenda.Edit;
     edevento.setfocus;
   end
else
  begin
   // if ExisteNombre(ednombre,'select nombre from AgendaGeneral where ideventoper<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
      // exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Agenda General actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     frmprincipal.ucprincipal.Log('Edito el evento de la Agenda General '+tblagendaideventoper.AsString,2);
     tblagenda.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update AgendaGeneral set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where idevento='+edclave.Text,1,sqlgeneral);
     tblagenda.active:=false;
     tblagenda.Active:=true;
     habilitabtn(true);
     tblagenda.First;
     llenacampos;
     edclave.Enabled:=true;
     edclave.SetFocus;
     end;
end;

procedure TfrmAgendaGeneral.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblagenda.Cancel;
     tblagenda.Active:=false;
     navegador.Enabled:=false;
     GAgenda.enabled := false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los eventos de la AgendaGeneral Actual';
         btnmodificar.ImageIndex:=2;
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un evento de la Agenda General';
          btnalta.ImageIndex:=5;
        end;
       tblagenda.Active:=true;
       habilitabtn(true);
       tblagenda.First;
       llenacampos;
       habilita(false);
       edclave.Enabled:=true;
       edclave.SetFocus;
 end
else
release;
end;

procedure TfrmAgendaGeneral.edclaveButtonClick(Sender: TObject);
 var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmAgendaGeneral.edclaveChange(Sender: TObject);
begin
  if edclave.Text = '' then begin
    //tblagenda.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    edevento.text:='';
    edcliente.text:='';
  end;
end;

procedure TfrmAgendaGeneral.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
if key='.' then
 key:=#0;
if (key = #13) then
   begin
     key:=#0;
     if edclave.Text <> '' then
        begin
        querys('Select idevento from AgendaGeneral where idusuario='+quotedstr(idusuario)+' and ideventoper='+quotedstr(edclave.text), 0, sqlgeneral);
        idevento := sqlgeneral.fieldbyname('idevento').AsInteger;
        buscarlocate;
        end
     else
        edclave.OnButtonClick(self);
   end;       
   if key = #27 then
     begin
      key:=#0;
     edclave.Text:='';
  end;
end;

procedure TfrmAgendaGeneral.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select ideventoper as id, evento, fecha as Fecha,hora as Hora, idevento From AgendaGeneral where idusuario='+quotedstr(idusuario)+' order by ideventoper';
        campo_retorno:='idevento';
        campo_busqueda:='nombre';
        tblorigen := 'AgendaGeneral';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           tblagenda.Active:=true;
           idevento:=strtoint(resultado);
           buscarlocate;
           habilitabtn(true);
           end;
        end;
    end;
end;

procedure TfrmAgendaGeneral.edclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
 key:=ValidaNumeros(key,true);
if (key = #13) then
   begin
     key:=#0;
     if edcliente.Text <> '' then
        sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0)
     else
        edcliente.OnButtonClick(self);
   end;    
   if key = #27 then
     begin
      key:=#0;
     edcliente.Text:='';
  end;
end;

procedure TfrmAgendaGeneral.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
   llenacampos;
end;

procedure TfrmAgendaGeneral.buscarlocate;
begin
//tblagenda.Active:=true;
if tblagenda.Locate('idevento',idevento,[]) then
    begin
    habilitabtn(true);
    llenacampos;
    end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa AgendaGeneral no Existe','Información',mb_ok+mb_iconinformation);
    tblagenda.Active:=false;
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmAgendaGeneral.habilita(hab:boolean);
begin
edevento.Enabled := hab;
edcliente.Enabled := hab;
TPFecha.Enabled := hab;
TPHora.Enabled := hab;
end;

procedure TfrmAgendaGeneral.habilitabtn(habb:boolean);
begin
    btnmodificar.Enabled:=habb;
    btnalta.Enabled:=habb;
    btnborrar.Enabled:=habb;
    navegador.Enabled:=habb;
    GAgenda.enabled := habb;
end;

procedure TfrmAgendaGeneral.FormShow(Sender: TObject);
begin
tpdesde.date := FechaServidor;
tphasta.date := FechaServidor;

querys('Select usuarios.idusuario, if(usuarios.apaterno is NULL or usuarios.apaterno='''', usuarios.nombre, if(usuarios.amaterno is NULL or usuarios.amaterno='''', concat(usuarios.nombre, '' '', usuarios.apaterno), '+
       'concat(usuarios.nombre, '' '', usuarios.apaterno, '' '', usuarios.amaterno))) as Nombre, usuarios.codigo From usuarios Left Join UCTabUsers ON ( usuarios.idusuario = UCTabUsers.UCIdUser) '+
       'where UCTabUsers.UCLogin='+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName), 0, dmreportes.sqlgeneral2);

idusuario := dmreportes.sqlgeneral2.fieldbyname('idusuario').Asstring;
querys('SELECT * FROM AgendaGeneral where idusuario='+quotedstr(idusuario)+' order by fechaevento, horaevento', 0, tblagenda);
tblagenda.Active := true;
//frmagendageneral.Caption := 'Agenda del Usuario '+sqlgeneral.fieldbyname('Nombre').asstring;
tblagenda.First;
llenacampos;
end;

procedure TfrmAgendaGeneral.edclienteButtonClick(Sender: TObject);
begin
  with frmbusquedas do
    begin
    query:='Select idcliente, nombre, apaterno, amaterno, rsocial from clientes order by idcliente';
    campo_retorno:='idcliente';
    campo_busqueda:='nombre';
    tblorigen := 'clientes';
    lbldesc.Caption:='Busqueda por Nombre:';
    ShowModal;
    if resultado <> '' then
      begin
      tblagenda.Active:=true;
      edcliente.Text:= resultado;
      end;
    end;
end;

procedure TfrmAgendaGeneral.tblagendaBeforePost(DataSet: TDataSet);
begin
tblagendaideventoper.Asstring:=edclave.Text;
tblagendaidevento.Asinteger := idevento;
tblagendaidusuario.AsString := idusuario;
tblagendaidcliente.AsString := edcliente.text;
tblagendafechaevento.AsString := datetostr(TPFecha.Date);
tblagendahoraevento.Asstring := timetostr(TPHora.DateTime);
end;

procedure TfrmAgendaGeneral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmAgendaGeneral.GAgendaDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
llenacampos;
end;

procedure TfrmAgendaGeneral.llenacampos;
begin
  edclave.text := tblagendaideventoper.AsString;
  edcliente.text:= tblagendaidcliente.AsString;
  TPFecha.DateTime := tblagendafechaevento.AsDateTime;
  TPHora.DateTime := tblagendahoraevento.AsDateTime;
end;



procedure TfrmAgendaGeneral.TPFechaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmAgendaGeneral.TPHoraKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmAgendaGeneral.edeventoKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmAgendaGeneral.btnimprimirClick(Sender: TObject);
begin
querys('SELECT * FROM AgendaGeneral where idusuario='+quotedstr(idusuario)+' and (fechaevento between '+quotedstr(datetostr(tpdesde.date))+' and '+quotedstr(datetostr(tphasta.date))+' ) order by fechaevento, horaevento', 0, dmreportes.sqlgeneral);
operacionreporte('AgendaGeneral', '', 'IMP', 1);
end;

procedure TfrmAgendaGeneral.tblagendaAfterScroll(DataSet: TDataSet);
begin
idevento:= tblagendaidevento.AsInteger; 
end;

end.
