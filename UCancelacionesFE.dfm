object frmCancelacionesFE: TfrmCancelacionesFE
  Left = 471
  Top = 174
  Width = 651
  Height = 291
  Caption = 'Cancelacion de Remiciones y Facturas'
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel4: TRzLabel
    Left = 408
    Top = 184
    Width = 46
    Height = 20
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel5: TRzLabel
    Left = 408
    Top = 208
    Width = 67
    Height = 20
    Caption = 'Abonos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel6: TRzLabel
    Left = 408
    Top = 232
    Width = 52
    Height = 20
    Caption = 'Saldo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel7: TRzLabel
    Left = 7
    Top = 184
    Width = 106
    Height = 11
    Caption = 'Motivo de Cancelacion:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    Caption = 'Criterio de Busqueda'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 3
      Top = 25
      Width = 41
      Height = 14
      Caption = 'Pedido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 155
      Top = 25
      Width = 54
      Height = 14
      Caption = 'Remicion:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 347
      Top = 25
      Width = 43
      Height = 14
      Caption = 'Factura:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edNumPedido: TRzButtonEdit
      Left = 48
      Top = 16
      Width = 97
      Height = 22
      Hint = 'Buscar por numero de pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edNumPedidoChange
      OnKeyPress = edNumPedidoKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      OnButtonClick = edNumPedidoButtonClick
    end
    object edremicion: TRzButtonEdit
      Left = 216
      Top = 16
      Width = 121
      Height = 22
      Hint = 'Buscar por numero de remicion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = edremicionKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      OnButtonClick = edremicionButtonClick
    end
    object edfactura: TRzButtonEdit
      Left = 392
      Top = 16
      Width = 97
      Height = 22
      Hint = 'Buscar por numero de factura'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = edfacturaKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      OnButtonClick = edfacturaButtonClick
    end
    object dtpfecha: TRzDateTimeEdit
      Left = 496
      Top = 16
      Width = 137
      Height = 22
      EditType = etDate
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 3
    end
  end
  object gbcliente: TGroupBox
    Left = 0
    Top = 41
    Width = 635
    Height = 136
    Align = alTop
    Caption = 'Datos del cliente'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object RzLabel9: TRzLabel
      Left = 159
      Top = 89
      Width = 68
      Height = 11
      Caption = 'Codigo postal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblmovil: TRzLabel
      Left = 291
      Top = 89
      Width = 32
      Height = 11
      Caption = 'Sector:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblciudad: TRzLabel
      Left = 268
      Top = 64
      Width = 36
      Height = 11
      Caption = 'Ciudad:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblestado: TRzLabel
      Left = 414
      Top = 70
      Width = 34
      Height = 11
      Caption = 'Estado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcolonia: TRzLabel
      Left = 2
      Top = 86
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
    object lblentre: TRzLabel
      Left = 403
      Top = 88
      Width = 27
      Height = 11
      Caption = 'Entre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblalta: TRzLabel
      Left = 174
      Top = 38
      Width = 19
      Height = 11
      Caption = 'Alta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblfuente: TRzLabel
      Left = 141
      Top = 112
      Width = 34
      Height = 11
      Caption = 'Fuente:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblorigen: TRzLabel
      Left = 2
      Top = 112
      Width = 34
      Height = 11
      Caption = 'Origen:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblnombre: TRzLabel
      Left = 258
      Top = 38
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
    object RzLabel13: TRzLabel
      Left = 1
      Top = 65
      Width = 26
      Height = 11
      Caption = 'Calle:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel14: TRzLabel
      Left = 190
      Top = 65
      Width = 39
      Height = 11
      Caption = 'Numero:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel47: TRzLabel
      Left = 92
      Top = 17
      Width = 63
      Height = 11
      Caption = 'Razon Social:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 312
      Top = 13
      Width = 74
      Height = 14
      Caption = 'Tipo de control:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcategoria: TRzLabel
      Left = 3
      Top = 35
      Width = 48
      Height = 13
      Caption = 'Categoria:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel45: TRzLabel
      Left = 500
      Top = 11
      Width = 22
      Height = 13
      Caption = 'Giro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edentre: TRzDBEdit
      Left = 433
      Top = 81
      Width = 182
      Height = 20
      Hint = 'Entre que calles esta'
      DataSource = dsclientes
      DataField = 'refs'
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
    end
    object ednombre: TRzDBEdit
      Left = 341
      Top = 33
      Width = 213
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'cliente'
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
      TabOrder = 0
    end
    object RzDBEdit1: TRzDBEdit
      Left = 36
      Top = 105
      Width = 98
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'origen'
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
      TabOrder = 2
    end
    object c: TRzDBEdit
      Left = 178
      Top = 105
      Width = 84
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'fuente'
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
      TabOrder = 3
    end
    object RzDBEdit6: TRzDBEdit
      Left = 25
      Top = 60
      Width = 161
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'dir'
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
      TabOrder = 4
    end
    object RzDBEdit7: TRzDBEdit
      Left = 227
      Top = 60
      Width = 37
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'numero'
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
      TabOrder = 5
    end
    object RzDBEdit8: TRzDBEdit
      Left = 305
      Top = 60
      Width = 102
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'ciudad'
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
      TabOrder = 6
    end
    object RzDBEdit9: TRzDBEdit
      Left = 451
      Top = 60
      Width = 142
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'estado'
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
      TabOrder = 7
    end
    object RzDBEdit10: TRzDBEdit
      Left = 39
      Top = 82
      Width = 114
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'colonia'
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
      TabOrder = 8
    end
    object RzDBEdit11: TRzDBEdit
      Left = 226
      Top = 83
      Width = 55
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'cp'
      Alignment = taRightJustify
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
      TabOrder = 9
    end
    object RzDBEdit12: TRzDBEdit
      Left = 197
      Top = 32
      Width = 55
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'st_date'
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
      TabOrder = 10
    end
    object RzDBEdit3: TRzDBEdit
      Left = 323
      Top = 83
      Width = 74
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'Sector'
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
      TabOrder = 11
    end
    object edcuenta: TRzDBEdit
      Left = 37
      Top = 11
      Width = 42
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'idcliente'
      Alignment = taRightJustify
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
      TabOrder = 12
    end
    object edrsocial: TRzDBEdit
      Left = 155
      Top = 12
      Width = 150
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'rsocial'
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
      TabOrder = 13
    end
    object edcontrol: TRzDBEdit
      Left = 388
      Top = 7
      Width = 106
      Height = 22
      DataSource = dsclientes
      DataField = 'alarm'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 14
    end
    object RzDBEdit5: TRzDBEdit
      Left = 54
      Top = 31
      Width = 107
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'Categoria'
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
      TabOrder = 15
    end
    object RzDBEdit2: TRzDBEdit
      Left = 527
      Top = 7
      Width = 107
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'Giro'
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
      TabOrder = 16
    end
  end
  object RzBitBtn1: TRzBitBtn
    Left = 560
    Top = 229
    Width = 73
    Caption = '&Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 2
    OnClick = RzBitBtn1Click
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
  object edtotal: TRzEdit
    Left = 480
    Top = 186
    Width = 73
    Height = 21
    FrameController = DMAccesos.frmctr
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object edabonos: TRzEdit
    Left = 480
    Top = 208
    Width = 73
    Height = 21
    FrameController = DMAccesos.frmctr
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object edsaldo: TRzEdit
    Left = 480
    Top = 231
    Width = 73
    Height = 21
    FrameController = DMAccesos.frmctr
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object mmmotivo: TRzMemo
    Left = 8
    Top = 200
    Width = 377
    Height = 49
    TabOrder = 6
    FrameHotTrack = True
    FrameVisible = True
  end
  object btncancelar: TRzBitBtn
    Left = 560
    Top = 200
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 7
    OnClick = btncancelarClick
  end
  object dsclientes: TDataSource
    DataSet = sqlclientes
    Left = 296
    Top = 128
  end
  object sqlclientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT clientes.idfact,'
      
        '  clientes.idcliente,concat(clientes.nombre,'#39' '#39',clientes.apatern' +
        'o,'#39' '#39',clientes.amaterno) as cliente,'
      '  clientes.rsocial,'
      '  clientes.dir,'
      '  clientes.numero,'
      '  clientes.ciudad,'
      '  clientes.estado,'
      '  colonias.nombre AS Colonia,'
      '  colonias.cp,'
      '  sectores.nombre AS Sector,'
      '  clientes.st_date,'
      '  clientes.refs,clientes.alarm,'
      '  origen.nombre AS Origen,'
      '  fuentes.nombre AS Fuente,'
      '  giros.nombre AS Giro,'
      '  categorias.nombre AS Categoria'
      'FROM'
      '  clientes'
      '  left JOIN colonias ON (clientes.idcol = colonias.idcol)'
      '  left JOIN col_sector ON (colonias.idcol = col_sector.idcol)'
      
        '  left JOIN sectores ON (col_sector.idsector = sectores.idsector' +
        ')'
      '  left JOIN origen ON (clientes.idorigen = origen.idorigen)'
      '  left JOIN fuentes ON (clientes.idfuente = fuentes.idfuente)'
      '  left JOIN giros ON (clientes.idgiro = giros.idgiro)'
      
        '  left JOIN categorias ON (clientes.idcategoria = categorias.idc' +
        'ategoria)'
      'where clientes.idcliente =  :idcliente')
    ReadOnly = True
    FetchAll = True
    Left = 264
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcliente'
      end>
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPresupuesto.cveart,articulos.nombre,DetPresupuesto.can' +
        't,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_' +
        'esp/100 as descuento,articulos.aplica_desc,'
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',articulos.precioa,if ' +
        '(DetPresupuesto.utilidad = '#39'B'#39',articulos.preciob,if (DetPresupue' +
        'sto.utilidad = '#39'C'#39',articulos.precioc,if (DetPresupuesto.utilidad' +
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),3) as precio,  '
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',if (articulos.aplica_' +
        'desc = '#39'True'#39','
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioa/articulos.piezas_envase)-((articulos.preci' +
        'oa/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezas_envase)-((articulos.precioa/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioa+(articulos.precioa*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioa/articulos.piezas_envase)+((articulos.precioa/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      ''
      
        'if (DetPresupuesto.utilidad = '#39'B'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciob-(articulos.preciob*articulos.desc_esp/100))' +
        ' +((articulos.preciob-(articulos.preciob*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciob/articulos.piezas_envase)-((articulos.preci' +
        'ob/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciob/articulos.piezas_envase)-((articulos.preciob/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciob+(articulos.preciob*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'ciob/articulos.piezas_envase)+((articulos.preciob/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'C'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.precioc-(articulos.precioc*articulos.desc_esp/100))' +
        ' +((articulos.precioc-(articulos.precioc*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioc/articulos.piezas_envase)-((articulos.preci' +
        'oc/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioc/articulos.piezas_envase)-((articulos.precioc/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioc+(articulos.precioc*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioc/articulos.piezas_envase)+((articulos.precioc/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'D'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciod-(articulos.preciod*articulos.desc_esp/100))' +
        ' +((articulos.preciod-(articulos.preciod*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciod/articulos.piezas_envase)-((articulos.preci' +
        'od/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciod/articulos.piezas_envase)-((articulos.preciod/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciod+(articulos.preciod*articulos.iva/100))*DetPr' +
        'esupuesto.cant) +if (articulos.piezas_envase>0,(((articulos.prec' +
        'iod/articulos.piezas_envase)+((articulos.preciod/articulos.pieza' +
        's_envase)*articulos.iva/100))*DetPresupuesto.piezas),0))'
      ',0)))),3)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),3)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 440
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
  object Articulos: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPedido.id,DetPedido.cod_cve,articulos.nombre,DetPedido' +
        '.cant,DetPedido.piezas,articulos.iva/100 as Iva,articulos.desc_e' +
        'sp/100 as descuento,if (articulos.aplica_desc = 1, '#39'TRUE'#39','#39'FALSE' +
        #39') as aplica_desc,'
      
        'truncate(if (DetPedido.utilidad = '#39'A'#39',articulos.precioa,if (DetP' +
        'edido.utilidad = '#39'B'#39',articulos.preciob,if (DetPedido.utilidad = ' +
        #39'C'#39',articulos.precioc,if (DetPedido.utilidad = '#39'D'#39',articulos.pre' +
        'ciod,'#39#39')))),3) as precio,  '
      
        'truncate( if (DetPedido.utilidad = '#39'A'#39',if (articulos.aplica_desc' +
        ' = 1,'
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' + ((articulos.precioa-(articulos.precioa*articulos.desc_esp/100' +
        '))*articulos.iva/100))*DetPedido.cant) +'
      
        '((((articulos.precioa/articulos.piezasxunidad)-((articulos.preci' +
        'oa/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezasxunidad)-((articulos.precioa/articulo' +
        's.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPedido.piezas), ((articulos.precioa+(articulos.precioa*articulo' +
        's.iva/100))*DetPedido.cant) +'
      
        '(((articulos.precioa/articulos.piezasxunidad)+((articulos.precio' +
        'a/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas)' +
        '),'
      ''
      ''
      'if (DetPedido.utilidad = '#39'B'#39',if (articulos.aplica_desc = 1,'
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPedido.cant) +'
      
        '((((articulos.precioa/articulos.piezasxunidad)-((articulos.preci' +
        'oa/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezasxunidad)-((articulos.precioa/articulo' +
        's.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPedido.piezas), ((articulos.precioa+(articulos.precioa*articulo' +
        's.iva/100))*DetPedido.cant) +'
      
        '(((articulos.precioa/articulos.piezasxunidad)+((articulos.precio' +
        'a/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas)' +
        '),'
      ''
      ''
      'if (DetPedido.utilidad = '#39'C'#39',if (articulos.aplica_desc = 1,'
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPedido.cant) +'
      
        '((((articulos.precioa/articulos.piezasxunidad)-((articulos.preci' +
        'oa/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezasxunidad)-((articulos.precioa/articulo' +
        's.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPedido.piezas), ((articulos.precioa+(articulos.precioa*articulo' +
        's.iva/100))*DetPedido.cant) +'
      
        '(((articulos.precioa/articulos.piezasxunidad)+((articulos.precio' +
        'a/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas)' +
        '),'
      ''
      ''
      'if (DetPedido.utilidad = '#39'D'#39',if (articulos.aplica_desc = 1,'
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPedido.cant) +'
      
        '((((articulos.precioa/articulos.piezasxunidad)-((articulos.preci' +
        'oa/articulos.piezasxunidad)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezasxunidad)-((articulos.precioa/articulo' +
        's.piezasxunidad)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPedido.piezas), ((articulos.precioa+(articulos.precioa*articulo' +
        's.iva/100))*DetPedido.cant) +'
      
        '(((articulos.precioa/articulos.piezasxunidad)+((articulos.precio' +
        'a/articulos.piezasxunidad)*articulos.iva/100))*DetPedido.piezas)' +
        ')'
      
        ',0)))),3)  as Total,articulos.piezasxunidad,ROUND((articulos.tin' +
        'stalacion*DetPedido.cant),3)  as tinstalacion,DetPedido.utilidad' +
        ',DetPedido.paquete,DetPedido.idrequisicion,DetPedido.idCardexArt'
      
        'from DetPedido inner join articulos on DetPedido.cod_cve = artic' +
        'ulos.cod_cve'
      'where DetPedido.idpedido= :idpedido')
    ReadOnly = True
    FetchAll = True
    Left = 352
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpedido'
      end>
  end
  object DataSource1: TDataSource
    DataSet = sqlclientes
    Left = 384
    Top = 128
  end
end
