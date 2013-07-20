object AjusteDetalles: TAjusteDetalles
  Left = 98
  Top = 182
  Width = 738
  Height = 531
  Caption = 'Alarmex :: Ajuste Detalles'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 730
    Height = 33
    Align = alTop
    Brush.Color = clMaroon
  end
  object Label14: TLabel
    Left = 8
    Top = 16
    Width = 38
    Height = 14
    Caption = 'Buscar:'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 270
    Top = 16
    Width = 15
    Height = 14
    Caption = 'En:'
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object S1: TShape
    Left = 437
    Top = 9
    Width = 81
    Height = 25
    Visible = False
  end
  object BUSCAR: TEdit
    Left = 56
    Top = 8
    Width = 201
    Height = 23
    Hint = 'Palabra a Buscar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnEnter = BUSCAREnter
    OnExit = BUSCARExit
  end
  object TIPO: TComboBox
    Left = 288
    Top = 8
    Width = 145
    Height = 22
    Hint = 'Tipos de Busqueda'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 14
    ItemIndex = 0
    ParentFont = False
    TabOrder = 1
    Text = 'No. de Cuenta'
    OnEnter = TIPOEnter
    OnExit = TIPOExit
    Items.Strings = (
      'No. de Cuenta'
      'Nombre'
      'Direcci'#243'n'
      'Tel'#233'fono'
      'Responsable')
  end
  object Bbuscar: TBitBtn
    Left = 440
    Top = 11
    Width = 75
    Height = 20
    Caption = 'Buscar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 2
    OnClick = BbuscarClick
    OnEnter = BbuscarEnter
    OnExit = BbuscarExit
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      333333773337777333333078F8F87033333337F3333337F33333778F8F8F8773
      333337333333373F333307F8F8F8F70333337F33FFFFF37F3333078F8F8F8703
      33337F377777337F333307F8F8F8F703333373F3333333733333778F8F8F8773
      333337F3333337F333333078F8F870333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 730
    Height = 72
    Align = alTop
    DataSource = DM.DSQCLIENTES
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'account'
        Title.Caption = 'Cuenta'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nombre'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 219
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dir'
        Title.Caption = 'Direccion'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Title.Caption = 'Numero'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone1'
        Title.Caption = 'Telefono'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = 'Tipo'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object PanAjusteDetalles: TPanel
    Left = 0
    Top = 112
    Width = 729
    Height = 385
    BevelInner = bvLowered
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 40
      Height = 15
      Caption = 'Trafico:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 141
      Width = 75
      Height = 15
      Caption = 'Comentarios:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object S2: TShape
      Left = 509
      Top = 355
      Width = 81
      Height = 25
      Visible = False
    end
    object S3: TShape
      Left = 642
      Top = 355
      Width = 81
      Height = 25
      Visible = False
    end
    object DBGTrafico: TDBGrid
      Left = 8
      Top = 20
      Width = 713
      Height = 117
      Align = alCustom
      DataSource = DM.DSQHISTORIAL_ALARMAS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGTraficoDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'fecha_pc'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Fecha'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora_pc'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Hora'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descripcion'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Descripcion'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zona'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Zona'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Estatus'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'conclusion2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Conclusion'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 195
          Visible = True
        end>
    end
    object DBGcomentarios: TDBGrid
      Left = 8
      Top = 160
      Width = 713
      Height = 120
      DataSource = DM.DSQALARMAS_DETALLE
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'fecha'
          Title.Caption = 'Fecha'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora'
          Title.Caption = 'Hora'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'user'
          Title.Caption = 'User'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'action'
          Title.Caption = 'Accion'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = [fsBold]
          Width = 387
          Visible = True
        end>
    end
    object DBMdetalles: TDBMemo
      Left = 8
      Top = 288
      Width = 497
      Height = 89
      DataField = 'detalle'
      DataSource = DM.DSQALARMAS_DETALLE
      TabOrder = 2
      OnEnter = DBMdetallesEnter
      OnExit = DBMdetallesExit
    end
    object BBmodificar: TBitBtn
      Left = 512
      Top = 357
      Width = 75
      Height = 20
      Caption = 'Modificar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 3
      OnClick = BBmodificarClick
      OnEnter = BBmodificarEnter
      OnExit = BBmodificarExit
    end
    object BBsalir: TBitBtn
      Left = 645
      Top = 357
      Width = 75
      Height = 20
      Caption = 'Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 4
      OnClick = BBsalirClick
      OnEnter = BBsalirEnter
      OnExit = BBsalirExit
    end
  end
end
