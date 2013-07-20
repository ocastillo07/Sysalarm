inherited ProtTresNiveles: TProtTresNiveles
  Left = 393
  Top = 267
  Caption = 'ProtTresNiveles'
  ClientHeight = 298
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Height = 244
    object Panel3: TPanel
      Left = 1
      Top = 49
      Width = 458
      Height = 192
      Align = alTop
      TabOrder = 0
      object LbPNF: TLabel
        Left = 143
        Top = 45
        Width = 25
        Height = 13
        Caption = 'Filtro:'
      end
      object LbSNF: TLabel
        Left = 145
        Top = 94
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Filtro:'
      end
      object SBPNF: TSpeedButton
        Left = 392
        Top = 40
        Width = 18
        Height = 15
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SBPNFClick
      end
      object SBSNF: TSpeedButton
        Left = 391
        Top = 91
        Width = 19
        Height = 20
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SBPNFClick
      end
      object LbPN: TLabel
        Left = 44
        Top = 22
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Primer nivel:'
      end
      object LbSN: TLabel
        Left = 30
        Top = 70
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Segundo nivel:'
      end
      object LbTN: TLabel
        Left = 42
        Top = 118
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tercer nivel:'
      end
      object LbTNF: TLabel
        Left = 143
        Top = 141
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Filtro:'
      end
      object SBTNF: TSpeedButton
        Left = 391
        Top = 139
        Width = 19
        Height = 20
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SBPNFClick
      end
      object SBSignoPN: TSpeedButton
        Left = 174
        Top = 41
        Width = 17
        Height = 21
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBSignoPNClick
      end
      object SBSignoSN: TSpeedButton
        Left = 174
        Top = 90
        Width = 17
        Height = 21
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBSignoPNClick
      end
      object SBSignoTN: TSpeedButton
        Left = 173
        Top = 138
        Width = 17
        Height = 21
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBSignoPNClick
      end
      object CBPN: TComboBox
        Left = 105
        Top = 18
        Width = 305
        Height = 21
        Style = csDropDownList
        DropDownCount = 17
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBPNChange
      end
      object CBSN: TComboBox
        Left = 105
        Top = 66
        Width = 305
        Height = 21
        Style = csDropDownList
        DropDownCount = 17
        ItemHeight = 13
        TabOrder = 4
        OnChange = CBSNChange
      end
      object CxSN: TCheckBox
        Left = 8
        Top = 68
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CxSNClick
      end
      object CBTN: TComboBox
        Left = 105
        Top = 114
        Width = 305
        Height = 21
        Style = csDropDownList
        DropDownCount = 17
        ItemHeight = 13
        TabOrder = 8
        OnChange = CBTNChange
      end
      object CxTN: TCheckBox
        Left = 8
        Top = 116
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = CxSNClick
      end
      object EdSNF: TEdit
        Left = 192
        Top = 90
        Width = 199
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnExit = EdPNFExit
      end
      object EdPNF: TEdit
        Left = 192
        Top = 42
        Width = 199
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnExit = EdPNFExit
      end
      object CBFijoPN: TComboBox
        Left = 192
        Top = 50
        Width = 218
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object CBFijoSN: TComboBox
        Left = 192
        Top = 90
        Width = 218
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 5
        Visible = False
      end
      object EdTNF: TEdit
        Left = 192
        Top = 138
        Width = 199
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnExit = EdPNFExit
      end
      object CBFijoTN: TComboBox
        Left = 192
        Top = 138
        Width = 218
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 10
        Visible = False
      end
      object CxJusti: TCheckBox
        Left = 8
        Top = 168
        Width = 121
        Height = 17
        Caption = 'Mostrar Justificacion'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 458
      Height = 48
      Align = alTop
      Caption = ' Entre las fechas '
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 32
        Top = 21
        Width = 34
        Height = 13
        Caption = 'Desde:'
      end
      object Label3: TLabel
        Left = 216
        Top = 21
        Width = 31
        Height = 13
        Caption = 'Hasta:'
      end
      object Fecha1: TDateTimePicker
        Left = 72
        Top = 16
        Width = 105
        Height = 21
        Date = 38211.736064942130000000
        Time = 38211.736064942130000000
        TabOrder = 0
      end
      object Fecha2: TDateTimePicker
        Left = 248
        Top = 16
        Width = 121
        Height = 21
        Date = 38211.736064942130000000
        Time = 38211.736064942130000000
        TabOrder = 1
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DSAux
    OpenDataSource = False
    AutoCreateFields = False
    UserName = 'DBPipeline1'
    Left = 376
    Top = 25
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 
      'C:\Documents and Settings\Administrator\My Documents\Radio\Repor' +
      'tes\Continuidad nueva.rtm'
    AllowPrintToFile = True
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 408
    Top = 25
    Version = '7.03'
    mmColumnWidth = 266701
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Reporte de ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 24
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 10089
        mmLeft = 106576
        mmTop = 0
        mmWidth = 53552
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 1588
        mmTop = 13758
        mmWidth = 262732
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 8421440
        Shape = stRoundRect
        mmHeight = 5556
        mmLeft = 0
        mmTop = 19579
        mmWidth = 265378
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4318
        mmLeft = 0
        mmTop = 0
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Titulo configuraci'#243'n:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 240507
        mmTop = 4498
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 203200
        mmTop = 7938
        mmWidth = 59796
        BandType = 0
      end
      object Logo: TppImage
        UserName = 'Logo'
        MaintainAspectRatio = False
        mmHeight = 13758
        mmLeft = 1588
        mmTop = 265
        mmWidth = 43656
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      ColumnTraversal = ctLeftToRight
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Fecha de impresi'#243'n:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 221721
        mmTop = 1058
        mmWidth = 24977
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 248709
        mmTop = 1058
        mmWidth = 13547
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clTeal
        Shape = stRoundRect
        mmHeight = 265
        mmLeft = 3440
        mmTop = 529
        mmWidth = 257176
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4057
        mmLeft = 238919
        mmTop = 5202
        mmWidth = 22437
        BandType = 8
      end
      object PCName1: TppLabel
        UserName = 'Label101'
        Caption = 'Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 7144
        mmTop = 2117
        mmWidth = 10880
        BandType = 8
      end
    end
    object ppGroup6: TppGroup
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4657
          mmLeft = 234686
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Total de Registros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4657
          mmLeft = 195527
          mmTop = 0
          mmWidth = 35348
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GNR_NOMBRE'
      DataPipeline = ppDBPipeline1
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          OnGetText = ppDBText1GetText
          DataField = 'VRAD_SIGLAS'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 5027
          mmLeft = 66411
          mmTop = 0
          mmWidth = 58473
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4953
          mmLeft = 4763
          mmTop = 0
          mmWidth = 41804
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'VRAD_ID'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 5027
          mmLeft = 47625
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Registros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4995
          mmLeft = 197115
          mmTop = 0
          mmWidth = 19558
          BandType = 3
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          LookAhead = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4995
          mmLeft = 221721
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CAT_NOMBRE'
      DataPipeline = ppDBPipeline1
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          OnGetText = ppDBText1GetText
          DataField = 'VPRO_NOMBRE'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4191
          mmLeft = 85990
          mmTop = 0
          mmWidth = 44715
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 6879
          mmTop = 0
          mmWidth = 50271
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'VPRO_ID'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4191
          mmLeft = 61913
          mmTop = 0
          mmWidth = 21696
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Registros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 206375
          mmTop = 0
          mmWidth = 16214
          BandType = 3
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          DBCalcType = dcCount
          LookAhead = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4191
          mmLeft = 227278
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'ALB_NOMBRE'
      DataPipeline = ppDBPipeline1
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          OnGetText = ppDBText1GetText
          DataField = 'VSER_NOMBRE'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3387
          mmLeft = 100542
          mmTop = 0
          mmWidth = 37306
          BandType = 3
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 10319
          mmTop = 0
          mmWidth = 56092
          BandType = 3
          GroupNo = 2
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'VSER_ID'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3387
          mmLeft = 71438
          mmTop = 0
          mmWidth = 23813
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Registros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 212461
          mmTop = 0
          mmWidth = 13039
          BandType = 3
          GroupNo = 3
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          Transparent = True
          DBCalcType = dcCount
          LookAhead = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3387
          mmLeft = 230982
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'ppLabel4'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      DataPipeline = ppDBPipeline1
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object DSAux: TDataSource
    DataSet = T_Aux
    Left = 296
    Top = 25
  end
  object T_Aux: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 208
    Top = 24
  end
end
