object frmDevCompras: TfrmDevCompras
  Left = 256
  Top = 84
  Width = 739
  Height = 615
  AutoSize = True
  Caption = 'Devoluciones sobre Compras'
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
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object gbdatos: TGroupBox
    Left = 0
    Top = 0
    Width = 723
    Height = 545
    Caption = 'Datos de la devoluci'#243'n de la compra'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object pnldatos: TPanel
      Left = -6
      Top = 24
      Width = 727
      Height = 513
      BevelOuter = bvNone
      Color = clWhite
      Enabled = False
      TabOrder = 1
      object RzLabel2: TRzLabel
        Left = 192
        Top = 58
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
        Left = 608
        Top = 80
        Width = 57
        Height = 28
        Alignment = taRightJustify
        Caption = 'Tipo de Cambio 1x'
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
        Left = 168
        Top = 80
        Width = 42
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Entrega'
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
      object RzLabel7: TRzLabel
        Left = 16
        Top = 80
        Width = 47
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Vigencia'
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
      object RzLabel11: TRzLabel
        Left = 416
        Top = 106
        Width = 83
        Height = 14
        Caption = 'Observaciones'
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
        Left = 16
        Top = 400
        Width = 230
        Height = 22
        Caption = 
          '*Presione la Tecla (+) para incrementar la cantidad de articulos' +
          ' del rengl'#243'n seleccionado.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label3: TLabel
        Left = 16
        Top = 421
        Width = 217
        Height = 22
        Caption = 
          '*Presione la Tecla (-) para decrementar la cantidad de articulos' +
          ' del rengl'#243'n seleccionado.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label4: TLabel
        Left = 16
        Top = 447
        Width = 174
        Height = 22
        Caption = '*Presione la Tecla (Supr) para eliminar el rengl'#243'n seleccionado.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label5: TLabel
        Left = 16
        Top = 471
        Width = 145
        Height = 22
        Caption = '*Doble click en el registro para modificarlo.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object RzLabel21: TRzLabel
        Left = 16
        Top = 122
        Width = 69
        Height = 14
        Caption = '# Pedimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel23: TRzLabel
        Left = 24
        Top = 146
        Width = 59
        Height = 14
        Caption = 'Fecha Imp.'
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
        Left = 16
        Top = 56
        Width = 82
        Height = 14
        Caption = '# Folio Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object SpeedButton1: TSpeedButton
        Left = 352
        Top = 240
        Width = 23
        Height = 22
      end
      object SpeedButton2: TSpeedButton
        Left = 360
        Top = 248
        Width = 23
        Height = 22
      end
      object RzLabel25: TRzLabel
        Left = 504
        Top = 80
        Width = 44
        Height = 28
        Alignment = taRightJustify
        Caption = 'Tipo Moneda'
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
      object RzLabel29: TRzLabel
        Left = 248
        Top = 122
        Width = 41
        Height = 14
        Caption = 'Aduana'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel30: TRzLabel
        Left = 240
        Top = 146
        Width = 49
        Height = 14
        Caption = 'Num Fac.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel31: TRzLabel
        Left = 336
        Top = 80
        Width = 35
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Pago'
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
      object RzLabel32: TRzLabel
        Left = 240
        Top = 458
        Width = 47
        Height = 13
        Caption = 'Anticipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Rejilla: TcxGrid
        Left = 8
        Top = 280
        Width = 713
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
        TabOrder = 12
        LookAndFeel.Kind = lfUltraFlat
        object RejillaDBTableView1: TcxGridDBTableView
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
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Preview.Visible = True
          object idorden: TcxGridDBColumn
            Caption = 'IDOrden'
            Options.Editing = False
            Options.Moving = False
            Width = 58
            DataBinding.FieldName = 'idorden'
          end
          object clave: TcxGridDBColumn
            Caption = 'Clave'
            Options.Editing = False
            Options.Moving = False
            Width = 71
            DataBinding.FieldName = 'cod_cve'
          end
          object nombre: TcxGridDBColumn
            Caption = 'Nombre'
            Options.Editing = False
            Options.Moving = False
            Width = 243
            DataBinding.FieldName = 'nombre'
          end
          object comentarios: TcxGridDBColumn
            Caption = 'Comentario'
            Width = 244
            DataBinding.FieldName = 'comentarios'
          end
          object cant: TcxGridDBColumn
            Caption = 'Cant. Orden'
            Options.Editing = False
            Options.Moving = False
            Width = 84
            DataBinding.FieldName = 'cant_ord'
          end
          object cant_surt: TcxGridDBColumn
            Caption = 'Cant. Surt.'
            Visible = False
            Width = 75
            DataBinding.FieldName = 'cant_sur'
          end
          object precio_costo: TcxGridDBColumn
            Caption = 'Costo Unidad'
            Options.Editing = False
            Options.Moving = False
            Width = 96
            DataBinding.FieldName = 'costo'
          end
          object subtotal: TcxGridDBColumn
            Caption = 'Subtotal'
            Width = 100
            DataBinding.FieldName = 'subtotal'
          end
          object dbiva: TcxGridDBColumn
            Caption = 'Iva'
            Options.Editing = False
            Options.Moving = False
            Width = 48
            DataBinding.FieldName = 'iva'
          end
          object total: TcxGridDBColumn
            Options.Editing = False
            Options.Moving = False
            Width = 114
            DataBinding.FieldName = 'Total'
          end
        end
        object RejillaLevel1: TcxGridLevel
          GridView = RejillaDBTableView1
        end
      end
      object gbarticulo: TGroupBox
        Left = 16
        Top = 168
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
        TabOrder = 14
        object RzLabel13: TRzLabel
          Left = 560
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
          Left = 149
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
          Left = 455
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
        object RzLabel16: TRzLabel
          Left = 525
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
        object RzLabel19: TRzLabel
          Left = 312
          Top = 59
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
        object RzLabel26: TRzLabel
          Left = 431
          Top = 59
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
        object RzLabel27: TRzLabel
          Left = 504
          Top = 59
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
        object RzLabel28: TRzLabel
          Left = 576
          Top = 59
          Width = 26
          Height = 14
          Caption = 'Exist'
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
          Left = 624
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
        object edcantidad: TRzNumericEdit
          Left = 561
          Top = 32
          Width = 47
          Height = 22
          Hint = 'Teclee la cantidad de Articulos'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          OnKeyPress = edcantidadKeyPress
          Max = 1000.000000000000000000
          Min = -1000.000000000000000000
          Value = 1.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
        object btnagregar: TRzBitBtn
          Left = 616
          Top = 21
          Width = 81
          Hint = 'Modificar comentario'
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
          TabOrder = 1
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
          Left = 144
          Top = 32
          Width = 289
          Height = 22
          Hint = 'Descripci'#243'n del articulo'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          TabOrder = 2
        end
        object ediva_art: TRzEdit
          Left = 512
          Top = 32
          Width = 43
          Height = 22
          Hint = 'Iva que aplica al articulo'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
        object edcomentarios: TRzMemo
          Left = 8
          Top = 72
          Width = 281
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
          TabOrder = 4
          OnEnter = edcomentariosEnter
          OnExit = edcomentariosExit
          FrameColor = clActiveCaption
          FrameVisible = True
        end
        object edultcompra: TRzEdit
          Left = 320
          Top = 81
          Width = 65
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
          TabOrder = 5
        end
        object edmin: TRzEdit
          Left = 416
          Top = 81
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
          TabOrder = 6
        end
        object edmax: TRzEdit
          Left = 488
          Top = 81
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
          TabOrder = 7
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
          TabOrder = 8
        end
        object EdCosto_unidad: TRzEdit
          Left = 440
          Top = 32
          Width = 65
          Height = 22
          Hint = 
            'Costo del articulo, dar enter para modificarlo o agregar el arti' +
            'culo'
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          TabOrder = 9
        end
        object edcodigo: TRzButtonEdit
          Left = 8
          Top = 33
          Width = 129
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
          TabOrder = 10
          OnChange = edcodigoChange
          OnEnter = edcodigoEnter
          OnKeyPress = edcodigoKeyPress
          ButtonKind = bkFind
          ButtonShortCut = 119
          FlatButtons = True
          OnButtonClick = edcodigoButtonClick
        end
      end
      object edbuscarcompra: TRzButtonEdit
        Left = 104
        Top = 48
        Width = 81
        Height = 22
        Hint = 'Buscar  la compra a devolver'
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
        OnChange = edbuscarcompraChange
        OnExit = edbuscarcompraExit
        OnKeyPress = edbuscarcompraKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edbuscarcompraButtonClick
      end
      object edprov: TRzEdit
        Left = 256
        Top = 48
        Width = 353
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
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
      object edTipoCambio: TRzEdit
        Left = 672
        Top = 80
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
        TabOrder = 2
        OnExit = edTipoCambioExit
        OnKeyPress = eddatosentregaKeyPress
      end
      object dentrega: TRzEdit
        Left = 216
        Top = 80
        Width = 113
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object dvigencia: TRzEdit
        Left = 72
        Top = 80
        Width = 89
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object dpago: TRzEdit
        Left = 376
        Top = 80
        Width = 113
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      end
      object edpedimento: TRzEdit
        Left = 96
        Top = 112
        Width = 137
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
        TabOrder = 7
      end
      object edaduana: TRzEdit
        Left = 296
        Top = 112
        Width = 105
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
        TabOrder = 8
      end
      object dimportacion: TRzEdit
        Left = 96
        Top = 136
        Width = 137
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
        TabOrder = 9
      end
      object edfactura: TRzEdit
        Left = 296
        Top = 136
        Width = 105
        Height = 22
        Hint = 'Nombre '#243' Raz'#243'n Social del Proveedor'
        DisabledColor = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
        TabOrder = 10
      end
      object edanticipo: TRzEdit
        Left = 216
        Top = 480
        Width = 105
        Height = 22
        Text = '0'
        Alignment = taRightJustify
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
        TabOrder = 13
        Visible = False
      end
      object rgmoneda: TRzComboBox
        Left = 552
        Top = 80
        Width = 49
        Height = 22
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
        TabOrder = 1
        OnEnter = rgmonedaEnter
        OnExit = rgmonedaExit
        OnKeyPress = eddatosentregaKeyPress
        OnNotInList = rgmonedaNotInList
        Items.Strings = (
          'D'
          'P')
      end
      object gbtotales: TGroupBox
        Left = 360
        Top = 392
        Width = 361
        Height = 121
        Caption = 'Totales'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        object RzLabel22: TRzLabel
          Left = 8
          Top = 23
          Width = 58
          Height = 26
          Alignment = taRightJustify
          Caption = 'Total Productos'
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
        object RzLabel18: TRzLabel
          Left = 32
          Top = 60
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
        object RzLabel9: TRzLabel
          Left = 32
          Top = 84
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
        object RzLabel17: TRzLabel
          Left = 188
          Top = 99
          Width = 52
          Height = 14
          Caption = 'Total M.N.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object edotros: TRzEdit
          Left = 72
          Top = 51
          Width = 105
          Height = 22
          Text = '0'
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
          TabOrder = 0
          OnExit = edotrosExit
          OnKeyPress = edotrosKeyPress
        end
        object edfletes: TRzEdit
          Left = 72
          Top = 75
          Width = 105
          Height = 22
          Text = '0'
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
          TabOrder = 1
          OnExit = edfletesExit
          OnKeyPress = edfletesKeyPress
        end
        object edtp: TRzEdit
          Left = 72
          Top = 27
          Width = 105
          Height = 22
          Text = '0'
          Alignment = taRightJustify
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
          TabOrder = 2
        end
        object edtotalmn: TRzEdit
          Left = 248
          Top = 91
          Width = 105
          Height = 22
          Text = '0'
          Alignment = taRightJustify
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
          TabOrder = 3
        end
        object edtotal: TRzEdit
          Left = 248
          Top = 67
          Width = 105
          Height = 22
          Text = '0'
          Alignment = taRightJustify
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
          TabOrder = 4
        end
        object ediva: TRzEdit
          Left = 248
          Top = 43
          Width = 105
          Height = 22
          Text = '0'
          Alignment = taRightJustify
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
          TabOrder = 5
        end
        object edsubtotal: TRzEdit
          Left = 248
          Top = 19
          Width = 105
          Height = 22
          Text = '0'
          Alignment = taRightJustify
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
          TabOrder = 6
        end
      end
      object eddatosentrega: TRzDBRichEdit
        Left = 416
        Top = 125
        Width = 297
        Height = 44
        Hint = 'Descripci'#243'n de la devoluci'#243'n'
        DataField = 'observaciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 11
        OnEnter = eddatosentregaEnter
        OnExit = eddatosentregaExit
        OnKeyPress = eddatosentregaKeyPress
        DisabledColor = clWhite
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameVisible = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 24
      Width = 705
      Height = 41
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 8
        Top = 16
        Width = 48
        Height = 14
        Caption = 'Num Dev'
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
        Left = 367
        Top = 16
        Width = 57
        Height = 14
        Caption = 'Fecha Dev.'
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
        Left = 560
        Top = 16
        Width = 51
        Height = 14
        Caption = 'Hora Dev '
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
        Left = 168
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
        Left = 64
        Top = 8
        Width = 89
        Height = 22
        Hint = 'Buscar Compra'
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
      object edFechaAlta: TRzDBEdit
        Left = 432
        Top = 10
        Width = 97
        Height = 22
        Hint = 'Fecha de creaci'#243'n de la devoluci'#243'n de la compra'
        DataSource = DSDevCompras
        DataField = 'FechaDev'
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
      object edHoraAlta: TRzDBEdit
        Left = 613
        Top = 10
        Width = 84
        Height = 22
        Hint = 'Hora de creada la devoluci'#243'n de la compra'
        DataSource = DSDevCompras
        DataField = 'HoraDev'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        FrameController = DMAccesos.frmctr
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object btnalta: TRzBitBtn
    Left = 482
    Top = 547
    Width = 120
    Height = 29
    Hint = 'Dar de Alta una  Devoluci'#243'n sobre compra'
    ModalResult = 1
    Caption = '&Alta'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    Left = 242
    Top = 547
    Width = 121
    Height = 29
    Hint = 'Cancela la Devoluci'#243'n Actual'
    ModalResult = 1
    Caption = '&Borrar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = False
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
    Left = 362
    Top = 547
    Width = 121
    Height = 29
    Hint = 'Editar los datos de la Devoluci'#243'n Actual'
    ModalResult = 1
    Caption = '&Editar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Visible = False
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
    Left = 602
    Top = 547
    Width = 119
    Height = 29
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
  object btnimprimir: TRzBitBtn
    Left = 6
    Top = 545
    Width = 115
    Height = 32
    Hint = 'Imprimir datos generales de la oportunidad'
    Caption = '&Imprimir '
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 5
    OnClick = btnimprimirClick
    ImageIndex = 20
    Images = DMAccesos.ilopciones
  end
  object tbherramientas: TToolBar
    Left = 551
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
    TabOrder = 6
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
  object tblDevCompras: TMyTable
    TableName = 'DevCompras'
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 24
    Top = 312
    object tblDevComprasiddev: TIntegerField
      FieldName = 'iddev'
      Origin = 'DevCompras.iddev'
    end
    object tblDevComprasidcompra: TIntegerField
      FieldName = 'idcompra'
      Origin = 'DevCompras.idcompra'
    end
    object tblDevComprasFechaDev: TDateField
      FieldName = 'FechaDev'
      Origin = 'DevCompras.FechaDev'
    end
    object tblDevComprasDetallesDev: TMemoField
      FieldName = 'DetallesDev'
      Origin = 'DevCompras.DetallesDev'
      BlobType = ftMemo
    end
    object tblDevComprasTipoCambio: TFloatField
      FieldName = 'TipoCambio'
      Origin = 'DevCompras.TipoCambio'
    end
    object tblDevComprasmoneda: TStringField
      FieldName = 'moneda'
      Origin = 'DevCompras.moneda'
      FixedChar = True
      Size = 1
    end
    object tblDevComprassubtotal: TFloatField
      FieldName = 'subtotal'
      Origin = 'DevCompras.subtotal'
    end
    object tblDevComprasiva: TFloatField
      FieldName = 'iva'
      Origin = 'DevCompras.iva'
    end
    object tblDevComprastotal: TFloatField
      FieldName = 'total'
      Origin = 'DevCompras.total'
    end
    object tblDevComprastotalmn: TFloatField
      FieldName = 'totalmn'
      Origin = 'DevCompras.totalmn'
    end
    object tblDevComprasTotalProductos: TIntegerField
      FieldName = 'TotalProductos'
      Origin = 'DevCompras.TotalProductos'
    end
    object tblDevComprasusuario: TStringField
      FieldName = 'usuario'
      Origin = 'DevCompras.usuario'
      Size = 15
    end
    object tblDevComprasfecha: TStringField
      FieldName = 'fecha'
      Origin = 'DevCompras.fecha'
      Size = 15
    end
    object tblDevComprashora: TStringField
      FieldName = 'hora'
      Origin = 'DevCompras.hora'
      Size = 15
    end
    object tblDevComprasHoraDev: TTimeField
      FieldName = 'HoraDev'
      Origin = 'DevCompras.HoraDev'
    end
    object tblDevComprasestatus: TStringField
      FieldName = 'estatus'
      Size = 30
    end
    object tblDevComprasUsuarioUltMod: TStringField
      FieldName = 'UsuarioUltMod'
      Size = 30
    end
    object tblDevComprasFechaUltMod: TStringField
      FieldName = 'FechaUltMod'
      Size = 15
    end
    object tblDevComprasHoraUltMod: TStringField
      FieldName = 'HoraUltMod'
      Size = 15
    end
  end
  object DSDevCompras: TDataSource
    DataSet = tblDevCompras
    Left = 24
    Top = 368
  end
  object Sqlrejillaalta: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT'
      'DetDevCompras.idorden,'
      'DetDevCompras.iddev,'
      'DetDevCompras.cod_cve,'
      'DetDevCompras.cant_ord,'
      'DetDevCompras.comentarios,'
      'DetDevCompras.costo,'
      'articulos.nombre,'
      'articulos.iva,'
      'articulos.ultima_compra,'
      'articulos.minimo,'
      'articulos.maximo,'
      '(articulos.existencia/articulos.piezasxunidad) as existencia,'
      '(DetDevCompras.cant_ord * DetDevCompras.costo) as subtotal,'
      
        'if (articulos.iva > 0,ROUND(((DetDevCompras.cant_ord * DetDevCom' +
        'pras.costo)*(articulos.iva/100))+DetDevCompras.cant_ord * DetDev' +
        'Compras.costo,2),ROUND(DetDevCompras.cant_ord * DetDevCompras.co' +
        'sto,2)) as TOTAL'
      ''
      'FROM'
      ''
      
        'DetDevCompras inner join articulos on DetDevCompras.cod_cve = ar' +
        'ticulos.cod_cve'
      ''
      'WHERE'
      ''
      'DetDevCompras.iddev=:Id'
      ''
      'ORDER BY  DetDevCompras.cod_cve DESC')
    ReadOnly = True
    FetchAll = True
    Left = 120
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end>
  end
  object DsRejilla: TDataSource
    DataSet = Sqlrejillaalta
    Left = 72
    Top = 376
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 120
    Top = 368
  end
  object Sqlrejillaaltatemp: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT'
      'DetDevComprasTemp.idorden,'
      'DetDevComprasTemp.iddev,'
      'DetDevComprasTemp.cod_cve,'
      'DetDevComprasTemp.cant_ord,'
      'DetDevComprasTemp.comentarios,'
      'DetDevComprasTemp.costo,'
      'articulos.nombre,'
      'articulos.iva,'
      'articulos.ultima_compra,'
      'articulos.minimo,'
      'articulos.maximo,'
      '(articulos.existencia/articulos.piezasxunidad) as existencia,'
      
        '(DetDevComprasTemp.cant_ord * DetDevComprasTemp.costo) as subtot' +
        'al,'
      
        'if (articulos.iva > 0,ROUND(((DetDevComprasTemp.cant_ord * DetDe' +
        'vComprasTemp.costo)*(articulos.iva/100))+DetDevComprasTemp.cant_' +
        'ord * DetDevComprasTemp.costo,2),ROUND(DetDevComprasTemp.cant_or' +
        'd * DetDevComprasTemp.costo,2)) as TOTAL'
      ''
      'FROM'
      ''
      
        'DetDevComprasTemp inner join articulos on DetDevComprasTemp.cod_' +
        'cve = articulos.cod_cve'
      ''
      'WHERE'
      ''
      'DetDevComprasTemp.iddev=:Id'
      ''
      'ORDER BY  DetDevComprasTemp.cod_cve DESC')
    FetchAll = True
    Left = 160
    Top = 321
    ParamData = <
      item
        DataType = ftString
        Name = 'Id'
        Value = ''
      end>
  end
  object sqlgeneral2: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 176
    Top = 368
  end
  object fuentes: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 696
    Top = 16
  end
end
