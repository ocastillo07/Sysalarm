object frmCambiaContrato: TfrmCambiaContrato
  Left = 163
  Top = 98
  Width = 873
  Height = 400
  Caption = 'Cambiar Contratos'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RGPorContratos: TRzGroupBox
    Left = 8
    Top = 200
    Width = 473
    Height = 113
    Caption = 'CAMBIAR POR CONTRATOS'
    Color = clWhite
    TabOrder = 0
    object RGRango: TRzRadioGroup
      Left = 8
      Top = 24
      Width = 121
      Height = 65
      Caption = 'Rango'
      Color = clWhite
      ItemHotTrack = True
      ItemIndex = 1
      Items.Strings = (
        'Todos'
        'Rango')
      TabOrder = 0
      OnClick = RGRangoClick
    end
    object RGCuentas: TRzGroupBox
      Left = 136
      Top = 16
      Width = 169
      Height = 89
      Caption = 'Cuentas'
      Color = clWhite
      TabOrder = 1
      object RzLabel6: TRzLabel
        Left = 16
        Top = 32
        Width = 21
        Height = 13
        Caption = 'De:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel7: TRzLabel
        Left = 24
        Top = 64
        Width = 13
        Height = 13
        Caption = 'A:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Eddesde: TRzEdit
        Left = 48
        Top = 24
        Width = 90
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 0
        OnKeyPress = EddesdeKeyPress
      end
      object Edhasta: TRzEdit
        Left = 48
        Top = 56
        Width = 90
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 1
        OnKeyPress = EdhastaKeyPress
      end
    end
    object RGContratos: TRzGroupBox
      Left = 312
      Top = 16
      Width = 153
      Height = 89
      Caption = 'Contratos'
      Color = clWhite
      TabOrder = 2
      object RzLabel1: TRzLabel
        Left = 16
        Top = 32
        Width = 21
        Height = 13
        Caption = 'De:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel2: TRzLabel
        Left = 16
        Top = 64
        Width = 13
        Height = 13
        Caption = 'A:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object Edconde: TRzButtonEdit
        Left = 48
        Top = 24
        Width = 90
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 0
        OnKeyPress = EdcondeKeyPress
        ButtonKind = bkFind
        FlatButtons = True
        FlatButtonColor = clWhite
        OnButtonClick = EdcondeButtonClick
      end
      object Edcona: TRzButtonEdit
        Left = 48
        Top = 56
        Width = 90
        Height = 21
        Alignment = taRightJustify
        CharCase = ecUpperCase
        DisabledColor = clWhite
        FrameHotTrack = True
        FrameSides = [sdBottom]
        FrameVisible = True
        TabOrder = 1
        OnKeyPress = EdconaKeyPress
        ButtonKind = bkFind
        FlatButtons = True
        FlatButtonColor = clWhite
        OnButtonClick = EdconaButtonClick
      end
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 80
    Width = 473
    Height = 113
    Caption = 'CAMBIAR CONTRATOS VENCIDOS'
    Color = clWhite
    TabOrder = 1
    object RzLabel3: TRzLabel
      Left = 16
      Top = 32
      Width = 236
      Height = 39
      Caption = 
        'Cambia los contratos vencidos de '#13#10'Anual Forzoso a Mensual Norma' +
        'l'#13#10'y de Mensual Forozoso a Mensual Normal'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 296
      Top = 24
      Width = 21
      Height = 13
      Caption = 'De:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 296
      Top = 80
      Width = 13
      Height = 13
      Caption = 'A:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edven1: TRzButtonEdit
      Left = 337
      Top = 16
      Width = 100
      Height = 21
      Text = '005'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 0
      OnKeyPress = EdcondeKeyPress
      ButtonKind = bkFind
      FlatButtons = True
      FlatButtonColor = clWhite
      OnButtonClick = EdcondeButtonClick
    end
    object edven2: TRzButtonEdit
      Left = 337
      Top = 46
      Width = 100
      Height = 21
      Text = '010'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 1
      OnKeyPress = EdcondeKeyPress
      ButtonKind = bkFind
      FlatButtons = True
      FlatButtonColor = clWhite
      OnButtonClick = EdcondeButtonClick
    end
    object edvena: TRzButtonEdit
      Left = 337
      Top = 78
      Width = 100
      Height = 21
      Text = '001'
      Alignment = taRightJustify
      CharCase = ecUpperCase
      DisabledColor = clWhite
      Enabled = False
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 2
      OnKeyPress = EdcondeKeyPress
      ButtonKind = bkFind
      FlatButtons = True
      FlatButtonColor = clWhite
      OnButtonClick = EdcondeButtonClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 488
    Top = 0
    Width = 345
    Height = 313
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DScontratos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'idcliente'
          Column = colcuenta
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      object colcuenta: TcxGridDBColumn
        Caption = 'Cuenta'
        Width = 61
        DataBinding.FieldName = 'idcliente'
      end
      object colNombre: TcxGridDBColumn
        SortOrder = soAscending
        Width = 282
        DataBinding.FieldName = 'Nombre'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object btnCambiar: TRzBitBtn
    Left = 248
    Top = 320
    Width = 113
    Height = 41
    Caption = '&Cambiar'
    HotTrack = True
    TabOrder = 3
    OnClick = btnCambiarClick
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E09
      095EE8E8E8E8E8E8E8E8E8E8E8E8E28181E2E8E8E8E8E8E8E8E8E8E8E8090910
      1009E8E8E8E8E8E8E8E8E8E8E88181ACAC81E8E8E8E8E8E8E8E8E8E809101009
      095EE8E8E8E8E8E8E8E8E8E881ACAC8181E2E8E8E8E8E8E8E8E8E85E0910095E
      E8E809090909090909E8E8E281AC81E2E8E881818181818181E8E80910095EE8
      E8E809101010101009E8E881AC81E2E8E8E881ACACACACAC81E8E8091009E8E8
      E8E8E8091010101009E8E881AC81E8E8E8E8E881ACACACAC81E8E80910095EE8
      E8E8E85E0910101009E8E881AC81E2E8E8E8E8E281ACACAC81E8E85E0910095E
      E85E09091009101009E8E8E281AC81E2E8E28181AC81ACAC81E8E8E809101009
      09091010095E091009E8E8E881ACAC818181ACAC81E281AC81E8E8E8E8090910
      10100909E8E8E80909E8E8E8E88181ACACAC8181E8E8E88181E8E8E8E8E85E09
      09095EE8E8E8E8E8E8E8E8E8E8E8E2818181E2E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnCerrar: TRzBitBtn
    Left = 368
    Top = 320
    Width = 113
    Height = 41
    Caption = '&Cerrar'
    HotTrack = True
    TabOrder = 4
    OnClick = btnCerrarClick
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
  object RGSeleccion: TRzRadioGroup
    Left = 8
    Top = 8
    Width = 169
    Height = 65
    Caption = ' Cambiar Contratos '
    Color = clWhite
    ItemHotTrack = True
    ItemIndex = 0
    Items.Strings = (
      'Por Tipo de Contrato'
      'Contratos Vencidos')
    TabOrder = 5
    OnClick = RGSeleccionClick
  end
  object Sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'Select idcliente, if(clientes.rsocial is NULL or clientes.rsocia' +
        'l='#39#39', if(clientes.apaterno is NULL or clientes.apaterno='#39#39', clie' +
        'ntes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='#39 +
        #39', '
      
        '           concat(clientes.nombre, '#39' '#39', clientes.apaterno), conc' +
        'at(clientes.nombre, '#39' '#39', clientes.apaterno, '#39' '#39', clientes.amater' +
        'no))), clientes.rsocial) as Nombre from clientes where TipoCont ' +
        '= '#39'9999'#39
      '   ')
    FetchAll = True
    Left = 304
    Top = 16
  end
  object DScontratos: TDataSource
    DataSet = Sqlgeneral
    Left = 368
    Top = 32
  end
  object sqlcontrato: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 248
    Top = 40
  end
  object sqlcambio: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 216
    Top = 40
  end
  object sqlins: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 184
    Top = 40
  end
end
