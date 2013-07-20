object frmMediaFiliacion: TfrmMediaFiliacion
  Left = 499
  Top = 264
  AutoSize = True
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Media Filiacion'
  ClientHeight = 201
  ClientWidth = 332
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcmedia: TRzPageControl
    Left = 0
    Top = 0
    Width = 332
    Height = 169
    ActivePage = tsasaltante
    Align = alTop
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object tsasaltante: TRzTabSheet
      Color = clWhite
      Caption = 'A&SALTANTES'
      object RzLabel1: TRzLabel
        Left = 16
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Estatura:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel2: TRzLabel
        Left = 16
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Complexion:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel3: TRzLabel
        Left = 16
        Top = 88
        Width = 26
        Height = 13
        Caption = 'Tes:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel4: TRzLabel
        Left = 16
        Top = 120
        Width = 111
        Height = 13
        Caption = 'Se'#241'as Particulares:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cbestatura: TRzComboBox
        Left = 120
        Top = 16
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = cbestaturaKeyPress
        Items.Strings = (
          'MENOR DE 1.50 MTS'
          '1.50 A 1.60 MTS'
          '1.61 A 1.70 MTS'
          '1.71 A 1.80 MTS'
          '1.81 A 1.90 MTS'
          '1.91 A 2.00 MTS'
          'MAYOR A 2.00  MTS')
      end
      object cbcomplexion: TRzComboBox
        Left = 120
        Top = 48
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cbcomplexionKeyPress
        Items.Strings = (
          'MEDIA'
          'DELGADA'
          'GRUESA')
      end
      object cbtes: TRzComboBox
        Left = 120
        Top = 80
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = cbtesKeyPress
        Items.Strings = (
          'MORENA'
          'CLARA'
          'OSCURA'
          'API'#209'ONADA'
          'AMARILLA')
      end
      object edmarcas: TRzEdit
        Left = 136
        Top = 112
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 255
        TabOrder = 3
        OnKeyPress = edmarcasKeyPress
      end
    end
    object tsarma: TRzTabSheet
      Color = clWhite
      Caption = 'A&RMAS'
      object RzLabel5: TRzLabel
        Left = 136
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Tipo Arma'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel7: TRzLabel
        Left = 136
        Top = 64
        Width = 29
        Height = 13
        Caption = 'Otra:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object rgtipoarma: TRzRadioGroup
        Left = 8
        Top = 8
        Width = 97
        Height = 81
        Caption = 'Tipo Arma'
        Color = clWhite
        ItemHotTrack = True
        Items.Strings = (
          'Blanca'
          'De Fuego'
          'Otra')
        TabOrder = 0
        OnChanging = rgtipoarmaChanging
      end
      object cbtipoarma: TRzComboBox
        Left = 136
        Top = 32
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DisabledColor = clWhite
        Enabled = False
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cbtipoarmaKeyPress
        Items.Strings = (
          'CUCHILLO'
          'NAVAJA'
          'MACHETE'
          'ESCUADRA'
          'REVOLVER'
          'ARMA DE ALTO PODER')
      end
      object edotraarma: TRzEdit
        Left = 136
        Top = 80
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 2
        OnKeyPress = edotraarmaKeyPress
      end
    end
    object tsauto: TRzTabSheet
      Color = clWhite
      Caption = 'A&UTOMOVIL'
      object RzLabel6: TRzLabel
        Left = 32
        Top = 24
        Width = 63
        Height = 13
        Caption = 'Tipo movil:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel8: TRzLabel
        Left = 32
        Top = 88
        Width = 34
        Height = 13
        Caption = 'Color:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel9: TRzLabel
        Left = 32
        Top = 120
        Width = 43
        Height = 13
        Caption = 'Placas:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel10: TRzLabel
        Left = 32
        Top = 56
        Width = 40
        Height = 13
        Caption = 'Marca:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cbtipoauto: TRzComboBox
        Left = 128
        Top = 16
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnKeyPress = cbtipoautoKeyPress
        Items.Strings = (
          'AUTOMOVIL'
          'A PIE'
          'BICICLETA'
          'CAMION'
          'MOTOCICLETA'
          'PICK UP'
          'SUV'
          'VAN')
      end
      object cbcolor: TRzComboBox
        Left = 128
        Top = 80
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = cbcolorKeyPress
        Items.Strings = (
          'AMARILLO'
          'AZUL CLARO'
          'AZUL OSCURO'
          'BLANCO'
          'GINDA'
          'NARANJA'
          'NEGRO'
          'ROJO'
          'VERDE')
      end
      object edplacas: TRzEdit
        Left = 128
        Top = 112
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Color = clWhite
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 3
        OnKeyPress = edplacasKeyPress
      end
      object cbmarca: TRzComboBox
        Left = 128
        Top = 48
        Width = 145
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
        OnKeyPress = cbmarcaKeyPress
        Items.Strings = (
          'CHEVROLET'
          'CHRYSLER'
          'DODGE'
          'FORD'
          'MAZDA'
          'MITSUBISHI'
          'NISSAN'
          'TOYOTA'
          'VOLKSWAGEN')
      end
    end
  end
  object btnalta: TRzBitBtn
    Left = 104
    Top = 168
    Width = 113
    Height = 33
    Caption = '&Guardar'
    HotTrack = True
    TabOrder = 1
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
      090909090909090909E8E8E881818181818181818181818181E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
      090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
      101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
      090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
      0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
      0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
      090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btncerrar: TRzBitBtn
    Left = 224
    Top = 168
    Width = 105
    Height = 33
    Caption = '&Cerrar'
    HotTrack = True
    TabOrder = 2
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
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 265
    Top = 4
  end
  object dsmedia: TDataSource
    DataSet = sqlgeneral
    Left = 297
    Top = 4
  end
end
