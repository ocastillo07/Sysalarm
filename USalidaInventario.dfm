object frmSalidaInventario: TfrmSalidaInventario
  Left = 288
  Top = 132
  Width = 676
  Height = 538
  Caption = 'Salidas de  Inventario'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 169
    Align = alTop
    BorderOuter = fsNone
    Color = clWhite
    TabOrder = 11
    object RzLabel9: TRzLabel
      Left = 8
      Top = 144
      Width = 51
      Height = 13
      Caption = 'Cantidad'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 128
      Top = 144
      Width = 88
      Height = 13
      Caption = 'Codigo Recibe:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel7: TRzLabel
      Left = 8
      Top = 40
      Width = 72
      Height = 13
      Caption = 'Instalador 1:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel6: TRzLabel
      Left = 312
      Top = 40
      Width = 72
      Height = 13
      Caption = 'Instalador 2:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 312
      Top = 88
      Width = 115
      Height = 13
      Caption = 'Nombre Facturacion'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 8
      Top = 88
      Width = 110
      Height = 13
      Caption = 'Nombre Instalacion'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 464
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Cuenta:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 232
      Top = 16
      Width = 64
      Height = 13
      Caption = 'No. Pedido'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 87
      Height = 13
      Caption = 'No. Instalacion'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
  end
  object edinstalacion: TRzButtonEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    DisabledColor = clWhite
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 0
    OnChange = edinstalacionChange
    OnKeyPress = edinstalacionKeyPress
    ButtonKind = bkFind
    FlatButtons = True
    OnButtonClick = edinstalacionButtonClick
  end
  object edpedido: TRzButtonEdit
    Left = 304
    Top = 8
    Width = 121
    Height = 21
    DisabledColor = clWhite
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 1
    OnChange = edpedidoChange
    OnKeyPress = edpedidoKeyPress
    ButtonKind = bkFind
    FlatButtons = True
    OnButtonClick = edpedidoButtonClick
  end
  object GSalidas: TcxGrid
    Left = 0
    Top = 169
    Width = 668
    Height = 294
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = True
    object VSalidas: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = colcant
        end
        item
          Kind = skCount
          Column = colclave
        end
        item
          Kind = skSum
          Column = colhoras
        end
        item
          Kind = skSum
          Column = colsalida
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      object colcant: TcxGridDBColumn
        Caption = 'Cantidad'
        Width = 67
        DataBinding.FieldName = 'cant'
      end
      object colclave: TcxGridDBColumn
        Caption = 'Producto'
        SortOrder = soAscending
        Width = 82
        DataBinding.FieldName = 'cod_cve'
      end
      object colbarras: TcxGridDBColumn
        Caption = 'CodBarras'
        DataBinding.FieldName = 'cod_barras'
      end
      object colhoras: TcxGridDBColumn
        Caption = 'Horas'
        Width = 54
        DataBinding.FieldName = 'tinstalacionCom'
      end
      object coldesc: TcxGridDBColumn
        Caption = 'Descripcion'
        Width = 258
        DataBinding.FieldName = 'nombre'
      end
      object colcheck: TcxGridDBColumn
        Caption = 'Checked'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 2
        Properties.ValueGrayed = 0
        Properties.ValueUnchecked = 1
        Width = 77
        DataBinding.FieldName = 'estatus'
      end
      object colsalida: TcxGridDBColumn
        Caption = 'Salida'
        Width = 69
        DataBinding.FieldName = 'cant_salida'
      end
    end
    object LSalidas: TcxGridLevel
      GridView = VSalidas
    end
  end
  object edcuenta: TRzEdit
    Left = 520
    Top = 8
    Width = 65
    Height = 21
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 3
  end
  object ednominst: TRzEdit
    Left = 8
    Top = 104
    Width = 300
    Height = 21
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 4
  end
  object ednomfact: TRzEdit
    Left = 312
    Top = 104
    Width = 300
    Height = 21
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 5
  end
  object edinst1: TRzEdit
    Left = 8
    Top = 62
    Width = 300
    Height = 21
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 6
  end
  object edinst2: TRzEdit
    Left = 312
    Top = 62
    Width = 300
    Height = 21
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 7
  end
  object edcadena: TRzEdit
    Left = 232
    Top = 136
    Width = 377
    Height = 21
    CharCase = ecUpperCase
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 8
    OnChange = edcadenaChange
  end
  object edcant: TRzEdit
    Left = 72
    Top = 136
    Width = 41
    Height = 21
    Text = '0'
    Alignment = taRightJustify
    DisabledColor = clWhite
    Enabled = False
    FrameHotTrack = True
    FrameSides = [sdBottom]
    FrameVisible = True
    TabOrder = 9
  end
  object pabajo: TRzPanel
    Left = 0
    Top = 463
    Width = 668
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 10
    object ckCancelar: TRzCheckBox
      Left = 16
      Top = 16
      Width = 201
      Height = 17
      Caption = 'Cancelar Salida de un Articulo'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 0
    end
    object btncerrar: TRzBitBtn
      Left = 464
      Top = 8
      Width = 195
      Height = 33
      Caption = '&Cerrar'
      HotTrack = True
      TabOrder = 1
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
    end
    object btneditar: TRzBitBtn
      Left = 280
      Top = 8
      Width = 171
      Height = 33
      Caption = '&Editar'
      HotTrack = True
      TabOrder = 2
      OnClick = btneditarClick
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
  end
  object sqlsalidas: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'Select dp.cant, dp.cod_cve, a.nombre, a.tinstalacionCom, dp.esta' +
        'tus, dp.cant_salida, cod_barras'
      'from DetPedido as dp'
      'left join articulos as a on dp.cod_cve=a.cod_cve'
      'where dp.idpedido=:pedido')
    FetchAll = True
    Left = 360
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'pedido'
        Value = ''
      end>
  end
  object DataSource1: TDataSource
    DataSet = sqlsalidas
    Left = 392
    Top = 248
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 432
    Top = 32
  end
  object idlg: TLMDInputDlg
    Left = 464
    Top = 32
  end
end
