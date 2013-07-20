object frmotras_entradas: Tfrmotras_entradas
  Left = 230
  Top = 133
  Width = 745
  Height = 619
  Hint = 'Pantalla de Otras Entradas'
  AutoSize = True
  Caption = 'Pantalla de Ajuste de Inventarios'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
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
    Top = 528
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
    Height = 521
    Caption = 'Datos para Ajuste de Inventarios'
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
      Height = 41
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
        Width = 64
        Height = 14
        Caption = 'Num Ajuste'
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
        Left = 544
        Top = 16
        Width = 49
        Height = 14
        Caption = 'Hora Alta'
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
        Width = 56
        Height = 14
        Caption = 'Fecha Alta'
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
        Left = 192
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
      object RzLabel30: TRzLabel
        Left = 184
        Top = 16
        Width = 44
        Height = 14
        Caption = 'Servicio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edbuscar: TRzButtonEdit
        Left = 88
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
      object edHoraAlta: TRzDBEdit
        Left = 613
        Top = 10
        Width = 84
        Height = 22
        Hint = 'Hora de creada la Orden de Compra'
        DataSource = DSajusteinv
        DataField = 'HoraEntrada'
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
      object edservicio: TRzButtonEdit
        Left = 231
        Top = 9
        Width = 104
        Height = 22
        Hint = 'Buscar '
        Alignment = taRightJustify
        CharCase = ecUpperCase
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
        TabOrder = 2
        OnExit = edservicioExit
        OnKeyPress = edservicioKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edservicioButtonClick
      end
      object edFechaAlta: TRzDBDateTimeEdit
        Left = 429
        Top = 11
        Width = 100
        Height = 22
        Hint = 'Fecha de entrega del ajuste'
        DataSource = DSajusteinv
        DataField = 'FechaAlta'
        CharCase = ecUpperCase
        Color = clWhite
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
        TabOrder = 3
        OnEnter = dpagoEnter
        OnKeyPress = edconceptoKeyPress
        EditType = etDate
        FlatButtons = True
      end
    end
    object pnldatos: TPanel
      Left = 2
      Top = 64
      Width = 719
      Height = 449
      BevelOuter = bvNone
      Color = clWhite
      Enabled = False
      TabOrder = 0
      object RzLabel2: TRzLabel
        Left = 8
        Top = 2
        Width = 53
        Height = 14
        Caption = 'Concepto'
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
        Left = 493
        Top = 2
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
        Left = 22
        Top = 74
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
      object RzLabel7: TRzLabel
        Left = 16
        Top = 40
        Width = 41
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Entrada'
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
        Left = 376
        Top = 42
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
        Left = 8
        Top = 328
        Width = 188
        Height = 33
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
        Left = 8
        Top = 365
        Width = 177
        Height = 33
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
        Left = 8
        Top = 399
        Width = 188
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
        Left = 8
        Top = 423
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
      object RzLabel22: TRzLabel
        Left = 424
        Top = 1
        Width = 44
        Height = 14
        Alignment = taRightJustify
        Caption = 'Moneda'
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
      object RzLabel17: TRzLabel
        Left = 209
        Top = 74
        Width = 39
        Height = 28
        Alignment = taRightJustify
        Caption = 'Num Cliente'
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
      object RzLabel28: TRzLabel
        Left = 184
        Top = 40
        Width = 66
        Height = 28
        Alignment = taRightJustify
        Caption = 'Fecha Importaci'#243'n'
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
      object RzLabel36: TRzLabel
        Left = 610
        Top = 16
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
      object dpago: TRzDBDateTimeEdit
        Left = 61
        Top = 80
        Width = 116
        Height = 22
        Hint = 'Fecha de entrega del ajuste'
        DataSource = DSajusteinv
        DataField = 'FechaPago'
        CharCase = ecUpperCase
        Color = clWhite
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
        TabOrder = 8
        OnEnter = dpagoEnter
        OnKeyPress = edconceptoKeyPress
        EditType = etDate
        FlatButtons = True
      end
      object dentrada: TRzDBDateTimeEdit
        Left = 61
        Top = 45
        Width = 116
        Height = 22
        Hint = 'Fecha de vigencia del ajuste'
        DataSource = DSajusteinv
        DataField = 'FechaEntrada'
        CharCase = ecUpperCase
        Color = clWhite
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
        OnEnter = dentradaEnter
        OnKeyPress = edconceptoKeyPress
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
        TabOrder = 11
        object RzLabel13: TRzLabel
          Left = 552
          Top = 17
          Width = 62
          Height = 14
          Caption = 'Cant.(pzas)'
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
          Width = 64
          Height = 14
          Caption = 'Costo x Pza'
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
        object RzLabel23: TRzLabel
          Left = 248
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
          Left = 367
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
          Left = 432
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
          Left = 552
          Top = 64
          Width = 51
          Height = 14
          Caption = 'Unidades'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel29: TRzLabel
          Left = 487
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
          Left = 561
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
          Alignment = taRightJustify
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
          OnKeyPress = EdCosto_unidadKeyPress
        end
        object ediva_art: TRzEdit
          Left = 496
          Top = 32
          Width = 43
          Height = 22
          Hint = 'Iva que aplica al articulo'
          Alignment = taRightJustify
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
          OnChange = edcodigoChange
          OnEnter = edcodigoEnter
          OnKeyPress = edcodigoKeyPress
          ButtonKind = bkFind
          ButtonShortCut = 119
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
          Max = 1000.000000000000000000
          Min = -1000.000000000000000000
          DisplayFormat = ',0;(,0)'
        end
        object edcomentarios: TRzMemo
          Left = 8
          Top = 72
          Width = 225
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
          FrameColor = clActiveCaption
          FrameVisible = True
        end
        object edultcompra: TRzEdit
          Left = 248
          Top = 80
          Width = 97
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
        object edmin: TRzEdit
          Left = 352
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
          Left = 416
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
          Left = 552
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
        object edpiezas: TRzEdit
          Left = 480
          Top = 80
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
          TabOrder = 12
        end
      end
      object ednfactura1: TRzDBEdit
        Left = 616
        Top = 32
        Width = 97
        Height = 22
        Hint = 'N'#250'mero de la factura '
        DataSource = DSajusteinv
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
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
        TabOrder = 9
        Visible = False
        OnExit = ednfactura1Exit
        OnKeyPress = edconceptoKeyPress
      end
      object dimportacion: TRzDBDateTimeEdit
        Left = 253
        Top = 45
        Width = 100
        Height = 22
        Hint = 'Fecha de vigencia del ajuste'
        DataSource = DSajusteinv
        DataField = 'FechaImportacion'
        CharCase = ecUpperCase
        Color = clWhite
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
        OnEnter = dimportacionEnter
        OnKeyPress = edconceptoKeyPress
        EditType = etDate
        FlatButtons = True
      end
      object edbuscares: TRzButtonEdit
        Left = 8
        Top = 19
        Width = 73
        Height = 22
        Hint = 'Buscar concepto para el ajuste'
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
        OnChange = edbuscaresChange
        OnExit = edbuscaresExit
        OnKeyPress = edbuscaresKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edbuscaresButtonClick
      end
      object ednombrec: TRzEdit
        Left = 88
        Top = 19
        Width = 201
        Height = 22
        DisabledColor = clWhite
        Enabled = False
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
      end
      object edmovc: TRzEdit
        Left = 304
        Top = 19
        Width = 105
        Height = 22
        DisabledColor = clWhite
        Enabled = False
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
      end
      object gbtotales: TGroupBox
        Left = 376
        Top = 328
        Width = 337
        Height = 121
        Caption = 'Totales'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        object RzLabel21: TRzLabel
          Left = 19
          Top = 15
          Width = 30
          Height = 26
          Alignment = taRightJustify
          Caption = 'Total Art'
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
          Left = 16
          Top = 52
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
          Left = 16
          Top = 76
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
          Left = 174
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
          Left = 202
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
          Left = 192
          Top = 75
          Width = 32
          Height = 14
          Caption = 'Total  '
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
          Left = 164
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
        object edotrosg: TcxDBCurrencyEdit
          Left = 56
          Top = 67
          Width = 105
          Height = 22
          Hint = 'Otros Gastos'
          DataBinding.DataField = 'otros'
          DataBinding.DataSource = DSajusteinv
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
          TabOrder = 0
          OnExit = edotrosgExit
          OnKeyPress = edotrosgKeyPress
        end
        object edfletes: TcxDBCurrencyEdit
          Left = 56
          Top = 43
          Width = 105
          Height = 22
          Hint = 'Gastos por fletes'
          DataBinding.DataField = 'fletes'
          DataBinding.DataSource = DSajusteinv
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
        object edtp: TRzDBNumericEdit
          Left = 56
          Top = 19
          Width = 105
          Height = 22
          DataSource = DSajusteinv
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
          TabOrder = 2
          DisplayFormat = ',0;(,0)'
        end
        object edtotalmn: TRzDBNumericEdit
          Left = 224
          Top = 91
          Width = 105
          Height = 22
          Hint = 'Costo Total de todos los articulos '
          DataSource = DSajusteinv
          DataField = 'totalmn'
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
          TabOrder = 3
          AllowBlank = False
          IntegersOnly = False
          Max = 100000.000000000000000000
          Min = -10000.000000000000000000
          Value = -10000.000000000000000000
          DisplayFormat = '$,0.000'
        end
        object edtotal: TRzDBNumericEdit
          Left = 224
          Top = 67
          Width = 105
          Height = 22
          Hint = 'Costo Total de todos los articulos '
          DataSource = DSajusteinv
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
          TabOrder = 4
          AllowBlank = False
          IntegersOnly = False
          Max = 1000000.000000000000000000
          Min = -10000.000000000000000000
          Value = -10000.000000000000000000
          DisplayFormat = '$,0.000'
        end
        object ediva: TRzDBNumericEdit
          Left = 224
          Top = 43
          Width = 105
          Height = 22
          Hint = 'Porcentaje de iva '
          DataSource = DSajusteinv
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
          TabOrder = 5
          AllowBlank = False
          Max = 100000.000000000000000000
          DisplayFormat = '$,0.000'
        end
        object edsubtotal: TRzDBNumericEdit
          Left = 224
          Top = 19
          Width = 105
          Height = 22
          Hint = 'Subtotal de todos los articulos '
          DataSource = DSajusteinv
          DataField = 'SubTotal'
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
          TabOrder = 6
          AllowBlank = False
          IntegersOnly = False
          Max = 1000000.000000000000000000
          Min = -10000.000000000000000000
          Value = -10000.000000000000000000
          DisplayFormat = '$,0.000'
        end
      end
      object gbanticipos: TGroupBox
        Left = 192
        Top = 384
        Width = 177
        Height = 65
        Caption = 'Anticipos y Descuentos'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        Visible = False
        object RzLabel32: TRzLabel
          Left = 26
          Top = 20
          Width = 47
          Height = 13
          Caption = 'Anticipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel33: TRzLabel
          Left = 11
          Top = 44
          Width = 62
          Height = 13
          Caption = 'Descuento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object edanticipo: TcxDBCurrencyEdit
          Left = 80
          Top = 11
          Width = 89
          Height = 22
          Hint = 'Anticipo a pagar'
          DataBinding.DataField = 'anticipo'
          DataBinding.DataSource = DSajusteinv
          ParentFont = False
          ParentShowHint = False
          Properties.ReadOnly = False
          Properties.ValidateOnEnter = True
          ShowHint = True
          Style.Edges = [bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.Shadow = False
          TabOrder = 0
          OnKeyPress = edconceptoKeyPress
        end
        object eddescuento: TcxDBCurrencyEdit
          Left = 80
          Top = 35
          Width = 89
          Height = 22
          Hint = 'Descuento por la compra'
          DataBinding.DataField = 'descuento'
          DataBinding.DataSource = DSajusteinv
          ParentFont = False
          ParentShowHint = False
          Properties.DisplayFormat = '%,0.00;(%,0.00)'
          Properties.ReadOnly = False
          Properties.ValidateOnEnter = True
          ShowHint = True
          Style.Edges = [bBottom]
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = []
          Style.Shadow = False
          TabOrder = 1
          OnKeyPress = edconceptoKeyPress
        end
      end
      object rgmoneda: TRzComboBox
        Left = 424
        Top = 19
        Width = 57
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
        TabOrder = 3
        OnEnter = rgmonedaEnter
        OnExit = rgmonedaExit
        OnKeyPress = edconceptoKeyPress
        OnNotInList = rgmonedaNotInList
        Items.Strings = (
          'D'
          'P')
      end
      object eddatosentrega: TRzDBRichEdit
        Left = 376
        Top = 57
        Width = 337
        Height = 44
        Hint = 'Descripci'#243'n del ajuste'
        DataField = 'observaciones'
        DataSource = DSajusteinv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 10
        OnEnter = eddatosentregaEnter
        OnExit = eddatosentregaExit
        DisabledColor = clWhite
        FocusColor = 16776176
        FrameColor = clActiveCaption
        FrameVisible = True
      end
      object edTipoCambio: TRzEdit
        Left = 542
        Top = 11
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
      object edcliente: TRzButtonEdit
        Left = 257
        Top = 80
        Width = 101
        Height = 22
        Hint = 'Buscar por numero de cliente'
        CharCase = ecUpperCase
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnExit = edclienteExit
        OnKeyPress = edclienteKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        OnButtonClick = edclienteButtonClick
      end
      object cbiva: TRzComboBox
        Left = 646
        Top = 10
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
        TabOrder = 14
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
    Left = 344
    Top = 552
    Width = 128
    Height = 29
    Hint = 'Dar de Alta un Ajuste'
    ModalResult = 1
    Caption = '&Alta'
    Font.Charset = DEFAULT_CHARSET
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
    Left = 24
    Top = 552
    Width = 129
    Height = 29
    Hint = 'Cancela el Registro Actual'
    ModalResult = 1
    Caption = '&Cancelar'
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
    Left = 471
    Top = 552
    Width = 130
    Height = 29
    Hint = 'Editar los datos del Registro Actual'
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
    Top = 552
    Width = 127
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
  object tbherramientas: TToolBar
    Left = 557
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
  object Rejilla: TcxGrid
    Left = 8
    Top = 280
    Width = 705
    Height = 113
    Hint = '+ Incrementa Cant., - Decrementa Cant., SUPR Elimina Registro'
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    LookAndFeel.Kind = lfUltraFlat
    object RejillaDBTableView1: TcxGridDBTableView
      OnDblClick = RejillaDBTableView1DblClick
      OnKeyPress = RejillaDBTableView1KeyPress
      OnKeyUp = RejillaDBTableView1KeyUp
      DataController.DataSource = DsRejilla
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
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellEndEllipsis = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Preview.Visible = True
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
        Width = 268
        DataBinding.FieldName = 'nombre'
      end
      object cant: TcxGridDBColumn
        Caption = 'Cant. Orden'
        Options.Editing = False
        Options.Moving = False
        Width = 84
        DataBinding.FieldName = 'cant_ord'
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
      object precio_costo: TcxGridDBColumn
        Caption = 'Costo pza'
        Options.Editing = False
        Options.Moving = False
        Width = 96
        DataBinding.FieldName = 'costo'
      end
      object subtotal: TcxGridDBColumn
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
  object RzBitBtn1: TRzBitBtn
    Left = 216
    Top = 552
    Width = 128
    Height = 29
    Hint = 'Dar de Alta un Ajuste'
    ModalResult = 1
    Caption = '&Reporte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Visible = False
    OnClick = RzBitBtn1Click
    ImageIndex = 5
    Images = DMAccesos.ilopciones
  end
  object DSajusteinv: TDataSource
    DataSet = tblajusteinv
    Left = 24
    Top = 344
  end
  object tblajusteinv: TMyTable
    TableName = 'AjusteInv'
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 24
    Top = 312
    object tblajusteinvidajuste: TIntegerField
      FieldName = 'idajuste'
    end
    object tblajusteinvidconcepto_es: TStringField
      FieldName = 'idconcepto_es'
      Size = 50
    end
    object tblajusteinvFechaAlta: TDateField
      FieldName = 'FechaAlta'
    end
    object tblajusteinvHoraAlta: TTimeField
      FieldName = 'HoraAlta'
    end
    object tblajusteinvFechaEntrada: TDateField
      FieldName = 'FechaEntrada'
    end
    object tblajusteinvHoraEntrada: TTimeField
      FieldName = 'HoraEntrada'
    end
    object tblajusteinvFechaPago: TDateField
      FieldName = 'FechaPago'
    end
    object tblajusteinvidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object tblajusteinvmoneda: TStringField
      FieldName = 'moneda'
      FixedChar = True
      Size = 1
    end
    object tblajusteinvTipoCambio: TFloatField
      FieldName = 'TipoCambio'
    end
    object tblajusteinvanticipo: TFloatField
      FieldName = 'anticipo'
    end
    object tblajusteinvdescuento: TFloatField
      FieldName = 'descuento'
    end
    object tblajusteinvSubTotal: TFloatField
      FieldName = 'SubTotal'
    end
    object tblajusteinviva: TFloatField
      FieldName = 'iva'
    end
    object tblajusteinvfletes: TFloatField
      FieldName = 'fletes'
    end
    object tblajusteinvotros: TFloatField
      FieldName = 'otros'
    end
    object tblajusteinvtotal: TFloatField
      FieldName = 'total'
    end
    object tblajusteinvtotalmn: TFloatField
      FieldName = 'totalmn'
    end
    object tblajusteinvTotalProductos: TIntegerField
      FieldName = 'TotalProductos'
    end
    object tblajusteinvobservaciones: TMemoField
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object tblajusteinvFechaImportacion: TDateField
      FieldName = 'FechaImportacion'
    end
    object tblajusteinvestatus: TStringField
      FieldName = 'estatus'
      Size = 30
    end
    object tblajusteinvusuario: TStringField
      FieldName = 'usuario'
      Size = 30
    end
    object tblajusteinvfecha: TStringField
      FieldName = 'fecha'
      Size = 15
    end
    object tblajusteinvhora: TStringField
      FieldName = 'hora'
      Size = 15
    end
    object tblajusteinvUsuarioUltMod: TStringField
      FieldName = 'UsuarioUltMod'
      Size = 30
    end
    object tblajusteinvFechaUltMod: TStringField
      FieldName = 'FechaUltMod'
      Size = 15
    end
    object tblajusteinvHoraUltMod: TStringField
      FieldName = 'HoraUltMod'
      Size = 15
    end
    object tblajusteinvmovimiento: TStringField
      FieldName = 'movimiento'
      FixedChar = True
      Size = 3
    end
    object tblajusteinvidservicio: TIntegerField
      FieldName = 'idservicio'
    end
    object tblajusteinvfactura: TStringField
      FieldName = 'factura'
      Size = 30
    end
    object tblajusteinvpiva: TFloatField
      FieldName = 'piva'
    end
  end
  object DsRejilla: TDataSource
    DataSet = Sqlrejillaalta
    Left = 64
    Top = 344
  end
  object Sqlrejillaalta: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT'
      ''
      'DetAjusteInv.idajuste,'
      'DetAjusteInv.cod_cve,'
      'DetAjusteInv.cant_ord as cant_ord,'
      'DetAjusteInv.comentarios,'
      'DetAjusteInv.costo,'
      'articulos.nombre,'
      'articulos.iva,'
      'articulos.ultima_compra,'
      'articulos.minimo,'
      'articulos.maximo,'
      '(articulos.existencia/articulos.piezasxunidad) as existencia,'
      '(DetAjusteInv.cant_ord * DetAjusteInv.costo) as subtotal,'
      
        'if (articulos.iva > 0,ROUND(((DetAjusteInv.cant_ord * DetAjusteI' +
        'nv.costo)*(articulos.iva/100))+DetAjusteInv.cant_ord *DetAjusteI' +
        'nv.costo,2),ROUND(DetAjusteInv.cant_ord * DetAjusteInv.costo,2))' +
        ' as TOTAL'
      ''
      'FROM'
      ''
      
        'DetAjusteInv inner join articulos on DetAjusteInv.cod_cve = arti' +
        'culos.cod_cve'
      ''
      'WHERE'
      ''
      'DetAjusteInv.idajuste=:id'
      ''
      '')
    ReadOnly = True
    FetchAll = True
    Left = 64
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'id'
        Value = ''
      end>
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 136
    Top = 312
  end
  object sqlrejillaaltatemp: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT'
      ''
      'DetAjusteInvTemp.idajuste,'
      'DetAjusteInvTemp.cod_cve,'
      '(DetAjusteInvTemp.cant_ord) as cant_ord,'
      'DetAjusteInvTemp.comentarios,'
      'DetAjusteInvTemp.costo,'
      'articulos.nombre,'
      'articulos.iva,'
      'articulos.ultima_compra,'
      'articulos.minimo,'
      'articulos.maximo,'
      '(articulos.existencia/articulos.piezasxunidad) as existencia,'
      
        '(DetAjusteInvTemp.cant_ord * DetAjusteInvTemp.costo) as subtotal' +
        ','
      
        'if (articulos.iva > 0,ROUND(((DetAjusteInvTemp.cant_ord * DetAju' +
        'steInvTemp.costo)*(articulos.iva/100))+DetAjusteInvTemp.cant_ord' +
        ' *DetAjusteInvTemp.costo,2),ROUND(DetAjusteInvTemp.cant_ord * De' +
        'tAjusteInvTemp.costo,2)) as TOTAL'
      ''
      'FROM'
      ''
      
        'DetAjusteInvTemp inner join articulos on DetAjusteInvTemp.cod_cv' +
        'e = articulos.cod_cve'
      ''
      'WHERE'
      ''
      'DetAjusteInvTemp.idajuste=:Id')
    ReadOnly = True
    FetchAll = True
    Left = 96
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end>
  end
  object pregunta: TLMDCheckListDlg
    CaptionTitle = 'Tipo de Ajuste'
    Effect = deExplode
    Options = [cloRadioButtons, cloCheckButtons, cloSelectByClick, cloSpeedBtnFlat]
    Prompt = 'Selecciona el tipo de ajuste'
    Items.Strings = (
      'Otra Entrada'
      'Otra Salida')
    Left = 136
    Top = 344
  end
  object fuentes: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 696
    Top = 8
  end
end
