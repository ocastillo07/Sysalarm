object frmBuscaManual: TfrmBuscaManual
  Left = 245
  Top = 126
  Width = 930
  Height = 435
  Caption = 'Consultar Manuales'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object parea: TRzPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 352
    Align = alLeft
    BorderOuter = fsNone
    Color = clWhite
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 0
      Top = 0
      Width = 273
      Height = 20
      Align = alTop
      Caption = 'Areas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbarea: TRzListBox
      Left = 0
      Top = 20
      Width = 273
      Height = 332
      Align = alClient
      Color = 16766935
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameStyle = fsPopup
      FrameVisible = True
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnClick = lbareaDblClick
      OnDblClick = lbareaDblClick
    end
  end
  object pfin: TRzPanel
    Left = 0
    Top = 352
    Width = 922
    Height = 49
    Align = alBottom
    BorderOuter = fsNone
    Color = clWhite
    TabOrder = 1
    object btncerrar: TRzBitBtn
      Left = 759
      Top = 0
      Width = 163
      Height = 49
      FrameColor = 7617536
      Align = alRight
      Caption = '&Cerrar'
      Color = clWhite
      HotTrack = True
      TabOrder = 0
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
  end
  object RzSplitter1: TRzSplitter
    Left = 273
    Top = 0
    Width = 649
    Height = 352
    Orientation = orVertical
    Position = 182
    Percent = 52
    HotSpotVisible = True
    HotSpotColor = clNavy
    HotSpotDotColor = clWhite
    HotSpotFrameColor = clMoneyGreen
    HotSpotHighlight = clAqua
    SplitterWidth = 7
    Align = alClient
    BorderColor = clWhite
    BorderShadow = clWhite
    Color = clWhite
    FlatColor = clWhite
    GradientColorStop = clWhite
    TabOrder = 2
    BarSize = (
      0
      182
      649
      189)
    UpperLeftControls = (
      RzLabel2
      lbsubtitulo)
    LowerRightControls = (
      RzLabel3
      lbmanual)
    object RzLabel2: TRzLabel
      Left = 0
      Top = 0
      Width = 649
      Height = 20
      Align = alTop
      Caption = 'Subtitulos:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbsubtitulo: TRzListBox
      Left = 0
      Top = 20
      Width = 649
      Height = 162
      Align = alClient
      Color = 16766935
      FrameHotTrack = True
      FrameStyle = fsPopup
      FrameVisible = True
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbsubtituloDblClick
      OnDblClick = lbsubtituloDblClick
    end
    object RzLabel3: TRzLabel
      Left = 0
      Top = 0
      Width = 649
      Height = 20
      Align = alTop
      Caption = 'Manuales:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbmanual: TRzListBox
      Left = 0
      Top = 20
      Width = 649
      Height = 143
      Align = alClient
      Color = 16766935
      FrameHotTrack = True
      FrameStyle = fsPopup
      FrameVisible = True
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbmanualDblClick
      OnDblClick = lbmanualDblClick
    end
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 240
    Top = 32
  end
  object Launcher: TRzLauncher
    Action = 'Open'
    Timeout = -1
    WaitType = wtProcessMessages
    Left = 208
    Top = 32
  end
end