object frmtravel: Tfrmtravel
  Left = 302
  Top = 107
  Width = 1034
  Height = 732
  Caption = 'Travelers'
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcprincipal: TRzPageControl
    Left = 0
    Top = 74
    Width = 1018
    Height = 585
    ActivePage = tsficha
    Align = alClient
    BoldCurrentTab = True
    Color = 16119543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    FlatColor = 10263441
    HotTrackColor = 3983359
    ParentColor = False
    ParentFont = False
    TabColors.HighlightBar = 3983359
    TabIndex = 1
    TabOrder = 0
    TabStyle = tsRoundCorners
    OnTabClick = pcprincipalTabClick
    FixedDimension = 19
    object tstabla: TRzTabSheet
      Color = 16119543
      ImageIndex = 0
      Caption = 'Tabla'
      object rejilla: TcxGrid
        Left = 0
        Top = 0
        Width = 1014
        Height = 559
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object vista1: TcxGridDBTableView
          OnDblClick = vista1DblClick
          DataController.DataSource = dstravel
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              FieldName = 'idtravel'
              Column = cxidt
            end>
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
          Filtering.CustomizeDialog = False
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.DataRowSizing = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Appending = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NavigatorOffset = 500000
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.CellAutoHeight = True
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.Indicator = True
          object cxidt: TcxGridDBColumn
            Caption = 'Id'
            Width = 35
            DataBinding.FieldName = 'idtravel'
          end
          object cxcuenta: TcxGridDBColumn
            Caption = 'Solicitante'
            Width = 41
            DataBinding.FieldName = 'idcliente'
          end
          object cxcliente: TcxGridDBColumn
            Caption = 'Nombre del Solicitante'
            Width = 177
            DataBinding.FieldName = 'Cliente'
          end
          object cxproblema: TcxGridDBColumn
            Caption = 'Problema'
            Width = 193
            DataBinding.FieldName = 'descripcion'
          end
          object cxdepto: TcxGridDBColumn
            Width = 85
            DataBinding.FieldName = 'Depto'
          end
          object cxusuarioa: TcxGridDBColumn
            Caption = 'Dirijido A'
            Width = 147
            DataBinding.FieldName = 'Usuario'
          end
          object cxqueja: TcxGridDBColumn
            Width = 96
            DataBinding.FieldName = 'Queja'
          end
          object cxasunto: TcxGridDBColumn
            Width = 97
            DataBinding.FieldName = 'Asunto'
          end
          object cxAuditado: TcxGridDBColumn
            DataBinding.FieldName = 'Auditado'
          end
          object cxResuelto: TcxGridDBColumn
            Width = 56
            DataBinding.FieldName = 'Resuelto'
          end
          object cxmagnitud: TcxGridDBColumn
            Width = 57
            DataBinding.FieldName = 'Magnitud'
          end
          object cxfechacreacion: TcxGridDBColumn
            Caption = 'Fecha'
            Width = 82
            DataBinding.FieldName = 'FechaRecive'
          end
          object cxhoracreacion: TcxGridDBColumn
            Caption = 'Hora'
            Width = 89
            DataBinding.FieldName = 'HoraRecive'
          end
          object cxfuente: TcxGridDBColumn
            DataBinding.FieldName = 'Fuente'
          end
        end
        object nivel1: TcxGridLevel
          Caption = 'Reporte Resultado de Busquedas'
          GridView = vista1
        end
      end
    end
    object tsficha: TRzTabSheet
      Color = 16119543
      Caption = 'Ficha'
      Enabled = False
      object lblBusqueda: TRzLabel
        Left = 313
        Top = 10
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
      object RzLabel2: TRzLabel
        Left = 467
        Top = 10
        Width = 47
        Height = 14
        Caption = 'Nombre:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel3: TRzLabel
        Left = 754
        Top = 10
        Width = 51
        Height = 14
        Caption = 'Telefono:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel4: TRzLabel
        Left = 898
        Top = 10
        Width = 39
        Height = 14
        Caption = 'Sector:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel5: TRzLabel
        Left = 217
        Top = 114
        Width = 185
        Height = 14
        Caption = 'Usuario al que va dirigito el travel:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel6: TRzLabel
        Left = 192
        Top = 58
        Width = 142
        Height = 14
        Caption = 'Nombre de Quien Notifica:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel7: TRzLabel
        Left = 532
        Top = 58
        Width = 152
        Height = 14
        Caption = 'Fecha y Hora de Recepcion: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel9: TRzLabel
        Left = 11
        Top = 154
        Width = 43
        Height = 14
        Caption = 'Asunto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel10: TRzLabel
        Left = 505
        Top = 112
        Width = 41
        Height = 14
        Hint = 'Indica la fuente por la que llego este travel'
        Caption = 'Fuente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel12: TRzLabel
        Left = 10
        Top = 56
        Width = 86
        Height = 14
        Caption = 'Area de Origen:'
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
        Left = 14
        Top = 113
        Width = 74
        Height = 14
        Caption = 'Area Destino:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel14: TRzLabel
        Left = 261
        Top = 152
        Width = 87
        Height = 14
        Caption = 'Tipo de Asunto:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel15: TRzLabel
        Left = 581
        Top = 154
        Width = 54
        Height = 14
        Caption = 'Magnitud:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel16: TRzLabel
        Left = 8
        Top = 232
        Width = 131
        Height = 14
        Caption = 'Descripcion de la Queja:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lblaccion: TRzLabel
        Left = 389
        Top = 232
        Width = 86
        Height = 14
        Caption = 'Accion Tomada:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel18: TRzLabel
        Left = 91
        Top = 405
        Width = 108
        Height = 14
        Caption = 'Usuario que Audito:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel19: TRzLabel
        Left = 341
        Top = 407
        Width = 169
        Height = 14
        Caption = 'Fecha y Hora en que se Audito:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzSeparator1: TRzSeparator
        Left = 2
        Top = 97
        Width = 1015
        Height = 8
        ShowGradient = True
        Color = 16776176
        ParentColor = False
      end
      object RzLabel8: TRzLabel
        Left = 755
        Top = 118
        Width = 136
        Height = 24
        Caption = 'Instrucciones:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Visible = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
        LightTextStyle = True
        HighlightColor = clYellow
        ShadowColor = 13107
        TextStyle = tsShadow
      end
      object RzLabel11: TRzLabel
        Left = 2
        Top = 10
        Width = 64
        Height = 14
        Caption = 'Num Travel:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel17: TRzLabel
        Left = 10
        Top = 193
        Width = 44
        Height = 14
        Hint = 'Indica la fuente por la que llego este travel'
        Caption = 'Estatus:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzSeparator2: TRzSeparator
        Left = -11
        Top = 34
        Width = 1015
        Height = 7
        ShowGradient = True
        Color = 16776176
        ParentColor = False
      end
      object RzLabel20: TRzLabel
        Left = 138
        Top = 10
        Width = 57
        Height = 14
        Caption = 'Solicitante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel1: TRzLabel
        Left = 517
        Top = 408
        Width = 137
        Height = 14
        Caption = 'Comentarios del auditor:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzSeparator3: TRzSeparator
        Left = -7
        Top = 397
        Width = 1015
        Height = 7
        ShowGradient = True
        Color = 16776176
        ParentColor = False
      end
      object RzLabel21: TRzLabel
        Left = 6
        Top = 456
        Width = 94
        Height = 14
        Caption = 'Problema-Causa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edcvecte: TRzButtonEdit
        Left = 381
        Top = 5
        Width = 84
        Height = 20
        Hint = 'Buscar en el catalogo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 1
        OnChange = edcvecteChange
        OnExit = edcvecteExit
        OnKeyPress = edcvecteKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 16450
        OnButtonClick = edcvecteButtonClick
      end
      object edNomCte: TRzEdit
        Left = 522
        Top = 5
        Width = 229
        Height = 20
        Hint = 'Nombre del Cliente'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        MaxLength = 100
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyPress = edNomCteKeyPress
      end
      object edtelefono: TRzEdit
        Left = 816
        Top = 5
        Width = 73
        Height = 20
        Hint = 'Telefono de Casa del Cliente'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        MaxLength = 15
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnKeyPress = edtelefonoKeyPress
      end
      object edsector: TRzEdit
        Left = 946
        Top = 5
        Width = 47
        Height = 20
        Hint = 'Sector en que se encuentra el cliente'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
      end
      object Edcve_vend: TRzEdit
        Left = 193
        Top = 130
        Width = 39
        Height = 20
        Hint = 'Clave del Vendedor'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnChange = Edcve_vendChange
        OnKeyPress = Edcve_vendKeyPress
      end
      object cbonom_vend: TRzComboBox
        Left = 237
        Top = 127
        Width = 226
        Height = 22
        Hint = 'Nombre del Vendedor'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 12
        OnChange = cbonom_vendChange
        OnExit = cbonom_vendClick
        OnKeyPress = cboAreaDestinoKeyPress
      end
      object edcve_usrrec: TRzEdit
        Left = 192
        Top = 73
        Width = 39
        Height = 20
        Hint = 'Clave de quien recive'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 6
        OnChange = Edcve_vendChange
      end
      object ednom_usrrec: TRzEdit
        Left = 235
        Top = 73
        Width = 278
        Height = 20
        Hint = 'Nombre de quien recive el evento'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 7
      end
      object edFechaRec: TRzEdit
        Left = 535
        Top = 73
        Width = 67
        Height = 20
        Hint = 'Fecha de Recepcion'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edHoraRec: TRzEdit
        Left = 606
        Top = 73
        Width = 67
        Height = 20
        Hint = 'Hora de Recepcion'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object cboasunto: TRzComboBox
        Left = 10
        Top = 167
        Width = 239
        Height = 22
        Hint = 'Indica el asunto por el que se hace el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 14
        OnClick = cboasuntoClick
        OnExit = cboasuntoClick
        OnKeyPress = cboAreaDestinoKeyPress
        OnNotInList = cboasuntoNotInList
      end
      object cbofuente: TRzComboBox
        Left = 504
        Top = 127
        Width = 233
        Height = 22
        Hint = 'Indica la fuente por el que se hace el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 13
        OnExit = cbofuenteSelect
        OnKeyPress = cboAreaDestinoKeyPress
        OnNotInList = cboasuntoNotInList
        OnSelect = cbofuenteSelect
      end
      object cboAreaRecive: TRzComboBox
        Left = 9
        Top = 71
        Width = 160
        Height = 22
        Hint = 'Indica el area que recive el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        Sorted = True
        TabOrder = 5
        OnNotInList = cboasuntoNotInList
      end
      object cboAreaDestino: TRzComboBox
        Left = 13
        Top = 128
        Width = 160
        Height = 22
        Hint = 'Indica el area que recive el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 10
        OnExit = cboAreaDestinoSelect
        OnKeyPress = cboAreaDestinoKeyPress
        OnNotInList = cboasuntoNotInList
        OnSelect = cboAreaDestinoSelect
      end
      object cboquejas: TRzComboBox
        Left = 257
        Top = 167
        Width = 310
        Height = 22
        Hint = 'Indica el Tipo de Asunto a tratar en base al departamento'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Sorted = True
        TabOrder = 15
        OnExit = cboquejasSelect
        OnKeyPress = cboAreaDestinoKeyPress
        OnNotInList = cboasuntoNotInList
        OnSelect = cboquejasSelect
      end
      object cbomagnitud: TRzComboBox
        Left = 580
        Top = 167
        Width = 160
        Height = 22
        Hint = 'Indica el area que recive el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 16
        OnExit = cbomagnitudSelect
        OnKeyPress = cboAreaDestinoKeyPress
        OnNotInList = cboasuntoNotInList
        OnSelect = cbomagnitudSelect
      end
      object cboaudito: TRzComboBox
        Left = 90
        Top = 420
        Width = 261
        Height = 22
        Hint = 'Indica el nombre del usuario que audito el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        Sorted = True
        TabOrder = 21
        OnKeyPress = cboAreaDestinoKeyPress
        OnNotInList = cboasuntoNotInList
        OnSelect = cboauditoSelect
      end
      object chkauditado: TRzCheckBox
        Left = 6
        Top = 421
        Width = 81
        Height = 17
        Caption = 'Auditado'
        DisabledColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        State = cbUnchecked
        TabOrder = 20
        OnClick = chkauditadoClick
        OnKeyPress = cboAreaDestinoKeyPress
      end
      object edFechaAudito: TRzEdit
        Left = 356
        Top = 422
        Width = 67
        Height = 20
        Hint = 'Fecha de Recepcion'
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 22
        OnKeyPress = cboAreaDestinoKeyPress
      end
      object edHoraAudito: TRzEdit
        Left = 427
        Top = 422
        Width = 67
        Height = 20
        Hint = 'Hora de Recepcion'
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 23
        OnKeyPress = cboAreaDestinoKeyPress
      end
      object rgcomunico: TRzRadioGroup
        Left = 4
        Top = 352
        Width = 701
        Height = 41
        Caption = 'Como se comunico la solucion al cliente?'
        Color = clWhite
        Columns = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ItemHotTrack = True
        ItemFont.Charset = DEFAULT_CHARSET
        ItemFont.Color = clWindowText
        ItemFont.Height = -11
        ItemFont.Name = 'Verdana'
        ItemFont.Style = []
        Items.Strings = (
          'Telefono'
          'Correo'
          'Personalmente'
          'Otro(Explique)')
        ParentFont = False
        TabOrder = 26
        object edComOtro: TRzEdit
          Left = 371
          Top = 11
          Width = 318
          Height = 20
          Hint = 'Nombre del Cliente'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnKeyPress = cboAreaDestinoKeyPress
        end
      end
      object chkresuelto: TRzCheckBox
        Left = 248
        Top = 213
        Width = 132
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Ya se Resolvio?'
        Color = 16119543
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        HotTrack = True
        ParentColor = False
        ParentFont = False
        State = cbUnchecked
        TabOrder = 27
        OnClick = chkresueltoClick
        OnKeyPress = cboAreaDestinoKeyPress
      end
      object btnOrdServ: TRzBitBtn
        Left = 708
        Top = 363
        Width = 173
        Height = 30
        Cursor = crHandPoint
        Hint = 'Dar de alta un ticket'
        Caption = 'Crear Orden Servicio'
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        OnClick = btnOrdServClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000420B0000420B00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E856E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E856E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8AC56E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8AC56E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8AC56E8E8
          17090909E8E8E8E8E8E8E8E8AC56E8E8AC565656E8E8E8E8E8E8E8E8E8AC5617
          1010101009E8E8E8E8E8E8E8E8AC56AC8181818156E8E8E8E8E8E8E8E8E81710
          1710101009E8E8E8E8E8E8E8E8E8AC81AC81818156E8E8E8E8E8E8E8E8171017
          1717101009E8E8E8E8E8E8E8E8AC81ACACAC818156E8E8E8E8E8E8E8E8105F5F
          1717101009E8E8E8E8E8E8E8E881ACACACAC818156E8E8E8E8E8E8E8E810D7D7
          5F1017101009E8E8E8E8E8E8E881D7D7AC81AC818156E8E8E8E8E8E8E8105F5F
          10D75F171009090909E8E8E8E881ACAC81D7ACAC8156565656E8E8E8E8E81010
          1010D75F091010101009E8E8E8E881818181D7AC568181818156E8E8E8E8E8E8
          E8E81010101710101009E8E8E8E8E8E8E8E8818181AC81818156E8E8E8E8E8E8
          E8E8E8105F1717101009E8E8E8E8E8E8E8E8E881ACACAC818156E8E8E8E8E8E8
          E8E8E8105F5F17101017E8E8E8E8E8E8E8E8E881ACACAC8181ACE8E8E8E8E8E8
          E8E8E810D75F101017E8E8E8E8E8E8E8E8E8E881D7AC8181ACE8E8E8E8E8E8E8
          E8E8E8E810101017E8E8E8E8E8E8E8E8E8E8E8E8818181ACE8E8}
        NumGlyphs = 2
      end
      object ednumtravel: TRzEdit
        Left = 74
        Top = 5
        Width = 59
        Height = 20
        Hint = 'Sector en que se encuentra el cliente'
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 29
      end
      object cboestatus: TRzComboBox
        Left = 9
        Top = 208
        Width = 207
        Height = 22
        Hint = 'Indica la fuente por el que se hace el travel'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = cboestatusClick
        OnEnter = cboestatusClick
        OnKeyPress = cboestatusKeyPress
        OnNotInList = cboestatusNotInList
      end
      object requeja: TRzMemo
        Left = 8
        Top = 248
        Width = 369
        Height = 105
        TabOrder = 18
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameVisible = True
      end
      object reaccion: TRzMemo
        Left = 384
        Top = 248
        Width = 361
        Height = 105
        TabOrder = 19
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameVisible = True
      end
      object RzMemo1: TRzMemo
        Left = 752
        Top = 144
        Width = 249
        Height = 201
        Lines.Strings = (
          'Pasos para crear un travel:'
          '-Debe indicar el solicitante'
          '-Indicar el area al que se dirige el '
          'travel'
          '-Indicar al empleado que tendra que '
          'resolver el travel'
          '-La fuente por la que se entero del '
          'travel'
          '-Asunto que trata y tipo de asunto '
          '(estos '
          'varian '
          'dependiendo el area seleccionada)'
          '-la magnitud del problema (prioridad)'
          '-Solo podra auditar traveler aquellos '
          'usuarios '
          'autorizados'
          '-Como  se comunico con el cliente '
          'para '
          'enterarle la '
          'resolucion de su travel'
          '-Descripcion, indique detalladamente '
          'el '
          'motivo de '
          'notificacion del cliente'
          '-Accion, indique los pasos que se '
          'suiguieron para '
          'resolver el travel'
          ''
          'Nota: desde pantalla podra crear '
          'Ordenes de Servicio '
          'Prescionando el boton que dice '
          '          Crear Orden de Servicio '
          'colocado '
          'en la parte '
          'inferior izquierda de la pantalla.')
        ScrollBars = ssVertical
        TabOrder = 30
        FrameHotTrack = True
        FrameVisible = True
      end
      object cboAltaTravel: TRzComboBox
        Left = 201
        Top = 3
        Width = 104
        Height = 22
        Hint = 'Nombre del Vendedor'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = cboAltaTravelChange
        OnKeyPress = cboAltaTravelKeyPress
        Items.Strings = (
          'Empleado'
          'Cliente'
          'Proveedor'
          'Otro')
        Values.Strings = (
          ''
          ''
          ''
          '')
      end
      object mmComentarioAuditor: TRzMemo
        Left = 520
        Top = 424
        Width = 473
        Height = 41
        Enabled = False
        TabOrder = 24
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameVisible = True
      end
      object cboProblemaCausa: TRzComboBox
        Left = 109
        Top = 449
        Width = 388
        Height = 22
        Hint = 'Nombre del Vendedor'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 25
        Items.Strings = (
          'Empleado'
          'Cliente'
          'Proveedor'
          'Otro')
        Values.Strings = (
          ''
          ''
          ''
          '')
      end
    end
  end
  object dbnavegador: TcxDBNavigator
    Left = 0
    Top = 49
    Width = 1014
    Height = 25
    Buttons.OnButtonClick = dbnavegadorButtonsButtonClick
    Buttons.Insert.Visible = False
    Buttons.Delete.Visible = False
    Buttons.Edit.Visible = False
    Buttons.Post.Visible = False
    Buttons.Cancel.Visible = False
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Visible = False
    DataSource = dstravel
    Align = alTop
    TabOrder = 1
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 659
    Width = 1018
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    object btnmodificar: TRzBitBtn
      Left = 744
      Top = 5
      Width = 120
      Height = 28
      Caption = '&Editar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 0
      OnClick = btnmodificarClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000630B0000630B00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
        0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
        120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
        12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
        1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
        181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
        E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
        E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
        E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
        E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
        E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
        E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object btncancelar: TRzBitBtn
      Left = 877
      Top = 5
      Width = 120
      Height = 28
      Caption = '&Cerrar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 1
      OnClick = btncancelarClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000630E0000630E00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86CE8E8
        E8E8E8E8E8E8E8E8B4E8E8E8E881E8E8E8E8E8E8E8E8E8E8ACE8E8E897B46CE8
        E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E897C7B46C
        E8E8E8E8E8E8E8B4E8E8E8E881E3AC81E8E8E8E8E8E8E8ACE8E8E8E8E897C090
        E8E8E8E8E8E8B4E8E8E8E8E8E881E381E8E8E8E8E8E8ACE8E8E8E8E8E8E890B4
        6CE8E8E8E8B46CE8E8E8E8E8E8E881AC81E8E8E8E8AC81E8E8E8E8E8E8E8E890
        B46CE8E8B46CE8E8E8E8E8E8E8E8E881AC81E8E8AC81E8E8E8E8E8E8E8E8E8E8
        90B46CB46CE8E8E8E8E8E8E8E8E8E8E881AC81AC81E8E8E8E8E8E8E8E8E8E8E8
        E890B46CE8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8
        90B46C906CE8E8E8E8E8E8E8E8E8E8E881AC818181E8E8E8E8E8E8E8E8E8E890
        B46CE8E8906CE8E8E8E8E8E8E8E8E881AC81E8E88181E8E8E8E8E8E8E890B4B4
        6CE8E8E8E8906CE8E8E8E8E8E881ACAC81E8E8E8E88181E8E8E8E8E890C7B46C
        E8E8E8E8E8E8906CE8E8E8E881E3AC81E8E8E8E8E8E88181E8E8E8E87A907AE8
        E8E8E8E8E8E8E8E890E8E8E8AC81ACE8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object btnalta: TRzBitBtn
      Left = 612
      Top = 5
      Width = 120
      Height = 28
      Caption = '&Alta'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 2
      OnClick = btnaltaClick
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E
        5E5E5E5E5E5E5E5EE8E8E8E8818181818181818181818181E8E8E8E85ED7D7D7
        D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
        E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
        D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
        E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
        D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
        E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
        D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
        E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
        D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
        E3E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7
        D7D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E881E8E8E8E8E85ED7D7D7
        D7D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E
        5E5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object btnImprimir: TRzBitBtn
      Left = 480
      Top = 5
      Width = 120
      Height = 28
      Caption = '&Imprimir'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 3
      OnClick = btnImprimirClick
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
        09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
        89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
        5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
        8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
        181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
        D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
        8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
        5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
        D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
        E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
        D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
        E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
        D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
        5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object btnenviar: TRzBitBtn
      Left = 352
      Top = 5
      Width = 120
      Height = 28
      Caption = '&Enviar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 4
      OnClick = btnenviarClick
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
  end
  object pfiltro: TRzPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 49
    Align = alTop
    BorderOuter = fsPopup
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 2
      Width = 38
      Height = 16
      Caption = 'Area:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 192
      Top = 2
      Width = 71
      Height = 16
      Caption = 'Usuario:   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 376
      Top = 2
      Width = 56
      Height = 16
      Caption = 'Estatus:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CboFiltraArea: TRzComboBox
      Left = 10
      Top = 18
      Width = 170
      Height = 22
      Hint = 'Filtra los traveler por area destino'
      Ctl3D = False
      DropDownCount = 16
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ItemHeight = 14
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = CboFiltraAreaChange
      OnKeyPress = CboFiltraAreaKeyPress
      OnNotInList = CboFiltraAreaNotInList
    end
    object cbusuario: TRzComboBox
      Left = 189
      Top = 18
      Width = 172
      Height = 21
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object dtdesde: TRzDateTimeEdit
      Left = 541
      Top = 18
      Width = 121
      Height = 21
      EditType = etDate
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 2
    end
    object dthasta: TRzDateTimeEdit
      Left = 669
      Top = 18
      Width = 121
      Height = 21
      EditType = etDate
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 3
    end
    object cbestatus: TRzComboBox
      Left = 381
      Top = 18
      Width = 148
      Height = 21
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Text = 'TODOS'
      Items.Strings = (
        'TODOS'
        'SIN RESOLVER'
        'RESUELTOS S/AUDITAR'
        'RESUELTOS '
        'AUDITADOS')
    end
    object btnfiltrar: TRzBitBtn
      Left = 792
      Top = 8
      Width = 81
      Height = 33
      Caption = '&Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 5
      OnClick = btnfiltrarClick
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
        B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
        B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
        B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
        5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
        89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
        89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
        D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
        D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
        D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
        5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
        B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
        E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
        E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object RzBitBtn1: TRzBitBtn
      Left = 880
      Top = 8
      Width = 121
      Height = 33
      Caption = 'I&mprimir Filtro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 6
      OnClick = RzBitBtn1Click
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
        09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
        89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
        5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
        8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
        181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
        D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
        8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
        5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
        D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
        E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
        D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
        E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
        D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
        5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object chkPeriodo: TRzCheckBox
      Left = 544
      Top = 0
      Width = 115
      Height = 17
      Caption = 'Periodo'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 7
    end
  end
  object dstravel: TDataSource
    DataSet = sqltravel
    Left = 305
    Top = 44
  end
  object sqltravel: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'Select'
      'travel.idtravel,'
      'clientes.idcliente,'
      'travel.nombre as Cliente,'
      
        'concat(ifnull(usuarios.nombre,'#39#39'),'#39' '#39',ifnull(usuarios.apaterno,'#39 +
        #39'),'#39' '#39',ifnull(usuarios.amaterno,'#39#39')) AS Usuario,'
      'areas.nombre AS Depto,'
      'travel.FechaRecive,'
      'travel.HoraRecive,'
      'travel.descripcion,'
      'magnitudes.nombre AS Magnitud,'
      'quejas.nombre AS Queja,'
      'asuntos.nombre AS Asunto,'
      'f.nombre as Fuente,'
      
        'if(travel.resuelto = 1,'#39'Si'#39','#39'No'#39') as Resuelto,if(travel.auditado' +
        ' = 1,'#39'Si'#39','#39'No'#39') as Auditado,'
      'idservicio'
      'From'
      'travel'
      'left Join clientes ON travel.idcliente = clientes.idcliente'
      'left Join usuarios ON travel.idusra = usuarios.idusuario'
      'left Join areas ON travel.iddptoa = areas.idarea'
      
        'left Join magnitudes ON travel.idmagnitud = magnitudes.idmagnitu' +
        'd'
      'left Join quejas ON travel.idqueja = quejas.idqueja'
      'left Join asuntos ON travel.idasunto = asuntos.idasunto'
      'left join fuentes f on f.idfuente=travel.idfuente'
      'order by travel.idtravel')
    FetchAll = True
    Left = 257
    Top = 44
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
    Left = 347
    Top = 44
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
end
