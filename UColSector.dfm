object frmColSector: TfrmColSector
  Left = 358
  Top = 145
  Width = 827
  Height = 401
  Caption = 'Asignacion de Sectores a Colonias'
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblubicadas: TRzLabel
    Left = 7
    Top = 348
    Width = 343
    Height = 16
    Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object lblNoUbicadas: TRzLabel
    Left = 240
    Top = 349
    Width = 325
    Height = 16
    Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzSeparator1: TRzSeparator
    Left = 492
    Top = 27
    Width = 323
    Height = 14
    ShowGradient = True
    Color = 16776176
    ParentColor = False
  end
  object RzLabel1: TRzLabel
    Left = 491
    Top = -2
    Width = 191
    Height = 34
    Caption = 'Instrucciones:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    LightTextStyle = True
    HighlightColor = clYellow
    ShadowColor = 13107
    TextStyle = tsShadow
  end
  object Panel56: TPanel
    Left = 0
    Top = 3
    Width = 241
    Height = 342
    Align = alCustom
    BevelInner = bvLowered
    BorderWidth = 4
    Color = clWhite
    TabOrder = 0
    object Label94: TLabel
      Left = 16
      Top = 8
      Width = 39
      Height = 14
      Caption = 'Sector:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbosectores: TRzComboBox
      Left = 16
      Top = 24
      Width = 137
      Height = 21
      Ctl3D = False
      FrameController = DMAccesos.frmctr
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      OnClick = cbosectoresClick
    end
    object DBGUbicadas: TcxGrid
      Left = 8
      Top = 48
      Width = 225
      Height = 286
      Hint = 'Doble Click para pasar a No Ubicadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      object DBGVista1: TcxGridDBTableView
        OnDblClick = DBGVista1DblClick
        DataController.DataSource = dsubicadas
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Enabled = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Enabled = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Enabled = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Enabled = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Enabled = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.SaveBookmark.Enabled = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Enabled = False
        NavigatorButtons.GotoBookmark.Visible = False
        OptionsView.Navigator = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxColonia: TcxGridDBColumn
          Caption = 'Colonia'
          Options.Editing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 312
          DataBinding.FieldName = 'nombre'
        end
      end
      object DBGLevel1: TcxGridLevel
        Caption = 'Pruebas'
        GridView = DBGVista1
      end
    end
    object btnsalir: TRzBitBtn
      Left = 159
      Top = 21
      Caption = '&Salir'
      HotTrack = True
      TabOrder = 2
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
  end
  object DBGNoUbicadas: TcxGrid
    Left = 240
    Top = 48
    Width = 249
    Height = 296
    Hint = 'Doble Click para Asignarle el Sector Seleccionado'
    TabOrder = 1
    LookAndFeel.NativeStyle = True
    RootLevelOptions.DetailFrameColor = clGradientActiveCaption
    object DBGNoUbiadasVista1: TcxGridDBTableView
      OnDblClick = DBGNoUbiadasVista1DblClick
      DataController.DataSource = DSNoUbicadas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Enabled = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Enabled = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Enabled = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Enabled = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.SaveBookmark.Enabled = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Enabled = False
      NavigatorButtons.GotoBookmark.Visible = False
      OptionsView.Navigator = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxColsNoUbicadas: TcxGridDBColumn
        Caption = 'Colonias No Ubicadas'
        Options.Editing = False
        Options.Grouping = False
        Options.Moving = False
        Width = 312
        DataBinding.FieldName = 'nombre'
      end
    end
    object NoUbicadasLevel1: TcxGridLevel
      GridView = DBGNoUbiadasVista1
    end
  end
  object RzRichEdit1: TRzRichEdit
    Left = 490
    Top = 40
    Width = 327
    Height = 305
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'Seleccione un Sector de la lista al hacer esto se mostraran en '
      
        'la rejilla inferior las colonias que han sido ubicadas en ese se' +
        'ctor.'
      ''
      'Si desea eliminar una colonia de un sector basta con darle doble'
      'click sobre la fila (renglon) que esta mostrando esa colonia que'
      
        'desea eliminar y pasa a la lista de colonias no ubicadas, pudien' +
        'do'
      'asi ubicar esta colonia en otro sector o en el mismo de asi '
      'desearlo.'
      ''
      'Si desea agregar una colonia a un sector debe de seleccionar'
      'primero el sector al que desea agregar la colonia, despues'
      'ubicar la colonia en la rejilla de Colonias no ubicadas y dar'
      'doble click sobre esta para asignarla al sector.'
      ''
      'Nota: Es muy importante que sean bien asignadas las colonias'
      
        '          a los sectores para evitar confuciones e incongruencia' +
        ' '
      '          de datos.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    FocusColor = 16776176
    FrameHotTrack = True
    FrameVisible = True
  end
  object btnimprimir: TRzBitBtn
    Left = 403
    Top = 15
    Width = 89
    Height = 32
    Hint = 'Imprimir datos generales de la oportunidad'
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 3
    OnClick = btnimprimirClick
    ImageIndex = 20
    Images = DMAccesos.ilopciones
  end
  object rgclientes: TRzRadioGroup
    Left = 240
    Top = 0
    Width = 162
    Height = 46
    Caption = 'Tipos de Clientes'
    Color = clWhite
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Inactivos'
      'Activos')
    ParentFont = False
    TabOrder = 4
  end
  object sqlNoUbicadas: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select nombre,idcol from colonias where ubicada=0')
    AfterOpen = sqlNoUbicadasAfterOpen
    AfterRefresh = sqlNoUbicadasAfterOpen
    Options.FullRefresh = True
    FetchAll = True
    Left = 248
    Top = 160
  end
  object DSNoUbicadas: TDataSource
    DataSet = sqlNoUbicadas
    Left = 328
    Top = 160
  end
  object sqlUbicadas: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select nombre from colonias')
    AfterOpen = sqlUbicadasAfterOpen
    Options.FullRefresh = True
    FetchAll = True
    Left = 24
    Top = 192
  end
  object dsubicadas: TDataSource
    DataSet = sqlUbicadas
    Left = 80
    Top = 176
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select telefono,tipo_tel from telefonos where idtel=:tel')
    Options.FullRefresh = True
    FetchAll = True
    Left = 48
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tel'
      end>
  end
end
