object frmNotasCreditoHist: TfrmNotasCreditoHist
  Left = 349
  Top = 144
  Width = 907
  Height = 608
  AutoSize = True
  Caption = 'Notas de Credito'
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbcliente: TGroupBox
    Left = 0
    Top = 55
    Width = 889
    Height = 113
    Caption = 'Datos del cliente'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object RzLabel9: TRzLabel
      Left = 343
      Top = 68
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
      Left = 475
      Top = 68
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
      Left = 654
      Top = 43
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
      Left = 4
      Top = 73
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
      Left = 186
      Top = 65
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
      Left = 587
      Top = 67
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
      Left = 3
      Top = 41
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
      Left = 144
      Top = 91
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
      Left = 5
      Top = 91
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
      Left = 86
      Top = 44
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
      Top = 18
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
      Left = 385
      Top = 44
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
      Left = 574
      Top = 44
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
      Left = 86
      Top = 20
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
      Left = 306
      Top = 16
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
      Left = 631
      Top = 14
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
      Left = 494
      Top = 14
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
    object lbufh: TRzLabel
      Left = 282
      Top = 92
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
    object edentre: TRzDBEdit
      Left = 617
      Top = 63
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
      Left = 169
      Top = 39
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
      Left = 39
      Top = 84
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
      Left = 181
      Top = 84
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
      Left = 409
      Top = 39
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
      Left = 611
      Top = 39
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
      Left = 691
      Top = 39
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
      Left = 41
      Top = 63
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
      Left = 223
      Top = 63
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
      Left = 410
      Top = 63
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
      Left = 26
      Top = 35
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
      Left = 507
      Top = 63
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
      Top = 14
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
      Left = 149
      Top = 14
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
      Left = 382
      Top = 14
      Width = 106
      Height = 22
      DataSource = dsclientes
      DataField = 'alarm'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 14
    end
    object RzDBEdit5: TRzDBEdit
      Left = 682
      Top = 14
      Width = 191
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
    object edGiro: TRzDBEdit
      Left = 521
      Top = 14
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
  object GBprincipal: TGroupBox
    Left = 0
    Top = 0
    Width = 633
    Height = 54
    Caption = 'Datos Principales'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object RzLabel39: TRzLabel
      Left = 164
      Top = 15
      Width = 56
      Height = 14
      Caption = 'Num Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel1: TRzLabel
      Left = 314
      Top = 15
      Width = 71
      Height = 14
      Caption = 'Num Vendedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 239
      Top = 16
      Width = 61
      Height = 14
      Caption = 'Num Factura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel28: TRzLabel
      Left = 489
      Top = 17
      Width = 30
      Height = 14
      Caption = 'Fecha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel11: TRzLabel
      Left = 8
      Top = 15
      Width = 41
      Height = 14
      Caption = 'Num NC:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel40: TRzLabel
      Left = 584
      Top = 18
      Width = 12
      Height = 11
      Caption = 'TC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel10: TRzLabel
      Left = 395
      Top = 15
      Width = 31
      Height = 14
      Caption = 'Venta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edcvecte: TRzButtonEdit
      Left = 160
      Top = 29
      Width = 73
      Height = 20
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Enabled = False
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
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
    end
    object edcvevend: TRzButtonEdit
      Left = 315
      Top = 29
      Width = 78
      Height = 20
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Enabled = False
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
      OnExit = edcvevendExit
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
    end
    object edfactura: TRzButtonEdit
      Left = 235
      Top = 29
      Width = 78
      Height = 20
      Hint = 'Buscar en el catalogo'
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 2
      ButtonKind = bkFind
      ButtonShortCut = 16450
    end
    object edFecha: TRzDateTimeEdit
      Left = 492
      Top = 30
      Width = 83
      Height = 19
      EditType = etDate
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 3
    end
    object edTCP: TRzEdit
      Left = 578
      Top = 29
      Width = 42
      Height = 20
      Hint = 'Tipo de Cambio'
      Text = '0'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = edTCPExit
    end
    object edventa: TRzEdit
      Left = 397
      Top = 27
      Width = 91
      Height = 22
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnKeyPress = edAduanaKeyPress
    end
  end
  object gbarticulo: TGroupBox
    Left = 0
    Top = 168
    Width = 891
    Height = 56
    Caption = 'Datos del Articulo'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object RzLabel15: TRzLabel
      Left = 672
      Top = 13
      Width = 48
      Height = 14
      Caption = 'Cantidad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object Label8: TLabel
      Left = 644
      Top = 13
      Width = 20
      Height = 14
      Caption = 'Pzs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblproducto: TRzLabel
      Left = 3
      Top = 13
      Width = 50
      Height = 14
      Caption = 'Producto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel17: TRzLabel
      Left = 165
      Top = 13
      Width = 65
      Height = 14
      Caption = 'Descripci'#243'n'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel18: TRzLabel
      Left = 423
      Top = 13
      Width = 35
      Height = 14
      Caption = 'Precio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel19: TRzLabel
      Left = 501
      Top = 13
      Width = 27
      Height = 14
      Caption = 'Desc'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel20: TRzLabel
      Left = 594
      Top = 13
      Width = 40
      Height = 14
      Caption = 'Utilidad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel21: TRzLabel
      Left = 541
      Top = 13
      Width = 45
      Height = 14
      Caption = 'T. Instal.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object Label1: TLabel
      Left = 816
      Top = 18
      Width = 60
      Height = 28
      Caption = '*ESC Limpia Captura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object chkpiezas: TCheckBox
      Left = 647
      Top = 25
      Width = 16
      Height = 25
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btnagregar: TRzBitBtn
      Left = 734
      Top = 23
      ModalResult = 1
      Caption = '&Agregar'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      TabOrder = 1
      OnClick = btnagregarClick
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
      NumGlyphs = 2
    end
    object CboUtilidad: TRzComboBox
      Left = 603
      Top = 28
      Width = 33
      Height = 22
      Style = csDropDownList
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FlatButtons = True
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Text = 'A'
      Items.Strings = (
        'A'
        'B'
        'C'
        'D')
      ItemIndex = 0
    end
    object edDescripcion: TRzEdit
      Left = 167
      Top = 28
      Width = 252
      Height = 22
      DisabledColor = clWhite
      Enabled = False
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
      TabOrder = 4
    end
    object EdPrecio: TRzEdit
      Left = 423
      Top = 28
      Width = 66
      Height = 22
      DisabledColor = clWhite
      Enabled = False
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
      TabOrder = 5
      OnExit = EdPrecioExit
      OnKeyPress = EdPrecioKeyPress
    end
    object EdDesc: TRzEdit
      Left = 494
      Top = 28
      Width = 43
      Height = 22
      DisabledColor = clWhite
      Enabled = False
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
      TabOrder = 6
    end
    object edTInsta: TRzEdit
      Left = 544
      Top = 28
      Width = 43
      Height = 22
      DisabledColor = clWhite
      Enabled = False
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
      TabOrder = 7
    end
    object edcodigo: TRzButtonEdit
      Left = 3
      Top = 29
      Width = 158
      Height = 22
      CharCase = ecUpperCase
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
      OnChange = edcodigoChange
      OnKeyPress = edcodigoKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edcodigoButtonClick
    end
    object edCantidad: TRzEdit
      Left = 670
      Top = 26
      Width = 60
      Height = 24
      Enabled = False
      FrameController = DMAccesos.frmctr
      TabOrder = 8
      OnChange = edCantidadChange
      OnKeyPress = edCantidadKeyPress
    end
  end
  object btncancelar: TRzBitBtn
    Left = 332
    Top = 530
    Width = 105
    Height = 40
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 3
    OnClick = btncancelarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000630E0000630E00000001000000000000000000003300
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86CE8E8
      E8E8E8E8E8E8E8E8B4E8E8E8E881E8E8E8E8E8E8E8E8E8E8ACE8E8E897B46CE8
      E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E897C7B46C
      E8E8E8E8E8E8E8B4E8E8E8E881E3AC81E8E8E8E8E8E8E8ACE8E8E8E8E897C090
      E8E8E8E8E8E8B4E8E8E8E8E8E881E381E8E8E8E8E8E8ACE8E8E8E8E8E8E890B4
      6CE8E8E8E8B46CE8E8E8E8E8E8E881AC81E8E8E8E8AC81E8E8E8E8E8E8E8E890
      B46CE8E8B46CE8E8E8E8E8E8E8E8E881AC81E8E8AC81E8E8E8E8E8E8E8E8E8E8
      90B46CB46CE8E8E8E8E8E8E8E8E8E8E881AC81AC81E8E8E8E8E8E8E8E8E8E8E8
      E890B46CE8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8
      90B46C906CE8E8E8E8E8E8E8E8E8E8E881AC818181E8E8E8E8E8E8E8E8E8E890
      B46CE8E8906CE8E8E8E8E8E8E8E8E881AC81E8E88181E8E8E8E8E8E8E890B4B4
      6CE8E8E8E8906CE8E8E8E8E8E881ACAC81E8E8E8E88181E8E8E8E8E890C7B46C
      E8E8E8E8E8E8906CE8E8E8E881E3AC81E8E8E8E8E8E88181E8E8E8E87A907AE8
      E8E8E8E8E8E8E8E890E8E8E8AC81ACE8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object Rejilla: TcxGrid
    Left = 0
    Top = 224
    Width = 891
    Height = 161
    Hint = '+ Incrementa Cant., - Decrementa Cant., SUPR Elimina Registro'
    Enabled = False
    TabOrder = 4
    LookAndFeel.Kind = lfUltraFlat
    object RejillaDBTableView1: TcxGridDBTableView
      OnDblClick = RejillaDBTableView1DblClick
      OnKeyUp = RejillaDBTableView1KeyUp
      DataController.DataSource = dsrejilla
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      OptionsBehavior.CellHints = True
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Preview.Visible = True
      object clave: TcxGridDBColumn
        Caption = 'Clave'
        Options.Editing = False
        Options.Moving = False
        Width = 125
        DataBinding.FieldName = 'cod_cve'
      end
      object nombre: TcxGridDBColumn
        Caption = 'Nombre'
        Options.Editing = False
        Options.Moving = False
        Width = 97
        DataBinding.FieldName = 'nombre'
      end
      object cant: TcxGridDBColumn
        Caption = 'Cant'
        Options.Editing = False
        Options.Moving = False
        Width = 73
        DataBinding.FieldName = 'cant'
      end
      object piezas: TcxGridDBColumn
        Caption = 'Pzs'
        Options.Editing = False
        Options.Moving = False
        Width = 66
        DataBinding.FieldName = 'piezas'
      end
      object paquete: TcxGridDBColumn
        Caption = 'Paquete'
        Width = 97
        DataBinding.FieldName = 'paquete'
      end
      object cxmoneda: TcxGridDBColumn
        Options.Editing = False
        Options.Moving = False
        Width = 99
        DataBinding.FieldName = 'Moneda'
      end
      object tiempo: TcxGridDBColumn
        Caption = 'Tiempo'
        Width = 98
        DataBinding.FieldName = 'tinstalacion'
      end
      object precio: TcxGridDBColumn
        Caption = 'Precio'
        Options.Editing = False
        Options.Moving = False
        Width = 110
        DataBinding.FieldName = 'precio'
      end
      object total: TcxGridDBColumn
        Options.Editing = False
        Options.Moving = False
        Width = 112
        DataBinding.FieldName = 'Total'
      end
    end
    object RejillaLevel1: TcxGridLevel
      GridView = RejillaDBTableView1
    end
  end
  object edNumNC: TRzButtonEdit
    Left = 66
    Top = 29
    Width = 83
    Height = 20
    Hint = 'Buscar Nota de Credito'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    FrameController = DMAccesos.frmctr
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnChange = edNumNCChange
    OnKeyPress = edNumNCKeyPress
    ButtonKind = bkFind
    ButtonShortCut = 119
    AltBtnWidth = 14
    ButtonWidth = 14
    OnButtonClick = edNumNCButtonClick
  end
  object gbtotales: TGroupBox
    Left = 548
    Top = 385
    Width = 342
    Height = 184
    Caption = 'Totales'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object RzLabel22: TRzLabel
      Left = 3
      Top = 25
      Width = 51
      Height = 14
      Caption = 'Sub-Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel30: TRzLabel
      Left = 3
      Top = 47
      Width = 59
      Height = 14
      Caption = 'Descuento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel32: TRzLabel
      Left = 3
      Top = 71
      Width = 15
      Height = 14
      Caption = 'Iva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel33: TRzLabel
      Left = 3
      Top = 115
      Width = 82
      Height = 16
      Caption = 'Total en Dlls.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel34: TRzLabel
      Left = 3
      Top = 95
      Width = 69
      Height = 14
      Caption = 'Total en M.N.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel35: TRzLabel
      Left = 3
      Top = 140
      Width = 76
      Height = 14
      Caption = 'Anticipo(M.N.)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel36: TRzLabel
      Left = 4
      Top = 165
      Width = 73
      Height = 14
      Caption = 'Saldo en M.N.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edTotMat: TRzNumericEdit
      Left = 240
      Top = 16
      Width = 97
      Height = 22
      Color = clInfoBk
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object edDescuento: TRzNumericEdit
      Left = 240
      Top = 38
      Width = 97
      Height = 22
      Color = clInfoBk
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object ediva: TRzNumericEdit
      Left = 242
      Top = 62
      Width = 97
      Height = 22
      Color = clInfoBk
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object edTotDlls: TRzNumericEdit
      Left = 242
      Top = 110
      Width = 97
      Height = 22
      Color = clInfoBk
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object edTotMn: TRzNumericEdit
      Left = 242
      Top = 86
      Width = 97
      Height = 22
      Color = clInfoBk
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object edSaldo: TRzNumericEdit
      Left = 241
      Top = 156
      Width = 97
      Height = 22
      Color = clInfoBk
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object edAnticipo: TRzEdit
      Left = 240
      Top = 134
      Width = 99
      Height = 22
      Text = '0'
      Alignment = taRightJustify
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 6
      OnExit = edAnticipoExit
      OnKeyPress = edAnticipoKeyPress
    end
    object edpiva: TRzEdit
      Left = 184
      Top = 62
      Width = 49
      Height = 21
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 7
    end
  end
  object GBAdicionales: TGroupBox
    Left = 0
    Top = 389
    Width = 545
    Height = 140
    Caption = 'Datos Adicionales'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object RzLabel3: TRzLabel
      Left = 3
      Top = 57
      Width = 86
      Height = 14
      Caption = 'Observaciones:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 7
      Top = 16
      Width = 73
      Height = 14
      Caption = 'Num Pedimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 153
      Top = 16
      Width = 38
      Height = 14
      Caption = 'Aduana'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel6: TRzLabel
      Left = 279
      Top = 16
      Width = 70
      Height = 14
      Caption = 'Fecha Aduana'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel7: TRzLabel
      Left = 367
      Top = 16
      Width = 98
      Height = 14
      Caption = 'Fecha Pago Anticipo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edNumPed: TRzEdit
      Left = 5
      Top = 32
      Width = 137
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edNumPedKeyPress
    end
    object edAduana: TRzEdit
      Left = 149
      Top = 32
      Width = 121
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edAduanaKeyPress
    end
    object dtpFechaAduana: TRzDateTimePicker
      Left = 277
      Top = 32
      Width = 84
      Height = 22
      Date = 38764.448664421290000000
      Time = 38764.448664421290000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = dtpFechaAduanaKeyPress
      FrameController = DMAccesos.frmctr
    end
    object dtpFecPagAnt: TRzDateTimePicker
      Left = 373
      Top = 32
      Width = 84
      Height = 22
      Date = 38764.448664421290000000
      Time = 38764.448664421290000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnKeyPress = dtpFecPagAntKeyPress
      FrameController = DMAccesos.frmctr
    end
    object mmObservaciones: TRzRichEdit
      Left = 3
      Top = 72
      Width = 518
      Height = 63
      TabOrder = 4
      OnChange = mmObservacionesChange
      FrameColor = clGradientActiveCaption
      FrameVisible = True
    end
  end
  object tbherramientas: TToolBar
    Left = 642
    Top = 0
    Width = 178
    Height = 29
    Hint = 'Barra de Herramientas'
    Align = alNone
    AutoSize = True
    ButtonHeight = 23
    ButtonWidth = 29
    Caption = 'tbherramientas'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = DMAccesos.iledicion
    TabOrder = 8
    object btncopy: TToolButton
      Left = 0
      Top = 2
      Action = frmprincipal.EditCopy1
    end
    object btncut: TToolButton
      Left = 29
      Top = 2
      Action = frmprincipal.EditCut1
    end
    object btnpaste: TToolButton
      Left = 58
      Top = 2
      Action = frmprincipal.EditPaste1
    end
    object btndelete: TToolButton
      Left = 87
      Top = 2
      Action = frmprincipal.EditDelete1
    end
    object btnundo: TToolButton
      Left = 116
      Top = 2
      Action = frmprincipal.EditUndo1
    end
    object btnfuentes: TToolButton
      Left = 145
      Top = 2
      Hint = 'Fuentes'
      Caption = '&Fuentes'
      Enabled = False
      ImageIndex = 19
      OnClick = btnfuentesClick
    end
  end
  object btnimprimir: TRzBitBtn
    Left = 444
    Top = 531
    Width = 102
    Height = 39
    Hint = 'Imprimir datos generales de la oportunidad'
    Caption = '&Imprimir'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 9
    OnClick = btnimprimirClick
    ImageIndex = 20
    Images = DMAccesos.ilopciones
  end
  object btnmodificar: TRzBitBtn
    Left = 224
    Top = 530
    Width = 105
    Height = 40
    Caption = '&Editar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 10
    OnClick = btnmodificarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000630B0000630B00000001000000000000000000003300
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
      E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
      E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
      E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object edserie: TRzEdit
    Left = 8
    Top = 32
    Width = 41
    Height = 19
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 11
  end
  object sqlclientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT clientes.idfact,clientes.precio,'
      
        '  clientes.idcliente,concat(ifnull(clientes.nombre,'#39' '#39'),'#39' '#39',ifnu' +
        'll(clientes.apaterno,'#39' '#39'),'#39' '#39',ifnull(clientes.amaterno,'#39' '#39')) as ' +
        'cliente,'
      
        '  if (ClientesFact.rsocial is null or ClientesFact.rsocial='#39#39',co' +
        'ncat(ifnull(ClientesFact.nombre,'#39#39'),'#39' '#39',ifnull(ClientesFact.apat' +
        'erno,'#39#39'),'#39' '#39',ifnull(ClientesFact.amaterno,'#39#39')) ,ClientesFact.rso' +
        'cial) as rsocial,'
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
      '  categorias.nombre AS Categoria,clientes.idvendedor'
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
      
        '  left join ClientesFact ON (clientes.idfact = ClientesFact.idfa' +
        'ct)'
      'where clientes.idcliente =  :idcliente')
    ReadOnly = True
    FetchAll = True
    Left = 824
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcliente'
      end>
  end
  object dsclientes: TDataSource
    DataSet = sqlclientes
    Left = 856
  end
  object sqlrejilla: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select dnc.idnc,dnc.id,dnc.cod_cve,a.nombre,dnc.cant, dnc.piezas' +
        ',a.iva/100 as Iva,a.desc_esp/100 as descuento,'
      'if (a.aplica_desc = 1, '#39'TRUE'#39','#39'FALSE'#39') as aplica_desc,'
      
        'dnc.costo as precio,if(a.moneda = '#39'D'#39','#39'DOLARES'#39','#39'PESOS'#39') as Mone' +
        'da,  0 as idCardexArt,'
      'if (a.aplica_desc = 1,'
      
        '(((dnc.costo-(dnc.costo*a.desc_esp/100)) + ((dnc.costo-(dnc.cost' +
        'o*a.desc_esp/100))*a.iva/100))*dnc.cant) +'
      
        '((((dnc.costo/a.piezasxunidad)-((dnc.costo/a.piezasxunidad)*a.de' +
        'sc_esp/100)) +(((dnc.costo/a.piezasxunidad)-((dnc.costo/a.piezas' +
        'xunidad)*a.desc_esp/100))*a.iva/100))*dnc.piezas), ((dnc.costo+(' +
        'dnc.costo*a.iva/100))*dnc.cant) +'
      
        '(((dnc.costo/a.piezasxunidad)+((dnc.costo/a.piezasxunidad)*a.iva' +
        '/100))*dnc.piezas)) as Total,a.piezasxunidad,(a.tinstalacion*dnc' +
        '.cant)  as tinstalacion,dnc.utilidad,dnc.paquete'
      
        'from DetNotasCredito dnc inner join articulos a on dnc.cod_cve =' +
        ' a.cod_cve'
      
        'where dnc.idmaq=:maq or (dnc.serie = :serie and dnc.idnc = :idnc' +
        ') order by cod_cve')
    ReadOnly = True
    FetchAll = True
    Left = 8
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'maq'
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'serie'
      end
      item
        DataType = ftInteger
        Name = 'idnc'
        Value = 0
      end>
  end
  object dsrejilla: TDataSource
    DataSet = sqlrejilla
    Left = 8
    Top = 288
  end
  object Dialogo: TLMDCheckListDlg
    CaptionFill = True
    CaptionTitle = 'Cancelar/Borrar Pedidos'
    Effect = deExplodeExt
    Hints.Strings = (
      'Ejecutar esta operacion'
      'Cancelar la operacion')
    Options = [cloRadioButtons, cloSelectByClick]
    Prompt = 'Que Desea Hacer?'
    RelatePos = brActiveWindow
    Items.Strings = (
      'Cancelar Pedido'
      'Borrar Pedido')
    Left = 648
    Top = 72
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
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),2) as precio,  '
      
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
      ',0)))),2)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),2)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 128
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'idpresupuesto'
        Value = ''
      end>
  end
  object sqltemp: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPresupuesto.cveart,articulos.nombre,DetPresupuesto.can' +
        't,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_' +
        'esp/100 as descuento,articulos.aplica_desc,'
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',articulos.precioa,if ' +
        '(DetPresupuesto.utilidad = '#39'B'#39',articulos.preciob,if (DetPresupue' +
        'sto.utilidad = '#39'C'#39',articulos.precioc,if (DetPresupuesto.utilidad' +
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),2) as precio,  '
      
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
      ',0)))),2)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),2)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'idpresupuesto'
        Value = ''
      end>
  end
  object sqlNotasCred: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetNotasCredito.idnc,DetNotasCredito.id,DetNotasCredito.c' +
        'od_cve,articulos.nombre,DetNotasCredito.cant,DetNotasCredito.pie' +
        'zas,articulos.iva/100 as Iva,articulos.desc_esp/100 as descuento' +
        ',if (articulos.aplica_desc = 1, '#39'TRUE'#39','#39'FALSE'#39') as aplica_desc,'
      
        'truncate(DetNotasCredito.costo,2) as precio,if(articulos.moneda ' +
        '= '#39'D'#39','#39'DOLARES'#39','#39'PESOS'#39') as Moneda,  '
      'truncate(if (articulos.aplica_desc = 1,'
      
        '(((DetNotasCredito.costo-(DetNotasCredito.costo*articulos.desc_e' +
        'sp/100)) + ((DetNotasCredito.costo-(DetNotasCredito.costo*articu' +
        'los.desc_esp/100))*articulos.iva/100))*DetNotasCredito.cant) +'
      
        '((((DetNotasCredito.costo/articulos.piezasxunidad)-((DetNotasCre' +
        'dito.costo/articulos.piezasxunidad)*articulos.desc_esp/100)) +((' +
        '(DetNotasCredito.costo/articulos.piezasxunidad)-((DetNotasCredit' +
        'o.costo/articulos.piezasxunidad)*articulos.desc_esp/100))*articu' +
        'los.iva/100))*DetNotasCredito.piezas), ((DetNotasCredito.costo+(' +
        'DetNotasCredito.costo*articulos.iva/100))*DetNotasCredito.cant) ' +
        '+'
      
        '(((DetNotasCredito.costo/articulos.piezasxunidad)+((DetNotasCred' +
        'ito.costo/articulos.piezasxunidad)*articulos.iva/100))*DetNotasC' +
        'redito.piezas)),2)  as Total,articulos.piezasxunidad,ROUND((arti' +
        'culos.tinstalacion*DetNotasCredito.cant),2)  as tinstalacion,Det' +
        'NotasCredito.utilidad,DetNotasCredito.paquete'
      
        'from DetNotasCredito inner join articulos on DetNotasCredito.cod' +
        '_cve = articulos.cod_cve'
      
        'where DetNotasCredito.idmaq=:maq or (DetNotasCredito.serie= :ser' +
        'ie and DetNotasCredito.idnc = :idnc)')
    ReadOnly = True
    FetchAll = True
    Left = 168
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'maq'
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'serie'
      end
      item
        DataType = ftInteger
        Name = 'idnc'
        Value = 0
      end>
  end
  object sqlinserta: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPresupuesto.cveart,articulos.nombre,DetPresupuesto.can' +
        't,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_' +
        'esp/100 as descuento,articulos.aplica_desc,'
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',articulos.precioa,if ' +
        '(DetPresupuesto.utilidad = '#39'B'#39',articulos.preciob,if (DetPresupue' +
        'sto.utilidad = '#39'C'#39',articulos.precioc,if (DetPresupuesto.utilidad' +
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),2) as precio,  '
      
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
      ',0)))),2)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),2)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 96
    Top = 256
    ParamData = <
      item
        DataType = ftString
        Name = 'idpresupuesto'
        Value = ''
      end>
  end
end