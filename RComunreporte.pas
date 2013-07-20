unit RComunreporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ComCtrls, Grids,MyAccess,
  ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppEndUsr, ppVar, ppTypes, Buttons, WinSkinData,
  ppStrtch, ppSubRpt, DBGrids, MemDS, DBAccess;

type
  TFComunreporte = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ListBox1: TListBox;
    ListBox2: TListBox;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    SpeedButton10: TSpeedButton;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    ListBox3: TListBox;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    ListBox4: TListBox;
    Label6: TLabel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;

    Label7: TLabel;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox3: TComboBox;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    ppDesigner1: TppDesigner;
    IBOQuery1: TMyQuery;
    IBOQuery2: TMyQuery;

    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox3DblClick(Sender: TObject);
    procedure ListBox4DblClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure IBOQuery2FilterRecord(DataSet: TDataSet; var Accept: boolean);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    ban: integer;
    lista_name_fieldA: TStringList;
    lista_name_fieldB: TStringList;
    lista_name_fieldC: TStringList;
    lista_name_fieldD: TStringList;
    function field_loader: boolean;
    function field_loader_detail: boolean;
    function combo_loader: boolean;
    procedure check_button;
    function my_getband(tipo: string; Reporte: TppSubReport): TppBand;
    function crea_etiqueta(var Etiqueta: TppDBText; Reporte: TppReport;
      previo: TppDBText; indice: integer; Pipe: TppDBPipeline;
      var LCaption: TppLabel): boolean; overload;
    function crea_etiqueta(var Etiqueta: TppDBText; Reporte: TppSubReport;
      previo: TppDBText; indice: integer; Pipe: TppDBPipeline;
      var LCaption: TppLabel): boolean; overload;

  end;

function run_reporte(Tabla: TDataset): boolean; overload;
function run_reporte(Tabla: TDataset; Titulo: string): boolean; overload;
function run_reporte(sql: string; Conexion: TMyConnection): boolean; overload;
function run_reporte_md(Tabla: TDataset; Tabla_detalle: TDataset): boolean;
  overload;
function run_reporte_md(Tabla: TDataset; Tabla_detalle: TDataset;
  Titulo: string): boolean;
overload;
function run_reporte_md(sql: string; sql_detalle: string;
  Conexion: TMyconnection): boolean; overload;

var
  FComunreporte: TFComunreporte;

implementation

{$R *.dfm}

function run_reporte(Tabla: TDataset): boolean;
begin
  with TFComunreporte.Create(nil) do
    begin
      try
        ban := 0;
        IBOQuery1 := Tmyquery(Tabla);
        Result := ShowModal = mrOk;
      finally
        Free;
      end
    end;
end;

function run_reporte(Tabla: TDataset; Titulo: string): boolean;
begin
  with TFComunreporte.Create(nil) do
    begin
      try
        ban := 0;
        Edit1.Text := Titulo;
        Caption := Titulo;
        IBOQuery1 := tmyquery(Tabla);
        Result := ShowModal = mrOk;
      finally
        Free;
      end
    end;
end;

function run_reporte(sql: string; Conexion: TMyconnection): boolean;
begin
  with TFComunreporte.Create(nil) do
    begin
      try
        ban := 0;
        IBOQuery1.Connection := Conexion;
        IBOQuery1.SQL.Text := sql;
        IBOQuery1.Open;
        Result := ShowModal = mrOk;
      finally
        Free;
      end
    end;
end;

function run_reporte_md(Tabla: TDataset; Tabla_detalle: TDataset): boolean;
begin

  with TFComunreporte.Create(nil) do
    begin
      try
        ban := 1;
        IBOQuery1 := Tmyquery(Tabla);
        IBOQuery2 := Tmyquery(Tabla_detalle);
        Result := ShowModal = mrOk;
      finally
        Free;
      end
    end;
end;

function run_reporte_md(Tabla: TDataset; Tabla_detalle: TDataset;
  Titulo: string): boolean;
begin
  with TFComunreporte.Create(nil) do
    begin
      try
        ban := 1;
        Edit1.Text := Titulo;
        Caption := Titulo;
        IBOQuery1 := Tmyquery(Tabla);
        IBOQuery2 := Tmyquery(Tabla_detalle);
        Result := ShowModal = mrOk;
      finally
        Free;
      end
    end;
end;

function run_reporte_md(sql: string; sql_detalle: string;
  Conexion: TMyconnection): boolean;
begin
  with TFComunreporte.Create(nil) do
    begin
      try
        ban := 1;
        IBOQuery1.Connection := Conexion;
        IBOQuery2.Connection := Conexion;
        IBOQuery1.SQL.Text := sql;
        IBOQuery1.Open;
        IBOQuery2.SQL.Text := sql_detalle;
        IBOQuery2.Open;
        Result := ShowModal = mrOk;
      finally
        Free;
      end
    end;
end;

procedure TFComunreporte.check_button;
begin

  SpeedButton4.Enabled := ListBox1.Count > 0;
  SpeedButton6.Enabled := ListBox1.Count > 0;
  SpeedButton11.Enabled := ListBox3.Count > 0;
  SpeedButton13.Enabled := ListBox3.Count > 0;

  SpeedButton5.Enabled := ListBox2.Count > 0;
  SpeedButton7.Enabled := ListBox2.Count > 0;
  SpeedButton12.Enabled := ListBox4.Count > 0;
  SpeedButton14.Enabled := ListBox4.Count > 0;

  SpeedButton1.Enabled := (ListBox2.ItemIndex > 0) and
    (ListBox2.Count > 0) and (ListBox2.ItemIndex > -1);
  SpeedButton2.Enabled := (ListBox2.ItemIndex <
    ListBox2.Count - 1) and (ListBox2.Count > 0) and
    (ListBox2.ItemIndex > -1);
  SpeedButton3.Enabled := ListBox2.Count > 0;

  SpeedButton15.Enabled := (ListBox4.ItemIndex > 0) and
    (ListBox4.Count > 0) and (ListBox4.ItemIndex > -1);
  SpeedButton16.Enabled := (ListBox4.ItemIndex <
    ListBox4.Count - 1) and (ListBox4.Count > 0) and
    (ListBox4.ItemIndex > -1);
  SpeedButton17.Enabled := ListBox4.Count > 0;

end;

function TFComunreporte.field_loader: boolean;
var
  i: integer;
begin
  ComboBox2.Clear;
  try
    with IBOQuery1 do
      begin
        Active;
        for i := 0 to FieldList.Count - 1 do
          begin
            ListBox1.AddItem(FieldList.Fields[i].DisplayLabel, nil);
            lista_name_fieldA.Add(FieldList.Fields[i].FieldName);
            ComboBox2.AddItem(FieldList.Fields[i].DisplayLabel, nil);
          end;
        if ComboBox2.Items.Count > 0 then
          begin
            ComboBox2.ItemIndex := 0
          end;
      end;
    Result := True
  except
    Result := False;
  end;
end;

function TFComunreporte.field_loader_detail: boolean;
var
  i: integer;
begin
  ComboBox3.Clear;
  try
    with IBOQuery2 do
      begin
        Active;
        for i := 0 to FieldList.Count - 1 do
          begin
            ListBox3.AddItem(FieldList.Fields[i].DisplayLabel, nil);
            lista_name_fieldC.Add(FieldList.Fields[i].FieldName);
            ComboBox3.AddItem(FieldList.Fields[i].DisplayLabel, nil);
          end;
        if ComboBox3.Items.Count > 0 then
          begin
            ComboBox3.ItemIndex := 0
          end;
      end;
    Result := True
  except
    Result := False;
  end;
end;

procedure TFComunreporte.ListBox2DblClick(Sender: TObject);
begin
  if ListBox2.Items.Count > 0 then
    begin
      if ListBox2.ItemIndex = -1 then
        begin
          ListBox2.ItemIndex := 0
        end;
      ListBox1.AddItem(ListBox2.Items.Strings[ListBox2.ItemIndex], nil);
      lista_name_fieldA.Add(lista_name_fieldB.Strings[ListBox2.ItemIndex]);
      lista_name_fieldB.Delete(ListBox2.ItemIndex);
      ListBox2.DeleteSelected;
      check_button;
    end;
end;

procedure TFComunreporte.ListBox1DblClick(Sender: TObject);
begin
  if ListBox1.Items.Count > 0 then
    begin
      if ListBox1.ItemIndex = -1 then
        begin
          ListBox1.ItemIndex := 0
        end;
      ListBox2.AddItem(ListBox1.Items.Strings[ListBox1.ItemIndex], nil);
      lista_name_fieldB.Add(lista_name_fieldA.Strings[ListBox1.ItemIndex]);
      lista_name_fieldA.Delete(ListBox1.ItemIndex);
      ListBox1.DeleteSelected;
      check_button;
    end;
end;

function TFComunreporte.combo_loader: boolean;
var
  i: integer;
begin
  try
    ComboBox1.Clear;
    if ListBox2.Count > 0 then
      begin
        for i := 0 to ListBox2.Count - 1 do
          begin
            ComboBox1.AddItem(ListBox2.Items.Strings[i], nil);
          end;
        ComboBox1.ItemIndex := 0;
      end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFComunreporte.TabSheet2Show(Sender: TObject);
begin
  combo_loader;
end;

function TFComunreporte.crea_etiqueta(var Etiqueta: TppDBText;
  Reporte: TppReport; previo: TppDBText; indice: integer; Pipe: TppDBPipeline;
  var LCaption: TppLabel): boolean;
begin
  try
    Lcaption := TppLabel.Create(Reporte);
    Lcaption.Band := Reporte.HeaderBand;
    if previo <> nil then
      begin
        LCaption.spLeft := previo.spLeft + previo.spWidth + 10
      end
    else
      begin
        LCaption.spLeft := 0
      end;
    LCaption.spTop := Reporte.HeaderBand.spHeight - 30;
    LCaption.Caption := UpperCase(ListBox2.Items.Strings[indice]);
    LCaption.Font.Style := [fsBold];
    LCaption.spWidth := 660 div ListBox2.Count;

    Etiqueta := TppDBText.Create(reporte);
    Etiqueta.Band := Reporte.DetailBand;
    Etiqueta.spWidth := 660 div ListBox2.Count;
    if previo <> nil then
      begin
        Etiqueta.spLeft := previo.spLeft + previo.spWidth + 10
      end
    else
      begin
        Etiqueta.spLeft := 0
      end;
    Etiqueta.spTop := 2;
    Etiqueta.DataPipeline := Pipe;
    Etiqueta.DataField := lista_name_fieldB[indice];
    Result := True;
  except
    Result := False;
  end;
end;

function TFComunreporte.crea_etiqueta(var Etiqueta: TppDBText;
  Reporte: TppSubReport; previo: TppDBText; indice: integer;
  Pipe: TppDBPipeline; var LCaption: TppLabel): boolean;
begin
  try
    Lcaption := TppLabel.Create(reporte);
    Lcaption.Band := my_getband('TitleBand', reporte);
    if previo <> nil then
      begin
        LCaption.spLeft := previo.spLeft + previo.spWidth + 10
      end
    else
      begin
        LCaption.spLeft := 0
      end;
    LCaption.spTop := my_getband('TitleBand', reporte).spHeight - 5;
    LCaption.Top := 0.1563;
    LCaption.Caption := UpperCase(ListBox4.Items.Strings[indice]);
    LCaption.Font.Style := [fsBold];
    LCaption.Width := (Reporte.Report.PrinterSetup.PaperWidth -
      Reporte.Report.PrinterSetup.MarginLeft -
      Reporte.Report.PrinterSetup.MarginRight) /
      ListBox4.Count - 0.105;
    Etiqueta := TppDBText.Create(reporte);
    LCaption.Band := my_getband('TitleBand', reporte);
    Etiqueta.Band := my_getband('DetailBand', reporte);

    Etiqueta.Width := (Reporte.Report.PrinterSetup.PaperWidth -
      Reporte.Report.PrinterSetup.MarginLeft -
      Reporte.Report.PrinterSetup.MarginRight) /
      ListBox4.Count - 0.105;
    if previo <> nil then
      begin
        Etiqueta.spLeft := previo.spLeft + previo.spWidth + 10
      end
    else
      begin
        Etiqueta.spLeft := 0
      end;
    Etiqueta.spTop := 2;
    Etiqueta.DataPipeline := Pipe;
    Etiqueta.DataField := lista_name_fieldD[indice];
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFComunreporte.FormDestroy(Sender: TObject);
begin
  lista_name_fieldA.Free;
  lista_name_fieldB.Free;
  lista_name_fieldC.Free;
  lista_name_fieldD.Free;
end;

procedure TFComunreporte.SpeedButton1Click(Sender: TObject);
var
  buffer: string;
begin
  if ((ListBox2.ItemIndex > 0) and (ListBox2.ItemIndex > -1)) then
    begin
      buffer := ListBox2.Items.Strings[ListBox2.ItemIndex - 1];
      ListBox2.Items.Strings[ListBox2.ItemIndex - 1] :=
        ListBox2.Items.Strings[ListBox2.ItemIndex];
      ListBox2.Items.Strings[ListBox2.ItemIndex] := buffer;

      buffer := lista_name_fieldB.Strings[ListBox2.ItemIndex - 1];
      lista_name_fieldB.Strings[ListBox2.ItemIndex - 1] :=
        lista_name_fieldB.Strings[ListBox2.ItemIndex];
      lista_name_fieldB.Strings[ListBox2.ItemIndex] := buffer;
      ListBox2.ItemIndex := ListBox2.ItemIndex - 1;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton2Click(Sender: TObject);
var
  buffer: string;
begin
  if ((ListBox2.ItemIndex < ListBox2.Count - 1) and (ListBox2.ItemIndex > -1))
    then
    begin
      buffer := ListBox2.Items.Strings[ListBox2.ItemIndex + 1];
      ListBox2.Items.Strings[ListBox2.ItemIndex + 1] :=
        ListBox2.Items.Strings[ListBox2.ItemIndex];
      ListBox2.Items.Strings[ListBox2.ItemIndex] := buffer;

      buffer := lista_name_fieldB.Strings[ListBox2.ItemIndex + 1];
      lista_name_fieldB.Strings[ListBox2.ItemIndex + 1] :=
        lista_name_fieldB.Strings[ListBox2.ItemIndex];
      lista_name_fieldB.Strings[ListBox2.ItemIndex] := buffer;
      ListBox2.ItemIndex := ListBox2.ItemIndex + 1;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton4Click(Sender: TObject);
begin
  ListBox1.OnDblClick(Sender);
end;

procedure TFComunreporte.SpeedButton5Click(Sender: TObject);
begin
  ListBox2.OnDblClick(Sender);
end;

procedure TFComunreporte.SpeedButton6Click(Sender: TObject);
begin
  if ListBox1.Items.Count > 0 then
    begin
      while ListBox1.Items.Count > 0 do
        begin
          ListBox2.AddItem(ListBox1.Items.Strings[0], nil);
          lista_name_fieldB.Add(lista_name_fieldA.Strings[0]);
          lista_name_fieldA.Delete(0);
          ListBox1.Items.Delete(0);
        end;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton7Click(Sender: TObject);
begin
  if ListBox2.Items.Count > 0 then
    begin
      while ListBox2.Items.Count > 0 do
        begin
          ListBox1.AddItem(ListBox2.Items.Strings[0], nil);
          lista_name_fieldA.Add(lista_name_fieldB.Strings[0]);
          lista_name_fieldB.Delete(0);
          ListBox2.Items.Delete(0);
        end;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton3Click(Sender: TObject);
begin
  if ban = 1 then
    begin
      PageControl1.ActivePageIndex := 1
    end
  else
    begin
      PageControl1.ActivePageIndex := 2
    end;
end;

procedure TFComunreporte.SpeedButton9Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := ban;

end;

procedure TFComunreporte.SpeedButton8Click(Sender: TObject);
var
  lDataSource, lDataSource2: TDataSource;
  lDataPipeline: TppDBPipeline;
  lDataPipeline2: TppDBPipeline;
  lReport: TppReport;
  lsubreport: TppSubReport;
  banda_header: TppTitleBand;
  lLabel1: TppLabel;
  lLabel2: TppLabel;
  //maestro
  lDBText1, lDBText2, lDBText3, lDBText4, lDBText5, lDBText6, lDBText7,
    lDBText8, lDBText9, lDBText10: TppDBText;
  //detalle
  lDBText1d, lDBText2d, lDBText3d, lDBText4d, lDBText5d, lDBText6d: TppDBText;
  //maestro
  mLabel1, mLabel2, mLabel3, mLabel4, mLabel5, mLabel6, mLabel7,
    mLabel8, mLabel9, mLabel10: TppLabel;
  //detalle
  dmLabel1, dmLabel2, dmLabel3, dmLabel4, dmLabel5, dmLabel6: TppLabel;

  lSysVar: TppSystemVariable;
  llinea: TppLine;
begin
 // IBOQuery1.SQLOrder.Text := 'ORDER BY ' +
   // lista_name_fieldB.Strings[ComboBox1.ItemIndex];
  IBOQuery1.Close;
  IBOQuery1.Open;

  //  Creacion del dataset
  lDataSource := TDataSource.Create(Self);
  try
    lDataSource.DataSet := IBOQuery1;

    lDataSource.Name := 'Dataset_rt';

    //  Creacion del Datapipeline

    lDataPipeline := TppDBPipeline.Create(Self);

    try
      lDataPipeline.Name := 'DPL_rt';
      lDataPipeline.DataSource := lDataSource;

      //  Creacion del reporte
      lReport := TppReport.Create(Self);
      try
        lReport.DataPipeline := lDataPipeline;
        lReport.CreateDefaultBands;
        lReport.HeaderBand.spHeight := 100;
        if ban = 1 then
          begin
            lreport.DetailBand.spHeight := 44
          end
        else
          begin
            lreport.DetailBand.spHeight := 25
          end;
        lReport.DataPipeline := lDataPipeline;
        tppband(lreport.DetailBand).BeforePrint := ppDetailBand1BeforePrint;

        //  Paginador
        lSysVar := TppSystemVariable.Create(Self);
        lSysVar.Band := lReport.FooterBand;
        lSysVar.VarType := vtPrintDateTime;
        lSysVar.spLeft := 2;
        lSysVar.spTop := 2;
        lSysVar := TppSystemVariable.Create(Self);
        lSysVar.Band := lReport.FooterBand;
        lSysVar.VarType := vtPageNoDesc;
        lSysVar.Alignment := taRightJustify;
        lSysVar.spLeft := (lReport.PrinterSetup.PageDef.spPrintableWidth -
          lSysVar.spWidth) - 2;
        lSysVar.spTop := 2;

        //  Creacion de etiquetas;
        lLabel1 := TppLabel.Create(Self);
        lLabel1.Band := lReport.HeaderBand;
        lLabel1.Font.Name := 'Arial';
        lLabel1.Font.Size := 20;
        lLabel1.Font.Style := [fsBold];
        lLabel1.spLeft := 2;
        lLabel1.spTop := 2;
        lLabel1.AutoSize := True;
        lLabel1.Caption := Edit1.Text;

        lLabel2 := TppLabel.Create(Self);
        lLabel2.Band := lReport.HeaderBand;
        lLabel2.spLeft := 2;
        lLabel2.spTop := lLabel1.spTop + lLabel1.spHeight + 3;
        lLabel2.Caption := 'Ordenado por: ' + ComboBox1.Text;
        ;

        llinea := TppLine.Create(self);
        llinea.Band := lReport.HeaderBand;
        llinea.Pen.Width := 4;
        llinea.ParentWidth := True;
        llinea.spTop := llabel2.spTop + lLabel2.spHeight + 40;

        if ListBox2.Count > 0 then
          begin
            if ListBox2.Count > 0 then
              begin
                crea_etiqueta(lDBText1, lReport, nil, 0, lDataPipeline, mLabel1)
              end;
            if ListBox2.Count > 1 then
              begin
                crea_etiqueta(lDBText2, lReport, lDBText1, 1, lDataPipeline,
                  mLabel2)
              end;
            if ListBox2.Count > 2 then
              begin
                crea_etiqueta(lDBText3, lReport, lDBText2, 2, lDataPipeline,
                  mLabel3)
              end;
            if ListBox2.Count > 3 then
              begin
                crea_etiqueta(lDBText4, lReport, lDBText3, 3, lDataPipeline,
                  mLabel4)
              end;
            if ListBox2.Count > 4 then
              begin
                crea_etiqueta(lDBText5, lReport, lDBText4, 4, lDataPipeline,
                  mLabel5)
              end;
            if ListBox2.Count > 5 then
              begin
                crea_etiqueta(lDBText6, lReport, lDBText5, 5, lDataPipeline,
                  mLabel6)
              end;
            if ListBox2.Count > 6 then
              begin
                crea_etiqueta(lDBText7, lReport, lDBText6, 6, lDataPipeline,
                  mLabel7)
              end;
            if ListBox2.Count > 7 then
              begin
                crea_etiqueta(lDBText8, lReport, lDBText7, 7, lDataPipeline,
                  mLabel8)
              end;
            if ListBox2.Count > 8 then
              begin
                crea_etiqueta(lDBText9, lReport, lDBText8, 8, lDataPipeline,
                  mLabel9)
              end;
            if ListBox2.Count > 9 then
              begin
                crea_etiqueta(lDBText10, lReport, lDBText9, 9, lDataPipeline,
                  mLabel10)
              end;

          end;
        IBOQuery2.Filtered := True;
        if ListBox2.Count > 10 then
          begin
            MessageDlg('El proceso solamente puede agregar 10 campos y se ha' +
              #13 +
              'seleccionado mas de 10 campos.  Usted puede agregar ' + #13 +
              'los campos restantes en forma manual desde el disenador',
              mtWarning, [mbOK], 0)
          end;
        ppDesigner1.Report := lReport;

        // PARA EL REPORTE DETALLE
        if ban = 1 then
          begin
            //Filtrado del IBQuery2
          //  IBOQuery2.OrderingItems.Add(lista_name_fieldD[ComboBox3.ItemIndex]);
          //  IBOQuery2.OrderingItemNo := 0;
            //Datasource
            lDataSource2 := TDataSource.Create(Self);
            try
              lDataSource2.DataSet := IBOQuery2;
              lDataSource2.Name := 'Dataset_rt2';
              lDataPipeline2 := TppDBPipeline.Create(Self);
              try
                lDataPipeline2.Name := 'DPL_rt2';
                lDataPipeline2.DataSource := lDataSource2;
                lsubreport := TppSubReport.Create(Self);
                try
                  lsubreport.DataPipeline := lDataPipeline2;
                  lsubreport.GetUniqueUserName(lReport);
                  lsubreport.CreateReport(lReport);
                  lsubreport.Report.ReportDesigner := lReport.ReportDesigner;
                  lsubreport.ParentWidth := False;
                  lsubreport.Width := 7.5;
                  my_getband('DetailBand', lsubreport).Height := 0.25;
                  lsubreport.Report.PrinterSetup.PaperWidth := 7.5;

                  lsubreport.spLeft := 20;

                  lsubreport.Band := lReport.DetailBand;

                  lsubreport.spTop := 22;

                  banda_header := TppTitleBand.Create(lsubreport);
                  try
                    banda_header.Report := lsubreport.Report;
                    //etiquetas detalles
                    if ListBox4.Count > 0 then
                      begin
                        crea_etiqueta(lDBText1d, lsubreport, nil, 0,
                          lDataPipeline2, dmLabel1)
                      end;
                    if ListBox4.Count > 1 then
                      begin
                        crea_etiqueta(lDBText2d, lsubreport, lDBText1d,
                          1, lDataPipeline2, dmLabel2)
                      end;
                    if ListBox4.Count > 2 then
                      begin
                        crea_etiqueta(lDBText3d, lsubreport, lDBText2d,
                          2, lDataPipeline2, dmLabel3)
                      end;
                    if ListBox4.Count > 3 then
                      begin
                        crea_etiqueta(lDBText4d, lsubreport, lDBText3d,
                          3, lDataPipeline2, dmLabel4)
                      end;
                    if ListBox4.Count > 4 then
                      begin
                        crea_etiqueta(lDBText5d, lsubreport, lDBText4d,
                          4, lDataPipeline2, dmLabel5)
                      end;
                    if ListBox4.Count > 5 then
                      begin
                        crea_etiqueta(lDBText6d, lsubreport, lDBText5d,
                          5, lDataPipeline2, dmLabel6)
                      end;

                    if Sender = SpeedButton10 then
                      begin
                        lReport.Print
                      end
                    else
                      begin
                        ppDesigner1.ShowModal
                      end;
                  finally
                    banda_header.Free;
                  end;
                finally
                  lsubreport.Free;
                end;
              finally
                lDataPipeline2.Free;
              end;
            finally
              lDataSource2.Free;
            end;
          end
        else
          begin
            if Sender = SpeedButton10 then
              begin
                lReport.Print
              end
            else
              begin
                ppDesigner1.ShowModal
              end;
          end;
      finally
        lReport.ReportDesigner.Free;
        lReport.Free;
      end;
    finally
      lDataPipeline.Free;
    end;
  finally
    lDataSource.Free;
  end;
end;

procedure TFComunreporte.ListBox2Click(Sender: TObject);
begin
  check_button;
end;

procedure TFComunreporte.ListBox1Click(Sender: TObject);
begin
  check_button;
end;

procedure TFComunreporte.FormShow(Sender: TObject);
begin
  {valores de bandera
  0 = Normal
  1 = Maestro Detalle
  }

  Label9.Visible := ban = 1;
  Label10.Visible := ban = 1;
  ComboBox2.Visible := ban = 1;
  ComboBox3.Visible := ban = 1;
  Label7.Visible := ban = 1;
  Label2.top := 44 + (ban * 56);
  Edit1.Top := 60 + (ban * 64);

  IBOQuery1.Open;
  if ban = 1 then
    begin
      IBOQuery2.Open
    end;

  lista_name_fieldA := TStringList.Create;
  lista_name_fieldB := TStringList.Create;
  lista_name_fieldC := TStringList.Create;
  lista_name_fieldD := TStringList.Create;
  PageControl1.ActivePageIndex := 0;
  TabSheet2.TabVisible := False;

  field_loader;
  field_loader_detail;
  check_button;
end;

procedure TFComunreporte.ListBox3DblClick(Sender: TObject);
begin
  if ListBox3.Items.Count > 0 then
    begin
      if ListBox3.ItemIndex = -1 then
        begin
          ListBox3.ItemIndex := 0
        end;
      ListBox4.AddItem(ListBox3.Items.Strings[ListBox3.ItemIndex], nil);
      lista_name_fieldD.Add(lista_name_fieldC.Strings[ListBox3.ItemIndex]);
      lista_name_fieldC.Delete(ListBox3.ItemIndex);
      ListBox3.DeleteSelected;
      check_button;
    end;
end;

procedure TFComunreporte.ListBox4DblClick(Sender: TObject);
begin
  if ListBox4.Items.Count > 0 then
    begin
      if ListBox4.ItemIndex = -1 then
        begin
          ListBox4.ItemIndex := 0
        end;
      ListBox3.AddItem(ListBox4.Items.Strings[ListBox4.ItemIndex], nil);
      lista_name_fieldC.Add(lista_name_fieldD.Strings[ListBox4.ItemIndex]);
      lista_name_fieldD.Delete(ListBox4.ItemIndex);
      ListBox4.DeleteSelected;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton11Click(Sender: TObject);
begin
  ListBox3.OnDblClick(Sender);
end;

procedure TFComunreporte.SpeedButton12Click(Sender: TObject);
begin
  ListBox4.OnDblClick(Sender);
end;

procedure TFComunreporte.SpeedButton15Click(Sender: TObject);
var
  buffer: string;
begin
  if ((ListBox4.ItemIndex > 0) and (ListBox4.ItemIndex > -1)) then
    begin
      buffer := ListBox4.Items.Strings[ListBox4.ItemIndex - 1];
      ListBox4.Items.Strings[ListBox4.ItemIndex - 1] :=
        ListBox4.Items.Strings[ListBox4.ItemIndex];
      ListBox4.Items.Strings[ListBox4.ItemIndex] := buffer;

      buffer := lista_name_fieldD.Strings[ListBox4.ItemIndex - 1];
      lista_name_fieldD.Strings[ListBox4.ItemIndex - 1] :=
        lista_name_fieldD.Strings[ListBox4.ItemIndex];
      lista_name_fieldD.Strings[ListBox4.ItemIndex] := buffer;
      ListBox4.ItemIndex := ListBox4.ItemIndex - 1;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton16Click(Sender: TObject);
var
  buffer: string;
begin
  if ((ListBox4.ItemIndex < ListBox4.Count - 1) and (ListBox4.ItemIndex > -1))
    then
    begin
      buffer := ListBox4.Items.Strings[ListBox4.ItemIndex + 1];
      ListBox4.Items.Strings[ListBox4.ItemIndex + 1] :=
        ListBox4.Items.Strings[ListBox4.ItemIndex];
      ListBox4.Items.Strings[ListBox4.ItemIndex] := buffer;

      buffer := lista_name_fieldD.Strings[ListBox4.ItemIndex + 1];
      lista_name_fieldD.Strings[ListBox4.ItemIndex + 1] :=
        lista_name_fieldD.Strings[ListBox4.ItemIndex];
      lista_name_fieldD.Strings[ListBox4.ItemIndex] := buffer;
      ListBox4.ItemIndex := ListBox4.ItemIndex + 1;
      check_button;
    end;
end;

procedure TFComunreporte.IBOQuery2FilterRecord(DataSet: TDataSet; var Accept:
  boolean);
begin
  Accept := True;
  { if not filtrar then Accept := true
   else
    try
     Accept := DataSet.FieldByName(lista_name_fieldD[ComboBox3.ItemIndex]).AsString =
     IBOQuery1.FieldByName(lista_name_fieldB[ComboBox2.ItemIndex]).AsString;
    except
     ShowMessage('trono');
    end;}
end;

procedure TFComunreporte.ppDetailBand1BeforePrint(Sender: TObject);
begin
  if ban = 1 then
    begin
      IBOQuery2.Filtered := False;
      IBOQuery2.Filter := lista_name_fieldD[ComboBox3.ItemIndex] + ' = ' +
        IBOQuery1.FieldByName(lista_name_fieldB[ComboBox2.ItemIndex]).AsString;
      IBOQuery2.Filtered := True;
    end;
end;

procedure TFComunreporte.SpeedButton18Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TFComunreporte.SpeedButton17Click(Sender: TObject);
begin
  ComboBox3.Clear;
  ComboBox3.Items := lista_name_fieldD;
  PageControl1.ActivePageIndex := 2;
end;

procedure TFComunreporte.SpeedButton13Click(Sender: TObject);
begin
  if ListBox3.Items.Count > 0 then
    begin
      while ListBox3.Items.Count > 0 do
        begin
          ListBox4.AddItem(ListBox3.Items.Strings[0], nil);
          lista_name_fieldD.Add(lista_name_fieldC.Strings[0]);
          lista_name_fieldC.Delete(0);
          ListBox3.Items.Delete(0);
        end;
      check_button;
    end;
end;

procedure TFComunreporte.SpeedButton14Click(Sender: TObject);
begin
  if ListBox4.Items.Count > 0 then
    begin
      while ListBox4.Items.Count > 0 do
        begin
          ListBox3.AddItem(ListBox4.Items.Strings[0], nil);
          lista_name_fieldC.Add(lista_name_fieldD.Strings[0]);
          lista_name_fieldD.Delete(0);
          ListBox4.Items.Delete(0);
        end;
      check_button;
    end;
end;

function TFComunreporte.my_getband(tipo: string; Reporte: TppSubReport):
  TppBand;
var
  i: integer;
begin
  i := 0;
  Result := nil;
  while i < Reporte.ChildCount do
    begin
      if Reporte.Children[i] is TppChildReport then
        begin
          if tipo = 'HeaderBand' then
            begin
              Result := TppChildReport(Reporte.Children[i]).HeaderBand
            end;
          if tipo = 'DetailBand' then
            begin
              Result := TppChildReport(Reporte.Children[i]).DetailBand
            end;
          if tipo = 'TitleBand' then
            begin
              Result := TppChildReport(Reporte.Children[i]).TitleBand
            end;
          exit;
        end
      else
        begin
          i := i + 1
        end;
    end;
end;

procedure TFComunreporte.SpeedButton19Click(Sender: TObject);
begin
  Close;
end;

procedure TFComunreporte.SpeedButton20Click(Sender: TObject);
begin
  Close;
end;

end.
