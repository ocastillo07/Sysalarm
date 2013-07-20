object frmart_comp: Tfrmart_comp
  Left = 198
  Top = 120
  Width = 737
  Height = 607
  Hint = 'Pantallade Articulos Compuestos'
  AutoSize = True
  Caption = 'Pantalla de Articulos Compuestos'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel18: TRzLabel
    Left = 4
    Top = 16
    Width = 66
    Height = 13
    Caption = 'Buscar Clave:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    FlatColor = clBtnFace
  end
  object Label2: TLabel
    Left = 400
    Top = 360
    Width = 294
    Height = 26
    Caption = 
      '*Presione la Tecla (+) para incrementar la cantidad de articulos' +
      ' del rengl'#243'n seleccionado.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 400
    Top = 389
    Width = 313
    Height = 26
    Caption = 
      '*Presione la Tecla (-) para decrementar la cantidad de articulos' +
      ' del rengl'#243'n seleccionado.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 400
    Top = 418
    Width = 283
    Height = 26
    Caption = '*Presione la Tecla (Supr) para eliminar el rengl'#243'n seleccionado.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 400
    Top = 450
    Width = 246
    Height = 13
    Caption = '*Doble click en el registro para modificarlo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object lbufh: TRzLabel
    Left = 408
    Top = 472
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
  object gbdatos: TGroupBox
    Left = 0
    Top = 32
    Width = 721
    Height = 129
    Caption = 'Articulos Compuestos'
    Color = clBtnHighlight
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object RzLabel1: TRzLabel
      Left = 4
      Top = 16
      Width = 33
      Height = 14
      Caption = 'Clave:'
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
      Left = 132
      Top = 16
      Width = 98
      Height = 14
      Caption = 'Codigo de Barras:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 296
      Top = 17
      Width = 47
      Height = 14
      Caption = 'Nombre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel11: TRzLabel
      Left = 5
      Top = 65
      Width = 68
      Height = 14
      Caption = 'Descripcion:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edcbarras: TRzDBEdit
      Left = 131
      Top = 34
      Width = 158
      Height = 22
      Hint = 'Codigo de Barras del Paquete'
      DataSource = dsarticulos
      DataField = 'cod_barras'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = edcbarrasKeyPress
    end
    object edclave: TRzDBEdit
      Left = 3
      Top = 34
      Width = 122
      Height = 22
      Hint = 'Codigo Clave del Paquete (Numero y Letras)'
      DataSource = dsarticulos
      DataField = 'cod_cve'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edclaveExit
      OnKeyPress = edclaveKeyPress
    end
    object ednombre: TRzDBEdit
      Left = 294
      Top = 33
      Width = 419
      Height = 22
      Hint = 'Nombre del Paquete'
      DataSource = dsarticulos
      DataField = 'nombre'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = edcbarrasKeyPress
    end
    object eddescrip: TRzDBRichEdit
      Left = 8
      Top = 80
      Width = 705
      Height = 41
      Hint = 'Descripci'#243'n del paquete'
      DataField = 'descripcion'
      DataSource = dsarticulos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 3
      OnEnter = eddescripEnter
      OnExit = eddescripExit
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameVisible = True
    end
  end
  object navegador: TRzDBNavigator
    Left = 175
    Top = 0
    Width = 316
    Height = 25
    DataSource = dsarticulos
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'Primer Kit'
      'Anterior Kit'
      'Siguiente Kit'
      'Ultimo Kit')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = navegadorClick
    Color = clWhite
  end
  object gbfinancieros: TGroupBox
    Left = 8
    Top = 352
    Width = 377
    Height = 217
    Caption = 'Datos Financieros'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    object RzLabel9: TRzLabel
      Left = 10
      Top = 18
      Width = 31
      Height = 14
      Caption = 'Costo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel10: TRzLabel
      Left = 122
      Top = 17
      Width = 20
      Height = 14
      Caption = 'IVA:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel24: TRzLabel
      Left = 3
      Top = 187
      Width = 55
      Height = 14
      Caption = 'Descuento:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel25: TRzLabel
      Left = 125
      Top = 187
      Width = 33
      Height = 14
      Caption = 'Precio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel34: TRzLabel
      Left = 253
      Top = 186
      Width = 26
      Height = 14
      Caption = '+ Iva:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel39: TRzLabel
      Left = 166
      Top = 17
      Width = 106
      Height = 14
      Caption = 'Tiempo de Instalacion:'
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
      Left = 259
      Top = 35
      Width = 21
      Height = 16
      Caption = 'Hrs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object ediva: TRzDBNumericEdit
      Left = 120
      Top = 34
      Width = 41
      Height = 22
      Hint = 'Porcentaje de iva que aplica'
      DataSource = dsarticulos
      DataField = 'iva'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnEnter = edivaEnter
      OnExit = edivaExit
      OnKeyPress = edivaKeyPress
      AllowBlank = False
      Max = 100.000000000000000000
      DisplayFormat = ',0.00'
    end
    object edcosto: TRzDBNumericEdit
      Left = 8
      Top = 34
      Width = 105
      Height = 22
      Hint = 'Costo de todos los articulos del paquete'
      DataSource = dsarticulos
      DataField = 'costo'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameHotTrack = True
      FrameStyle = fsButtonDown
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = edcostoEnter
      OnExit = edcostoExit
      OnKeyPress = edcostoKeyPress
      AllowBlank = False
      IntegersOnly = False
      Max = 10000.000000000000000000
      Min = -10000.000000000000000000
      Value = -10000.000000000000000000
      DisplayFormat = ',0.00'
    end
    object chkAplicaDesc: TRzDBCheckBox
      Left = 8
      Top = 168
      Width = 153
      Height = 17
      Hint = 'Indica si se aplica o no el descuento'
      DataField = 'aplica_desc'
      DataSource = dsarticulos
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Aplica descuento'
      DisabledColor = clWhite
      Enabled = False
      HotTrack = True
      TabOrder = 3
    end
    object eddscto: TRzDBNumericEdit
      Left = 72
      Top = 186
      Width = 50
      Height = 22
      Hint = 'Porcentaje de descuento que se le aplicara'
      DataSource = dsarticulos
      DataField = 'desc_esp'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnExit = eddsctoExit
      OnKeyPress = eddsctoKeyPress
      AllowBlank = False
      Max = 100.000000000000000000
      DisplayFormat = '0.00,%'
    end
    object edPrecioDscto: TRzDBNumericEdit
      Left = 165
      Top = 186
      Width = 76
      Height = 22
      DataSource = dsarticulos
      DataField = 'precio_desc'
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameHotTrack = True
      FrameStyle = fsButtonDown
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
      OnKeyPress = edPrecioDsctoKeyPress
      AllowBlank = False
      IntegersOnly = False
      Min = -10000.000000000000000000
      Value = -10000.000000000000000000
      DisplayFormat = '$,0.00'
    end
    object gbutilidades: TGroupBox
      Left = 7
      Top = 58
      Width = 362
      Height = 111
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      object RzLabel12: TRzLabel
        Left = 5
        Top = 11
        Width = 56
        Height = 14
        Caption = '%Utilidad a:'
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
        Left = 5
        Top = 35
        Width = 56
        Height = 14
        Caption = '%Utilidad b:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel17: TRzLabel
        Left = 5
        Top = 59
        Width = 56
        Height = 14
        Caption = '%Utilidad c:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel19: TRzLabel
        Left = 5
        Top = 83
        Width = 56
        Height = 14
        Caption = '%Utilidad d:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel20: TRzLabel
        Left = 114
        Top = 11
        Width = 56
        Height = 14
        Caption = 'Precio a: $'
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
        Left = 114
        Top = 35
        Width = 57
        Height = 14
        Caption = 'Precio b: $'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel22: TRzLabel
        Left = 114
        Top = 59
        Width = 56
        Height = 14
        Caption = 'Precio c: $'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel23: TRzLabel
        Left = 114
        Top = 83
        Width = 57
        Height = 14
        Caption = 'Precio d: $'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel28: TRzLabel
        Left = 261
        Top = 11
        Width = 26
        Height = 14
        Caption = '+ Iva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel33: TRzLabel
        Left = 261
        Top = 80
        Width = 26
        Height = 14
        Caption = '+ Iva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel32: TRzLabel
        Left = 261
        Top = 59
        Width = 26
        Height = 14
        Caption = '+ Iva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel29: TRzLabel
        Left = 261
        Top = 35
        Width = 26
        Height = 14
        Caption = '+ Iva:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edutild: TRzDBNumericEdit
        Left = 66
        Top = 82
        Width = 45
        Height = 22
        Hint = 'Porcentaje de utlidad d'
        DataSource = dsarticulos
        DataField = 'utild'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = 16776176
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnExit = edutildExit
        OnKeyPress = edutildKeyPress
        AllowBlank = False
        Max = 300.000000000000000000
        DisplayFormat = '0.00,'
      end
      object edutilc: TRzDBNumericEdit
        Left = 66
        Top = 58
        Width = 45
        Height = 22
        Hint = 'Porcentaje de utlidad c'
        DataSource = dsarticulos
        DataField = 'utilc'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = 16776176
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnExit = edutilcExit
        OnKeyPress = edutilcKeyPress
        AllowBlank = False
        Max = 300.000000000000000000
        DisplayFormat = '0.00,'
      end
      object edutilb: TRzDBNumericEdit
        Left = 66
        Top = 34
        Width = 45
        Height = 22
        Hint = 'Porcentaje de utlidad b'
        DataSource = dsarticulos
        DataField = 'utilb'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = 16776176
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edutilbExit
        OnKeyPress = edutilbKeyPress
        AllowBlank = False
        Max = 300.000000000000000000
        DisplayFormat = '0.00,'
      end
      object edutila: TRzDBNumericEdit
        Left = 66
        Top = 10
        Width = 45
        Height = 22
        Hint = 'Porcentaje de utlidad a'
        DataSource = dsarticulos
        DataField = 'utila'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = 16776176
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = edutilaExit
        OnKeyPress = edutilaKeyPress
        AllowBlank = False
        Max = 300.000000000000000000
        DisplayFormat = '0.00,'
      end
      object edPrecioConIvaa: TRzNumericEdit
        Left = 294
        Top = 9
        Width = 65
        Height = 22
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 4
        IntegersOnly = False
        Min = -10000.000000000000000000
        DisplayFormat = '$,0.00'
      end
      object edPrecioConIvab: TRzNumericEdit
        Left = 294
        Top = 33
        Width = 65
        Height = 22
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 5
        IntegersOnly = False
        Min = -10000.000000000000000000
        DisplayFormat = '$,0.00'
      end
      object edPrecioConIvac: TRzNumericEdit
        Left = 294
        Top = 57
        Width = 65
        Height = 22
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 6
        IntegersOnly = False
        Min = -10000.000000000000000000
        DisplayFormat = '$,0.00'
      end
      object edPrecioConIvad: TRzNumericEdit
        Left = 294
        Top = 81
        Width = 65
        Height = 22
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 7
        IntegersOnly = False
        Min = -10000.000000000000000000
        DisplayFormat = '$,0.00'
      end
      object precioa: TRzDBEdit
        Left = 176
        Top = 8
        Width = 80
        Height = 24
        DataSource = dsarticulos
        DataField = 'precioa'
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 8
        OnExit = precioaExit
      end
      object preciob: TRzDBEdit
        Left = 176
        Top = 32
        Width = 80
        Height = 24
        DataSource = dsarticulos
        DataField = 'preciob'
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 9
        OnExit = preciobExit
      end
      object precioc: TRzDBEdit
        Left = 176
        Top = 56
        Width = 80
        Height = 24
        DataSource = dsarticulos
        DataField = 'precioc'
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 10
        OnExit = preciocExit
      end
      object preciod: TRzDBEdit
        Left = 176
        Top = 80
        Width = 80
        Height = 24
        DataSource = dsarticulos
        DataField = 'preciod'
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 11
        OnExit = preciodExit
      end
    end
    object edPrecioDsctoIva: TRzNumericEdit
      Left = 286
      Top = 184
      Width = 65
      Height = 22
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      TabOrder = 7
      IntegersOnly = False
      Min = -10000.000000000000000000
      DisplayFormat = '$,0.00'
    end
    object edtinstalacion: TRzDBNumericEdit
      Left = 170
      Top = 34
      Width = 87
      Height = 22
      Hint = 'Tiempo de instalaci'#243'n del paquete en promedio'
      DataSource = dsarticulos
      DataField = 'tinstalacion'
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = edtinstalacionKeyPress
      IntegersOnly = False
      Max = 100.000000000000000000
      DisplayFormat = '#.##'
    end
  end
  object btnalta: TRzBitBtn
    Left = 520
    Top = 504
    Width = 99
    Height = 30
    Hint = 'Dar de Alta a un Paquete'
    ModalResult = 1
    Caption = '&Alta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnaltaClick
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E
      5E5E5E5E5E5E5E5EE8E8E8E8818181818181818181818181E8E8E8E85ED7D7D7
      D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
      E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
      D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
      E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
      D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
      E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
      D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
      E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
      D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
      E3E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7
      D7D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E881E8E8E8E8E85ED7D7D7
      D7D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E
      5E5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    ImageIndex = 5
    NumGlyphs = 2
  end
  object btnmodificar: TRzBitBtn
    Left = 619
    Top = 504
    Width = 98
    Height = 30
    Hint = 'Editar los datos del Paquete Actual'
    ModalResult = 1
    Caption = '&Editar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
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
  end
  object btnborrar: TRzBitBtn
    Left = 519
    Top = 536
    Width = 99
    Height = 30
    Hint = 'Elimina el Paquete actual'
    ModalResult = 1
    Caption = '&Borrar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnborrarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000530D0000530D00000001000000000000000000003300
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
      0000000000000000000000000000000000000000000000000000E8D7E8D7D7E8
      E8E8E8E8E8E8E8E8E8E8E8D7E8D7D7E8E8E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7
      D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7DF
      6C6C6CE8E8E8E8E8E8E8D7D7D7D7D7DF565656E8E8E8E8E8E8E8D7D7D7D7DF90
      6C6C6C6CE8E8E8E8E8E8D7D7D7D7DF8156565656E8E8E8E8E8E8D7D7D7D79090
      906C6C6C6CE8E8E8E8E8D7D7D7D781818156565656E8E8E8E8E8D7E8D7E8B490
      90906C6C6C7EE8E8E8E8D7E8D7E8AC81818156565656E8E8E8E8E8E8E8E8B4B4
      9090906C7EA87EE8E8E8E8E8E8E8ACAC81818156568156E8E8E8E8E8E8E8E8B4
      B490907EA8A8A87EE8E8E8E8E8E8E8ACAC81815681818156E8E8E8E8E8E8E8E8
      B4D8A8D2D2A8A8A87EE8E8E8E8E8E8E8AC5681ACAC81818156E8E8E8E8E8E8E8
      E8A8D2D7DED2A8A8A87EE8E8E8E8E8E8E881ACD7DEAC81818156E8E8E8E8E8E8
      E8E8A8D2D7DED2A87E09E8E8E8E8E8E8E8E881ACD7DEAC815656E8E8E8E8E8E8
      E8E8E8A8D2D7D27E1009E8E8E8E8E8E8E8E8E881ACD7AC568156E8E8E8E8E8E8
      E8E8E8E8A8D2A8101010E8E8E8E8E8E8E8E8E8E881AC81818181E8E8E8E8E8E8
      E8E8E8E8E8A817171010E8E8E8E8E8E8E8E8E8E8E881ACAC8181E8E8E8E8E8E8
      E8E8E8E8E8E809171710E8E8E8E8E8E8E8E8E8E8E8E856ACAC81E8E8E8E8E8E8
      E8E8E8E8E8E8E8091717E8E8E8E8E8E8E8E8E8E8E8E8E856ACAC}
    ImageIndex = 2
    NumGlyphs = 2
  end
  object btncancelar: TRzBitBtn
    Left = 619
    Top = 536
    Width = 98
    Height = 30
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 9
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
    Top = 247
    Width = 721
    Height = 105
    Hint = '+ Incrementa Cant., - Decrementa Cant., SUPR Elimina Registro'
    Align = alCustom
    Enabled = False
    TabOrder = 4
    LookAndFeel.Kind = lfUltraFlat
    object RejillaDBTableView1: TcxGridDBTableView
      OnDblClick = RejillaDBTableView1DblClick
      OnKeyPress = RejillaDBTableView1KeyPress
      OnKeyUp = RejillaDBTableView1KeyUp
      DataController.DataSource = DsRejilla
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
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Preview.Visible = True
      object clave: TcxGridDBColumn
        Caption = 'Clave'
        Options.Editing = False
        Options.Moving = False
        Width = 84
        DataBinding.FieldName = 'cod_cve'
      end
      object nombre: TcxGridDBColumn
        Caption = 'Nombre'
        Options.Editing = False
        Options.Moving = False
        Width = 255
        DataBinding.FieldName = 'nombre'
      end
      object cant: TcxGridDBColumn
        Caption = 'Cant'
        Options.Editing = False
        Options.Moving = False
        Width = 53
        DataBinding.FieldName = 'cant'
      end
      object piezas: TcxGridDBColumn
        Caption = 'Piezas'
        DataBinding.FieldName = 'piezas'
      end
      object util: TcxGridDBColumn
        Caption = 'Util'
        Visible = False
        DataBinding.FieldName = 'utilidad'
      end
      object dbiva: TcxGridDBColumn
        Caption = 'Iva'
        Visible = False
        Options.Editing = False
        Options.Moving = False
        Width = 48
        DataBinding.FieldName = 'iva'
      end
      object descuento: TcxGridDBColumn
        Caption = 'Desc'
        Visible = False
        Options.Editing = False
        Options.Moving = False
        Width = 53
        DataBinding.FieldName = 'descuento'
      end
      object aplica_desc: TcxGridDBColumn
        Caption = 'Aplic Desc'
        Visible = False
        Options.Editing = False
        Options.Moving = False
        Width = 78
        DataBinding.FieldName = 'aplica_desc'
      end
      object tiempo: TcxGridDBColumn
        Caption = 'Tiempo Inst'
        Width = 77
        DataBinding.FieldName = 'tinstalacion'
      end
      object precio_costo: TcxGridDBColumn
        Caption = 'Precio Unidad'
        Options.Editing = False
        Options.Moving = False
        Width = 80
        DataBinding.FieldName = 'costo'
      end
      object total: TcxGridDBColumn
        Options.Editing = False
        Options.Moving = False
        Width = 89
        DataBinding.FieldName = 'Total'
      end
    end
    object RejillaLevel1: TcxGridLevel
      GridView = RejillaDBTableView1
    end
  end
  object edbuscar: TRzButtonEdit
    Left = 75
    Top = 6
    Width = 101
    Height = 22
    Hint = 'Buscar en el catalogo'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = edbuscarChange
    OnKeyPress = edbuscarKeyPress
    ButtonKind = bkFind
    ButtonShortCut = 119
    FlatButtons = True
    OnButtonClick = edbuscarButtonClick
  end
  object gbarticulo: TGroupBox
    Left = 2
    Top = 160
    Width = 719
    Height = 89
    Caption = 'Datos del Articulo'
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object RzLabel6: TRzLabel
      Left = 584
      Top = 17
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
      Left = 556
      Top = 17
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
      Top = 17
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
    object RzLabel13: TRzLabel
      Left = 157
      Top = 17
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
    object RzLabel14: TRzLabel
      Left = 423
      Top = 17
      Width = 33
      Height = 14
      Caption = 'Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 493
      Top = 17
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
      Left = 648
      Top = 48
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
    object edcantidad: TRzNumericEdit
      Left = 585
      Top = 35
      Width = 47
      Height = 22
      Hint = 'Teclee la cantidad de Articulos'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = edcantidadChange
      OnKeyPress = edcantidadKeyPress
      Max = 1000.000000000000000000
      Min = -1000.000000000000000000
      Value = 1.000000000000000000
      DisplayFormat = ',0;(,0)'
    end
    object chkpiezas: TCheckBox
      Left = 559
      Top = 37
      Width = 16
      Height = 25
      Hint = 'Si se usan en piezas '
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object btnagregar: TRzBitBtn
      Left = 640
      Top = 21
      Width = 73
      Hint = 'Agregar el articulo al paquete'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object edDescripcion: TRzEdit
      Left = 159
      Top = 32
      Width = 252
      Height = 22
      Hint = 'Descripci'#243'n del articulo'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object EdCosto_unidad: TRzEdit
      Left = 423
      Top = 32
      Width = 66
      Height = 22
      Hint = 'Costo del articulo'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object edTInsta: TRzEdit
      Left = 496
      Top = 32
      Width = 43
      Height = 22
      Hint = 'Tiempo de instalaci'#243'n del articulo'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object edcodigo: TRzButtonEdit
      Left = 3
      Top = 33
      Width = 150
      Height = 22
      Hint = 'Articulo a buscar'
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
      TabOrder = 0
      OnEnter = edcodigoEnter
      OnKeyPress = edcodigoKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edcodigoButtonClick
    end
  end
  object tbherramientas: TToolBar
    Left = 540
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
    TabOrder = 10
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
  object tblarticulos: TMyTable
    TableName = 'articulos'
    Connection = DMAccesos.conexion
    AfterPost = tblarticulosAfterPost
    FilterSQL = 'paquete =1 order by cod_cve'
    FetchAll = True
    Left = 417
    Top = 501
    object tblarticuloscod_cve: TStringField
      FieldName = 'cod_cve'
      Size = 30
    end
    object tblarticuloscod_barras: TStringField
      FieldName = 'cod_barras'
      Size = 30
    end
    object tblarticulosnombre: TStringField
      FieldName = 'nombre'
      Size = 50
    end
    object tblarticulosiva: TFloatField
      FieldName = 'iva'
    end
    object tblarticuloscosto: TFloatField
      FieldName = 'costo'
    end
    object tblarticulosutila: TFloatField
      FieldName = 'utila'
    end
    object tblarticulosutilb: TFloatField
      FieldName = 'utilb'
    end
    object tblarticulosutilc: TFloatField
      FieldName = 'utilc'
    end
    object tblarticulosutild: TFloatField
      FieldName = 'utild'
    end
    object tblarticulosprecioa: TFloatField
      FieldName = 'precioa'
    end
    object tblarticulospreciob: TFloatField
      FieldName = 'preciob'
    end
    object tblarticulosprecioc: TFloatField
      FieldName = 'precioc'
    end
    object tblarticulospreciod: TFloatField
      FieldName = 'preciod'
    end
    object tblarticulosdesc_esp: TFloatField
      FieldName = 'desc_esp'
    end
    object tblarticulosaplica_desc: TSmallintField
      FieldName = 'aplica_desc'
    end
    object tblarticulosunidades_caja: TIntegerField
      FieldName = 'unidades_caja'
    end
    object tblarticulospiezasxunidad: TIntegerField
      FieldName = 'piezasxunidad'
    end
    object tblarticulosusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object tblarticulosfecha: TDateField
      FieldName = 'fecha'
    end
    object tblarticuloshora: TStringField
      FieldName = 'hora'
      Size = 14
    end
    object tblarticulosprecio_desc: TFloatField
      FieldName = 'precio_desc'
    end
    object tblarticulostinstalacion: TFloatField
      FieldName = 'tinstalacion'
    end
    object tblarticulosservicio: TSmallintField
      FieldName = 'servicio'
    end
    object tblarticulospaquete: TSmallintField
      FieldName = 'paquete'
    end
    object tblarticulosdescripcion: TMemoField
      FieldName = 'descripcion'
      BlobType = ftMemo
    end
  end
  object dsarticulos: TDataSource
    DataSet = tblarticulos
    Left = 417
    Top = 533
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 480
    Top = 501
  end
  object Sqlrejillaalta: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select '
      'art_compuestos.cod_paq,'
      'art_compuestos.cod_cve,'
      'art_compuestos.piezas,'
      'art_compuestos.cant,'
      'articulos.nombre,'
      'articulos.precioa,'
      'articulos.tinstalacion as tiempo,'
      'articulos.piezasxunidad,'
      
        'if (art_compuestos.piezas > 0,((articulos.precioa/articulos.piez' +
        'asxunidad) * art_compuestos.piezas),(art_compuestos.cant * artic' +
        'ulos.precioa)) as Total,'
      
        'if (art_compuestos.piezas > 0,ROUND(((articulos.tinstalacion/art' +
        'iculos.piezasxunidad)*art_compuestos.piezas),3),ROUND((articulos' +
        '.tinstalacion*art_compuestos.cant),3))  as tinstalacion'
      ''
      'from'
      
        'art_compuestos inner join articulos on art_compuestos.cod_cve = ' +
        'articulos.cod_cve'
      'where '
      'art_compuestos.cod_paq=:Id'
      ''
      'order by  art_compuestos.cod_cve ')
    ReadOnly = True
    FetchAll = True
    Left = 448
    Top = 501
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end>
  end
  object DsRejilla: TDataSource
    DataSet = Sqlrejillaalta
    Left = 448
    Top = 533
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 512
  end
end
