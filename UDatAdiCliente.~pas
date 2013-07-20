{///////////////////////////////////////////////////////////////////////////////
2012/0/13 dalyla agregar cuenta bancaria
2008/01/22 dalyla Calcamonia, Acrilico y Numero
}///////////////////////////////////////////////////////////////////////////////
unit UDatAdiCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzRadGrp, RzPanel, RzDBEdit,
  StdCtrls, ComCtrls, DBCtrls, RzDTP, RzDBDTP, ExtCtrls, RzEdit, RzLabel,
  Mask, RzBtnEdt, RzButton,dateutils, RzDBBnEd, RzRadChk, RzCmboBx, RzDBChk,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, RzSpnEdt, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfrmDatAdiCliente = class(TForm)
    gbcomplement: TRzCheckGroup;
    RzLabel10: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel49: TRzLabel;
    edcompania: TRzDBEdit;
    edreviso: TRzDBEdit;
    FechaRev: TRzDBDateTimePicker;
    edLunVier: TRzDBEdit;
    edsabados: TRzDBEdit;
    eddomingos: TRzDBEdit;
    mmobservaciones: TRzDBRichEdit;
    edcosto: TRzDBNumericEdit;
    gblocal: TRzGroupBox;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzLabel41: TRzLabel;
    RzLabel42: TRzLabel;
    RzLabel43: TRzLabel;
    RzLabel44: TRzLabel;
    RzLabel45: TRzLabel;
    RzLabel46: TRzLabel;
    edNumElector: TRzDBEdit;
    edcfe: TRzDBEdit;
    edCatastral: TRzDBEdit;
    edNumLicencia: TRzDBEdit;
    edestado: TRzDBEdit;
    edNumPasaporte: TRzDBEdit;
    edescritura: TRzDBEdit;
    EscrituraFecha: TRzDBDateTimePicker;
    edNumNotario: TRzDBEdit;
    edciudad: TRzDBEdit;
    edNumPoder: TRzDBEdit;
    edNomArrendatario: TRzDBEdit;
    rgTipoPass: TRzRadioGroup;
    SqlDetclientes: TMyQuery;
    dspedidos: TDataSource;
    SqlGeneral: TMyQuery;
    Panel1: TPanel;
    btncancelar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    SqlDetclientesidcliente: TIntegerField;
    SqlDetclientescompania: TStringField;
    SqlDetclientespaquete: TSmallintField;
    SqlDetclientesreviso: TStringField;
    SqlDetclientesfecha_instalacion: TDateField;
    SqlDetclientesFechaReviso: TDateField;
    SqlDetclientescuota: TFloatField;
    SqlDetclientesflbital: TWordField;
    SqlDetclientesflcablemas: TWordField;
    SqlDetclientesflcargo: TWordField;
    SqlDetclientesfloficina: TWordField;
    SqlDetclientesfloxxo: TWordField;
    SqlDetclientesflcobranza: TWordField;
    SqlDetclientesflcosto: TFloatField;
    SqlDetclientesfrecuencia: TWordField;
    SqlDetclientescableado: TSmallintField;
    SqlDetclientesEstvulnera: TWordField;
    SqlDetclientesProtPerim1: TSmallintField;
    SqlDetclientesProtPerim2: TSmallintField;
    SqlDetclientesTrabDiasFest: TSmallintField;
    SqlDetclientesHorLunVier: TStringField;
    SqlDetclientesHorSab: TStringField;
    SqlDetclientesHorDom: TStringField;
    SqlDetclientesCveCatastral: TStringField;
    SqlDetclientesNumCfe: TStringField;
    SqlDetclientesTipoCred: TStringField;
    SqlDetclientesNumCredElec: TStringField;
    SqlDetclientesNumLicMan: TFloatField;
    SqlDetclientesEdoLicMan: TStringField;
    SqlDetclientesEscritura: TStringField;
    SqlDetclientesNumNotario: TFloatField;
    SqlDetclientesFechaEscritura: TDateField;
    SqlDetclientesCiudad: TStringField;
    SqlDetclientesNumPoder: TFloatField;
    SqlDetclientesNomArrendat: TStringField;
    SqlDetclientesNumPasaporte: TFloatField;
    SqlDetclientesTipoPasaporte: TSmallintField;
    SqlDetclientesstatus: TSmallintField;
    SqlDetclientesusuario: TStringField;
    SqlDetclientesfecha: TStringField;
    SqlDetclienteshora: TStringField;
    SqlDetclientesestado: TStringField;
    SqlDetclientesobservaciones: TMemoField;
    gbtarjeta: TRzGroupBox;
    SqlDetclientesNumTarjeta: TStringField;
    SqlDetclientesNombreTarjeta: TStringField;
    SqlDetclientesApaternoTarjeta: TStringField;
    SqlDetclientesAmaternoTarjeta: TStringField;
    SqlDetclientesEquipo: TFloatField;
    SqlDetclientesServicio: TFloatField;
    SqlDetclientesConceptoTarjeta: TStringField;
    gbcargos: TRzPanel;
    Label1: TLabel;
    ednumtarjeta: TRzDBEdit;
    Label5: TLabel;
    cbotipopago: TRzComboBox;
    Label6: TLabel;
    edconceptotarjeta: TRzDBEdit;
    edmaterno: TRzDBEdit;
    Label4: TLabel;
    edpaterno: TRzDBEdit;
    Label3: TLabel;
    ednombre: TRzDBEdit;
    Label2: TLabel;
    RzLabel48: TRzLabel;
    cbofrecuencia: TRzComboBox;
    RzGroupBox2: TRzGroupBox;
    Label7: TLabel;
    edequipo: TRzDBEdit;
    Label8: TLabel;
    edservicio: TRzDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtotal: TRzEdit;
    chtarjeta: TRzDBCheckBox;
    SqlDetclientesTipoCargo: TStringField;
    Label11: TLabel;
    cbobanco: TRzComboBox;
    Label12: TLabel;
    Label13: TLabel;
    edclave: TRzDBEdit;
    dfechapromesa: TRzDBDateTimeEdit;
    dfechacargo: TRzDBDateTimeEdit;
    Label14: TLabel;
    SqlDetclientesbanco: TStringField;
    SqlDetclientesclave: TStringField;
    SqlDetclientesFechaVTarjeta: TDateField;
    SqlDetclientesFechaVCargo: TDateField;
    rcgtrafico: TRzCheckGroup;
    SqlDetclientesTrafEmail: TSmallintField;
    SqlDetclientesTrafEnPersona: TSmallintField;
    SqlDetclientesNoTraf: TSmallintField;
    rgContactoCambio: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    ednomcamb: TRzDBEdit;
    edrelcamb: TRzDBEdit;
    SqlDetclientesNombreCambio: TStringField;
    SqlDetclientesRelacionPuestoCambio: TStringField;
    RzLabel3: TRzLabel;
    edfechacambio: TRzDateTimeEdit;
    btnNombre: TRzBitBtn;
    pnlClientesMTC: TRzPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxano: TcxGridDBColumn;
    cxmes: TcxGridDBColumn;
    cxusuario: TcxGridDBColumn;
    cxfecha: TcxGridDBColumn;
    cxhora: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cbomes: TRzComboBox;
    lblmeses: TRzLabel;
    RzLabel4: TRzLabel;
    edano: TRzSpinEdit;
    btnagregar: TRzBitBtn;
    btneliminar: TRzBitBtn;
    btnsalir: TRzBitBtn;
    sqlclientesMTC: TMyQuery;
    dsclientesMTC: TDataSource;
    Label15: TLabel;
    rgservicios: TRzCheckGroup;
    SqlDetclientesCalcamonia: TBooleanField;
    SqlDetclientesAcrilico: TBooleanField;
    SqlDetclientesNumero: TBooleanField;
    lbufh: TRzLabel;
    Label16: TLabel;
    edctaban: TRzDBEdit;
    SqlDetclientesctaban: TStringField;
    procedure btnmodificarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure edNumLicenciaEnter(Sender: TObject);
    procedure edcompaniaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edservicioKeyPress(Sender: TObject; var Key: Char);
    procedure edequipoKeyPress(Sender: TObject; var Key: Char);
    procedure edequipoExit(Sender: TObject);
    procedure chtarjetaClick(Sender: TObject);
    procedure rcgtraficoChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure btnNombreClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure btnagregarClick(Sender: TObject);
    procedure btneliminarClick(Sender: TObject);
    procedure cbomesChange(Sender: TObject);
    procedure cbomesNotInList(Sender: TObject);
    procedure sqlclientesMTCAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    cve_cte:integer;
//      procedure limpia;
  public
    { Public declarations }
    constructor inicializa(cvecte:integer);
  end;

var
  frmDatAdiCliente: TfrmDatAdiCliente;

implementation

uses Uprincipal, Urecursos, Udm, Ubusquedas, Uclie_cancel;

{$R *.dfm}

constructor tfrmDatAdicliente.inicializa(cvecte:integer);
begin

CargaCombo('Select nombre from TiposPagos where tipo = 2 order by idTipoPago asc','TiposCargo(s)',cbotipopago);
CargaCombo('Select nombre from TiposBancos order by nombre asc','TiposBancos(s)',cbobanco);
cve_cte:=cvecte;
sqldetclientes.Close;
sqldetclientes.ParamByName('clave').AsInteger:=cvecte;
sqldetclientes.open;
if sqldetclientes.RecordCount > 0 then
  begin
  gbcomplement.ItemChecked[0]:=strtobooldef(sqldetclientes.FieldByName('flbital').Asstring,false);
  gbcomplement.ItemChecked[1]:=strtobooldef(sqldetclientes.FieldByName('flcablemas').Asstring,false);
  gbcomplement.ItemChecked[2]:=strtobooldef(sqldetclientes.FieldByName('trabdiasfest').Asstring,false);
  gbcomplement.ItemChecked[3]:=strtobooldef(sqldetclientes.FieldByName('floficina').Asstring,false);
  gbcomplement.ItemChecked[4]:=strtobooldef(sqldetclientes.FieldByName('floxxo').Asstring,false);
  gbcomplement.ItemChecked[5]:=strtobooldef(sqldetclientes.FieldByName('flcobranza').Asstring,false);
  gbcomplement.ItemChecked[6]:=strtobooldef(sqldetclientes.FieldByName('cableado').Asstring,false);
  gbcomplement.ItemChecked[7]:=strtobooldef(sqldetclientes.FieldByName('estvulnera').Asstring,false);
  gbcomplement.ItemChecked[8]:=strtobooldef(sqldetclientes.FieldByName('protperim1').Asstring,false);
  gbcomplement.ItemChecked[9]:=strtobooldef(sqldetclientes.FieldByName('protperim2').Asstring,false);

  rcgtrafico.ItemChecked[0]:=strtobooldef(sqldetclientes.FieldByName('TrafEmail').Asstring,false);
  rcgtrafico.ItemChecked[1]:=strtobooldef(sqldetclientes.FieldByName('TrafEnPersona').Asstring,false);
  rcgtrafico.ItemChecked[2]:=strtobooldef(sqldetclientes.FieldByName('NoTraf').Asstring,false);

  rgservicios.ItemChecked[0]:=sqldetclientes.FieldByName('Calcamonia').asboolean;
  rgservicios.ItemChecked[1]:=sqldetclientes.FieldByName('Acrilico').asboolean;
  rgservicios.ItemChecked[2]:=sqldetclientes.FieldByName('Numero').Asboolean;

  cbotipopago.Text := sqldetclientes.FieldByName('TipoCargo').Asstring;
  cbobanco.Text := sqldetclientes.FieldByName('banco').Asstring;
  rgTipoPass.ItemIndex:=sqldetclientes.FieldByName('TipoPasaporte').Asinteger;
  cboFrecuencia.ItemIndex:=sqldetclientes.FieldByName('frecuencia').Asinteger;
  edtotal.Text :=  floattostr(sqldetclientes.FieldByName('Equipo').AsFloat +  sqldetclientes.FieldByName('Servicio').AsFloat);
  querys('Select FechaContactoCambio from DetClientes where idcliente='+inttostr(cvecte), 0, sqlgeneral);
  edfechacambio.Text := sqlgeneral.fieldbyname('FechaContactoCambio').AsString;
  lbufh.Caption := UFH(sqldetclientes);
end
else
  begin
   querys('insert into DetClientes (idcliente) values ('+inttostr(cvecte)+')',1,sqlgeneral);
   self.inicializa(cvecte);
  end;

//llenar combo de tipo de cargos.......






////////////


end;


//procedure TfrmDatAdiCliente.limpia;
//var i:integer;
//begin
//    for i:=0 to gbcomplement.Items.Count-1 do
 //       gbcomplement.ItemChecked[i]:=false;
//end;


procedure TfrmDatAdiCliente.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     frmprincipal.ucprincipal.Log('Dio click en el boton editar de detalles de Clientes',0);
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
      btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     gbcomplement.Enabled:=true;
     gblocal.Enabled:=true;
     rcgtrafico.Enabled := true;
     rgservicios.Enabled := true;
     rgContactoCambio.Enabled := true;
//     gbcontrato.Enabled:=true;
 //    gbabogado.Enabled:=true;
     SqlDetclientes.Edit;

     if yearof(FechaRev.Date) < 2001 then
        FechaRev.Date:=date;
     if yearof(EscrituraFecha.Date) < 1980 then
        EscrituraFecha.Date:=date;
        gbtarjeta.Enabled := true;

      chtarjeta.setfocus;
   end
else
  begin
   if chtarjeta.Checked = true then
      begin
             if (dfechacargo.Date > dfechapromesa.date) then
              begin
               application.MessageBox('No puede ser una fecha de cargo a equipo mayor a una fecha de vencimiento de tarjeta, verifique!','Aviso',mb_iconinformation);
               abort;
              end;


      end;



     rcgtrafico.Enabled := false;
     rgservicios.Enabled := false;
     rgContactoCambio.Enabled := false;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btnmodificar.hint:='Editar los datos del Pedido Actual';
     btnmodificar.ImageIndex:=2;
     //Guarda los datos
     SqlDetclientes.FieldByName('flbital').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[0]))*-1;
     SqlDetclientes.FieldByName('flcablemas').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[1]))*-1;
     //SqlDetclientes.FieldByName('flcargo').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[2]))*-1;
     SqlDetclientes.FieldByName('floficina').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[3]))*-1;
     SqlDetclientes.FieldByName('floxxo').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[4]))*-1;
     SqlDetclientes.FieldByName('flcobranza').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[5]))*-1;
     SqlDetclientes.FieldByName('cableado').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[6]))*-1;
     SqlDetclientes.FieldByName('Estvulnera').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[7]))*-1;
     SqlDetclientes.FieldByName('ProtPerim1').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[8]))*-1;
     SqlDetclientes.FieldByName('ProtPerim2').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[9]))*-1;
     SqlDetclientes.FieldByName('TrabDiasFest').AsInteger:=strtoint(booltostr(gbcomplement.ItemChecked[2]))*-1;
     SqlDetclientes.FieldByName('TipoPasaporte').AsInteger:=rgTipoPass.ItemIndex;
     SqlDetclientes.FieldByName('frecuencia').AsInteger:=cbofrecuencia.ItemIndex;
     SqlDetclientes.FieldByName('TipoCargo').AsString := cbotipopago.Text;
     SqlDetclientes.FieldByName('banco').AsString := cbobanco.Text;
     SqlDetclientes.FieldByName('TrafEmail').AsInteger:=strtoint(booltostr(rcgtrafico.ItemChecked[0]))*-1;
     SqlDetclientes.FieldByName('TrafEnPersona').AsInteger:=strtoint(booltostr(rcgtrafico.ItemChecked[1]))*-1;
     SqlDetclientes.FieldByName('NoTraf').AsInteger:=strtoint(booltostr(rcgtrafico.ItemChecked[2]))*-1;
     SqlDetclientes.FieldByName('Calcamonia').AsBoolean:=rgservicios.ItemChecked[0];
     SqlDetclientes.FieldByName('Acrilico').AsBoolean:=rgservicios.ItemChecked[1];
     SqlDetclientes.FieldByName('Numero').AsBoolean:=rgservicios.ItemChecked[2];
     SqlDetclientes.FieldByName('Usuario').AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
     SqlDetclientes.FieldByName('Fecha').AsDateTime := Today;
     SqlDetclientes.FieldByName('Hora').AsString:=timetostr(HoraServidor);
     SqlDetclientes.Post;
     if edfechacambio.Text <> '' then
       querys('Update DetClientes set FechaContactoCambio='+quotedstr(datetostr(edfechacambio.date))+' where idcliente='+quotedstr(inttostr(cve_cte)), 1, sqlgeneral);
     btnmodificar.Caption:='&Editar';
     gbcomplement.Enabled:=false;
     gblocal.Enabled:=false;
     gbtarjeta.Enabled := false;

  //   end;

     end;
end;

procedure TfrmDatAdiCliente.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption = '&Cancelar' then
begin
     btnmodificar.Caption:='&Editar';
     btncancelar.Caption:='&Cerrar';
     gbcomplement.Enabled:=false;
     gblocal.Enabled:=false;
     gbtarjeta.Enabled := false;
end
else
close;
end;

procedure TfrmDatAdiCliente.edNumLicenciaEnter(Sender: TObject);
begin
if (sender is trzdbedit) and (Trzdbedit(Sender).Text = '0') then
   Trzdbedit(Sender).Text:='';

end;

procedure TfrmDatAdiCliente.edcompaniaKeyPress(Sender: TObject;
  var Key: Char);
begin

if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TfrmDatAdiCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmDatAdiCliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if btnmodificar.Caption = '&Guardar' then
  begin
  application.MessageBox('Se encuentra en modo edicion debe de guardar los datos o cancelar la edicion para poder cerrar esta ventana!','Cuidado',mb_iconwarning);
  canclose:=false;
  end
else
  canclose:=true;
end;

procedure TfrmDatAdiCliente.edservicioKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key=#13)then
  begin
     key:=#0;
     //cboFormaPago.itemindex:=0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDatAdiCliente.edequipoKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key=#13)then
  begin
     key:=#0;
     //cboFormaPago.itemindex:=0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmDatAdiCliente.edequipoExit(Sender: TObject);
begin
  edtotal.text := floattostr(strtofloat(edequipo.text) + strtofloat(edservicio.text));
end;

procedure TfrmDatAdiCliente.chtarjetaClick(Sender: TObject);
begin
if chtarjeta.Checked = true then
    begin
       gbcargos.Enabled := true;

    end else
      begin
       gbcargos.Enabled := false;

      end;
end;

procedure TfrmDatAdiCliente.rcgtraficoChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
if (index=2) and (newstate=cbChecked) then
 begin
  rcgtrafico.ItemChecked[0] :=false;
  rcgtrafico.ItemChecked[1]:=false;
 end;
if ((index=0)or(index=1))and(newstate=cbchecked) then
 rcgtrafico.ItemChecked[2]:=false;
end;

procedure TfrmDatAdiCliente.btnNombreClick(Sender: TObject);
begin
pnlClientesMTC.Visible := true;
querys('select * from clientesMTC where idcliente = '+inttostr(cve_cte)+' order by fecha,hora',0,sqlclientesMTC);
end;

procedure TfrmDatAdiCliente.btnsalirClick(Sender: TObject);
begin
pnlClientesMTC.Visible := false;
end;

procedure TfrmDatAdiCliente.btnagregarClick(Sender: TObject);
var mes,ano:integer;
begin


  mes := strtoint(formatdatetime('m',dfechapromesa.date));
  ano := strtoint(formatdatetime('yyyy',dfechapromesa.date));

  if (ano <= edano.Value) then
  if (mes < (cbomes.ItemIndex+1)) then
      begin
          application.MessageBox('No puede ser una fecha de cargo a monitoreo mayor a una fecha de vencimiento de tarjeta, verifique!','Aviso',mb_iconinformation);
          abort;
      end;

try
  querys('insert into clientesMTC (idcliente,mes,ano,usuario,fecha,hora,NumMes) values ('+inttostr(cve_cte)+','+quotedstr(cbomes.Text)+','+edano.Text+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.Username)+',CURRENT_DATE,CURRENT_TIME,'+inttostr(cbomes.ItemIndex+1)+')',1,sqlgeneral);
  querys('select * from clientesMTC where idcliente = '+inttostr(cve_cte)+' order by fecha,hora',0,sqlclientesMTC);
except

  application.MessageBox('Ocurrio un problema al intentar realizar la operación, verifique!','Aviso',mb_iconinformation);
end;


end;

procedure TfrmDatAdiCliente.btneliminarClick(Sender: TObject);
begin
querys('delete from clientesMTC where idcliente='+inttostr(cve_cte)+' and mes='+quotedstr(sqlclientesMTC.fieldbyname('mes').AsString)+' and ano='+sqlclientesMTC.fieldbyname('ano').AsString,1,sqlgeneral);
querys('select * from clientesMTC where idcliente = '+inttostr(cve_cte)+' order by fecha,hora',0,sqlclientesMTC);

end;

procedure TfrmDatAdiCliente.cbomesChange(Sender: TObject);
begin
if cbomes.Text <> '' then
 btnagregar.Enabled := true
else
 btnagregar.Enabled := false;
end;

procedure TfrmDatAdiCliente.cbomesNotInList(Sender: TObject);
begin
cbomes.Text:='';

end;

procedure TfrmDatAdiCliente.sqlclientesMTCAfterOpen(DataSet: TDataSet);
begin
if sqlclientesMTC.RecordCount > 0 then
 btneliminar.Enabled := true
else
 btneliminar.Enabled := false;
end;

end.
