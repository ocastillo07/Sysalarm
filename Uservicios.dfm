object frmservicios: Tfrmservicios
  Left = 365
  Top = 110
  Width = 943
  Height = 654
  Caption = 'Servicios Pendientes'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splitter1: TRzSplitter
    Left = 0
    Top = 0
    Width = 927
    Height = 616
    Position = 0
    Percent = 0
    UsePercent = True
    UpperLeft.BorderOuter = fsFlat
    LowerRight.BorderOuter = fsFlat
    LowerRight.Color = clWhite
    HotSpotVisible = True
    SplitterWidth = 12
    OnChange = splitter1Change
    Align = alClient
    TabOrder = 0
    BarSize = (
      0
      0
      12
      616)
    HotSpotClosed = True
    HotSpotClosedToMin = True
    HotSpotClosedToMax = False
    HotSpotPosition = 912
    UpperLeftControls = (
      RzLabel22
      RzLabel23
      RzLabel24
      RzLabel25
      RzPanel1
      cxGrid1
      RzBitBtn1
      RzBitBtn2
      RzBitBtn3)
    LowerRightControls = (
      lbtipocliente
      lbultimo
      lbhistorial
      lbcConServicioEnMes
      Pmotivo
      btnalta
      btnmodificar
      btncerrar
      Pcliente
      pservicio
      ptermino
      btnimprimirreporte
      pvisitas
      btnnotas
      btnimpoficio)
    object RzLabel22: TRzLabel
      Left = -36
      Top = 75
      Width = 36
      Height = 14
      Alignment = taRightJustify
      Caption = 'Estatus'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel23: TRzLabel
      Left = -32
      Top = 272
      Width = 51
      Height = 13
      Caption = 'RzLabel23'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel24: TRzLabel
      Left = -65
      Top = 56
      Width = 51
      Height = 13
      Caption = 'RzLabel24'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel25: TRzLabel
      Left = -240
      Top = 2
      Width = 240
      Height = 14
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = '########################################'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzPanel1: TRzPanel
      Left = 1
      Top = 1
      Width = 910
      Height = 104
      Align = alTop
      Color = 16119543
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 8
        Top = 52
        Width = 85
        Height = 13
        Caption = 'Clasificaci'#243'n : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object btnbuscar: TRzBitBtn
        Left = 472
        Top = 63
        Width = 93
        Height = 31
        Hint = 'Busca el nombre tecleado'
        Caption = '&Buscar Servicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnbuscarClick
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
          B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
          5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
          89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
          89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
          D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
          D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
          D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
          5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
          B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
          E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
          E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btnmantenimientos: TRzBitBtn
        Left = 4
        Top = 2
        Width = 133
        Height = 31
        Hint = 'Pantalla de mantenimientos'
        Caption = '&Mantenimientos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnmantenimientosClick
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
          B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
          5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
          89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
          89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
          D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
          D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
          D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
          5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
          B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
          E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
          E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
        ImageIndex = 2
        NumGlyphs = 2
      end
      object btnreportependientes: TRzBitBtn
        Left = 140
        Top = 2
        Width = 93
        Height = 31
        Hint = 'Pantalla de mantenimientos'
        Caption = '> 24 hrs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btnreportependientesClick
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
          B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
          B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
          5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
          89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
          89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
          D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
          D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
          D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
          5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
          B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
          E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
          E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
        ImageIndex = 15
        NumGlyphs = 2
      end
      object btnservicio: TRzBitBtn
        Left = 567
        Top = 63
        Width = 117
        Height = 31
        Hint = 'Pantalla de mantenimientos'
        Caption = '&Crear Servicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnservicioClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF777777777777FFFF777777777777FFFF7FFFFFFFFF
          F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
          F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
          F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
          F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
          F7FFFF7FFFFFFFFFF7FFFF7FFFFFFF7777FFFF7F88888F7777FFFF7FFFFFFF7F
          7FFFFF7FFFFFFF7F7FFFFF7FFFFFFF77FFFFFF7FFFFFFF77FFFFFF777777777F
          FFFFFF777777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ImageIndex = 2
        NumGlyphs = 2
      end
      object cboclasificacion: TRzComboBox
        Left = 8
        Top = 70
        Width = 201
        Height = 21
        Ctl3D = False
        FlatButtons = True
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnClick = cboclasificacionClick
        OnNotInList = cboclasificacionNotInList
      end
      object btnimprimirlote: TRzBitBtn
        Left = 235
        Top = 2
        Width = 100
        Height = 31
        Caption = '&Imprimir en lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnClick = btnimprimirloteClick
        ImageIndex = 20
      end
      object btncancelar: TRzBitBtn
        Left = 686
        Top = 63
        Width = 83
        Height = 31
        Hint = 'Cerrar esta Pantalla'
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
      object btnImprimirGrid: TRzBitBtn
        Left = 387
        Top = 62
        Width = 86
        Height = 31
        Caption = '&Imprimir rejilla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = btnImprimirGridClick
        ImageIndex = 20
      end
      object btntkpend: TRzBitBtn
        Left = 280
        Top = 62
        Width = 99
        Height = 31
        Caption = 'Tickets Pendientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 8
        OnClick = btntkpendClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000430B0000430B00000001000000000000000000003300
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
          0000000000000000000000000000000000000000000000000000E8E8E8E8E85E
          0909095EE8E8E8E8E8E8E8E8E8E8E8AC818181ACE8E8E8E8E8E8E8E8E8E85E09
          E8E8E8095EE8E8E8E8E8E8E8E8E8AC81E8E8E881ACE8E8E8E8E8E8E8E8E809E8
          E8E8E8E809E8E8E8E8E8E8E8E8E881E8E8E8E8E881E8E8E8E8E8E8E8E8E809E8
          5E095EE809E8E8E8E8E8E8E8E8E881E8AC81ACE881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E809E8
          09E809E809E8E8E8E8E8E8E8E8E881E881E881E881E8E8E8E8E8E8E8E8E8E8E8
          09E8E8E809E8E8E8E8E8E8E8E8E8E8E881E8E8E881E8E8E8E8E8E8E8E8E8E8E8
          09E8E8E809E8E8E8E8E8E8E8E8E8E8E881E8E8E881E8E8E8E8E8E8E8E8E8E8E8
          09E8E8E809E8E8E8E8E8E8E8E8E8E8E881E8E8E881E8E8E8E8E8E8E8E8E8E8E8
          E8090909E8E8E8E8E8E8E8E8E8E8E8E8E8818181E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 105
      Width = 910
      Height = 510
      Align = alClient
      BorderWidth = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      object DBGVista2: TcxGridDBTableView
        OnDblClick = DBGVista2DblClick
        DataController.DataSource = DSrejilla
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'sid'
            Column = columna1
          end>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
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
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.Navigator = True
        OptionsView.CellAutoHeight = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        object columna1: TcxGridDBColumn
          Caption = '#Serv'
          Width = 45
          DataBinding.FieldName = 'sid'
        end
        object columna0: TcxGridDBColumn
          Caption = 'Cta'
          Width = 37
          DataBinding.FieldName = 'idcliente'
        end
        object columna6: TcxGridDBColumn
          Caption = 'Nombre'
          SortOrder = soAscending
          Width = 140
          DataBinding.FieldName = 'cliente'
        end
        object columna2: TcxGridDBColumn
          Caption = 'FechaCreacion'
          Width = 61
          DataBinding.FieldName = 'fecha_creacion'
        end
        object columna7: TcxGridDBColumn
          Caption = 'H'
          Width = 27
          DataBinding.FieldName = 'horas'
        end
        object columan5: TcxGridDBColumn
          Caption = 'Problema'
          Width = 194
          DataBinding.FieldName = 'problema'
        end
        object columna3: TcxGridDBColumn
          Caption = 'T'
          Width = 28
          DataBinding.FieldName = 'CodTecnico'
        end
        object columna4: TcxGridDBColumn
          Caption = 'Estatus'
          Visible = False
          Width = 50
          DataBinding.FieldName = 'clasificacion'
        end
        object visita: TcxGridDBColumn
          Caption = 'Com. Tec'
          Width = 138
          DataBinding.FieldName = 'visita'
        end
        object FechaVTec: TcxGridDBColumn
          Width = 68
          DataBinding.FieldName = 'FechaConT'
        end
        object VisitaSup: TcxGridDBColumn
          Caption = 'Com. Sup'
          Width = 160
          DataBinding.FieldName = 'VisitaSup'
        end
        object FechaSup: TcxGridDBColumn
          Width = 74
          DataBinding.FieldName = 'FechaSupervisor'
        end
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'Pruebas'
        GridView = DBGVista2
      end
    end
    object RzBitBtn1: TRzBitBtn
      Left = -97
      Top = 512
      Width = 97
      Height = 34
      Hint = 'Dar de Alta el servicio'
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
      TabOrder = 2
      OnClick = btnaltaClick
      ImageIndex = 5
    end
    object RzBitBtn2: TRzBitBtn
      Left = -97
      Top = 515
      Width = 97
      Height = 34
      Hint = 'Dar de Alta el servicio'
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
      TabOrder = 3
      OnClick = btnaltaClick
      ImageIndex = 5
    end
    object RzBitBtn3: TRzBitBtn
      Left = -100
      Top = 579
      Width = 100
      Height = 34
      Caption = '&Imprimir'
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
      OnClick = btnimprimirreporteClick
      ImageIndex = 20
    end
    object lbtipocliente: TRzLabel
      Left = 529
      Top = 2
      Width = 240
      Height = 14
      Alignment = taRightJustify
      BiDiMode = bdRightToLeft
      Caption = '########################################'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbultimo: TRzLabel
      Left = 785
      Top = 362
      Width = 240
      Height = 14
      BiDiMode = bdLeftToRight
      Caption = '########################################'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      WordWrap = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbhistorial: TRzLabel
      Left = 792
      Top = 160
      Width = 82
      Height = 18
      Cursor = crHandPoint
      BiDiMode = bdLeftToRight
      Caption = 'Ver historial'
      DragCursor = crArrow
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      OnClick = lbhistorialClick
      OnMouseMove = lbhistorialMouseMove
      OnMouseLeave = lbhistorialMouseLeave
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbcConServicioEnMes: TRzLabel
      Left = 8
      Top = 0
      Width = 3
      Height = 13
      Color = clWhite
      ParentColor = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object Pmotivo: TRzPanel
      Left = 6
      Top = 182
      Width = 769
      Height = 123
      Color = 16119543
      TabOrder = 1
      object RzLabel11: TRzLabel
        Left = 8
        Top = 43
        Width = 49
        Height = 28
        Alignment = taRightJustify
        Caption = 'Motivo de servicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel13: TRzLabel
        Left = 177
        Top = 15
        Width = 68
        Height = 13
        Caption = 'Clasificaci'#243'n : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel14: TRzLabel
        Left = 18
        Top = 3
        Width = 39
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Servicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbprioridad: TRzLabel
        Left = 457
        Top = 15
        Width = 47
        Height = 13
        Caption = 'Prioridad :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbtecnico: TRzLabel
        Left = 17
        Top = 103
        Width = 39
        Height = 13
        Caption = 'T'#233'cnico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbinstalador: TRzLabel
        Left = 141
        Top = 101
        Width = 35
        Height = 16
        Caption = '#####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object mmproblema: TRzMemo
        Left = 64
        Top = 40
        Width = 633
        Height = 49
        TabOrder = 3
        DisabledColor = clWhite
        FrameColor = clActiveCaption
        FrameVisible = True
      end
      object cboclasifica: TRzComboBox
        Left = 248
        Top = 8
        Width = 201
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
        OnKeyPress = ednomopKeyPress
      end
      object dfecha: TRzDateTimePicker
        Left = 64
        Top = 8
        Width = 105
        Height = 21
        Date = 38722.758047719910000000
        Time = 38722.758047719910000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyPress = ednomopKeyPress
      end
      object cboprioridad: TRzComboBox
        Left = 512
        Top = 8
        Width = 185
        Height = 21
        Ctl3D = False
        FlatButtons = True
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = ednomopKeyPress
        Items.Strings = (
          '-Selecciona Prioridad-'
          'URGENTE'
          'NORMAL'
          'PREVENTIVO')
      end
      object edbuscarinst: TRzButtonEdit
        Left = 64
        Top = 98
        Width = 73
        Height = 20
        Hint = 'Buscar cuenta'
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
        OnKeyPress = edbuscarinstKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 0
        FlatButtons = True
        OnButtonClick = edbuscarinstButtonClick
      end
    end
    object btnalta: TRzBitBtn
      Left = 785
      Top = 435
      Width = 128
      Height = 34
      Hint = 'Dar de Alta el servicio'
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
      TabOrder = 5
      OnClick = btnaltaClick
      ImageIndex = 5
    end
    object btnmodificar: TRzBitBtn
      Left = 787
      Top = 483
      Width = 126
      Height = 34
      Hint = 'Editar los datos del Cliente Actual'
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
      TabOrder = 6
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
    object btncerrar: TRzBitBtn
      Left = 789
      Top = 539
      Width = 124
      Height = 34
      Hint = 'Cerrar esta Pantalla'
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 7
      OnClick = btncerrarClick
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
    object Pcliente: TRzPanel
      Left = 6
      Top = 14
      Width = 769
      Height = 171
      Color = 16119543
      TabOrder = 0
      object RzLabel39: TRzLabel
        Left = 17
        Top = 20
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
      object RzLabel2: TRzLabel
        Left = 161
        Top = 18
        Width = 63
        Height = 14
        Caption = 'Num Servicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel3: TRzLabel
        Left = 17
        Top = 48
        Width = 37
        Height = 14
        Caption = 'Nombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel4: TRzLabel
        Left = 337
        Top = 18
        Width = 76
        Height = 14
        Caption = 'Fecha Creaci'#243'n'
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
        Left = 17
        Top = 72
        Width = 13
        Height = 14
        Caption = 'Dir'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbrefs: TRzLabel
        Left = 17
        Top = 93
        Width = 39
        Height = 14
        Caption = 'Referen'
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
        Left = 537
        Top = 97
        Width = 36
        Height = 14
        Caption = 'Estatus'
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
        Left = 537
        Top = 72
        Width = 21
        Height = 14
        Caption = 'N'#250'm'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel8: TRzLabel
        Left = 521
        Top = 18
        Width = 69
        Height = 14
        Caption = 'Hora Creacion'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel9: TRzLabel
        Left = 17
        Top = 117
        Width = 46
        Height = 14
        Caption = 'Operador'
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
        Left = 17
        Top = 141
        Width = 38
        Height = 14
        Caption = 'Reporto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel12: TRzLabel
        Left = 537
        Top = 48
        Width = 13
        Height = 14
        Caption = 'Tel'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel26: TRzLabel
        Left = 209
        Top = 120
        Width = 30
        Height = 14
        Caption = 'Travel'
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
        Left = 386
        Top = 123
        Width = 31
        Height = 14
        Caption = 'Ajuste'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lblBloqueado: TRzLabel
        Left = 529
        Top = 115
        Width = 122
        Height = 22
        Caption = 'BLOQUEADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lblcobrable: TRzLabel
        Left = 529
        Top = 139
        Width = 205
        Height = 22
        Caption = 'SERVICIO COBRABLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edbuscar: TRzButtonEdit
        Left = 80
        Top = 10
        Width = 73
        Height = 22
        Hint = 'Buscar cuenta'
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
        OnKeyPress = edbuscarKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 16450
        FlatButtons = True
        OnButtonClick = edbuscarButtonClick
      end
      object edservicio: TRzEdit
        Left = 228
        Top = 9
        Width = 103
        Height = 22
        Hint = 'Orden de servicio'
        CharCase = ecUpperCase
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
      end
      object ednombre: TRzEdit
        Left = 64
        Top = 39
        Width = 449
        Height = 20
        CharCase = ecUpperCase
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object edfechaalta: TRzEdit
        Left = 418
        Top = 9
        Width = 95
        Height = 22
        CharCase = ecUpperCase
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
        TabOrder = 3
      end
      object eddir: TRzEdit
        Left = 64
        Top = 63
        Width = 449
        Height = 20
        CharCase = ecUpperCase
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object edrefs: TRzEdit
        Left = 64
        Top = 87
        Width = 449
        Height = 20
        CharCase = ecUpperCase
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object edestatus: TRzEdit
        Left = 578
        Top = 88
        Width = 111
        Height = 19
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
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
        TabOrder = 6
      end
      object ednum: TRzEdit
        Left = 577
        Top = 63
        Width = 111
        Height = 20
        CharCase = ecUpperCase
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object edhora: TRzEdit
        Left = 594
        Top = 9
        Width = 95
        Height = 22
        CharCase = ecUpperCase
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
        TabOrder = 8
      end
      object ednomop: TRzEdit
        Left = 65
        Top = 111
        Width = 111
        Height = 20
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
        TabOrder = 9
        OnKeyPress = ednomopKeyPress
      end
      object edreporto: TRzEdit
        Left = 65
        Top = 135
        Width = 448
        Height = 20
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
        TabOrder = 10
        OnKeyPress = ednomopKeyPress
      end
      object edtel: TRzEdit
        Left = 577
        Top = 39
        Width = 111
        Height = 20
        CharCase = ecUpperCase
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
      end
      object edtravel: TRzEdit
        Left = 250
        Top = 112
        Width = 111
        Height = 20
        CharCase = ecUpperCase
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
      end
      object edajuste: TRzButtonEdit
        Left = 426
        Top = 113
        Width = 73
        Height = 20
        Hint = 'Buscar cuenta'
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
        OnKeyPress = edajusteKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 16450
        FlatButtons = True
        OnButtonClick = edajusteButtonClick
      end
    end
    object pservicio: TRzPanel
      Left = 7
      Top = 304
      Width = 768
      Height = 73
      Color = 16119543
      TabOrder = 2
      object RzLabel15: TRzLabel
        Left = 24
        Top = 3
        Width = 33
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Inicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel16: TRzLabel
        Left = 207
        Top = 3
        Width = 26
        Height = 28
        Alignment = taRightJustify
        Caption = 'Hora Inicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel17: TRzLabel
        Left = 4
        Top = 35
        Width = 53
        Height = 28
        Alignment = taRightJustify
        Caption = 'Trabajos Realizados'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object dfechaini: TRzDateTimePicker
        Left = 64
        Top = 8
        Width = 105
        Height = 21
        Date = 38722.758047719910000000
        Time = 38722.758047719910000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyPress = ednomopKeyPress
      end
      object mmtrabajos: TRzMemo
        Left = 64
        Top = 32
        Width = 633
        Height = 33
        TabOrder = 1
        FrameColor = clActiveCaption
        FrameVisible = True
      end
      object dhoraini: TRzDateTimePicker
        Left = 248
        Top = 8
        Width = 97
        Height = 21
        Date = 38870.500000000000000000
        Format = 'h:mm:ss tt'
        Time = 38870.500000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Kind = dtkTime
        ParentFont = False
        TabOrder = 2
        FlatButtonColor = clWhite
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
      end
      object chkcalcamonia: TRzCheckBox
        Left = 360
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Calcamonia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 3
      end
      object chkacrilico: TRzCheckBox
        Left = 464
        Top = 8
        Width = 65
        Height = 17
        Caption = 'Acrilico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 4
      end
      object chknumero: TRzCheckBox
        Left = 544
        Top = 8
        Width = 73
        Height = 17
        Caption = 'Numero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 5
      end
      object chkcodigo: TRzCheckBox
        Left = 632
        Top = 8
        Width = 129
        Height = 17
        Caption = 'Cambio de Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 6
      end
    end
    object ptermino: TRzPanel
      Left = 8
      Top = 376
      Width = 767
      Height = 97
      Color = 16119543
      TabOrder = 3
      object RzLabel18: TRzLabel
        Left = 20
        Top = 3
        Width = 37
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Termino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel19: TRzLabel
        Left = 196
        Top = 3
        Width = 37
        Height = 28
        Alignment = taRightJustify
        Caption = 'Hora Termino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel20: TRzLabel
        Left = 15
        Top = 35
        Width = 42
        Height = 14
        Alignment = taRightJustify
        Caption = 'Comenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel21: TRzLabel
        Left = 21
        Top = 79
        Width = 36
        Height = 14
        Alignment = taRightJustify
        Caption = 'Estatus'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel31: TRzLabel
        Left = 290
        Top = 78
        Width = 102
        Height = 14
        Alignment = taRightJustify
        Caption = 'Problema presentado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object dfechatermi: TRzDateTimePicker
        Left = 64
        Top = 8
        Width = 105
        Height = 21
        Date = 38722.758047719910000000
        Time = 38722.758047719910000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnKeyPress = ednomopKeyPress
      end
      object mmcomentario: TRzMemo
        Left = 64
        Top = 32
        Width = 633
        Height = 33
        TabOrder = 1
        FrameColor = clActiveCaption
        FrameVisible = True
      end
      object cboestatus: TRzComboBox
        Left = 64
        Top = 72
        Width = 185
        Height = 21
        Ctl3D = False
        FlatButtons = True
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = ednomopKeyPress
        OnNotInList = cboestatusNotInList
        Items.Strings = (
          'URGENTE '
          'NORMAL'
          'PREVENTIVO')
      end
      object cboproblema: TRzComboBox
        Left = 400
        Top = 72
        Width = 297
        Height = 21
        Ctl3D = False
        FlatButtons = True
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        OnKeyPress = ednomopKeyPress
        Items.Strings = (
          'URGENTE '
          'NORMAL'
          'PREVENTIVO')
      end
      object dhoratermi: TRzDateTimePicker
        Left = 248
        Top = 8
        Width = 97
        Height = 21
        Date = 38870.500000000000000000
        Format = 'h:mm:ss tt'
        Time = 38870.500000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Kind = dtkTime
        ParentFont = False
        TabOrder = 4
        FlatButtonColor = clWhite
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
      end
    end
    object btnimprimirreporte: TRzBitBtn
      Left = 790
      Top = 11
      Width = 100
      Height = 34
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnimprimirreporteClick
      ImageIndex = 20
    end
    object pvisitas: TRzPanel
      Left = 8
      Top = 472
      Width = 767
      Height = 105
      Color = 16119543
      TabOrder = 4
      object RzLabel29: TRzLabel
        Left = 80
        Top = 3
        Width = 33
        Height = 14
        Alignment = taRightJustify
        Caption = 'Visitas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel27: TRzLabel
        Left = 121
        Top = 6
        Width = 6
        Height = 14
        Alignment = taRightJustify
        Caption = '1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel28: TRzLabel
        Left = 120
        Top = 32
        Width = 6
        Height = 14
        Alignment = taRightJustify
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel30: TRzLabel
        Left = 120
        Top = 56
        Width = 6
        Height = 14
        Alignment = taRightJustify
        Caption = '3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel33: TRzLabel
        Left = 24
        Top = 6
        Width = 33
        Height = 42
        Alignment = taRightJustify
        Caption = 'Fecha Cont Tec'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel34: TRzLabel
        Left = 101
        Top = 79
        Width = 43
        Height = 14
        Alignment = taRightJustify
        Caption = 'VSuperv'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel35: TRzLabel
        Left = 11
        Top = 62
        Width = 77
        Height = 14
        Alignment = taRightJustify
        Caption = 'Fecha Cont Sup'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edvisita1: TRzEdit
        Left = 136
        Top = 4
        Width = 622
        Height = 20
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
        MaxLength = 150
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyDown = edvisita1KeyDown
        OnKeyPress = ednomopKeyPress
      end
      object edvisita2: TRzEdit
        Left = 136
        Top = 28
        Width = 622
        Height = 20
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
        MaxLength = 150
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyDown = edvisita1KeyDown
        OnKeyPress = ednomopKeyPress
      end
      object edvisita3: TRzEdit
        Left = 136
        Top = 52
        Width = 623
        Height = 20
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
        MaxLength = 150
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyDown = edvisita1KeyDown
        OnKeyPress = ednomopKeyPress
      end
      object edVisitaSup: TRzEdit
        Left = 135
        Top = 76
        Width = 625
        Height = 20
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
        MaxLength = 150
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnKeyDown = edVisitaSupKeyDown
        OnKeyPress = ednomopKeyPress
      end
      object dtpFechaTec: TRzDateTimePicker
        Left = 7
        Top = 35
        Width = 90
        Height = 21
        Date = 38722.758047719910000000
        Time = 38722.758047719910000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnKeyPress = ednomopKeyPress
      end
      object dtpFechaSup: TRzDateTimePicker
        Left = 6
        Top = 75
        Width = 91
        Height = 21
        Date = 38722.758047719910000000
        Time = 38722.758047719910000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnKeyPress = ednomopKeyPress
      end
    end
    object btnnotas: TRzMenuButton
      Left = 790
      Top = 115
      Width = 100
      Height = 30
      Caption = '&Notas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 9
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000520B0000520B00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8A3787878
        7878787878787878E8E8E8E8818181818181818181818181E8E8E8E8A3D5D5D5
        D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
        D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
        D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
        D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
        D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
        D5ABD5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
        D556ABABD5D5D578E8E8E8E881ACACACAC56ACACACACAC81E8E8E8E8A3D5D5D5
        D5AB0505ABD5D578E8E8E8E881ACACACACAC5656ACACAC81E8E8E8E8A3A3A3A3
        A30505D705A3A3A3E8E8E8E881818181815656D756818181E8E8E8E8E8E8E8E8
        E8E80505E8E8E8E8E8E8E8E8E8E8E8E8E8E85656E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      DisabledIndex = 21
      ImageIndex = 20
      NumGlyphs = 2
      DropDownMenu = ppnotas
    end
    object btnimpoficio: TRzBitBtn
      Left = 792
      Top = 59
      Width = 100
      Height = 34
      Caption = 'I&mprimir Doble'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnimpoficioClick
      ImageIndex = 20
    end
  end
  object sqlrejilla: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select s.sid,s.idcliente,if(c.rsocial is null or c.rsocial = '#39#39',' +
        'concat(ifnull(c.nombre,'#39#39'), '#39' '#39',ifnull(c.amaterno,'#39#39'),'#39' '#39',ifnull' +
        '(c.apaterno,'#39#39')),c.rsocial) as cliente,'
      's.fecha_creacion,'
      
        'IF((to_days(CURDATE()) -to_days(s.fecha_creacion)) > 1,(to_days(' +
        'CURDATE()) -to_days(s.fecha_creacion))*24+(hour(CURTIME())-hour(' +
        's.hora_creacion)),IF((to_days(CURDATE()) -to_days(s.fecha_creaci' +
        'on)) =1,'
      
        'IF((CURTIME()>s.hora_creacion),24+(hour(CURTIME())-hour(s.hora_c' +
        'reacion)),0),0))  AS horas,'
      
        'if(nota is null or nota = '#39#39', if(visita3 is null or visita3 = '#39#39 +
        ',if(visita2 is null or visita2 = '#39#39',if(visita1 is null or visita' +
        '1='#39#39','#39#39',visita1),visita2),visita3), nota) as visita,'
      'visita1,visita2,visita3,'
      
        'if (FechaSupervisor < '#39'1995/01/01'#39','#39#39',FechaSupervisor) as FechaS' +
        'upervisor,'
      'if (FechaConT < '#39'1995/01/01'#39','#39#39',FechaConT) as FechaConT,'
      'VisitaSup,'
      ''
      ''
      's.problema,s.CodTecnico, es.nombre as clasificacion'
      ''
      ''
      
        'from servicios as s left join EstatusServicios as es ON (es.orde' +
        'n=s.status)  left join TipoServicios as ts ON (ts.idserv=es.idse' +
        'rv) '
      'left join  clientes as c on c.idcliente = s.idcliente'
      'left join notas as n on n.idnota=s.idnota'
      
        'where s.status < 4  and ts.nombre='#39'ESTATUS SERVICIO'#39' group by si' +
        'd order by sid desc')
    FetchAll = True
    Left = 248
    Top = 264
  end
  object DSrejilla: TDataSource
    DataSet = sqlrejilla
    Left = 296
    Top = 264
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 345
    Top = 1
  end
  object ppnotas: TLMDPopupMenu
    OwnerDraw = True
    Layout.Alignment = agBottomCenter
    Layout.AlignText2Glyph = taTop
    Layout.OffsetY = -2
    Bevel.Mode = bmCustom
    Caption = 'Notas'
    FillObject.Style = sfGradient
    FillObject.Gradient.Color = clNavy
    FillObject.Gradient.ColorCount = 64
    FillObject.Gradient.EndColor = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    FontFX.Angle = 90
    Left = 336
    Top = 264
    object Nueva1: TMenuItem
      Caption = 'Nueva'
      OnClick = Nueva1Click
    end
    object Historial1: TMenuItem
      Caption = 'Historial'
      OnClick = Historial1Click
    end
  end
end
