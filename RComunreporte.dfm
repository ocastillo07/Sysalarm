object FComunreporte: TFComunreporte
  Left = 492
  Top = 185
  Width = 404
  Height = 360
  Caption = 'FComunreporte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 396
    Height = 326
    ActivePage = TabSheet2
    Align = alClient
    TabHeight = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      TabVisible = False
      object Label1: TLabel
        Left = 0
        Top = 32
        Width = 112
        Height = 13
        Caption = 'Campos disponibles'
      end
      object SpeedButton1: TSpeedButton
        Left = 208
        Top = 248
        Width = 57
        Height = 22
        Caption = 'Subir'
        Flat = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 304
        Top = 248
        Width = 57
        Height = 22
        Caption = 'Bajar'
        Flat = True
        OnClick = SpeedButton2Click
      end
      object SpeedButton3: TSpeedButton
        Left = 208
        Top = 280
        Width = 153
        Height = 22
        Caption = 'Continuar ->'
        Enabled = False
        Flat = True
        OnClick = SpeedButton3Click
      end
      object Label4: TLabel
        Left = 207
        Top = 32
        Width = 130
        Height = 13
        Caption = 'Campos seleccionados'
      end
      object SpeedButton4: TSpeedButton
        Left = 160
        Top = 48
        Width = 45
        Height = 25
        Caption = '>'
        Flat = True
        OnClick = SpeedButton4Click
      end
      object SpeedButton5: TSpeedButton
        Left = 160
        Top = 104
        Width = 45
        Height = 25
        Caption = '<'
        Flat = True
        OnClick = SpeedButton5Click
      end
      object SpeedButton6: TSpeedButton
        Left = 160
        Top = 160
        Width = 45
        Height = 25
        Caption = '>>'
        Flat = True
        OnClick = SpeedButton6Click
      end
      object SpeedButton7: TSpeedButton
        Left = 160
        Top = 216
        Width = 45
        Height = 25
        Caption = '<<'
        Flat = True
        OnClick = SpeedButton7Click
      end
      object Label7: TLabel
        Left = 0
        Top = 8
        Width = 88
        Height = 13
        Caption = 'Relacion Padre'
      end
      object SpeedButton20: TSpeedButton
        Left = 80
        Top = 280
        Width = 121
        Height = 22
        Caption = 'Salir'
        Flat = True
        OnClick = SpeedButton20Click
      end
      object ListBox1: TListBox
        Left = 0
        Top = 48
        Width = 153
        Height = 193
        DragMode = dmAutomatic
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
        OnDblClick = ListBox1DblClick
      end
      object ListBox2: TListBox
        Left = 208
        Top = 48
        Width = 153
        Height = 193
        ItemHeight = 13
        TabOrder = 1
        OnClick = ListBox2Click
        OnDblClick = ListBox2DblClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      TabVisible = False
      object Label5: TLabel
        Left = 0
        Top = 32
        Width = 112
        Height = 13
        Caption = 'Campos disponibles'
      end
      object SpeedButton11: TSpeedButton
        Left = 160
        Top = 48
        Width = 45
        Height = 25
        Caption = '>'
        Flat = True
        OnClick = SpeedButton11Click
      end
      object SpeedButton12: TSpeedButton
        Left = 160
        Top = 80
        Width = 45
        Height = 25
        Caption = '<'
        Flat = True
        OnClick = SpeedButton12Click
      end
      object SpeedButton13: TSpeedButton
        Left = 160
        Top = 136
        Width = 45
        Height = 25
        Caption = '>>'
        Flat = True
        OnClick = SpeedButton13Click
      end
      object SpeedButton14: TSpeedButton
        Left = 160
        Top = 192
        Width = 45
        Height = 25
        Caption = '<<'
        Flat = True
        OnClick = SpeedButton14Click
      end
      object Label6: TLabel
        Left = 207
        Top = 32
        Width = 130
        Height = 13
        Caption = 'Campos seleccionados'
      end
      object SpeedButton15: TSpeedButton
        Left = 208
        Top = 248
        Width = 57
        Height = 22
        Caption = 'Subir'
        Flat = True
        OnClick = SpeedButton15Click
      end
      object SpeedButton16: TSpeedButton
        Left = 304
        Top = 248
        Width = 57
        Height = 22
        Caption = 'Bajar'
        Flat = True
        OnClick = SpeedButton16Click
      end
      object SpeedButton17: TSpeedButton
        Left = 240
        Top = 280
        Width = 121
        Height = 22
        Caption = 'Continuar ->'
        Enabled = False
        Flat = True
        OnClick = SpeedButton17Click
      end
      object Label8: TLabel
        Left = 0
        Top = 8
        Width = 95
        Height = 13
        Caption = 'Relacion Detalle'
      end
      object SpeedButton18: TSpeedButton
        Left = 152
        Top = 280
        Width = 81
        Height = 22
        Caption = '<-Volver'
        Flat = True
        OnClick = SpeedButton18Click
      end
      object SpeedButton21: TSpeedButton
        Left = 72
        Top = 280
        Width = 73
        Height = 22
        Caption = 'Salir'
        Flat = True
        OnClick = SpeedButton20Click
      end
      object ListBox3: TListBox
        Left = 0
        Top = 48
        Width = 153
        Height = 193
        DragMode = dmAutomatic
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
        OnDblClick = ListBox3DblClick
      end
      object ListBox4: TListBox
        Left = 208
        Top = 48
        Width = 153
        Height = 193
        ItemHeight = 13
        TabOrder = 1
        OnClick = ListBox2Click
        OnDblClick = ListBox4DblClick
      end
    end
    object TabSheet2: TTabSheet
      ImageIndex = 1
      TabVisible = False
      OnShow = TabSheet2Show
      object Label2: TLabel
        Left = 0
        Top = 80
        Width = 98
        Height = 13
        Caption = 'Titulo del reporte'
      end
      object Label3: TLabel
        Left = 0
        Top = 152
        Width = 91
        Height = 13
        Caption = 'Organizado por:'
      end
      object SpeedButton8: TSpeedButton
        Left = 243
        Top = 280
        Width = 135
        Height = 22
        Caption = 'Disenador de reporte'
        Flat = True
        OnClick = SpeedButton8Click
      end
      object SpeedButton9: TSpeedButton
        Left = 99
        Top = 280
        Width = 71
        Height = 22
        Caption = '<- Volver'
        Flat = True
        OnClick = SpeedButton9Click
      end
      object SpeedButton10: TSpeedButton
        Left = 174
        Top = 280
        Width = 65
        Height = 22
        Caption = 'Imprimir'
        Flat = True
        OnClick = SpeedButton8Click
      end
      object Label9: TLabel
        Left = 0
        Top = 24
        Width = 88
        Height = 13
        Caption = 'Campo Maestro'
      end
      object Label10: TLabel
        Left = 200
        Top = 24
        Width = 83
        Height = 13
        Caption = 'Campo Detalle'
      end
      object SpeedButton19: TSpeedButton
        Left = 14
        Top = 280
        Width = 81
        Height = 22
        Caption = 'Salir'
        Flat = True
        OnClick = SpeedButton19Click
      end
      object Edit1: TEdit
        Left = 0
        Top = 104
        Width = 369
        Height = 21
        TabOrder = 0
        Text = 'Reporte de ...'
      end
      object ComboBox1: TComboBox
        Left = 112
        Top = 150
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'ComboBox1'
      end
      object ComboBox2: TComboBox
        Left = 0
        Top = 40
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'ComboBox2'
      end
      object ComboBox3: TComboBox
        Left = 200
        Top = 40
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'ComboBox3'
      end
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 200
    Top = 200
  end
  object IBOQuery1: TMyQuery
    FetchAll = True
    Left = 20
    Top = 206
  end
  object IBOQuery2: TMyQuery
    FetchAll = True
    Left = 92
    Top = 206
  end
end
