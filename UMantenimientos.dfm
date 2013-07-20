object frmmantenimientos: Tfrmmantenimientos
  Left = 200
  Top = 112
  Width = 854
  Height = 597
  Caption = 'Mantenimientos'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblclave: TRzLabel
    Left = 2
    Top = 8
    Width = 134
    Height = 13
    Caption = 'Num de Mantenimiento:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel1: TRzLabel
    Left = 226
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Nombre:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel2: TRzLabel
    Left = 498
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Tipo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel3: TRzLabel
    Left = 642
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Fecha(s):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblestatus: TRzLabel
    Left = 3
    Top = 546
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object rgTipoAsig: TRzRadioGroup
    Left = 0
    Top = 25
    Width = 281
    Height = 41
    Caption = 'Tipo de Asignacion'
    Color = clWhite
    Columns = 3
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHotTrack = True
    ItemFont.Charset = DEFAULT_CHARSET
    ItemFont.Color = clWindowText
    ItemFont.Height = -13
    ItemFont.Name = 'MS Sans Serif'
    ItemFont.Style = []
    ItemHeight = 18
    ItemIndex = 1
    Items.Strings = (
      'Cuenta'
      'Colonia'
      'Rango de Cuentas')
    ParentFont = False
    TabOrder = 0
    OnChanging = rgTipoAsigChanging
  end
  object edCveMant: TRzButtonEdit
    Left = 138
    Top = 3
    Width = 86
    Height = 22
    Hint = 'Buscar en el catalogo el mantenimiento'
    DisabledColor = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameHotColor = clFuchsia
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = edCveMantKeyPress
    ButtonKind = bkFind
    ButtonShortCut = 119
    FlatButtons = True
    OnButtonClick = edCveMantButtonClick
  end
  object edNomMant: TRzEdit
    Left = 274
    Top = 3
    Width = 215
    Height = 21
    Hint = 'Nombre del Mantenimiento'
    FrameController = DMAccesos.frmctr
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
  end
  object cboTipoMant: TRzComboBox
    Left = 528
    Top = 3
    Width = 105
    Height = 21
    Hint = 'Tipo de Mantenimiento'
    Ctl3D = False
    FrameController = DMAccesos.frmctr
    ItemHeight = 13
    ParentCtl3D = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Items.Strings = (
      'Anual'
      'Semestral'
      'Trimestral')
  end
  object lbfechas: TRzListBox
    Left = 696
    Top = 4
    Width = 113
    Height = 56
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    FrameVisible = True
    IntegralHeight = True
    ItemHeight = 13
    ParentFont = False
    Sorted = True
    TabOrder = 4
  end
  object gbcliente: TGroupBox
    Left = 2
    Top = 67
    Width = 599
    Height = 37
    Caption = 'Busqueda por cuenta'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
    object lblnombre: TRzLabel
      Left = 106
      Top = -26
      Width = 86
      Height = 11
      Caption = 'Nombre Completo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel12: TRzLabel
      Left = 3
      Top = 15
      Width = 35
      Height = 11
      Caption = 'Cuenta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 406
      Top = 17
      Width = 39
      Height = 11
      Caption = 'Colonia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 115
      Top = 18
      Width = 39
      Height = 11
      Caption = 'Nombre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edcuenta: TRzButtonEdit
      Left = 40
      Top = 13
      Width = 74
      Height = 20
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
      OnChange = edcuentaChange
      OnKeyPress = edcuentaKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 16450
      FlatButtons = True
      OnButtonClick = edcuentaButtonClick
    end
    object ednomcte: TRzEdit
      Left = 154
      Top = 12
      Width = 250
      Height = 22
      FrameController = DMAccesos.frmctr
      ReadOnly = True
      TabOrder = 1
    end
    object edcolonia: TRzEdit
      Left = 448
      Top = 12
      Width = 143
      Height = 22
      FrameController = DMAccesos.frmctr
      ReadOnly = True
      TabOrder = 2
    end
  end
  object gbcolonias: TGroupBox
    Left = 1
    Top = 104
    Width = 312
    Height = 71
    Caption = 'Asignacion por colonia'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 6
    object cxLabel18: TcxLabel
      Left = 9
      Top = 43
      Width = 56
      Height = 20
      Caption = 'Nombre:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object cxLabel19: TcxLabel
      Left = 9
      Top = 19
      Width = 55
      Height = 20
      Caption = 'Numero:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object cbonom_colonia: TRzComboBox
      Left = 69
      Top = 45
      Width = 236
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      KeepSearchCase = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnExit = cbonom_coloniaSelect
      OnNotInList = cbonom_coloniaNotInList
      OnSelect = cbonom_coloniaSelect
    end
    object edcvecol: TRzButtonEdit
      Left = 66
      Top = 16
      Width = 86
      Height = 22
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edcvecolButtonClick
    end
  end
  object gbrcuentas: TGroupBox
    Left = 314
    Top = 104
    Width = 199
    Height = 71
    Caption = 'Asignacion por rango de cuentas'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 7
    object cxLabel1: TcxLabel
      Left = 25
      Top = 43
      Width = 43
      Height = 20
      Caption = 'Hasta:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object cxLabel2: TcxLabel
      Left = 25
      Top = 19
      Width = 48
      Height = 20
      Caption = 'Desde:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
    end
    object eddesde: TRzButtonEdit
      Left = 76
      Top = 18
      Width = 69
      Height = 20
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
      OnChange = eddesdeChange
      OnKeyPress = eddesdeKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = eddesdeButtonClick
    end
    object edhasta: TRzButtonEdit
      Left = 76
      Top = 42
      Width = 69
      Height = 20
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
      OnChange = eddesdeChange
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = eddesdeButtonClick
    end
  end
  object rejilla: TcxGrid
    Left = 3
    Top = 223
    Width = 841
    Height = 322
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    RootLevelOptions.DetailFrameColor = clBackground
    object rejillaDBTableView1: TcxGridDBTableView
      OnKeyUp = rejillaDBTableView1KeyUp
      DataController.DataSource = dsrejilla
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soNullIgnore]
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Enabled = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      Filtering.CustomizeDialog = False
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.CellHints = True
      OptionsBehavior.NavigatorHints = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      object cxidcliente: TcxGridDBColumn
        Caption = 'Cliente'
        Options.Editing = False
        Width = 110
        DataBinding.FieldName = 'idcliente'
      end
      object cxcliente: TcxGridDBColumn
        Caption = 'Nombre'
        PropertiesClassName = 'TcxLabelProperties'
        Options.Editing = False
        Width = 381
        DataBinding.FieldName = 'nombre'
      end
      object cxRealizada: TcxGridDBColumn
        Caption = 'Realizada'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = 'No'
            Value = '0'
          end
          item
            Description = 'Si'
            Value = '1'
          end>
        Properties.ReadOnly = False
        Width = 75
        DataBinding.FieldName = 'realizada'
      end
      object cxFechaMant: TcxGridDBColumn
        Caption = 'Fecha'
        Options.Editing = False
        Width = 85
        DataBinding.FieldName = 'fecha'
      end
      object cxFechaRealizacion: TcxGridDBColumn
        PropertiesClassName = 'TcxDateEditProperties'
        Width = 125
        DataBinding.FieldName = 'FechaRealizada'
      end
      object cxtecnico: TcxGridDBColumn
        Caption = 'Tecnico'
        Options.Editing = False
        Width = 79
        DataBinding.FieldName = 'codigo'
      end
      object cxcolonia: TcxGridDBColumn
        Caption = 'Colonia'
        Options.Editing = False
        Width = 67
        DataBinding.FieldName = 'colonia'
      end
    end
    object rejillaLevel1: TcxGridLevel
      Caption = 'Datos de los Mantenimientos'
      GridView = rejillaDBTableView1
    end
  end
  object btnaplicar: TRzBitBtn
    Left = 682
    Top = 192
    Height = 27
    Caption = 'Aplicar'
    Enabled = False
    HotTrack = True
    TabOrder = 9
    OnClick = btnaplicarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object gbTecnico: TGroupBox
    Left = 1
    Top = 175
    Width = 664
    Height = 46
    Caption = 'Tecnico a Asignar'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 10
    object cxLabel4: TcxLabel
      Left = 9
      Top = 19
      Width = 48
      Height = 17
      Caption = 'Cod Tec:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
    end
    object edCveTecnico: TRzButtonEdit
      Left = 61
      Top = 18
      Width = 85
      Height = 20
      Hint = 'Numero del tecnico'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
      OnChange = edCveTecnicoChange
      OnKeyPress = edCveTecnicoKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edCveTecnicoButtonClick
    end
    object cxLabel3: TcxLabel
      Left = 161
      Top = 19
      Width = 56
      Height = 20
      Caption = 'Nombre:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 2
    end
    object cboNomTecnico: TRzComboBox
      Left = 221
      Top = 21
      Width = 276
      Height = 21
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      KeepSearchCase = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnSelect = cboNomTecnicoSelect
    end
  end
  object btnsalir: TRzBitBtn
    Left = 757
    Top = 192
    Height = 27
    Caption = 'Salir'
    HotTrack = True
    TabOrder = 11
    OnClick = btnsalirClick
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
  object rgoxxo: TRzRadioGroup
    Left = 688
    Top = 104
    Width = 145
    Height = 73
    Caption = 'Incluir'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHotTrack = True
    ItemIndex = 0
    Items.Strings = (
      'Sin Oxxos'
      'Con Oxxos')
    ParentFont = False
    TabOrder = 12
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 696
    Top = 64
  end
  object dsrejilla: TDataSource
    DataSet = sqlrejilla
    Left = 760
    Top = 62
  end
  object sqlrejilla: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT DetMantenimientos.idmantenimiento,DetMantenimientos.idcli' +
        'ente,if(clientes.rsocial='#39#39' or clientes.rsocial is null,concat(i' +
        'fnull(clientes.nombre,'#39#39'),'#39' '#39',ifnull(clientes.apaterno,'#39#39'),'#39' '#39',i' +
        'fnull(clientes.amaterno,'#39#39')),clientes.rsocial) as nombre,colonia' +
        's.nombre as colonia,DetMantenimientos.fecha,if(DetMantenimientos' +
        '.realizada=1,'#39'Si'#39','#39'No'#39') as realizada,if(DetMantenimientos.FechaR' +
        'ealizada is null,'#39'No Realizada'#39',DetMantenimientos.FechaRealizada' +
        ') as FechaRealizada,usuarios.codigo'
      
        ' FROM DetMantenimientos INNER JOIN usuarios ON (DetMantenimiento' +
        's.idtecnico = usuarios.idusuario) INNER JOIN clientes ON (DetMan' +
        'tenimientos.idcliente = clientes.idcliente) '
      'inner join colonias on colonias.idcol = clientes.idcol'
      
        'where idmantenimiento=1 order by  DetMantenimientos.idcliente,De' +
        'tMantenimientos.fecha')
    AfterOpen = sqlrejillaAfterOpen
    AfterPost = sqlrejillaAfterPost
    Options.StrictUpdate = False
    FetchAll = True
    Left = 728
    Top = 64
  end
end
