object frmOrdenCompra: TfrmOrdenCompra
  Left = 238
  Top = 130
  Width = 745
  Height = 604
  Hint = 'Pantalla de Ordenes de Compra'
  AutoSize = True
  Caption = 'Ordenes de Compra'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbufh: TRzLabel
    Left = 8
    Top = 520
    Width = 13
    Height = 13
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMoneyGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object gbdatos: TGroupBox
    Left = 0
    Top = 0
    Width = 729
    Height = 513
    Caption = 'Datos de la Orden de Compra'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 24
      Width = 705
      Height = 33
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object RzLabel1: TRzLabel
        Left = 8
        Top = 16
        Width = 62
        Height = 14
        Caption = 'Num Orden'
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
        Left = 552
        Top = 16
        Width = 62
        Height = 14
        Caption = 'Hora Orden'
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
        Left = 383
        Top = 16
        Width = 69
        Height = 14
        Caption = 'Fecha Orden'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object estatus: TRzLabel
        Left = 176
        Top = 16
        Width = 3
        Height = 14
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edbuscar: TRzButtonEdit
        Left = 72
        Top = 8
        Width = 89
        Height = 22
        Hint = 'Buscar Orden de Compra'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
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
        OnChange = edbuscarChange
        OnKeyPress = edbuscarKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edbuscarButtonClick
      end
      object edHoraOrd: TRzDBEdit
        Left = 621
        Top = 10
        Width = 84
        Height = 22
        Hint = 'Hora de creada la Orden de Compra'
        DataSource = DSOrdenes
        DataField = 'HoraOrden'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 1
      end
      object edFechaOrd1: TRzDBEdit
        Left = 285
        Top = 10
        Width = 92
        Height = 22
        Hint = 'Fecha de creaci'#243'n de la Orden de Compra'
        DataSource = DSOrdenes
        DataField = 'FechaOrden'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object edFechaOrd: TRzDBDateTimePicker
        Left = 456
        Top = 8
        Width = 89
        Height = 20
        Date = 39085.403556493050000000
        Time = 39085.403556493050000000
        Enabled = False
        TabOrder = 3
        FlatButtonColor = clWhite
        FlatButtons = True
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameVisible = True
        DataField = 'FechaOrden'
        DataSource = DSOrdenes
      end
    end
    object pnldatos: TPanel
      Left = 10
      Top = 64
      Width = 719
      Height = 457
      BevelOuter = bvNone
      Color = clWhite
      Enabled = False
      TabOrder = 0
      object RzLabel2: TRzLabel
        Left = 8
        Top = 2
        Width = 58
        Height = 14
        Caption = 'Proveedor'
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
        Left = 525
        Top = 10
        Width = 44
        Height = 28
        Alignment = taRightJustify
        Caption = 'Tipo de Cambio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel6: TRzLabel
        Left = 16
        Top = 82
        Width = 77
        Height = 14
        Caption = 'Fecha Entrega'
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
        Left = 8
        Top = 58
        Width = 82
        Height = 14
        Caption = 'Fecha Vigencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel11: TRzLabel
        Left = 240
        Top = 42
        Width = 109
        Height = 14
        Caption = 'Detalles de la orden'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Label2: TLabel
        Left = 8
        Top = 368
        Width = 287
        Height = 77
        Caption = 
          '*Presione la Tecla (+) para incrementar la cantidad de articulos' +
          ' del rengl'#243'n seleccionado.'#13#10'*Presione la Tecla (-) para decremen' +
          'tar la cantidad de articulos del rengl'#243'n seleccionado.'#13#10'*Presion' +
          'e la Tecla (Supr) para eliminar el rengl'#243'n seleccionado.'#13#10'*Doble' +
          ' click en el registro para modificarlo.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object RzLabel17: TRzLabel
        Left = 344
        Top = 2
        Width = 41
        Height = 14
        Caption = 'Estatus'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel22: TRzLabel
        Left = 456
        Top = 2
        Width = 44
        Height = 14
        Caption = 'Moneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel36: TRzLabel
        Left = 634
        Top = 24
        Width = 21
        Height = 13
        Caption = 'IVA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lexcede: TRzLabel
        Left = 8
        Top = 344
        Width = 329
        Height = 16
        Caption = 'Se excede de las existencias para este articulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Rejilla: TcxGrid
        Left = 8
        Top = 224
        Width = 705
        Height = 113
        Hint = '+ Incrementa Cant., - Decrementa Cant., SUPR Elimina Registro'
        Align = alCustom
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        LookAndFeel.Kind = lfUltraFlat
        object RejillaDBTableView1: TcxGridDBTableView
          OnDblClick = RejillaDBTableView1DblClick
          OnKeyPress = RejillaDBTableView1KeyPress
          OnKeyUp = RejillaDBTableView1KeyUp
          DataController.DataSource = DsRejilla
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Cancel.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          OnCellClick = RejillaDBTableView1CellClick
          OptionsBehavior.CellHints = True
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnMoving = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Preview.Visible = True
          object clave: TcxGridDBColumn
            Caption = 'Clave'
            Options.Editing = False
            Options.Moving = False
            Width = 45
            DataBinding.FieldName = 'cod_cve'
          end
          object nombre: TcxGridDBColumn
            Caption = 'Nombre'
            Options.Editing = False
            Options.Moving = False
            Width = 220
            DataBinding.FieldName = 'nombre'
          end
          object cant: TcxGridDBColumn
            Caption = 'Cant. Orden'
            Options.Editing = False
            Options.Moving = False
            Width = 47
            DataBinding.FieldName = 'cant_ord'
          end
          object cant_surt: TcxGridDBColumn
            Caption = 'Cant. Surt.'
            Width = 42
            DataBinding.FieldName = 'cant_sur'
          end
          object piezas: TcxGridDBColumn
            Caption = 'Pzs'
            Visible = False
            Options.Editing = False
            Options.Moving = False
            Width = 58
            DataBinding.FieldName = 'piezas'
          end
          object descuento: TcxGridDBColumn
            Caption = 'Desc'
            Visible = False
            Options.Editing = False
            Options.Moving = False
            Width = 53
            DataBinding.FieldName = 'descuento'
          end
          object aplica_desc: TcxGridDBColumn
            Caption = 'Aplic Desc'
            Visible = False
            Options.Editing = False
            Options.Moving = False
            Width = 78
            DataBinding.FieldName = 'aplica_desc'
          end
          object comentarios: TcxGridDBColumn
            Caption = 'Comentario'
            Width = 86
            DataBinding.FieldName = 'comentarios'
          end
          object precio_costo: TcxGridDBColumn
            Caption = 'Costo Unidad'
            Options.Editing = False
            Options.Moving = False
            Width = 67
            DataBinding.FieldName = 'costo'
          end
          object subtotal: TcxGridDBColumn
            Width = 70
            DataBinding.FieldName = 'subtotal'
          end
          object dbiva: TcxGridDBColumn
            Caption = 'Iva'
            Options.Editing = False
            Options.Moving = False
            Width = 33
            DataBinding.FieldName = 'iva'
          end
          object total: TcxGridDBColumn
            Options.Editing = False
            Options.Moving = False
            Width = 81
            DataBinding.FieldName = 'Total'
          end
        end
        object RejillaLevel1: TcxGridLevel
          GridView = RejillaDBTableView1
        end
      end
      object dentrega: TRzDBDateTimeEdit
        Left = 93
        Top = 74
        Width = 132
        Height = 22
        Hint = 'Fecha de entrega de la orden de compra'
        DataSource = DSOrdenes
        DataField = 'FechaEntrega'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = clSkyBlue
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnEnter = dentregaEnter
        OnKeyPress = rgmonedaKeyPress
        EditType = etDate
        FlatButtons = True
      end
      object dvigencia: TRzDBDateTimeEdit
        Left = 93
        Top = 50
        Width = 132
        Height = 22
        Hint = 'Fecha de vigencia de la orden de compra'
        DataSource = DSOrdenes
        DataField = 'FechaVigencia'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FocusColor = clSkyBlue
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnEnter = dvigenciaEnter
        OnKeyPress = rgmonedaKeyPress
        EditType = etDate
        FlatButtons = True
      end
      object gbarticulo: TGroupBox
        Left = 8
        Top = 104
        Width = 705
        Height = 113
        Caption = 'Datos del Articulo'
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 8
        object RzLabel13: TRzLabel
          Left = 552
          Top = 17
          Width = 48
          Height = 14
          Caption = 'Cantidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblproducto: TRzLabel
          Left = 3
          Top = 17
          Width = 50
          Height = 14
          Caption = 'Producto'
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
          Left = 157
          Top = 17
          Width = 65
          Height = 14
          Caption = 'Descripci'#243'n'
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
          Left = 423
          Top = 17
          Width = 33
          Height = 14
          Caption = 'Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object Label1: TLabel
          Left = 632
          Top = 48
          Width = 60
          Height = 28
          Caption = '*ESC Limpia Captura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object RzLabel16: TRzLabel
          Left = 509
          Top = 17
          Width = 15
          Height = 14
          Caption = 'Iva'
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
          Left = 5
          Top = 57
          Width = 54
          Height = 14
          Caption = 'Cant. Surt'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel20: TRzLabel
          Left = 5
          Top = 57
          Width = 72
          Height = 14
          Caption = 'Comentarios'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object spbarticulos: TSpeedButton
          Left = 632
          Top = 80
          Width = 65
          Height = 25
          Hint = 'Dar de alta un articulo'
          Caption = 'Articulos'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF777777777777FFFF777777777777FFFF7FFFFFFFFF
            F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
            F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
            F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
            F7FFFF7FFFFFFFFFF7FFFF7FFFFFFFFFF7FFFF7F88888888F7FFFF7FFFFFFFFF
            F7FFFF7FFFFFFFFFF7FFFF7FFFFFFF7777FFFF7F88888F7777FFFF7FFFFFFF7F
            7FFFFF7FFFFFFF7F7FFFFF7FFFFFFF77FFFFFF7FFFFFFF77FFFFFF777777777F
            FFFFFF777777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Visible = False
          OnClick = spbarticulosClick
        end
        object RzLabel23: TRzLabel
          Left = 264
          Top = 64
          Width = 81
          Height = 14
          Caption = 'Ultima Compra'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel25: TRzLabel
          Left = 375
          Top = 64
          Width = 20
          Height = 14
          Caption = 'Min'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel24: TRzLabel
          Left = 440
          Top = 64
          Width = 22
          Height = 14
          Caption = 'Max'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel26: TRzLabel
          Left = 576
          Top = 64
          Width = 24
          Height = 14
          Caption = 'Unid'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel27: TRzLabel
          Left = 512
          Top = 64
          Width = 36
          Height = 14
          Caption = 'Piezas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object edcantidad: TRzNumericEdit
          Left = 553
          Top = 35
          Width = 47
          Height = 22
          Hint = 'Teclee la cantidad de Articulos'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
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
          TabOrder = 1
          OnKeyPress = edcantidadKeyPress
          Max = 1000.000000000000000000
          Min = -1000.000000000000000000
          Value = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
        object btnagregar: TRzBitBtn
          Left = 622
          Top = 21
          Hint = 'Agregar el articulo a la Orden de Compra'
          ModalResult = 1
          Caption = '&Agregar'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HotTrack = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnagregarClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            0800000000000002000000000000000000000001000000000000000000003300
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
            E8E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8
            E8E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8
            E8E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8
            E8E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object edDescripcion: TRzEdit
          Left = 159
          Top = 32
          Width = 252
          Height = 22
          Hint = 'Descripci'#243'n del articulo'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
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
          TabOrder = 3
        end
        object EdCosto_unidad: TRzEdit
          Left = 423
          Top = 32
          Width = 66
          Height = 22
          Hint = 'Costo del articulo'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
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
          TabOrder = 4
        end
        object ediva_art: TRzEdit
          Left = 496
          Top = 32
          Width = 43
          Height = 22
          Hint = 'Iva que aplica al articulo'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
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
          TabOrder = 5
        end
        object edcodigo: TRzButtonEdit
          Left = 3
          Top = 33
          Width = 150
          Height = 22
          Hint = 'Articulo a buscar'
          DisabledColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
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
          OnChange = edcodigoChange
          OnEnter = edcodigoEnter
          OnKeyPress = edcodigoKeyPress
          ButtonKind = bkFind
          ButtonShortCut = 16450
          FlatButtons = True
          OnButtonClick = edcodigoButtonClick
        end
        object edcant_sur: TRzNumericEdit
          Left = 9
          Top = 83
          Width = 47
          Height = 22
          Hint = 'Teclee la cantidad de Articulos'
          DisabledColor = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
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
          TabOrder = 6
          Visible = False
          OnKeyPress = edTipoCambioKeyPress
          Max = 1000.000000000000000000
          Min = -1000.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
        object edcomentarios: TRzMemo
          Left = 8
          Top = 72
          Width = 241
          Height = 33
          Hint = 'Comentario sobre el articulo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 7
          OnEnter = edcomentariosEnter
          OnExit = edcomentariosExit
          OnKeyPress = edcomentariosKeyPress
          FrameColor = clActiveCaption
          FrameVisible = True
        end
        object edultcompra: TRzEdit
          Left = 256
          Top = 80
          Width = 97
          Height = 22
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 8
        end
        object edmin: TRzEdit
          Left = 360
          Top = 80
          Width = 57
          Height = 22
          Alignment = taRightJustify
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 9
        end
        object edmax: TRzEdit
          Left = 424
          Top = 80
          Width = 57
          Height = 22
          Alignment = taRightJustify
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 10
        end
        object edexist: TRzEdit
          Left = 560
          Top = 80
          Width = 57
          Height = 22
          Alignment = taRightJustify
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 11
        end
        object edpieza: TRzEdit
          Left = 496
          Top = 80
          Width = 57
          Height = 22
          Alignment = taRightJustify
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 12
        end
      end
      object edbuscarprov: TRzButtonEdit
        Left = 8
        Top = 18
        Width = 73
        Height = 22
        Hint = 'Buscar proveedor'
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
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
        OnChange = edbuscarprovChange
        OnExit = edbuscarprovExit
        OnKeyPress = edbuscarprovKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edbuscarprovButtonClick
      end
      object edprov: TRzEdit
        Left = 88
        Top = 18
        Width = 249
        Height = 22
        Hint = 'Descripci'#243'n del proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
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
        TabOrder = 1
      end
      object edestatus: TRzComboBox
        Left = 344
        Top = 18
        Width = 97
        Height = 22
        Hint = 'El estatus de la orden'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = ' '
        OnEnter = edestatusEnter
        OnExit = edestatusExit
        OnKeyPress = edestatusKeyPress
        OnNotInList = edestatusNotInList
        Items.Strings = (
          'PENDIENTE'
          'SIN SURTIR'
          'INCOMPLETO'
          'SURTIDO'
          'ACEPTADA'
          'CANCELADA'
          'FACTURANDO')
      end
      object gbtotales: TGroupBox
        Left = 352
        Top = 344
        Width = 361
        Height = 97
        Caption = 'Totales dlls'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        object RzLabel9: TRzLabel
          Left = 26
          Top = 52
          Width = 31
          Height = 13
          Caption = 'Otros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel18: TRzLabel
          Left = 22
          Top = 76
          Width = 35
          Height = 13
          Caption = 'Fletes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel21: TRzLabel
          Left = 7
          Top = 15
          Width = 50
          Height = 26
          Alignment = taRightJustify
          Caption = 'Total Articulos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel10: TRzLabel
          Left = 214
          Top = 75
          Width = 26
          Height = 14
          Caption = 'Total'
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
          Left = 226
          Top = 51
          Width = 15
          Height = 14
          Caption = 'Iva'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel8: TRzLabel
          Left = 198
          Top = 27
          Width = 51
          Height = 14
          Caption = 'Subtotal  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object edtp: TRzDBNumericEdit
          Left = 64
          Top = 19
          Width = 105
          Height = 22
          DataSource = DSOrdenes
          DataField = 'TotalProductos'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 0
          DisplayFormat = ',0;(,0)'
        end
        object edfletes: TcxDBCurrencyEdit
          Left = 64
          Top = 43
          Width = 105
          Height = 22
          Hint = 'Gastos por fletes'
          DataBinding.DataField = 'fletes'
          DataBinding.DataSource = DSOrdenes
          ParentFont = False
          ParentShowHint = False
          Properties.ReadOnly = False
          Properties.ValidateOnEnter = True
          ShowHint = True
          Style.Edges = [bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.Shadow = False
          TabOrder = 1
          OnExit = edfletesExit
          OnKeyPress = edfletesKeyPress
        end
        object edotrosg: TcxDBCurrencyEdit
          Left = 64
          Top = 67
          Width = 105
          Height = 22
          Hint = 'Otros Gastos'
          DataBinding.DataField = 'otros'
          DataBinding.DataSource = DSOrdenes
          ParentFont = False
          ParentShowHint = False
          Properties.ReadOnly = False
          Properties.ValidateOnEnter = True
          ShowHint = True
          Style.Edges = [bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.Shadow = False
          TabOrder = 2
          OnExit = edotrosgExit
          OnKeyPress = edfletesKeyPress
        end
        object edsubtotal: TRzDBNumericEdit
          Left = 248
          Top = 19
          Width = 105
          Height = 22
          Hint = 'Subtotal de todos los articulos '
          DataSource = DSOrdenes
          DataField = 'subtotal'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FocusColor = 16776176
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          AllowBlank = False
          IntegersOnly = False
          Max = 10000.000000000000000000
          Min = -10000.000000000000000000
          Value = -10000.000000000000000000
          DisplayFormat = '$,0.00'
        end
        object ediva: TRzDBNumericEdit
          Left = 248
          Top = 43
          Width = 105
          Height = 22
          Hint = 'Porcentaje de iva '
          DataSource = DSOrdenes
          DataField = 'iva'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FocusColor = 16776176
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          AllowBlank = False
          Max = 100.000000000000000000
          DisplayFormat = '$,0.00'
        end
        object edtotal: TRzDBNumericEdit
          Left = 248
          Top = 67
          Width = 105
          Height = 22
          Hint = 'Costo Total de todos los articulos '
          DataSource = DSOrdenes
          DataField = 'total'
          AutoSize = False
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FocusColor = 16776176
          FrameColor = clActiveCaption
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          AllowBlank = False
          IntegersOnly = False
          Max = 10000.000000000000000000
          Min = -10000.000000000000000000
          Value = -10000.000000000000000000
          DisplayFormat = '$,0.00'
        end
      end
      object rgmoneda: TRzComboBox
        Left = 456
        Top = 18
        Width = 41
        Height = 22
        Hint = 'El tipo de moneda a manejar'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        Text = 'D'
        OnEnter = rgmonedaEnter
        OnExit = rgmonedaExit
        OnKeyPress = rgmonedaKeyPress
        OnNotInList = rgmonedaNotInList
        Items.Strings = (
          'D'
          'P')
        ItemIndex = 0
      end
      object eddatosentrega: TRzDBRichEdit
        Left = 239
        Top = 61
        Width = 474
        Height = 44
        Hint = 'Descripci'#243'n de  la orden'
        DataField = 'DatosEntrega'
        DataSource = DSOrdenes
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 7
        OnEnter = mmdescripcionEnter
        OnExit = mmdescripcionExit
        OnKeyPress = rgmonedaKeyPress
        DisabledColor = clWhite
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameVisible = True
      end
      object edTipoCambio: TRzEdit
        Left = 574
        Top = 18
        Width = 49
        Height = 22
        Alignment = taRightJustify
        DisabledColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentFont = False
        TabOrder = 4
        OnExit = edTipoCambioExit
        OnKeyPress = edTipoCambioKeyPress
      end
      object cbiva: TRzComboBox
        Left = 662
        Top = 18
        Width = 49
        Height = 22
        Hint = 'El tipo de moneda a manejar'
        CharCase = ecUpperCase
        Ctl3D = False
        DisabledColor = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 14
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 11
        OnExit = cbivaExit
        Items.Strings = (
          'D'
          'P')
        Values.Strings = (
          '10.20'
          '1')
      end
    end
  end
  object btnalta: TRzBitBtn
    Left = 8
    Top = 536
    Width = 100
    Height = 29
    Hint = 'Dar de Alta una Orden de Compra'
    ModalResult = 1
    Caption = '&Alta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnaltaClick
    ImageIndex = 5
    Images = DMAccesos.ilopciones
  end
  object btnborrar: TRzBitBtn
    Left = 112
    Top = 536
    Width = 100
    Height = 29
    Hint = 'Cancela la Orden Actual'
    ModalResult = 1
    Caption = 'Ca&ncelar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnborrarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000530D0000530D00000001000000000000000000003300
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
      0000000000000000000000000000000000000000000000000000E8D7E8D7D7E8
      E8E8E8E8E8E8E8E8E8E8E8D7E8D7D7E8E8E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7
      D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7DF
      6C6C6CE8E8E8E8E8E8E8D7D7D7D7D7DF565656E8E8E8E8E8E8E8D7D7D7D7DF90
      6C6C6C6CE8E8E8E8E8E8D7D7D7D7DF8156565656E8E8E8E8E8E8D7D7D7D79090
      906C6C6C6CE8E8E8E8E8D7D7D7D781818156565656E8E8E8E8E8D7E8D7E8B490
      90906C6C6C7EE8E8E8E8D7E8D7E8AC81818156565656E8E8E8E8E8E8E8E8B4B4
      9090906C7EA87EE8E8E8E8E8E8E8ACAC81818156568156E8E8E8E8E8E8E8E8B4
      B490907EA8A8A87EE8E8E8E8E8E8E8ACAC81815681818156E8E8E8E8E8E8E8E8
      B4D8A8D2D2A8A8A87EE8E8E8E8E8E8E8AC5681ACAC81818156E8E8E8E8E8E8E8
      E8A8D2D7DED2A8A8A87EE8E8E8E8E8E8E881ACD7DEAC81818156E8E8E8E8E8E8
      E8E8A8D2D7DED2A87E09E8E8E8E8E8E8E8E881ACD7DEAC815656E8E8E8E8E8E8
      E8E8E8A8D2D7D27E1009E8E8E8E8E8E8E8E8E881ACD7AC568156E8E8E8E8E8E8
      E8E8E8E8A8D2A8101010E8E8E8E8E8E8E8E8E8E881AC81818181E8E8E8E8E8E8
      E8E8E8E8E8A817171010E8E8E8E8E8E8E8E8E8E8E881ACAC8181E8E8E8E8E8E8
      E8E8E8E8E8E809171710E8E8E8E8E8E8E8E8E8E8E8E856ACAC81E8E8E8E8E8E8
      E8E8E8E8E8E8E8091717E8E8E8E8E8E8E8E8E8E8E8E8E856ACAC}
    ImageIndex = 2
    NumGlyphs = 2
  end
  object btnmodificar: TRzBitBtn
    Left = 215
    Top = 536
    Width = 100
    Height = 29
    Hint = 'Editar los datos de la Orden Actual'
    ModalResult = 1
    Caption = '&Editar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnmodificarClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      0800000000000002000000000000000000000001000000000000000000003300
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
      E8E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8
      E8E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8
      E8E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8
      E8E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    ImageIndex = 2
    Images = DMAccesos.ilopciones
    NumGlyphs = 2
  end
  object btncancelar: TRzBitBtn
    Left = 322
    Top = 536
    Width = 100
    Height = 29
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
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
  object tbherramientas: TToolBar
    Left = 440
    Top = 0
    Width = 172
    Height = 29
    Hint = 'Barra de Herramientas'
    Align = alNone
    AutoSize = True
    ButtonHeight = 23
    ButtonWidth = 28
    Caption = 'tbherramientas'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = DMAccesos.iledicion
    TabOrder = 5
    object btncopy: TToolButton
      Left = 0
      Top = 2
      Action = frmprincipal.EditCopy1
    end
    object btncut: TToolButton
      Left = 28
      Top = 2
      Action = frmprincipal.EditCut1
    end
    object btnpaste: TToolButton
      Left = 56
      Top = 2
      Action = frmprincipal.EditPaste1
    end
    object btndelete: TToolButton
      Left = 84
      Top = 2
      Action = frmprincipal.EditDelete1
    end
    object btnundo: TToolButton
      Left = 112
      Top = 2
      Action = frmprincipal.EditUndo1
    end
    object btnfuentes: TToolButton
      Left = 140
      Top = 2
      Hint = 'Fuentes'
      Caption = '&Fuentes'
      Enabled = False
      ImageIndex = 19
      OnClick = btnfuentesClick
    end
  end
  object btnimprimir: TRzBitBtn
    Left = 424
    Top = 536
    Width = 100
    Height = 30
    Caption = '&Imprimir'
    Color = 15066597
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 6
    OnClick = btnimprimirClick
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
    Left = 528
    Top = 536
    Width = 100
    Height = 30
    Caption = 'En&viar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 7
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
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 184
    Top = 296
  end
  object DSOrdenes: TDataSource
    DataSet = tblOrdenes
    Left = 16
    Top = 328
  end
  object tblOrdenes: TMyTable
    TableName = 'Ordenes'
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 16
    Top = 296
    object tblOrdenesidorden: TIntegerField
      FieldName = 'idorden'
    end
    object tblOrdenesidproveedor: TIntegerField
      FieldName = 'idproveedor'
    end
    object tblOrdenesFechaOrden: TDateField
      FieldName = 'FechaOrden'
    end
    object tblOrdenesHoraOrden: TTimeField
      FieldName = 'HoraOrden'
    end
    object tblOrdenesFechaEntrega: TDateField
      FieldName = 'FechaEntrega'
    end
    object tblOrdenesFechaVigencia: TDateField
      FieldName = 'FechaVigencia'
    end
    object tblOrdenesTipoCambio: TFloatField
      FieldName = 'TipoCambio'
    end
    object tblOrdenesmoneda: TStringField
      FieldName = 'moneda'
      FixedChar = True
      Size = 1
    end
    object tblOrdenessubtotal: TFloatField
      FieldName = 'subtotal'
    end
    object tblOrdenesiva: TFloatField
      FieldName = 'iva'
    end
    object tblOrdenestotal: TFloatField
      FieldName = 'total'
    end
    object tblOrdenesestatus: TStringField
      FieldName = 'estatus'
      Size = 15
    end
    object tblOrdenesfletes: TFloatField
      FieldName = 'fletes'
    end
    object tblOrdenesotros: TFloatField
      FieldName = 'otros'
    end
    object tblOrdenesDatosEntrega: TMemoField
      FieldName = 'DatosEntrega'
      BlobType = ftMemo
    end
    object tblOrdenesTotalProductos: TIntegerField
      FieldName = 'TotalProductos'
    end
    object tblOrdenesusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object tblOrdenesfecha: TStringField
      FieldName = 'fecha'
      Size = 15
    end
    object tblOrdeneshora: TStringField
      FieldName = 'hora'
      Size = 15
    end
    object tblOrdenesUsuarioUltMod: TStringField
      FieldName = 'UsuarioUltMod'
      Size = 30
    end
    object tblOrdenesFechaUltMod: TStringField
      FieldName = 'FechaUltMod'
      Size = 15
    end
    object tblOrdenesHoraUltMod: TStringField
      FieldName = 'HoraUltMod'
      Size = 15
    end
    object tblOrdenespiva: TFloatField
      FieldName = 'piva'
    end
  end
  object Sqlproveedores: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO proveedores'
      
        '  (idprov, nombre, apaterno, amaterno, rfc, calle, colonia, ciud' +
        'ad, estado, numero, cp, fax, email, idcontacto, idtel, dias_cred' +
        ', iva, cant_provd, cant_provp, debo_v, debo_p, ultima, comentari' +
        'o, npedido, transfer, ctacont, distribcom, distribabo, razon_soc' +
        'ial, alta, usuario, fecha, hora, dias_entrega, curp)'
      'VALUES'
      
        '  (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14, ' +
        ':15, :16, :17, :18, :19, :20, :21, :22, :23, :24, :25, :26, :27,' +
        ' :28, :29, :30, :31, :32, :33, :34, :35)')
    SQLDelete.Strings = (
      'DELETE FROM proveedores'
      'WHERE'
      '  idprov = :Old_1 AND idcontacto = :Old_14 AND idtel = :Old_15')
    SQLUpdate.Strings = (
      'UPDATE proveedores'
      'SET'
      
        '  idprov = :1, nombre = :2, apaterno = :3, amaterno = :4, rfc = ' +
        ':5, calle = :6, colonia = :7, ciudad = :8, estado = :9, numero =' +
        ' :10, cp = :11, fax = :12, email = :13, idcontacto = :14, idtel ' +
        '= :15, dias_cred = :16, iva = :17, cant_provd = :18, cant_provp ' +
        '= :19, debo_v = :20, debo_p = :21, ultima = :22, comentario = :2' +
        '3, npedido = :24, transfer = :25, ctacont = :26, distribcom = :2' +
        '7, distribabo = :28, razon_social = :29, alta = :30, usuario = :' +
        '31, fecha = :32, hora = :33, dias_entrega = :34, curp = :35'
      'WHERE'
      '  idprov = :Old_1 AND idcontacto = :Old_14 AND idtel = :Old_15')
    SQLRefresh.Strings = (
      
        'SELECT idprov, nombre, apaterno, amaterno, rfc, calle, colonia, ' +
        'ciudad, estado, numero, cp, fax, email, idcontacto, idtel, dias_' +
        'cred, iva, cant_provd, cant_provp, debo_v, debo_p, ultima, comen' +
        'tario, npedido, transfer, ctacont, distribcom, distribabo, razon' +
        '_social, alta, usuario, fecha, hora, dias_entrega, curp FROM pro' +
        'veedores'
      'WHERE'
      
        '  proveedores.idprov = :Old_1 AND proveedores.idcontacto = :Old_' +
        '14 AND proveedores.idtel = :Old_15')
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select  '
      
        'idprov,if (nombre <> '#39#39',concat(nombre,'#39'  '#39',apaterno,'#39'  '#39',amatern' +
        'o),rsocial) as nombre '
      'from '
      'proveedores '
      'order by '
      'nombre '
      'asc')
    FetchAll = True
    Left = 56
    Top = 296
  end
  object DSProveedores: TDataSource
    DataSet = Sqlproveedores
    Left = 56
    Top = 328
  end
  object Sqlrejillaalta: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT d.idorden, d.cod_cve, (d.cant_ord + d.cant_sur) as cant_o' +
        'rd, d.cant_sur,'
      
        'd.comentarios, d.costo, a.nombre, (d.cant_ord * d.costo *:iva) a' +
        's iva, a.ultima_compra, a.minimo, a.maximo,'
      '(a.existencia/a.piezasxunidad) as existencia,'
      '(d.cant_ord * d.costo) as subtotal,'
      
        'ROUND(((d.cant_ord * d.costo)*:iva)+d.cant_ord *d.costo,2) as TO' +
        'TAL'
      'FROM '
      'DetOrden as d inner join articulos as a on d.cod_cve = a.cod_cve'
      'WHERE'
      'd.idorden=:Id'
      'ORDER BY  d.cod_cve asc')
    ReadOnly = True
    AfterScroll = SqlrejillaaltaAfterScroll
    FetchAll = True
    Left = 96
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'iva'
        Value = ''
      end
      item
        DataType = ftString
        Name = 'iva'
      end
      item
        DataType = ftInteger
        Name = 'Id'
      end>
  end
  object DsRejilla: TDataSource
    DataSet = Sqlrejillaalta
    Left = 96
    Top = 328
  end
  object sqlrejillaaltatemp: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT d.idorden, d.cod_cve, (d.cant_ord + d.cant_sur) as cant_o' +
        'rd, d.cant_sur, d.comentarios, d.costo,'
      
        'a.nombre, a.ultima_compra, a.minimo, a.maximo, (a.existencia/a.p' +
        'iezasxunidad) as existencia,'
      '(d.cant_ord * d.costo) as subtotal,'
      '(d.cant_ord * d.costo * :iva) as iva,'
      
        'ROUND((d.cant_ord * d.costo * :iva) + (d.cant_ord * d.costo),2) ' +
        'as TOTAL'
      
        'FROM DetOrdenTemp as d inner join articulos as a on d.cod_cve = ' +
        'a.cod_cve'
      'WHERE d.idorden=:Id'
      'ORDER BY  d.cod_cve asc')
    ReadOnly = True
    AfterScroll = sqlrejillaaltatempAfterScroll
    FetchAll = True
    Left = 128
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'iva'
        Value = ''
      end
      item
        DataType = ftString
        Name = 'iva'
      end
      item
        DataType = ftInteger
        Name = 'Id'
      end>
  end
  object pregunta: TLMDCheckListDlg
    CaptionTitle = 'Confirmaci'#243'n'
    Effect = deExplode
    ListBoxShowItems = 0
    ListBoxItemIndex = 0
    ListBoxWidth = 0
    Options = [cloRadioButtons, cloCheckButtons, cloSelectByClick, cloSpeedBtnFlat]
    Prompt = 'Existen requisiciones, desea cargarlas?'
    Items.Strings = (
      'Si'
      'No')
    Left = 184
    Top = 328
  end
  object fuentes: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 584
  end
end
