object frmmoduloreportes: Tfrmmoduloreportes
  Left = 404
  Top = 78
  Width = 1036
  Height = 663
  AutoSize = True
  Caption = '\'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzURLLabel7: TRzURLLabel
    Left = 56
    Top = 272
    Width = 67
    Height = 13
    Caption = 'RzURLLabel7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object TabPrincipal: TRzPageControl
    Left = 0
    Top = 34
    Width = 1020
    Height = 591
    ActivePage = TabCob
    Align = alTop
    BackgroundColor = clGradientInactiveCaption
    BoldCurrentTab = True
    Color = 16119543
    UseColoredTabs = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    FlatColor = clMedGray
    HotTrackColor = 3983359
    ParentBackgroundColor = False
    ParentColor = False
    ParentFont = False
    TabColors.HighlightBar = 3983359
    TabColors.Shadow = clMoneyGreen
    TabColors.Unselected = clActiveCaption
    TabIndex = 3
    TabOrder = 0
    TabStyle = tsRoundCorners
    TextColors.DisabledShadow = clBlue
    OnTabClick = TabPrincipalTabClick
    FixedDimension = 20
    object TabReportesGenerales: TRzTabSheet
      Color = 16119543
      Caption = 'REPORTES GENERALES'
      object RzSeparator1: TRzSeparator
        Left = 8
        Top = 16
        Width = 649
        ShowGradient = True
        ParentColor = False
      end
      object btnreporteador: TRzBitBtn
        Left = 32
        Top = 42
        Width = 105
        Height = 31
        Caption = '&Reporteador '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnreporteadorClick
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
        NumGlyphs = 2
        Spacing = 3
      end
    end
    object TabClientes: TRzTabSheet
      Color = 16119543
      Caption = 'CLIENTES'
      object tabclientes2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabClientes2Catalagos
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        OnTabClick = tabclientes2TabClick
        FixedDimension = 20
        object TabClientes2Catalagos: TRzTabSheet
          Color = 16119543
          Caption = 'Catalogos'
          object RzURLLabel9: TRzURLLabel
            Left = 32
            Top = 32
            Width = 50
            Height = 13
            Caption = 'Categorias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbcategoriasClick
            OnMouseMove = lbcategoriasMouseMove
            OnMouseLeave = lbcategoriasMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object linea: TRzSeparator
            Left = 8
            Top = 16
            Width = 649
            ShowGradient = True
            ParentColor = False
          end
          object RzURLLabel2: TRzURLLabel
            Left = 32
            Top = 56
            Width = 120
            Height = 13
            Caption = 'Envio de Trafico por Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RzURLLabel2Click
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzURLLabel3: TRzURLLabel
            Left = 32
            Top = 80
            Width = 265
            Height = 13
            Caption = 'Cuentas Activas por Colonia Ordenadas por la Direccion'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RzURLLabel3Click
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzURLLabel5: TRzURLLabel
            Left = 32
            Top = 112
            Width = 180
            Height = 13
            Caption = 'Cuentas CON Resistencia Fin de linea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RzURLLabel5Click
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzURLLabel6: TRzURLLabel
            Left = 32
            Top = 136
            Width = 175
            Height = 13
            Caption = 'Cuentas SIN Resistencia Fin de linea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RzURLLabel6Click
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
        end
        object TabClientes2EC: TRzTabSheet
          Color = 16119543
          Caption = 'Estado de Cuenta'
          object lbcuenta: TRzLabel
            Left = 28
            Top = 28
            Width = 49
            Height = 16
            Alignment = taRightJustify
            Caption = 'Cuenta:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lborden: TRzLabel
            Left = 20
            Top = 48
            Width = 54
            Height = 16
            Alignment = taRightJustify
            Caption = 'Nombre:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel15: TRzLabel
            Left = 9
            Top = 64
            Width = 64
            Height = 16
            Alignment = taRightJustify
            Caption = 'Direccion:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lnombre: TRzLabel
            Left = 80
            Top = 48
            Width = 4
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object ldir: TRzLabel
            Left = 80
            Top = 65
            Width = 4
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel16: TRzLabel
            Left = 28
            Top = 80
            Width = 45
            Height = 16
            Alignment = taRightJustify
            Caption = 'Sector:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lsector: TRzLabel
            Left = 80
            Top = 80
            Width = 4
            Height = 16
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel17: TRzLabel
            Left = 12
            Top = 104
            Width = 91
            Height = 16
            Caption = 'Notas de pago'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel18: TRzLabel
            Left = 12
            Top = 192
            Width = 59
            Height = 32
            Alignment = taRightJustify
            Caption = 'Notas de saldos'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel19: TRzLabel
            Left = 12
            Top = 152
            Width = 93
            Height = 16
            Caption = 'Observaciones'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel20: TRzLabel
            Left = 84
            Top = 192
            Width = 25
            Height = 16
            Caption = '0-30'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel21: TRzLabel
            Left = 76
            Top = 240
            Width = 32
            Height = 16
            Caption = '31-60'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel22: TRzLabel
            Left = 76
            Top = 288
            Width = 32
            Height = 16
            Caption = '61-90'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel23: TRzLabel
            Left = 84
            Top = 337
            Width = 26
            Height = 16
            Caption = '+ 90'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object edbuscar: TRzButtonEdit
            Left = 84
            Top = 24
            Width = 89
            Height = 22
            Hint = 'Buscar la cuenta del cliente'
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
          object notapago: TRzMemo
            Left = 108
            Top = 96
            Width = 429
            Height = 49
            Hint = 'Las notas que van de encabezado en el estado de cuenta'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              
                '****************************AVISO IMPORTANTE********************' +
                '********'
              'LE RECORDAMOS QUE LA FECHA DE VENCIMIENTO SON EL DIA '
              'ULTIMO DE CADA MES, EVITE BLOQUEO Y PAGO DE RECARGOS.')
            ParentFont = False
            TabOrder = 1
            FocusColor = 16776176
            FrameColor = clActiveCaption
            FrameVisible = True
          end
          object notaobservaciones: TRzMemo
            Left = 108
            Top = 144
            Width = 429
            Height = 49
            Hint = 'La nota que se encuentra en el pie del reporte'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              'Recibimos sus pagos en CABLEMAS,BANCO HSBC,'
              '**solicite el formato de autorizacion con cargo automatico a su '
              'tarjeta de cr'#233'dito y/o debito con 5% de Descto.Adicional**')
            ParentFont = False
            TabOrder = 2
            FocusColor = 16776176
            FrameColor = clActiveCaption
            FrameVisible = True
          end
          object nota1: TRzMemo
            Left = 108
            Top = 192
            Width = 429
            Height = 49
            Hint = 'Nota que se mostrara si solo debe a un perido de 0-30 dias '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              'A30: VENCIMIENTO DE 1 A 30 DIAS. '
              '***SU SISTEMA SERA BLOQUEADO. EVITE MOLESTIAS Y PAGO DE '
              'RECARGOS.***VENCIMIENTO CADA DIA 28 DEL MES.')
            ParentFont = False
            TabOrder = 3
            FocusColor = 16776176
            FrameColor = clActiveCaption
            FrameVisible = True
          end
          object nota2: TRzMemo
            Left = 108
            Top = 240
            Width = 429
            Height = 49
            Hint = 'Nota que se mostrara si solo debe a un perido de 31-60 dias '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              
                'A60: SUPERVISOR VTO. MAYOR DE 30 DIAS. SU PAGO SE ENCUENTRA VENC' +
                'IDO '
              'SERV. DE MONITOREO BLOQUEADO '
              'Y SERA CANCELADO. EVITE TRAMITE JUDICIAL.')
            ParentFont = False
            TabOrder = 4
            FocusColor = 16776176
            FrameColor = clActiveCaption
            FrameVisible = True
          end
          object nota3: TRzMemo
            Left = 108
            Top = 288
            Width = 429
            Height = 49
            Hint = 'Nota que se mostrara si solo debe a un perido de 61-90 dias '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              'A90:VTO MAYOR DE 61 DIAS. SISTEMA BLOQUEADO, SERVICIO Y CREDITO '
              'CANCELADO SU CUENTA HA SIDO TURNADA '
              'AL DEPARTAMENTO JURIDICO.')
            ParentFont = False
            TabOrder = 5
            FocusColor = 16776176
            FrameColor = clActiveCaption
            FrameVisible = True
          end
          object nota4: TRzMemo
            Left = 108
            Top = 336
            Width = 429
            Height = 41
            Hint = 'Nota que se mostrara si solo debe a un perido de + de 90 dias '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Lines.Strings = (
              
                'M90:VTO MAYOR DE 91 DIAS. SU CUENTA EN TRAMITE JUDICIAL COMUNIQU' +
                'ESE AL '
              'TEL. 557-0202 CON EL RESPONSABLE DE SU CUENTA.')
            ParentFont = False
            TabOrder = 6
            OnExit = nota4Exit
            FocusColor = 16776176
            FrameColor = clActiveCaption
            FrameVisible = True
          end
        end
        object TabClientes2TC: TRzTabSheet
          Color = 16119543
          Caption = 'Tarjeta del Cliente'
          object gb: TRzGroupBox
            Left = 24
            Top = 48
            Width = 169
            Height = 73
            Caption = 'Orden'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object rbventa: TRzRadioButton
              Left = 24
              Top = 48
              Width = 115
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Venta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              HotTrack = True
              ParentFont = False
              TabOrder = 0
            end
            object rbfecha: TRzRadioButton
              Left = 24
              Top = 24
              Width = 115
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Fecha'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              HotTrack = True
              ParentFont = False
              TabOrder = 1
              TabStop = True
            end
          end
        end
        object TabClientes2ECLote: TRzTabSheet
          Color = 16119543
          Caption = 'Estado de Cuenta X Lotes'
          object RzLabel30: TRzLabel
            Left = 200
            Top = 58
            Width = 505
            Height = 48
            Alignment = taRightJustify
            Caption = 
              'Impresion de estados de cuentas en lote  :  selecccione el rango' +
              ' de colonias  o de click en todas para  todas las colonias .'#13#10'El' +
              ' orden es ascendente. '
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbimprimir: TRzLabel
            Left = 12
            Top = 34
            Width = 125
            Height = 16
            Alignment = taCenter
            Caption = 'Cuentas a Imprimir:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object gbcolonia: TRzGroupBox
            Left = 24
            Top = 112
            Width = 433
            Caption = 'Colonia'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel28: TRzLabel
              Left = 12
              Top = 49
              Width = 39
              Height = 16
              Caption = 'Desde'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel29: TRzLabel
              Left = 12
              Top = 81
              Width = 35
              Height = 16
              Caption = 'Hasta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object chkcolonias: TRzCheckBox
              Left = 328
              Top = 16
              Width = 73
              Height = 17
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Todos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              HotTrack = True
              ParentFont = False
              State = cbUnchecked
              TabOrder = 0
            end
            object cbocolonia1: TRzComboBox
              Left = 56
              Top = 40
              Width = 361
              Height = 24
              Hint = 'Desde el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnNotInList = cbocolonia1NotInList
            end
            object cbocolonia2: TRzComboBox
              Left = 56
              Top = 72
              Width = 361
              Height = 24
              Hint = 'Hasta el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnNotInList = cbocolonia2NotInList
              Items.Strings = (
                'EQUIPO'
                'SERVICIO'
                'MONITOREO'
                'INTERESES')
            end
          end
          object rgservicio: TRadioGroup
            Left = 24
            Top = 232
            Width = 433
            Height = 49
            Caption = 'Tipo de Servicio'
            Color = 16119543
            Columns = 3
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemIndex = 0
            Items.Strings = (
              'Todas'
              'Con Patrullaje'
              'Sin Patrullaje')
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
        end
        object TabClientes2status: TRzTabSheet
          Color = 16119543
          Caption = 'Estatus'
          object LTotal: TRzLabel
            Left = 32
            Top = 136
            Width = 32
            Height = 14
            Caption = 'Total: '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RCount: TRzLabel
            Left = 99
            Top = 136
            Width = 6
            Height = 14
            Alignment = taRightJustify
            Caption = '0'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object Pestatus: TRzGroupBox
            Left = 256
            Top = 32
            Width = 185
            Height = 97
            Caption = ' Estatus '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RBSTactivo: TRzRadioButton
              Left = 40
              Top = 24
              Width = 115
              Height = 17
              Caption = 'Activo'
              Checked = True
              HotTrack = True
              TabOrder = 0
              TabStop = True
              OnKeyPress = RBSTactivoKeyPress
            end
            object RBSTInactivo: TRzRadioButton
              Left = 40
              Top = 48
              Width = 115
              Height = 17
              Caption = 'Inactivo'
              HotTrack = True
              TabOrder = 1
              OnKeyPress = RBSTInactivoKeyPress
            end
            object RBSTTodos: TRzRadioButton
              Left = 40
              Top = 72
              Width = 115
              Height = 17
              Caption = 'Todos'
              HotTrack = True
              TabOrder = 2
              OnClick = RBSTTodosClick
              OnKeyPress = RBSTTodosKeyPress
            end
          end
          object Pimprimir: TRzGroupBox
            Left = 472
            Top = 32
            Width = 185
            Height = 81
            Caption = ' Imprimir '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object RBSTDetallado: TRzRadioButton
              Left = 32
              Top = 27
              Width = 115
              Height = 17
              Caption = 'Detallado'
              HotTrack = True
              TabOrder = 0
              OnClick = RBSTDetalladoClick
              OnKeyPress = RBSTDetalladoKeyPress
            end
            object RBSTNodetallado: TRzRadioButton
              Left = 32
              Top = 50
              Width = 115
              Height = 17
              Caption = 'No Detallado'
              Checked = True
              HotTrack = True
              TabOrder = 1
              TabStop = True
              OnClick = RBSTNodetalladoClick
              OnKeyPress = RBSTNodetalladoKeyPress
            end
          end
          object GRGeneral: TcxGrid
            Left = 16
            Top = 152
            Width = 961
            Height = 385
            TabOrder = 3
            object GRView: TcxGridDBTableView
              OnDblClick = GRViewDblClick
              DataController.DataSource = DMREPORTES.DssqlGeneral
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OnCellClick = GRViewCellClick
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
            end
            object GRLevel: TcxGridLevel
              GridView = GRView
            end
          end
          object Pcuenta: TRzGroupBox
            Left = 24
            Top = 32
            Width = 201
            Height = 97
            Caption = ' Numero de Cuenta '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel31: TRzLabel
              Left = 16
              Top = 32
              Width = 38
              Height = 14
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel32: TRzLabel
              Left = 16
              Top = 64
              Width = 33
              Height = 14
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object EDdesde: TRzEdit
              Left = 80
              Top = 24
              Width = 89
              Height = 22
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 0
              OnChange = EDdesdeChange
              OnKeyPress = EDdesdeKeyPress
            end
            object EDhasta: TRzEdit
              Left = 80
              Top = 56
              Width = 89
              Height = 22
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 1
              OnChange = EDhastaChange
              OnKeyPress = EDhastaKeyPress
            end
          end
        end
        object TabClientes2Bloq: TRzTabSheet
          Color = 16119543
          Caption = 'Bloqueados'
          object gbfechas: TRzGroupBox
            Left = 472
            Top = 40
            Width = 153
            Height = 73
            Caption = ' Fechas '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object RzLdesde: TRzLabel
              Left = 8
              Top = 16
              Width = 38
              Height = 14
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLhasta: TRzLabel
              Left = 8
              Top = 48
              Width = 33
              Height = 14
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object tpdesde: TRzDateTimePicker
              Left = 48
              Top = 16
              Width = 89
              Height = 22
              Date = 38849.687037569440000000
              Time = 38849.687037569440000000
              TabOrder = 0
              OnKeyPress = tpdesdeKeyPress
              FlatButtons = True
              DisabledColor = clWhite
              FrameSides = [sdBottom]
              FrameVisible = True
            end
            object tphasta: TRzDateTimePicker
              Left = 48
              Top = 40
              Width = 89
              Height = 22
              Date = 38849.687176284720000000
              Time = 38849.687176284720000000
              TabOrder = 1
              OnKeyPress = tphastaKeyPress
              FlatButtons = True
              DisabledColor = clWhite
              FrameSides = [sdBottom]
              FrameVisible = True
            end
          end
          object RzGroupBox2: TRzGroupBox
            Left = 40
            Top = 40
            Width = 169
            Height = 73
            Caption = ' Cuentas por '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RBtodos: TRzRadioButton
              Left = 32
              Top = 24
              Width = 73
              Height = 17
              Caption = 'Todos'
              HotTrack = True
              TabOrder = 0
              OnClick = RBtodosClick
              OnKeyPress = RBtodosKeyPress
            end
            object RBrango: TRzRadioButton
              Left = 32
              Top = 48
              Width = 115
              Height = 17
              Caption = 'Rango'
              Checked = True
              HotTrack = True
              TabOrder = 1
              TabStop = True
              OnClick = RBrangoClick
              OnKeyPress = RBrangoKeyPress
            end
          end
          object RzGroupBox8: TRzGroupBox
            Left = 240
            Top = 40
            Width = 201
            Height = 73
            Caption = ' Numero de Cuenta '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RzLabel35: TRzLabel
              Left = 16
              Top = 24
              Width = 38
              Height = 14
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel44: TRzLabel
              Left = 16
              Top = 48
              Width = 33
              Height = 14
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object edbdesde: TRzEdit
              Left = 80
              Top = 16
              Width = 89
              Height = 22
              DisabledColor = clWhite
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 0
              OnChange = EDdesdeChange
              OnClick = edbdesdeClick
              OnKeyPress = edbdesdeKeyPress
            end
            object edbhasta: TRzEdit
              Left = 80
              Top = 45
              Width = 89
              Height = 22
              DisabledColor = clWhite
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 1
              OnChange = EDhastaChange
              OnKeyPress = EDhastaKeyPress
            end
          end
        end
        object TabClientes2RelCliCta: TRzTabSheet
          Color = 16119543
          Caption = 'Cliente Cuenta'
          object gbRelCtaCte: TRzGroupBox
            Left = 24
            Top = 32
            Width = 473
            Height = 73
            Caption = ' Relacion Cuenta-Cliente '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLNombre: TRzLabel
              Left = 8
              Top = 35
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
            object EDnombre: TRzEdit
              Left = 64
              Top = 32
              Width = 393
              Height = 22
              CharCase = ecUpperCase
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 0
              OnKeyPress = EDnombreKeyPress
            end
          end
        end
        object TabClientes2Resumen: TRzTabSheet
          Color = 16119543
          Caption = 'Resumen'
          object RzGroupBox4: TRzGroupBox
            Left = 15
            Top = 8
            Width = 962
            Height = 73
            Caption = ' Opciones '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel36: TRzLabel
              Left = 8
              Top = 14
              Width = 93
              Height = 14
              Caption = 'Tipos de Cuenta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel37: TRzLabel
              Left = 160
              Top = 14
              Width = 39
              Height = 14
              Caption = 'Sector:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel38: TRzLabel
              Left = 280
              Top = 14
              Width = 26
              Height = 14
              Caption = 'Giro:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel39: TRzLabel
              Left = 554
              Top = 14
              Width = 103
              Height = 14
              Caption = 'Modelo de Alarma:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel40: TRzLabel
              Left = 712
              Top = 14
              Width = 44
              Height = 14
              Caption = 'Colonia:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel42: TRzLabel
              Left = 8
              Top = 56
              Width = 49
              Height = 14
              Caption = 'Clientes:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object LClientes: TRzLabel
              Left = 99
              Top = 56
              Width = 6
              Height = 14
              Alignment = taRightJustify
              Caption = '0'
              Color = 16776176
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel34: TRzLabel
              Left = 406
              Top = 15
              Width = 56
              Height = 14
              Caption = 'Categoria:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object CBColonia: TRzComboBox
              Left = 712
              Top = 32
              Width = 217
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotColor = clMedGray
              FrameHotTrack = True
              FrameHotStyle = fsButtonUp
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 4
              OnKeyPress = CBColoniaKeyPress
              OnNotInList = CBColoniaNotInList
            end
            object CBAlarma: TRzComboBox
              Left = 552
              Top = 32
              Width = 145
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotColor = clMedGray
              FrameHotTrack = True
              FrameHotStyle = fsButtonUp
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 3
              OnKeyPress = CBAlarmaKeyPress
              OnNotInList = CBAlarmaNotInList
            end
            object CBgiro: TRzComboBox
              Left = 275
              Top = 32
              Width = 121
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotColor = clMedGray
              FrameHotTrack = True
              FrameHotStyle = fsButtonUp
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 2
              OnKeyPress = CBgiroKeyPress
              OnNotInList = CBgiroNotInList
            end
            object CBSector: TRzComboBox
              Left = 157
              Top = 32
              Width = 113
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotColor = clMedGray
              FrameHotTrack = True
              FrameHotStyle = fsButtonUp
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 1
              OnKeyPress = CBSectorKeyPress
              OnNotInList = CBSectorNotInList
            end
            object CBTcuenta: TRzComboBox
              Left = 8
              Top = 32
              Width = 145
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotColor = clMedGray
              FrameHotTrack = True
              FrameHotStyle = fsButtonUp
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
              OnKeyPress = CBTcuentaKeyPress
              OnNotInList = CBTcuentaNotInList
            end
            object CboCategorias: TRzComboBox
              Left = 401
              Top = 33
              Width = 145
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotColor = clMedGray
              FrameHotTrack = True
              FrameHotStyle = fsButtonUp
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 5
              OnKeyPress = CBAlarmaKeyPress
              OnNotInList = CBAlarmaNotInList
            end
          end
          object GRsector: TcxGrid
            Left = 24
            Top = 120
            Width = 257
            Height = 185
            TabOrder = 1
            object GRsectorDBTableView1: TcxGridDBTableView
              DataController.DataSource = DMREPORTES.DSsqlgeneral6
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0000'
                  Kind = skSum
                  FieldName = 'total'
                  Column = GRsectorDBTableView1DBColumn2
                end>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              object GRsectorDBTableView1DBColumn1: TcxGridDBColumn
                SortOrder = soAscending
                Width = 150
                DataBinding.FieldName = 'sector'
              end
              object GRsectorDBTableView1DBColumn2: TcxGridDBColumn
                MinWidth = 64
                Options.Editing = False
                Options.Focusing = False
                Options.IncSearch = False
                Options.Grouping = False
                Options.HorzSizing = False
                Options.Moving = False
                DataBinding.FieldName = 'total'
              end
            end
            object GRsectorLevel1: TcxGridLevel
              Caption = 'Sector'
              GridView = GRsectorDBTableView1
            end
          end
          object GRTAlarma: TcxGrid
            Left = 288
            Top = 120
            Width = 337
            Height = 185
            TabOrder = 2
            object GRTAlarmaDBTableView1: TcxGridDBTableView
              DataController.DataSource = DMREPORTES.DSsqlgeneral2
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0000'
                  Kind = skSum
                  FieldName = 'total'
                  Column = GRTAlarmaDBTableView1DBColumn2
                end>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              object GRTAlarmaDBTableView1DBColumn1: TcxGridDBColumn
                SortOrder = soAscending
                Width = 174
                DataBinding.FieldName = 'alarmas'
              end
              object GRTAlarmaDBTableView1DBColumn2: TcxGridDBColumn
                DataBinding.FieldName = 'total'
              end
            end
            object GRTAlarmaLevel1: TcxGridLevel
              GridView = GRTAlarmaDBTableView1
            end
          end
          object GRgiro: TcxGrid
            Left = 288
            Top = 316
            Width = 337
            Height = 185
            TabOrder = 4
            object GRgiroDBTableView1: TcxGridDBTableView
              DataController.DataSource = DMREPORTES.DSsqlgeneral4
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0000'
                  Kind = skSum
                  FieldName = 'total'
                  Column = GRgiroDBTableView1DBColumn2
                end>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              object GRgiroDBTableView1DBColumn1: TcxGridDBColumn
                Width = 200
                DataBinding.FieldName = 'giro'
              end
              object GRgiroDBTableView1DBColumn2: TcxGridDBColumn
                DataBinding.FieldName = 'total'
              end
            end
            object GRgiroLevel1: TcxGridLevel
              GridView = GRgiroDBTableView1
            end
          end
          object GRColonia: TcxGrid
            Left = 24
            Top = 316
            Width = 257
            Height = 185
            TabOrder = 3
            object GRColoniaDBTableView1: TcxGridDBTableView
              DataController.DataSource = DMREPORTES.DSsqlgeneral3
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0000'
                  Kind = skSum
                  FieldName = 'total'
                  Column = GRColoniaDBTableView1DBColumn2
                end>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              object GRColoniaDBTableView1DBColumn1: TcxGridDBColumn
                Width = 141
                DataBinding.FieldName = 'colonias'
              end
              object GRColoniaDBTableView1DBColumn2: TcxGridDBColumn
                Width = 88
                DataBinding.FieldName = 'total'
              end
            end
            object GRColoniaLevel1: TcxGridLevel
              GridView = GRColoniaDBTableView1
            end
          end
          object RzGroupBox5: TRzGroupBox
            Left = 632
            Top = 315
            Width = 185
            Caption = 'Impresion Reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object RBresumen: TRzRadioButton
              Left = 24
              Top = 32
              Width = 115
              Height = 17
              Caption = 'Resumen'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnKeyPress = RBresumenKeyPress
            end
            object RBresumendet: TRzRadioButton
              Left = 24
              Top = 72
              Width = 137
              Height = 17
              Caption = 'Resumen Detallado'
              TabOrder = 1
              OnKeyPress = RBresumendetKeyPress
            end
          end
          object cxGrid1: TcxGrid
            Left = 632
            Top = 120
            Width = 321
            Height = 185
            TabOrder = 6
            object cxGridDBTableView1: TcxGridDBTableView
              DataController.DataSource = DMREPORTES.DSsqlgeneral5
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0000'
                  Kind = skSum
                  FieldName = 'total'
                  Column = cxTotCat
                end>
              DataController.Summary.SummaryGroups = <>
              NavigatorButtons.ConfirmDelete = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              object cxCategoria: TcxGridDBColumn
                Width = 188
                DataBinding.FieldName = 'Categoria'
              end
              object cxTotCat: TcxGridDBColumn
                Caption = 'Total'
                DataBinding.FieldName = 'total'
              end
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
        object TabClientes2Polizas: TRzTabSheet
          Color = 16119543
          Caption = 'Polizas'
          object RzGroupBox6: TRzGroupBox
            Left = 40
            Top = 24
            Width = 713
            Height = 81
            Caption = ' Buscar: '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RBPolxCta: TRzRadioButton
              Left = 80
              Top = 24
              Width = 129
              Height = 17
              Caption = 'Polizas por cuenta'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = RBPolxCtaClick
              OnKeyPress = RBPolxCtaKeyPress
            end
            object RBpolTodos: TRzRadioButton
              Left = 80
              Top = 48
              Width = 161
              Height = 17
              Caption = 'Todos los que tienen poliza'
              TabOrder = 1
              OnClick = RBpolTodosClick
              OnKeyPress = RBpolTodosKeyPress
            end
            object rgcuenta: TRzGroupBox
              Left = 416
              Top = 16
              Width = 137
              Height = 49
              Caption = ' Cuenta : '
              Color = 16119543
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              object edcuentap: TRzButtonEdit
                Left = 8
                Top = 16
                Width = 121
                Height = 22
                Alignment = taRightJustify
                DisabledColor = clWhite
                FrameHotTrack = True
                FrameSides = [sdBottom]
                FrameVisible = True
                TabOrder = 0
                OnKeyPress = EdcuentapKeyPress
                ButtonKind = bkFind
                ButtonShortCut = 119
                FlatButtons = True
                FlatButtonColor = clWhite
                OnButtonClick = edcuentapButtonClick
              end
            end
          end
        end
        object TSocoxxos: TRzTabSheet
          Color = 16119543
          Caption = 'Open/Close Cliente'
        end
        object TabClientes2SinAsignacion: TRzTabSheet
          Color = 16119543
          Caption = 'Sin Asignacion'
          object RzGroupBox13: TRzGroupBox
            Left = 40
            Top = 24
            Width = 185
            Caption = ' Tipo Asignacion '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object CBtipoAsig: TRzComboBox
              Left = 8
              Top = 43
              Width = 169
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
              OnKeyPress = CBtipoAsigKeyPress
              OnNotInList = CBtipoAsigNotInList
            end
          end
        end
        object Tabclientes2Protocolos: TRzTabSheet
          Color = 16119543
          Caption = 'Protocolos'
          object RGProtocolos: TRzRadioGroup
            Left = 24
            Top = 32
            Width = 185
            Height = 97
            Caption = ' Protocolos '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ParentFont = False
            TabOrder = 0
          end
          object RGOrdenarpor: TRzGroupBox
            Left = 504
            Top = 32
            Width = 185
            Caption = ' Ordenar Por '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object cbOrdCli: TRzComboBox
              Left = 24
              Top = 51
              Width = 145
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotTrack = True
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
              OnKeyPress = cbOrdCliKeyPress
              OnNotInList = cbOrdCliNotInList
            end
          end
        end
        object Tabclientes2Libres: TRzTabSheet
          Color = 16119543
          Caption = 'Cuentas Libres'
        end
        object tabclientes2Travels: TRzTabSheet
          Color = 16119543
          Caption = 'Travelers'
        end
        object tabclientes2Modificaciones: TRzTabSheet
          Color = 16119543
          Caption = 'Modificaciones'
          object RGCliCamb: TRzRadioGroup
            Left = 8
            Top = 8
            Width = 361
            Height = 89
            Caption = ' Buscar Cambios en '
            Color = 16119543
            Columns = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Datos Instalacion'
              'Datos Facturacion'
              'Telefonos'
              'Responsables, Usuarios y Contactos'
              'Zonas'
              'Por Usuario del sistema')
            ParentFont = False
            TabOrder = 0
          end
        end
        object tsNoUbicados: TRzTabSheet
          Color = 16119543
          Caption = 'No Ubicados'
        end
        object Tabclientes2TipoEnvio: TRzTabSheet
          Color = 16119543
          Caption = 'Tipo de Envio de Trafico'
          object RGTipoEnvio: TRzRadioGroup
            Left = 24
            Top = 16
            Width = 185
            Height = 81
            Caption = ' Tipo de Envio de Trafico '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Via E-mail'
              'Personzalizada'
              'No desea Informacion')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabProtDif: TRzTabSheet
          Color = 16119543
          Caption = 'Protocolos Diferentes'
        end
        object tabclientes2Anualidades: TRzTabSheet
          Color = 16119543
          Caption = 'Anualidades'
          object RzLabel41: TRzLabel
            Left = 8
            Top = 8
            Width = 475
            Height = 14
            Caption = 
              'Este reporte muestra los clientes que pagaron Anualidad el a'#241'o a' +
              'nterior y el actual no.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object gbanos: TRzGroupBox
            Left = 8
            Top = 32
            Width = 145
            Height = 81
            Caption = 'Periodo de A'#241'os'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel43: TRzLabel
              Left = 8
              Top = 32
              Width = 38
              Height = 14
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel68: TRzLabel
              Left = 8
              Top = 56
              Width = 33
              Height = 14
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object edanodesde: TRzEdit
              Left = 56
              Top = 24
              Width = 81
              Height = 22
              Alignment = taRightJustify
              DisabledColor = clWhite
              FrameHotTrack = True
              FrameVisible = True
              TabOrder = 0
              OnKeyPress = edanodesdeKeyPress
            end
            object edanohasta: TRzEdit
              Left = 56
              Top = 48
              Width = 81
              Height = 22
              Alignment = taRightJustify
              DisabledColor = clWhite
              FrameHotTrack = True
              FrameVisible = True
              TabOrder = 1
              OnKeyPress = edanohastaKeyPress
            end
          end
        end
        object tabclientes2GastosMayores: TRzTabSheet
          Color = 16119543
          Caption = 'Gastos Mayores'
          object RzGroupBox12: TRzGroupBox
            Left = 48
            Top = 40
            Width = 177
            Height = 65
            Caption = 'Cantidad Mayor a :'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object edcantidad: TRzEdit
              Left = 8
              Top = 24
              Width = 161
              Height = 22
              Alignment = taRightJustify
              FrameVisible = True
              TabOrder = 0
              OnKeyPress = edcantidadKeyPress
            end
          end
        end
      end
    end
    object TabVent: TRzTabSheet
      Color = 16119543
      Caption = 'VENTAS'
      object TabVent2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabVent2Tend2
        Align = alClient
        TabIndex = 9
        TabOrder = 0
        OnTabClick = TabVent2TabClick
        FixedDimension = 20
        object TabVent2Catalogos: TRzTabSheet
          Color = 16119543
          Caption = 'Catalogos'
          object lbcategorias: TRzURLLabel
            Left = 32
            Top = 32
            Width = 50
            Height = 13
            Caption = 'Categorias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbcategoriasClick
            OnMouseMove = lbcategoriasMouseMove
            OnMouseLeave = lbcategoriasMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbestatus: TRzURLLabel
            Left = 32
            Top = 56
            Width = 77
            Height = 13
            Caption = 'Estatus Eventos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbestatusClick
            OnMouseMove = lbestatusMouseMove
            OnMouseLeave = lbestatusMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbfuentes: TRzURLLabel
            Left = 32
            Top = 80
            Width = 38
            Height = 13
            Caption = 'Fuentes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbfuentesClick
            OnMouseMove = lbfuentesMouseMove
            OnMouseLeave = lbfuentesMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbgiros: TRzURLLabel
            Left = 32
            Top = 104
            Width = 24
            Height = 13
            Caption = 'Giros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbgirosClick
            OnMouseMove = lbgirosMouseMove
            OnMouseLeave = lbgirosMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lborigenes: TRzURLLabel
            Left = 32
            Top = 128
            Width = 42
            Height = 13
            Caption = 'Origenes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lborigenesClick
            OnMouseMove = lborigenesMouseMove
            OnMouseLeave = lborigenesMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbtipos: TRzURLLabel
            Left = 32
            Top = 152
            Width = 26
            Height = 13
            Caption = 'Tipos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbtiposClick
            OnMouseMove = lbtiposMouseMove
            OnMouseLeave = lbtiposMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbtiposact: TRzURLLabel
            Left = 32
            Top = 176
            Width = 98
            Height = 13
            Caption = 'Tipos de actividades'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbtiposactClick
            OnMouseMove = lbtiposactMouseMove
            OnMouseLeave = lbtiposactMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbtiposoportu: TRzURLLabel
            Left = 32
            Top = 200
            Width = 111
            Height = 13
            Caption = 'Tipos de oportunidades'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbtiposoportuClick
            OnMouseMove = lbtiposoportuMouseMove
            OnMouseLeave = lbtiposoportuMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
        end
        object TabVent2TendVend: TRzTabSheet
          Color = 16119543
          TabVisible = False
          Caption = 'Comisiones Vendedores'
          object gbPeriodoMesA: TRzGroupBox
            Left = 16
            Top = 32
            Width = 233
            Height = 97
            Caption = 'Periodo'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel6: TRzLabel
              Left = 12
              Top = 33
              Width = 25
              Height = 16
              Caption = 'Mes'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel11: TRzLabel
              Left = 12
              Top = 65
              Width = 25
              Height = 16
              Caption = 'A'#241'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object cbomeses: TRzComboBox
              Left = 48
              Top = 24
              Width = 153
              Height = 24
              Hint = 'El mes a mostrar'
              CharCase = ecUpperCase
              Ctl3D = False
              DropDownCount = 12
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
              Items.Strings = (
                'ENERO'
                'FEBRERO'
                'MARZO'
                'ABRIL'
                'MAYO'
                'JUNIO'
                'JULIO'
                'AGOSTO'
                'SEPTIEMBRE'
                'OCTUBRE'
                'NOVIEMBRE'
                'DICIEMBRE')
            end
            object cboano: TRzComboBox
              Left = 48
              Top = 56
              Width = 153
              Height = 24
              Hint = 'El a'#241'o a mostrar'
              CharCase = ecUpperCase
              Ctl3D = False
              DropDownCount = 12
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyPress = cboanoKeyPress
              Items.Strings = (
                '2000'
                '2001'
                '2002'
                '2003'
                '2005'
                '2006'
                '2007'
                '2008'
                '2009'
                '2010'
                '2011'
                '2012'
                '2013'
                '2014'
                '2015'
                '2016'
                '2017'
                '2018'
                '2019'
                '2020'
                '2021'
                '2022'
                '2023'
                '2024'
                '2025')
            end
          end
        end
        object TabVent2DV: TRzTabSheet
          Color = 16119543
          Caption = 'Diario de Ventas'
          object TabVent2DVentas: TRzTabSheet
            Color = 16119543
            Caption = 'Diario de Ventas'
            object gbTipoReporte: TRzGroupBox
              Left = 16
              Top = 32
              Width = 185
              Height = 81
              Caption = 'Tipo'
              Color = 16119543
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object ckbsimple: TRzCheckBox
                Left = 40
                Top = 24
                Width = 115
                Height = 17
                Hint = 'Contrato Normal'
                Alignment = taLeftJustify
                AlignmentVertical = avCenter
                Caption = 'Simple'
                Checked = True
                HotTrack = True
                State = cbChecked
                TabOrder = 0
                OnKeyPress = eddias1KeyPress
              end
              object ckbdetallado: TRzCheckBox
                Left = 40
                Top = 48
                Width = 115
                Height = 17
                Hint = 'Contrato Forzoso'
                Alignment = taLeftJustify
                AlignmentVertical = avCenter
                Caption = 'Detallado'
                Color = 16119543
                HotTrack = True
                ParentColor = False
                State = cbUnchecked
                TabOrder = 1
                OnKeyPress = eddias1KeyPress
              end
            end
          end
          object gbRTipoReporte: TRzGroupBox
            Left = 16
            Top = 32
            Width = 161
            Height = 89
            Caption = 'Tipo Reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object ckbRsimple: TRzCheckBox
              Left = 32
              Top = 32
              Width = 97
              Height = 17
              Hint = 'Solo totales de las venta '
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Simple'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = ckbRsimpleClick
              OnKeyPress = eddias1KeyPress
            end
            object ckbRdetallado: TRzCheckBox
              Left = 32
              Top = 56
              Width = 97
              Height = 17
              Hint = 'Reporte con sus los articulos de la ventas'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Detallado'
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnClick = ckbRdetalladoClick
              OnKeyPress = ckbRdetalladoKeyPress
            end
          end
          object chkgfolios: TRzCheckGroup
            Left = 8
            Top = 368
            Width = 161
            Caption = 'Tipo de Folio'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clWindowText
            ItemFont.Height = -13
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            Items.Strings = (
              'Caja'
              'Cobranza a Domicilio'
              'Mx'
              'Todos')
            ParentFont = False
            TabOrder = 2
            Visible = False
            OnChange = chkgfoliosChange
            CheckStates = (
              0
              0
              0
              1)
          end
        end
        object TabVent2Cobros: TRzTabSheet
          Color = 16119543
          Caption = 'Cobros en Caja'
          object gbUnaFecha: TRzGroupBox
            Left = 24
            Top = 160
            Width = 153
            Height = 65
            Caption = 'Periodo'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object dUnafecha: TRzDateTimeEdit
              Left = 32
              Top = 24
              Width = 97
              Height = 24
              Hint = 'Fecha de inicio'
              Date = 32874.000000000000000000
              EditType = etDate
              Alignment = taRightJustify
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = dUnafechaKeyPress
            end
          end
        end
        object TabVent2VM: TRzTabSheet
          Color = 16119543
          Caption = 'Ventas Mensuales'
          object gbventa: TRzGroupBox
            Left = 344
            Top = 24
            Width = 193
            Height = 89
            Caption = 'Pedido'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
            object RzLabel14: TRzLabel
              Left = 28
              Top = 25
              Width = 39
              Height = 16
              Caption = 'Desde'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel24: TRzLabel
              Left = 28
              Top = 57
              Width = 35
              Height = 16
              Caption = 'Hasta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object edpedido1: TRzButtonEdit
              Left = 76
              Top = 24
              Width = 89
              Height = 22
              Hint = 'Buscar la cuenta del cliente'
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
              OnKeyPress = edpedido1KeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edpedido1ButtonClick
            end
            object edpedido2: TRzButtonEdit
              Left = 76
              Top = 51
              Width = 89
              Height = 22
              Hint = 'Buscar la cuenta del cliente'
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
              TabOrder = 1
              OnExit = edpedido2Exit
              OnKeyPress = edpedido2KeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edpedido2ButtonClick
            end
          end
        end
        object TabVent2FC: TRzTabSheet
          Color = 16119543
          Caption = 'Facturas Canceladas'
          object rgmotcancel: TRzRadioGroup
            Left = 416
            Top = 64
            Width = 145
            Height = 65
            Caption = 'Tipo Reporte'
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Resumen'
              'Motivos de Cancelacion')
            TabOrder = 0
          end
        end
        object TabVent2Comisiones: TRzTabSheet
          Color = 16119543
          Caption = 'Comisiones vendedores'
          object gbusuario1: TRzGroupBox
            Left = 24
            Top = 48
            Width = 169
            Height = 57
            Caption = 'Vendedor'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object edbuscarU: TRzButtonEdit
              Left = 32
              Top = 24
              Width = 109
              Height = 22
              Hint = 'Buscar el usuario'
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
              OnKeyPress = edbuscarUKeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edbuscarUButtonClick
            end
          end
          object rgcomisionv: TRzRadioGroup
            Left = 216
            Top = 48
            Width = 145
            Height = 57
            Caption = 'Comisiones'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Por Vendedor'
              'Todos')
            ParentFont = False
            TabOrder = 1
          end
          object ckCierreComisiones: TRzCheckBox
            Left = 24
            Top = 120
            Width = 169
            Height = 17
            Caption = 'Cierre de Comisiones'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            State = cbUnchecked
            TabOrder = 2
            OnClick = ckCierreComisionesClick
          end
        end
        object TabVent2AV: TRzTabSheet
          Color = 16119543
          Caption = 'Analisis/Ventas'
          object gbanalisisvta: TRzRadioGroup
            Left = 24
            Top = 40
            Width = 193
            Height = 89
            Alignment = taRightJustify
            Caption = 'TIPO'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Ventas Totales'
              'Nota de credito'
              'Totales - NC')
            ParentFont = False
            TabOrder = 0
            TextStyle = tsRaised
            VerticalSpacing = 4
          end
        end
        object tsVVV: TRzTabSheet
          Color = 16119543
          Caption = 'Verificacion de Vendedores/Ventas'
        end
        object tsnc: TRzTabSheet
          Color = 16119543
          Caption = 'Notas de Credito'
        end
        object TabVent2Tend2: TRzTabSheet
          Color = 16119543
          Caption = 'Tendencia vendedores'
          object RzGroupBox3: TRzGroupBox
            Left = 75
            Top = 170
            Width = 185
            Height = 113
            Caption = 'Tipo de reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object chkmes: TRzCheckBox
              Left = 10
              Top = 34
              Width = 161
              Height = 17
              Hint = 'Periodo del primero al dia que se esta generando'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Mes'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = chkmesClick
              OnKeyPress = eddias1KeyPress
            end
            object chktotalesventas: TRzCheckBox
              Left = 10
              Top = 58
              Width = 161
              Height = 17
              Hint = 'Ventas realizadas en lo que va del a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Totales a'#241'o ventas'
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnClick = chktotalesventasClick
              OnKeyPress = eddias1KeyPress
            end
            object chktotalescuentas: TRzCheckBox
              Left = 10
              Top = 82
              Width = 161
              Height = 17
              Hint = 'Cuentas nuevas en el a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Totales a'#241'o cuentas'
              HotTrack = True
              State = cbUnchecked
              TabOrder = 2
              OnClick = chktotalescuentasClick
              OnKeyPress = eddias1KeyPress
            end
          end
          object gbanualesvtastend: TRzGroupBox
            Left = 267
            Top = 216
            Width = 150
            Height = 65
            Caption = 'Con datos de ?'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object chvendedores: TRzCheckBox
              Left = 10
              Top = 18
              Width = 127
              Height = 17
              Hint = 'Con ventas o cuentas realizadas por vendedores'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Vendedores'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = chktotalescuentasClick
              OnKeyPress = eddias1KeyPress
            end
            object chnovendedores: TRzCheckBox
              Left = 10
              Top = 42
              Width = 127
              Height = 17
              Hint = 'Con ventas o cuentas realizadas por no vendedores'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'No vendedores'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 1
              OnClick = chktotalescuentasClick
              OnKeyPress = eddias1KeyPress
            end
          end
        end
        object TabVent2CA: TRzTabSheet
          Color = 16119543
          Caption = 'Citas Asignadas'
          object gbMesAno: TRzGroupBox
            Left = 75
            Top = 194
            Width = 185
            Height = 111
            Caption = 'Tipo de reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clNone
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object chmesca: TRzCheckBox
              Left = 10
              Top = 34
              Width = 161
              Height = 17
              Hint = 'Periodo del primero al dia que se esta generando'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Mes'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = chmescaClick
              OnKeyPress = eddias1KeyPress
            end
            object chanoca: TRzCheckBox
              Left = 10
              Top = 58
              Width = 161
              Height = 17
              Hint = 'Citas asignadas en el a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Totales a'#241'o '
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnClick = chanocaClick
              OnKeyPress = eddias1KeyPress
            end
            object chbdesglosado: TRzCheckBox
              Left = 10
              Top = 82
              Width = 161
              Height = 17
              Hint = 'Las citas y llamadas desglosados cada por oportunidad'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Desglosado'
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 2
              OnClick = chbdesglosadoClick
              OnKeyPress = eddias1KeyPress
            end
          end
          object gbcitasAno: TRzGroupBox
            Left = 447
            Top = 240
            Width = 182
            Height = 113
            Caption = 'A'#241'o?'
            Color = 16119543
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object chcitasequipo: TRzCheckBox
              Left = 10
              Top = 20
              Width = 161
              Height = 17
              Hint = 'Periodo del primero al dia que se esta generando'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Citas Equipo'
              Checked = True
              Enabled = False
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = chcitasequipoClick
              OnKeyPress = eddias1KeyPress
            end
            object chcitasampliacionano: TRzCheckBox
              Left = 10
              Top = 44
              Width = 161
              Height = 17
              Hint = 'Citas asignadas en el a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Citas ampliacion'
              Color = 16119543
              Enabled = False
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnClick = chcitasampliacionanoClick
              OnKeyPress = eddias1KeyPress
            end
            object chprospectosano: TRzCheckBox
              Left = 11
              Top = 68
              Width = 161
              Height = 17
              Hint = 'Citas asignadas en el a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Prospectos'
              Color = 16119543
              Enabled = False
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 2
              OnClick = chprospectosanoClick
              OnKeyPress = eddias1KeyPress
            end
            object chaceptadasano: TRzCheckBox
              Left = 11
              Top = 92
              Width = 161
              Height = 17
              Hint = 'Citas asignadas en el a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Aceptadas'
              Color = 16119543
              Enabled = False
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 3
              OnClick = chaceptadasanoClick
              OnKeyPress = eddias1KeyPress
            end
          end
        end
        object TabVent2ErrorVta: TRzTabSheet
          Color = 16119543
          Caption = 'Error en Vtas'
        end
        object TabVent2TotMn: TRzTabSheet
          Color = 16119543
          Caption = 'Total Dlls  X origen'
        end
        object TabVent2Monitoreo: TRzTabSheet
          Color = 16119543
          Caption = 'Ventas Monitoreo'
        end
        object TabVent2FactSPago: TRzTabSheet
          Color = 16119543
          Caption = 'Facturas Sin Pago'
        end
        object TabVent2ArtXper: TRzTabSheet
          Color = 16119543
          Caption = 'Articulos X Periodo'
        end
      end
    end
    object TabCob: TRzTabSheet
      Color = 16119543
      Caption = 'COBRANZA'
      object TabCob2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabCob2SecVen
        Align = alClient
        TabIndex = 2
        TabOrder = 0
        OnTabClick = TabCob2TabClick
        FixedDimension = 20
        object TabCob2Gen: TRzTabSheet
          Color = 16119543
          Caption = 'Generales'
        end
        object TabCob2Can: TRzTabSheet
          Color = 16119543
          Caption = 'Cancelados o Morosos'
          object gbperiodo: TRzGroupBox
            Left = 24
            Top = 128
            Width = 185
            Height = 97
            Caption = 'Periodo'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RzLabel2: TRzLabel
              Left = 12
              Top = 41
              Width = 39
              Height = 16
              Caption = 'Desde'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel3: TRzLabel
              Left = 12
              Top = 73
              Width = 35
              Height = 16
              Caption = 'Hasta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object dfecha1: TRzDateTimeEdit
              Left = 64
              Top = 32
              Width = 97
              Height = 24
              Hint = 'Fecha de inicio'
              Date = 32874.000000000000000000
              EditType = etDate
              Alignment = taRightJustify
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
            end
            object dfecha2: TRzDateTimeEdit
              Left = 64
              Top = 64
              Width = 97
              Height = 24
              Hint = 'Fecha final'
              Date = 32874.000000000000000000
              EditType = etDate
              Alignment = taRightJustify
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyPress = dfecha2KeyPress
            end
          end
          object gbsectores: TRzGroupBox
            Left = 24
            Top = 24
            Width = 209
            Height = 97
            Caption = 'Sectores'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel1: TRzLabel
              Left = 16
              Top = 64
              Width = 39
              Height = 16
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel5: TRzLabel
              Left = 16
              Top = 32
              Width = 43
              Height = 16
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object cbosector1: TRzComboBox
              Left = 64
              Top = 24
              Width = 129
              Height = 24
              Hint = 'Desde el sector'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
              OnNotInList = cbosector1NotInList
            end
            object cbosector2: TRzComboBox
              Left = 64
              Top = 56
              Width = 129
              Height = 24
              Hint = 'Hasta el  sector'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyPress = cbosector2KeyPress
              OnNotInList = cbosector2NotInList
            end
          end
        end
        object TabCob2SecVen: TRzTabSheet
          Color = 16119543
          Caption = 'Sectores vencidos'
          object gblineas: TRzGroupBox
            Left = 248
            Top = 325
            Width = 217
            Height = 97
            Caption = 'Lineas'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
            object RzLabel7: TRzLabel
              Left = 16
              Top = 64
              Width = 39
              Height = 16
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel8: TRzLabel
              Left = 16
              Top = 32
              Width = 43
              Height = 16
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object cbolineas1: TRzComboBox
              Left = 64
              Top = 24
              Width = 145
              Height = 24
              Hint = 'Desde el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
              OnNotInList = cbolineas1NotInList
            end
            object cbolineas2: TRzComboBox
              Left = 64
              Top = 56
              Width = 145
              Height = 24
              Hint = 'Hasta el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyPress = cbolineas2KePress
              OnNotInList = cbolineas2NotInList
              Items.Strings = (
                'EQUIPO'
                'SERVICIO'
                'MONITOREO'
                'INTERESES')
            end
          end
          object gbdias: TRzGroupBox
            Left = 24
            Top = 136
            Width = 153
            Height = 97
            Caption = 'Cant. D'#237'as'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RzLabel9: TRzLabel
              Left = 16
              Top = 72
              Width = 39
              Height = 16
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel10: TRzLabel
              Left = 16
              Top = 32
              Width = 43
              Height = 16
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object eddias1: TRzNumericEdit
              Left = 64
              Top = 24
              Width = 73
              Height = 24
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
              DisplayFormat = '0'
            end
            object eddias2: TRzNumericEdit
              Left = 64
              Top = 64
              Width = 73
              Height = 24
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 1
              OnKeyPress = eddias1KeyPress
              Value = 60.000000000000000000
              DisplayFormat = '0'
            end
          end
          object gbincluir: TRzGroupBox
            Left = 272
            Top = 136
            Width = 161
            Height = 137
            Caption = 'Incluir'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object ckbnormales: TRzCheckBox
              Left = 16
              Top = 16
              Width = 131
              Height = 17
              Hint = 'Contrato Normal'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Activos'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
            end
            object ckbforzosos: TRzCheckBox
              Left = 16
              Top = 40
              Width = 131
              Height = 17
              Hint = 'Cuentas canceladas '
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Cancelados'
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnKeyPress = eddias1KeyPress
            end
            object ckbabogado: TRzCheckBox
              Left = 16
              Top = 64
              Width = 131
              Height = 17
              Hint = 'Cuentas con Abogado'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Solo Abogado'
              HotTrack = True
              State = cbUnchecked
              TabOrder = 2
              OnClick = ckbabogadoClick
              OnKeyPress = ckbabogadoKeyPress
            end
            object ckbbloqueados: TRzCheckBox
              Left = 16
              Top = 88
              Width = 131
              Height = 17
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Con Bloqueados'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 3
              OnKeyPress = ckbbloqueadosKeyPress
            end
            object chkSinEnlace: TRzCheckBox
              Left = 16
              Top = 112
              Width = 131
              Height = 17
              Hint = 'Cuentas que no cuentan con enlace a monitoreo'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Sin Enlace'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 4
              OnKeyPress = ckbbloqueadosKeyPress
            end
          end
          object gbUnidadNegocio: TRzGroupBox
            Left = 256
            Top = 32
            Width = 217
            Height = 97
            Caption = 'Unidad de  Negocio'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            object RzLabel25: TRzLabel
              Left = 16
              Top = 64
              Width = 39
              Height = 16
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel26: TRzLabel
              Left = 16
              Top = 32
              Width = 43
              Height = 16
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object cbounidad1: TRzComboBox
              Left = 64
              Top = 24
              Width = 145
              Height = 24
              Hint = 'Desde el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = eddias1KeyPress
              OnNotInList = cbolineas1NotInList
            end
            object cbounidad2: TRzComboBox
              Left = 64
              Top = 56
              Width = 145
              Height = 24
              Hint = 'Hasta el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnKeyPress = cbolineas2KePress
              OnNotInList = cbolineas2NotInList
              Items.Strings = (
                'EQUIPO'
                'SERVICIO'
                'MONITOREO'
                'INTERESES')
            end
          end
          object gbabogado: TRzGroupBox
            Left = 448
            Top = 192
            Width = 193
            Height = 49
            Caption = 'Abogado'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            Visible = False
            object RzLabel27: TRzLabel
              Left = 32
              Top = 24
              Width = 17
              Height = 16
              Caption = 'ID:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object edabogado: TRzButtonEdit
              Left = 60
              Top = 16
              Width = 117
              Height = 22
              Hint = 'Buscar el abogado'
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
              OnKeyPress = edabogadoKeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edabogadoButtonClick
            end
          end
          object chkSinCuentasReporte: TRzCheckBox
            Left = 288
            Top = 285
            Width = 131
            Height = 17
            Hint = 'Cuentas como oxxo no seran mostradas en el reporte'
            Alignment = taLeftJustify
            AlignmentVertical = avCenter
            Caption = 'Sin Cuentas NR'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            State = cbUnchecked
            TabOrder = 5
            OnKeyPress = eddias1KeyPress
          end
          object chkcelulares: TRzCheckBox
            Left = 288
            Top = 304
            Width = 131
            Height = 17
            Hint = 'Cuentas como oxxo no seran mostradas en el reporte'
            Alignment = taLeftJustify
            AlignmentVertical = avCenter
            Caption = 'Imprimir Celulares'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            State = cbUnchecked
            TabOrder = 6
            OnKeyPress = eddias1KeyPress
          end
          object rgpuesto: TRzRadioGroup
            Left = 24
            Top = 256
            Width = 185
            Caption = 'Puesto'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Encargada de Cobranza'
              'Extrajudicial'
              'Abogado')
            ParentFont = False
            TabOrder = 7
            OnClick = rgpuestoClick
          end
        end
        object TabCob2Antigxlinea: TRzTabSheet
          Color = 16119543
          Caption = 'Antiguedad x linea'
          object RzLabel72: TRzLabel
            Left = 16
            Top = 400
            Width = 90
            Height = 16
            Caption = 'Tipo Reporte :'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object gbmovimientos: TRzGroupBox
            Left = 16
            Top = 280
            Width = 217
            Height = 65
            Caption = 'Movimientos'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel4: TRzLabel
              Left = 16
              Top = 32
              Width = 32
              Height = 16
              Caption = 'Tipo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object cbomovimientos: TRzComboBox
              Left = 56
              Top = 24
              Width = 145
              Height = 24
              Hint = 'Escoge entre remisiones y facturaciones '#243' ambas'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'RF'
              OnKeyPress = cbomovimientosKeyPress
              OnNotInList = cbomovimientosNotInList
              OnSelect = cbomovimientosSelect
              Items.Strings = (
                'RF'
                'REMISION'
                'FACTURAS')
              ItemIndex = 0
            end
          end
          object chkDesAplicar: TRzCheckBox
            Left = 16
            Top = 360
            Width = 161
            Height = 17
            Hint = 
              'Desaplica cobranza desde la fecha Desde capturada Hasta Fecha Ac' +
              'tual.'
            Alignment = taLeftJustify
            AlignmentVertical = avCenter
            Caption = 'Desaplicar Cobranza'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            State = cbUnchecked
            TabOrder = 1
          end
          object cboAntXLineaTipo: TRzComboBox
            Left = 112
            Top = 392
            Width = 145
            Height = 24
            CharCase = ecUpperCase
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            FlatButtons = True
            FrameColor = clActiveCaption
            FrameSides = [sdBottom]
            FrameVisible = True
            ItemHeight = 16
            ParentCtl3D = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Text = 'DETALLADO'
            OnNotInList = cboAntXLineaTipoNotInList
            Items.Strings = (
              'DETALLADO'
              'CONCENTRADO')
            ItemIndex = 0
          end
        end
        object TabCob2Pagosxlinea: TRzTabSheet
          Color = 16119543
          Caption = 'Pagos x linea'
          object gbusuarios: TRzGroupBox
            Left = 24
            Top = 24
            Width = 169
            Caption = 'Usuarios'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel12: TRzLabel
              Left = 12
              Top = 49
              Width = 39
              Height = 16
              Caption = 'Desde'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel13: TRzLabel
              Left = 12
              Top = 81
              Width = 35
              Height = 16
              Caption = 'Hasta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object edusuario1: TRzButtonEdit
              Left = 60
              Top = 40
              Width = 89
              Height = 22
              Hint = 'Buscar el usuario'
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
              TabOrder = 1
              OnKeyPress = edusuario1KeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edusuario1ButtonClick
            end
            object ckbtodos: TRzCheckBox
              Left = 64
              Top = 16
              Width = 73
              Height = 17
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Todos'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              HotTrack = True
              ParentFont = False
              State = cbChecked
              TabOrder = 0
            end
            object edusuario2: TRzButtonEdit
              Left = 60
              Top = 72
              Width = 89
              Height = 22
              Hint = 'Buscar el usuario final'
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
              TabOrder = 2
              OnKeyPress = edusuario2KeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edusuario2ButtonClick
            end
          end
          object ckanualidad: TRzCheckBox
            Left = 216
            Top = 32
            Width = 115
            Height = 17
            Caption = 'Anualidad'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            HotTrack = True
            ParentFont = False
            State = cbUnchecked
            TabOrder = 1
          end
        end
        object TabCob2Cobranza: TRzTabSheet
          Color = 16119543
          Caption = 'Rep Cobranza'
          object rgcobranza: TRzRadioGroup
            Left = 24
            Top = 132
            Width = 193
            Height = 237
            Alignment = taRightJustify
            Caption = 'Reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 1
            Items.Strings = (
              '0-30'
              '0-59'
              '60-9999'
              'Abogados'
              '0-9999'
              'Contratos '
              'Tendencia Cobranza'
              'Llamadas'
              'Cuentas con Id Abogado'
              'Tendencia Concentrado')
            ParentFont = False
            TabOrder = 0
            TextStyle = tsRaised
            VerticalSpacing = 4
          end
          object gbcontrato: TRzGroupBox
            Left = 26
            Top = 386
            Width = 153
            Height = 97
            Caption = 'Cuentas con Contrato'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RzBitBtn1: TRzBitBtn
              Left = 32
              Top = 63
              Width = 97
              Hint = 'Generar reporte de cuentas con ese contrato'
              Caption = '&Reporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HotTrack = True
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = RzBitBtn1Click
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
              ImageIndex = 5
              Images = DMAccesos.ilopciones
              NumGlyphs = 2
              Spacing = 3
            end
            object edbuscarcontrato: TRzButtonEdit
              Left = 35
              Top = 28
              Width = 89
              Height = 22
              Hint = 'Buscar contrato '
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
              TabOrder = 1
              OnKeyPress = edbuscarcontratoKeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              OnButtonClick = edbuscarcontratoButtonClick
            end
          end
          object rgperiodo: TRzRadioGroup
            Left = 280
            Top = 32
            Width = 193
            Height = 81
            Caption = 'Periodo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Mensual'
              'Anual Saldos'
              'Anual General de Cobranza')
            ParentFont = False
            TabOrder = 2
            Transparent = True
          end
        end
        object TabCob2CargosA: TRzTabSheet
          Color = 16119543
          Caption = 'Rep Cargos Auto'
          object gbcargos: TRzGroupBox
            Left = 16
            Top = 280
            Width = 217
            Height = 65
            Caption = 'Tipo cargo'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel54: TRzLabel
              Left = 16
              Top = 32
              Width = 32
              Height = 16
              Caption = 'Tipo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object cbocargos: TRzComboBox
              Left = 56
              Top = 24
              Width = 145
              Height = 24
              Hint = 'Escoge entre remisiones y facturaciones '#243' ambas'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnKeyPress = cbomovimientosKeyPress
              OnNotInList = cbomovimientosNotInList
            end
          end
          object RzGroupBox14: TRzGroupBox
            Left = 16
            Top = 208
            Width = 217
            Height = 57
            Caption = 'Venc. (Fecha Actual + D'#237'as :)'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object edDiasVenceCargo: TRzNumericEdit
              Left = 128
              Top = 24
              Width = 73
              Height = 24
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 0
              Value = 15.000000000000000000
              DisplayFormat = '0'
            end
          end
        end
        object TabCob2PagosClientes: TRzTabSheet
          Color = 16119543
          Caption = 'Abonos x cuenta'
        end
        object TabCob2Morosos: TRzTabSheet
          Color = 16119543
          Caption = 'Morosos 1ra Vez'
        end
        object TabCobInsPend: TRzTabSheet
          Color = 16119543
          Caption = 'Instalaciones Pendientes por pago de Factura'
        end
        object TabCobSecXVencer: TRzTabSheet
          Color = 16119543
          Caption = 'Sectores X Vencer'
          object chksms: TRzCheckBox
            Left = 96
            Top = 384
            Width = 177
            Height = 17
            Caption = 'Enviar Mensaje SMS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            State = cbUnchecked
            TabOrder = 0
            OnClick = chksmsClick
          end
        end
        object TSCobCSI: TRzTabSheet
          Color = 16119543
          Caption = 'Movimientos CSI'
        end
        object TabCobMarcacion: TRzTabSheet
          Color = 16119543
          Caption = 'Marcaci'#243'n Cobranza'
        end
        object TabCob2PagosMoni: TRzTabSheet
          Color = 16119543
          Caption = 'Pagos Monitoreo'
        end
      end
    end
    object TabInv: TRzTabSheet
      Color = 16119543
      Caption = 'INVENTARIOS'
      object TabInv2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabInv2Inv
        Align = alClient
        TabIndex = 1
        TabOrder = 0
        OnTabClick = TabInv2TabClick
        FixedDimension = 20
        object TabInv2Gen: TRzTabSheet
          Color = 16119543
          Caption = 'Generales'
          object lbinvetarios: TRzURLLabel
            Left = 32
            Top = 32
            Width = 118
            Height = 16
            Caption = 'Precios de articulos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbinvetariosClick
            OnMouseMove = lbinvetariosMouseMove
            OnMouseLeave = lbinvetariosMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbPedidosPendientesxInstalar: TRzURLLabel
            Left = 32
            Top = 64
            Width = 240
            Height = 16
            Caption = 'Pedidos Pendientes X Asignar X Articulo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbPedidosPendientesxInstalarClick
            OnMouseMove = lbPedidosPendientesxInstalarMouseMove
            OnMouseLeave = lbPedidosPendientesxInstalarMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object larticulosActivos: TRzURLLabel
            Left = 32
            Top = 96
            Width = 98
            Height = 16
            Caption = 'Articulos Activos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = larticulosActivosClick
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object llistadeprecios: TRzURLLabel
            Left = 32
            Top = 152
            Width = 214
            Height = 16
            Caption = 'Lista de precios de Equipo  General'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = llistadepreciosClick
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzURLLabel4: TRzURLLabel
            Left = 32
            Top = 184
            Width = 292
            Height = 16
            Caption = 'Lista de precios de Equipo con  Precio al Publico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RzURLLabel4Click
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzURLLabel8: TRzURLLabel
            Left = 32
            Top = 216
            Width = 266
            Height = 16
            Caption = 'Lista de precios de Equipo  calculo  formulas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = RzURLLabel8Click
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbartactinv: TRzURLLabel
            Left = 32
            Top = 120
            Width = 185
            Height = 16
            Caption = 'Articulos Activos Inventariables'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbartactinvClick
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
        end
        object TabInv2Inv: TRzTabSheet
          Color = 16119543
          Caption = 'Inventario X Fechas'
          object RzGroupBox7: TRzGroupBox
            Left = 16
            Top = 24
            Width = 217
            Height = 65
            Caption = 'Orden'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object chordenarticulos: TRzComboBox
              Left = 8
              Top = 24
              Width = 201
              Height = 24
              Hint = 'Desde el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'CODIGO'
              OnKeyPress = eddias1KeyPress
              OnNotInList = cbolineas1NotInList
              Items.Strings = (
                'CODIGO'
                'NOMBRE'
                'PROVEEDOR')
            end
          end
          object RzGroupBox11: TRzGroupBox
            Left = 248
            Top = 25
            Width = 217
            Height = 65
            Caption = 'Estatus'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object cboEstatusArt: TRzComboBox
              Left = 8
              Top = 24
              Width = 201
              Height = 24
              Hint = 'Desde el vendedor'
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtons = True
              FrameColor = clActiveCaption
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 16
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'ACTIVOS'
              OnKeyPress = eddias1KeyPress
              OnNotInList = cbolineas1NotInList
              Items.Strings = (
                'ACTIVOS'
                'INACTIVOS'
                'AMBOS')
              ItemIndex = 0
            end
          end
          object rginventario: TRzRadioGroup
            Left = 480
            Top = 32
            Width = 185
            Height = 57
            Caption = 'Inventario'
            Color = 16119543
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Por Fechas'
              'Para Ordenes de Compra')
            TabOrder = 2
          end
        end
        object TabEntSal: TRzTabSheet
          Color = 16119543
          Caption = 'Otras Entradas/Salidas'
          object lblbusqueda: TRzLabel
            Left = 594
            Top = 25
            Width = 175
            Height = 14
            Caption = 'Introduzca el numero de cuenta'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel51: TRzLabel
            Left = 413
            Top = 21
            Width = 97
            Height = 14
            Caption = 'Tipo de Concepto'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object gbTipoBusqueda: TRzRadioGroup
            Left = 302
            Top = 25
            Width = 84
            Height = 80
            Caption = 'Tipo Busqueda'
            Color = clWhite
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clBlue
            ItemFont.Height = -11
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Cuenta'
              'Nombre'
              'Todos')
            TabOrder = 0
            OnChanging = gbTipoBusquedaChanging
          end
          object edbusqueda: TRzButtonEdit
            Left = 594
            Top = 41
            Width = 177
            Height = 22
            CharCase = ecUpperCase
            FrameController = DMAccesos.frmctr
            TabOrder = 1
            OnChange = edbusquedaChange
            OnKeyPress = edbusquedaKeyPress
            ButtonKind = bkFind
            OnButtonClick = edbusquedaButtonClick
          end
          object rgTipoMov: TRzRadioGroup
            Left = 213
            Top = 25
            Width = 87
            Height = 80
            Caption = 'Tipo Movimiento'
            Color = clWhite
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clBlue
            ItemFont.Height = -11
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            ItemIndex = 0
            Items.Strings = (
              'Entrada'
              'Salida')
            TabOrder = 2
            OnChanging = rgTipoMovChanging
          end
        end
        object TabCompras: TRzTabSheet
          Color = 16119543
          Caption = 'Compras'
          object rgproveedor: TRzGroupBox
            Left = 24
            Top = 16
            Width = 217
            Height = 57
            Caption = ' Proveedores '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object cboproveedores: TRzComboBox
              Left = 8
              Top = 24
              Width = 201
              Height = 22
              Ctl3D = False
              DisabledColor = clWhite
              FlatButtons = True
              FrameHotTrack = True
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
            end
          end
        end
      end
    end
    object TabInst: TRzTabSheet
      Color = 16119543
      Caption = 'INSTALACIONES'
      object TabInst2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabInst2Tende
        Align = alClient
        TabIndex = 2
        TabOrder = 0
        OnTabClick = TabInst2TabClick
        FixedDimension = 20
        object TabInst2Gen: TRzTabSheet
          Color = 16119543
          Caption = 'Generales'
          object RzURLLabel1: TRzURLLabel
            Left = 32
            Top = 32
            Width = 92
            Height = 13
            Caption = 'Precios de articulos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbinvetariosClick
            OnMouseMove = lbinvetariosMouseMove
            OnMouseLeave = lbinvetariosMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
        end
        object TabInst2Comi: TRzTabSheet
          Color = 16119543
          Caption = 'Comisiones'
        end
        object TabInst2Tende: TRzTabSheet
          Color = 16119543
          Caption = 'Tendencia Instaladores'
          object RzGroupBox10: TRzGroupBox
            Left = 312
            Top = 30
            Width = 185
            Height = 99
            Caption = 'Tipo de reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object chinstalacionesmes: TRzCheckBox
              Left = 10
              Top = 34
              Width = 161
              Height = 17
              Hint = 'Periodo del primero al dia que se esta generando'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Mes'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = chinstalacionesmesClick
              OnKeyPress = eddias1KeyPress
            end
            object chinstalacionano: TRzCheckBox
              Left = 10
              Top = 58
              Width = 162
              Height = 31
              Hint = 'Instalaciones realizadas en el a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Totales a'#241'o instalaciones'
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnClick = chinstalacionanoClick
              OnKeyPress = eddias1KeyPress
            end
          end
        end
      end
    end
    object TabCentral: TRzTabSheet
      Color = 16119543
      Caption = 'CENTRAL'
      object TabCentral2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabCentral2TiempoPatrulleros
        Align = alClient
        TabIndex = 4
        TabOrder = 0
        OnTabClick = TabCentral2TabClick
        FixedDimension = 20
        object RzTabSheet2: TRzTabSheet
          Color = 16119543
          Caption = 'Generales'
          object lbtrafico: TRzURLLabel
            Left = 32
            Top = 24
            Width = 132
            Height = 20
            Caption = 'Reporte de Tr'#225'fico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbtraficoClick
            OnMouseMove = lbtraficoMouseMove
            OnMouseLeave = lbtraficoMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbctasctrl: TRzURLLabel
            Left = 32
            Top = 52
            Width = 363
            Height = 20
            Caption = 'Cuentas con Control  Programado para Open Close'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbctasctrlClick
            OnMouseMove = lbctasctrlMouseMove
            OnMouseLeave = lbctasctrlMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbcatcol: TRzURLLabel
            Left = 32
            Top = 80
            Width = 217
            Height = 20
            Caption = 'Catalogo de Calles por Colonia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbcatcolClick
            OnMouseMove = lbcatcolMouseMove
            OnMouseLeave = lbcatcolMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lbestadisticaserv: TRzURLLabel
            Left = 32
            Top = 112
            Width = 240
            Height = 20
            Caption = 'Estadisticas y Costos de Servicios'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbestadisticaservClick
            OnMouseMove = lbestadisticaservMouseMove
            OnMouseLeave = lbestadisticaservMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object lzonasdefault: TRzURLLabel
            Left = 32
            Top = 144
            Width = 101
            Height = 20
            Caption = 'Zonas Default'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lzonasdefaultClick
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
        end
        object TabCentral2Nosenales: TRzTabSheet
          Color = 16119543
          Caption = 'No Se'#241'ales Recibidas'
          object RzLabel49: TRzLabel
            Left = 48
            Top = 32
            Width = 35
            Height = 14
            Caption = 'Fecha:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RzLabel64: TRzLabel
            Left = 264
            Top = 32
            Width = 29
            Height = 14
            Caption = 'Total:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object LCtotal: TRzLabel
            Left = 307
            Top = 32
            Width = 3
            Height = 14
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object TPCNoSR: TRzDateTimePicker
            Left = 112
            Top = 24
            Width = 89
            Height = 22
            Date = 38859.391693969890000000
            Time = 38859.391693969890000000
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnKeyPress = TPCNoSRKeyPress
            FlatButtons = True
            FrameHotTrack = True
            FrameSides = [sdBottom]
            FrameVisible = True
          end
          object rgpruebasem: TRzRadioGroup
            Left = 448
            Top = 16
            Width = 169
            Height = 65
            Caption = ' Buscar '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Prueba Semanal'
              'Ultima Se'#241'al Recibida')
            ParentFont = False
            TabOrder = 1
          end
        end
        object TabCentral2FalsasAlarmas: TRzTabSheet
          Color = 16119543
          Caption = 'Falsas Alarmas'
          object RzGroupBox1: TRzGroupBox
            Left = 24
            Top = 24
            Width = 273
            Height = 49
            Caption = ' Conclusion de Alarma '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object CBtipoAlarma: TRzComboBox
              Left = 16
              Top = 16
              Width = 233
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              FlatButtonColor = clWhite
              FlatButtons = True
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
              OnKeyPress = CBtipoAlarmaKeyPress
              OnNotInList = CBtipoAlarmaNotInList
            end
          end
          object PCentralFechas: TRzGroupBox
            Left = 337
            Top = 24
            Width = 289
            Height = 49
            Caption = ' Fechas '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object RzLabel52: TRzLabel
              Left = 160
              Top = 24
              Width = 33
              Height = 14
              Caption = 'Hasta:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel63: TRzLabel
              Left = 8
              Top = 24
              Width = 38
              Height = 14
              Caption = 'Desde:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object TPChasta: TRzDateTimePicker
              Left = 200
              Top = 21
              Width = 81
              Height = 22
              Date = 38854.600274513890000000
              Time = 38854.600274513890000000
              TabOrder = 1
              FlatButtonColor = clWhite
              FlatButtons = True
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
            end
            object TPCdesde: TRzDateTimePicker
              Left = 64
              Top = 21
              Width = 81
              Height = 22
              Date = 38854.600088611100000000
              Time = 38854.600088611100000000
              TabOrder = 0
              FlatButtonColor = clWhite
              FlatButtons = True
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
            end
          end
          object Pcantidad: TRzGroupBox
            Left = 656
            Top = 24
            Width = 185
            Height = 49
            Caption = ' Mayores a '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object SEalarm: TRzSpinEdit
              Left = 72
              Top = 20
              Width = 47
              Height = 22
              AllowKeyEdit = True
              FlatButtonColor = clWhite
              Value = 5.000000000000000000
              FlatButtons = True
              FrameHotTrack = True
              FrameVisible = True
              TabOrder = 0
              OnKeyPress = SEalarmKeyPress
            end
          end
        end
        object TabCentral2RetardoPatrulleros: TRzTabSheet
          Color = 16119543
          Caption = 'Asistencia Patrulleros'
          object RzGroupBox9: TRzGroupBox
            Left = 8
            Top = 24
            Width = 185
            Height = 81
            Caption = ' Patrulleros '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object CBpatrullero: TRzComboBox
              Left = 16
              Top = 32
              Width = 153
              Height = 22
              Ctl3D = False
              FlatButtons = True
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
              OnKeyPress = CBpatrulleroKeyPress
            end
          end
        end
        object TabCentral2TiempoPatrulleros: TRzTabSheet
          Color = 16119543
          Caption = 'Tiempo Patrulleros'
          object lbpromediopat: TRzURLLabel
            Left = 368
            Top = 112
            Width = 232
            Height = 20
            Caption = 'Promedios de Tiempo Patrulleros'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHighlight
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
            OnClick = lbpromediopatClick
            OnMouseMove = lbpromediopatMouseMove
            OnMouseLeave = lbpromediopatMouseLeave
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object RGMotivo: TRzCheckGroup
            Left = 6
            Top = 8
            Width = 329
            Height = 129
            Caption = '  Elimina Motivo de Retardo '
            Color = 16119543
            Columns = 3
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabCentral2EmergenciasPorTurno: TRzTabSheet
          Color = 16119543
          Caption = 'Emergencias Por Turno'
        end
        object TabCentral2EmergenciasPorTipo: TRzTabSheet
          Color = 16119543
          Caption = 'Emergencias Por Tipo'
        end
        object TabCentral2Concentrado: TRzTabSheet
          Color = 16119543
          Caption = 'Concentrado de Alarmas'
          object PConcentrado: TRzGroupBox
            Left = 8
            Top = 16
            Width = 985
            Height = 73
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel65: TRzLabel
              Left = 24
              Top = 24
              Width = 49
              Height = 14
              Caption = 'Criterios'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel66: TRzLabel
              Left = 192
              Top = 24
              Width = 22
              Height = 14
              Caption = 'A'#241'o'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel67: TRzLabel
              Left = 416
              Top = 24
              Width = 41
              Height = 14
              Caption = 'Buscar:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object RzLabel53: TRzLabel
              Left = 280
              Top = 24
              Width = 103
              Height = 14
              Caption = 'Criterio busqueda:'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object CBcriterios: TRzComboBox
              Left = 24
              Top = 40
              Width = 145
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DisabledColor = clWhite
              FlatButtonColor = clWhite
              FlatButtons = True
              FocusColor = 16776176
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
              OnKeyPress = CBcriteriosKeyPress
            end
            object edCcliente: TRzButtonEdit
              Left = 608
              Top = 8
              Width = 73
              Height = 22
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 2
              Visible = False
              OnChange = edCclienteChange
              OnKeyPress = edCclienteKeyPress
              ButtonKind = bkFind
              ButtonShortCut = 119
              FlatButtons = True
              FlatButtonColor = clWhite
              OnButtonClick = edCclienteButtonClick
            end
            object edCnombre: TRzEdit
              Left = 416
              Top = 40
              Width = 465
              Height = 22
              CharCase = ecUpperCase
              DisabledColor = clWhite
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              ImeMode = imKata
              TabOrder = 3
              OnKeyPress = edCnombreKeyPress
            end
            object edCtelefono: TRzEdit
              Left = 856
              Top = 40
              Width = 121
              Height = 22
              CharCase = ecUpperCase
              DisabledColor = clWhite
              Enabled = False
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              TabOrder = 4
              Visible = False
            end
            object neanio: TRzEdit
              Left = 192
              Top = 40
              Width = 81
              Height = 22
              Cursor = crIBeam
              HelpType = htKeyword
              Alignment = taRightJustify
              FrameSides = [sdBottom]
              FrameVisible = True
              MaxLength = 4
              TabOrder = 1
              OnKeyPress = neanioKeyPress
            end
            object cbotipobusconcentrado: TRzComboBox
              Left = 280
              Top = 40
              Width = 121
              Height = 22
              CharCase = ecUpperCase
              Ctl3D = False
              DisabledColor = clWhite
              FlatButtonColor = clWhite
              FlatButtons = True
              FocusColor = 16776176
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 5
              Text = 'CUENTA'
              OnKeyPress = CBcriteriosKeyPress
              OnNotInList = cbotipobusconcentradoNotInList
              Items.Strings = (
                'CUENTA'
                'NOMBRE')
              ItemIndex = 0
            end
          end
        end
        object TabCentral2ActivacionesDiarias: TRzTabSheet
          Color = 16119543
          Caption = 'Activaciones Diarias'
          object RzLabel71: TRzLabel
            Left = 224
            Top = 96
            Width = 40
            Height = 14
            Caption = 'Motivo:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object GrangoHoras: TRzGroupBox
            Left = 424
            Top = 16
            Width = 241
            Height = 65
            Caption = 'Rango de Horas'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object RzLabel70: TRzLabel
              Left = 120
              Top = 32
              Width = 8
              Height = 14
              Caption = 'A'
              BlinkIntervalOff = 5000
              BlinkIntervalOn = 20
            end
            object TPHdesde: TRzDateTimePicker
              Left = 8
              Top = 24
              Width = 97
              Height = 22
              Date = 38870.500000000000000000
              Format = 'h:mm:ss tt'
              Time = 38870.500000000000000000
              Kind = dtkTime
              TabOrder = 0
              FlatButtonColor = clWhite
              DisabledColor = clWhite
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
            end
            object TPHhasta: TRzDateTimePicker
              Left = 144
              Top = 24
              Width = 90
              Height = 22
              Date = 38870.500000000000000000
              Format = 'h:mm:ss tt'
              Time = 38870.500000000000000000
              Kind = dtkTime
              TabOrder = 1
              FlatButtonColor = clWhite
              DisabledColor = clWhite
              FrameHotTrack = True
              FrameSides = [sdBottom]
              FrameVisible = True
            end
          end
          object gbturnos: TRzGroupBox
            Left = 216
            Top = 8
            Width = 201
            Height = 73
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object rbDiurno: TRzRadioButton
              Left = 16
              Top = 16
              Width = 65
              Height = 17
              Caption = 'Diurno'
              Checked = True
              HotTrack = True
              TabOrder = 0
              TabStop = True
              OnClick = rbDiurnoClick
            end
            object rbVespertino: TRzRadioButton
              Left = 16
              Top = 40
              Width = 89
              Height = 17
              Caption = 'Vespertino'
              HotTrack = True
              TabOrder = 1
              OnClick = rbVespertinoClick
            end
            object rbNocturno: TRzRadioButton
              Left = 112
              Top = 16
              Width = 73
              Height = 17
              Caption = 'Nocturno'
              HotTrack = True
              TabOrder = 2
              OnClick = rbNocturnoClick
            end
            object rbhoras: TRzRadioButton
              Left = 112
              Top = 40
              Width = 73
              Height = 17
              Caption = 'Horas'
              HotTrack = True
              TabOrder = 3
              OnClick = rbhorasClick
            end
          end
          object cbmotivos: TRzComboBox
            Left = 280
            Top = 88
            Width = 129
            Height = 22
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            ItemHeight = 14
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabCentral2EmergenciasCliente: TRzTabSheet
          Color = 16119543
          Caption = 'Emergencias por Cliente'
          object RzLabel33: TRzLabel
            Left = 300
            Top = 24
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
        end
        object TabCentral2TraficoResumen: TRzTabSheet
          Color = 16119543
          Caption = 'Trafico Resumen'
          object rgbuspor: TRzRadioGroup
            Left = 24
            Top = 16
            Width = 105
            Height = 81
            Caption = ' Buscar por '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Cuentas'
              'Grupos'
              'Nombre')
            ParentFont = False
            TabOrder = 0
            OnClick = rgbusporClick
          end
        end
        object TabCentral2MotivosRetardo: TRzTabSheet
          Color = 16119543
          Caption = 'Motivos de Retardo'
        end
        object tsbonos: TRzTabSheet
          Color = 16119543
          Caption = 'Bono Patrulleros'
        end
        object TSCentral2Boletin: TRzTabSheet
          Color = 16119543
          Caption = 'Boletin Tranquilidad'
          object DGGeneral: TDBGrid
            Left = 7
            Top = 144
            Width = 993
            Height = 377
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            Visible = False
          end
        end
        object TSCentral2EventosPos: TRzTabSheet
          Color = 16119543
          Caption = 'Eventos Positivos'
          object rgEventosPositivos: TRzRadioGroup
            Left = 8
            Top = 16
            Width = 273
            Height = 121
            Caption = 'Reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Eventos Positivos'
              'Resumen por Nombre'
              'Oxxos con AP'
              'Oxxos con AA'
              'Oxxos con FA')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabCentral2EnvioColonias: TRzTabSheet
          Color = 16119543
          Caption = 'Trafico Enviado por Colonias'
          object rgTrafImp: TRzRadioGroup
            Left = 208
            Top = 8
            Width = 113
            Height = 65
            Caption = ' Envio por '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Impresion'
              'Email')
            ParentFont = False
            TabOrder = 0
          end
          object rgTrafCol: TRzRadioGroup
            Left = 16
            Top = 8
            Width = 129
            Height = 65
            Caption = ' Trafico por '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 0
            Items.Strings = (
              'Enviados'
              'No Enviados')
            ParentFont = False
            TabOrder = 1
          end
        end
        object TabSinActividad: TRzTabSheet
          Color = 16119543
          Caption = 'Clientes Sin Actividad'
        end
        object TabCentral2ResumenPositivos: TRzTabSheet
          Color = 16119543
          Caption = 'Resumen Positivos'
          object rgResPos: TRzRadioGroup
            Left = 16
            Top = 8
            Width = 289
            Height = 81
            Caption = 'Busqueda por'
            Color = 16119543
            Columns = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            Items.Strings = (
              'Colonias'
              'Horas'
              'Dias de Semana'
              'Colonias Oxxos'
              'Horas Oxxos'
              'Dias de Semana Oxxos')
            ParentFont = False
            TabOrder = 0
          end
          object gbano: TRzGroupBox
            Left = 312
            Top = 8
            Width = 177
            Height = 81
            Caption = 'A'#241'o'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object edano: TRzEdit
              Left = 32
              Top = 32
              Width = 121
              Height = 22
              FrameHotTrack = True
              FrameVisible = True
              TabOrder = 0
              OnKeyPress = edanoKeyPress
            end
          end
        end
        object tsCentral2Centraleros: TRzTabSheet
          Color = 16119543
          Caption = 'Centraleros'
          object rgRepCentraleros: TRzRadioGroup
            Left = 16
            Top = 8
            Width = 433
            Height = 81
            Caption = 'Reporte de'
            Color = 16119543
            Columns = 2
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemIndex = 1
            Items.Strings = (
              'Promedio de Atenciones por Centralero'
              'Tickets Centraleros'
              'Tickets Centraleros Detallado'
              'Mas de 2 Fallas de Equipo'
              'Servicios Patrulleros')
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object TabServicios: TRzTabSheet
      Color = 16119543
      Caption = 'SERVICIOS'
      object TabServicios2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = TabServicios2Busquedas
        Align = alClient
        TabIndex = 1
        TabOrder = 0
        OnTabClick = TabServicios2TabClick
        FixedDimension = 20
        object TabServicios2Generales: TRzTabSheet
          Color = 16119543
          Caption = 'Generales'
        end
        object TabServicios2Busquedas: TRzTabSheet
          Color = 16119543
          Caption = 'Busquedas'
          object TabServBusq2: TRzPageControl
            Left = 8
            Top = 8
            Width = 1001
            Height = 574
            ActivePage = TabServBusqEstatus
            TabIndex = 3
            TabOrder = 0
            OnTabClick = TabServBusq2TabClick
            FixedDimension = 20
            object TabServBusqCuenta: TRzTabSheet
              Color = 16119543
              Caption = 'Cuenta'
              object RzLabel45: TRzLabel
                Left = 24
                Top = 40
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
              object Ltotalc: TRzLabel
                Left = 24
                Top = 64
                Width = 29
                Height = 14
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object LScuenta: TRzLabel
                Left = 80
                Top = 64
                Width = 3
                Height = 14
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object LScuentas: TRzLabel
                Left = 64
                Top = 64
                Width = 15
                Height = 14
                Caption = 'RC'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object ptiempo2: TRzGroupBox
                Left = 616
                Top = 16
                Width = 289
                Height = 49
                Caption = ' Fechas '
                Color = 16119543
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                Visible = False
                object RzLabel46: TRzLabel
                  Left = 160
                  Top = 24
                  Width = 33
                  Height = 14
                  Caption = 'Hasta:'
                  BlinkIntervalOff = 5000
                  BlinkIntervalOn = 20
                end
                object RzLabel47: TRzLabel
                  Left = 8
                  Top = 24
                  Width = 38
                  Height = 14
                  Caption = 'Desde:'
                  BlinkIntervalOff = 5000
                  BlinkIntervalOn = 20
                end
                object TPShasta: TRzDateTimePicker
                  Left = 200
                  Top = 19
                  Width = 81
                  Height = 22
                  Date = 38854.600274513890000000
                  Time = 38854.600274513890000000
                  TabOrder = 0
                  OnKeyPress = TPShastaKeyPress
                  FlatButtonColor = clWhite
                  FlatButtons = True
                  FrameHotTrack = True
                  FrameSides = [sdBottom]
                  FrameVisible = True
                end
                object TPSdesde: TRzDateTimePicker
                  Left = 56
                  Top = 19
                  Width = 81
                  Height = 22
                  Date = 38854.600088611100000000
                  Time = 38854.600088611100000000
                  TabOrder = 1
                  OnKeyPress = TPSdesdeKeyPress
                  FlatButtonColor = clWhite
                  FlatButtons = True
                  FrameHotTrack = True
                  FrameSides = [sdBottom]
                  FrameVisible = True
                end
              end
              object GFechTodas: TRzGroupBox
                Left = 248
                Top = 24
                Width = 185
                Height = 41
                Caption = 'Fecha'
                Color = 16119543
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                object RBFecTodas: TRzRadioButton
                  Left = 8
                  Top = 16
                  Width = 115
                  Height = 17
                  Caption = 'Todas'
                  Checked = True
                  HotTrack = True
                  TabOrder = 0
                  TabStop = True
                  OnClick = RBFecTodasClick
                  OnKeyPress = RBFecTodasKeyPress
                end
                object RBFecRango: TRzRadioButton
                  Left = 96
                  Top = 16
                  Width = 83
                  Height = 17
                  Caption = 'Por Rango'
                  HotTrack = True
                  TabOrder = 1
                  OnClick = RBFecRangoClick
                  OnKeyPress = RBFecRangoKeyPress
                end
              end
              object edclientes: TRzButtonEdit
                Left = 80
                Top = 32
                Width = 129
                Height = 22
                FrameSides = [sdBottom]
                FrameVisible = True
                TabOrder = 2
                OnKeyPress = edclientesKeyPress
                ButtonKind = bkFind
                ButtonShortCut = 119
                FlatButtons = True
                FlatButtonColor = clWhite
                OnButtonClick = edcuentapButtonClick
              end
            end
            object TabServBusqTecnicos: TRzTabSheet
              Color = 16119543
              Caption = 'Tecnicos'
              object lbltecnico: TRzLabel
                Left = 24
                Top = 40
                Width = 45
                Height = 14
                Caption = 'Tecnico:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object RzLabel60: TRzLabel
                Left = 24
                Top = 64
                Width = 29
                Height = 14
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object LStecnico: TRzLabel
                Left = 67
                Top = 64
                Width = 15
                Height = 14
                Caption = 'RC'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object cbtecnico: TRzComboBox
                Left = 72
                Top = 32
                Width = 145
                Height = 22
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                FlatButtons = True
                FrameHotTrack = True
                FrameSides = [sdBottom]
                FrameVisible = True
                ItemHeight = 14
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnClick = cbtecnicoClick
                OnKeyPress = cbtecnicoKeyPress
              end
              object ChEstatus: TRzCheckBox
                Left = 232
                Top = 24
                Width = 73
                Height = 17
                Caption = 'Estatus'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                HotTrack = True
                ParentFont = False
                State = cbUnchecked
                TabOrder = 1
                OnClick = ChEstatusClick
                OnKeyPress = ChEstatusKeyPress
              end
              object ChFecha: TRzCheckBox
                Left = 232
                Top = 40
                Width = 73
                Height = 17
                Caption = 'Fecha'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                HotTrack = True
                ParentFont = False
                State = cbUnchecked
                TabOrder = 2
                OnClick = ChFechaClick
                OnKeyPress = ChFechaKeyPress
              end
              object PSestatus: TRzGroupBox
                Left = 312
                Top = 24
                Width = 225
                Height = 41
                Caption = 'Estatus'
                Color = 16119543
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                Visible = False
                object CBSTestatus: TRzComboBox
                  Left = 80
                  Top = 13
                  Width = 121
                  Height = 22
                  Ctl3D = False
                  FlatButtons = True
                  FrameHotTrack = True
                  FrameSides = [sdBottom]
                  FrameVisible = True
                  ItemHeight = 14
                  ParentCtl3D = False
                  TabOrder = 0
                  OnKeyPress = CBSTestatusKeyPress
                  OnNotInList = CBSTestatusNotInList
                end
              end
            end
            object TabServBusqFecha: TRzTabSheet
              Color = 16119543
              Caption = 'Fecha'
              object lbcboestatus: TRzLabel
                Left = 384
                Top = 40
                Width = 44
                Height = 14
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
              object RzLabel61: TRzLabel
                Left = 24
                Top = 64
                Width = 29
                Height = 14
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object LSfecha: TRzLabel
                Left = 80
                Top = 64
                Width = 15
                Height = 14
                Caption = 'RC'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object cbestatusf: TRzComboBox
                Left = 448
                Top = 32
                Width = 145
                Height = 22
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                FlatButtons = True
                FrameHotTrack = True
                FrameSides = [sdBottom]
                FrameVisible = True
                ItemHeight = 14
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnKeyPress = cbestatusfKeyPress
                OnNotInList = cbestatusfNotInList
              end
            end
            object TabServBusqEstatus: TRzTabSheet
              Color = 16119543
              Caption = 'Estatus'
              object LSestatus: TRzLabel
                Left = 72
                Top = 64
                Width = 15
                Height = 14
                Caption = 'RC'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object RzLabel62: TRzLabel
                Left = 24
                Top = 64
                Width = 29
                Height = 14
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object RGSerEst: TRzGroupBox
                Left = 8
                Top = 2
                Width = 977
                Height = 55
                Color = 16119543
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                object RzLabel56: TRzLabel
                  Left = 8
                  Top = 10
                  Width = 44
                  Height = 14
                  Caption = 'Estatus:'
                  BlinkIntervalOff = 5000
                  BlinkIntervalOn = 20
                end
                object RzLabel57: TRzLabel
                  Left = 408
                  Top = 8
                  Width = 72
                  Height = 14
                  Caption = 'Clasificacion:'
                  BlinkIntervalOff = 5000
                  BlinkIntervalOn = 20
                end
                object RzLabel58: TRzLabel
                  Left = 576
                  Top = 8
                  Width = 42
                  Height = 14
                  Caption = 'Cliente:'
                  BlinkIntervalOff = 5000
                  BlinkIntervalOn = 20
                end
                object RzLabel59: TRzLabel
                  Left = 752
                  Top = 8
                  Width = 45
                  Height = 14
                  Caption = 'Tecnico:'
                  BlinkIntervalOff = 5000
                  BlinkIntervalOn = 20
                end
                object cbestatus: TRzComboBox
                  Left = 8
                  Top = 25
                  Width = 105
                  Height = 22
                  Ctl3D = False
                  FlatButtonColor = clWhite
                  FlatButtons = True
                  FrameHotTrack = True
                  FrameSides = [sdBottom]
                  FrameVisible = True
                  ItemHeight = 14
                  ParentCtl3D = False
                  TabOrder = 0
                  OnKeyPress = cbestatusKeyPress
                  OnNotInList = cbestatusNotInList
                end
                object CBClasifS: TRzComboBox
                  Left = 408
                  Top = 24
                  Width = 121
                  Height = 22
                  Ctl3D = False
                  FlatButtons = True
                  FrameSides = [sdBottom]
                  FrameVisible = True
                  ItemHeight = 14
                  ParentCtl3D = False
                  TabOrder = 1
                  OnKeyPress = CBClasifSKeyPress
                  OnNotInList = CBClasifSNotInList
                end
                object CBtecnicos2: TRzComboBox
                  Left = 752
                  Top = 24
                  Width = 129
                  Height = 22
                  Ctl3D = False
                  FlatButtons = True
                  FrameSides = [sdBottom]
                  FrameVisible = True
                  ItemHeight = 14
                  ParentCtl3D = False
                  TabOrder = 2
                  OnKeyPress = CBtecnicos2KeyPress
                  OnNotInList = CBtecnicos2NotInList
                end
              end
            end
            object TabServBusqProblema: TRzTabSheet
              Color = 16119543
              Caption = 'Por Problema'
              object RzLabel55: TRzLabel
                Left = 601
                Top = 40
                Width = 80
                Height = 14
                Caption = 'Tipo Problema'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object lbproblema: TRzLabel
                Left = 72
                Top = 71
                Width = 15
                Height = 14
                Caption = 'RC'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object RzLabel50: TRzLabel
                Left = 24
                Top = 71
                Width = 29
                Height = 14
                Caption = 'Total:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BlinkIntervalOff = 5000
                BlinkIntervalOn = 20
              end
              object cboproblemaservicio: TRzComboBox
                Left = 688
                Top = 33
                Width = 257
                Height = 22
                Ctl3D = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                FlatButtonColor = clWhite
                FlatButtons = True
                FrameHotTrack = True
                FrameSides = [sdBottom]
                FrameVisible = True
                ItemHeight = 14
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnKeyPress = cbestatusKeyPress
                OnNotInList = cbestatusNotInList
              end
            end
          end
        end
        object TabServicios2TendenciaTec: TRzTabSheet
          Color = 16119543
          Caption = 'Tendencia Tecnicos'
          object gbtiporepservicios: TRzGroupBox
            Left = 320
            Top = 38
            Width = 185
            Height = 89
            Caption = 'Tipo de reporte'
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object chmesservicio: TRzCheckBox
              Left = 10
              Top = 34
              Width = 161
              Height = 17
              Hint = 'Periodo del primero al dia que se esta generando'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Mes'
              Checked = True
              HotTrack = True
              State = cbChecked
              TabOrder = 0
              OnClick = chmesservicioClick
              OnKeyPress = eddias1KeyPress
            end
            object chserviciosyear: TRzCheckBox
              Left = 10
              Top = 58
              Width = 161
              Height = 17
              Hint = 'Servicios realizadas en lo que va del a'#241'o'
              Alignment = taLeftJustify
              AlignmentVertical = avCenter
              Caption = 'Totales a'#241'o servicios'
              Color = 16119543
              HotTrack = True
              ParentColor = False
              State = cbUnchecked
              TabOrder = 1
              OnClick = chserviciosyearClick
              OnKeyPress = eddias1KeyPress
            end
          end
        end
        object ServRep: TRzTabSheet
          Color = 16119543
          Caption = 'Servicios Repetidos'
        end
      end
    end
    object pcadmon: TRzTabSheet
      Color = 16119543
      Caption = 'ADMINISTRACION'
      object pcadministracion: TRzPageControl
        Left = 0
        Top = 0
        Width = 1016
        Height = 564
        ActivePage = admongral
        ActivePageDefault = admongral
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        OnTabClick = pcadministracionTabClick
        FixedDimension = 20
        object admongral: TRzTabSheet
          Color = 16119543
          Caption = 'Generales'
        end
        object tstravel: TRzTabSheet
          Color = 16119543
          Caption = 'Travelers'
          object RzLabel48: TRzLabel
            Left = 298
            Top = 1
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
          object rcgFuente: TRzCheckGroup
            Left = 1
            Top = 316
            Width = 1006
            Height = 57
            Caption = 'Fuente'
            Color = clWhite
            Columns = 7
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clWindowText
            ItemFont.Height = -11
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = rcgFuenteChange
          end
          object rrgSubAsunto: TRzRadioGroup
            Left = 1
            Top = 237
            Width = 1008
            Height = 80
            Caption = 'Sub-Asunto'
            Color = clWhite
            Columns = 7
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clBlack
            ItemFont.Height = -11
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            ParentFont = False
            TabOrder = 1
            OnChanging = rrgSubAsuntoChanging
          end
          object rrgasuntos: TRzRadioGroup
            Left = 1
            Top = 178
            Width = 1008
            Height = 59
            Caption = 'Asunto'
            Color = clWhite
            Columns = 7
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clBlack
            ItemFont.Height = -11
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            ParentFont = False
            TabOrder = 2
            OnChanging = rrgasuntosChanging
          end
          object rrgdepto: TRzRadioGroup
            Left = 1
            Top = 83
            Width = 1008
            Height = 94
            Caption = 'Departamento'
            Color = clWhite
            Columns = 7
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            ItemFont.Charset = ANSI_CHARSET
            ItemFont.Color = clBlack
            ItemFont.Height = -11
            ItemFont.Name = 'Arial'
            ItemFont.Style = []
            ParentFont = False
            TabOrder = 3
            OnChanging = rrgdeptoChanging
          end
          object rrgresolucion: TRzRadioGroup
            Left = 152
            Top = 0
            Width = 139
            Height = 39
            Caption = 'Resolucion'
            Color = clWhite
            Columns = 4
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            Items.Strings = (
              'No'
              'Si'
              'Todos')
            ParentFont = False
            TabOrder = 4
            OnChanging = rrgresolucionChanging
          end
          object rrgauditado: TRzRadioGroup
            Left = 153
            Top = 40
            Width = 139
            Height = 39
            Caption = 'Auditado'
            Color = clWhite
            Columns = 4
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ItemHotTrack = True
            Items.Strings = (
              'No'
              'Si'
              'Todos')
            ParentFont = False
            TabOrder = 5
          end
          object cboestatus: TRzComboBox
            Left = 297
            Top = 16
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
            TabOrder = 6
            OnSelect = cboestatusSelect
          end
        end
        object TabAdmonDesempeno: TRzTabSheet
          Color = 16119543
          Caption = 'Administracion de Desempe'#241'o'
          object RGAreas: TRzGroupBox
            Left = 504
            Top = 24
            Width = 217
            Height = 57
            Caption = ' Areas '
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
            object cbarea: TRzComboBox
              Left = 8
              Top = 24
              Width = 201
              Height = 22
              Ctl3D = False
              DisabledColor = clWhite
              FlatButtons = True
              FrameHotTrack = True
              FrameVisible = True
              ItemHeight = 14
              ParentCtl3D = False
              TabOrder = 0
            end
          end
        end
        object TabAdmAuditoria: TRzTabSheet
          Color = 16119543
          Caption = 'Auditoria'
          object RzLabel69: TRzLabel
            Left = 24
            Top = 192
            Width = 91
            Height = 14
            Caption = 'Reporte a generar:'
            BlinkIntervalOff = 5000
            BlinkIntervalOn = 20
          end
          object chbTipoReporte: TRzComboBox
            Left = 132
            Top = 187
            Width = 333
            Height = 22
            Hint = 'El mes a mostrar'
            CharCase = ecUpperCase
            Ctl3D = False
            FlatButtons = True
            FrameColor = clActiveCaption
            FrameSides = [sdBottom]
            FrameVisible = True
            ItemHeight = 14
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Items.Strings = (
              'VENTAS MENSUALES'
              'DIARIO DE VENTAS'
              'ANALISIS DE VENTAS'
              'ANALISIS DE NOTAS DE CR'#201'DITO'
              'ANALISIS VENTAS-NOTAS CR'#201'DITO'
              'FACTURAS CANCELADAS'
              'NOTAS DE CREDITO'
              'NOTAS DE CREDITO DETALLADO'
              'PAGOS X LINEA'
              'ANTIGUEDADES DE SALDOS FACTURAS'
              'ANTIGUEDADES DE SALDOS TODO'
              'ANTIGUEDADES DE SALDOS CONCENTRADO'
              'ANTIGUEDADES DE SALDOS FACTURAS CONCENTRADO'
              'REMISIONES MENSUALES'
              'TENDENCIA VENDEDORES'
              'COMPRAS'
              'REPORTE DE CAJA'
              'PAGOS POR LINEA POR MES'
              'CANCELADOS Y MOROSOS')
          end
        end
        object tslog: TRzTabSheet
          Color = 16119543
          Caption = 'Bitacora'
          object rgusuario: TRzGroupBox
            Left = 120
            Top = 32
            Width = 185
            Height = 81
            Caption = 'Usuario'
            TabOrder = 0
            object eduser: TRzButtonEdit
              Left = 32
              Top = 32
              Width = 121
              Height = 22
              TabOrder = 0
              ButtonKind = bkFind
            end
          end
        end
      end
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1020
    Height = 34
    Align = alTop
    BorderOuter = fsNone
    Color = clBtnHighlight
    TabOrder = 1
    object btnbuscar: TRzBitBtn
      Left = 32
      Top = 3
      Width = 95
      Height = 27
      Caption = '&Buscar'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 0
      OnClick = btnbuscarClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000330B0000330B00000001000000000000000000003300
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
        0000000000000000000000000000000000000000000000000000E8ACDEE3E8E8
        E8E8E8E8E8E8E8E8E8E8E8ACDEE3E8E8E8E8E8E8E8E8E8E8E8E8AC807A81E3E8
        E8E8E8E8E8E8E8E8E8E8ACE28181E3E8E8E8E8E8E8E8E8E8E8E8E8CEA37A81E3
        E8E8E8E8E8E8E8E8E8E8E8ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA37A81
        E3E8E8E8E8E8E8E8E8E8E8E3ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA37A
        81E3E8E8E8E8E8E8E8E8E8E8E3ACE28181E3E8E8E8E8E8E8E8E8E8E8E8D0CEA3
        7AACAD82828288E3E8E8E8E8E8E3ACE281ACE3818181E2E3E8E8E8E8E8E8D0CE
        E28288E6B3E6E682EBE8E8E8E8E8E3ACE281E2ACACACAC81E3E8E8E8E8E8E8E3
        8289B3B3B3D7D7D782E3E8E8E8E8E8E381E3ACACACE3E3E381E3E8E8E8E8E8AD
        88B3E6B3B3D7D7D7E688E8E8E8E8E8E3E2ACACACACE3E3E3ACE2E8E8E8E8E888
        89E6E6B3B3B3D7D7E682E8E8E8E8E8E2E3ACACACACACE3E3AC81E8E8E8E8E882
        E6E6E6E6B3B3B3B3B382E8E8E8E8E881ACACACACACACACACAC81E8E8E8E8E888
        E6B3E6E6E6B3B3B3E682E8E8E8E8E8E2ACACACACACACACACAC81E8E8E8E8E8AD
        88D7D7E6E6E6E6B38888E8E8E8E8E8E3E2E3E3ACACACACACE2E2E8E8E8E8E8E3
        82EBD7B3E6E6E68982E3E8E8E8E8E8E381E3E3ACACACACE381E3E8E8E8E8E8E8
        AD82ADE6E6E68882ADE8E8E8E8E8E8E8E381E3ACACACE281E3E8E8E8E8E8E8E8
        E8E38882828282E3E8E8E8E8E8E8E8E8E8E3E281818181E3E8E8}
      NumGlyphs = 2
    end
    object btngenerar: TRzBitBtn
      Left = 427
      Top = 3
      Width = 95
      Height = 30
      Hint = 'Generar el reporte correspondiente'
      Caption = '&Generar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btngenerarClick
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
      NumGlyphs = 2
      Spacing = 3
    end
    object btncerrar: TRzBitBtn
      Left = 690
      Top = 3
      Width = 95
      Height = 27
      Hint = 'Cerrar esta Pantalla'
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 2
      OnClick = btncerrarClick
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
      Spacing = 3
    end
    object cbgenerar: TRzComboBox
      Left = 264
      Top = 8
      Width = 145
      Height = 21
      Hint = 
        'Vista Previa: Genera Vista Previa,  Email: Genera PDF para envia' +
        'r correo, Archivo: Genera PDF o Excel, Imprimir: Imprime directo' +
        ' a la impresora default'
      Ctl3D = False
      DisabledColor = clWhite
      FlatButtonColor = clWhite
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnSelect = cbgenerarSelect
    end
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    AfterOpen = sqlgeneralAfterOpen
    AfterClose = sqlgeneralAfterClose
    FetchAll = True
    Left = 134
    Top = 248
  end
end
