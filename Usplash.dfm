object frmsplash: Tfrmsplash
  Left = 243
  Top = 178
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'frmsplash'
  ClientHeight = 304
  ClientWidth = 418
  Color = clBtnFace
  TransparentColorValue = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SWFlogo: TShockwaveFlash
    Left = 0
    Top = 0
    Width = 418
    Height = 304
    Align = alCustom
    TabOrder = 0
    ControlData = {
      6755665510070000342B00006B1F0000080002000000000008004E0000004300
      3A005C0044006500760065006C006F0070006D0065006E0074005C0053007900
      730061006C00610072006D005C0041006C00610072006D00650078006C006F00
      67002E00730077006600000008004E00000043003A005C004400650076006500
      6C006F0070006D0065006E0074005C0053007900730061006C00610072006D00
      5C0041006C00610072006D00650078006C006F0067002E007300770066000000
      08000E000000570069006E0064006F00770000000B00FFFF0B00000008000A00
      00004800690067006800000008000200000000000B00FFFF0800000000000800
      020000000000080010000000530068006F00770041006C006C0000000B000000
      0B000000080002000000000008000000000008000200000000000D0000000000
      0000000000000000000000000B0001000B000000080000000000030000000000
      08000800000061006C006C00000008000C000000660061006C00730065000000}
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 360
  end
end