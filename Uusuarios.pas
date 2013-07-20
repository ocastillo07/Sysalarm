{//---------------------------------------------------------------------------\\
2009/04/02 dalyla que se grabe usuario fecha y hora
--------------------------------------------------------------------------------
2008/06/16 dalyla grabar puesto del area correspondiente
2008/01/08 dalila Opciones de derechos pasar a pant. derechos adicionales
2007/12/17 Oscar Agrege checkbox de modifica costo
2007/11/03 Dalila instalador disponible para toda el area de ventas
2007/10/13 Dalila Campo de Minuta Coorporativa

}//---------------------------------------------------------------------------\\
unit Uusuarios;

interface

uses
  Windows,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, RzDBNav, StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit,
  ExtCtrls, RzPanel, RzButton, RzCmboBx,DBGrids, Menus, DB, MemDS,
  DBAccess, MyAccess, UCBase, Grids, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDBEdit, RzDBCmbo, ComCtrls, ToolWin,
  RzBtnEdt, RzRadChk, RzDBChk, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, cxCheckBox;

type
  Tfrmusuarios = class(TForm)
    lblclave: TRzLabel;
    dbnavegador: TRzDBNavigator;
    gbusuarios: TGroupBox;
    ednombre: TRzDBEdit;
    lblnombre: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    lblmovil: TRzLabel;
    edmovil: TRzEdit;
    edciudad: TRzDBEdit;
    edcalle: TRzDBEdit;
    lblcalle: TRzLabel;
    lblciudad: TRzLabel;
    edestado: TRzDBEdit;
    lblestado: TRzLabel;
    cbocolonias: TRzComboBox;
    lblcolonia: TRzLabel;
    edemail2: TRzDBEdit;
    lblemail2: TRzLabel;
    edemail1: TRzDBEdit;
    lblemail1: TRzLabel;
    cboarea: TRzComboBox;
    lblarea: TRzLabel;
    lblcurp: TRzLabel;
    cbopuesto: TRzComboBox;
    lblpuesto: TRzLabel;
    lblrfc: TRzLabel;
    btnmodificar: TRzBitBtn;
    tblusuarios: TMyTable;
    DSusuarios: TDataSource;
    sqlgeneral: TMyQuery;
    sqltelefonos: TMyQuery;
    DStelefonos: TDataSource;
    btncancelar: TRzBitBtn;
    lblsexo: TRzLabel;
    RzLabel3: TRzLabel;
    lblapaterno: TRzLabel;
    edapaterno: TRzDBEdit;
    edamaterno: TRzDBEdit;
    lblamaterno: TRzLabel;
    dtcumpleanos: TRzDBDateTimeEdit;
    cbosexo: TRzDBComboBox;
    lblestatus: TRzLabel;
    mmdescripcion: TRzDBMemo;
    RzLabel5: TRzLabel;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    FontDialog1: TFontDialog;
    edclave: TRzButtonEdit;
    Image1: TImage;
    edcodigo: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzLabel6: TRzLabel;
    DSSecDisp: TDataSource;
    btntelefonos: TRzBitBtn;
    cboestatus: TRzComboBox;
    CxSecDispDBTableView1: TcxGridDBTableView;
    CxSecDispLevel1: TcxGridLevel;
    CxSecDisp: TcxGrid;
    Nomsector: TcxGridDBColumn;
    idSector: TcxGridDBColumn;
    RzLabel7: TRzLabel;
    SqlSecDisp: TMyQuery;
    CxSegAsig: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    SqlSecAsig: TMyQuery;
    DSSecAsig: TDataSource;
    RzLabel8: TRzLabel;
    btnAsignaSec: TRzButton;
    btnAsigSeca: TRzButton;
    cbosector: TRzComboBox;
    edcurp: TcxDBMaskEdit;
    edrfc: TcxDBMaskEdit;
    chkonline: TRzDBCheckBox;
    cboturno: TRzComboBox;
    RzLabel9: TRzLabel;
    edcp: TRzDBEdit;
    ednumero: TRzDBEdit;
    RzLabel10: TRzLabel;
    edCodConmutador: TRzDBEdit;
    edcodigo2: TRzDBEdit;
    RzLabel11: TRzLabel;
    edInstalador: TRzButtonEdit;
    RzLabel12: TRzLabel;
    chkDefault: TRzDBCheckBox;
    tblusuariosidusuario: TIntegerField;
    tblusuariosnombre: TStringField;
    tblusuarioscodigo: TStringField;
    tblusuarioscalle: TStringField;
    tblusuariosciudad: TStringField;
    tblusuariosestado: TStringField;
    tblusuariosnumero: TIntegerField;
    tblusuarioscp: TIntegerField;
    tblusuariosrfc: TStringField;
    tblusuarioscurp: TStringField;
    tblusuariosemail1: TStringField;
    tblusuariosemail2: TStringField;
    tblusuariosidtel: TIntegerField;
    tblusuariosidcol: TIntegerField;
    tblusuariosidfacturacion: TIntegerField;
    tblusuariosidarea: TIntegerField;
    tblusuariosidpuesto: TIntegerField;
    tblusuarioscumpleanos: TDateField;
    tblusuariossexo: TStringField;
    tblusuariosapaterno: TStringField;
    tblusuariosamaterno: TStringField;
    tblusuariosestatus: TBooleanField;
    tblusuariosdescripcion_estatus: TMemoField;
    tblusuariosidsector: TIntegerField;
    tblusuariosFacturaP: TBooleanField;
    tblusuariosFacturaD: TBooleanField;
    tblusuariosFacturaC: TBooleanField;
    tblusuariosonline: TSmallintField;
    tblusuariosPrecioCapturable: TSmallintField;
    tblusuariosidsupervisor: TIntegerField;
    tblusuariosaudittravel: TSmallintField;
    tblusuarioscodigo2: TStringField;
    tblusuariosalta_senales: TSmallintField;
    tblusuariosidturno: TIntegerField;
    tblusuariosCodConmutador: TIntegerField;
    tblusuariosCambiaContrato: TIntegerField;
    tblusuariosModificarServicios: TSmallintField;
    tblusuariosPuedeVender: TSmallintField;
    tblusuariosCrearServicio: TSmallintField;
    tblusuariosModificarInstalaciones: TSmallintField;
    tblusuariosInstalador: TStringField;
    tblusuariosDefaultUsr: TBooleanField;
    tblusuariosCambiarAbogado: TSmallintField;
    tblusuariosTodasUNPedidos: TBooleanField;
    tblusuariosGuardaPresDefault: TBooleanField;
    tblusuariosFinalizaMinuta: TBooleanField;
    tblusuariosAutorizaRequisiciones: TSmallintField;
    tblusuariosidmaq: TIntegerField;
    tblusuariosMinutaGerencial: TIntegerField;
    tblusuariosModificaCosto: TBooleanField;
    tblusuariosusuario: TStringField;
    tblusuariosfecha: TStringField;
    tblusuarioshora: TStringField;
    edlogin: TRzEdit;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    edprofile: TRzEdit;
    RzLabel15: TRzLabel;
    lbufh: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbnavegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnbuscarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure tblusuariosBeforePost(DataSet: TDataSet);
    procedure btntelefonosClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure cbocoloniasSelect(Sender: TObject);
    procedure cbocoloniasKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboareaSelect(Sender: TObject);
    procedure dtcumpleanosClick(Sender: TObject);
    procedure cboestatusKeyPress(Sender: TObject; var Key: Char);
    procedure edciudadEnter(Sender: TObject);
    procedure edestadoEnter(Sender: TObject);
    procedure cbosexoKeyPress(Sender: TObject; var Key: Char);
    procedure dtcumpleanosEnter(Sender: TObject);
    procedure mmdescripcionEnter(Sender: TObject);
    procedure mmdescripcionExit(Sender: TObject);
    procedure tblusuariosAfterEdit(DataSet: TDataSet);
    procedure edclaveButtonClick(Sender: TObject);
    procedure ednombreKeyPress(Sender: TObject; var Key: Char);
    procedure edcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure dtcumpleanosKeyPress(Sender: TObject; var Key: Char);
    procedure cbocoloniasExit(Sender: TObject);
    procedure cboareaNotInList(Sender: TObject);
    procedure cbocoloniasNotInList(Sender: TObject);
    procedure cbocoloniasMatch(Sender: TObject);
    procedure tblusuariosAfterScroll(DataSet: TDataSet);
    procedure SecDispV(Sender: TObject);
    procedure SqlSecAsigAfterOpen(DataSet: TDataSet);
    procedure SqlSecDispAfterOpen(DataSet: TDataSet);
    procedure btnAsignaSecClick(Sender: TObject);
    procedure btnAsigSecaClick(Sender: TObject);
    procedure cxGridDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbosectorNotInList(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboturnoEnter(Sender: TObject);
    procedure edCodConmutadorKeyPress(Sender: TObject; var Key: Char);
    procedure edInstaladorButtonClick(Sender: TObject);
    procedure cbopuestoExit(Sender: TObject);
    procedure cboareaExit(Sender: TObject);
    procedure tblusuariosAfterClose(DataSet: TDataSet);
    procedure edclaveChange(Sender: TObject);
  private
    { Private declarations }
   idtelefono:string;
    procedure trae_col_mov(Sender: Tobject);
    procedure actualiza_telefonos(const Telefono:string;Sender: TObject);
    procedure buscarlocate;
    procedure TraeSectores;
  public
    { Public declarations }
  end;

var
  frmusuarios: Tfrmusuarios;

implementation

uses Ubusquedas, Uprincipal, Udm, Utel, Urecursos;

{$R *.dfm}

procedure Tfrmusuarios.TraeSectores;
begin
    querys('select nombre from sectores where idsector = '+tblusuariosidsector.AsString,0,sqlgeneral);
    cbosector.Text := sqlgeneral.fieldbyname('nombre').AsString;
    //refresca los sectores disponibles
    SqlSecDisp.Close;
    SqlSecDisp.open;
    //refresca los sectores asignados
    SqlSecAsig.Close;
    SqlSecAsig.ParamByName('user').Value := tblusuariosidusuario.AsString;
    SqlSecAsig.Open;
end;

procedure Tfrmusuarios.buscarlocate;
begin
tblusuarios.Active:=true;
if tblusuarios.Locate('idusuario',edclave.Text,[]) then
   begin
    trae_col_mov(self);
    querys('select nombre from sectores where idsector = '+tblusuariosidsector.AsString,0,sqlgeneral);
    cbosector.Text := sqlgeneral.fieldbyname('nombre').AsString;
    edclave.SetFocus;
    btnmodificar.Enabled:=true;
    TraeSectores;
    lbufh.Caption := UFH(tblusuarios);
         if (cboarea.Text = 'VENTAS') {and (cbopuesto.Text = 'VENDEDOR'))} then
            edInstalador.Enabled := true
         else
            edInstalador.Enabled := false;

    edInstalador.Text := tblusuariosInstalador.AsString;

   end
else
  begin
    SqlSecAsig.Close;
    SqlSecDisp.Close;
    btnmodificar.Enabled:=false;
    application.MessageBox('Esa Clave de Usuario no Existe','Información',mb_ok+mb_iconinformation);
    edclave.Text:='';
    tblusuarios.close;
    edclave.SetFocus;
  end;


end;



procedure tfrmusuarios.actualiza_telefonos(const telefono:string;Sender: TObject);
begin
//trae los numeros telefonicos del usuario actual
with sqltelefonos do
   begin
     close;
     sql.Clear;
     sql.Add('select telefono as Telefono,tipo_tel as Tipo from telefonos where idtel='+telefono);
     open;
end;
end;


procedure tfrmusuarios.trae_col_mov(Sender: TObject);
begin
//trae los nombres de las colonias y los carga en el combo
CargaCombo('SELECT colonias.nombre FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol)','Colonia(s)',cbocolonias);
    if dsusuarios.DataSet.fieldbyname('idcol').AsString <> '' then
     begin
      {Proceimiento para traer el nombre de la colonia y del movil dependiendo de la idcol
      que se la halla asigando al usuario}
      querys('SELECT sectores.nombre,colonias.nombre as nom_col FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE col_sector.idcol ='+dsusuarios.DataSet.fieldbyname('idcol').AsString,0,sqlgeneral);
      cbocolonias.Text:=sqlgeneral.fieldbyname('nom_col').AsString;
      edmovil.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    end
   else
     begin
      cbocolonias.Text:='';
      edmovil.Text:='';
     end;
if tblusuariosidturno.Asinteger <> 0 then
 begin
  querys('select nombre from turnos where idturno='+tblusuariosidturno.AsString,0,sqlgeneral);
  cboturno.Text := sqlgeneral.fieldbyname('nombre').AsString;
 end
else
 cboturno.Text := '';
edclave.Text:=inttostr(tblusuariosidusuario.AsInteger);
//trae los nombres de las areas
CargaCombo('select nombre from areas','Area(s)',cboarea);
if tblusuariosidarea.AsString <> '' then
   begin
      //trae los nombres de los puestos dependiendo del area actual
    CargaCombo('select nombre from puestos where idarea='+tblusuariosidarea.AsString,'Puesto(s)',cbopuesto);
    //trae el nombre de la area y lo pone el text del combo
    querys('select nombre from areas where idarea='+tblusuariosidarea.AsString,0,sqlgeneral);
    cboarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    end
   else
    cboarea.Text:='';
cbosexo.Text:=tblusuariossexo.AsString;
if tblusuariosidpuesto.AsString <> '' then
    begin
    //aqui tra el nombre del puesto
    querys('select nombre from puestos where idpuesto='+tblusuariosidpuesto.AsString,0,sqlgeneral);
    cbopuesto.Text:=sqlgeneral.fieldbyname('nombre').AsString;
    end
    else
       cbopuesto.Text:='';
    if tblusuariosidtel.asstring <> '' then
       begin

         actualiza_telefonos(tblusuariosidtel.asstring,self);

           end
       else
       begin
        sqltelefonos.Close;

       end;
end;


procedure Tfrmusuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmusuarios.dbnavegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
trae_col_mov(self);
TraeSectores;
edInstalador.Text := tblusuariosInstalador.AsString;
lbufh.Caption := UFH(tblusuarios);
end;

procedure Tfrmusuarios.btnbuscarClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
if edclave.Text='0' then
   self.OnKeyUp(self,codigo,[ssCtrl])
else
begin
if tblusuarios.Locate('idusuario',edclave.Text,[]) then
   begin
    trae_col_mov(self);
    btnmodificar.Enabled:=true;
   end
else
  begin
    btnmodificar.Enabled:=false;
    application.MessageBox('Esa Clave de Usuario no Existe','Información',mb_ok+mb_iconinformation);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;
end;

procedure Tfrmusuarios.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     gbusuarios.Enabled:=true;

     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     gbusuarios.Enabled:=true;
     dbnavegador.Enabled:=false;
     idtelefono:='';
     edclave.Enabled:=false;
     ///btnbuscar.Enabled:=false;
     tblusuarios.Edit;
     ednombre.setfocus;

   end
else
  begin
    if (SqlSecAsig.RecordCount > 0) and (cbosector.Text = '') then
     begin
      application.MessageBox('Debe de Especificar cual es el Sector Default de este usuario!','Aviso',mb_iconinformation);
      cbosector.DroppedDown := true;
      exit;
     end;
     //valida que no exista el codigo tecleado

 if edcodigo.text <> '' then
  begin
querys('select codigo,idusuario from usuarios where codigo='+quotedstr(edcodigo.Text),0,sqlgeneral);
if (sqlgeneral.FieldByName('idusuario').AsString <> edclave.Text) and (sqlgeneral.FieldByName('idusuario').AsString<>'') then
 begin
  application.MessageBox('Ese codigo corto ya existe y no podra utilizarlo','Aviso',mb_iconinformation);
  edcodigo.Text := '';
  exit;
 end;
 end else
   begin
     application.MessageBox('Falta el campo Iniciales!,es necesario para el uso del sistema y reportes','Aviso',mb_iconinformation);
     edcodigo.SetFocus;
     exit;
   end;

 if edcodigo2.text <> '' then
  begin
      //valida que no exista el codigo2 tecleado
querys('select codigo,idusuario from usuarios where codigo2='+quotedstr(edcodigo2.Text),0,sqlgeneral);
if (sqlgeneral.FieldByName('idusuario').AsString <> edclave.Text) and (sqlgeneral.FieldByName('idusuario').AsString<>'') then
 begin
  application.MessageBox('Ese codigo corto de servicios ya existe y no podra utilizarlo','Aviso',mb_iconinformation);
  edcodigo2.Text := '';
  exit
 end;

  end;


     frmprincipal.ucprincipal.Log('Edicion del usuario #'+edclave.Text,0);
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos del Usuario Actual';
     btnmodificar.ImageIndex:=2;
     gbusuarios.Enabled:=false;
     if cbosector.Text <> '' then
      begin
       //trae el idsector para el sector del combo
       querys('select idsector from sectores where nombre = '+quotedstr(cbosector.Text),0,sqlgeneral);
       tblusuariosidsector.AsInteger := sqlgeneral.fieldbyname('idsector').AsInteger;
      end
     else
        tblusuariosidsector.AsInteger := 0;
      
     frmprincipal.ucprincipal.Log('Edito el usuario #'+tblusuariosnombre.AsString,2);
     if cboestatus.ItemIndex = 0 then
       tblusuarios.FieldByName('estatus').AsBoolean:=false
     else
       tblusuarios.FieldByName('estatus').AsBoolean:=true;
     if cboarea.Text = '' then
      tblusuariosidarea.AsInteger := 0;
     if cbopuesto.Text = '' then
      tblusuariosidpuesto.AsInteger := 0;
     if (cboarea.text = 'CENTRAL') and (cbopuesto.Text <> 'PATRULLERO') then
        tblusuariosalta_senales.asinteger := 1
     else
        tblusuariosalta_senales.asinteger := 0;
     if cboturno.Text <> '' then
      begin
       querys('select idturno from turnos where nombre ='+quotedstr(cboturno.Text),0,sqlgeneral);
       tblusuariosidturno.AsInteger := sqlgeneral.fieldbyname('idturno').AsInteger;
      end;

     tblusuariosInstalador.AsString := edInstalador.Text;
     tblusuariosusuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
     tblusuariosfecha.AsString := datetostr(date);
     tblusuarioshora.AsString := timetostr(time);
     tblusuarios.Post;
     if edclave.Text = inttostr(frmprincipal.ucprincipal.CurrentUser.UserID) then
       begin
       querys('Select puestos.nombre as puesto,areas.nombre as area,ModCierre From usuarios inner join puestos on puestos.idpuesto = usuarios.idpuesto Inner Join areas ON usuarios.idarea = areas.idarea Where usuarios.idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
       frmprincipal.PuestoUsuario := sqlgeneral.fieldbyname('puesto').AsString;
       frmprincipal.AreaUsuario := sqlgeneral.fieldbyname('area').AsString;
       if( sqlgeneral.fieldbyname('ModCierre').AsString = 'S' ) then
         frmprincipal._ModificarCierre := true
       else
         frmprincipal._ModificarCierre := false;
       end;
     dbnavegador.Enabled:=true;
     edclave.Enabled:=true;
      end;
end;

procedure Tfrmusuarios.tblusuariosBeforePost(DataSet: TDataSet);
begin
if cbocolonias.Text<>'' then begin
 //aqui trae el numero de la colonia dependiendo del nombre
querys('select idcol from colonias where nombre='+quotedstr(cbocolonias.Text),0,sqlgeneral);
dataset.FieldByName('idcol').Value:=sqlgeneral.fieldbyname('idcol').AsString;
end;

if cboarea.Text<>'' then
begin
//aqui trae el numero del area dependiendo del nombre
querys('select idarea from areas where nombre='+quotedstr(cboarea.Text),0,sqlgeneral);
dataset.FieldByName('idarea').Value:=sqlgeneral.fieldbyname('idarea').AsString;
end;

if cbopuesto.Text<>'' then
begin
//aqui trae el numero de puesto dependiendo del nombre
querys('select idpuesto from puestos where nombre='+quotedstr(cbopuesto.Text)+' and idarea='+sqlgeneral.fieldbyname('idarea').AsString ,0,sqlgeneral);
dataset.FieldByName('idpuesto').Value:=sqlgeneral.fieldbyname('idpuesto').AsString;
end;
if idtelefono<>'' then
dataset.FieldByName('idtel').Value:=idtelefono;
//dataset.FieldByName('sexo').Value:=cbosexo.Text;
end;

procedure Tfrmusuarios.btntelefonosClick(Sender: TObject);
begin

frmtel.inicializa(strtoint(edclave.text),TBLusuariosidtel.asinteger,0,'usuarios','idusuario',false);

frmtel.ShowModal;

TBLUsuarios.Post;
TBLUsuarios.Refresh;
TBLUsuarios.Edit;

end;


procedure Tfrmusuarios.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
  end;
   
  {if key = #27 then
     begin
      key:=#0;
      edclave.Text:='';
  end;}     

end;

procedure Tfrmusuarios.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
  if (SqlSecAsig.RecordCount > 0) and (cbosector.Text = '') then
     begin
      application.MessageBox('Debe de Especificar cual es el Sector Default de este usuario!','Aviso',mb_iconinformation);
      cbosector.DroppedDown := true;
      exit;
     end;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos del Usuario Actual';
     btnmodificar.ImageIndex:=2;
     gbusuarios.Enabled:=false;
     dbnavegador.Enabled:=true;
     edclave.Enabled:=true;
     lbufh.Caption := '';
     //btnbuscar.Enabled:=true;
     tblusuarios.Cancel;
end
else
close;

end;

procedure Tfrmusuarios.cbocoloniasSelect(Sender: TObject);
begin
//trae el nombre del movil y el CP dependiendo del nombre de la colonia
querys('SELECT sectores.nombre,colonias.cp FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE colonias.nombre = '+quotedstr(cbocolonias.Text),0,sqlgeneral);
edmovil.Text:=sqlgeneral.fieldbyname('nombre').AsString;
edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure Tfrmusuarios.cbocoloniasKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cbocolonias.Text<>'') then
    begin
      //trae el nombre del movil y el CP dependiendo del nombre de la colonia
      querys('SELECT moviles.nombre,colonias.cp FROM colonias INNER JOIN col_movil ON (colonias.idcol = col_movil.idcol) INNER JOIN moviles ON (col_movil.idmov = moviles.idmov) WHERE colonias.nombre = '+quotedstr(cbocolonias.Text),0,sqlgeneral);
      edmovil.Text:=sqlgeneral.fieldbyname('nombre').AsString;
      edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
      key:=#0;
    end;
end;

procedure Tfrmusuarios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) and (gbusuarios.Enabled=false) then
    begin
      frmbusquedas.query:='Select usuarios.idusuario,usuarios.codigo,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as nombre,areas.nombre as Area,puestos.nombre as Puesto,if(usuarios.estatus=0,''INACTIVO'',''ACTIVO'') '+
                          ' as estatus From usuarios left join areas on areas.idarea=usuarios.idarea left join puestos on puestos.idpuesto=usuarios.idpuesto order by idusuario';
      frmbusquedas.campo_retorno:='idusuario';
      frmbusquedas.campo_busqueda:='nombre';
      frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
             edclave.Text:=frmbusquedas.resultado;
             //edclave.OnButtonClick(self);
             buscarlocate;
            end;
      edclave.setfocus;
    end;
end;

procedure Tfrmusuarios.cboareaSelect(Sender: TObject);
begin
//trae los nombres de los puestos dependiendo del area actual

end;

procedure Tfrmusuarios.dtcumpleanosClick(Sender: TObject);
begin
//cboestatus.SetFocus;
end;

procedure Tfrmusuarios.cboestatusKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cboestatus.Text<>'') then
   begin
     key:=#0;
     mmdescripcion.SetFocus;
   end;


end;

procedure Tfrmusuarios.edciudadEnter(Sender: TObject);
begin
if (tblusuarios.State = dsedit) and (edciudad.Text='') then
    begin
     querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
     edciudad.Text:=sqlgeneral.fieldbyname('valor').AsString;
     edciudad.SetFocus;
    end;

end;

procedure Tfrmusuarios.edestadoEnter(Sender: TObject);
begin
if (tblusuarios.State = dsedit) and (edestado.Text='') then
    begin
     querys('Select valor from configuraciones where concepto = "estado"', 0, sqlgeneral);
     edestado.Text:=sqlgeneral.fieldbyname('valor').AsString;
     edestado.SetFocus;
    end;

end;

procedure Tfrmusuarios.cbosexoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)and(cbosexo.Text<>'') then
   begin
     key:=#0;
     dtcumpleanos.SetFocus;
   end;
end;

procedure Tfrmusuarios.dtcumpleanosEnter(Sender: TObject);
begin
//dtcumpleanos.Date:=date;
dtcumpleanos.Text:=datetostr(date);
end;

procedure Tfrmusuarios.mmdescripcionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmusuarios.mmdescripcionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmusuarios.tblusuariosAfterEdit(DataSet: TDataSet);
begin
if tblusuarios.State = dsedit then
btntelefonos.Visible:=true
else
btntelefonos.Visible:=false;
end;

procedure Tfrmusuarios.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure Tfrmusuarios.ednombreKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmusuarios.edcodigoKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

end;
end;

procedure Tfrmusuarios.dtcumpleanosKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)then
begin
  cboestatus.SetFocus;
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

end;
end;

procedure Tfrmusuarios.cbocoloniasExit(Sender: TObject);
begin
//valida que la colonia que esta en el combo sea una existente
if cbocolonias.Text<>'' then
begin
querys('select idcol from colonias where nombre='+quotedstr(cbocolonias.Text),0,sqlgeneral);
if sqlgeneral.RecordCount = 0 then
begin
application.MessageBox('El nombre de colonia tecleado no es valido, intente con otro nombre.','Error',mb_iconinformation);
cbocolonias.Text:='';
cbocolonias.SetFocus;
end;
end;
end;

procedure Tfrmusuarios.cboareaNotInList(Sender: TObject);
begin
cboarea.ItemIndex:=0;
cboarea.OnSelect(self);
end;

procedure Tfrmusuarios.cbocoloniasNotInList(Sender: TObject);
begin
cbocolonias.Text:='';
end;

procedure Tfrmusuarios.cbocoloniasMatch(Sender: TObject);
begin
cbocolonias.OnSelect(self);
end;

procedure Tfrmusuarios.tblusuariosAfterScroll(DataSet: TDataSet);
begin
if dataset.FieldByName('estatus').AsBoolean = false then
   cboestatus.ItemIndex:=0
else
if dataset.FieldByName('estatus').AsBoolean = true then
   cboestatus.ItemIndex:=1
else
   cboestatus.ItemIndex:=-1;

with dmaccesos do
begin
querys('Select uc.UCLogin as login, p.UCUserName as profile from UCTabUsers uc left join usuarios u on u.idusuario=uc.UCIdUser '+
       'left join UCTabUsers p  on p.UCIdUser=uc.UCProfile where uc.UCIdUser ='+tblusuariosidusuario.asstring, 0, sqlgeneral);;
edlogin.text := sqlgeneral.fieldbyname('login').asstring;
edprofile.text := sqlgeneral.fieldbyname('profile').asstring;
end;

end;

procedure Tfrmusuarios.SecDispV(Sender: TObject);
begin
if SqlSecDisp.RecordCount > 0 then
 begin
  if SqlSecAsig.Locate('idsector',SqlSecDisp.fieldbyname('idsector').AsString,[]) <> true then
   begin
    //inserta el idsector y el idusuario en la tabla UsuarioSector
    querys('insert into UsuarioSector (idusuario,idsector) values ('+edclave.Text+','+SqlSecDisp.fieldbyname('idsector').AsString+')',1,sqlgeneral);
    SqlSecAsig.Close;
    SqlSecAsig.ParamByName('user').Value := strtoint(edclave.Text);
    SqlSecAsig.Open;
   end
  else
   application.MessageBox(pchar('El Sector '+SqlSecDisp.fieldbyname('nombre').AsString+' ya a sido asignado a este usuario'),'Aviso',mb_iconinformation);
 end;
end;

procedure Tfrmusuarios.SqlSecAsigAfterOpen(DataSet: TDataSet);
//Var sector:string;
begin
if dataset.RecordCount = SqlSecDisp.RecordCount then
 begin
  btnAsignaSec.Enabled := false;
  btnAsigSeca.Enabled := false;
 end
 else
  begin
    btnAsignaSec.Enabled := true;
    btnAsigSeca.Enabled := true;
  end;
//sector := cbosector.text;
cbosector.Items.Clear;
SqlSecAsig.First;
while not SqlSecAsig.Eof do
 begin
   cbosector.Items.Add(SqlSecAsig.fieldbyname('nombre').AsString);
   SqlSecAsig.Next;
 end;
//cbosector.text := sector;
//querys('SELECT sectores.idsector FROM sectores INNER JOIN UsuarioSector ON (sectores.idsector = UsuarioSector.idsector) WHERE UsuarioSector.idusuario = '+tblusuariosidsector.AsString + ' and sectores.nombre ='+Quotedstr(cbosector.Text),0,sqlgeneral);
//if sqlgeneral.RecordCount = 0 then
// cbosector.Text := '';
end;

procedure Tfrmusuarios.SqlSecDispAfterOpen(DataSet: TDataSet);
begin
if dataset.RecordCount = SqlSecAsig.RecordCount then
 begin
  btnAsignaSec.Enabled := false;
  btnAsigSeca.Enabled := false;
 end
 else
  begin
    btnAsignaSec.Enabled := true;
    btnAsigSeca.Enabled := true;
  end;
end;

procedure Tfrmusuarios.btnAsignaSecClick(Sender: TObject);
begin
if SqlSecAsig.Locate('idsector',SqlSecDisp.fieldbyname('idsector').AsString,[]) = false then
 begin
  querys('insert into UsuarioSector (idsector,idusuario) values ('+SqlSecDisp.fieldbyname('idsector').AsString+','+edClave.Text+')',1,sqlgeneral);
  SqlSecAsig.Close;
  SqlSecAsig.ParamByName('user').Value := strtoint(edclave.Text);
  SqlSecAsig.Open;
 end
else
  application.MessageBox(pchar('El sector '+SqlSecDisp.fieldbyname('nombre').AsString+' ya ha sido asignado a este usuario'),'Aviso',mb_iconinformation);
end;

procedure Tfrmusuarios.btnAsigSecaClick(Sender: TObject);
begin
    //Limpia los sectores asignados de este usuario
    querys('delete from UsuarioSector where idusuario = ' + edclave.Text,1,sqlgeneral);
    //inserta el idsector y el idusuario en la tabla UsuarioSector
    querys('insert into UsuarioSector (idusuario,idsector) select '+edclave.text+',idsector from sectores order by nombre',1,sqlgeneral);
    SqlSecAsig.Close;
    SqlSecAsig.ParamByName('user').Value := strtoint(edclave.Text);
    SqlSecAsig.Open;
end;

procedure Tfrmusuarios.cxGridDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (SqlSecAsig.RecordCount > 0) and ((key = 8) or (key = 46)) then
 begin
  //elimina de UsuarioSector el registro
  querys('delete from UsuarioSector where idusuario = '+edClave.Text + ' and idsector = ' + SqlSecAsig.fieldbyname('idsector').AsString,1,sqlgeneral);
  SqlSecAsig.Close;
  SqlSecAsig.ParamByName('user').Value := strtoint(edclave.Text);
  SqlSecAsig.Open;
 end;
end;

procedure Tfrmusuarios.cbosectorNotInList(Sender: TObject);
begin
cbosector.Text := cbosector.Items.Strings[0];
end;

procedure Tfrmusuarios.FormShow(Sender: TObject);
begin
self.top := 1;
self.Left := 1;
end;

procedure Tfrmusuarios.cboturnoEnter(Sender: TObject);
begin
  //carga el combo de turnos
    CargaCombo('select turnos.nombre from turnos inner join areas on areas.idarea=turnos.idarea where areas.nombre='+quotedstr(cboarea.Text),'Turno(s) en esta area, ',cboturno);
end;

procedure Tfrmusuarios.edCodConmutadorKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=validanumeros(key,false);
end;

procedure Tfrmusuarios.edInstaladorButtonClick(Sender: TObject);
begin
    frmbusquedas.query:='SELECT u.idusuario ,u.codigo as Codigo,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Instalador '+
                        'FROM usuarios as u LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto)  WHERE a.nombre=''INSTALACIONES'' and p.nombre = ''INSTALADOR''  ';
      frmbusquedas.campo_retorno:='Codigo';  //LEFT JOIN areas as a  ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto)  WHERE a.nombre=''INSTALACIONES'' and p.nombre = ''INSTALADOR''
      frmbusquedas.campo_busqueda:='Codigo';
      frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
      frmbusquedas.tblorigen:='usuarios';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
            begin
                chtecla:=#13;
                (sender as trzbuttonedit).Text  := frmbusquedas.resultado;
            end;
end;

procedure Tfrmusuarios.cbopuestoExit(Sender: TObject);
begin
         if ((cboarea.Text = 'VENTAS') and (cbopuesto.Text = 'VENDEDOR')) then
            edInstalador.Enabled := true
         else
            edInstalador.Enabled := false;
end;

procedure Tfrmusuarios.cboareaExit(Sender: TObject);
begin
cbopuesto.Clear;
querys('select idarea from areas where nombre='+quotedstr(cboarea.Text),0,sqlgeneral);
CargaCombo('select nombre from puestos where idarea='+sqlgeneral.Fields.Fields[0].AsString,'Puesto(s)',cbopuesto);
CargaCombo('select nombre from turnos where idarea='+sqlgeneral.Fields.Fields[0].AsString+' order by nombre','Turno(s)',cboturno);
end;

procedure Tfrmusuarios.tblusuariosAfterClose(DataSet: TDataSet);
begin
edlogin.text := '';
edprofile.text := '';

end;

procedure Tfrmusuarios.edclaveChange(Sender: TObject);
begin
if edclave.text = '' then
  lbufh.Caption := '';
end;

end.
