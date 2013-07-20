{///////////////////////////////////////////////////////////////////////////////
2008/10/28 dalyla correccion de scroll
2008/06/12 dalyla Creacion de pantalla
}///////////////////////////////////////////////////////////////////////////////
unit USectoresTurnos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MyAccess, RzButton, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, RzCmboBx, RzDBEdit,
  MemDS, DBAccess, ExtCtrls, DBCtrls, RzDBNav, RzLabel, Mask, RzEdit,
  RzBtnEdt, RzDBCmbo, RzRadChk, RzDBChk;

type
  TfrmSectoresTurnos = class(TForm)
    edclave: TRzButtonEdit;
    lblclave: TRzLabel;
    dbnavegador:TRzDBNavigator;
    tblusuarios: TMyTable;
    tblusuariosidusuario: TIntegerField;
    tblusuariosnombre: TStringField;
    tblusuarioscodigo: TStringField;
    tblusuariosidarea: TIntegerField;
    tblusuariosidpuesto: TIntegerField;
    tblusuariosapaterno: TStringField;
    tblusuariosamaterno: TStringField;
    tblusuariosestatus: TBooleanField;
    tblusuariosidsector: TIntegerField;
    tblusuarioscodigo2: TStringField;
    tblusuariosidturno: TIntegerField;
    DSusuarios: TDataSource;
    lblnombre: TRzLabel;
    ednombre: TRzDBEdit;
    lblapaterno: TRzLabel;
    edapaterno: TRzDBEdit;
    lblamaterno: TRzLabel;
    edamaterno: TRzDBEdit;
    RzLabel4: TRzLabel;
    edcodigo: TRzDBEdit;
    RzLabel11: TRzLabel;
    edcodigo2: TRzDBEdit;
    RzLabel6: TRzLabel;
    cbsector: TRzComboBox;
    lblarea: TRzLabel;
    cbarea: TRzComboBox;
    lblpuesto: TRzLabel;
    cbpuesto: TRzComboBox;
    RzLabel9: TRzLabel;
    cbturno: TRzComboBox;
    RzLabel7: TRzLabel;
    btnAsig: TRzButton;
    btnAsigAll: TRzButton;
    GAsig: TcxGrid;
    VAsig: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    LAsig: TcxGridLevel;
    RzLabel8: TRzLabel;
    GDisp: TcxGrid;
    VDisp: TcxGridDBTableView;
    idSector: TcxGridDBColumn;
    Nomsector: TcxGridDBColumn;
    LDisp: TcxGridLevel;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    dsDisp: TDataSource;
    sqldisp: TMyQuery;
    dsAsig: TDataSource;
    sqlasig: TMyQuery;
    sqlgeneral: TMyQuery;
    RzDBCheckBox1: TRzDBCheckBox;
    RzLabel1: TRzLabel;
    lbufh: TRzLabel;
    tblusuariosusuario: TStringField;
    tblusuariosfecha: TStringField;
    tblusuarioshora: TStringField;
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAsigClick(Sender: TObject);
    procedure btnAsigAllClick(Sender: TObject);
    procedure VAsigKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure tblusuariosBeforePost(DataSet: TDataSet);
    procedure sqlasigAfterOpen(DataSet: TDataSet);
    procedure dbnavegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure edclaveChange(Sender: TObject);

  private
    procedure buscarlocate;
    procedure TraeDatos;
    procedure habilita(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSectoresTurnos: TfrmSectoresTurnos;

implementation

uses Udm, Ubusquedas, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmSectoresTurnos.edclaveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmSectoresTurnos.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin

  if key=#13 then begin
     key:=#0;
     if edclave.Text <> '' then
        buscarlocate
     else
        edclave.OnButtonClick(self);
  end;
end;

procedure TfrmSectoresTurnos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
begin
  with frmbusquedas do
  begin
    query:='Select u.idusuario, u.codigo,  '+UsuarioNombre('u')+' as nombre,a.nombre as Area, p.nombre as Puesto, '+
           'if(u.estatus = 0, "INACTIVO", "ACTIVO") as estatus From usuarios u Left join areas a on a.idarea=u.idarea '+
           'Left join puestos p on p.idpuesto = u.idpuesto order by idusuario';
    campo_retorno:='idusuario';
    campo_busqueda:='nombre';
    tblorigen := 'usuarios';
    ShowModal;
    if resultado <> '' then
    begin
      edclave.Text:=frmbusquedas.resultado;
      buscarlocate;
    end;
    edclave.setfocus;
  end;
end;
end;

procedure TfrmSectoresTurnos.buscarlocate;
begin
tblusuarios.Active:=true;
if tblusuarios.Locate('idusuario',edclave.Text,[]) then
   begin
    querys('select nombre from sectores where idsector = '+tblusuariosidsector.AsString,0,sqlgeneral);
    cbsector.Text := sqlgeneral.fieldbyname('nombre').AsString;
    edclave.SetFocus;
    btnmodificar.Enabled:=true;
    TraeDatos;
    end
else
  begin
    SqlAsig.Close;
    SqlDisp.Close;
    btnmodificar.Enabled:=false;
    application.MessageBox('Esa Clave de Usuario no Existe','Información',mb_ok+mb_iconinformation);
    edclave.Text:='';
    tblusuarios.close;
    edclave.SetFocus;
  end;


end;



procedure TfrmSectoresTurnos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmSectoresTurnos.btnAsigClick(Sender: TObject);
begin
if SqlAsig.Locate('idsector',SqlDisp.fieldbyname('idsector').AsString,[]) = false then
 begin
  querys('insert into UsuarioSector (idsector,idusuario) values ('+SqlDisp.fieldbyname('idsector').AsString+','+edClave.Text+')',1,sqlgeneral);
  SqlAsig.Close;
  SqlAsig.ParamByName('user').Value := strtoint(edclave.Text);
  SqlAsig.Open;
 end
else
  application.MessageBox(pchar('El sector '+SqlDisp.fieldbyname('nombre').AsString+' ya ha sido asignado a este usuario'),'Aviso',mb_iconinformation);

end;

procedure TfrmSectoresTurnos.btnAsigAllClick(Sender: TObject);
begin
    querys('delete from UsuarioSector where idusuario = ' + edclave.Text,1,sqlgeneral);
    querys('insert into UsuarioSector (idusuario,idsector) select '+edclave.text+',idsector from sectores order by nombre',1,sqlgeneral);
    SqlAsig.Close;
    SqlAsig.ParamByName('user').Value := strtoint(edclave.Text);
    SqlAsig.Open;
end;

procedure TfrmSectoresTurnos.VAsigKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (SqlAsig.RecordCount > 0) and ((key = 8) or (key = 46)) then
 begin
  //elimina de UsuarioSector el registro
  querys('delete from UsuarioSector where idusuario = '+edClave.Text + ' and idsector = ' + SqlAsig.fieldbyname('idsector').AsString,1,sqlgeneral);
  SqlAsig.Close;
  SqlAsig.ParamByName('user').Value := strtoint(edclave.Text);
  SqlAsig.Open;
 end;
end;

procedure TfrmSectoresTurnos.btnmodificarClick(Sender: TObject);
begin       
if btnmodificar.Caption = '&Editar' then
  begin
  btnmodificar.Caption:='&Guardar';
  btncancelar.Caption:='&Cancelar';
  btnmodificar.hint:='Guarda los Cambios Realizados';
  btnmodificar.ImageIndex:=1;
  dbnavegador.Enabled:=false;
  edclave.Enabled:=false;
  tblusuarios.Edit;
  habilita(true);
  cbsector.setfocus;
  end
else
  begin
  if (SqlAsig.RecordCount > 0) and (cbsector.Text = '') then
    begin
    application.MessageBox('Debe de Especificar cual es el Sector Default de este usuario!','Aviso',mb_iconinformation);
    cbsector.DroppedDown := true;
    exit;
    end;
  frmprincipal.ucprincipal.Log('Edicion del usuario #'+edclave.Text,0);
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Usuario Actual';
  btnmodificar.ImageIndex:=2;
  tblusuarios.Post;
  habilita(false);

  //si es el usuario actual actualiza los cambios
  if edclave.Text = inttostr(frmprincipal.ucprincipal.CurrentUser.UserID) then
    begin
    querys('Select puestos.nombre as puesto,a.nombre as area,ModCierre From usuarios inner join puestos on puestos.idpuesto = usuarios.idpuesto Inner Join areas ON usuarios.idarea = areas.idarea Where usuarios.idusuario = '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
    frmprincipal.PuestoUsuario := sqlgeneral.fieldbyname('puesto').AsString;
    frmprincipal.AreaUsuario := sqlgeneral.fieldbyname('area').AsString;
    {if( sqlgeneral.fieldbyname('ModCierre').AsString = 'S' ) then
      frmprincipal._ModificarCierre := true
    else
      frmprincipal._ModificarCierre := false;   }
    end;    

  dbnavegador.Enabled:=true;
  edclave.Enabled:=true;
  end;
end;

procedure TfrmSectoresTurnos.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Usuario Actual';
  btnmodificar.ImageIndex:=2;
  dbnavegador.Enabled:=true;
  edclave.Enabled:=true;
  tblusuarios.Cancel;
  habilita(false);
  lbufh.Caption := '';
  end
else
  close;
end;

procedure TfrmSectoresTurnos.tblusuariosBeforePost(DataSet: TDataSet);
begin
  if cbsector.Text <> '' then
    begin
    querys('select idsector from sectores where nombre = '+quotedstr(cbsector.Text),0,sqlgeneral);
    tblusuariosidsector.AsInteger := sqlgeneral.fieldbyname('idsector').AsInteger;
    end
  else
    tblusuariosidsector.AsInteger := 0;

  if cbarea.Text = '' then
   tblusuariosidarea.AsInteger := 0;

  if cbpuesto.Text = '' then
   tblusuariosidpuesto.AsInteger := 0;

  if cbturno.Text <> '' then
    begin
    querys('select idturno from turnos where nombre ='+quotedstr(cbturno.Text),0,sqlgeneral);
    tblusuariosidturno.AsInteger := sqlgeneral.fieldbyname('idturno').AsInteger;
    end;

end;

procedure TfrmSectoresTurnos.TraeDatos;
begin
//SECTORES
  CargaCombo2('select us.idsector, s.nombre from UsuarioSector us left join sectores s on s.idsector=us.idsector '+
              'where idusuario = '+edclave.text+' order by nombre', 'nombre', 'idsector', cbsector);
  querys('select nombre from sectores where idsector = '+tblusuariosidsector.AsString,0,sqlgeneral);
  cbsector.Text := sqlgeneral.fieldbyname('nombre').AsString;
  lbufh.Caption := UFH(tblusuarios);
  SqlDisp.Close;
  SqlDisp.open;

  SqlAsig.Close;
  SqlAsig.ParamByName('user').Value := tblusuariosidusuario.AsString;
  SqlAsig.Open;

//TURNOS
CargaCombo2('select idturno, nombre from turnos order by nombre', 'nombre', 'idturno', cbturno);
if tblusuariosidturno.Asinteger <> 0 then
  begin
  querys('select nombre from turnos where idturno='+tblusuariosidturno.AsString,0,sqlgeneral);
  cbturno.Text := sqlgeneral.fieldbyname('nombre').AsString;
  end
else
  cbturno.Text := '';

//AREAS
CargaCombo2('select idarea, nombre from areas order by nombre', 'nombre', 'idarea', cbarea);
if tblusuariosidarea.AsString <> '' then
  begin
  CargaCombo2('select idpuesto, nombre from puestos where idarea='+tblusuariosidarea.AsString,'nombre', 'idpuesto',cbpuesto);
  querys('select nombre from areas where idarea='+tblusuariosidarea.AsString,0,sqlgeneral);
  cbarea.Text:=sqlgeneral.fieldbyname('nombre').AsString;
  end
else
  cbarea.Text:='';

//PUESTOS
if tblusuariosidpuesto.AsString <> '' then
  begin
  querys('select nombre from puestos where idpuesto='+tblusuariosidpuesto.AsString,0,sqlgeneral);
  cbpuesto.Text:=sqlgeneral.fieldbyname('nombre').AsString;
  end
else
  cbpuesto.Text:='';
end;

procedure TfrmSectoresTurnos.habilita(hab:boolean);
begin
cbsector.Enabled := hab;
cbturno.Enabled := hab;
gdisp.Enabled := hab;
gasig.Enabled := hab;
btnasig.Enabled := hab;
btnasigall.Enabled := hab;
end;

procedure TfrmSectoresTurnos.sqlasigAfterOpen(DataSet: TDataSet);
begin


cbsector.Items.Clear;
SqlAsig.First;
while not SqlAsig.Eof do
  begin
  cbsector.Items.Add(SqlAsig.fieldbyname('nombre').AsString);
  SqlAsig.Next;
  end;
end;

procedure TfrmSectoresTurnos.dbnavegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text := tblusuariosidusuario.asstring;

traedatos;
end;

procedure TfrmSectoresTurnos.edclaveChange(Sender: TObject);
begin
if edclave.text = '' then
  lbufh.Caption := '';
end;

End.

