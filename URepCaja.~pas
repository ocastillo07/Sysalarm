{///////////////////////////////////////////////////////////////////////////////
2009/06/15 dalyla separar  hsbc en depositos
}///////////////////////////////////////////////////////////////////////////////
unit URepCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzBtnEdt, RzEdit, StdCtrls, RzCmboBx, RzLabel, Mask,
  DB, MemDS, DBAccess, MyAccess, DateUtils, ExtCtrls, RzPanel, RzRadGrp,
  DBCtrls, RzDBNav, RzDBEdit, StrUtils;

type
  TfrmRepCaja = class(TForm)
    dtfecha: TRzDateTimeEdit;
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    cbconcepto: TRzComboBox;
    cbmoneda: TRzComboBox;
    cbbanco: TRzComboBox;
    RzLabel8: TRzLabel;
    edclave: TRzButtonEdit;
    btnalta: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btnimprimir: TRzBitBtn;
    sqlgeneral: TMyQuery;
    rgtipo: TRzRadioGroup;
    RzLabel7: TRzLabel;
    lbingresos: TRzLabel;
    lbdepositos: TRzLabel;
    navegador: TRzDBNavigator;
    dscaja: TDataSource;
    tblcaja: TMyTable;
    edmonto: TRzDBEdit;
    edtc: TRzDBEdit;
    tblcajaFechaAlta: TDateField;
    tblcajamonto: TFloatField;
    tblcajamoneda: TStringField;
    tblcajaconcepto: TStringField;
    tblcajaidbanco: TSmallintField;
    tblcajatipo: TStringField;
    tblcajausuario: TStringField;
    tblcajafecha: TDateField;
    tblcajahora: TTimeField;
    tblcajatc: TFloatField;
    lbdiferencia: TRzLabel;
    tblcajaidreporte: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure btnborrarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure edclaveChange(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnimprimirClick(Sender: TObject);
    procedure tblcajaBeforePost(DataSet: TDataSet);
    procedure rgtipoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edmontoExit(Sender: TObject);
    procedure navegadorClick(Sender: TObject; Button: TNavigateBtn);
  private
    t: integer;
    procedure habilita(hab:boolean);
    procedure buscarlocate;
    procedure limpiar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepCaja: TfrmRepCaja;

implementation

uses Udm, Udmrep, Urecursos, Uprincipal, Ubusquedas;

{$R *.dfm}

procedure TfrmRepCaja.FormShow(Sender: TObject);
begin
t :=  0;
dtfecha.Date := date;
CargaCombo2('Select cs.orden, cs.nombre from clasif_servicios cs left join TipoServicios ts on ts.idserv=cs.idserv where ts.nombre= "CAJA BANCOS"', 'nombre', 'orden', cbbanco);
end;

procedure TfrmRepCaja.habilita(hab:boolean);
begin
//dtfecha.Enabled := hab;
cbconcepto.Enabled := hab;
edmonto.Enabled := hab;
cbmoneda.Enabled := hab;
cbbanco.Enabled := hab;
rgtipo.Enabled := hab;
edtc.Enabled := hab;
edclave.Enabled := not hab;
end;

procedure TfrmRepCaja.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
    begin
    //trae el maximo idtipo + 1
    if DerechosSys('Modificar Reporte de Caja') <> true then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar el reporte', 'Atencion', MB_ICONINFORMATION);
      exit;
      end;
    limpiar;
    tblcaja.Active := true;
    querys('select max(idreporte) from RepCaja',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger + 1);
    edclave.Enabled:=false;
    btnalta.Caption:='&Guardar';
    btnalta.Hint:='Guardar los datos de la alta';
    btnalta.ImageIndex:=1;
    btncancelar.Caption:='&Cancelar';
    btncancelar.Hint:='Cancelar la Alta';
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    habilita(true);
    dtfecha.date := today;
    tblcaja.Insert;
    rgtipo.ItemIndex := t;
    edtc.text := GetConfiguraciones('TipoCambio', true);
    edmonto.SetFocus;
    navegador.Enabled:=false;
  end
 else
    begin
    if rgtipo.ItemIndex < 0 then
      begin
      Application.MessageBox('Falta el tipo de entrada', 'Atencion', MB_ICONINFORMATION);
      exit;
      end;
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Estado';
    btncancelar.Caption:='&Cerrar';
    btncancelar.Hint:='Cerrar esta Ventana';
    btnalta.ImageIndex:=5;
    btnborrar.Enabled:=false;
    t:= rgtipo.ItemIndex;
    btnmodificar.Enabled:=false;
    tblcaja.Post;
    frmprincipal.ucprincipal.Log('Dio de Alta a un cobro al Reporte de Caja '+edclave.text,1);
    habilita(false);
    edclave.Text:='';
    edclave.SetFocus;

    btnalta.OnClick(self);
   end;
end;


procedure TfrmRepCaja.btnborrarClick(Sender: TObject);
begin
if DerechosSys('Modificar Reporte de Caja') <> true then
  begin
  Application.MessageBox('Usted no tiene derechos para modificar el reporte', 'Atencion', MB_ICONINFORMATION);
  exit;
  end;

if dtfecha.Date <= frmprincipal._fechaCierreMes then
  begin
  Application.MessageBox('Este Reporte es de un cierre anterior y no puede eliminarlo', 'Atencion', MB_ICONINFORMATION);
  exit;
  end
else
  if Application.MessageBox('Estas seguro de eliminar el registro', 'Atencion', MB_ICONQUESTION+MB_YESNO) = idyes then
    begin
    tblcaja.Delete;
    frmprincipal.ucprincipal.Log('Elimino el registro del Reporte de Caja '+edclave.text,3);
    application.MessageBox('Eliminacion del registro del Reporte de Caja Exitosa','Información',mb_ok);
    btnborrar.Enabled:=false;
    btnmodificar.Enabled:=false;
    end;
end;

procedure TfrmRepCaja.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
   if DerechosSys('Modificar Reporte de Caja') <> true then
      begin
      Application.MessageBox('Usted no tiene derechos para modificar el reporte', 'Atencion', MB_ICONINFORMATION);
      exit;
      end;
    tblcaja.Active := true;
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     tblcaja.Edit;
     habilita(true);
     navegador.Enabled:=false;
     dtfecha.setfocus;
   end
else
  begin
  btncancelar.Caption:='&Cerrar';
  btnmodificar.Caption:='&Editar';
  btncancelar.Hint:='Cerrar esta Pantalla';
  btnmodificar.hint:='Editar los datos del Registro Actual';
  btnmodificar.ImageIndex:=2;
  btnalta.Enabled:=true;
  tblcaja.Post;
  frmprincipal.ucprincipal.Log('Edito el registro del Reporte de Caja '+edclave.text,2);
  habilita(false);
  //edclave.Text:='';
  edclave.SetFocus;
  navegador.Enabled := true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  end;
end;

procedure TfrmRepCaja.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
  btncancelar.Hint:='Cerrar esta Pantalla';
  btncancelar.Caption:='&Cerrar';
  navegador.Enabled:=false;
  if btnmodificar.Enabled then
    begin
    btnmodificar.Caption:='&Editar';
    btnmodificar.hint:='Editar los datos del Registro Actual';
    btnmodificar.ImageIndex:=2;
    end;
  if btnalta.Enabled then
    begin
    btnalta.Caption:='&Alta';
    btnalta.Hint:='Dar de Alta un Area';
    btnalta.ImageIndex:=5;
    end;
  //edclave.Text:='';
  habilita(false);
  btnalta.Enabled:=true;
  btnborrar.Enabled:=false;
  btnmodificar.Enabled:=false;
  edclave.SetFocus;
  end
else
  close;
end;

procedure TfrmRepCaja.edclaveButtonClick(Sender: TObject);
  var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmRepCaja.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then  begin
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
end;
end;

procedure TfrmRepCaja.edclaveKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmRepCaja.buscarlocate;
var monto:string;
begin
tblcaja.active := true;
if tblcaja.Locate('idreporte', edclave.text, []) then
   begin
   edclave.text := tblcajaidreporte.AsString;
   dtfecha.Date := tblcajaFechaAlta.AsDateTime;
   cbmoneda.Text := tblcajamoneda.AsString;
   cbconcepto.Text := tblcajaconcepto.AsString;
   querys('select replace(cs.nombre, " ", "") as nombre from clasif_servicios cs left join TipoServicios '+
          'ts on ts.idserv=cs.idserv where ts.nombre = "CAJA BANCOS" and orden =  '+tblcajaidbanco.AsString, 0, sqlgeneral);
   cbbanco.Text := sqlgeneral.fieldbyname('nombre').AsString;
   if tblcajatipo.AsString = 'Dep' then
    rgtipo.ItemIndex := 0
   else
    rgtipo.ItemIndex := 1;
   monto := edmonto.text;
   edmonto.text := '0' ;
   edmonto.OnExit(self);
   edmonto.text := monto;
   btnmodificar.Enabled:=true;
   btnalta.Enabled:=true;
   btnborrar.Enabled:=true;
   navegador.Enabled:=true;


   end
else
  begin
    btnmodificar.Enabled:=false;
    btnborrar.Enabled:=false;
    application.MessageBox('Ese registro no Existe','Información',mb_ok+mb_iconinformation);
    edclave.SetFocus;
  end;
end;

procedure TfrmRepCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmRepCaja.limpiar;
begin
dtfecha.Text := '';
edmonto.Text := '';
cbmoneda.Text := '';
cbconcepto.Text := '';
cbbanco.Text := '';
rgtipo.ItemIndex := -1;
//edclave.Text := '';
end;

procedure TfrmRepCaja.btnimprimirClick(Sender: TObject);
begin
querys('DROP TABLE IF EXISTS tmpIngresos'+frmprincipal.idmaq, 1, sqlgeneral);
querys('CREATE TABLE tmpIngresos'+frmprincipal.idmaq+' (Concepto varchar(100), HSBCMN decimal(10,2) default 0, '+
       'HSBCDLL decimal(10,2)  default 0, HSBCRAP decimal(10,2) default 0, BANORTEMN decimal(10,2) default 0, BANORTEDLL decimal(10,2)  default 0, '+
       'BANAMEX decimal(10,2) default 0, BANAMEXDLL decimal(10,2) default 0, BANCOMER decimal(10,2) default 0, BANCOMERDLL decimal(10,2) default 0, RABOBANK decimal(10,2) default 0, TOTAL decimal(10,2) default 0)', 1, sqlgeneral);

querys('Insert into tmpIngresos'+frmprincipal.idmaq+' (Concepto) select cs.nombre from clasif_servicios cs '+
       'LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv where ts.nombre = "CAJA INGRESOS" '+
       'AND cs.nombre not like "%OTROS%" order by orden', 1, sqlgeneral);

querys('SELECT if(rc.moneda = "D", (rc.monto*rc.tc), rc.monto) as monto, rc.concepto, cs.orden,'+
       'replace(cs.nombre, " ", "") as banco FROM RepCaja AS rc LEFT JOIN clasif_servicios cs on cs.orden=rc.idbanco '+
       'LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv where rc.FechaAlta = "'+dtfecha.Text+'" and rc.tipo = "Ing" '+
       'and ts.nombre = "CAJA BANCOS" order by orden', 0, sqlgeneral);
while not sqlgeneral.Eof do
  begin
  querys('Update tmpIngresos'+frmprincipal.idmaq+' set '+sqlgeneral.fieldbyname('banco').AsString+' = '+
         sqlgeneral.fieldbyname('banco').AsString+'+'+sqlgeneral.fieldbyname('monto').AsString+', TOTAL=TOTAL+'+sqlgeneral.fieldbyname('monto').AsString+' '+
         'where Concepto="'+sqlgeneral.fieldbyname('concepto').AsString+'"', 1, dmreportes.sqlgeneral6);
  sqlgeneral.Next;
  end;

querys('SELECT if(rc.moneda = "D", (rc.monto*rc.tc), rc.monto) as monto, rc.concepto, replace(cs.nombre, " ", "") as banco '+
       'FROM RepCaja AS rc LEFT JOIN clasif_servicios cs on cs.orden=rc.idbanco LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv '+
       'where rc.FechaAlta = "'+dtfecha.Text+'" and rc.tipo = "Ing" and ts.nombre = "CAJA BANCOS" and rc.concepto like "OTROS%" '+
       'order by orden', 0, sqlgeneral);
while not sqlgeneral.Eof do
  begin
  querys('Insert into tmpIngresos'+frmprincipal.idmaq+' (Concepto, '+sqlgeneral.fieldbyname('banco').AsString+', TOTAL) values ("'+
         sqlgeneral.fieldbyname('concepto').AsString+'", '+sqlgeneral.fieldbyname('monto').AsString+', '+
         sqlgeneral.fieldbyname('monto').AsString+')', 1, dmreportes.sqlgeneral6);
  sqlgeneral.Next;
  end;


querys('SELECT *, "'+dtfecha.Text+'" as periodo FROM `tmpIngresos'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral);
querys('SELECT replace(cs.nombre, " ", "") as banco, round(if(rc.moneda = "D", rc.monto, 0),2) as imp, rc.tc, '+
       'round(if(rc.moneda = "D", (rc.monto*rc.tc), rc.monto),2) as monto, cs.orden, rc.concepto, '+
       'if(cs.nombre="HSBCMN", "HSBCMN", if(concepto like "%RAP%", "RAP", rc.moneda)) as moneda FROM RepCaja AS rc '+
       'LEFT JOIN clasif_servicios cs on cs.orden=rc.idbanco LEFT JOIN TipoServicios ts on ts.idserv=cs.idserv '+
       'where rc.FechaAlta = "'+dtfecha.Text+'" and rc.tipo = "Dep" and ts.nombre = "CAJA BANCOS" order by moneda desc, idreporte asc', 0, dmreportes.sqlgeneral2);

operacionreporte('RepCaja', 'Reporte de Caja '+dtfecha.Text, 'IMP', 1);

querys('DROP TABLE IF EXISTS tmpIngresos'+frmprincipal.idmaq, 1, sqlgeneral);

end;

procedure TfrmRepCaja.tblcajaBeforePost(DataSet: TDataSet);
begin
//tblcajaidreporte.AsString;
tblcajaFechaAlta.AsDateTime := dtfecha.Date;
tblcajamoneda.AsString := cbmoneda.Text;
tblcajaconcepto.AsString := cbconcepto.Text;
querys('Select cs.orden from clasif_servicios cs left join TipoServicios ts on ts.idserv=cs.idserv '+
       'where ts.nombre= "CAJA BANCOS" and cs.nombre = "'+cbbanco.text+'"', 0, sqlgeneral);
tblcajaidbanco.AsInteger := sqlgeneral.fieldbyname('orden').AsInteger;
tblcajatipo.AsString := LeftStr(rgtipo.Items.Strings[rgtipo.itemindex], 3);
tblcajausuario.AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
tblcajaFecha.AsString := datetostr(date);
tblcajahora.AsString := FormatDateTime('HH:mm:ss', time);
end;

procedure TfrmRepCaja.rgtipoChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
if NewIndex = 0 then
  CargaCombo2('Select cs.orden, cs.nombre from clasif_servicios cs left join TipoServicios ts on ts.idserv=cs.idserv where ts.nombre= "CAJA DEPOSITOS"', 'nombre', 'orden', cbconcepto)
else
  CargaCombo2('Select cs.orden, cs.nombre from clasif_servicios cs left join TipoServicios ts on ts.idserv=cs.idserv where ts.nombre= "CAJA INGRESOS"', 'nombre', 'orden', cbconcepto);
end;

procedure TfrmRepCaja.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
    begin
    with frmbusquedas do
      begin
      query:='SELECT idreporte, FechaAlta, monto, concepto, tipo FROM RepCaja';
      campo_retorno:='idreporte';
      campo_busqueda:='Concepto';
      tabla:='';
      tblorigen := 'RepCaja';
      ShowModal;
      if resultado <> '' then
        begin
        tblcaja.Active := true;
        edclave.Text := resultado;
        buscarlocate;
        navegador.Enabled:=true;
        end;
      end;
    end;
end;

procedure TfrmRepCaja.edmontoExit(Sender: TObject);
var d, i:double;
begin
d:=0; i:=0;
if edmonto.text <> '' then
  begin
  if btnalta.Caption = '&Guardar' then
    begin
    if (rgtipo.ItemIndex = 0) then
      d := strtofloat(edmonto.text)
    else
      i := strtofloat(edmonto.text);
    end;
  end;


querys('Select sum(monto) as monto, tipo from ( Select if(moneda="D", monto*tc, monto) as monto, tipo '+
       'from RepCaja where FechaAlta = "'+dtfecha.text+'" ) as t group by tipo', 0, sqlgeneral);

if sqlgeneral.Locate('tipo', 'Ing', []) then
  i := sqlgeneral.fieldbyname('monto').AsFloat+i;

lbingresos.Caption := 'Total Ingresos: '+Format('%8.2f', [i]);

if sqlgeneral.Locate('tipo', 'Dep', []) then
  d := sqlgeneral.fieldbyname('monto').AsFloat+d;
lbdepositos.Caption := 'Total Depositos: '+Format('%8.2f', [d]);

lbdiferencia.Caption := 'Diferencia: '+Format('%8.2f', [i-d]);          
end;

procedure TfrmRepCaja.navegadorClick(Sender: TObject;
  Button: TNavigateBtn);
begin
edclave.text := tblcajaidreporte.AsString;
buscarlocate;
end;

End.
