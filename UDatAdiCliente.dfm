object frmDatAdiCliente: TfrmDatAdiCliente
  Left = 325
  Top = 31
  Width = 991
  Height = 655
  Caption = 'Datos adicionales del cliente'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object gbcomplement: TRzCheckGroup
    Left = 0
    Top = 259
    Width = 977
    Height = 225
    Align = alCustom
    BorderWidth = 1
    Caption = 'Datos complementarios'
    Color = clWhite
    Columns = 2
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHotTrack = True
    ItemFont.Charset = DEFAULT_CHARSET
    ItemFont.Color = clWindowText
    ItemFont.Height = -9
    ItemFont.Name = 'MS Sans Serif'
    ItemFont.Style = []
    ItemHeight = 14
    Items.Strings = (
      'Bital'
      'Cablemas'
      'Labora en dias festivos'
      'Oficina Alarmex'
      'OXXO'
      'Cobranza a Domicilio Costo mas I.V.A.'
      'Acepta pagar diferencia por excedente de tuberia y cableado'
      'Recibio estudio de vulnerabilidad'
      'El presupuesto incluye el 100% de proteccion perimetral'
      'El presupuesto no contempla el 100% de proteccion perimetral')
    ParentFont = False
    TabOrder = 1
    VerticalSpacing = 2
    CheckStates = (
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0)
    object RzLabel10: TRzLabel
      Left = 10
      Top = 125
      Width = 47
      Height = 14
      Caption = 'Compa'#241'ia'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel16: TRzLabel
      Left = 123
      Top = 125
      Width = 33
      Height = 14
      Caption = 'Reviso'
      Enabled = False
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
      Left = 306
      Top = 125
      Width = 70
      Height = 11
      Caption = 'Fecha Revicion'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel32: TRzLabel
      Left = 421
      Top = 122
      Width = 73
      Height = 11
      Caption = 'Lunes a Viernes'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel33: TRzLabel
      Left = 549
      Top = 120
      Width = 39
      Height = 11
      Caption = 'Sabados'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel31: TRzLabel
      Left = 490
      Top = 105
      Width = 155
      Height = 11
      Caption = 'Horarios Regulares de operacion:'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel34: TRzLabel
      Left = 650
      Top = 118
      Width = 47
      Height = 11
      Caption = 'Domingos'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel49: TRzLabel
      Left = 3
      Top = 166
      Width = 74
      Height = 14
      Caption = 'Observaciones'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edcompania: TRzDBEdit
      Left = 5
      Top = 139
      Width = 106
      Height = 21
      DataSource = dspedidos
      DataField = 'compania'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edcompaniaKeyPress
    end
    object edreviso: TRzDBEdit
      Left = 119
      Top = 139
      Width = 178
      Height = 21
      DataSource = dspedidos
      DataField = 'reviso'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edcompaniaKeyPress
    end
    object FechaRev: TRzDBDateTimePicker
      Left = 304
      Top = 139
      Width = 97
      Height = 21
      Date = 38944.659952453700000000
      Time = 38944.659952453700000000
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edcompaniaKeyPress
      FrameController = DMAccesos.frmctr
      DataField = 'FechaReviso'
      DataSource = dspedidos
    end
    object edLunVier: TRzDBEdit
      Left = 415
      Top = 139
      Width = 114
      Height = 21
      DataSource = dspedidos
      DataField = 'HorLunVier'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edcompaniaKeyPress
    end
    object edsabados: TRzDBEdit
      Left = 535
      Top = 139
      Width = 106
      Height = 21
      DataSource = dspedidos
      DataField = 'HorSab'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 4
      OnKeyPress = edcompaniaKeyPress
    end
    object eddomingos: TRzDBEdit
      Left = 647
      Top = 139
      Width = 106
      Height = 21
      DataSource = dspedidos
      DataField = 'HorDom'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 5
      OnKeyPress = edcompaniaKeyPress
    end
    object mmobservaciones: TRzDBRichEdit
      Left = 2
      Top = 180
      Width = 759
      Height = 37
      DataField = 'observaciones'
      DataSource = dspedidos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clBlue
      FrameHotTrack = True
      FrameVisible = True
    end
    object edcosto: TRzDBNumericEdit
      Left = 208
      Top = 96
      Width = 89
      Height = 21
      DataSource = dspedidos
      DataField = 'cuota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 7
      OnKeyPress = edcompaniaKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object rcgtrafico: TRzCheckGroup
      Left = 464
      Top = 8
      Width = 177
      Height = 81
      Caption = 'Entrega de Trafico'
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHotTrack = True
      Items.Strings = (
        'Via E-Mail'
        'Entrega Personalizada'
        'No Desea Informacion')
      ParentFont = False
      TabOrder = 8
      OnChange = rcgtraficoChange
      CheckStates = (
        0
        0
        0)
    end
    object rgContactoCambio: TRzGroupBox
      Left = 768
      Top = 32
      Width = 201
      Height = 161
      Caption = 'Contacto cambia Datos'
      Color = clWhite
      Enabled = False
      TabOrder = 9
      object RzLabel1: TRzLabel
        Left = 8
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Nombre:'
        Enabled = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel2: TRzLabel
        Left = 8
        Top = 56
        Width = 105
        Height = 13
        Caption = 'Relacion o Puesto'
        Enabled = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object TRzLabel
        Left = 16
        Top = 104
        Width = 5
        Height = 13
        Enabled = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel3: TRzLabel
        Left = 8
        Top = 104
        Width = 99
        Height = 13
        Caption = 'Fecha de Cambio'
        Enabled = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object ednomcamb: TRzDBEdit
        Left = 8
        Top = 32
        Width = 185
        Height = 21
        DataSource = dspedidos
        DataField = 'NombreCambio'
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 0
      end
      object edrelcamb: TRzDBEdit
        Left = 8
        Top = 72
        Width = 185
        Height = 21
        DataSource = dspedidos
        DataField = 'RelacionPuestoCambio'
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 1
      end
      object edfechacambio: TRzDateTimeEdit
        Left = 8
        Top = 128
        Width = 185
        Height = 21
        EditType = etDate
        TabOrder = 2
      end
    end
    object rgservicios: TRzCheckGroup
      Left = 648
      Top = 8
      Width = 113
      Height = 81
      Caption = 'Servicios'
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHotTrack = True
      Items.Strings = (
        'Calcamonia'
        'Acrilico'
        'Numero')
      ParentFont = False
      TabOrder = 10
      CheckStates = (
        0
        0
        0)
    end
  end
  object gblocal: TRzGroupBox
    Left = 4
    Top = 490
    Width = 973
    Height = 97
    Align = alCustom
    Caption = 'Datos de Localizacion'
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object RzLabel35: TRzLabel
      Left = 3
      Top = 15
      Width = 73
      Height = 14
      Caption = 'Clave Catastral'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel36: TRzLabel
      Left = 107
      Top = 15
      Width = 79
      Height = 14
      Caption = 'No. Medidor CFE'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel37: TRzLabel
      Left = 211
      Top = 15
      Width = 121
      Height = 14
      Caption = 'No. Credencial de Elector'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel38: TRzLabel
      Left = 339
      Top = 15
      Width = 104
      Height = 14
      Caption = 'No licencia de Manejo'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel39: TRzLabel
      Left = 451
      Top = 15
      Width = 33
      Height = 14
      Caption = 'Estado'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel40: TRzLabel
      Left = 536
      Top = 15
      Width = 68
      Height = 14
      Caption = 'No. Pasaporte'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel41: TRzLabel
      Left = 706
      Top = 15
      Width = 89
      Height = 14
      Caption = 'Escritura Publica #'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel42: TRzLabel
      Left = 3
      Top = 55
      Width = 30
      Height = 14
      Caption = 'Fecha'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel43: TRzLabel
      Left = 107
      Top = 55
      Width = 53
      Height = 14
      Caption = 'Notario No.'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel44: TRzLabel
      Left = 211
      Top = 55
      Width = 33
      Height = 14
      Caption = 'Ciudad'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel45: TRzLabel
      Left = 315
      Top = 55
      Width = 44
      Height = 14
      Caption = 'Poder No'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel46: TRzLabel
      Left = 411
      Top = 55
      Width = 100
      Height = 14
      Caption = 'Nombre Arrendatario'
      Color = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edNumElector: TRzDBEdit
      Left = 214
      Top = 27
      Width = 113
      Height = 21
      DataSource = dspedidos
      DataField = 'NumCredElec'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edcompaniaKeyPress
    end
    object edcfe: TRzDBEdit
      Left = 103
      Top = 27
      Width = 106
      Height = 21
      DataSource = dspedidos
      DataField = 'NumCfe'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edcompaniaKeyPress
    end
    object edCatastral: TRzDBEdit
      Left = -1
      Top = 27
      Width = 102
      Height = 21
      DataSource = dspedidos
      DataField = 'CveCatastral'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edcompaniaKeyPress
    end
    object edNumLicencia: TRzDBEdit
      Left = 335
      Top = 27
      Width = 106
      Height = 21
      DataSource = dspedidos
      DataField = 'NumLicMan'
      Alignment = taRightJustify
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 3
      OnEnter = edNumLicenciaEnter
      OnKeyPress = edcompaniaKeyPress
    end
    object edestado: TRzDBEdit
      Left = 447
      Top = 27
      Width = 85
      Height = 21
      DataSource = dspedidos
      DataField = 'EdoLicMan'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 4
      OnKeyPress = edcompaniaKeyPress
    end
    object edNumPasaporte: TRzDBEdit
      Left = 535
      Top = 27
      Width = 94
      Height = 21
      DataSource = dspedidos
      DataField = 'NumPasaporte'
      Alignment = taRightJustify
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 5
      OnEnter = edNumLicenciaEnter
      OnKeyPress = edcompaniaKeyPress
    end
    object edescritura: TRzDBEdit
      Left = 703
      Top = 27
      Width = 106
      Height = 21
      DataSource = dspedidos
      DataField = 'Escritura'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 7
      OnKeyPress = edcompaniaKeyPress
    end
    object EscrituraFecha: TRzDBDateTimePicker
      Left = 0
      Top = 69
      Width = 97
      Height = 21
      Date = 38944.659952453700000000
      Time = 38944.659952453700000000
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnKeyPress = edcompaniaKeyPress
      FrameController = DMAccesos.frmctr
      DataField = 'FechaEscritura'
      DataSource = dspedidos
    end
    object edNumNotario: TRzDBEdit
      Left = 102
      Top = 69
      Width = 99
      Height = 21
      DataSource = dspedidos
      DataField = 'NumNotario'
      Alignment = taRightJustify
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 9
      OnEnter = edNumLicenciaEnter
      OnKeyPress = edcompaniaKeyPress
    end
    object edciudad: TRzDBEdit
      Left = 206
      Top = 68
      Width = 99
      Height = 21
      DataSource = dspedidos
      DataField = 'Ciudad'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 10
      OnKeyPress = edcompaniaKeyPress
    end
    object edNumPoder: TRzDBEdit
      Left = 310
      Top = 67
      Width = 91
      Height = 21
      DataSource = dspedidos
      DataField = 'NumPoder'
      Alignment = taRightJustify
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 11
      OnEnter = edNumLicenciaEnter
      OnKeyPress = edcompaniaKeyPress
    end
    object edNomArrendatario: TRzDBEdit
      Left = 414
      Top = 67
      Width = 211
      Height = 21
      DataSource = dspedidos
      DataField = 'NomArrendat'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 12
      OnKeyPress = edcompaniaKeyPress
    end
    object rgTipoPass: TRzRadioGroup
      Left = 634
      Top = 11
      Width = 57
      Height = 41
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GroupStyle = gsCustom
      ItemIndex = 0
      Items.Strings = (
        'Local'
        'Mex')
      ParentFont = False
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 2
    Top = 594
    Width = 975
    Height = 24
    Align = alCustom
    Color = clWhite
    TabOrder = 3
    object lbufh: TRzLabel
      Left = 360
      Top = 3
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
    object btncancelar: TRzBitBtn
      Left = 82
      Top = 2
      Width = 85
      Height = 21
      Hint = 'Cerrar esta Pantalla'
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 1
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
      Spacing = 3
    end
    object btnmodificar: TRzBitBtn
      Left = 3
      Top = 2
      Width = 79
      Height = 21
      Hint = 'Editar los datos adicionales del cliente'
      ModalResult = 1
      Caption = '&Editar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      ImageIndex = 2
      NumGlyphs = 2
      Spacing = 3
    end
  end
  object gbtarjeta: TRzGroupBox
    Left = 1
    Top = 0
    Width = 976
    Height = 257
    Align = alCustom
    Caption = 'Datos de Cargo a Tarjeta'
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object gbcargos: TRzPanel
      Left = 8
      Top = 40
      Width = 953
      Height = 209
      BorderWidth = 1
      Color = 16119543
      TabOrder = 1
      object Label1: TLabel
        Left = 18
        Top = 6
        Width = 102
        Height = 13
        Caption = 'Numero de tarjeta'
      end
      object Label5: TLabel
        Left = 288
        Top = 3
        Width = 81
        Height = 13
        Caption = 'Tipo de Cargo'
      end
      object Label6: TLabel
        Left = 288
        Top = 43
        Width = 55
        Height = 13
        Caption = 'Concepto'
      end
      object Label4: TLabel
        Left = 465
        Top = 84
        Width = 100
        Height = 13
        Caption = 'Apellido Materno '
      end
      object Label3: TLabel
        Left = 284
        Top = 83
        Width = 94
        Height = 13
        Caption = 'Apellido Paterno'
      end
      object Label2: TLabel
        Left = 15
        Top = 86
        Width = 44
        Height = 13
        Caption = 'Nombre'
      end
      object RzLabel48: TRzLabel
        Left = 19
        Top = 124
        Width = 54
        Height = 28
        Caption = 'Frecuencia de Pagos'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Label11: TLabel
        Left = 274
        Top = 168
        Width = 79
        Height = 26
        Alignment = taRightJustify
        Caption = 'Fecha vence Equipo'
        WordWrap = True
      end
      object Label12: TLabel
        Left = 448
        Top = 3
        Width = 37
        Height = 13
        Caption = 'Banco'
      end
      object Label13: TLabel
        Left = 16
        Top = 48
        Width = 33
        Height = 13
        Caption = 'Clave'
      end
      object Label14: TLabel
        Left = 657
        Top = 7
        Width = 109
        Height = 13
        Caption = 'Fecha Vencimiento'
      end
      object Label15: TLabel
        Left = 481
        Top = 168
        Width = 80
        Height = 26
        Alignment = taRightJustify
        Caption = 'Meses vence Monitoreo'
        WordWrap = True
      end
      object Label16: TLabel
        Left = 15
        Top = 158
        Width = 99
        Height = 13
        Caption = 'Cuenta Bancaria:'
      end
      object ednumtarjeta: TRzDBEdit
        Left = 13
        Top = 21
        Width = 263
        Height = 21
        DataSource = dspedidos
        DataField = 'NumTarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edcompaniaKeyPress
      end
      object cbotipopago: TRzComboBox
        Left = 284
        Top = 20
        Width = 165
        Height = 21
        Ctl3D = False
        FlatButtons = True
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = edcompaniaKeyPress
      end
      object edconceptotarjeta: TRzDBEdit
        Left = 288
        Top = 60
        Width = 257
        Height = 21
        DataSource = dspedidos
        DataField = 'ConceptoTarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 5
        OnKeyPress = edcompaniaKeyPress
      end
      object edmaterno: TRzDBEdit
        Left = 467
        Top = 98
        Width = 175
        Height = 21
        DataSource = dspedidos
        DataField = 'AmaternoTarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 8
        OnKeyPress = edcompaniaKeyPress
      end
      object edpaterno: TRzDBEdit
        Left = 283
        Top = 99
        Width = 174
        Height = 21
        DataSource = dspedidos
        DataField = 'ApaternoTarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 7
        OnKeyPress = edcompaniaKeyPress
      end
      object ednombre: TRzDBEdit
        Left = 14
        Top = 99
        Width = 260
        Height = 21
        DataSource = dspedidos
        DataField = 'NombreTarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 6
        OnKeyPress = edcompaniaKeyPress
      end
      object cbofrecuencia: TRzComboBox
        Left = 80
        Top = 131
        Width = 209
        Height = 21
        Ctl3D = False
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 9
        OnKeyPress = edcompaniaKeyPress
        Items.Strings = (
          'MENSUAL'
          'ANUAL'
          'SEMANAL'
          'QUINCENAL')
      end
      object RzGroupBox2: TRzGroupBox
        Left = 304
        Top = 127
        Width = 489
        Height = 33
        Caption = 'Monto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        object Label7: TLabel
          Left = 20
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Equipo'
        end
        object Label8: TLabel
          Left = 197
          Top = 12
          Width = 47
          Height = 13
          Caption = 'Monitoreo'
        end
        object Label9: TLabel
          Left = 366
          Top = 12
          Width = 8
          Height = 13
          Caption = '='
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 181
          Top = 12
          Width = 8
          Height = 13
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edequipo: TRzDBEdit
          Left = 58
          Top = 8
          Width = 111
          Height = 21
          DataSource = dspedidos
          DataField = 'Equipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FrameController = DMAccesos.frmctr
          ParentFont = False
          TabOrder = 0
          OnExit = edequipoExit
          OnKeyPress = edequipoKeyPress
        end
        object edservicio: TRzDBEdit
          Left = 251
          Top = 8
          Width = 111
          Height = 21
          DataSource = dspedidos
          DataField = 'Servicio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FrameController = DMAccesos.frmctr
          ParentFont = False
          TabOrder = 1
          OnExit = edequipoExit
          OnKeyPress = edservicioKeyPress
        end
        object edtotal: TRzEdit
          Left = 384
          Top = 7
          Width = 99
          Height = 24
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          FrameColor = clBlue
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          TabOrder = 2
        end
      end
      object cbobanco: TRzComboBox
        Left = 452
        Top = 20
        Width = 197
        Height = 21
        Ctl3D = False
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = edcompaniaKeyPress
      end
      object edclave: TRzDBEdit
        Left = 16
        Top = 63
        Width = 265
        Height = 21
        DataSource = dspedidos
        DataField = 'clave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 4
        OnKeyPress = edcompaniaKeyPress
      end
      object dfechapromesa: TRzDBDateTimeEdit
        Left = 656
        Top = 21
        Width = 139
        Height = 21
        DataSource = dspedidos
        DataField = 'FechaVTarjeta'
        DisabledColor = clWhite
        FocusColor = 16776176
        FrameColor = clBlue
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 3
        OnKeyPress = edcompaniaKeyPress
        EditType = etDate
        FlatButtons = True
      end
      object dfechacargo: TRzDBDateTimeEdit
        Left = 360
        Top = 176
        Width = 105
        Height = 21
        DataSource = dspedidos
        DataField = 'FechaVCargo'
        DisabledColor = clWhite
        FocusColor = 16776176
        FrameColor = clBlue
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 11
        OnKeyPress = edcompaniaKeyPress
        EditType = etDate
        FlatButtons = True
      end
      object btnNombre: TRzBitBtn
        Left = 563
        Top = 170
        Width = 78
        Height = 23
        Hint = 'Meses que se van aplicar al cargo'
        Caption = '&Meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = btnNombreClick
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
        ImageIndex = 6
        Images = DMAccesos.IBarraHerramientas
        NumGlyphs = 2
        Spacing = 3
      end
      object pnlClientesMTC: TRzPanel
        Left = 584
        Top = 8
        Width = 353
        Height = 185
        TabOrder = 13
        Visible = False
        object lblmeses: TRzLabel
          Left = 37
          Top = 20
          Width = 37
          Height = 13
          Caption = 'Meses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel4: TRzLabel
          Left = 141
          Top = 20
          Width = 23
          Height = 13
          Caption = 'A'#241'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object cxGrid1: TcxGrid
          Left = 8
          Top = 64
          Width = 345
          Height = 121
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            DataController.DataSource = dsclientesMTC
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NavigatorButtons.ConfirmDelete = False
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxano: TcxGridDBColumn
              Caption = 'A'#241'o'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              DataBinding.FieldName = 'ano'
            end
            object cxmes: TcxGridDBColumn
              Caption = 'Mes'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              DataBinding.FieldName = 'mes'
            end
            object cxusuario: TcxGridDBColumn
              Caption = 'Usuario'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              DataBinding.FieldName = 'usuario'
            end
            object cxfecha: TcxGridDBColumn
              Caption = 'Fecha'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              DataBinding.FieldName = 'fecha'
            end
            object cxhora: TcxGridDBColumn
              Caption = 'Hora'
              Options.Editing = False
              Options.Grouping = False
              Options.Moving = False
              DataBinding.FieldName = 'hora'
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object cbomes: TRzComboBox
          Left = 13
          Top = 34
          Width = 108
          Height = 21
          Hint = 'Mes a aplicar con tarjeta'
          CharCase = ecUpperCase
          Ctl3D = False
          DisabledColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FlatButtons = True
          FocusColor = clSkyBlue
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = cbomesChange
          OnNotInList = cbomesNotInList
          Items.Strings = (
            'ENERO'
            'FEBRERO'
            'MARZO'
            'ABRIL'
            'MAYO'
            'JUNIO'
            'JULIO'
            'AGOSTO'
            'SEPTIEMBRE'
            'OCTUBRE'
            'NOVIEMBRE'
            'DICIEMBRE')
        end
        object edano: TRzSpinEdit
          Left = 125
          Top = 34
          Width = 57
          Height = 21
          Max = 2030.000000000000000000
          Min = 2007.000000000000000000
          Value = 2007.000000000000000000
          TabOrder = 2
        end
        object btnagregar: TRzBitBtn
          Left = 182
          Top = 32
          Width = 78
          Hint = 'Agregar una bonificacion'
          Caption = 'Agregar'
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
          TabOrder = 3
          OnClick = btnagregarClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000830B0000830B00000001000000000000000000003300
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
            09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
            09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
            09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
            09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E809090909
            0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E809101010
            1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809101010
            1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809090909
            0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E8E8E8E8E8
            09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
            09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
            09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
            09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btneliminar: TRzBitBtn
          Left = 260
          Top = 32
          Width = 78
          Hint = 'Eliminar bonificacion seleccionada'
          Caption = 'Eliminar'
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
          TabOrder = 4
          OnClick = btneliminarClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000830B0000830B00000001000000000000000000003300
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
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
            0909090909090909E8E8E8E8818181818181818181818181E8E8E8E809101010
            1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809101010
            1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809090909
            0909090909090909E8E8E8E8818181818181818181818181E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btnsalir: TRzBitBtn
          Left = 271
          Top = 8
          Width = 66
          Hint = 'Cerrar Esta Pantalla'
          Caption = '&Cerrar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
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
      end
      object edctaban: TRzDBEdit
        Left = 14
        Top = 171
        Width = 260
        Height = 21
        DataSource = dspedidos
        DataField = 'ctaban'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 14
        OnKeyPress = edcompaniaKeyPress
      end
    end
    object chtarjeta: TRzDBCheckBox
      Left = 16
      Top = 16
      Width = 297
      Height = 17
      DataField = 'flcargo'
      DataSource = dspedidos
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Cargo Automatico a Tarjeta'
      Enabled = False
      TabOrder = 0
      OnClick = chtarjetaClick
      OnKeyPress = edcompaniaKeyPress
    end
  end
  object SqlDetclientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select * from DetClientes where idcliente = :clave')
    FetchAll = True
    Left = 560
    ParamData = <
      item
        DataType = ftInteger
        Name = 'clave'
      end>
    object SqlDetclientesidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'DetClientes.idcliente'
    end
    object SqlDetclientescompania: TStringField
      FieldName = 'compania'
      Origin = 'DetClientes.compania'
    end
    object SqlDetclientespaquete: TSmallintField
      FieldName = 'paquete'
      Origin = 'DetClientes.paquete'
    end
    object SqlDetclientesreviso: TStringField
      FieldName = 'reviso'
      Origin = 'DetClientes.reviso'
      Size = 40
    end
    object SqlDetclientesfecha_instalacion: TDateField
      FieldName = 'fecha_instalacion'
      Origin = 'DetClientes.fecha_instalacion'
    end
    object SqlDetclientesFechaReviso: TDateField
      FieldName = 'FechaReviso'
      Origin = 'DetClientes.FechaReviso'
    end
    object SqlDetclientescuota: TFloatField
      FieldName = 'cuota'
      Origin = 'DetClientes.cuota'
    end
    object SqlDetclientesflbital: TWordField
      FieldName = 'flbital'
      Origin = 'DetClientes.flbital'
    end
    object SqlDetclientesflcablemas: TWordField
      FieldName = 'flcablemas'
      Origin = 'DetClientes.flcablemas'
    end
    object SqlDetclientesflcargo: TWordField
      FieldName = 'flcargo'
      Origin = 'DetClientes.flcargo'
    end
    object SqlDetclientesfloficina: TWordField
      FieldName = 'floficina'
      Origin = 'DetClientes.floficina'
    end
    object SqlDetclientesfloxxo: TWordField
      FieldName = 'floxxo'
      Origin = 'DetClientes.floxxo'
    end
    object SqlDetclientesflcobranza: TWordField
      FieldName = 'flcobranza'
      Origin = 'DetClientes.flcobranza'
    end
    object SqlDetclientesflcosto: TFloatField
      FieldName = 'flcosto'
      Origin = 'DetClientes.flcosto'
    end
    object SqlDetclientesfrecuencia: TWordField
      FieldName = 'frecuencia'
      Origin = 'DetClientes.frecuencia'
    end
    object SqlDetclientescableado: TSmallintField
      FieldName = 'cableado'
      Origin = 'DetClientes.cableado'
    end
    object SqlDetclientesEstvulnera: TWordField
      FieldName = 'Estvulnera'
      Origin = 'DetClientes.Estvulnera'
    end
    object SqlDetclientesProtPerim1: TSmallintField
      FieldName = 'ProtPerim1'
      Origin = 'DetClientes.ProtPerim1'
    end
    object SqlDetclientesProtPerim2: TSmallintField
      FieldName = 'ProtPerim2'
      Origin = 'DetClientes.ProtPerim2'
    end
    object SqlDetclientesTrabDiasFest: TSmallintField
      FieldName = 'TrabDiasFest'
      Origin = 'DetClientes.TrabDiasFest'
    end
    object SqlDetclientesHorLunVier: TStringField
      FieldName = 'HorLunVier'
      Origin = 'DetClientes.HorLunVier'
      Size = 22
    end
    object SqlDetclientesHorSab: TStringField
      FieldName = 'HorSab'
      Origin = 'DetClientes.HorSab'
      Size = 10
    end
    object SqlDetclientesHorDom: TStringField
      FieldName = 'HorDom'
      Origin = 'DetClientes.HorDom'
      Size = 10
    end
    object SqlDetclientesCveCatastral: TStringField
      FieldName = 'CveCatastral'
      Origin = 'DetClientes.CveCatastral'
    end
    object SqlDetclientesNumCfe: TStringField
      FieldName = 'NumCfe'
      Origin = 'DetClientes.NumCfe'
      Size = 15
    end
    object SqlDetclientesTipoCred: TStringField
      FieldName = 'TipoCred'
      Origin = 'DetClientes.TipoCred'
      FixedChar = True
      Size = 1
    end
    object SqlDetclientesNumCredElec: TStringField
      FieldName = 'NumCredElec'
      Origin = 'DetClientes.NumCredElec'
      Size = 15
    end
    object SqlDetclientesNumLicMan: TFloatField
      FieldName = 'NumLicMan'
      Origin = 'DetClientes.NumLicMan'
    end
    object SqlDetclientesEdoLicMan: TStringField
      FieldName = 'EdoLicMan'
      Origin = 'DetClientes.EdoLicMan'
      Size = 30
    end
    object SqlDetclientesEscritura: TStringField
      FieldName = 'Escritura'
      Origin = 'DetClientes.Escritura'
      Size = 30
    end
    object SqlDetclientesNumNotario: TFloatField
      FieldName = 'NumNotario'
      Origin = 'DetClientes.NumNotario'
    end
    object SqlDetclientesFechaEscritura: TDateField
      FieldName = 'FechaEscritura'
      Origin = 'DetClientes.FechaEscritura'
    end
    object SqlDetclientesCiudad: TStringField
      FieldName = 'Ciudad'
      Origin = 'DetClientes.Ciudad'
      Size = 30
    end
    object SqlDetclientesNumPoder: TFloatField
      FieldName = 'NumPoder'
      Origin = 'DetClientes.NumPoder'
    end
    object SqlDetclientesNomArrendat: TStringField
      FieldName = 'NomArrendat'
      Origin = 'DetClientes.NomArrendat'
      Size = 50
    end
    object SqlDetclientesNumPasaporte: TFloatField
      FieldName = 'NumPasaporte'
      Origin = 'DetClientes.NumPasaporte'
    end
    object SqlDetclientesTipoPasaporte: TSmallintField
      FieldName = 'TipoPasaporte'
      Origin = 'DetClientes.TipoPasaporte'
    end
    object SqlDetclientesstatus: TSmallintField
      FieldName = 'status'
      Origin = 'DetClientes.status'
    end
    object SqlDetclientesusuario: TStringField
      FieldName = 'usuario'
      Origin = 'DetClientes.usuario'
      Size = 30
    end
    object SqlDetclientesfecha: TStringField
      FieldName = 'fecha'
      Origin = 'DetClientes.fecha'
      Size = 15
    end
    object SqlDetclienteshora: TStringField
      FieldName = 'hora'
      Origin = 'DetClientes.hora'
      Size = 15
    end
    object SqlDetclientesestado: TStringField
      FieldName = 'estado'
      Origin = 'DetClientes.estado'
      Size = 30
    end
    object SqlDetclientesobservaciones: TMemoField
      FieldName = 'observaciones'
      Origin = 'DetClientes.observaciones'
      BlobType = ftMemo
    end
    object SqlDetclientesNumTarjeta: TStringField
      FieldName = 'NumTarjeta'
      Origin = 'DetClientes.NumTarjeta'
      Size = 50
    end
    object SqlDetclientesNombreTarjeta: TStringField
      FieldName = 'NombreTarjeta'
      Origin = 'DetClientes.NombreTarjeta'
      Size = 60
    end
    object SqlDetclientesApaternoTarjeta: TStringField
      FieldName = 'ApaternoTarjeta'
      Origin = 'DetClientes.ApaternoTarjeta'
    end
    object SqlDetclientesAmaternoTarjeta: TStringField
      FieldName = 'AmaternoTarjeta'
      Origin = 'DetClientes.AmaternoTarjeta'
    end
    object SqlDetclientesEquipo: TFloatField
      FieldName = 'Equipo'
      Origin = 'DetClientes.Equipo'
    end
    object SqlDetclientesServicio: TFloatField
      FieldName = 'Servicio'
      Origin = 'DetClientes.Servicio'
    end
    object SqlDetclientesConceptoTarjeta: TStringField
      FieldName = 'ConceptoTarjeta'
      Size = 50
    end
    object SqlDetclientesTipoCargo: TStringField
      FieldName = 'TipoCargo'
    end
    object SqlDetclientesbanco: TStringField
      FieldName = 'banco'
      Size = 30
    end
    object SqlDetclientesclave: TStringField
      FieldName = 'clave'
      Size = 30
    end
    object SqlDetclientesFechaVTarjeta: TDateField
      FieldName = 'FechaVTarjeta'
    end
    object SqlDetclientesFechaVCargo: TDateField
      FieldName = 'FechaVCargo'
    end
    object SqlDetclientesTrafEmail: TSmallintField
      FieldName = 'TrafEmail'
    end
    object SqlDetclientesTrafEnPersona: TSmallintField
      FieldName = 'TrafEnPersona'
    end
    object SqlDetclientesNoTraf: TSmallintField
      FieldName = 'NoTraf'
    end
    object SqlDetclientesNombreCambio: TStringField
      FieldName = 'NombreCambio'
      Size = 40
    end
    object SqlDetclientesRelacionPuestoCambio: TStringField
      FieldName = 'RelacionPuestoCambio'
      Size = 30
    end
    object SqlDetclientesCalcamonia: TBooleanField
      FieldName = 'Calcamonia'
    end
    object SqlDetclientesAcrilico: TBooleanField
      FieldName = 'Acrilico'
    end
    object SqlDetclientesNumero: TBooleanField
      FieldName = 'Numero'
    end
    object SqlDetclientesctaban: TStringField
      FieldName = 'ctaban'
    end
  end
  object dspedidos: TDataSource
    DataSet = SqlDetclientes
    Left = 560
    Top = 48
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
    Left = 688
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
  object sqlclientesMTC: TMyQuery
    Connection = DMAccesos.conexion
    ReadOnly = True
    AfterOpen = sqlclientesMTCAfterOpen
    FetchAll = True
    Left = 792
    Top = 197
  end
  object dsclientesMTC: TDataSource
    DataSet = sqlclientesMTC
    Left = 888
    Top = 197
  end
end
