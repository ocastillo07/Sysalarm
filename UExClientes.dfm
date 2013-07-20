object frmExClientes: TfrmExClientes
  Left = 233
  Top = 161
  Width = 989
  Height = 643
  ActiveControl = edclave
  Caption = 'Datos del Ex - Cliente'
  Color = clWhite
  TransparentColor = True
  TransparentColorValue = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  PopupMenu = ppmopciones
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblclave: TRzLabel
    Left = 10
    Top = 12
    Width = 37
    Height = 13
    Caption = 'Clave:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel29: TRzLabel
    Left = 144
    Top = 15
    Width = 74
    Height = 13
    Caption = 'No ExCliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object gbclientes: TGroupBox
    Left = 8
    Top = 31
    Width = 961
    Height = 516
    Caption = 'Datos de Instalacion del Ex - Cliente '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object RzLabel2: TRzLabel
      Left = 194
      Top = 53
      Width = 40
      Height = 13
      Caption = 'Numero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcp: TRzLabel
      Left = 5
      Top = 95
      Width = 67
      Height = 13
      Caption = 'C'#243'digo postal:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcalle: TRzLabel
      Left = 7
      Top = 57
      Width = 26
      Height = 13
      Caption = 'Calle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblciudad: TRzLabel
      Left = 561
      Top = 55
      Width = 36
      Height = 13
      Caption = 'Ciudad:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblestado: TRzLabel
      Left = 716
      Top = 55
      Width = 36
      Height = 13
      Caption = 'Estado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcolonia: TRzLabel
      Left = 272
      Top = 57
      Width = 38
      Height = 13
      Caption = 'Colonia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblalta: TRzLabel
      Left = 729
      Top = 136
      Width = 21
      Height = 13
      Caption = 'Alta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblamaterno: TRzLabel
      Left = 840
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Apellido Materno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblapaterno: TRzLabel
      Left = 722
      Top = 19
      Width = 80
      Height = 13
      Caption = 'Apellido Paterno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblrazon: TRzLabel
      Left = 251
      Top = 19
      Width = 66
      Height = 13
      Caption = 'Raz'#243'n Social:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcomentarios: TRzLabel
      Left = 5
      Top = 442
      Width = 86
      Height = 13
      Caption = 'Comentarios:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      Rotation = roFlat
    end
    object lblnombre: TRzLabel
      Left = 515
      Top = 19
      Width = 51
      Height = 13
      Caption = 'Nombre(s):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 152
      Top = 174
      Width = 51
      Height = 13
      Caption = 'Ubicacion:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 142
      Top = 93
      Width = 89
      Height = 13
      Caption = 'Correo electr'#243'nico:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel6: TRzLabel
      Left = 261
      Top = 135
      Width = 75
      Height = 13
      Caption = 'Tipo de Control:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel1: TRzLabel
      Left = 5
      Top = 19
      Width = 24
      Height = 13
      Caption = 'RFC:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 131
      Top = 19
      Width = 33
      Height = 13
      Caption = 'CURP:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel9: TRzLabel
      Left = 78
      Top = 95
      Width = 34
      Height = 13
      Caption = 'Sector:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel10: TRzLabel
      Left = 199
      Top = 134
      Width = 57
      Height = 13
      Caption = 'Tipo Precio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel11: TRzLabel
      Left = 829
      Top = 95
      Width = 71
      Height = 13
      Caption = 'Contrase'#241'a:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
      Rotation = roFlat
    end
    object lblgiro: TRzLabel
      Left = 648
      Top = 93
      Width = 109
      Height = 13
      Caption = 'Giro de la Oportunidad:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblcategoria: TRzLabel
      Left = 26
      Top = 136
      Width = 135
      Height = 13
      Caption = 'Categoria de la Oportunidad:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblfuente: TRzLabel
      Left = 496
      Top = 96
      Width = 36
      Height = 13
      Caption = 'Fuente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblorigen: TRzLabel
      Left = 333
      Top = 94
      Width = 34
      Height = 13
      Caption = 'Origen:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 423
      Top = 136
      Width = 49
      Height = 13
      Caption = 'Vendedor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel7: TRzLabel
      Left = 585
      Top = 136
      Width = 36
      Height = 13
      Caption = 'Credito:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel12: TRzLabel
      Left = 689
      Top = 136
      Width = 29
      Height = 13
      Caption = 'Plazo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel13: TRzLabel
      Left = 5
      Top = 177
      Width = 38
      Height = 13
      Hint = 'Estatus del cliente actual'
      Caption = 'Estatus:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblCantBloq: TRzLabel
      Left = 558
      Top = 245
      Width = 107
      Height = 13
      Hint = 'Estatus del cliente actual'
      Caption = 'Cantidad de Bloqueos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblbloqueado: TRzLabel
      Left = 559
      Top = 261
      Width = 81
      Height = 13
      Hint = 'Estatus del cliente actual'
      Caption = 'Esta Bloqueado?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblFecBloq: TRzLabel
      Left = 682
      Top = 265
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel23: TRzLabel
      Left = 8
      Top = 369
      Width = 92
      Height = 13
      Caption = 'Nota de Ubicacion:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbUltMod: TRzLabel
      Left = 560
      Top = 276
      Width = 97
      Height = 13
      Hint = 'Estatus del cliente actual'
      Caption = 'Ultima Mod Estatus :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbltelefono: TRzLabel
      Left = 559
      Top = 319
      Width = 71
      Height = 16
      Caption = 'Telefonos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbcargosautomaticos: TRzLabel
      Left = 561
      Top = 291
      Width = 5
      Height = 13
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblUltServicio: TRzLabel
      Left = 559
      Top = 303
      Width = 114
      Height = 16
      Caption = 'Ultimo Servicio :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbltravelers: TRzLabel
      Left = 559
      Top = 335
      Width = 68
      Height = 16
      Caption = 'Travelers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblservicios: TRzLabel
      Left = 559
      Top = 351
      Width = 66
      Height = 16
      Caption = 'Servicios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblinstalaciones: TRzLabel
      Left = 559
      Top = 367
      Width = 93
      Height = 16
      Caption = 'Instalaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel25: TRzLabel
      Left = 657
      Top = 176
      Width = 100
      Height = 13
      Caption = 'Ult. Envio de Trafico:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel26: TRzLabel
      Left = 568
      Top = 400
      Width = 5
      Height = 13
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbAdeudos: TRzLabel
      Left = 559
      Top = 383
      Width = 63
      Height = 16
      Caption = 'Adeudos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel24: TRzLabel
      Left = 503
      Top = 178
      Width = 133
      Height = 13
      Caption = 'Protocolo de Comunicaci'#243'n:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel30: TRzLabel
      Left = 816
      Top = 136
      Width = 62
      Height = 13
      Caption = 'Cancelacion:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edciudad: TRzDBEdit
      Left = 559
      Top = 69
      Width = 150
      Height = 21
      Hint = 'Ciudad donde se encuentra ubicado'
      DataSource = DSclientes
      DataField = 'ciudad'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 9
      OnEnter = edciudadEnter
      OnKeyPress = edmskrfcKeyPress
    end
    object edcalle: TRzDBEdit
      Left = 6
      Top = 69
      Width = 181
      Height = 21
      Hint = 'Calle donde vive el Cliente'
      DataSource = DSclientes
      DataField = 'dir'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 6
      OnKeyPress = edmskrfcKeyPress
    end
    object edestado: TRzDBEdit
      Left = 713
      Top = 69
      Width = 143
      Height = 21
      Hint = 'Estado donde esta ubicado'
      DataSource = DSclientes
      DataField = 'estado'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 10
      OnEnter = edestadoEnter
      OnKeyPress = edmskrfcKeyPress
    end
    object dtalta: TRzDBDateTimeEdit
      Left = 727
      Top = 150
      Width = 84
      Height = 21
      Hint = 'Fecha de la alta del cliente'
      DataSource = DSclientes
      DataField = 'st_date'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 27
      OnClick = dtaltaClick
      OnKeyPress = edmskrfcKeyPress
      EditType = etDate
      FlatButtons = True
    end
    object edamaterno: TRzDBEdit
      Left = 838
      Top = 31
      Width = 115
      Height = 21
      Hint = 'Apellido Materno'
      DataSource = DSclientes
      DataField = 'amaterno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 5
      OnChange = ednombreChange
      OnKeyPress = edmskrfcKeyPress
    end
    object edapaterno: TRzDBEdit
      Left = 720
      Top = 32
      Width = 113
      Height = 21
      Hint = 'Apellido Paterno'
      DataSource = DSclientes
      DataField = 'apaterno'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 4
      OnChange = ednombreChange
      OnKeyPress = edmskrfcKeyPress
    end
    object ednombre: TRzDBEdit
      Left = 512
      Top = 32
      Width = 201
      Height = 21
      Hint = 'Nombre del Cliente'
      DataSource = DSclientes
      DataField = 'nombre'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 3
      OnChange = ednombreChange
      OnKeyPress = edmskrfcKeyPress
    end
    object edrazon: TRzDBEdit
      Left = 251
      Top = 31
      Width = 254
      Height = 21
      Hint = 'Razon Social del Cliente'
      DataSource = DSclientes
      DataField = 'rsocial'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 2
      OnChange = edrazonChange
      OnKeyPress = edmskrfcKeyPress
    end
    object recomentarios: TRzDBRichEdit
      Left = 3
      Top = 458
      Width = 542
      Height = 54
      Hint = 'Comentarios Extras'
      DataField = 'comentario'
      DataSource = DSclientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 30
      OnEnter = recomentariosEnter
      OnExit = recomentariosExit
      OnKeyPress = edmskrfcKeyPress
      FrameColor = clActiveCaption
      FrameVisible = True
    end
    object ednumero: TRzDBEdit
      Left = 193
      Top = 69
      Width = 72
      Height = 21
      Hint = 'Numero del local'
      DataSource = DSclientes
      DataField = 'numero'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 7
      OnKeyPress = edmskrfcKeyPress
    end
    object edmskrfc: TcxDBMaskEdit
      Left = 4
      Top = 32
      Width = 124
      Height = 21
      Hint = 'Registro Federal de Contribuyentes'
      DataBinding.DataField = 'rfc'
      DataBinding.DataSource = DSclientes
      ParentFont = False
      Properties.AlwaysShowBlanksAndLiterals = True
      Properties.BeepOnError = True
      Properties.CharCase = ecUpperCase
      Properties.IgnoreMaskBlank = True
      Properties.EditMask = 'cLLL-000000-AAA'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Properties.OnValidate = edmskrfcPropertiesValidate
      Style.BorderColor = clActiveCaption
      Style.BorderStyle = ebsUltraFlat
      Style.Edges = [bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 0
      OnExit = edmskrfcExit
      OnKeyPress = edmskrfcKeyPress
    end
    object EDMAIL: TRzDBEdit
      Left = 142
      Top = 110
      Width = 167
      Height = 21
      Hint = 'Direccion de Correo Electronico'
      DataSource = DSclientes
      DataField = 'email'
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 13
      OnKeyPress = edmskrfcKeyPress
    end
    object cbocolonias: TRzDBLookupComboBox
      Left = 269
      Top = 69
      Width = 285
      Height = 21
      Hint = 'Colonia donde esta ubicado'
      Ctl3D = False
      DataField = 'idcol'
      DataSource = DSclientes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'idcol'
      ListField = 'nombre'
      ListSource = DScolonias
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      OnClick = cbocoloniasClick
      OnKeyPress = cbocoloniasKeyPress
      FrameController = DMAccesos.frmctr
    end
    object EDcp: TRzDBEdit
      Left = 3
      Top = 110
      Width = 64
      Height = 21
      Hint = 'C'#243'digo posta del Cliente'
      DataSource = DSclientes
      DataField = 'cp'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 11
      OnKeyPress = edmskrfcKeyPress
    end
    object EDsector: TRzDBEdit
      Left = 73
      Top = 110
      Width = 67
      Height = 21
      Hint = 'Sector del domicilio'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 12
      OnKeyPress = edmskrfcKeyPress
    end
    object edmskcurp: TcxDBMaskEdit
      Left = 132
      Top = 32
      Width = 117
      Height = 21
      Hint = 'Clave Unica de Registro de Poblacion'
      DataBinding.DataField = 'curp'
      DataBinding.DataSource = DSclientes
      ParentFont = False
      Properties.BeepOnError = True
      Properties.CharCase = ecUpperCase
      Properties.EditMask = 'LLLL000000LLLL0'
      Properties.MaxLength = 0
      Properties.ReadOnly = False
      Properties.ValidateOnEnter = False
      Style.BorderColor = clActiveCaption
      Style.BorderStyle = ebsUltraFlat
      Style.Edges = [bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      TabOrder = 1
      OnKeyPress = edmskrfcKeyPress
    end
    object cboprecio: TRzDBComboBox
      Left = 200
      Top = 149
      Width = 57
      Height = 21
      DataField = 'precio'
      DataSource = DSclientes
      CharCase = ecUpperCase
      Ctl3D = False
      FlatButtons = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 22
      OnKeyPress = cboprecioKeyPress
      Items.Strings = (
        'A'
        'B'
        'C'
        'D')
    end
    object EDCONTRASENA: TRzDBEdit
      Left = 825
      Top = 110
      Width = 96
      Height = 21
      Hint = 'Contrase'#241'a del Cliente'
      DataSource = DSclientes
      DataField = 'password'
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 28
      OnKeyPress = edmskrfcKeyPress
    end
    object ednum_giro: TRzDBNumericEdit
      Left = 635
      Top = 110
      Width = 33
      Height = 21
      Hint = 'Numero del Tipo'
      DataSource = DSclientes
      DataField = 'idgiro'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 18
      OnExit = ednum_giroExit
      OnKeyPress = ednum_giroKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object cbonom_giro: TRzComboBox
      Left = 671
      Top = 110
      Width = 152
      Height = 21
      Hint = 'Nombre del Tipo'
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FlatButtons = True
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 19
      OnExit = cbonom_giroExit
      OnKeyPress = cbonom_giroKeyPress
      OnSelect = cbonom_giroSelect
    end
    object ednum_categoria: TRzDBNumericEdit
      Left = 8
      Top = 150
      Width = 26
      Height = 21
      Hint = 'Numero del Tipo'
      DataSource = DSclientes
      DataField = 'idcategoria'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 20
      OnExit = ednum_categoriaExit
      OnKeyPress = ednum_categoriaKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object cbonom_categoria: TRzComboBox
      Left = 38
      Top = 150
      Width = 158
      Height = 21
      Hint = 'Nombre del Tipo'
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FlatButtons = True
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 21
      OnExit = cbonom_categoriaExit
      OnKeyPress = cbonom_categoriaKeyPress
      OnSelect = cbonom_categoriaSelect
    end
    object cboalarma: TRzDBComboBox
      Left = 261
      Top = 149
      Width = 121
      Height = 21
      Hint = 'Escoge el tipo de alarma'
      DataField = 'alarm'
      DataSource = DSclientes
      Ctl3D = False
      FlatButtons = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 34
      OnDropDown = cboalarmaDropDown
      OnKeyPress = cboalarmaKeyPress
      OnSelect = cboalarmaSelect
    end
    object ednum_fuente: TRzDBNumericEdit
      Left = 475
      Top = 110
      Width = 33
      Height = 21
      Hint = 'Numero de la Fuente'
      DataSource = DSclientes
      DataField = 'idfuente'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 16
      OnExit = ednum_fuenteExit
      OnKeyPress = ednum_fuenteKeyPress
      DisplayFormat = ',0;(,0)'
    end
    object cbonom_fuente: TRzComboBox
      Left = 511
      Top = 110
      Width = 122
      Height = 21
      Hint = 'Nombre de la Fuente'
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FlatButtons = True
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 17
      OnDropDown = cbonom_fuenteDropDown
      OnExit = cbonom_fuenteExit
      OnKeyPress = cbonom_fuenteKeyPress
      OnSelect = cbonom_fuenteSelect
    end
    object cbonom_origen: TRzComboBox
      Left = 348
      Top = 110
      Width = 122
      Height = 21
      Hint = 'Nombre del origen'
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FlatButtons = True
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 15
      OnDropDown = cbonom_origenDropDown
      OnExit = cbonom_origenExit
      OnKeyPress = cbonom_origenKeyPress
      OnSelect = cbonom_origenSelect
    end
    object edcredito: TRzDBNumericEdit
      Left = 580
      Top = 150
      Width = 104
      Height = 21
      Hint = 'Total de Credito Asignado'
      DataSource = DSclientes
      DataField = 'credito'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 25
      OnKeyPress = edcreditoKeyPress
      IntegersOnly = False
      DisplayFormat = ',0;(,0)'
    end
    object edplazo: TRzDBEdit
      Left = 689
      Top = 150
      Width = 32
      Height = 21
      Hint = 'Dias de Credito'
      DataSource = DSclientes
      DataField = 'PlazoCredito'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 26
      OnKeyPress = edmskrfcKeyPress
    end
    object cboestatus: TRzComboBox
      Left = 3
      Top = 190
      Width = 145
      Height = 21
      Hint = 'Estatus del cliente actual'
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ItemHeight = 13
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 31
      Items.Strings = (
        'INACTIVO'
        'ACTIVO'
        'POR REVISAR')
    end
    object ednum_origen: TRzDBEdit
      Left = 312
      Top = 110
      Width = 33
      Height = 21
      DataSource = DSclientes
      DataField = 'idorigen'
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FrameController = DMAccesos.frmctr
      ParentFont = False
      TabOrder = 14
      OnExit = ednum_origenExit
      OnKeyPress = ednum_origenKeyPress
    end
    object gbcontrato: TRzGroupBox
      Left = 2
      Top = 242
      Width = 543
      Height = 57
      Hint = 'Datos del Tipo de Contrato del Cliente'
      Align = alCustom
      Caption = 'Datos del Contrato'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 29
      object RzLabel14: TRzLabel
        Left = 3
        Top = 15
        Width = 79
        Height = 14
        Caption = 'Tipo de Contrato'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel15: TRzLabel
        Left = 285
        Top = 13
        Width = 32
        Height = 14
        Caption = 'Monto:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel16: TRzLabel
        Left = 375
        Top = 13
        Width = 34
        Height = 14
        Caption = 'Desde:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel17: TRzLabel
        Left = 461
        Top = 13
        Width = 31
        Height = 14
        Caption = 'Hasta:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel21: TRzLabel
        Left = 99
        Top = 16
        Width = 40
        Height = 14
        Caption = 'Nombre:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edmontocont: TRzDBEdit
        Left = 285
        Top = 29
        Width = 82
        Height = 21
        Hint = 'Costo del contrato del cliente sin IVA'
        DataSource = DSclientes
        DataField = 'MontoCont'
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyPress = edmontocontKeyPress
      end
      object dtpdesdecont: TRzDBDateTimePicker
        Left = 371
        Top = 29
        Width = 82
        Height = 21
        Hint = 'Fecha de Inicio del Contrato'
        Date = 39165.470582500000000000
        Time = 39165.470582500000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        FrameController = DMAccesos.frmctr
        DataField = 'DesdeCont'
        DataSource = DSclientes
      end
      object dtphastacont: TRzDBDateTimePicker
        Left = 455
        Top = 29
        Width = 83
        Height = 21
        Hint = 'Fecha de termino de Contrato'
        Date = 39165.470582500000000000
        Time = 39165.470582500000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        FrameController = DMAccesos.frmctr
        DataField = 'HastaCont'
        DataSource = DSclientes
      end
      object edTipoCont: TRzButtonEdit
        Left = 8
        Top = 29
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        FrameController = DMAccesos.frmctr
        TabOrder = 0
        OnExit = edTipoContExit
        OnKeyPress = edTipoContKeyPress
        ButtonHint = 'Listar los Tipos de Contrato'
        ButtonKind = bkFind
        ButtonShortCut = 119
        OnButtonClick = edTipoContButtonClick
      end
      object edNomContrato: TRzEdit
        Left = 94
        Top = 29
        Width = 187
        Height = 21
        FrameController = DMAccesos.frmctr
        TabOrder = 1
      end
    end
    object gbabogado: TRzGroupBox
      Left = 3
      Top = 299
      Width = 542
      Height = 55
      Hint = 'Asignaci'#243'n de Casos al Abogado'
      Align = alCustom
      Caption = 'Asignaci'#243'n de Abogado'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 35
      object lblidabogado: TRzLabel
        Left = 11
        Top = 15
        Width = 44
        Height = 14
        Caption = 'Abogado'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel18: TRzLabel
        Left = 263
        Top = 15
        Width = 64
        Height = 14
        Caption = 'No. Demanda'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel19: TRzLabel
        Left = 443
        Top = 15
        Width = 33
        Height = 14
        Caption = 'Fecha:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel20: TRzLabel
        Left = 351
        Top = 16
        Width = 64
        Height = 14
        Caption = 'No. Embargo:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel22: TRzLabel
        Left = 79
        Top = 16
        Width = 40
        Height = 14
        Caption = 'Nombre:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edNumDemanda: TRzDBEdit
        Left = 263
        Top = 29
        Width = 82
        Height = 21
        Hint = 'Numero de Demanda'
        DataField = 'NumDemanda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edNumDemandaKeyPress
      end
      object dtpfechaabo: TRzDBDateTimePicker
        Left = 440
        Top = 29
        Width = 97
        Height = 21
        Hint = 'Fecha de asignacion de abogado'
        Date = 39165.470582500000000000
        Time = 39165.470582500000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        FrameController = DMAccesos.frmctr
        DataField = 'FechaAbo'
        DataSource = DSclientes
      end
      object edcveabogado: TRzButtonEdit
        Left = 9
        Top = 29
        Width = 64
        Height = 21
        Hint = 'Clave del abogado'
        FrameController = DMAccesos.frmctr
        TabOrder = 0
        OnExit = edcveabogadoExit
        OnKeyPress = edcveabogadoKeyPress
        ButtonHint = 'Listar los Tipos de Contrato'
        ButtonKind = bkFind
        ButtonShortCut = 119
        OnButtonClick = edcveabogadoButtonClick
      end
      object edNumEmbargo: TRzDBEdit
        Left = 351
        Top = 29
        Width = 82
        Height = 21
        Hint = 'Numero de Embargo'
        DataSource = DSclientes
        DataField = 'NumEmbargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FrameController = DMAccesos.frmctr
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyPress = edNumEmbargoKeyPress
      end
      object edNomAbogado: TRzEdit
        Left = 74
        Top = 29
        Width = 187
        Height = 21
        FrameController = DMAccesos.frmctr
        TabOrder = 4
      end
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 3
      Top = 218
      Width = 201
      Height = 17
      DataField = 'deducible'
      DataSource = DSclientes
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Deducible (Si se le desglozara el iva)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      TabOrder = 36
    end
    object edCveVend: TRzEdit
      Left = 387
      Top = 149
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      FrameController = DMAccesos.frmctr
      TabOrder = 23
      OnChange = edCveVendChange
      OnKeyPress = edCveVendKeyPress
    end
    object CboVendedor: TRzComboBox
      Left = 440
      Top = 148
      Width = 137
      Height = 22
      Hint = 'Nombre del Vendedor'
      Ctl3D = False
      DisabledColor = clWhite
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
      OnChange = CboVendedorChange
      OnKeyPress = CboVendedorKeyPress
      OnSelect = CboVendedorSelect
    end
    object edReferencias: TRzDBEdit
      Left = 153
      Top = 190
      Width = 336
      Height = 21
      Hint = 'Entre que calles vive el cliente'
      DataSource = DSclientes
      DataField = 'refs'
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 32
      OnKeyPress = edmskrfcKeyPress
    end
    object RzDBRichEdit1: TRzDBRichEdit
      Left = 4
      Top = 386
      Width = 541
      Height = 54
      DataField = 'NotaUbicacion'
      DataSource = DSclientes
      ScrollBars = ssBoth
      TabOrder = 33
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotColor = clFuchsia
      FrameVisible = True
    end
    object chkonline: TRzDBCheckBox
      Left = 202
      Top = 218
      Width = 215
      Height = 17
      Hint = 'Es Campo indica si el usuario esta logiado en el sistema'
      DataField = 'sendmail'
      DataSource = DSclientes
      NullAsUnchecked = False
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Enviar Correo en Activaci'#243'n P'#243'sitiva'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 37
    end
    object RzDBCheckBox2: TRzDBCheckBox
      Left = 402
      Top = 218
      Width = 95
      Height = 17
      Hint = 'Es Campo indica si el usuario esta logiado en el sistema'
      DataField = 'NoPatrulla'
      DataSource = DSclientes
      NullAsUnchecked = False
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Sin Patrullaje'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 38
    end
    object RzDBCheckBox3: TRzDBCheckBox
      Left = 490
      Top = 218
      Width = 111
      Height = 17
      Hint = 'Es Campo indica si el usuario esta logiado en el sistema'
      DataField = 'ClienteAlarmex'
      DataSource = DSclientes
      NullAsUnchecked = False
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Cliente Alarmex'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 39
    end
    object tbherramientas: TToolBar
      Left = 304
      Top = 355
      Width = 178
      Height = 29
      Hint = 'Barra de Herramientas'
      Align = alNone
      AutoSize = True
      ButtonHeight = 23
      ButtonWidth = 29
      Caption = 'tbherramientas'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = DMAccesos.iledicion
      TabOrder = 40
      object btncopy: TToolButton
        Left = 0
        Top = 2
        Action = frmprincipal.EditCopy1
      end
      object btncut: TToolButton
        Left = 29
        Top = 2
        Action = frmprincipal.EditCut1
      end
      object btnpaste: TToolButton
        Left = 58
        Top = 2
        Action = frmprincipal.EditPaste1
      end
      object btndelete: TToolButton
        Left = 87
        Top = 2
        Action = frmprincipal.EditDelete1
      end
      object btnundo: TToolButton
        Left = 116
        Top = 2
        Action = frmprincipal.EditUndo1
      end
      object btnfuentes: TToolButton
        Left = 145
        Top = 2
        Hint = 'Fuentes'
        Caption = '&Fuentes'
        Enabled = False
        ImageIndex = 19
        OnClick = btnfuentesClick
      end
    end
    object RzDBCheckBox4: TRzDBCheckBox
      Left = 594
      Top = 218
      Width = 191
      Height = 17
      Hint = 'Es Campo indica si el usuario esta logiado en el sistema'
      DataField = 'GrupoTrafico'
      DataSource = DSclientes
      NullAsUnchecked = False
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Agrupado en el Reporte de Trafico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 41
    end
    object RzDBCheckBox5: TRzDBCheckBox
      Left = 784
      Top = 218
      Width = 97
      Height = 15
      Hint = 'Aparecera en el reporte de no se'#241'ales recibidas'
      DataField = 'PruebaSema'
      DataSource = DSclientes
      NullAsUnchecked = False
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Reporte NSR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 42
    end
    object RzDBCheckBox6: TRzDBCheckBox
      Left = 808
      Top = 194
      Width = 113
      Height = 15
      Hint = 'Cuenta con Monitore de Aperturas y Cierres'
      DataField = 'idOpenClose'
      DataSource = DSclientes
      NullAsUnchecked = False
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Aperturas y Cierres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 43
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Left = 655
      Top = 190
      Width = 106
      Height = 21
      Hint = 'Ultima Fecha de Envio de Trafico por Email'
      DataSource = DSclientes
      DataField = 'ultfectraf'
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clSkyBlue
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 44
      OnClick = dtaltaClick
      OnKeyPress = edmskrfcKeyPress
      EditType = etDate
      FlatButtons = True
    end
    object Pweb: TRzGroupBox
      Left = 560
      Top = 424
      Width = 233
      Height = 65
      Caption = ' Login Pagina Web'
      Color = clWhite
      Enabled = False
      TabOrder = 45
      object RzLabel27: TRzLabel
        Left = 8
        Top = 24
        Width = 48
        Height = 13
        Caption = 'Usuario:'
        Enabled = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel28: TRzLabel
        Left = 8
        Top = 48
        Width = 55
        Height = 13
        Caption = 'Password'
        Enabled = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edusuarioweb: TRzDBEdit
        Left = 88
        Top = 16
        Width = 121
        Height = 21
        DataSource = DSclientes
        DataField = 'usuarioweb'
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 0
      end
      object edpasswordweb: TRzDBEdit
        Left = 88
        Top = 40
        Width = 121
        Height = 21
        DataSource = DSclientes
        DataField = 'passwordweb'
        CharCase = ecUpperCase
        DisabledColor = clWhite
        Enabled = False
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 1
      end
    end
    object cboprotocolos: TRzComboBox
      Left = 501
      Top = 190
      Width = 148
      Height = 22
      Hint = 'Protocolo que usara el control para comunicarse a la central'
      Ctl3D = False
      DisabledColor = clWhite
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 46
    end
    object DTBaja: TRzDBDateTimeEdit
      Left = 816
      Top = 152
      Width = 113
      Height = 21
      DataSource = DSclientes
      DataField = 'FechaCancelacion'
      DisabledColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      ParentFont = False
      TabOrder = 47
      EditType = etDate
      FlatButtons = True
    end
  end
  object navegador: TRzDBNavigator
    Left = 312
    Top = 0
    Width = 232
    Height = 28
    DataSource = DSclientes
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'Primer Cliente'
      'Anterior Cliente'
      'Siguiente Cliente'
      'Ultimo Cliente')
    TabOrder = 2
    OnClick = navegadorClick
    Color = clWhite
  end
  object edclave: TRzButtonEdit
    Left = 50
    Top = 5
    Width = 87
    Height = 24
    Hint = 'Buscar en el catalogo'
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameHotColor = clFuchsia
    FrameSides = [sdBottom]
    FrameVisible = True
    ParentFont = False
    TabOrder = 0
    OnChange = edclaveChange
    OnKeyPress = edclaveKeyPress
    OnKeyUp = FormKeyUp
    ButtonKind = bkFind
    ButtonShortCut = 119
    FlatButtons = True
    OnButtonClick = edclaveButtonClick
  end
  object btnzonas: TRzBitBtn
    Left = 584
    Top = 1
    Width = 81
    Caption = '&Zonas'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 3
    OnClick = btnzonasClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000E30E0000E30E00000001000000000000000000003300
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8121212
      12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E812181818
      1818121812121212E8E8E8E881E2E2E2E2E281E281818181E8E8E8E8121E1818
      1818181218121212E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E812181E18
      1818181812181212E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E8121E181E
      1818181818121812E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E8121E1E18
      1E18181818181212E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8128D1E1E
      181E181818181812E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8128D8D1E
      1E181E1818181812E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8121212
      12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btntrafico: TRzBitBtn
    Left = 544
    Top = 1
    Width = 33
    Caption = '&Trafico'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 4
    Visible = False
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
      0000E8E8E8E8E8E8E8E8E8E8E8E8E8E8DFDFE8E8E8E8E8E8E8E8E8E8E8E8E8DF
      0000DFE8E8E8E8E8E8E8E8E8E8E8E8DFDFDFDFE8E8E8E8E8E8E8E8E8E8E8DFD7
      0000DFE8E8E8E8E8E8E8E8E8E8E8DFD7DFDFDFE8E8E8E8E8E8E8E8E8E800D7D7
      00D7D7E8E8E8E8E8E8E8E8E8E8DFD7D7DFD7D7E8E8E8E8E8E8E8E8E80000D700
      00D7DFDFE8E8E8E8E8E8E8E8DFDFD7DFDFD7DFDFE8E8E8E8E8E8E8DF00000000
      00DF0000E8E8E8E8E87AE8DFDFDFDFDFDFDFDFDFE8E8E8E8E881DFD7D700D700
      00DE000000E8E8E87AA3DFD7D7DFD7DFDFDEDFDFDFE8E8E881ACDFD70000D7DF
      DED7DF00D7DFE87AA3CEDFD7DFDFD7DFDED7DFDFD7DFE881ACD7DF000000DF00
      00D700D7D7D77AA3CEE8DFDFDFDFDFDFDFD7DFD7D7D781ACD7E8E80000DF0000
      00000000D77AA3CEE8E8E8DFDFDFDFDFDFDFDFDFD781ACD7E8E8E800DEDE0000
      D70000007AA3CEE8E8E8E8DFDEDEDFDFD7DFDFDF81ACD7E8E8E8E8DFDED700D7
      D7D7007AA3CEE8E8E8E8E8DFDED7DFD7D7D7DF81ACD7E8E8E8E8E8E8DFDF0000
      D7D77AA3CEE8E8E8E8E8E8E8DFDFDFDFD7D781ACD7E8E8E8E8E8E8E8E8000000
      007AA3CEE8E8E8E8E8E8E8E8E8DFDFDFDF81ACD7E8E8E8E8E8E8E8E8E8E80000
      7AA3CEE8E8E8E8E8E8E8E8E8E8E8DFDF81ACD7E8E8E8E8E8E8E8E8E8E8E8E87A
      A3CEE8E8E8E8E8E8E8E8E8E8E8E8E881ACD7E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnservicios: TRzBitBtn
    Left = 666
    Top = 1
    Width = 87
    Caption = '&Servicios'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 5
    OnClick = btnserviciosClick
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
      0000E8E8E8E8E8E8E8E8E8E8E8E8E8E8DFDFE8E8E8E8E8E8E8E8E8E8E8E8E8DF
      0000DFE8E8E8E8E8E8E8E8E8E8E8E8DFDFDFDFE8E8E8E8E8E8E8E8E8E8E8DFD7
      0000DFE8E8E8E8E8E8E8E8E8E8E8DFD7DFDFDFE8E8E8E8E8E8E8E8E8E800D7D7
      00D7D7E8E8E8E8E8E8E8E8E8E8DFD7D7DFD7D7E8E8E8E8E8E8E8E8E80000D700
      00D7DFDFE8E8E8E8E8E8E8E8DFDFD7DFDFD7DFDFE8E8E8E8E8E8E8DF00000000
      00DF0000E8E8E8E8E87AE8DFDFDFDFDFDFDFDFDFE8E8E8E8E881DFD7D700D700
      00DE000000E8E8E87AA3DFD7D7DFD7DFDFDEDFDFDFE8E8E881ACDFD70000D7DF
      DED7DF00D7DFE87AA3CEDFD7DFDFD7DFDED7DFDFD7DFE881ACD7DF000000DF00
      00D700D7D7D77AA3CEE8DFDFDFDFDFDFDFD7DFD7D7D781ACD7E8E80000DF0000
      00000000D77AA3CEE8E8E8DFDFDFDFDFDFDFDFDFD781ACD7E8E8E800DEDE0000
      D70000007AA3CEE8E8E8E8DFDEDEDFDFD7DFDFDF81ACD7E8E8E8E8DFDED700D7
      D7D7007AA3CEE8E8E8E8E8DFDED7DFD7D7D7DF81ACD7E8E8E8E8E8E8DFDF0000
      D7D77AA3CEE8E8E8E8E8E8E8DFDFDFDFD7D781ACD7E8E8E8E8E8E8E8E8000000
      007AA3CEE8E8E8E8E8E8E8E8E8DFDFDFDF81ACD7E8E8E8E8E8E8E8E8E8E80000
      7AA3CEE8E8E8E8E8E8E8E8E8E8E8DFDF81ACD7E8E8E8E8E8E8E8E8E8E8E8E87A
      A3CEE8E8E8E8E8E8E8E8E8E8E8E8E881ACD7E8E8E8E8E8E8E8E8}
    ImageIndex = 19
    Images = DMAccesos.IBarraHerramientas
    NumGlyphs = 2
  end
  object btnnotas: TRzMenuButton
    Left = 873
    Top = 1
    Width = 88
    Hint = 'Notas ya sea de Bloqueo, Seguimiento, Ubicacion,Temporal'
    Caption = '&Notas'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    ParentFont = False
    TabOrder = 6
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8A3787878
      7878787878787878E8E8E8E8818181818181818181818181E8E8E8E8A3D5D5D5
      D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
      D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
      D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
      D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
      D5D5D5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
      D5ABD5D5D5D5D578E8E8E8E881ACACACACACACACACACAC81E8E8E8E8A3D5D5D5
      D556ABABD5D5D578E8E8E8E881ACACACAC56ACACACACAC81E8E8E8E8A3D5D5D5
      D5AB0505ABD5D578E8E8E8E881ACACACACAC5656ACACAC81E8E8E8E8A3A3A3A3
      A30505D705A3A3A3E8E8E8E881818181815656D756818181E8E8E8E8E8E8E8E8
      E8E80505E8E8E8E8E8E8E8E8E8E8E8E8E8E85656E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
    DropDownMenu = ppmnotas
  end
  object btnopciones: TRzMenuButton
    Left = 752
    Top = 1
    Width = 121
    Hint = 'Datos como Telefonos, Responsables,Datos Facturacion, etc.'
    Caption = 'Otros &Datos'
    Color = 16776176
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    ParentFont = False
    TabOrder = 7
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000620B0000620B00000001000000000000000000003300
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
      0000000000000000000000000000000000000000000000000000E8E8E8E8E809
      0910091009E8E8E8E8E8E8E8E8E8E88181AC81AC81E8E8E8E8E8E8E8E8E8E809
      1009100909E8E8E8E8E8E8E8E8E8E881AC81AC8181E8E8E8E8E8E8E8E8E8E809
      0910091009E8E8E8E8E8E8E8E8E8E88181AC81AC81E8E8E8E8E8E8E8E8E8E881
      0909090981E8E8E8E8E8E8E8E8E8E8818181818181E8E8E8E8E8E8E8E8E8E8E8
      81D7AD56E8E8E8E8E8E8E8E8E8E8E8E881D7AC81E8E8E8E8E8E8E8E8E8E8E8E8
      81D7AD56E8E8E8E8E8E8E8E8E8E8E8E881D7AC81E8E8E8E8E8E8E8E8E8E8E8E8
      81D7AD56E8E8E8E8E8E8E8E8E8E8E8E881D7AC81E8E8E8E8E8E8E8E8E8E8E8E8
      81D7AD56E8E8E8E8E8E8E8E8E8E8E8E881D7AC81E8E8E8E8E8E8E8E8E8E8E8E8
      81D7AD56E8E8E8E8E8E8E8E8E8E8E8E881D7AC81E8E8E8E8E8E8E8E8E8E8E8E8
      56565656E8E8E8E8E856E8E8E8E8E8E881818181E8E8E8E8E881E85656E8E856
      8181818156E8E8E85656E88181E8E8818181818181E8E8E88181818181565681
      ACACAC8156565656AC56818181818181ACACAC8181818181AC8181D7ACACACAC
      ACACACAC818181AC56E881D7ACACACACACACACAC818181AC81E881D7ACACD7AC
      ACACACACACACAC81E8E881D7ACACD7ACACACACACACACAC81E8E881D7D78181D7
      D7D7D7D7D78181E8E8E881D7D78181D7D7D7D7D7D78181E8E8E8E88181E8E881
      8181818181E8E8E8E8E8E88181E8E8818181818181E8E8E8E8E8}
    NumGlyphs = 2
    DropDownMenu = ppmopciones
  end
  object edidnocliente: TRzEdit
    Left = 224
    Top = 8
    Width = 81
    Height = 21
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 8
    OnChange = edidnoclienteChange
    OnKeyPress = edidnoclienteKeyPress
  end
  object bg: TRzPanel
    Left = 0
    Top = 551
    Width = 973
    Height = 54
    Align = alBottom
    BorderOuter = fsPopup
    Color = clGreen
    GradientColorStyle = gcsMSOffice
    GradientColorStart = clGreen
    GradientColorStop = clLime
    TabOrder = 9
    object ltitulo: TRzLabel
      Left = 8
      Top = 20
      Width = 240
      Height = 37
      Caption = 'EX - CLIENTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lbufh: TRzLabel
      Left = 8
      Top = 5
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
    object btnborrar: TRzBitBtn
      Left = 296
      Top = 12
      Width = 163
      Height = 37
      Hint = 'Elimina el Cliente actual'
      ModalResult = 1
      Caption = '&Borrar'
      Color = clWhite
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
      TabOrder = 0
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
    object btncancelar: TRzBitBtn
      Left = 799
      Top = 12
      Width = 154
      Height = 37
      Hint = 'Cerrar esta Pantalla'
      Caption = '&Cerrar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      Left = 623
      Top = 12
      Width = 154
      Height = 37
      Hint = 'Dar de Alta a un Cliente'
      ModalResult = 1
      Caption = '&Alta'
      Color = clWhite
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
      OnClick = btnaltaClick
      ImageIndex = 5
      Images = DMAccesos.ilopciones
    end
    object btnmodificar: TRzBitBtn
      Left = 464
      Top = 12
      Width = 155
      Height = 37
      Hint = 'Editar los datos del Cliente Actual'
      ModalResult = 1
      Caption = '&Editar'
      Color = clWhite
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
  end
  object DSclientes: TDataSource
    DataSet = tblexclientes
    Left = 835
    Top = 355
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    Options.FullRefresh = True
    FetchAll = True
    Left = 882
    Top = 307
  end
  object tblexclientes: TMyTable
    TableName = 'NoClientes'
    ReadOnly = True
    Connection = DMAccesos.conexion
    BeforePost = tblexclientesBeforePost
    AfterPost = tblexclientesAfterPost
    AfterScroll = tblexclientesAfterScroll
    FetchAll = True
    Left = 835
    Top = 303
    object tblexclientesidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'NoClientes.idcliente'
    end
    object tblexclientesrfc: TStringField
      FieldName = 'rfc'
      Origin = 'NoClientes.rfc'
      Size = 35
    end
    object tblexclientesrsocial: TStringField
      FieldName = 'rsocial'
      Origin = 'NoClientes.rsocial'
      Size = 50
    end
    object tblexclientescurp: TStringField
      FieldName = 'curp'
      Origin = 'NoClientes.curp'
      Size = 21
    end
    object tblexclientesnombre: TStringField
      FieldName = 'nombre'
      Origin = 'NoClientes.nombre'
      Size = 60
    end
    object tblexclientesapaterno: TStringField
      FieldName = 'apaterno'
      Origin = 'NoClientes.apaterno'
    end
    object tblexclientesamaterno: TStringField
      FieldName = 'amaterno'
      Origin = 'NoClientes.amaterno'
    end
    object tblexclientesdir: TStringField
      FieldName = 'dir'
      Origin = 'NoClientes.dir'
      Size = 250
    end
    object tblexclientesnumero: TStringField
      FieldName = 'numero'
      Origin = 'NoClientes.numero'
      Size = 25
    end
    object tblexclientesciudad: TStringField
      FieldName = 'ciudad'
      Origin = 'NoClientes.ciudad'
      Size = 30
    end
    object tblexclientesestado: TStringField
      FieldName = 'estado'
      Origin = 'NoClientes.estado'
      Size = 30
    end
    object tblexclientescp: TStringField
      FieldName = 'cp'
      Origin = 'NoClientes.cp'
      Size = 9
    end
    object tblexclientessector: TStringField
      FieldName = 'sector'
      Origin = 'NoClientes.sector'
      Size = 10
    end
    object tblexclientesrefs: TStringField
      FieldName = 'refs'
      Origin = 'NoClientes.refs'
      Size = 100
    end
    object tblexclientespass: TStringField
      FieldName = 'pass'
      Origin = 'NoClientes.pass'
    end
    object tblexclientesidtipo: TSmallintField
      FieldName = 'idtipo'
      Origin = 'NoClientes.idtipo'
    end
    object tblexclientesalarm: TStringField
      FieldName = 'alarm'
      Origin = 'NoClientes.alarm'
      Size = 50
    end
    object tblexclientespermit: TStringField
      FieldName = 'permit'
      Origin = 'NoClientes.permit'
    end
    object tblexclientestelefono: TStringField
      FieldName = 'telefono'
      Origin = 'NoClientes.telefono'
    end
    object tblexclientesstopmode: TStringField
      FieldName = 'stopmode'
      Origin = 'NoClientes.stopmode'
      FixedChar = True
      Size = 1
    end
    object tblexclientesemail: TStringField
      FieldName = 'email'
      Origin = 'NoClientes.email'
      Size = 200
    end
    object tblexclientessendmail: TSmallintField
      FieldName = 'sendmail'
      Origin = 'NoClientes.sendmail'
    end
    object tblexclientesidcol: TStringField
      FieldName = 'idcol'
      Origin = 'NoClientes.idcol'
      Size = 30
    end
    object tblexclientesst_date: TDateField
      FieldName = 'st_date'
      Origin = 'NoClientes.st_date'
    end
    object tblexclientesidgiro: TIntegerField
      FieldName = 'idgiro'
      Origin = 'NoClientes.idgiro'
    end
    object tblexclientesidtel: TIntegerField
      FieldName = 'idtel'
      Origin = 'NoClientes.idtel'
    end
    object tblexclientesidcontacto: TIntegerField
      FieldName = 'idcontacto'
      Origin = 'NoClientes.idcontacto'
    end
    object tblexclientesprecio: TStringField
      FieldName = 'precio'
      Origin = 'NoClientes.precio'
      FixedChar = True
      Size = 1
    end
    object tblexclientesidcategoria: TSmallintField
      FieldName = 'idcategoria'
      Origin = 'NoClientes.idcategoria'
    end
    object tblexclientespassword: TStringField
      FieldName = 'password'
      Origin = 'NoClientes.password'
    end
    object tblexclientesbeeper: TStringField
      FieldName = 'beeper'
      Origin = 'NoClientes.beeper'
      Size = 30
    end
    object tblexclientescelular: TStringField
      FieldName = 'celular'
      Origin = 'NoClientes.celular'
      Size = 30
    end
    object tblexclientescomentario: TMemoField
      FieldName = 'comentario'
      Origin = 'NoClientes.comentario'
      BlobType = ftMemo
    end
    object tblexclientesidvendedor: TIntegerField
      FieldName = 'idvendedor'
      Origin = 'NoClientes.idvendedor'
    end
    object tblexclientestype: TStringField
      FieldName = 'type'
      Origin = 'NoClientes.type'
      Size = 30
    end
    object tblexclientesidfact: TIntegerField
      FieldName = 'idfact'
      Origin = 'NoClientes.idfact'
    end
    object tblexclientesidorigen: TIntegerField
      FieldName = 'idorigen'
      Origin = 'NoClientes.idorigen'
    end
    object tblexclientesidfuente: TIntegerField
      FieldName = 'idfuente'
      Origin = 'NoClientes.idfuente'
    end
    object tblexclientesusuario: TStringField
      FieldName = 'usuario'
      Origin = 'NoClientes.usuario'
      Size = 30
    end
    object tblexclientesfecha: TStringField
      FieldName = 'fecha'
      Origin = 'NoClientes.fecha'
      Size = 15
    end
    object tblexclienteshora: TStringField
      FieldName = 'hora'
      Origin = 'NoClientes.hora'
      Size = 15
    end
    object tblexclientesidreferencia: TIntegerField
      FieldName = 'idreferencia'
      Origin = 'NoClientes.idreferencia'
    end
    object tblexclientescredito: TFloatField
      FieldName = 'credito'
      Origin = 'NoClientes.credito'
    end
    object tblexclientesPlazoCredito: TIntegerField
      FieldName = 'PlazoCredito'
      Origin = 'NoClientes.PlazoCredito'
    end
    object tblexclientesidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'NoClientes.idusuario'
    end
    object tblexclientesestatus: TSmallintField
      FieldName = 'estatus'
      Origin = 'NoClientes.estatus'
    end
    object tblexclientesidnota: TLargeintField
      FieldName = 'idnota'
      Origin = 'NoClientes.idnota'
    end
    object tblexclientesbloqueado: TSmallintField
      FieldName = 'bloqueado'
      Origin = 'NoClientes.bloqueado'
    end
    object tblexclientesNotaBloqueo: TMemoField
      FieldName = 'NotaBloqueo'
      Origin = 'NoClientes.NotaBloqueo'
      BlobType = ftMemo
    end
    object tblexclientesUltimaCompra: TDateField
      FieldName = 'UltimaCompra'
      Origin = 'NoClientes.UltimaCompra'
    end
    object tblexclientesTotComprado: TFloatField
      FieldName = 'TotComprado'
      Origin = 'NoClientes.TotComprado'
    end
    object tblexclientessaldo: TFloatField
      FieldName = 'saldo'
      Origin = 'NoClientes.saldo'
    end
    object tblexclientesidusuarios: TIntegerField
      FieldName = 'idusuarios'
      Origin = 'NoClientes.idusuarios'
    end
    object tblexclientesidprotocolo: TIntegerField
      FieldName = 'idprotocolo'
      Origin = 'NoClientes.idprotocolo'
    end
    object tblexclientesPruebaSema: TIntegerField
      FieldName = 'PruebaSema'
      Origin = 'NoClientes.PruebaSema'
    end
    object tblexclientespoliza: TIntegerField
      FieldName = 'poliza'
      Origin = 'NoClientes.poliza'
    end
    object tblexclientesFechaPoli: TDateField
      FieldName = 'FechaPoli'
      Origin = 'NoClientes.FechaPoli'
    end
    object tblexclientesEstVul: TIntegerField
      FieldName = 'EstVul'
      Origin = 'NoClientes.EstVul'
    end
    object tblexclientesArtDesc: TIntegerField
      FieldName = 'ArtDesc'
      Origin = 'NoClientes.ArtDesc'
    end
    object tblexclientesFechaPolVe: TDateField
      FieldName = 'FechaPolVe'
      Origin = 'NoClientes.FechaPolVe'
    end
    object tblexclientesNoPatrulla: TIntegerField
      FieldName = 'NoPatrulla'
      Origin = 'NoClientes.NoPatrulla'
    end
    object tblexclientesClienteAlarmex: TIntegerField
      FieldName = 'ClienteAlarmex'
      Origin = 'NoClientes.ClienteAlarmex'
    end
    object tblexclientesCantUltCompra: TFloatField
      FieldName = 'CantUltCompra'
      Origin = 'NoClientes.CantUltCompra'
    end
    object tblexclientesvendedor: TStringField
      FieldName = 'vendedor'
      Origin = 'NoClientes.vendedor'
      FixedChar = True
      Size = 3
    end
    object tblexclientesMontoCont: TFloatField
      FieldName = 'MontoCont'
      Origin = 'NoClientes.MontoCont'
    end
    object tblexclientesTipoCont: TStringField
      FieldName = 'TipoCont'
      Origin = 'NoClientes.TipoCont'
      FixedChar = True
      Size = 3
    end
    object tblexclientesDesdeCont: TDateField
      FieldName = 'DesdeCont'
      Origin = 'NoClientes.DesdeCont'
    end
    object tblexclientesHastaCont: TDateField
      FieldName = 'HastaCont'
      Origin = 'NoClientes.HastaCont'
    end
    object tblexclientesidabogado: TIntegerField
      FieldName = 'idabogado'
      Origin = 'NoClientes.idabogado'
    end
    object tblexclientesFechaAbo: TDateField
      FieldName = 'FechaAbo'
      Origin = 'NoClientes.FechaAbo'
    end
    object tblexclientesNumDemanda: TStringField
      FieldName = 'NumDemanda'
      Origin = 'NoClientes.NumDemanda'
      Size = 15
    end
    object tblexclientesNumEmbargo: TStringField
      FieldName = 'NumEmbargo'
      Origin = 'NoClientes.NumEmbargo'
      Size = 15
    end
    object tblexclientesFechaCancelacion: TDateField
      FieldName = 'FechaCancelacion'
      Origin = 'NoClientes.FechaCancelacion'
    end
    object tblexclientesMemoCancelacion: TMemoField
      FieldName = 'MemoCancelacion'
      Origin = 'NoClientes.MemoCancelacion'
      BlobType = ftMemo
    end
    object tblexclientesidmotivo: TIntegerField
      FieldName = 'idmotivo'
      Origin = 'NoClientes.idmotivo'
    end
    object tblexclientesdeducible: TBooleanField
      FieldName = 'deducible'
      Origin = 'NoClientes.deducible'
    end
    object tblexclientesNotaUbicacion: TMemoField
      FieldName = 'NotaUbicacion'
      Origin = 'NoClientes.NotaUbicacion'
      BlobType = ftMemo
    end
    object tblexclientesidsupervisor: TIntegerField
      FieldName = 'idsupervisor'
      Origin = 'NoClientes.idsupervisor'
    end
    object tblexclientesultfectraf: TDateField
      FieldName = 'ultfectraf'
      Origin = 'NoClientes.ultfectraf'
    end
    object tblexclientesultfecps: TDateField
      FieldName = 'ultfecps'
      Origin = 'NoClientes.ultfecps'
    end
    object tblexclientesGrupoTrafico: TIntegerField
      FieldName = 'GrupoTrafico'
      Origin = 'NoClientes.GrupoTrafico'
    end
    object tblexclientesVenceContrato: TSmallintField
      FieldName = 'VenceContrato'
      Origin = 'NoClientes.VenceContrato'
    end
    object tblexclientesidnocliente: TIntegerField
      FieldName = 'idnocliente'
      Origin = 'NoClientes.idnocliente'
    end
    object tblexclientesFechaNoCliente: TDateField
      FieldName = 'FechaNoCliente'
      Origin = 'NoClientes.FechaNoCliente'
    end
    object tblexclientesidOpenClose: TIntegerField
      FieldName = 'idOpenClose'
      Origin = 'NoClientes.idOpenClose'
    end
    object tblexclientesusuarioweb: TStringField
      FieldName = 'usuarioweb'
      Origin = 'NoClientes.usuarioweb'
      Size = 15
    end
    object tblexclientespasswordweb: TStringField
      FieldName = 'passwordweb'
      Origin = 'NoClientes.passwordweb'
      Size = 15
    end
  end
  object fuentes: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 888
    Top = 352
  end
  object DScolonias: TDataSource
    DataSet = SQLcolonias
    Left = 768
    Top = 359
  end
  object DScategoria: TDataSource
    DataSet = tblcategoria
    Left = 704
    Top = 356
  end
  object tblcategoria: TMyTable
    TableName = 'categorias'
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 696
    Top = 307
    object tblcategoriaidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'categorias.idcategoria'
    end
    object tblcategorianombre: TStringField
      FieldName = 'nombre'
      Origin = 'categorias.nombre'
      Size = 30
    end
  end
  object SQLcolonias: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select colonias.nombre,colonias.idcol,colonias.cp,col_sector.ids' +
        'ector,sectores.nombre as sector '
      
        'from  colonias left join col_sector on (colonias.idcol=col_secto' +
        'r.idcol) left join sectores on sectores.idsector = col_sector.id' +
        'sector'
      'where colonias.ubicada = 1'
      ' order by colonias.nombre')
    AfterScroll = SQLcoloniasAfterScroll
    Options.FullRefresh = True
    FetchAll = True
    Left = 768
    Top = 303
    object SQLcoloniasnombre: TStringField
      FieldName = 'nombre'
      Origin = 'colonias.nombre'
      Size = 250
    end
    object SQLcoloniasidcol: TIntegerField
      FieldName = 'idcol'
      Origin = 'colonias.idcol'
    end
    object SQLcoloniascp: TIntegerField
      FieldName = 'cp'
      Origin = 'colonias.cp'
    end
    object SQLcoloniasidsector: TSmallintField
      FieldName = 'idsector'
      Origin = 'col_sector.idsector'
    end
    object SQLcoloniassector: TStringField
      FieldName = 'sector'
      Origin = 'sectores.sector'
      Size = 50
    end
  end
  object ppmopciones: TLMDPopupMenu
    Images = DMAccesos.ilopciones
    OwnerDraw = True
    Layout.Alignment = agBottomCenter
    Layout.AlignText2Glyph = taTop
    Layout.OffsetY = -2
    Bevel.Mode = bmCustom
    Caption = 'Complementos'
    FillObject.Style = sfGradient
    FillObject.Gradient.Color = clBlack
    FillObject.Gradient.ColorCount = 64
    FillObject.Gradient.EndColor = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    FontFX.Angle = 90
    OnBeforePopUp = ppmopcionesBeforePopUp
    Left = 808
    Top = 30
    object DatosFacturacion1: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = 'Datos de Facturacion'
      ImageIndex = 10
      ShortCut = 16454
      OnClick = DatosFacturacion1Click
    end
    object telefonos1: TMenuItem
      Caption = '&Telefonos'
      ImageIndex = 4
      ShortCut = 16468
      OnClick = telefonos1Click
    end
    object Responsables1: TMenuItem
      Caption = 'Res&ponsables'
      ImageIndex = 13
      ShortCut = 16464
      OnClick = Responsables1Click
    end
    object Referencias1: TMenuItem
      Caption = 'Referen&cias'
      ImageIndex = 19
    end
    object Usuarios1: TMenuItem
      Caption = 'Usuarios'
      ImageIndex = 6
      OnClick = Usuarios1Click
    end
    object OtrosDatos1: TMenuItem
      Caption = 'Otros Datos'
      ImageIndex = 18
      OnClick = OtrosDatos1Click
    end
    object Motivocancelacin1: TMenuItem
      Caption = 'Motivo cancelaci'#243'n'
      ImageIndex = 24
      OnClick = Motivocancelacin1Click
    end
    object Ventas1: TMenuItem
      Caption = 'Ventas'
      ImageIndex = 25
      OnClick = Ventas1Click
    end
    object Cobros1: TMenuItem
      Caption = 'Cobros'
      OnClick = Cobros1Click
    end
    object bonificaciones: TMenuItem
      Caption = 'Bonificaciones'
      OnClick = bonificacionesClick
    end
    object Componentes1: TMenuItem
      Caption = 'Componentes'
      OnClick = Componentes1Click
    end
    object HorariosdeAperturasyCierres1: TMenuItem
      Caption = 'Horarios de Aperturas y Cierres'
      OnClick = HorariosdeAperturasyCierres1Click
    end
  end
  object ppmnotas: TLMDPopupMenu
    Images = DMAccesos.ilopciones
    OwnerDraw = True
    Layout.Alignment = agBottomCenter
    Layout.AlignText2Glyph = taTop
    Layout.OffsetY = -2
    Bevel.Mode = bmCustom
    Caption = 'Notas'
    FillObject.Style = sfGradient
    FillObject.Gradient.Color = clBlack
    FillObject.Gradient.ColorCount = 64
    FillObject.Gradient.EndColor = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    FontFX.Angle = 90
    OnBeforePopUp = ppmopcionesBeforePopUp
    Left = 936
    Top = 30
    object Generales1: TMenuItem
      Caption = 'Generales'
      OnClick = Generales1Click
    end
    object emporales1: TMenuItem
      Caption = 'Temporal Cliente'
      OnClick = emporales1Click
    end
    object emporalMonitoreo1: TMenuItem
      Caption = 'Temporal Monitoreo'
      OnClick = emporalMonitoreo1Click
    end
    object lAA1: TMenuItem
      Caption = 'Llamadas'
      OnClick = lAA1Click
    end
    object Historial1: TMenuItem
      Caption = 'Historial'
      OnClick = Historial1Click
    end
    object SeguimientoNoseales1: TMenuItem
      Caption = 'Seguimiento No se'#241'ales'
      OnClick = SeguimientoNoseales1Click
    end
  end
end
