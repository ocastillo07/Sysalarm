object frmBuscaArt: TfrmBuscaArt
  Left = 96
  Top = 149
  Width = 1024
  Height = 585
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Busqueda de Articulos'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblarticulos: TRzLabel
    Left = 0
    Top = 537
    Width = 1016
    Height = 14
    Align = alTop
    Caption = 'Departamento'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object Rejilla: TcxGrid
    Left = 0
    Top = 49
    Width = 1016
    Height = 488
    Align = alTop
    TabOrder = 0
    object vista: TcxGridDBTableView
      OnDblClick = vistaDblClick
      OnKeyPress = vistaKeyPress
      OnKeyUp = vistaKeyUp
      DataController.DataSource = dsarticulos
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'cod_cve'
          Column = codcve
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      OptionsBehavior.IncSearch = True
      OptionsView.Navigator = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.NewItemRowInfoText = 'Da click aqui para agregar otro campo a la lista'
      OptionsView.NewItemRowSeparatorColor = clGradientActiveCaption
      OptionsView.RowSeparatorColor = clMoneyGreen
      Preview.Visible = True
      object codcve: TcxGridDBColumn
        Caption = 'Clave'
        Options.Editing = False
        Options.Moving = False
        Width = 106
        DataBinding.FieldName = 'cod_cve'
      end
      object Nombre: TcxGridDBColumn
        Caption = 'Nombre'
        Options.Editing = False
        Options.Moving = False
        Width = 258
        DataBinding.FieldName = 'nombre'
      end
      object tinstalacion: TcxGridDBColumn
        Caption = 'Tiempo'
        Options.Editing = False
        DataBinding.FieldName = 'tinstalacion'
      end
      object iva: TcxGridDBColumn
        Caption = 'Iva'
        Options.Editing = False
        Options.Moving = False
        Width = 43
        DataBinding.FieldName = 'iva'
      end
      object costo: TcxGridDBColumn
        Caption = 'Costo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ValidateOnEnter = True
        Options.Editing = False
        Options.Moving = False
        DataBinding.FieldName = 'costo'
      end
      object precioa: TcxGridDBColumn
        Caption = 'PrecA'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ValidateOnEnter = True
        FooterAlignmentHorz = taCenter
        Options.Editing = False
        Options.Moving = False
        Width = 60
        DataBinding.FieldName = 'precioa'
      end
      object PiezasXUnidad: TcxGridDBColumn
        Caption = 'PzsXUn'
        Options.Editing = False
        Width = 60
        DataBinding.FieldName = 'piezasxunidad'
      end
      object existencia: TcxGridDBColumn
        Caption = 'Exist'
        FooterAlignmentHorz = taCenter
        Options.Editing = False
        Width = 46
        DataBinding.FieldName = 'existencia'
      end
      object ordenadas: TcxGridDBColumn
        Caption = 'Ord'
        Options.Editing = False
        Width = 45
        DataBinding.FieldName = 'ordenados'
      end
      object ApartExist: TcxGridDBColumn
        Caption = 'Apartados'
        Options.Editing = False
        DataBinding.FieldName = 'apartado'
      end
      object ApartOrden: TcxGridDBColumn
        Caption = 'BackOrder'
        Options.Editing = False
        DataBinding.FieldName = 'backorder'
      end
      object minimo: TcxGridDBColumn
        Caption = 'Min'
        Options.Editing = False
        Width = 45
        DataBinding.FieldName = 'minimo'
      end
      object maximo: TcxGridDBColumn
        Caption = 'Max'
        Options.Editing = False
        Width = 46
        DataBinding.FieldName = 'maximo'
      end
      object CxEstatus: TcxGridDBColumn
        Caption = 'Estatus'
        DataBinding.FieldName = 'status'
      end
    end
    object Nivel: TcxGridLevel
      GridView = vista
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1016
    Height = 49
    Align = alTop
    BorderInner = fsButtonUp
    BorderOuter = fsLowered
    BorderSides = []
    Color = clSilver
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 357
      Top = 48
      Width = 78
      Height = 14
      Caption = 'Departamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel13: TRzLabel
      Left = -240
      Top = -37
      Width = 110
      Height = 14
      Caption = 'Nombre del Articulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 5
      Top = 8
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
    object RzLabel4: TRzLabel
      Left = 341
      Top = 8
      Width = 78
      Height = 14
      Caption = 'Departamento'
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
      Left = 701
      Top = 8
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
    object btncerrar: TRzBitBtn
      Left = 938
      Top = 20
      Hint = 'Cierra esta pantalla'
      ModalResult = 2
      Caption = '&Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btncerrarClick
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
    object btnbuscar: TRzBitBtn
      Left = 844
      Top = 20
      Width = 93
      Hint = 'Busca en cualquier parte del nombre'
      Caption = '&Buscar con'
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
      TextStyle = tsRaised
      OnClick = btnbuscarClick
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
    object cbodepto: TRzComboBox
      Left = 338
      Top = 22
      Width = 351
      Height = 21
      Hint = 'Filtra los Articulos por un departamento'
      Style = csDropDownList
      Ctl3D = False
      FlatButtonColor = clWhite
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = cbodeptoClick
    end
    object ednombre: TRzEdit
      Left = 2
      Top = 22
      Width = 327
      Height = 22
      Hint = 'Teclee el nombre a buscar'
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      FrameHotTrack = True
      FrameVisible = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = ednombreChange
      OnEnter = ednombreEnter
      OnKeyPress = ednombreKeyPress
    end
    object cbestatus: TRzComboBox
      Left = 696
      Top = 22
      Width = 137
      Height = 21
      Hint = 'Filtra los Articulos por un departamento'
      Style = csDropDownList
      Ctl3D = False
      FlatButtonColor = clWhite
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = 'ACTIVO'
      OnChange = cbestatusChange
      Items.Strings = (
        'ACTIVO'
        'INACTIVO'
        'HISTORICO')
      ItemIndex = 0
      Values.Strings = (
        '1'
        '0'
        '2')
    end
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 160
    Top = 168
  end
  object dsarticulos: TDataSource
    DataSet = tblarticulos
    Left = 80
    Top = 184
  end
  object tblarticulos: TMyTable
    TableName = 'articulos'
    Connection = DMAccesos.conexion
    Filtered = True
    AfterOpen = tblarticulosAfterOpen
    BeforeScroll = tblarticulosBeforeScroll
    FetchAll = True
    Left = 80
    Top = 136
    object tblarticuloscod_cve: TStringField
      FieldName = 'cod_cve'
      Origin = 'articulos.cod_cve'
      Size = 30
    end
    object tblarticuloscod_barras: TStringField
      FieldName = 'cod_barras'
      Origin = 'articulos.cod_barras'
      Size = 30
    end
    object tblarticulosnombre: TStringField
      FieldName = 'nombre'
      Origin = 'articulos.nombre'
      Size = 50
    end
    object tblarticulosexistencia: TIntegerField
      FieldName = 'existencia'
      Origin = 'articulos.existencia'
    end
    object tblarticulosordenados: TIntegerField
      FieldName = 'ordenados'
      Origin = 'articulos.ordenados'
    end
    object tblarticulosbackorder: TIntegerField
      FieldName = 'backorder'
      Origin = 'articulos.backorder'
    end
    object tblarticulosapartado: TIntegerField
      FieldName = 'apartado'
      Origin = 'articulos.apartado'
    end
    object tblarticulospiezasxunidad: TIntegerField
      FieldName = 'piezasxunidad'
      Origin = 'articulos.piezasxunidad'
    end
    object tblarticulosunidades_caja: TIntegerField
      FieldName = 'unidades_caja'
      Origin = 'articulos.unidades_caja'
    end
    object tblarticulosnacional: TStringField
      FieldName = 'nacional'
      Origin = 'articulos.nacional'
      Size = 11
    end
    object tblarticulosidfamilia: TIntegerField
      FieldName = 'idfamilia'
      Origin = 'articulos.idfamilia'
    end
    object tblarticulosiddpto: TIntegerField
      FieldName = 'iddpto'
      Origin = 'articulos.iddpto'
    end
    object tblarticulosiva: TFloatField
      FieldName = 'iva'
      Origin = 'articulos.iva'
    end
    object tblarticuloscosto: TFloatField
      FieldName = 'costo'
      Origin = 'articulos.costo'
    end
    object tblarticulosutila: TFloatField
      FieldName = 'utila'
      Origin = 'articulos.utila'
    end
    object tblarticulosutilb: TFloatField
      FieldName = 'utilb'
      Origin = 'articulos.utilb'
    end
    object tblarticulosutilc: TFloatField
      FieldName = 'utilc'
      Origin = 'articulos.utilc'
    end
    object tblarticulosutild: TFloatField
      FieldName = 'utild'
      Origin = 'articulos.utild'
    end
    object tblarticulosprecioa: TFloatField
      FieldName = 'precioa'
      Origin = 'articulos.precioa'
    end
    object tblarticulospreciob: TFloatField
      FieldName = 'preciob'
      Origin = 'articulos.preciob'
    end
    object tblarticulosprecioc: TFloatField
      FieldName = 'precioc'
      Origin = 'articulos.precioc'
    end
    object tblarticulospreciod: TFloatField
      FieldName = 'preciod'
      Origin = 'articulos.preciod'
    end
    object tblarticulosdesc_esp: TFloatField
      FieldName = 'desc_esp'
      Origin = 'articulos.desc_esp'
    end
    object tblarticulosaplica_desc: TSmallintField
      FieldName = 'aplica_desc'
      Origin = 'articulos.aplica_desc'
    end
    object tblarticulosminimo: TIntegerField
      FieldName = 'minimo'
      Origin = 'articulos.minimo'
    end
    object tblarticulosmaximo: TIntegerField
      FieldName = 'maximo'
      Origin = 'articulos.maximo'
    end
    object tblarticuloslocalizacion: TStringField
      FieldName = 'localizacion'
      Origin = 'articulos.localizacion'
      Size = 50
    end
    object tblarticulosidSectorArt: TIntegerField
      FieldName = 'idSectorArt'
      Origin = 'articulos.idSectorArt'
    end
    object tblarticulosidseccion: TIntegerField
      FieldName = 'idseccion'
      Origin = 'articulos.idseccion'
    end
    object tblarticulosnom_envase: TStringField
      FieldName = 'nom_envase'
      Origin = 'articulos.nom_envase'
    end
    object tblarticulosnom_piezas: TStringField
      FieldName = 'nom_piezas'
      Origin = 'articulos.nom_piezas'
    end
    object tblarticulosultima_compra: TDateField
      FieldName = 'ultima_compra'
      Origin = 'articulos.ultima_compra'
    end
    object tblarticulosultima_venta: TDateField
      FieldName = 'ultima_venta'
      Origin = 'articulos.ultima_venta'
    end
    object tblarticulosusuario: TStringField
      FieldName = 'usuario'
      Origin = 'articulos.usuario'
      Size = 30
    end
    object tblarticulosfecha: TDateField
      FieldName = 'fecha'
      Origin = 'articulos.fecha'
    end
    object tblarticuloshora: TStringField
      FieldName = 'hora'
      Origin = 'articulos.hora'
      Size = 14
    end
    object tblarticulosprecio_desc: TFloatField
      FieldName = 'precio_desc'
      Origin = 'articulos.precio_desc'
    end
    object tblarticulosmodelo: TStringField
      FieldName = 'modelo'
      Origin = 'articulos.modelo'
      Size = 30
    end
    object tblarticulosgarantia_cliente: TStringField
      FieldName = 'garantia_cliente'
      Origin = 'articulos.garantia_cliente'
      Size = 15
    end
    object tblarticulosgarantia_proveedor: TStringField
      FieldName = 'garantia_proveedor'
      Origin = 'articulos.garantia_proveedor'
      Size = 15
    end
    object tblarticulosgarantia_fabricante: TStringField
      FieldName = 'garantia_fabricante'
      Origin = 'articulos.garantia_fabricante'
      Size = 15
    end
    object tblarticulostinstalacion: TFloatField
      FieldName = 'tinstalacion'
      Origin = 'articulos.tinstalacion'
    end
    object tblarticulosservicio: TSmallintField
      FieldName = 'servicio'
      Origin = 'articulos.servicio'
    end
    object tblarticulospaquete: TSmallintField
      FieldName = 'paquete'
      Origin = 'articulos.paquete'
    end
    object tblarticulosdescripcion: TMemoField
      FieldName = 'descripcion'
      Origin = 'articulos.descripcion'
      BlobType = ftMemo
    end
    object tblarticulosidlinea: TIntegerField
      FieldName = 'idlinea'
      Origin = 'articulos.idlinea'
    end
    object tblarticulosinventariable: TSmallintField
      FieldName = 'inventariable'
      Origin = 'articulos.inventariable'
    end
    object tblarticulosmoneda: TStringField
      FieldName = 'moneda'
      Origin = 'articulos.moneda'
      FixedChar = True
      Size = 1
    end
    object tblarticulosPrecioCapturable: TSmallintField
      FieldName = 'PrecioCapturable'
      Origin = 'articulos.PrecioCapturable'
    end
    object tblarticulosstatus: TIntegerField
      FieldName = 'status'
    end
  end
end
