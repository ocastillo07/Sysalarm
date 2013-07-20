{///////////////////////////////////////////////////////////////////////////////
2011//12/01 dalyla correcion a reporte de cancelados y morosos no tenia auditoria
2011/11/05 dalyla agregar reporte de cancelado y morosos en auditoria
                  y el de pagos x linea anualidad
2010/09/16 BICENTENARIO (0 o) dalyla Guardar  RepPagosXLineaDet
//2009/05/22 dalyla cieere de compras
//2008/11/06 dalyla tendencia de vendedores se guarde
//2008-10-01 OSCAR AGREGE EL REPORTE DE REMISIONES MENSUALES
}///////////////////////////////////////////////////////////////////////////////
unit UHistoricoReportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, RzLabel, ExtCtrls, RzPanel,
  RzRadGrp, RzRadChk;

type
  TfrmHistoricoReportes = class(TForm)
    gbPeriodoMesA: TRzGroupBox;
    RzLabel6: TRzLabel;
    RzLabel11: TRzLabel;
    cbomeses: TRzComboBox;
    cboano: TRzComboBox;
    btnremicionar: TRzBitBtn;
    chbTipoReporte: TRzComboBox;
    btncerrar: TRzBitBtn;
    procedure btnremicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure cbomesesNotInList(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoReportes: TfrmHistoricoReportes;

implementation

uses Urecursos, Udmrep, Umensaje, Ureportes;

{$R *.dfm}

procedure TfrmHistoricoReportes.btnremicionarClick(Sender: TObject);
  var m,d,fecha1,fecha2,sector1,sector2:string;
  ckbRsimple,ckbnormales,ckbforzosos,chkbcancelados,ckbabogado:TRzCheckBox;
  cbomovimientos,cbosector1,cbosector2:TRzComboBox;
  chkgfolios:TRzCheckGroup;
  gbanalisisvta:TRzRadioGroup;
  _case,_hasta:integer;
begin

  m := inttostr(cbomeses.ItemIndex+1);
  if(Length(m) = 1) then
  m := '0'+ m;
  d := inttostr(DiasMes(m));
  fecha1 := cboano.Text+'/'+m+'/01';
  fecha2 := cboano.Text+'/'+m+'/'+d;

  with dmreportes  do
    begin

    if(chbTipoReporte.ItemIndex = -1) then
      _hasta :=  chbTipoReporte.Items.Count-1
    else
      _hasta := chbTipoReporte.ItemIndex;

    for _case:=chbTipoReporte.ItemIndex to _hasta do
      begin
      case _case of

      0: begin
         RepVentasMensuales(sqlgeneral,sqlgeneral2,sqlgeneral3,fecha1,fecha2,'IMP','Fecha/Venta',true);
         end;

      1: begin
          try
             querys('select min(idsector) as inicio,max(idsector) as final from sectores ',0,sqlgeneral);
             sector1 := sqlgeneral.fieldbyname('inicio').AsString;
             sector2 := sqlgeneral.fieldbyname('final').AsString;
             cbomovimientos := TRzComboBox.Create(nil);
             cbomovimientos.Parent := gbPeriodoMesA;
             cbomovimientos.Text := 'F';
             cbomovimientos.Visible := false;
             cbosector1 := TRzComboBox.Create(nil);
             cbosector1.Parent := gbPeriodoMesA;
             cbosector1.Text := sector1;
             cbosector1.Visible := false;
             cbosector2 := TRzComboBox.Create(nil);
             cbosector2.Parent := gbPeriodoMesA;
             cbosector2.Text := sector2;
             cbosector2.Visible := false;
             chkgfolios := TRzCheckGroup.Create(nil);
             chkgfolios.Parent := gbPeriodoMesA;
             chkgfolios.Items.Add('uno');
             chkgfolios.Items.Add('dos');
             chkgfolios.Items.Add('tres');
             chkgfolios.Visible := false;
             ckbRsimple := TRzCheckBox.Create(nil);
             ckbRsimple.Parent := gbPeriodoMesA;
             ckbRsimple.Checked := true;
             ckbRsimple.Visible := false;
             RepDiarioVentas(sqlgeneral,sqlgeneral2,ckbRsimple,cbomovimientos,cbosector1,cbosector2,chkgfolios,'IMP','1','1000',fecha1,fecha2,true);
          finally
             cbomovimientos.Free;
             cbosector1.Free;
             cbosector2.Free;
             chkgfolios.Free;
             ckbRsimple.Free;
             Screen.Cursor := crDefault;
             end;
          end;

      2:begin
          try
            gbanalisisvta := TRzRadioGroup.Create(nil);
            gbanalisisvta.Parent := gbPeriodoMesA;
            gbanalisisvta.Items.Add('uno');
            gbanalisisvta.Items.Add('dos');
            gbanalisisvta.Items.Add('tres');
            gbanalisisvta.ItemIndex := 0;
            gbanalisisvta.Visible := false;
            RepAnalisisVentas(sqlgeneral,sqlgeneral2,gbanalisisvta,'IMP',fecha1,fecha2,true);
          finally
            gbanalisisvta.Free;
            Screen.Cursor := crDefault;
          end;
        end;

      3:begin
          try
            gbanalisisvta := TRzRadioGroup.Create(nil);
            gbanalisisvta.Parent := gbPeriodoMesA;
            gbanalisisvta.Items.Add('uno');
            gbanalisisvta.Items.Add('dos');
            gbanalisisvta.Items.Add('tres');
            gbanalisisvta.ItemIndex := 1;
            gbanalisisvta.Visible := false;
            RepAnalisisVentas(sqlgeneral,sqlgeneral2,gbanalisisvta,'IMP',fecha1,fecha2,true);
          finally
            gbanalisisvta.Free;
            Screen.Cursor := crDefault;
          end;
        end;

      4:begin
          try
            gbanalisisvta := TRzRadioGroup.Create(nil);
            gbanalisisvta.Parent := gbPeriodoMesA;
            gbanalisisvta.Items.Add('uno');
            gbanalisisvta.Items.Add('dos');
            gbanalisisvta.Items.Add('tres');
            gbanalisisvta.ItemIndex := 2;
            gbanalisisvta.Visible := false;
            RepAnalisisVentas(sqlgeneral,sqlgeneral2,gbanalisisvta,'IMP',fecha1,fecha2,true);
          finally
            gbanalisisvta.Free;
            Screen.Cursor := crDefault;
          end;
        end;

        //FACTURAS CANCELADAS
        5:RepFacturasCanceladas(sqlgeneral2,sqlgeneral3,'IMP',fecha1,fecha2,true);

             //notas de credito
        6:begin
          RepNotasCredito(true,false,true,fecha1,fecha2,'IMP');
          end;

        //notas de credito detallado
        7:begin
          RepNotasCredito(false,true,true,fecha1,fecha2,'IMP');
          end;

        //pagos x linea.
        8:begin
          RepPagosXLinea(fecha1,fecha2,'','','IMP',true,true, false);
          end;

        //ANTIGUEDAD X LINEA
        9:begin
          try
            querys('select min(idsector) as inicio,max(idsector) as final from sectores ',0,sqlgeneral);
            sector1 := sqlgeneral.fieldbyname('inicio').AsString;
            sector2 := sqlgeneral.fieldbyname('final').AsString;
            cbomovimientos := TRzComboBox.Create(nil);
            cbomovimientos.Parent := gbPeriodoMesA;
            cbomovimientos.Visible := false;
            cbomovimientos.Text := 'FACTURAS';
            cbosector1 := TRzComboBox.Create(nil);
            cbosector1.Parent := gbPeriodoMesA;
            cbosector1.Text := sector1;
            cbosector1.Visible := false;
            cbosector2 := TRzComboBox.Create(nil);
            cbosector2.Parent := gbPeriodoMesA;
            cbosector2.Text := sector2;
            cbosector2.Visible := false;
            ckbnormales := TRzCheckBox.Create(nil);
            ckbforzosos := TRzCheckBox.Create(nil);
            chkbcancelados := TRzCheckBox.Create(nil);
            ckbabogado := TRzCheckBox.Create(nil);
            ckbnormales.Parent := gbPeriodoMesA;
            ckbforzosos.Parent := gbPeriodoMesA;
            chkbcancelados.Parent := gbPeriodoMesA;
            ckbabogado.Parent := gbPeriodoMesA;
            ckbnormales.Visible := false;
            ckbforzosos.Visible := false;
            chkbcancelados.Visible := false;
            ckbabogado.Visible := false;
            ckbnormales.Checked := true;
            ckbforzosos.checked := true;
            chkbcancelados.Checked := true;
            RepAntiguedadSaldos(0,dmreportes.sqlgeneral,dmreportes.sqlgeneral2,dmreportes.sqlgeneral3,ckbnormales,ckbforzosos,chkbcancelados,ckbabogado,cbomovimientos,cbosector1,cbosector2,'IMP','1','1000','1990/01/01',fecha2,true,true,true);
          finally
            cbomovimientos.Free;
            cbosector1.Free;
            cbosector2.Free;
            Screen.Cursor := crDefault;
          end;
        end;

      //ANTIGUEDAD X LINEA
      10:begin
        try
          querys('select min(idsector) as inicio,max(idsector) as final from sectores ',0,sqlgeneral);
          sector1 := sqlgeneral.fieldbyname('inicio').AsString;
          sector2 := sqlgeneral.fieldbyname('final').AsString;
          cbomovimientos := TRzComboBox.Create(nil);
          cbomovimientos.Parent := gbPeriodoMesA;
          cbomovimientos.Visible := false;
          cbomovimientos.Text := 'RF';
          cbosector1 := TRzComboBox.Create(nil);
          cbosector1.Parent := gbPeriodoMesA;
          cbosector1.Text := sector1;
          cbosector1.Visible := false;
          cbosector2 := TRzComboBox.Create(nil);
          cbosector2.Parent := gbPeriodoMesA;
          cbosector2.Text := sector2;
          cbosector2.Visible := false;
          ckbnormales := TRzCheckBox.Create(nil);
          ckbforzosos := TRzCheckBox.Create(nil);
          chkbcancelados := TRzCheckBox.Create(nil);
          ckbabogado := TRzCheckBox.Create(nil);
          ckbnormales.Parent := gbPeriodoMesA;
          ckbforzosos.Parent := gbPeriodoMesA;
          chkbcancelados.Parent := gbPeriodoMesA;
          ckbabogado.Parent := gbPeriodoMesA;
          ckbnormales.Visible := false;
          ckbforzosos.Visible := false;
          chkbcancelados.Visible := false;
          ckbabogado.Visible := false;
          ckbnormales.Checked := true;
          ckbforzosos.checked := true;
          chkbcancelados.Checked := true;
          RepAntiguedadSaldos(0,dmreportes.sqlgeneral,dmreportes.sqlgeneral2,dmreportes.sqlgeneral3,ckbnormales,ckbforzosos,chkbcancelados,ckbabogado,cbomovimientos,cbosector1,cbosector2,'IMP','1','1000','1990/01/01',fecha2,true,true,true);
        finally
          cbomovimientos.Free;
          cbosector1.Free;
          cbosector2.Free;
          Screen.Cursor := crDefault;
        end;
      end;

    11: //oscar
      begin
      remisionadoMensual(cbomeses.ItemIndex+1,cboano.Text,'1','9999','Todos','Todos','Todos','Todos','0','0','','',2);
      end;

    12: TendenciaVendedoresTotales(cbomeses.text,cboano.text, true, true, false, false, true, true, '');
    13: RepCompras(cbomeses.text,cboano.text, fecha1, fecha2, true);
    14: RepPagosXLineaDet(cbomeses.Text,cboano.Text, 1);
    15: begin
        {querys('select min(idsector) as inicio,max(idsector) as final from sectores ',0,sqlgeneral);
        sector1 := sqlgeneral.fieldbyname('inicio').AsString;
        sector2 := sqlgeneral.fieldbyname('final').AsString;         }
        CanceladosYMorosos(inttostr(cbomeses.ItemIndex+1), cboano.Text, '', '', '', 1);
        end;
    end;
  end;
end;
Screen.Cursor := crDefault;
end;

procedure TfrmHistoricoReportes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmHistoricoReportes.FormCreate(Sender: TObject);
begin
cboano.Text := formatdatetime('yyyy',now);
cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
end;

procedure TfrmHistoricoReportes.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmHistoricoReportes.cbomesesNotInList(Sender: TObject);
begin
cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
end;

end.
