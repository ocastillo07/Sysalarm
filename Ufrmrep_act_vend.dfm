object frmrep_act_vend: Tfrmrep_act_vend
  Left = 287
  Top = 222
  Width = 261
  Height = 243
  ActiveControl = edbuscar
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Reportes '
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 253
    Height = 209
    BorderColor = clBlue
    Caption = 'Reporte Actividades Vendedor'
    Color = clWhite
    FlatColor = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 40
      Width = 69
      Height = 16
      Caption = 'Vendedor'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 32
      Top = 72
      Width = 44
      Height = 16
      Caption = 'Fecha'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edfecha: TRzDateTimeEdit
      Left = 80
      Top = 64
      Width = 129
      Height = 24
      Hint = 'Fecha a buscar'
      EditType = etDate
      FlatButtons = True
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = cbocodigoKeyPress
    end
    object btnalta: TRzBitBtn
      Left = 42
      Top = 160
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
      OnClick = btnaltaClick
      ImageIndex = 10
      Images = DMAccesos.ilopciones
    end
    object edbuscar: TRzButtonEdit
      Left = 80
      Top = 32
      Width = 129
      Height = 28
      Hint = 'Buscar Vendedor'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyPress = edbuscarKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edbuscarButtonClick
    end
    object btncerrar: TRzBitBtn
      Left = 125
      Top = 160
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
end
