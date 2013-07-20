object frmSolicitudesWeb: TfrmSolicitudesWeb
  Left = 208
  Top = 117
  Width = 920
  Height = 480
  Caption = 'frmSolicitudesWeb'
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
  object Splitter: TRzSplitter
    Left = 0
    Top = 0
    Width = 912
    Height = 405
    Position = 905
    Percent = 100
    UsePercent = True
    HotSpotVisible = True
    HotSpotColor = clWhite
    HotSpotFrameColor = clWhite
    SplitterWidth = 7
    Align = alClient
    BorderColor = clWhite
    BorderShadow = clWhite
    Color = clWhite
    FlatColor = clWhite
    GradientColorStop = clWhite
    TabOrder = 0
    Transparent = True
    BarSize = (
      905
      0
      912
      405)
    UpperLeftControls = (
      GWeb
      RzPanel1)
    LowerRightControls = (
      RzLabel1
      RzLabel2
      RzLabel3
      RzLabel4
      RzLabel5
      RzLabel6
      RzLabel7
      RzLabel8
      RzDBEdit1
      RzDBEdit2
      RzDBEdit3
      RzDBEdit4
      RzDBEdit5
      RzDBEdit6
      RzDBMemo1
      RzDBDateTimeEdit1
      navegador)
    object GWeb: TcxGrid
      Left = 0
      Top = 49
      Width = 905
      Height = 356
      Align = alClient
      TabOrder = 0
      object VWeb: TcxGridDBTableView
        OnDblClick = VWebDblClick
        DataController.DataSource = dsweb
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        object colid: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'idsolicitudweb'
        end
        object colidcliente: TcxGridDBColumn
          DataBinding.FieldName = 'idcliente'
        end
        object colCliente: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'cliente'
        end
        object colAsunto: TcxGridDBColumn
          Caption = 'Asunto'
          DataBinding.FieldName = 'asunto'
        end
        object colDescripcion: TcxGridDBColumn
          Caption = 'Descripcion'
          DataBinding.FieldName = 'descripcion'
        end
        object colarea: TcxGridDBColumn
          Caption = 'Area'
          DataBinding.FieldName = 'area'
        end
        object colfecha: TcxGridDBColumn
          DataBinding.FieldName = 'fechacreacion'
        end
      end
      object LWeb: TcxGridLevel
        GridView = VWeb
      end
    end
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 905
      Height = 49
      Align = alTop
      BorderOuter = fsPopup
      Color = clWhite
      TabOrder = 1
    end
    object RzLabel1: TRzLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Clave:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Cuenta:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel3: TRzLabel
      Left = 168
      Top = 48
      Width = 48
      Height = 13
      Caption = 'Nombre:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel4: TRzLabel
      Left = 16
      Top = 80
      Width = 78
      Height = 13
      Caption = 'Area Destino:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel5: TRzLabel
      Left = 368
      Top = 80
      Width = 98
      Height = 13
      Caption = 'Gerente de Area:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel6: TRzLabel
      Left = 16
      Top = 112
      Width = 44
      Height = 13
      Caption = 'Asunto:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel7: TRzLabel
      Left = 16
      Top = 136
      Width = 72
      Height = 13
      Caption = 'Descripcion:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzLabel8: TRzLabel
      Left = 376
      Top = 112
      Width = 94
      Height = 13
      Caption = 'Fecha Creacion:'
      Transparent = True
      BlinkIntervalOff = 5000
      BlinkIntervalOn = 20
    end
    object RzDBEdit1: TRzDBEdit
      Left = 64
      Top = 8
      Width = 121
      Height = 21
      DataSource = dsweb
      DataField = 'idsolicitudweb'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 72
      Top = 40
      Width = 73
      Height = 21
      DataSource = dsweb
      DataField = 'idcliente'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 1
    end
    object RzDBEdit3: TRzDBEdit
      Left = 224
      Top = 40
      Width = 417
      Height = 21
      DataSource = dsweb
      DataField = 'cliente'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 2
    end
    object RzDBEdit4: TRzDBEdit
      Left = 104
      Top = 72
      Width = 249
      Height = 21
      DataSource = dsweb
      DataField = 'area'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 3
    end
    object RzDBEdit5: TRzDBEdit
      Left = 472
      Top = 72
      Width = 305
      Height = 21
      DataSource = dsweb
      DataField = 'nombre'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 4
    end
    object RzDBEdit6: TRzDBEdit
      Left = 80
      Top = 104
      Width = 273
      Height = 21
      DataSource = dsweb
      DataField = 'asunto'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 5
    end
    object RzDBMemo1: TRzDBMemo
      Left = 16
      Top = 160
      Width = 849
      Height = 225
      Color = clWhite
      DataField = 'descripcion'
      DataSource = dsweb
      TabOrder = 6
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameVisible = True
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Left = 480
      Top = 104
      Width = 121
      Height = 21
      DataSource = dsweb
      DataField = 'fechacreacion'
      Color = clWhite
      DisabledColor = clWhite
      FrameHotTrack = True
      FrameSides = [sdBottom]
      FrameVisible = True
      TabOrder = 7
      EditType = etDate
      FlatButtons = True
    end
    object navegador: TRzDBNavigator
      Left = 440
      Top = 8
      Width = 336
      Height = 25
      DataSource = dsweb
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 8
      Color = clWhite
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 405
    Width = 912
    Height = 41
    Align = alBottom
    Color = clWhite
    TabOrder = 1
    object RzPanel3: TRzPanel
      Left = 725
      Top = 2
      Width = 185
      Height = 37
      Align = alRight
      BorderOuter = fsNone
      Color = clWhite
      TabOrder = 0
      object btnregresar: TRzBitBtn
        Left = 8
        Top = 8
        Width = 33
        HotTrack = True
        TabOrder = 0
        OnClick = btnregresarClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000630D0000630D00000001000000000000000000003300
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
          E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8
          E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8
          E809101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8
          09101010090909E8E8E8E8E8E8E8E8E881ACACAC818181E8E8E8E8E8E8E8E809
          10101010101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E80910
          10101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8091010
          10101010101009E8E8E8E8E8E881ACACACACACACACAC81E8E8E8E8E8E8E80910
          10101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8E8E809
          10101010101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8E8
          09101010090909E8E8E8E8E8E8E8E8E881ACACAC818181E8E8E8E8E8E8E8E8E8
          E809101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8
          E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8
          E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btncerrar: TRzBitBtn
        Left = 46
        Top = 8
        Width = 123
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
    end
  end
  object sqlweb: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT'
      's.idsolicitudweb,'
      's.idcliente,'
      'c.nombre as cliente, '
      's.asunto,'
      's.descripcion,'
      'a.nombre as area,'
      't.nombre,'
      's.fechacreacion'
      'FROM'
      'SolicitudesWeb AS s'
      'Left join clientes c on c.idcliente=s.idcliente'
      'LEFT JOIN areas a on a.idarea=s.idarea'
      
        'Left join (Select u.nombre, u.idarea from usuarios u left join p' +
        'uestos p on p.idpuesto =u.idpuesto where p.nombre = "Gerente") a' +
        's t on t.idarea=s.idarea'
      '')
    FetchAll = True
    Left = 216
    Top = 16
  end
  object dsweb: TDataSource
    DataSet = sqlweb
    Left = 248
    Top = 16
  end
end
