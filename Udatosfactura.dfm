object frmdatosfactura: Tfrmdatosfactura
  Left = 278
  Top = 161
  Width = 641
  Height = 463
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Datos de facturaci'#243'n del Cliente'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel9: TRzLabel
    Left = 0
    Top = 0
    Width = 195
    Height = 14
    Caption = 'Datos de Facturacion en Crescendo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
  end
  object RzLabel10: TRzLabel
    Left = 56
    Top = 48
    Width = 17
    Height = 14
    Caption = 'DIR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
  end
  object RzLabel11: TRzLabel
    Left = 24
    Top = 80
    Width = 49
    Height = 14
    Caption = 'COLONIA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
  end
  object RzLabel12: TRzLabel
    Left = 54
    Top = 104
    Width = 15
    Height = 14
    Caption = 'CP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
  end
  object RzLabel14: TRzLabel
    Left = 48
    Top = 128
    Width = 21
    Height = 14
    Caption = 'RFC'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
  end
  object RzLabel13: TRzLabel
    Left = 32
    Top = 24
    Width = 45
    Height = 14
    Caption = 'NOMBRE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
  end
  object gbfacturacion: TGroupBox
    Left = 0
    Top = 144
    Width = 625
    Height = 281
    Caption = 'Datos de facturaci'#243'n'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object lbnombre: TRzLabel
      Left = 8
      Top = 64
      Width = 44
      Height = 14
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel2: TRzLabel
      Left = 8
      Top = 112
      Width = 26
      Height = 14
      Caption = 'R.F.C'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel3: TRzLabel
      Left = 144
      Top = 112
      Width = 94
      Height = 14
      Caption = 'Direcci'#243'n Factura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel4: TRzLabel
      Left = 320
      Top = 160
      Width = 38
      Height = 14
      Caption = 'Ciudad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel5: TRzLabel
      Left = 256
      Top = 160
      Width = 15
      Height = 14
      Caption = 'CP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel6: TRzLabel
      Left = 88
      Top = 208
      Width = 57
      Height = 13
      Caption = 'Col. (Fracc.)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel7: TRzLabel
      Left = 536
      Top = 160
      Width = 48
      Height = 14
      Caption = 'Telefono'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel8: TRzLabel
      Left = 8
      Top = 160
      Width = 44
      Height = 14
      Caption = 'N'#250'mero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object lbpaterno: TRzLabel
      Left = 274
      Top = 64
      Width = 57
      Height = 14
      Caption = 'A. Paterno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object lbmaterno: TRzLabel
      Left = 451
      Top = 64
      Width = 60
      Height = 14
      Caption = 'A. Materno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object lbrazon: TRzLabel
      Left = 8
      Top = 64
      Width = 68
      Height = 14
      Caption = 'Razon Social'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel1: TRzLabel
      Left = 72
      Top = 160
      Width = 41
      Height = 14
      Caption = 'Colonia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      LightTextStyle = True
    end
    object RzLabel15: TRzLabel
      Left = 456
      Top = 160
      Width = 40
      Height = 13
      Caption = 'Estado'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel16: TRzLabel
      Left = 216
      Top = 201
      Width = 194
      Height = 52
      Caption = 
        'Nota: El Estado es el que se encontraba '#13#10'en  Cressendo y esta s' +
        'olo para quitar '#13#10'basura que afecta a las facturas del'#13#10'cliente.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbufh: TRzLabel
      Left = 8
      Top = 256
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
    object rgcasa: TRzRadioGroup
      Left = 8
      Top = 208
      Width = 193
      Height = 41
      Hint = 'Escoge la opcion que corresponda'
      BorderColor = clActiveCaption
      Caption = 'Casa'
      Color = clWhite
      Columns = 3
      FlatColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GroupStyle = gsStandard
      ItemFrameColor = clActiveCaption
      ItemHotTrack = True
      Items.Strings = (
        'Propia'
        'Rentada'
        'Otros')
      LightTextStyle = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOnEnter = True
      TabOrder = 13
    end
    object mismo_dom: TRzCheckBox
      Left = 16
      Top = 24
      Width = 233
      Height = 17
      Hint = 
        'Si la direccion del cliente es la misma para la factura , de cli' +
        'k?'
      Caption = 'Mismo Datos que tiene el Cliente'
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbUnchecked
      TabOrder = 0
      OnClick = mismo_domClick
    end
    object ednombre: TRzEdit
      Left = 8
      Top = 80
      Width = 249
      Height = 21
      Hint = 'Nombre del Cliente'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object eddir: TRzEdit
      Left = 144
      Top = 128
      Width = 473
      Height = 21
      Hint = 'Direcci'#243'n de la factura'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object edcd: TRzEdit
      Left = 320
      Top = 176
      Width = 121
      Height = 21
      Hint = 'Ciudad '
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnEnter = edcdEnter
    end
    object edtel: TRzEdit
      Left = 536
      Top = 176
      Width = 81
      Height = 21
      Hint = 'T'#233'lefono'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnKeyPress = edtelKeyPress
    end
    object btnalta: TRzBitBtn
      Left = 416
      Top = 214
      Width = 102
      Height = 40
      Hint = ' '
      Caption = '&Guardar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
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
      ImageIndex = 1
      Images = DMAccesos.ilopciones
      NumGlyphs = 2
    end
    object btncerrar: TRzBitBtn
      Left = 520
      Top = 214
      Width = 94
      Height = 40
      Hint = 'Cerrar ventana'
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = btncerrarClick
      Kind = bkClose
    end
    object ednum: TRzEdit
      Left = 8
      Top = 176
      Width = 57
      Height = 21
      Hint = 'N'#250'mero'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnKeyPress = ednumKeyPress
    end
    object edpaterno: TRzEdit
      Left = 272
      Top = 80
      Width = 169
      Height = 21
      Hint = 'Apellido Paterno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnKeyPress = edtelKeyPress
    end
    object edmaterno: TRzEdit
      Left = 448
      Top = 80
      Width = 161
      Height = 21
      Hint = 'Apellido Materno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
      OnKeyPress = edtelKeyPress
    end
    object edrazon_social: TRzEdit
      Left = 6
      Top = 80
      Width = 257
      Height = 21
      Hint = 'Nombre de la Raz'#243'n Social'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object rgtipo: TRzRadioGroup
      Left = 480
      Top = 16
      Width = 137
      Height = 41
      Hint = 'Escoge la opcion que corresponda'
      BorderColor = clActiveCaption
      Caption = 'Tipo de Persona'
      Color = clWhite
      Columns = 3
      FlatColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GroupStyle = gsStandard
      ItemHotTrack = True
      ItemIndex = 0
      Items.Strings = (
        'F'#237'sica'
        'Moral')
      LightTextStyle = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOnEnter = True
      TabOrder = 1
      OnClick = rgtipoClick
    end
    object lbcolonias: TRzComboBox
      Left = 73
      Top = 176
      Width = 161
      Height = 21
      Hint = 'Catalogo de colonias'
      Ctl3D = False
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnMatch = lbcoloniasMatch
      OnSelect = lbcoloniasMatch
    end
    object edcp: TRzEdit
      Left = 244
      Top = 177
      Width = 65
      Height = 21
      Hint = 'C'#243'digo Postal'
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      MaxLength = 5
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
    object edrfc: TRzEdit
      Left = 6
      Top = 128
      Width = 133
      Height = 21
      Hint = 'Apellido Materno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 6
      OnExit = edrfcExit
      OnKeyPress = edtelKeyPress
    end
    object ededo: TRzEdit
      Left = 448
      Top = 176
      Width = 81
      Height = 21
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 16
    end
  end
  object edd: TRzEdit
    Left = 92
    Top = 48
    Width = 531
    Height = 21
    Hint = 'Nombre de la Raz'#243'n Social'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 1
  end
  object edc: TRzEdit
    Left = 92
    Top = 72
    Width = 531
    Height = 21
    Hint = 'Nombre de la Raz'#243'n Social'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 2
  end
  object edcpostal: TRzEdit
    Left = 92
    Top = 96
    Width = 531
    Height = 21
    Hint = 'Nombre de la Raz'#243'n Social'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 3
  end
  object edrfcc: TRzEdit
    Left = 92
    Top = 120
    Width = 531
    Height = 21
    Hint = 'Nombre de la Raz'#243'n Social'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 4
  end
  object edNombreCres: TRzEdit
    Left = 92
    Top = 24
    Width = 531
    Height = 21
    Hint = 'Nombre de la Raz'#243'n Social'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 5
  end
  object SQLcolonias: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select colonias.nombre,colonias.idcol,colonias.cp,col_sector.ids' +
        'ector '
      
        'from  colonias inner join col_sector on (colonias.idcol=col_sect' +
        'or.idcol) order by colonias.nombre')
    Options.FullRefresh = True
    FetchAll = True
    Left = 400
    Top = 148
    object SQLcoloniasnombre: TStringField
      FieldName = 'nombre'
      Size = 250
    end
    object SQLcoloniasidcol: TIntegerField
      FieldName = 'idcol'
    end
    object SQLcoloniascp: TIntegerField
      FieldName = 'cp'
    end
    object SQLcoloniasidsector: TSmallintField
      FieldName = 'idsector'
    end
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      '')
    Options.FullRefresh = True
    FetchAll = True
    Left = 352
    Top = 148
  end
end
