object frmaplica: Tfrmaplica
  Left = 256
  Top = 137
  Width = 732
  Height = 516
  Caption = 'Aplicacion de Saldos a Clientes'
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
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 1
    Top = 434
    Width = 114
    Height = 16
    Caption = 'Monto Disponible:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel3: TRzLabel
    Left = 0
    Top = 79
    Width = 204
    Height = 16
    Caption = 'Notas de Credito de Este Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel4: TRzLabel
    Left = 328
    Top = 79
    Width = 179
    Height = 16
    Caption = 'Facturas para aplicar saldos'
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
    Left = 0
    Top = 370
    Width = 521
    Height = 28
    Caption = 
      '* seleccione la Nota de Credito a aplicar de la lista de arriba ' +
      'posteriormente seleccione la factura a la cual le '#13#10'  desea apli' +
      'car dicho restante'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lbldescripcion: TRzLabel
    Left = 0
    Top = 418
    Width = 120
    Height = 13
    Caption = 'Nota de Credito a aplicar:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel5: TRzLabel
    Left = 120
    Top = 434
    Width = 103
    Height = 16
    Caption = 'Monto a aplicar:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel8: TRzLabel
    Left = 0
    Top = 402
    Width = 431
    Height = 28
    Caption = 
      '* Para eliminar un saldo menor a $1 peso basta con dar doble cli' +
      'c sobre la nota de credito'#13#10'  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object gbcliente: TGroupBox
    Left = 0
    Top = 0
    Width = 649
    Height = 37
    Caption = 'Indique la cuenta que tiene la Nota de credito'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object lblnombre: TRzLabel
      Left = 114
      Top = 14
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
      Top = 15
      Width = 35
      Height = 11
      Caption = 'Cuenta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edcuenta: TRzButtonEdit
      Left = 40
      Top = 13
      Width = 74
      Height = 22
      Hint = 'Buscar en el catalogo'
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
      OnChange = edcuentaChange
      OnKeyPress = edcuentaKeyPress
      OnKeyUp = edcuentaKeyUp
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edcuentaButtonClick
    end
    object ednomfuente: TRzEdit
      Left = 200
      Top = 12
      Width = 441
      Height = 22
      FrameController = DMAccesos.frmctr
      ReadOnly = True
      TabOrder = 1
    end
  end
  object edcantidad: TRzEdit
    Left = 2
    Top = 449
    Width = 89
    Height = 24
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FrameController = DMAccesos.frmctr
    ParentFont = False
    TabOrder = 2
    OnChange = edcantidadChange
    OnKeyPress = edcantidadKeyPress
  end
  object cxgnc: TcxGrid
    Left = 0
    Top = 96
    Width = 327
    Height = 200
    Enabled = False
    TabOrder = 3
    object cxgncDBTableView1: TcxGridDBTableView
      OnDblClick = cxgncDBTableView1DblClick
      DataController.DataSource = dsnc
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxgncDBTableView1CellClick
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxpedido: TcxGridDBColumn
        Caption = 'Pedido'
        DataBinding.FieldName = 'idpedido'
      end
      object cxNcFactura: TcxGridDBColumn
        Options.Editing = False
        Options.Grouping = False
        Options.Moving = False
        DataBinding.FieldName = 'Factura'
      end
      object cxNC: TcxGridDBColumn
        Caption = 'Nc'
        Options.Editing = False
        Options.Grouping = False
        Options.Moving = False
        DataBinding.FieldName = 'NC'
      end
      object cxNcAfavor: TcxGridDBColumn
        Caption = 'Afavor'
        Options.Editing = False
        Options.Grouping = False
        Options.Moving = False
        DataBinding.FieldName = 'Restante'
      end
    end
    object cxgncLevel1: TcxGridLevel
      GridView = cxgncDBTableView1
    end
  end
  object cxgfacturas: TcxGrid
    Left = 328
    Top = 96
    Width = 377
    Height = 200
    Enabled = False
    TabOrder = 4
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = dsfacturas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = cxGridDBTableView1CellClick
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxcuenta: TcxGridDBColumn
        Caption = 'Cuenta'
        DataBinding.FieldName = 'idcliente'
      end
      object cxventa: TcxGridDBColumn
        Caption = 'Venta'
        DataBinding.FieldName = 'idpedido'
      end
      object cxremicion: TcxGridDBColumn
        Caption = 'Remicion'
        DataBinding.FieldName = 'idremicion'
      end
      object cxFactura: TcxGridDBColumn
        Caption = 'Factura'
        Options.Editing = False
        Options.Grouping = False
        Options.Moving = False
        DataBinding.FieldName = 'idfactura'
      end
      object cxSaldo: TcxGridDBColumn
        Caption = 'Restante'
        Options.Editing = False
        Options.Grouping = False
        Options.Moving = False
        DataBinding.FieldName = 'restante'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object btnaplicar: TRzBitBtn
    Left = 238
    Top = 444
    Caption = '&Aplicar'
    Enabled = False
    HotTrack = True
    TabOrder = 5
    OnClick = btnaplicarClick
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
  object btnsalir: TRzBitBtn
    Left = 318
    Top = 444
    Caption = '&Salir'
    HotTrack = True
    TabOrder = 6
    OnClick = btnsalirClick
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
  object rcgParPag: TRzCheckGroup
    Left = 0
    Top = 296
    Width = 708
    Height = 73
    Caption = 'Parcialidades y Pagos'
    Color = clWhite
    Columns = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemFont.Charset = DEFAULT_CHARSET
    ItemFont.Color = clWindowText
    ItemFont.Height = -11
    ItemFont.Name = 'MS Sans Serif'
    ItemFont.Style = []
    ParentFont = False
    TabOrder = 7
    OnChange = rcgParPagChange
  end
  object edMonelg: TRzEdit
    Left = 122
    Top = 449
    Width = 111
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    FrameController = DMAccesos.frmctr
    ParentFont = False
    TabOrder = 8
    OnChange = edcantidadChange
    OnKeyPress = edcantidadKeyPress
  end
  object gbdestino: TGroupBox
    Left = 0
    Top = 40
    Width = 649
    Height = 38
    Caption = 'Indique la cuenta a la que le quiere aplicar la Nota de Credito'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object RzLabel6: TRzLabel
      Left = 114
      Top = 14
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
    object RzLabel7: TRzLabel
      Left = 3
      Top = 15
      Width = 35
      Height = 11
      Caption = 'Cuenta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edcuenta2: TRzButtonEdit
      Left = 40
      Top = 13
      Width = 74
      Height = 22
      Hint = 'Buscar en el catalogo'
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
      OnChange = edcuentaChange
      OnKeyPress = edcuentaKeyPress
      OnKeyUp = edcuentaKeyUp
      ButtonKind = bkFind
      ButtonShortCut = 16450
      FlatButtons = True
      OnButtonClick = edcuentaButtonClick
    end
    object ednomdestino: TRzEdit
      Left = 200
      Top = 13
      Width = 441
      Height = 22
      FrameController = DMAccesos.frmctr
      ReadOnly = True
      TabOrder = 1
    end
  end
  object sqlclientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT clientes.idfact,'
      
        '  clientes.idcliente,concat(clientes.nombre,'#39' '#39',clientes.apatern' +
        'o,'#39' '#39',clientes.amaterno) as cliente,'
      '  clientes.rsocial,'
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
      '  categorias.nombre AS Categoria'
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
      'where clientes.idcliente =  :idcliente')
    ReadOnly = True
    FetchAll = True
    Left = 536
    Top = 5
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idcliente'
      end>
  end
  object dsclientes: TDataSource
    DataSet = sqlclientes
    Left = 600
    Top = 5
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
    Left = 440
    Top = 109
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
  object sqlnc: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select pc.idpedido, pc.idpago, pc.idcliente as Cliente,'
      
        'concat(nc.serie, nc.idnc) as NC, pc.idfactura as Factura, (pc.re' +
        'stante*(-1)) as Restante'
      'from PagosClientes pc '
      
        'inner join NotasCredito nc on pc.idfactura = nc.idfactura and pc' +
        '.notas like concat('#39'%'#39', nc.serie, nc.idnc,'#39'%'#39')'
      'inner join pedidos p on p.idpedido = pc.idpedido'
      'where '
      'pc.restante < 0 and '
      'pc.movimiento = 6 and pc.idcliente = :cuenta '
      'and p.estatus = 4 '
      'group by pc.idpago'
      'order by nc.serie, nc.idnc')
    ReadOnly = True
    FetchAll = True
    Left = 16
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cuenta'
      end>
  end
  object dsnc: TDataSource
    DataSet = sqlnc
    Left = 64
    Top = 117
  end
  object sqlfacturas: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select (sum(PagosClientes.cargo)-sum(PagosClientes.abono)) as re' +
        'stante,'
      
        'PagosClientes.idpedido,PagosClientes.idcliente,PagosClientes.idr' +
        'emicion,PagosClientes.idfactura,PagosClientes.idpago'
      
        'from PagosClientes  inner join pedidos on pedidos.idpedido = Pag' +
        'osClientes.idpedido '
      'where pedidos.idcliente = :cuenta  and pedidos.estatus > 2'
      ' and (PagosClientes.movimiento = 0 '
      'or PagosClientes.movimiento =1 or PagosClientes.movimiento = 2 '
      
        'or PagosClientes.movimiento =4 or PagosClientes.movimiento = 10)' +
        ' '
      'and pedidos.FechaCreacion >= '#39'2000/01/01'#39
      'group by idpedido'
      'having restante >= 1')
    ReadOnly = True
    FetchAll = True
    Left = 360
    Top = 133
    ParamData = <
      item
        DataType = ftString
        Name = 'cuenta'
        Value = ''
      end>
  end
  object dsfacturas: TDataSource
    DataSet = sqlfacturas
    Left = 352
    Top = 181
  end
  object sqlcargos: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select (sum(PagosClientes.cargo)-sum(PagosClientes.abono)) as re' +
        'stante,PagosClientes.idpedido,'
      
        'PagosClientes.idcliente,PagosClientes.idremicion,PagosClientes.i' +
        'dfactura,PagosClientes.idpago'
      
        'from PagosClientes  inner join pedidos on pedidos.idpedido = Pag' +
        'osClientes.idpedido '
      'where pedidos.idcliente = :cuenta  and pedidos.estatus > 2 and '
      
        '(PagosClientes.movimiento = 0 or PagosClientes.movimiento =1 or ' +
        'PagosClientes.movimiento = 2'
      
        ' or PagosClientes.movimiento =4) and pedidos.FechaCreacion >= '#39'2' +
        '005/01/01'#39
      'group by idpedido'
      'having restante >= 1')
    ReadOnly = True
    FetchAll = True
    Left = 384
    Top = 309
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cuenta'
      end>
  end
  object dscargos: TDataSource
    DataSet = sqlcargos
    Left = 472
    Top = 309
  end
end
