object frmConfiguracionesXConcepto: TfrmConfiguracionesXConcepto
  Left = 370
  Top = 257
  Width = 289
  Height = 187
  Caption = 'Configuraciones por concepto'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object lblTitulo: TRzLabel
    Left = 120
    Top = 8
    Width = 44
    Height = 16
    Caption = 'Desde:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblMensaje: TRzLabel
    Left = 120
    Top = 72
    Width = 44
    Height = 16
    Caption = 'Desde:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object dfecha: TRzDateTimeEdit
    Left = 96
    Top = 48
    Width = 97
    Height = 24
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
  object btnActualizar: TBitBtn
    Left = 88
    Top = 112
    Width = 113
    Height = 25
    Caption = '&Actualizar'
    Default = True
    TabOrder = 1
    OnClick = btnActualizarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object txtConcepto: TEdit
    Left = 84
    Top = 48
    Width = 121
    Height = 24
    TabOrder = 2
  end
end
