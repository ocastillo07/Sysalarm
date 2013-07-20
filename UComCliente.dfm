object frmComCliente: TfrmComCliente
  Left = 203
  Top = 114
  Width = 504
  Height = 273
  Caption = 'frmComCliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Client: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '10.0.0.209'
    Port = 9950
    Left = 84
  end
  object sqlgeneral: TMyQuery
    FetchAll = True
    Left = 120
  end
end
