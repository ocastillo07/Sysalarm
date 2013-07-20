object frmBuscarServ: TfrmBuscarServ
  Left = 136
  Top = 195
  Width = 1028
  Height = 502
  Caption = 'Buscar Servicio'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object splitter1: TRzSplitter
    Left = 0
    Top = 0
    Width = 1001
    Height = 433
    Orientation = orVertical
    Position = 100
    Percent = 23
    UpperLeft.BorderInner = fsBump
    UpperLeft.BorderOuter = fsFlat
    UpperLeft.Color = clWhite
    LowerRight.BorderInner = fsFlat
    LowerRight.Color = clWhite
    HotSpotVisible = True
    SplitterStyle = ssBump
    SplitterWidth = 10
    BorderOuter = fsFlat
    Color = 16776176
    FlatColor = clSilver
    TabOrder = 0
    BarSize = (
      1
      101
      1000
      111)
    UpperLeftControls = (
      cbotipo
      rgestatus
      edbuscar)
    LowerRightControls = (
      cxGrid1)
    object cbotipo: TRzComboBox
      Left = 16
      Top = 8
      Width = 193
      Height = 21
      Ctl3D = False
      FlatButtons = True
      FocusColor = 16776176
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
      Text = '- Buscar Por: No. Servicio -'
      OnChange = cbotipoChange
      OnNotInList = cbotipoNotInList
      Items.Strings = (
        '- Buscar Por: No. Servicio -'
        '- Buscar Por: No.Cuenta -')
      ItemIndex = 0
    end
    object rgestatus: TRzRadioGroup
      Left = 368
      Top = 8
      Width = 369
      Height = 81
      Caption = 'Estatus'
      Color = clWhite
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemFont.Charset = DEFAULT_CHARSET
      ItemFont.Color = clWindowText
      ItemFont.Height = -11
      ItemFont.Name = 'MS Sans Serif'
      ItemFont.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = rgestatusClick
    end
    object edbuscar: TRzButtonEdit
      Left = 224
      Top = 8
      Width = 113
      Height = 22
      Hint = 'Buscar '
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
      OnChange = edbuscarChange
      OnKeyPress = edbuscarKeyPress
      ButtonKind = bkFind
      ButtonShortCut = 119
      FlatButtons = True
      OnButtonClick = edbuscarButtonClick
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 997
      Height = 319
      Align = alClient
      BorderWidth = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      object DBGVista2: TcxGridDBTableView
        OnDblClick = DBGVista2DblClick
        DataController.DataSource = DSrejilla
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'sid'
            Column = columna1
          end>
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
        OptionsBehavior.IncSearch = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.Navigator = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        object columna1: TcxGridDBColumn
          Caption = '# Serv'
          Width = 55
          DataBinding.FieldName = 'sid'
        end
        object cxCta: TcxGridDBColumn
          Caption = 'Cta'
          Width = 40
          DataBinding.FieldName = 'clie'
        end
        object cxCliente: TcxGridDBColumn
          Caption = 'Cliente'
          Width = 195
          DataBinding.FieldName = 'nombre'
        end
        object columna2: TcxGridDBColumn
          Caption = 'FechaCreacion'
          Width = 97
          DataBinding.FieldName = 'fecha_creacion'
        end
        object columna3: TcxGridDBColumn
          Caption = 'Reporto'
          Width = 70
          DataBinding.FieldName = 'reportby'
        end
        object columna4: TcxGridDBColumn
          Caption = 'Estatus'
          Width = 85
          DataBinding.FieldName = 'estatus'
        end
        object columan5: TcxGridDBColumn
          Caption = 'Problema'
          Width = 170
          DataBinding.FieldName = 'problema'
        end
        object columna6: TcxGridDBColumn
          Caption = 'TrabRealiz'
          Width = 144
          DataBinding.FieldName = 'trab_realizado'
        end
        object columna7: TcxGridDBColumn
          Caption = 'Comentario'
          Width = 125
          DataBinding.FieldName = 'comentario'
        end
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'Pruebas'
        GridView = DBGVista2
      end
    end
  end
  object btncancelar: TRzBitBtn
    Left = 875
    Top = 436
    Width = 132
    Height = 24
    Hint = 'Cerrar esta Pantalla'
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
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
  object btncontinuar: TRzBitBtn
    Left = 739
    Top = 437
    Width = 132
    Height = 23
    Hint = 'Cerrar pantalla y continuar'
    Caption = 'Continuar'
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
    OnClick = btncontinuarClick
    NumGlyphs = 2
  end
  object sqlrejilla: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select s.sid,s.idcliente as clie,s.fecha_creacion,s.reportby,es.' +
        'nombre as estatus,s.problema,s.trab_realizado,s.comentario,if(c.' +
        'rsocial is null or c.rsocial = '#39#39',concat(ifnull(c.nombre,'#39#39'),'#39' '#39 +
        ',ifnull(c.amaterno,'#39#39'),'#39#39',ifnull(c.apaterno,'#39#39')),c.rsocial) as n' +
        'ombre '
      
        ' from servicios as s inner join clientes as c on s.idcliente = c' +
        '.idcliente '
      'left join EstatusServicios as es ON (es.orden=s.status)  '
      'left join TipoServicios as ts ON (ts.idserv=es.idserv)'
      
        ' where sid=115092 and ts.nombre='#39'ESTATUS SERVICIO'#39' order by s.si' +
        'd desc')
    FetchAll = True
    Left = 184
    Top = 248
  end
  object DSrejilla: TDataSource
    DataSet = sqlrejilla
    Left = 264
    Top = 248
  end
end
