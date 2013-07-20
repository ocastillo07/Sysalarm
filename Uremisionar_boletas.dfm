object frmremisionar_boletas: Tfrmremisionar_boletas
  Left = 269
  Top = 190
  Width = 470
  Height = 464
  Caption = 'Remicionar Boletas'
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
  object gbperiodo: TRzGroupBox
    Left = 104
    Top = 8
    Width = 185
    Height = 97
    Caption = 'Periodo'
    Color = cl3DLight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object RzLabel2: TRzLabel
      Left = 12
      Top = 41
      Width = 39
      Height = 16
      Caption = 'Desde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 12
      Top = 73
      Width = 35
      Height = 16
      Caption = 'Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object dfecha1: TRzDateTimeEdit
      Left = 64
      Top = 32
      Width = 97
      Height = 24
      Hint = 'Fecha de inicio'
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
    end
    object dfecha2: TRzDateTimeEdit
      Left = 64
      Top = 64
      Width = 97
      Height = 24
      Hint = 'Fecha final'
      Date = 32874.000000000000000000
      EditType = etDate
      Alignment = taRightJustify
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object btncerrar: TRzBitBtn
    Left = 212
    Top = 379
    Width = 101
    Hint = 'Cerrar esta pantalla'
    ModalResult = 1
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
    TabOrder = 1
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
  object btnalta: TRzBitBtn
    Left = 104
    Top = 379
    Width = 108
    Hint = 
      'Dar click para remisionar las boletas de ese periodo de la fecha' +
      ' de alta'
    Caption = '&Remisionar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnaltaClick
    ImageIndex = 10
    Images = DMAccesos.ilopciones
  end
  object RzPanel1: TRzPanel
    Left = 16
    Top = 111
    Width = 409
    Height = 265
    Color = cl3DLight
    TabOrder = 3
    object RzLabel1: TRzLabel
      Left = 19
      Top = 9
      Width = 118
      Height = 16
      Caption = 'Boletas generadas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 222
      Top = 9
      Width = 145
      Height = 48
      Caption = 'Boletas NO generadas (cuentas canceladas y tienen pedidos)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 27
      Top = 57
      Width = 151
      Height = 16
      Caption = 'pedido-remicion-cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel6: TRzLabel
      Left = 279
      Top = 57
      Width = 91
      Height = 16
      Caption = 'pedido-cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object mm1: TRzMemo
      Left = 13
      Top = 72
      Width = 196
      Height = 169
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      FrameColor = clBlue
      FrameSides = []
      FrameVisible = True
    end
    object mm2: TRzMemo
      Left = 216
      Top = 72
      Width = 178
      Height = 169
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
      FrameColor = clBlue
      FrameSides = []
      FrameVisible = True
    end
  end
end
