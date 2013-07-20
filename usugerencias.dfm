object frmsugerencias: Tfrmsugerencias
  Left = 28
  Top = 102
  Width = 1001
  Height = 542
  Caption = 'frmsugerencias'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lista: TRzStringGrid
    Left = 0
    Top = 0
    Width = 745
    Height = 505
    ColCount = 1
    FixedCols = 0
    RowCount = 17
    FixedRows = 0
    TabOrder = 1
    ColWidths = (
      765)
  end
  object RzRadioGroup1: TRzRadioGroup
    Left = 744
    Top = 0
    Width = 225
    Height = 41
    Color = clWhite
    Columns = 10
    Items.Strings = (
      'Cantidad'
      'Con Rejas'
      'Sin Rejas')
    TabOrder = 0
  end
end
