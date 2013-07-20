object frmcobros: Tfrmcobros
  Left = 406
  Top = 82
  Width = 607
  Height = 663
  Caption = 'Pantalla de cobros'
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 14
  object panel1: TRzPanel
    Left = 0
    Top = 0
    Width = 593
    Height = 65
    Align = alTop
    BorderInner = fsGroove
    BorderOuter = fsGroove
    BorderSides = []
    Color = clGradientInactiveCaption
    TabOrder = 1
    object RzLabel2: TRzLabel
      Left = 16
      Top = 44
      Width = 73
      Height = 16
      Caption = 'Folio Pago:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lcancelado: TRzLabel
      Left = 188
      Top = 44
      Width = 4
      Height = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbtitulo: TRzLabel
      Left = 8
      Top = 9
      Width = 8
      Height = 32
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkColor = clRed
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbfecha: TRzLabel
      Left = 581
      Top = 40
      Width = 4
      Height = 19
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edbuscar: TRzButtonEdit
      Left = 96
      Top = 40
      Width = 89
      Height = 22
      Hint = 'Buscar n'#250'mero de cobro'
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
      OnChange = edbuscarChange
      OnKeyPress = edbuscarKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edbuscarButtonClick
    end
    object tbherramientas: TToolBar
      Left = 408
      Top = 0
      Width = 172
      Height = 29
      Hint = 'Barra de Herramientas'
      Align = alNone
      AutoSize = True
      ButtonHeight = 23
      ButtonWidth = 28
      Caption = 'tbherramientas'
      Color = clWhite
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = DMAccesos.iledicion
      ParentColor = False
      TabOrder = 1
      object btncopy: TToolButton
        Left = 0
        Top = 2
        Action = frmprincipal.EditCopy1
      end
      object btncut: TToolButton
        Left = 28
        Top = 2
        Action = frmprincipal.EditCut1
      end
      object btnpaste: TToolButton
        Left = 56
        Top = 2
        Action = frmprincipal.EditPaste1
      end
      object btndelete: TToolButton
        Left = 84
        Top = 2
        Action = frmprincipal.EditDelete1
      end
      object btnundo: TToolButton
        Left = 112
        Top = 2
        Action = frmprincipal.EditUndo1
      end
      object btnfuentes: TToolButton
        Left = 140
        Top = 2
        Hint = 'Fuentes'
        Caption = '&Fuentes'
        Enabled = False
        ImageIndex = 19
      end
    end
  end
  object btnalta: TRzBitBtn
    Left = 280
    Top = 572
    Width = 102
    Height = 29
    Hint = 'Dar de Alta un Cobro'
    ModalResult = 1
    Caption = '&Cobrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnaltaClick
    ImageIndex = 10
    Images = DMAccesos.ilopciones
  end
  object btnborrar: TRzBitBtn
    Left = 384
    Top = 572
    Width = 102
    Height = 29
    Hint = 'Cancelar el cobro actual'
    ModalResult = 1
    Caption = 'Cancela&r'
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
    TabOrder = 3
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
    Left = 144
    Top = 564
    Width = 103
    Height = 29
    Hint = 'Editar los datos del cobro actual Actual'
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
    TabOrder = 4
    Visible = False
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
    Left = 488
    Top = 572
    Width = 94
    Height = 29
    Hint = 'Cerrar esta Pantalla'
    Caption = 'C&errar'
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
  object SPpanel: TRzSplitter
    Left = 11
    Top = 72
    Width = 582
    Height = 497
    Orientation = orVertical
    Position = 480
    Percent = 97
    UsePercent = True
    UpperLeft.BorderInner = fsBump
    UpperLeft.BorderOuter = fsFlat
    UpperLeft.Color = clWhite
    UpperLeft.FlatColor = clWhite
    LowerRight.BorderColor = clWhite
    LowerRight.BorderInner = fsBump
    LowerRight.BorderOuter = fsFlat
    LowerRight.Color = clWhite
    LowerRight.FlatColor = clWhite
    HotSpotVisible = True
    HotSpotSizePercent = 30
    SplitterStyle = ssGroove
    SplitterWidth = 7
    BorderColor = clBlue
    BorderHighlight = clBlack
    BorderInner = fsFlat
    BorderOuter = fsFlat
    BorderShadow = clBlue
    Color = clBlue
    FlatColor = clWhite
    TabOrder = 2
    BarSize = (
      2
      482
      580
      489)
    UpperLeftControls = (
      RzLabel16
      RzLabel17
      RzLabel18
      RzLabel19
      RzLabel20
      RzLabel21
      RzLabel23
      cxGrid1
      gbventa
      gbcliente
      gbcobro)
    LowerRightControls = (
      rgdocumentos)
    object RzLabel16: TRzLabel
      Left = 16
      Top = -16
      Width = 82
      Height = 16
      Caption = 'Fecha Vence'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel17: TRzLabel
      Left = 40
      Top = -16
      Width = 55
      Height = 16
      Caption = 'Restante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel18: TRzLabel
      Left = 48
      Top = -16
      Width = 55
      Height = 16
      Caption = 'Restante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel19: TRzLabel
      Left = 32
      Top = -16
      Width = 55
      Height = 16
      Caption = 'Restante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel20: TRzLabel
      Left = 56
      Top = -16
      Width = 55
      Height = 16
      Caption = 'Restante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel21: TRzLabel
      Left = 64
      Top = -16
      Width = 55
      Height = 16
      Caption = 'Restante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel23: TRzLabel
      Left = 96
      Top = -16
      Width = 55
      Height = 16
      Caption = 'Restante'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object cxGrid1: TcxGrid
      Left = 8
      Top = -193
      Width = 545
      Height = 193
      Hint = 'Doble Click para seleccionar esa parcialidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      object cxGridDBTableView1: TcxGridDBTableView
        OnDblClick = DBGVista1DblClick
        DataController.DataSource = DSparcialidades
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
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
        OptionsView.Navigator = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'Parcialidad'
          Options.Editing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 417
          DataBinding.FieldName = 'notas'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'IDPAGO'
          Width = 114
          DataBinding.FieldName = 'idpago'
        end
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'Pruebas'
        GridView = cxGridDBTableView1
      end
    end
    object gbventa: TRzGroupBox
      Left = 13
      Top = 8
      Width = 553
      Height = 89
      BorderColor = clActiveCaption
      Caption = 'Datos Venta'
      Color = clWhite
      FlatColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lborden: TRzLabel
        Left = 8
        Top = 24
        Width = 67
        Height = 16
        Caption = '# de Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel1: TRzLabel
        Left = 8
        Top = 56
        Width = 62
        Height = 16
        Caption = '# de Fact.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel3: TRzLabel
        Left = 216
        Top = 13
        Width = 37
        Height = 16
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lsaldo_venta: TRzLabel
        Left = 272
        Top = 12
        Width = 4
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel10: TRzLabel
        Left = 216
        Top = 33
        Width = 114
        Height = 16
        Caption = 'Saldo Parcialidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lsaldoparcialidad: TRzLabel
        Left = 336
        Top = 33
        Width = 4
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edbuscarventa: TRzButtonEdit
        Left = 88
        Top = 16
        Width = 113
        Height = 24
        Hint = 'Buscar por n'#250'mero de venta'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        TabOrder = 0
        OnKeyPress = edbuscarventaKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edbuscarventaButtonClick
      end
      object edbuscarfactura: TRzButtonEdit
        Left = 88
        Top = 48
        Width = 113
        Height = 24
        Hint = 'Buscar por n'#250'mero de factura'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        TabOrder = 1
        OnKeyPress = edbuscarfacturaKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edbuscarfacturaButtonClick
      end
    end
    object gbcliente: TRzGroupBox
      Left = 11
      Top = 104
      Width = 555
      Height = 73
      BorderColor = clActiveCaption
      Caption = 'Datos Cliente'
      Color = clWhite
      FlatColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object RzLabel4: TRzLabel
        Left = 8
        Top = 16
        Width = 45
        Height = 16
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel5: TRzLabel
        Left = 8
        Top = 33
        Width = 50
        Height = 16
        Caption = 'Nombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel6: TRzLabel
        Left = 168
        Top = 17
        Width = 37
        Height = 16
        Caption = 'Saldo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lnombre: TRzLabel
        Left = 72
        Top = 33
        Width = 4
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lsaldo_cliente: TRzLabel
        Left = 217
        Top = 17
        Width = 4
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lcuenta: TRzLabel
        Left = 105
        Top = 16
        Width = 4
        Height = 16
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel22: TRzLabel
        Left = 8
        Top = 51
        Width = 41
        Height = 16
        Caption = 'Sector'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbsector: TRzLabel
        Left = 72
        Top = 49
        Width = 4
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
    end
    object gbcobro: TRzGroupBox
      Left = 13
      Top = 177
      Width = 553
      Height = 296
      BorderColor = clActiveCaption
      Caption = '`'
      Color = clWhite
      FlatColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object RzLabel7: TRzLabel
        Left = 32
        Top = 24
        Width = 39
        Height = 16
        Caption = 'Fecha'
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
        Left = 32
        Top = 120
        Width = 38
        Height = 16
        Caption = 'Cobro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel9: TRzLabel
        Left = 40
        Top = 232
        Width = 35
        Height = 16
        Caption = 'Notas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel11: TRzLabel
        Left = 24
        Top = 152
        Width = 48
        Height = 32
        Alignment = taRightJustify
        Caption = 'Tipo de Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbcheque: TRzLabel
        Left = 248
        Top = 200
        Width = 60
        Height = 16
        Caption = '# Cheque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbbanco: TRzLabel
        Left = 21
        Top = 192
        Width = 51
        Height = 32
        Alignment = taRightJustify
        Caption = 'Selecc. Banco:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel24: TRzLabel
        Left = 252
        Top = 24
        Width = 101
        Height = 16
        Alignment = taRightJustify
        Caption = 'Tipo de Cambio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLine1: TRzLine
        Left = 0
        Top = 40
        Width = 553
        Height = 20
        LineColor = clGreen
      end
      object lbcobro: TRzLabel
        Left = 288
        Top = 136
        Width = 98
        Height = 18
        Caption = 'Cobro en MN:'
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbcobrodlls: TRzLabel
        Left = 272
        Top = 112
        Width = 113
        Height = 18
        Caption = 'Cobro en DLLS:'
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object ltotalCSI: TRzLabel
        Left = 296
        Top = 80
        Width = 4
        Height = 16
        Visible = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edabono: TRzEdit
        Left = 80
        Top = 112
        Width = 161
        Height = 27
        Hint = 'Monto a cobrar por el tipo de moneda'
        Alignment = taRightJustify
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentFont = False
        TabOrder = 3
        OnExit = edabonoExit
        OnKeyPress = edabonoKeyPress
      end
      object cboFormaPago: TRzComboBox
        Left = 80
        Top = 159
        Width = 161
        Height = 22
        Hint = 'Escoge el tipo de pago'
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = cboFormaPagoChange
        OnEnter = cboFormaPagoEnter
        OnExit = cboFormaPagoExit
        OnKeyPress = dfechaKeyPress
        OnNotInList = cboFormaPagoNotInList
        Items.Strings = (
          '(CA) CAJA'
          '(BA) HSBC'
          '(CB) CARGO AUT. CREDITO'
          '(CD) CARGO AUT. DEBITO'
          '(OX) OXXO'
          '(CM) CABLE MAS'
          '(AE) AMERICAN EXPRESS'
          '(AJ) AJUSTE'
          '(AB) ABOGADO'
          '(AT) ANTICIPOS')
      end
      object cbobancos: TRzComboBox
        Left = 80
        Top = 199
        Width = 161
        Height = 22
        Hint = 'Escoge el nombre del banco'
        CharCase = ecUpperCase
        Ctl3D = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnKeyPress = dfechaKeyPress
        OnNotInList = cbobancosNotInList
        Items.Strings = (
          '(CA) CAJA'
          '(BA) HSBC'
          '(CB) CARGO AUT. CREDITO'
          '(CD) CARGO AUT. DEBITO'
          '(OX) OXXO'
          '(CM) CABLE MAS'
          '(AE) AMERICAN EXPRESS'
          '(AJ) AJUSTE'
          '(AB) ABOGADO'
          '(AT) ANTICIPOS')
      end
      object edcheque: TRzEdit
        Left = 312
        Top = 200
        Width = 193
        Height = 24
        Hint = 'Numero de cheque '
        Alignment = taRightJustify
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentFont = False
        TabOrder = 6
        OnKeyPress = dfechaKeyPress
      end
      object edtipocambio: TRzEdit
        Left = 360
        Top = 16
        Width = 121
        Height = 27
        Hint = 'Tipo de cambio '
        Alignment = taRightJustify
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentFont = False
        TabOrder = 1
        OnChange = edtipocambioChange
        OnKeyPress = edtipocambioKeyPress
      end
      object rgmoneda: TRzRadioGroup
        Left = 16
        Top = 56
        Width = 225
        Height = 41
        Alignment = taCenter
        Caption = 'Tipo de moneda'
        Color = clWhite
        GroupStyle = gsStandard
        ItemHotTrack = True
        LightTextStyle = True
        TabOrder = 2
        TextStyle = tsRecessed
        object ckpesos: TRzCheckBox
          Left = 16
          Top = 16
          Width = 89
          Height = 17
          Hint = 'Pago en pesos'
          Alignment = taLeftJustify
          AlignmentVertical = avCenter
          Caption = 'Pesos'
          HotTrack = True
          State = cbUnchecked
          TabOrder = 0
          OnClick = ckpesosClick
          OnKeyPress = dfechaKeyPress
        end
        object ckdolares: TRzCheckBox
          Left = 120
          Top = 16
          Width = 89
          Height = 17
          Hint = 'Pago en d'#243'lares'
          Alignment = taLeftJustify
          AlignmentVertical = avCenter
          Caption = 'D'#243'lares'
          Color = clWhite
          HotTrack = True
          ParentColor = False
          State = cbUnchecked
          TabOrder = 1
          OnClick = ckdolaresClick
          OnKeyPress = dfechaKeyPress
        end
      end
      object dfecha: TRzDateTimeEdit
        Left = 80
        Top = 16
        Width = 143
        Height = 24
        EditType = etDate
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        FlatButtons = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FocusColor = 16776176
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        TabOrder = 0
        OnKeyPress = dfechaKeyPress
      end
      object ednotas: TRzMemo
        Left = 80
        Top = 230
        Width = 457
        Height = 59
        TabOrder = 7
        OnExit = ednotasExit
        FrameVisible = True
      end
      object chkDescuento: TRzCheckBox
        Left = 248
        Top = 166
        Width = 137
        Height = 17
        Hint = 
          'Al activar esta opci'#243'n a la venta se le aplica un descuento corr' +
          'espondiente'
        Caption = 'Aplica Descuento'
        Color = clWhite
        FillColor = clInactiveCaption
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        HighlightColor = clBlue
        HotTrack = True
        LightTextStyle = True
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbUnchecked
        TabOrder = 8
        Visible = False
        OnClick = chkDescuentoClick
      end
    end
    object rgdocumentos: TRzGroupBox
      Left = 8
      Top = 8
      Width = 561
      Height = 457
      BorderColor = clActiveCaption
      Caption = 'Documento a Cobrar'
      Color = clWhite
      FlatColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object RzLabel12: TRzLabel
        Left = 16
        Top = 216
        Width = 79
        Height = 16
        Caption = 'Fecha Venta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel13: TRzLabel
        Left = 16
        Top = 240
        Width = 82
        Height = 16
        Caption = 'Fecha Vence'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel14: TRzLabel
        Left = 40
        Top = 264
        Width = 55
        Height = 16
        Caption = 'Restante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel15: TRzLabel
        Left = 56
        Top = 288
        Width = 35
        Height = 16
        Caption = 'Notas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lfecha_venta: TRzDBLabel
        Left = 112
        Top = 216
        Width = 121
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
        DataField = 'FechaAlta'
        DataSource = DSparcialidades
      end
      object lfecha_vence: TRzDBLabel
        Left = 112
        Top = 240
        Width = 113
        Height = 17
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
        DataField = 'FechaVence'
        DataSource = DSparcialidades
      end
      object lrestante: TRzDBLabel
        Left = 112
        Top = 264
        Width = 65
        Height = 17
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
        DataField = 'restante'
        DataSource = DSparcialidades
      end
      object leyenda: TRzLabel
        Left = 104
        Top = 16
        Width = 322
        Height = 32
        Alignment = taCenter
        Caption = 
          'Seleccione la venta '#243' parcilidad a cobrar!, con un doble click '#243 +
          ' un  pulsando el bot'#243'n enter.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Bevel2: TBevel
        Left = 104
        Top = 344
        Width = 17
        Height = 97
        Shape = bsLeftLine
        Style = bsRaised
      end
      object letreropagos: TRzLabel
        Left = 18
        Top = 352
        Width = 79
        Height = 42
        Alignment = taRightJustify
        Caption = 'Pagos afectados por este cobro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object DBparcialidades: TcxGrid
        Left = 16
        Top = 48
        Width = 545
        Height = 161
        Hint = 'Doble Click para seleccionar esa parcialidad'
        BorderWidth = 1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        object DBGVista1: TcxGridDBTableView
          OnDblClick = DBGVista1DblClick
          OnKeyPress = DBGVista1KeyPress
          DataController.DataSource = DSparcialidades
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxNotas: TcxGridDBColumn
            Caption = 'Parcialidad'
            Options.Editing = False
            Options.Grouping = False
            Options.Moving = False
            Width = 224
            DataBinding.FieldName = 'notas'
          end
          object csFechaCorta: TcxGridDBColumn
            Width = 106
            DataBinding.FieldName = 'FechaVence'
          end
          object cxCantidad: TcxGridDBColumn
            Caption = 'Restante'
            Options.Editing = False
            Width = 127
            DataBinding.FieldName = 'restante'
          end
          object cxidpago: TcxGridDBColumn
            Caption = 'IdPago'
            Options.Editing = False
            Width = 72
            DataBinding.FieldName = 'idpago'
          end
        end
        object DBGLevel1: TcxGridLevel
          Caption = 'Pruebas'
          GridView = DBGVista1
        end
      end
      object dbmnotas: TRzDBRichEdit
        Left = 112
        Top = 288
        Width = 441
        Height = 49
        DataField = 'notas'
        DataSource = DSparcialidades
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnEnter = ednotasEnter
        OnExit = ednotasExit
        DisabledColor = clWhite
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameVisible = True
      end
      object mmpagos: TRzMemo
        Left = 117
        Top = 344
        Width = 164
        Height = 105
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
        FrameColor = cl3DLight
        FrameVisible = True
      end
    end
  end
  object btnFechaAplica: TRzBitBtn
    Left = 387
    Top = 31
    Width = 103
    Height = 29
    Hint = 'Cambio de fecha'
    ModalResult = 1
    Caption = '&Fecha'
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
    Visible = False
    OnClick = btnFechaAplicaClick
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
    ImageIndex = 15
    Images = DMAccesos.ilopciones
    NumGlyphs = 2
  end
  object btnimprimir: TRzBitBtn
    Left = 4
    Top = 569
    Width = 109
    Height = 32
    Hint = 'Imprimir recibo  del pago'
    Caption = '&Imprimir recibo'
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
    OnClick = btnimprimirClick
    ImageIndex = 20
    Images = DMAccesos.ilopciones
  end
  object btncobros: TRzBitBtn
    Left = 376
    Top = 1
    Width = 33
    Height = 28
    Hint = 'Lo que debe el cliente'
    Caption = '&D'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = btncobrosClick
    ImageIndex = 7
    Images = DMAccesos.ilopciones
  end
  object fuentes: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 552
  end
  object DSpagos: TDataSource
    Left = 64
    Top = 504
  end
  object DSparcialidades: TDataSource
    DataSet = sqlparcialidades
    Left = 120
    Top = 496
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 16
    Top = 472
  end
  object sqlparcialidades: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT idpago,notas,FechaAlta,FechaVence,restante,idremicion,mov' +
        'imiento,FechaCorta FROM PagosClientes')
    FetchAll = True
    Left = 160
    Top = 496
  end
  object SqlPagos: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 32
    Top = 520
  end
end
