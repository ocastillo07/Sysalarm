object frmboletas_mensualesElectronicas: Tfrmboletas_mensualesElectronicas
  Left = 299
  Top = 168
  Width = 797
  Height = 546
  Caption = 'Boletas mensuales de monitoreo'
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel6: TRzLabel
    Left = 18
    Top = 152
    Width = 56
    Height = 14
    Caption = 'Concepto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel3: TRzLabel
    Left = 23
    Top = 74
    Width = 26
    Height = 13
    Caption = 'D'#237'as:'
    Visible = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel8: TRzLabel
    Left = 8
    Top = 232
    Width = 125
    Height = 14
    Caption = 'Se les Genero Boletas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel7: TRzLabel
    Left = 202
    Top = 232
    Width = 215
    Height = 14
    Caption = 'Cuentas que NO se les genero boletas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel10: TRzLabel
    Left = 202
    Top = 248
    Width = 105
    Height = 28
    Caption = 'Ya tienia boletas(ped)'#13#10'o Bonificaciones'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel11: TRzLabel
    Left = 338
    Top = 248
    Width = 105
    Height = 14
    Caption = 'Clientes Sin Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lbltotal1: TLabel
    Left = 2
    Top = 449
    Width = 34
    Height = 13
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltotal2: TLabel
    Left = 200
    Top = 450
    Width = 34
    Height = 13
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltotal3: TLabel
    Left = 341
    Top = 450
    Width = 34
    Height = 13
    Caption = 'Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RzLabel9: TRzLabel
    Left = 467
    Top = -3
    Width = 307
    Height = 14
    Caption = 'Marque el(los) contrato(s) a los que le generara boletas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object pbar: TRzProgressBar
    Left = 472
    Top = 424
    Width = 305
    BorderWidth = 0
    InteriorOffset = 0
    PartsComplete = 0
    Percent = 0
    TotalParts = 0
  end
  object btncerrar: TRzBitBtn
    Left = 92
    Top = 472
    Width = 88
    Height = 23
    Hint = 'Cerrar esta pantalla'
    Caption = '&Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btncerrarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFF9FFFF7FFFFFFFFFF8FFF991FFFFFFF
      FFFFFF787FFFFFFFFFFFFF9B91FFFFFFF9FFFF7F87FFFFFFF8FFFFF999FFFFFF
      9FFFFFF7F7FFFFFF8FFFFFFF991FFFF91FFFFFFF787FFFF87FFFFFFFF991FF91
      FFFFFFFFF787FF87FFFFFFFFFF99191FFFFFFFFFFF78787FFFFFFFFFFFF991FF
      FFFFFFFFFFF787FFFFFFFFFFFF99191FFFFFFFFFFF78777FFFFFFFFFF991FF91
      FFFFFFFFF787FF77FFFFFFF9991FFFF91FFFFFF7887FFFF77FFFFF9B91FFFFFF
      91FFFF7F87FFFFFF77FFFF797FFFFFFFFF9FFF878FFFFFFFFF7FFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Images = DMAccesos.ilopciones
    NumGlyphs = 2
  end
  object vendedores: TRzGroupBox
    Left = 7
    Top = 8
    Width = 217
    Height = 145
    Caption = 'Clientes'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object RzLabel2: TRzLabel
      Left = 32
      Top = 104
      Width = 46
      Height = 16
      Caption = 'Hasta:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 24
      Top = 48
      Width = 51
      Height = 16
      Caption = 'Desde:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edbuscar: TRzButtonEdit
      Left = 84
      Top = 40
      Width = 89
      Height = 22
      Hint = 'Buscar la cuenta del cliente'
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
      OnKeyPress = edbuscarKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 16450
      FlatButtons = True
      OnButtonClick = edbuscarButtonClick
    end
    object edbuscar2: TRzButtonEdit
      Left = 84
      Top = 96
      Width = 89
      Height = 22
      Hint = 'Buscar la cuenta del cliente'
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
      TabOrder = 1
      OnKeyPress = edbuscar2KeyPress
      ButtonKind = bkFind
      ButtonShortCut = 16450
      FlatButtons = True
      OnButtonClick = edbuscar2ButtonClick
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 239
    Top = 8
    Width = 217
    Height = 145
    Caption = 'Apartir'
    Color = 16744448
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object RzLabel4: TRzLabel
      Left = 16
      Top = 70
      Width = 51
      Height = 16
      Caption = 'Meses:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel1: TRzLabel
      Left = 11
      Top = 16
      Width = 62
      Height = 32
      Alignment = taRightJustify
      Caption = 'Fecha A Partir:'
      Color = 16744448
      ParentColor = False
      WordWrap = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edmeses: TRzNumericEdit
      Left = 80
      Top = 62
      Width = 113
      Height = 24
      Hint = 'Tantos meses a realizar el pedido por boleta'
      DisabledColor = clWhite
      Enabled = False
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 1
      OnKeyPress = edfechaKeyPress
      Max = 12.000000000000000000
      Min = 1.000000000000000000
      Value = 12.000000000000000000
      DisplayFormat = ',0;(,0)'
    end
    object edfecha: TRzDateTimeEdit
      Left = 80
      Top = 16
      Width = 113
      Height = 24
      Hint = 'La fecha de vencimiento'
      Date = 32874.000000000000000000
      EditType = etDate
      Alignment = taRightJustify
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edfechaChange
      OnClick = edfechaClick
      OnKeyPress = edfechaKeyPress
    end
    object chkgenbol: TRzCheckBox
      Left = 72
      Top = 98
      Width = 121
      Height = 17
      Alignment = taLeftJustify
      AlignmentVertical = avCenter
      Caption = 'Enviar Boletas'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 2
      OnClick = chkgenbolClick
    end
    object chkpreview: TRzCheckBox
      Left = 112
      Top = 118
      Width = 81
      Height = 17
      Alignment = taLeftJustify
      AlignmentVertical = avCenter
      Caption = 'Preview'
      Checked = True
      HotTrack = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object mmconcepto: TRzMemo
    Left = 26
    Top = 168
    Width = 430
    Height = 56
    Enabled = False
    Lines.Strings = (
      'MONITOREO CORRESPONDIENTE A')
    TabOrder = 3
    DisabledColor = 16776176
    FrameColor = clBlue
    FrameVisible = True
  end
  object mm1: TMemo
    Left = 8
    Top = 248
    Width = 185
    Height = 201
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
    OnChange = mm1Change
  end
  object mm3: TRzMemo
    Left = 199
    Top = 276
    Width = 130
    Height = 173
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
    OnChange = mm3Change
    FrameColor = cl3DLight
    FrameVisible = True
  end
  object mmctacate: TRzMemo
    Left = 340
    Top = 275
    Width = 124
    Height = 174
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 6
    OnChange = mmctacateChange
    FrameColor = cl3DLight
    FrameVisible = True
  end
  object eddias: TRzNumericEdit
    Left = 479
    Top = 330
    Width = 90
    Height = 21
    Hint = 'Los dias entre boletas'
    DisabledColor = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    FrameColor = clActiveCaption
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 7
    Visible = False
    OnKeyPress = edfechaKeyPress
    Max = 999.000000000000000000
    Min = 1.000000000000000000
    Value = 28.000000000000000000
    DisplayFormat = ',0;(,0)'
  end
  object chkult_mes: TRzCheckBox
    Left = 471
    Top = 296
    Width = 98
    Height = 23
    Alignment = taLeftJustify
    AlignmentVertical = avCenter
    Caption = 'Ultimo d'#237'a del mes'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    State = cbChecked
    TabOrder = 8
    Visible = False
    OnClick = chkult_mesClick
    OnKeyPress = edfechaKeyPress
  end
  object clcontratos: TRzCheckList
    Left = 466
    Top = 13
    Width = 303
    Height = 257
    DisabledColor = clWhite
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameHotColor = clBlue
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 17
    TabOrder = 9
  end
  object btnalta: TRzBitBtn
    Left = 4
    Top = 472
    Width = 88
    Height = 23
    Hint = 'Dar click para generar el Reporte'
    ModalResult = 1
    Caption = '&Enviar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btnaltaClick
    ImageIndex = 10
    Images = DMAccesos.ilopciones
  end
  object adjuntos: TMemo
    Left = 472
    Top = 352
    Width = 305
    Height = 25
    Lines.Strings = (
      'adjuntos')
    TabOrder = 11
    Visible = False
  end
  object cuerpo: TMemo
    Left = 464
    Top = 384
    Width = 317
    Height = 25
    Lines.Strings = (
      'Memo1')
    TabOrder = 12
    Visible = False
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 48
    Top = 168
  end
  object sqlcontratos: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 536
    Top = 136
  end
  object Timer: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TimerTimer
    Left = 648
    Top = 312
  end
end
