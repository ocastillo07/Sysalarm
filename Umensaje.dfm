object frmmensaje: Tfrmmensaje
  Left = 222
  Top = 198
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'frmmensaje'
  ClientHeight = 65
  ClientWidth = 578
  Color = clBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzBackground1: TRzBackground
    Left = 0
    Top = 0
    Width = 577
    Height = 65
    Active = True
    Align = alNone
    FrameStyle = fsRaised
    GradientColorStart = clBlue
    GradientColorStop = clNavy
    GradientDirection = gdHorizontalCenter
    ImageStyle = isCenter
    ShowGradient = True
    ShowImage = False
    ShowTexture = False
  end
  object edt: TRzLabel
    Left = 16
    Top = 8
    Width = 562
    Height = 56
    Caption = 'PROCESANDO DATOS...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -48
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    BlinkIntervalOff = 5000
  end
end
