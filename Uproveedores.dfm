object frmproveedores: Tfrmproveedores
  Left = 281
  Top = 164
  Width = 832
  Height = 443
  Hint = 'Pantalla de Proveedores'
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Datos de Proveedores'
  Color = clWhite
  TransparentColor = True
  TransparentColorValue = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblclave: TRzLabel
    Left = 7
    Top = 14
    Width = 37
    Height = 13
    Caption = 'Clave:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lbufh: TRzLabel
    Left = 10
    Top = 370
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
  object btnalta: TRzBitBtn
    Left = 400
    Top = 369
    Width = 100
    Height = 32
    Hint = 'Dar de Alta a un Proveedor'
    ModalResult = 1
    Caption = '&Alta'
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
    TabOrder = 0
    OnClick = btnaltaClick
    ImageIndex = 5
    Images = DMAccesos.ilopciones
  end
  object btnborrar: TRzBitBtn
    Left = 503
    Top = 369
    Width = 100
    Height = 32
    Hint = 'Elimina el Proveedor actual'
    ModalResult = 1
    Caption = '&Borrar'
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
    TabOrder = 1
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
  object btnmodificar: TRzBitBtn
    Left = 606
    Top = 369
    Width = 100
    Height = 32
    Hint = 'Editar los datos del Proveedor Actual'
    ModalResult = 1
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
    TabOrder = 2
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
    Images = DMAccesos.ilopciones
    NumGlyphs = 2
  end
  object btncancelar: TRzBitBtn
    Left = 709
    Top = 369
    Width = 100
    Height = 32
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
  object gbproveedores: TGroupBox
    Left = 0
    Top = 29
    Width = 809
    Height = 332
    Caption = 'Datos del Proveedor'
    Color = clWhite
    Enabled = False
    ParentColor = False
    TabOrder = 4
    object RzLabel2: TRzLabel
      Left = 479
      Top = 75
      Width = 48
      Height = 13
      Caption = 'Numero:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcp: TRzLabel
      Left = 702
      Top = 74
      Width = 82
      Height = 13
      Caption = 'Codigo postal:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcalle: TRzLabel
      Left = 276
      Top = 76
      Width = 33
      Height = 13
      Caption = 'Calle:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblciudad: TRzLabel
      Left = 16
      Top = 122
      Width = 44
      Height = 13
      Caption = 'Ciudad:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblestado: TRzLabel
      Left = 152
      Top = 120
      Width = 44
      Height = 13
      Caption = 'Estado:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcolonia: TRzLabel
      Left = 545
      Top = 76
      Width = 47
      Height = 13
      Caption = 'Colonia:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblalta: TRzLabel
      Left = 648
      Top = 120
      Width = 27
      Height = 13
      Caption = 'Alta:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblamaterno: TRzLabel
      Left = 672
      Top = 26
      Width = 100
      Height = 13
      Caption = 'Apellido Materno:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblapaterno: TRzLabel
      Left = 520
      Top = 27
      Width = 98
      Height = 13
      Caption = 'Apellido Paterno:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblplazo: TRzLabel
      Left = 318
      Top = 121
      Width = 48
      Height = 13
      Caption = 'D. Cred:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbliva: TRzLabel
      Left = 591
      Top = 121
      Width = 23
      Height = 13
      Caption = 'Iva:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblrazon: TRzLabel
      Left = 13
      Top = 27
      Width = 80
      Height = 13
      Caption = 'Razon Social:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcomentarios: TRzLabel
      Left = 14
      Top = 208
      Width = 86
      Height = 13
      Caption = 'Comentarios:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      Rotation = roFlat
    end
    object lblnombre: TRzLabel
      Left = 376
      Top = 27
      Width = 62
      Height = 13
      Caption = 'Nombre(s):'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel1: TRzLabel
      Left = 13
      Top = 72
      Width = 29
      Height = 13
      Caption = 'RFC:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object eddias_entrega: TRzLabel
      Left = 496
      Top = 121
      Width = 66
      Height = 13
      Hint = 'Dias que se tarda en entregar'
      Caption = 'D. Entrega:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcurp: TRzLabel
      Left = 135
      Top = 74
      Width = 39
      Height = 13
      Caption = 'CURP:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 383
      Top = 121
      Width = 45
      Height = 13
      Caption = 'Credito:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblestatus: TRzLabel
      Left = 15
      Top = 169
      Width = 47
      Height = 13
      Caption = 'Estatus:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object Label1: TLabel
      Left = 208
      Top = 168
      Width = 32
      Height = 13
      AutoSize = False
      Caption = 'Email'
    end
    object Label2: TLabel
      Left = 520
      Top = 168
      Width = 89
      Height = 13
      AutoSize = False
      Caption = 'Nacionalidad:'
    end
    object edciudad: TRzDBEdit
      Left = 12
      Top = 136
      Width = 128
      Height = 21
      Hint = 'Ciudad donde se encuentra ubicado'
      DataSource = DSproveedores
      DataField = 'ciudad'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 9
      OnEnter = edciudadEnter
      OnKeyPress = edmskrfcKeyPress
    end
    object edcalle: TRzDBEdit
      Left = 275
      Top = 87
      Width = 190
      Height = 21
      Hint = 'Calle donde vive el Proveedor'
      DataSource = DSproveedores
      DataField = 'calle'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 6
      OnKeyPress = edmskrfcKeyPress
    end
    object edestado: TRzDBEdit
      Left = 151
      Top = 136
      Width = 145
      Height = 21
      Hint = 'Estado donde esta ubicado'
      DataSource = DSproveedores
      DataField = 'estado'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 10
      OnEnter = edestadoEnter
      OnKeyPress = edmskrfcKeyPress
    end
    object dtalta: TRzDBDateTimeEdit
      Left = 644
      Top = 133
      Width = 115
      Height = 21
      Hint = 'Fecha de la alta del proveedor'
      DataSource = DSproveedores
      DataField = 'alta'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 15
      OnClick = dtaltaClick
      OnEnter = dtaltaEnter
      OnExit = dtaltaExit
      OnKeyPress = edmskrfcKeyPress
      EditType = etDate
      FlatButtons = True
    end
    object edamaterno: TRzDBEdit
      Left = 670
      Top = 40
      Width = 123
      Height = 21
      Hint = 'Apellido Materno'
      DataSource = DSproveedores
      DataField = 'amaterno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 3
      OnChange = ednombreChange
      OnKeyPress = edmskrfcKeyPress
    end
    object edapaterno: TRzDBEdit
      Left = 518
      Top = 40
      Width = 131
      Height = 21
      Hint = 'Apellido Paterno'
      DataSource = DSproveedores
      DataField = 'apaterno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 2
      OnChange = ednombreChange
      OnKeyPress = edmskrfcKeyPress
    end
    object ednombre: TRzDBEdit
      Left = 374
      Top = 40
      Width = 118
      Height = 21
      Hint = 'Nombre o Nombres del Proveedor'
      DataSource = DSproveedores
      DataField = 'nombre'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 1
      OnChange = ednombreChange
      OnKeyPress = edmskrfcKeyPress
    end
    object edrazon: TRzDBEdit
      Left = 13
      Top = 40
      Width = 348
      Height = 21
      Hint = 'Razon Social del Proveedor'
      DataSource = DSproveedores
      DataField = 'rsocial'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 0
      OnChange = edrazonChange
      OnKeyPress = edmskrfcKeyPress
    end
    object mmcomentario: TRzDBRichEdit
      Left = 11
      Top = 224
      Width = 598
      Height = 97
      Hint = 'Comentarios Extras'
      DataField = 'comentario'
      DataSource = DSproveedores
      ScrollBars = ssVertical
      TabOrder = 20
      OnKeyPress = edmskrfcKeyPress
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameVisible = True
    end
    object ednumero: TRzDBEdit
      Left = 478
      Top = 87
      Width = 45
      Height = 21
      Hint = 'Numero del local'
      DataSource = DSproveedores
      DataField = 'numero'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 7
      OnKeyPress = edmskrfcKeyPress
    end
    object eddias_cred: TRzDBEdit
      Left = 316
      Top = 135
      Width = 50
      Height = 21
      Hint = 'Dias de credito'
      DataSource = DSproveedores
      DataField = 'dias_cred'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 11
      OnKeyPress = edmskrfcKeyPress
    end
    object ediva: TRzDBEdit
      Left = 586
      Top = 135
      Width = 45
      Height = 21
      Hint = 'Iva'
      DataSource = DSproveedores
      DataField = 'iva'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 14
      OnKeyPress = edmskrfcKeyPress
    end
    object edmskrfc: TcxDBMaskEdit
      Left = 12
      Top = 88
      Width = 109
      Height = 21
      Hint = 'Registro Federal de Contribuyentes'
      DataBinding.DataField = 'rfc'
      DataBinding.DataSource = DSproveedores
      Properties.BeepOnError = True
      Properties.CharCase = ecUpperCase
      Properties.EditMask = 'lLLL000000-AAA'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Style.BorderColor = clActiveCaption
      Style.BorderStyle = ebsUltraFlat
      Style.Color = clWhite
      Style.Edges = [bBottom]
      TabOrder = 4
      OnKeyPress = edmskrfcKeyPress
    end
    object btntelefonos: TRzBitBtn
      Left = 650
      Top = 278
      Width = 100
      Height = 27
      Hint = 'Asignar telefono(s) de este proveedor'
      Caption = 'Telefonos'
      Color = clWhite
      HotTrack = True
      HotTrackColor = clTeal
      TabOrder = 19
      Visible = False
      OnClick = btntelefonosClick
      ImageIndex = 4
      Images = DMAccesos.ilopciones
    end
    object btncontactos: TRzBitBtn
      Left = 650
      Top = 238
      Width = 100
      Height = 27
      Hint = 'Asignar contacto(s) a este Proveedor'
      Caption = 'Contactos'
      Color = clWhite
      HotTrack = True
      HotTrackColor = clTeal
      TabOrder = 18
      Visible = False
      OnClick = btncontactosClick
      ImageIndex = 13
      Images = DMAccesos.ilopciones
    end
    object edd_entrega: TRzDBEdit
      Left = 496
      Top = 135
      Width = 65
      Height = 21
      Hint = 'Dias de credito'
      DataSource = DSproveedores
      DataField = 'dias_entrega'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 13
      OnKeyPress = edmskrfcKeyPress
    end
    object edmskcurp: TcxDBMaskEdit
      Left = 132
      Top = 88
      Width = 133
      Height = 21
      Hint = 'Clave Unica de Registro de Poblacion'
      DataBinding.DataField = 'curp'
      DataBinding.DataSource = DSproveedores
      Properties.BeepOnError = True
      Properties.CharCase = ecUpperCase
      Properties.EditMask = 'LLLL000000LLLL0'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Style.BorderColor = clBlack
      Style.BorderStyle = ebsUltraFlat
      Style.Edges = [bBottom]
      TabOrder = 5
      OnKeyPress = edmskrfcKeyPress
    end
    object LBcolonias: TRzDBLookupComboBox
      Left = 542
      Top = 87
      Width = 151
      Height = 21
      Hint = 'Colonia donde esta ubicado'
      Ctl3D = False
      DataField = 'idcol'
      DataSource = DSproveedores
      KeyField = 'idcol'
      ListField = 'nombre'
      ListSource = DScolonias
      ParentCtl3D = False
      TabOrder = 8
      OnKeyPress = edmskrfcKeyPress
      FlatButtonColor = clWhite
      FlatButtons = True
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
    end
    object edcp: TRzDBEdit
      Left = 703
      Top = 87
      Width = 82
      Height = 21
      Hint = 'C'#243'digo posta del Cliente'
      DataSource = DSproveedores
      DataField = 'cp'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 21
      OnKeyPress = edmskrfcKeyPress
    end
    object edcredito: TRzDBNumericEdit
      Left = 378
      Top = 135
      Width = 104
      Height = 21
      Hint = 'Total de Credito Asignado'
      DataSource = DSproveedores
      DataField = 'credito'
      FrameController = DMAccesos.frmctr
      TabOrder = 12
      OnKeyPress = edmskrfcKeyPress
      IntegersOnly = False
      DisplayFormat = ',0.00'
    end
    object cboestatus: TRzComboBox
      Left = 16
      Top = 184
      Width = 169
      Height = 21
      Hint = 'Estatus del proveedor actual'
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 16
      OnKeyPress = edmskrfcKeyPress
      Items.Strings = (
        'NO ACTIVO'
        'ACTIVO')
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 648
      Top = 175
      Width = 137
      Height = 34
      DataField = 'deducible'
      DataSource = DSproveedores
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Deducible (Si se le desglozara el iva)'
      HotTrack = True
      TabOrder = 22
    end
    object edemail: TRzDBEdit
      Left = 200
      Top = 184
      Width = 305
      Height = 21
      DataSource = DSproveedores
      DataField = 'email'
      CharCase = ecUpperCase
      FrameColor = clActiveCaption
      FrameHotColor = clActiveCaption
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 17
    end
    object cbnacional: TRzDBComboBox
      Left = 520
      Top = 184
      Width = 89
      Height = 21
      DataField = 'nacional'
      DataSource = DSproveedores
      Ctl3D = False
      FlatButtons = True
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 23
      Items.Strings = (
        'Nac'
        'Ext'
        'Chn')
    end
  end
  object navegador: TRzDBNavigator
    Left = 352
    Top = 1
    Width = 248
    Height = 28
    DataSource = DSproveedores
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'Primer Proveedor'
      'Anterior Proveedor'
      'Siguiente Proveedor'
      'Ultimo Proveedor')
    TabOrder = 5
    OnClick = navegadorClick
    Color = clWhite
  end
  object edclave: TRzButtonEdit
    Left = 49
    Top = 6
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
    TabOrder = 6
    OnChange = edclaveChange
    OnKeyPress = edclaveKeyPress
    OnKeyUp = FormKeyUp
    ButtonKind = bkFind
    ButtonShortCut = 119
    FlatButtons = True
    OnButtonClick = edclaveButtonClick
  end
  object DSproveedores: TDataSource
    DataSet = tblproveedores
    Left = 136
    Top = 284
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select telefono,tipo_tel from telefonos where idtel=:tel')
    Options.FullRefresh = True
    FetchAll = True
    Left = 74
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tel'
      end>
  end
  object tblproveedores: TMyTable
    TableName = 'proveedores'
    Connection = DMAccesos.conexion
    AfterClose = tblproveedoresAfterClose
    AfterScroll = tblproveedoresAfterScroll
    FetchAll = True
    Left = 106
    Top = 284
    object tblproveedoresidprov: TIntegerField
      FieldName = 'idprov'
    end
    object tblproveedoresrsocial: TStringField
      FieldName = 'rsocial'
      Size = 50
    end
    object tblproveedoresnombre: TStringField
      FieldName = 'nombre'
      Size = 30
    end
    object tblproveedoresapaterno: TStringField
      FieldName = 'apaterno'
    end
    object tblproveedoresamaterno: TStringField
      FieldName = 'amaterno'
    end
    object tblproveedoresrfc: TStringField
      FieldName = 'rfc'
      Size = 35
    end
    object tblproveedorescalle: TStringField
      FieldName = 'calle'
      Size = 30
    end
    object tblproveedoresidcol: TStringField
      FieldName = 'idcol'
      Size = 30
    end
    object tblproveedoresciudad: TStringField
      FieldName = 'ciudad'
    end
    object tblproveedoresestado: TStringField
      FieldName = 'estado'
    end
    object tblproveedoresnumero: TIntegerField
      FieldName = 'numero'
    end
    object tblproveedorescp: TStringField
      FieldName = 'cp'
      Size = 10
    end
    object tblproveedoresfax: TStringField
      FieldName = 'fax'
      Size = 30
    end
    object tblproveedoresemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object tblproveedoresidcontacto: TIntegerField
      FieldName = 'idcontacto'
    end
    object tblproveedoresidtel: TIntegerField
      FieldName = 'idtel'
    end
    object tblproveedoresdias_cred: TIntegerField
      FieldName = 'dias_cred'
    end
    object tblproveedoresiva: TFloatField
      FieldName = 'iva'
    end
    object tblproveedorescant_provd: TFloatField
      FieldName = 'cant_provd'
    end
    object tblproveedorescant_provp: TFloatField
      FieldName = 'cant_provp'
    end
    object tblproveedoresdebo_v: TFloatField
      FieldName = 'debo_v'
    end
    object tblproveedoresdebo_p: TFloatField
      FieldName = 'debo_p'
    end
    object tblproveedoresultima: TDateTimeField
      FieldName = 'ultima'
    end
    object tblproveedorescomentario: TMemoField
      FieldName = 'comentario'
      BlobType = ftMemo
    end
    object tblproveedoresnpedido: TIntegerField
      FieldName = 'npedido'
    end
    object tblproveedorestransfer: TStringField
      FieldName = 'transfer'
      FixedChar = True
      Size = 1
    end
    object tblproveedoresctacont: TStringField
      FieldName = 'ctacont'
    end
    object tblproveedoresdistribcom: TStringField
      FieldName = 'distribcom'
      Size = 10
    end
    object tblproveedoresdistribabo: TStringField
      FieldName = 'distribabo'
      Size = 10
    end
    object tblproveedoresalta: TDateField
      FieldName = 'alta'
    end
    object tblproveedoresusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object tblproveedoresfecha: TStringField
      FieldName = 'fecha'
      Size = 15
    end
    object tblproveedoreshora: TStringField
      FieldName = 'hora'
      Size = 15
    end
    object tblproveedoresdias_entrega: TIntegerField
      FieldName = 'dias_entrega'
    end
    object tblproveedorescurp: TStringField
      FieldName = 'curp'
    end
    object tblproveedorescredito: TFloatField
      FieldName = 'credito'
    end
    object tblproveedoresestatus: TBooleanField
      FieldName = 'estatus'
    end
    object tblproveedoresdeducible: TIntegerField
      FieldName = 'deducible'
    end
    object tblproveedoresnacional: TStringField
      FieldName = 'nacional'
      Size = 11
    end
  end
  object DScolonias: TDataSource
    DataSet = SQLcolonias
    Left = 10
    Top = 283
  end
  object SQLcolonias: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select'
      ' colonias.nombre,'
      'colonias.idcol,'
      'colonias.cp,'
      'col_sector.idsector'
      'from  '
      'colonias '
      'inner join '
      'col_sector'
      'on (colonias.idcol=col_sector.idcol) order by colonias.nombre')
    AfterScroll = SQLcoloniasAfterScroll
    Options.FullRefresh = True
    FetchAll = True
    Left = 42
    Top = 283
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
end
