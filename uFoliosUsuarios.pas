unit uFoliosUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, MyAccess, MemDS, DBAccess, RzRadChk, RzDBChk,
  RzButton, StdCtrls, RzCmboBx, RzDBEdit, ExtCtrls, DBCtrls, RzDBNav, Mask,
  RzEdit, RzBtnEdt, RzLabel, RzLstBox;

type
  TfrmFoliosUsuarios = class(TForm)
    lblclave: TRzLabel;
    lblnombre: TRzLabel;
    lblapaterno: TRzLabel;
    lblamaterno: TRzLabel;
    RzLabel6: TRzLabel;
    lblarea: TRzLabel;
    lblpuesto: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel1: TRzLabel;
    lbufh: TRzLabel;
    edclave: TRzButtonEdit;
    dbnavegador: TRzDBNavigator;
    btnAsig: TRzButton;
    btnAsigAll: TRzButton;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    dsDisp: TDataSource;
    sqldisp: TMyQuery;
    dsAsig: TDataSource;
    sqlasig: TMyQuery;
    sqlgeneral: TMyQuery;
    RzLabel3: TRzLabel;
    gasig: TcxGrid;
    VAsig: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    gdisp: TcxGrid;
    VDisp: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    lbsectores: TRzListBox;
    RzLabel2: TRzLabel;
    ednombre: TRzEdit;
    edapaterno: TRzEdit;
    edamaterno: TRzEdit;
    edarea: TRzEdit;
    edpuesto: TRzEdit;
    edsector: TRzEdit;
    chkestatus: TRzCheckBox;
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure dbnavegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure btnAsigClick(Sender: TObject);
    procedure btnAsigAllClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure VAsigKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure buscarlocate;
    procedure TraeDatos;
    procedure habilita(hab:boolean);
    procedure limpiar;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFoliosUsuarios: TfrmFoliosUsuarios;

implementation

uses Ubusquedas, Urecursos, Uprincipal, Udm;

{$R *.dfm}

procedure TfrmFoliosUsuarios.edclaveButtonClick(Sender: TObject);
  var codigo:word;
begin
  codigo:=66;
  self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmFoliosUsuarios.edclaveKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
  begin
  key:=#0;
  if edclave.Text <> '' then
    buscarlocate
  else
    edclave.OnButtonClick(self);
  end;
end;

procedure TfrmFoliosUsuarios.FormKeyUp(Sender: TObject; var Key: Word;
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
      dbnavegador.enabled := true;
      buscarlocate;
      end;
    edclave.setfocus;
    end;
  end;
end;

procedure TfrmFoliosUsuarios.buscarlocate;
begin
if querys('Select idusuario, u.nombre, u.apaterno, u.amaterno, a.nombre as area, '+
          'p.nombre as puesto, u.estatus, u.idsector '+
          'from usuarios u left join areas a on a.idarea=u.idarea '+
          'left join puestos p on p.idpuesto=u.idpuesto '+
          'where u.idusuario='+edclave.Text, 0, sqlgeneral) > 0 then
   begin
    ednombre.Text := sqlgeneral.fieldbyname('nombre').AsString;
    edapaterno.Text := sqlgeneral.fieldbyname('apaterno').AsString;
    edamaterno.Text := sqlgeneral.fieldbyname('amaterno').AsString;
    edpuesto.Text := sqlgeneral.fieldbyname('puesto').AsString;
    edarea.Text := sqlgeneral.fieldbyname('area').AsString;
    edsector.Text := sqlgeneral.fieldbyname('idsector').AsString;
    btnmodificar.Enabled:=true;
    TraeDatos;
    edclave.SetFocus;
    end
else
  begin
    //limpiar;
    btnmodificar.Enabled:=false;
    application.MessageBox('Esa Clave de Usuario no Existe','Informaci�n',mb_ok+mb_iconinformation);
    edclave.Text:='';
    edclave.SetFocus;
  end;
end;

procedure TfrmFoliosUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmFoliosUsuarios.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
  begin
  btnmodificar.Caption := '&Guardar';
  btncancelar.Caption := '&Cancelar';
  btnmodificar.hint := 'Guarda los Cambios Realizados';
  btnmodificar.ImageIndex := 1;
  dbnavegador.Enabled := false;
  edclave.Enabled := false;
  habilita(true);
  end
else
  begin
  frmprincipal.ucprincipal.Log('Edicion del usuario #'+edclave.Text,0);
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Usuario Actual';
  btnmodificar.ImageIndex:=2;
  habilita(false);
  dbnavegador.Enabled:=true;
  edclave.Enabled:=true;
  end;
end;

procedure TfrmFoliosUsuarios.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btnmodificar.hint:='Editar los datos del Usuario Actual';
  btnmodificar.ImageIndex:=2;
  dbnavegador.Enabled:=true;
  edclave.Enabled:=true;
  habilita(false);
  lbufh.Caption := '';
  end
else
  close;
end;

procedure TfrmFoliosUsuarios.TraeDatos;
begin
  querys('Select letras from FoliosFE where letras not in (select letras from FoliosUsuarios '+
         'where idusuario='+edclave.text+')', 0, sqldisp);

  querys('Select letras from FoliosFE where letras in (select letras from FoliosUsuarios '+
         'where idusuario='+edclave.text+')', 0, sqlasig);

  querys('Select idsector from UsuarioSector where idusuario='+edclave.text+' order by cast(idsector as SIGNED) asc', 0, sqlgeneral);
  lbsectores.Clear;
  while not sqlgeneral.Eof do
    begin
    lbsectores.Add(sqlgeneral.fieldbyname('idsector').AsString);
    sqlgeneral.next;
    end;

end;

procedure TfrmFoliosUsuarios.habilita(hab:boolean);
begin
gdisp.Enabled := hab;
gasig.Enabled := hab;
btnasig.Enabled := hab;
btnasigall.Enabled := hab;
end;

procedure TfrmFoliosUsuarios.dbnavegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
querys('select idusuario from usuarios where idusuario > '+edclave.text+' limit 1', 0, sqlgeneral);
edclave.text := sqlgeneral.fieldbyname('idusuario').asstring;
TraeDatos;
end;

procedure TfrmFoliosUsuarios.edclaveChange(Sender: TObject);
begin
if edclave.text = '' then
  limpiar;
end;

procedure TfrmFoliosUsuarios.btnAsigClick(Sender: TObject);
begin
  querys('insert into FoliosUsuarios (letras,idusuario, usuario, fecha, hora) values '+
         '("'+SqlDisp.fieldbyname('letras').AsString+'",'+edclave.Text+', '+
         '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", curdate(), curtime())',1,sqlgeneral);
  SqlAsig.refresh;
  SqlDisp.refresh;
  {SqlAsig.Close;
  SqlAsig.ParamByName('user').Value := strtoint(edclave.Text);
  SqlAsig.Open;}
end;

procedure TfrmFoliosUsuarios.btnAsigAllClick(Sender: TObject);
begin
    querys('delete from FoliosUsuarios where idusuario = ' + edclave.Text,1,sqlgeneral);
    querys('insert into FoliosUsuarios (idusuario,letras, usuario, fecha, hora) '+
           'select '+edclave.text+', letras, '+
           '"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'", curdate(), curtime() '+
           'from FoliosFE order by letras',1,sqlgeneral);
    SqlAsig.refresh;
    SqlDisp.refresh;
    {SqlAsig.Close;
    SqlAsig.ParamByName('user').Value := strtoint(edclave.Text);
    SqlAsig.Open;}
end;

procedure TfrmFoliosUsuarios.VAsigKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (SqlAsig.RecordCount > 0) and ((key = 8) or (key = 46)) then
 begin
  //elimina de FoliosUsuarios el registro
  querys('delete from FoliosUsuarios where idusuario = '+edClave.Text + ' '+
         'and letras = "' + SqlAsig.fieldbyname('letras').AsString+'"',1,sqlgeneral);
  SqlAsig.refresh;
  SqlDisp.refresh;
  {SqlAsig.Close;
  SqlAsig.ParamByName('user').Value := strtoint(edclave.Text);
  SqlAsig.Open;}
 end;
end;

procedure TfrmFoliosUsuarios.limpiar;
begin
SqlAsig.close;
  SqlDisp.close;
  ednombre.text := '';
  edapaterno.text := '';
  edamaterno.text := '';
  edarea.text := '';
  edpuesto.text := '';
  lbsectores.clear;
end;

End.