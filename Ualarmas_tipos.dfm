object frmalarmas_tipos: Tfrmalarmas_tipos
  Left = 312
  Top = 132
  Width = 478
  Height = 582
  Caption = 'Alarmas tipos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel_datos: TPanel
    Left = 8
    Top = 48
    Width = 457
    Height = 225
    Caption = ' '
    Enabled = False
    TabOrder = 0
    object lblclave: TRzLabel
      Left = 11
      Top = 11
      Width = 30
      Height = 13
      Caption = 'Clave:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel1: TRzLabel
      Left = 11
      Top = 39
      Width = 40
      Height = 13
      Caption = 'Nombre:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 11
      Top = 135
      Width = 59
      Height = 13
      Caption = 'Descripci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 72
      Width = 44
      Height = 13
      Caption = ' Prioridad'
    end
    object chekmonitoreo: TCheckBox
      Left = 8
      Top = 104
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = ' Se utiliza para monitoreo'
      TabOrder = 3
      OnClick = chekmonitoreoClick
      OnKeyPress = edclaveKeyPress
    end
    object edclave: TEdit
      Left = 64
      Top = 8
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edclaveExit
      OnKeyPress = edclaveKeyPress
    end
    object ednombre: TEdit
      Left = 64
      Top = 32
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyPress = edclaveKeyPress
    end
    object spinprioridad: TSpinEdit
      Left = 64
      Top = 64
      Width = 57
      Height = 22
      MaxValue = 9
      MinValue = 1
      TabOrder = 2
      Value = 1
      OnKeyPress = edclaveKeyPress
    end
    object mmdescripcion: TMemo
      Left = 16
      Top = 168
      Width = 425
      Height = 41
      Lines.Strings = (
        ' ')
      ScrollBars = ssVertical
      TabOrder = 4
      OnKeyPress = edclaveKeyPress
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 0
    Width = 457
    Height = 41
    Caption = ' '
    TabOrder = 2
    object Shape3: TShape
      Left = 328
      Top = 190
      Width = 457
      Height = 27
      Align = alCustom
      Brush.Color = clMaroon
    end
    object Shape5: TShape
      Left = 8
      Top = 8
      Width = 441
      Height = 26
      Align = alCustom
      Brush.Color = clMaroon
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 272
    Width = 457
    Height = 265
    Caption = 'Panel3'
    TabOrder = 1
    object Shape1: TShape
      Left = 148
      Top = 8
      Width = 82
      Height = 25
      Visible = False
    end
    object Shape37: TShape
      Left = 60
      Top = 8
      Width = 82
      Height = 25
      Visible = False
    end
    object Shape4: TShape
      Left = 236
      Top = 8
      Width = 82
      Height = 25
      Visible = False
    end
    object Shape2: TShape
      Left = 324
      Top = 8
      Width = 82
      Height = 25
      Visible = False
    end
    object DBGrid: TDBGrid
      Left = 8
      Top = 41
      Width = 441
      Height = 192
      DataSource = DSalarmas_tipos
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGridCellClick
    end
    object btnguardar: TButton
      Left = 65
      Top = 10
      Width = 75
      Height = 21
      Caption = 'Nuevo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnguardarClick
    end
    object btnmodificar: TButton
      Left = 153
      Top = 10
      Width = 75
      Height = 21
      Caption = 'Modificar'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnmodificarClick
    end
    object btnborrar: TButton
      Left = 241
      Top = 10
      Width = 75
      Height = 21
      Caption = 'Eliminar'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnborrarClick
    end
    object btncerrar: TButton
      Left = 329
      Top = 10
      Width = 75
      Height = 21
      Caption = 'Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btncerrarClick
    end
  end
  object DSalarmas_tipos: TDataSource
    DataSet = sqlgeneral
    Left = 416
    Top = 96
  end
  object sqlgeneral: TZQuery
    Connection = DM.ZC
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'select  *  from alarmas_tipos')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utModified, utInserted, utUnmodified]
    Left = 417
    Top = 145
    object sqlgeneralclave: TStringField
      DisplayLabel = 'Clave'
      FieldName = 'clave'
      Required = True
      Size = 16395
    end
    object sqlgeneralnombre: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'nombre'
      Required = True
      Size = 16395
    end
    object sqlgeneralprioridad: TSmallintField
      DisplayLabel = 'Prioridad'
      FieldName = 'prioridad'
      Required = True
    end
    object sqlgeneralcomment: TSmallintField
      FieldName = 'comment'
      Required = True
    end
    object sqlgeneralmonitoreo: TSmallintField
      DisplayLabel = 'Monitoreo'
      FieldName = 'monitoreo'
    end
    object sqlgeneraldescripcion: TMemoField
      DisplayLabel = 'Descripcion'
      FieldName = 'descripcion'
      Required = True
      BlobType = ftMemo
    end
  end
  object sql: TZQuery
    Connection = DM.ZC
    RequestLive = True
    CachedUpdates = False
    SQL.Strings = (
      'select *'
      'from alarmas_tipos')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utModified, utInserted, utUnmodified]
    Left = 417
    Top = 201
  end
end
