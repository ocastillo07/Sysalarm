{///////////////////////////////////////////////////////////////////////////////
2007/03/27 DALYLA reporte de zonas default pegar aki
04/01/07 Javier Hernandez
}///////////////////////////////////////////////////////////////////////////////
unit Uzonasdefault;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MyAccess, MemDS, DBAccess, ExtCtrls, DBCtrls, RzDBNav,
  RzButton, StdCtrls, RzLabel, RzEdit, Mask, RzBtnEdt, RzDBEdit, RzCmboBx,
  RzDBCmbo;

type
  TfrmZonasDefault = class(TForm)
    clave: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    navegador: TRzDBNavigator;
    tblzonasdefault: TMyTable;
    sqlgeneral: TMyQuery;
    qtipo: TMyQuery;
    DSzonasdefault: TDataSource;
    tblzonasdefaultzdid: TIntegerField;
    tblzonasdefaultatid: TStringField;
    tblzonasdefaultznum: TStringField;
    tblzonasdefaultnota: TStringField;
    tblzonasdefaultidprotocolo: TIntegerField;
    descripcion: TRzDBEdit;
    cbtipo: TRzDBComboBox;
    cbzona: TRzDBComboBox;
    cbprotocolo: TRzComboBox;
    lbufh: TRzLabel;
    tblzonasdefaultusuario: TStringField;
    tblzonasdefaultfecha: TStringField;
    tblzonasdefaulthora: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
    procedure claveButtonClick(Sender: TObject);
    procedure claveChange(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    function ExisteRegistro(query:string):integer;
    procedure tblzonasdefaultBeforePost(DataSet: TDataSet);
    procedure cbprotocoloSelect(Sender: TObject);
    procedure cbtipoSelect(Sender: TObject);
    procedure cbprotocoloKeyPress(Sender: TObject; var Key: Char);
    procedure cbtipoKeyPress(Sender: TObject; var Key: Char);
    procedure cbzonaKeyPress(Sender: TObject; var Key: Char);
    procedure cbprotocoloNotInList(Sender: TObject);
    procedure cbtipoNotInList(Sender: TObject);
    procedure cbzonaNotInList(Sender: TObject);
    procedure descripcionKeyPress(Sender: TObject; var Key: Char);

  private      
    zonaid :string;
    procedure buscarlocate;
    procedure habilita(hab:boolean);
    procedure CargaCombo3(sql, campo:string;combo : TRzDBComboBox);
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmZonasDefault: TfrmZonasDefault;

implementation

uses Urecursos, Uprincipal, Ubusquedas, Udm, Urelacionborrar;

{$R *.dfm}

{en busqueda concatenar tipo y zona para la busqueda}
function TfrmZonasDefault.ExisteRegistro(query:string):integer;
begin
querys(query, 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  application.MessageBox('Ya existe otro elemento con ese tipo y zona, no se permiten duplicados','Aviso',mb_iconinformation);
  result:=1;
  end
else
result:=0;
end;

procedure TfrmZonasDefault.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 action:=cafree;
end;

procedure TfrmZonasDefault.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 canclose:=CerrarPantalla(tblzonasdefault,btncancelar,btnalta,btnmodificar);
end;

procedure TfrmZonasDefault.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
      with frmbusquedas do
        begin
        query:='Select zdid, atid, znum, nota as Nota,protocolos.protocolo, Usuario as Usuario, fecha as Fecha,hora as Hora From zonas_default inner join protocolos on protocolos.idprotocolo =zonas_default.idprotocolo order by zdid';
        campo_retorno:='zdid';
        campo_busqueda:='atid';
        tblorigen := 'zonas_default';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
          begin
          tblzonasdefault.Active:=true;
          querys('Select * from zonas_default where zdid='+quotedstr(resultado), 0, sqlgeneral);
          clave.Text:= sqlgeneral.fieldbyname('atid').AsString+sqlgeneral.fieldbyname('znum').AsString;
          zonaid:= sqlgeneral.fieldbyname('zdid').AsString;
          //zonatipo:=sqlgeneral.fieldbyname('znum').AsString;

          buscarlocate;
          querys('Select zdid, atid, znum, idprotocolo, concat(atid,znum) as clave from zonas_default having clave ='+quotedstr(clave.text), 0, sqlgeneral);
      zonaid:=sqlgeneral.fieldbyname('zdid').AsString;
      cbprotocolo.ItemIndex :=sqlgeneral.fieldbyname('idprotocolo').AsInteger;

        //  cbprotocolo.ItemIndex :=sqlgeneral.fieldbyname('idprotocolo').Asinteger - 1;
          navegador.Enabled:=true;
          end;
        end;
      end;
    end;

procedure TfrmZonasDefault.FormShow(Sender: TObject);
begin
zonaid:='';
cargacombo2('Select idprotocolo, protocolo from protocolos order by idprotocolo', 'protocolo', 'idprotocolo', cbprotocolo);
clave.SetFocus;
end;


procedure TfrmZonasDefault.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
    clave.text:=DSzonasdefault.dataset.fieldbyname('atid').AsString+DSzonasdefault.dataset.fieldbyname('znum').AsString;
    zonaid :=tblzonasdefault.Fields[0].AsString;
    cbprotocolo.ItemIndex := tblzonasdefault.fieldbyname('idprotocolo').AsInteger-1;
    lbufh.Caption := UFH(tblzonasdefault);
end;

procedure TfrmZonasDefault.claveButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmZonasDefault.claveChange(Sender: TObject);
begin
  if clave.Text = '' then
    begin
    tblzonasdefault.Active:=false;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    cbprotocolo.Text := '';
    lbufh.Caption := '';
    end;
end;

procedure TfrmZonasDefault.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
  begin
  clave.text := '';
  clave.Enabled:=false;
  tblzonasdefault.Active:=true;
  tblzonasdefault.Insert;
  btnalta.Caption:='&Guardar';
  btnalta.Hint:='Guardar los datos de la alta';
  btnalta.ImageIndex:=1;
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la Alta';
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  habilita(true);
  cbprotocolo.Text := '';
  cbprotocolo.SetFocus;
  navegador.Enabled:=false;
  lbufh.Caption := '';
  end
else
  begin  //MODIFICAR LO DE BUSQUEDA DE NOMBRE
  //trae el maximo idtipo + 1
  querys('select max(zdid)+1 as zdid from zonas_default',0,sqlgeneral);
  zonaid := sqlgeneral.fieldbyname('zdid').AsString;

  if ExisteRegistro('select * from zonas_default where zdid<>'+quotedstr(zonaid)+' and atid='+quotedstr(cbtipo.text)+' and znum='+quotedstr(cbzona.text)) = 1 then
    exit;
  btnalta.Caption:='&Alta';
  btnalta.Hint:='Dar de Alta una Zona Default';
  btncancelar.Caption:='&Cerrar';
  btncancelar.Hint:='Cerrar esta Ventana';
  btnalta.ImageIndex:=5;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  frmprincipal.ucprincipal.Log('Dio de Alta una Zona Default ',1);
  //guarda los datos
  tblzonasdefault.Post;
  //actualiza los datos de hora,fecha de creacion y usuario
  querys('update zonas_default set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where zdid='+quotedstr(zonaid), 1, sqlgeneral);
  tblzonasdefault.Active:=false;
  habilita(false);
  clave.Enabled:=true;
  clave.Text:='';
  cbprotocolo.text:='';
  clave.SetFocus;
  end;
end;

procedure TfrmZonasDefault.claveKeyPress(Sender: TObject; var Key: Char);
begin
  if key='.' then
    key:=#0;
  if (key = #13) then
    begin
    key:=#0;
    if clave.Text <> '' then
      begin
      querys('Select zdid, atid, znum, idprotocolo, concat(atid,znum) as clave from zonas_default having clave ='+quotedstr(clave.text), 0, sqlgeneral);
      zonaid:=sqlgeneral.fieldbyname('zdid').AsString;
      cbprotocolo.ItemIndex :=sqlgeneral.fieldbyname('idprotocolo').AsInteger;
      buscarlocate;
      end
    else
      clave.OnButtonClick(self);
    end;
  if key = #27 then
    begin
    key:=#0;
    clave.Text:='';
    cbprotocolo.Text := '';
    cbprotocolo.Enabled :=true;
    end;
end;

procedure TfrmZonasDefault.btnborrarClick(Sender: TObject);
var hija:tfrmrelacionborrar;
begin
//busca que el tipo no este siendo usado en la tabla de sk alarmas
querys('select * from cliente_zonas where atid='+quotedstr(cbtipo.Text)+' and znum ='+quotedstr(cbzona.text), 0, sqlgeneral);
if sqlgeneral.RecordCount > 0 then
  begin
  if (application.MessageBox(pchar('Esta Zona Default esta siendo usado por '+inttostr(sqlgeneral.RecordCount) + ' cliente(s) y no podra ser eliminada!'+chr(13)+'Desea ver los registros relacionados?'), 'Cuidado',mb_yesno+mb_iconwarning) = idyes) then
    begin
    hija:=tfrmrelacionborrar.Create(self);
    hija.inicializa(sqlgeneral);
    hija.Show;
    end;
  end
else
  begin
  if application.MessageBox('Estas Seguro que deseas borrar esta Zona Default? Esta sera borrada inmediatamente despues de aceptar','Confirmación',mb_yesno+mb_iconwarning) = idyes then
   begin
      frmprincipal.ucprincipal.Log('Elimino la Zona Default '+tblzonasdefaultatid.asstring, 3);
      tblzonasdefault.Delete;
      application.MessageBox('Eliminacion de la Zona Default Exitosa','Información',mb_ok);
      tblzonasdefault.Active:=false;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      tblzonasdefault.Active:=false;
      cbprotocolo.Text := '';
      clave.text:='';
      clave.SetFocus;
     end;
   end;
end;

procedure TfrmZonasDefault.btnmodificarClick(Sender: TObject);
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
     clave.Enabled:=false;
     tblzonasdefault.Edit;
     navegador.Enabled:=false;
   end
else
  begin
     if ExisteRegistro ('select * from zonas_default where zdid<>'+quotedstr(zonaid)+' and atid='+quotedstr(cbtipo.text)+' and znum='+quotedstr(cbzona.text)+' and idprotocolo<>'+quotedstr(inttostr(cbprotocolo.itemindex))) = 1 then
        exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la Zona Default actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito una Zona Default',2);
     tblzonasdefault.Post;
     //actualiza los datos de hora,fecha de creacion y usuario
     querys('update zonas_default set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' where zdid='+quotedstr(zonaid), 1, sqlgeneral);
     tblzonasdefault.Active:=false;
     clave.Enabled:=true;
     clave.Text:='';
     clave.SetFocus;
     end;
end;

procedure TfrmZonasDefault.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then
  begin
  tblzonasdefault.Cancel;
  tblzonasdefault.Active:=false;
  navegador.Enabled:=false;
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  lbufh.Caption := '';
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos de la Zona Default Actual';
    btnmodificar.ImageIndex:=2;
    cbprotocolo.Text := '';
    end;
  if btnalta.Enabled then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una Zona Default';
    btnalta.ImageIndex:=5;
    cbprotocolo.Text := '';
    clave.Text:='';
    end;
 habilita(false);
  clave.Enabled:=true;
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  clave.SetFocus;
  end
else
  release;
end;

procedure tfrmzonasdefault.buscarlocate;
begin
tblzonasdefault.Active:=true;
if (tblzonasdefault.Locate('zdid',zonaid,[])) then
    begin
      //zonaid:=sqlgeneral.fieldbyname('zdid').AsString;
      btnmodificar.Enabled:=true;
      btnalta.Enabled:=true;
      btnborrar.Enabled:=true;
      navegador.Enabled:=true;
      lbufh.Caption := UFH(tblzonasdefault);
      cbprotocolo.itemindex := tblzonasdefault.fieldbyname('idprotocolo').asinteger -1;
      end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Esa Zona Default no Existe','Información',mb_ok+mb_iconinformation);
    tblzonasdefault.Active:=false;
    clave.Text:='';
    clave.SetFocus;
  end;
end;

procedure TfrmZonasDefault.tblzonasdefaultBeforePost(DataSet: TDataSet);
begin
 //trae el idprotocolo
 querys('select idprotocolo from protocolos where protocolo='+quotedstr(cbprotocolo.Text),0,sqlgeneral);
  tblzonasdefaultidprotocolo.Asinteger := sqlgeneral.fieldbyname('idprotocolo').AsInteger;
end;

procedure TfrmZonasDefault.cbprotocoloSelect(Sender: TObject);
begin
cargacombo3('Select clave from alarmas_tipos where idprotocolo ='+quotedstr(inttostr(cbprotocolo.ItemIndex + 1)), 'clave', cbtipo);
end;

procedure TfrmZonasDefault.cbtipoSelect(Sender: TObject);
begin
cargacombo3('Select zona from zonas_protocolo where idprotocolo ='+quotedstr(inttostr(cbprotocolo.ItemIndex + 1)), 'zona', cbzona);
end;

procedure TfrmZonasDefault.CargaCombo3(sql, campo:string;combo : TRzDBComboBox);
var sqlgral:tmyquery;
begin
sqlgral := tmyquery.Create(nil);
sqlgral.Connection := dmaccesos.conexion;
combo.Items.Clear;
querys(sql,0,sqlgral);
if sqlgral.RecordCount = 0 then
   application.MessageBox(pchar('No se encontraron registros o no existe la tabla en el sistema!'),'Aviso',mb_iconwarning)
else
  begin
    sqlgral.First;
    while not sqlgral.Eof do
       begin
          combo.Items.Add(sqlgral.Fieldbyname(campo).AsString);
          sqlgral.Next;
       end;
  end;
sqlgral.Free;
end;

procedure TfrmZonasDefault.habilita(hab:boolean);
begin
cbprotocolo.Enabled := hab;
descripcion.Enabled := hab;
cbtipo.Enabled := hab;
cbzona.Enabled := hab;
end;

procedure TfrmZonasDefault.cbprotocoloKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (cbprotocolo.text <> '') then
  begin
   key := #0;
   cbprotocolo.OnSelect(self);
   sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmZonasDefault.cbtipoKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (cbtipo.text <> '') then
  begin
   key := #0;
   cbtipo.OnSelect(self);
   sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmZonasDefault.cbzonaKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (cbzona.text <> '') then
  begin
   key := #0;
   sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmZonasDefault.cbprotocoloNotInList(Sender: TObject);
begin
cbprotocolo.ItemIndex := -1;
cbprotocolo.text := '';
cbprotocolo.setfocus;
end;

procedure TfrmZonasDefault.cbtipoNotInList(Sender: TObject);
begin
cbtipo.ItemIndex := -1;
cbtipo.text := '';
cbtipo.setfocus;
end;

procedure TfrmZonasDefault.cbzonaNotInList(Sender: TObject);
begin
cbzona.ItemIndex := -1;
cbzona.text := '';
cbzona.setfocus;
end;

procedure TfrmZonasDefault.descripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
 begin
  key :=  #0;
  if btnalta.Caption = '&Guardar' then
   btnalta.SetFocus;
  if btnmodificar.Caption = '&Guardar' then
   btnmodificar.setfocus;
 end;
end;

{REPORTE PARA IMPRIMIR LAS ZONAS DEFAULT
querys('Select distinct zd.atid, at.nombre, at.descripcion, at.nombre2, p.protocolo From zonas_default AS zd Left Join alarmas_tipos AS at ON zd.atid = at.clave '+
       'left join protocolos as p on p.idprotocolo= at.idprotocolo order by at.idprotocolo, atid ', 0, dmreportes.sqlgeneral);
operacionreporte('ZonasDefault', 'ZonasDefault', 'ARC', 1);
}

End.
