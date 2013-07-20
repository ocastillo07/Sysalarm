unit umensajeros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ComCtrls, RzDTP, StdCtrls, Mask, RzEdit, RzDBEdit,
  RzLabel, MyAccess, DB, MemDS, DBAccess, ExtCtrls, DBCtrls, RzDBNav,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, RzPanel, RzCmboBx, RzRadChk, DateUtils;

type
  Tfrmmensajeros = class(TForm)
    btnalta: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btndia: TRzBitBtn;
    btnmen: TRzBitBtn;
    sqlgeneral: TMyQuery;
    DSMensajero: TDataSource;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    tblmensajeros: TMyTable;
    tblmensajeroscuenta: TIntegerField;
    tblmensajerosidusuario: TIntegerField;
    tblmensajerosfechaEntrega: TDateField;
    tblmensajerosusuario: TStringField;
    tblmensajerosfecha: TStringField;
    tblmensajeroshora: TStringField;
    RGagregar: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    TPentrega: TRzDateTimePicker;
    btnagregar: TRzBitBtn;
    gtempDBTableView1: TcxGridDBTableView;
    gtempLevel1: TcxGridLevel;
    gtemp: TcxGrid;
    colcuenta: TcxGridDBColumn;
    DSTemp: TDataSource;
    sqltemp: TMyQuery;
    edcuenta: TRzEdit;
    colfecha: TcxGridDBColumn;
    RGMensajero: TRzGroupBox;
    cbmensajero: TRzComboBox;
    RzGroupBox1: TRzGroupBox;
    cbmes: TRzComboBox;
    rgactual: TRzRadioButton;
    rganterior: TRzRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure edcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure cbmensajeroSelect(Sender: TObject);
    procedure gtempDBTableView1DblClick(Sender: TObject);
    procedure btnmenClick(Sender: TObject);
    procedure btndiaClick(Sender: TObject);
  private
    idmen:string;
    idusuario :integer;
    procedure insertar;
    procedure habilita(hab:boolean);
    
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmensajeros: Tfrmmensajeros;

implementation

uses Udm, Uprincipal, Urecursos, Ubusquedas, Udmrep;

{$R *.dfm}

procedure Tfrmmensajeros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
querys('drop table if exists TmpMens'+frmprincipal.idmaq, 1, sqltemp);
action:=cafree;
end;

procedure Tfrmmensajeros.btncancelarClick(Sender: TObject);
begin
 if btncancelar.Caption='&Cancelar' then
   begin
   tblmensajeros.Cancel;
   tblmensajeros.Active:=false;
   btncancelar.Hint:='Cerrar esta Pantalla';
   btncancelar.Caption:='&Cerrar';
   sqltemp.Active := false;
   if btnmodificar.Enabled then
      begin
       btnmodificar.Caption:='&Editar';
       btnmodificar.hint:='Editar los datos de la CuentasMensajeros Actual';
       btnmodificar.ImageIndex:=2;
      end;
   if btnalta.Enabled then
      begin
        btnalta.Caption:='&Alta';
        btnalta.Hint:='Dar de Alta una CuentasMensajeros';
        btnalta.ImageIndex:=5;
      end;
      habilita(true);
      edcuenta.Text := '';
      btnalta.Enabled:=true;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      btnagregar.Caption := '&Set Fecha';
  end
else
release;
end;

procedure Tfrmmensajeros.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo
//    querys('select max(idUnidadNegocio)from CuentasMensajeros',0,sqlgeneral);
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnagregar.Caption := '&Agregar';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    edcuenta.SetFocus;
    tpentrega.DateTime := fechaservidor;
    querys('drop table if exists TmpMens'+frmprincipal.idmaq, 1, sqltemp);
    querys('Create table TmpMens'+frmprincipal.idmaq+' (idcliente integer (11), fecha date)', 1, sqltemp);
    end
  else
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta una CuentasMensajeros';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    frmprincipal.ucprincipal.Log('Dio de Alta la CuentasMensajeros '+edcuenta.text,1);
     //guarda los datos
     insertar;
    querys('Select idusuario, idpuesto From usuarios where idusuario='+quotedstr(inttostr(idusuario)), 0, sqlgeneral);
    if sqlgeneral.FieldByName('idpuesto').AsInteger = 10 then
      begin
      habilita(true);
      btnagregar.caption := '&Set Fecha';
      end
    else
      habilita(false);
   end;
end;

procedure Tfrmmensajeros.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnagregar.Caption :='&Set Fecha';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     habilita(true);
     edcuenta.setfocus;
     sqltemp.Active := false;
   end
else
  begin
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos de la CuentasMensajeros actual';
     btnmodificar.ImageIndex:=2;
     habilita(false);
     btnalta.Enabled:=true;
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     frmprincipal.ucprincipal.Log('Edito la CuentasMensajeros ',2);
     end;
end;

procedure Tfrmmensajeros.habilita(hab:boolean);
begin
edcuenta.Enabled := hab;
tpentrega.Enabled := hab;
gtemp.Enabled := hab;
RGagregar.Enabled := hab;
end;

procedure Tfrmmensajeros.insertar;
var
user:string;
begin
if RGMensajero.visible = true then
  user:=idmen
else
  user:=inttostr(idusuario);

sqltemp.first;
while not sqltemp.Eof = true do
  begin
  querys('insert into CuentasMensajeros set idcliente='+quotedstr(sqltemp.fieldbyname('idcliente').AsString)+', fechaEntrega='+quotedstr(datetostr(sqltemp.fieldbyname('fecha').AsDateTime))+
         ', idusuario='+quotedstr(user)+', fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(time))+',usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname), 1, sqlgeneral);
  sqltemp.Next;
  end;
querys('drop table if exists TmpMens'+frmprincipal.idmaq, 1, sqltemp);
end;

procedure Tfrmmensajeros.FormShow(Sender: TObject);
begin
  idusuario:=frmprincipal.ucprincipal.CurrentUser.UserID;
  querys('Select idusuario, idpuesto From usuarios where idusuario='+quotedstr(inttostr(idusuario)), 0, sqlgeneral);
  if sqlgeneral.FieldByName('idpuesto').AsInteger = 10 then
    begin
    RGMensajero.Visible := true;
    CargaCombo2('Select nombre From usuarios where idpuesto = ''26''', 'nombre', '', cbmensajero);
    btnmodificar.enabled := true;
    btnagregar.Caption := '&Set Fecha';
    RGagregar.Enabled := true;
    TPentrega.date := FechaServidor;

    end
  else
    begin
    end;
 end;

procedure Tfrmmensajeros.btnagregarClick(Sender: TObject);
begin
if btnagregar.Caption = '&Agregar' then
  begin
  if edcuenta.text <> '' then
    begin
    
    querys('insert into TmpMens'+frmprincipal.idmaq+' set idcliente='+quotedstr(edcuenta.Text)+', fecha='+quotedstr(datetostr(tpentrega.DateTime)), 1, sqltemp);
    querys('Select * from TmpMens'+frmprincipal.idmaq, 0, sqltemp);
    edcuenta.Text := '';
    edcuenta.setfocus;
    end;
  end;
if btnagregar.Caption = '&Set Fecha' then
  begin
  tpentrega.Enabled := false;
  RGMensajero.Enabled := false;
  querys('Select idcliente, fechaEntrega as fecha from CuentasMensajeros where idusuario='+quotedstr(idmen)+' and fechaEntrega='+quotedstr(datetostr(tpentrega.DateTime)), 0, sqltemp);
  btnagregar.caption := '&Unset Fecha';
  exit;
  end;
if btnagregar.Caption = '&Unset Fecha' then
  begin
  tpentrega.Enabled := true;
  RGMensajero.Enabled := true;
  sqltemp.Active := false;
  btnagregar.caption := '&Set Fecha';
  exit;
  end;


end;

procedure Tfrmmensajeros.edcuentaKeyPress(Sender: TObject; var Key: Char);
begin
key := ValidaNumeros(key, true);
if key=#13 then
begin
  key:=#0;
  btnagregar.OnClick(self);
end;
end;
//muestra_mdichild(300,800,Tfrmmensajeros,'Acceso la Pantalla de Listas de cuentas por Mensajeros');

procedure Tfrmmensajeros.cbmensajeroSelect(Sender: TObject);
begin
querys('select idusuario from usuarios where nombre ='+quotedstr(cbmensajero.Text), 0, sqltemp);
idmen := sqltemp.fieldbyname('idusuario').asstring;
end;

procedure Tfrmmensajeros.gtempDBTableView1DblClick(Sender: TObject);
begin
application.MessageBox(pchar('Deseas borrar la Cuenta '+sqltemp.FieldByName('idcliente').AsString+' del dia'+sqltemp.FieldByName('fecha').AsString),'Aviso', MB_OK);
end;

procedure Tfrmmensajeros.btnmenClick(Sender: TObject);
begin

if rgmensajero.Visible = true then
  begin
  if cbmensajero.Text = '' then
    begin
    Application.MessageBox('No se ha selecciona Mensajero', 'Aviso', MB_ICONINFORMATION);
    exit;
    end;
  end;

 querys('Select idcliente, fechaEntrega, concat(usuarios.nombre, '' '', usuarios.apaterno, '' '', usuarios.amaterno) as nombre From CuentasMensajeros left join usuarios on (CuentasMensajeros.idusuario =usuarios.idusuario) where CuentasMensajeros.idusuario = '+
         quotedstr(idmen)+' and fechaEntrega = '+quotedstr(datetostr(tpentrega.date))+' order by CuentasMensajeros.idcliente', 0, dmreportes.sqlgeneral);
  if dmreportes.sqlgeneral.RecordCount = 0 then
    Application.MessageBox('No existen registros de ese usuario en esta fecha', 'Mensaje', MB_ICONINFORMATION)
  else
    OperacionReporte('CuentasMensajeros', '', 'IMP', 1);
end;

procedure Tfrmmensajeros.btndiaClick(Sender: TObject);
var
primera:TDateTime;
ultima:TDateTime;
year, month, day:word;
begin
if cbmes.Text = '' then
  begin
  decodedate(fechaservidor, year, month, day);
  cbmes.ItemIndex :=  month-1;
  end;

//Crea tabla para contabilizar cuentas or dias
querys('drop table if exists Tmp10Dias'+frmprincipal.idmaq, 1, sqlgeneral);
querys('Create table Tmp10Dias'+frmprincipal.idmaq+' (idusuario int(11), nombre varchar (30), d1 int(11) default 0, d2 int(11) default 0, d3 int(11) default 0, d4 int(11) default 0, d5 int(11) default 0, '+
       'd6 int(11) default 0, d7 int(11) default 0, d8 int(11) default 0, d9 int(11) default 0, d10 int(11) default 0, f1 date, f2 date, f3 date, f4 date, f5 date, f6 date, f7 date, f8 date, f9 date, f10 date)', 1, sqlgeneral);

//Obtiene fechas segun mes y año
if rgactual.Checked then
  begin
  primera := EncodeDate(CurrentYear, cbmes.ItemIndex+1, 1);
  ultima := EndOfAMonth(CurrentYear, cbmes.ItemIndex+1);
  end
else
  begin
  primera := EncodeDate(CurrentYear, cbmes.ItemIndex+1, 1);
  ultima := EndOfAMonth(CurrentYear, cbmes.ItemIndex+1);
  ultima := IncYear(ultima, -1);
  end;

  // INSERTA LOS USUARIOS
  querys('Insert into Tmp10Dias'+frmprincipal.idmaq+' (idusuario, nombre) Select usuarios.idusuario, usuarios.nombre from CuentasMensajeros left join usuarios on (CuentasMensajeros.idusuario =usuarios.idusuario) where fechaEntrega between '+
       quotedstr(datetostr(primera))+' and '+quotedstr(datetostr(ultima))+' group by usuarios.nombre', 1, dmreportes.sqlgeneral3);
  // BUSCA LAS FECHAS
  querys('select fechaEntrega from CuentasMensajeros where fechaEntrega between '+quotedstr(datetostr(primera))+' and '+quotedstr(datetostr(ultima))+' group by fechaEntrega order by fechaEntrega', 0, dmreportes.sqlgeneral2);


  //INSERTA  LOS TOTALES
dmreportes.sqlgeneral2.first;
i:=1;
while not dmreportes.sqlgeneral2.eof = true do
  begin

  querys('Select count(idcliente) as c'+inttostr(i)+', idusuario, max(fechaEntrega) as fechaEntrega from CuentasMensajeros where fechaEntrega='+
         quotedstr(dmreportes.sqlgeneral2.fieldbyname('fechaEntrega').AsString)+' group by idusuario', 0, dmreportes.sqlgeneral3);

    dmreportes.sqlgeneral3.First;
    querys('update Tmp10Dias'+frmprincipal.idmaq+' set d'+inttostr(i)+' = 0', 1, dmreportes.sqlgeneral4);
    querys('update Tmp10Dias'+frmprincipal.idmaq+' set f'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral3.fieldbyname('fechaEntrega').asstring), 1, dmreportes.sqlgeneral4);
  while not dmreportes.sqlgeneral3.eof = true do
    begin
    querys('update Tmp10Dias'+frmprincipal.idmaq+' set d'+inttostr(i)+' = '+quotedstr(dmreportes.sqlgeneral3.fieldbyname('c'+inttostr(i)).asstring)+' where idusuario='+quotedstr(dmreportes.sqlgeneral3.fieldbyname('idusuario').asstring), 1, dmreportes.sqlgeneral4);
    dmreportes.sqlgeneral3.next;
    end;

  dmreportes.sqlgeneral2.Next;
  i:=i+1;
  end;
  querys('Select * from Tmp10Dias'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
  OperacionReporte('Mensajeros10dias', '', 'IMP', 1);

end;

{
builder
      Var dia:integer;
begin
dia:=	DayOfWeek(STRTODATE(text));

case dia of
1:   Text := 'Monday';
2:   Text := 'Tuesday';
3:   Text := 'Wednesday';
4:   Text := 'Thursday';
5:   Text := 'Friday';
6:   Text := 'Saturday';
7:   Text := 'Sunday';
end;
}


End.
