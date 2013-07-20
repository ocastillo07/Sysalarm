object frmagendatelefonica: Tfrmagendatelefonica
  Left = 240
  Top = 108
  Width = 772
  Height = 577
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Agenda Telef'#243'nica'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 73
    Align = alTop
    BorderInner = fsFlatRounded
    BorderColor = 16776176
    Color = clNavy
    TabOrder = 4
    object lbbuscar: TLabel
      Left = 24
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Buscar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16776176
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 400
      Top = 12
      Width = 33
      Height = 13
      Caption = 'Filtro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16776176
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 584
      Top = 12
      Width = 30
      Height = 13
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16776176
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edbuscar: TRzEdit
      Left = 24
      Top = 36
      Width = 345
      Height = 21
      Hint = 'Ingrese el nombre a buscar'
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edbuscarChange
      OnKeyUp = edbuscarKeyUp
    end
    object cbfiltro: TRzComboBox
      Left = 400
      Top = 36
      Width = 145
      Height = 21
      Hint = 'Seleccione el filtro por el que desea buscar'
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'ID'
      OnChange = cbfiltroChange
      Items.Strings = (
        'ID'
        'NOMBRE'
        'DIRECCION')
      ItemIndex = 0
    end
    object cbtipo: TRzComboBox
      Left = 584
      Top = 36
      Width = 145
      Height = 21
      Hint = 'Seleccione el tipo de contacto'
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'CLIENTES'
      OnChange = cbtipoChange
      Items.Strings = (
        'CLIENTES'
        'EMPLEADOS'
        'PROVEEDORES')
      ItemIndex = 0
    end
  end
  object lista: TRzListView
    Left = 112
    Top = 88
    Width = 641
    Height = 249
    Color = clWhite
    Columns = <
      item
        Caption = 'Id'
      end
      item
        Caption = 'Nombre'
        Width = 280
      end
      item
        Caption = 'Direccion'
        Width = 285
      end>
    FillLastColumn = False
    FrameVisible = True
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = listaChange
    OnClick = listaClick
  end
  object gbdatos: TGroupBox
    Left = 8
    Top = 352
    Width = 489
    Height = 137
    Hint = 'Datos Personales del contacto'
    Caption = ' Datos Personales '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 48
      Height = 13
      Caption = 'Nombre:'
    end
    object Label5: TLabel
      Left = 16
      Top = 64
      Width = 59
      Height = 13
      Caption = 'Direccion:'
    end
    object Label9: TLabel
      Left = 16
      Top = 96
      Width = 42
      Height = 13
      Caption = 'Correo:'
    end
    object edcorreo: TRzEdit
      Left = 80
      Top = 88
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ednombre: TRzEdit
    Left = 88
    Top = 376
    Width = 385
    Height = 21
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 1
  end
  object eddireccion: TRzEdit
    Left = 88
    Top = 408
    Width = 385
    Height = 21
    CharCase = ecUpperCase
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 512
    Top = 352
    Width = 241
    Height = 137
    Hint = 'Telefonos del contacto'
    Caption = 'Tel'#233'fonos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object listaTelefonos: TRzListView
    Left = 520
    Top = 368
    Width = 217
    Height = 113
    Columns = <
      item
        Caption = 'N'#250'meros'
        Width = 196
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    ViewStyle = vsReport
  end
  object btncerrar: TRzBitBtn
    Left = 656
    Top = 496
    Width = 91
    Height = 33
    Caption = 'Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
  object rgsort: TRadioGroup
    Left = 8
    Top = 88
    Width = 97
    Height = 209
    Caption = ' Ordenar por '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 8
  end
  object rbtnid: TRzRadioButton
    Left = 16
    Top = 128
    Width = 41
    Height = 17
    Caption = 'Id'
    Checked = True
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentColor = False
    ParentFont = False
    TabOrder = 9
    TabStop = True
    OnClick = rbtnidClick
  end
  object rbtnnombre: TRzRadioButton
    Left = 16
    Top = 192
    Width = 73
    Height = 17
    Caption = 'Nombre'
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentColor = False
    ParentFont = False
    TabOrder = 10
    OnClick = rbtnnombreClick
  end
  object rbtndireccion: TRzRadioButton
    Left = 16
    Top = 256
    Width = 81
    Height = 17
    Caption = 'Direcci'#243'n'
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentColor = False
    ParentFont = False
    TabOrder = 11
    OnClick = rbtndireccionClick
  end
  object query: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 24
    Top = 312
  end
  object timer: TTimer
    Enabled = False
    Interval = 1200
    OnTimer = timerTimer
    Left = 56
    Top = 312
  end
end
