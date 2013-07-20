object frmpresupuestos2: Tfrmpresupuestos2
  Left = 354
  Top = 176
  Width = 1033
  Height = 650
  Caption = '\'
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCPresup: TRzPageControl
    Left = 0
    Top = 0
    Width = 1009
    Height = 553
    ActivePage = tsprincipal
    AlignTabs = True
    BoldCurrentTab = True
    Color = clWhite
    UseColoredTabs = True
    ParentColor = False
    TabIndex = 0
    TabOrder = 0
    OnTabClick = PCPresupTabClick
    FixedDimension = 19
    object tsprincipal: TRzTabSheet
      Color = clWhite
      Caption = '&Datos Principales'
      object RzLabel13: TRzLabel
        Left = 496
        Top = 98
        Width = 40
        Height = 14
        Caption = 'Origen:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object potros: TRzPanel
        Left = 0
        Top = 217
        Width = 1005
        Height = 177
        Align = alTop
        Color = clWhite
        Enabled = False
        TabOrder = 2
        object RzLabel12: TRzLabel
          Left = 546
          Top = 5
          Width = 158
          Height = 20
          Caption = 'Estatus del Evento:'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblpresupuesto: TRzLabel
          Left = 296
          Top = 67
          Width = 316
          Height = 22
          Caption = 'Presupuesto usado por el pedido:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clTeal
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel15: TRzLabel
          Left = 10
          Top = 93
          Width = 107
          Height = 20
          Caption = 'Comentarios:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object mmcomentarios: TRzMemo
          Left = 8
          Top = 112
          Width = 769
          Height = 57
          Enabled = False
          MaxLength = 800
          TabOrder = 0
          DisabledColor = clWhite
          FocusColor = 16776176
          FrameColor = clBlue
          FrameHotColor = clRed
          FrameHotTrack = True
          FrameVisible = True
        end
        object rgPresupDefault: TRzRadioGroup
          Left = 8
          Top = 8
          Width = 249
          Height = 81
          Caption = 'Presupuesto que se pasara a pedido?'
          Color = clWhite
          Enabled = False
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
            'Sistema Economico'
            'Sistema Basico'
            'Sistema al 100%')
          ParentFont = False
          TabOrder = 1
          OnClick = rgPresupDefaultClick
        end
        object cbostatus: TRzComboBox
          Left = 546
          Top = 28
          Width = 217
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DropDownCount = 12
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          FrameController = DMAccesos.frmctr
          ItemHeight = 13
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnSelect = cbostatusSelect
          Items.Strings = (
            'ASIGNADO AL VENDEDOR'
            'EN ATENCION POR EL VENDEDOR'
            'EN ESPERA DE AUTORIZACION'
            'RECHAZADA'
            'CANCELADA'
            'ACEPTADA')
        end
      end
      object gbVendedor: TGroupBox
        Left = 0
        Top = 0
        Width = 1005
        Height = 62
        Align = alTop
        Caption = 'Datos para la Cotizaci'#243'n'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object RzLabel11: TRzLabel
          Left = 11
          Top = 17
          Width = 100
          Height = 16
          Caption = 'Num Cotizacion'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel2: TRzLabel
          Left = 117
          Top = 17
          Width = 78
          Height = 14
          Caption = 'Cve Vendedor'
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
          Left = 213
          Top = 17
          Width = 44
          Height = 14
          Caption = 'Nombre'
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
          Left = 421
          Top = 17
          Width = 86
          Height = 14
          Caption = 'Tipo de Cambio'
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
          Left = 613
          Top = 17
          Width = 55
          Height = 14
          Caption = 'Costo Hrs'
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
          Left = 509
          Top = 17
          Width = 84
          Height = 14
          Caption = 'Fecha Creacion'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object Edcve_vend: TRzEdit
          Left = 117
          Top = 30
          Width = 81
          Height = 22
          Hint = 'Recuerde Clave,Nombre o RFC'
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
          TabOrder = 0
          OnChange = Edcve_vendChange
          OnKeyPress = Edcve_vendKeyPress
        end
        object cbonom_vend: TRzComboBox
          Left = 205
          Top = 30
          Width = 209
          Height = 22
          Ctl3D = False
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          FlatButtons = True
          FocusColor = 16776176
          FrameColor = clActiveCaption
          FrameHotColor = clFuchsia
          FrameSides = [sdBottom]
          FrameVisible = True
          ItemHeight = 14
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnChange = cbonom_vendChange
          OnClick = cbonom_vendClick
          OnKeyPress = cbonom_vendKeyPress
        end
        object edTCP: TRzEdit
          Left = 421
          Top = 30
          Width = 81
          Height = 22
          Hint = 'Recuerde Clave,Nombre o RFC'
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
        end
        object edCostoHoras: TRzEdit
          Left = 613
          Top = 30
          Width = 81
          Height = 22
          Hint = 'Recuerde Clave,Nombre o RFC'
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
          TabOrder = 3
        end
        object edFechaCreacion: TRzEdit
          Left = 509
          Top = 29
          Width = 97
          Height = 22
          Hint = 'Recuerde Clave,Nombre o RFC'
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
          TabOrder = 4
        end
      end
      object gboportunidad: TGroupBox
        Left = 0
        Top = 62
        Width = 1005
        Height = 155
        Align = alTop
        Caption = 'Datos de la Oportunidad/Cliente'
        Color = clWhite
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object RzLabel1: TRzLabel
          Left = 616
          Top = 70
          Width = 79
          Height = 14
          Caption = 'Codigo postal:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblmovil: TRzLabel
          Left = 13
          Top = 94
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
        object lblciudad: TRzLabel
          Left = 14
          Top = 63
          Width = 41
          Height = 14
          Caption = 'Ciudad:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblestado: TRzLabel
          Left = 173
          Top = 62
          Width = 40
          Height = 14
          Caption = 'Estado:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblcolonia: TRzLabel
          Left = 373
          Top = 67
          Width = 44
          Height = 14
          Caption = 'Colonia:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblentre: TRzLabel
          Left = 276
          Top = 98
          Width = 32
          Height = 14
          Caption = 'Entre:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblalta: TRzLabel
          Left = 150
          Top = 95
          Width = 24
          Height = 14
          Caption = 'Alta:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblfuente: TRzLabel
          Left = 408
          Top = 130
          Width = 41
          Height = 14
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
        object lblorigen: TRzLabel
          Left = 584
          Top = 98
          Width = 40
          Height = 14
          Caption = 'Origen:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblnombre: TRzLabel
          Left = 13
          Top = 40
          Width = 104
          Height = 14
          Caption = 'Nombre Completo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblgiro: TRzLabel
          Left = 10
          Top = 130
          Width = 26
          Height = 14
          Caption = 'Giro:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblcategoria: TRzLabel
          Left = 164
          Top = 130
          Width = 59
          Height = 13
          Caption = 'Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel7: TRzLabel
          Left = 780
          Top = 127
          Width = 47
          Height = 13
          Caption = 'Estatus:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          FlyByEnabled = True
          HighlightColor = clCream
          ShadowColor = clBtnFace
        end
        object RzLabel3: TRzLabel
          Left = 12
          Top = 18
          Width = 102
          Height = 14
          Caption = 'Num. Oportunidad:'
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
          Left = 397
          Top = 40
          Width = 30
          Height = 14
          Caption = 'Calle:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel9: TRzLabel
          Left = 659
          Top = 40
          Width = 47
          Height = 14
          Caption = 'Numero:'
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
          Left = 387
          Top = 20
          Width = 71
          Height = 14
          Caption = 'Razon Social:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel39: TRzLabel
          Left = 219
          Top = 18
          Width = 70
          Height = 14
          Caption = 'Num Cliente:'
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
          Left = 568
          Top = 130
          Width = 27
          Height = 14
          Caption = 'Tipo:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object edentre: TRzDBEdit
          Left = 313
          Top = 90
          Width = 264
          Height = 22
          Hint = 'Entre que calles esta'
          DataSource = dsoportunidades
          DataField = 'entre'
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
          TabOrder = 1
        end
        object ednombre: TRzDBEdit
          Left = 116
          Top = 34
          Width = 277
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'nombre'
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
          TabOrder = 0
        end
        object edestatus: TRzDBEdit
          Left = 841
          Top = 122
          Width = 120
          Height = 22
          Hint = 'Alguna observacion o comentario'
          DataSource = dsoportunidades
          DataField = 'estatus'
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
          TabOrder = 2
        end
        object edorigen: TRzDBEdit
          Left = 632
          Top = 90
          Width = 143
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'origen'
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
          TabOrder = 3
        end
        object edfuente: TRzDBEdit
          Left = 454
          Top = 122
          Width = 107
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'fuente'
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
          TabOrder = 4
        end
        object edgiro: TRzDBEdit
          Left = 37
          Top = 122
          Width = 118
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'giro'
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
          TabOrder = 5
        end
        object edcategoria: TRzDBEdit
          Left = 224
          Top = 122
          Width = 169
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'Categoria'
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
          TabOrder = 6
        end
        object edcalle: TRzDBEdit
          Left = 435
          Top = 34
          Width = 214
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'dir'
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
          TabOrder = 7
        end
        object ednumero: TRzDBEdit
          Left = 721
          Top = 34
          Width = 56
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'numero'
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
          TabOrder = 8
        end
        object edciudad: TRzDBEdit
          Left = 59
          Top = 58
          Width = 110
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'ciudad'
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
          TabOrder = 9
        end
        object edestado: TRzDBEdit
          Left = 219
          Top = 58
          Width = 142
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'estado'
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
          TabOrder = 10
        end
        object edcolonia: TRzDBEdit
          Left = 419
          Top = 61
          Width = 182
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'colonia'
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
          TabOrder = 11
        end
        object edcodigo: TRzDBEdit
          Left = 705
          Top = 63
          Width = 70
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'cp'
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
          TabOrder = 12
        end
        object RzDBEdit12: TRzDBEdit
          Left = 192
          Top = 88
          Width = 75
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'alta'
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
          TabOrder = 13
        end
        object edsector: TRzDBEdit
          Left = 56
          Top = 87
          Width = 83
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'sector'
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
          TabOrder = 14
        end
        object edrazon: TRzDBEdit
          Left = 465
          Top = 14
          Width = 312
          Height = 22
          Hint = 'Nombre o Nombres del Prospecto'
          DataSource = dsoportunidades
          DataField = 'rsocial'
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
          TabOrder = 15
        end
        object edcvecte: TRzButtonEdit
          Left = 968
          Top = 124
          Width = 26
          Height = 22
          Hint = 'Buscar en el catalogo'
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
          TabOrder = 16
          Visible = False
          OnChange = edcvecteChange
          OnKeyPress = edcvecteKeyPress
          ButtonKind = bkFind
          ButtonShortCut = 119
          FlatButtons = True
          OnButtonClick = edcvecteButtonClick
        end
        object edcuenta: TRzDBEdit
          Left = 296
          Top = 14
          Width = 81
          Height = 22
          DataSource = dsoportunidades
          DataField = 'cuenta'
          Alignment = taRightJustify
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          FrameColor = clActiveCaption
          FrameHotTrack = True
          FrameSides = [sdBottom]
          FrameVisible = True
          ParentFont = False
          TabOrder = 17
        end
        object edtipopor: TRzEdit
          Left = 600
          Top = 122
          Width = 177
          Height = 22
          CharCase = ecUpperCase
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
          TabOrder = 18
        end
      end
      object edNumCotizacion: TRzButtonEdit
        Left = 11
        Top = 30
        Width = 101
        Height = 22
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
        TabOrder = 3
        OnChange = edNumCotizacionChange
        OnKeyPress = edNumCotizacionKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edNumCotizacionButtonClick
      end
      object edNumOpor: TRzButtonEdit
        Left = 118
        Top = 76
        Width = 97
        Height = 22
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
        TabOrder = 4
        OnChange = edNumOporChange
        OnKeyPress = edNumOporKeyPress
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edNumOporButtonClick
      end
      object btnpasar: TRzBitBtn
        Left = 856
        Top = 16
        Width = 145
        Height = 41
        Caption = 'Pasar a Pedido'
        Enabled = False
        HotTrack = True
        TabOrder = 5
        OnClick = btnpasarClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000520B0000520B00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909E8E8
          E809090909E8E8E8E8E881818181E8E8E881818181E8E8E8E8E80910101009E8
          E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E8E80910101009
          E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E8E809101010
          09E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E8E8091010
          1009E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E8E80910
          101009E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E80910
          101009E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8091010
          1009E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E809101010
          09E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E80910101009
          E8E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E80910101009E8
          E80910101009E8E8E8E881ACACAC81E8E881ACACAC81E8E8E8E809090909E8E8
          E809090909E8E8E8E8E881818181E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object tspresupuesto: TRzTabSheet
      Color = clWhite
      Caption = '&Presupuesto'
      inline fpres: TFrame1
        Left = 4
        Top = 0
        Width = 1000
        Height = 529
        Color = clWhite
        ParentColor = False
        TabOrder = 0
        inherited btnecon: TRzBitBtn
          OnClick = fpresbtneconClick
        end
        inherited btnbas: TRzBitBtn
          OnClick = fpresbtnbasClick
        end
        inherited btn100: TRzBitBtn
          OnClick = fpresbtn100Click
        end
        inherited btnimp3: TRzBitBtn
          OnClick = fpresbtnimp3Click
        end
        inherited Ptotales: TRzPanel
          Left = 736
          Width = 233
          Height = 441
          DesignSize = (
            233
            441)
          inherited lbtipo: TRzLabel
            Left = 19
            Top = 392
          end
          inherited RzLabel5: TRzLabel
            Top = 376
          end
          inherited Label15: TLabel
            Top = 192
          end
          inherited RzLabel4: TRzLabel
            Top = 160
          end
        end
        inherited pnlpresup: TRzPanel
          inherited btnsave: TRzBitBtn
            OnClick = fpresbtnsaveClick
          end
        end
        inherited ppaquete: TRzPanel
          Left = 720
          Enabled = False
          inherited RzLabel1: TRzLabel
            Enabled = False
          end
          inherited cbpaquetes: TRzComboBox
            Enabled = False
          end
        end
        inherited btnenviar: TRzBitBtn
          OnClick = fpresRzBitBtn1Click
        end
      end
    end
    object tsPagos: TRzTabSheet
      Color = clWhite
      Caption = 'Calculo de Pagos'
      object RzLabel10: TRzLabel
        Left = 237
        Top = 8
        Width = 35
        Height = 16
        Caption = 'Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object rgTipoSis: TRzRadioGroup
        Left = 0
        Top = 1
        Width = 193
        Height = 80
        Caption = 'Seleccione tipo de Sistema'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemHotTrack = True
        Items.Strings = (
          'Economico'
          'Basico'
          '100%')
        ParentFont = False
        TabOrder = 0
        OnClick = rgTipoSisClick
      end
      object edTotFinal: TRzNumericEdit
        Left = 228
        Top = 28
        Width = 57
        Height = 21
        Enabled = False
        FrameController = DMAccesos.frmctr
        TabOrder = 1
        OnKeyPress = edTotFinalKeyPress
        DisplayFormat = ',0;(,0)'
      end
      object btnimprimir: TRzBitBtn
        Left = 216
        Top = 56
        Width = 81
        Caption = '&Imprimir'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
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
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 564
    Width = 1017
    Height = 48
    Align = alBottom
    BorderColor = clWhite
    BorderShadow = clWhite
    Color = clWhite
    TabOrder = 1
    object btnalta: TRzBitBtn
      Left = 0
      Top = 1
      Width = 129
      Height = 40
      Hint = 'Dar de Alta un Pedido'
      ModalResult = 1
      Caption = '&Alta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      ImageIndex = 5
      NumGlyphs = 2
    end
    object btnborrar: TRzBitBtn
      Left = 400
      Top = 2
      Width = 121
      Height = 39
      Hint = 'Elimina/Cancela el pedido actual'
      ModalResult = 1
      Caption = '&Borrar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = False
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
      Left = 136
      Top = 1
      Width = 129
      Height = 40
      Hint = 'Editar los datos del Pedido Actual'
      ModalResult = 1
      Caption = '&Editar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
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
      NumGlyphs = 2
    end
    object btncancelar: TRzBitBtn
      Left = 272
      Top = 2
      Width = 121
      Height = 39
      Hint = 'Cerrar esta Pantalla'
      Caption = '&Cerrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 3
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
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 673
    Top = 364
  end
  object sqloportunidades: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT '
      '  oportunidades.idoportunidad,oportunidades.rsocial,'
      
        '  concat(oportunidades.nombre, '#39' '#39', oportunidades.apaterno, '#39' '#39',' +
        ' oportunidades.amaterno) AS nombre,'
      '  oportunidades.cuenta,'
      '  oportunidades.dir,'
      '  oportunidades.numero,'
      '  oportunidades.ciudad,'
      '  oportunidades.estado,'
      '  oportunidades.cp,'
      '  oportunidades.alta,'
      '  oportunidades.entre,'
      '  colonias.nombre AS colonia,'
      '  origen.nombre AS origen,'
      '  fuentes.nombre AS fuente,'
      '  giros.nombre AS giro,'
      '  categorias.nombre AS Categoria,'
      '  sectores.nombre AS sector,'
      '  estatus_eventos.nombre AS estatus,'
      '  agenda_vendedores.idvendedor'
      'FROM'
      '  oportunidades'
      
        '  LEFT OUTER JOIN colonias ON (oportunidades.idcol = colonias.id' +
        'col)'
      
        '  LEFT OUTER JOIN origen ON (oportunidades.idorigen = origen.ido' +
        'rigen)'
      
        '  LEFT OUTER JOIN fuentes ON (oportunidades.idfuente = fuentes.i' +
        'dfuente)'
      '  LEFT OUTER JOIN giros ON (oportunidades.idgiro = giros.idgiro)'
      
        '  LEFT OUTER JOIN categorias ON (oportunidades.idcategoria = cat' +
        'egorias.idcategoria)'
      
        '  LEFT OUTER JOIN col_sector ON (oportunidades.idcol = col_secto' +
        'r.idcol)'
      
        '  LEFT OUTER JOIN sectores ON (col_sector.idsector = sectores.id' +
        'sector)'
      
        '  left JOIN agenda_vendedores ON (oportunidades.idoportunidad = ' +
        'agenda_vendedores.idoportunidad)'
      
        '  left JOIN estatus_eventos ON (agenda_vendedores.idestatus = es' +
        'tatus_eventos.idestatus)'
      
        '  left JOIN actividades_vendedores ON (agenda_vendedores.idevent' +
        'o = actividades_vendedores.idevento)'
      
        '  left JOIN tipos_actividades ON (actividades_vendedores.idtipo_' +
        'actividad = tipos_actividades.idtipo_actividad)'
      'WHERE'
      '  (oportunidades.idoportunidad = :idoportunidad) AND '
      '  (tipos_actividades.nombre = '#39'PRESUPUESTO'#39')'
      ''
      '')
    ReadOnly = True
    FetchAll = True
    Left = 600
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idoportunidad'
      end>
  end
  object dsoportunidades: TDataSource
    DataSet = sqloportunidades
    Left = 520
    Top = 368
  end
  object sqlclientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT clientes.idfact,clientes.precio,'
      
        '  clientes.idcliente,concat(ifnull(clientes.nombre,'#39' '#39'),'#39' '#39',ifnu' +
        'll(clientes.apaterno,'#39' '#39'),'#39' '#39',ifnull(clientes.amaterno,'#39' '#39')) as ' +
        'nombre,'
      
        '  if (ClientesFact.rsocial is null or ClientesFact.rsocial='#39#39',co' +
        'ncat(ifnull(ClientesFact.nombre,'#39#39'),'#39' '#39',ifnull(ClientesFact.apat' +
        'erno,'#39#39'),'#39' '#39',ifnull(ClientesFact.amaterno,'#39#39')) ,ClientesFact.rso' +
        'cial) as rsocial,'
      
        '  clientes.dir,clientes.numero,clientes.ciudad,clientes.estado,c' +
        'olonias.nombre AS Colonia,colonias.cp,sectores.nombre AS Sector,' +
        'clientes.st_date as alta,clientes.refs as entre,clientes.alarm, ' +
        'origen.nombre AS Origen, clientes.idcliente as cuenta,'
      
        '  fuentes.nombre AS Fuente,giros.nombre AS Giro,categorias.nombr' +
        'e AS Categoria,clientes.idvendedor, if(clientes.estatus=0,'#39'Inact' +
        'ivo'#39',if(clientes.estatus=1,'#39'Activo'#39',if(clientes.estatus=2,'#39'Por R' +
        'evisar'#39','#39'Desconocido'#39'))) as estatus'
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
    Left = 448
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcliente'
      end>
  end
end
