object frmDerechosAdicionales: TfrmDerechosAdicionales
  Left = 312
  Top = 129
  Width = 700
  Height = 450
  Caption = 'Derechos Adicionales'
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblclave: TRzLabel
    Left = 16
    Top = 16
    Width = 37
    Height = 13
    Caption = 'Clave:'
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object rgadmitivo: TRzGroupBox
    Left = 8
    Top = 176
    Width = 417
    Height = 225
    BorderColor = clNavy
    Caption = ' Administrativo '
    Color = clWhite
    Enabled = False
    FlatColor = clBlue
    TabOrder = 5
    object chkvender: TRzDBCheckBox
      Left = 8
      Top = 47
      Width = 200
      Height = 20
      Hint = 'Para tener derechos de modificar un servicio ya finalizado'
      DataField = 'PuedeVender'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Puede Vender'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 0
    end
    object chkauditor: TRzDBCheckBox
      Left = 8
      Top = 22
      Width = 200
      Height = 20
      Hint = 'Para poder Capturar el precio de los articulos en pedidos'
      DataField = 'audittravel'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Auditor de Travelers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 1
    end
    object chkcontrato: TRzDBCheckBox
      Left = 208
      Top = 13
      Width = 200
      Height = 20
      Hint = 
        'El usuario podra modificar el contrato a la cuenta y cambiar su ' +
        'estatus'
      DataField = 'CambiaContrato'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Modifica contrato a cuenta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 2
    end
    object chkAbogados: TRzDBCheckBox
      Left = 8
      Top = 132
      Width = 200
      Height = 20
      Hint = 'Para tener derechos de modificar el abogado a una cuenta'
      DataField = 'CambiarAbogado'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Modificar Abogados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 3
    end
    object chkUniNeg: TRzDBCheckBox
      Left = 8
      Top = 99
      Width = 201
      Height = 27
      DataField = 'TodasUNPedidos'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Utilizar todas las Unidades de Negocio en Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 4
    end
    object chkPresDefault: TRzDBCheckBox
      Left = 8
      Top = 73
      Width = 200
      Height = 20
      DataField = 'GuardaPresDefault'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Guarda Presupuesto Default'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 5
    end
    object chkMinCorp: TRzDBCheckBox
      Left = 209
      Top = 60
      Width = 200
      Height = 20
      DataField = 'MinutaGerencial'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Minuta Corporativa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 6
    end
    object chkFinMinuta: TRzDBCheckBox
      Left = 209
      Top = 38
      Width = 200
      Height = 20
      DataField = 'FinalizaMinuta'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Finaliza Minuta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 7
    end
    object chkRequisicion: TRzDBCheckBox
      Left = 209
      Top = 81
      Width = 200
      Height = 20
      DataField = 'AutorizaRequisiciones'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Acepta Requisicion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 8
    end
    object gbfacturar: TRzGroupBox
      Left = 208
      Top = 128
      Width = 193
      Height = 81
      BorderColor = clBackground
      Caption = ' Permiso de Facturar en: '
      Color = clWhite
      FlatColor = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object chkpedidos: TRzDBCheckBox
        Left = 8
        Top = 16
        Width = 115
        Height = 17
        DataField = 'FacturaP'
        DataSource = DSusuarios
        NullAsUnchecked = False
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        LightTextStyle = True
        ParentFont = False
        TabOrder = 0
      end
      object chkcaja: TRzDBCheckBox
        Left = 8
        Top = 37
        Width = 137
        Height = 17
        DataField = 'FacturaC'
        DataSource = DSusuarios
        NullAsUnchecked = False
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Caja'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        LightTextStyle = True
        ParentFont = False
        TabOrder = 1
      end
      object chkcd: TRzDBCheckBox
        Left = 8
        Top = 57
        Width = 115
        Height = 17
        DataField = 'FacturaD'
        DataSource = DSusuarios
        NullAsUnchecked = False
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = 'Cobro Domicilio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
      end
    end
    object chkApareceMinuta: TRzDBCheckBox
      Left = 8
      Top = 158
      Width = 185
      Height = 27
      DataField = 'AparMinMensual'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Aparece en Minuta Mensual para Envio de Correo'
      HotTrack = True
      TabOrder = 10
    end
    object chkRemisionar: TRzDBCheckBox
      Left = 8
      Top = 192
      Width = 115
      Height = 17
      DataField = 'Remisionar'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Remisionar'
      HotTrack = True
      TabOrder = 11
    end
  end
  object edclave: TRzButtonEdit
    Left = 55
    Top = 7
    Width = 86
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
    OnKeyPress = edclaveKeyPress
    ButtonKind = bkFind
    ButtonShortCut = 119
    FlatButtons = True
    OnButtonClick = edclaveButtonClick
  end
  object rgusuario: TRzGroupBox
    Left = 8
    Top = 40
    Width = 673
    Height = 129
    Caption = ' Datos Usuario '
    Color = clWhite
    Enabled = False
    TabOrder = 1
    object lblnombre: TRzLabel
      Left = 13
      Top = 20
      Width = 62
      Height = 13
      Caption = 'Nombre(s):'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblapaterno: TRzLabel
      Left = 285
      Top = 20
      Width = 98
      Height = 13
      Caption = 'Apellido Paterno:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblamaterno: TRzLabel
      Left = 477
      Top = 20
      Width = 100
      Height = 13
      Caption = 'Apellido Materno:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 344
      Top = 70
      Width = 52
      Height = 13
      Caption = 'Iniciales:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel11: TRzLabel
      Left = 416
      Top = 70
      Width = 55
      Height = 13
      Caption = 'Codigo 2:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblpuesto: TRzLabel
      Left = 183
      Top = 70
      Width = 44
      Height = 13
      Caption = 'Puesto:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblarea: TRzLabel
      Left = 13
      Top = 70
      Width = 31
      Height = 13
      Caption = 'Area:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object lblestatus: TRzLabel
      Left = 499
      Top = 70
      Width = 47
      Height = 13
      Caption = 'Estatus:'
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object edamaterno: TRzDBEdit
      Left = 480
      Top = 40
      Width = 180
      Height = 21
      Hint = 'Apellido Materno'
      DataSource = DSusuarios
      DataField = 'amaterno'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ReadOnlyColor = clWhite
      TabOrder = 0
    end
    object ednombre: TRzDBEdit
      Left = 11
      Top = 40
      Width = 260
      Height = 21
      Hint = 'Nombre o nombres del Usuario'
      DataSource = DSusuarios
      DataField = 'nombre'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ReadOnlyColor = clWhite
      TabOrder = 1
    end
    object edapaterno: TRzDBEdit
      Left = 288
      Top = 40
      Width = 180
      Height = 21
      Hint = 'Apellido Paterno'
      DataSource = DSusuarios
      DataField = 'apaterno'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ReadOnlyColor = clWhite
      TabOrder = 2
    end
    object edcodigo: TRzDBEdit
      Left = 345
      Top = 90
      Width = 48
      Height = 21
      Hint = 'Codigo corto para uso en sistema'
      DataSource = DSusuarios
      DataField = 'codigo'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ReadOnlyColor = clWhite
      TabOrder = 3
    end
    object edcodigo2: TRzDBEdit
      Left = 417
      Top = 90
      Width = 56
      Height = 21
      Hint = 'Codigo 2 para servicios '
      DataSource = DSusuarios
      DataField = 'codigo2'
      ReadOnly = True
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = clWhite
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ReadOnlyColor = clWhite
      TabOrder = 4
    end
    object cboarea: TRzComboBox
      Left = 12
      Top = 90
      Width = 153
      Height = 21
      Hint = 'Area a la que pertenece'
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      FlatButtons = True
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 5
    end
    object cbopuesto: TRzComboBox
      Left = 184
      Top = 90
      Width = 153
      Height = 21
      Hint = 'Puesto que desempe'#241'a'
      CharCase = ecUpperCase
      Ctl3D = False
      DisabledColor = clWhite
      FlatButtons = True
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameSides = [sdBottom]
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      Sorted = True
      TabOrder = 6
    end
    object edestatus: TRzEdit
      Left = 496
      Top = 90
      Width = 161
      Height = 21
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 7
    end
  end
  object btncancelar: TRzBitBtn
    Left = 584
    Top = 384
    Width = 96
    Height = 27
    Hint = 'Cerrar esta Ventana'
    Cancel = True
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
    TabOrder = 2
    OnClick = btncancelarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFF9FFFF7FFFFFFFFFF8FFF991FFFFFFF
      FFFFFF787FFFFFFFFFFFFF9B91FFFFFFF9FFFF7F87FFFFFFF8FFFFF999FFFFFF
      9FFFFFF7F7FFFFFF8FFFFFFF991FFFF91FFFFFFF787FFFF87FFFFFFFF991FF91
      FFFFFFFFF787FF87FFFFFFFFFF99191FFFFFFFFFFF78787FFFFFFFFFFFF991FF
      FFFFFFFFFFF787FFFFFFFFFFFF99191FFFFFFFFFFF78777FFFFFFFFFF991FF91
      FFFFFFFFF787FF77FFFFFFF9991FFFF91FFFFFF7887FFFF77FFFFF9B91FFFFFF
      91FFFF7F87FFFFFF77FFFF797FFFFFFFFF9FFF878FFFFFFFFF7FFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ImageIndex = 5
    NumGlyphs = 2
  end
  object btnmodificar: TRzBitBtn
    Left = 432
    Top = 384
    Width = 144
    Height = 27
    Hint = 'Editar los datos del Usuario Actual'
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
    DisabledIndex = 0
    ImageIndex = 2
    Images = DMAccesos.ilopciones
    NumGlyphs = 2
  end
  object dbnavegador: TRzDBNavigator
    Left = 311
    Top = 2
    Width = 288
    Height = 31
    DataSource = DSusuarios
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Hints.Strings = (
      'Primer Usuario'
      'Usuario Anterior'
      'Usuario Siguiente'
      'Ultimo Usuario'
      'Refrescar Datos')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = dbnavegadorClick
    Color = clWhite
  end
  object rgoptivo: TRzGroupBox
    Left = 432
    Top = 176
    Width = 249
    Height = 201
    BorderColor = clNavy
    Caption = ' Operativo '
    Color = clWhite
    Enabled = False
    FlatColor = clBlue
    TabOrder = 6
    object chkModServFin: TRzDBCheckBox
      Left = 9
      Top = 134
      Width = 200
      Height = 20
      Hint = 'Para tener derechos de modificar un servicio ya finalizado'
      DataField = 'ModificarServicios'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Modifica Servicios Finalizados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 0
    end
    object chkCapPrecios: TRzDBCheckBox
      Left = 9
      Top = 22
      Width = 200
      Height = 20
      Hint = 'Para poder Captuarar el precio de los articulos en pedidos'
      DataField = 'PrecioCapturable'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Capturara Precios de Articulos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 1
    end
    object chkCreaServ: TRzDBCheckBox
      Left = 9
      Top = 89
      Width = 200
      Height = 20
      Hint = 'Para tener derechos de modificar un servicio ya finalizado'
      DataField = 'CrearServicio'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Crear Servicios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 2
    end
    object chkModInst: TRzDBCheckBox
      Left = 9
      Top = 67
      Width = 200
      Height = 20
      Hint = 'Para tener derechos de dar salida a almacen'
      DataField = 'ModificarInstalaciones'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Modificar Instalaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 3
    end
    object chkModCosto: TRzDBCheckBox
      Left = 9
      Top = 44
      Width = 200
      Height = 20
      DataField = 'ModificaCosto'
      DataSource = DSusuarios
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Modifica Costo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      TabOrder = 4
    end
    object chkInsSen: TRzDBCheckBox
      Left = 9
      Top = 157
      Width = 200
      Height = 20
      Hint = 'Para tener derechos de dar salida a almacen'
      DataField = 'alta_senales'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Inserta Se'#241'ales'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      LightTextStyle = True
      ParentFont = False
      TabOrder = 5
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 9
      Top = 112
      Width = 192
      Height = 17
      DataField = 'FinalizaTickets'
      DataSource = DSusuarios
      ValueChecked = '1'
      ValueUnchecked = '0'
      Caption = 'Finaliza Tickets de Servicio'
      HotTrack = True
      TabOrder = 6
    end
  end
  object tblusuarios: TMyTable
    TableName = 'usuarios'
    OrderFields = 'idusuario'
    Connection = DMAccesos.conexion
    Options.FullRefresh = True
    Options.QueryRecCount = True
    Options.QuoteNames = True
    FetchAll = True
    Left = 168
    object tblusuariosidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object tblusuariosnombre: TStringField
      FieldName = 'nombre'
      Size = 30
    end
    object tblusuarioscodigo: TStringField
      FieldName = 'codigo'
      FixedChar = True
      Size = 3
    end
    object tblusuariosidarea: TIntegerField
      FieldName = 'idarea'
    end
    object tblusuariosidpuesto: TIntegerField
      FieldName = 'idpuesto'
    end
    object tblusuariosapaterno: TStringField
      FieldName = 'apaterno'
    end
    object tblusuariosamaterno: TStringField
      FieldName = 'amaterno'
    end
    object tblusuariosestatus: TBooleanField
      FieldName = 'estatus'
    end
    object tblusuariosFacturaC: TBooleanField
      FieldName = 'FacturaC'
    end
    object tblusuariosFacturaD: TBooleanField
      FieldName = 'FacturaD'
    end
    object tblusuariosFacturaP: TBooleanField
      FieldName = 'FacturaP'
    end
    object tblusuariosPrecioCapturable: TSmallintField
      FieldName = 'PrecioCapturable'
    end
    object tblusuariosaudittravel: TSmallintField
      FieldName = 'audittravel'
    end
    object tblusuarioscodigo2: TStringField
      FieldName = 'codigo2'
      FixedChar = True
      Size = 3
    end
    object tblusuariosalta_senales: TSmallintField
      FieldName = 'alta_senales'
    end
    object tblusuariosCambiaContrato: TIntegerField
      FieldName = 'CambiaContrato'
    end
    object tblusuariosModificarServicios: TSmallintField
      FieldName = 'ModificarServicios'
    end
    object tblusuariosPuedeVender: TSmallintField
      FieldName = 'PuedeVender'
    end
    object tblusuariosCrearServicio: TSmallintField
      FieldName = 'CrearServicio'
    end
    object tblusuariosModificarInstalaciones: TSmallintField
      FieldName = 'ModificarInstalaciones'
    end
    object tblusuariosCambiarAbogado: TSmallintField
      FieldName = 'CambiarAbogado'
    end
    object tblusuariosTodasUNPedidos: TBooleanField
      FieldName = 'TodasUNPedidos'
    end
    object tblusuariosGuardaPresDefault: TBooleanField
      FieldName = 'GuardaPresDefault'
    end
    object tblusuariosFinalizaMinuta: TBooleanField
      FieldName = 'FinalizaMinuta'
    end
    object tblusuariosAutorizaRequisiciones: TSmallintField
      FieldName = 'AutorizaRequisiciones'
    end
    object tblusuariosMinutaGerencial: TIntegerField
      FieldName = 'MinutaGerencial'
    end
    object tblusuariosModificaCosto: TBooleanField
      FieldName = 'ModificaCosto'
    end
    object tblusuariosAparMinMensual: TBooleanField
      FieldName = 'AparMinMensual'
    end
    object tblusuariosRemisionar: TBooleanField
      FieldName = 'Remisionar'
    end
    object tblusuariosFinalizaTickets: TBooleanField
      FieldName = 'FinalizaTickets'
    end
  end
  object DSusuarios: TDataSource
    DataSet = tblusuarios
    Left = 216
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 256
  end
end
