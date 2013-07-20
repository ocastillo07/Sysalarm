object frmprogreso: Tfrmprogreso
  Left = 356
  Top = 383
  Width = 441
  Height = 84
  Caption = 'Barra de Progreso'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object barra: TRzProgressBar
    Left = 0
    Top = 0
    Width = 433
    Height = 49
    BorderWidth = 0
    InteriorOffset = 0
    PartsComplete = 0
    Percent = 0
    TotalParts = 0
  end
end
