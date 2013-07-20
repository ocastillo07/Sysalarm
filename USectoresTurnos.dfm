object frmSectoresTurnos: TfrmSectoresTurnos
  Left = 308
  Top = 172
  Width = 610
  Height = 425
  Caption = 'Sectores y Turnos por Usuario'
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
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object lblclave: TRzLabel
    Left = 8
    Top = 16
    Width = 37
    Height = 13
    Caption = 'Clave:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblnombre: TRzLabel
    Left = 8
    Top = 39
    Width = 62
    Height = 13
    Caption = 'Nombre(s):'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblapaterno: TRzLabel
    Left = 301
    Top = 39
    Width = 98
    Height = 13
    Caption = 'Apellido Paterno:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblamaterno: TRzLabel
    Left = 445
    Top = 39
    Width = 100
    Height = 13
    Caption = 'Apellido Materno:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel4: TRzLabel
    Left = 500
    Top = 87
    Width = 52
    Height = 13
    Caption = 'Iniciales:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel11: TRzLabel
    Left = 500
    Top = 143
    Width = 55
    Height = 13
    Caption = 'Codigo 2:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel6: TRzLabel
    Left = 8
    Top = 140
    Width = 87
    Height = 13
    Caption = 'Sector Default:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblarea: TRzLabel
    Left = 8
    Top = 83
    Width = 31
    Height = 13
    Caption = 'Area:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblpuesto: TRzLabel
    Left = 279
    Top = 83
    Width = 44
    Height = 13
    Caption = 'Puesto:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel9: TRzLabel
    Left = 173
    Top = 140
    Width = 38
    Height = 13
    Caption = 'Turno:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel7: TRzLabel
    Left = 8
    Top = 191
    Width = 120
    Height = 13
    Caption = 'Sectores Disponibles'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel8: TRzLabel
    Left = 368
    Top = 191
    Width = 113
    Height = 13
    Caption = 'Sectores Asignados'
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
    Left = 317
    Top = 140
    Width = 47
    Height = 13
    Caption = 'Estatus:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lbufh: TRzLabel
    Left = 9
    Top = 360
    Width = 13
    Height = 13
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMoneyGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object edclave: TRzButtonEdit
    Left = 47
    Top = 7
    Width = 86
    Height = 22
    Hint = 'Buscar en el catalogo'
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
    TabOrder = 0
    OnChange = edclaveChange
    OnKeyPress = edclaveKeyPress
    OnKeyUp = FormKeyUp
    ButtonKind = bkFind
    ButtonShortCut = 119
    FlatButtons = True
    OnButtonClick = edclaveButtonClick
  end
  object dbnavegador: TRzDBNavigator
    Left = 265
    Top = 2
    Width = 228
    Height = 24
    DataSource = DSusuarios
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'Primer Usuario'
      'Usuario Anterior'
      'Usuario Siguiente'
      'Ultimo Usuario'
      'Refrescar Datos')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = dbnavegadorClick
    Color = clWhite
  end
  object ednombre: TRzDBEdit
    Left = 8
    Top = 54
    Width = 278
    Height = 21
    Hint = 'Nombre o nombres del Usuario'
    DataSource = DSusuarios
    DataField = 'nombre'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 2
  end
  object edapaterno: TRzDBEdit
    Left = 301
    Top = 54
    Width = 130
    Height = 21
    Hint = 'Apellido Paterno'
    DataSource = DSusuarios
    DataField = 'apaterno'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 3
  end
  object edamaterno: TRzDBEdit
    Left = 445
    Top = 54
    Width = 130
    Height = 21
    Hint = 'Apellido Materno'
    DataSource = DSusuarios
    DataField = 'amaterno'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 4
  end
  object edcodigo: TRzDBEdit
    Left = 500
    Top = 102
    Width = 48
    Height = 21
    Hint = 'Codigo corto para uso en sistema'
    DataSource = DSusuarios
    DataField = 'codigo'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 5
  end
  object edcodigo2: TRzDBEdit
    Left = 500
    Top = 158
    Width = 56
    Height = 21
    Hint = 'Codigo 2 para servicios '
    DataSource = DSusuarios
    DataField = 'codigo2'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 6
  end
  object cbsector: TRzComboBox
    Left = 8
    Top = 158
    Width = 125
    Height = 21
    Hint = 'Sector por default en el sistema'
    Ctl3D = False
    Enabled = False
    FrameController = DMAccesos.frmctr
    ItemHeight = 13
    ParentCtl3D = False
    TabOnEnter = True
    TabOrder = 7
  end
  object cbarea: TRzComboBox
    Left = 8
    Top = 103
    Width = 205
    Height = 21
    Hint = 'Area a la que pertenece'
    CharCase = ecUpperCase
    Ctl3D = False
    DisabledColor = clWhite
    Enabled = False
    FlatButtons = True
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOnEnter = True
    TabOrder = 8
  end
  object cbpuesto: TRzComboBox
    Left = 280
    Top = 103
    Width = 184
    Height = 21
    Hint = 'Puesto que desempe'#241'a'
    CharCase = ecUpperCase
    Ctl3D = False
    DisabledColor = clWhite
    Enabled = False
    FlatButtons = True
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOnEnter = True
    TabOrder = 9
  end
  object cbturno: TRzComboBox
    Left = 173
    Top = 158
    Width = 117
    Height = 21
    Hint = 'Area a la que pertenece'
    CharCase = ecUpperCase
    Ctl3D = False
    DisabledColor = clWhite
    Enabled = False
    FlatButtons = True
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    Sorted = True
    TabOnEnter = True
    TabOrder = 10
  end
  object btnAsig: TRzButton
    Left = 291
    Top = 248
    Width = 46
    Caption = '>'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 11
    OnClick = btnAsigClick
  end
  object btnAsigAll: TRzButton
    Left = 291
    Top = 280
    Width = 46
    Caption = '>>'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 12
    OnClick = btnAsigAllClick
  end
  object GAsig: TcxGrid
    Left = 368
    Top = 208
    Width = 225
    Height = 144
    Enabled = False
    TabOrder = 13
    object VAsig: TcxGridDBTableView
      OnKeyUp = VAsigKeyUp
      DataController.DataSource = dsAsig
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Enabled = False
      NavigatorButtons.First.Visible = False
      NavigatorButtons.PriorPage.Enabled = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.NextPage.Enabled = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Last.Enabled = False
      NavigatorButtons.Last.Visible = False
      NavigatorButtons.Insert.Enabled = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Enabled = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Enabled = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Enabled = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.SaveBookmark.Enabled = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Enabled = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Enabled = False
      NavigatorButtons.Filter.Visible = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGridDBColumn1: TcxGridDBColumn
        Caption = 'Sector'
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        Width = 54
        DataBinding.FieldName = 'idsector'
      end
      object cxGridDBColumn2: TcxGridDBColumn
        Caption = 'Nombre'
        Options.Editing = False
        Options.Filtering = False
        Options.Moving = False
        SortOrder = soAscending
        Width = 115
        DataBinding.FieldName = 'nombre'
      end
    end
    object LAsig: TcxGridLevel
      GridView = VAsig
    end
  end
  object GDisp: TcxGrid
    Left = 8
    Top = 208
    Width = 257
    Height = 144
    Enabled = False
    TabOrder = 14
    object VDisp: TcxGridDBTableView
      OnDblClick = btnAsigClick
      DataController.DataSource = dsDisp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object idSector: TcxGridDBColumn
        Caption = 'Sector'
        Width = 54
        DataBinding.FieldName = 'idsector'
      end
      object Nomsector: TcxGridDBColumn
        Caption = 'Nombre'
        SortOrder = soAscending
        Width = 115
        DataBinding.FieldName = 'nombre'
      end
    end
    object LDisp: TcxGridLevel
      GridView = VDisp
    end
  end
  object btnmodificar: TRzBitBtn
    Left = 368
    Top = 360
    Width = 114
    Height = 27
    Hint = 'Editar los datos del Usuario Actual'
    Caption = '&Editar'
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = btnmodificarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000003300
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
      0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
      120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
      12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
      1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
      181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
      E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
      E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
      E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
      E8E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8
      E8E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8
      E8E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8
      E8E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    DisabledIndex = 0
    ImageIndex = 2
    Images = DMAccesos.ilopciones
    NumGlyphs = 2
  end
  object btncancelar: TRzBitBtn
    Left = 488
    Top = 360
    Width = 106
    Height = 27
    Hint = 'Cerrar esta Ventana'
    Cancel = True
    Caption = '&Cerrar'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = btncancelarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFF9FFFF7FFFFFFFFFF8FFF991FFFFFFF
      FFFFFF787FFFFFFFFFFFFF9B91FFFFFFF9FFFF7F87FFFFFFF8FFFFF999FFFFFF
      9FFFFFF7F7FFFFFF8FFFFFFF991FFFF91FFFFFFF787FFFF87FFFFFFFF991FF91
      FFFFFFFFF787FF87FFFFFFFFFF99191FFFFFFFFFFF78787FFFFFFFFFFFF991FF
      FFFFFFFFFFF787FFFFFFFFFFFF99191FFFFFFFFFFF78777FFFFFFFFFF991FF91
      FFFFFFFFF787FF77FFFFFFF9991FFFF91FFFFFF7887FFFF77FFFFF9B91FFFFFF
      91FFFF7F87FFFFFF77FFFF797FFFFFFFFF9FFF878FFFFFFFFF7FFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ImageIndex = 5
    NumGlyphs = 2
  end
  object RzDBCheckBox1: TRzDBCheckBox
    Left = 320
    Top = 160
    Width = 115
    Height = 17
    DataField = 'estatus'
    DataSource = DSusuarios
    ValueChecked = '1'
    ValueUnchecked = '0'
    Caption = ' ACTIVO'
    DisabledColor = clWhite
    Enabled = False
    HotTrack = True
    TabOrder = 17
  end
  object tblusuarios: TMyTable
    TableName = 'usuarios'
    OrderFields = 'idusuario'
    Connection = DMAccesos.conexion
    BeforePost = tblusuariosBeforePost
    Options.FullRefresh = True
    Options.QueryRecCount = True
    Options.QuoteNames = True
    FetchAll = True
    Left = 152
    object tblusuariosidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object tblusuariosnombre: TStringField
      FieldName = 'nombre'
      Size = 30
    end
    object tblusuarioscodigo: TStringField
      FieldName = 'codigo'
      FixedChar = True
      Size = 3
    end
    object tblusuariosidarea: TIntegerField
      FieldName = 'idarea'
    end
    object tblusuariosidpuesto: TIntegerField
      FieldName = 'idpuesto'
    end
    object tblusuariosapaterno: TStringField
      FieldName = 'apaterno'
    end
    object tblusuariosamaterno: TStringField
      FieldName = 'amaterno'
    end
    object tblusuariosestatus: TBooleanField
      FieldName = 'estatus'
    end
    object tblusuariosidsector: TIntegerField
      FieldName = 'idsector'
    end
    object tblusuarioscodigo2: TStringField
      FieldName = 'codigo2'
      FixedChar = True
      Size = 3
    end
    object tblusuariosidturno: TIntegerField
      FieldName = 'idturno'
    end
    object tblusuariosusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object tblusuariosfecha: TStringField
      FieldName = 'fecha'
      Size = 15
    end
    object tblusuarioshora: TStringField
      FieldName = 'hora'
      Size = 15
    end
  end
  object DSusuarios: TDataSource
    DataSet = tblusuarios
    Left = 184
  end
  object dsDisp: TDataSource
    DataSet = sqldisp
    Left = 48
    Top = 240
  end
  object sqldisp: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select * from sectores order by nombre')
    FetchRows = 1
    FetchAll = True
    Left = 16
    Top = 240
  end
  object dsAsig: TDataSource
    DataSet = sqlasig
    Left = 408
    Top = 240
  end
  object sqlasig: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT '
      '  sectores.idsector,'
      '  sectores.nombre'
      'FROM'
      '  sectores'
      
        '  INNER JOIN UsuarioSector ON (sectores.idsector = UsuarioSector' +
        '.idsector)'
      'WHERE'
      'UsuarioSector.idusuario = :user')
    FetchRows = 1
    AfterOpen = sqlasigAfterOpen
    FetchAll = True
    Left = 376
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'user'
      end>
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 216
  end
end
