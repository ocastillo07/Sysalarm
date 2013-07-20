object frmReClasificacion: TfrmReClasificacion
  Left = 233
  Top = 79
  Width = 872
  Height = 623
  Cursor = crArrow
  ActiveControl = edcvecte
  Caption = 'Reclasificacion de Eventos'
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 84
    Top = 49
    Width = 86
    Height = 11
    Caption = 'Nombre Completo:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel2: TRzLabel
    Left = 4
    Top = 544
    Width = 85
    Height = 16
    Caption = 'Clasificacion:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object gbcliente: TGroupBox
    Left = 0
    Top = 0
    Width = 856
    Height = 105
    Align = alTop
    Caption = 'Datos del cliente'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object RzLabel9: TRzLabel
      Left = 343
      Top = 69
      Width = 68
      Height = 11
      Caption = 'Codigo postal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblmovil: TRzLabel
      Left = 475
      Top = 69
      Width = 32
      Height = 11
      Caption = 'Sector:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblciudad: TRzLabel
      Left = 650
      Top = 43
      Width = 36
      Height = 11
      Caption = 'Ciudad:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblestado: TRzLabel
      Left = 4
      Top = 66
      Width = 34
      Height = 11
      Caption = 'Estado:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcolonia: TRzLabel
      Left = 186
      Top = 66
      Width = 39
      Height = 11
      Caption = 'Colonia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblentre: TRzLabel
      Left = 587
      Top = 68
      Width = 27
      Height = 11
      Caption = 'Entre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblalta: TRzLabel
      Left = 2
      Top = 41
      Width = 19
      Height = 11
      Caption = 'Alta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblfuente: TRzLabel
      Left = 144
      Top = 88
      Width = 34
      Height = 11
      Caption = 'Fuente:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblorigen: TRzLabel
      Left = 5
      Top = 88
      Width = 34
      Height = 11
      Caption = 'Origen:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblnombre: TRzLabel
      Left = 84
      Top = 42
      Width = 86
      Height = 11
      Caption = 'Nombre Completo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel12: TRzLabel
      Left = 3
      Top = 19
      Width = 42
      Height = 14
      Caption = 'Cuenta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel13: TRzLabel
      Left = 383
      Top = 44
      Width = 26
      Height = 11
      Caption = 'Calle:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel14: TRzLabel
      Left = 572
      Top = 44
      Width = 39
      Height = 11
      Caption = 'Numero:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel47: TRzLabel
      Left = 148
      Top = 25
      Width = 63
      Height = 11
      Caption = 'Razon Social:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 368
      Top = 21
      Width = 74
      Height = 14
      Caption = 'Tipo de control:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcategoria: TRzLabel
      Left = 693
      Top = 19
      Width = 48
      Height = 13
      Caption = 'Categoria:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel45: TRzLabel
      Left = 556
      Top = 19
      Width = 22
      Height = 13
      Caption = 'Giro:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object ednombre: TRzDBEdit
      Left = 167
      Top = 39
      Width = 213
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'cliente'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 0
    end
    object RzDBEdit1: TRzDBEdit
      Left = 39
      Top = 81
      Width = 98
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'origen'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 1
    end
    object c: TRzDBEdit
      Left = 181
      Top = 81
      Width = 84
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'fuente'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
    end
    object RzDBEdit6: TRzDBEdit
      Left = 407
      Top = 39
      Width = 161
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'dir'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
    end
    object RzDBEdit7: TRzDBEdit
      Left = 609
      Top = 39
      Width = 37
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'numero'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
    end
    object RzDBEdit8: TRzDBEdit
      Left = 687
      Top = 39
      Width = 102
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'ciudad'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
    end
    object RzDBEdit9: TRzDBEdit
      Left = 41
      Top = 56
      Width = 142
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'estado'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 6
    end
    object RzDBEdit10: TRzDBEdit
      Left = 223
      Top = 62
      Width = 114
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'colonia'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 7
    end
    object RzDBEdit11: TRzDBEdit
      Left = 410
      Top = 63
      Width = 55
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'cp'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 8
    end
    object RzDBEdit12: TRzDBEdit
      Left = 25
      Top = 35
      Width = 55
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'st_date'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 9
    end
    object RzDBEdit3: TRzDBEdit
      Left = 507
      Top = 63
      Width = 74
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'Sector'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 10
    end
    object edrsocial: TRzDBEdit
      Left = 211
      Top = 20
      Width = 150
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'rsocial'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 11
    end
    object edcontrol: TRzDBEdit
      Left = 444
      Top = 15
      Width = 106
      Height = 22
      DataSource = dsclientes
      DataField = 'alarm'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 12
    end
    object edcategoria: TRzDBEdit
      Left = 744
      Top = 15
      Width = 107
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'Categoria'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 13
    end
    object edGiro: TRzDBEdit
      Left = 583
      Top = 15
      Width = 107
      Height = 20
      Hint = 'Nombre o Nombres del Prospecto'
      DataSource = dsclientes
      DataField = 'Giro'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 14
    end
    object edcvecte: TRzButtonEdit
      Left = 47
      Top = 12
      Width = 97
      Height = 22
      Hint = 'Buscar en el catalogo'
      DisabledColor = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 15
      OnKeyPress = edcvecteKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edcvecteButtonClick
    end
    object RzDBRichEdit1: TRzDBRichEdit
      Left = 616
      Top = 65
      Width = 241
      Height = 33
      BevelInner = bvNone
      BevelOuter = bvNone
      DataField = 'refs'
      DataSource = dsclientes
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      FrameController = DMAccesos.frmctr
    end
  end
  object gbtrafico: TRzGroupBox
    Left = 0
    Top = 105
    Width = 856
    Height = 168
    Align = alTop
    Caption = 'Trafico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object cxtrafico: TcxGrid
      Left = 1
      Top = 17
      Width = 854
      Height = 150
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object vista1: TcxGridDBTableView
        DataController.DataSource = dstrafico
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        OnCellClick = vista1CellClick
        Filtering.Visible = fvNever
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Appending = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.Navigator = True
        OptionsView.NavigatorOffset = 500000
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.Indicator = True
        object vista1DBColumn7: TcxGridDBColumn
          Caption = 'Evento'
          Width = 41
          DataBinding.FieldName = 'id'
        end
        object vista1DBColumn1: TcxGridDBColumn
          Caption = 'Hora'
          Width = 79
          DataBinding.FieldName = 'hora_pc'
        end
        object vista1DBColumn2: TcxGridDBColumn
          Caption = 'Fecha'
          Width = 99
          DataBinding.FieldName = 'fecha_pc'
        end
        object vista1DBColumn3: TcxGridDBColumn
          Caption = 'Descripcion'
          Width = 203
          DataBinding.FieldName = 'descripcion'
        end
        object vista1DBColumn4: TcxGridDBColumn
          Caption = 'Zona'
          Width = 48
          DataBinding.FieldName = 'zona'
        end
        object vista1DBColumn5: TcxGridDBColumn
          Caption = 'Estatus'
          Width = 161
          DataBinding.FieldName = 'nombre'
        end
        object vista1DBColumn6: TcxGridDBColumn
          Caption = 'Conclusion'
          Width = 217
          DataBinding.FieldName = 'status'
        end
      end
      object nivel1: TcxGridLevel
        Caption = 'Reporte Resultado de Busquedas'
        GridView = vista1
      end
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 0
    Top = 273
    Width = 856
    Height = 136
    Align = alTop
    Caption = 'Comentarios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object cxcomentarios: TcxGrid
      Left = 1
      Top = 17
      Width = 854
      Height = 118
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxcvista1: TcxGridDBTableView
        DataController.DataSource = dscomentarios
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = True
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = True
        NavigatorButtons.Post.Visible = True
        NavigatorButtons.Cancel.Visible = True
        NavigatorButtons.Refresh.Visible = True
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        OnEditValueChanged = cxcvista1EditValueChanged
        Filtering.CustomizeDialog = False
        Filtering.Visible = fvNever
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Deleting = False
        OptionsView.Navigator = True
        OptionsView.NavigatorOffset = 500000
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.Indicator = True
        object cxcvista1DBColumn1: TcxGridDBColumn
          Caption = 'Fecha'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 58
          DataBinding.FieldName = 'fecha'
        end
        object cxcvista1DBColumn2: TcxGridDBColumn
          Caption = 'Hora'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 63
          DataBinding.FieldName = 'hora'
        end
        object cxcvista1DBColumn3: TcxGridDBColumn
          Caption = 'Usuario'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 64
          DataBinding.FieldName = 'user'
        end
        object cxcvista1DBColumn4: TcxGridDBColumn
          Caption = 'Accion'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 152
          DataBinding.FieldName = 'action'
        end
        object cxcvista1DBColumn5: TcxGridDBColumn
          Caption = 'Detalle'
          PropertiesClassName = 'TcxMemoProperties'
          Options.Filtering = False
          Options.Moving = False
          Width = 494
          DataBinding.FieldName = 'detalle'
        end
      end
      object cxcnivel1: TcxGridLevel
        Caption = 'Reporte Resultado de Busquedas'
        GridView = cxcvista1
      end
    end
  end
  object cboclasificacion: TRzComboBox
    Left = 6
    Top = 560
    Width = 145
    Height = 21
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 3
  end
  object btnactualizar: TRzBitBtn
    Left = 160
    Top = 558
    Width = 89
    Caption = '&Actualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 4
    OnClick = btnactualizarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
      090909090909090909E8E8E881818181818181818181818181E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
      090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
      101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
      090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
      0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
      0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
      090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btncerrar: TRzBitBtn
    Left = 378
    Top = 558
    Width = 84
    Caption = '&Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 5
    OnClick = btncerrarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730B0000730B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
      E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
      57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
      578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
      57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
      57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
      57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
      57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
      57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
      57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
      57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
      57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
      57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
      57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
      57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
      57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object gbhistoRecla: TRzGroupBox
    Left = 0
    Top = 409
    Width = 856
    Height = 136
    Align = alTop
    Caption = 'Historial de Reclasificaciones por Evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object cxGrid1: TcxGrid
      Left = 1
      Top = 17
      Width = 854
      Height = 118
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = dshistorial
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        Filtering.CustomizeDialog = False
        Filtering.Visible = fvNever
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.Navigator = True
        OptionsView.NavigatorOffset = 500000
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.Indicator = True
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'Evento'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 55
          DataBinding.FieldName = 'idevento'
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'Clasificacion Anterior'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 150
          DataBinding.FieldName = 'ClasifAnt'
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Nueva Clasificacion'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 124
          DataBinding.FieldName = 'ClasifAct'
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = 'Usuario'
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.Moving = False
          Width = 194
          DataBinding.FieldName = 'usuario'
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = 'Fecha'
          PropertiesClassName = 'TcxMemoProperties'
          Options.Filtering = False
          Options.Moving = False
          Width = 287
          DataBinding.FieldName = 'fecha'
        end
        object cxGridDBTableView1DBColumn1: TcxGridDBColumn
          Caption = 'Hora'
          Width = 38
          DataBinding.FieldName = 'hora'
        end
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'Reporte Resultado de Busquedas'
        GridView = cxGridDBTableView1
      end
    end
  end
  object btnemail: TRzBitBtn
    Left = 250
    Top = 558
    Width = 127
    Caption = 'Enviar por Email'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 7
    OnClick = btnemailClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8815656565656
      565656565656565656568181818181818181818181818181818181D6D6D6D6D6
      D6D6D6D6D6D6D6D6D65681E8E8E8E8E8E8E8E8E8E8E8E8E8E88181D6D6D6D6D6
      D6D6D6D6D6D6D6D6D65681E8E8E8E8E8E8E8E8E8E8E8E8E8E88181D7D6D60909
      09090909D6D6D6D6D65681D7E8E8818181818181E8E8E8E8E88181D6D7D6D6D6
      D6D6D6D6D6D6D6D6D65681E8D7E8E8E8E8E8E8E8E8E8E8E8E88181D7D7D60909
      09090909D6D6D6D6D65681D7D7E8818181818181E8E8E8E8E88181D7D6D7D6D6
      D6D6D6D6D6D6D6D6D65681D7E8D7E8E8E8E8E8E8E8E8E8E8E88181D7D7D6D7D6
      D6D6D6D6D6D6906CD65681D7D7E8D7E8E8E8E8E8E8E88181E88181D7D7D7D7D6
      D6D6D6D6D6D6B690D65681D7D7D7D7E8E8E8E8E8E8E88181E88181D7D7D7D6D7
      D6D6D6D6D6D6D6D6D65681D7D7D7E8D7E8E8E8E8E8E8E8E8E881818181818181
      8181818181818181818181818181818181818181818181818181E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object sqlclientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT clientes.idfact,clientes.precio,'
      
        '  clientes.idcliente,concat(ifnull(clientes.nombre,'#39' '#39'),'#39' '#39',ifnu' +
        'll(clientes.apaterno,'#39' '#39'),'#39' '#39',ifnull(clientes.amaterno,'#39' '#39')) as ' +
        'cliente,'
      '  ClientesFact.rsocial,'
      '  clientes.dir,'
      '  clientes.numero,'
      '  clientes.ciudad,'
      '  clientes.estado,'
      '  colonias.nombre AS Colonia,'
      '  colonias.cp,'
      '  sectores.nombre AS Sector,'
      '  clientes.st_date,'
      '  clientes.refs,clientes.alarm,'
      '  origen.nombre AS Origen,'
      '  fuentes.nombre AS Fuente,'
      '  giros.nombre AS Giro,'
      '  categorias.nombre AS Categoria,clientes.idvendedor'
      'FROM'
      '  clientes'
      '  left JOIN colonias ON (clientes.idcol = colonias.idcol)'
      '  left JOIN col_sector ON (colonias.idcol = col_sector.idcol)'
      
        '  left JOIN sectores ON (col_sector.idsector = sectores.idsector' +
        ')'
      '  left JOIN origen ON (clientes.idorigen = origen.idorigen)'
      '  left JOIN fuentes ON (clientes.idfuente = fuentes.idfuente)'
      '  left JOIN giros ON (clientes.idgiro = giros.idgiro)'
      
        '  left JOIN categorias ON (clientes.idcategoria = categorias.idc' +
        'ategoria)'
      
        '  left join ClientesFact ON (clientes.idfact = ClientesFact.idfa' +
        'ct)'
      'where clientes.idcliente =  :idcliente')
    ReadOnly = True
    FetchAll = True
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcliente'
      end>
  end
  object dsclientes: TDataSource
    DataSet = sqlclientes
    Left = 296
    Top = 72
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPresupuesto.cveart,articulos.nombre,DetPresupuesto.can' +
        't,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_' +
        'esp/100 as descuento,articulos.aplica_desc,'
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',articulos.precioa,if ' +
        '(DetPresupuesto.utilidad = '#39'B'#39',articulos.preciob,if (DetPresupue' +
        'sto.utilidad = '#39'C'#39',articulos.precioc,if (DetPresupuesto.utilidad' +
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),3) as precio,  '
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',if (articulos.aplica_' +
        'desc = '#39'True'#39','
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioa/articulos.piezas_envase)-((articulos.preci' +
        'oa/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezas_envase)-((articulos.precioa/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioa+(articulos.precioa*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioa/articulos.piezas_envase)+((articulos.precioa/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      ''
      
        'if (DetPresupuesto.utilidad = '#39'B'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciob-(articulos.preciob*articulos.desc_esp/100))' +
        ' +((articulos.preciob-(articulos.preciob*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciob/articulos.piezas_envase)-((articulos.preci' +
        'ob/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciob/articulos.piezas_envase)-((articulos.preciob/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciob+(articulos.preciob*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'ciob/articulos.piezas_envase)+((articulos.preciob/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'C'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.precioc-(articulos.precioc*articulos.desc_esp/100))' +
        ' +((articulos.precioc-(articulos.precioc*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioc/articulos.piezas_envase)-((articulos.preci' +
        'oc/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioc/articulos.piezas_envase)-((articulos.precioc/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioc+(articulos.precioc*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioc/articulos.piezas_envase)+((articulos.precioc/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'D'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciod-(articulos.preciod*articulos.desc_esp/100))' +
        ' +((articulos.preciod-(articulos.preciod*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciod/articulos.piezas_envase)-((articulos.preci' +
        'od/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciod/articulos.piezas_envase)-((articulos.preciod/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciod+(articulos.preciod*articulos.iva/100))*DetPr' +
        'esupuesto.cant) +if (articulos.piezas_envase>0,(((articulos.prec' +
        'iod/articulos.piezas_envase)+((articulos.preciod/articulos.pieza' +
        's_envase)*articulos.iva/100))*DetPresupuesto.piezas),0))'
      ',0)))),3)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),3)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 136
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
  object sqltrafico: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT sk_alarmas.id,'
      '  sk_alarmas.fecha_pc,'
      '  sk_alarmas.hora_pc,'
      '  sk_alarmas.descripcion,'
      '  sk_alarmas.zona,sk_alarmas.user,'
      '  alarmas_status.nombre,'
      '  alarmas_conclusion.status'
      'FROM sk_alarmas'
      
        '  INNER JOIN alarmas_status ON (alarmas_status.clave = sk_alarma' +
        's.status)'
      
        '  INNER JOIN alarmas_conclusion ON (alarmas_conclusion.id = sk_a' +
        'larmas.conclusion)'
      'WHERE sk_alarmas.idcliente =9999')
    ReadOnly = True
    AfterScroll = sqltraficoAfterScroll
    FetchAll = True
    Left = 136
    Top = 200
  end
  object dstrafico: TDataSource
    DataSet = sqltrafico
    Left = 208
    Top = 200
  end
  object dscomentarios: TDataSource
    DataSet = sqlcomentarios
    Left = 288
    Top = 344
  end
  object sqlcomentarios: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'Select * From alarmas_detalle WHERE aid = 76033 and tipo<6')
    RefreshOptions = [roAfterUpdate]
    BeforePost = sqlcomentariosBeforePost
    AfterPost = sqlcomentariosAfterPost
    Options.StrictUpdate = False
    FetchAll = True
    UpdatingTable = 'alarmas_detalle'
    Left = 216
    Top = 344
  end
  object sqlhistorial: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select * from ReclaEventos where idevento=:evento order by fecha' +
        ',hora')
    ReadOnly = True
    FetchAll = True
    Left = 304
    Top = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'evento'
      end>
  end
  object dshistorial: TDataSource
    DataSet = sqlhistorial
    Left = 360
    Top = 472
  end
end
