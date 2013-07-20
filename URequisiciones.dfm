object frmRequisiciones: TfrmRequisiciones
  Left = -7
  Top = 99
  Width = 1027
  Height = 624
  Caption = '  Requisiciones '
  Color = 16776176
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 456
    Width = 431
    Height = 14
    Caption = 
      '* Presione la Tecla (+) para incrementar la cantidad de articulo' +
      's del rengl'#243'n seleccionado.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 16
    Top = 471
    Width = 433
    Height = 14
    Caption = 
      '* Presione la Tecla (-) para decrementar la cantidad de articulo' +
      's del rengl'#243'n seleccionado.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 16
    Top = 487
    Width = 307
    Height = 14
    Caption = 
      '* Presione la Tecla (Supr) para eliminar el rengl'#243'n seleccionado' +
      '.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 16
    Top = 503
    Width = 207
    Height = 14
    Caption = '* Doble click en el registro para modificarlo.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object RzLabel28: TRzLabel
    Left = 512
    Top = 72
    Width = 65
    Height = 13
    Caption = 'Solicitante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel29: TRzLabel
    Left = 512
    Top = 104
    Width = 48
    Height = 13
    Caption = 'Usuario:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel30: TRzLabel
    Left = 512
    Top = 136
    Width = 69
    Height = 13
    Caption = 'Carguese a:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object ppersonas: TRzPanel
    Left = 584
    Top = 56
    Width = 417
    Height = 105
    BorderOuter = fsPopup
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    GradientColorStop = clWhite
    ParentFont = False
    TabOrder = 2
    object edsolicitante: TRzButtonEdit
      Left = 8
      Top = 8
      Width = 81
      Height = 21
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edsolicitanteKeyPress
      AltBtnKind = bkFind
      ButtonKind = bkFind
      FlatButtons = True
      OnButtonClick = edsolicitanteButtonClick
    end
    object ednomsol: TRzEdit
      Left = 96
      Top = 8
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
      OnKeyPress = ednomsolKeyPress
    end
    object edusuario: TRzButtonEdit
      Left = 8
      Top = 40
      Width = 81
      Height = 21
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edusuarioKeyPress
      AltBtnKind = bkFind
      ButtonKind = bkFind
      FlatButtons = True
      FlatButtonColor = clWhite
      OnButtonClick = edsolicitanteButtonClick
    end
    object ednomuser: TRzEdit
      Left = 96
      Top = 40
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
      OnKeyPress = ednomuserKeyPress
    end
    object edcargo: TRzButtonEdit
      Left = 8
      Top = 72
      Width = 81
      Height = 21
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
      OnKeyPress = edcargoKeyPress
      AltBtnKind = bkFind
      ButtonKind = bkFind
      FlatButtons = True
      FlatButtonColor = clWhite
      OnButtonClick = edsolicitanteButtonClick
    end
    object ednomcargo: TRzEdit
      Left = 96
      Top = 72
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
      OnKeyPress = ednomcargoKeyPress
    end
  end
  object btnalta: TRzBitBtn
    Left = 24
    Top = 536
    Width = 128
    Height = 41
    Hint = 'Dar de Alta una Orden de Compra'
    FrameColor = 7617536
    ModalResult = 1
    Caption = '&Alta'
    Color = 16776176
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btnaltaClick
    ImageIndex = 5
    Images = DMAccesos.ilopciones
  end
  object btnborrar: TRzBitBtn
    Left = 168
    Top = 536
    Width = 129
    Height = 40
    Hint = 'Cancela la Orden Actual'
    ModalResult = 1
    Caption = 'Ca&ncelar'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
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
    Left = 319
    Top = 536
    Width = 130
    Height = 40
    Hint = 'Editar los datos de la Orden Actual'
    ModalResult = 1
    Caption = '&Editar'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
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
    Left = 466
    Top = 536
    Width = 127
    Height = 40
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
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
  object gbprov: TGroupBox
    Left = 8
    Top = 168
    Width = 337
    Height = 153
    Color = clWhite
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object RzLabel34: TRzLabel
      Left = 200
      Top = 96
      Width = 40
      Height = 14
      Caption = 'Factura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 18
      Width = 58
      Height = 14
      Caption = 'Proveedor'
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
      Left = 16
      Top = 98
      Width = 71
      Height = 14
      Caption = 'Tipo Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 122
      Top = 98
      Width = 15
      Height = 14
      Alignment = taRightJustify
      Caption = 'TC'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel6: TRzLabel
      Left = 16
      Top = 66
      Width = 77
      Height = 14
      Caption = 'Fecha Entrega'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edbuscarprov: TRzButtonEdit
      Left = 16
      Top = 32
      Width = 73
      Height = 22
      Hint = 'Buscar proveedor'
      Alignment = taRightJustify
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
      OnChange = edbuscarprovChange
      OnKeyPress = edbuscarprovKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edbuscarprovButtonClick
    end
    object edprov: TRzEdit
      Left = 96
      Top = 32
      Width = 225
      Height = 22
      Hint = 'Descripci'#243'n del proveedor'
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
    object edfactura: TRzEdit
      Left = 200
      Top = 120
      Width = 121
      Height = 24
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 5
      OnKeyPress = edfacturaKeyPress
    end
    object rgmoneda: TRzComboBox
      Left = 16
      Top = 120
      Width = 41
      Height = 22
      Hint = 'El tipo de moneda a manejar'
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnEnter = rgmonedaEnter
      OnKeyPress = rgmonedaKeyPress
      OnNotInList = rgmonedaNotInList
      OnSelect = rgmonedaSelect
      Items.Strings = (
        'D'
        'P')
    end
    object edTipoCambio: TRzEdit
      Left = 118
      Top = 120
      Width = 49
      Height = 22
      Alignment = taRightJustify
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      MaxLength = 5
      ParentFont = False
      TabOrder = 4
      OnExit = edTipoCambioExit
      OnKeyPress = edTipoCambioKeyPress
    end
    object dentrega: TRzDateTimeEdit
      Left = 112
      Top = 64
      Width = 105
      Height = 22
      EditType = etDate
      FlatButtons = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
      OnKeyPress = dentregaKeyPress
    end
  end
  object Rejilla: TcxGrid
    Left = 8
    Top = 328
    Width = 1001
    Height = 105
    Hint = '+ Incrementa Cant., - Decrementa Cant., SUPR Elimina Registro'
    Align = alCustom
    BevelOuter = bvNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
      OnCellClick = RejillaDBTableView1CellClick
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
        Width = 71
        DataBinding.FieldName = 'idcabm'
      end
      object nombre: TcxGridDBColumn
        Caption = 'Nombre'
        Options.Editing = False
        Options.Moving = False
        Width = 238
        DataBinding.FieldName = 'descripcion'
      end
      object cant: TcxGridDBColumn
        Caption = 'Cant. Orden'
        Options.Editing = False
        Options.Moving = False
        Width = 83
        DataBinding.FieldName = 'cantord'
      end
      object cant_surt: TcxGridDBColumn
        Caption = 'Cant. Surt.'
        Width = 75
        DataBinding.FieldName = 'cantsurt'
      end
      object piezas: TcxGridDBColumn
        Caption = 'Pzs'
        Visible = False
        Options.Editing = False
        Options.Moving = False
        Width = 58
        DataBinding.FieldName = 'piezas'
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
      object comentarios: TcxGridDBColumn
        Caption = 'Comentario'
        Width = 195
        DataBinding.FieldName = 'comentario'
      end
      object precio_costo: TcxGridDBColumn
        Caption = 'Costo Unidad'
        Options.Editing = False
        Options.Moving = False
        Width = 99
        DataBinding.FieldName = 'costo'
      end
      object subtotal: TcxGridDBColumn
        Width = 65
        DataBinding.FieldName = 'subtotal'
      end
      object dbiva: TcxGridDBColumn
        Caption = 'Iva'
        Options.Editing = False
        Options.Moving = False
        Width = 65
        DataBinding.FieldName = 'iva'
      end
      object total: TcxGridDBColumn
        Options.Editing = False
        Options.Moving = False
        Width = 95
        DataBinding.FieldName = 'Total'
      end
    end
    object RejillaLevel1: TcxGridLevel
      GridView = RejillaDBTableView1
    end
  end
  object gbtotales: TGroupBox
    Left = 632
    Top = 440
    Width = 361
    Height = 129
    Caption = 'Totales dlls'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object RzLabel9: TRzLabel
      Left = 18
      Top = 52
      Width = 42
      Height = 13
      Caption = 'Otros $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel18: TRzLabel
      Left = 14
      Top = 76
      Width = 46
      Height = 13
      Caption = 'Fletes $'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel21: TRzLabel
      Left = 7
      Top = 15
      Width = 50
      Height = 26
      Alignment = taRightJustify
      Caption = 'Total Articulos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel10: TRzLabel
      Left = 197
      Top = 75
      Width = 43
      Height = 16
      Caption = 'Total $'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel12: TRzLabel
      Left = 210
      Top = 51
      Width = 30
      Height = 16
      Caption = 'Iva $'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 172
      Top = 27
      Width = 68
      Height = 16
      Caption = 'Subtotal  $'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel35: TRzLabel
      Left = 131
      Top = 96
      Width = 109
      Height = 16
      Caption = 'Total por pagar $'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edtp: TRzDBNumericEdit
      Left = 72
      Top = 19
      Width = 89
      Height = 23
      DataSource = DSOrdenes
      DataField = 'TotalProductos'
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
      DisplayFormat = ',0;(,0)'
    end
    object edsubtotal: TRzDBNumericEdit
      Left = 248
      Top = 19
      Width = 105
      Height = 23
      Hint = 'Subtotal de todos los articulos '
      DataSource = DSOrdenes
      DataField = 'subtotal'
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      AllowBlank = False
      IntegersOnly = False
      Max = 10000.000000000000000000
      Min = -10000.000000000000000000
      Value = -10000.000000000000000000
      DisplayFormat = ',0.00'
    end
    object ediva: TRzDBNumericEdit
      Left = 248
      Top = 43
      Width = 105
      Height = 23
      Hint = 'Porcentaje de iva '
      DataSource = DSOrdenes
      DataField = 'iva'
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      AllowBlank = False
      Max = 100.000000000000000000
      DisplayFormat = ',0.00'
    end
    object edtotal: TRzDBNumericEdit
      Left = 248
      Top = 67
      Width = 105
      Height = 22
      Hint = 'Costo Total de todos los articulos '
      DataSource = DSOrdenes
      DataField = 'total'
      AutoSize = False
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      AllowBlank = False
      IntegersOnly = False
      Max = 10000.000000000000000000
      Min = -10000.000000000000000000
      Value = -10000.000000000000000000
      DisplayFormat = ',0.00'
    end
    object edporpagar: TRzEdit
      Left = 248
      Top = 96
      Width = 105
      Height = 23
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
    end
    object edotrosg: TRzDBEdit
      Left = 73
      Top = 48
      Width = 88
      Height = 23
      DataSource = DSOrdenes
      DataField = 'otros'
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
    end
    object edfletes: TRzDBEdit
      Left = 73
      Top = 72
      Width = 88
      Height = 23
      DataSource = DSOrdenes
      DataField = 'fletes'
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 993
    Height = 49
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 62
      Height = 14
      Caption = 'Num Orden'
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
      Left = 544
      Top = 16
      Width = 62
      Height = 14
      Caption = 'Hora Orden'
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
      Left = 367
      Top = 16
      Width = 69
      Height = 14
      Caption = 'Fecha Orden'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object estatus: TRzLabel
      Left = 176
      Top = 16
      Width = 3
      Height = 14
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edbuscar: TRzButtonEdit
      Left = 88
      Top = 16
      Width = 89
      Height = 22
      Hint = 'Buscar Orden de Compra'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
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
    object edHoraOrd: TRzDBEdit
      Left = 613
      Top = 10
      Width = 84
      Height = 22
      Hint = 'Hora de creada la Orden de Compra'
      DataSource = DSOrdenes
      DataField = 'HoraRequisicion'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 2
    end
    object edFechaOrd: TRzDBEdit
      Left = 445
      Top = 10
      Width = 92
      Height = 22
      Hint = 'Fecha de creaci'#243'n de la Orden de Compra'
      DataSource = DSOrdenes
      DataField = 'FechaRequisicion'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnldatos: TRzPanel
    Left = 8
    Top = 56
    Width = 497
    Height = 105
    BorderOuter = fsPopup
    Color = clWhite
    Enabled = False
    TabOrder = 1
    object RzLabel7: TRzLabel
      Left = 8
      Top = 18
      Width = 89
      Height = 13
      Caption = 'Fecha Vigencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel11: TRzLabel
      Left = 8
      Top = 42
      Width = 115
      Height = 13
      Caption = 'Detalles de la orden'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel17: TRzLabel
      Left = 280
      Top = 18
      Width = 43
      Height = 13
      Caption = 'Estatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object eddatosentrega: TRzDBRichEdit
      Left = 7
      Top = 56
      Width = 474
      Height = 41
      Hint = 'Descripci'#243'n de  la orden'
      DataField = 'DatosEntrega'
      DataSource = DSOrdenes
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
      OnKeyPress = rgmonedaKeyPress
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameVisible = True
    end
    object dvigencia: TRzDBDateTimeEdit
      Left = 109
      Top = 10
      Width = 116
      Height = 22
      Hint = 'Fecha de vigencia de la orden de compra'
      DataSource = DSOrdenes
      DataField = 'FechaVigencia'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnEnter = dvigenciaEnter
      OnKeyPress = rgmonedaKeyPress
      EditType = etDate
      FlatButtons = True
    end
    object edestatus: TRzComboBox
      Left = 328
      Top = 16
      Width = 153
      Height = 22
      Hint = 'El estatus de la orden'
      Ctl3D = False
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      KeepSearchCase = True
      ItemHeight = 14
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = ' '
      OnKeyPress = edestatusKeyPress
      OnNotInList = edestatusNotInList
      Items.Strings = (
        'REQUISICION'
        'CANCELADA'
        'ACEPTADA'
        'INCOMPLETO'
        'SURTIDO/SIN FACTURA'
        'SURTIDO/FACTURA'
        'CERRADO INCOMPLETO')
    end
  end
  object gbarticulo: TRzPanel
    Left = 352
    Top = 176
    Width = 649
    Height = 145
    BorderOuter = fsFlatRounded
    Color = clWhite
    Enabled = False
    TabOrder = 4
    object RzLabel27: TRzLabel
      Left = 152
      Top = 98
      Width = 36
      Height = 14
      Caption = 'Piezas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblproducto: TRzLabel
      Left = 11
      Top = 9
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
    object RzLabel14: TRzLabel
      Left = 141
      Top = 9
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
    object RzLabel23: TRzLabel
      Left = 432
      Top = 10
      Width = 81
      Height = 14
      Caption = 'Ultima Compra'
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
      Left = 281
      Top = 57
      Width = 72
      Height = 14
      Caption = 'Comentarios'
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
      Left = 216
      Top = 57
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
    object RzLabel19: TRzLabel
      Left = 141
      Top = 57
      Width = 54
      Height = 14
      Caption = 'Cant. Surt'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel16: TRzLabel
      Left = 93
      Top = 57
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
    object RzLabel15: TRzLabel
      Left = 7
      Top = 57
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
    object RzLabel25: TRzLabel
      Left = 7
      Top = 98
      Width = 41
      Height = 14
      Caption = 'Minimo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel24: TRzLabel
      Left = 72
      Top = 98
      Width = 43
      Height = 14
      Caption = 'Maximo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel26: TRzLabel
      Left = 216
      Top = 98
      Width = 24
      Height = 14
      Caption = 'Unid'
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
      Left = 546
      Top = 13
      Width = 71
      Height = 28
      Caption = '* ESC Limpia Captura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object edcodigo: TRzButtonEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 22
      Hint = 'Articulo a buscar'
      Color = clWhite
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
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edcodigoChange
      OnEnter = edcodigoEnter
      OnKeyPress = edcodigoKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 16450
      FlatButtons = True
      OnButtonClick = edcodigoButtonClick
    end
    object btnbuscaart: TRzBitBtn
      Left = 104
      Top = 25
      Width = 25
      Height = 22
      Color = clWhite
      TabOrder = 1
      OnClick = btnbuscaartClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000330B0000330B00000001000000000000000000003300
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
        0000000000000000000000000000000000000000000000000000E8ACDEE3E8E8
        E8E8E8E8E8E8E8E8E8E8E8ACDEE3E8E8E8E8E8E8E8E8E8E8E8E8AC807A81E3E8
        E8E8E8E8E8E8E8E8E8E8ACE28181E3E8E8E8E8E8E8E8E8E8E8E8E8CEA37A81E3
        E8E8E8E8E8E8E8E8E8E8E8ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA37A81
        E3E8E8E8E8E8E8E8E8E8E8E3ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA37A
        81E3E8E8E8E8E8E8E8E8E8E8E3ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA3
        7AACAD82828288E3E8E8E8E8E8E3ACE281ACE3818181E2E3E8E8E8E8E8E8D0CE
        E28288E6B3E6E682EBE8E8E8E8E8E3ACE281E2ACACACAC81E3E8E8E8E8E8E8E3
        8289B3B3B3D7D7D782E3E8E8E8E8E8E381E3ACACACE3E3E381E3E8E8E8E8E8AD
        88B3E6B3B3D7D7D7E688E8E8E8E8E8E3E2ACACACACE3E3E3ACE2E8E8E8E8E888
        89E6E6B3B3B3D7D7E682E8E8E8E8E8E2E3ACACACACACE3E3AC81E8E8E8E8E882
        E6E6E6E6B3B3B3B3B382E8E8E8E8E881ACACACACACACACACAC81E8E8E8E8E888
        E6B3E6E6E6B3B3B3E682E8E8E8E8E8E2ACACACACACACACACAC81E8E8E8E8E8AD
        88D7D7E6E6E6E6B38888E8E8E8E8E8E3E2E3E3ACACACACACE2E2E8E8E8E8E8E3
        82EBD7B3E6E6E68982E3E8E8E8E8E8E381E3E3ACACACACE381E3E8E8E8E8E8E8
        AD82ADE6E6E68882ADE8E8E8E8E8E8E8E381E3ACACACE281E3E8E8E8E8E8E8E8
        E8E38882828282E3E8E8E8E8E8E8E8E8E8E3E281818181E3E8E8}
      NumGlyphs = 2
    end
    object edDescripcion: TRzEdit
      Left = 136
      Top = 24
      Width = 289
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
      TabOrder = 2
    end
    object edultcompra: TRzEdit
      Left = 432
      Top = 24
      Width = 97
      Height = 22
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
    end
    object edcomentarios: TRzMemo
      Left = 280
      Top = 72
      Width = 249
      Height = 65
      Hint = 'Comentario sobre el articulo'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 8
      OnKeyPress = edcomentariosKeyPress
      DisabledColor = clWhite
      FrameColor = clActiveCaption
      FrameVisible = True
    end
    object edcantidad: TRzNumericEdit
      Left = 217
      Top = 72
      Width = 47
      Height = 22
      Hint = 'Teclee la cantidad de Articulos'
      Color = clWhite
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
      TabOrder = 7
      OnKeyPress = edcantidadKeyPress
      Max = 1000.000000000000000000
      Min = -1000.000000000000000000
      Value = 1.000000000000000000
      DisplayFormat = ',0;(,0)'
    end
    object edcant_sur: TRzNumericEdit
      Left = 145
      Top = 72
      Width = 47
      Height = 22
      Hint = 'Teclee la cantidad de Articulos'
      Color = clWhite
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
      TabOrder = 6
      OnKeyPress = edcant_surKeyPress
      Max = 1000.000000000000000000
      Min = -1000.000000000000000000
      DisplayFormat = ',0;(,0)'
    end
    object ediva_art: TRzEdit
      Left = 80
      Top = 72
      Width = 43
      Height = 22
      Hint = 'Iva que aplica al articulo'
      Color = clWhite
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
      TabOrder = 5
      OnKeyPress = ediva_artKeyPress
    end
    object EdCosto_unidad: TRzEdit
      Left = 7
      Top = 72
      Width = 66
      Height = 22
      Hint = 'Costo del articulo'
      Color = clWhite
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
      TabOrder = 4
      OnKeyPress = EdCosto_unidadKeyPress
    end
    object edmin: TRzEdit
      Left = 8
      Top = 115
      Width = 57
      Height = 22
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 10
    end
    object edmax: TRzEdit
      Left = 72
      Top = 115
      Width = 57
      Height = 22
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 11
    end
    object edpieza: TRzEdit
      Left = 144
      Top = 115
      Width = 57
      Height = 22
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 12
    end
    object edexist: TRzEdit
      Left = 216
      Top = 115
      Width = 57
      Height = 22
      Alignment = taRightJustify
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 13
    end
    object btnagregar: TRzBitBtn
      Left = 536
      Top = 80
      Width = 105
      Height = 57
      Hint = 'Agregar el articulo a la Orden de Compra'
      ModalResult = 1
      Caption = '&Agregar'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
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
  end
  object PBuscaArt: TRzGroupBox
    Left = 0
    Top = 168
    Width = 1001
    Height = 153
    Caption = ' Busqueda de Articulo '
    Color = clMoneyGreen
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    GroupStyle = gsBanner
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    Visible = False
    object RzLabel31: TRzLabel
      Left = 136
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel32: TRzLabel
      Left = 472
      Top = 40
      Width = 32
      Height = 13
      Caption = 'Clase'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel33: TRzLabel
      Left = 792
      Top = 40
      Width = 44
      Height = 13
      Caption = 'Articulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object cbgrupo: TRzComboBox
      Left = 8
      Top = 72
      Width = 320
      Height = 21
      Ctl3D = False
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      OnSelect = cbgrupoSelect
    end
    object cbclase: TRzComboBox
      Left = 336
      Top = 72
      Width = 320
      Height = 21
      Ctl3D = False
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 1
      OnSelect = cbclaseSelect
    end
    object cbarticulo: TRzComboBox
      Left = 664
      Top = 72
      Width = 320
      Height = 21
      Ctl3D = False
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 2
    end
    object btncerrar: TRzBitBtn
      Left = 888
      Top = 120
      Width = 99
      Caption = 'Cerrar'
      Color = 16776176
      HotTrack = True
      TabOrder = 3
      OnClick = btncerrarClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000420B0000420B00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E856E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E856E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8AC56E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8AC56E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8AC56E8E8
        17090909E8E8E8E8E8E8E8E8AC56E8E8AC565656E8E8E8E8E8E8E8E8E8AC5617
        1010101009E8E8E8E8E8E8E8E8AC56AC8181818156E8E8E8E8E8E8E8E8E81710
        1710101009E8E8E8E8E8E8E8E8E8AC81AC81818156E8E8E8E8E8E8E8E8171017
        1717101009E8E8E8E8E8E8E8E8AC81ACACAC818156E8E8E8E8E8E8E8E8105F5F
        1717101009E8E8E8E8E8E8E8E881ACACACAC818156E8E8E8E8E8E8E8E810D7D7
        5F1017101009E8E8E8E8E8E8E881D7D7AC81AC818156E8E8E8E8E8E8E8105F5F
        10D75F171009090909E8E8E8E881ACAC81D7ACAC8156565656E8E8E8E8E81010
        1010D75F091010101009E8E8E8E881818181D7AC568181818156E8E8E8E8E8E8
        E8E81010101710101009E8E8E8E8E8E8E8E8818181AC81818156E8E8E8E8E8E8
        E8E8E8105F1717101009E8E8E8E8E8E8E8E8E881ACACAC818156E8E8E8E8E8E8
        E8E8E8105F5F17101017E8E8E8E8E8E8E8E8E881ACACAC8181ACE8E8E8E8E8E8
        E8E8E810D75F101017E8E8E8E8E8E8E8E8E8E881D7AC8181ACE8E8E8E8E8E8E8
        E8E8E8E810101017E8E8E8E8E8E8E8E8E8E8E8E8818181ACE8E8}
      NumGlyphs = 2
    end
  end
  object btnimprimir: TRzBitBtn
    Left = 464
    Top = 448
    Width = 129
    Height = 33
    Caption = '&Imprimir'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 12
    OnClick = btnimprimirClick
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
      09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
      89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
      5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
      8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
      181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
      D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
      8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
      5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
      D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
      E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
      D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
      E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
      D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
      5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 288
    Top = 376
  end
  object DSOrdenes: TDataSource
    DataSet = tblOrdenes
    Left = 169
    Top = 373
  end
  object tblOrdenes: TMyTable
    TableName = 'RequisicionesInternas'
    Connection = DMAccesos.conexion
    BeforePost = tblOrdenesBeforePost
    FetchAll = True
    Left = 233
    Top = 373
    object tblOrdenesFechaRequisicion: TDateField
      FieldName = 'FechaRequisicion'
    end
    object tblOrdenesHoraRequisicion: TTimeField
      FieldName = 'HoraRequisicion'
    end
    object tblOrdenesFechaVigencia: TDateField
      FieldName = 'FechaVigencia'
    end
    object tblOrdenessubtotal: TFloatField
      FieldName = 'subtotal'
    end
    object tblOrdenesiva: TFloatField
      FieldName = 'iva'
    end
    object tblOrdenestotal: TFloatField
      FieldName = 'total'
    end
    object tblOrdenesestatus: TStringField
      FieldName = 'estatus'
      Size = 15
    end
    object tblOrdenesfletes: TFloatField
      FieldName = 'fletes'
    end
    object tblOrdenesotros: TFloatField
      FieldName = 'otros'
    end
    object tblOrdenesDatosEntrega: TMemoField
      FieldName = 'DatosEntrega'
      BlobType = ftMemo
    end
    object tblOrdenesTotalProductos: TIntegerField
      FieldName = 'TotalProductos'
    end
    object tblOrdenesusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object tblOrdenesfecha: TStringField
      FieldName = 'fecha'
      Size = 15
    end
    object tblOrdeneshora: TStringField
      FieldName = 'hora'
      Size = 15
    end
    object tblOrdenesUsuarioUltMod: TStringField
      FieldName = 'UsuarioUltMod'
      Size = 30
    end
    object tblOrdenesFechaUltMod: TStringField
      FieldName = 'FechaUltMod'
      Size = 15
    end
    object tblOrdenesHoraUltMod: TStringField
      FieldName = 'HoraUltMod'
      Size = 15
    end
    object tblOrdenesidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object tblOrdenessolicitante: TIntegerField
      FieldName = 'solicitante'
    end
    object tblOrdenescarguesea: TIntegerField
      FieldName = 'carguesea'
    end
    object tblOrdenesautorizado: TSmallintField
      FieldName = 'autorizado'
    end
    object tblOrdenesfactura: TStringField
      FieldName = 'factura'
    end
    object tblOrdenesidproveedor: TIntegerField
      FieldName = 'idproveedor'
    end
    object tblOrdenesmoneda: TStringField
      FieldName = 'moneda'
      FixedChar = True
      Size = 1
    end
    object tblOrdenestc: TFloatField
      FieldName = 'tc'
    end
    object tblOrdenesfechaentrega: TDateField
      FieldName = 'fechaentrega'
    end
    object tblOrdenesidrequisicion: TIntegerField
      FieldName = 'idrequisicion'
    end
  end
  object Sqlreal: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT'
      'd.idrequisicion,'
      'd.idcabm,'
      '(d.cantord + d.cantsurt) as cantord,'
      'd.cantsurt,'
      'd.comentario,'
      'd.costo,'
      'a.descripcion,'
      'd.iva,'
      'a.ultima_compra,'
      'a.minimo,'
      'a.maximo,'
      '(a.existencia/a.piezasxunidad) as existencia,'
      '(d.cantord * d.costo) as subtotal,'
      
        'if (d.iva > 0,ROUND(((d.cantord * d.costo)*(d.iva/100))+d.cantor' +
        'd *d.costo,3),ROUND(d.cantord * d.costo,3)) as TOTAL'
      'FROM ReqIntDetalle as d'
      'left join Cabms as a on d.idcabm = a.idcabm'
      'WHERE d.idrequisicion=:Id'
      'ORDER BY  d.idcabm asc')
    ReadOnly = True
    FetchAll = True
    Left = 336
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'Id'
        Value = ''
      end>
  end
  object DsRejilla: TDataSource
    DataSet = Sqlreal
    Left = 424
    Top = 376
  end
  object sqltemp: TMyQuery
    Connection = DMAccesos.conexion
    ReadOnly = True
    FetchAll = True
    Left = 376
    Top = 376
  end
  object pregunta: TLMDCheckListDlg
    CaptionTitle = 'Confirmaci'#243'n'
    Effect = deExplode
    ListBoxShowItems = 0
    ListBoxItemIndex = 0
    ListBoxWidth = 0
    Options = [cloRadioButtons, cloCheckButtons, cloSelectByClick, cloSpeedBtnFlat]
    Prompt = 'Existen requisiciones, desea cargarlas?'
    Items.Strings = (
      'Si'
      'No')
    Left = 472
    Top = 376
  end
end
