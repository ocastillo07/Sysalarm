object frmllegada_patrulleros: Tfrmllegada_patrulleros
  Left = 199
  Top = 100
  Width = 777
  Height = 341
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Testificaci'#243'n de llegada de patrulleros'
  Color = 16119543
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 256
    Top = 141
    Width = 424
    Height = 13
    Caption = 
      '* Antes de dar llegada '#243' cancelar patrullero, seleccione al corr' +
      'epondiente.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel_retardo: TPanel
    Left = 0
    Top = 157
    Width = 761
    Height = 148
    Color = 16119543
    Enabled = False
    TabOrder = 0
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 759
      Height = 33
      Align = alTop
      Brush.Color = clNavy
    end
    object Bevel1: TBevel
      Left = 1
      Top = 32
      Width = 736
      Height = 17
      Shape = bsBottomLine
    end
    object Label1: TLabel
      Left = 9
      Top = 5
      Width = 160
      Height = 20
      Caption = 'Causas del Retardo'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 185
      Top = 49
      Width = 140
      Height = 16
      Caption = 'Descripcion del retardo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 9
      Top = 49
      Width = 111
      Height = 16
      Caption = 'Motivo del  retardo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object btnguardar: TRzBitBtn
      Left = 43
      Top = 104
      Width = 86
      Height = 33
      Hint = 'Dar llegada al patrullero'
      Caption = 'Guardar'
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
      OnClick = btnguardarClick
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
      ImageIndex = 1
      Images = DMAccesos.ilopciones
      NumGlyphs = 2
      Spacing = 3
    end
    object mmdescripcion: TRzMemo
      Left = 184
      Top = 71
      Width = 513
      Height = 45
      Hint = 'Agrege comentarios!'
      TabOrder = 1
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameVisible = True
    end
    object cbomotivo: TRzComboBox
      Left = 11
      Top = 72
      Width = 150
      Height = 21
      Hint = 'Lista de patrulleros disponibles'
      Ctl3D = False
      FlatButtons = True
      FocusColor = 16776176
      FrameColor = clActiveCaption
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 2
      OnKeyPress = cbomotivoKeyPress
    end
  end
  object btnllegada: TRzBitBtn
    Left = 3
    Top = 133
    Width = 78
    Hint = 'Dar llegada al patrullero'
    Caption = 'Llegada'
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
    OnClick = btnllegadaClick
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
  object btncancelar: TRzBitBtn
    Left = 80
    Top = 133
    Width = 86
    Hint = 'Dar llegada al patrullero'
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btncancelarClick
    ImageIndex = 2
    Kind = bkCancel
    Spacing = 3
  end
  object btncerrar: TRzBitBtn
    Left = 165
    Top = 133
    Width = 86
    Hint = 'Dar llegada al patrullero'
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btncerrarClick
    ImageIndex = 2
    Kind = bkClose
    Spacing = 3
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 0
    Width = 761
    Height = 126
    Align = alCustom
    BevelOuter = bvSpace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    object DBViewPatrulleros: TcxGridDBTableView
      DataController.DataSource = dspatrulleros
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.GridLineColor = clBlack
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object DBViewPatrullerosDBColumn1: TcxGridDBColumn
        Caption = 'Fecha'
        DataBinding.FieldName = 'hora_pc'
      end
      object DBViewPatrullerosDBColumn2: TcxGridDBColumn
        Caption = 'Hora'
        DataBinding.FieldName = 'Salida'
      end
      object DBViewPatrullerosDBColumn3: TcxGridDBColumn
        Caption = 'Cliente'
        Width = 249
        DataBinding.FieldName = 'cliente'
      end
      object DBViewPatrullerosDBColumn4: TcxGridDBColumn
        Caption = 'Patrullero'
        Width = 220
        DataBinding.FieldName = 'patrullero'
      end
      object DBViewPatrullerosDBColumn5: TcxGridDBColumn
        Caption = 'Dir'
        Width = 202
        DataBinding.FieldName = 'dir'
      end
      object DBViewPatrullerosDBColumn6: TcxGridDBColumn
        Caption = 'N'#250'm'
        Width = 66
        DataBinding.FieldName = 'numero'
      end
      object DBViewPatrullerosDBColumn7: TcxGridDBColumn
        Caption = 'Colonia'
        Width = 303
        DataBinding.FieldName = 'col'
      end
      object DBViewPatrullerosDBColumn8: TcxGridDBColumn
        Caption = 'Evento'
        DataBinding.FieldName = 'evento'
      end
      object DBViewPatrullerosDBColumn9: TcxGridDBColumn
        Caption = 'Fecha PC'
        DataBinding.FieldName = 'fecha_pc'
      end
      object DBViewPatrullerosDBColumn10: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'tipo'
      end
      object DBViewPatrullerosDBColumn11: TcxGridDBColumn
        Caption = 'Zona'
        DataBinding.FieldName = 'zona'
      end
    end
    object cxGridLevel3: TcxGridLevel
      Caption = 'pruebas'
      GridView = DBViewPatrulleros
    end
  end
  object dspatrulleros: TDataSource
    DataSet = sqlpatrulleros
    Left = 336
    Top = 48
  end
  object sqlpatrulleros: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT '
      '  sk_alarmas.fecha_pc,'
      '  sk_alarmas.hora_pc,'
      '  sk_alarmas.idcliente,'
      '  sk_alarmas.cliente,'
      '  sk_alarmas.tipo,'
      '  sk_alarmas.zona,'
      '  sk_alarmas.id as evento,'
      '  tiempo_respuesta.nombre as patrullero,  '
      'tiempo_respuesta.fecha as FechaSalida,'
      'tiempo_respuesta.hora as Salida,'
      '  col.nombre as col,'
      '  clientes.dir, clientes.sector,'
      '  clientes.numero'
      'FROM '
      ' alarmas_detalle'
      '  INNER JOIN sk_alarmas ON (alarmas_detalle.aid = sk_alarmas.id)'
      
        '  INNER JOIN tiempo_respuesta ON (sk_alarmas.id = tiempo_respues' +
        'ta.aid)'
      
        '  INNER JOIN clientes ON(sk_alarmas.idcliente=clientes.idcliente' +
        ')'
      ' LEFT JOIN colonias as col ON(col.idcol=clientes.idcol)'
      ''
      'WHERE'
      
        ' (sk_alarmas.fecha_pc between date_sub(curdate(), interval 1 day' +
        ')  and curdate() ) AND   '
      '  ((sk_alarmas.status = 1) or (sk_alarmas.status = 2) ) '
      'and   (alarmas_detalle.tipo = 3) '
      ''
      'AND   (tiempo_respuesta.hora_llegada IS NULL)')
    FetchAll = True
    Left = 394
    Top = 58
  end
end
