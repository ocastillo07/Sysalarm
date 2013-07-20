unit FProtTresNiveles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FProtReporte, ImgList, ActnList, ComCtrls, ToolWin, ExtCtrls,
  StdCtrls, Buttons, ppModule, raCodMod, ppVar, ppCtrls, ppBands, ppClass,
  jpeg, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, wwDialog, wwidlg, DB, StrUtils, daDataModule,myaccess, MemDS,
  DBAccess;

type
  TProtTresNiveles = class(TFReportePrototipo)
    Panel3: TPanel;
    LbPNF: TLabel;
    LbSNF: TLabel;
    CBPN: TComboBox;
    CBSN: TComboBox;
    CxSN: TCheckBox;
    CBTN: TComboBox;
    CxTN: TCheckBox;
    SBPNF: TSpeedButton;
    SBSNF: TSpeedButton;
    LbPN: TLabel;
    LbSN: TLabel;
    LbTN: TLabel;
    LbTNF: TLabel;
    SBTNF: TSpeedButton;
    SBSignoPN: TSpeedButton;
    SBSignoSN: TSpeedButton;
    SBSignoTN: TSpeedButton;
    EdSNF: TEdit;
    EdPNF: TEdit;
    CBFijoPN: TComboBox;
    CBFijoSN: TComboBox;
    EdTNF: TEdit;
    CBFijoTN: TComboBox;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    CxJusti: TCheckBox;
    DSAux: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppShape1: TppShape;
    ppDBText4: TppDBText;
    ppLabel17: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel11: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppShape4: TppShape;
    ppSystemVariable2: TppSystemVariable;
    PCName1: TppLabel;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLabel3: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel16: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    daDataModule1: TdaDataModule;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Fecha1: TDateTimePicker;
    Fecha2: TDateTimePicker;
    Label3: TLabel;
    Logo: TppImage;
    T_Aux: TMyQuery;
    procedure SBSignoPNClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LlenaCB(CB: TComboBox; IdX, IdY: integer);
    procedure CBPNChange(Sender: TObject);
    procedure CBSNChange(Sender: TObject);
    procedure CBTNChange(Sender: TObject);
    procedure CxSNClick(Sender: TObject);
    function GetFieldsStr(S: string; I: integer): string;
    function GetNamesValuesStr(S, Name: string): string;
    function GetIndexNamesSt(S, Name: string): Integer;
    function GetTableSQL(SQL, TableComma: string): string;
    function IsNames(S, Name: string): boolean;
    procedure EdPNFExit(Sender: TObject);
    procedure SBPNFClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AutoVer(Sender: TObject);
    procedure ppDBText1GetText(Sender: TObject; var Text: string);
    procedure ppReport1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    IsBuscar: Boolean;
  public
    { Public declarations }
    FiltroFechas: string;
    AutoSQL: TStringList;
    Variantes: TStringList;
    Busquedas: TList;
    FGrupos: TStringList;
    FieldsSel: TStringList;
    FieldsNames: TStringList;
    FieldsGrp: TStringList;
    FieldsOrder: TStringList;
    FieldsBusq: TStringList;
    FilterStr: TStringList;
    procedure ConstruyeREporte;
    procedure AgregaNivel(Texto: string; Busqueda: TwwLookupDialog; Campos:
      string = ''; CamposBusqueda: string = ''; FiltroBusq: string = ''; Orden:
      string = ''; Grupos: string = '');
    procedure EntreFechas(Campo, TituloFiltro: string);
    procedure AgregaCampoalDetalle(Campo: string; Etiqueta: string; MargenIzq,
      Tamano: single);
  end;

implementation

uses MisUtiles,Urecursos, Udm;

{$R *.dfm}

function TProtTresNiveles.GetIndexNamesSt(S, Name: string): Integer;
var
  L: TStringList;
  S1: string;
  J: Integer;
begin
  L := TStringList.Create;
  while Pos(';', S) <> 0 do
    S[Pos(';', S)] := ',';
  S1 := S;
  J := Pos(',', S1);
  while J > 0 do
    begin
      L.Add(Copy(S1, 1, J - 1));
      S1 := Copy(S1, J + 1, Length(S1));
      J := Pos(',', S1);
    end;
  if S1 <> '' then
    L.Add(S1);
  try
    Result := L.IndexOf(Name);
  finally
    L.Free;
  end;
end;

function TProtTresNiveles.GetNamesValuesStr(S, Name: string): string;
var
  L: TStringList;
begin
  L := TStringList.Create;
  L.CommaText := S;
  try
    if L.IndexOfName(Name) = -1 then
      begin
        Result := ''
      end
    else
      begin
        Result := L.Values[Name]
      end;
  finally
    L.Free;
  end;
end;

function TProtTresNiveles.GetFieldsStr(S: string; I: integer): string;
var
  L: TStringList;
  S1: string;
  J: integer;
begin
  L := TStringList.Create;
  while Pos(';', S) <> 0 do
    begin
      S[Pos(';', S)] := ','
    end;
  S1 := S;
  J := Pos(',', S1);
  while J > 0 do
    begin
      L.Add(Copy(S1, 1, J - 1));
      S1 := Copy(S1, J + 1, Length(S1));
      J := Pos(',', S1);
    end;
  if S1 <> '' then
    begin
      L.Add(S1)
    end;
  try
    if I > L.Count then
      begin
        Result := ''
      end
    else
      begin
        Result := Trim(L.Strings[I - 1])
      end;
  finally
    L.Free;
  end;
end;

function TProtTresNiveles.IsNames(S, Name: string): boolean;
var
  L: TStringList;
begin
  L := TStringList.Create;
  L.CommaText := S;
  try
    Result := L.IndexOfName(Name) <> -1;
  finally
    L.Free;
  end;
end;

function TProtTresNiveles.GetTableSQL(SQL, TableComma: string): string;
var
  I: integer;
  S: string;
begin
  I := 1;
  Result := '';
  S := GetFieldsStr(TableComma, I);
  while (S <> '') do
    begin
      if Pos(S, SQL) = 0 then
        begin
          Result := Result + ', ' + S
        end;
      Inc(I);
      S := GetFieldsStr(TableComma, I);
    end;
end;

procedure TProtTresNiveles.CBPNChange(Sender: TObject);
var
  S: string;
begin
  if CBPN.ItemIndex >= 0 then
    LlenaCB(CBSN, integer(CBPN.Items.Objects[CBPN.ItemIndex]), -1);
  CBSN.ItemIndex := 0;
  EdPNF.Text := '';

  if CBPN.ItemIndex >= 0 then
    S :=
      GetNamesValuesStr(FieldsBusq[integer(CBPN.Items.Objects[CBPN.ItemIndex])],
      'Fijo');
  if S <> '' then
    begin
      CBFijoPN.Items.CommaText := 'Todos,' + StringReplace(S, ';', ',',
        [rfReplaceAll]);
      CBFijoPN.ItemIndex := 0;
    end;
  CBFijoPN.Visible := S <> '';
  EdPNF.Visible := not CBFijoPN.Visible;
  SBPNF.Visible := not CBFijoPN.Visible;
  CBSNChange(CBSN);
end;

procedure TProtTresNiveles.CBSNChange(Sender: TObject);
var
  S: string;
begin
  if (CBSN.ItemIndex >= 0) and (CBPN.ItemIndex >= 0) then
    LlenaCB(CBTN, integer(CBSN.Items.Objects[CBSN.ItemIndex]),
      integer(CBPN.Items.Objects[CBPN.ItemIndex]));
  CBTN.ItemIndex := 0;
  EdSNF.Text := '';
  if CBSN.ItemIndex >= 0 then
    S :=
      GetNamesValuesStr(FieldsBusq[integer(CBSN.Items.Objects[CBSN.ItemIndex])],
      'Fijo');
  if S <> '' then
    begin
      CBFijoSN.Items.CommaText := 'Todos,' + StringReplace(S, ';', ',',
        [rfReplaceAll]);
      CBFijoSN.ItemIndex := 0;
    end;
  CBFijoSN.Visible := S <> '';
  EdSNF.Visible := not CBFijoSN.Visible;
  SBSNF.Visible := not CBFijoSN.Visible;
  CBTNChange(CBSN);
end;

procedure TProtTresNiveles.CBTNChange(Sender: TObject);
var
  S: string;
begin
  EdTNF.Text := '';
  if CBTN.ItemIndex >= 0 then
    S :=
      GetNamesValuesStr(FieldsBusq[integer(CBTN.Items.Objects[CBTN.ItemIndex])],
      'Fijo');
  if S <> '' then
    begin
      CBFijoTN.Items.CommaText := 'Todos,' + StringReplace(S, ';', ',',
        [rfReplaceAll]);
      CBFijoTN.ItemIndex := 0;
    end;
  CBFijoTN.Visible := S <> '';
  EdTNF.Visible := not CBFijoTN.Visible;
  SBTNF.Visible := not CBFijoTN.Visible;
end;

procedure TProtTresNiveles.CxSNClick(Sender: TObject);
begin
  if Sender = CxSN then
    begin
      LbSN.Enabled := CxSN.Checked;
      CBSN.Enabled := CxSN.Checked;
      LbSNF.Enabled := CxSN.Checked;
      CBFijoSN.Enabled := CxSN.Checked;
      EdSNF.Enabled := CxSN.Checked;
      SBSNF.Enabled := CxSN.Checked;
      CxTN.Enabled := CBSN.Enabled and (Variantes.Count > 2);
      if not CxSN.Checked then
        CxTN.Checked := False;
      if CBSN.Enabled and
        (GetNamesValuesStr(FieldsBusq[integer(CBSN.Items.Objects[CBSN.ItemIndex])], 'Fijo') <> '') then
        CBSNChange(Sender);
    end
  else
    begin
      LbTN.Enabled := CxTN.Checked;
      CBTN.Enabled := CxTN.Checked and CxTN.Enabled;
      LbTNF.Enabled := CxTN.Checked;
      CBFijoTN.Enabled := CxTN.Checked;
      EdTNF.Enabled := CxTN.Checked;
      SBTNF.Enabled := CxTN.Checked;
      if CBTN.Enabled and
        (GetNamesValuesStr(FieldsBusq[integer(CBTN.Items.Objects[CBTN.ItemIndex])], 'Fijo') <> '') then
        CBTNChange(Sender);
    end;
end;

procedure TProtTresNiveles.LlenaCB(CB: TComboBox; IdX, IdY: integer);
var
  I: integer;
begin
  CB.Items.Clear;
  //if Length(Variantes) > 0 then
  for I := {Low(Variantes)} 0 to Variantes.Count - 1 {High(Variantes)} do
    begin
      if ((IdX = -1) or ((IdX <> I) and
        (Pos(IntToStr(I) + ',', FGrupos[IdX]) = 0))) and
        ((IdY = -1) or ((IdY <> I) and
        (Pos(IntToStr(I) + ',', FGrupos[IdY]) = 0))) then
        begin
          CB.AddItem(Variantes[I], TObject(I))
        end
    end;
end;

procedure TProtTresNiveles.SBSignoPNClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  if TSpeedButton(Sender).Caption = '=' then
    begin
      TSpeedButton(Sender).Caption := '!'
    end
  else
    begin
      TSpeedButton(Sender).Caption := '='
    end;

  if TSpeedButton(Sender).Caption <> '=' then
    TSpeedButton(Sender).Font.Color := clRed
  else
    TSpeedButton(Sender).Font.Color := clGreen;
  S := Copy(TSpeedButton(Sender).Name, Length(TSpeedButton(Sender).Name) - 1,
    2);
  TComboBox(Self.FindComponent('CBFijo' + S)).Font.Color :=
    TSpeedButton(Sender).Font.Color;
  TComboBox(Self.FindComponent('Ed' + S + 'F')).Font.Color :=
    TSpeedButton(Sender).Font.Color;
end;

procedure TProtTresNiveles.FormShow(Sender: TObject);
begin
  SBPNF.Tag := integer(EdPNF);

  CxSN.Tag := integer(CBSN);
  CBSN.Tag := integer(LbSN);
  LBSN.Tag := integer(LbSNF);
  LbSNF.Tag := integer(SBSNF);
  SBSNF.Tag := integer(EdSNF);
  EdSNF.Tag := integer(CxTN);
  CxTN.Tag := integer(CBTN);
  CBTN.Tag := integer(LbTN);
  LBTN.Tag := integer(LbTNF);
  LbTNF.Tag := integer(SBTNF);
  SBTNF.Tag := integer(EdTNF);

  LlenaCB(CBPN, -1, -1);
  CBPN.ItemIndex := 0;
  CBPNChange(Sender);
  if not Assigned(Ver.OnExecute) then
    begin
      Ver.OnExecute := AutoVer;
      if not GroupBox1.Visible then
        Height := ToolBar1.Top + Toolbar1.Height + Panel3.Height + Panel1.Height
          + 3;
    end;
  ToolButton1.Enabled := True;
  inherited;
end;

procedure TProtTresNiveles.EdPNFExit(Sender: TObject);
var
  sName, sFields, sWhere: string;
  CB: TComboBox;
  I: integer;
begin
  ISBuscar := (Sender is TSpeedButton) or (TEdit(Sender).Text <> '');

  if Sender is TEdit then
    begin
      if TEdit(Sender).Text = '' then
        begin
          TEdit(Sender).Tag := 0;
          Exit;
        end;
    end
  else
    begin
      if Sender is TSpeedButton then
        begin
          Sender := TEdit(TSpeedButton(Sender).Tag)
        end
    end;

  if IsBuscar then
    begin
      IsBuscar := False;
      CB := TComboBox(FindComponent('CB' + Copy(TEdit(Sender).Name, 3, 2)));
      if CB.ItemIndex <> -1 then
        begin
          I := integer(CB.Items.Objects[CB.ItemIndex]);
          sName := GetNamesValuesStr(FilterStr[I], 'Buscar');
          sFields := FieldsBusq[i]; //GetNamesValuesStr(FilterStr[I], 'FieldsN');
          sWhere := FilterStr[i]; //GetNamesValuesStr(FilterStr[I], 'WHERE');
        end;
    end;
end;

procedure TProtTresNiveles.SBPNFClick(Sender: TObject);
begin
  TEdit(TSpeedButton(Sender).Tag).Text := '';
  TEdit(TSpeedButton(Sender).Tag).OnExit(Sender);
end;

procedure TProtTresNiveles.FormDestroy(Sender: TObject);
var
  L: TStringList;
  S, S1: string;
begin
  inherited;
  AutoSQL.Free;
  Variantes.Free;
  Busquedas.Free;
  FGrupos.Free;
  FieldsSel.Free;
  FieldsNames.Free;
  FieldsGrp.Free;
  FieldsOrder.Free;
  FieldsBusq.Free;
  FilterStr.Free;
  //  end;
end;

procedure TProtTresNiveles.FormCreate(Sender: TObject);
begin
  inherited;
  AutoSQL := TStringList.Create;
  Variantes := TStringList.Create;
  Busquedas := TList.Create;
  FGrupos := TStringList.Create;
  FieldsSel := TStringList.Create;
  FieldsNames := TStringList.Create;
  FieldsGrp := TStringList.Create;
  FieldsOrder := TStringList.Create;
  FilterStr := TStringList.Create;
  FieldsBusq := TStringList.Create;
  PCName1.Text := TituloApp;
end;

procedure TProtTresNiveles.AgregaNivel;
begin
  //Se agrega un nivel al reporte...
  Variantes.Add(Texto);
  Busquedas.Add(Busqueda);
  FieldsNames.Add(Campos);
  FGrupos.Add(Grupos);
  FieldsGrp.Add(Campos);
  FieldsSel.Add(Campos);
  FieldsOrder.Add(ifthen(Orden <> '', Orden, Campos));
  FilterStr.Add(FiltroBusq);
  FieldsBusq.Add(CamposBusqueda);

  //Ajustamos la Interfaz...
  CxSN.Enabled := (Variantes.Count > 1);
  CxTN.Enabled := (Variantes.Count > 2)
end;

procedure TProtTresNiveles.ConstruyeReporte;
var
  S, F: string;
  I: integer;
begin
  ShortDateFormat := 'mm/dd/yyyy';

  ppLabel14.Caption := '';
  if AutoSQL.Text <> '' then
    T_Aux.SQL.Text := AutoSQL.Text;
  T_Aux.Close;

  T_Aux.SQL.Add('  WHERE (1 = 1)');
  I := integer(CBPN.Items.Objects[CBPN.ItemIndex]);
  S := GetNamesValuesStr(FilterStr[I], 'WhereTabla');
  T_Aux.SQL.Add(S);
  if CxSN.Checked and (Variantes.Count > 1) and (CBSN.ItemIndex <> -1) then
    begin
      I := integer(CBSN.Items.Objects[CBSN.ItemIndex]);
      S := GetNamesValuesStr(FilterStr[I], 'WhereTabla');
      T_Aux.SQL.Add(S);
      if CxSN.Checked and (Variantes.Count > 2) and (CBTN.ItemIndex <> -1) then
        begin
          I := integer(CBTN.Items.Objects[CBTN.ItemIndex]);
          S := GetNamesValuesStr(FilterStr[I], 'WhereTabla');
          T_Aux.SQL.Add(S);
        end;
    end;

  I := integer(CBPN.Items.Objects[CBPN.ItemIndex]);
  if {IsNames(FilterStr[I], 'Buscar')}(Busquedas[i] <> nil) and (EdPNF.Text <>
    '') then
    begin
      T_Aux.SQL.Add(Format('      AND (%S ' + ifthen(SBSignoPN.Caption = '!',
        '<>', '=') + ' %d)',
        [GetFieldsStr(FieldsNames[I], 2), EdPNF.Tag]));
      ppLabel14.Caption := ppLabel14.Caption + Format('< %S %S %S >',
        [CBPN.Items.Strings[CBPN.ItemIndex], ifthen(SBSignoPN.Caption = '!',
          '<>', '='),
        EdPNF.Text])
    end
  else
    begin
      if IsNames(FieldsBusq[I], 'Fijo') and (CBFijoPN.ItemIndex > 0) then
        begin
          T_Aux.SQL.Add(Format('      AND (%S ' + ifthen(SBSignoPN.Caption =
            '!',
            '<>', '=') + ' %S)',
            [GetFieldsStr(FieldsNames[I], 1),
            QuotedStr(GetFieldsStr(GetNamesValuesStr(FilterStr[I],
              'FijoValues'), CBFijoPN.ItemIndex))]));
          ;
          ppLabel14.Caption := ppLabel14.Caption + Format('< %S %S %S >',
            [CBPN.Items.Strings[CBPN.ItemIndex], ifthen(SBSignoPN.Caption = '!',
              '<>', '='),
            CBFijoPN.Text]);
        end
    end;

  if CxSN.Checked and (Variantes.Count > 1) and (CBSN.ItemIndex <> -1) then
    begin
      I := integer(CBSN.Items.Objects[CBSN.ItemIndex]);
      if {IsNames(FilterStr[I], 'Buscar')}(Busquedas[i] <> nil) and (EdSNF.Text
        <> '') then
        begin
          T_Aux.SQL.Add(Format('      AND (%S ' +
            ifthen(SBSignoSN.Caption = '!', '<>', '=') + ' %d)',
            [GetFieldsStr(FieldsNames[I], 2), EdSNF.Tag]));
          ppLabel14.Caption := ppLabel14.Caption + Format('< %S %S %S >',
            [CBSN.Items.Strings[CBSN.ItemIndex], ifthen(SBSignoSN.Caption = '!',
              '<>', '='),
            EdSNF.Text])
        end
      else
        begin
          if IsNames(FieldsBusq[I], 'Fijo') and (CBFijoSN.ItemIndex > 0) then
            begin
              T_Aux.SQL.Add(Format('      AND (%S ' +
                ifthen(SBSignoSN.Caption = '!', '<>', '=') + ' %S)',
                [GetFieldsStr(FieldsNames[I], 1),
                QuotedStr(GetFieldsStr(GetNamesValuesStr(FilterStr[I],
                  'FijoValues'), CBFijoSN.ItemIndex))]));
              ppLabel14.Caption := ppLabel14.Caption + Format('< %S %S %S >',
                [CBSN.Items.Strings[CBSN.ItemIndex], ifthen(SBSignoSN.Caption =
                  '!', '<>', '='),
                CBFijoSN.Text]);
            end
        end;

      if CxTN.Checked and (Variantes.Count > 2) and (CBTN.ItemIndex <> -1) then
        begin
          I := integer(CBTN.Items.Objects[CBTN.ItemIndex]);
          if {IsNames(FilterStr[I], 'Buscar')}(Busquedas[i] <> nil) and
          (EdTNF.Text <> '') then
            begin
              T_Aux.SQL.Add(Format('      AND (%S ' +
                ifthen(SBSignoTN.Caption = '!', '<>', '=') + ' %d)',
                [GetFieldsStr(FieldsNames[I], 2), EdTNF.Tag]));
              ppLabel14.Caption := ppLabel14.Caption +
                Format('< %S %S %S >', [CBTN.Items.Strings[CBTN.ItemIndex],
                ifthen(
                  SBSignoTN.Caption = '!', '<>', '='), EdTNF.Text])
            end
          else
            begin
              if IsNames(FieldsBusq[I], 'Fijo') and (CBFijoTN.ItemIndex > 0)
                then
                begin
                  T_Aux.SQL.Add(Format('      AND (%S ' +
                    ifthen(SBSignoTN.Caption = '!', '<>', '=') + ' %S)',
                    [GetFieldsStr(FieldsNames[I], 1),
                    QuotedStr(GetFieldsStr(GetNamesValuesStr(FilterStr[I],
                      'FijoValues'), CBFijoTN.ItemIndex))]));
                  ppLabel14.Caption := ppLabel14.Caption +
                    Format('< %S %S %S >', [CBTN.Items.Strings[CBTN.ItemIndex],
                    ifthen(
                      SBSignoTN.Caption = '!', '<>', '='), CBFijoTN.Text]);
                end
            end;
        end;
    end;

  //Agregamos el filtro de la fecha...
  if FiltroFechas <> '' then
    begin
      T_Aux.SQL.Add(' AND ' +
        AnsiReplaceStr(AnsiReplaceStr(FiltroFechas, '%Fecha1',
        QuotedStr(DateToStr(Fecha1.Date))), '%Fecha2',
        QuotedStr(DateToStr(Fecha2.Date))));
    end;

  I := integer(CBPN.Items.Objects[CBPN.ItemIndex]);
  S := FieldsOrder[I];
  F := FieldsNames[I];
  if CxSN.Checked and (Variantes.Count > 1) and (CBSN.ItemIndex <> -1) then
    begin
      I := integer(CBSN.Items.Objects[CBSN.ItemIndex]);
      S := S + ifthen(s <> '', ',') + FieldsOrder[I];
      F := F + ',' + FieldsNames[I];
      if CxTN.Checked and (Variantes.Count > 2) and (CBTN.ItemIndex <> -1) then
        begin
          I := integer(CBTN.Items.Objects[CBTN.ItemIndex]);
          S := S + ifthen(s <> '', ',') + FieldsOrder[I];
          F := F + ',' + FieldsNames[I];
        end;
    end;

  if S <> '' then
    T_Aux.SQL.Add('ORDER BY ' + S);

  T_Aux.Open;

  ppLabel7.Caption := CBPN.Text;
  if IsNames(FieldsBusq[integer(CBPN.Items.Objects[CBPN.ItemIndex])], 'Fijo')
    then
    ppGroup1.BreakName := GetFieldsStr(
      FieldsNames[integer(CBPN.Items.Objects[CBPN.ItemIndex])], 1)
  else
    ppGroup1.BreakName := GetFieldsStr(
      FieldsNames[integer(CBPN.Items.Objects[CBPN.ItemIndex])], 2);
  ppDBText1.DataField := GetFieldsStr(
    FieldsNames[integer(CBPN.Items.Objects[CBPN.ItemIndex])], 1);
  ppDBText5.DataField := GetFieldsStr(
    FieldsNames[integer(CBPN.Items.Objects[CBPN.ItemIndex])], 3);
  ppDBText1.Visible := ppDBText1.DataField <> '';
  ppDBText5.Visible := ppDBText5.DataField <> '';

  ppGroupHeaderBand2.Visible := CxSN.Checked and CxSN.Enabled;
  ppGroupFooterBand2.Visible := CxSN.Checked and CxSN.Enabled;
  ppGroupHeaderBand3.Visible := CxTN.Checked and CxTN.Enabled;
  ppGroupFooterBand3.Visible := CxTN.Checked and CxTN.Enabled;
  if CxSN.Checked and (Variantes.Count > 1) and (CBSN.ItemIndex <> -1) then
    begin
      ppLabel8.Caption := CBSN.Text;
      if IsNames(FieldsBusq[integer(CBSN.Items.Objects[CBSN.ItemIndex])], 'Fijo')
        then
        ppGroup2.BreakName := GetFieldsStr(
          FieldsNames[integer(CBSN.Items.Objects[CBSN.ItemIndex])], 1)
      else
        ppGroup2.BreakName := GetFieldsStr(
          FieldsNames[integer(CBSN.Items.Objects[CBSN.ItemIndex])], 2);
      ppDBText2.DataField := GetFieldsStr(
        FieldsNames[integer(CBSN.Items.Objects[CBSN.ItemIndex])], 1);
      ppDBText6.DataField := GetFieldsStr(
        FieldsNames[integer(CBSN.Items.Objects[CBSN.ItemIndex])], 3);
      ppDBText2.Visible := ppDBText2.DataField <> '';
      ppDBText6.Visible := ppDBText6.DataField <> '';
      if CxTN.Checked and (Variantes.Count > 2) and (CBTN.ItemIndex <> -1) then
        begin
          ppLabel9.Caption := CBTN.Text;
          if IsNames(FieldsBusq[integer(CBTN.Items.Objects[CBTN.ItemIndex])],
            'Fijo') then
            ppGroup3.BreakName :=
              GetFieldsStr(FieldsNames[integer(CBTN.Items.Objects[CBTN.ItemIndex])],
              1)
          else
            ppGroup3.BreakName :=
              GetFieldsStr(FieldsNames[integer(CBTN.Items.Objects[CBTN.ItemIndex])],
              2);
          ppDBText3.DataField :=
            GetFieldsStr(FieldsNames[integer(CBTN.Items.Objects[CBTN.ItemIndex])],
            1);
          ppDBText7.DataField :=
            GetFieldsStr(FieldsNames[integer(CBTN.Items.Objects[CBTN.ItemIndex])],
            3);
          ppDBText3.Visible := ppDBText3.DataField <> '';
          ppDBText7.Visible := ppDBText7.DataField <> '';
        end
      else
        begin
          ppGroup3.BreakName := '';
          ppDBText3.DataField := '';
          ppDBText7.DataField := '';
        end;
    end
  else
    begin
      ppGroup2.BreakName := '';
      ppDBText2.DataField := '';
      ppDBText6.DataField := '';
      ppGroup3.BreakName := '';
      ppDBText3.DataField := '';
      ppDBText7.DataField := '';
    end;
  ppGroupHeaderBand4.Visible := CxJusti.Checked;
  ppGroupHeaderBand5.Visible := CxJusti.Checked;
  ppDetailBand1.Visible := CxJusti.Checked;

  ppLabel4.Caption := CBName.Text;
end;

procedure TProtTresNiveles.AutoVer(Sender: TObject);
begin
  inherited;
  ConstruyeReporte;
  if not T_Aux.EOF then
    begin
      ppReport1.Print
    end
  else
    begin
      MessageDlg('No se encontraron datos ', mtError, [mbOK], 0)
    end;
end;

procedure TProtTresNiveles.AgregaCampoalDetalle;
begin
  with TppLabel.Create(ppReport1) do
    begin
      Band := ppHeaderBand1;
      Top := ppShape1.Top + 0.035;
      Left := MargenIzq;
      Font.Style := [fsBold, fsUnderline];
      Font.Color := clWhite;
      Caption := Etiqueta;
      Transparent := True;
    end;
  with TppDBText.Create(ppReport1) do
    begin
      Band := ppDetailBand1;
      Band.Height := Height;
      Top := 0;
      Left := MargenIzq;
      if Tamano <> 0 then
        Width := Tamano
      else
        Autosize := True;
      DataPipeline := ppReport1.DataPipeline;
      DataField := Campo;
    end;
end;

procedure TProtTresNiveles.ppDBText1GetText(Sender: TObject;
  var Text: string);
var
  I, J: Integer;
  Sn, Sv: string;
begin
  J := 0;
  if Sender = ppDBText1 then
    J := Integer(CBPN.Items.Objects[CBPN.ItemIndex])
  else if (Sender = ppDBText2) and (Variantes.Count > 1) then
    J := Integer(CBSN.Items.Objects[CBSN.ItemIndex])
  else
    if (Variantes.Count > 2) then
      J := Integer(CBTN.Items.Objects[CBTN.ItemIndex]);

  if (J <> 0) and IsNames(FieldsBusq[J], 'Fijo') then
    begin
      Sn := GetNamesValuesStr(FieldsBusq[J], 'Fijo');
      Sv := GetNamesValuesStr(FilterStr[J], 'FijoValues');
      if TppDBText(Sender).FieldValue <> null then
        begin
          I := GetIndexNamesSt(Sv, TppDBText(Sender).FieldValue);
          if I <> -1 then
            Text := GetFieldsStr(Sn, I + 1);
        end;
    end;
  if Text = '' then
    Text := 'NO ASIGNADO';
end;

procedure TProtTresNiveles.EntreFechas(Campo, TituloFiltro: string);
begin
  FiltroFechas := '(' + Campo + ' BETWEEN %Fecha1 AND %Fecha2 )';
  GroupBox1.Caption := TituloFiltro;
  GroupBox1.Show;
end;

procedure TProtTresNiveles.ppReport1BeforePrint(Sender: TObject);
begin
  inherited;
  //Ponemos el título del reporte...
  ppLabel12.Caption := 'Reporte de ' + Titulo;
end;

end.

