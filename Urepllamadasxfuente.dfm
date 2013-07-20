object frmrepllamadasxfuente: Tfrmrepllamadasxfuente
  Left = 250
  Top = 280
  Width = 323
  Height = 213
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Reporte de llamadas por fuente'
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
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 313
    Height = 177
    Align = alCustom
    Alignment = taCenter
    BorderColor = clBlue
    Caption = 'Reporte de llamadas por fuente'
    Color = clWhite
    FlatColor = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object RzLabel2: TRzLabel
      Left = 24
      Top = 40
      Width = 86
      Height = 16
      Caption = 'Fecha Inicial:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
    end
    object RzLabel3: TRzLabel
      Left = 176
      Top = 40
      Width = 79
      Height = 16
      Caption = 'Fecha Final:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
    end
    object dinicial: TRzDateTimeEdit
      Left = 24
      Top = 64
      Width = 129
      Height = 24
      Hint = 'Fecha inicial'
      CalendarColors.Days = clWindowText
      CalendarColors.FillDays = clBtnShadow
      CalendarColors.DaysOfWeek = clWindowText
      CalendarColors.Lines = clBtnShadow
      CalendarColors.SelectedDateBack = clHighlight
      CalendarColors.SelectedDateFore = clHighlightText
      CalendarColors.TodaysDateFrame = clMaroon
      ClockFaceColors.Face = clBtnFace
      ClockFaceColors.Hands = clWindowText
      ClockFaceColors.Numbers = clWindowText
      ClockFaceColors.HourTicks = clBtnShadow
      ClockFaceColors.MinuteTicks = clWindowText
      EditType = etDate
      FlatButtons = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = dinicialKeyPress
    end
    object btngenerar: TRzBitBtn
      Left = 74
      Top = 144
      Width = 88
      Hint = 'Dar click para generar el Reporte'
      Caption = '&Generar'
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
      OnClick = btngenerarClick
      OnKeyPress = dinicialKeyPress
      ImageIndex = 10
      Images = DMAccesos.ilopciones
    end
    object dfinal: TRzDateTimeEdit
      Left = 168
      Top = 64
      Width = 129
      Height = 24
      Hint = 'Fecha final'
      CalendarColors.Days = clWindowText
      CalendarColors.FillDays = clBtnShadow
      CalendarColors.DaysOfWeek = clWindowText
      CalendarColors.Lines = clBtnShadow
      CalendarColors.SelectedDateBack = clHighlight
      CalendarColors.SelectedDateFore = clHighlightText
      CalendarColors.TodaysDateFrame = clMaroon
      ClockFaceColors.Face = clBtnFace
      ClockFaceColors.Hands = clWindowText
      ClockFaceColors.Numbers = clWindowText
      ClockFaceColors.HourTicks = clBtnShadow
      ClockFaceColors.MinuteTicks = clWindowText
      EditType = etDate
      FlatButtons = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = dinicialKeyPress
    end
    object btncerrar: TRzBitBtn
      Left = 157
      Top = 144
      Width = 88
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
      TabOrder = 3
      OnClick = btncerrarClick
      OnKeyPress = dinicialKeyPress
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
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 8
    Top = 136
  end
  object sqlgrabar: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 8
    Top = 88
  end
end
