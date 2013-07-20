object frmRepClientes: TfrmRepClientes
  Left = 348
  Top = 134
  Width = 979
  Height = 623
  AutoSize = True
  Caption = ']'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object label2: TRzLabel
    Left = 720
    Top = 131
    Width = 35
    Height = 13
    Caption = 'label2'
    Visible = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object label1: TRzLabel
    Left = 720
    Top = 171
    Width = 35
    Height = 13
    Caption = 'label1'
    Visible = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object label3: TRzLabel
    Left = 720
    Top = 203
    Width = 35
    Height = 13
    Caption = 'label1'
    Visible = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object rgResumen: TRzGroupBox
    Left = 1
    Top = 0
    Width = 962
    Height = 113
    Caption = ' Opciones '
    Color = 16119543
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Visible = False
    object RzLabel36: TRzLabel
      Left = 8
      Top = 14
      Width = 93
      Height = 14
      Caption = 'Tipos de Cuenta:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel37: TRzLabel
      Left = 160
      Top = 14
      Width = 39
      Height = 14
      Caption = 'Sector:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel38: TRzLabel
      Left = 280
      Top = 14
      Width = 26
      Height = 14
      Caption = 'Giro:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel39: TRzLabel
      Left = 554
      Top = 14
      Width = 103
      Height = 14
      Caption = 'Modelo de Alarma:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel40: TRzLabel
      Left = 712
      Top = 14
      Width = 44
      Height = 14
      Caption = 'Colonia:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel42: TRzLabel
      Left = 8
      Top = 96
      Width = 49
      Height = 14
      Caption = 'Clientes:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object LClientes: TRzLabel
      Left = 83
      Top = 96
      Width = 6
      Height = 14
      Alignment = taRightJustify
      Caption = '0'
      Color = 16776176
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel34: TRzLabel
      Left = 406
      Top = 15
      Width = 56
      Height = 14
      Caption = 'Categoria:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel1: TRzLabel
      Left = 10
      Top = 71
      Width = 78
      Height = 14
      Caption = 'Tipo Contrato:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object CBColonia: TRzComboBox
      Left = 712
      Top = 32
      Width = 217
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 4
    end
    object CBAlarma: TRzComboBox
      Left = 552
      Top = 32
      Width = 145
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 3
    end
    object CBgiro: TRzComboBox
      Left = 275
      Top = 32
      Width = 121
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 2
    end
    object CBSector: TRzComboBox
      Left = 157
      Top = 32
      Width = 113
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 1
    end
    object CBTcuenta: TRzComboBox
      Left = 8
      Top = 32
      Width = 145
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 0
    end
    object CboCategorias: TRzComboBox
      Left = 401
      Top = 33
      Width = 145
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 5
    end
    object CBTContratos: TRzComboBox
      Left = 98
      Top = 64
      Width = 182
      Height = 22
      Ctl3D = False
      FlatButtons = True
      FrameHotColor = clMedGray
      FrameHotTrack = True
      FrameHotStyle = fsButtonUp
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      TabOrder = 6
    end
  end
  object Gsector: TcxGrid
    Left = 1
    Top = 120
    Width = 273
    Height = 161
    TabOrder = 11
    Visible = False
    object GsectorDBTableView1: TcxGridDBTableView
      DataController.DataSource = DSGeneral
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#'
          Kind = skSum
          FieldName = 'total'
          Column = GsectorDBTableView1DBColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GsectorDBTableView1DBColumn1: TcxGridDBColumn
        SortOrder = soAscending
        Width = 121
        DataBinding.FieldName = 'sector'
      end
      object GsectorDBTableView1DBColumn2: TcxGridDBColumn
        MinWidth = 64
        Options.Editing = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        DataBinding.FieldName = 'total'
      end
    end
    object GsectorLevel1: TcxGridLevel
      Caption = 'Sector'
      GridView = GsectorDBTableView1
    end
  end
  object GColonia: TcxGrid
    Left = 281
    Top = 120
    Width = 345
    Height = 161
    TabOrder = 13
    Visible = False
    object GColoniaDBTableView1: TcxGridDBTableView
      DataController.DataSource = DMREPORTES.DSsqlgeneral3
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#'
          Kind = skSum
          FieldName = 'total'
          Column = GColoniaDBTableView1DBColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GColoniaDBTableView1DBColumn1: TcxGridDBColumn
        SortOrder = soAscending
        Width = 232
        DataBinding.FieldName = 'colonias'
      end
      object GColoniaDBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'total'
      end
    end
    object GColoniaLevel1: TcxGridLevel
      GridView = GColoniaDBTableView1
    end
  end
  object btncerrar: TRzBitBtn
    Left = 465
    Top = 96
    Width = 160
    Height = 49
    Caption = '&Cerrar'
    HotTrack = True
    TabOrder = 1
    OnClick = btncerrarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730B0000730B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
      E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
      57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
      578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
      57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
      57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
      57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
      57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
      57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
      57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
      57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
      57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
      57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
      57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
      57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
      57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object rgPeriodo: TRzGroupBox
    Left = 137
    Top = 144
    Width = 185
    Height = 81
    Caption = 'Periodo'
    Color = clWhite
    TabOrder = 2
    object RzLabel2: TRzLabel
      Left = 8
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Desde:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Hasta:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object tpdesde: TRzDateTimePicker
      Left = 56
      Top = 16
      Width = 121
      Height = 21
      Date = 39354.454680081020000000
      Time = 39354.454680081020000000
      Color = clWhite
      TabOrder = 0
      FlatButtons = True
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameVisible = True
    end
    object tphasta: TRzDateTimePicker
      Left = 56
      Top = 52
      Width = 121
      Height = 21
      Date = 39354.454680081020000000
      Time = 39354.454680081020000000
      Color = clWhite
      TabOrder = 1
      OnExit = tphastaExit
      FlatButtons = True
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameVisible = True
    end
  end
  object rgClientes: TRzGroupBox
    Left = 137
    Top = 8
    Width = 280
    Height = 81
    Caption = 'Clientes'
    Color = clWhite
    TabOrder = 3
    object RzLabel4: TRzLabel
      Left = 8
      Top = 24
      Width = 41
      Height = 13
      Caption = 'Desde:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 8
      Top = 56
      Width = 38
      Height = 13
      Caption = 'Hasta:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object cbdesde: TRzComboBox
      Left = 72
      Top = 16
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = False
      FlatButtonColor = clWhite
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
      OnNotInList = cbdesdeNotInList
    end
    object cbhasta: TRzComboBox
      Left = 72
      Top = 48
      Width = 193
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = False
      FlatButtonColor = clWhite
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      OnNotInList = cbhastaNotInList
    end
    object eddesde: TRzButtonEdit
      Left = 64
      Top = 16
      Width = 89
      Height = 21
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 0
      OnKeyPress = eddesdeKeyPress
      ButtonKind = bkFind
      FlatButtons = True
      OnButtonClick = eddesdeButtonClick
    end
    object edhasta: TRzButtonEdit
      Left = 64
      Top = 48
      Width = 89
      Height = 21
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 1
      OnKeyPress = edhastaKeyPress
      ButtonKind = bkFind
      FlatButtons = True
      OnButtonClick = edhastaButtonClick
    end
  end
  object rgRango: TRzRadioGroup
    Left = 329
    Top = 144
    Width = 137
    Height = 25
    Caption = 'Rango'
    Color = clWhite
    ItemHotTrack = True
    TabOrder = 4
    Visible = False
  end
  object cbTipoImpresion: TRzComboBox
    Left = 465
    Top = 8
    Width = 160
    Height = 24
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FlatButtonColor = clWhite
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    Text = 'Vista Previa'
    OnSelect = cbTipoImpresionSelect
    Items.Strings = (
      'Vista Previa'
      'Impresora'
      'Archivo'
      'Email')
    ItemIndex = 0
    Values.Strings = (
      'IMP'
      'IMPD'
      'ARC'
      'PDF')
  end
  object rgcadena: TRzGroupBox
    Left = 137
    Top = 96
    Width = 281
    Height = 41
    Caption = 'Descripcion'
    Color = clWhite
    TabOrder = 6
    Visible = False
    object edcadena: TRzEdit
      Left = 8
      Top = 16
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 0
      OnKeyPress = edcadenaKeyPress
    end
  end
  object rgrango2: TRzRadioGroup
    Left = 329
    Top = 184
    Width = 137
    Height = 25
    Caption = 'Rango'
    Color = clWhite
    ItemHotTrack = True
    TabOrder = 7
    Visible = False
  end
  object GCategoria: TcxGrid
    Left = 0
    Top = 284
    Width = 305
    Height = 161
    TabOrder = 9
    Visible = False
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = DMREPORTES.DS2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#'
          Kind = skSum
          FieldName = 'total'
          Column = cxTotCat
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxCategoria: TcxGridDBColumn
        SortOrder = soAscending
        Width = 237
        DataBinding.FieldName = 'Categoria'
      end
      object cxTotCat: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object GAlarma: TcxGrid
    Left = 632
    Top = 284
    Width = 313
    Height = 161
    TabOrder = 10
    Visible = False
    object GAlarmaDBTableView1: TcxGridDBTableView
      DataController.DataSource = DMREPORTES.DSsqlgeneral2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#'
          Kind = skSum
          FieldName = 'total'
          Column = GAlarmaDBTableView1DBColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GAlarmaDBTableView1DBColumn1: TcxGridDBColumn
        Caption = 'Alarmas'
        SortOrder = soDescending
        Width = 206
        DataBinding.FieldName = 'alarmas'
      end
      object GAlarmaDBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'total'
      end
    end
    object GAlarmaLevel1: TcxGridLevel
      GridView = GAlarmaDBTableView1
    end
  end
  object GGiro: TcxGrid
    Left = 312
    Top = 283
    Width = 313
    Height = 162
    TabOrder = 12
    Visible = False
    object GGiroDBTableView1: TcxGridDBTableView
      DataController.DataSource = DMREPORTES.DSsqlgeneral4
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#'
          Kind = skSum
          FieldName = 'total'
          Column = GGiroDBTableView1DBColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object GGiroDBTableView1DBColumn1: TcxGridDBColumn
        Caption = 'Giro'
        Width = 245
        DataBinding.FieldName = 'giro'
      end
      object GGiroDBTableView1DBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'total'
      end
    end
    object GGiroLevel1: TcxGridLevel
      GridView = GGiroDBTableView1
    end
  end
  object btnImprimir: TRzBitBtn
    Left = 465
    Top = 40
    Width = 160
    Height = 49
    Caption = '&Imprimir'
    HotTrack = True
    TabOrder = 0
    OnClick = btnImprimirClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
      09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
      89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
      5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
      8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
      181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
      D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
      8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
      5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
      D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
      E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
      D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
      E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
      D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
      5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 448
    Width = 305
    Height = 137
    TabOrder = 14
    Visible = False
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.DataSource = DMREPORTES.DS5
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#'
          Kind = skSum
          FieldName = 'total'
          Column = cxGridDBColumn2
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGridDBColumn1: TcxGridDBColumn
        SortOrder = soDescending
        Width = 237
        DataBinding.FieldName = 'Contrato'
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'total'
      end
    end
    object cxGridLevel2: TcxGridLevel
      GridView = cxGridDBTableView2
    end
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 320
    Top = 8
  end
  object DSGeneral: TDataSource
    DataSet = sqlgeneral
    Left = 360
    Top = 64
  end
end
