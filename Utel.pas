//Ultima Modificacion Dalila 10/ABR/07
unit Utel;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, MemDS, DBAccess, MyAccess,
  cxContainer, cxLabel, RzButton, StdCtrls, Mask, RzCmboBx, RzLabel,
  ExtCtrls, RzPanel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  RzEdit, RxGIF;

type
  Tfrmtel = class(TForm)
    cxGrid1: TcxGrid;
    TableView2: TcxGridDBTableView;
    TTEL: TcxGridDBColumn;
    TNUMERO: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TEL_CONT: TRzPanel;
    RzLabel6: TRzLabel;
    t: TRzLabel;
    cbotelefonos: TRzComboBox;
    lbtelefonos: TcxLabel;
    dstelefonos: TDataSource;
    SQLTelefonos: TMyQuery;
    lb_tel: TLabel;
    SQLCambios: TMyQuery;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    TableView2DBColumn1: TcxGridDBColumn;
    edtelefono: TRzMaskEdit;
    Image1: TImage;
    RzLabel1: TRzLabel;
    edextencion: TRzEdit;
    cxextencion: TcxGridDBColumn;
    sqlgeneral: TMyQuery;
    lbufh: TRzLabel;
    procedure TableView2CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure cbotelefonosChange(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure cbotelefonosKeyPress(Sender: TObject; var Key: Char);
    procedure habilitartel;
    procedure deshabilitartel;
    procedure edtelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure cbotelefonosNotInList(Sender: TObject);
    procedure edextencionKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
     // procedure querys(const query:string; const actualizacion:integer;Sender: TObject);

  public
    { Public declarations }
    idproc,idtel,idcont,ban:integer;
    tbl,cond:string;
    usagrid:boolean;
    procedure CentraPantalla(var m: TWMWINDOWPOSCHANGED); message
   WM_WINDOWPOSCHANGING ;
    constructor inicializa(const idprocedencia,idtelefono,idc:integer;tabla,condicion:string;grid:boolean);
    
  end;

var
  frmtel: Tfrmtel;

implementation

uses Udm, Uprincipal, Udmrep, Urecursos;

{$R *.dfm}

procedure Tfrmtel.CentraPantalla(var m : TWMWINDOWPOSCHANGED);
  begin
  if frmtel.Showing then
     begin
        m.windowpos.x := round((screen.Width - frmtel.Width) div 2);  {Left/Posicion X}
        m.windowpos.y := round((screen.Height - frmtel.Height) div 2);  {Left/Posicion X}
      end;
end;

constructor tfrmtel.inicializa(const idprocedencia,idtelefono,idc:integer;tabla,condicion:string;grid:boolean);
begin
//toma los valores que le envia la forma que llama a frmtel
idproc:=idprocedencia;
tbl:=tabla;
cond:=condicion;
idtel:=idtelefono;
lb_tel.Caption:=inttostr(idproc);
idcont:=idc;
usagrid:=grid;
sqltelefonos.Close;
SQLtelefonos.ParamByName('idtel').Value:=idtel;//un parametro
sqltelefonos.Open;
lbtelefonos.Caption:=inttostr(sqltelefonos.RecordCount) + ' Telefono(s)';//se muestran el total de telefonos
lbufh.Caption := UFH(sqltelefonos);
ban:=0;
end;

procedure tfrmtel.habilitartel;
begin
cbotelefonos.Enabled:=true;
edtelefono.Enabled:=true;
edextencion.Enabled:=true;
end;

procedure tfrmtel.deshabilitartel;
begin

cbotelefonos.Enabled:=false;
edtelefono.Enabled:=false;
edextencion.Enabled:=false;
end;


{//procedimiento para dar de alta o actulizar regsitros.
procedure Tfrmtel.querys(const query:string;const actualizacion:integer;Sender: TObject);
begin
with sqlcambios do
   begin

      close;
      sql.Clear;
      sql.Add(query);
      if actualizacion = 0 then
        open
      else
        execute;
    end;
end;       }



procedure Tfrmtel.TableView2CellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
cbotelefonos.Text:=tableview2.DataController.DataSet.fieldbyname('tipo_tel').AsString;
cbotelefonoschange(self);
edtelefono.Text:=tableview2.DataController.DataSet.fieldbyname('telefono').AsString;
edextencion.Text:=tableview2.DataController.DataSet.fieldbyname('extencion').AsString;
btnborrar.Enabled:=true;
btnmodificar.Enabled:=true;
lbufh.Caption := UFH(sqltelefonos);
end;

procedure Tfrmtel.cbotelefonosChange(Sender: TObject);
begin
if cbotelefonos.Text<>'' then
 begin
//mostrar la mascara en cada caso
if (cbotelefonos.Text='CONVENCIONAL') or (cbotelefonos.text='OFICINA') or (cbotelefonos.Text='NEGOCIO') or (cbotelefonos.Text='ALARMA') then
    edtelefono.editmask:='999-9999;1;_'
else
   if cbotelefonos.text='NEXTEL RADIO' then
      edtelefono.EditMask:='' //'000*ccccccccccccccc;1;_'
   else
      edtelefono.EditMask:='###-999-999999####;1;_';
end;
end;

procedure Tfrmtel.btnaltaClick(Sender: TObject);
begin
if btnalta.Tag=0 then//si es la primera vez que aplastas el boton alta
  begin
  // habilitar para poder capturar y guardar
  habilitartel;
  btnalta.Caption:='&Guardar';
  btncancelar.Caption:='&Cancelar';
  btncancelar.Hint:='Cancelar la alta de telefono';
  btnalta.Tag:=1;
  BTNModificar.Enabled:=false;
  BTNBorrar.Enabled:=false;
  cbotelefonos.SetFocus;
  cbotelefonos.Text:='';
  edtelefono.Text:='';
  btnalta.Hint:='Guardar los datos de la alta';
  cbotelefonos.ItemIndex:=6;
  cbotelefonos.OnChange(self);
  lbufh.Caption := '';
  if (tbl = 'oportunidades') and (idtel=0) then
    begin
    cbotelefonos.itemindex := 0;
    cbotelefonos.OnChange(self);
    end;
  end
else
  begin
    if usagrid = false then
      querys('select '+inttostr(idcont)+', idtel from '+tbl+' where '+cond+' ='+inttostr(idproc), 0, sqlgeneral)
    else
      querys('select '+inttostr(idcont)+', idtel from '+tbl+' where '+cond+' ='+inttostr(idcont), 0, sqlgeneral);
    idtel:= sqlgeneral.fieldbyname('idtel').AsInteger;


  //verifica que si el idtel de procedencia es 0 para sacar el maximo + 1
  if idtel = 0 then
    begin
    querys('select max(idtel) from telefonos',0,sqlgeneral);
    idtel:=sqlgeneral.Fields.Fields[0].AsInteger + 1;
    end
  else
    ban:=1;

  querys('Select * from telefonos where telefono='+quotedstr(edtelefono.Text)+' and procedencia='+quotedstr(tbl)+' and idtel='+inttostr(idtel), 0, sqlgeneral);
  if sqlgeneral.recordcount > 0 then
    begin
    application.messagebox('Este telefono ya esta dado de Alta y no se aceptan numeros repetidos por cuenta', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;

  //insertar un nuevo telefono....
  querys('INSERT into telefonos(idtel,telefono,tipo_tel,procedencia,extencion) values ('+inttostr(idtel)+','+quotedstr(edtelefono.Text)+','+quotedstr(cbotelefonoS.Text)+','+quotedstr(tbl)+','+quotedstr(edextencion.text)+')',1,sqlgeneral);
  //actualiza los datos de hora,fecha de creacion y usuario
     querys('update telefonos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' WHERE telefono='+quotedstr(edtelefono.Text)+' and idtel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('idtel').AsString)+' and tipo_tel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('tipo_tel').AsString),1,sqlgeneral);

  frmprincipal.ucprincipal.Log('Dio de Alta el Teléfono '+edtelefono.text,1);

  if ban=0  then //esta bandera es para hacerlo una sola ocasión, ya que actualiza el registro, y solo el campo idtel que le corresponde
    begin
    if tbl='contactos' then
      querys('UPDATE contactos SET idtel='+inttostr(idtel)+' WHERE idcontacto='+inttostr(idproc)+' and idcontador='+inttostr(idcont)+'',1,frmprincipal.SqlGeneral)
    else
      querys('update '+tbl+' set idtel='+inttostr(idtel)+' where '+cond+'='+inttostr(idproc),1,frmprincipal.SqlGeneral);
    ban:=1;
    end;

  //actualizar grid
  SQLTelefonos.Close;
  sqltelefonos.ParamByName('idtel').Value:=idtel;
  SQLTelefonos.open;
  lbtelefonos.Caption:=inttostr(SQLTelefonos.RecordCount) + '-Teléfono(s).';

  btnalta.Tag:=0; //para poder deshabilitar los edits de captura
  btnalta.Caption:='&Alta';
  deshabilitartel;
  btncancelar.Caption:='&Cerrar';
  cbotelefonos.Text:='';
  edtelefono.Text:='';
  edextencion.Text:='';
  btnalta.Hint:='Dar de Alta un Teléfono';
  btncancelar.Hint:='Cerrar esta Pantalla';
end;

end;


procedure Tfrmtel.btnborrarClick(Sender: TObject);
begin
//borrar registro teléfonos
querys('DELETE from telefonos WHERE telefono='+quotedstr(tableview2.DataController.DataSet.fieldbyname('telefono').AsString)+' and idtel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('idtel').AsString)+'',1,sqlgeneral);
frmprincipal.ucprincipal.Log('Elimino el teléfono '+edtelefono.Text,3);
//verifica si todavia le quedan telefonos para esa tabla en ese registro, si no le quedan para actualzar la tabla de
//de origen a 0 para evitar empalmes de telefonos
querys('select * from telefonos where idtel='+inttostr(idtel),0,sqlgeneral);
//if sqlcambios.RecordCount = 0 then
if sqlgeneral.RecordCount = 0 then
   begin
     if tbl = 'contactos' then
        querys('update '+tbl+' set idtel=0 where '+cond+'='+inttostr(idproc)+' and idcontador='+inttostr(idcont),1,sqlgeneral)
     else
       querys('update '+tbl+ ' set idtel=0 where '+cond+'='+inttostr(idproc),1,sqlgeneral);
       btnmodificar.Enabled:=false;
       btnborrar.Enabled:=false;
   end;
cbotelefonos.Text:='';
edtelefono.Text:='';
edextencion.Text:='';
sqltelefonos.Close;
sqltelefonos.OPEN;
btnmodificar.Enabled:=false;
lbtelefonos.Caption:=inttostr(SQLTelefonos.RecordCount) + '-Teléfono(s).';
end;


procedure Tfrmtel.btnmodificarClick(Sender: TObject);
begin
//modificar registro
if btnmodificar.Caption='&Editar' then
   begin

   frmprincipal.ucprincipal.Log('Dio click en el boton editar de teléfonos',0);
  habilitartel;
   btnmodificar.Caption:='&Guardar';
   btnmodificar.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btnalta.Enabled:=false;
   btnborrar.Enabled:=false;
   btncancelar.Hint:='Cancelar la Edición';
   btnmodificar.hint:='Guardar los Cambios Realizados';

end
else
begin
//actualizar registro
    deshabilitartel;
    //actualizar un nuevo telefono....
    bpcambios('telefonos', TableView2.DataController.DataSet.fieldbyname('idtel').AsString, 'idtel');
    querys('UPDATE telefonos SET extencion='+quotedstr(edextencion.Text)+',telefono='+quotedstr(edtelefono.Text)+',tipo_tel='+quotedstr(cbotelefonos.Text)+' WHERE telefono='+quotedstr(TableView2.DataController.DataSet.fieldbyname('telefono').AsString)+' and idtel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('idtel').AsString)+' and tipo_tel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('tipo_tel').AsString),1,sqlgeneral);
    apcambios('idtel', TableView2.DataController.DataSet.fieldbyname('idtel').AsString, 'telefonos', 'frmtel');
    //actualiza los datos de hora,fecha de creacion y usuario
    frmprincipal.ucprincipal.Log('Edito el Teléfono '+TableView2.DataController.DataSet.fieldbyname('telefono').AsString,2);
    querys('update telefonos set fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(FormatDateTime('HH:mm:ss',Time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+' WHERE telefono='+quotedstr(edtelefono.Text)+' and idtel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('idtel').AsString)+' and tipo_tel='+quotedstr(TableView2.DataController.DataSet.fieldbyname('tipo_tel').AsString),1,sqlgeneral);
    SQLTelefonos.Active:=false;
    SQLTelefonos.Active:=true;
    btnmodificar.ImageIndex:=2;
    btnmodificar.Caption:='&Editar';
    btncancelar.Caption:='&Cerrar';
    btnalta.Enabled:=true;
    btnborrar.Enabled:=true;
    btnmodificar.hint:='Editar los datos del Teléfono Actual';
    btncancelar.Hint:='Cerrar esta Pantalla';

end;

end;

procedure Tfrmtel.btncancelarClick(Sender: TObject);
begin
if  btncancelar.Caption='&Cerrar' then
  begin
  deshabilitartel;
  EDTELEFONO.Text:='';
  CBOtelefonos.Text:='';
  CLOSE;
  end
else
  begin
  btnalta.Tag:=0;
  deshabilitartel;
  btncancelar.Caption:='&Cerrar';
  btnmodificar.ImageIndex:=2;
  btnmodificar.Caption:='&Editar';
  btncancelar.Hint:='Cerrar esta pantalla';
  btnalta.Caption:='&Alta';
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  lbufh.Caption := '';
  end;
end;

procedure Tfrmtel.cbotelefonosKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (cbotelefonos.Text<>'') then
   begin
    edtelefono.SetFocus;
    key:=#0;
   end;
end;

procedure Tfrmtel.edtelefonoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #34 then
  key := #42;
  
if (key = #13) and (cbotelefonos.Text<>'') then
   begin
    key:=#0;
    edextencion.SetFocus;
   end;


end;

procedure Tfrmtel.cbotelefonosNotInList(Sender: TObject);
begin
cbotelefonos.ItemIndex:=0;
cbotelefonos.OnChange(self);
end;

procedure Tfrmtel.edextencionKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
if btnalta.Caption = '&Guardar' then
   btnalta.SetFocus
 else
   btnmodificar.SetFocus;
 key:=#0;
end;
end;

end.
